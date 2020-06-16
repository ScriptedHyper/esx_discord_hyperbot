-- Modified by Hyper

ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

--Send the message to your discord server
function sendToDiscord (name,message,color)
  local DiscordWebHook = Config.webhook
  -- Modify here your discordWebHook username = name, content = message,embeds = embeds

local embeds = {
    {
        ["title"]=message,
        ["type"]="rich",
        ["color"] =color,
        ["footer"]=  {
            ["text"]= "ESX-discord_bot_alert",
       },
    }
}

  if message == nil or message == '' then return FALSE end
  PerformHttpRequest(DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
end

function sendToDiscord2 (name,message,color)
  local DiscordWebHook2 = Config.webhook2
  -- Modify here your discordWebHook username = name, content = message,embeds = embeds

local embeds = {
    {
        ["title"]=message,
        ["type"]="rich",
        ["color"] =color,
        ["footer"]=  {
            ["text"]= "ESX-discord_bot_alert",
       },
    }
}

  if message == nil or message == '' then return FALSE end
  PerformHttpRequest(DiscordWebHook2, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
end


function sendToDiscord3 (name,message,color)
  local DiscordWebHook3 = Config.webhook3
  -- Modify here your discordWebHook username = name, content = message,embeds = embeds

local embeds = {
    {
        ["title"]=message,
        ["type"]="rich",
        ["color"] =color,
        ["footer"]=  {
            ["text"]= "ESX-discord_bot_alert",
       },
    }
}

  if message == nil or message == '' then return FALSE end
  PerformHttpRequest(DiscordWebHook3, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
end

function sendToDiscord4 (name,message,color)
  local DiscordWebHook4 = Config.webhook4
  -- Modify here your discordWebHook username = name, content = message,embeds = embeds

local embeds = {
    {
        ["title"]=message,
        ["type"]="rich",
        ["color"] =color,
        ["footer"]=  {
            ["text"]= "ESX-discord_bot_alert",
       },
    }
}

  if message == nil or message == '' then return FALSE end
  PerformHttpRequest(DiscordWebHook4, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
end

function sendToDiscord5 (name,message,color)
  local DiscordWebHook5 = Config.webhook5
  -- Modify here your discordWebHook username = name, content = message,embeds = embeds

local embeds = {
    {
        ["title"]=message,
        ["type"]="rich",
        ["color"] =color,
        ["footer"]=  {
            ["text"]= "ESX-discord_bot_alert",
       },
    }
}

  if message == nil or message == '' then return FALSE end
  PerformHttpRequest(DiscordWebHook5, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
end

function sendToDiscord6 (name,message,color)
  local DiscordWebHook6 = Config.webhook6
  -- Modify here your discordWebHook username = name, content = message,embeds = embeds

local embeds = {
    {
        ["title"]=message,
        ["type"]="rich",
        ["color"] =color,
        ["footer"]=  {
            ["text"]= "ESX-discord_bot_alert",
       },
    }
}

  if message == nil or message == '' then return FALSE end
  PerformHttpRequest(DiscordWebHook6, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
end


-- Send the first notification
sendToDiscord6(_U('server'),_U('server_start'),Config.green)

-- Event when a player is writing
AddEventHandler('chatMessage', function(author, color, message)
  if(settings.LogChatServer)then
      local player = ESX.GetPlayerFromId(author)
     sendToDiscord6(_U('server_chat'), player.name .." : "..message,Config.grey)
  end
end)


-- Event when a player is connecting
RegisterServerEvent("esx:playerconnected")
AddEventHandler('esx:playerconnected', function()
  if(settings.LogLoginServer)then
    sendToDiscord(_U('server_connecting'), GetPlayerName(source) .." ".. _('user_connecting'),Config.grey)
  end
end)

-- Event when a player is disconnecting
AddEventHandler('playerDropped', function(reason)
  if(settings.LogLoginServer)then
    sendToDiscord(_U('server_disconnecting'), GetPlayerName(source) .." ".. _('user_disconnecting') .. "("..reason..")",Config.grey)
  end
end)


RegisterServerEvent('esx:onPlayerDeath')
AddEventHandler('esx:onPlayerDeath', function(data)
    data.victim = source

    if data.killedByPlayer then
		sendToDiscord(_U('server_kill'), GetPlayerName(data.victim) .." wurde von "..GetPlayerName(data.killerServerId).. " getötet",Config.red)

    else
		sendToDiscord(_U('server_kill'), GetPlayerName(data.victim) .." ist gestorben",Config.red)
    end
end)


RegisterServerEvent("esx:killPlayerDC")
AddEventHandler("esx:killPlayerDC", function(id, pid, kid)
    if id == 1 then
		local xPlayer = ESX.GetPlayerFromId(pid)
		local xPlayerKiller = ESX.GetPlayerFromId(kid)
		sendToDiscord(_U('server_kill'), xPlayer.name .." ".._('user_kill').." "..xPlayerKiller.name.." ".._('with'),Config.red)
	elseif id == 2 then
		local xPlayer = ESX.GetPlayerFromId(pid)
		sendToDiscord(_U('server_kill'), xPlayer.name .." ".. _('user_kill_environnement'),Config.red)
	end
end)






-- Add event when a player give an item
--  TriggerEvent("esx:giveitemalert",sourceXPlayer.name,targetXPlayer.name,ESX.Items[itemName].label,itemCount) -> ESX_extended
RegisterServerEvent("esx:giveitemalert")
AddEventHandler("esx:giveitemalert", function(name,nametarget,itemname,amount)
   if(settings.LogItemTransfer)then
    sendToDiscord2(_U('server_item_transfer'),name.._('user_gives_to')..nametarget.." "..amount .." "..itemname,Config.orange)
   end

end)

-- Add event when a player give money
-- TriggerEvent("esx:givemoneyalert",sourceXPlayer.name,targetXPlayer.name,itemCount) -> ESX_extended
RegisterServerEvent("esx:givemoneyalert")
AddEventHandler("esx:givemoneyalert", function(name,nametarget,amount)
  if(settings.LogMoneyTransfer)then
    sendToDiscord3(_U('server_money_transfer'),name.." ".._('user_gives_to').." "..nametarget.." "..amount .." dollars",Config.orange)
  end

end)

-- Add event when a player give money
-- TriggerEvent("esx:givemoneyalert",sourceXPlayer.name,targetXPlayer.name,itemCount) -> ESX_extended
RegisterServerEvent("esx:givemoneybankalert")
AddEventHandler("esx:givemoneybankalert", function(name,nametarget,amount)
  if(settings.LogMoneyBankTransfert)then
   sendToDiscord3(_U('server_moneybank_transfer'),name.." ".. _('user_gives_to') .." "..nametarget.." "..amount .." dollars",Config.orange)
  end

end)


-- Add event when a player give weapon
--  TriggerEvent("esx:giveweaponalert",sourceXPlayer.name,targetXPlayer.name,weaponLabel) -> ESX_extended
RegisterServerEvent("esx:giveweaponalert")
AddEventHandler("esx:giveweaponalert", function(name,nametarget,weaponlabel)
  if(settings.LogWeaponTransfer)then
    sendToDiscord4(_U('server_weapon_transfer'),name.." ".._('user_gives_to').." "..nametarget.." "..weaponlabel,Config.orange)
  end

end)

-- Add event when a player is washing money
--  TriggerEvent("esx:washingmoneyalert",xPlayer.name,amount) -> ESX_society
RegisterServerEvent("esx:washingmoneyalert")
AddEventHandler("esx:washingmoneyalert", function(name,amount)
  sendToDiscord5(_U('server_washingmoney'),name.." ".._('user_washingmoney').." ".. amount .." dollars",Config.orange)

end)

-- Event when a player is in a blacklisted vehicle
RegisterServerEvent("esx:enterblacklistedcar")
AddEventHandler("esx:enterblacklistedcar", function(model)
   local xPlayer = ESX.GetPlayerFromId(source)
   sendToDiscord(_U('server_blacklistedvehicle'),xPlayer.name.." ".._('user_entered_in').." ".. model ,Config.red)

end)


-- Event when a player (not policeman) is in a police vehicle
RegisterServerEvent("esx:enterpolicecar")
AddEventHandler("esx:enterpolicecar", function(model)
 	 local xPlayer = ESX.GetPlayerFromId(source)
 	 sendToDiscord(_U('server_policecar'),xPlayer.name.." ".._('user_entered_in').." ".. model , Config.blue)

end)


-- Event when a player is jacking a car
RegisterServerEvent("esx:jackingcar")
AddEventHandler("esx:jackingcar", function(model)
   local xPlayer = ESX.GetPlayerFromId(source)
   sendToDiscord(_U('server_carjacking'),xPlayer.name.." ".._('user_carjacking').." ".. model,Config.purple)

end)


-- Event when a player is killing an other one

--[[RegisterServerEvent('esx:killerlog')
AddEventHandler('esx:killerlog', function(t,killer, kilerT) -- t : 0 = NPC, 1 = player
  local xPlayer = ESX.GetPlayerFromId(source)
  if(t == 1) then
     local xPlayer = ESX.GetPlayerFromId(source)
     local xPlayerKiller = ESX.GetPlayerFromId(killer)

     if(xPlayerKiller.name ~= nil and xPlayer.name ~= nil)then

       if(kilerT.killerinveh) then
         local model = kilerT.killervehname

            sendToDiscord(_U('server_kill'), xPlayer.name .." ".._('user_kill').." "..xPlayerKiller.name.." ".._('with'),Config.red)



       else
            sendToDiscord(_U('server_kill'), xPlayer.name .." ".._('user_kill').." "..xPlayerKiller.name,Config.red)



       end
    end
  else
     sendToDiscord(_U('server_kill'), xPlayer.name .." ".. _('user_kill_environnement'),Config.red)
  end

end)]]--
