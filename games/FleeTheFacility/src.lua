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
function GetSizeOfObject(Obj)
    if Obj:IsA("BasePart") then
        return Obj.Size
    elseif Obj:IsA("Model") then
        return Obj:GetExtentsSize()
    end
end
local OldNameCall = nil
OldNameCall = hookmetamethod(game, "__namecall", function(...)
    local Args = {...}
    local Self = Args[1]
    if getnamecallmethod() == "FireServer" and tostring(Self) == "RemoteEvent" and Args[1] == "ReportPhysicsFPS" then
        return wait(math.huge)
    end
    return OldNameCall(...)
end)
local function WalkSpeedBypass()
    local gmt = getrawmetatable(game)
    setreadonly(gmt, false)
    local oldIndex = gmt.__Index
    gmt.__Index = newcclosure(function(self, b)
        if b == 'WalkSpeed' then
            return 16
        end
        return oldIndex(self, b)
    end)
end
local function JumpPowerBypass()
    local gmt = getrawmetatable(game)
    setreadonly(gmt, false)
    local oldIndex = gmt.__Index
    gmt.__Index = newcclosure(function(self, b)
        if b == 'JumpPower' then
            return 50
        end
        return oldIndex(self, b)
    end)
end
local BeastColor = Color3.new(255, 0, 0)
local InoccentColor = Color3.new(255, 255, 255)
local ESPEnabled = nil
local ESPComputer = nil
local function createESP(player, color)
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        for _, part in pairs(player.Character:GetChildren()) do
            if part:IsA("BasePart") and not part:FindFirstChild("ESPBox") then
                local box = Instance.new("BoxHandleAdornment")
                box.Name = "ESPBox"
                box.Size = part.Size + Vector3.new(0.1, 0.1, 0.1)
                box.Adornee = part
                box.AlwaysOnTop = true
                box.ZIndex = 5
                box.Transparency = 0.5
                box.Color3 = color
                box.Parent = part
            end
        end
    end
end
local function removeESP(player)
    if player.Character then
        for _, part in pairs(player.Character:GetChildren()) do
            if part:IsA("BasePart") then
                local box = part:FindFirstChild("ESPBox")
                if box then
                    box:Destroy()
                end
            end
        end
    end
end
local function updateESPColors()
    for _, player in pairs(game:GetService("Players"):GetPlayers()) do
        if player.Name ~= game:GetService("Players").LocalPlayer.Name then
            if player.Character then
                for _, part in pairs(player.Character:GetChildren()) do
                    if part:IsA("BasePart") then
                        local box = part:FindFirstChild("ESPBox")
                        if box then
                            if player.Character:FindFirstChild("BeastPowers") then
                                box.Color3 = BeastColor
                            else
                                box.Color3 = InoccentColor
                            end
                        end
                    end
                end
            end
        end
    end
end
local function updateESP()
    for _, player in pairs(game:GetService("Players"):GetPlayers()) do
        if player.Name ~= game:GetService("Players").LocalPlayer.Name then
            removeESP(player)
            if ESPEnabled then
                if player.Character and player.Character:FindFirstChild("BeastPowers") then
                    createESP(player, BeastColor)
                else
                    createESP(player, InoccentColor)
                end
            end
        end
    end
end
game:GetService("Players").PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function()
        if ESPEnabled then
            updateESP()
        end
    end)
end)
game:GetService("Players").PlayerRemoving:Connect(function(player)
    removeESP(player)
end)
local function updateComputerESP()
    local map = workspace:FindFirstChild(tostring(game.ReplicatedStorage.CurrentMap.Value))
    if map then
        local computerTables = map:GetChildren()
        for _, table in pairs(computerTables) do
            if table:IsA("Model") and table.Name == "ComputerTable" then
                for _, screen in pairs(table:GetDescendants()) do
                    if (screen:IsA("Part") or screen:IsA("UnionOperation")) and screen.Name == "Screen" then
                        local billboardGui = screen:FindFirstChild("BillboardGui")
                        if billboardGui then
                            local imageLabel = billboardGui:FindFirstChild("ImageLabel")
                            if imageLabel then
                                billboardGui.Enabled = ESPComputer
                                if ESPComputer then
                                    imageLabel.ImageColor3 = screen.Color
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end
local KeyPress = function(v)
    return game:GetService("VirtualInputManager"):SendKeyEvent(true, v, false, game)
end
function getAction()
    if game:GetService("Players").LocalPlayer.TempPlayerStatsModule.ActionProgress.Value == 0 then
        return 'Nothing or walking'
    else
        return 'Hacking a computer or opening a door'
    end
end
function getBeast()
    for _, v in pairs(game:GetService('Players'):GetChildren()) do
        if v.Name ~= game:GetService('Players').LocalPlayer.Name then
            if v.Character:findFirstChild('BeastPowers') then
                return v.Name
            end
        end
    end
end
local function CreatePlataform()
    local model = Instance.new('Model', workspace)
    model.Name = 'plataform'
    local plataform = Instance.new('Part', model)
    plataform.Position = Vector3.new(400.9646301269531, 3.3987059593200684, 157.8434600830078)
    plataform.Name = 'handle'
    plataform.Anchored = true
end
function GetSize()
    if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled and not UserInputService.MouseEnabled then
        return UDim2.fromOffset(600, 350)
    else
        return UDim2.fromOffset(830, 525)
    end
end
scriptVersion = '3.2a'


-- ui library
local MacLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Lmy-77/InfinityX/refs/heads/library/Maclib/src.lua"))()
local Window = MacLib:Window({
	Title = "InfinityX "..scriptVersion,
	Subtitle = "By lmy77 - Free | "..game:GetService('MarketplaceService'):GetProductInfo(game.PlaceId).Name,
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
	Game = tabGroups.TabGroup1:Tab({ Name = "| Game", Image = "rbxassetid://10723424505" }),
    LPayer = tabGroups.TabGroup1:Tab({ Name = "| Local Player", Image = "rbxassetid://10747373176" }),
    Esp = tabGroups.TabGroup1:Tab({ Name = "| Esp", Image = "rbxassetid://10747375132" }),
    EspSettings = tabGroups.TabGroup1:Tab({ Name = "| Esp Settings", Image = "rbxassetid://10734950309" }),
}
local sections = {
	GameSection1 = tabs.Game:Section({ Side = "Left" }),
    GameSection2 = tabs.Game:Section({ Side = "Right" }),
    LPlayerSection1 = tabs.LPayer:Section({ Side = "Left" }),
    LPlayerSection2 = tabs.LPayer:Section({ Side = "Right" }),
    LPlayerSection3 = tabs.LPayer:Section({ Side = "Left" }),
    EspSection1 = tabs.Esp:Section({ Side = "Left" }),
    EspSection2 = tabs.Esp:Section({ Side = "Right" }),
    EspSeettingsSection1 = tabs.EspSettings:Section({ Side = "Left" }),
}
tabs.Game:Select()



-- source
sections.GameSection1:Header({
	Name = "[🌐] Game Cheats"
})
sections.GameSection2:Header({
	Name = "[📋] Stats"
})
sections.GameSection1:Toggle({
	Name = "Auto hack",
	Default = false,
	Callback = function(bool)
        autoHack = bool
        if autoHack then
            Window:Notify({
                Title = 'InfinityX',
                Description = "Auto hack actived!"
            })
        end
        while autoHack do task.wait()
            game:GetService("ReplicatedStorage").RemoteEvent:FireServer("SetPlayerMinigameResult",true)
            for _, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui:GetChildren()) do
                if v:IsA('ScreenGui') and v.Name == 'ScreenGui' then
                    if v.TimingCircle.Visible == true then
                        wait(.2)
                        KeyPress('E')
                    end
                end
            end
        end
	end,
}, "Toggle")
sections.GameSection1:Button({
	Name = "Teleport to exit door",
	Callback = function()
        for _, v in pairs(workspace:GetDescendants()) do
            if (v:IsA('Model') and v.Name == 'ExitDoor') then
                for _, x in pairs(v:GetChildren()) do
                    if (x:IsA('Part') and x.Name == 'ExitDoorTrigger') then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = x.CFrame
                        wait(.2)
                        KeyPress('E')
                        return
                    end
                end
            end
        end
	end,
})
sections.GameSection1:Button({
	Name = "Teleport to computer",
	Callback = function()
        if cooldown then
            Window:Notify({
                Title = 'InfinityX',
                Description = "Cooldown, wait"
            })
            return
        end
        local progress = game:GetService("Players").LocalPlayer.TempPlayerStatsModule.ActionProgress.Value
        if progress ~= 0 then
            Window:Notify({
                Title = 'InfinityX',
                Description = "Finish computer first"
            })
            return
        end
        local map = workspace:FindFirstChild(tostring(game.ReplicatedStorage.CurrentMap.Value))
        if map then
            for _, v in pairs(map:GetChildren()) do
                if v:IsA("Model") and v.Name == "ComputerTable" then
                    for _, x in pairs(v:GetChildren()) do
                        if x:IsA("Part") and x.Name:lower():find("computertrigger") then
                            if x.ActionSign.Value == 20 and v.Screen.Color ~= Color3.fromRGB(40, 127, 71) then
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = x.CFrame
                                wait(.5)
                                game:GetService('VirtualInputManager'):SendKeyEvent(true, 'E', false, game) wait(.1) game:GetService('VirtualInputManager'):SendKeyEvent(false, 'E', false, game)
                                wait(.5)
                                task.spawn(function()
                                    wait(1)
                                    repeat task.wait() until game:GetService("Players").LocalPlayer.TempPlayerStatsModule.ActionProgress.Value == 0
                                    cooldown = true
                                    task.wait(20)
                                    cooldown = false
                                end)
                                return
                            end
                        end
                    end
                end
            end
        end
	end,
})
sections.GameSection1:Button({
	Name = "Save captured players",
	Callback = function()
        local oldPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
        local TeleportOldPos = '';
        TeleportOldPos = oldPos
        for _, v in pairs(game:GetService('Players'):GetChildren()) do
            if (v.Name ~= game.Players.LocalPlayer.Name) then
                if (v.TempPlayerStatsModule.Captured.Value == true) then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,-2.35)
                    wait(.2)
                    KeyPress('E')
                    wait(.25)
                end
            end
        end
        wait(.2)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(TeleportOldPos)
	end,
})
sections.GameSection1:Button({
	Name = "Check beast",
	Callback = function()
        for _, v in pairs(game:GetService('Players'):GetChildren()) do
            if v.Name ~= game:GetService('Players').LocalPlayer.Name then
                if v.Character:findFirstChild('BeastPowers') then
                    Window:Notify({
                        Title = 'InfinityX',
                        Description = "Beast is "..v.Name
                    })
                end
            end
        end
	end,
})
local stats = sections.GameSection2:Paragraph({
    Header = 'Your stats',
    Body = 'nil'
})
task.spawn(function()
    while true do task.wait()
        stats:UpdateBody(
            'Money: '..game:GetService("Players").LocalPlayer.SavedPlayerStatsModule.Credits.Value.. "\nBeast Chance: "..game:GetService("Players").LocalPlayer.PlayerGui.MenusScreenGui.MainMenuWindow.Body.BeastChanceFrame.PercentageLabel.Text.."\nLevel: "..game:GetService("Players").LocalPlayer.SavedPlayerStatsModule.Level.Value.."\nXp: "..game:GetService("Players").LocalPlayer.SavedPlayerStatsModule.Xp.Value.."\nAction: "..getAction()
        )
    end
end)
sections.GameSection2:Divider()
sections.GameSection2:Button({
	Name = "Open menu",
	Callback = function()
        if game:GetService("Players").LocalPlayer.PlayerGui.MenusScreenGui.MainMenuWindow.Visible == false then
            game:GetService("Players").LocalPlayer.PlayerGui.MenusScreenGui.MainMenuWindow.Visible = true
        elseif game:GetService("Players").LocalPlayer.PlayerGui.MenusScreenGui.MainMenuWindow.Visible == true then
            game:GetService("Players").LocalPlayer.PlayerGui.MenusScreenGui.MainMenuWindow.Visible = false
        end
	end,
})
sections.GameSection2:Button({
	Name = "Reset button [ Mobile ]",
	Callback = function()
        Window:Notify({
            Title = 'InfinityX',
            Description = "New button generated!"
        })
        for _, v in pairs(game:GetService('CoreGui'):GetChildren()) do
            if v:IsA('ScreenGui') and v.Name == 'Button' then
                v:Destroy() wait() loadstring(game:HttpGet("https://raw.githubusercontent.com/Lmy-77/InfinityX/refs/heads/main/Software/button.lua"))()
            end
        end
	end,
})


sections.LPlayerSection1:Header({
    Name = "[🏃] Survival Options"
})
sections.LPlayerSection2:Header({
    Name = "[🔨] Beast Options"
})
sections.LPlayerSection3:Header({
    Name = "[🙍] Character Options"
})
sections.LPlayerSection1:Toggle({
	Name = "Anti ragdoll",
	Default = false,
	Callback = function(bool)
        antiRagdoll = bool
        if antiRagdoll then
            Window:Notify({
                Title = 'InfinityX',
                Description = "Anti ragdoll actived!"
            })
        end
        if antiRagdoll then
            while antiRagdoll do task.wait()
                for _, v in pairs(game:GetService("Players").LocalPlayer.TempPlayerStatsModule:GetChildren()) do
                    if (v:IsA('BoolValue') and v.Name == 'Ragdoll') then
                        if v.Value == true then
                            wait(.2)
                            v.Value = false
                            game.Players.LocalPlayer.Character.Ragdoller.Enabled = false
                            game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
                        end
                    end
                end
            end
        else
            wait(.5)
            for _, v in pairs(game:GetService("Players").LocalPlayer.TempPlayerStatsModule:GetChildren()) do
                if (v:IsA('BoolValue') and v.Name == 'Ragdoll') then
                    if (v.Value == true) then
                        v.Value = false
                    end
                end
            end
        end
	end,
}, "Toggle")
sections.LPlayerSection1:Toggle({
	Name = "No slow",
	Default = false,
	Callback = function(bool)
        NoSlow = bool
        if NoSlow then
            Window:Notify({
                Title = 'InfinityX',
                Description = "No slow actived!"
            })
        end
        WalkSpeedBypass()
        while NoSlow do task.wait()
            while NoSlow do task.wait()
                if game.Players.LocalPlayer.Character.Humanoid.WalkSpeed < 16 then
                    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
                end
            end
        end
	end,
}, "Toggle")
sections.LPlayerSection1:Toggle({
	Name = "Self-protection",
	Default = false,
	Callback = function(bool)
        local savedPosition = ''
        local teleporting = false
        autoProtection = bool
        if autoProtection then
            Window:Notify({
                Title = 'InfinityX',
                Description = "Self-protection actived!"
            })
        end
        while autoProtection do
            if autoProtection and not teleporting then
                savedPosition = game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.Position
                teleporting = true
                while autoProtection do
                    local beast = getBeast()
                    if beast then
                        local beastCharacter = game:GetService('Players'):FindFirstChild(beast).Character
                        if beastCharacter then
                            local beastPosition = beastCharacter.HumanoidRootPart.Position
                            local myCharacter = game:GetService('Players').LocalPlayer.Character
                            local myPosition = myCharacter.HumanoidRootPart.Position
                            if (beastPosition - savedPosition).Magnitude <= 20 then
                                local offset = beastCharacter.HumanoidRootPart.CFrame.LookVector * -10
                                local teleportPosition = beastPosition + offset
                                myCharacter.HumanoidRootPart.CFrame = CFrame.new(teleportPosition)
                            end
                        end
                    end
                    if not beast and (myCharacter.HumanoidRootPart.Position - savedPosition).Magnitude > 5 then
                        myCharacter.HumanoidRootPart.CFrame = CFrame.new(savedPosition)
                        wait(0.5)
                    end
                    wait(0.1)
                end
                teleporting = false
            end
        end
	end,
}, "Toggle")
sections.LPlayerSection2:Toggle({
	Name = "Knock aura",
	Default = false,
	Callback = function(bool)
        knock = bool
        if (knock) then
            local beastPower = game:GetService('Players').LocalPlayer.Character:FindFirstChild('BeastPowers')
            if not beastPower then
                Window:Notify({
                    Title = 'InfinityX',
                    Description = "You dont is the beast"
                })
                return
            else
                Window:Notify({
                    Title = 'InfinityX',
                    Description = "Knock aura actived!"
                })
            end
        end
        while knock do task.wait()
            for _, v in pairs(game.Players:GetChildren()) do
                if v.Name ~= game.Players.LocalPlayer.Name then
                    for _, x in pairs(game.Players[v.Name].Character:GetChildren()) do
                        if (x:IsA('Part') and x.Name == 'Left Arm') then
                            local ohString1 = "HammerHit"
                            local ohInstance2 = x
                            game.Players.LocalPlayer.Character.Hammer.HammerEvent:FireServer(ohString1, ohInstance2)
                            wait(.1)
                        end
                    end
                end
            end
        end
	end,
}, "Toggle")
sections.LPlayerSection2:Toggle({
	Name = "Active crawling",
	Default = false,
	Callback = function(bool)
        activeCraw = bool
        if activeCraw then
            Window:Notify({
                Title = 'InfinityX',
                Description = "Crawling actived!"
            })
        end
        while activeCraw do task.wait()
            game:GetService("Players").LocalPlayer.TempPlayerStatsModule.DisableCrawl.Value = false
        end
	end,
}, "Toggle")
sections.LPlayerSection2:Button({
	Name = "Capture a random player",
	Callback = function()
        local map = workspace:FindFirstChild(tostring(game.ReplicatedStorage.CurrentMap.Value))
        local oldPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
        local TeleportOldPos = '';
        TeleportOldPos = oldPos

        local beastPower = game:GetService('Players').LocalPlayer.Character:FindFirstChild('BeastPowers')
        if not beastPower then
            Window:Notify({
                Title = 'InfinityX',
                Description = "You dont is the beast"
            })
            return
        end
        for _, v in pairs(game:GetService('Players'):GetChildren()) do
            if (v.Name ~= game.Players.LocalPlayer.Name) then
                if (v.TempPlayerStatsModule.Captured.Value == false) then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame
                    wait(.2)
                    local ohString1 = "HammerHit"
                    local ohInstance2 = v.Character["Left Arm"]
                    game.Players.LocalPlayer.Character.Hammer.HammerEvent:FireServer(ohString1, ohInstance2)
                    wait(.3)
                    local ohString1 = "HammerTieUp"
                    local ohInstance2 = v.Character.Torso
                    local ohVector33 = Vector3.new(144.39588928222656, 9.367745399475098, 54.09453582763672)
                    game.Players.LocalPlayer.Character.Hammer.HammerEvent:FireServer(ohString1, ohInstance2, ohVector33)
                    wait(.5)
                    for _, x in pairs(map:GetChildren()) do
                        if x:IsA('Model') and x.Name == 'FreezePod' then
                            for _, z in pairs(x:GetDescendants()) do
                                if z:IsA('IntValue') and z.Name == 'ActionSign' then
                                    if z.Value == 30 then
                                        local pivotCFrame = x:GetPivot()
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pivotCFrame
                                        wait(.5)
                                        KeyPress('E')
                                        wait(.2)
                                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(TeleportOldPos)
                                        return
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
	end,
})
sections.LPlayerSection2:Button({
	Name = "No hammer cooldown",
	Callback = function()
        Window:Dialog({
            Title = "InfinityX 3.2a",
            Description = "Are you sure? There's no way back to normal. Are you sure you want to activate it?",
            Buttons = {
                {
                    Name = "Confirm",
                    Callback = function()
                        wait = task.wait
                        local a = game:GetService("Players").LocalPlayer.Character or game:GetService("Players").LocalPlayer.CharacterAdded:wait()
                        while wait() do
                            local b = a:FindFirstChildOfClass("Humanoid") or a:FindFirstChildOfClass("AnimationController")
                            if not b or not a then continue end
                            for c, d in next, b:GetPlayingAnimationTracks() do
                                d:AdjustSpeed(15)
                            end
                        end
                    end,
                },
                {
                    Name = "Cancel"
                }
            }
        })
	end,
})
local walkspeedInput = sections.LPlayerSection3:Input({
	Name = "WalkSpeed",
	Placeholder = "value",
	AcceptedCharacters = "Numeric",
	Callback = function(input)
		WalkSpeedValue = input
	end,
}, "TargetInput")
local jumppowerInput = sections.LPlayerSection3:Input({
	Name = "JumpPower",
	Placeholder = "value",
	AcceptedCharacters = "Numeric",
	Callback = function(input)
		JumpPowerValue = input
	end,
}, "TargetInput")
sections.LPlayerSection3:Divider()
sections.LPlayerSection3:Button({
	Name = "Set values",
	Callback = function()
        WalkSpeedBypass()
        JumpPowerBypass()
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = WalkSpeedValue
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = JumpPowerValue
	end,
})
sections.LPlayerSection3:Button({
	Name = "Reset values",
	Callback = function()
        WalkSpeedBypass()
        JumpPowerBypass()
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
        walkspeedInput:UpdateText('value')
        jumppowerInput:UpdateText('value')
	end,
})


sections.EspSection1:Header({
    Name = "[👀] Esp Players"
})
sections.EspSection2:Header({
    Name = "[💻] Esp Computers"
})
sections.EspSection1:Toggle({
	Name = "Esp players",
	Default = false,
	Callback = function(bool)
        ESPEnabled = bool
        if not ESPEnabled then
            for _, player in pairs(game:GetService("Players"):GetPlayers()) do
                if player.Name ~= game:GetService("Players").LocalPlayer.Name then
                    removeESP(player)
                end
            end
        else
            Window:Notify({
                Title = 'InfinityX',
                Description = "Esp players actived!"
            })
            updateESP()
        end
        while ESPEnabled do task.wait()
            updateESPColors()
        end
	end,
}, "Toggle")
sections.EspSection2:Toggle({
	Name = "Esp computers",
	Default = false,
	Callback = function(bool)
        ESPComputer = bool
        if not ESPComputer then
            local map = workspace:FindFirstChild(tostring(game.ReplicatedStorage.CurrentMap.Value))
            if map then
                local computerTables = map:GetChildren()
                for _, table in pairs(computerTables) do
                    if table:IsA("Model") and table.Name == "ComputerTable" then
                        for _, screen in pairs(table:GetDescendants()) do
                            if (screen:IsA("Part") or screen:IsA("UnionOperation")) and screen.Name == "Screen" then
                                local billboardGui = screen:FindFirstChild("BillboardGui")
                                if billboardGui then
                                    billboardGui.Enabled = false
                                end
                            end
                        end
                    end
                end
            end
        else
            Window:Notify({
                Title = 'InfinityX',
                Description = "Esp computer actived!"
            })
            while ESPComputer do task.wait()
                updateComputerESP()
            end
        end
	end,
}, "Toggle")


sections.EspSeettingsSection1:Header({
	Name = "[🖌️] Esp Colors"
})
local playerPicker = sections.EspSeettingsSection1:Colorpicker({
	Name = "Set the player's colour",
	Default = Color3.fromRGB(255, 255, 255),
	Alpha = 0,
	Callback = function(color, alpha)
        InoccentColor = color
	end,
}, "ESPColorToggle")
local beastPicker = sections.EspSeettingsSection1:Colorpicker({
	Name = "Set the beast colour",
	Default = Color3.fromRGB(255, 0, 0),
	Alpha = 0,
	Callback = function(color, alpha)
        BeastColor = color
	end,
}, "ESPColorToggle")
sections.EspSeettingsSection1:Button({
	Name = "Reset colors",
	Callback = function()
        BeastColor = Color3.new(255, 0, 0)
        InoccentColor = Color3.new(255, 255, 255)
        playerPicker:SetColor(Color3.new(255, 255, 255))
        beastPicker:SetColor(Color3.new(255, 0, 0))
	end,
})
