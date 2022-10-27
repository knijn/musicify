local function debug(str) -- Debug function to display things when verbose mode is on
    if devMode then
        oldTextColor = term.getTextColor()
        term.setTextColor(colors.green)
        print("DEBUG: " .. tostring(str))
        term.setTextColor(oldTextColor)
    end
end

if periphemu then -- probably on CraftOS-PC
    periphemu.create("back","speaker")
    config.set("standardsMode",true)
end

if not config then config = {} end -- Hotfix to make Musicify work when no config is available

settings.load()
local devMode = settings.get("musicify.devMode",false)
local repo = settings.get("musicify.repo","https://raw.githubusercontent.com/knijn/musicify-songs/main/index.json")
local autoUpdates = settings.get("musicify.autoUpdates",true)
local modemBroadcast = settings.get("musicify.broadcast", true)
local dfpwm = require("cc.audio.dfpwm")
local indexURL = repo .. "?cb=" .. os.epoch("utc")
local version = 2.2
local args = {...}
local musicify = {}
local speaker = peripheral.find("speaker")
local i = 1
local serverChannel = 2561
local serverMode = false
local modem = peripheral.find("modem")
local v = require("semver") or require("/libs/semver")
local YouCubeAPI = require("/libs/youcube.lua")

-- Parse -dev argument switch, provided by Luca_S
while i <= #args do
    if args[i] == "-dev" then
        devMode = true
        table.remove(args, i)
    else
        i = i + 1
    end
end
if not speaker then -- Check if there is a speaker
  error("Speaker not found, refer to the wiki on how to set up Musicify",0)
end

local handle , msg = http.get(indexURL)
if not handle then
    error(msg)
end
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
  --if getSongID(songID).name == nil or getSongID(songID).author == nil or getSongID(songID).type == nil or getSongID(songID).speed == nil or getSongID(songID).file == nil or getSongID(songID).time == nil then
  --  error("There seems to be an issue in the song we tried to access, please try again later and make an issue on the github.",0)
  --end
end


local function play(songID)
    checkmissing(songID)
    if modem and modemBroadcast then
      modem.transmit(serverChannel,serverChannel,songID)
    end
    print("Playing " .. getSongID(songID.name) .. " | " .. songID.author .. " - " .. songID.name)
    print("Press CTRL+T to stop the song")
    local h = http.get({["url"] = songID.file, ["binary"] = true, ["redirect"] = true}) -- write in binary mode
    local even = true
    local decoder = dfpwm.make_decoder()
    while true do
        local chunk = h.read(16 * 1024)
        if not chunk then break end
        --print(chunk)
        local buffer = decoder(tostring(chunk))
        if songID.speed == 2 then
            error("Whoops!! You're trying to play unsupported audio, please use 48khz audio in your repository")
        end
        while not speaker.playAudio(buffer) do
            os.pullEvent("speaker_audio_empty")
        end
        if even then
            even = false
        else
            even = true
        end
    end
    h.close()
end

local function update()
    if not autoUpdates then
      error("It seems like you've disabled autoupdates, we're skipping this update", 0)
    end
    local s = shell.getRunningProgram()
    handle = http.get("https://raw.githubusercontent.com/RubenHetKonijn/musicify/main/update.lua")
    if not handle then
        error("Could not download new version, Please update manually.",0)
    else
        data = handle.readAll()
        local f = fs.open(".musicify_updater", "w")
        handle.close()
        f.write(data)
        f.close()
        shell.run(".musicify_updater")
        fs.delete(".musicify_updater")
        return
    end
end

if v(version) ^ v(index.latestVersion) then
    error("Client outdated, Updating Musicify.",0) -- Update check
    -- this has broken so many times it's actually not even funny anymore
    update()
end

local YouCubeAPI = {}

function YouCubeAPI.new(websocket)
    return setmetatable({
        websocket = websocket,
    }, { __index = YouCubeAPI })
end

local servers = {
    "ws://localhost:5000",
    "wss://youcube.onrender.com"
}

function YouCubeAPI:detect_bestest_server()
    for i, server in pairs(servers) do
        local websocket, websocket_error = http.websocket(server)

        if websocket ~= false then
            term.write("Using the YouCube server: ")
            term.setTextColor(colors.blue)
            print(server)
            term.setTextColor(colors.white)
            self.websocket = websocket
            break
        elseif i == #servers then
            error(websocket_error)
        end

    end
end

function YouCubeAPI:get_chunk(chunkindex, id)
    self.websocket.send(textutils.serialiseJSON({
        ["action"] = "get_chunk",
        ["chunkindex"] = chunkindex,
        ["id"] = id
    }))
end

function YouCubeAPI:request_media(url)
    self.websocket.send(textutils.serialiseJSON({
        ["action"] = "request_media",
        ["url"] = url
    }))
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
    update     -- Updates musicify
    loop <id>  -- Loop on a specific song
]])
end

musicify.youcube = function (arguments)
    local youcubeapi = YouCubeAPI.new()
    youcubeapi:detect_bestest_server()

    local dfpwm = require("cc.audio.dfpwm")
    local decoder = dfpwm.make_decoder()
    
    
    local url = arguments[1]
    print("Requesting media ...")
    youcubeapi:request_media(url)

    local data = youcubeapi.websocket.receive()
    data = textutils.unserialiseJSON(data)

    if data.action == "error" then
        error(data.message)
    end

    local id = data.id

    local chunkindex = 0

    youcubeapi:get_chunk(chunkindex, id)
        while true do
            local chunk = youcubeapi.websocket.receive()

            if chunk == "Done playing" then
                print()
                youcubeapi.websocket.close()
                return
            end

            local buffer = decoder(chunk)

            while not speaker.playAudio(buffer) do
                os.pullEvent("speaker_audio_empty")
            end

            chunkindex = chunkindex + 1


            youcubeapi:get_chunk(chunkindex, id)

    end
end

musicify.update = function (arguments)
    print("Updating Musicify, please hold on.")
    autoUpdates = true -- bypass autoupdate check
    update() -- Calls the update function to re-download the source code from the stable branch
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
    local buffer = ""
    local songAmount = #index.songs
    for i in pairs(index.songs) do -- Loop through all songs
        buffer = buffer .. i .. " | " .. index.songs[i].author .. " - " .. index.songs[i].name .. "\n"
    end
    local offset = 0
    local xSize, ySize = term.getSize()
    local function keyboardHandler()
        local event, key, is_held = os.pullEvent("key")
        if key == keys.q then
          error("Closed list")
        elseif key == keys.s then
          if offset < songAmount - ySize then
            offset = offset + 1
          end
        elseif key == keys.w then
          if offset > 0 then
            offset = offset - 1
          end
        end
    end
    local function draw()
        term.clear()
        for i=1,ySize do
          term.setCursorPos(1,i)
          i = i + offset
          term.write(i .. " | " .. index.songs[i].author .. " - " .. index.songs[i].name)
        end
        coroutine.yield()
    end
    while true do
      parallel.waitForAny(keyboardHandler,draw)
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
    play(index.songs[tonumber(arguments[1])])
end

musicify.info = function (arguments)

    print("Latest version: " .. index.latestVersion)
    if devMode then
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

musicify.random = function(args)
  local from = args[1] or 1
  local to = args[2] or #index.songs
  if tostring(args[1]) and not tonumber(args[1]) and args[1] then -- Check if selection is valid
    error("Please specify arguments in a form like `musicify shuffle 1 5`",0)
    return
  end
  local ranNum = math.random(from, to)
  play(index.songs[ranNum])
end

musicify.server = function(args)
  if not peripheral.find("modem") then
    error("You should have a modem installed")
  end
  serverMode = true
  modem = peripheral.find("modem")
  modem.open(serverChannel)
  local function listenLoop()
    local event, side, ch, rch, msg, dist = os.pullEvent("modem_message")
    if not type(msg) == "table" then
      return
    end
    if msg.command and msg.args then
      if msg.command == "shuffle" then -- make sure the server isn't unresponsive
        return
      end
      if musicify[msg.command] then
        print(msg.command)
        musicify[msg.command](msg.args)
      end
    end
   end
  while true do
    parallel.waitForAny(listenLoop)
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
