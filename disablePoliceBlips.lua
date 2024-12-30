Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)

        local playerPed = PlayerPedId()

        for entity in EnumerateEntities() do
            if DoesEntityExist(entity) and not IsPedAPlayer(entity) then
                local blip = GetBlipFromEntity(entity)
                if DoesBlipExist(blip) then
                    RemoveBlip(blip)
                end
            end
        end
    end
end)

function EnumerateEntities()
    return coroutine.wrap(function()
        local handle, entity = FindFirstPed()
        local success
        repeat
            coroutine.yield(entity)
            success, entity = FindNextPed(handle)
        until not success
        EndFindPed(handle)
    end)
end
