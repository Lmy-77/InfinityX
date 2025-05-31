local Info = loadstring(game:HttpGet("https://raw.githubusercontent.com/Lmy-77/InfinityX/refs/heads/library/Info/source.lua", true))()


local UI = Info:CreateWindow("InfinityX")
UI:AddInfo("Lucky Arrows Count:", 1)
UI:AddInfo("Balance:", 15022, Color3.fromRGB(2, 255, 171))
UI:AddInfo("Balance:", 15022, Color3.fromRGB(2, 19, 255))
UI:AddInfo("Player Username:", "wadawdawdawdawd3")
UI:AddInfo("Centered Info", "123", nil, { align = "center", divider = true })
UI:AddInfo("Player Username:", "wadawdawdawdawd3")
UI:AddLabel("INFORMAÇÕES GERAIS", "center")

local Info1 = UI:AddInfo("Balance", "1500")
Info1:Update("2500")

UI:AddInfo("Username", game.Players.LocalPlayer.Name, nil, { align = "center", divider = true })
UI:AddButton("Click Me", Color3.fromRGB(255, 255, 0), function()
    print("Botão clicado!")
end)
