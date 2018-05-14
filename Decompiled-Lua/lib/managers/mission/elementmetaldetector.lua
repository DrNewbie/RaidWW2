slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementMetalDetector then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementMetalDetector = slot0
function ElementMetalDetector:init(...)
	slot3 = self

	ElementMetalDetector.super.init(slot2, ...)

	return 
end
function ElementMetalDetector:client_on_executed(...)
	return 
end
function ElementMetalDetector:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	slot5 = instigator

	ElementMetalDetector.super.on_executed(slot3, self)

	return 
end

return 
