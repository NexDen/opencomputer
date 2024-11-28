local component = require("component")
local event = require("event")

local miner = component.proxy(component.list("digital_miner")())
local network = component.proxy(component.list("tunnel")())


while true do
    local _, _, _, _, _, message = event.pull("message")

    if message == "on" then
        miner.start()
    elseif message == "off" then
        miner.stop()
    end
end