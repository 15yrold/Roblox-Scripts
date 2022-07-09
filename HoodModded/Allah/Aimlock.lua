local repo = 'https://raw.githubusercontent.com/15yrold/LinoriaLib/main/'
local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()

local Players = game:GetService('Players')
local Client = Players.LocalPlayer
local Mouse = Client:GetMouse()
local CurrentCamera = workspace.CurrentCamera
local Part = Instance.new('Part', workspace)

Part.Shape = Enum.PartType.Ball
Part.Anchored = true
Part.CanCollide = false
Part.Material = 'Neon'
Part.Color = Color3.fromRGB(104, 0, 255)
Part.Size = Vector3.new(1.5, 1.5, 1.5)

getgenv().GetClosest = function()
    local closest = {}
    local distance = math.huge
    local player = nil
    for i, plr in pairs(Players:GetPlayers()) do
        if plr ~= Client and plr.Character then
            local os, si = plr.Character:GetBoundingBox()
            local pos = os.Position
            if pos then
                local point = CurrentCamera.WorldToViewportPoint(CurrentCamera, pos)
                local dist = (Vector2.new(Mouse.X, Mouse.Y) - Vector2.new(point.X, point.Y)).Magnitude
                if dist <= distance then
                    player = plr
                    distance = dist
                end
            end
        end
    end
    return player
end

getgenv().TargetPart = function()
    for i = 0, 1, .1 do
        task.wait()
        Part.CFrame = CFrame.new(Part.Position:Lerp(Players[Target].Character[DefaultPart].Position, i))
    end
end

Mouse.KeyDown:Connect(function(Key)
    if Key ~= DefaultKeybind:lower() then
        return
    end
    if Enabled then
        Enabled = false
    else
        Enabled = true
        Plr = GetClosest()
        Target = tostring(Plr)
    end
end)

game.RunService.Heartbeat:Connect(function()
    if Target ~= nil and Enabled == true then
        TargetPart()
    else
        Part.CFrame = CFrame.new(0, -9999, 0)
    end
end)

local rawmetatable = getrawmetatable(game)
local old = rawmetatable.__namecall
setreadonly(rawmetatable, false)
rawmetatable.__namecall = newcclosure(function(...)
    local args = { ... }
    local method = getnamecallmethod()
    if DefaultAimlockType == 'Mouse Click' and Target ~= nil and Enabled and method == 'FireServer' and args[2] == 'MousePos' then
        args[3] = Players[Target].Character[DefaultPart].Position + (Players[Target].Character[DefaultPart].Velocity * DefaultPrediction)
        return old(unpack(args))
    end
    return old(...)
end)


local Window = Library:CreateWindow({
    Title = '<$',
    Center = true, 
    AutoShow = true,
})

local Tabs = {
    Main = Window:AddTab('Main')
}

local Aimlock = Tabs.Main:AddLeftGroupbox('Aimlock')
Aimlock:AddToggle('Aimlock', {
    Text = 'Toggle Aimlock',
    Default = true, 
    Tooltip = 'This Toggles Aimlock On & Off',
})
Toggles.Aimlock:OnChanged(function()
    Enabled = Toggles.Aimlock.Value
    --print('Aimlock: '..tostring(Settings.Aimlock.Enabled))
end)
Aimlock:AddDropdown('AimlockPart', {
    Values = {'Head', 'HumanoidRootPart'},
    Default = DefaultPart, 
    Multi = false, 

    Text = 'Aimlock Part',
    Tooltip = 'This Changes Aimlock Part', 
})
Options.AimlockPart:OnChanged(function()
    DefaultPart = Options.AimlockPart.Value
    --print('Rainbow Items Material: '..tostring(Settings.Items.Material))
end)
Aimlock:AddDropdown('AimlockType', {
    Values = {'Mouse Click', 'Camera Trace'},
    Default = DefaultAimlockType, 
    Multi = false, 

    Text = 'Aimlock Part',
    Tooltip = 'This Changes Aimlock Part', 
})
Options.DefaultAimlockType:OnChanged(function()
    DefaultAimlockType = Options.AimlockPart.Value
    --print('Rainbow Items Material: '..tostring(Settings.Items.Material))
end)
