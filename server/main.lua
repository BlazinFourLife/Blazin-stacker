QBCore = exports['qb-core']:GetCoreObject()

-- Function to combine marked bills into one item
local function payByMarkedBills(balance, source)
    local Player = QBCore.Functions.GetPlayer(source)
    local info = {
        worth = balance
    }
    
    -- Remove all marked bills and add one with the total worth
    for _, v in pairs(Player.PlayerData.items) do
        if v.name == "markedbills" then
            Player.Functions.RemoveItem("markedbills", v.amount)
        end
    end
    
    -- Add the stacked marked bills item
    Player.Functions.AddItem("markedbills", 1, false, info)
end

-- Server event to stack marked bills
RegisterNetEvent('blazins-stacker:stackMarkedBills', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local totalAmount = 0

    -- Loop through all marked bills in the player's inventory
    for _, bill in pairs(Player.PlayerData.items) do
        if bill.name == "markedbills" then
            totalAmount = totalAmount + bill.info.worth
            Player.Functions.RemoveItem("markedbills", bill.amount)
        end
    end

    -- If there are bills to combine, use payByMarkedBills to combine them
    if totalAmount > 0 then
        payByMarkedBills(totalAmount, src)
        TriggerClientEvent('QBCore:Notify', src, "Marked bills have been stacked. Total worth: $" .. totalAmount, "success")
    else
        TriggerClientEvent('QBCore:Notify', src, "No marked bills to stack.", "error")
    end
end)

-- Server callback to get the player's current marked bill worth
QBCore.Functions.CreateCallback('blazins-stacker:getMarkedBillWorth', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    local totalAmount = 0

    for _, bill in pairs(Player.PlayerData.items) do
        if bill.name == "markedbills" then
            totalAmount = totalAmount + bill.info.worth
        end
    end

    cb(totalAmount)
end)
