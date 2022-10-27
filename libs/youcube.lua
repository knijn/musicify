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

return YouCubeAPI