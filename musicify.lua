local function debug(str) -- Debug function to display things when verbose mode is on
    if devMode == 1 then
        oldTextColor = term.getTextColor()
        term.setTextColor(colors.green)
        print("DEBUG: " .. tostring(str))
        term.setTextColor(oldTextColor)
    end
end

if fs.open("./musicify_config.json","r") then
  debug("Config found")
  config = textutils.unserialiseJSON(fs.open("./musicify_config.json", "r").readAll())
end

if not config.devMode then
  devMode = 0
elseif config.devMode == true then
  devMode = 1
end


if not config.repo then
  config.repo = "https://raw.githubusercontent.com/RubenHetKonijn/computronics-songs/main/index.json"
end

if not config.autoUpdates then
  config.autoUpdates = true
end

local indexURL = config.repo .. "?cb=" .. os.epoch("utc")
local version = 0.5
local args = {...}
local musicify = {}
local tape = peripheral.find("tape_drive")
local devMode = 0
local i = 1
-- Parse -dev argument switch, provided by Luca_S
while i <= #args do
    if args[i] == "-dev" then
        devMode = 1
        table.remove(args, i)
    else
        i = i + 1
    end
end



if not tape then -- Check if there is a Tape Drive
    error("Tapedrive not found, refer to the wiki on how to set up Musicify",0)
end

local handle = http.get(indexURL)
local indexJSON = handle.readAll()
handle.close()
local index = textutils.unserialiseJSON(indexJSON)

if version > index.latestVersion then -- Check if running version is a development version
    devVer = true
else
    devVer = false
end

if not index then
    error("The index is malformed. Please make an issue on the github if it already doesn't exist",0)
    return
end



local function getSongID(songname)
for i in pairs(index.songs) do
        if index.songs[i].name == songname then
          return i
        end
    end
end

local function checkmissing(songID)
  --if getSongID(songID.name) == nil or getSongID(songID.author) == nil or getSongID(songID.type) == nil or getSongID(songID.speed) == nil or getSongID(songID.file) == nil or getSongID(songID.time) == nil then
  --  error("There seems to be an issue in the song we tried to access, please try again later and let the devs know.",0)
  --end
end


local function wipe()
    local k = tape.getSize()
    tape.stop()
    tape.seek(-k)
    tape.stop()
    tape.seek(-90000)
    local s = string.rep("\xAA", 8192)
    for i = 1, k + 8191, 8192 do
        tape.write(s)
    end
    tape.seek(-k)
    tape.seek(-90000)
end

local function play(songID)
    checkmissing(songID)
    print("Playing " .. getSongID(songID.name) .. " | " .. songID.author .. " - " .. songID.name)
    wipe()
    tape.stop()
    tape.seek(-tape.getSize()) -- go back to the start

    local h = http.get(songID.file, nil, true) -- write in binary mode
    tape.write(h.readAll()) -- that's it
    h.close()

    tape.seek(-tape.getSize()) -- back to start again
    tape.setSpeed(songID.speed)
    while tape.getState() ~= "STOPPED" do
      sleep(1)
    end
    tape.play()
end

local function update()
    if not config.autoUpdates then
      error("It seems like you've disabled autoupdates, we're skipping this update", 0)
    end
    local s = shell.getRunningProgram()
    handle = http.get("https://raw.githubusercontent.com/RubenHetKonijn/musicify/main/musicify.lua")
    if not handle then
        error("Could not download new version, Please update manually.",0)
    else
        data = handle.readAll()
        local f = fs.open(s, "w")
        handle.close()
        f.write(data)
        f.close()
        shell.run(s)
        return
    end
end

if version < index.latestVersion then
    error("Client outdated, Updating Musicify.",0) -- Update check
    update()
end

musicify.help = function (arguments)
    print([[
Usage: <action> [arguments]
Actions:
musicify
    help       -- Displays this message
    list       -- Displays a list of song you can play
    play <id>  -- Plays the specified song by it's ID
    shuffle [from] [to] -- Starts shuffle mode in the specified range
    stop       -- Stops playback
    volume [0-100] -- Changes the vulume
    update     -- Updates musicify

]])
end

musicify.update = function (arguments)
    print("Updating Musicify, please hold on.")
    config.autoUpdates = true
    update() -- Calls the update function to re-download the source code from the stable branch
end

musicify.stop = function (arguments)
    print("Stopping.")
    tape.stop()
end

local getArtistList = function()
    local artistList = {}
    for i,o in pairs(index.songs) do
        for i2,o2 in pairs(artistList) do
            if o2 == o then
                debug("Found Duplicate")
                return
            end
        end
        table.insert(artistList,index.songs[i].author)
    end
    return artistList
end

local printArtistSongs = function(artist)
    for i in pairs(index.songs) do
        if index.songs[i].author == artist then
            print(i .. " | " .. index.songs[i].author .. " - " .. index.songs[i].name)
        end
    end
end

musicify.list = function (arguments)
    if not arguments then
      arguments[1] = uhgaeoygu
    end
    print("Format: `ID | Author - Name`")
    local artists = getArtistList()
    for i,o in pairs(artists) do
        if arguments[1] == artists[i] then
            printArtistSongs(artists[i])
            return
        end
    end
    for i in pairs(index.songs) do -- Loop through all songs
        print(i .. " | " .. index.songs[i].author .. " - " .. index.songs[i].name)
    end
end

musicify.shuffle = function (arguments)
    local from = arguments[1] or 1
    local to = arguments[2] or #index.songs
    if tostring(arguments[1]) and not tonumber(arguments[1]) and arguments[1] then -- Check if selection is valid
        erorr("Please specify arguments in a form like `musicify shuffle 1 5`",0)
        return
    end
    while true do
        print("Currently in shuffle mode, press <Q> to exit. Use <Enter> to skip songs")
        local ranNum = math.random(from, to)
        play(index.songs[ranNum])

        local function songLengthWait() -- Wait till the end of the song
            sleep(index.songs[ranNum].time)
        end

        local function keyboardWait() -- Wait for keyboard presses
            while true do
                local event, key = os.pullEvent("key")
                if key == keys.enter then
                    print("Skipping!")
                    break
                elseif key == keys.q then
                    musicify.stop()
                    error("Stopped playing",0)
                end
            end
        end

            parallel.waitForAny(songLengthWait, keyboardWait)          -- Combine the two above functions
    end
end

musicify.volume = function (arguments)
    if not arguments[1] or not tonumber(arguments[1]) or tonumber(arguments[1])>100 or tonumber(arguments[1]) < 1 then
        error("Please specify a valid volume level between 0-100",0)
        return
    end
    tape.setVolume(arguments[1] / 100)
end

musicify.play = function (arguments)
    local artists = getArtistList()
    local songList = {}
    if arguments[1] == "all" then
        for i2,o2 in pairs(index.songs) do
            local songID = "," .. tostring(i2)
            table.insert(songList,songID)
        end
        local handle = fs.open(".musicifytmp","w")
        for i,o in pairs(songList) do
            local song = "," .. songList[i]
            handle.write(song)
        end
        handle.close()
        musicify.playlist({".musicifytmp"})
        return
    end

    if not arguments then
        print("Resuming playback...")
        return
    end
    if not tonumber(arguments[1]) or not index.songs[tonumber(arguments[1])] then
        error("Please provide a valid track ID. Use `list` to see all valid track numbers.",0)
        return
    end
    if not tape.isReady() then
        error("You need to have a tape in the tape drive",0)
        return
    end
    play(index.songs[tonumber(arguments[1])])
    tape.play()
end

musicify.info = function (arguments)

    print("Latest version: " .. index.latestVersion)
    if devMode == 1 then
        print("DevMode: On")
    else
        print("DevMode: Off")
    end
    if devVer == true then
        print("Current version: " .. version .. " (Development Version)")
    else
        print("Current version: " .. version)
    end

end

musicify.loop = function (arguments)
    if tostring(arguments[1]) and not tonumber(arguments[1]) then
        error("Please specify a song ID",0)
        return
    end
    while true do
    play(index.songs[tonumber(arguments[1])])
    sleep(index.songs[tonumber(arguments[1])].time)
    end
end

musicify.playlist = function (arguments)
    if not arguments[1] or not tostring(arguments[1]) or not fs.exists(arguments[1]) then
        error("Please specify a correct file")
    end
    debug("Got file")
    local playlist = fs.open(arguments[1], "r") -- Load playlist file into a variable
    local list = playlist.readAll() -- Also load playlist file into a variable
    playlist.close()
    local toPlay = {}

    for word in string.gmatch(list, '([^,]+)') do -- Seperate different song ID's from file
        debug(word)
        table.insert(toPlay,word)
    end
    for i,songID in pairs(toPlay) do
        debug("i: " .. i)
        debug("SongID " .. songID)
        print("Currently in playlist mode, press <Q> to exit. Use <Enter> to skip songs")
        play(index.songs[tonumber(songID)])

        local function songLengthWait() -- Wait till the end of the song
            sleep(index.songs[tonumber(songID)].time)
        end

        local function keyboardWait() -- Wait for keyboard presses
            while true do
                local event, key = os.pullEvent("key")
                if key == keys.enter then
                    print("Skipping!")
                    break
                elseif key == keys.q then
                    musicify.stop()
                    error("Stopped playing",0)
                end
            end
        end

            parallel.waitForAny(songLengthWait, keyboardWait)          -- Combine the two above functions
    end
end

command = table.remove(args, 1)
musicify.index = index

debug("Debug mode is enabled")
local failedCommand = 0


if musicify[command] then
    musicify[command](args)
else
    print("Please provide a valid command. For usage, use `musicify help`.")
    debug("Encountered a non-valid command")
end
return musicify
