slot3 = "CoreDialogStateNone"

core.module(slot1, core)

None = None or class()
function None:init()
	slot3 = self.dialog_state

	self.dialog_state._set_stable_for_loading(slot2)

	return 
end
function None:destroy()
	self.dialog_state._not_stable_for_loading()

	return 
end
function None:transition()
	return 
end

return 
