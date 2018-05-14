slot3 = "CoreSessionGenericState"

core.module(slot1, core)

State = State or class()
function State:init()
	return 
end
function State:_set_stable_for_loading()
	self._is_stable_for_loading = true

	return 
end
function State:_not_stable_for_loading()
	self._is_stable_for_loading = nil

	return 
end
function State:is_stable_for_loading()
	return self._is_stable_for_loading ~= nil
end
function State:transition()
	slot4 = "you must override transition()"

	assert(slot2, false)

	return 
end

return 
