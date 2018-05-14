slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementAiGlobalEvent then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementAiGlobalEvent = slot0
ElementAiGlobalEvent._wave_modes = {
	"none",
	"assault",
	"besiege",
	"blockade",
	"hunt",
	"quiet",
	"passive"
}
ElementAiGlobalEvent._AI_events = {
	"none",
	"police_called",
	"police_weapons_hot",
	"gangsters_called",
	"gangster_weapons_hot"
}
ElementAiGlobalEvent._blames = {
	"none",
	"empty",
	"cop",
	"gangster",
	"civilian",
	"metal_detector",
	"security_camera",
	"civilian_alarm",
	"cop_alarm",
	"gangster_alarm",
	"motion_sensor",
	"glass_alarm",
	"blackmailer",
	"gensec",
	"police_alerted",
	"csgo_gunfire"
}
function ElementAiGlobalEvent:init(...)
	slot3 = self

	ElementAiGlobalEvent.super.init(slot2, ...)

	if self._values.event then
		self._values.wave_mode = self._values.event
		self._values.event = nil
	end

	slot4 = self._values

	self._finalize_values(slot2, self)

	return 
end
function ElementAiGlobalEvent:_finalize_values(values)
	slot5 = values.wave_mode
	values.wave_mode = table.index_of(slot3, self._wave_modes)
	slot5 = values.AI_event
	values.AI_event = table.index_of(slot3, self._AI_events)
	slot5 = values.blame
	values.blame = table.index_of(slot3, self._blames)

	return 
end
function ElementAiGlobalEvent:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	local wave_mode = self._wave_modes[self._values.wave_mode]
	local blame = self._blames[self._values.blame]
	local AI_event = self._AI_events[self._values.AI_event]

	if wave_mode and wave_mode ~= "none" then
		slot7 = managers.groupai
		slot8 = wave_mode

		managers.groupai.state(slot6).set_wave_mode(slot6, managers.groupai.state(slot6))
	end

	if not blame or blame == "none" then
		slot9 = blame

		Application.error(slot6, Application, "ElementAiGlobalEvent needs to be updated with blame parameter, and not none")
	end

	if AI_event and AI_event ~= "none" then
		if AI_event == "police_called" then
			slot7 = managers.groupai
			slot7 = managers.groupai.state(slot6)
			slot10 = managers.groupai
			slot12 = {
				"vo_cbt"
			}

			managers.groupai.state(slot6).on_police_called(slot6, managers.groupai.state(slot9).analyse_giveaway(slot9, blame, instigator))
		elseif AI_event == "police_weapons_hot" then
			slot7 = managers.groupai
			slot7 = managers.groupai.state(slot6)
			slot10 = managers.groupai
			slot12 = {
				"vo_cbt"
			}

			managers.groupai.state(slot6).on_police_weapons_hot(slot6, managers.groupai.state(slot9).analyse_giveaway(slot9, blame, instigator))
		elseif AI_event == "gangsters_called" then
			slot7 = managers.groupai
			slot7 = managers.groupai.state(slot6)
			slot10 = managers.groupai
			slot12 = {
				"vo_cbt"
			}

			managers.groupai.state(slot6).on_gangsters_called(slot6, managers.groupai.state(slot9).analyse_giveaway(slot9, blame, instigator))
		elseif AI_event == "gangster_weapons_hot" then
			slot7 = managers.groupai
			slot7 = managers.groupai.state(slot6)
			slot10 = managers.groupai
			slot12 = {
				"vo_cbt"
			}

			managers.groupai.state(slot6).on_gangster_weapons_hot(slot6, managers.groupai.state(slot9).analyse_giveaway(slot9, blame, instigator))
		end
	end

	slot8 = instigator

	ElementAiGlobalEvent.super.on_executed(slot6, self)

	return 
end

return 
