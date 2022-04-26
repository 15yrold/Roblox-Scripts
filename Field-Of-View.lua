local key = game:GetService("UserInputService")
local FovAmount = 70
key.InputEnded:Connect(function(Key, Typing)
    if Typing then return end 
    if Key.KeyCode == Enum.KeyCode.Equals then
        FovAmount = FovAmount + 5
        game:GetService'Workspace'.Camera.FieldOfView = FovAmount
        print('Field-Of-View: '..tonumber(FovAmount))
    end
end)
key.InputEnded:Connect(function(Key, Typing)
    if Typing then return end 
    if Key.KeyCode == Enum.KeyCode.Minus then
        FovAmount = FovAmount - 5
        game:GetService'Workspace'.Camera.FieldOfView = FovAmount
        print('Field-Of-View: '..tonumber(FovAmount))
    end
end)
