slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementBlackscreenVariant then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementBlackscreenVariant = slot0
function ElementBlackscreenVariant:init(...)
	slot3 = self

	ElementBlackscreenVariant.super.init(slot2, ...)

	return 
end
function ElementBlackscreenVariant:client_on_executed(...)
	slot3 = self

	self.on_executed(slot2, ...)

	return 
end
function ElementBlackscreenVariant:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	slot4 = managers.groupai
	slot4 = managers.groupai.state(slot3)
	slot7 = self._values.variant

	managers.groupai.state(slot3).set_blackscreen_variant(slot3, tonumber(slot6))

	slot5 = instigator

	ElementBlackscreenVariant.super.on_executed(slot3, self)

	return 
end

if not ElementEndscreenVariant then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementEndscreenVariant = slot0
function ElementEndscreenVariant:init(...)
	slot3 = self

	ElementEndscreenVariant.super.init(slot2, ...)

	return 
end
function ElementEndscreenVariant:client_on_executed(...)
	slot3 = self

	self.on_executed(slot2, ...)

	return 
end
function ElementEndscreenVariant:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	slot4 = managers.groupai
	slot4 = managers.groupai.state(slot3)
	slot7 = self._values.variant

	managers.groupai.state(slot3).set_endscreen_variant(slot3, tonumber(slot6))

	slot5 = instigator

	ElementEndscreenVariant.super.on_executed(slot3, self)

	return 
end

return 
