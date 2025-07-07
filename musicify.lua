if periphemu then -- probably on CraftOS-PC
    periphemu.create("back","speaker")
    config.set("standardsMode",true)
end

settings.load()
local repo = settings.get("musicify.repo","https://raw.githubusercontent.com/knijn/musicify-songs/main/index.json")
local autoUpdates = settings.get("musicify.autoUpdates",true)
local dfpwm = require("cc.audio.dfpwm")
local indexURL = repo .. "?cb=" .. os.epoch("utc")
local version = "3.3.0"
local args = {...}
local musicify = {}
local speakers = {peripheral.find("speaker")}
local serverChannel = settings.get("musicify.serverChannel", 2561)
local serverMode = settings.get("musicify.serverMode", false)
local modem = peripheral.find("modem")
local v = require("/lib/semver")
local volume = settings.get("musicify.volume",1)
local softVolume = settings.get("musicify.softVolume",1)
local audioCalls = {}
local buffer

if not speakers then -- Check if there is a speaker
  error("Speaker(s) not found, refer to the wiki on how to set up Musicify",0)
end

local handle , msg = http.get(indexURL)
if not handle then
    error(msg)
end
local indexJSON = handle.readAll()
handle.close()
local index = textutils.unserialiseJSON(indexJSON)

if not index then
    error("The index is malformed. Please make an issue on the github if it already doesn't exist",0)
end

local function getSongID(songname)
for i in pairs(index.songs) do
        if index.songs[i].name == songname then
          return i
        end
    end
end

local function play(songID)
  if type(songID) == "table" then
    if string.find(songID.file,"flac") or string.find(songID.file,"wav") or string.find(songID.file,"mp3") or string.find(songID.file,"aac") or string.find(songID.file,"opus") or string.find(songID.file,"ogg") then
      songID.file = "https://cc.alexdevs.me/dfpwm?url=" .. textutils.urlEncode(songID.file)
    end
  end
  if type(songID) == "string" then
    local newSongID = {}
    newSongID.file = songID
    newSongID.name = songID
    if string.find(songID,"flac") or string.find(songID,"wav") or string.find(songID,"mp3") or string.find(songID,"aac") or string.find(songID,"opus") or string.find(songID,"ogg") then
      newSongID.file = "https://cc.alexdevs.me/dfpwm?url=" .. textutils.urlEncode(songID)
      newSongID.author = "URL (converting)"
    else
      newSongID.author = "URL"
    end
    songID = newSongID

    function getSongID()
      return "from"
    end
  end

    if not gui then
      print("Playing " .. getSongID(songID.name) .. " | " .. songID.author .. " - " .. songID.name)

        print("")
        print("Press CTRL+T to stop the song")
    end
    local h, err = http.get({["url"] = songID.file, ["binary"] = true, ["redirect"] = true}) -- write in binary mode
    if not h then error("Failed to download song: " .. err) end
    local decoder = dfpwm.make_decoder()
    while true do
        local chunk = h.read(16 * 1024)
        if not chunk then break end
        buffer = decoder(chunk)
        for i,_ in pairs(buffer) do
          buffer[i] = buffer[i] * softVolume
          if buffer[i] > 127 then
            buffer[i] = 127
          elseif buffer[i] < -127 then
            buffer[i] = -127
          end
        end
        if modem and serverMode then
          modem.transmit(serverChannel,serverChannel,buffer)
        end

        if songID.speed == 2 then
            error("Whoops!! You're trying to play unsupported audio, please use 48khz audio in your repository")
        end



        parallel.waitForAll(table.unpack(audioCalls))
    end
    h.close()
end


local function update()
    if not autoUpdates then
      error("It seems like you've disabled autoupdates, we're skipping this update", 0)
    end
    shell.run("wget run https://raw.githubusercontent.com/knijn/musicify/main/install.lua")
end

if v(version) < v(index.latestVersion) then
    error("Client outdated, Updating Musicify.",0) -- Update check
    -- this has broken so many times it's actually not even funny anymore
    update()
end

musicify.help = function (arguments)
    print([[
Usage: <action> [arguments]
Actions:
musicify
    help    -- Displays this message
    list    -- Displays a list of songs you can play
    info    -- Displays information about Musicify's version and repo
    play <id>           -- Plays the specified song by it's ID
    playlist <file>     -- Plays a playlist file
    gui                 -- Starts the GUI (WIP)
    shuffle [from] [to] -- Starts shuffle mode in the specified range
    update  -- Updates musicify
    loop <id>           -- Loop on a specific song
    url <url>           -- Play a song from a URL
]])
end

musicify.client = function (arguments)
  if not modem then error("There needs to be a modem attached") end
  while true do

    modem.open(serverChannel)
    print("Listening on " .. serverChannel)
    local event, side, channel, replyChannel, message, distance = os.pullEvent("modem_message")
    if channel == serverChannel and replyChannel == serverChannel then
      buffer = message
      parallel.waitForAll(table.unpack(audioCalls))
    end
  end
end

musicify.url = function (arguments)
  if string.find(arguments[1],"youtube") then
    print("Youtube support isn't garuanteed, proceed with caution")
  end
  play(arguments[1])
end

musicify.youcube = function (arguments)
  print("YouCube has been removed in favor of the new URL system. Please use `musicify url <url>` instead.")
end

musicify.gui = function (arguments)
  local basalt = require("lib/basalt")
  gui = true
  if not basalt then
    error("Basalt wasn't found or was installed incorrectly")
  end
  local main = basalt.createFrame()

  local function goHome()
    list = main:addList()
      :setPosition(2,2)
      :setSize("parent.w - 2","parent.h - 6")
    for i,o in pairs(index.songs) do
      list:addItem(index.songs[i].author .. " - " .. index.songs[i].name)

    end
    local function startSong()
      play(index.songs[list:getItemIndex()])
    end
    local function threadedStartSong()
      local thread = main:addThread()
      thread:start(startSong)
    end
    local playButton = main:addButton()
      :setPosition(2,"parent.h - 3")
      :setSize(6,3)
      :setText("Play")
      :onClick(threadedStartSong)
  end
  goHome()

  basalt.autoUpdate()
end

musicify.update = function (arguments)
    print("Updating Musicify, please hold on.")
    autoUpdates = true -- bypass autoupdate check
    update() -- Calls the update function to re-download the latest release
end

musicify.list = function (arguments)
    if not arguments then
      arguments[1] = nil
    end
    print("Format: `ID | Author - Name`")
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
        print("Currently in shuffle mode")
        local ranNum = math.random(from, to)
        play(index.songs[ranNum])
    end
end

musicify.play = function (arguments)
    local songList = {}
    if arguments[1] == "all" then -- TODO: Make this NOT a mess
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

    if not tonumber(arguments[1]) or not index.songs[tonumber(arguments[1])] then
        error("Please provide a valid track ID. Use `list` to see all valid track numbers.",0)
        return
    end
    play(index.songs[tonumber(arguments[1])])
end


musicify.info = function (arguments)
    print("Latest version: " .. index.latestVersion)
    local devVer = v(version) > v(index.latestVersion)
    if devVer == true then
        print("Current version: " .. version .. " (Development Version)")
    else
        print("Current version: " .. version)
    end
    print("Repository name: " .. index.indexName)
end

musicify.loop = function (arguments)
    while true do
      if tonumber(arguments[1]) then
        play(index.songs[tonumber(arguments[1])])
      elseif tostring(arguments[1]) then
        play(arguments[1])
      end
    speaker.stopAudio()
    end
end

musicify.playlist = function (arguments)
    if not arguments[1] or not tostring(arguments[1]) or not fs.exists(arguments[1]) then
        error("Please specify a playlist file to play")
    end
    local playlist = fs.open(arguments[1], "r") -- Load playlist file into a variable
    local list = playlist.readAll() -- Also load playlist file into a variable
    playlist.close()
    local toPlay = {}

    for word in string.gmatch(list, '([^,]+)') do -- Seperate different song ID's from file
        table.insert(toPlay,word)
    end
    for i,songID in pairs(toPlay) do
        print("Currently in playlist mode, press <Q> to exit. Use <Enter> to skip songs")



        local function songLengthWait() -- Wait until the end of the song
          if tonumber(songID) then
            play(index.songs[tonumber(songID)])
          elseif tostring(songID) then
            play(songID)
          end
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
    error("Please specify arguments in a form like `musicify random 1 5`",0)
    return
  end
  local ranNum = math.random(from, to)
  play(index.songs[ranNum])
end


command = table.remove(args, 1)
musicify.index = index

for spkr,dev in pairs(speakers) do
    table.insert(audioCalls,function()
    coroutine.resume(coroutine.create(function()dev.playAudio(buffer,volume)end))end)
    table.insert(audioCalls,function()repeat _,which=os.pullEvent("speaker_audio_empty") if which==peripheral.getName(dev) or which=="flush" then break end until(false)end)
  end

if musicify[command] then
    musicify[command](args)
else
    print("Please provide a valid command. For usage, use `musicify help`.")
end
