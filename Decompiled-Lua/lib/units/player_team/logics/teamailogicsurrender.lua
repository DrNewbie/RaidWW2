slot2 = TeamAILogicBase
TeamAILogicSurrender = class(slot1)
TeamAILogicSurrender.on_cop_neutralized = TeamAILogicIdle.on_cop_neutralized
TeamAILogicSurrender.on_alert = TeamAILogicIdle.on_alert
TeamAILogicSurrender.on_recovered = TeamAILogicDisabled.on_recovered
function TeamAILogicSurrender.enter(data, new_logic_name, enter_params)
	local my_data = {
		unit = data.unit
	}
	slot9 = my_data

	TeamAILogicBase.enter(slot5, data, new_logic_name, enter_params)

	slot6 = data.unit

	data.unit.brain(slot5).cancel_all_pathing_searches(slot5)

	local old_internal_data = data.internal_data
	slot8 = "enemies"
	my_data.enemy_detect_slotmask = managers.slot.get_mask(data.unit.brain(slot5), managers.slot)
	my_data.vision = data.char_tweak.vision.idle

	if old_internal_data then
		my_data.attention_unit = old_internal_data.attention_unit
	end

	local action_data = {
		variant = "tied",
		body_part = 1,
		type = "act"
	}
	slot8 = data.unit
	slot9 = action_data

	data.unit.brain(slot7).action_request(slot7, data.unit.brain(slot7))

	slot8 = data.unit
	slot9 = false

	data.unit.brain(slot7).set_update_enabled_state(slot7, data.unit.brain(slot7))

	data.internal_data = my_data
	slot8 = data.unit
	slot9 = false

	data.unit.movement(slot7).set_allow_fire(slot7, data.unit.movement(slot7))

	slot8 = data.unit
	slot9 = "free"

	data.unit.interaction(slot7).set_tweak_data(slot7, data.unit.interaction(slot7))

	slot8 = data.unit
	slot10 = false

	data.unit.interaction(slot7).set_active(slot7, data.unit.interaction(slot7), true)

	slot8 = data.unit
	slot9 = true

	data.unit.character_damage(slot7).set_invulnerable(slot7, data.unit.character_damage(slot7))

	slot8 = data.unit
	slot8 = data.unit.character_damage(slot7)

	data.unit.character_damage(slot7).stop_bleedout(slot7)

	slot8 = data.unit
	slot10 = 24

	data.unit.base(slot7).set_slot(slot7, data.unit.base(slot7), data.unit)

	slot8 = managers.groupai
	slot9 = data.unit

	managers.groupai.state(slot7).on_criminal_neutralized(slot7, managers.groupai.state(slot7))

	slot10 = "untie"

	TeamAILogicDisabled._register_revive_SO(slot7, data, my_data)

	if data.objective then
		slot10 = true

		data.objective_failed_clbk(slot7, data.unit, data.objective)

		slot8 = data.unit
		slot9 = nil

		data.unit.brain(slot7).set_objective(slot7, data.unit.brain(slot7))
	end

	return 
end
function TeamAILogicSurrender.exit(data, new_logic_name, enter_params)
	slot7 = enter_params

	TeamAILogicBase.exit(slot4, data, new_logic_name)

	local my_data = data.internal_data
	my_data.exiting = true
	slot6 = my_data

	TeamAILogicDisabled._unregister_revive_SO(data)

	if new_logic_name ~= "inactive" then
		slot6 = data.unit
		slot7 = true

		data.unit.brain(slot5).set_update_enabled_state(slot5, data.unit.brain(slot5))

		slot6 = managers.groupai
		slot7 = data.unit

		managers.groupai.state(slot5).on_criminal_recovered(slot5, managers.groupai.state(slot5))

		slot6 = data.unit
		slot8 = 16

		data.unit.base(slot5).set_slot(slot5, data.unit.base(slot5), data.unit)

		slot6 = data.unit
		slot7 = nil

		data.unit.character_damage(slot5).set_invulnerable(slot5, data.unit.character_damage(slot5))
	end

	slot6 = data.unit
	slot8 = false

	data.unit.interaction(slot5).set_active(slot5, data.unit.interaction(slot5), false)

	return 
end
function TeamAILogicSurrender.on_action_completed(data, action)
	return 
end
function TeamAILogicSurrender.can_activate()
	return 
end
function TeamAILogicSurrender.on_detected_enemy_destroyed(data, enemy_unit)
	slot4 = data
	slot7 = enemy_unit

	TeamAILogicIdle.on_cop_neutralized(slot3, enemy_unit.key(slot6))

	return 
end
function TeamAILogicSurrender.is_available_for_assignment(data)
	return 
end

return 
