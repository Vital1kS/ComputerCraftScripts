modem = peripheral.wrap("top")

rndB = math.random(1, 13)
rndM = math.random(21, 33)
rndT = math.random(41, 53)

random = false
chord = false
roll = true

if roll then 
    octaves = {0, 20, 40}
    for i = 1, #octaves do
        for j = 1, 13 do
            modem.transmit(j + octaves[i] , 0, "0.5")
            sleep(0.5)
        end
    end
end

if chord then 
    modem.transmit(9, 0, "5")
    modem.transmit(21, 0, "5")
    modem.transmit(44, 0, "5") 
end

if random then
    modem.transmit(rndB, 0, "5")
    modem.transmit(rndM, 0, "5")
    modem.transmit(rndT, 0, "5")
end
