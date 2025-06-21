local arg1 = ...
-- arg1 = channel

modem = peripheral.wrap("top")
modem.closeAll()

while true do
    modem.open(tonumber(arg1))
    event, modemSide, senderChannel, replyChannel, message, senderDistance = os.pullEvent("modem_message")

    -- message should contain the duration
    shell.run("action", message)
end
