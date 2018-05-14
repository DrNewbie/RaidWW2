slot3 = "CoreDialogState"

core.module(slot1, core)

slot3 = "CoreFiniteStateMachine"

core.import(slot1, core)

slot3 = "CoreDialogStateNone"

core.import(slot1, core)

slot3 = "CoreSessionGenericState"

core.import(slot1, core)

if not DialogState then
	slot2 = CoreSessionGenericState.State
	slot0 = class(slot1)
end

DialogState = slot0
DialogState.init = function (self)
	slot6 = self
	self._state = CoreFiniteStateMachine.FiniteStateMachine.new(slot2, CoreFiniteStateMachine.FiniteStateMachine, CoreDialogStateNone.None, "dialog_state")

	return 
end
DialogState.set_debug = function (self, debug_on)
	slot5 = debug_on

	self._state.set_debug(slot3, self._state)

	return 
end
DialogState.default_data = function (data)
	data.start_state = "CoreFreezeStateMelted.Melted"

	return 
end
DialogState.save = function (self, data)
	slot5 = data.start_state

	self._state.save(slot3, self._state)

	return 
end
DialogState.transition = function (self)
	slot3 = self._state

	self._state.transition(slot2)

	return 
end

return 
