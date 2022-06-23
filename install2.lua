local apiEndpoint = "https://api.github.com/repos/knijn/musicify/releases"
-- data[1].assets[1].browser_download_url
local handle = http.get(apiEndpoint)
local data = textutils.unserialiseJSON(handle.readAll))
handle.close()

local url = data[1].assets[1].browser_download_url

-- WIP, to be finished!!
