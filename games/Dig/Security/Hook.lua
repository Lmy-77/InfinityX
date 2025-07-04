local function deepHook(tbl)
    for i, fn in pairs(tbl) do
        if typeof(fn) == "function" then
            local consts = getconstants(fn)
            for _, c in ipairs(consts) do
                if c == "Kick" or c == "kick" or c == "Ban" or c == "ban" then
                    hookfunction(fn, function(...)
                        return nil
                    end)
                end
            end
        end
    end
end

for _, v in ipairs(getgc(true)) do
    if type(v) == "table" then
        deepHook(v)
    end
end


local Players = game:GetService("Players")
local Local = Players.LocalPlayer
if Local then
    hookfunction(Local.Kick, function(...) end)
    hookfunction(Local.KickAsync, function(...) end)
    if Local.Ban then
        hookfunction(Local.Ban, function(...) end)
    end
end


local NamecallInstanceDetector = nil
for _, tbl in ipairs(getgc(true)) do
    if typeof(tbl) == "table" and rawget(tbl, "namecallInstance") then
        for _, cont in pairs(tbl) do
            if type(cont)=="table" then
                for idx, val in ipairs(cont) do
                    if val=="kick" and type(cont[idx+1])=="function" then
                        local fn = cont[idx+1]
                        if table.find(getconstants(fn), "namecallInstance") then
                            NamecallInstanceDetector = fn
                        end
                    end
                end
            end
        end
    end
end

if NamecallInstanceDetector then
    hookfunction(NamecallInstanceDetector, function() return false end)
end


local Targets = {}
for _, v in ipairs(game:GetService("ReplicatedStorage").Remotes:GetChildren()) do
    if (v:IsA("RemoteEvent") or v:IsA("RemoteFunction")) and v.Name:lower():find("admin") then
        Targets[v] = true
    end
end

local rawNamecall = hookmetamethod(game, "__namecall", function(self, ...)
    local m = getnamecallmethod()
    if Targets[self] and (m == "FireServer" or m == "InvokeServer") then
        return nil
    end
    return rawNamecall(self, ...)
end)


local WhiteList = {
  'Voucher_RemoveGuis', 'Voucher_OpenOption', 'Admin_GetBanStatus', 'Admin_GetCommandLibrary', 'Admin_GetData', 'Admin_GetTradeBanStatus', 'Admin_RunCommand', 'Admin_WipeData', 'Bindable_ItemHandler_RemoveItem', 'Bindable_ToolHandler_RemoveItem', 'Boss_Spawn', 'CharmChisel_Use', 'ClientCall_PlatformType', 'Complete_Code', 'Crate_OpenOption', 'Crate_RemoveGuis', 'CycleEvent_Horn_Use', 'Dig_GetClientGround', 'Dig_GetClientStatus', 'Emote_Play', 'Emote_Stop', 'GetBossID', 'GetWaypointPosition', 'JournalPage_Complete', 'Level_Check', 'Quest_DeliverPizza', 'Request_Copies_Data', 'Totem_GetStacks', 'Totem_Place', 'Trade_SendRequest', 'TravelingMerchant_BuyItem', 'TravelingMerchant_GetItems', 'TravelingMerchant_OpenGui', 'Vehicle_Purchase'
}
for _, remote in ipairs(game:GetService("ReplicatedStorage").Remotes:GetChildren()) do
    if remote:IsA("RemoteFunction") then
        if not table.find(WhiteList, remote.Name) then
            pcall(function()
                remote.OnClientInvoke = function() return nil end
            end)
        end
    end
end


local spec = game:GetService("Players").LocalPlayer.PlayerScripts.CustomClientScripts:FindFirstChild("SpectateClient")
if spec then
    spec.Disabled = true
end



pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Lmy-77/InfinityX/refs/heads/scripts/games/Dig/ModDetect/source.lua"))()
end)
