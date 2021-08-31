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

-- VARIABLES --

local generalURL = "https://raw.githubusercontent.com/knijn/musicify-songs/main/general.json?cb=" .. os.epoch("utc")
local indexURL = config.repo .. "?cb=" .. os.epoch("utc")
local applicationName = "Musicify"
local version = 0.8
local args = {...}
local musicify = {}
local tape = peripheral.find("tape_drive")
local devMode = 0
local i = 1

local backGroundColor = colors.black
 
local headerTextColor = colors.green
local headerOffset = 0
 
local tableTextColor = colors.yellow
local musicTextColor = colors.white
 
local selectedColor = colors.blue
local playingColor = colors.green
 
local footerBackGroundColor = colors.white
local footerTextColor = colors.black
 
local parentRowPosition = 2
 
local trackRowPosition = parentRowPosition + 1
local songRowPosition = parentRowPosition + 8
local authorRowPosition = parentRowPosition + 25
local timeRowPosition = parentRowPosition + 40
 
local screenWidth, screenHeight = term.getSize()
local halfScreen = screenWidth / 2

local scroll = 0

local selection = 0
local selectionNameScroll = 0
local maxSelectionNameScroll = 0

local selectionAuthorScroll = 0
local maxSelectionAuthorScroll = 0

local currentSong = 0
local playingNameScroll = 0
local maxPlayingNameScroll = 0

local playingAuthorScroll = 0
local maxPlayingAuthorScroll = 0

-- BUSINESS --

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
local index = textutils.unserialiseJSON(handle.readAll())
handle.close()

local handle2 = http.get(generalURL)
local general = textutils.unserialiseJSON(handle2.readAll())
handle2.close()
local premium = nil


if version > index.latestVersion then -- Check if running version is a development version
    devVer = true
else
    devVer = false
end

if not index then
    error("The index is malformed. Please make an issue on the github if it already doesn't exist",0)
    return
end

-- Check for premium
for i,o in pairs(general.premium) do
  debug(general.premium[i].id)
  debug(os.computerID())
  if general.premium[i].id == os.computerID() then
    debug("Premium Detected")
    premium = true
  else
    debug("Premium is not enabled")
    premium = false
  end
end

local function playAd()
  if premium then
    return
  end

  local ranNum = math.random(1, #general.ads)
  if general.ads[ranNum].type == "text" then
    print("AD: " .. general.ads[ranNum].content)
  elseif general.ads[ranNum].type == "audio" then
    wipe()
    tape.stop()
    tape.seek(-tape.getSize()) -- go back to the start

    local h = http.get(general.ads[ranNum].content, nil, true) -- write in binary mode
    tape.write(h.readAll()) -- that's it
    h.close()

    tape.seek(-tape.getSize()) -- back to start again
    tape.setSpeed(general.ads[ranNum].speed)
    while tape.getState() ~= "STOPPED" do
      sleep(1)
    end
    tape.play()
  end
end

local function checkAd()
  local value = math.random(1,8)
  if value == 1 then playAd() end
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
  help      -- Displays this message
  list      -- Displays a list of song you can play
  loop <id> -- Loop on a song
  play <id> -- Plays the specified song by it's ID
  playlist <file> -- Plays a playlist file
  shuffle [from] [to] -- Starts shuffle mode
  stop       -- Stops playback
  volume <0-100> -- Changes the vulume
  update     -- Updates musicify
  info -- Shows information about Musicify
]])
end

musicify.ad = function (arguments)
  playAd()
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
      arguments[1] = uhgaeoyg356ghu
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
        error("Please specify arguments in a form like `musicify shuffle 1 5`",0)
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
    checkAd()
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
    print("Premium: " .. tostring(premium))
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

-- VISUAL LAYER --
 
local function secondsToClock(seconds)
    if seconds <= 0 then
        return "00:00:00";
    else
        mins = string.format("%02.f", math.floor(seconds/60));
        secs = string.format("%02.f", math.floor(seconds - mins *60));
        return mins..":"..secs
    end
end
 
local function drawHeader()
    term.setBackgroundColor(backGroundColor)
    term.setTextColor(headerTextColor)
    term.clear()
 
    term.setCursorPos(halfScreen - (string.len(applicationName) / 2) + headerOffset, 1)
 
    print(applicationName)
end
 
local function drawMusicList()
    term.setBackgroundColor(backGroundColor)
    term.setTextColor(tableTextColor)
    
    term.setCursorPos(trackRowPosition, 2)
    term.write("Track")

    term.setCursorPos(timeRowPosition, 2)
    term.write("Duration")

    term.setCursorPos(songRowPosition, 2)
    term.write("Name")
    
    term.setCursorPos(authorRowPosition, 2)
    term.write("Author")
 
    term.setTextColor(musicTextColor)
 
    for i in pairs(index.songs) do
        if i < screenHeight -2 then
            local track = i + scroll
 
            term.setCursorPos(1, i +2)
            
            -- Change the color of the selectoins
            if selection - scroll == i then
                term.setBackgroundColor(selectedColor)
            elseif track == currentSong then
                term.setBackgroundColor(playingColor)
            else
                term.setBackgroundColor(backGroundColor)
            end
            
            term.setCursorPos(trackRowPosition, i + 2)
            term.write(track)
 
            term.setCursorPos(timeRowPosition, i + 2)
            term.write(secondsToClock(index.songs[track].time))
 
            term.setCursorPos(songRowPosition, i + 2)
            if string.len(index.songs[track].name) < 15 then
                term.write(index.songs[track].name)
            elseif selection - scroll == i then
                term.write(string.sub(index.songs[track].name, selectionNameScroll +1, selectionNameScroll + 12) .. '...')
            elseif track == currentSong then 
                term.write(string.sub(index.songs[track].name, playingNameScroll +1, playingNameScroll + 12) .. '...')
            else
                term.write(string.sub(index.songs[track].name, 0, 12) .. '...')
            end
 
            term.setCursorPos(authorRowPosition, i + 2)
            if string.len(index.songs[track].author) < 12 then
                term.write(index.songs[track].author)
            elseif selection - scroll == i then
                term.write(string.sub(index.songs[track].author, selectionAuthorScroll +1, selectionAuthorScroll + 9) .. '...')
            elseif track == currentSong then 
                term.write(string.sub(index.songs[track].author, playingAuthorScroll +1, playingAuthorScroll + 9) .. '...')
            else
                term.write(string.sub(index.songs[track].author, 0, 9) .. '...')
            end
        else
            break
        end
    end
end
 
local function drawFooter()
    term.setBackgroundColor(footerBackGroundColor)
    term.setTextColor(footerTextColor)
 
    term.setCursorPos(1, screenHeight)
 
    if currentSong == 0 then
        term.write("Play")
    else
         term.write("Stop")
    end
 
    term.setCursorPos(halfScreen - 4, screenHeight)
 
    term.write("Shuffle")
end

-- GUI Logic
 
local function checkInput()
    while true do
        local event, key, x, y = os.pullEvent()
    
        if event == "key" then
            if key == 208 and selection < #index.songs then
                if selection - scroll >= screenHeight -3 then
                    scroll = scroll +1
                end
            
                selection = selection +1
                maxSelectionNameScroll = string.len(index.songs[selection].name) -13 
                maxSelectionAuthorScroll = string.len(index.songs[selection].author) -10
                selectionNameScroll = 0
                selectionAuthorScroll = 0
            
            elseif key == 200 and selection > 1 then
                if selection - scroll <= 1 and scroll > 0 then
                    scroll = scroll -1
                end
        
                selection = selection -1
                maxSelectionNameScroll = string.len(index.songs[selection].name) -13
                maxSelectionAuthorScroll = string.len(index.songs[selection].author) -10
                selectionNameScroll = 0
                selectionAuthorScroll = 0
            
            elseif key == 28 then
                if currentSong == selection then
                    tape.stop()
                    currentSong = -1
                else
                    play(index.songs[selection])
                    currentSong = selection

                    maxPlayingNameScroll = string.len(index.songs[currentSong].name) -13
                    maxPlayingAuthorScroll =  string.len(index.songs[currentSong].author) -10
                    playingNameScroll = 0
                    playingAuthorScroll = 0
                end
            end
        elseif event == "mouse_scroll" then
            if selection - scroll <= 1 and scroll > 0 then
                scroll = scroll + key
            end

            if selection - scroll >= screenHeight -3 then
                scroll = scroll + key
            end
    
            selection = selection + key
            maxSelectionNameScroll = string.len(index.songs[selection].name) -13
            maxSelectionAuthorScroll = string.len(index.songs[selection].author) -10
            selectionNameScroll = 0
            selectionAuthorScroll = 0
        elseif event == "mouse_click" then
            selection = scroll + y -2
        end
    end
end

local function tick()
    while true do
        selectionNameScroll = selectionNameScroll +1
        selectionAuthorScroll = selectionAuthorScroll +1

        playingNameScroll = playingNameScroll +1
        playingAuthorScroll = playingAuthorScroll +1
     
        if selectionNameScroll > maxSelectionNameScroll then
            selectionNameScroll = 0
        end

        if selectionAuthorScroll > maxSelectionAuthorScroll then 
            selectionAuthorScroll = 0
        end

        if playingNameScroll > maxPlayingNameScroll then
            playingNameScroll = 0
        end

        if playingAuthorScroll > maxPlayingAuthorScroll then 
            playingAuthorScroll = 0
        end

        sleep(0.4)
    end
end

local function drawGUI()
    while true do
        drawHeader()
        drawMusicList()
        drawFooter()
        sleep()
    end
end

command = table.remove(args, 1)
musicify.index = index

debug("Debug mode is enabled")
local failedCommand = 0


if musicify[command] then
    musicify[command](args)
else
    parallel.waitForAny(drawGUI,checkInput,tick)
end

return musicify