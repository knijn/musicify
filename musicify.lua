local indexURL = "https://raw.githubusercontent.com/RubenHetKonijn/computronics-songs/main/index.json?cb=" .. os.epoch("utc")
local version = 0.04


if peripheral.find("tape_drive") == false then
  print("You should have a tape drive from computronics connected to the pc with a tape in it")
end
local tape = peripheral.find("tape_drive")

local handle = http.get(indexURL)
local indexJSON = handle.readAll()
handle.close()
local index = textutils.unserialiseJSON(indexJSON)
if not index then
  print("The index seems to be malformed, make an issue on github or dm RubenKnijn#0043 on Discord")
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

if version < index.latestVersion then
  print("Your client is not up to date, please consider updating")
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
  print("musicify stop -- Stops playback")
elseif args[1] == "stop" then
  print("Stopping playback")
  tape.stop()
elseif args[1] == "list" then
  print("Music list format: `id | author - name`")
  for i in pairs(index.songs) do
    print(i .. " | " .. index.songs[i].author .. " - " .. index.songs[i].name)
  end
elseif args[1] == "play" then
  if args[2] == "shuffle" then
    while true do
      local ranNum = math.random(1,#index.songs)
      print("Currently in shuffle mode, do <CTRL>+T to stop the shuffle")
      print("Writing and playing " .. index.songs[ranNum].author .. " - " .. index.songs[ranNum].name)
      wipe()
      tape.stop()
      tape.seek(-tape.getSize()) -- go back to the start

      local h = http.get(index.songs[ranNum].file, nil, true) -- write in binary mode
      tape.write(h.readAll()) -- that's it
      h.close()

      tape.seek(-tape.getSize()) -- back to start again

      tape.setSpeed(index.songs[ranNum].speed)
      tape.play()
      sleep(index.songs[ranNum].time)
    end
  end
  if tonumber(args[2]) <= 0 then
    print("Please specify a song id, use the `list` action to see all music in a list")
    return
  end
  if not tape.isReady() then
    print("You need to have a tape in the tape drive")
    return
  end
  playID = tonumber(args[2])
  print("Writing and playing " .. index.songs[playID].author .. " - " .. index.songs[playID].name)
  wipe()
  tape.stop()
  tape.seek(-tape.getSize()) -- go back to the start

  local h = http.get(index.songs[playID].file, nil, true) -- write in binary mode
  tape.write(h.readAll()) -- that's it
  h.close()

  tape.seek(-tape.getSize()) -- back to start again

  tape.setSpeed(index.songs[playID].speed)
  tape.play()
end
