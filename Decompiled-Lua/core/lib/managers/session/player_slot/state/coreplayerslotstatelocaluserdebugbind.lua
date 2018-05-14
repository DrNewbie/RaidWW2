slot3 = "CorePlayerSlotStateLocalUserDebugBind"

core.module(slot1, core)

slot3 = "CorePlayerSlotStateLocalUserBound"

core.import(slot1, core)

LocalUserDebugBind = UserDebugBind or class()
function LocalUserDebugBind:init()
	slot4 = self.player_slot

	self.player_slot._local_user_manager.debug_bind_primary_input_provider_id(slot2, self.player_slot._local_user_manager)

	return 
end
function LocalUserDebugBind:transition()
	slot4 = self.player_slot

	return CorePlayerSlotStateLocalUserBound.LocalUserBound, self.player_slot.assigned_user(slot3)
end

return 
