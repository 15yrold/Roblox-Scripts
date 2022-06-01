local material = 'ForceField'
local color = color3.fromRGB(255, 255, 255)
local rservice = game:GetService('RunService')
local backpack = game.Players.LocalPlayer.Backpack

local CustomItems = function()
    print('Script Executed')
    rservice.RenderStepped:Connect(function()
        for i, v in pairs(backpack:GetDescendants()) do
            if v:IsA('BasePart') then
            v.Material = material
            v.Color = color
            end
        end
    end)
end

CustomItems()
