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



-- variables
function GetGears()
  local gearName = {}
  for _, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Gear_Shop.Frame.ScrollingFrame:GetChildren()) do
    if v:IsA("Frame") and not v.Name:match("_Padding$") and v.Name ~= 'ItemPadding' then
      table.insert(gearName, v.Name)
    end
  end
  return gearName
end
function GetSeed()
  local seedName = {}
  for _, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Seed_Shop.Frame.ScrollingFrame:GetChildren()) do
    if v:IsA("Frame") and not v.Name:match("_Padding$") and v.Name ~= 'ItemPadding' then
      table.insert(seedName, v.Name)
    end
  end
  return seedName
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



-- make library
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
  Icon = "rbxassetid://78609244215270",
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
  AutoFarm = Window:Tab({
    Title = "Auto Farm",
    Icon = "banknote",
    Desc = "AutoFarm tab",
  }),
  Shop = Window:Tab({
    Title = "Shop",
    Icon = "hand-coins",
    Desc = "Shop tab",
  }),
  LPlayer = Window:Tab({
    Title = "Character",
    Icon = "user",
    Desc = "Character tab",
  }),
}
Window:SelectTab(1)



-- source
local Section = Tabs.AutoFarm:Section({
  Title = "Farm Options",
  TextXAlignment = "Center",
  TextSize = 17,
})
local Toggle = Tabs.AutoFarm:Toggle({
  Title = "Auto plant",
  Desc = "Activate to plant all your plants",
  Icon = "check",
  Value = false,
  Callback = function(state)
    plant = state
    while plant do task.wait()
      for _, v in pairs(workspace.Farm:GetDescendants()) do
        if v:IsA('StringValue') and v.Value == game.Players.LocalPlayer.Name then
          for _, tool in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
              if tool:IsA('Tool') and tool.Name:lower():find('seed') then
                  game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
                  task.wait(0.1)
              end
          end
          local equipped = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
          if equipped then
              local name = equipped.Name
              local crop = name:match("^(%w+)%s+Seed")
              if crop then
                  local plantPosition = v.Parent.Parent.Plant_Locations.Can_Plant.Position
                  local ohVector31 = Vector3.new(plantPosition.X, plantPosition.Y, plantPosition.Z)
                  local ohString2 = crop
                  game:GetService("ReplicatedStorage").GameEvents.Plant_RE:FireServer(ohVector31, ohString2)
              end
          end
        end
      end
    end
  end,
})
local Toggle = Tabs.AutoFarm:Toggle({
  Title = "Auto collect",
  Desc = "Activate to collect all your plants",
  Icon = "check",
  Value = false,
  Callback = function(state)
    collect = state
    if collect then
      for _, v in pairs(workspace.Farm:GetDescendants()) do
        if v:IsA('StringValue') and v.Value == game.Players.LocalPlayer.Name then
          for _, x in pairs(v.Parent.Parent.Plants_Physical:GetDescendants()) do
            if x:IsA('ProximityPrompt') and x.Name == 'ProximityPrompt' then
              x.MaxActivationDistance = math.huge
            end
          end
        end
      end
    end
    while collect do task.wait()
      for _, v in pairs(workspace.Farm:GetDescendants()) do
        if v:IsA('StringValue') and v.Value == game.Players.LocalPlayer.Name then
          for _, x in pairs(v.Parent.Parent.Plants_Physical:GetDescendants()) do
            if x:IsA('ProximityPrompt') and x.Name == 'ProximityPrompt' then
              game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = x.Parent.CFrame
              x.MaxActivationDistance = math.huge
              fireproximityprompt(x)
            end
          end
        end
      end
    end
  end,
})
local Toggle = Tabs.AutoFarm:Toggle({
  Title = "Auto sell",
  Desc = "Activate to auto sell your plants",
  Icon = "check",
  Value = false,
  Callback = function(state)
    sell = state
    while sell do task.wait()
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(62, 3, 0)
      game:GetService("ReplicatedStorage"):WaitForChild("GameEvents"):WaitForChild("Sell_Inventory"):FireServer()
    end
  end,
})
local Section = Tabs.Shop:Section({
  Title = "Buy Gears",
  TextXAlignment = "Center",
  TextSize = 17,
})
local Dropdown = Tabs.Shop:Dropdown({
  Title = "Select gear",
  Desc = "Select the gear you want to buy",
  Value = "nil",
  Multi = false,
  AllowNone = true,
  Values = GetGears(),
  Callback = function(Options)
    gearSelected = Options
  end
})
local Button = Tabs.Shop:Button({
  Title = "Buy gear",
  Callback = function()
    local ohString1 = gearSelected
    game:GetService("ReplicatedStorage").GameEvents.BuyGearStock:FireServer(ohString1)
  end
})
local Section = Tabs.Shop:Section({
  Title = "Buy Seeds",
  TextXAlignment = "Center",
  TextSize = 17,
})
local Dropdown = Tabs.Shop:Dropdown({
  Title = "Select seed",
  Desc = "Select the seed you want to buy",
  Value = "nil",
  Multi = false,
  AllowNone = true,
  Values = GetSeed(),
  Callback = function(Options)
    seedSelected = Options
  end
})
local Button = Tabs.Shop:Button({
  Title = "Buy seed",
  Callback = function()
    local ohString1 = seedSelected
    game:GetService("ReplicatedStorage").GameEvents.BuySeedStock:FireServer(ohString1)
  end
})
local Section = Tabs.Shop:Section({
  Title = "Buy Eggs",
  TextXAlignment = "Center",
  TextSize = 17,
})
local Dropdown = Tabs.Shop:Dropdown({
  Title = "Select egg",
  Desc = "Select the egg you want to buy",
  Value = "nil",
  Multi = false,
  AllowNone = true,
  Values = {1 , 2, 3},
  Callback = function(Options)
    eggSelected = Options
  end
})
local Button = Tabs.Shop:Button({
  Title = "Buy egg",
  Callback = function()
    local ohNumber1 = eggSelected
    game:GetService("ReplicatedStorage").GameEvents.BuyPetEgg:FireServer(ohNumber1)
  end
})
local Section = Tabs.LPlayer:Section({
  Title = "Character Options",
  TextXAlignment = "Center",
  TextSize = 17,
})
local Input = Tabs.LPlayer:Input({
  Title = "WalkSpeed",
  Desc = "Set your walk speed value",
  Value = "",
  InputIcon = "person-standing",
  Placeholder = "16",
  Callback = function(input)
    walkspeedSelected = input
  end
})
local Input = Tabs.LPlayer:Input({
  Title = "JumpPower",
  Desc = "Set your jump power value",
  Value = "",
  InputIcon = "person-standing",
  Placeholder = "50",
  Callback = function(input)
    jumppowerSelected = input
  end
})
local Toggle = Tabs.LPlayer:Toggle({
  Title = "Set",
  Desc = "Set walk speed and jump power value to your character",
  Icon = "check",
  Value = false,
  Callback = function(state)
    value = state
    if value then
      game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = walkspeedSelected
      game.Players.LocalPlayer.Character.Humanoid.JumpPower = jumppowerSelected
    else
      game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
      game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
    end
  end,
})
