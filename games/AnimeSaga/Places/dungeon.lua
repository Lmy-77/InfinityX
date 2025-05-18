-- variables
local healthSettings = {
  SelectedHealth = '50'
}
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
  Title = "Safe Mob Target",
  Desc = "Move near mobs safely",
  Icon = "check",
  Value = false,
  Callback = function(state)
    farm = state
    local lp = game.Players.LocalPlayer
    local char = lp.Character or lp.CharacterAdded:Wait()
    local hrp = char:WaitForChild("HumanoidRootPart")

    while farm do
        task.wait()
        for _, v in pairs(workspace.Enemy.Mob:GetChildren()) do
            if not farm then break end
            if v:IsA("Model") and not game.Players:FindFirstChild(v.Name) then
                local mobHRP = v:FindFirstChild("HumanoidRootPart")
                if mobHRP then
                    local offset = Vector3.new(3, 0, 3)
                    local targetPos = mobHRP.Position + offset
                    hrp.AssemblyLinearVelocity = Vector3.zero
                    hrp.CFrame = CFrame.new(targetPos, mobHRP.Position)
                end
            end
        end
    end
    hrp.AssemblyLinearVelocity = Vector3.zero
  end,
})
local Toggle = Tabs.Farm:Toggle({
  Title = "Auto punch",
  Desc = "Activate to punch automatically",
  Icon = "check",
  Value = false,
  Callback = function(state)
    punch = state
    while punch do task.wait()
      local senv = getsenv(game:GetService("Players").LocalPlayer.PlayerScripts.Combat)
      local func = senv.Combat()
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
    if not game.Players.LocalPlayer.Character:FindFirstChild('CurrentHealth') then
      local health = game:GetService("Players").LocalPlayer.PlayerGui.ScreenGui.info.bars.HealFrame.Slot1.Text
      local healthNumber = Instance.new('NumberValue')
      healthNumber.Parent = game.Players.LocalPlayer.Character
      healthNumber.Name = "CurrentHealth"
      task.spawn(function() while true do task.wait() healthNumber.Value = tostring(health) end end)
    end
    wait(.2)
    while health do task.wait()
      if game.Players.LocalPlayer.Character.CurrentHealth <= healthSettings.SelectedHealth then
        for _, v in pairs(workspace.Enemy.Crate:GetChildren()) do
          if v:IsA('Model') then
            game.Players.LocalPlayer.Character:PivotTo(v:GetPivot())
          end
        end
      end
    end
  end,
})
