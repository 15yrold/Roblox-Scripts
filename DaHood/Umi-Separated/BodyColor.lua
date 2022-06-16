local Players = game:GetService('Players')
local Client = Players.LocalPlayer

local Settings = {
    RainbowBody = {
        Enabled = true;
        Material = 'ForceField';
        Color = Color3.fromRGB(104, 0, 255);
        Cooldown = 1;
    };
}

coroutine.resume(coroutine.create(function()
    while wait(.1) do
        if Settings.RainbowBody.Enabled == true then
            repeat
                Client.Character.Archivable = true
                local Clone = Client.Character:Clone()
                for _, v in pairs(Clone:GetDescendants()) do
                    if v.Name == 'HumanoidRootPart' or v:IsA('Humanoid') or v:IsA('LocalScript') or v:IsA('Script') or v:IsA('Decal') then
                        v:Destroy()
                    elseif v:IsA('BasePart') or v:IsA('Meshpart') or v:IsA('Part') then
                        if v.Transparency == 1 then
                            v:Destroy()
                        else
                            v.CanCollide = false
                            v.Anchored = true
                            v.Material = Settings.RainbowBody.Material
                            v.Color = Settings.RainbowBody.Color
                            v.Transparency = 0.5
                            v.Size = v.Size + Vector3.new(0.03, 0.03, 0.03)
                        end
                    end
                end
                Clone.Parent = game.Workspace
                wait(Settings.RainbowBody.Cooldown)
                Clone:Destroy()
            until Settings.RainbowBody.Enabled == false
        end
    end
end))
