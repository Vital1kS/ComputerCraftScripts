local function checkFuel()
    if turtle.getFuelLevel() < turtle.getFuelLimit() then
        turtle.select(1)
        local is_fuel, reason = turtle.refuel(0)
        if not is_fuel then
            printError(reason)
            return false
        else
            local itemsInSlot = turtle.getItemCount()
            if itemsInSlot == 1 then
                print("Add more fuel to slot 1")
            else
                turtle.refuel(itemsInSlot - 1)
            end
            if turtle.getFuelLevel() < 500 then
                printError(("Fuel level is lower than safe 500 points, currentLevel: %d"):format(turtle.getFuelLevel()))
                return false
            end
        end
    end
    print(("Current fuel level: %d"):format(turtle.getFuelLevel()))
    return true
end

local function waitForMessage(correctProtocol)
    peripheral.find("modem", rednet.open)
    if rednet.isOpen() then
        print("Rednet is connected")
        print("Waiting for message...")
        repeat
            sender_id, message, protocol = rednet.receive("vitalik_net")
            return message
        until protocol == correctPprotocol
    else
        printError("Modem not found")
        return nil
    end
end

return {
    checkFuel = checkFuel,
    waitForMessage = waitForMessage
}
