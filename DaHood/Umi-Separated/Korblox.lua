local Players = game:GetService('Players')
local RunService = game:GetService('RunService')
local Client = Players.LocalPlayer

local Settings = {
    Korblox = {
        Enabled = true;
    };
}

RunService.Stepped:Connect(function()
    if Settings.Korblox.Enabled == true then
        Client.Character.RightFoot.MeshId = 'http://www.roblox.com/asset/?id=902942093'
        Client.Character.RightFoot.Transparency = 1
        Client.Character.RightLowerLeg.MeshId = 'http://www.roblox.com/asset/?id=902942093'
        Client.Character.RightLowerLeg.Transparency = 1
        Client.Character.RightUpperLeg.MeshId = 'http://www.roblox.com/asset/?id=902942096'
        Client.Character.RightUpperLeg.TextureID = 'http://roblox.com/asset/?id=902843398'
    end
end)
