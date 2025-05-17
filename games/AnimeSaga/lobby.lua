-- variables
local places = {
  Lobby = 17850641257
}
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
  Lobby = Window:Tab({
    Title = "Lobby",
    Icon = "layers",
    Desc = "Lobby tab",
  }),
}
Window:SelectTab(1)



-- source
local Section = Tabs.Lobby:Section({
  Title = "Auto Roll",
  TextXAlignment = "Center",
  TextSize = 17,
})
local rollAmount = nil
local Dropdown = Tabs.Lobby:Dropdown({
  Title = "Select amount",
  Desc = "Select the amount of roll you want",
  Value = "nil",
  Multi = false,
  AllowNone = true,
  Values = {1, 10},
  Callback = function(Options)
    rollAmount = Options
  end
})
local Toggle = Tabs.Lobby:Toggle({
  Title = "Auto roll",
  Desc = "Click here to enable auto roll",
  Icon = "check",
  Value = false,
  Callback = function(state)
    roll = state
    while roll do task.wait()
      local ohNumber1 = rollAmount
      game:GetService("ReplicatedStorage").Event.Summon:FireServer(ohNumber1)
    end
  end,
})
local Section = Tabs.Lobby:Section({
  Title = "Codes",
  TextXAlignment = "Center",
  TextSize = 17,
})
local Button = Tabs.Lobby:Button({
  Title = "Reedem all codes",
  Desc = "Clicl here to reedem all codes",
  Callback = function()
    local codes = {'10MVisits', '200kMembers', 'InBugSagaWeTrust', 'BugSaga', '1MVisits', '50KActive', 'SorryForShutdown', 'SorryForDelay', 'Release'}
    for _, v in pairs(codes) do
      local ohString1 = v
      game:GetService("ReplicatedStorage").Lobby.Codes:FireServer(ohString1)
    end
  end
})
-- game:GetService("ReplicatedStorage").Event.ClaimReward:FireServer()
