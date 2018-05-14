-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not PlayerCarry then
	slot2 = PlayerStandard
	slot0 = class(slot1)
end

PlayerCarry = slot0
PlayerCarry.target_tilt = -5
function PlayerCarry:init(unit)
	slot5 = unit

	PlayerCarry.super.init(slot3, self)

	return 
end
function PlayerCarry:enter(state_data, enter_data)
	slot7 = enter_data

	PlayerCarry.super.enter(slot4, self, state_data)

	slot5 = self._unit
	slot5 = self._unit.camera(slot4)
	slot5 = self._unit.camera(slot4).camera_unit(slot4)
	slot6 = PlayerCarry.target_tilt

	self._unit.camera(slot4).camera_unit(slot4).base(slot4).set_target_tilt(slot4, self._unit.camera(slot4).camera_unit(slot4).base(slot4))

	return 
end
function PlayerCarry:_enter(enter_data)
	slot4 = managers.player
	local my_carry_data = managers.player.get_my_carry_data(slot3)

	if my_carry_data then
		local carry_data = tweak_data.carry[my_carry_data.carry_id]
		slot7 = carry_data.type

		print(slot5, "SET CARRY TYPE ON ENTER")

		self._tweak_data_name = carry_data.type
	else
		self._tweak_data_name = "light"
	end

	slot5 = self._ext_movement

	if self._ext_movement.nav_tracker(slot4) then
		slot5 = managers.groupai
		slot6 = self._unit

		managers.groupai.state(slot4).on_criminal_recovered(slot4, managers.groupai.state(slot4))
	end

	local skip_equip = enter_data and enter_data.skip_equip
	slot6 = self

	if not self._changing_weapon(slot5) and not skip_equip then
		slot7 = self.IDS_EQUIP

		self._start_action_equip(slot5, self)
	end

	if not self._state_data.ducking then
		slot7 = {
			"pl_friend_combatant_cbt",
			"pl_friend_non_combatant_cbt",
			"pl_foe_combatant_cbt_stand",
			"pl_foe_non_combatant_cbt_stand"
		}

		self._ext_movement.set_attention_settings(slot5, self._ext_movement)
	end

	slot9 = true

	managers.raid_job.set_memory(slot5, managers.raid_job, "kill_count_carry", nil)

	slot9 = true

	managers.raid_job.set_memory(slot5, managers.raid_job, "kill_count_no_carry", nil)

	return 
end
function PlayerCarry:exit(state_data, new_state_name)
	slot7 = new_state_name

	PlayerCarry.super.exit(slot4, self, state_data)

	slot5 = self._unit
	slot5 = self._unit.camera(slot4)
	slot5 = self._unit.camera(slot4).camera_unit(slot4)
	slot6 = 0

	self._unit.camera(slot4).camera_unit(slot4).base(slot4).set_target_tilt(slot4, self._unit.camera(slot4).camera_unit(slot4).base(slot4))

	local exit_data = {
		skip_equip = true
	}
	self._dye_risk = nil
	slot9 = true

	managers.raid_job.set_memory(self._unit.camera(slot4).camera_unit(slot4).base(slot4), managers.raid_job, "kill_count_carry", nil)

	slot9 = true

	managers.raid_job.set_memory(self._unit.camera(slot4).camera_unit(slot4).base(slot4), managers.raid_job, "kill_count_no_carry", nil)

	return exit_data
end
function PlayerCarry:update(t, dt)
	slot7 = dt

	PlayerCarry.super.update(slot4, self, t)

	if self._dye_risk and self._dye_risk.next_t < t then
		slot5 = self

		self._check_dye_explode(slot4)
	end

	return 
end
function PlayerCarry:set_tweak_data(name)
	self._tweak_data_name = name
	slot4 = self

	self._check_dye_pack(slot3)

	return 
end
function PlayerCarry:_check_dye_pack()
	slot3 = managers.player
	local my_carry_data = managers.player.get_my_carry_data(slot2)

	if my_carry_data.has_dye_pack then
		self._dye_risk = {}
		slot5 = managers.player
		slot6 = 3
		self._dye_risk.next_t = managers.player.player_timer(slot4).time(slot4) + 2 + math.random(managers.player.player_timer(slot4))
	end

	return 
end
function PlayerCarry:_check_dye_explode()
	slot3 = 1
	local chance = math.rand(slot2)

	if chance < 0.25 then
		slot4 = "DYE BOOM"

		print(slot3)

		self._dye_risk = nil
		slot4 = managers.player

		managers.player.dye_pack_exploded(slot3)

		return 
	end

	slot5 = managers.player
	slot6 = 3
	self._dye_risk.next_t = managers.player.player_timer(slot4).time(slot4) + 2 + math.random(managers.player.player_timer(slot4))

	return 
end
function PlayerCarry:_update_check_actions(t, dt)
	slot7 = dt
	local input = self._get_input(slot4, self, t)
	slot6 = self

	self._determine_move_direction(self)

	slot7 = t

	self._update_interaction_timers(self, self)

	slot6 = managers.blackmarket
	local projectile_entry = managers.blackmarket.equipped_projectile(self)

	if tweak_data.projectiles[projectile_entry].is_a_grenade then
		slot9 = input

		self._update_throw_grenade_timers(slot6, self, t)
	else
		slot9 = input

		self._update_throw_projectile_timers(slot6, self, t)
	end

	slot10 = input

	self._update_reload_timers(slot6, self, t, dt)

	slot9 = input

	self._update_melee_timers(slot6, self, t)

	slot9 = input

	self._update_equip_weapon_timers(slot6, self, t)

	slot8 = t

	self._update_running_timers(slot6, self)

	slot9 = dt

	self._update_zipline_timers(slot6, self, t)

	slot9 = dt

	self._update_steelsight_timers(slot6, self, t)

	slot9 = input

	self._update_foley(slot6, self, t)

	local new_action = nil

	if not new_action then
		slot10 = input
		new_action = self._check_action_weapon_gadget(slot7, self, t)
	end

	if not new_action then
		slot10 = input
		new_action = self._check_action_weapon_firemode(slot7, self, t)
	end

	if not new_action then
		slot10 = input
		new_action = self._check_action_melee(slot7, self, t)
	end

	if not new_action then
		slot10 = input
		new_action = self._check_action_reload(slot7, self, t)
	end

	if not new_action then
		slot10 = input
		new_action = self._check_change_weapon(slot7, self, t)
	end

	if not new_action then
		slot10 = input
		new_action = self._check_action_equip(slot7, self, t)
	end

	if not new_action then
		slot10 = input
		new_action = self._check_action_primary_attack(slot7, self, t)
		self._shooting = new_action
	end

	if not new_action then
		slot8 = managers.blackmarket
		local projectile_entry = managers.blackmarket.equipped_projectile(slot7)

		if tweak_data.projectiles[projectile_entry].is_a_grenade then
			slot11 = input
			new_action = self._check_action_throw_grenade(slot8, self, t)
		else
			slot11 = input
			new_action = self._check_action_throw_projectile(slot8, self, t)
		end
	end

	slot10 = input
	local warcry_action = self._check_warcry(slot7, self, t)
	slot11 = input

	self._check_action_interact(self, self, t)

	slot11 = input

	self._check_action_jump(self, self, t)

	slot11 = input

	self._check_action_run(self, self, t)

	slot11 = input

	self._check_action_ladder(self, self, t)

	slot11 = input

	self._check_action_zipline(self, self, t)

	slot11 = input

	self._check_action_cash_inspect(self, self, t)

	slot11 = input

	self._check_action_deploy_bipod(self, self, t)

	slot11 = input

	self._check_action_duck(self, self, t)

	slot11 = input

	self._check_action_steelsight(self, self, t)

	if not warcry_action then
		slot11 = input

		self._check_use_item(slot8, self, t)
	end

	slot11 = input

	self._check_comm_wheel(slot8, self, t)

	slot12 = input

	self._check_stats_screen(slot8, self, t, dt)

	return 
end
function PlayerCarry:_check_action_run(t, input)
	return 
end
function PlayerCarry:_check_use_item(t, input)

	-- Decompilation error in this vicinity:
	local new_action = nil
	local action_wanted = input.btn_use_item_press

	if action_wanted then
		if not self._use_item_expire_t then
			slot7 = self
			local expire_t = self._changing_weapon(slot6)
		end

		local not_expired = expire_t and t < expire_t

		if not not_expired then
			slot9 = self

			if not self._interacting(slot8) then
				slot9 = self._ext_movement

				if not self._ext_movement.has_carry_restriction(slot8) then
					slot9 = self

					if not self._is_throwing_projectile(slot8) then
						slot9 = self
						local action_forbidden = self._on_zipline(slot8)
					end
				end
			end
		end

		if not action_forbidden then
			slot10 = "[PlayerCarry:_check_use_item] drop carry"

			print(slot9)

			slot10 = managers.player

			managers.player.drop_carry(slot9)

			new_action = true
		end
	end

	return new_action
end
function PlayerCarry:_check_change_weapon(...)
	slot3 = self

	return PlayerCarry.super._check_change_weapon(slot2, ...)
end
function PlayerCarry:_check_action_equip(...)
	slot3 = self

	return PlayerCarry.super._check_action_equip(slot2, ...)
end
function PlayerCarry:_update_movement(t, dt)
	slot7 = dt

	PlayerCarry.super._update_movement(slot4, self, t)

	return 
end
function PlayerCarry:_start_action_jump(...)
	slot3 = self

	PlayerCarry.super._start_action_jump(slot2, ...)

	return 
end
function PlayerCarry:_perform_jump(jump_vec)
	slot6 = "movement_penalty_nullifier"

	if not managers.player.has_category_upgrade(slot3, managers.player, "carry") then
		slot5 = BuffEffectManager.EFFECT_BAGS_DONT_SLOW_PLAYERS_DOWN

		if managers.buff_effect.is_effect_active(slot3, managers.buff_effect) then
		else
			slot5 = tweak_data.carry.types[self._tweak_data_name].jump_modifier

			mvector3.multiply(slot3, jump_vec)
		end
	end

	slot5 = jump_vec

	PlayerCarry.super._perform_jump(slot3, self)

	return 
end
function PlayerCarry:_get_max_walk_speed(...)
	local multiplier = tweak_data.carry.types[self._tweak_data_name].move_speed_modifier
	slot5 = BuffEffectManager.EFFECT_BAG_WEIGHT

	if managers.buff_effect.is_effect_active(slot3, managers.buff_effect) then
		slot5 = BuffEffectManager.EFFECT_BAG_WEIGHT
		multiplier = multiplier / (managers.buff_effect.get_effect_value(slot3, managers.buff_effect) or 1)
	end

	slot5 = BuffEffectManager.EFFECT_BAGS_DONT_SLOW_PLAYERS_DOWN

	if managers.buff_effect.is_effect_active(slot3, managers.buff_effect) then
		multiplier = 1
	else
		slot9 = 1
		slot6 = 1
		multiplier = math.clamp(slot3, multiplier * managers.player.upgrade_value(slot5, managers.player, "player", "carry_penalty_decrease"), 0)
	end

	slot4 = self

	return PlayerCarry.super._get_max_walk_speed(slot3, ...) * multiplier
end
function PlayerCarry:_get_walk_headbob(...)
	slot3 = self

	return PlayerCarry.super._get_walk_headbob(slot2, ...) * tweak_data.carry.types[self._tweak_data_name].move_speed_modifier
end
function PlayerCarry:pre_destroy(unit)
	return 
end
function PlayerCarry:destroy()
	return 
end

return 
