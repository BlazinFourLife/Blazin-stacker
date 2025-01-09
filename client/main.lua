-- Trigger the server event to stack marked bills
RegisterCommand("stackmarkedbills", function()
    TriggerServerEvent('blazins-stacker:stackMarkedBills')
end, false)

-- Fetch the current marked bill worth from the server
RegisterNetEvent('blazins-stacker:showMarkedBillWorth', function()
    QBCore.Functions.TriggerCallback('blazins-stacker:getMarkedBillWorth', function(totalWorth)
        if totalWorth > 0 then
            QBCore.Functions.Notify("You have $" .. totalWorth .. " in marked bills.", "success")
        else
            QBCore.Functions.Notify("You have no marked bills.", "error")
        end
    end)
end)

-- Command to show the current marked bill worth
RegisterCommand("checkmarkedbills", function()
    TriggerEvent('blazins-stacker:showMarkedBillWorth')
end, false)
