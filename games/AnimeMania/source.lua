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



-- make folder
if not isfolder('InfinityX') then
    makefolder('InfinityX')
    makefolder('InfinityX/Key-System')
    makefolder('InfinityX/Game')
    makefolder('InfinityX/Settings')
end
if not isfolder('InfinityX/Settings/6284881984') then
    makefolder('InfinityX/Settings/6284881984')
end
if not isfile('InfinityX/Game/Info.lua') then
	writefile('InfinityX/Game/Info.lua', '{Id = "'..tostring(game.PlaceId)..'", Name = "'..tostring(game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name)..'"}')
elseif isfile('InfinityX/Game/Info.lua') then
	writefile('InfinityX/Game/Info.lua', '{Id = "'..tostring(game.PlaceId)..'", Name = "'..tostring(game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name)..'"}')
end



-- source
repeat task.wait() until game:IsLoaded()
local placeIds = {
    Main = 6284881984,
}
if game.PlaceId == placeIds.Main then
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Parent = game.CoreGui
    local BlurEffect = Instance.new("BlurEffect")
    BlurEffect.Size = 10
    BlurEffect.Parent = game.Lighting
    local NotificationFrame = Instance.new("Frame")
    NotificationFrame.Size = UDim2.new(0, 320, 0, 180)
    NotificationFrame.Position = UDim2.new(0.5, -160, 0.5, -90)
    NotificationFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    NotificationFrame.BorderSizePixel = 0
    NotificationFrame.BackgroundTransparency = 0.1
    NotificationFrame.Parent = ScreenGui
    local UICornerFrame = Instance.new("UICorner")
    UICornerFrame.CornerRadius = UDim.new(0, 12)
    UICornerFrame.Parent = NotificationFrame
    local UIStrokeFrame = Instance.new("UIStroke")
    UIStrokeFrame.Thickness = 2
    UIStrokeFrame.Color = Color3.fromRGB(90, 90, 90)
    UIStrokeFrame.Transparency = 0.3
    UIStrokeFrame.Parent = NotificationFrame
    local UIGradientFrame = Instance.new("UIGradient")
    UIGradientFrame.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(70,70,70)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(50,50,50))
    }
    UIGradientFrame.Rotation = 90
    UIGradientFrame.Parent = NotificationFrame
    local UIScale = Instance.new("UIScale")
    UIScale.Scale = 1
    UIScale.Parent = NotificationFrame
    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, 0, 0, 28)
    Title.Position = UDim2.new(0, 0, 0.1, 0)
    Title.BackgroundTransparency = 1
    Title.Text = "Welcome to InfinityX"
    Title.TextScaled = true
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 26
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.Parent = NotificationFrame
    local Content = Instance.new("TextLabel")
    Content.Size = UDim2.new(1, -20, 0, 70)
    Content.Position = UDim2.new(0, 10, 0, 55)
    Content.BackgroundTransparency = 1
    Content.Text = "We've detected that you're not inside the Arena. In order for the script to work properly, run it inside the Arena so that you can access the AutoFarm functions, for example."
    Content.Font = Enum.Font.Gotham
    Content.TextScaled = true
    Content.TextColor3 = Color3.fromRGB(220, 220, 220)
    Content.TextWrapped = true
    Content.TextYAlignment = Enum.TextYAlignment.Top
    Content.Parent = NotificationFrame
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(0, 120, 0, 30)
    Button.Position = UDim2.new(0.5, -60, 1, -40)
    Button.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
    Button.BorderSizePixel = 0
    Button.Text = "Ok!"
    Button.Font = Enum.Font.GothamBold
    Button.TextSize = 20
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.TextTransparency = 0
    Button.Parent = NotificationFrame
    local UICornerButton = Instance.new("UICorner")
    UICornerButton.CornerRadius = UDim.new(0, 8)
    UICornerButton.Parent = Button
    local UIStrokeButton = Instance.new("UIStroke")
    UIStrokeButton.Thickness = 1.5
    UIStrokeButton.Color = Color3.fromRGB(0, 140, 220)
    UIStrokeButton.Transparency = 0.3
    UIStrokeButton.Parent = Button
    local TweenService = game:GetService("TweenService")
    Button.MouseEnter:Connect(function()
        TweenService:Create(Button, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Size = UDim2.new(0, 125, 0, 32)}):Play()
    end)
    Button.MouseLeave:Connect(function()
        TweenService:Create(Button, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Size = UDim2.new(0, 120, 0, 30)}):Play()
    end)
    local function CloseNotification()
        TweenService:Create(NotificationFrame, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
            Size = UDim2.new(0, 0, 0, 0),
            Position = UDim2.new(0.5, 0, 0.5, 0)
        }):Play()
        wait(0.4)
        BlurEffect:Destroy()
        NotificationFrame:Destroy()
    end
    Button.MouseButton1Click:Connect(function()
        Button.Visible = false
        CloseNotification()
    end)
else
    local saveSettings = false
    local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Lmy-77/InfinityX/refs/heads/scripts/games/AnimeMania/Notification/source.lua", true))()
    local engine = loadstring(game:HttpGet("https://raw.githubusercontent.com/Singularity5490/rbimgui-2/main/rbimgui-2.lua"))()
    local window1 = engine.new({
        text = "Inifnity X - Anime Mania",
        size = UDim2.new(300, 200),
    })
    window1.open()

    local tab1 = window1.new({
        text = "AutoFarm",
    })
    local tab2 = window1.new({
        text = "Settings",
    })


    local switch1 = tab1.new("switch", {
        text = "Teleport to mob";
    })
    switch1.event:Connect(function(bool)
        farm = bool
        if saveSettings then
            if not isfile('InfinityX/Settings/6284881984/switch1.lua') then
                writefile('InfinityX/Settings/6284881984/switch1.lua', tostring(farm))
            elseif isfile('InfinityX/Settings/6284881984/switch1.lua') then
                writefile('InfinityX/Settings/6284881984/switch1.lua', tostring(farm))
            end
        end
        while farm do task.wait()
            for _, v in pairs(workspace.Living:GetChildren()) do
                if v:IsA('Model') and not game.Players:FindFirstChild(v.Name) then
                    if v:FindFirstChild('HumanoidRootPart') then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 5.5, 0) * CFrame.Angles(math.rad(270), 0, 0)
                    end
                end
            end
        end
    end)
    local switch2 = tab1.new("switch", {
        text = "Use skills + m1";
    })
    switch2.event:Connect(function(bool)
        skills = bool
        if saveSettings then
            if not isfile('InfinityX/Settings/6284881984/switch2.lua') then
                writefile('InfinityX/Settings/6284881984/switch2.lua', tostring(skills))
            elseif isfile('InfinityX/Settings/6284881984/switch2.lua') then
                writefile('InfinityX/Settings/6284881984/switch2.lua', tostring(skills))
            end
        end
        while skills do task.wait()
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Input"):FireServer({'Light'}, false)
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Input"):FireServer({'Skill', 1})
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Input"):FireServer({'Skill', 2})
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Input"):FireServer({'Skill', 3})
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Input"):FireServer({'Skill', 4})
        end
    end)
    local switch6 = tab1.new("switch", {
        text = "Auto team assist";
    })
    switch6.event:Connect(function(bool)
        assist = bool
        if saveSettings then
            if not isfile('InfinityX/Settings/6284881984/switch6.lua') then
                writefile('InfinityX/Settings/6284881984/switch6.lua', tostring(assist))
            elseif isfile('InfinityX/Settings/6284881984/switch6.lua') then
                writefile('InfinityX/Settings/6284881984/switch6.lua', tostring(assist))
            end
        end
        while assist do task.wait()
            local args = {
                [1] = {
                    [1] = "Skill",
                    [2] = "TeamAssist"
                }
            }
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Input"):FireServer(unpack(args))
        end
    end)
    local switch5 = tab1.new("switch", {
        text = "Auto Replay (in dev)";
    })
    switch5.event:Connect(function(bool)
        replay = bool
        if saveSettings then
            if not isfile('InfinityX/Settings/6284881984/switch5.lua') then
                writefile('InfinityX/Settings/6284881984/switch5.lua', tostring(replay))
            elseif isfile('InfinityX/Settings/6284881984/switch5.lua') then
                writefile('InfinityX/Settings/6284881984/switch5.lua', tostring(replay))
            end
        end
        while replay do task.wait()
            print('In dev')
        end
    end)
    local switch3 = tab1.new("switch", {
        text = "God mode";
    })
    switch3.event:Connect(function(bool)
        godm = bool
        if saveSettings then
            if not isfile('InfinityX/Settings/6284881984/switch3.lua') then
                writefile('InfinityX/Settings/6284881984/switch3.lua', tostring(godm))
            elseif isfile('InfinityX/Settings/6284881984/switch3.lua') then
                writefile('InfinityX/Settings/6284881984/switch3.lua', tostring(godm))
            end
        end
        while godm do task.wait()
            local clCheck = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("clCheck")
            local character = game:GetService("Players").LocalPlayer.Character or game:GetService("Players").LocalPlayer.CharacterAdded:Wait()
            local humanoid = character:FindFirstChildWhichIsA("Humanoid")
            if humanoid and humanoid.Health ~= 0 then
                clCheck:InvokeServer('Dash')
            end
        end
    end)


    local switch4 = tab2.new("switch", {
        text = "Save settings";
    })
    switch4.event:Connect(function(bool)
        saveSettings = bool
        if saveSettings then
            if not isfile('InfinityX/Settings/6284881984/switch4.lua') then
                writefile('InfinityX/Settings/6284881984/switch4.lua', 'true')
            elseif isfile('InfinityX/Settings/6284881984/switch4.lua') then
                writefile('InfinityX/Settings/6284881984/switch4.lua', 'true')
            end
        end
        if not saveSettings then
            if not isfile('InfinityX/Settings/6284881984/switch4.lua') then
                writefile('InfinityX/Settings/6284881984/switch4.lua', 'false')
            elseif isfile('InfinityX/Settings/6284881984/switch4.lua') then
                writefile('InfinityX/Settings/6284881984/switch4.lua', 'false')
            end
        end
    end)
    local switch7 = tab2.new("switch", {
        text = "Anti afk";
    })
    switch7.event:Connect(function(bool)
        afk = bool
        if saveSettings then
            if not isfile('InfinityX/Settings/6284881984/switch7.lua') then
                writefile('InfinityX/Settings/6284881984/switch7.lua', tostring(afk))
            elseif isfile('InfinityX/Settings/6284881984/switch7.lua') then
                writefile('InfinityX/Settings/6284881984/switch7.lua', tostring(afk))
            end
        end
        if afk then
            local VirtualUser = game:GetService("VirtualUser")
            game:GetService("Players").LocalPlayer.Idled:Connect(function()
                VirtualUser:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
                task.wait(1)
                VirtualUser:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
            end)
        end
    end)
    local label1 = tab2.new("label", {
        text = "",
        color = Color3.new(1, 1, 1),
    })
    local label2 = tab2.new("label", {
        text = "--         AntiCheater Bypass         --",
        color = Color3.new(1, 1, 1),
    })
    local button1 = tab2.new("button", {
        text = " Remove remote event (recommended) ",
    })
    button1.event:Connect(function()
        local pressed = false
        if not pressed then
            local remoteName = "Ban"
            local mt = getrawmetatable(game)

            setreadonly(mt, false)
            local oldNamecall = mt.__namecall
            mt.__namecall = newcclosure(function(self, ...)
                local method = getnamecallmethod()
                if method == "FireServer" and tostring(self) == remoteName then
                    return
                end
                return oldNamecall(self, ...)
            end)
            setreadonly(mt, true)
            pressed = true
        end
    end)
    local button2 = tab2.new("button", {
        text = " Remove kick + remote event ",
    })
    button2.event:Connect(function()
        local IsOnMobile = table.find({Enum.Platform.IOS, Enum.Platform.Android}, UserInputService:GetPlatform())
        if IsOnMobile then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Lmy-77/InfinityX/refs/heads/scripts/games/AnimeMania/Notification/support.lua", true))()
        else
            library:Notify(
                'WARING',
                'By executing this function you will also have the function above being executed, but be careful, because by executing this function you will be safer, but some codes like god mode may end up not working over time because of the hook in the localscript. So use with caution.'
            )
        end
    end)
    tab1.show()


    if not isfile('InfinityX/Settings/6284881984/switch4.lua') then
        warn('This file was not found')
    else
        if readfile('InfinityX/Settings/6284881984/switch4.lua') == 'true' then
            switch4.set(true)
            if readfile('InfinityX/Settings/6284881984/switch1.lua') == 'true' then
                switch1.set(true)
            end
            if readfile('InfinityX/Settings/6284881984/switch2.lua') == 'true' then
                switch2.set(true)
            end
            if readfile('InfinityX/Settings/6284881984/switch3.lua') == 'true' then
                switch3.set(true)
            end
            if readfile('InfinityX/Settings/6284881984/switch5.lua') == 'true' then
                switch5.set(true)
            end
            if readfile('InfinityX/Settings/6284881984/switch6.lua') == 'true' then
                switch6.set(true)
            end
            if readfile('InfinityX/Settings/6284881984/switch7.lua') == 'true' then
                switch6.set(true)
            end
        end
    end
end
