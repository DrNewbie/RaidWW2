if not PlayerFoxhole then
	slot2 = PlayerStandard
	slot0 = class(slot1)
end

PlayerFoxhole = slot0
PlayerFoxhole.EXIT_TIMER = 0.4
PlayerFoxhole._update_movement = PlayerBleedOut._update_movement
function PlayerFoxhole:enter(state_data, enter_data)
	slot7 = enter_data

	PlayerFoxhole.super.enter(slot4, self, state_data)

	slot5 = self._unit
	slot5 = self._unit.camera(slot4)
	slot5 = self._unit.camera(slot4).camera_unit(slot4)
	slot6 = 0

	self._unit.camera(slot4).camera_unit(slot4).base(slot4).set_target_tilt(slot4, self._unit.camera(slot4).camera_unit(slot4).base(slot4))

	slot5 = self._unit
	slot5 = self._unit.camera(slot4)
	slot5 = self._unit.camera(slot4).camera_unit(slot4)

	self._unit.camera(slot4).camera_unit(slot4).base(slot4).set_limits(slot4, self._unit.camera(slot4).camera_unit(slot4).base(slot4), 60)

	slot8 = managers.player
	slot8 = managers.player.player_timer(20)
	slot7 = {
		selection_wanted = 1
	}

	self._start_action_unequip_weapon(slot4, self, managers.player.player_timer(20).time(20))

	slot5 = self

	self._stance_entered(slot4)

	slot5 = self._unit
	local velocity = self._unit.mover(slot4).velocity(slot4)
	slot6 = self._unit

	self._unit.kill_mover(self._unit.mover(slot4))

	slot6 = self._unit
	slot7 = true

	self._unit.character_damage(self._unit.mover(slot4)).set_invulnerable(self._unit.mover(slot4), self._unit.character_damage(self._unit.mover(slot4)))

	return 
end
function PlayerFoxhole:exit(state_data, new_state_name)
	slot7 = new_state_name

	PlayerFoxhole.super.exit(slot4, self, state_data)

	slot5 = self._unit
	slot5 = self._unit.camera(slot4)
	slot5 = self._unit.camera(slot4).camera_unit(slot4)
	slot5 = self._unit.camera(slot4).camera_unit(slot4).base(slot4)

	self._unit.camera(slot4).camera_unit(slot4).base(slot4).remove_limits(slot4)

	slot5 = self._ext_movement
	slot5 = self._ext_movement.foxhole_unit(slot4)
	slot5 = self._ext_movement.foxhole_unit(slot4).foxhole(slot4)

	self._ext_movement.foxhole_unit(slot4).foxhole(slot4).unregister_player(slot4)

	slot6 = nil

	self._ext_movement.set_foxhole_unit(slot4, self._ext_movement)

	slot6 = self.IDS_EQUIP

	self._start_action_equip(slot4, self)

	slot5 = self

	self._stance_entered(slot4)

	slot6 = PlayerStandard.MOVER_STAND

	self._activate_mover(slot4, self)

	slot5 = self._unit
	slot6 = false

	self._unit.character_damage(slot4).set_invulnerable(slot4, self._unit.character_damage(slot4))

	return 
end
function PlayerFoxhole:_update_check_actions(t, dt)
	slot7 = dt
	local input = self._get_input(slot4, self, t)
	slot8 = input

	self._update_foley(self, self, t)

	slot9 = input

	self._check_stats_screen(self, self, t, dt)

	slot8 = input

	self._check_action_exit_foxhole(self, self, t)

	slot8 = input

	self._update_action_timers(self, self, t)

	return 
end
function PlayerFoxhole:_check_action_exit_foxhole(t, input)
	if input.btn_interact_press then
		slot5 = self._ext_movement
		slot5 = self._ext_movement.foxhole_unit(slot4)
		slot5 = self._ext_movement.foxhole_unit(slot4).foxhole(slot4)

		if not self._ext_movement.foxhole_unit(slot4).foxhole(slot4).locked(slot4) then
			slot6 = t

			self._start_interaction_exit_foxhole(slot4, self)
		end
	end

	if input.btn_interact_release then
		slot6 = t

		self._interupt_action_exit_foxhole(slot4, self)
	end

	return 
end
function PlayerFoxhole:_start_interaction_exit_foxhole(t)
	slot4 = self._ext_movement
	slot4 = self._ext_movement.foxhole_unit(slot3)
	slot4 = self._ext_movement.foxhole_unit(slot3).foxhole(slot3)

	if self._ext_movement.foxhole_unit(slot3).foxhole(slot3).locked(slot3) then
		return 
	end

	local timer = PlayerFoxhole.EXIT_TIMER
	self._exit_foxhole_expire_t = t + timer
	slot8 = "hud_action_exit_foxhole"
	local text = utf8.to_upper(managers.localization.text(slot6, managers.localization))
	slot9 = text

	managers.hud.show_progress_timer_bar(managers.localization.text, managers.hud, 0, timer)

	return 
end
function PlayerFoxhole:_interacting()
	slot3 = self

	return PlayerFoxhole.super._interacting(slot2) or self._exit_foxhole_expire_t
end
function PlayerFoxhole:_interupt_action_exit_foxhole(t, input, complete)
	if self._exit_foxhole_expire_t then
		self._exit_foxhole_expire_t = nil
		slot7 = complete

		managers.hud.hide_progress_timer_bar(slot5, managers.hud)
	end

	return 
end
function PlayerFoxhole:_update_action_timers(t, input)
	if self._exit_foxhole_expire_t then
		local timer = PlayerFoxhole.EXIT_TIMER
		slot8 = timer

		managers.hud.set_progress_timer_bar_width(slot5, managers.hud, timer - self._exit_foxhole_expire_t - t)

		if self._exit_foxhole_expire_t <= t then
			slot6 = self

			self._end_action_exit_foxhole(slot5)

			self._exit_foxhole_expire_t = nil
		end
	end

	return 
end
function PlayerFoxhole:_end_action_exit_foxhole()
	slot4 = true

	managers.hud.hide_progress_timer_bar(slot2, managers.hud)

	slot4 = "standard"

	managers.player.set_player_state(slot2, managers.player)

	return 
end

return 
