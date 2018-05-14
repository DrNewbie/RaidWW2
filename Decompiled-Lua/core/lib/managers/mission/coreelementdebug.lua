slot3 = "CoreElementDebug"

core.module(slot1, core)

slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementDebug then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementDebug = slot0
function ElementDebug:init(...)
	slot3 = self

	ElementDebug.super.init(slot2, ...)

	return 
end
function ElementDebug:client_on_executed(...)
	slot3 = self

	self.on_executed(slot2, ...)

	return 
end
function ElementDebug:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	local prefix = "<debug>    "
	local text = prefix .. self._values.debug_string

	if not self._values.as_subtitle and self._values.show_instigator then
		slot8 = instigator
		text = text .. " - " .. tostring(slot7)
	end

	local color = self._values.color or (self._values.as_subtitle and Color.yellow)
	slot10 = self._values.as_subtitle

	managers.mission.add_fading_debug_output(slot6, managers.mission, text, color)

	slot8 = instigator

	ElementDebug.super.on_executed(slot6, self)

	return 
end
function ElementDebug:on_monitored_element(monitored_element_name, output_string)
	if not self._values.enabled then
		return 
	end

	local prefix = "<monitor>    "
	local text = prefix .. self._values.debug_string .. " " .. output_string

	if not self._values.as_subtitle and self._values.show_instigator then
		slot9 = monitored_element_name
		text = text .. " - " .. tostring(slot8)
	end

	local color = self._values.color or (self._values.as_subtitle and Color.yellow)
	slot11 = self._values.as_subtitle

	managers.mission.add_fading_debug_output(slot7, managers.mission, text, color)

	return 
end

return 
