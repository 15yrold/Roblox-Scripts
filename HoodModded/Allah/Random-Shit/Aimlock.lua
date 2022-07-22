--// { IMPORTANT } \\--

-- DONT TOUCH ANYTHING UNDER UNLESS YOU KNOW WHAT YOUR DOING

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
        Part.CFrame = CFrame.new(Part.Position:Lerp(Players[getgenv().Target].Character[getgenv().AimPart].Position, i))
    end
end

Mouse.KeyDown:Connect(function(Key)
    if Key ~= getgenv().Keybind:lower() then
        return
    end
    if getgenv().Aimlocking then
        getgenv().Aimlocking = false
    else
        getgenv().Aimlocking = true
        Plr = GetClosest()
        getgenv().Target = tostring(Plr)
    end
end)

game.RunService.Heartbeat:Connect(function()
    if getgenv().Target ~= nil and getgenv().Aimlocking == true then
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
    if getgenv().AimlockType == 'Mouse Click' and getgenv().Target ~= nil and getgenv().Aimlocking and method == 'FireServer' and args[2] == 'MousePos' then
        args[3] = Players[getgenv().Target].Character[getgenv().AimPart].Position + (Players[getgenv().Target].Character[getgenv().AimPart].Velocity * getgenv().Prediction)
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
    getgenv().Aimlocking = Toggles.Aimlock.Value
    --print('Aimlock: '..tostring(Settings.Aimlock.getgenv().Aimlocking))
end)
Aimlock:AddDropdown('AimlockPart', {
    Values = {'Head', 'HumanoidRootPart', 'LowerTorso'},
    Default = getgenv().AimPart, 
    Multi = false, 

    Text = 'Aimlock Part',
    Tooltip = 'This Changes Aimlock Part', 
})
Options.AimlockPart:OnChanged(function()
    getgenv().AimPart = Options.AimlockPart.Value
    --print('Rainbow Items Material: '..tostring(Settings.Items.Material))
end)
Aimlock:AddDropdown('AimlockType', {
    Values = {'Mouse Click', 'Camera Trace'},
    Default = getgenv().AimlockType, 
    Multi = false, 

    Text = 'Aimlock Part',
    Tooltip = 'This Changes Aimlock Part', 
})
Options.getgenv().AimlockType:OnChanged(function()
    getgenv().AimlockType = Options.AimlockPart.Value
    --print('Rainbow Items Material: '..tostring(Settings.Items.Material))
end)
