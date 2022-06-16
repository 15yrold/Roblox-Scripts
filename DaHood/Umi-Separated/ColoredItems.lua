local Players = game:GetService('Players')
local Client = Players.LocalPlayer

local Settings = {
    Items = {
        Enabled = true;
        Material = 'ForceField';
        Color = Color3.fromRGB(104, 0, 255);
    };
}

coroutine.resume(coroutine.create(function()
    while wait() do
        if Settings.Items.Enabled == true then
            for i, v in pairs(Client.Backpack:GetDescendants()) do
                if v:IsA('BasePart') then
                    v.Material = Settings.Items.Material
                    v.Color = Settings.Items.Color
                end
            end
        end
    end
end))
