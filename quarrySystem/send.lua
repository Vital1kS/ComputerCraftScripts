-- 0 - for mining to bedrock
-- 1 - for room mining
-- OP[0] (startColumn <1>, columnCount <16>, useFilters <false>)
-- OP[1] (startHeight <1>, height <3>, depth <4>)
local operationType = 0
local arg1, arg2, arg3 = 1, 4, false
peripheral.find("modem", rednet.open)
if rednet.isOpen() then
    print("Rednet is connected")
    rednet.broadcast({operationType, arg1, arg2, arg3}, "vitalik_net")
end
