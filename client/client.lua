local file = ('imports/%s.lua'):format(IsDuplicityVersion() and 'server' or 'client')
local import = LoadResourceFile('ox_core', file)
local chunk = assert(load(import, ('@@ox_core/%s'):format(file)))
chunk()

RegisterNUICallback('hideUI', function(_, cb)
    cb({})
    SetNuiFocus(false, false)
end)

local lastHunger = 1
local lastThirst = 1
local lastStress = 1
local lastStamina = 1
local lastArmor = 1
local lastHealth = 1

local function updateNUI(action, value) 
    SendNUIMessage({
        action = action,
        data = value
    })
    return true
end

AddEventHandler('ox:onPlayerLoaded', function()
    lastHunger = player.getStatus("hunger")
    lastThirst = player.getStatus("thirst")
    lastStress = player.getStatus("stress")
    lastStamina = GetPlayerSprintStaminaRemaining(PlayerId())
    lastArmor = GetPedArmour(PlayerPedId())
    lastHealth = GetEntityHealth(PlayerPedId())

    updateNUI("updateHunger", lastHunger)
    updateNUI("updateThirst", lastThirst)
    updateNUI("updateStress", lastStress)
    updateNUI("updateStamina", lastStamina)
    updateNUI("updateArmor", lastArmor)
    updateNUI("updateHealth", lastHealth)
end)

AddEventHandler('ox:statusTick', function(source, status)

    local hunger = math.floor(player.getStatus("hunger"))
    local thirst = math.floor(player.getStatus("thirst"))
    local stress = math.floor(player.getStatus("stress"))
    local armor = math.floor(GetPedArmour(PlayerPedId()))
    local health = math.floor(GetEntityHealth(PlayerPedId())/2)
    local stamina = math.floor(GetPlayerSprintStaminaRemaining(PlayerId()))


    if (math.abs(lastHunger-hunger) >= 5 or math.abs(hunger-lastHunger) >= 5) then
        hunger = math.floor(hunger/5)*5
        updateNUI("updateHunger", hunger)
        lastHunger = hunger
    end

    if (math.abs(lastThirst-thirst) >= 5 or math.abs(thirst-lastThirst) >= 5) then
        thirst = math.floor(thirst/5)*5
        updateNUI("updateThirst", thirst)
        lastThirst = thirst
    end

    if (math.abs(lastStress-stress) >= 5 or math.abs(stress-lastStress) >= 5) then
        updateNUI("updateStress", stress)
        lastStress = stress
    end

    if (lastArmor ~= armor) then
        updateNUI("updateArmor", armor)
        lastArmor = armor
    end

    if (math.abs(lastHealth-health) >= 5 or math.abs(health-lastHealth) >= 5) then
        health = math.floor(health/5)*5
        updateNUI("updateHealth", health)
        lastHealth = health
    end

    if (math.abs(lastStamina-stamina) >= 10 or math.abs(stamina-lastStamina) >= 10 or stamina > 95) then
        if (stamina > 95) then
            stamina = 100
        else 
            stamina = math.floor(stamina/10)*10
        end
        if (lastStamina ~= 100) then
            updateNUI("updateStamina", stamina)
        end
        lastStamina = stamina
    end
end)

AddEventHandler('ox:playerLoaded', function()
    print('status_hud has been started')
    SetNuiFocus(false, false)
    SendNUIMessage({
        action = 'setVisible',
        data = true
    })
end)

AddEventHandler('ox:onPlayerUnload', function()
    print('status_hud has been stopped')
    SetNuiFocus(false, false)
    SendNUIMessage({
        action = 'setVisible',
        data = false
    })
end)