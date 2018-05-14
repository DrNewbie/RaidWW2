-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreElementMotionPath"

core.module(slot1, core)

slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementMotionPathOperator then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementMotionPathOperator = slot0
function ElementMotionPathOperator:init(...)
	slot3 = self

	ElementMotionPathOperator.super.init(slot2, ...)

	return 
end
function ElementMotionPathOperator:client_on_executed(...)
	slot3 = self

	self.on_executed(slot2, ...)

	return 
end
function ElementMotionPathOperator:on_executed(instigator)

	-- Decompilation error in this vicinity:
	if not self._values.enabled then
		return 
	end

	slot6 = instigator

	ElementMotionPathOperator.super.on_executed(slot4, self)

	return 
end

if not ElementMotionPathTrigger then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementMotionPathTrigger = slot0
function ElementMotionPathTrigger:init(...)
	slot3 = self

	ElementMotionPathTrigger.super.init(slot2, ...)

	return 
end
function ElementMotionPathTrigger:on_script_activated()
	slot3 = self._values.elements

	for _, id in ipairs(slot2) do
		slot9 = id
		local element = self.get_mission_element(slot7, self)
		slot11 = self._values.outcome
		slot16 = "on_executed"

		element.add_trigger(self, element, self._id, callback(slot13, self, self))
	end

	return 
end
function ElementMotionPathTrigger:client_on_executed(...)
	return 
end
function ElementMotionPathTrigger:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	slot5 = instigator

	ElementMotionPathTrigger.super.on_executed(slot3, self)

	return 
end

return 
