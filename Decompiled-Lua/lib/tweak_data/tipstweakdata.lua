TipsTweakData = TipsTweakData or class()
function TipsTweakData:init()
	slot4 = {
		string_id = "tip_tactical_reload"
	}

	table.insert(slot2, self)

	slot4 = {
		string_id = "tip_weapon_effecienty"
	}

	table.insert(slot2, self)

	slot4 = {
		string_id = "tip_switch_to_sidearm"
	}

	table.insert(slot2, self)

	slot4 = {
		string_id = "tip_head_shot"
	}

	table.insert(slot2, self)

	slot4 = {
		string_id = "tip_help_bleed_out"
	}

	table.insert(slot2, self)

	slot4 = {
		string_id = "tip_steelsight"
	}

	table.insert(slot2, self)

	slot4 = {
		string_id = "tip_melee_attack"
	}

	table.insert(slot2, self)

	slot4 = {
		string_id = "tip_objectives"
	}

	table.insert(slot2, self)

	slot4 = {
		string_id = "tip_select_reward"
	}

	table.insert(slot2, self)

	slot4 = {
		string_id = "tip_shoot_in_bleed_out"
	}

	table.insert(slot2, self)

	slot4 = {
		string_id = "tip_crowbar"
	}

	table.insert(slot2, self)

	slot4 = {
		string_id = "tip_supply_crates"
	}

	table.insert(slot2, self)

	return 
end
function TipsTweakData:get_a_tip()
	slot3 = managers.experience
	local lvl = managers.experience.current_level(slot2)
	local ids = {}
	slot5 = self

	for _, tip in ipairs(slot4) do
		if not tip.unlock_lvl or tip.unlock_lvl < lvl then
			slot11 = tip.string_id

			table.insert(slot9, ids)
		end
	end

	slot5 = #ids

	return ids[math.random(slot4)]
end

return 
