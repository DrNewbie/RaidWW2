-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- Decompilation Error: _glue_flows(node)

slot3 = "CoreControllerWrapper"

core.import(slot1, core)

if not ControllerWrapper then
	slot2 = CoreControllerWrapper.ControllerWrapper
	slot0 = class(slot1)
end

ControllerWrapper = slot0
function ControllerWrapper:init(...)
	self._input_released_cache = {}
	slot3 = self

	ControllerWrapper.super.init(slot2, ...)

	return 
end
function ControllerWrapper:reset_cache(check_time)
	slot4 = TimerManager
	slot4 = TimerManager.wall_running(slot3)
	local reset_cache_time = TimerManager.wall_running(slot3).time(slot3)

	if not check_time or self._reset_cache_time < reset_cache_time then
		slot5 = self._input_released_cache

		if next(slot4) then
			self._input_released_cache = {}
		end
	end

	slot6 = check_time

	ControllerWrapper.super.reset_cache(slot4, self)

	return 
end
function ControllerWrapper:get_input_released(connection_name)
	local cache = self._input_released_cache[connection_name]

	if cache == nil then
		if self._connection_map[connection_name] then
		else
			cache = false
		end

		self._input_released_cache[connection_name] = cache
	end

	return cache
end
function ControllerWrapper:clear_input_pressed_state(connection_name)
	self._input_pressed_cache[connection_name] = false
	self._input_released_cache[connection_name] = false

	return 
end
slot3 = ControllerWrapper

CoreClass.override_class(function (self, connection_name)
	self._input_pressed_cache[connection_name] = false
	self._input_released_cache[connection_name] = false

	return 
end, CoreControllerWrapper.ControllerWrapper)

return 
