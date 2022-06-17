local LightingService = game:GetService('Lighting')

local Settings = {
    GameTime = {
        Enabled = true;
        Day = false;
        Night = true;
    };
}

coroutine.resume(coroutine.create(function()
    while wait() do
        if Settings.GameTime.Enabled == true and Settings.GameTime.Night == true and Settings.GameTime.Day == false then
            LightingService.ClockTime = 3;
        elseif Settings.GameTime.Enabled == true and Settings.GameTime.Night == false and Settings.GameTime.Day == true then
            LightingService.ClockTime = 14;
        end
    end
end))
