local indexURL = "https://raw.githubusercontent.com/RubenHetKonijn/computronics-songs/main/index.json?cb=" .. os.epoch("utc")
local version = 0.05

if peripheral.find("tape_drive") == false then
  print("ERROR: You should have a tape drive from computronics connected to the pc with a tape in it")
end
local tape = peripheral.find("tape_drive")

local handle = http.get(indexURL)
local indexJSON = handle.readAll()
handle.close()
local index = textutils.unserialiseJSON(indexJSON)
if not index then
  print("ERROR: The index seems to be malformed, make an issue on github or dm RubenKnijn#0043 on Discord")
  return
end
local args = {...}

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
print("Writing and playing " .. songID.author .. " - " .. songID.name)
  wipe()
  tape.stop()
  tape.seek(-tape.getSize()) -- go back to the start

  local h = http.get(songID.file, nil, true) -- write in binary mode
  tape.write(h.readAll()) -- that's it
  h.close()

  tape.seek(-tape.getSize()) -- back to start again

  tape.setSpeed(songID.speed)
  tape.play()
end


if version < index.latestVersion then
  print("Your client is not up to date, please consider updating") -- Update check
end

if #args <= 0 then
  print("Usage: <action> [action args]")
  print("Try doing musicify help for a help menu")
end
if args[1] == "help" then
  print("Usage: <action> [action args]")
  print("musicify help  -- Displays this menu")
  print("musicify list -- Displays a list of songs you can play")
  print("musicify play <id> -- Plays the specified song")
  print("musicify shuffle [from] [to] -- Starts shuffle mode in a range if specified")
  print("musicify stop -- Stops playback")
elseif args[1] == "stop" then
  print("Stopping playback")
  tape.stop()
elseif args[1] == "list" then
  print("Music list format: `id | author - name`")
  for i in pairs(index.songs) do
    print(i .. " | " .. index.songs[i].author .. " - " .. index.songs[i].name)
  end
elseif args[1] == "shuffle" then
      if not args[2] then
        from = 1
      else
        from = args[2]
      end
      if not args[3] then
        to = #index.songs -- check if a range is supplied otherwise set it to the full range
      else
        to = args[3]
      end

    while true do
      print("Currently in shuffle mode, do <CTRL>+T to stop the shuffle")
      if not args[3] then
        from = 1
      end
      if not args[4] then
        to = #index.songs
      end
      print(from)
      print(to)
      local ranNum = math.random(from,to)
      play(index.songs[ranNum])
      sleep(index.songs[ranNum].time)
      end
elseif args[1] == "play" then
  if tonumber(args[2]) <= 0 then
    print("ERROR: Please specify a song id, use the `list` action to see all music in a list")
    return
  elseif tonumber(args[2]) > #index.songs then
    print("ERROR: The number you specified is out of bounds, try a lower number")
    return
  end
  if not tape.isReady() then
    print("ERROR: You need to have a tape in the tape drive")
    return
  end
  playID = tonumber(args[2])
  play(index.songs[playID])
  tape.play()
end
