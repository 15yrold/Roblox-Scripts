local ReplicatedStorage = game:GetService('ReplicatedStorage')

local Settings = {
    Spam = {
        Enabled = false,
        Message = 'hii',
        Cooldown = 1,
    }
}

coroutine.resume(coroutine.create(function()
    while wait(Settings.Spam.Cooldown) do 
        if Settings.Spam.Enabled == true then
            ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(Settings.Spam.Message, 'All')
        end
    end
end))
