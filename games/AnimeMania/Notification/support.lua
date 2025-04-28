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
    Title.Text = "Error"
    Title.TextScaled = true
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 26
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.Parent = NotificationFrame
    local Content = Instance.new("TextLabel")
    Content.Size = UDim2.new(1, -20, 0, 70)
    Content.Position = UDim2.new(0, 10, 0, 55)
    Content.BackgroundTransparency = 1
    Content.Text = "We've detected that you're using mobile support. Unfortunately this function on mobile is not working and depends a lot on the executor, if you want to use this function use it on a computer, if not use the function above and you will have very good security!"
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
