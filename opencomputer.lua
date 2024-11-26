r = component.proxy(component.list("nc_fission_reactor")())
r.activate()
maxHeat = r.getMaxHeatLevel()
is_overheated = false
while true do
  local heat = r.getHeatLevel()
  if heat > maxHeat - 100000 then
    print("SCRAM! SCRAM! SCRAM!")
    r.deactivate()
    is_overheated = true
    break
  end
  if is_overheated then
    if heat < 100000 then
      print("Reactivating reactor")
      r.activate()
      is_overheated = false
    end
  end
  os.sleep(1)
end