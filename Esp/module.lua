local module = {}

getgenv().EspSettings = {
    Enabled = false,
    TeamCheck = false,
    Tracers = false,
    Studs = false,
}

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer

local ESPs = {}

local function getColor(plr)
    if getgenv().EspSettings.TeamCheck and plr.Team and plr.TeamColor then
        return plr.TeamColor.Color
    end
    return Color3.new(1, 1, 1)
end

local function createTracer()
    local line = Drawing.new("Line")
    line.Thickness = 1.5
    line.Transparency = 1
    line.Visible = false
    return line
end

local function getScreenPos3D(pos)
    local screenPos = Camera:WorldToViewportPoint(pos)
    return Vector2.new(screenPos.X, screenPos.Y)
end

local function setupEsp(plr)
    if ESPs[plr] then return end

    local function addEsp(char)
        local hrp = char:WaitForChild("HumanoidRootPart", 5)
        if not hrp then return end

        local box = Instance.new("BoxHandleAdornment")
        box.Name = "ESPBox"
        box.Adornee = hrp
        box.Size = Vector3.new(4, 6, 2)
        box.Transparency = 0.4
        box.AlwaysOnTop = true
        box.ZIndex = 5
        box.Parent = hrp

        local gui = Instance.new("BillboardGui")
        gui.Name = "StudsGui"
        gui.Adornee = hrp
        gui.Size = UDim2.new(0, 100, 0, 20)
        gui.StudsOffset = Vector3.new(0, 3, 0)
        gui.AlwaysOnTop = true
        gui.Parent = hrp

        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1, 0, 1, 0)
        label.BackgroundTransparency = 1
        label.TextColor3 = Color3.new(1, 1, 1)
        label.TextScaled = true
        label.Font = Enum.Font.SourceSansBold
        label.Text = ""
        label.Parent = gui

        local tracer = createTracer()

        ESPs[plr] = {
            box = box,
            gui = gui,
            label = label,
            tracer = tracer,
            character = char,
        }
    end

    plr.CharacterAdded:Connect(addEsp)
    if plr.Character then addEsp(plr.Character) end
end

local function removeEsp(plr)
    local e = ESPs[plr]
    if e then
        if e.box then e.box:Destroy() end
        if e.gui then e.gui:Destroy() end
        if e.tracer then e.tracer:Remove() end
        ESPs[plr] = nil
    end
end

RunService.RenderStepped:Connect(function()
    if not getgenv().EspSettings.Enabled then
        for plr in pairs(ESPs) do removeEsp(plr) end
        return
    end

    for plr, data in pairs(ESPs) do
        local char = data.character
        if plr ~= LocalPlayer and char and char:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local hrp = char.HumanoidRootPart
            local localHRP = LocalPlayer.Character.HumanoidRootPart
            local color = getColor(plr)

            data.box.Color3 = color

            if getgenv().EspSettings.Studs then
                local dist = (localHRP.Position - hrp.Position).Magnitude
                data.label.Text = math.floor(dist) .. " studs"
                data.label.TextColor3 = color
                data.gui.Enabled = true
            else
                data.label.Text = ""
                data.gui.Enabled = false
            end

            if getgenv().EspSettings.Tracers then
                local from = getScreenPos3D(localHRP.Position)
                local to = getScreenPos3D(hrp.Position)
                data.tracer.Visible = true
                data.tracer.Color = color
                data.tracer.From = from
                data.tracer.To = to
            else
                data.tracer.Visible = false
            end
        else
            removeEsp(plr)
        end
    end
end)

Players.PlayerAdded:Connect(setupEsp)
Players.PlayerRemoving:Connect(removeEsp)

for _, plr in pairs(Players:GetPlayers()) do
    if plr ~= LocalPlayer then setupEsp(plr) end
end

function module.toggleEsp(setting, value)
    getgenv().EspSettings[setting] = value
    if setting == "Enabled" and not value then
        for plr in pairs(ESPs) do removeEsp(plr) end
    end
end

return module
