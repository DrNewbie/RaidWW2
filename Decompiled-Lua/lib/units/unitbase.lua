-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
UnitBase = UnitBase or class()
function UnitBase:init(unit, update_enabled)
	self._unit = unit

	if not update_enabled then
		slot5 = self._unit
		local base_ext = self._unit.base(slot4)

		if base_ext ~= self then
			slot10 = base_ext.name_id
			slot12 = self._unit

			Application.error(slot5, Application, "UnitBase:init disabled updates of foreign class. \nExtension name: ", inspect(" \nUnit: "), inspect(slot11))
		end

		slot9 = "base"

		unit.set_extension_update_enabled(slot5, unit, Idstring(false))
	end

	slot5 = ListenerHolder
	self._destroy_listener_holder = ListenerHolder.new(slot4)

	return 
end
function UnitBase:add_destroy_listener(key, clbk)
	if not self._destroying then
		slot7 = clbk

		self._destroy_listener_holder.add(slot4, self._destroy_listener_holder, key)
	end

	return 
end
function UnitBase:remove_destroy_listener(key)
	slot5 = key

	self._destroy_listener_holder.remove(slot3, self._destroy_listener_holder)

	return 
end
function UnitBase:save(data)
	return 
end
function UnitBase:load(data)
	slot5 = self

	managers.worldcollection.add_world_loaded_callback(slot3, managers.worldcollection)

	return 
end
function UnitBase:pre_destroy(unit)
	self._destroying = true
	slot5 = unit

	self._destroy_listener_holder.call(slot3, self._destroy_listener_holder)

	slot4 = self._unit
	local unit_data = self._unit.unit_data(slot3)

	if unit_data and unit_data.dismembered_parts then
		slot5 = unit_data.dismembered_parts

		for _, u in ipairs(slot4) do
			slot10 = u

			if alive(slot9) then
				slot11 = 0

				u.set_slot(slot9, u)
			end
		end
	end

	if unit_data and unit_data.spawned_units then
		slot5 = unit_data.spawned_units

		for _, u in ipairs(slot4) do
			slot10 = u

			if alive(slot9) then
				slot11 = 0

				u.set_slot(slot9, u)
			end
		end
	end

	return 
end
function UnitBase:destroy(unit)
	if self._destroying then
		return 
	end

	slot5 = unit

	self._destroy_listener_holder.call(slot3, self._destroy_listener_holder)

	return 
end
function UnitBase:set_slot(unit, slot)
	slot6 = slot

	unit.set_slot(slot4, unit)

	return 
end
function UnitBase:on_world_loaded()

	-- Decompilation error in this vicinity:
	slot3 = self._unit

	if not alive(slot2) then
		return 
	end

	slot5 = self._unit

	worlddefinition.use_me(slot3, worlddefinition)

	return 
end

return 
