local indexURL = "https://raw.githubusercontent.com/RubenHetKonijn/computronics-songs/main/index.json?cb=" .. os.epoch("utc")
local version = 0.1

if not peripheral.find("tape_drive") then
  error("Tapedrive not found")
end
local tape = peripheral.find("tape_drive")

local handle = http.get(indexURL)
local indexJSON = handle.readAll()
handle.close()
local index = textutils.unserialiseJSON(indexJSON)
if not index then
  error("The index is malformed.")
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
  print("musicify update -- Update musicify")

elseif args[1] == "update" then
  print("Updating musicify.")
  update()

elseif args[1] == "stop" then
  print("Stopping playback")
  tape.stop()

elseif args[1] == "list" then
  print("Music list format: `id | author - name`")
  for i in pairs(index.songs) do
    print(i .. " | " .. index.songs[i].author .. " - " .. index.songs[i].name)
  end
  print("Use Mildly Better Shell if you want to scroll through the list")

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

elseif args[1] == "volume" then
  if not args[2] then
    print("Please specify a volume level")
    return
  end
  if tonumber(args[2]) <= 0 or tonumber(args[2]) >= 101 then
    print("Please specify a volume level between 1-100")
    return
  end
  volume = tonumber(args[2]) / 100
  tape.setVolume(volume)

elseif args[1] == "play" then
  if not args[2] then
    print("Resuming playback...")
    return
  end
  elseif tonumber(args[2]) <= 0 or not tonumber(args[2]) then
    print("ERROR: Please specify a song id, use the `list` action to see all music in a list")
    return
  elseif tonumber(args[2]) % 1 ~= 0 then
    print("ERROR: The number specified must be whole.")
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
