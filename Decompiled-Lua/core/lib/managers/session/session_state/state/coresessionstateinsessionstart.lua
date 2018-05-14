slot3 = "CoreSessionStateInSession"

core.module(slot1, core)

slot3 = "CoreSessionStateInSessionStarted"

core.import(slot1, core)

InSessionStart = InSessionStart or class()
function InSessionStart:init(session)
	slot4 = session

	assert(slot3)

	self._session = session

	return 
end
function InSessionStart:destroy()
	return 
end
function InSessionStart:transition()
	return CoreSessionStateInSessionStarted.Started, self._session
end

return 
