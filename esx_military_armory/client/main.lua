ESX              = nil
local PlayerData = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer   
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)

local isMenuOpen = false

local options = {
	{label = "Combat Knife", value = 'spawn_knife'},
	{label = "Pistol", value = 'spawn_pistol'},
	{label = "Carbine", value = 'spawn_carbine'},
	{label = "AK47", value = 'spawn_assaultrifle'},
	{label = "Shotgun", value = 'spawn_shotgun'},
	{label = "Heavy Shotgun", value = 'spawn_heavyshotgun'},
	{label = "MP5", value = 'spawn_smg'},
	{label = "Combat Machine Gun", value = 'spawn_combatmg'},
	{label = "Sniper Rifle", value = 'spawn_sniperrifle'},
	{label = "Body Armor", value = 'spawn_armor'},
	{label = "5 Extra Clips", value = 'spawn_clips'},
	{label = "Turn in all weapons", value = 'spawn_removeall'}	
	}
	
function OpenMenu()
	isMenuOpen = true
	
	ESX.UI.Menu.Open('default', GetCurrentResourceName(),'general_menu', {
		title = "Armory Menu",
		align = "upperleft",
		elements = options
	}, function(data, menu)
		menu.close()
		isMenuOpen = false
			
			if data.current.value == 'spawn_knife' then		
				SpawnKnife()
			end
			if data.current.value == 'spawn_pistol' then		
				SpawnPistol()
			end
			if data.current.value == 'spawn_carbine' then		
				SpawnCarbine()
			end
			if data.current.value == 'spawn_assaultrifle' then		
				SpawnAssaultRifle()
			end
			if data.current.value == 'spawn_shotgun' then		
				SpawnShotgun()
			end
			if data.current.value == 'spawn_heavyshotgun' then		
				SpawnHeavyShotgun()
			end
			if data.current.value == 'spawn_smg' then		
				SpawnSMG()
			end
			if data.current.value == 'spawn_combatmg' then		
				SpawnCombatMG()
			end
			if data.current.value == 'spawn_sniperrifle' then		
				SpawnSniperRifle()
			end
			if data.current.value == 'spawn_armor' then		
				SpawnArmor()
			end
			if data.current.value == 'spawn_clips' then		
				SpawnClips()
			end
			if data.current.value == 'spawn_removeall' then		
				SpawnRemoveAll()
			end		
		end,
		function(data,menu)
			menu.Close()
			isMenuOpen = false
		end)
end

function SpawnKnife()
	GiveWeaponToPed(PlayerPedId(), -1716189206, 1000, 0, false)
	ESX.ShowNotification('You have taken a combat knife')
end
function SpawnPistol()
	GiveWeaponToPed(PlayerPedId(), 453432689, 1000, 0, false)
	GiveWeaponComponentToPed(GetPlayerPed(-1),453432689, 0xED265A1C) --  extended clip
	GiveWeaponComponentToPed(GetPlayerPed(-1),453432689, 0x359B7AAE) --  Flashlight
	ESX.ShowNotification('You have taken a Pistol w/extended mag and tactical flashlight')
end
function SpawnCarbine()
	GiveWeaponToPed(PlayerPedId(), -2084633992, 1000, 0, false)
	GiveWeaponComponentToPed(GetPlayerPed(-1),-2084633992, 0xBA62E935) --  extended clip
	GiveWeaponComponentToPed(GetPlayerPed(-1),-2084633992, 0x7BC4CDDC) --  Flashlight
	GiveWeaponComponentToPed(GetPlayerPed(-1),-2084633992, 0xA0D89C42) --  Scope
	ESX.ShowNotification('You have taken a Carbine w/extended mag, scope and tac flashlight')
end
function SpawnAssaultRifle()
	GiveWeaponToPed(GetPlayerPed(-1),-1074790547, 1000, 0, false)
	GiveWeaponComponentToPed(GetPlayerPed(-1),-1074790547, 0xB1214F9B) --  extended clip
	GiveWeaponComponentToPed(GetPlayerPed(-1),-1074790547, 0x7BC4CDDC) --  Flashlight
	GiveWeaponComponentToPed(GetPlayerPed(-1),-1074790547, 0x9D2FBF29) --  Scope
	ESX.ShowNotification('You have taken an Assault Rifle w/extended mag, scope and tac flashlight')
end
function SpawnShotgun()
	GiveWeaponToPed(GetPlayerPed(-1),487013001, 1000, 0, false)
	ESX.ShowNotification('You have taken a Shotgun')
end
function SpawnHeavyShotgun()
	GiveWeaponToPed(GetPlayerPed(-1),984333226, 1000, 0, false) 
	ESX.ShowNotification('You have taken a Heavy Shotgun')
end
function SpawnSMG()
	GiveWeaponToPed(GetPlayerPed(-1),736523883, 1000, 0, false)
	GiveWeaponComponentToPed(GetPlayerPed(-1),736523883, 0x350966FB) --  extended clip
	ESX.ShowNotification('You have taken a SMG w/extended mag')
end
function SpawnCombatMG()
        GiveWeaponToPed(GetPlayerPed(-1),2144741730, 1000, 0, false) -- combat mg
	GiveWeaponComponentToPed(GetPlayerPed(-1),2144741730, 0xD6C59CD6) --  extended clip
	ESX.ShowNotification('You have taken a Combat MG w/extended mag')
end
function SpawnSniperRifle()
        GiveWeaponToPed(GetPlayerPed(-1),-952879014 , 1000, 0, false) -- marksman rifle
	GiveWeaponComponentToPed(GetPlayerPed(-1),-608341376 , 0x17DF42E9) --  extended clip
	ESX.ShowNotification('You have taken a Sniper Rifle w/extended mag')
end
function SpawnArmor()
	item = 'kevlar'
	TriggerServerEvent('esx_military_armory:getItem', item, 1)
end
function SpawnClips()
	item = 'clip'
	TriggerServerEvent('esx_military_armory:getItem', item, 5)
end
function SpawnRemoveAll()
	RemoveAllPedWeapons(GetPlayerPed(-1),true)
end

Citizen.CreateThread(function()
	 local location = vector3(-2334.866, 3328.703, 33.02573)
    while true do 
        Citizen.Wait(0)
		local ped = GetPlayerPed(-1)
		local playerCoords = GetEntityCoords(ped)
		local distance = #(playerCoords - location)
	
		if distance < 2.5 then
			ESX.Game.Utils.DrawText3D(location, "Press ~y~[H] ~w~for the Armory", 4, 4)
		
				if IsControlJustReleased(0,74) and not isMenuOpen then	
					OpenMenu()
				end
		end		



	end
end)
