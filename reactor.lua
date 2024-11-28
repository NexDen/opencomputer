local component = require("component")
local event = require("event")

local reactor = component.proxy(component.list("nc_fission_reactor")())
local network = component.proxy(component.list("tunnel")())
-- NO SCRAMMING
prevIsOn = false
while true do
  local isOn = reactor.isReactorOn()
  if isOn then
    if not prevIsOn then
      network.send("on")
      prevIsOn = true
    end
  else
    if prevIsOn then
      network.send("off")
      prevIsOn = false
    end
  end
  
end