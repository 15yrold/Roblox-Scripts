local Players = game:GetService('Players')
local Client = Players.LocalPlayer
local Name = Client.Name
local Content = syn.request(
    {
        Url = '', -- list of users link  
        Method = 'GET',
        Headers = {
            ['Content-Type'] = 'application/json'
        },  
    }
)
Content = Content.Body
if string.match(Content, Name) then
    print('wowowowo')
else
    Client:Kick('You are not Whitelisted.')
end
