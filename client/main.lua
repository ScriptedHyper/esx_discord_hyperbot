-- Modified by Hyper

ESX                           = nil
local PlayerData              = {}



Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(100)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end
	
	PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent("esx:setJob")
AddEventHandler("esx:setJob", function(job)
	PlayerData.job = job
end)
RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function()
	TriggerServerEvent("esx:playerconnected")
end)


local isJacking = true
local isStolen = true
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(3000)

		if(IsPedInAnyVehicle(GetPlayerPed(-1)))then
			local playerPed = GetPlayerPed(-1)
			local coords    = GetEntityCoords(playerPed)
			vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 7.0, 0, 70)
			if(IsVehicleStolen(vehicle) and isStolen )then
				Wait(1000)
				TriggerServerEvent("esx:jackingcar",GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)))
				isStolen = false
			end
		else
			isStolen = true
			vehicle = nil
		end

		if(IsPedJacking(GetPlayerPed(-1))) then
				if(settings.LogPedJacking == true and isJacking) then
					local playerPed = GetPlayerPed(-1)
					local coords    = GetEntityCoords(playerPed)

					local vehicle = nil

					if IsPedInAnyVehicle(playerPed) then
						vehicle = GetVehiclePedIsIn(playerPed)

					else
						vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 7.0, 0, 70)

					end
					Wait(1000)
					TriggerServerEvent("esx:jackingcar",GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)))

					isJacking = false
					vehicle = nil

				end
		else
			isJacking = true
		end




	end
end)

local isIncarPolice = false

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(3000)

		if(IsPedInAnyPoliceVehicle(GetPlayerPed(-1))) then
			if not isIncarPolice and PlayerData.job.name ~= 'police' and PlayerData.job.name ~= 'fib' and PlayerData.job.name = 'army' then
				TriggerServerEvent("esx:enterpolicecar",GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsIn(GetPlayerPed(-1), 0))))
				isIncarPolice = true
			end
		else
			isIncarPolice = false
		end

	end
end)


function GetPlayerByEntityID(id)
	for i=0,128 do
		if(NetworkIsPlayerActive(i) and GetPlayerPed(i) == id) then return i end
	end
	return nil
end
