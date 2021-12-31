ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterServerEvent('esx_military_armory:getItem')

AddEventHandler('esx_military_armory:getItem', function(itemName, qty)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.addInventoryItem(itemName, qty)

end)

