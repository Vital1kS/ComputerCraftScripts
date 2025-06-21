local arg1 = ...
-- arg1 = channel

modem = peripheral.wrap("top")

while true do
    modem.open(tonumber(arg1))
    event, modemSide, senderChannel, replyChannel, message, senderDistance = os.pullEvent("modem_message")

    -- message should contain the lua file name or command
    shell.run(message)
end
