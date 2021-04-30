ESX              = nil

-- ESX Load
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(250)
	end
end)

-- Create Enter/Exit Locations
Citizen.CreateThread(function()
	while not NetworkIsSessionStarted() do -- Wait for the user to load
		Wait(500)
	end

	while true do
		Citizen.Wait(500)
		local playerCoords = GetEntityCoords(PlayerPedId())
		for k,v in pairs(Config.Locations) do
			-- Get the enter and exit coords
			local EnterLocation = vector3(v.EnterCoord.x, v.EnterCoord.y, v.EnterCoord.z)
			local ExitLocation = vector3(v.ExitCoord.x, v.ExitCoord.y, v.ExitCoord.z)

			-- Check the enter markers
			while #(GetEntityCoords(PlayerPedId()) - EnterLocation) <= 1.0 do
				Citizen.Wait(0)
				ESX.Game.Utils.DrawText3D(EnterLocation, "Press ~y~[E]~w~ to enter " .. v.name)
				if IsControlJustReleased(0, 51) then
					local ped = PlayerPedId()
					SetEntityCoords(ped, v.ExitCoord.x, v.ExitCoord.y, v.ExitCoord.z, false, false, false, true)
				end
			end

			-- Check the exit markers
			while #(GetEntityCoords(PlayerPedId()) - ExitLocation) <= 1.0 do
				Citizen.Wait(0)
				ESX.Game.Utils.DrawText3D(ExitLocation, "Press ~y~[E]~w~ to exit " .. v.name)
				if IsControlJustReleased(0, 51) then
					local ped = PlayerPedId()
					SetEntityCoords(ped, v.EnterCoord.x, v.EnterCoord.y, v.EnterCoord.z, false, false, false, true)
				end
			end
		end
	end
end)

-- Create blips if enabled in the config
Citizen.CreateThread(function()
	if Config.EnableBlips then
		for k,v in pairs(Config.Locations) do 
			local blip = AddBlipForCoord(v.BlipCoord.x, v.BlipCoord.y, v.BlipCoord.z)
			SetBlipSprite (blip, v.BlipSprite)
			SetBlipDisplay(blip, 4)
			SetBlipScale  (blip, 0.6)
			SetBlipAsShortRange(blip, true)
			BeginTextCommandSetBlipName("STRING")
			AddTextComponentString('Open Interior')
			EndTextCommandSetBlipName(blip)
		end
	end
end)

-- Create enter/exit markers
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		for k,v in pairs(Config.Locations) do
			-- Get Locations
			local EnterLocation = vector3(v.EnterCoord.x, v.EnterCoord.y, v.EnterCoord.z)
			local ExitLocation = vector3(v.ExitCoord.x, v.ExitCoord.y, v.ExitCoord.z)
	
			-- Enter Markers
			DrawMarker(25, EnterLocation.x, EnterLocation.y, EnterLocation.z - 0.98, 
			0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.5, 0, 255, 0, 155, false, true, 2, nil, nil, false)
			
			-- Exit Markers
			DrawMarker(25, ExitLocation.x, ExitLocation.y, ExitLocation.z - 0.98, 
			0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 1.5, 0, 255, 0, 155, false, true, 2, nil, nil, false)
		end
	end
end)