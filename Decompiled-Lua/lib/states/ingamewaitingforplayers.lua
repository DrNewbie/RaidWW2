-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreUnit"

core.import(slot1, core)

slot2 = "lib/states/GameState"

require(slot1)

if not IngameWaitingForPlayersState then
	slot2 = GameState
	slot0 = class(slot1)
end

IngameWaitingForPlayersState = slot0
function IngameWaitingForPlayersState:init(game_state_machine)
	slot6 = game_state_machine

	GameState.init(slot3, self, "ingame_waiting_for_players")

	slot5 = "intro_source"
	self._intro_source = SoundDevice.create_source(slot3, SoundDevice)
	slot6 = "_start"
	self._start_cb = callback(slot3, self, self)
	slot6 = "_skip"
	self._skip_cb = callback(slot3, self, self)
	self._controller = nil

	return 
end
function IngameWaitingForPlayersState:setup_controller()
	if not self._controller then
		slot7 = managers.controller
		slot6 = false
		self._controller = managers.controller.create_controller(slot2, managers.controller, "waiting_for_players", managers.controller.get_default_wrapper_index(slot6))
	end

	slot4 = true

	self._controller.set_enabled(slot2, self._controller)

	self._controller_list = {}
	slot4 = managers.controller

	for index = 1, managers.controller.get_wrapper_count(self._controller), 1 do
		slot10 = false
		local con = managers.controller.create_controller(slot6, managers.controller, "boot_" .. index, index)
		slot8 = con

		con.enable(managers.controller)

		self._controller_list[index] = con
	end

	return 
end
function IngameWaitingForPlayersState:set_controller_enabled(enabled)
	if self._controller then
	end

	return 
end
function IngameWaitingForPlayersState:_skip()
	slot3 = Network

	if not Network.is_server(slot2) then
		return 
	end

	if not self._audio_started then
		return 
	end

	if self._skipped then
		return 
	end

	slot3 = self

	self.sync_skip(slot2)

	slot3 = managers.network
	slot4 = "sync_waiting_for_player_skip"

	managers.network.session(slot2).send_to_peers_synched(slot2, managers.network.session(slot2))

	return 
end
function IngameWaitingForPlayersState:sync_skip()
	self._skipped = true
	slot4 = true

	managers.briefing.stop_event(slot2, managers.briefing)

	slot3 = self

	self._start_delay(slot2)

	return 
end
function IngameWaitingForPlayersState:_start()
	slot3 = Network

	if not Network.is_server(slot2) then
		return 
	end

	slot3 = managers.groupai
	slot3 = managers.groupai.state(slot2)
	local variant = managers.groupai.state(slot2).blackscreen_variant(slot2) or 0
	slot5 = variant

	self.sync_start(slot3, self)

	slot4 = managers.network
	slot7 = Global.music_manager.current_track

	managers.network.session(slot3).send_to_peers_synched(slot3, managers.network.session(slot3), "sync_waiting_for_player_start", variant)

	return 
end
function IngameWaitingForPlayersState:sync_start(variant, soundtrack)
	self._briefing_start_t = nil
	slot5 = managers.briefing

	managers.briefing.stop_event(slot4)

	self._blackscreen_started = true

	if self._intro_event then
		slot5 = Application
		self._delay_audio_t = Application.time(slot4) + 1
	else
		slot5 = self

		self._start_delay(slot4)
	end

	return 
end
function IngameWaitingForPlayersState:blackscreen_started()
	return self._blackscreen_started or false
end
function IngameWaitingForPlayersState:_start_audio()
	self._intro_cue_index = 1
	self._audio_started = true
	slot5 = {
		show_subtitle = true,
		listener = {
			end_of_event = true,
			clbk = callback(slot8, self, self)
		}
	}
	slot11 = "_audio_done"
	local event_started = managers.briefing.post_event(slot2, managers.briefing, self._intro_event)

	if not event_started then
		slot4 = "failed to start audio, or played safehouse before"

		print(slot3)

		slot4 = Network

		if Network.is_server(slot3) then
			slot4 = self

			self._start_delay(slot3)
		end
	end

	return 
end
function IngameWaitingForPlayersState:_start_delay()
	if self._delay_start_t then
		return 
	end

	slot3 = Application
	self._delay_start_t = Application.time(slot2) + 1

	return 
end
function IngameWaitingForPlayersState:_audio_done(event_type, label, cookie)
	slot6 = self

	self._create_blackscreen_loading_icon(slot5)

	slot6 = Network

	if Network.is_server(slot5) then
		slot6 = self

		self._start_delay(slot5)
	end

	return 
end
function IngameWaitingForPlayersState:_briefing_callback(event_type, label, cookie)
	slot12 = cookie

	print(slot5, "[IngameWaitingForPlayersState]", "event_type", event_type, "label", label, "cookie")

	return 
end
function IngameWaitingForPlayersState:update(t, dt)

	-- Decompilation error in this vicinity:
	slot5 = managers.network

	if not managers.network.session(slot4) then
		return 
	end

	slot5 = self

	if self._briefing_start_t and self._briefing_start_t < t then
		self._briefing_start_t = nil
	end

	if self._delay_audio_t and self._delay_audio_t < t then
		self._delay_audio_t = nil
		slot5 = self

		self._start_audio(slot4)
	end

	if self._delay_start_t then
	end

	if self._delay_spawn_t and self._delay_spawn_t < t then
		self._delay_spawn_t = nil
		slot5 = managers.network
		slot5 = managers.network.session(slot4)

		managers.network.session(slot4).spawn_players(slot4)
	end

	slot5 = self

	self._chk_show_skip_prompt(slot4)

	if self._skip_promt_shown then
		slot5 = Network

		if Network.is_server(slot4) and Global.exe_argument_auto_enter_level then
			slot5 = self

			self._skip(slot4)
		elseif self._audio_started and not self._skipped then
			if self._controller then
				slot6 = "confirm"
				local btn_skip_press = self._controller.get_input_bool(slot4, self._controller)

				if btn_skip_press and not self._skip_data then
					self._skip_data = {
						total = 1,
						current = 0
					}
				elseif not btn_skip_press and self._skip_data then
					self._skip_data = nil
				end
			end

			if self._skip_data then
				self._skip_data.current = self._skip_data.current + dt

				if self._skip_data.total < self._skip_data.current then
					slot5 = self

					self._skip(slot4)
				end
			end
		end
	elseif self._skip_data then
		self._skip_data = nil
	end

	return 
end
function IngameWaitingForPlayersState:intro_video_playing()
	slot3 = self._intro_video

	return alive(slot2)
end
function IngameWaitingForPlayersState:intro_video_done()
	slot3 = self._intro_video

	return 1 <= self._intro_video.loop_count(slot2)
end
function IngameWaitingForPlayersState:is_skipped()
	slot3 = self._controller_list

	for _, controller in ipairs(slot2) do
		slot8 = controller

		if controller.get_any_input_pressed(slot7) then
			return true
		end
	end

	return false
end
function IngameWaitingForPlayersState:at_enter()
	self._started_from_beginning = true
	slot3 = "[IngameWaitingForPlayersState:at_enter()]"

	print(slot2)

	Global.statistics_manager.playing_from_start = true
	self.intro_video_shown = false
	slot3 = Overlay
	slot3 = Overlay.gui(true)
	self._full_workspace = Overlay.gui(true).create_screen_workspace(true)
	slot4 = self._full_workspace

	managers.gui_data.layout_fullscreen_workspace(true, managers.gui_data)

	slot3 = self._full_workspace
	self._full_panel = self._full_workspace.panel(true)
	slot3 = Overlay
	slot3 = Overlay.gui(true)
	self._safe_rect_workspace = Overlay.gui(true).create_screen_workspace(true)
	slot4 = self._safe_rect_workspace

	managers.gui_data.layout_workspace(true, managers.gui_data)

	slot3 = self._safe_rect_workspace
	self._safe_panel = self._safe_rect_workspace.panel(true)
	slot3 = self

	self.setup_controller(true)

	slot4 = "lobby_menu"
	self._sound_listener = SoundDevice.create_listener(true, SoundDevice)
	slot3 = self._sound_listener
	slot8 = 0

	self._sound_listener.set_position(true, Vector3(slot5, 0, -50000))

	slot4 = true

	self._sound_listener.activate(true, self._sound_listener)

	slot3 = managers.menu

	managers.menu.close_menu(true)

	slot3 = managers.network
	slot3 = managers.network.session(true)
	slot4 = true

	managers.network.session(true).local_peer(true).set_waiting_for_player_ready(true, managers.network.session(true).local_peer(true))

	slot3 = managers.network
	slot3 = managers.network.session(true)

	managers.network.session(true).chk_send_local_player_ready(true)

	slot3 = managers.network
	slot6 = managers.network
	slot6 = managers.network.session(slot5)
	slot6 = managers.network.session(slot5).local_peer(slot5)
	slot7 = false

	managers.network.session(true).on_set_member_ready(true, managers.network.session(true), managers.network.session(slot5).local_peer(slot5).id(slot5), true, true)

	Global.exe_argument_level = false
	self._camera_data = {
		index = 0
	}
	slot3 = Application
	self._briefing_start_t = Application.time(0) + 2
	slot3 = managers.network
	slot3 = managers.network.session(0)

	if managers.network.session(0).is_client(0) then
		slot3 = managers.network
		slot3 = managers.network.session(slot2)

		if managers.network.session(slot2).server_peer(slot2) then
			slot3 = managers.network
			local local_peer = managers.network.session(slot2).local_peer(slot2)
			slot4 = local_peer
			slot7 = managers.network
			slot7 = managers.network.session(slot6)

			local_peer.sync_lobby_data(managers.network.session(slot2), managers.network.session(slot6).server_peer(slot6))

			slot4 = local_peer
			slot7 = managers.network
			slot7 = managers.network.session(slot6)

			local_peer.sync_data(managers.network.session(slot2), managers.network.session(slot6).server_peer(slot6))
		end
	end

	slot3 = managers.dyn_resource

	if managers.dyn_resource.is_file_streamer_idle(slot2) then
		slot3 = managers.network
		slot7 = managers.network
		slot7 = managers.network.session(slot6)
		slot7 = managers.network.session(slot6).local_peer(slot6)
		slot8 = ""

		managers.network.session(slot2).send_to_peers_loaded(slot2, managers.network.session(slot2), "set_member_ready", managers.network.session(slot6).local_peer(slot6).id(slot6), 100, 2)
	else
		self._last_sent_streaming_status = 0
		self._file_streamer_max_workload = 0
		slot3 = managers.network
		slot7 = managers.network
		slot7 = managers.network.session(slot6)
		slot7 = managers.network.session(slot6).local_peer(slot6)
		slot8 = ""

		managers.network.session(slot2).send_to_peers_loaded(slot2, managers.network.session(slot2), "set_member_ready", managers.network.session(slot6).local_peer(slot6).id(slot6), 0, 2)

		slot5 = {
			DynamicResourceManager.listener_events.file_streamer_workload
		}
		slot10 = "clbk_file_streamer_status"

		managers.dyn_resource.add_listener(slot2, managers.dyn_resource, self, callback(2, self, self))
	end

	if Global.game_settings.single_player then
		local rich_presence = "SPPlaying"
		slot5 = rich_presence

		managers.platform.set_rich_presence(slot3, managers.platform)
	end

	if Global.exe_argument_auto_enter_level then
		slot3 = game_state_machine
		slot3 = game_state_machine.current_state(slot2)

		game_state_machine.current_state(slot2).start_game_intro(slot2)
	end

	return 
end
function IngameWaitingForPlayersState:show_intro_video()
	local params_root_panel = {
		is_root_panel = true
	}
	slot4 = self._full_panel
	params_root_panel.x = self._full_panel.x(slot3)
	slot4 = self._full_panel
	params_root_panel.y = self._full_panel.y(slot3)
	slot4 = self._full_panel
	params_root_panel.h = self._full_panel.h(slot3)
	slot4 = self._full_panel
	params_root_panel.w = self._full_panel.w(slot3)
	params_root_panel.layer = tweak_data.gui.DEBRIEF_VIDEO_LAYER
	params_root_panel.background_color = Color.black
	slot6 = params_root_panel
	self._panel = RaidGUIPanel.new(slot3, RaidGUIPanel, self._full_panel)
	local video = "movies/vanilla/intro/global/01_intro_v014"
	local intro_video_params = {}
	slot6 = self._panel
	intro_video_params.layer = self._panel.layer(self._full_panel) + 1
	intro_video_params.video = video
	slot6 = self._panel
	intro_video_params.width = self._panel.w(self._full_panel)
	slot7 = intro_video_params
	self._intro_video = self._panel.video(self._full_panel, self._panel)
	slot11 = self._intro_video
	slot7 = self._panel.w(slot8) * self._intro_video.video_height(self._panel) / self._intro_video.video_width(self._intro_video)

	self._intro_video.set_h(self._full_panel, self._intro_video)

	slot9 = self._panel
	slot7 = self._panel.h(self._intro_video.video_height(self._panel) / self._intro_video.video_width(self._intro_video)) / 2

	self._intro_video.set_center_y(self._full_panel, self._intro_video)

	slot6 = managers.controller
	local press_any_key_text = (managers.controller.is_using_controller(self._full_panel) and "press_any_key_to_skip_controller") or "press_any_key_to_skip"
	local press_any_key_params = {
		name = "press_any_key_prompt",
		alpha = 0
	}
	slot10 = tweak_data.gui.font_sizes.size_32
	press_any_key_params.font = tweak_data.gui.get_font_path(slot7, tweak_data.gui, tweak_data.gui.fonts.din_compressed)
	press_any_key_params.font_size = tweak_data.gui.font_sizes.size_32
	slot11 = press_any_key_text
	press_any_key_params.text = utf8.to_upper(managers.localization.text(tweak_data.gui.fonts.din_compressed, managers.localization))
	press_any_key_params.color = tweak_data.gui.colors.raid_dirty_white
	slot8 = self._intro_video
	press_any_key_params.layer = self._intro_video.layer(slot7) + 1
	slot9 = press_any_key_params
	local press_any_key_prompt = self._safe_panel.text(slot7, self._safe_panel)
	slot9 = press_any_key_prompt
	local _, _, w, h = press_any_key_prompt.text_rect(self._safe_panel)
	slot14 = w

	press_any_key_prompt.set_w(slot12, press_any_key_prompt)

	slot14 = h

	press_any_key_prompt.set_h(slot12, press_any_key_prompt)

	slot16 = self._safe_panel
	slot14 = self._safe_panel.w(slot15) - 50

	press_any_key_prompt.set_right(slot12, press_any_key_prompt)

	slot16 = self._safe_panel
	slot14 = self._safe_panel.h(slot15) - 50

	press_any_key_prompt.set_bottom(slot12, press_any_key_prompt)

	slot13 = press_any_key_prompt
	slot18 = "_animate_show_press_any_key_prompt"

	press_any_key_prompt.animate(slot12, callback(slot15, self, self))

	return 
end
function IngameWaitingForPlayersState:_animate_show_press_any_key_prompt(prompt)
	local duration = 0.7
	local t = 0
	slot6 = 6

	wait(slot5)

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot10 = duration
		local current_alpha = Easing.quartic_in_out(slot6, t, 0, 0.75)
		slot9 = current_alpha

		prompt.set_alpha(t, prompt)
	end

	slot7 = 0.75

	prompt.set_alpha(slot5, prompt)

	return 
end
function IngameWaitingForPlayersState:clbk_file_streamer_status(workload)
	slot4 = managers.network

	if not managers.network.session(slot3) then
		self._file_streamer_max_workload = nil
		slot5 = self

		managers.dyn_resource.remove_listener(slot3, managers.dyn_resource)

		return 
	end

	slot5 = workload
	self._file_streamer_max_workload = math.max(slot3, self._file_streamer_max_workload)
	local progress = (0 < self._file_streamer_max_workload and 1 - workload / self._file_streamer_max_workload) or 1
	slot5 = progress * 100
	progress = math.ceil(slot4)
	slot5 = managers.network
	local local_peer = managers.network.session(slot4).local_peer(slot4)
	slot7 = progress

	local_peer.set_streaming_status(managers.network.session(slot4), local_peer)

	slot6 = managers.network
	slot8 = progress

	managers.network.session(managers.network.session(slot4)).on_streaming_progress_received(managers.network.session(slot4), managers.network.session(managers.network.session(slot4)), local_peer)

	if self._last_sent_streaming_status ~= progress then
		slot6 = managers.network
		slot10 = managers.network
		slot10 = managers.network.session(slot9)
		slot10 = managers.network.session(slot9).local_peer(slot9)
		slot11 = ""

		managers.network.session(slot5).send_to_peers_loaded(slot5, managers.network.session(slot5), "set_member_ready", managers.network.session(slot9).local_peer(slot9).id(slot9), progress, 2)

		self._last_sent_streaming_status = progress
	end

	if workload == 0 then
		self._file_streamer_max_workload = nil
		slot7 = self

		managers.dyn_resource.remove_listener(slot5, managers.dyn_resource)
	end

	return 
end
function IngameWaitingForPlayersState:_chk_show_skip_prompt()
	if not self._skip_promt_shown and not self._file_streamer_max_workload then
		slot3 = managers.menu

		if not managers.menu.active_menu(slot2) then
			slot3 = managers.network

			if managers.network.session(slot2) then
				slot3 = managers.network
				slot3 = managers.network.session(slot2)

				if managers.network.session(slot2).are_peers_done_streaming(slot2) then
					self._skip_promt_shown = true
				end
			end
		end
	end

	return 
end
function IngameWaitingForPlayersState:start_game_intro()
	if self._starting_game_intro then
		return 
	end

	self._starting_game_intro = true
	slot3 = self

	self._start(slot2)

	return 
end
function IngameWaitingForPlayersState:set_dropin(char_name)
	self._started_from_beginning = false
	Global.statistics_manager.playing_from_start = nil
	slot4 = "Joining as " .. char_name

	print(nil)

	return 
end
function IngameWaitingForPlayersState:check_is_dropin()
	return not self._started_from_beginning
end
function IngameWaitingForPlayersState:at_exit()
	slot4 = "[IngameWaitingForPlayersState:at_exit()]"

	Application.debug(slot2, Application)

	if self._file_streamer_max_workload then
		self._file_streamer_max_workload = nil
		slot4 = self

		managers.dyn_resource.remove_listener(slot2, managers.dyn_resource)
	end

	slot4 = true

	managers.briefing.stop_event(slot2, managers.briefing)

	slot4 = "kit_menu"

	managers.menu.close_menu(slot2, managers.menu)

	if self._sound_listener then
		slot3 = self._sound_listener

		self._sound_listener.delete(slot2)

		self._sound_listener = nil
	end

	local rich_presence = nil

	if Global.game_settings.single_player then
		rich_presence = "SPPlaying"
	else
		rich_presence = "MPPlaying"
	end

	slot5 = "Playing"

	managers.platform.set_presence(slot3, managers.platform)

	slot5 = rich_presence

	managers.platform.set_rich_presence(slot3, managers.platform)

	slot5 = true

	managers.platform.set_playing(slot3, managers.platform)

	slot4 = managers.game_play_central

	managers.game_play_central.start_heist_timer(slot3)

	slot4 = Network

	if not Network.is_server(slot3) then
		slot4 = managers.network

		if managers.network.session(slot3) then
			slot4 = managers.network
			slot4 = managers.network.session(slot3)

			if managers.network.session(slot3).server_peer(slot3) then
				slot4 = managers.network
				slot4 = managers.network.session(slot3)
				slot4 = managers.network.session(slot3).server_peer(slot3)
				slot7 = managers.raid_job

				managers.network.session(slot3).server_peer(slot3).verify_job(slot3, managers.raid_job.current_job_id(slot6))

				slot4 = managers.network
				slot4 = managers.network.session(slot3)
				slot4 = managers.network.session(slot3).server_peer(slot3)

				managers.network.session(slot3).server_peer(slot3).verify_character(slot3)
			end
		end
	end

	if self._fadeout_loading_icon then
		slot5 = "[IngameWaitingForPlayersState:at_exit()] self._fadeout_loading_icon"

		Application.debug(slot3, Application)

		slot5 = tweak_data.overlay_effects.level_fade_in.fade_out

		self._fadeout_loading_icon.fade_out(slot3, self._fadeout_loading_icon)

		self._fadeout_loading_icon = nil
	end

	slot4 = Overlay
	slot5 = self._full_workspace

	Overlay.gui(slot3).destroy_workspace(slot3, Overlay.gui(slot3))

	slot4 = Overlay
	slot5 = self._safe_rect_workspace

	Overlay.gui(slot3).destroy_workspace(slot3, Overlay.gui(slot3))

	return 
end
function IngameWaitingForPlayersState:is_joinable()
	return false
end

return 
