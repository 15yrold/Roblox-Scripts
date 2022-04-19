local username = game.Players.LocalPlayer.Name
local content = syn.request(
    {
        Url = 'https://raw.githubusercontent.com/15yrold/Roblox-Database/main/whitelist.txt',  
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
