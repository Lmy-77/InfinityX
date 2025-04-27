local InfinityXNotify = {}

function InfinityXNotify:Notify(nottitle, notsubtitle)
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Parent = game.CoreGui

    local NotificationFrame = Instance.new("Frame")
    NotificationFrame.Size = UDim2.new(0, 320, 0, 180)
    NotificationFrame.Position = UDim2.new(0.5, -160, 0.5, -90)
    NotificationFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    NotificationFrame.BorderSizePixel = 0
    NotificationFrame.BackgroundTransparency = 0.05
    NotificationFrame.Parent = ScreenGui

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
    Content.TextSize = 20
    Content.TextColor3 = Color3.fromRGB(200, 200, 200)
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
    Button1.Parent = NotificationFrame

    local Button2 = Instance.new("TextButton")
    Button2.Size = UDim2.new(0, 120, 0, 40)
    Button2.Position = UDim2.new(0.5, 10, 1, -50)
    Button2.BackgroundColor3 = Color3.fromRGB(255, 75, 75)
    Button2.BorderSizePixel = 0
    Button2.Text = "Cancel"
    Button2.Font = Enum.Font.GothamBold
    Button2.TextSize = 20
    Button2.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button2.Parent = NotificationFrame

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

        for k, v in pairs(senv) do
            if typeof(v) == "function" and islclosure(v) then
                hookfunction(v, function(...)
                    local constants = debug.getconstants(v)
                    for _, const in ipairs(constants) do
                        if typeof(const) == "string" and const:lower():find("kick") then
                            return
                        end
                    end
                    return v(...)
                end)
            end
        end
        setreadonly(mt, true)
        NotificationFrame:Destroy()
    end)

    Button2.MouseButton1Click:Connect(function()
        NotificationFrame:Destroy()
    end)
end

return InfinityXNotify
