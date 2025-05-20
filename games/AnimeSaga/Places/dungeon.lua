-- variables
local healthSettings = {
  SelectedHealth = 50
}
function getCreate()
  for _, v in pairs(workspace.Enemy.Crate:GetChildren()) do
    if v:IsA('Model') then
      return v
    end
  end
end
function getHealth()
  for _, v in pairs(game:GetService("Players").LocalPlayer.CharValue:GetChildren()) do
    if v:IsA('Folder') then
      if v.Health.Value ~= 0 then
        return v.Health.Value
      end
    end
  end
end
local KeyPress = function(v)
  game:GetService("VirtualInputManager"):SendKeyEvent(true, v, true, game)
  wait(.1)
  game:GetService("VirtualInputManager"):SendKeyEvent(true, v, false, game)
end
function gradient(text, startColor, endColor)
  local result = ""
  local length = #text
  for i = 1, length do
      local t = (i - 1) / math.max(length - 1, 1)
      local r = math.floor((startColor.R + (endColor.R - startColor.R) * t) * 255)
      local g = math.floor((startColor.G + (endColor.G - startColor.G) * t) * 255)
      local b = math.floor((startColor.B + (endColor.B - startColor.B) * t) * 255)
      local char = text:sub(i, i)
      result = result .. "<font color=\"rgb(" .. r ..", " .. g .. ", " .. b .. ")\">" .. char .. "</font>"
  end
  return result
end
function GetSize()
  if game:GetService('UserInputService').TouchEnabled and not game:GetService('UserInputService').KeyboardEnabled and not game:GetService('UserInputService').MouseEnabled then
      return UDim2.fromOffset(600, 350)
  else
      return UDim2.fromOffset(830, 525)
  end
end
scriptVersion = "3.2a"



-- ui library
local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

WindUI:Popup({
  Title = "Welcome to " .. gradient("InfinityX", Color3.fromRGB(129, 63, 214), Color3.fromRGB(63, 61, 204)),
  Icon = "info",
  Content = game.Players.LocalPlayer.Name .. " I hope you enjoy the experience\nHave fun!",
  Buttons = {
      {
          Title = "Cancel",
          --Icon = "",
          Callback = function() end,
          Variant = "Tertiary",
      },
      {
          Title = "Continue",
          Icon = "arrow-right",
          Callback = function() Confirmed = true end,
          Variant = "Primary",
      }
  }
})

repeat wait() until Confirmed

local Window = WindUI:CreateWindow({
  Title = "InfinityX - "..scriptVersion,
  Icon = "rbxassetid://126527122577864",
  Author = game:GetService('MarketplaceService'):GetProductInfo(game.PlaceId).Name,
  Folder = "CloudHub",
  Size = GetSize(),
  Transparent = false,
  Theme = "Dark",
  SideBarWidth = 180,
  Background = "",
  User = {
      Enabled = true,
      Anonymous = false,
      Callback = function()
          print("clicked")
      end,
  },
})
Window:EditOpenButton({
  Title = "Click here to open "..gradient("InfinityX", Color3.fromRGB(129, 63, 214), Color3.fromRGB(63, 61, 204)),
  Icon = "monitor",
  CornerRadius = UDim.new(0,16),
  StrokeThickness = 1.5,
  Color = ColorSequence.new(
    Color3.fromRGB(129, 63, 214),
    Color3.fromRGB(63, 61, 204)
  ),
  Enabled = true,
  Dragable = false,
})
local Tabs = {
  Farm = Window:Tab({
    Title = "| Farm Options",
    Icon = "crosshair",
    Desc = "Farm tab",
  }),
}
Window:SelectTab(1)



-- source
local Section = Tabs.Farm:Section({
  Title = "Farm Options",
  TextXAlignment = "Center",
  TextSize = 17,
})
local Toggle = Tabs.Farm:Toggle({
  Title = "Auto play",
  Desc = "Move near mobs to farm",
  Icon = "check",
  Value = false,
  Callback = function(state)
    farm = state
    local TweenService = game:GetService("TweenService")
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")

    local mobsFolder = workspace:WaitForChild("Enemy"):WaitForChild("Mob")

    local function getTargetMob()
      for _, mob in ipairs(mobsFolder:GetChildren()) do
        local hum = mob:FindFirstChild("Humanoid")
        if hum and hum.Health > 0 then
          return mob
        end
      end
    end

    local function safeTweenTo(pos)
      local goal = {CFrame = CFrame.new(pos)}
      local info = TweenInfo.new(0, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
      local tween = TweenService:Create(HumanoidRootPart, info, goal)
      tween:Play()
    end

    while farm do task.wait()
      if getHealth() > healthSettings.SelectedHealth then
        local mob = getTargetMob()
        if mob and mob:FindFirstChild("HumanoidRootPart") then
          local mobPos = mob.HumanoidRootPart.Position
          local behindPos = mobPos - mob.HumanoidRootPart.CFrame.LookVector * 3 + Vector3.new(0, 0.5, 0)
          safeTweenTo(behindPos)
        end
      end
    end
  end,
})
local Toggle = Tabs.Farm:Toggle({
  Title = "Auto punch",
  Desc = "Activate to punch automatically",
  Icon = "check",
  Value = false,
  Callback = function(state)
    punch = state
    while punch do task.wait(.5)
      game:GetService("VirtualInputManager"):SendMouseButtonEvent(0, 0, 0, true, game, 0)
      game:GetService("VirtualInputManager"):SendMouseButtonEvent(0, 0, 0, false, game, 0)
    end
  end,
})
local Toggle = Tabs.Farm:Toggle({
  Title = "Auto skills",
  Desc = "Activate to use skills automatically",
  Icon = "check",
  Value = false,
  Callback = function(state)
    skills = state
    while skills do task.wait()
      KeyPress('Z')
      KeyPress('X')
      KeyPress('C')
      KeyPress('V')
    end
  end,
})
local Toggle = Tabs.Farm:Toggle({
  Title = "No stun",
  Desc = "Activate to not get stunned",
  Icon = "check",
  Value = false,
  Callback = function(state)
    stun = state
    while stun do task.wait()
      if game.Players.LocalPlayer.Character.Skill.Value == true then
        game.Players.LocalPlayer.Character.Skill.Value = false
      end
    end
  end,
})
local Section = Tabs.Farm:Section({
  Title = "Auto Health",
  TextXAlignment = "Center",
  TextSize = 17,
})
local Toggle = Tabs.Farm:Toggle({
  Title = "Auto health",
  Desc = "Activate to regenerate health automatically",
  Icon = "check",
  Value = false,
  Callback = function(state)
    health = state
    local TweenService = game:GetService("TweenService")
    local HumanoidRootPart = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
    local function safeTweenTo(pos)
      local goal = {CFrame = CFrame.new(pos)}
      local info = TweenInfo.new(0, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
      local tween = TweenService:Create(HumanoidRootPart, info, goal)
      tween:Play()
    end

    while health do task.wait()
      if getHealth() <= healthSettings.SelectedHealth then
        local healPotion = workspace.Potion:FindFirstChild('Heal')
        if not healPotion then
          local cratePos = getCreate().HumanoidRootPart.Position
          safeTweenTo(cratePos)
        else
          for _, v in pairs(workspace.Potion:GetChildren()) do
            if v:IsA('Model') and v.Name == 'Heal' then
              safeTweenTo(v.RootPart.Position)
              KeyPress('F')
            end
          end
        end
      end
    end
  end,
})
local Slider = Tabs.Farm:Slider({
  Title = "Set min health",
  Step = 1,
  Value = {
      Min = 0,
      Max = 100,
      Default = 50,
  },
  Callback = function(value)
    healthSettings.SelectedHealth = value
    print(healthSettings.SelectedHealth)
  end
})
local Section = Tabs.Farm:Section({
  Title = "Misc",
  TextXAlignment = "Center",
  TextSize = 17,
})
local Toggle = Tabs.Farm:Toggle({
  Title = "Auto replay",
  Desc = "This function is still under development",
  Icon = "check",
  Value = false,
  Callback = function(state)

  end,
})
local Toggle = Tabs.Farm:Toggle({
  Title = "Auto next",
  Desc = "This function is still under development",
  Icon = "check",
  Value = false,
  Callback = function(state)

  end,
})
