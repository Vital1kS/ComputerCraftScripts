local functions = require("functions")
functions.checkFuel()
turtle.select(1)
turtle.turnLeft()
turtle.turnLeft()
x, y = 16, 16
local enoughItems = false
if turtle.getItemCount() >= x then
    enoughItems = turtle
else
    enoughItems= turtle.suck(16)
end
if isSucked then
    turtle.turnRight()
    turtle.turnRight()
    for i=1,x,1 do
        turtle.place()
        turtle.turnLeft()
        turtle.forward()
        turtle.turnRight()
    end
else
    printError("Cant suck tutles from chest")
end