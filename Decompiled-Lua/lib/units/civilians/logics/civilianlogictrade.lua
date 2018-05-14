slot2 = CopLogicTrade
CivilianLogicTrade = class(slot1)
function CivilianLogicTrade._chk_request_action_walk_to_flee_pos(data, my_data, end_rot)
	local new_action_data = {
		type = "walk",
		nav_path = my_data.flee_path,
		variant = "run",
		body_part = 2
	}
	slot6 = data.unit
	slot7 = new_action_data
	my_data.walking_to_flee_pos = data.unit.brain(slot5).action_request(slot5, data.unit.brain(slot5))
	my_data.flee_path = nil

	return 
end

return 
