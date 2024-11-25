r = component.proxy(component.list("nc_fission_reactor")())
r.activate()
maxHeat = r.getMaxHeatLevel()
while true do
  local heat = r.getHeatLevel()
  print(heat)
  if heat > 2400000 then
    print("SCRAM! SCRAM! SCRAM!")
    r.deactivate()
    break
  end
  os.sleep(1)
end
