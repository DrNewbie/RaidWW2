-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementWaypoint then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementWaypoint = slot0
function ElementWaypoint:init(...)
	slot3 = self

	ElementWaypoint.super.init(slot2, ...)

	self._network_execute = true

	if self._values.icon == "guis/textures/waypoint2" or self._values.icon == "guis/textures/waypoint" then
		self._values.icon = "wp_standard"
	end

	return 
end
function ElementWaypoint:_get_unique_id()
	local uid = self._sync_id .. self._id

	return uid
end
function ElementWaypoint:on_script_activated()
	slot4 = self._id

	self._mission_script.add_save_state_cb(slot2, self._mission_script)

	return 
end
function ElementWaypoint:client_on_executed(...)
	slot3 = self

	self.on_executed(slot2, ...)

	return 
end
function ElementWaypoint:on_executed(instigator)

	-- Decompilation error in this vicinity:
	if not self._values.enabled then
		return 
	end

	slot5 = instigator

	ElementWaypoint.super.on_executed(slot3, self)

	return 
end
function ElementWaypoint:operation_remove()
	slot3 = managers.hud
	slot6 = self

	managers.hud.remove_waypoint(slot2, self._get_unique_id(slot5))

	return 
end
function ElementWaypoint:pre_destroy()
	slot3 = managers.hud
	slot6 = self

	managers.hud.remove_waypoint(slot2, self._get_unique_id(slot5))

	return 
end

return 
