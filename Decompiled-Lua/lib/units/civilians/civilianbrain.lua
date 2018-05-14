slot2 = "lib/units/civilians/logics/CivilianLogicBase"

require(slot1)

slot2 = "lib/units/civilians/logics/CivilianLogicInactive"

require(slot1)

slot2 = "lib/units/civilians/logics/CivilianLogicIdle"

require(slot1)

slot2 = "lib/units/civilians/logics/CivilianLogicFlee"

require(slot1)

slot2 = "lib/units/civilians/logics/CivilianLogicSurrender"

require(slot1)

slot2 = "lib/units/civilians/logics/CivilianLogicEscort"

require(slot1)

slot2 = "lib/units/civilians/logics/CivilianLogicTravel"

require(slot1)

slot2 = "lib/units/civilians/logics/CivilianLogicTrade"

require(slot1)

if not CivilianBrain then
	slot2 = CopBrain
	slot0 = class(slot1)
end

CivilianBrain = slot0
CivilianBrain.set_attention_settings = PlayerMovement.set_attention_settings
CivilianBrain._logics = {
	inactive = CivilianLogicInactive,
	idle = CivilianLogicIdle,
	surrender = CivilianLogicSurrender,
	flee = CivilianLogicFlee,
	escort = CivilianLogicEscort,
	travel = CivilianLogicTravel,
	trade = CivilianLogicTrade
}
function CivilianBrain:init(unit)
	self._unit = unit
	slot4 = TimerManager
	self._timer = TimerManager.game(slot3)
	slot5 = false

	self.set_update_enabled_state(slot3, self)

	self._current_logic = nil
	self._current_logic_name = nil
	self._active = true
	slot8 = unit
	slot5 = tweak_data.character[unit.base(slot7)._tweak_table].access
	self._SO_access = managers.navigation.convert_access_flag(slot3, managers.navigation)
	slot5 = "criminals"
	self._slotmask_enemies = managers.slot.get_mask(slot3, managers.slot)
	slot8 = "on_reload"
	CopBrain._reload_clbks[unit.key(managers.slot)] = callback(unit, self, self)

	return 
end
function CivilianBrain:update(unit, t, dt)
	local logic = self._current_logic

	if logic.update then
		local l_data = self._logic_data
		l_data.t = t
		l_data.dt = dt
		slot8 = l_data

		logic.update(slot7)
	end

	return 
end
function CivilianBrain:_reset_logic_data()
	CopBrain._reset_logic_data(slot2)

	self._logic_data.enemy_slotmask = nil
	slot7 = managers.groupai
	slot6 = "on_civilian_objective_complete"
	self._logic_data.objective_complete_clbk = callback(self, managers.groupai.state(slot5), managers.groupai.state(managers.groupai))
	slot7 = managers.groupai
	slot6 = "on_civilian_objective_failed"
	self._logic_data.objective_failed_clbk = callback(self, managers.groupai.state(managers.groupai.state(managers.groupai)), managers.groupai.state(managers.groupai))

	return 
end
function CivilianBrain:is_available_for_assignment(objective)
	slot5 = objective

	return self._current_logic.is_available_for_assignment(slot3, self._logic_data)
end
function CivilianBrain:cancel_trade()
	if not self._active then
		return 
	end

	slot4 = "surrender"

	self.set_logic(slot2, self)

	return 
end
function CivilianBrain:on_rescue_allowed_state(state)
	if self._current_logic.on_rescue_allowed_state then
		slot5 = state

		self._current_logic.on_rescue_allowed_state(slot3, self._logic_data)
	end

	return 
end
function CivilianBrain:wants_rescue()
	if self._current_logic.wants_rescue then
		slot3 = self._logic_data

		return self._current_logic.wants_rescue(slot2)
	end

	return 
end
function CivilianBrain:on_cool_state_changed(state)
	if self._logic_data then
		self._logic_data.cool = state
	end

	if self._alert_listen_key then
		slot4 = managers.groupai
		slot5 = self._alert_listen_key

		managers.groupai.state(slot3).remove_alert_listener(slot3, managers.groupai.state(slot3))
	else
		slot7 = self._unit
		self._alert_listen_key = "CopBrain" .. tostring(self._unit.key(slot6))
	end

	local alert_listen_filter, alert_types = nil

	if state then
		slot6 = managers.groupai
		slot7 = "criminals_enemies_civilians"
		alert_listen_filter = managers.groupai.state(slot5).get_unit_type_filter(slot5, managers.groupai.state(slot5))
		alert_types = {
			vo_distress = true,
			aggression = true,
			bullet = true,
			vo_intimidate = true,
			explosion = true,
			footstep = true,
			vo_cbt = true
		}
	else
		slot6 = managers.groupai
		slot7 = "criminal"
		alert_listen_filter = managers.groupai.state(slot5).get_unit_type_filter(slot5, managers.groupai.state(slot5))
		alert_types = {
			bullet = true
		}
	end

	slot6 = managers.groupai
	slot10 = alert_types
	slot13 = self._unit
	slot13 = self._unit.movement("on_alert")

	managers.groupai.state(slot5).add_alert_listener(slot5, managers.groupai.state(slot5), self._alert_listen_key, callback(slot9, self, self), alert_listen_filter, self._unit.movement("on_alert").m_head_pos("on_alert"))

	return 
end
function CivilianBrain:on_hostage_move_interaction(interacting_unit, command)
	if not self._logic_data.is_tied then
		return 
	end

	if command == "move" then
		slot5 = managers.groupai
		slot6 = interacting_unit
		local following_hostages = managers.groupai.state(slot4).get_following_hostages(slot4, managers.groupai.state(slot4))

		if following_hostages then
			slot6 = following_hostages

			if tweak_data.player.max_nr_following_hostages <= table.size(slot5) then
				return 
			end
		end

		slot6 = self._unit

		if not self._unit.anim_data(slot5).drop then
			slot6 = self._unit

			if self._unit.anim_data(slot5).tied then
				return 
			end
		end

		local stand_action_desc = {
			clamp_to_graph = true,
			variant = "stand_tied",
			body_part = 1,
			type = "act"
		}
		slot7 = self._unit
		slot8 = stand_action_desc
		local action = self._unit.movement(slot6).action_request(slot6, self._unit.movement(slot6))

		if not action then
			return 
		end

		slot8 = self._unit
		slot11 = true

		self._unit.movement(slot7).set_stance(slot7, self._unit.movement(slot7), "cbt", nil)

		local follow_objective = {
			interrupt_health = 0,
			distance = 500,
			type = "follow",
			lose_track_dis = 2000,
			stance = "cbt",
			interrupt_dis = 0,
			follow_unit = interacting_unit
		}
		slot9 = interacting_unit
		slot9 = interacting_unit.movement(self._unit.movement(slot7))
		slot9 = interacting_unit.movement(self._unit.movement(slot7)).nav_tracker(self._unit.movement(slot7))
		follow_objective.nav_seg = interacting_unit.movement(self._unit.movement(slot7)).nav_tracker(self._unit.movement(slot7)).nav_segment(self._unit.movement(slot7))
		slot11 = "on_hostage_follow_objective_failed"
		follow_objective.fail_clbk = callback(self._unit.movement(slot7), self, self)
		slot10 = follow_objective

		self.set_objective(self._unit.movement(slot7), self)

		slot9 = self._unit
		slot10 = "hostage_stay"

		self._unit.interaction(self._unit.movement(slot7)).set_tweak_data(self._unit.movement(slot7), self._unit.interaction(self._unit.movement(slot7)))

		slot9 = self._unit
		slot11 = true

		self._unit.interaction(self._unit.movement(slot7)).set_active(self._unit.movement(slot7), self._unit.interaction(self._unit.movement(slot7)), true)

		slot9 = interacting_unit
		slot12 = true

		interacting_unit.sound(self._unit.movement(slot7)).say(self._unit.movement(slot7), interacting_unit.sound(self._unit.movement(slot7)), "f38_any", false)

		slot9 = self._unit
		slot11 = true
		self._following_hostage_contour_id = self._unit.contour(self._unit.movement(slot7)).add(self._unit.movement(slot7), self._unit.contour(self._unit.movement(slot7)), "friendly")
		slot9 = managers.groupai
		slot12 = true

		managers.groupai.state(self._unit.movement(slot7)).on_hostage_follow(self._unit.movement(slot7), managers.groupai.state(self._unit.movement(slot7)), interacting_unit, self._unit)
	elseif command == "stay" then
		slot5 = self._unit

		if not self._unit.anim_data(slot4).stand then
			return 
		end

		slot6 = {
			amount = 1,
			type = "surrender",
			aggressor_unit = interacting_unit
		}

		self.set_objective(slot4, self)

		slot5 = self._unit

		if not self._unit.anim_data(slot4).stand then
			return 
		end

		local stand_action_desc = {
			clamp_to_graph = true,
			variant = "drop",
			body_part = 1,
			type = "act"
		}
		slot6 = self._unit
		slot7 = stand_action_desc
		local action = self._unit.movement(slot5).action_request(slot5, self._unit.movement(slot5))

		if not action then
			return 
		end

		slot7 = self._unit
		slot10 = true

		self._unit.movement(slot6).set_stance(slot6, self._unit.movement(slot6), "hos", nil)

		slot7 = self._unit
		slot8 = "hostage_move"

		self._unit.interaction(slot6).set_tweak_data(slot6, self._unit.interaction(slot6))

		slot7 = self._unit
		slot9 = true

		self._unit.interaction(slot6).set_active(slot6, self._unit.interaction(slot6), true)

		slot7 = interacting_unit

		if alive(slot6) then
			slot7 = interacting_unit
			slot10 = true

			interacting_unit.sound(slot6).say(slot6, interacting_unit.sound(slot6), "f02x_sin", false)
		end

		if self._following_hostage_contour_id then
			slot7 = self._unit
			slot9 = true

			self._unit.contour(slot6).remove_by_id(slot6, self._unit.contour(slot6), self._following_hostage_contour_id)

			self._following_hostage_contour_id = nil
		end

		slot7 = managers.groupai
		slot10 = false

		managers.groupai.state(slot6).on_hostage_follow(slot6, managers.groupai.state(slot6), interacting_unit, self._unit)
	elseif command == "release" then
		self._logic_data.is_tied = nil

		if self._logic_data.objective and self._logic_data.objective.type == "follow" then
			slot6 = nil

			self.set_objective(slot4, self)
		end

		slot5 = self._unit
		slot8 = true

		self._unit.movement(slot4).set_stance(slot4, self._unit.movement(slot4), "hos", nil)

		local stand_action_desc = {
			variant = "panic",
			body_part = 1,
			type = "act"
		}
		slot6 = self._unit
		slot7 = stand_action_desc
		local action = self._unit.movement(self._unit.movement(slot4)).action_request(self._unit.movement(slot4), self._unit.movement(self._unit.movement(slot4)))

		if not action then
			return 
		end

		slot7 = self._unit
		slot8 = "intimidate"

		self._unit.interaction(slot6).set_tweak_data(slot6, self._unit.interaction(slot6))

		slot7 = self._unit
		slot9 = true

		self._unit.interaction(slot6).set_active(slot6, self._unit.interaction(slot6), false)

		if self._following_hostage_contour_id then
			slot7 = self._unit
			slot9 = true

			self._unit.contour(slot6).remove_by_id(slot6, self._unit.contour(slot6), self._following_hostage_contour_id)

			self._following_hostage_contour_id = nil
		end

		slot7 = managers.groupai
		slot10 = false

		managers.groupai.state(slot6).on_hostage_follow(slot6, managers.groupai.state(slot6), interacting_unit, self._unit)
	end

	return true
end
function CivilianBrain:on_hostage_follow_objective_failed(unit)
	slot4 = unit
	slot4 = unit.character_damage(slot3)

	if not unit.character_damage(slot3).dead(slot3) then
		if not self._logic_data.objective or self._logic_data.objective.is_default or self._logic_data.objective.type == "surrender" then
			slot6 = "stay"

			self.on_hostage_move_interaction(slot3, self, nil)
		else
			slot6 = "release"

			self.on_hostage_move_interaction(slot3, self, nil)
		end
	end

	return 
end
function CivilianBrain:is_tied()
	return self._logic_data.is_tied
end
function CivilianBrain:save(save_data)
	slot5 = save_data

	CivilianBrain.super.save(slot3, self)

	local my_save_data = save_data.brain

	if self._following_hostage_contour_id then
		my_save_data.following_hostage_contour = true
	end

	return 
end
function CivilianBrain:set_objective(new_objective)
	if new_objective and new_objective.type == "free" then
		slot4 = self._unit

		if self._unit.escort(slot3) then
			new_objective = {
				type = "escort"
			}
		end
	end

	slot5 = new_objective

	CivilianBrain.super.set_objective(slot3, self)

	return 
end

return 
