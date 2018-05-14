slot3 = "CoreFreezeStateMelted"

core.module(slot1, core)

Melted = Melted or class()
function Melted:init()
	slot3 = self.freeze_state

	self.freeze_state._set_stable_for_loading(slot2)

	return 
end
function Melted:destroy()
	slot3 = self.freeze_state

	self.freeze_state._not_stable_for_loading(slot2)

	return 
end
function Melted:transition()
	return 
end

return 
