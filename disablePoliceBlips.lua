Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)

        for ped in EnumeratePeds() do
            if DoesEntityExist(ped) and not IsPedAPlayer(ped) then
                local blip = GetBlipFromEntity(ped)
                if DoesBlipExist(blip) then
                    RemoveBlip(blip)
                end
            end
        end
    end
end)

function EnumeratePeds()
    return coroutine.wrap(function()
        local pedHandle, pedFound = FindFirstPed()
        if not pedFound then
            EndFindPed(pedHandle)
            return
        end

        local ped = pedHandle
        repeat
            coroutine.yield(ped)
            pedFound, ped = FindNextPed(pedHandle)
        until not pedFound

        EndFindPed(pedHandle)
    end)
end
