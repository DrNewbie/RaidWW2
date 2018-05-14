_OcclusionManager = _OcclusionManager or class()
function _OcclusionManager:init()
	slot3 = "model"
	self._model_ids = Idstring(slot2)
	self._skip_occlusion = {}

	return 
end
function _OcclusionManager:is_occluded(unit)
	slot5 = unit

	if self._skip_occlusion[unit.key(slot4)] then
		return false
	end

	slot4 = unit

	return unit.occluded(slot3)
end
function _OcclusionManager:remove_occlusion(unit)
	slot4 = unit

	if alive(slot3) then
		slot5 = self._model_ids
		local objects = unit.get_objects_by_type(slot3, unit)
		slot5 = objects

		for _, obj in pairs(unit) do
			slot11 = true

			obj.set_skip_occlusion(slot9, obj)
		end
	end

	slot5 = unit
	self._skip_occlusion[unit.key(slot4)] = true

	return 
end
function _OcclusionManager:add_occlusion(unit)
	slot4 = unit

	if alive(slot3) then
		slot5 = self._model_ids
		local objects = unit.get_objects_by_type(slot3, unit)
		slot5 = objects

		for _, obj in pairs(unit) do
			slot11 = false

			obj.set_skip_occlusion(slot9, obj)
		end
	end

	slot5 = unit
	self._skip_occlusion[unit.key(slot4)] = nil

	return 
end

return 
