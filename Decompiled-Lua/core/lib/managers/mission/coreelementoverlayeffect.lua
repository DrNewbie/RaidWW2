slot3 = "CoreElementOverlayEffect"

core.module(slot1, core)

slot3 = "CoreEngineAccess"

core.import(slot1, core)

slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

slot3 = "CoreTable"

core.import(slot1, core)

if not ElementOverlayEffect then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementOverlayEffect = slot0
function ElementOverlayEffect:init(...)
	slot3 = self

	ElementOverlayEffect.super.init(slot2, ...)

	return 
end
function ElementOverlayEffect:client_on_executed(...)
	slot3 = self

	self.on_executed(slot2, ...)

	return 
end
function ElementOverlayEffect:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	if self._values.effect ~= "none" then
		slot6 = managers.overlay_effect
		local effect = CoreTable.clone(slot3)
		effect.sustain = self._values.sustain or effect.sustain
		effect.fade_in = self._values.fade_in or effect.fade_in
		effect.fade_out = self._values.fade_out or effect.fade_out
		slot6 = effect

		managers.overlay_effect.play_effect(managers.overlay_effect.presets(slot5)[self._values.effect], managers.overlay_effect)
	else
		slot4 = Application

		if Application.editor(slot3) then
			slot8 = self
			slot5 = "Cant activate overlay effect \"none\" [" .. self.editor_name(slot7) .. "]"

			managers.editor.output_error(slot3, managers.editor)
		end
	end

	slot5 = instigator

	ElementOverlayEffect.super.on_executed(slot3, self)

	return 
end

return 
