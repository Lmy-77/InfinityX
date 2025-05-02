local InfinityXNotify = {}

function InfinityXNotify:Notify(nottitle, notsubtitle)
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
    Title.Size = UDim2.new(1, 0, 0, 50)
    Title.Position = UDim2.new(0, 0, 0, 0)
    Title.BackgroundTransparency = 1
    Title.Text = nottitle
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 26
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.Parent = NotificationFrame

    local Content = Instance.new("TextLabel")
    Content.Size = UDim2.new(1, -20, 0, 70)
    Content.Position = UDim2.new(0, 10, 0, 55)
    Content.BackgroundTransparency = 1
    Content.Text = notsubtitle
    Content.Font = Enum.Font.Gotham
    Content.TextScaled = true
    Content.TextColor3 = Color3.fromRGB(220, 220, 220)
    Content.TextWrapped = true
    Content.TextYAlignment = Enum.TextYAlignment.Top
    Content.Parent = NotificationFrame

    local Button1 = Instance.new("TextButton")
    Button1.Size = UDim2.new(0, 120, 0, 40)
    Button1.Position = UDim2.new(0.5, -130, 1, -50)
    Button1.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
    Button1.BorderSizePixel = 0
    Button1.Text = "Execute"
    Button1.Font = Enum.Font.GothamBold
    Button1.TextSize = 20
    Button1.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button1.TextTransparency = 0
    Button1.Parent = NotificationFrame

    local UICornerButton1 = Instance.new("UICorner")
    UICornerButton1.CornerRadius = UDim.new(0, 8)
    UICornerButton1.Parent = Button1

    local UIStrokeButton1 = Instance.new("UIStroke")
    UIStrokeButton1.Thickness = 1.5
    UIStrokeButton1.Color = Color3.fromRGB(0, 140, 220)
    UIStrokeButton1.Transparency = 0.3
    UIStrokeButton1.Parent = Button1

    local Button2 = Instance.new("TextButton")
    Button2.Size = UDim2.new(0, 120, 0, 40)
    Button2.Position = UDim2.new(0.5, 10, 1, -50)
    Button2.BackgroundColor3 = Color3.fromRGB(255, 75, 75)
    Button2.BorderSizePixel = 0
    Button2.Text = "Cancel"
    Button2.Font = Enum.Font.GothamBold
    Button2.TextSize = 20
    Button2.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button2.TextTransparency = 0
    Button2.Parent = NotificationFrame

    local UICornerButton2 = Instance.new("UICorner")
    UICornerButton2.CornerRadius = UDim.new(0, 8)
    UICornerButton2.Parent = Button2

    local UIStrokeButton2 = Instance.new("UIStroke")
    UIStrokeButton2.Thickness = 1.5
    UIStrokeButton2.Color = Color3.fromRGB(220, 60, 60)
    UIStrokeButton2.Transparency = 0.3
    UIStrokeButton2.Parent = Button2


    local TweenService = game:GetService("TweenService")

    Button1.MouseEnter:Connect(function()
        TweenService:Create(Button1, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Size = UDim2.new(0, 125, 0, 42)}):Play()
    end)

    Button1.MouseLeave:Connect(function()
        TweenService:Create(Button1, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Size = UDim2.new(0, 120, 0, 40)}):Play()
    end)

    Button2.MouseEnter:Connect(function()
        TweenService:Create(Button2, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Size = UDim2.new(0, 125, 0, 42)}):Play()
    end)

    Button2.MouseLeave:Connect(function()
        TweenService:Create(Button2, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {Size = UDim2.new(0, 120, 0, 40)}):Play()
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

    Button1.MouseButton1Click:Connect(function()
local remoteName = "Ban"
local mt = getrawmetatable(game)
local lscript = game:GetService("Players").LocalPlayer.Backpack:WaitForChild("ClientMain")
local senv = getsenv(lscript)

setreadonly(mt, false)
local oldNamecall = mt.__namecall
mt.__namecall = newcclosure(function(self, ...)
    local method = getnamecallmethod()
    if method == "FireServer" and tostring(self) == remoteName then
        return
    end
    return oldNamecall(self, ...)
end)

hookfunction(game.Players.LocalPlayer.Kick, newcclosure(function(...)
    return nil
end))
mt.__namecall = newcclosure(function(self, ...)
  local method = getnamecallmethod()
  if self == game.Players.LocalPlayer and method == "Kick" then
      return nil
  end
  return oldNamecall(self, ...)
end)
setreadonly(mt, true)
        Button1.Visible = false
        Button2.Visible = false
        CloseNotification()
    end)

    Button2.MouseButton1Click:Connect(function()
        Button1.Visible = false
        Button2.Visible = false
        CloseNotification()
    end)
end

return InfinityXNotify
