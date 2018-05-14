slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementEnableSoundEnvironment then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementEnableSoundEnvironment = slot0
function ElementEnableSoundEnvironment:init(...)
	slot3 = self

	ElementEnableSoundEnvironment.super.init(slot2, ...)

	return 
end
function ElementEnableSoundEnvironment:client_on_executed(...)
	slot3 = self

	self.on_executed(slot2, ...)

	return 
end
function ElementEnableSoundEnvironment:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	slot4 = self._values.elements

	for _, name in pairs(slot3) do
		slot11 = self._values.enable

		managers.sound_environment.enable_area(slot8, managers.sound_environment, name)
	end

	slot5 = instigator

	ElementEnableSoundEnvironment.super.on_executed(slot3, self)

	return 
end

return 
