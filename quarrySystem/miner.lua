local functions = require("functions")

local function mineDoubleColumn()
    local blockMoved = 0
    turtle.digDown()
    while turtle.down() do
        turtle.digDown()
        blockMoved = blockMoved + 1
    end
    for i = 1, blockMoved, 1 do
        turtle.dig()
        turtle.up()
    end
end

local function putItemsInChest()
    turtle.turnLeft()
    turtle.turnLeft()
    for i = 2, 16, 1 do
        turtle.select(i)
        local itemsInSlot = turtle.getItemCount()
        if itemsInSlot > 1 then
            if not turtle.drop(itemsInSlot - 1) then
                printError("Chest's inventory is full")
                turtle.turnRight()
                turtle.turnRight()
                return false
            end
        end
    end
    turtle.turnRight()
    turtle.turnRight()
    return true
end

local columnToMine = 16
for i = 1, columnToMine, 2 do
    if not functions.checkFuel() then
        break
    end
    if not putItemsInChest() then
        break
    end
    for j = 1, i - 1, 1 do
        if turtle.detect() then
            turtle.dig()
        end
        turtle.forward()
    end
    mineDoubleColumn()
    for j = 1, i - 1, 1 do
        turtle.back()
    end
end
