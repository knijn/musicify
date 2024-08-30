-- data[1].assets[1].browser_download_url
local apiURL = "http://api.github.com/repos/knijn/musicify/releases"
local baseRepoURL = "https://raw.githubusercontent.com/knijn/musicify/main"
local args = {...}
local skipcheck = false
if args and args[1] == "y" then
  skipcheck = true
end

local scKey = _G._GIT_API_KEY
if scKey then
  requestData = {
    url = apiURL,
    headers = {["Authorization"] = "token " .. scKey}
  }
  http.request(requestData)
else
  http.request(apiURL) -- when not on switchcraft, use no authentication
end
print("Made request to " .. apiURL)

while true do
  event, url, handle = os.pullEvent()
  if event == "http_failure" then
    error("Failed to download file: " .. handle)
  elseif event == "http_success" then
    print(handle.getResponseCode())
    local data = textutils.unserialiseJSON(handle.readAll())
    local url = data[1].assets[1].browser_download_url
    print("Downloading Musicify from: " .. url .. ", is this okay? (n to cancel, anything else to continue)")
    local input = read()
    if not skipcheck and input == keys.n then
      error("Cancelled Installation")
    end
    print("Installing now")
    shell.run("rm musicify")
    shell.run("wget " .. url)

    print("Downloading libraries right now")
    shell.run("rm /lib/semver.lua")
    shell.run("rm /lib/youcubeapi.lua")
    shell.run("rm /lib/basalt.lua")
    shell.run("rm /lib/dfpwm.lua")
    shell.run("wget " .. baseRepoURL .. "/lib/semver.lua /lib/semver.lua")
    shell.run("wget " .. baseRepoURL .. "/lib/dfpwm.lua /lib/dfpwm.lua")
    shell.run("wget " .. baseRepoURL .. "/lib/youcubeapi.lua /lib/youcubeapi.lua")
    shell.run("wget " .. baseRepoURL .. "/lib/basalt.lua /lib/basalt.lua")
    print("Done!!")
    return
  end
end


