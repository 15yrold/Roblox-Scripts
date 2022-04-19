local username = game.Players.LocalPlayer.Name
local content = syn.request(
    {
        Url = '', -- list of users link  
        Method = 'GET',
        Headers = {
            ['Content-Type'] = 'application/json'
        },  
    }
)
content = content.Body
if string.match(content, username) then
    print('wowowowo')
else
    game.Players.LocalPlayer:Kick('You are not Whitelisted.')
end
