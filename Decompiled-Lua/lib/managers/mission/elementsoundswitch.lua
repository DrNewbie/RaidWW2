if not ElementSoundSwitch then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementSoundSwitch = slot0
ElementSoundSwitch.SWITCHES = {
	"daytime_set_day",
	"daytime_set_night"
}
ElementSoundSwitch.SWITCH_VALUES = {
	daytime_set_day = {
		value = "day",
		name = "daytime_switch",
		type = "ambience"
	},
	daytime_set_night = {
		value = "night",
		name = "daytime_switch",
		type = "ambience"
	}
}
function ElementSoundSwitch:init(...)
	self._has_executed = false
	slot3 = self

	ElementSoundSwitch.super.init(slot2, ...)

	return 
end
function ElementSoundSwitch:stop_simulation(...)
	slot3 = self

	ElementSoundSwitch.super.destroy(slot2, ...)

	return 
end
function ElementSoundSwitch:save(data)
	data.has_executed = self._has_executed

	return 
end
function ElementSoundSwitch:load(data)
	self._has_executed = data.has_executed

	if self._has_executed == true then
		slot4 = self

		self._apply_switch(slot3)
	end

	return 
end
function ElementSoundSwitch:client_on_executed(...)
	slot3 = self

	self.on_executed(slot2, ...)

	return 
end
function ElementSoundSwitch:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	self._has_executed = true
	slot4 = self

	self._apply_switch(slot3)

	slot5 = instigator

	ElementSoundSwitch.super.on_executed(slot3, self)

	return 
end
function ElementSoundSwitch:_apply_switch()
	local switch = ElementSoundSwitch.SWITCH_VALUES[self._values.switch]

	if not switch then
		slot6 = self._values.switch

		Application.error(slot3, Application, "[ElementSoundSwitch:_apply_switch]  attempting to set an unknown switch: ")

		return 
	end

	if switch.type == "ambience" then
		slot5 = "[ElementSoundSwitch:_apply_switch]  "
		slot8 = self._values.switch

		Application.trace(slot3, Application, inspect(slot7))

		slot6 = switch.value

		managers.sound_environment.apply_ambience_switch(slot3, managers.sound_environment, switch.name)
	end

	return 
end

return 
