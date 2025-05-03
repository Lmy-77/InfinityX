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



-- source
local function moveMouseAndClick(button)
    if button then
        local buttonPosition = button.AbsolutePosition
        local buttonSize = button.AbsoluteSize
        local centerX = buttonPosition.X + (buttonSize.X / 2)
        local centerY = buttonPosition.Y + (buttonSize.Y / 2)

        mousemoveabs(centerX, centerY)
        mouse1click()
    end
end
local placeIds = {
    Main = 6284881984,
    Arena = 6314042276
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
elseif game.PlaceId == placeIds.Arena then
    local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Lmy-77/InfinityX/refs/heads/scripts/games/AnimeMania/Notification/source.lua", true))()
    local SourceURL = 'https://github.com/depthso/Roblox-ImGUI/raw/main/ImGui.lua'
    ImGui = loadstring(game:HttpGet(SourceURL))()


    local Window = ImGui:CreateWindow({ 
        Title = "InfinityX - Anime Mania",
        Size = UDim2.new(0, 420, 0, 310),
        Position = UDim2.new(0.5, 0, 0, 70),
        BackgroundTransparency = 0.2,
        NoResize = true
    })
    local Tab1 = Window:CreateTab({
        Name = "AutoFarm"
    })
    local Table1 = Tab1:Table({
        RowBackground = true,
        Border = true,
        RowsFill = false,
        Size = UDim2.fromScale(1, 0)
    })
    local Tab2 = Window:CreateTab({
        Name = "Settings"
    })
    local Table2 = Tab2:Table({
        RowBackground = true,
        Border = true,
        RowsFill = false,
        Size = UDim2.fromScale(1, 0)
    })
    Window:Center()
    Window:ShowTab(Tab1)


    local switch1 = Tab1:Checkbox({
        Label = "Teleport to mob",
        Value = false,
        Callback = function(self, bool)
            farm = bool
            while farm do task.wait()
                for _, v in pairs(workspace.Living:GetChildren()) do
                    if v:IsA('Model') and not game.Players:FindFirstChild(v.Name) then
                        if v:FindFirstChild('HumanoidRootPart') then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0, 5.5, 0) * CFrame.Angles(math.rad(270), 0, 0)
                        end
                    end
                end
            end
        end,
    })
    local switch2 = Tab1:Checkbox({
        Label = "Use skills + m1",
        Value = false,
        Callback = function(self, bool)
            skills = bool
            while skills do task.wait()
                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Input"):FireServer({'Light'}, false)
                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Input"):FireServer({'Skill', 1})
                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Input"):FireServer({'Skill', 2})
                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Input"):FireServer({'Skill', 3})
                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Input"):FireServer({'Skill', 4})
            end
        end,
    })
    local switch6 = Tab1:Checkbox({
        Label = "Auto team assist",
        Value = false,
        Callback = function(self, bool)
            assist = bool
            while assist do task.wait()
                local args = {
                    [1] = {
                        [1] = "Skill",
                        [2] = "TeamAssist"
                    }
                }
                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Input"):FireServer(unpack(args))
            end
        end,
    })
    local switch5 = Tab1:Checkbox({
        Label = "Auto replay",
        Value = false,
        Callback = function(self, bool)
            replay = bool
            game.Players.LocalPlayer.PlayerGui.ChildAdded:Connect(function(child)
                if replay then
                    if child:IsA('ScreenGui') and child.Name == 'Result' then
                        for _, v in pairs(child:GetDescendants()) do
                            if v:IsA('ImageButton') and v.Name == 'Replay' then
                                v.Size = UDim2.new(10, 0, 10, 0)
                                moveMouseAndClick(v)
                            end
                        end
                    end
                end
            end)
        end,
    })
    local switch3 = Tab1:Checkbox({
        Label = "God mode",
        Value = false,
        Callback = function(self, bool)
            godm = bool
            while godm do task.wait()
                local clCheck = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("clCheck")
                local character = game:GetService("Players").LocalPlayer.Character or game:GetService("Players").LocalPlayer.CharacterAdded:Wait()
                local humanoid = character:FindFirstChildWhichIsA("Humanoid")
                if humanoid and humanoid.Health ~= 0 then
                    clCheck:InvokeServer('Dash')
                end
            end
        end,
    })
    Tab1:Button({
        Text = "Reedem all codes",
        CornerRadius = UDim.new(0.20, 0),
        Callback = function()
            local codes = {'WelcomeNewAnimeManiaPlayers!', 'THANKSFOR175KLIKES', 'SOLOLEVELINGBUFFS', 'MONEYMONEY', 'FIRSTFREECODE'}
            for _, v in ipairs(codes) do
                local args = {
                    [1] = v
                }
                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("SubmitCode"):InvokeServer(unpack(args))
                task.wait(0.5)
            end
        end,
    })
    Tab1:Label({
        Text = ''
    })
    Tab1:Combo({
        Placeholder = "Select the number of characters",
        Label = "",
        Items = {'1', '2', '3'},
        Callback = function(self, Value)
            numbersOfCharacters = Value
        end,
    })
    Tab1:Combo({
        Placeholder = "Select the character",
        Label = "",
        Items = {'1', '2', '3'},
        Callback = function(self, Value)
            characterSelected = Value
        end,
    })
    local Row1 = Tab1:Row()
    Row1:Checkbox({
        Label = "Auto select",
        Value = false,
        Callback = function(self, bool)
            autoSelect = bool
            if autoSelect then
                print(numbersOfCharacters)
                print(characterSelected)
            end
            game.Players.LocalPlayer.PlayerGui.ChildAdded:Connect(function(child)
                if autoSelect then
                    if child:IsA('ScreenGui') and child.Name == 'SelectedCharacter' then
                        wait(0.5)
                        child.LocalScript.Disabled = true

                        if numbersOfCharacters == '1' then
                            if characterSelected == '1' then
                                wait(1.5)
                                local button1 = child.Characters:GetChildren()[3]
                                button1.Size = UDim2.new(10, 0, 10, 0)
                                moveMouseAndClick(button1)
                            end
                        end

                        if numbersOfCharacters == '2' then
                            if characterSelected == '1' then
                                wait(1.5)
                                local button1 = child.Characters:GetChildren()[3]
                                button1.Size = UDim2.new(10, 0, 10, 0)
                                moveMouseAndClick(button1)
                            end
                            if characterSelected == '2' then
                                wait(1.5)
                                local button1 = child.Characters:GetChildren()[4]
                                button1.Size = UDim2.new(10, 0, 10, 0)
                                moveMouseAndClick(button1)
                            end
                        end

                        if numbersOfCharacters == '3' then
                            if characterSelected == '1' then
                                wait(1.5)
                                local button1 = child.Characters:GetChildren()[3]
                                button1.Size = UDim2.new(10, 0, 10, 0)
                                moveMouseAndClick(button1)
                            end
                            if characterSelected == '2' then
                                wait(1.5)
                                local button1 = child.Characters:GetChildren()[4]
                                button1.Size = UDim2.new(10, 0, 10, 0)
                                moveMouseAndClick(button1)
                            end
                            if characterSelected == '3' then
                                wait(1.5)
                                local button1 = child.Characters:GetChildren()[5]
                                button1.Size = UDim2.new(10, 0, 10, 0)
                                moveMouseAndClick(button1)
                            end
                        end
                    end
                end
            end)
        end,
    })
    Row1:Label({
        Text = '   |'
    })
    Row1:Button({
        Text = "How to use",
        CornerRadius = UDim.new(0.20, 0),
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Lmy-77/InfinityX/refs/heads/scripts/games/AnimeMania/Notification/HowToUse.lua", true))()
        end,
    })


    local switch7 = Tab2:Checkbox({
        Label = "Anti afk",
        Value = false,
        Callback = function(self, bool)
            afk = bool
            if afk then
                local VirtualUser = game:GetService("VirtualUser")
                game:GetService("Players").LocalPlayer.Idled:Connect(function()
                    VirtualUser:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
                    task.wait(1)
                    VirtualUser:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
                end)
            end
        end,
    })
    local row2 = Tab2:Row()
    local switch8 = row2:Checkbox({
        Label = "Auto bypass",
        Value = false,
        Callback = function(self, Value)
            savebypass = Value
            if savebypass then
                if not isfile('InfinityX/Settings/save_bypass.lua') then
                    writefile('InfinityX/Settings/save_bypass.lua', 'true')
                elseif isfile('InfinityX/Settings/save_bypass.lua') then
                    writefile('InfinityX/Settings/save_bypass.lua', 'true')
                end
                print('Bypass executed')
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Lmy-77/InfinityX/refs/heads/scripts/games/AnimeMania/Bypass.lua", true))()
            end
        end,
    })
    row2:Label({
        Text = '   |'
    })
    row2:Button({
        Text = "Deleted save settings",
        CornerRadius = UDim.new(0.20, 0),
        Callback = function()
            delfile('InfinityX/Settings/save_bypass.lua')
        end,
    })
    Tab2:Label({
        Text = ''
    })
    Tab2:Label({
        Text = '--// AntiCheater Bypass Manual',
    })
    Tab2:Button({
        Text = "Bypass (remote)",
        CornerRadius = UDim.new(0.20, 0),
        Callback = function()
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
        end,
    })
    Tab2:Button({
        Text = "Bypass (all)",
        CornerRadius = UDim.new(0.20, 0),
        Callback = function()
            library:Notify(
                'WARING',
                'Are you sure you want to run this function? This function will remove the kick and remote event from the game.'
            )
        end,
    })


    local IsOnMobile = table.find({Enum.Platform.IOS, Enum.Platform.Android}, game:GetService('UserInputService'):GetPlatform())
    if IsOnMobile then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Lmy-77/InfinityX/refs/heads/main/Software/button.lua"))()
    end
    game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        if input.KeyCode == Enum.KeyCode.K then
            for _, v in pairs(game:GetService('CoreGui'):GetDescendants()) do
                if v:IsA('Frame') and v.Name == 'Window_' then
                    if v.Visible == true then
                        v.Visible = false
                    elseif v.Visible == false then
                        v.Visible = true
                    end
                end
            end
        end
    end)


    wait(2)
    if not isfile('InfinityX/Settings/save_bypass.lua') then
        warn('File does not exist')
    elseif isfile('InfinityX/Settings/save_bypass.lua') then
        if readfile('InfinityX/Settings/save_bypass.lua') == 'true' then
            switch8:SetTicked(true)
            print('Bypass executed')
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Lmy-77/InfinityX/refs/heads/scripts/games/AnimeMania/Bypass.lua", true))()
        end
    end
end



warn('[InfinityX] - Loaded!')
