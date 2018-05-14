if not PlayerMoveObject then
	slot2 = PlayerStandard
	slot0 = class(slot1)
end

PlayerMoveObject = slot0
PlayerMoveObject.target_tilt = -5
function PlayerMoveObject:init(unit)
	slot5 = unit

	PlayerMoveObject.super.init(slot3, self)

	return 
end
function PlayerMoveObject:enter(state_data, enter_data)
	slot7 = enter_data

	PlayerMoveObject.super.enter(slot4, self, state_data)

	local move_object_data = managers.player.get_move_object_data(slot4)
	self._moving_unit = move_object_data.moving_unit
	slot7 = 0
	self._moving_body = self._moving_unit.body(managers.player, self._moving_unit)
	slot7 = "player_align_0*"
	self._player_align_points = self._moving_unit.get_objects(managers.player, self._moving_unit)
	slot10 = move_object_data

	Application.trace(managers.player, Application, inspect(slot9))

	slot9 = "player_align_0*"

	for _, obj in pairs(self._moving_unit.get_objects("PlayerMoveObject:enter: ", self._moving_unit)) do
		slot12 = "PlayerMoveObject:enter: "
		slot15 = obj

		Application.trace(slot10, Application, inspect(slot14))
	end

	return 
end
function PlayerMoveObject:_enter(enter_data)
	return 
end
function PlayerMoveObject:exit(state_data, new_state_name)
	slot7 = new_state_name

	PlayerMoveObject.super.exit(slot4, self, state_data)

	slot5 = self._unit
	slot5 = self._unit.camera(slot4)
	slot5 = self._unit.camera(slot4).camera_unit(slot4)
	slot6 = 0

	self._unit.camera(slot4).camera_unit(slot4).base(slot4).set_target_tilt(slot4, self._unit.camera(slot4).camera_unit(slot4).base(slot4))

	return 
end
function PlayerMoveObject:update(t, dt)
	slot7 = dt

	PlayerMoveObject.super.update(slot4, self, t)

	if self._normal_move_dir then
		slot6 = t
		local player_speed = self._get_max_walk_speed(slot4, self)
		slot11 = player_speed
		slot9 = inspect(self._normal_move_dir)
		slot14 = self._moving_unit

		Application.trace(self, Application, "PlayerMoveObject:update: ", inspect(slot9), inspect(self._moving_unit.mass(slot13)))

		slot6 = self._moving_body

		self._moving_body.set_dynamic(self)

		slot7 = "script"

		self._moving_unit.set_driving(self, self._moving_unit)

		slot7 = self._normal_move_dir * player_speed

		self._moving_body.set_velocity(self, self._moving_body)
	end

	return 
end
function PlayerMoveObject:set_tweak_data(name)
	self._tweak_data_name = name

	return 
end
function PlayerMoveObject:_update_check_actions(t, dt)
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

	self._check_action_interact(slot7, self, t)

	slot10 = input

	self._check_action_jump(slot7, self, t)

	slot10 = input

	self._check_action_run(slot7, self, t)

	slot10 = input

	self._check_action_ladder(slot7, self, t)

	slot10 = input

	self._check_action_zipline(slot7, self, t)

	slot10 = input

	self._check_action_cash_inspect(slot7, self, t)

	slot10 = input

	self._check_action_deploy_bipod(slot7, self, t)

	slot10 = input

	self._check_action_duck(slot7, self, t)

	slot10 = input

	self._check_action_steelsight(slot7, self, t)

	slot10 = input

	self._check_use_item(slot7, self, t)

	slot10 = input

	self._check_comm_wheel(slot7, self, t)

	slot11 = input

	self._check_stats_screen(slot7, self, t, dt)

	return 
end
function PlayerMoveObject:_check_action_run(...)
	return 
end
function PlayerMoveObject:_check_action_interact(t, input)
	local new_action, timer, interact_object = nil
	local interaction_wanted = input.btn_interact_press

	if interaction_wanted then
		slot10 = "standard"

		managers.player.set_player_state(slot8, managers.player)

		return 
	end

	return 
end
function PlayerMoveObject:_check_change_weapon(...)
	slot3 = self

	return PlayerMoveObject.super._check_change_weapon(slot2, ...)
end
function PlayerMoveObject:_check_action_equip(...)
	slot3 = self

	return PlayerMoveObject.super._check_action_equip(slot2, ...)
end
function PlayerMoveObject:_update_movement(t, dt)
	slot7 = dt

	PlayerMoveObject.super._update_movement(slot4, self, t)

	return 
end
function PlayerMoveObject:_start_action_jump(...)
	slot3 = self

	PlayerMoveObject.super._start_action_jump(slot2, ...)

	return 
end
function PlayerMoveObject:_perform_jump(jump_vec)
	slot5 = jump_vec

	PlayerMoveObject.super._perform_jump(slot3, self)

	return 
end
function PlayerMoveObject:_get_max_walk_speed(...)
	local multiplier = 0.5
	slot4 = self

	return PlayerMoveObject.super._get_max_walk_speed(slot3, ...) * multiplier
end
function PlayerMoveObject:_get_walk_headbob(...)
	local multiplier = 0.5
	slot4 = self

	return PlayerMoveObject.super._get_walk_headbob(slot3, ...) * multiplier
end
function PlayerMoveObject:pre_destroy(unit)
	return 
end
function PlayerMoveObject:destroy()
	return 
end

return 
