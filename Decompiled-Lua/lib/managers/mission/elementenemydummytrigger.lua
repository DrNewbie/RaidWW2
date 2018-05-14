slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementEnemyDummyTrigger then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementEnemyDummyTrigger = slot0
function ElementEnemyDummyTrigger:init(...)
	slot3 = self

	ElementEnemyDummyTrigger.super.init(slot2, ...)

	return 
end
function ElementEnemyDummyTrigger:on_script_activated()
	slot3 = self._values.elements

	for _, id in ipairs(slot2) do
		slot9 = id
		local element = self.get_mission_element(slot7, self)

		if element.add_event_callback then
			slot10 = self._values.event
			slot15 = "on_executed"

			element.add_event_callback(slot8, element, callback(slot12, self, self))
		end
	end

	return 
end
function ElementEnemyDummyTrigger:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	slot5 = instigator

	ElementEnemyDummyTrigger.super.on_executed(slot3, self)

	return 
end

return 
