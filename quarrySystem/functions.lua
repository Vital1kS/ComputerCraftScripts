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
                printError("Fuel level is lower than safe 500 points")
                return false
            end
        end
    end
    print(("Current fuel level: %d"):format(turtle.getFuelLevel()))
    return true
end

local function waitForMessage(correctMessage)
    peripheral.find("modem", rednet.open)
    if rednet.isOpen() then
        print("Rednet is connected")
        print("Waiting for message...")
        repeat
            sender_id, message, protocol = rednet.receive()
            if message ~= correctMessage then
                print("Received wrong message, continue waiting...")
            end
        until message == correctMessage
        print("Received correct message")
    end
end

return {
    checkFuel = checkFuel,
    waitForMessage = waitForMessage
}
