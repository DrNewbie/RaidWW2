if not PlayerCarryCorpse then
	slot2 = PlayerCarry
	slot0 = class(slot1)
end

PlayerCarryCorpse = slot0
function PlayerCarryCorpse:init(unit)
	slot5 = unit

	PlayerCarryCorpse.super.init(slot3, self)

	return 
end
function PlayerCarryCorpse:enter(state_data, enter_data)
	if enter_data then
		enter_data.skip_equip = true
	end

	slot7 = enter_data

	PlayerCarryCorpse.super.enter(slot4, self, state_data)

	slot6 = "[PlayerCarryCorpse:enter] **********************************************************"

	Application.debug(slot4, Application)

	slot7 = {
		skip_idle_check = true,
		instigator = managers.player.local_player(slot9)
	}
	slot10 = managers.player

	managers.dialog.queue_dialog(slot4, managers.dialog, "player_gen_carry_body")

	slot5 = managers.player
	local t = managers.player.player_timer(slot4).time(slot4)
	slot6 = self

	self._interupt_action_steelsight(managers.player.player_timer(slot4))

	slot6 = managers.blackmarket
	local projectile_entry = managers.blackmarket.equipped_projectile(managers.player.player_timer(slot4))

	if tweak_data.projectiles[projectile_entry].is_a_grenade then
		slot8 = t

		self._interupt_action_throw_grenade(slot6, self)
	else
		slot8 = t

		self._interupt_action_throw_projectile(slot6, self)
	end

	slot8 = t

	self._interupt_action_reload(slot6, self)

	slot8 = t

	self._interupt_action_charging_weapon(slot6, self)

	slot8 = t

	self._interupt_action_melee(slot6, self)

	slot8 = t

	self._interupt_action_use_item(slot6, self)

	return 
end
function PlayerCarryCorpse:_enter(enter_data)
	slot5 = enter_data

	PlayerCarryCorpse.super._enter(slot3, self)

	slot4 = self._unit
	slot4 = self._unit.camera(slot3)
	slot7 = "carry_corpse_equip"

	self._unit.camera(slot3).play_redirect(slot3, Idstring(slot6))

	self._carrying_corpse = true

	return 
end
function PlayerCarryCorpse:exit(state_data, new_state_name)
	slot5 = self._unit
	slot5 = self._unit.camera(slot4)
	slot8 = "carry_corpse_unequip"

	self._unit.camera(slot4).play_redirect(slot4, Idstring(slot7))

	self._carrying_corpse = false
	slot7 = new_state_name
	local exit_data = PlayerCarryCorpse.super.exit(slot4, self, state_data)

	return exit_data
end
function PlayerCarryCorpse:update(t, dt)
	slot7 = dt

	PlayerCarryCorpse.super.update(slot4, self, t)

	return 
end
function PlayerCarryCorpse:set_tweak_data(name)
	self._tweak_data_name = name
	slot4 = self

	self._check_dye_pack(slot3)

	return 
end
function PlayerCarryCorpse:_check_change_weapon(...)
	return false
end
function PlayerCarryCorpse:_check_action_equip(...)
	return false
end
function PlayerCarryCorpse:_check_action_interact(t, input)
	local new_action, timer, interact_object = nil

	if input.btn_interact_press then
		slot8 = managers.interaction

		if managers.interaction.active_unit(slot7) then
			slot9 = {
				duration = 2,
				shelf_life = 5,
				id = "hud_hint_carry_corpse_block_interact",
				text = managers.localization.text(slot11, managers.localization)
			}
			slot13 = "hud_hint_carry_corpse_block_interact"

			managers.notification.add_notification(slot7, managers.notification)

			new_action = nil
		elseif not new_action then
			slot9 = t
			new_action = self._start_action_intimidate(slot7, self)
		end
	end

	return new_action
end
function PlayerCarryCorpse:_update_movement(t, dt)
	slot7 = dt

	PlayerCarryCorpse.super._update_movement(slot4, self, t)

	return 
end
function PlayerCarryCorpse:_start_action_jump(...)
	slot3 = self

	PlayerCarryCorpse.super._start_action_jump(slot2, ...)

	return 
end
function PlayerCarryCorpse:_perform_jump(jump_vec)
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

	PlayerCarryCorpse.super._perform_jump(slot3, self)

	return 
end
function PlayerCarryCorpse:_update_check_actions(t, dt)
	slot7 = dt
	local input = self._get_input(slot4, self, t)
	slot6 = self

	self._determine_move_direction(self)

	slot7 = t

	self._update_interaction_timers(self, self)

	slot7 = t

	self._update_running_timers(self, self)

	slot8 = dt

	self._update_zipline_timers(self, self, t)

	slot8 = input
	local warcry_action = self._check_warcry(self, self, t)
	slot9 = input

	self._update_foley(self, self, t)

	slot9 = input

	self._check_action_interact(self, self, t)

	slot9 = input

	self._check_action_jump(self, self, t)

	slot9 = input

	self._check_action_run(self, self, t)

	slot9 = input

	self._check_action_ladder(self, self, t)

	slot9 = input

	self._check_action_zipline(self, self, t)

	slot9 = input

	self._check_action_cash_inspect(self, self, t)

	slot9 = input

	self._check_action_duck(self, self, t)

	if not warcry_action then
		slot9 = input

		self._check_use_item(slot6, self, t)
	end

	slot9 = input

	self._check_comm_wheel(slot6, self, t)

	slot10 = input

	self._check_stats_screen(slot6, self, t, dt)

	return 
end

return 
