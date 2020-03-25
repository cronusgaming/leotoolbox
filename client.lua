RegisterCommand("leoloadout", function()
	TriggerServerEvent("checkRoles", "leoloadout")
end)

RegisterNetEvent("lloadout")
AddEventHandler("lloadout", function()
	-- Notify User that the script is starting
    notify("~b~Reality Roleplay LEO Loadout Equipper")
    Citizen.Wait(1)
    -- Give user the following weapons
    giveWeapon("weapon_combatpistol")
    giveWeapon("weapon_nightstick")
    giveWeapon("weapon_carbinerifle_mk2")
    giveWeapon("weapon_pumpshotgun")
    giveWeapon("weapon_stungun")
    giveWeapon("weapon_flashlight")
    -- Notify user that weapons are equipped
    notify("~b~LEO Weapons Equipped")
    -- Give user the following weapon attachments
    weaponComponent("weapon_combatpistol", "COMPONENT_COMBATPISTOL_CLIP_02")
    weaponComponent("weapon_combatpistol", "COMPONENT_AT_PI_FLSH")
    weaponComponent("weapon_carbinerifle_mk2", "COMPONENT_CARBINERIFLE_MK2_CLIP_02")
    weaponComponent("weapon_carbinerifle_mk2", "COMPONENT_AT_AR_FLSH")
    weaponComponent("weapon_carbinerifle_mk2", "COMPONENT_AT_AR_AFGRIP_02")
    weaponComponent("weapon_pumpshotgun", "COMPONENT_AT_AR_FLSH")
    -- Notify user that weapon attachments have been equipped
    notify("~b~LEO Weapon Attachments Equipped")
    vehMenu = true
    notify("~b~LEO Vehicle Menu Has Been Opened")
end)

RegisterCommand("leovehicles", function()
	TriggerServerEvent("checkRoles", "leovehicles")
end)

RegisterNetEvent("lvehicles")
AddEventHandler("lvehicles", function()
	vehMenu = true
    notify("~b~LEO Vehicle Menu Has Been Opened")
end)

function notify(msg)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(msg)
    DrawNotification(true, false)
end

function giveWeapon(hash)
    GiveWeaponToPed(GetPlayerPed(-1), GetHashKey(hash), 999, false, false)
end

function weaponComponent(weaponHash, component)
    if HasPedGotWeapon(GetPlayerPed(-1), GetHashKey(weaponHash), false) then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey(weaponHash), GetHashKey(component))
    end
end

function spawnCar(car)
    if IsPedInAnyVehicle(PlayerPedId(), false) then
		currentVehicle = GetVehiclePedIsIn(PlayerPedId(), false)
		DeleteEntity(currentVehicle)
    end
    local car = GetHashKey(car)

    RequestModel(car)
    while not HasModelLoaded(car) do
        RequestModel(car)
        Citizen.Wait(0)
    end

    local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
    local vehicle = CreateVehicle(car, x, y, z + 1, 0.0, true, false)
    SetEntityAsMissionEntity(vehicle, true, true)
end

function cuffPlayer()
    local plyPed = GetNearestPlayerToEntity(PlayerPedId())
    local targetCoords = GetEntityCoords(GetNearestPlayerToEntity(PlayerPedId()))
	local plyCoords = GetEntityCoords(PlayerPedId())
    local distance = Vdist(targetCoords["x"], targetCoords["y"], targetCoords["z"], plyCoords["x"], plyCoords["y"], plyCoords["z"])
    if(distance ~= -1 and distance < 3) then
        SetEnableHandcuffs(plyPed, true)
        SetCurrentPedWeapon(plyPed, unarmed, true)
        notify("You have ~r~cuffed~s~ " .. GetPlayerName(plyPed))
    else
        notify("There is no player within cuffing distance!")
    end
end

function uncuffPlayer()
    local plyPed = GetNearestPlayerToEntity(PlayerPedId())
    local targetCoords = GetEntityCoords(GetNearestPlayerToEntity(PlayerPedId()))
	local plyCoords = GetEntityCoords(PlayerPedId())
    local distance = Vdist(targetCoords["x"], targetCoords["y"], targetCoords["z"], plyCoords["x"], plyCoords["y"], plyCoords["z"])
    if(distance ~= -1 and distance < 3) then
        SetEnableHandcuffs(plyPed, false)
        UncuffPed(plyPed)
        notify("You have ~r~uncuffed~s~ " .. GetPlayerName(plyPed))
    else
        notify("There is no player within uncuffing distance!")
    end
end

function dragPlayer()
    local ped = GetPlayerPed(GetNearestPlayerToEntity(PlayerPedId()))
    local myped = PlayerPedId()
    AttachEntityToEntity(myped, ped, 4103, 11816, 0.48, 0.00, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
    notify("Now dragging " .. ped)
end

function undragPlayer()
    DetachEntity(PlayerPedId(), true, false)
    notify("You are no longer dragging the target")
end

function evehiclePlayer()
    local pos = GetEntityCoords(GetNearestPlayerToEntity(PlayerPedId()))
    local entityWorld = GetOffsetFromEntityInWorldCoords(GetNearestPlayerToEntity(PlayerPedId()), 0, 0.0, 20.0, 0.0)

    local rayHandle = CastRayPointToPoint(pos.x, pos.y, pos.z, entityWorld.x, entityWorld.y, entityWorld.z, 10, GetNearestPlayerToEntity(PlayerPedId()))
    local _, _, _, _, vehicleHandle = GetRaycastResult(rayHandle)

    -- Place Player in Whichevery Vehicle Availible
    if vehicleHandle ~= nil then
        if(IsVehicleSeatFree(vehicleHandle, 1)) then
            SetPedIntoVehicle(GetNearestPlayerToEntity(PlayerPedId()), vehicleHandle, 1)
            SetPedCanRagdoll(GetNearestPlayerToEntity(PlayerPedId(), true))
        elseif(IsVehicleSeatFree(vehicleHandle, 2)) then
            SetPedIntoVehicle(GetNearestPlayerToEntity(PlayerPedId()), vehicleHandle, 2)
            SetPedCanRagdoll(GetNearestPlayerToEntity(PlayerPedId(), true))
        end
    end
    -- Notify User
    notify("You just placed someone in your vehicle")
end

function lvehiclePlayer()
    -- Person leaving vehicle
    local ped = GetNearestPlayerToEntity(PlayerPedId())
    -- Person executing command
    local ped1 = PlayerPedId()
    -- Make person leave vehicle
    ClearPedTasksImmediately(ped)
    -- Teleport to person executing command
    local ppos = GetEntityCoords(PlayerPedId())
    SetEntityCoords(ped, ppos)
    -- Notify user if it succeeded
    notify("You have just made someone leave your vehicle")
end

-- Spawns prop with a prop name
function spawnProp(hash)
    local pedLoc = GetEntityCoords(PlayerPedId())
    local x, y, z = table.unpack(pedLoc, false)
    -- So hash doesn't have to be used in code.
    local prop = GetHashKey(hash)
    CreateObject(prop, x, y, z, true, false, false)
    -- Notifying if succeded
    notify("You have just spawned an object")
end

-- Despawn prop created with function spawnProp
function despawnProp(rad)
    local pedLoc = GetEntityCoords(PlayerPedId())
    local x, y, z = table.unpack(pedLoc, false)
    ClearAreaOfObjects(x, y, z, rad)
    notify("You have just despawned all props within " .. rad .. " radius")
end

-- Never Wanted
Citizen.CreateThread(function()
-- Every second so it doesn't take up much CPU time.
    Citizen.Wait(1000)
    SetPoliceIgnorePlayer(PlayerPedId(), true)
    SetDispatchCopsForPlayer(PlayerPedId(), false)
    ClearPlayerWantedLevel(PlayerPedId())
    Citizen.InvokeNative(0xDC0F817884CDD856, 1, false)
    Citizen.InvokeNative(0xDC0F817884CDD856, 2, false)
    Citizen.InvokeNative(0xDC0F817884CDD856, 3, false)
    Citizen.InvokeNative(0xDC0F817884CDD856, 5, false)
    Citizen.InvokeNative(0xDC0F817884CDD856, 8, false)
    Citizen.InvokeNative(0xDC0F817884CDD856, 9, false)
    Citizen.InvokeNative(0xDC0F817884CDD856, 10, false)
    Citizen.InvokeNative(0xDC0F817884CDD856, 11, false)
end)
