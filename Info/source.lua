local UiLibrary = {}
UiLibrary.__index = UiLibrary

function UiLibrary:CreateWindow(titleText)
    local self = setmetatable({}, UiLibrary)

    local Gui = Instance.new("ScreenGui", game.CoreGui)
    Gui.IgnoreGuiInset = true
    Gui.ResetOnSpawn = false

    local Background = Instance.new("Frame", Gui)
    Background.Size = UDim2.new(1, 0, 1, 0)
    Background.BackgroundColor3 = Color3.fromRGB(15, 15, 15)

    for i = 1, 50 do
        local dot = Instance.new("Frame", Background)
        dot.Size = UDim2.new(0, math.random(2, 4), 0, math.random(2, 4))
        dot.Position = UDim2.new(math.random(), 0, math.random(), 0)
        dot.BackgroundColor3 = Color3.fromRGB(56, 255, 255)
        dot.BackgroundTransparency = 0.65
        dot.BorderSizePixel = 0

        game:GetService("TweenService"):Create(dot, TweenInfo.new(8, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, -1, true), {
            Position = dot.Position + UDim2.new(0, 0, -0.2, 0),
            BackgroundTransparency = 1
        }):Play()
    end

    local Main = Instance.new("Frame", Background)
    Main.AnchorPoint = Vector2.new(0.5, 0.5)
    Main.Position = UDim2.new(0.5, 0, 0.5, 0)
    Main.Size = UDim2.new(0, 380, 0, 90)
    Main.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 6)

    local scale = Instance.new("UIScale", Main)
    scale.Scale = 1

    local isMobile = game:GetService("UserInputService").TouchEnabled
    if isMobile then
        scale.Scale = 0.85
    end

    local Title = Instance.new("TextLabel", Main)
    Title.Text = titleText
    Title.Font = Enum.Font.GothamBold
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 18
    Title.Size = UDim2.new(1, 0, 0, 25)
    Title.Position = UDim2.new(0, 0, 0, 6)
    Title.BackgroundTransparency = 1

    local Container = Instance.new("Frame", Main)
    Container.Position = UDim2.new(0, 0, 0, 35)
    Container.Size = UDim2.new(1, 0, 1, -45)
    Container.BackgroundTransparency = 1
    Container.ClipsDescendants = true

    local Padding = Instance.new("UIPadding", Container)
    Padding.PaddingLeft = UDim.new(0, 10)
    Padding.PaddingRight = UDim.new(0, 10)

    local layout = Instance.new("UIListLayout", Container)
    layout.Padding = UDim.new(0, 10)
    layout.FillDirection = Enum.FillDirection.Vertical
    layout.SortOrder = Enum.SortOrder.LayoutOrder

    function self:AddInfo(title, value, color, options)
      options = options or {}
      local align = options.align or "left"
      local addDivider = options.divider or false

      local Row = Instance.new("Frame", Container)
      Row.Size = UDim2.new(1, 0, 0, 40)
      Row.BackgroundTransparency = 1

      local Box = Instance.new("Frame", Row)
      Box.Size = UDim2.new(1, 0, 0, 40)
      Box.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
      Instance.new("UICorner", Box).CornerRadius = UDim.new(0, 4)

      local T = Instance.new("TextLabel", Box)
      T.Text = title
      T.Font = Enum.Font.GothamSemibold
      T.TextColor3 = Color3.fromRGB(170, 170, 170)
      T.TextSize = 11
      T.Position = UDim2.new(0, 8, 0, 3)
      T.Size = UDim2.new(1, -16, 0, 12)
      T.BackgroundTransparency = 1
      T.TextXAlignment = align == "center" and Enum.TextXAlignment.Center or Enum.TextXAlignment.Left

      local V = Instance.new("TextLabel", Box)
      V.Text = tostring(value)
      V.Font = Enum.Font.Gotham
      V.TextColor3 = color or Color3.fromRGB(0, 255, 255)
      V.TextSize = 12
      V.Position = UDim2.new(0, 8, 0, 18)
      V.Size = UDim2.new(1, -16, 0, 18)
      V.BackgroundTransparency = 1
      V.TextXAlignment = align == "center" and Enum.TextXAlignment.Center or Enum.TextXAlignment.Left

      if addDivider then
          local DividerHolder = Instance.new("Frame", Container)
          DividerHolder.Size = UDim2.new(1, 0, 0, 6)
          DividerHolder.BackgroundTransparency = 1

          local Divider = Instance.new("Frame", DividerHolder)
          Divider.AnchorPoint = Vector2.new(0.5, 0.5)
          Divider.Position = UDim2.new(0.5, 0, 0.5, 0)
          Divider.Size = UDim2.new(1, -20, 0, 1)
          Divider.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
          Divider.BorderSizePixel = 0
      end

      task.defer(function()
          Main.Size = UDim2.new(0, 380, 0, Container.UIListLayout.AbsoluteContentSize.Y + 50)
      end)

      local InfoObj = {}
      function InfoObj:Update(newValue)
          V.Text = tostring(newValue)
      end

      return InfoObj
  end

  function self:AddLabel(titleText, align)
    local Row = Instance.new("Frame", Container)
    Row.Size = UDim2.new(1, 0, 0, 30)
    Row.BackgroundTransparency = 1

    local Box = Instance.new("Frame", Row)
    Box.Size = UDim2.new(1, 0, 0, 30)
    Box.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Instance.new("UICorner", Box).CornerRadius = UDim.new(0, 4)

    local T = Instance.new("TextLabel", Box)
    T.Text = titleText
    T.Font = Enum.Font.GothamSemibold
    T.TextColor3 = Color3.fromRGB(200, 200, 200)
    T.TextSize = 12
    T.Position = UDim2.new(0, 8, 0, 6)
    T.Size = UDim2.new(1, -16, 0, 18)
    T.BackgroundTransparency = 1
    T.TextXAlignment = align == "center" and Enum.TextXAlignment.Center or Enum.TextXAlignment.Left
  end

  function self:AddButton(buttonText, textColor, callback)
      local Row = Instance.new("Frame", Container)
      Row.Size = UDim2.new(1, 0, 0, 35)
      Row.BackgroundTransparency = 1

      local Button = Instance.new("TextButton", Row)
      Button.Size = UDim2.new(1, 0, 1, 0)
      Button.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
      Button.Text = buttonText
      Button.TextColor3 = textColor or Color3.fromRGB(255, 255, 255)
      Button.TextSize = 14
      Button.Font = Enum.Font.Gotham
      Button.AutoButtonColor = false

      local UICorner = Instance.new("UICorner", Button)
      UICorner.CornerRadius = UDim.new(0, 4)

      Button.MouseEnter:Connect(function()
          Button.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
      end)
      Button.MouseLeave:Connect(function()
          Button.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
      end)
      Button.MouseButton1Click:Connect(function()
          if callback then
              callback()
          end
      end)

      local BtnObj = {}
      function BtnObj:SetText(newText)
          Button.Text = newText
      end

      return BtnObj
  end

  function self:Destroy()
    if Gui and Gui.Parent then
        Gui:Destroy()
    end
  end

  return self
end

return UiLibrary
