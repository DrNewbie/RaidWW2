slot3 = "CoreSessionStateInSessionEnd"

core.module(slot1, core)

slot3 = "CoreSessionStateInit"

core.import(slot1, core)

InSessionEnd = InSessionEnd or class()
function InSessionEnd:init(session)
	slot4 = session

	assert(slot3)

	self._session = session
	slot4 = self._session._session_handler

	self._session._session_handler.session_ended(slot3)

	return 
end
function InSessionEnd:destroy()
	return 
end
function InSessionEnd:transition()
	return CoreSessionStateInit
end

return 
