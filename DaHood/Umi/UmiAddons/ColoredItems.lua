local Players = game:GetService('Players')
local Client = Players.LocalPlayer

local Settings = {
    ColoredItem = {
        Enabled = true;
        Material = 'ForceField';
        Color = Color3.fromRGB(104, 0, 255);
    };
}

coroutine.resume(coroutine.create(function()
    for i, v in pairs(Client.Backpack:GetDescendants()) do
        if v:IsA('BasePart') then
            v.Material = 'ForceField'
            v.Color = Settings.ColoredItem.Color
        end
    end
end))
