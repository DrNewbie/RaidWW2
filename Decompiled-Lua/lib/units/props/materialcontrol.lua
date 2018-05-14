MaterialControl = MaterialControl or class()
function MaterialControl:init(unit)
	self._unit = unit

	return 
end
function MaterialControl:save(save_data)
	local data = {}
	slot8 = "material"
	local materials = self._unit.get_objects_by_type(slot4, Idstring(slot7))
	slot6 = materials

	for idx, material in ipairs(self._unit) do
		local material_data = {}
		slot12 = material
		material_data.time = material.time(slot11)
		slot12 = material
		material_data.is_playing = material.is_playing(slot11)
		slot12 = material
		material_data.playing_speed = material.playing_speed(slot11)
		data[idx] = material_data
	end

	save_data.material_control = data

	return 
end
function MaterialControl:load(load_data)
	local data = load_data.material_control

	if not data then
		return 
	end

	slot8 = "material"
	local materials = self._unit.get_objects_by_type(slot4, Idstring(slot7))
	slot6 = materials

	for idx, material in ipairs(self._unit) do
		local material_data = data[idx]

		if material_data then
			if material_data.is_playing then
				slot13 = material_data.playing_speed

				material.play(slot11, material)

				slot13 = material_data.time

				material.set_time(slot11, material)
			else
				slot12 = material

				material.stop(slot11)

				slot13 = material_data.time

				material.set_time(slot11, material)
			end
		end
	end

	return 
end
function MaterialControl:play(material_name, speed)
	slot8 = "material"
	local materials = self._unit.get_objects_by_type(slot4, Idstring(slot7))
	local material_id = Idstring(self._unit)
	slot7 = materials

	for i, material in ipairs(material_name) do
		slot12 = material

		if material.name(slot11) == material_id then
			slot13 = speed

			material.play(slot11, material)
		end
	end

	return 
end
function MaterialControl:stop(material_name)
	slot7 = "material"
	local materials = self._unit.get_objects_by_type(slot3, Idstring(slot6))
	local material_id = Idstring(self._unit)
	slot6 = materials

	for _, material in ipairs(material_name) do
		slot11 = material

		if material.name(slot10) == material_id then
			slot11 = material

			material.stop(slot10)
		end
	end

	return 
end
function MaterialControl:pause(material_name)
	slot7 = "material"
	local materials = self._unit.get_objects_by_type(slot3, Idstring(slot6))
	local material_id = Idstring(self._unit)
	slot6 = materials

	for _, material in ipairs(material_name) do
		slot11 = material

		if material.name(slot10) == material_id then
			slot11 = material

			material.pause(slot10)
		end
	end

	return 
end
function MaterialControl:set_time(material_name, time)
	slot8 = "material"
	local materials = self._unit.get_objects_by_type(slot4, Idstring(slot7))
	local material_id = Idstring(self._unit)
	slot7 = materials

	for _, material in ipairs(material_name) do
		slot12 = material

		if material.name(slot11) == material_id then
			slot13 = time

			material.set_time(slot11, material)
		end
	end

	return 
end

return 
