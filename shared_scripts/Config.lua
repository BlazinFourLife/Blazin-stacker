Config = {}

-- Name of the marked bills item
Config.MarkedBillsItem = "markedbills"

-- Maximum amount of marked bills worth a player can hold
Config.MaxMarkedBillWorth = 10000000

-- Notification system (default: qbcore)
Config.NotificationEvent = "QBCore:Notify" -- Adjust this if you're using a custom notification system
Config.NotificationType = {
    Success = "success",
    Error = "error",
}

-- Message that displays when stacking marked bills is successful
Config.StackedSuccessMessage = "Marked bills have been successfully stacked. Total worth: $"

-- Message that displays when there are no marked bills to stack
Config.NoBillsMessage = "You don't have any marked bills to stack."

-- Option for stacking limit
Config.StackLimit = 10000000  -- Max value allowed for marked bills stacking
