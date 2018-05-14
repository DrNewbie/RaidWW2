-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreUnit"

core.import(slot1, core)

slot2 = "lib/states/GameState"

require(slot1)

if not IngameWaitingForRespawnState then
	slot2 = GameState
	slot0 = class(slot1)
end

IngameWaitingForRespawnState = slot0
slot3 = "guis/spectator_mode_fullscreen"
IngameWaitingForRespawnState.GUI_SPECTATOR_FULLSCREEN = Idstring(slot2)
slot3 = "guis/spectator_mode_saferect"
IngameWaitingForRespawnState.GUI_SPECTATOR = Idstring(slot2)
IngameWaitingForRespawnState.init = function (self, game_state_machine)
	slot6 = game_state_machine

	GameState.init(slot3, self, "ingame_waiting_for_respawn")

	slot5 = "world_geometry"
	self._slotmask = managers.slot.get_mask(slot3, managers.slot) + 39
	slot6 = 0
	self._fwd = Vector3(slot3, 1, 0)
	self._up_offset = math.UP * 80
	self._rot = Rotation()
	self._vec_target = Vector3()
	self._vec_eye = Vector3()
	self._vec_dir = Vector3()

	return 
end
IngameWaitingForRespawnState._setup_controller = function (self)
	slot7 = managers.controller
	slot6 = false
	self._controller = managers.controller.create_controller(slot2, managers.controller, "waiting_for_respawn", managers.controller.get_default_wrapper_index(slot6))
	slot5 = "cb_next_player"
	self._next_player_cb = callback(slot2, self, self)
	slot5 = "cb_prev_player"
	self._prev_player_cb = callback(slot2, self, self)
	slot5 = self._prev_player_cb

	self._controller.add_trigger(slot2, self._controller, "left")

	slot5 = self._next_player_cb

	self._controller.add_trigger(slot2, self._controller, "right")

	slot5 = self._prev_player_cb

	self._controller.add_trigger(slot2, self._controller, "primary_attack")

	slot5 = self._next_player_cb

	self._controller.add_trigger(slot2, self._controller, "secondary_attack")

	slot4 = true

	self._controller.set_enabled(slot2, self._controller)

	slot4 = "main"

	managers.controller.set_ingame_mode(slot2, managers.controller)

	return 
end
IngameWaitingForRespawnState._clear_controller = function (self)
	if self._controller then
		slot5 = self._prev_player_cb

		self._controller.remove_trigger(slot2, self._controller, "left")

		slot5 = self._next_player_cb

		self._controller.remove_trigger(slot2, self._controller, "right")

		slot5 = self._prev_player_cb

		self._controller.remove_trigger(slot2, self._controller, "primary_attack")

		slot5 = self._next_player_cb

		self._controller.remove_trigger(slot2, self._controller, "secondary_attack")

		slot4 = false

		self._controller.set_enabled(slot2, self._controller)

		slot3 = self._controller

		self._controller.destroy(slot2)

		self._controller = nil
	end

	return 
end
IngameWaitingForRespawnState.set_controller_enabled = function (self, enabled)
	if self._controller then
		slot5 = enabled

		self._controller.set_enabled(slot3, self._controller)
	end

	return 
end
IngameWaitingForRespawnState._setup_camera = function (self)
	slot3 = World
	self._camera_object = World.create_camera(slot2)
	slot4 = managers.viewport.CAMERA_NEAR_RANGE

	self._camera_object.set_near_range(slot2, self._camera_object)

	slot4 = managers.viewport.CAMERA_FAR_RANGE * 5

	self._camera_object.set_far_range(slot2, self._camera_object)

	slot4 = 75

	self._camera_object.set_fov(slot2, self._camera_object)

	slot9 = CoreManagerBase.PRIO_WORLDCAMERA
	self._viewport = managers.viewport.new_vp(slot2, managers.viewport, 0, 0, 1, 1, "spectator")
	slot4 = self._camera_object

	self._viewport.set_camera(slot2, self._viewport)

	slot4 = true

	self._viewport.set_active(slot2, self._viewport)

	return 
end
IngameWaitingForRespawnState._clear_camera = function (self)
	slot3 = self._viewport

	self._viewport.destroy(slot2)

	self._viewport = nil
	slot4 = self._camera_object

	World.delete_camera(slot2, World)

	self._camera_object = nil

	return 
end
IngameWaitingForRespawnState._setup_sound_listener = function (self)
	slot8 = false
	self._listener_id = managers.listener.add_listener(slot2, managers.listener, "spectator_camera", self._camera_object, self._camera_object, nil)
	slot5 = {
		"spectator_camera"
	}

	managers.listener.add_set(slot2, managers.listener, "spectator_camera")

	slot5 = "spectator_camera"
	self._listener_activation_id = managers.listener.activate_set(slot2, managers.listener, "main")
	slot4 = {
		primary = true,
		active = true,
		object = self._camera_object
	}
	self._sound_check_object = managers.sound_environment.add_check_object(slot2, managers.sound_environment)

	return 
end
IngameWaitingForRespawnState._clear_sound_listener = function (self)
	slot4 = self._sound_check_object

	managers.sound_environment.remove_check_object(slot2, managers.sound_environment)

	slot4 = self._listener_id

	managers.listener.remove_listener(slot2, managers.listener)

	slot4 = "spectator_camera"

	managers.listener.remove_set(slot2, managers.listener)

	self._listener_id = nil

	return 
end
IngameWaitingForRespawnState._create_spectator_data = function (self)
	slot3 = managers.groupai
	slot3 = managers.groupai.state(slot2)
	local all_teammates = managers.groupai.state(slot2).all_char_criminals(slot2)
	local teammate_list = {}
	slot5 = all_teammates

	for u_key, u_data in pairs(slot4) do
		slot11 = u_key

		table.insert(slot9, teammate_list)
	end

	self._spectator_data = {
		teammate_records = all_teammates,
		teammate_list = teammate_list,
		watch_u_key = teammate_list[1]
	}

	return 
end
IngameWaitingForRespawnState._begin_game_enter_transition = function (self)
	if self._ready_to_spawn_t then
		return 
	end

	self._auto_respawn_t = nil
	self._ai_trade_respawn_gui_enabled = nil
	local overlay_effect_desc = tweak_data.overlay_effects.spectator
	local fade_in_duration = overlay_effect_desc.fade_in
	slot6 = overlay_effect_desc
	self._fade_in_overlay_eff_id = managers.overlay_effect.play_effect(slot4, managers.overlay_effect)
	slot5 = TimerManager
	slot5 = TimerManager.game(slot4)
	self._ready_to_spawn_t = TimerManager.game(slot4).time(slot4) + fade_in_duration

	return 
end
IngameWaitingForRespawnState.request_player_spawn = function (peer_to_spawn)
	slot3 = Network

	if Network.is_client(slot2) then
		slot3 = managers.network
		slot3 = managers.network.session(slot2)
		slot4 = "request_spawn_member"

		managers.network.session(slot2).server_peer(slot2).send(slot2, managers.network.session(slot2).server_peer(slot2))
	else
		slot3 = managers.criminals
		local pos_rot = managers.criminals.get_valid_player_respawn_pos_rot(slot2)

		if not pos_rot and managers.network then

			-- Decompilation error in this vicinity:
			slot4 = managers.network
			pos_rot = spawn_point and spawn_point.pos_rot
		end

		if pos_rot then
			local peer_id = peer_to_spawn or 1
			slot6 = peer_id
			local crim_name = managers.criminals.character_name_by_peer_id(slot4, managers.criminals)
			slot6 = managers.trade
			local first_crim = managers.trade.get_criminal_to_trade(managers.criminals)

			if first_crim and first_crim.id == crim_name then
				slot7 = managers.trade

				managers.trade.cancel_trade(slot6)
			end

			slot8 = crim_name

			managers.trade.sync_set_trade_spawn(slot6, managers.trade)

			slot7 = managers.network

			managers.network.session(slot6).send_to_peers_synched(slot6, managers.network.session(slot6), "set_trade_spawn")

			local sp_id = "IngameWaitingForRespawnState"
			local spawn_point = {
				position = pos_rot[1],
				rotation = pos_rot[2]
			}
			local state_transition = pos_rot[3]
			slot12 = spawn_point

			managers.network.register_spawn_point(crim_name, managers.network, sp_id)

			slot10 = managers.network
			slot14 = state_transition

			managers.network.session(crim_name).spawn_member_by_id(crim_name, managers.network.session(crim_name), peer_id, sp_id, false)

			slot11 = sp_id

			managers.network.unregister_spawn_point(crim_name, managers.network)
		end
	end

	return 
end
IngameWaitingForRespawnState.update = function (self, t, dt)
	if self._player_state_change_needed then
		slot7 = managers.player

		if not alive(managers.player.player_unit(slot6)) then
			self._player_state_change_needed = nil
			slot6 = "standard"

			managers.player.set_player_state(slot4, managers.player)
		end
	end

	if not self._stats_screen then
		slot6 = "stats_screen"
		slot3 = self._controller.get_input_pressed(slot4, self._controller)
	else
		slot3 = false

		if false then
			local btn_stats_screen_press = true
		end
	end

	if self._stats_screen then
		slot7 = "stats_screen"
		local btn_stats_screen_release = self._controller.get_input_released(slot5, self._controller)
	end

	if btn_stats_screen_press then
		self._stats_screen = true
		slot7 = managers.hud

		managers.hud.show_stats_screen(slot6)
	elseif btn_stats_screen_release then
		self._stats_screen = false
		slot7 = managers.hud

		managers.hud.hide_stats_screen(slot6)
	end

	slot7 = managers.trade
	local ai_trade_time = managers.trade.get_auto_assault_ai_trade_time(slot6)

	if not ai_trade_time and self._ai_trade_respawn_gui_enabled then
		slot9 = false

		managers.hud.set_custody_timer_visibility(slot7, managers.hud)

		self._ai_trade_respawn_gui_enabled = false
	end

	if ai_trade_time then
	elseif self._auto_respawn_t then
		slot9 = false

		managers.hud.set_custody_respawn_type(slot7, managers.hud)

		slot9 = self._auto_respawn_t - t

		managers.hud.set_custody_respawn_time(slot7, managers.hud)

		if self._auto_respawn_t < t then
			self._auto_respawn_t = nil
			slot8 = self

			self._begin_game_enter_transition(slot7)
		end
	elseif self._ready_to_spawn_t and self._ready_to_spawn_t < t then
		IngameWaitingForRespawnState.request_player_spawn()
	end

	if self._respawn_delay then
		slot8 = managers.trade
		slot11 = managers.criminals
		self._respawn_delay = managers.trade.respawn_delay_by_name(slot7, managers.criminals.local_character_name(slot10))

		if self._respawn_delay <= 0 then
			self._respawn_delay = nil
			slot9 = false

			managers.hud.set_custody_negotiating_visible(slot7, managers.hud)

			slot9 = false

			managers.hud.set_custody_trade_delay_visible(slot7, managers.hud)
		else
			slot9 = self._respawn_delay

			managers.hud.set_custody_trade_delay(slot7, managers.hud)
		end
	end

	if self._play_too_long_line_t and self._play_too_long_line_t < t then
		slot8 = managers.groupai
		slot8 = managers.groupai.state(slot7)

		if managers.groupai.state(slot7).bain_state(slot7) then
			self._play_too_long_line_t = nil
			slot10 = {}

			managers.dialog.queue_dialog(slot7, managers.dialog, "Play_ban_h38x")
		end
	end

	slot10 = dt

	self._upd_watch(slot7, self, t)

	return 
end
local mvec3_set = mvector3.set
local mvec3_add = mvector3.add
local mvec3_subtract = mvector3.subtract
local mvec3_multiply = mvector3.multiply
local mvec3_negate = mvector3.negate
local mvec3_rotate_with = mvector3.rotate_with
local mvec3_x = mvector3.x
local mvec3_y = mvector3.y
local mvec3_normalize = mvector3.normalize
local mvec3_length = mvector3.length
local mvec3_cross = mvector3.cross
local mvec3_angle = mvector3.angle
local mrot_set_axis_angle = mrotation.set_axis_angle
local mrot_set_look_at = mrotation.set_look_at
local math_up = math.UP
IngameWaitingForRespawnState._upd_watch = function (self, t, dt)
	slot5 = self

	self._refresh_teammate_list(slot4)

	if self._spectator_data.watch_u_key then
		slot6 = self.GUI_SPECTATOR_FULLSCREEN

		if managers.hud.visible(slot4, managers.hud) then
			slot6 = self.GUI_SPECTATOR_FULLSCREEN

			managers.hud.hide(slot4, managers.hud)
		end

		local watch_u_record = self._spectator_data.teammate_records[self._spectator_data.watch_u_key]
		slot6 = watch_u_record.unit
		slot6 = watch_u_record.unit.movement(slot5)
		slot9 = "Head"
		local watch_u_head = watch_u_record.unit.movement(slot5).get_object(slot5, Idstring(slot8))

		if not watch_u_head then
			self._next_player_cb()

			return 
		end

		slot7 = self._vec_dir
		slot11 = "look"

		mvec3_set(slot6, self._controller.get_input_axis(slot9, self._controller))

		local controller_type = self._controller.get_default_controller_id(slot6)
		local stick_input_x = mvec3_x(self._controller)
		slot9 = self._vec_dir

		if 0.1 < mvec3_length(self._vec_dir) then
			if controller_type ~= "keyboard" then
				slot11 = self._vec_dir
				stick_input_x = stick_input_x / (1.3 - 0.3 * (1 - math.abs(mvec3_y(slot10))))
				stick_input_x = stick_input_x * dt * 180
			end

			slot11 = -0.5 * stick_input_x

			mrot_set_axis_angle(slot8, self._rot, math_up)

			slot10 = self._rot

			mvec3_rotate_with(slot8, self._fwd)

			slot11 = self._fwd

			mvec3_cross(slot8, self._vec_target, math_up)

			slot13 = self._vec_dir
			slot11 = 0.5 * -mvec3_y(slot12)

			mrot_set_axis_angle(slot8, self._rot, self._vec_target)

			slot10 = self._rot

			mvec3_rotate_with(slot8, self._fwd)

			slot10 = self._fwd
			local angle = mvec3_angle(slot8, math_up)
			local rot = 0

			if 145 < angle then
				rot = 145 - angle
			elseif angle < 85 then
				rot = 85 - angle
			end

			if rot ~= 0 then
				slot13 = rot

				mrot_set_axis_angle(slot10, self._rot, self._vec_target)

				slot12 = self._rot

				mvec3_rotate_with(slot10, self._fwd)
			end
		end

		local vehicle_unit, vehicle_seat = nil

		if managers.network then
			slot11 = managers.network

			if managers.network.session(slot10) then
				slot11 = watch_u_record.unit

				if watch_u_record.unit.network(slot10) then
					slot11 = watch_u_record.unit

					if watch_u_record.unit.brain(slot10) then
						slot11 = watch_u_record.unit
						vehicle_unit = watch_u_record.unit.movement(slot10).vehicle_unit
						slot11 = watch_u_record.unit
						vehicle_seat = watch_u_record.unit.movement(slot10).vehicle_seat
					else
						slot11 = watch_u_record.unit
						slot11 = watch_u_record.unit.network(slot10)

						if watch_u_record.unit.network(slot10).peer(slot10) then
							slot11 = watch_u_record.unit
							slot11 = watch_u_record.unit.network(slot10)
							local peer_id = watch_u_record.unit.network(slot10).peer(slot10).id(slot10)
							slot13 = peer_id
							local vehicle_data = managers.player.get_vehicle_for_peer(watch_u_record.unit.network(slot10).peer(slot10), managers.player)

							if vehicle_data then
								vehicle_unit = vehicle_data.vehicle_unit
								slot13 = vehicle_unit
								vehicle_seat = vehicle_unit.vehicle_driving(slot12)._seats[vehicle_data.seat]
							end
						end
					end
				end
			end
		end

		if vehicle_unit and vehicle_seat then
			slot11 = vehicle_unit
			slot12 = vehicle_seat.object
			local target_pos = vehicle_unit.vehicle(slot10).object_position(slot10, vehicle_unit.vehicle(slot10))
			slot13 = target_pos

			mvec3_set(vehicle_unit.vehicle(slot10), self._vec_target)

			local oobb = vehicle_unit.oobb(vehicle_unit.vehicle(slot10))
			local up = oobb.z(vehicle_unit) * 2.5
			slot15 = up

			mvec3_add(oobb, self._vec_target)
		else
			slot12 = self._vec_target

			watch_u_head.m_position(slot10, watch_u_head)
		end

		slot12 = self._fwd

		mvec3_set(slot10, self._vec_eye)

		slot12 = 150

		mvec3_multiply(slot10, self._vec_eye)

		slot11 = self._vec_eye

		mvec3_negate(slot10)

		slot12 = self._vec_target

		mvec3_add(slot10, self._vec_eye)

		slot13 = math_up

		mrot_set_look_at(slot10, self._rot, self._fwd)

		slot16 = self._slotmask
		local col_ray = World.raycast(slot10, World, "ray", self._vec_target, self._vec_eye, "slot_mask")
		local dis_new = nil

		if col_ray then
			slot14 = col_ray.ray

			mvec3_set(slot12, self._vec_dir)

			slot14 = 0
			dis_new = math.max(slot12, col_ray.distance - 30)
		else
			slot14 = self._vec_eye

			mvec3_set(slot12, self._vec_dir)

			slot14 = self._vec_target

			mvec3_subtract(slot12, self._vec_dir)

			slot13 = self._vec_dir
			dis_new = mvec3_normalize(slot12)
		end

		if self._dis_curr and self._dis_curr < dis_new then
			slot14 = 1.5
			local speed = math.max(slot12, (dis_new - self._dis_curr) / 5)
			slot16 = speed * dt
			self._dis_curr = math.lerp((dis_new - self._dis_curr) / 5, self._dis_curr, dis_new)
		else
			self._dis_curr = dis_new
		end

		slot14 = self._vec_dir

		mvec3_set(slot12, self._vec_eye)

		slot14 = self._dis_curr

		mvec3_multiply(slot12, self._vec_eye)

		slot14 = self._vec_target

		mvec3_add(slot12, self._vec_eye)

		slot14 = self._vec_eye

		self._camera_object.set_position(slot12, self._camera_object)

		slot14 = self._rot

		self._camera_object.set_rotation(slot12, self._camera_object)
	else
		slot6 = self.GUI_SPECTATOR_FULLSCREEN

		if not managers.hud.visible(slot4, managers.hud) then
			slot6 = self.GUI_SPECTATOR_FULLSCREEN

			managers.hud.show(slot4, managers.hud)
		end
	end

	return 
end
IngameWaitingForRespawnState.at_enter = function (self)
	slot4 = "[IngameWaitingForRespawnState:at_enter()]"

	Application.trace(slot2, Application)

	slot4 = BuffEffectManager.EFFECT_PLAYER_DIED

	if managers.buff_effect.is_effect_active(slot2, managers.buff_effect) then
		slot4 = BuffEffectManager.EFFECT_PLAYER_DIED
		slot7 = managers.network
		slot7 = managers.network.session(slot6)
		slot7 = managers.network.session(slot6).local_peer(slot6)

		managers.buff_effect.fail_effect(slot2, managers.buff_effect, managers.network.session(slot6).local_peer(slot6).id(slot6))
	end

	slot4 = PlayerManager.EVENT_LOCAL_PLAYER_ENTER_RESPAWN

	managers.system_event_listener.call_listeners(slot2, managers.system_event_listener)

	slot4 = BuffEffectManager.EFFECT_NO_BLEEDOUT_PUMPIKIN_REVIVE

	if managers.buff_effect.is_effect_active(slot2, managers.buff_effect) then
		self._pumpkin_destroyed_listener_key = "pumpkin_destroyed"
		slot5 = {
			CoreSystemEventListenerManager.SystemEventListenerManager.PUMPKIN_DESTROYED
		}
		slot10 = "_begin_game_enter_transition"

		managers.system_event_listener.add_listener(slot2, managers.system_event_listener, self._pumpkin_destroyed_listener_key, callback(slot7, self, self))
	end

	slot4 = true

	managers.hud.hide_comm_wheel(slot2, managers.hud)

	slot3 = managers.hud._hud_hit_direction

	managers.hud._hud_hit_direction.clean_up(slot2)

	slot3 = managers.player

	managers.player.force_drop_carry(slot2)

	slot3 = managers.hud

	managers.hud.hide_stats_screen(slot2)

	slot4 = {
		total = 100,
		current = 0,
		no_hint = true
	}

	managers.hud.set_player_health(slot2, managers.hud)

	slot4 = {
		total = 100,
		current = 0,
		no_hint = true
	}

	managers.hud.set_player_armor(slot2, managers.hud)

	slot4 = "mugshot_in_custody"
	slot8 = "debug_mugshot_in_custody"

	managers.hud.set_player_condition(slot2, managers.hud, managers.localization.text(slot6, managers.localization))

	slot4 = tweak_data.overlay_effects.fade_in

	managers.overlay_effect.play_effect(slot2, managers.overlay_effect)

	slot3 = self

	self._setup_camera(slot2)

	slot3 = self

	self._setup_controller(slot2)

	slot3 = self

	self._setup_sound_listener(slot2)

	self._dis_curr = 150
	slot4 = false

	managers.menu.set_mouse_sensitivity(slot2, managers.menu)

	self._player_state_change_needed = true
	self._respawn_delay = nil
	self._play_too_long_line_t = nil
	slot4 = self.GUI_SPECTATOR_FULLSCREEN

	if not managers.hud.exists(slot2, managers.hud) then
		slot8 = {}

		managers.hud.load_hud(slot2, managers.hud, self.GUI_SPECTATOR_FULLSCREEN, false, false, false)
	end

	slot4 = PlayerBase.PLAYER_CUSTODY_HUD

	if not managers.hud.exists(slot2, managers.hud) then
		slot8 = {}

		managers.hud.load_hud(slot2, managers.hud, self.GUI_SPECTATOR, false, true, true)
	end

	slot4 = self.GUI_SPECTATOR

	managers.hud.show(slot2, managers.hud)

	slot4 = PlayerBase.INGAME_HUD_SAFERECT

	managers.hud.hide(slot2, managers.hud)

	slot4 = PlayerBase.INGAME_HUD_FULLSCREEN

	managers.hud.hide(slot2, managers.hud)

	slot4 = false

	managers.hud.set_custody_can_be_trade_visible(slot2, managers.hud)

	slot4 = false

	managers.hud.set_custody_negotiating_visible(slot2, managers.hud)

	slot4 = false

	managers.hud.set_custody_trade_delay_visible(slot2, managers.hud)

	slot4 = BuffEffectManager.EFFECT_NO_BLEEDOUT_PUMPIKIN_REVIVE

	if managers.buff_effect.is_effect_active(slot2, managers.buff_effect) then
		slot3 = managers.hud

		managers.hud.set_custody_pumpkin_challenge(slot2)
	elseif tweak_data.player.damage.automatic_respawn_time and not Global.game_settings.single_player then
		slot3 = Application
		slot8 = 1
		self._auto_respawn_t = Application.time(slot2) + tweak_data.player.damage.automatic_respawn_time * managers.player.upgrade_value(slot4, managers.player, "player", "respawn_time_multiplier")
		slot4 = true

		managers.hud.set_custody_timer_visibility(tweak_data.player.damage.automatic_respawn_time * managers.player.upgrade_value(slot4, managers.player, "player", "respawn_time_multiplier"), managers.hud)
	else
		slot4 = false

		managers.hud.set_custody_timer_visibility(slot2, managers.hud)
	end

	slot3 = self

	self._create_spectator_data(slot2)
	self._next_player_cb()

	slot3 = Network

	if Network.is_server(slot2) then
		local respawn_delay = managers.trade.respawn_delay_by_name(slot2, managers.criminals.local_character_name(slot5))
		slot7 = managers.criminals
		local hostages_killed = managers.trade.hostages_killed_by_name(managers.trade, managers.criminals.local_character_name(managers.criminals))
		slot7 = hostages_killed

		self.trade_death(managers.trade, self, respawn_delay)
	end

	if Global.game_settings.single_player then
		slot3 = managers.groupai
		slot3 = managers.groupai.state(slot2)

		if not managers.groupai.state(slot2).is_ai_trade_possible(slot2) then
			slot4 = false

			managers.hud.set_custody_negotiating_visible(slot2, managers.hud)

			slot4 = false

			managers.hud.set_custody_trade_delay_visible(slot2, managers.hud)
		end
	end

	slot4 = PlayerBase.INGAME_HUD_SAFERECT

	managers.hud.hide(slot2, managers.hud)

	slot4 = PlayerBase.INGAME_HUD_FULLSCREEN

	managers.hud.hide(slot2, managers.hud)

	return 
end
IngameWaitingForRespawnState.at_exit = function (self)
	slot4 = "[IngameWaitingForRespawnState:at_exit()]"

	Application.trace(slot2, Application)

	slot4 = self.GUI_SPECTATOR

	managers.hud.hide(slot2, managers.hud)

	slot4 = self._fade_in_overlay_eff_id

	managers.overlay_effect.fade_out_effect(slot2, managers.overlay_effect)

	slot4 = self.GUI_SPECTATOR_FULLSCREEN

	if managers.hud.visible(slot2, managers.hud) then
		slot4 = self.GUI_SPECTATOR_FULLSCREEN

		managers.hud.hide(slot2, managers.hud)
	end

	self._ai_trade_respawn_gui_enabled = nil
	slot3 = self

	self._clear_controller(slot2)

	slot3 = self

	self._clear_camera(slot2)

	slot3 = self

	self._clear_sound_listener(slot2)

	self._auto_respawn_t = nil
	self._ready_to_spawn_t = nil
	self._fade_in_overlay_eff_id = nil
	slot5 = ""

	managers.hud.set_player_condition(slot2, managers.hud, "mugshot_normal")

	if self._pumpkin_destroyed_listener_key then
		slot4 = self._pumpkin_destroyed_listener_key

		managers.system_event_listener.remove_listener(slot2, managers.system_event_listener)
	end

	slot4 = PlayerManager.EVENT_LOCAL_PLAYER_EXIT_RESPAWN

	managers.system_event_listener.call_listeners(slot2, managers.system_event_listener)

	slot4 = PlayerBase.INGAME_HUD_SAFERECT

	managers.hud.show(slot2, managers.hud)

	slot4 = PlayerBase.INGAME_HUD_FULLSCREEN

	managers.hud.show(slot2, managers.hud)

	return 
end
IngameWaitingForRespawnState._refresh_teammate_list = function (self)
	local all_teammates = self._spectator_data.teammate_records
	local teammate_list = self._spectator_data.teammate_list
	local lost_teammate_at_i = nil
	local i = #teammate_list

	while 0 < i do
		local u_key = teammate_list[i]
		local teammate_data = all_teammates[u_key]

		if not teammate_data then
			slot10 = i

			table.remove(slot8, teammate_list)

			if u_key == self._spectator_data.watch_u_key then
				lost_teammate_at_i = i
				self._spectator_data.watch_u_key = nil
			end
		end

		i = i - 1
	end

	slot8 = all_teammates

	if #teammate_list ~= table.size(slot7) then
		slot7 = all_teammates

		for u_key, u_data in pairs(slot6) do
			local add = true
			slot13 = teammate_list

			for i_key, test_u_key in ipairs(slot12) do
				if test_u_key == u_key then
					add = false

					break
				end
			end

			if add then
				slot14 = u_key

				table.insert(slot12, teammate_list)
			end
		end
	end

	if lost_teammate_at_i then
		slot10 = #teammate_list
		self._spectator_data.watch_u_key = teammate_list[math.clamp(slot7, lost_teammate_at_i, 1)]
	end

	if not self._spectator_data.watch_u_key and 0 < #teammate_list then
		self._spectator_data.watch_u_key = teammate_list[1]
	end

	return 
end
IngameWaitingForRespawnState._get_teammate_index_by_unit_key = function (self, u_key)
	slot4 = self._spectator_data.teammate_list

	for i_key, test_u_key in ipairs(slot3) do
		if test_u_key == u_key then
			return i_key
		end
	end

	return 
end
IngameWaitingForRespawnState.cb_next_player = function (self)
	slot3 = self

	self._refresh_teammate_list(slot2)

	local watch_u_key = self._spectator_data.watch_u_key

	if not watch_u_key then
		return 
	end

	slot5 = watch_u_key
	local i_watch = self._get_teammate_index_by_unit_key(slot3, self)

	if i_watch == #self._spectator_data.teammate_list then
		i_watch = 1
	else
		i_watch = i_watch + 1
	end

	watch_u_key = self._spectator_data.teammate_list[i_watch]
	self._spectator_data.watch_u_key = watch_u_key
	self._dis_curr = nil

	return 
end
IngameWaitingForRespawnState.cb_prev_player = function (self)
	slot3 = self

	self._refresh_teammate_list(slot2)

	local watch_u_key = self._spectator_data.watch_u_key

	if not watch_u_key then
		return 
	end

	slot5 = watch_u_key
	local i_watch = self._get_teammate_index_by_unit_key(slot3, self)

	if i_watch == 1 then
		i_watch = #self._spectator_data.teammate_list
	else
		i_watch = i_watch - 1
	end

	watch_u_key = self._spectator_data.teammate_list[i_watch]
	self._spectator_data.watch_u_key = watch_u_key
	self._dis_curr = nil

	return 
end
IngameWaitingForRespawnState.currently_spectated_unit = function (self)
	if self._spectator_data and self._spectator_data.teammate_records and self._spectator_data.watch_u_key and self._spectator_data.teammate_records[self._spectator_data.watch_u_key] then
		return self._spectator_data.teammate_records[self._spectator_data.watch_u_key].unit
	end

	return 
end
IngameWaitingForRespawnState.trade_death = function (self, respawn_delay, hostages_killed)
	slot6 = false

	managers.hud.set_custody_can_be_trade_visible(slot4, managers.hud)

	slot5 = managers.trade
	slot8 = managers.criminals
	self._respawn_delay = managers.trade.respawn_delay_by_name(slot4, managers.criminals.local_character_name(slot7))
	self._hostages_killed = hostages_killed

	if 0 < self._respawn_delay then
		slot6 = true

		managers.hud.set_custody_trade_delay_visible(slot4, managers.hud)

		slot6 = self._hostages_killed

		managers.hud.set_custody_civilians_killed(slot4, managers.hud)

		slot6 = self._respawn_delay

		managers.hud.set_custody_trade_delay(slot4, managers.hud)

		slot6 = true

		managers.hud.set_custody_negotiating_visible(slot4, managers.hud)
	end

	slot5 = managers.groupai
	slot5 = managers.groupai.state(slot4)
	local is_ai_trade_possible = managers.groupai.state(slot4).is_ai_trade_possible(slot4)

	if not Global.game_settings.single_player or is_ai_trade_possible then
		slot6 = managers.groupai
		slot6 = managers.groupai.state(slot5)

		if managers.groupai.state(slot5).bain_state(slot5) then
			slot6 = managers.groupai
			slot6 = managers.groupai.state(slot5)

			if managers.groupai.state(slot5).get_assault_mode(slot5) and not is_ai_trade_possible then
			elseif is_ai_trade_possible then
			elseif hostages_killed == 0 then
			elseif hostages_killed < 3 then
			end
		end
	end

	return 
end
IngameWaitingForRespawnState.finish_trade = function (self)
	slot3 = self

	self._begin_game_enter_transition(slot2)

	return 
end
IngameWaitingForRespawnState.begin_trade = function (self)
	slot4 = true

	managers.hud.set_custody_can_be_trade_visible(slot2, managers.hud)

	local crims = {}
	slot6 = managers.groupai
	slot6 = managers.groupai.state(slot5)

	for k, d in pairs(managers.groupai.state(slot5).all_char_criminals(slot5)) do
		crims[k] = d
	end

	slot4 = managers.groupai
	slot4 = managers.groupai.state(slot3)

	if managers.groupai.state(slot3).bain_state(slot3) then
		slot4 = crims

		if next(slot3) then
			slot4 = crims

			if 1 < table.size(slot3) then
			else
				slot4 = crims
				local _, data = next(slot3)
				slot7 = data.unit
				slot4 = managers.criminals.character_static_data_by_unit(slot5, managers.criminals).ssuffix
			end
		end
	end

	slot4 = Application
	self._play_too_long_line_t = Application.time(slot3) + 60

	return 
end
IngameWaitingForRespawnState.cancel_trade = function (self)
	slot4 = false

	managers.hud.set_custody_can_be_trade_visible(slot2, managers.hud)

	return 
end

return 
