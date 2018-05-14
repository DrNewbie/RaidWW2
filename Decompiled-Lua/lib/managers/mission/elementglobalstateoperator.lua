if not ElementGlobalStateOperator then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementGlobalStateOperator = slot0
function ElementGlobalStateOperator:init(...)
	slot3 = self

	ElementGlobalStateOperator.super.init(slot2, ...)

	return 
end
function ElementGlobalStateOperator:client_on_executed(...)
	slot3 = self

	self.on_executed(slot2, ...)

	return 
end
function ElementGlobalStateOperator:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	local flag = self._values.flag
	local value = self._values.value
	local action = self._values.action

	if action == "set" then
		slot8 = flag

		managers.global_state.set_flag(slot6, managers.global_state)
	elseif action == "clear" then
		slot8 = flag

		managers.global_state.clear_flag(slot6, managers.global_state)
	elseif action == "default" then
		slot8 = flag

		managers.global_state.set_to_default(slot6, managers.global_state)
	elseif action == "event" then
		slot8 = flag

		managers.global_state.fire_event(slot6, managers.global_state)
	elseif action == "set_value" then
		slot9 = value

		managers.global_state.set_value_flag(slot6, managers.global_state, flag)
	end

	slot8 = instigator

	ElementGlobalStateOperator.super.on_executed(slot6, self)

	return 
end

return 
