slot3 = "CoreGameStatePreFrontEnd"

core.module(slot1, core)

slot3 = "CoreGameStateFrontEnd"

core.import(slot1, core)

PreFrontEnd = PreFrontEnd or class()
function PreFrontEnd:init()
	slot3 = self.game_state
	local player_slot = self.game_state.player_slots(slot2).primary_slot(slot2)
	slot4 = player_slot

	player_slot._release_user_from_slot(self.game_state.player_slots(slot2))

	self.game_state._is_in_pre_front_end = true

	return 
end
function PreFrontEnd:destroy()
	self.game_state._is_in_pre_front_end = false

	return 
end
function PreFrontEnd:transition()
	slot3 = self.game_state
	slot3 = self.game_state.player_slots(slot2)

	if not self.game_state.player_slots(slot2).has_primary_local_user(slot2) then
		return 
	end

	slot3 = self.game_state
	local local_user = self.game_state.player_slots(slot2).primary_local_user(slot2)
	slot4 = local_user

	if local_user.profile_data_is_loaded(self.game_state.player_slots(slot2)) then
		return CoreGameStateFrontEnd.FrontEnd
	end

	return 
end

return 
