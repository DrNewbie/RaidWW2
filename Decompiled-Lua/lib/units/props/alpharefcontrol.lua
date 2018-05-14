AlphaRefControl = AlphaRefControl or class()
slot2 = "alpha_ref"
local ids_alpha_ref = Idstring(slot1)
function AlphaRefControl:init(unit)
	self._unit = unit
	self._materials = {}
	slot7 = "material"
	local materials = self._unit.get_objects_by_type(slot3, Idstring(slot6))
	slot5 = materials

	for _, material in ipairs(self._unit) do
		slot11 = ids_alpha_ref

		if material.variable_exists(slot9, material) then
			slot10 = material
			local ids_mat_name = material.name(slot9)
			local mat_table = {}
			slot13 = material

			table.insert(slot11, mat_table)

			slot13 = 0

			table.insert(slot11, mat_table)

			slot13 = true

			table.insert(slot11, mat_table)

			slot13 = mat_table

			table.insert(slot11, self._materials)
		end
	end

	slot5 = self._materials

	if next(slot4) == nil then
		slot6 = "[AlphaRefControl:init] Unit needs at least one material with alpha_ref"

		Application.error(slot4, Application)
	end

	return 
end
function AlphaRefControl:update(unit, t, dt)
	slot6 = self._materials

	for _, data in pairs(slot5) do
		if not data[3] then
			local material = data[1]
			slot13 = ids_alpha_ref
			local alpha_ref = material.get_variable(slot11, material)
			alpha_ref = alpha_ref + dt * data[2]
			slot15 = alpha_ref

			material.set_variable(material, material, ids_alpha_ref)
		end
	end

	return 
end
function AlphaRefControl:play(material_name, speed)
	local ids_material_name = Idstring(slot4)
	slot6 = self._materials

	for _, data in pairs(material_name) do
		slot11 = data[1]

		if data[1].name(slot10) == ids_material_name then
			data[2] = speed
			data[3] = false

			break
		end
	end

	return 
end
function AlphaRefControl:stop(material_name)
	local ids_material_name = Idstring(slot3)
	slot5 = self._materials

	for _, data in pairs(material_name) do
		slot10 = data[1]

		if data[1].name(slot9) == ids_material_name then
			data[2] = 0
			data[3] = true

			break
		end
	end

	return 
end
function AlphaRefControl:pause(material_name)
	local ids_material_name = Idstring(slot3)
	slot5 = self._materials

	for _, data in pairs(material_name) do
		slot10 = data[1]

		if data[1].name(slot9) == ids_material_name then
			data[3] = true

			break
		end
	end

	return 
end
function AlphaRefControl:set_alpha_ref(material_name, alpha_ref)
	local ids_material_name = Idstring(slot4)
	slot6 = self._materials

	for _, data in pairs(material_name) do
		slot11 = data[1]

		if data[1].name(slot10) == ids_material_name then
			slot13 = alpha_ref

			data[1].set_variable(slot10, data[1], ids_alpha_ref)

			break
		end
	end

	return 
end

return 
