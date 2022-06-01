local customitems = true
local Material = 'ForceField'
local Colour = Color3.fromRGB(87, 11, 163)
local rservice = game:GetService('RunService')
local backpack = game.Players.LocalPlayer.Backpack

if customitems == true then
    rservice.RenderStepped:Connect(function()
        for i, v in pairs(backpack:GetDescendants()) do
            if v:IsA('BasePart') then
            v.Material = Material
            v.Color = Colour
            end
        end
    end)
end
