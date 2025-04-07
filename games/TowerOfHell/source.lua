-- detect service
local UserInputService = game:GetService("UserInputService")
if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled and not UserInputService.MouseEnabled then
	print("Mobile device")
elseif not UserInputService.TouchEnabled and UserInputService.KeyboardEnabled and UserInputService.MouseEnabled then
	print("Computer device")
end



-- start
print[[                                                                     

 /$$$$$$            /$$$$$$  /$$           /$$   /$$               /$$   /$$
|_  $$_/           /$$__  $$|__/          |__/  | $$              | $$  / $$
  | $$   /$$$$$$$ | $$  \__/ /$$ /$$$$$$$  /$$ /$$$$$$   /$$   /$$|  $$/ $$/
  | $$  | $$__  $$| $$$$    | $$| $$__  $$| $$|_  $$_/  | $$  | $$ \  $$$$/ 
  | $$  | $$  \ $$| $$_/    | $$| $$  \ $$| $$  | $$    | $$  | $$  >$$  $$ 
  | $$  | $$  | $$| $$      | $$| $$  | $$| $$  | $$ /$$| $$  | $$ /$$/\  $$
 /$$$$$$| $$  | $$| $$      | $$| $$  | $$| $$  |  $$$$/|  $$$$$$$| $$  \ $$
|______/|__/  |__/|__/      |__/|__/  |__/|__/   \___/   \____  $$|__/  |__/
                                                         /$$  | $$          
                                                        |  $$$$$$/          
                                                         \______/           
]]



-- load preference
if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled and not UserInputService.MouseEnabled then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Lmy-77/InfinityX/refs/heads/main/Software/button.lua"))()
end



-- variables
local scriptVersion = '3.2a'
local ls1 = game:GetService("Players").LocalPlayer.PlayerScripts.LocalScript
local ls2 = game:GetService("Players").LocalPlayer.PlayerScripts.LocalScript2
local ls3 = game.Players.LocalPlayer.Character.KillScript
local tower = workspace:FindFirstChild('tower')
local tweenPart = tower.sections.finish.start
local senv = getsenv(ls1)
local func = senv.kick
local function disconnectAll(signal)
	for _, conn in ipairs(getconnections(signal)) do
		conn:Disconnect()
	end
end
function Refresh(dropdown, table)
    dropdown:ClearOptions()
    dropdown:InsertOptions(table)
end
function GetSize()
    if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled and not UserInputService.MouseEnabled then
        return UDim2.fromOffset(600, 350)
    else
        return UDim2.fromOffset(830, 525)
    end
end



-- ui library
local MacLib = loadstring(game:HttpGet("https://github.com/biggaboy212/Maclib/releases/latest/download/maclib.txt"))()
local Window = MacLib:Window({
	Title = "InfinityX "..scriptVersion,
	Subtitle = "By lmy77 | "..game:GetService('MarketplaceService'):GetProductInfo(game.PlaceId).Name,
	Size = GetSize(),
	DragStyle = 2,
	DisabledWindowControls = {},
	ShowUserInfo = true,
	Keybind = Enum.KeyCode.K,
	AcrylicBlur = true,
})
local globalSettings = {
	FPSToggle = Window:GlobalSetting({
		Name = "Unlock FPS",
		Default = true,
		Callback = function(bool)
            local fps = bool
            local function UnlockFPS()
                local RefreshRate = 60
                if game:GetService("UserInputService").TouchEnabled then
                    RefreshRate = 120
                elseif game:GetService("UserInputService").KeyboardEnabled then
                    RefreshRate = 240
                end
                setfpscap(RefreshRate * 2)
            end
            while fps do task.wait(.2)
                UnlockFPS()
            end
        end,
	}),
    ViewGame = Window:GlobalSetting({
		Name = "Auto Update",
		Default = true,
		Callback = function(bool)
			if bool then
                warn('Auto update actived!')
			end
		end,
	}),
}



-- tabs
local tabGroups = {
	TabGroup1 = Window:TabGroup()
}
local tabs = {
	AutoFarm  = tabGroups.TabGroup1:Tab({ Name = "| Auto Farm", Image = "rbxassetid://10709811110" }),
}
local sections = {
	AutoFarmSection1 = tabs.AutoFarm:Section({ Side = "Left" }),
    AutoFarmSection2 = tabs.AutoFarm:Section({ Side = "Right" }),
}
tabs.AutoFarm:Select()



-- source
sections.AutoFarmSection1:Header({
	Name = "[🗼] Tower"
})
sections.AutoFarmSection2:Header({
	Name = "[🏃] Player"
})
sections.AutoFarmSection1:Button({
	Name = "Finish tower",
	Callback = function()
        if game.PlaceId == 1962086868 then
            game:GetService("TweenService"):Create(
                game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"),
                TweenInfo.new(20, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
                {Position = tweenPart.Position + Vector3.new(0, 10, 0)}
            ):Play() wait(20.5) game.Players.LocalPlayer.Character.Humanoid.Health = 0
        elseif game.PlaceId == 3582763398 then
            game:GetService("TweenService"):Create(
                game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"),
                TweenInfo.new(25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
                {Position = tweenPart.Position + Vector3.new(0, 10, 0)}
            ):Play() wait(25.5) game.Players.LocalPlayer.Character.Humanoid.Health = 0
        end
	end,
})
sections.AutoFarmSection1:Button({
	Name = "Finish tower + rejoin",
	Callback = function()
        if game.PlaceId == 1962086868 then
            game:GetService("TweenService"):Create(
                game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"),
                TweenInfo.new(20, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
                {Position = tweenPart.Position + Vector3.new(0, 10, 0)}
            ):Play() wait(20.5) game.Players.LocalPlayer.Character.Humanoid.Health = 0
            wait(1.5)
            game:GetService("TeleportService"):TeleportToPlaceInstance(
                game.PlaceId, game.JobId, game:GetService("Players").LocalPlayer
            )
        elseif game.PlaceId == 3582763398 then
            game:GetService("TweenService"):Create(
                game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"),
                TweenInfo.new(25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
                {Position = tweenPart.Position + Vector3.new(0, 10, 0)}
            ):Play() wait(25.5) game.Players.LocalPlayer.Character.Humanoid.Health = 0
            wait(1.5)
            game:GetService("TeleportService"):TeleportToPlaceInstance(
                game.PlaceId, game.JobId, game:GetService("Players").LocalPlayer
            )
        end
	end,
})
sections.AutoFarmSection2:Toggle({
	Name = "God mode",
	Default = false,
	Callback = function(bool)
        gm = bool
        ls3.Disabled = gm
	end,
}, "Toggle")
sections.AutoFarmSection2:Button({
	Name = "Get all tools",
	Callback = function()
        for _, v in pairs(game:GetService("ReplicatedStorage").Gear:GetChildren()) do
            if v:IsA('Tool') then
                local tclone = v:Clone()
                tclone.Parent = game.Players.LocalPlayer.Backpack
            end
        end
	end,
})
sections.AutoFarmSection2:Input({
	Name = "Walkspeed",
	Placeholder = "16",
	AcceptedCharacters = "Numeric",
	Callback = function(input)
		game:GetService("ReplicatedStorage").globalSpeed.Value = input
	end,
}, "TargetInput")
sections.AutoFarmSection2:Input({
	Name = "Jumppower",
	Placeholder = "50",
	AcceptedCharacters = "Numeric",
	Callback = function(input)
		game:GetService("ReplicatedStorage").globalJumps.Value = input
	end,
}, "TargetInput")



-- execute bypass
disconnectAll(ls2.Changed)
hookfunction(func, function(...)
    return nil
end)
for _, conn in pairs(getconnections(ls1.Changed)) do
	conn:Disable()
end


task.spawn(function() while true do task.wait() ls1.Disabled = true ls2.Disabled = true end end)

warn('[ InfinityX ] - Loaded!')
warn('[ InfinityX ] - Scripts and kick functions has been canceled, enjoy!')
