-- teleport service (in rework)
-- local queue_on_teleport = queue_on_teleport or syn and syn.queue_on_teleport
-- queue_on_teleport[[
--     repeat wait() until game:IsLoaded() print("ServerHoped or rejoined")
--     wait(2)
--     loadstring(game:HttpGet("https://raw.githubusercontent.com/Lmy-77/InfinityX/refs/heads/main/Software/main.lua",true))()
-- ]]



-- loader
local currentPlaceId = game.PlaceId
local supportedGames = { 
        [{893973440}] = 'https://raw.githubusercontent.com/Lmy-77/InfinityX/refs/heads/scripts/games/FleeTheFacility/src.lua',
        [{10260193230}] = 'https://raw.githubusercontent.com/Lmy-77/InfinityX/refs/heads/scripts/games/MemeSea/src.lua',
        [{1962086868, 3582763398}] = 'https://raw.githubusercontent.com/Lmy-77/InfinityX/refs/heads/scripts/games/TowerOfHell/source.lua',
        [{6284881984, 6314042276}] = 'https://raw.githubusercontent.com/Lmy-77/InfinityX/refs/heads/scripts/games/AnimeMania/source.lua'
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
    print("InfinityX - Game supported")
    loadstring(game:HttpGet(scriptUrl))()
else
    print("InfinityX - Game not supported")
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Lmy-77/Infinity-Hub/refs/heads/modules/Notification/Support.lua"))()
end
