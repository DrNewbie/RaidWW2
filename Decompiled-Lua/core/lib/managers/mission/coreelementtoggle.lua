slot3 = "CoreElementToggle"

core.module(slot1, core)

slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementToggle then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementToggle = slot0
function ElementToggle:init(...)
	slot3 = self

	ElementToggle.super.init(slot2, ...)

	return 
end
function ElementToggle:client_on_executed(...)
	slot3 = self

	self.on_executed(slot2, ...)

	return 
end
function ElementToggle:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	slot4 = self._values.elements

	for _, id in ipairs(slot3) do
		slot10 = id
		local element = self.get_mission_element(slot8, self)

		if element then
			if self._values.toggle == "on" then
				slot11 = true

				element.set_enabled(slot9, element)

				if self._values.set_trigger_times and -1 < self._values.set_trigger_times then
					slot11 = self._values.set_trigger_times

					element.set_trigger_times(slot9, element)
				end
			elseif self._values.toggle == "off" then
				slot11 = false

				element.set_enabled(slot9, element)
			else
				slot14 = "enabled"
				slot11 = not element.value(slot12, element)

				element.set_enabled(slot9, element)
			end

			slot10 = element
			slot14 = "enabled"

			element.on_toggle(slot9, element.value(slot12, element))
		end
	end

	slot5 = instigator

	ElementToggle.super.on_executed(slot3, self)

	return 
end

return 
