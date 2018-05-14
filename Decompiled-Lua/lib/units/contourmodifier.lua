ContourModifier = ContourModifier or class()
slot2 = "contour_opacity"
local ids_contour_opacity = Idstring(slot1)
function ContourModifier:init(unit)
	self._unit = unit

	return 
end
function ContourModifier:turn_off(material_name)
	slot7 = material_name
	local material = self._unit.material(slot3, Idstring(slot6))
	slot7 = 0

	material.set_variable(self._unit, material, ids_contour_opacity)

	return 
end
function ContourModifier:turn_on(material_name)
	slot7 = material_name
	local material = self._unit.material(slot3, Idstring(slot6))
	slot7 = 1

	material.set_variable(self._unit, material, ids_contour_opacity)

	return 
end

return 
