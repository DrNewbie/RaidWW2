slot3 = "CorePlayerSlotStateDetectLocalUser"

core.module(slot1, core)

slot3 = "CorePlayerSlotStateLocalUserBound"

core.import(slot1, core)

slot3 = "CorePlayerSlotStateInit"

core.import(slot1, core)

DetectLocalUser = DetectLocalUser or class()
function DetectLocalUser:init()
	slot3 = self.player_slot._perform_local_user_binding

	self.player_slot._perform_local_user_binding.task_started(slot2)

	return 
end
function DetectLocalUser:destroy()
	slot3 = self.player_slot._perform_local_user_binding

	self.player_slot._perform_local_user_binding.task_completed(slot2)

	return 
end
function DetectLocalUser:transition()
	slot3 = self.player_slot._init

	if self.player_slot._init.is_requested(slot2) then
		return CorePlayerSlotStateInit.Init
	end

	local input_provider_ids_pressed_start = self._input_manager.input_provider_id_that_presses_start(slot2)
	slot4 = input_provider_ids_pressed_start

	for _, input_provider_id in pairs(self._input_manager) do
		slot10 = input_provider_id
		local has_id = self.player_slot._local_user_manager.has_local_user_with_input_provider_id(slot8, self.player_slot._local_user_manager)

		if not has_id then
			slot12 = input_provider_id

			self.player_slot._local_user_manager.bind_local_user(slot9, self.player_slot._local_user_manager, self.player_slot)

			slot11 = self.player_slot

			return CorePlayerSlotStateLocalUserBound.LocalUserBound, self.player_slot.assigned_user(self.player_slot._local_user_manager)
		end
	end

	return 
end

return 
