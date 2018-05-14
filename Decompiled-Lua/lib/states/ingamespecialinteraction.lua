slot2 = "lib/states/GameState"

require(slot1)

if not IngameSpecialInteraction then
	slot2 = IngamePlayerBaseState
	slot0 = class(slot1)
end

IngameSpecialInteraction = slot0
IngameSpecialInteraction.FAILED_COOLDOWN = 1
IngameSpecialInteraction.COMPLETED_DELAY = 0.5
IngameSpecialInteraction.LOCKPICK_DOF_DIST = 3
function IngameSpecialInteraction:init(game_state_machine)
	slot6 = game_state_machine

	IngameSpecialInteraction.super.init(slot3, self, "ingame_special_interaction")

	self._current_stage = 1

	return 
end
function IngameSpecialInteraction:_setup_controller()
	slot3 = managers.menu
	slot3 = managers.menu.get_controller(slot2)

	managers.menu.get_controller(slot2).disable(slot2)

	slot7 = managers.controller
	slot6 = false
	self._controller = managers.controller.create_controller(slot2, managers.controller, "ingame_special_interaction", managers.controller.get_default_wrapper_index(slot6))
	slot5 = "cb_leave"
	self._leave_cb = callback(slot2, self, self)
	slot5 = "cb_interact"
	self._interact_cb = callback(slot2, self, self)
	slot5 = self._leave_cb

	self._controller.add_trigger(slot2, self._controller, "jump")

	slot5 = self._interact_cb

	self._controller.add_trigger(slot2, self._controller, "interact")

	slot4 = true

	self._controller.set_enabled(slot2, self._controller)

	return 
end
function IngameSpecialInteraction:_clear_controller()
	slot3 = managers.menu
	local menu_controller = managers.menu.get_controller(slot2)

	if menu_controller then
		slot4 = menu_controller

		menu_controller.enable(slot3)
	end

	if self._controller then
		slot6 = self._leave_cb

		self._controller.remove_trigger(slot3, self._controller, "jump")

		slot6 = self._interact_cb

		self._controller.remove_trigger(slot3, self._controller, "interact")

		slot5 = false

		self._controller.set_enabled(slot3, self._controller)

		slot4 = self._controller

		self._controller.destroy(slot3)

		self._controller = nil
	end

	return 
end
function IngameSpecialInteraction:set_controller_enabled(enabled)
	if self._controller then
		slot5 = enabled

		self._controller.set_enabled(slot3, self._controller)
	end

	return 
end
function IngameSpecialInteraction:cb_leave()
	slot4 = "[IngameSpecialInteraction:cb_leave()]"

	Application.debug(slot2, Application)

	if self._completed then
		return 
	end

	slot4 = self._old_state

	game_state_machine.change_state_by_name(slot2, game_state_machine)

	return 
end
function IngameSpecialInteraction:cb_interact()
	if 0 < self._cooldown or self._completed then
		return 
	end

	slot3 = self

	self._check_stage_complete(slot2)

	slot3 = self

	self._check_all_complete(slot2)

	return 
end
function IngameSpecialInteraction:on_destroyed()
	return 
end
function IngameSpecialInteraction:update(t, dt)
	if not self._hud then
		return 
	end

	slot6 = dt

	self._hud.rotate_circles(slot4, self._hud)

	if 0 < self._cooldown then
		self._cooldown = self._cooldown - dt

		if self._cooldown <= 0 then
			self._cooldown = 0

			if self._invalid_stage then
				slot7 = true

				self._hud.set_bar_valid(slot4, self._hud, self._invalid_stage)

				self._invalid_stage = nil

				if self._tweak_data.sounds then
					slot6 = self._tweak_data.sounds.circles[self._current_stage].mechanics

					self._play_sound(slot4, self)
				end
			end
		end
	end

	if self._completed then
		self._end_t = self._end_t - dt

		if self._end_t <= 0 then
			self._end_t = 0
			slot5 = self._tweak_data.target_unit

			if self._tweak_data.target_unit.interaction(slot4) then
				slot5 = self._tweak_data.target_unit
				slot5 = self._tweak_data.target_unit.interaction(slot4)

				self._tweak_data.target_unit.interaction(slot4).special_interaction_done(slot4)

				slot6 = self._old_state

				game_state_machine.change_state_by_name(slot4, game_state_machine)
			end
		end
	end

	slot5 = self._tweak_data.target_unit

	if alive(slot4) then
		slot5 = self._tweak_data.target_unit

		if self._tweak_data.target_unit.unit_data(slot4)._interaction_done then
			self._completed_by_other = true
			slot6 = self._old_state

			game_state_machine.change_state_by_name(slot4, game_state_machine)
		end
	end

	return 
end
function IngameSpecialInteraction:update_player_stamina(t, dt)
	slot5 = managers.player
	local player = managers.player.player_unit(slot4)

	if player then
		slot6 = player

		if player.movement(slot5) then
			slot6 = player
			slot9 = true

			player.movement(slot5).update_stamina(slot5, player.movement(slot5), t, dt)
		end
	end

	return 
end
function IngameSpecialInteraction:_player_damage(info)
	return 
end
function IngameSpecialInteraction:at_enter(old_state, params)
	slot5 = managers.player
	local player = managers.player.player_unit(slot4)

	if player then
		slot6 = player
		slot6 = player.movement(slot5)
		slot6 = player.movement(slot5).current_state(slot5)

		player.movement(slot5).current_state(slot5).interupt_all_actions(slot5)

		slot6 = player
		slot7 = PlayerStandard.IDS_UNEQUIP

		player.camera(slot5).play_redirect(slot5, player.camera(slot5))

		slot6 = player
		slot7 = true

		player.base(slot5).set_enabled(slot5, player.base(slot5))

		slot6 = player
		slot8 = {
			"hurt",
			"death"
		}
		slot13 = "_player_damage"

		player.character_damage(slot5).add_listener(slot5, player.character_damage(slot5), "IngameSpecialInteraction", callback(slot10, self, self))

		slot8 = {
			skip_idle_check = true,
			instigator = managers.player.local_player(slot10)
		}
		slot11 = managers.player

		managers.dialog.queue_dialog(slot5, managers.dialog, "player_gen_picking_lock")

		slot8 = 100

		SoundDevice.set_rtpc(slot5, SoundDevice, "stamina")
	end

	if not self._sound_source then
		slot7 = "ingame_special_interaction"
		slot4 = SoundDevice.create_source(slot5, SoundDevice)
	end

	self._sound_source = slot4
	slot6 = self._sound_source
	slot9 = player

	self._sound_source.set_position(slot5, player.position(slot8))

	self._tweak_data = params
	self._cooldown = 0.1
	self._completed = false
	slot6 = old_state
	self._old_state = old_state.name(slot5)
	slot6 = managers.hud

	managers.hud.remove_interact(slot5)

	slot6 = player
	slot9 = 0

	player.camera(slot5).set_shaker_parameter(slot5, player.camera(slot5), "headbob", "amplitude")

	slot10 = PlayerBase.INGAME_HUD_SAFERECT
	slot8 = params
	self._hud = managers.hud.create_special_interaction(slot5, managers.hud, managers.hud.script("amplitude", managers.hud))
	slot6 = self._hud

	self._hud.show(slot5)

	slot7 = 1

	managers.environment_controller.set_vignette(slot5, managers.environment_controller)

	slot6 = self

	self._setup_controller(slot5)

	if self._tweak_data.sounds then
		slot7 = self._tweak_data.sounds.circles[1].mechanics

		self._play_sound(slot5, self)
	end

	slot7 = PlayerBase.INGAME_HUD_SAFERECT

	managers.hud.show(slot5, managers.hud)

	slot7 = PlayerBase.INGAME_HUD_FULLSCREEN

	managers.hud.show(slot5, managers.hud)

	slot6 = managers.network
	slot7 = "enter_lockpicking_state"

	managers.network.session(slot5).send_to_peers(slot5, managers.network.session(slot5))

	return 
end
function IngameSpecialInteraction:at_exit()
	slot3 = self._sound_source

	self._sound_source.stop(slot2)

	if self._completed then
		slot4 = self._tweak_data.sounds.success

		self._play_sound(slot2, self)

		slot5 = {
			skip_idle_check = true,
			instigator = managers.player.local_player(slot7)
		}
		slot8 = managers.player

		managers.dialog.queue_dialog(slot2, managers.dialog, "player_gen_lock_picked")
	end

	slot4 = 0

	managers.environment_controller.set_vignette(slot2, managers.environment_controller)

	slot3 = self

	self._clear_controller(slot2)

	slot3 = managers.player
	local player = managers.player.player_unit(slot2)

	if player then
		slot4 = player
		slot5 = true

		player.base(slot3).set_enabled(slot3, player.base(slot3))

		slot4 = player
		slot5 = true

		player.base(slot3).set_visible(slot3, player.base(slot3))

		slot4 = player
		player.base(slot3).skip_update_one_frame = true
		slot4 = player
		slot5 = PlayerStandard.IDS_EQUIP

		player.camera(true).play_redirect(true, player.camera(true))

		slot4 = player
		slot5 = "IngameSpecialInteraction"

		player.character_damage(true).remove_listener(true, player.character_damage(true))
	end

	slot5 = self._completed

	managers.hud.hide_special_interaction(slot3, managers.hud)

	if not self._completed and not self._completed_by_other then
		slot4 = self._tweak_data.target_unit

		if alive(slot3) then
			slot4 = self._tweak_data.target_unit

			if self._tweak_data.target_unit.interaction(slot3) then
				slot4 = self._tweak_data.target_unit
				slot4 = self._tweak_data.target_unit.interaction(slot3)

				if self._tweak_data.target_unit.interaction(slot3).active(slot3) then
					slot4 = managers.hud

					managers.hud.show_interact(slot3)
				end
			end
		end
	end

	self._hud = nil
	slot5 = PlayerBase.INGAME_HUD_SAFERECT

	managers.hud.hide(slot3, managers.hud)

	slot5 = PlayerBase.INGAME_HUD_FULLSCREEN

	managers.hud.hide(slot3, managers.hud)

	slot4 = managers.network
	slot5 = "exit_lockpicking_state"

	managers.network.session(slot3).send_to_peers(slot3, managers.network.session(slot3))

	return 
end
function IngameSpecialInteraction:_check_stage_complete()
	local current_stage_data, current_stage = nil
	slot7 = self._hud

	for stage, stage_data in pairs(self._hud.circles(slot6)) do
		if not stage_data.completed then
			current_stage = stage
			current_stage_data = stage_data

			break
		end
	end

	if not current_stage then
		return 
	end

	self._current_stage = current_stage
	local circle_difficulty = self._tweak_data.circle_difficulty[current_stage]
	local diff_degrees = 360 * (1 - circle_difficulty) - 3
	local circle = current_stage_data.circle._circle
	slot8 = circle
	local current_rot = circle.rotation(slot7)

	if current_rot < diff_degrees then
		slot10 = current_stage

		self._hud.complete_stage(slot8, self._hud)

		if self._tweak_data.sounds then
			slot10 = self._tweak_data.sounds.circles[current_stage].lock

			self._play_sound(slot8, self)

			if self._tweak_data.sounds.circles[current_stage + 1] then
				slot11 = true

				self._play_sound(slot8, self, self._tweak_data.sounds.circles[current_stage + 1].mechanics)
			end
		end
	else
		slot11 = false

		self._hud.set_bar_valid(slot8, self._hud, current_stage)

		local new_start_rotation = math.random() * 360
		slot11 = new_start_rotation

		circle.set_rotation(self._hud, circle)

		self._cooldown = IngameSpecialInteraction.FAILED_COOLDOWN
		self._invalid_stage = current_stage

		if self._tweak_data.sounds then
			slot11 = self._tweak_data.sounds.failed

			self._play_sound(slot9, self)

			slot12 = {
				skip_idle_check = true,
				instigator = managers.player.local_player(slot14)
			}
			slot15 = managers.player

			managers.dialog.queue_dialog(slot9, managers.dialog, "player_gen_lockpick_fail")
		end

		slot11 = BuffEffectManager.EFFECT_PLAYER_FAILED_INTERACTION_MINI_GAME

		if managers.buff_effect.is_effect_active(slot9, managers.buff_effect) then
			slot11 = BuffEffectManager.EFFECT_PLAYER_FAILED_INTERACTION_MINI_GAME
			slot14 = managers.network
			slot14 = managers.network.session(slot13)
			slot14 = managers.network.session(slot13).local_peer(slot13)

			managers.buff_effect.fail_effect(slot9, managers.buff_effect, managers.network.session(slot13).local_peer(slot13).id(slot13))
		end
	end

	return 
end
function IngameSpecialInteraction:_check_all_complete(t, dt)
	local completed = true
	slot8 = self._hud

	for stage, stage_data in pairs(self._hud.circles(slot7)) do
		completed = completed and stage_data.completed
	end

	self._completed = completed

	if completed then
		if self._tweak_data.sounds then
			slot7 = self._tweak_data.sounds.last_circle

			self._play_sound(slot5, self)
		end

		self._end_t = IngameSpecialInteraction.COMPLETED_DELAY
	end

	return 
end
function IngameSpecialInteraction:_play_sound(event, no_stop)
	if event then
		if not no_stop then
			slot5 = self._sound_source

			self._sound_source.stop(slot4)
		end

		slot6 = event

		self._sound_source.post_event(slot4, self._sound_source)
	end

	return 
end

return 
