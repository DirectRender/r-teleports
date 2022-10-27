local QBCore = exports['qb-core']:GetCoreObject() -- QBCore


function CreateText(x, y, z, text)
	SetTextScale(Config.scale, Config.scale)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(Config.textColor[1], Config.textColor[2], Config.textColor[3], Config.textColor[4])
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x, y, z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 360
    if Config.useBackground then DrawRect(0.0, 0.0+0.0125, 0.0175+ factor, 0.03, Config.backgroundColor[1], Config.backgroundColor[2], Config.backgroundColor[3], Config.backgroundColor[4]) end
    ClearDrawOrigin()
end

CreateThread(function()
    local sleep
    while true do
        sleep = 500
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)

        for location in pairs(Config.textLocations) do
            for _, v in pairs(Config.textLocations[location]) do
                local distance = #(pos - vector3(v.coords.x, v.coords.y, v.coords.z))

                if distance < v.viewDistance and distance > v.useDistance then
                    sleep = 4
                    CreateText(v.coords.x, v.coords.y, v.coords.z, v.text)
                end
                if _ == 1 then
                    if distance < v.useDistance then
                        sleep = 1
                        CreateText(v.coords.x, v.coords.y, v.coords.z,  Config.textButton..v.text)
                        if IsControlJustReleased(0, Config.pressButton) then
                            SetEntityCoords(ped, Config.textLocations[location][2].coords.x, Config.textLocations[location][2].coords.y, Config.textLocations[location][2].coords.z)
                            if Config.notify then
                                if exports['okokNotify'] then
                                    exports['okokNotify']:Alert("", v.notifyText, v.notifyTime * 1000, v.notifyType)
                                else
                                    if exports['qb-core']:GetCoreObject() then
                                    QBCore.Functions.Notify(v.notifyText, v.notifyType)
                                    else
                                        -- Custom notify 
                                    end
                                end
                            end
                        end
                    end
                elseif _ == 2 then
                    if distance < v.useDistance then
                        sleep = 1
                        CreateText(v.coords.x, v.coords.y, v.coords.z,  Config.textButton..v.text)
                        if IsControlJustReleased(0, Config.pressButton) then
                            SetEntityCoords(ped, Config.textLocations[location][1].coords.x, Config.textLocations[location][1].coords.y, Config.textLocations[location][1].coords.z)
                            if Config.notify then
                                if exports['okokNotify'] then
                                    exports['okokNotify']:Alert("", v.notifyText, v.notifyTime * 1000, v.notifyType)
                                else
                                    if exports['qb-core']:GetCoreObject() then
                                    QBCore.Functions.Notify(v.notifyText, v.notifyType)
                                    else
                                        -- Custom notify 
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
        Wait(sleep)
    end
end)
