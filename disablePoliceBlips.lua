Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500) -- Runs every half-second to minimize performance impact
        local pedHandle, pedFound = FindFirstPed()
        repeat
            -- Check if the ped is AI and not human
            if IsPedHuman(pedHandle) == false then
                -- Get any blip associated with this ped
                local blip = GetBlipFromEntity(pedHandle)
                if DoesBlipExist(blip) then
                    -- Remove the blip from the map
                    RemoveBlip(blip)
                end
            end
            pedFound, pedHandle = FindNextPed(pedHandle)
        until not pedFound
        EndFindPed(pedHandle)
    end
end)
