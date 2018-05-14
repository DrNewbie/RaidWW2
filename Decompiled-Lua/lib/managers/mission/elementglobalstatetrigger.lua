if not ElementGlobalStateTrigger then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementGlobalStateTrigger = slot0
function ElementGlobalStateTrigger:init(...)
	slot3 = self

	ElementGlobalStateTrigger.super.init(slot2, ...)

	slot5 = self._values.flag

	managers.global_state.register_trigger(slot2, managers.global_state, self)

	return 
end
function ElementGlobalStateTrigger:client_on_executed(...)
	slot3 = self

	self.on_executed(slot2, ...)

	return 
end
function ElementGlobalStateTrigger:execute(flag, state, event)
	if not self._values.enabled then
		return 
	end

	if self._values.flag == flag then
		if event then
			if self._values.on_event then
				slot6 = self

				self.on_executed(slot5)
			end
		elseif self._values.on_value then
			slot9 = state

			if managers.global_state.check_flag_value(slot5, managers.global_state, self._values.check_type, self._values.value) then
				slot6 = self

				self.on_executed(slot5)
			end
		elseif (self._values.on_set and state) or (self._values.on_clear and not state) then
			slot6 = self

			self.on_executed(slot5)
		end
	end

	return 
end
function ElementGlobalStateTrigger:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	slot5 = instigator

	ElementGlobalStateTrigger.super.on_executed(slot3, self)

	return 
end
function ElementGlobalStateTrigger:destroy()
	slot5 = self._values.flag

	managers.global_state.unregister_trigger(slot2, managers.global_state, self)

	return 
end
function ElementGlobalStateTrigger:unregister()
	slot5 = self._values.flag

	managers.global_state.unregister_trigger(slot2, managers.global_state, self)

	return 
end

return 
