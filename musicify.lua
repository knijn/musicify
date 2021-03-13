local indexURL = "https://raw.githubusercontent.com/RubenHetKonijn/computronics-songs/main/index.json?cb=" .. os.epoch("utc")
local version = 0.41
local args = {...}
local musicify = {}
local tape = peripheral.find("tape_drive")
local devMode = 0
local i = 1
while i <= #args do
    if args[i] == "-dev" then
        devMode = 1
        table.remove(args, i)
    else
        i = i + 1
    end
end

local function debug(str) -- Debug function to display things when verbose mode is on (add -dev switch)
    if devMode == 1 then
        oldTextColor = term.getTextColor()
        term.setTextColor(colors.green)
        print("DEBUG: " .. tostring(str))
        term.setTextColor(oldTextColor)
    end
end

if not tape then -- Check if there is a Tape Drive
    print("ERROR: Tapedrive not found, Please place a Tape Drive next to the Computer or connect it with Networking Cables")
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
    print("ERROR: The index is malformed. Please make an issue on the github if it already doesn't exist")
    return
end

local function getSongID(songname)
for i in pairs(index.songs) do
        if index.songs[i].name == songname then
          return i
        end
    end
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
    local s = shell.getRunningProgram()
    handle = http.get("https://raw.githubusercontent.com/RubenHetKonijn/musicify/main/musicify.lua")
    if not handle then
        print("Could not download new version, Please update manually.")
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
    print("Client outdated, Updating Musicify.") -- Update check
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
    Update     -- Updates musicify
]])
end

musicify.update = function (arguments)
    print("Updating Musicify, please hold on.")
    update() -- Calls the update function to re-download the source code from the stable branch
end

musicify.stop = function (arguments)
    print("Stopping.")
    tape.stop()
end

musicify.list = function (arguments)
    print("Format: `ID | Author - Name")
    for i in pairs(index.songs) do -- Loop through all songs
        print(i .. " | " .. index.songs[i].author .. " - " .. index.songs[i].name)
    end
end

musicify.shuffle = function (arguments)
    local from = arguments[1] or 1
    local to = arguments[2] or #index.songs
    if tostring(arguments[1]) and not tonumber(arguments[1]) and arguments[1] then -- Check if selection is valid
        print("Please specify arguments like `musicify shuffle 1 5`")
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
        print("Please specify a valid volume level between 0-100")
        return
    end
    tape.setVolume(arguments[1] / 100)
end

musicify.play = function (arguments)
    if not arguments then
        print("Resuming playback...")
        return
    end
    if not tonumber(arguments[1]) or not index.songs[tonumber(arguments[1])] then
        print("Please provide a valid track ID. Use `list` to see all valid track numbers.")
        return
    end
    if not tape.isReady() then
        print("ERROR: You need to have a tape in the tape drive")
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
        print("ERROR: Please specify a song ID")
        return
    end
    while true do
    play(index.songs[tonumber(arguments[1])])
    sleep(index.songs[tonumber(arguments[1])].time)
    end
end

musicify.playlist = function (arguments)
    if not arguments[1] or not tostring(arguments[1]) or not fs.exists(arguments[1]) then
        print("ERROR: Please specify a correct file")
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
