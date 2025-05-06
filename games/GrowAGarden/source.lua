-- -- detect service
-- local UserInputService = game:GetService("UserInputService")
-- if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled and not UserInputService.MouseEnabled then
-- 	print("Mobile device")
-- elseif not UserInputService.TouchEnabled and UserInputService.KeyboardEnabled and UserInputService.MouseEnabled then
-- 	print("Computer device")
-- end



-- -- start
-- print[[                                                                     

--  /$$$$$$            /$$$$$$  /$$           /$$   /$$               /$$   /$$
-- |_  $$_/           /$$__  $$|__/          |__/  | $$              | $$  / $$
--   | $$   /$$$$$$$ | $$  \__/ /$$ /$$$$$$$  /$$ /$$$$$$   /$$   /$$|  $$/ $$/
--   | $$  | $$__  $$| $$$$    | $$| $$__  $$| $$|_  $$_/  | $$  | $$ \  $$$$/ 
--   | $$  | $$  \ $$| $$_/    | $$| $$  \ $$| $$  | $$    | $$  | $$  >$$  $$ 
--   | $$  | $$  | $$| $$      | $$| $$  | $$| $$  | $$ /$$| $$  | $$ /$$/\  $$
--  /$$$$$$| $$  | $$| $$      | $$| $$  | $$| $$  |  $$$$/|  $$$$$$$| $$  \ $$
-- |______/|__/  |__/|__/      |__/|__/  |__/|__/   \___/   \____  $$|__/  |__/
--                                                          /$$  | $$          
--                                                         |  $$$$$$/          
--                                                          \______/           
-- ]]



-- -- variables
-- function GetGears()
--   local gearName = {}
--   for _, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Gear_Shop.Frame.ScrollingFrame:GetChildren()) do
--     if v:IsA("Frame") and not v.Name:match("_Padding$") and v.Name ~= 'ItemPadding' then
--       table.insert(gearName, v.Name)
--     end
--   end
--   return gearName
-- end
-- function GetSeed()
--   local seedName = {}
--   for _, v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Seed_Shop.Frame.ScrollingFrame:GetChildren()) do
--     if v:IsA("Frame") and not v.Name:match("_Padding$") and v.Name ~= 'ItemPadding' then
--       table.insert(seedName, v.Name)
--     end
--   end
--   return seedName
-- end
-- function gradient(text, startColor, endColor)
--   local result = ""
--   local length = #text

--   for i = 1, length do
--       local t = (i - 1) / math.max(length - 1, 1)
--       local r = math.floor((startColor.R + (endColor.R - startColor.R) * t) * 255)
--       local g = math.floor((startColor.G + (endColor.G - startColor.G) * t) * 255)
--       local b = math.floor((startColor.B + (endColor.B - startColor.B) * t) * 255)

--       local char = text:sub(i, i)
--       result = result .. "<font color=\"rgb(" .. r ..", " .. g .. ", " .. b .. ")\">" .. char .. "</font>"
--   end

--   return result
-- end
-- function GetSize()
--   if game:GetService('UserInputService').TouchEnabled and not game:GetService('UserInputService').KeyboardEnabled and not game:GetService('UserInputService').MouseEnabled then
--       return UDim2.fromOffset(600, 350)
--   else
--       return UDim2.fromOffset(830, 525)
--   end
-- end
-- scriptVersion = "3.2a"



-- -- make library
-- local WindUI = loadstring(game:HttpGet("https://tree-hub.vercel.app/api/UI/WindUI"))()
-- WindUI:Popup({
--   Title = "Welcome to " .. gradient("InfinityX", Color3.fromRGB(129, 63, 214), Color3.fromRGB(63, 61, 204)),
--   Icon = "info",
--   Content = game.Players.LocalPlayer.Name .. " I hope you enjoy the experience\nHave fun!",
--   Buttons = {
--       {
--           Title = "Cancel",
--           --Icon = "",
--           Callback = function() end,
--           Variant = "Tertiary",
--       },
--       {
--           Title = "Continue",
--           Icon = "arrow-right",
--           Callback = function() Confirmed = true end,
--           Variant = "Primary",
--       }
--   }
-- })

-- repeat wait() until Confirmed

-- local Window = WindUI:CreateWindow({
--   Title = "InfinityX - "..scriptVersion,
--   Icon = "rbxassetid://78609244215270",
--   Author = game:GetService('MarketplaceService'):GetProductInfo(game.PlaceId).Name,
--   Folder = "UiLib",
--   Size = GetSize(),
--   Transparent = false,
--   Theme = "Dark",
--   UserEnabled = false,
--   SideBarWidth = 200,
--   HasOutline = true,
-- })
-- Window:EditOpenButton({
--   Title = "Click here to open "..gradient("InfinityX", Color3.fromRGB(129, 63, 214), Color3.fromRGB(63, 61, 204)),
--   Icon = "monitor",
--   CornerRadius = UDim.new(0,16),
--   StrokeThickness = 1.5,
--   Color = ColorSequence.new(
--     Color3.fromRGB(129, 63, 214),
--     Color3.fromRGB(63, 61, 204)
--   ),
--   Enabled = true,
--   Dragable = false,
-- })
-- local Tabs = {
--   AutoFarm = Window:Tab({
--     Title = "Auto Farm",
--     Icon = "banknote",
--     Desc = "AutoFarm tab",
--   }),
--   Shop = Window:Tab({
--     Title = "Shop",
--     Icon = "hand-coins",
--     Desc = "Shop tab",
--   }),
-- }
-- Window:SelectTab(1)



-- -- source
-- local Section = Tabs.AutoFarm:Section({
--   Title = "Farm Options",
--   TextXAlignment = "Center",
--   TextSize = 17,
-- })
-- local Toggle = Tabs.AutoFarm:Toggle({
--   Title = "Auto plant",
--   Desc = "Activate to plant all your plants",
--   Icon = "check",
--   Value = false,
--   Callback = function(state)
--     plant = state
--     while plant do task.wait()
--       for _, v in pairs(workspace.Farm:GetDescendants()) do
--         if v:IsA('StringValue') and v.Value == game.Players.LocalPlayer.Name then
--           for _, tool in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
--               if tool:IsA('Tool') and tool.Name:lower():find('seed') then
--                   game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
--                   task.wait(0.1)
--               end
--           end

--           local equipped = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
--           if equipped then
--               local name = equipped.Name
--               local crop = name:match("^(%w+)%s+Seed")
--               if crop then
--                   local plantPosition = v.Parent.Parent.Plant_Locations.Can_Plant.Position
--                   local ohVector31 = Vector3.new(plantPosition.X, plantPosition.Y, plantPosition.Z)
--                   local ohString2 = crop
--                   game:GetService("ReplicatedStorage").GameEvents.Plant_RE:FireServer(ohVector31, ohString2)
--               end
--           end
--         end
--       end
--     end
--   end,
-- })
-- local Toggle = Tabs.AutoFarm:Toggle({
--   Title = "Auto collect",
--   Desc = "Activate to collect all your plants",
--   Icon = "check",
--   Value = false,
--   Callback = function(state)
--     collect = state
--     if collect then
--       for _, v in pairs(workspace.Farm:GetDescendants()) do
--         if v:IsA('StringValue') and v.Value == game.Players.LocalPlayer.Name then
--           for _, x in pairs(v.Parent.Parent.Plants_Physical:GetDescendants()) do
--             if x:IsA('ProximityPrompt') and x.Name == 'ProximityPrompt' then
--               x.MaxActivationDistance = math.huge
--             end
--           end
--         end
--       end
--     end
--     while collect do task.wait()
--       for _, v in pairs(workspace.Farm:GetDescendants()) do
--         if v:IsA('StringValue') and v.Value == game.Players.LocalPlayer.Name then
--           for _, x in pairs(v.Parent.Parent.Plants_Physical:GetDescendants()) do
--             if x:IsA('ProximityPrompt') and x.Name == 'ProximityPrompt' then
--               x.MaxActivationDistance = math.huge
--               wait(.2)
--               fireproximityprompt(x)
--             end
--           end
--         end
--       end
--     end
--   end,
-- })
-- local Toggle = Tabs.AutoFarm:Toggle({
--   Title = "Auto sell",
--   Desc = "Activate to auto sell your plants",
--   Icon = "check",
--   Value = false,
--   Callback = function(state)
--     sell = state
--     while sell do task.wait()
--       game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(62, 3, 0)
--       game:GetService("ReplicatedStorage"):WaitForChild("GameEvents"):WaitForChild("Sell_Inventory"):FireServer()
--     end
--   end,
-- })


-- local Section = Tabs.Shop:Section({
--   Title = "Buy Gears",
--   TextXAlignment = "Center",
--   TextSize = 17,
-- })
-- local Dropdown = Tabs.Shop:Dropdown({
--   Title = "Select gear",
--   Desc = "Select the gear you want to buy",
--   Value = "nil",
--   Multi = false,
--   AllowNone = true,
--   Values = GetGears(),
--   Callback = function(Options)
--     gearSelected = Options
--   end
-- })
-- local Button = Tabs.Shop:Button({
--   Title = "Buy gear",
--   Callback = function()
--     local ohString1 = gearSelected
--     game:GetService("ReplicatedStorage").GameEvents.BuyGearStock:FireServer(ohString1)
--   end
-- })
-- local Section = Tabs.Shop:Section({
--   Title = "Buy Seeds",
--   TextXAlignment = "Center",
--   TextSize = 17,
-- })
-- local Dropdown = Tabs.Shop:Dropdown({
--   Title = "Select seed",
--   Desc = "Select the seed you want to buy",
--   Value = "nil",
--   Multi = false,
--   AllowNone = true,
--   Values = GetSeed(),
--   Callback = function(Options)
--     seedSelected = Options
--   end
-- })
-- local Button = Tabs.Shop:Button({
--   Title = "Buy seed",
--   Callback = function()
--     local ohString1 = seedSelected
--     game:GetService("ReplicatedStorage").GameEvents.BuySeedStock:FireServer(ohString1)
--   end
-- })
-- local Section = Tabs.Shop:Section({
--   Title = "Buy Eggs",
--   TextXAlignment = "Center",
--   TextSize = 17,
-- })
-- local Dropdown = Tabs.Shop:Dropdown({
--   Title = "Select egg",
--   Desc = "Select the egg you want to buy",
--   Value = "nil",
--   Multi = false,
--   AllowNone = true,
--   Values = {1 , 2, 3},
--   Callback = function(Options)
--     eggSelected = Options
--   end
-- })
-- local Button = Tabs.Shop:Button({
--   Title = "Buy egg",
--   Callback = function()
--     local ohNumber1 = eggSelected
--     game:GetService("ReplicatedStorage").GameEvents.BuyPetEgg:FireServer(ohNumber1)
--   end
-- })










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
Title.Text = "WARING"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 26
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Parent = NotificationFrame

local Content = Instance.new("TextLabel")
Content.Size = UDim2.new(1, -20, 0, 70)
Content.Position = UDim2.new(0, 10, 0, 55)
Content.BackgroundTransparency = 1
Content.Text = "The ui library I use to make this script is undergoing updates. I hope you'll wait for the ui library to be updated so I can reopen the script"
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
Button.Text = "Enjoy!"
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
