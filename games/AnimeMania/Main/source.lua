local WindUI = loadstring(game:HttpGet("https://tree-hub.vercel.app/api/UI/WindUI"))()
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
WindUI:Popup({
      Title = "Welcome!",
      Icon = "info",
      Content = "Welcome " .. game.Players.LocalPlayer.Name .. " to " .. gradient("InfinityX", Color3.fromRGB(129, 63, 214), Color3.fromRGB(63, 61, 204)) .. " Script",
      Buttons = {
          {
              Title = "Cancel",
              Callback = function() end,
              Variant = "Tertiary",
          },
          {
              Title = "Continue",
              Icon = "arrow-right",
              Callback = function()
                Confirmed = true
              end,
              Variant = "Primary",
          }
      }
    })

    repeat wait() until Confirmed

    local Window = WindUI:CreateWindow({
      Title = "InfinityX - "..scriptVersion,
      Icon = "rbxassetid://78609244215270",
      Author = game:GetService('MarketplaceService'):GetProductInfo(game.PlaceId).Name,
      Folder = "UiLib",
      Size = GetSize(),
      Transparent = false,
      Theme = "Dark",
      UserEnabled = false,
      SideBarWidth = 200,
      HasOutline = true,
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
      Bypass = Window:Tab({
        Title = "Bypass",
        Icon = "shield-ban",
        Desc = "Bypass tab",
      }),
      Misc = Window:Tab({
        Title = "Misc",
        Icon = "layers",
        Desc = "Misc tab",
      }),
    }
    Window:SelectTab(1)



    -- source
    local Section = Tabs.AutoFarm:Section({
      Title = "Clear Wave",
      TextXAlignment = "Center",
      TextSize = 17,
    })
    local Toggle = Tabs.AutoFarm:Toggle({
      Title = "Teleport all mobs",
      Desc = "Activate to teleport to all mobs",
      Icon = "check",
      Value = false,
      Callback = function(state)
        farm = state
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
    local Toggle = Tabs.AutoFarm:Toggle({
      Title = "Use skills + m1",
      Desc = "When activated, the player uses all skills and m1",
      Icon = "check",
      Value = false,
      Callback = function(state)
        skills = state
        while skills do task.wait()
          game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Input"):FireServer({'Light'}, false)
          game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Input"):FireServer({'Skill', 1})
          game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Input"):FireServer({'Skill', 2})
          game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Input"):FireServer({'Skill', 3})
          game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Input"):FireServer({'Skill', 4})
        end
      end,
    })
    local Toggle = Tabs.AutoFarm:Toggle({
      Title = "Auto team assist",
      Desc = "Use the team assistant automatically",
      Icon = "check",
      Value = false,
      Callback = function(state)
        assist = state
        while assist do task.wait()
          local args = {[1] = {[1] = "Skill", [2] = "TeamAssist"}}
          game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Input"):FireServer(unpack(args))
        end
      end,
    })
    local Toggle = Tabs.AutoFarm:Toggle({
      Title = "God mode",
      Desc = "Make the character immortal",
      Icon = "check",
      Value = false,
      Callback = function(state)
        godm = state
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
    local Button = Tabs.AutoFarm:Button({
      Title = "Reedem all codes",
      Callback = function()
        local codes = {'WelcomeNewAnimeManiaPlayers!', 'THANKSFOR175KLIKES', 'SOLOLEVELINGBUFFS', 'MONEYMONEY', 'FIRSTFREECODE'}
        for _, v in ipairs(codes) do
          local args = {
              [1] = v
          }
          game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("SubmitCode"):InvokeServer(unpack(args))
          task.wait(0.5)
        end
      end
    })

    local Section = Tabs.AutoFarm:Section({
      Title = "Settings",
      TextXAlignment = "Center",
      TextSize = 17,
    })
    local Dropdown = Tabs.AutoFarm:Dropdown({
      Title = "Select the number of characters",
      Desc = "",
      Value = "nil",
      Multi = false,
      AllowNone = true,
      Values = {
        "1", "2", "3"
      },
      Callback = function(Options)
        numbersOfCharacters = Options
      end
    })
    local Dropdown = Tabs.AutoFarm:Dropdown({
      Title = "Select the character",
      Desc = "",
      Value = "nil",
      Multi = false,
      AllowNone = true,
      Values = {
        "1", "2", "3"
      },
      Callback = function(Options)
        characterSelected = Options
      end
    })
    local Toggle = Tabs.AutoFarm:Toggle({
      Title = "Auto select",
      Desc = "Selects the chosen character for you",
      Icon = "check",
      Value = false,
      Callback = function(state)
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
    local Toggle = Tabs.AutoFarm:Toggle({
      Title = "Auto replay",
      Desc = "Press the replay button every time it appears",
      Icon = "check",
      Value = false,
      Callback = function(state)
        replay = state
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
    local Button = Tabs.AutoFarm:Button({
      Title = "Don't you get it? Click here",
      Callback = function()
        local Dialog = Window:Dialog({
          Icon = "droplet",
          Title = "How To Use",
          Content = "In the first dropdown you will put how many characters you have equipped (Example: 2). In the second dropdown you'll put which character you want him to click on to equip in the Arena (Example: I'm equipped with Sukuna and Tsunade, in the first dropdown I'll put 2, I want him to use sukuna, in the second dropdown I'll put it as 1)",
          Buttons = {
            {
              Title = "OK!", 
              Callback = function() end,
              Variant = "Primary"
            }
          }
        }) Dialog:Open()
      end
    })


    local Section = Tabs.Bypass:Section({
      Title = "Anti Cheater Bypass (Automatic)",
      TextXAlignment = "Center",
      TextSize = 17,
    })
    local BypassToggle = Tabs.Bypass:Toggle({
      Title = "Auto bypass",
      Desc = "Press here to auto bypass anti cheater if you have rejoin server",
      Icon = "check",
      Value = false,
      Callback = function(state)
        save_bypass = state
        if save_bypass then
            if not hookmetamethod and hookfunction and getsenv and newcclosure and getnamecallmethod and getrawmetatable then
                local Dialog = Window:Dialog({
                  Icon = "droplet",
                  Title = "Bypass failed",
                  Content = "Your exploit dont support this bypass.",
                  Buttons = {
                    {
                      Title = "OK!", 
                      Callback = function() end,
                      Variant = "Primary"
                    }
                  }
                }) Dialog:Open()
            else
                if not isfile('InfinityX/Settings/save_bypass.lua') then
                    writefile('InfinityX/Settings/save_bypass.lua', 'true')
                elseif isfile('InfinityX/Settings/save_bypass.lua') then
                    writefile('InfinityX/Settings/save_bypass.lua', 'true')
                end
            end
        end
      end,
    })
    local Button = Tabs.Bypass:Button({
      Title = "Delete settings",
      Desc = "Deletes the auto bypass setting",
      Callback = function()
        delfile('InfinityX/Settings/save_bypass.lua')
      end
    })
    if not isfile('InfinityX/Settings/save_bypass.lua') then
      warn('File does not exist')
    elseif isfile('InfinityX/Settings/save_bypass.lua') then
      if readfile('InfinityX/Settings/save_bypass.lua') == 'true' then
        BypassToggle:SetValue(true)
        if hookmetamethod and hookfunction and getsenv and newcclosure and getnamecallmethod and getrawmetatable then
            warn('Bypass success')
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Lmy-77/InfinityX/refs/heads/scripts/games/AnimeMania/Bypass.lua", true))()
        else
            warn('Bypass failed')
        end
      end
    end
    local Section = Tabs.Bypass:Section({
      Title = "Anti Cheater Bypass (Manual)",
      TextXAlignment = "Center",
      TextSize = 17,
    })
    local Button = Tabs.Bypass:Button({
      Title = "Bypass remote",
      Desc = "Bypass the remote that detects the script",
      Callback = function()
        if not hookmetamethod and hookfunction and getsenv and newcclosure and getnamecallmethod and getrawmetatable then
            local Dialog = Window:Dialog({
              Icon = "droplet",
              Title = "Bypass failed",
              Content = "Your exploit dont support this bypass.",
              Buttons = {
                {
                  Title = "OK!", 
                  Callback = function() end,
                  Variant = "Primary"
                }
              }
            }) Dialog:Open()
        else
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
        end
      end
    })
    local Button = Tabs.Bypass:Button({
      Title = "Bypass all",
      Desc = "Bypass all functions that detect the script",
      Callback = function()
        if not hookmetamethod and hookfunction and getsenv and newcclosure and getnamecallmethod and getrawmetatable then
            local Dialog = Window:Dialog({
              Icon = "droplet",
              Title = "Bypass failed",
              Content = "Your exploit dont support this bypass.",
              Buttons = {
                {
                  Title = "OK!", 
                  Callback = function() end,
                  Variant = "Primary"
                }
              }
            }) Dialog:Open()
        else
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Lmy-77/InfinityX/refs/heads/scripts/games/AnimeMania/Bypass.lua", true))()
        end
      end
    })


    local Section = Tabs.Misc:Section({
      Title = "Misc Options",
      TextXAlignment = "Center",
      TextSize = 17,
    })
    local Toggle = Tabs.Misc:Toggle({
      Title = "Anti afk",
      Desc = "Make the character immortal",
      Icon = "check",
      Value = false,
      Callback = function(state)
        afk = state
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
