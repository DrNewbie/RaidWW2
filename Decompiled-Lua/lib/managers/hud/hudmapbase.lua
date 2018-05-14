-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
HUDMapBase = HUDMapBase or class()
function HUDMapBase:init(params)
	if not params.name then
		slot4 = self
		slot2 = self._get_fallback_name(slot3)
	end

	self._name = slot2

	return 
end
function HUDMapBase:show()
	slot4 = self._name
	slot9 = "update"

	managers.hud.add_updator(slot2, managers.hud, callback(slot6, self, self))

	return 
end
function HUDMapBase:hide()
	slot4 = self._name

	managers.hud.remove_updator(slot2, managers.hud)

	return 
end
function HUDMapBase:update()
	return 
end
function HUDMapBase:set_x(x)
	slot5 = x

	self._object.set_x(slot3, self._object)

	return 
end
function HUDMapBase:set_y(y)
	slot5 = y

	self._object.set_y(slot3, self._object)

	return 
end
function HUDMapBase:w()
	slot3 = self._object

	return self._object.w(slot2)
end
function HUDMapBase:h()
	slot3 = self._object

	return self._object.h(slot2)
end
function HUDMapBase:_get_fallback_name()
	slot4 = "%05d"
	slot7 = 99999

	return "map_" .. string.format(slot3, math.random(slot6))
end
function HUDMapBase:_current_level_has_map()
	slot3 = self
	local player_world = self._get_current_player_level(slot2)

	if player_world and tweak_data.levels[player_world] and tweak_data.levels[player_world].map then
		return true
	end

	return false
end
function HUDMapBase:_set_level(level)
	self._current_level = level
	slot4 = tweak_data.levels[level].map.world_borders
	self._world_borders = deep_clone(slot3)

	return 
end
function HUDMapBase:_get_current_player_level()

	-- Decompilation error in this vicinity:
	slot3 = managers.raid_job
	local current_job = managers.raid_job.current_job(slot2)

	if current_job.job_type == OperationsTweakData.JOB_TYPE_OPERATION then
		local current_event_id = current_job.events_index[current_job.current_event]
		local current_event = current_job.events[current_event_id]

		return current_event.level_id
	elseif current_job.job_type == OperationsTweakData.JOB_TYPE_RAID then
		return current_job.level_id
	end

	return nil
end

return 
