local Players = game:GetService('Players')
local Client = Players.LocalPlayer

local Settings = {
    Headless = {
        Enabled = true
    }
}

coroutine.resume(coroutine.create(function()
    if Settings.Headless.Enabled == true then
        Client.Character.Head.Transparency = 1
        for i, v in pairs(Client.Character.Head:GetChildren()) do 
            if (v:IsA('Decal')) then
                v:Destroy()
            end
        end
    end
end))
