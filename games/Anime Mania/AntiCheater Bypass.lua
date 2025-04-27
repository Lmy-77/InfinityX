local remoteName = "Ban"
local mt = getrawmetatable(game)
local lscript = game:GetService("Players").LocalPlayer.Backpack:WaitForChild("ClientMain")
local senv = getsenv(lscript)


setreadonly(mt, false)
local oldNamecall = mt.__namecall
mt.__namecall = newcclosure(function(self, ...)
    local method = getnamecallmethod()
    if method == "FireServer" and tostring(self) == remoteName then
        return
    end
    return oldNamecall(self, ...)
end)

for k, v in pairs(senv) do
    if typeof(v) == "function" and islclosure(v) then
        hookfunction(v, function(...)
            local constants = debug.getconstants(v)
            for _, const in ipairs(constants) do
                if typeof(const) == "string" and const:lower():find("kick") then
                    return
                end
            end
            return v(...)
        end)
    end
end
setreadonly(mt, true)
