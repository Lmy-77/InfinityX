loadstring(game:HttpGet("https://raw.githubusercontent.com/Pixeluted/adoniscries/main/Source.lua",true))()


local NamecallInstanceDetector = nil

for Index, Table in getgc(true) do
    if typeof(Table) ~= "table" then continue end
    if not rawget(Table, "namecallInstance") then continue end
    for SecondIndex, StackContainerTable in Table do
        if typeof(StackContainerTable) ~= "table" then continue end
        for ThirdIndex, Upvalues in StackContainerTable do
            if StackContainerTable[ThirdIndex] ~= "kick" then continue end
            if typeof(StackContainerTable[ThirdIndex + 1]) ~= "function" then continue end
            local FrozenDetectionFunction = StackContainerTable[ThirdIndex + 1]
            for _, DetectionIdentifier in getconstants(FrozenDetectionFunction) do
                if DetectionIdentifier == "namecallInstance" then
                    NamecallInstanceDetector = FrozenDetectionFunction                    
                end
            end
        end
    end
end

if NamecallInstanceDetector then
    hookfunction(NamecallInstanceDetector, function()
        return false
    end)
end

local Targets = {}
local mtHook
for _, v in pairs(game:GetService("ReplicatedStorage").Remotes:GetChildren()) do
  if (v:IsA("RemoteEvent") or v:IsA("RemoteFunction")) and v.Name:lower():find("admin") then
    Targets[v] = true
  end
end
mtHook = hookmetamethod(game, "__namecall", function(self, ...)
  if Targets[self] and (getnamecallmethod() == "InvokeServer" or getnamecallmethod() == "FireServer") then
    return nil
  end
  return mtHook(self, ...)
end)

local WhiteList = {'Voucher_RemoveGuis', 'Voucher_OpenOption', 'Admin_GetBanStatus', 'Admin_GetCommandLibrary', 'Admin_GetData', 'Admin_GetTradeBanStatus', 'Admin_RunCommand', 'Admin_WipeData', 'Bindable_ItemHandler_RemoveItem', 'Bindable_ToolHandler_RemoveItem', 'Boss_Spawn', 'CharmChisel_Use', 'ClientCall_PlatformType', 'Complete_Code', 'Crate_OpenOption', 'Crate_RemoveGuis', 'CycleEvent_Horn_Use', 'Dig_GetClientGround', 'Dig_GetClientStatus', 'Emote_Play', 'Emote_Stop', 'GetBossID', 'GetWaypointPosition', 'JournalPage_Complete', 'Level_Check', 'Quest_DeliverPizza', 'Request_Copies_Data', 'Totem_GetStacks', 'Totem_Place', 'Trade_SendRequest', 'TravelingMerchant_BuyItem', 'TravelingMerchant_GetItems', 'TravelingMerchant_OpenGui', 'Vehicle_Purchase'}
for _, remote in pairs(game:GetService("ReplicatedStorage").Remotes:GetChildren()) do
    if remote:IsA('RemoteFunction') then
        local foundInWhitelist = false
        for _, whitelistedName in pairs(WhiteList) do
          if remote.Name == whitelistedName then
            foundInWhitelist = true
            break
          end
        end
        if not foundInWhitelist then
          remote.OnClientInvoke = function()
            return nil
          end
          remote:Destroy()
        end
    end
end
game:GetService("Players").LocalPlayer.PlayerScripts.CustomClientScripts:FindFirstChild('SpectateClient').Disabled = true
loadstring(game:HttpGet("https://raw.githubusercontent.com/Lmy-77/InfinityX/refs/heads/scripts/games/Dig/ModDetect/source.lua"))()
