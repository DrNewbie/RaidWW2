slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementAreaMinPoliceForce then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementAreaMinPoliceForce = slot0
function ElementAreaMinPoliceForce:init(...)
	slot3 = self

	ElementAreaMinPoliceForce.super.init(slot2, ...)

	self._network_execute = true

	return 
end
function ElementAreaMinPoliceForce:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	slot4 = self

	self.operation_add(slot3)

	slot5 = instigator

	ElementAreaMinPoliceForce.super.on_executed(slot3, self)

	return 
end
function ElementAreaMinPoliceForce:operation_add()
	slot3 = managers.groupai
	slot6 = self._values.position

	managers.groupai.state(slot2).set_area_min_police_force(slot2, managers.groupai.state(slot2), self._id, self._values.amount)

	return 
end
function ElementAreaMinPoliceForce:operation_remove()
	slot3 = managers.groupai
	slot4 = self._id

	managers.groupai.state(slot2).set_area_min_police_force(slot2, managers.groupai.state(slot2))

	return 
end

return 
