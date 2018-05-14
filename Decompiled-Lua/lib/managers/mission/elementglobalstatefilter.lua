if not ElementGlobalStateFilter then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementGlobalStateFilter = slot0
function ElementGlobalStateFilter:init(...)
	slot3 = self

	ElementGlobalStateFilter.super.init(slot2, ...)

	return 
end
function ElementGlobalStateFilter:client_on_executed(...)
	slot3 = self

	self.on_executed(slot2, ...)

	return 
end
function ElementGlobalStateFilter:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	if self._values.flag and self._values.state then
		slot5 = self._values.flag
		local flag_state = managers.global_state.flag(slot3, managers.global_state)

		if self._values.state == "value" then
			slot8 = flag_state

			if managers.global_state.check_flag_value(slot4, managers.global_state, self._values.check_type, self._values.value) then
				slot6 = instigator

				ElementGlobalStateFilter.super.on_executed(slot4, self)
			end
		else
			local check_state = (self._values.state == "set" and true) or (self._values.state == "cleared" and false)

			if flag_state == check_state then
				slot7 = instigator

				ElementGlobalStateFilter.super.on_executed(slot5, self)
			end
		end
	else
		slot5 = "[ElementGlobalStateFilter:on_executed] Values for the flag or state not selected, check your mission element."

		Application.error(slot3, Application)
	end

	return 
end

return 
