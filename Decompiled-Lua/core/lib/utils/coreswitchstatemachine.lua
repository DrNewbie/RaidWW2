slot3 = "CoreSwitchStateMachine"

core.module(slot1, core)

slot3 = "CoreFiniteStateMachine"

core.import(slot1, core)

if not SwitchStateMachine then
	slot2 = CoreFiniteStateMachine.FiniteStateMachine
	slot0 = class(slot1)
end

SwitchStateMachine = slot0
function SwitchStateMachine:init(object_name, object)
	slot5 = object_name ~= nil

	assert(slot4)

	self._object_name = object_name
	self._object = object

	return 
end
function SwitchStateMachine:clear()
	slot3 = self

	self._destroy_current_state(slot2)

	return 
end
function SwitchStateMachine:switch_state(state_class, ...)
	slot5 = "You must specify a valid state class to switch to"

	assert(slot3, state_class)

	if self._state_class == state_class then
		return 
	end

	slot5 = state_class

	self._set_state(slot3, self, ...)

	return 
end

return 
