local function debug(str) -- Debug function to display things when verbose mode is on
    if devMode == 1 then
        oldTextColor = term.getTextColor()
        term.setTextColor(colors.green)
        print("DEBUG: " .. tostring(str))
        term.setTextColor(oldTextColor)
    end
end

repo = "https://raw.githubusercontent.com/knijn/musicify-songs/main/stereoindex.json"

local indexURL = repo .. "?cb=" .. os.epoch("utc")
local args = {...}
local musicify = {}

local devMode = 0
local i = 1
-- Parse -dev argument switch, provided by Luca_S

local taperight = peripheral.wrap("right")
local tapeleft = peripheral.wrap("left")


if not taperight or not tapeleft then -- Check if there is a Tape Drive
    error("Tapedrive not found, refer to the wiki on how to set up Musicify",0)
end

local handle = http.get(indexURL)
local indexJSON = handle.readAll()
handle.close()
local index = textutils.unserialiseJSON(indexJSON)

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


local function wipe(device)
    local k = device.getSize()
    device.stop()
    device.seek(-k)
    device.stop()
    device.seek(-90000)
    local s = string.rep("\xAA", 8192)
    for i = 1, k + 8191, 8192 do
        device.write(s)
    end
    device.seek(-k)
    device.seek(-90000)
end

local function play(songID)
    print("Playing " .. getSongID(songID.name) .. " | " .. songID.author .. " - " .. songID.name)
    wipe(taperight)
    wipe(tapeleft)
    local hleft = http.get(songID.stereo[1].file, nil, true) -- write in binary mode
    tapeleft.write(hleft.readAll()) -- that's it
    hleft.close()
    local hright = http.get(songID.stereo[2].file, nil, true) -- write in binary mode
    taperight.write(hright.readAll()) -- that's it
    hright.close()

    tapeleft.seek(-tapeleft.getSize())
    taperight.seek(-taperight.getSize()) -- back to start again

    taperight.setSpeed(songID.speed)
    tapeleft.setSpeed(songID.speed)
    while taperight.getState() ~= "STOPPED" do
      sleep(1)
    end
    taperight.play()
    tapeleft.play()
end

musicify.help = function (arguments)
    print([[
Usage: <action> [arguments]
Actions:
musicify
    help       -- Displays this message
    list       -- Displays a list of song you can play
    play <id>  -- Plays the specified song by it's ID
    stop       -- Stops playback
    volume [0-100] -- Changes the vulume
]])
end

musicify.stop = function (arguments)
    print("Stopping.")
    tapeleft.stop()
    taperight.stop()
end


musicify.list = function (arguments)
    if not arguments then
      arguments[1] = uhgaeoygu
    end
    print("Format: `ID | Author - Name`")
    for i in pairs(index.songs) do -- Loop through all songs
        print(i .. " | " .. index.songs[i].author .. " - " .. index.songs[i].name)
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
    local songList = {}
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


command = table.remove(args, 1)
musicify.index = index

if musicify[command] then
    musicify[command](args)
else
    print("Please provide a valid command. For usage, use `musicify help`.")
    debug("Encountered a non-valid command")
end
return musicify
