local Players = game:GetService('Players')

local Settings = {
    Esp = {
        Enabled = true;
    };
}

getgenv().EspPlayer = function(Player)
    local BillboardGui = Instance.new('BillboardGui', Player.Character:WaitForChild('Head', 10))
    local Textlabel = Instance.new('TextLabel', BillboardGui)
    BillboardGui.Adornee = Player.Character.Head
    BillboardGui.Size = UDim2.new(0,100,0,100)
    BillboardGui.StudsOffset = Vector3.new(0,1,0)
    BillboardGui.AlwaysOnTop = true 
    Textlabel.BackgroundTransparency = 1
    Textlabel.Position = UDim2.new(0,0,0,1)
    Textlabel.Size = UDim2.new(1,0,0,10)
    Textlabel.TextStrokeTransparency = 0.1
    Textlabel.Font = 'ArialBold'
    Textlabel.TextSize = 14
    Textlabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    Textlabel.Text = Player.Name..' ('..math.floor(Player.Character.Humanoid.Health)..')';
end

coroutine.resume(coroutine.create(function()
    if Settings.Esp.Enabled == true then
        for _, Player in pairs(Players:GetPlayers()) do
            EspPlayer(Player)
            print(Player)
        end
    end
end))
