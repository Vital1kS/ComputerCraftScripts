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
                if turtle.getFuelLevel() < 400 then
                    printError("Fuel level is lower than safe 400 points")
                    return false
                end
            else
                turtle.refuel(itemsInSlot - 1)
            end
        end
    end
    print(("Current fuel level: %d"):format(turtle.getFuelLevel()))
    return true
end
return {
    checkFuel = checkFuel
}
