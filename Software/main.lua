-- teleport service
local queue_on_teleport = queue_on_teleport or syn and syn.queue_on_teleport
queue_on_teleport[[
    repeat wait() until game:IsLoaded() print("ServerHoped or rejoined")
    wait(2)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Lmy-77/Infinity-Hub/refs/heads/main/Software/src.lua"))()
]]



-- loader
local currentPlaceId = game.PlaceId
local supportedGames = { 

}
local function findScript()
    for key, scriptUrl in pairs(supportedGames) do
        if typeof(key) == "table" then
            for _, id in ipairs(key) do
                if id == currentPlaceId then
                    return scriptUrl
                end
            end
        elseif key == currentPlaceId then
            return scriptUrl
        end
    end
    return nil
end
local scriptUrl = findScript()
if scriptUrl then
    print("Infinity Hub - Game supported")
    loadstring(game:HttpGet(scriptUrl))()
else
    print("Infinity Hub - Game not supported")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Lmy-77/Infinity-Hub/refs/heads/modules/Notification/Support.lua"))()
end
