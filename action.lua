local arg1 = ...
-- arg1 = duration

function play(duration)
    redstone.setOutput("back", true)
    sleep(tonumber(duration))
    redstone.setOutput("back", false)
end

play(arg1)