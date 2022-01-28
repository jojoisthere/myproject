
ESX = nil
Citizen.CreateThread(function()
    while ESX == nil do
        Citizen.Wait(200)
        TriggerEvent('esx:getSharedObject' , function (obj)  ESX = obj  end)
    end
end)

RegisterCommand('checkJob', function(source, args, raw)
    ESX.TriggerServerCallback('getCurrentJob' , function(jobname)
        ShowNotification('Current job: ' .. jobname)
    end)
end)

function ShowNotification(text)
    SetNotificationTextEntry('String')
    AddTextComponentString(text)
    DrawNotification(false, true)
end