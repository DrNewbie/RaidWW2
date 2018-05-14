if not ScriptUnitData then
	slot2 = CoreScriptUnitData
	slot0 = class(slot1)
end

ScriptUnitData = slot0
local ids_lod = Idstring(slot1)
local ids_object3d = Idstring("lod")
slot4 = "wpn"
local ids_wpn = Idstring("object3d")
function ScriptUnitData:init(unit)
	slot4 = self

	CoreScriptUnitData.init(slot3)

	if managers.occlusion and self.skip_occlusion then
		slot5 = unit

		managers.occlusion.remove_occlusion(slot3, managers.occlusion)
	end

	slot4 = unit

	if unit.type(slot3) == ids_wpn then
		self.skip_distance_culling = true
	end

	if self.skip_distance_culling then
		slot7 = ids_lod

		for _, o in ipairs(unit.get_objects_by_type(slot5, unit)) do
			if o.set_skip_detail_distance_culling then
				slot10 = true

				o.set_skip_detail_distance_culling(slot8, o)
			end
		end

		slot7 = ids_object3d

		for _, o in ipairs(unit.get_objects_by_type(slot5, unit)) do
			if o.set_skip_detail_distance_culling then
				slot10 = true

				o.set_skip_detail_distance_culling(slot8, o)
			end
		end
	end

	return 
end
function ScriptUnitData:destroy(unit)
	slot4 = unit
	slot7 = "effect_spawner"
	local effect_spawners = unit.get_objects_by_type(slot3, Idstring(slot6))

	if effect_spawners then
		slot5 = effect_spawners

		for _, spawner in pairs(slot4) do
			slot10 = spawner

			spawner.kill_effect(slot9)
		end
	end

	if managers.occlusion and self.skip_occlusion then
		slot6 = unit

		managers.occlusion.add_occlusion(slot4, managers.occlusion)
	end

	if self._destroy_listener_holder then
		slot6 = unit

		self._destroy_listener_holder.call(slot4, self._destroy_listener_holder)
	end

	return 
end
function ScriptUnitData:add_destroy_listener(key, clbk)
	if not self._destroy_listener_holder then
		slot5 = ListenerHolder
		slot3 = ListenerHolder.new(slot4)
	end

	self._destroy_listener_holder = slot3
	slot7 = clbk

	self._destroy_listener_holder.add(slot4, self._destroy_listener_holder, key)

	return 
end
function ScriptUnitData:remove_destroy_listener(key)
	slot5 = key

	self._destroy_listener_holder.remove(slot3, self._destroy_listener_holder)

	slot4 = self._destroy_listener_holder

	if self._destroy_listener_holder.is_empty(slot3) then
		self._destroy_listener_holder = nil
	end

	return 
end

return 
