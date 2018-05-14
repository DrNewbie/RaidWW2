slot3 = "CorePlayerSlotStateInit"

core.module(slot1, core)

slot3 = "CorePlayerSlotStateDetectLocalUser"

core.import(slot1, core)

slot3 = "CorePlayerSlotStateLocalUserDebugBind"

core.import(slot1, core)

Init = Init or class()
function Init:init()
	slot3 = self.player_slot._init

	self.player_slot._init.task_started(slot2)

	return 
end
function Init:destroy()
	slot3 = self.player_slot._init

	self.player_slot._init.task_completed(slot2)

	return 
end
function Init:transition()
	slot3 = self.player_slot._perform_debug_local_user_binding

	if self.player_slot._perform_debug_local_user_binding.is_requested(slot2) then
		return CorePlayerSlotStateLocalUserDebugBind.LocalUserDebugBind
	else
		slot3 = self.player_slot._perform_local_user_binding

		if self.player_slot._perform_local_user_binding.is_requested(slot2) then
			return CorePlayerSlotStateDetectLocalUser.DetectLocalUser
		end
	end

	return 
end

return 
