slot2 = CopLogicBase
CopLogicTurret = class(slot1)
function CopLogicTurret.enter(data, new_logic_name, enter_params)
	local my_data = {
		unit = data.unit
	}
	slot9 = my_data

	CopLogicBase.enter(slot5, data, new_logic_name, enter_params)

	data.internal_data = my_data
	slot6 = data.unit
	slot7 = false

	data.unit.inventory(slot5).set_weapon_enabled(slot5, data.unit.inventory(slot5))

	return 
end
function CopLogicTurret.exit(data, new_logic_name, enter_params)
	slot6 = "*** CopLogicTurret.exit"

	Application.debug(slot4, Application)

	local my_data = data.internal_data
	slot6 = my_data

	CopLogicBase.cancel_delayed_clbks(Application)

	slot8 = enter_params

	CopLogicBase.exit(Application, data, new_logic_name)

	return 
end
function CopLogicTurret.is_available_for_assignment(data)
	return false
end
function CopLogicTurret.on_enemy_weapons_hot(data)
	slot4 = "*** CopLogicTurret.on_enemy_weapons_hot"

	Application.debug(slot2, Application)

	return 
end
function CopLogicTurret._register_attention(data, my_data)
	slot5 = "*** CopLogicTurret._register_attention"

	Application.debug(slot3, Application)

	return 
end
function CopLogicTurret._set_interaction(data, my_data)
	slot5 = "*** CopLogicTurret._set_interaction"

	Application.debug(slot3, Application)

	return 
end
function CopLogicTurret.queued_update(data)
	slot4 = "*** CopLogicTurret.queued_update"

	Application.debug(slot2, Application)

	return 
end
function CopLogicTurret.on_intimidated(data, amount, aggressor_unit)
	slot6 = "*** CopLogicTurret.on_intimidated"

	Application.debug(slot4, Application)

	return 
end
function CopLogicTurret.death_clbk(data, damage_info)
	slot4 = data.unit

	if data.unit.unit_data(slot3).turret_weapon then
		slot4 = data.unit
		slot6 = damage_info

		data.unit.unit_data(slot3).turret_weapon.on_puppet_death(slot3, data.unit.unit_data(slot3).turret_weapon, data)
	end

	return 
end
function CopLogicTurret.on_intimidated(data, amount, aggressor_unit)
	slot6 = "*** CopLogicTurret.on_intimidated"

	Application.debug(slot4, Application)

	return 
end
function CopLogicTurret.damage_clbk(data, damage_info)
	slot4 = data.unit

	if data.unit.unit_data(slot3).turret_weapon then
		slot4 = data.unit
		slot6 = damage_info

		data.unit.unit_data(slot3).turret_weapon.on_puppet_damaged(slot3, data.unit.unit_data(slot3).turret_weapon, data)
	end

	return 
end
function CopLogicTurret.on_suppressed_state(data)
	slot4 = "*** CopLogicTurret.on_suppressed_state"

	Application.debug(slot2, Application)

	return 
end

return 
