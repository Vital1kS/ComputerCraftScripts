local function checkFuel()
    if turtle.getFuelLevel < turtle.getFuelLimit then
        turtle.select(0)
        turtle.refuel()
    end
    print(("Current fuel level: %d"):format(turtle.getFuelLevel()))
end