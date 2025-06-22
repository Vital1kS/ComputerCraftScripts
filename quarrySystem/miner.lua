local functions = require("functions")

local columnToMine = 4
local startColumn = 1
local enableFilter = true

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
local function mineColumn()
    local blockMoved = 0
    turtle.digDown()
    while turtle.down() do
        turtle.digDown()
        blockMoved = blockMoved + 1
    end
    for i = 1, blockMoved, 1 do
        turtle.up()
    end
end
local function mineDoubleRow(depth)
    local blockMoved = 0
    for i = 1, depth - 1, 1 do
        turtle.dig()
        if not turtle.forward() then
            break
        end
        blockMoved = blockMoved + 1
    end
    for i = 1, blockMoved, 1 do
        turtle.digDown()
        turtle.back()
    end
end
local function mineRow(depth)
    local blockMoved = 0
    for i = 1, depth - 1, 1 do
        turtle.dig()
        if not turtle.forward() then
            break
        end
        blockMoved = blockMoved + 1
    end
    for i = 1, blockMoved, 1 do
        turtle.back()
    end
end
local function putItemsInChest(enableFilter)
    turtle.turnLeft()
    turtle.turnLeft()
    for i = 2, 16, 1 do
        turtle.select(i)
        local itemsInSlot = turtle.getItemCount()
        local itemsToLeave = 0
        if enableFilter then
            itemsToLeave = 1
        end
        if itemsInSlot > itemsToLeave then
            if not turtle.drop(itemsInSlot - itemsToLeave) then
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

local function mineToBedrock(startColumn, columnToMine, enableFilter)
    for i = startColumn, columnToMine, 2 do
        if not functions.checkFuel() then
            break
        end
        if not putItemsInChest(enableFilter) then
            break
        end
        for j = 1, i - 1, 1 do
            if turtle.detect() then
                turtle.dig()
            end
            turtle.forward()
        end
        if columnToMine - i == 0 then
            mineColumn()
        else
            mineDoubleColumn()
        end
        for j = 1, i - 1, 1 do
            turtle.back()
        end
    end
    putItemsInChest(enableFilter)
end

local function mineRoom(startHeight, height, depth)
    for i = startHeight, height, 2 do
        while not functions.checkFuel() do
            print("Load fuel and press Enter")
            read()
        end
        if not putItemsInChest(enableFilter) then
            break
        end
        for j = 1, i - 1, 1 do
            if turtle.detectDown() then
                turtle.digDown()
            end
            turtle.down()
        end
        if height - i == 0 then
            mineRow(depth)
        else
            mineDoubleRow(depth)
        end
        for j = 1, i - 1, 1 do
            turtle.up()
        end
    end
    putItemsInChest(enableFilter)
end
-- Main funtion
do
    functions.waitForMessage("start_mining")
    -- mineToBedrock(startColumn, columnToMine, enableFilter)
    mineRoom(1, 3, 4)
end
