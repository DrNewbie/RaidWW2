slot3 = "CoreSessionResponse"

core.module(slot1, core)

Done = Done or class()
Done.DONE = 1
function Done:done()
	slot4 = Done.DONE

	self._set_response(slot2, self)

	return 
end
function Done:_is_response_value(value)
	slot5 = "You can not check a destroyed response object!"

	assert(slot3, not self._is_destroyed)

	return self._response == value
end
function Done:is_done()
	slot4 = Done.DONE

	return self._is_response_value(slot2, self)
end
function Done:_set_response(value)
	slot5 = "You can not respond to a destroyed response object!"

	assert(slot3, not self._is_destroyed)

	slot5 = "Response has already been set!"

	assert(slot3, self._response == nil)

	self._response = value

	return 
end
function Done:destroy()
	self._is_destroyed = true

	return 
end

if not DoneOrFinished then
	slot2 = Done
	slot0 = class(slot1)
end

DoneOrFinished = slot0
DoneOrFinished.FINISHED = 2
function DoneOrFinished:finished()
	slot4 = DoneOrFinished.FINISHED

	self._set_response(slot2, self)

	return 
end
function DoneOrFinished:is_finished()
	slot4 = DoneOrFinished.FINISHED

	return self._is_response_value(slot2, self)
end

return 
