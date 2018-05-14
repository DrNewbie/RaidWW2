slot2 = TeamAILogicBase
TeamAILogicInactive = class(slot1)
function TeamAILogicInactive.enter(data, new_logic_name, enter_params)
	local my_data = {}
	slot9 = my_data

	TeamAILogicBase.enter(slot5, data, new_logic_name, enter_params)

	slot6 = data.brain

	data.brain.rem_all_pos_rsrv(slot5)
	CopLogicBase._set_attention_obj(slot5, data, nil)

	slot6 = data

	CopLogicBase._destroy_all_detected_attention_object_data(slot5)

	slot6 = data

	CopLogicBase._reset_attention(slot5)

	data.internal_data = my_data
	slot6 = data.unit
	slot7 = false

	data.unit.brain(slot5).set_update_enabled_state(slot5, data.unit.brain(slot5))

	if data.objective then
		slot8 = true

		data.objective_failed_clbk(slot5, data.unit, data.objective)

		slot6 = data.unit
		slot7 = nil

		data.unit.brain(slot5).set_objective(slot5, data.unit.brain(slot5))
	end

	return 
end
function TeamAILogicInactive.exit(data, new_logic_name, enter_params)
	slot7 = enter_params

	TeamAILogicBase.exit(slot4, data, new_logic_name)

	slot5 = data.unit
	slot6 = true

	data.unit.brain(slot4).set_update_enabled_state(slot4, data.unit.brain(slot4))

	local my_data = data.internal_data
	slot6 = my_data

	TeamAILogicBase.cancel_delayed_clbks(data.unit.brain(slot4))

	return 
end
function TeamAILogicInactive.is_available_for_assignment(data)
	return false
end

return 
