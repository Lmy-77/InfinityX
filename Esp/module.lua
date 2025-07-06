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
    if getgenv().EspSettings.TeamCheck and plr.Team then
        return plr.TeamColor.Color
    end
    return Color3.new(1,1,1)
end

local function createTracer()
    local line = Drawing.new("Line")
    line.Thickness = 1.5
    line.Transparency = 1
    line.Visible = false
    return line
end

local function getScreenPos3D(pos)
    local s, onscreen = Camera:WorldToViewportPoint(pos)
    return Vector2.new(s.X, s.Y)
end

function module.toggleEsp(setting, value)
    getgenv().EspSettings[setting] = value
    if setting == "Enabled" and not value then
        for plr in pairs(ESPs) do
            ESPs[plr].tracer:Remove()
            ESPs[plr].box:Destroy()
            ESPs[plr].gui:Destroy()
        end
        ESPs = {}
    end
end

local function setupEsp(plr)
    if ESPs[plr] then return end
    plr.CharacterAdded:Connect(function(char)
        task.wait(1)
        if not getgenv().EspSettings.Enabled then return end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end

        local box = Instance.new("BoxHandleAdornment", hrp)
        box.Size = Vector3.new(4,6,2)
        box.Transparency = 0.4
        box.AlwaysOnTop = true

        local gui = Instance.new("BillboardGui", hrp)
        gui.Size = UDim2.new(0,100,0,20)
        gui.StudsOffset = Vector3.new(0,3,0)
        gui.AlwaysOnTop = true

        local label = Instance.new("TextLabel", gui)
        label.Size = UDim2.new(1,0,1,0)
        label.BackgroundTransparency = 1
        label.Font = Enum.Font.SourceSansBold
        label.TextScaled = true
        label.TextColor3 = Color3.new(1,1,1)

        local tracer = createTracer()
        ESPs[plr] = {box=box,gui=gui,label=label,tracer=tracer,hrp=hrp}
    end)
    if plr.Character then 
        plr.CharacterAdded:Wait()
        setupEsp(plr)
    end
end

Players.PlayerAdded:Connect(setupEsp)
Players.PlayerRemoving:Connect(function(plr)
    if ESPs[plr] then ESPs[plr].tracer:Remove(); ESPs[plr].box:Destroy(); ESPs[plr].gui:Destroy(); ESPs[plr] = nil end
end)

RunService.RenderStepped:Connect(function()
    if not getgenv().EspSettings.Enabled then return end
    for plr,data in pairs(ESPs) do
        if plr ~= LocalPlayer and data.hrp and data.hrp.Parent then
            local color = getColor(plr)
            data.box.Color3 = color
            if getgenv().EspSettings.Studs then
                local dist = (LocalPlayer.Character.HumanoidRootPart.Position - data.hrp.Position).Magnitude
                data.label.Text = math.floor(dist).." studs"
                data.label.TextColor3 = color
                data.gui.Enabled = true
            else
                data.gui.Enabled = false
            end

            if getgenv().EspSettings.Tracers then
                local from = getScreenPos3D(LocalPlayer.Character.HumanoidRootPart.Position)
                local to = getScreenPos3D(data.hrp.Position)
                data.tracer.Visible = true
                data.tracer.Color = color
                data.tracer.From = from
                data.tracer.To = to
            else
                data.tracer.Visible = false
            end
        end
    end
end)

for _, plr in pairs(Players:GetPlayers()) do
    setupEsp(plr)
end

return module
