slot3 = "CoreRequester"

core.module(slot1, core)

Requester = Requester or class()
function Requester:request()
	self._requested = true

	return 
end
function Requester:cancel_request()
	self._requested = nil

	return 
end
function Requester:is_requested()
	return self._requested == true
end
function Requester:task_started()
	self._task_is_running = true

	return 
end
function Requester:task_completed()
	slot4 = "The task can not be completed, since it hasn't started"

	assert(slot2, self._task_is_running ~= nil)

	self._task_is_running = nil
	self._requested = nil

	return 
end
function Requester:is_task_running()
	return self._task_is_running
end
function Requester:force_task_completed()
	self._task_is_running = nil
	self._requested = nil

	return 
end

return 
