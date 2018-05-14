-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
SyncUnitData = SyncUnitData or class()
function SyncUnitData:init(unit)
	self._unit = unit

	return 
end
function SyncUnitData:save(data)
	local state = {
		lights = {}
	}
	slot7 = self._unit
	slot10 = "light"

	for _, light in ipairs(self._unit.get_objects_by_type(slot6, Idstring(slot9))) do
		local l = {}
		slot11 = light
		l.name = light.name(slot10)
		slot11 = light
		l.enabled = light.enable(slot10)
		slot11 = light
		l.far_range = light.far_range(slot10)
		slot11 = light
		l.near_range = light.near_range(slot10)
		slot11 = light
		l.color = light.color(slot10)
		slot11 = light
		l.spot_angle_start = light.spot_angle_start(slot10)
		slot11 = light
		l.spot_angle_end = light.spot_angle_end(slot10)
		slot11 = light
		l.multiplier_nr = light.multiplier(slot10)
		slot11 = light
		l.specular_multiplier_nr = light.specular_multiplier(slot10)
		slot11 = light
		l.falloff_exponent = light.falloff_exponent(slot10)
		slot12 = l

		table.insert(slot10, state.lights)
	end

	slot5 = self._unit
	state.projection_light = self._unit.unit_data(slot4).projection_light
	slot5 = self._unit
	state.projection_textures = self._unit.unit_data(slot4).projection_textures
	data.SyncUnitData = state

	return 
end
function SyncUnitData:load(data)
	self._sync_state = data.SyncUnitData
	slot5 = self

	managers.worldcollection.add_world_loaded_callback(slot3, managers.worldcollection)

	return 
end
function SyncUnitData:on_world_loaded()

	-- Decompilation error in this vicinity:
	slot3 = self._unit

	if not alive(slot2) then
		return 
	end

	slot4 = self._unit
	self._unit.unit_data(slot2).unit_id = self._unit.editor_id(self._unit)
	slot8 = self._unit
	slot6 = self._unit.unit_data(slot7).unit_id
	slot3 = worlddefinition.get_original_unit_id(slot4, worlddefinition)
	self._sync_state.original_unit_id = slot3
	slot6 = self._sync_state

	worlddefinition.setup_lights(slot3, worlddefinition, self._unit)

	slot6 = self._sync_state

	worlddefinition.setup_projection_light(slot3, worlddefinition, self._unit)

	return 
end

return 
