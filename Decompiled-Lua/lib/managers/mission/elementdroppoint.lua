slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementDropPoint then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementDropPoint = slot0
function ElementDropPoint:init(...)
	slot3 = self

	ElementDropPoint.super.init(slot2, ...)

	self._network_execute = true

	if self._values.icon == "guis/textures/waypoint2" or self._values.icon == "guis/textures/waypoint" then
		self._values.icon = "wp_standard"
	end

	return 
end
function ElementDropPoint:on_script_activated()
	slot4 = self._id

	self._mission_script.add_save_state_cb(slot2, self._mission_script)

	return 
end
function ElementDropPoint:client_on_executed(...)
	slot3 = self

	self.on_executed(slot2, ...)

	return 
end
function ElementDropPoint:on_executed(instigator)
	return 

	if not self._values.enabled then
		return 
	end

	slot5 = instigator

	ElementDropPoint.super.on_executed(slot3, self)

	return 
end
function ElementDropPoint:operation_remove()
	return 
end

return 
