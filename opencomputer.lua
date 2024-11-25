r = component.proxy(component.list("nc_fission_reactor")())

maxHeat = r.getMaxHeatLevel()
while true do
  local heat = r.getHeatLevel()
  if heat > 1000 then
    print("SCRAM! SCRAM! SCRAM!")
    r.deactivate()
  end
  os.sleep(1)
end