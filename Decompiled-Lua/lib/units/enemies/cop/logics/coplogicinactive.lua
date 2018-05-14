-- Decompilation Error: self.ljd.ast.slotworks.eliminate_temporary(self.ast)

slot0 = class
slot2 = CopLogicBase
slot0 = slot0(slot1)
CopLogicInactive = slot0
slot0 = CopLogicInactive

function slot1(data, new_logic_name, enter_params)
	slot3 = {}
	data.internal_data = slot3
	local my_data = data.internal_data
	slot4 = CopLogicBase
	slot4 = slot4.enter
	slot6 = data
	slot7 = new_logic_name
	slot8 = enter_params
	slot9 = my_data

	slot4(slot5, slot6, slot7, slot8)

	local old_internal_data = data.internal_data
	slot5 = data.has_outline

	if slot5 then
		slot5 = data.unit
		slot7 = slot5
		slot5 = slot5.contour
		slot5 = slot5(slot6)
		slot7 = slot5
		slot5 = slot5.remove
		slot8 = "highlight"

		slot5(slot6, slot7)

		slot5 = nil
		data.has_outline = slot5
	end

	slot5 = data.is_converted

	if slot5 then
		slot5 = data.unit
		slot7 = slot5
		slot5 = slot5.contour
		slot5 = slot5(slot6)
		slot7 = slot5
		slot5 = slot5.remove
		slot8 = "friendly"
		slot9 = true

		slot5(slot6, slot7, slot8)
	end

	local attention_obj = data.attention_obj
	slot6 = CopLogicBase
	slot6 = slot6._set_attention_obj
	slot8 = data
	slot9, slot10 = nil

	slot6(slot7, slot8, slot9)

	slot6 = CopLogicBase
	slot6 = slot6._destroy_all_detected_attention_object_data
	slot8 = data

	slot6(slot7)

	slot6 = CopLogicBase
	slot6 = slot6._reset_attention
	slot8 = data

	slot6(slot7)

	slot6 = pairs
	slot8 = managers
	slot8 = slot8.groupai
	slot10 = slot8
	slot8 = slot8.state
	slot8 = slot8(slot9)
	slot10 = slot8
	slot8 = slot8.all_char_criminals
	slot6, slot7, slot8 = slot6(slot8(slot9))

	for c_key, c_data in slot6, slot7, slot8 do
		slot11 = c_data.engaged
		slot12 = data.key
		slot11 = slot11[slot12]

		if slot11 then
			slot11 = debug_pause_unit
			slot13 = data.unit
			slot14 = "inactive AI engaging player"
			slot15 = data.unit
			slot16 = c_data.unit
			slot17 = inspect
			slot19 = attention_obj
			slot17 = slot17(slot18)
			slot18 = inspect
			slot20 = data.attention_obj

			slot11(slot12, slot13, slot14, slot15, slot16, slot18(slot19))
		end
	end

	slot6 = data.brain
	slot8 = slot6
	slot6 = slot6.rem_all_pos_rsrv

	slot6(slot7)

	slot6 = my_data.nearest_cover

	if slot6 then
		slot6 = managers
		slot6 = slot6.navigation
		slot8 = slot6
		slot6 = slot6.release_cover
		slot9 = my_data.nearest_cover
		slot9 = slot9[1]

		slot6(slot7, slot8)
	end

	slot6 = my_data.best_cover

	if slot6 then
		slot6 = managers
		slot6 = slot6.navigation
		slot8 = slot6
		slot6 = slot6.release_cover
		slot9 = my_data.best_cover
		slot9 = slot9[1]

		slot6(slot7, slot8)
	end

	if old_internal_data then
		slot6 = old_internal_data.nearest_cover

		if slot6 then
			slot6 = old_internal_data.nearest_cover
			my_data.nearest_cover = slot6
			slot6 = managers
			slot6 = slot6.navigation
			slot8 = slot6
			slot6 = slot6.reserve_cover
			slot9 = my_data.nearest_cover
			slot9 = slot9[1]
			slot10 = data.pos_rsrv_id

			slot6(slot7, slot8, slot9)
		end

		slot6 = old_internal_data.best_cover

		if slot6 then
			slot6 = old_internal_data.best_cover
			my_data.best_cover = slot6
			slot6 = managers
			slot6 = slot6.navigation
			slot8 = slot6
			slot6 = slot6.reserve_cover
			slot9 = my_data.best_cover
			slot9 = slot9[1]
			slot10 = data.pos_rsrv_id

			slot6(slot7, slot8, slot9)
		end
	end

	slot6 = data.objective

	if slot6 then
		slot6 = data.objective
		slot6 = slot6.type

		if slot6 == "follow" then
			slot6 = data.objective
			slot6 = slot6.destroy_clbk_key

			if slot6 then
				slot6 = data.objective
				slot6 = slot6.follow_unit
				slot8 = slot6
				slot6 = slot6.base
				slot6 = slot6(slot7)
				slot8 = slot6
				slot6 = slot6.remove_destroy_listener
				slot9 = data.objective
				slot9 = slot9.destroy_clbk_key

				slot6(slot7, slot8)

				slot6 = data.objective
				slot7 = nil
				slot6.destroy_clbk_key = slot7
			end
		end
	end

	slot6 = data.unit
	slot8 = slot6
	slot6 = slot6.brain
	slot6 = slot6(slot7)
	slot8 = slot6
	slot6 = slot6.set_update_enabled_state
	slot9 = false

	slot6(slot7, slot8)

	slot6 = data.objective

	if slot6 then
		slot6 = true
		my_data.removing_objective = slot6
		slot6 = data.unit
		slot8 = slot6
		slot6 = slot6.brain
		slot6 = slot6(slot7)
		slot8 = slot6
		slot6 = slot6.set_objective
		slot9 = nil

		slot6(slot7, slot8)

		slot6 = nil
		my_data.removing_objective = slot6
	end

	slot6 = data.logic
	slot7 = true
	slot6.inactive = slot7
	slot6 = data.logic
	slot6 = slot6._register_attention
	slot8 = data
	slot9 = my_data

	slot6(slot7, slot8)

	slot6 = data.logic
	slot6 = slot6._set_interaction
	slot8 = data
	slot9 = my_data

	slot6(slot7, slot8)

	return 
end

slot0.enter = slot1
slot0 = CopLogicInactive

function slot1(data, new_logic_name, enter_params)
	slot3 = CopLogicBase
	slot3 = slot3.exit
	slot5 = data
	slot6 = new_logic_name
	slot7 = enter_params

	slot3(slot4, slot5, slot6)

	slot3 = data.unit
	slot5 = slot3
	slot3 = slot3.brain
	slot3 = slot3(slot4)
	slot5 = slot3
	slot3 = slot3.set_update_enabled_state
	slot6 = true

	slot3(slot4, slot5)

	local my_data = data.internal_data
	slot4 = CopLogicBase
	slot4 = slot4.cancel_delayed_clbks
	slot6 = my_data

	slot4(slot5)

	return 
end

slot0.exit = slot1
slot0 = CopLogicInactive

function slot1(data)
	slot1 = false

	return slot1
end

slot0.is_available_for_assignment = slot1
slot0 = CopLogicInactive

function slot1(data)
	local my_data = data.internal_data
	slot2 = data.unit
	slot4 = slot2
	slot2 = slot2.brain
	slot2 = slot2(slot3)
	slot4 = slot2
	slot2 = slot2.set_attention_settings
	slot5 = {
		corpse_cbt = true
	}

	slot2(slot3, slot4)

	slot2 = data.unit
	slot4 = slot2
	slot2 = slot2.interaction
	slot2 = slot2(slot3)
	slot4 = slot2
	slot2 = slot2.active
	slot2 = slot2(slot3)

	if slot2 then
		slot2 = data.unit
		slot4 = slot2
		slot2 = slot2.interaction
		slot2 = slot2(slot3)
		slot4 = slot2
		slot2 = slot2.set_active
		slot5 = false
		slot6 = true
		slot7 = true

		slot2(slot3, slot4, slot5, slot6)
	end

	return 
end

slot0.on_enemy_weapons_hot = slot1
slot0 = CopLogicInactive

function slot1(data, my_data)
	slot2 = data.unit
	slot4 = slot2
	slot2 = slot2.character_damage
	slot2 = slot2(slot3)
	slot4 = slot2
	slot2 = slot2.dead
	slot2 = slot2(slot3)

	if slot2 then
		slot2 = managers
		slot2 = slot2.groupai
		slot4 = slot2
		slot2 = slot2.state
		slot2 = slot2(slot3)
		slot4 = slot2
		slot2 = slot2.enemy_weapons_hot
		slot2 = slot2(slot3)

		if slot2 then
			slot2 = data.unit
			slot4 = slot2
			slot2 = slot2.brain
			slot2 = slot2(slot3)
			slot4 = slot2
			slot2 = slot2.set_attention_settings
			slot5 = {
				corpse_cbt = true
			}

			slot2(slot3, slot4)
		else
			slot2 = data.unit
			slot4 = slot2
			slot2 = slot2.brain
			slot2 = slot2(slot3)
			slot4 = slot2
			slot2 = slot2.set_attention_settings
			slot5 = {
				corpse_sneak = true
			}

			slot2(slot3, slot4)
		end
	else
		slot2 = data.unit
		slot4 = slot2
		slot2 = slot2.brain
		slot2 = slot2(slot3)
		slot4 = slot2
		slot2 = slot2.set_attention_settings
		slot5 = nil

		slot2(slot3, slot4)
	end

	return 
end

slot0._register_attention = slot1
slot0 = CopLogicInactive

function slot1(data, my_data)
	slot2 = data.unit
	slot4 = slot2
	slot2 = slot2.character_damage
	slot2 = slot2(slot3)
	slot4 = slot2
	slot2 = slot2.dead
	slot2 = slot2(slot3)

	if slot2 then
		slot2 = managers
		slot2 = slot2.groupai
		slot4 = slot2
		slot2 = slot2.state
		slot2 = slot2(slot3)
		slot4 = slot2
		slot2 = slot2.whisper_mode
		slot2 = slot2(slot3)

		if slot2 then
			slot2 = data.unit
			slot4 = slot2
			slot2 = slot2.unit_data
			slot2 = slot2(slot3)
			slot2 = slot2.has_alarm_pager

			if slot2 then
				slot2 = data.brain
				slot4 = slot2
				slot2 = slot2.begin_alarm_pager

				slot2(slot3)
			else
				slot2 = data.unit
				slot4 = slot2
				slot2 = slot2.interaction
				slot2 = slot2(slot3)
				slot4 = slot2
				slot2 = slot2.set_tweak_data
				slot5 = "corpse_dispose"

				slot2(slot3, slot4)

				slot2 = data.unit
				slot4 = slot2
				slot2 = slot2.interaction
				slot2 = slot2(slot3)
				slot4 = slot2
				slot2 = slot2.set_active
				slot5 = true
				slot6 = true
				slot7 = true

				slot2(slot3, slot4, slot5, slot6)
			end
		end
	end

	return 
end

slot0._set_interaction = slot1
slot0 = CopLogicInactive

function slot1(data, old_objective)
	slot2 = data.internal_data
	slot2 = slot2.removing_objective

	if not slot2 then
		slot2 = debug_pause_unit
		slot4 = data.unit
		slot5 = "[CopLogicInactive.on_new_objective]"
		slot6 = data.unit
		slot7 = "new_objective"
		slot8 = data.objective

		if slot8 then
			slot8 = inspect
			slot10 = data.objective
			slot8 = slot8(slot9)
		end

		slot9 = "old_objective"

		if old_objective then
			slot10 = inspect
			slot12 = old_objective
			slot10 = slot10(slot11)
		end

		slot2(slot3, slot4, slot5, slot6, slot7, slot8, slot9)
	end

	slot2 = CopLogicBase
	slot2 = slot2.update_follow_unit
	slot4 = data
	slot5 = old_objective

	slot2(slot3, slot4)

	if old_objective then
		slot2 = old_objective.fail_clbk

		if slot2 then
			slot2 = old_objective.fail_clbk
			slot4 = data.unit

			slot2(slot3)
		end
	end

	return 
end

slot0.on_new_objective = slot1
slot0 = CopLogicInactive

function slot1(data, amount, aggressor_unit)
	return 
end

slot0.on_intimidated = slot1

return 
