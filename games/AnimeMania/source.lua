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
repeat task.wait() until game:IsLoaded()


local placeIds = {
    Main = 6284881984,
}
if game.PlaceId == placeIds.Main then
    local TweenService = game:GetService("TweenService")
    local Notification = Instance.new("ScreenGui")
    local Background = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local UIStroke = Instance.new("UIStroke")
    local Text = Instance.new("TextLabel")
    local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
    local UIAspectRatioConstraint_2 = Instance.new("UIAspectRatioConstraint")
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://8551372796"
    sound.Volume = 10
    sound.Looped = false
    sound.Parent = workspace
    Notification.Name = "Notification"
    Notification.Parent = (game:GetService("CoreGui") or gethui())
    Notification.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    Background.Name = "Background"
    Background.Parent = Notification
    Background.BackgroundColor3 = Color3.fromRGB(79, 79, 79)
    Background.BackgroundTransparency = 1
    Background.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Background.BorderSizePixel = 0
    Background.Position = UDim2.new(0.449, 0, 0.95, 0)
    Background.Size = UDim2.new(0.05, 0, 0.01, 0)
    UICorner.Parent = Background
    UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    UIStroke.Color = Color3.fromRGB(57, 57, 57)
    UIStroke.Thickness = 1.500
    UIStroke.Parent = Background
    Text.Name = "Text"
    Text.Parent = Background
    Text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Text.BackgroundTransparency = 1
    Text.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Text.BorderSizePixel = 0
    Text.Position = UDim2.new(0.05, 0, 0.1, 0)
    Text.Size = UDim2.new(0.9, 0, 0.8, 0)
    Text.Font = Enum.Font.Code
    Text.Text = "Run script in arena"
    Text.TextColor3 = Color3.fromRGB(255, 255, 255)
    Text.TextScaled = true
    Text.TextSize = 16.000
    Text.TextTransparency = 1
    Text.TextWrapped = true
    UIAspectRatioConstraint.Parent = Text
    UIAspectRatioConstraint.AspectRatio = 5.208
    UIAspectRatioConstraint_2.Parent = Background
    UIAspectRatioConstraint_2.AspectRatio = 4.633
    local targetPosition = UDim2.new(0.449, 0, 0.934, 0)
    local targetSize = UDim2.new(0.13, 0, 0.05, 0)
    local backgroundTweenInfo = TweenInfo.new(
        0.1,
        Enum.EasingStyle.Quad,
        Enum.EasingDirection.Out
    )
    local textTweenInfo = TweenInfo.new(
        0.1,
        Enum.EasingStyle.Quad,
        Enum.EasingDirection.Out
    )
    local backgroundTween = TweenService:Create(Background, backgroundTweenInfo, {
        Position = targetPosition,
        Size = targetSize,
        BackgroundTransparency = 0
    })
    local textTween = TweenService:Create(Text, textTweenInfo, {
        TextTransparency = 0
    })
    sound:Play()
    sound.Ended:Connect(function()
        sound:Destroy()
    end)
    backgroundTween:Play()
    backgroundTween.Completed:Connect(function()
        textTween:Play()
    end)
    wait(5)
    Notification:Destroy()
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
    local switch5 = tab1.new("switch", {
        text = "Auto Replay";
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
            print('in dev')
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
        library:Notify(
            'WARING',
            'By executing this function you will also have the function above being executed, but be careful, because by executing this function you will be safer, but some codes like god mode may end up not working over time because of the hook in the localscript. So use with caution.'
        )
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
        end
    end
end
