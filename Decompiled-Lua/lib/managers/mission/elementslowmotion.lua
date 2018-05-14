slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementSlowMotion then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementSlowMotion = slot0
function ElementSlowMotion:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	local eff_desc = tweak_data.timespeed.mission_effects[self._values.eff_name]

	if not eff_desc then
		slot6 = self._values.eff_name

		debug_pause(slot4, "[ElementSlowMotion] could not find effect")

		return 
	end

	slot6 = self._id
	local eff_id = "ElementSlowMotion_" .. tostring(slot5)
	slot8 = eff_desc

	managers.time_speed.play_effect(slot5, managers.time_speed, eff_id)

	slot7 = instigator

	ElementSlowMotion.super.on_executed(slot5, self)

	return 
end

return 
