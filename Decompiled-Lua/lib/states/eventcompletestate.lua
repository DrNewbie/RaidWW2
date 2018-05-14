-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot2 = "lib/states/GameState"

require(slot1)

if not EventCompleteState then
	slot2 = GameState
	slot0 = class(slot1)
end

EventCompleteState = slot0
EventCompleteState.SCREEN_ACTIVE_DEBRIEF_VIDEO = 1
EventCompleteState.SCREEN_ACTIVE_SPECIAL_HONORS = 2
EventCompleteState.SCREEN_ACTIVE_STEAM_LOOT = 3
EventCompleteState.SCREEN_ACTIVE_GREED_LOOT = 4
EventCompleteState.SCREEN_ACTIVE_LOOT = 5
EventCompleteState.SCREEN_ACTIVE_EXPERIENCE = 6
EventCompleteState.LOOT_DATA_READY_KEY = "loot_data_ready"
EventCompleteState.SUCCESS_VIDEOS = {
	{
		chance = 1,
		path = "movies/vanilla/debrief_success/global/s_01_throws_himself_v007"
	},
	{
		chance = 1,
		path = "movies/vanilla/debrief_success/global/s_02_chickens_out_v007"
	},
	{
		chance = 1,
		path = "movies/vanilla/debrief_success/global/s_03_salutes_v006"
	},
	{
		chance = 1,
		path = "movies/vanilla/debrief_success/global/s_04_shoots_and_miss_v008"
	},
	{
		chance = 1,
		path = "movies/vanilla/debrief_success/global/s_05_crunches_bones_v006"
	},
	{
		chance = 1,
		path = "movies/vanilla/debrief_success/global/s_06_plays_with_tin_men_v006"
	},
	{
		chance = 1,
		path = "movies/vanilla/debrief_success/global/s_07_cries_tannenbaum_v007"
	},
	{
		chance = 1,
		path = "movies/vanilla/debrief_success/global/s_08_chess_v008"
	},
	{
		chance = 1,
		path = "movies/vanilla/debrief_success/global/s_09_is_having_a_reverie_v007"
	},
	{
		chance = 1,
		path = "movies/vanilla/debrief_success/global/s_10_colours_a_map_v009"
	},
	{
		chance = 1,
		path = "movies/vanilla/debrief_success/global/s_11_swears_v005"
	},
	{
		chance = 1,
		path = "movies/vanilla/debrief_success/global/s_12_plays_with_tanks_v005"
	},
	{
		chance = 1,
		path = "movies/vanilla/debrief_success/global/s_13_flips_a_table_v007"
	},
	{
		chance = 1,
		path = "movies/vanilla/debrief_success/global/s_14_moustache_v006"
	}
}
EventCompleteState.FAILURE_VIDEOS = {
	{
		chance = 1,
		path = "movies/vanilla/debrief_failure/global/f_01_edelweiss_v007"
	},
	{
		chance = 1,
		path = "movies/vanilla/debrief_failure/global/f_02_sizzles_v007"
	},
	{
		chance = 1,
		path = "movies/vanilla/debrief_failure/global/f_03_toasts_v008"
	},
	{
		chance = 1,
		path = "movies/vanilla/debrief_failure/global/f_04_misunderstands_v008"
	},
	{
		chance = 1,
		path = "movies/vanilla/debrief_failure/global/f_05_hugs_the_world_v008"
	},
	{
		chance = 1,
		path = "movies/vanilla/debrief_failure/global/f_06_tin_soldiers_v008"
	},
	{
		chance = 1,
		path = "movies/vanilla/debrief_failure/global/f_07_told_you_so_v008"
	},
	{
		chance = 1,
		path = "movies/vanilla/debrief_failure/global/f_08_pumps_his_fists_v008"
	},
	{
		chance = 1,
		path = "movies/vanilla/debrief_failure/global/f_09_bras_dhonneur_v008"
	},
	{
		chance = 1,
		path = "movies/vanilla/debrief_failure/global/f_10_executes_v008"
	},
	{
		chance = 1,
		path = "movies/vanilla/debrief_failure/global/f_11_sings_v007"
	}
}
function EventCompleteState:init(game_state_machine, setup)
	slot7 = game_state_machine

	GameState.init(slot4, self, "event_complete_screen")

	self._type = ""
	slot7 = "_continue"
	self._continue_cb = callback(slot4, self, self)
	self._controller = nil
	self._continue_block_timer = 0
	self._awarded_rewards = {
		loot = false,
		xp = false,
		greed_gold = false
	}

	return 
end
function EventCompleteState:setup_controller()
	if not self._controller then
		slot7 = managers.controller
		self._controller = managers.controller.create_controller(slot2, managers.controller, "victoryscreen", managers.controller.get_default_wrapper_index(slot6))
		slot4 = true

		self._controller.set_enabled(slot2, self._controller)

		slot4 = "event_complete_state"
		slot9 = "on_controller_hotswap"

		managers.controller.add_hotswap_callback(slot2, managers.controller, callback(false, self, self))
	end

	return 
end
function EventCompleteState:set_controller_enabled(enabled)
	return 
end
function EventCompleteState:at_enter(old_state, params)
	slot6 = "[EventCompleteState:at_enter()]"

	Application.trace(slot4, Application)

	slot5 = managers.player

	managers.player.replenish_player(slot4)

	slot5 = managers.player
	local player = managers.player.player_unit(slot4)

	if player then
		slot6 = player
		slot6 = player.movement(slot5)
		slot6 = player.movement(slot5).current_state(slot5)

		player.movement(slot5).current_state(slot5).interupt_all_actions(slot5)

		slot6 = player
		slot6 = player.sound(slot5)

		player.sound(slot5).stop(slot5)

		slot6 = player
		slot6 = player.character_damage(slot5)

		player.character_damage(slot5).stop_heartbeat(slot5)

		slot6 = player
		slot9 = 0

		player.camera(slot5).set_shaker_parameter(slot5, player.camera(slot5), "headbob", "amplitude")

		slot6 = player
		slot7 = false

		player.base(slot5).set_stats_screen_visible(slot5, player.base(slot5))

		slot6 = player
		slot7 = PlayerStandard.IDS_UNEQUIP

		player.camera(slot5).play_redirect(slot5, player.camera(slot5))

		slot6 = player
		slot7 = true

		player.base(slot5).set_enabled(slot5, player.base(slot5))

		slot6 = player
		slot7 = false

		player.base(slot5).set_visible(slot5, player.base(slot5))
	end

	self._controller_list = {}
	slot7 = managers.controller

	for index = 1, managers.controller.get_wrapper_count(slot6), 1 do
		slot13 = false
		local con = managers.controller.create_controller(slot9, managers.controller, "boot_" .. index, index)
		slot11 = con

		con.enable(managers.controller)

		self._controller_list[index] = con
	end

	self.loot_data = {}
	slot6 = managers.raid_job
	self.is_at_last_event = managers.raid_job.is_at_last_event(slot5)
	slot6 = managers.raid_job
	self._success = managers.raid_job.stage_success(slot5)
	slot6 = managers.experience
	self.initial_xp = managers.experience.total(slot5)
	self.peers_loot_drops = {}
	slot7 = self._success

	managers.consumable_missions.on_mission_completed(slot5, managers.consumable_missions)

	slot8 = {
		CoreSystemEventListenerManager.SystemEventListenerManager.TOP_STATS_READY
	}
	slot13 = "on_top_stats_ready"

	managers.system_event_listener.add_listener(slot5, managers.system_event_listener, "event_complete_state_top_stats_ready", callback(slot10, self, self))

	slot6 = managers.raid_job
	self._job_type = managers.raid_job.current_job_type(slot5)
	slot8 = managers.raid_job
	self._current_job_data = clone(managers.raid_job.current_job("event_complete_state_top_stats_ready"))
	slot6 = managers.challenge_cards
	self._active_challenge_card = managers.challenge_cards.get_active_card(slot5)

	if self._active_challenge_card ~= nil and self._active_challenge_card.key_name ~= nil and self._active_challenge_card.key_name ~= "empty" and self._active_challenge_card.loot_drop_group then
		managers.challenge_cards.forced_loot_card = self._active_challenge_card
	else
		managers.challenge_cards.forced_loot_card = nil
	end

	slot6 = self

	self._calculate_card_xp_bonuses(slot5)

	slot6 = self

	self.check_complete_achievements(slot5)

	slot6 = self

	self.set_statistics_values(slot5)

	slot7 = {
		quit = false,
		type = "victory",
		success = self._success
	}

	managers.statistics.stop_session(slot5, managers.statistics)

	slot6 = managers.statistics

	managers.statistics.send_statistics(slot5)

	slot6 = self

	self.get_personal_stats(slot5)

	if self._success then
		slot6 = managers.gold_economy

		managers.gold_economy.decrease_respec_reset(slot5)
	end

	if self.is_at_last_event then
		slot6 = self

		if self.is_success(slot5) then
			slot8 = {
				LootDropManager.EVENT_PEER_LOOT_RECEIVED
			}
			slot13 = "on_loot_dropped_for_peer"

			managers.lootdrop.add_listener(slot5, managers.lootdrop, LootScreenGui.EVENT_KEY_PEER_LOOT_RECEIVED, callback(slot10, self, self))

			slot6 = self

			self.on_loot_data_ready(slot5)

			slot6 = managers.raid_job

			if managers.raid_job.current_job(slot5) then
				slot6 = managers.raid_job

				if not managers.raid_job.current_job(slot5).consumable then
					slot6 = self

					self._calculate_extra_loot_secured(slot5)
				end
			end
		end
	end

	slot6 = Network

	if Network.is_server(slot5) then
		slot6 = managers.network
		slot7 = "game_end"

		managers.network.session(slot5).set_state(slot5, managers.network.session(slot5))
	else
		slot6 = managers.raid_job

		managers.raid_job.on_mission_ended(slot5)
	end

	slot7 = false

	managers.platform.set_playing(slot5, managers.platform)

	slot7 = "point_of_no_return"

	managers.hud.remove_updator(slot5, managers.hud)

	slot6 = managers.hud

	managers.hud.hide_stats_screen(slot5)

	slot6 = Application
	self._continue_block_timer = Application.time(slot5) + 1.5
	slot6 = managers.dialog

	managers.dialog.quit_dialog(slot5)

	slot6 = self

	self.setup_controller(slot5)

	self._old_state = old_state

	if self.is_at_last_event then
		local is_operation = self._current_job_data.job_type == OperationsTweakData.JOB_TYPE_OPERATION
	end

	slot7 = "menu_volume_set"

	managers.menu_component.post_event(slot5, managers.menu_component)

	slot6 = managers.music

	managers.music.stop(slot5)

	slot7 = true

	managers.dialog.set_paused(slot5, managers.dialog)

	local gui = Overlay.gui(slot5)
	slot7 = gui
	self._full_workspace = gui.create_screen_workspace(Overlay)
	slot7 = gui
	self._safe_rect_workspace = gui.create_screen_workspace(Overlay)
	slot7 = self._safe_rect_workspace
	self._safe_panel = self._safe_rect_workspace.panel(Overlay)
	self._active_screen = EventCompleteState.SCREEN_ACTIVE_DEBRIEF_VIDEO

	if self.is_at_last_event or not self._success then
		slot7 = self

		self._play_debrief_video(slot6)
	else
		slot7 = self

		self._continue(slot6)
	end

	self._difficulty = Global.game_settings.difficulty

	return 
end
function EventCompleteState:_calculate_card_xp_bonuses()
	local card_bonus_xp = 0

	if self._active_challenge_card and self._active_challenge_card.status == ChallengeCardsManager.CARD_STATUS_SUCCESS then
		local card = tweak_data.challenge_cards.cards[self._active_challenge_card[ChallengeCardsTweakData.KEY_NAME_FIELD]]
		card_bonus_xp = card.bonus_xp or 0
	end

	local card_xp_multiplier = 1

	if self._active_challenge_card and self._active_challenge_card.status == ChallengeCardsManager.CARD_STATUS_SUCCESS then
		card_xp_multiplier = self._active_challenge_card.bonus_xp_multiplier or 1
	end

	self._card_bonus_xp = card_bonus_xp
	self._card_xp_multiplier = card_xp_multiplier

	return 
end
function EventCompleteState:card_bonus_xp()
	return self._card_bonus_xp
end
function EventCompleteState:card_xp_multiplier()
	return self._card_xp_multiplier
end
function EventCompleteState:_calculate_extra_loot_secured()
	local extra_loot_value = 0
	local extra_loot_count = 0
	slot5 = managers.loot
	local loot_secured = managers.loot.get_secured(slot4)

	while loot_secured do
		local loot_tweak_data = tweak_data.carry[loot_secured.carry_id]

		if loot_tweak_data and loot_tweak_data.loot_value then
			extra_loot_value = extra_loot_value + loot_tweak_data.loot_value
			extra_loot_count = extra_loot_count + 1
		end

		slot7 = managers.loot
		loot_secured = managers.loot.get_secured(slot6)
	end

	if 0 < extra_loot_value then
		local extra_loot_loot_data = {
			title = "menu_loot_screen_bonus_loot",
			total_value = 0,
			icon = "rewards_extra_loot",
			acquired = extra_loot_count,
			acquired_value = extra_loot_value
		}
		self.loot_data[LootScreenGui.LOOT_ITEM_EXTRA_LOOT] = extra_loot_loot_data
	end

	return 
end
function EventCompleteState:on_loot_data_ready()
	slot3 = managers.raid_job
	self.loot_acquired = managers.raid_job.loot_acquired_in_job(slot2)
	slot3 = managers.raid_job
	self.loot_spawned = managers.raid_job.loot_spawned_in_job(slot2)

	if self.loot_spawned == 0 then
		slot5 = {
			EventCompleteState.LOOT_DATA_READY_KEY
		}
		slot10 = "on_loot_data_ready"

		managers.system_event_listener.add_listener(slot2, managers.system_event_listener, "event_complete_state_loot_data_ready", callback(slot7, self, self))

		return 
	end

	slot3 = managers.lootdrop
	self.peers_loot_drops = managers.lootdrop.get_loot_for_peers(slot2)
	local dog_tag_loot_data = {
		title = "menu_loot_screen_dog_tags",
		icon = "rewards_dog_tags",
		acquired = self.loot_acquired,
		total = self.loot_spawned,
		acquired_value = self.loot_acquired * tweak_data.lootdrop.dog_tag.loot_value,
		total_value = self.loot_spawned * tweak_data.lootdrop.dog_tag.loot_value
	}
	self.loot_data[LootScreenGui.LOOT_ITEM_DOG_TAGS] = dog_tag_loot_data

	if self.loot_spawned == self.loot_acquired and self._success then
		slot5 = self._current_job_data

		managers.achievment.check_achievement_group_bring_them_home(slot3, managers.achievment)
	end

	return 
end
function EventCompleteState:drop_loot_for_player()
	Application.trace(slot2, Application)

	local acquired_loot_value = 0
	local total_loot_value = 0
	slot5 = self.loot_data

	for id, loot_item in pairs("[EventCompleteState:drop_loot_for_player()]") do
		acquired_loot_value = acquired_loot_value + loot_item.acquired_value
		total_loot_value = total_loot_value + loot_item.total_value
	end

	local loot_percentage = 0

	if total_loot_value ~= 0 then
		loot_percentage = acquired_loot_value / total_loot_value
	end

	slot8 = 1
	local loot_percentage = math.clamp(slot5, loot_percentage, 0)
	local forced_loot_group = nil

	if self._active_challenge_card ~= nil and self._active_challenge_card.key_name ~= nil and self._active_challenge_card.key_name ~= "empty" then
		forced_loot_group = self._active_challenge_card.loot_drop_group
	end

	slot11 = forced_loot_group

	managers.lootdrop.give_loot_to_player(slot7, managers.lootdrop, loot_percentage, false)

	self._awarded_rewards.loot = true

	return 
end
function EventCompleteState:on_loot_dropped_for_player()
	slot4 = "[EventCompleteState:on_loot_dropped_for_player()]"

	Application.trace(slot2, Application)

	slot3 = managers.lootdrop
	self.local_player_loot_drop = managers.lootdrop.get_dropped_loot(slot2)

	return 
end
function EventCompleteState:on_loot_dropped_for_peer()
	slot4 = "[EventCompleteState:on_loot_dropped_for_peer()]"

	Application.trace(slot2, Application)

	slot3 = managers.lootdrop
	self.peers_loot_drops = managers.lootdrop.get_loot_for_peers(slot2)

	if self._active_screen == EventCompleteState.SCREEN_ACTIVE_LOOT and managers.menu_component._raid_menu_loot_gui and managers.menu_component._raid_menu_loot_gui.peer_loot_shown then
		slot3 = managers.menu_component._raid_menu_loot_gui

		managers.menu_component._raid_menu_loot_gui.refresh_peers_loot_display(slot2)
	end

	return 
end
function EventCompleteState:_get_debrief_video(success)
	local video_list = nil

	if success then
		video_list = EventCompleteState.SUCCESS_VIDEOS
	else
		video_list = EventCompleteState.FAILURE_VIDEOS
	end

	local total = 0
	slot6 = video_list

	for _, video in ipairs(slot5) do
		total = total + video.chance
	end

	local chosen_video = nil
	local value = math.rand(slot6)
	slot8 = video_list

	for _, video in ipairs(total) do
		value = value - video.chance

		if value <= 0 then
			chosen_video = video.path

			break
		end
	end

	return chosen_video
end
function EventCompleteState:_play_debrief_video()
	Application.trace(slot2, Application)

	slot3 = self._full_workspace
	local full_panel = self._full_workspace.panel(slot2)
	local params_root_panel = {
		name = "event_complete_video_root_panel",
		is_root_panel = true
	}
	slot5 = full_panel
	params_root_panel.x = full_panel.x("[EventCompleteState:_play_debrief_video()]")
	slot5 = full_panel
	params_root_panel.y = full_panel.y("[EventCompleteState:_play_debrief_video()]")
	slot5 = full_panel
	params_root_panel.h = full_panel.h("[EventCompleteState:_play_debrief_video()]")
	slot5 = full_panel
	params_root_panel.w = full_panel.w("[EventCompleteState:_play_debrief_video()]")
	params_root_panel.layer = tweak_data.gui.DEBRIEF_VIDEO_LAYER
	params_root_panel.background_color = Color.black
	self._panel = RaidGUIPanel.new("[EventCompleteState:_play_debrief_video()]", RaidGUIPanel, full_panel)
	slot5 = self
	slot8 = self
	local video = self._get_debrief_video("[EventCompleteState:_play_debrief_video()]", self.is_success(params_root_panel))
	local debrief_video_params = {
		name = "event_complete_debrief_video"
	}
	slot7 = self._panel
	debrief_video_params.layer = self._panel.layer(self.is_success) + 1
	debrief_video_params.video = video
	slot7 = self._panel
	debrief_video_params.width = self._panel.w(self.is_success)
	slot8 = debrief_video_params
	self._debrief_video = self._panel.video(self.is_success, self._panel)
	slot12 = self._debrief_video
	slot8 = self._panel.w(slot9) * self._debrief_video.video_height(self._panel) / self._debrief_video.video_width(self._debrief_video)

	self._debrief_video.set_h(self.is_success, self._debrief_video)

	slot10 = self._panel
	slot8 = self._panel.h(self._debrief_video.video_height(self._panel) / self._debrief_video.video_width(self._debrief_video)) / 2

	self._debrief_video.set_center_y(self.is_success, self._debrief_video)

	local disclaimer_label_params = {
		w = 600,
		name = "event_complete_disclaimer",
		h = 600,
		wrap = true,
		visible = false,
		text = "HITLER VIDEOS HERE WHEN THEY'RE DONE",
		y = 400,
		x = 200
	}
	slot10 = tweak_data.gui.font_sizes.size_76
	disclaimer_label_params.font = tweak_data.gui.get_font_path(self._debrief_video, tweak_data.gui, tweak_data.gui.fonts.din_compressed)
	disclaimer_label_params.font_size = tweak_data.gui.font_sizes.size_76
	disclaimer_label_params.color = tweak_data.gui.colors.raid_red
	slot8 = self._debrief_video
	disclaimer_label_params.layer = self._debrief_video.layer(self._debrief_video) + 1
	slot9 = disclaimer_label_params
	local disclaimer = self._panel.text(self._debrief_video, self._panel)
	slot10 = self._safe_rect_workspace

	managers.gui_data.layout_workspace(self._panel, managers.gui_data)

	slot9 = managers.controller
	local press_any_key_text = (managers.controller.is_using_controller(self._panel) and "press_any_key_to_skip_controller") or "press_any_key_to_skip"
	local press_any_key_params = {
		name = "press_any_key_prompt",
		alpha = 0
	}
	slot13 = tweak_data.gui.font_sizes.size_32
	press_any_key_params.font = tweak_data.gui.get_font_path(slot10, tweak_data.gui, tweak_data.gui.fonts.din_compressed)
	press_any_key_params.font_size = tweak_data.gui.font_sizes.size_32
	slot14 = press_any_key_text
	press_any_key_params.text = utf8.to_upper(managers.localization.text(tweak_data.gui.fonts.din_compressed, managers.localization))
	press_any_key_params.color = tweak_data.gui.colors.raid_dirty_white
	slot11 = self._debrief_video
	press_any_key_params.layer = self._debrief_video.layer(slot10) + 1
	slot12 = press_any_key_params
	local press_any_key_prompt = self._safe_panel.text(slot10, self._safe_panel)
	slot12 = press_any_key_prompt
	local _, _, w, h = press_any_key_prompt.text_rect(self._safe_panel)
	slot17 = w

	press_any_key_prompt.set_w(slot15, press_any_key_prompt)

	slot17 = h

	press_any_key_prompt.set_h(slot15, press_any_key_prompt)

	slot19 = self._safe_panel
	slot17 = self._safe_panel.w(slot18) - 50

	press_any_key_prompt.set_right(slot15, press_any_key_prompt)

	slot19 = self._safe_panel
	slot17 = self._safe_panel.h(slot18) - 50

	press_any_key_prompt.set_bottom(slot15, press_any_key_prompt)

	slot16 = press_any_key_prompt
	slot21 = "_animate_show_press_any_key_prompt"

	press_any_key_prompt.animate(slot15, callback(slot18, self, self))

	return 
end
function EventCompleteState:_animate_show_press_any_key_prompt(prompt)
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
function EventCompleteState:_animate_change_press_any_key_prompt(prompt)
	local fade_out_duration = 0.25
	slot5 = prompt
	local t = (1 - prompt.alpha(slot4)) * fade_out_duration

	while t < fade_out_duration do
		local dt = coroutine.yield()
		t = t + dt
		slot10 = fade_out_duration
		local current_alpha = Easing.quartic_in_out(slot6, t, 0.75, -0.75)
		slot9 = current_alpha

		prompt.set_alpha(t, prompt)
	end

	slot7 = 0

	prompt.set_alpha(slot5, prompt)

	slot6 = managers.controller
	local press_any_key_text = (managers.controller.is_using_controller(slot5) and "press_any_key_to_skip_controller") or "press_any_key_to_skip"
	slot7 = prompt

	prompt.set_text(slot6, utf8.to_upper(managers.localization.text(slot11, managers.localization)))

	slot7 = prompt
	local _, _, w, h = prompt.text_rect(slot6)
	slot12 = w

	prompt.set_w(managers.localization.text, prompt)

	slot12 = h

	prompt.set_h(managers.localization.text, prompt)

	slot14 = self._safe_panel
	slot12 = self._safe_panel.w(press_any_key_text) - 50

	prompt.set_right(managers.localization.text, prompt)

	local fade_in_duration = 0.25
	t = 0

	while t < fade_in_duration do
		local dt = coroutine.yield()
		t = t + dt
		slot16 = fade_in_duration
		local current_alpha = Easing.quartic_in_out(slot12, t, 0, 0.75)
		slot15 = current_alpha

		prompt.set_alpha(t, prompt)
	end

	slot13 = 0.75

	prompt.set_alpha(slot11, prompt)

	return 
end
function EventCompleteState:on_controller_hotswap()
	slot4 = "press_any_key_prompt"
	local press_any_key_prompt = self._safe_panel.child(slot2, self._safe_panel)

	if press_any_key_prompt then
		slot4 = press_any_key_prompt

		press_any_key_prompt.stop(slot3)

		slot4 = press_any_key_prompt
		slot9 = "_animate_change_press_any_key_prompt"

		press_any_key_prompt.animate(slot3, callback(slot6, self, self))
	end

	return 
end
function EventCompleteState:job_data()
	return self._current_job_data
end
function EventCompleteState:on_server_left(message)
	local dialog_data = {}
	slot6 = "dialog_returning_to_main_menu"
	dialog_data.title = managers.localization.text(slot4, managers.localization)
	slot6 = "dialog_server_left"
	dialog_data.text = managers.localization.text(slot4, managers.localization)

	if not self._awarded_rewards.loot then
		slot5 = managers.raid_job

		if managers.raid_job.is_at_last_event(slot4) then
			slot5 = self

			if self.is_success(slot4) then
				managers.lootdrop._cards_already_rejected = true
				slot5 = self

				self.drop_loot_for_player(true)

				local dropped_loot = managers.lootdrop._dropped_loot

				if not dropped_loot.reward_type == LootDropTweakData.REWARD_XP then
					dialog_data.text = dialog_data.text .. "\n"
				end

				if dropped_loot.reward_type == LootDropTweakData.REWARD_CUSTOMIZATION then
					slot9 = {
						OUTFIT = tostring(managers.localization.text(slot13, managers.localization))
					}
					slot15 = dropped_loot.character_customization.name
					dialog_data.text = dialog_data.text .. managers.localization.text(slot6, managers.localization, "menu_server_left_loot_outfit")
				elseif dropped_loot.reward_type == LootDropTweakData.REWARD_GOLD_BARS then
					slot9 = {
						GOLD = tostring(slot11)
					}
					slot12 = dropped_loot.awarded_gold_bars
					dialog_data.text = dialog_data.text .. managers.localization.text(slot6, managers.localization, "menu_server_left_loot_gold")
				elseif dropped_loot.reward_type == LootDropTweakData.REWARD_MELEE_WEAPON then
					slot9 = {
						MELEE = tostring(managers.localization.text(slot13, managers.localization))
					}
					slot15 = tweak_data.blackmarket.melee_weapons[dropped_loot.weapon_id].name_id
					dialog_data.text = dialog_data.text .. managers.localization.text(slot6, managers.localization, "menu_server_left_loot_melee")
				end
			end
		end
	end

	if not self._awarded_rewards.xp then
		local base_xp = self.calculate_xp(slot4)

		self.award_xp(self, self)

		slot10 = {
			XP = tostring(slot12)
		}
		slot13 = self._awarded_xp
		dialog_data.text = dialog_data.text .. "\n" .. managers.localization.text(base_xp, managers.localization, "menu_server_left_loot_xp")
	end

	if not self._awarded_rewards.greed_gold then
		slot5 = managers.greed

		if managers.greed.acquired_gold_in_mission(slot4) then
			slot5 = self

			if self.is_success(slot4) then
				slot9 = {
					GOLD = tostring(slot11)
				}
				slot12 = managers.greed._gold_awarded_in_mission
				dialog_data.text = dialog_data.text .. "\n" .. managers.localization.text(slot6, managers.localization, "menu_server_left_loot_greed_gold")
				slot5 = managers.greed

				managers.greed.award_gold_picked_up_in_mission("\n")
			end
		end
	end

	slot5 = managers.worldcollection

	managers.worldcollection.on_server_left(slot4)

	if managers.game_play_central then
		slot5 = managers.game_play_central

		managers.game_play_central.stop_the_game(slot4)
	end

	local ok_button = {}
	slot7 = "dialog_ok"
	ok_button.text = managers.localization.text(slot5, managers.localization)
	ok_button.callback_func = MenuCallbackHandler._dialog_end_game_yes
	dialog_data.button_list = {
		ok_button
	}
	slot7 = dialog_data

	managers.system_menu.show(slot5, managers.system_menu)

	Global.on_remove_peer_message = nil

	return 
end
function EventCompleteState:on_top_stats_ready()
	slot4 = "[EventCompleteState:on_top_stats_ready()]"

	Application.trace(slot2, Application)

	slot3 = Network

	if Network.is_server(slot2) then
		slot3 = managers.raid_job

		managers.raid_job.complete_current_event(slot2)
	end

	slot3 = managers.statistics
	self.player_top_stats = managers.statistics.get_top_stats_for_player(slot2)
	local acquired_value = 0
	local total_value = 0
	slot5 = self

	if self.is_success(slot4) then
		slot5 = managers.statistics
		self.special_honors = managers.statistics.get_top_stats(slot4)
		slot5 = managers.network
		slot5 = managers.network.session(slot4)

		if managers.network.session(slot4).amount_of_players(slot4) ~= 1 then
			slot5 = self.special_honors

			for index, stat in pairs(slot4) do
				slot11 = managers.network
				slot11 = managers.network.session(slot10)
				slot11 = managers.network.session(slot10).local_peer(slot10)

				if stat.peer_id == managers.network.session(slot10).local_peer(slot10).id(slot10) then
					acquired_value = acquired_value + tweak_data.statistics.top_stats[stat.id].loot_value
				end

				total_value = total_value + tweak_data.statistics.top_stats[stat.id].loot_value
			end

			local top_stats_loot_data = {
				title = "menu_loot_screen_top_stats",
				icon = "rewards_top_stats",
				acquired = #self.player_top_stats,
				total = #self.special_honors,
				acquired_value = acquired_value,
				total_value = total_value
			}
			self.loot_data[LootScreenGui.LOOT_ITEM_TOP_STATS] = top_stats_loot_data
		end
	else
		slot5 = managers.statistics
		self.special_honors = managers.statistics.get_bottom_stats(slot4)
	end

	slot5 = self.player_top_stats

	for index, stat in pairs(slot4) do
		acquired_value = acquired_value + tweak_data.statistics.top_stats[stat.id].loot_value
	end

	slot5 = managers.raid_job
	local is_in_operation = managers.raid_job.current_job(slot4).job_type == OperationsTweakData.JOB_TYPE_OPERATION
	self.stats_ready = true

	if self._active_screen == EventCompleteState.SCREEN_ACTIVE_SPECIAL_HONORS and managers.menu_component._raid_menu_special_honors_gui then
		slot6 = managers.menu_component._raid_menu_special_honors_gui

		managers.menu_component._raid_menu_special_honors_gui.show_honors(slot5)
	end

	if self.is_at_last_event and self._success and is_in_operation then
		slot7 = managers.raid_job
		local operation_save_data = managers.raid_job.get_save_slots(slot5)[managers.raid_job.get_current_save_slot(managers.raid_job)]

		if not operation_save_data then
			return 
		end

		slot8 = operation_save_data

		managers.achievment.check_achievement_operation_clear_sky_no_bleedout(slot6, managers.achievment)

		slot8 = operation_save_data

		managers.achievment.check_achievement_operation_clear_sky_hardest(slot6, managers.achievment)

		slot8 = operation_save_data

		managers.achievment.check_achievement_operation_burn_no_bleedout(slot6, managers.achievment)

		slot8 = operation_save_data

		managers.achievment.check_achievement_operation_burn_hardest(slot6, managers.achievment)
	end

	return 
end
function EventCompleteState:update(t, dt)
	if self._active_screen == EventCompleteState.SCREEN_ACTIVE_DEBRIEF_VIDEO then
		slot5 = self
	end

	return 
end
function EventCompleteState:is_playing()
	slot3 = self._debrief_video

	return self._debrief_video.loop_count(slot2) < 1
end
function EventCompleteState:is_skipped()
	slot3 = self._controller_list

	for _, controller in ipairs(slot2) do
		slot8 = controller

		if controller.get_any_input_pressed(slot7) then
			return true
		end
	end

	return false
end
function EventCompleteState:get_personal_stats()
	local personal_stats = {}
	slot4 = managers.statistics
	personal_stats.session_killed = managers.statistics.session_killed(slot3).total.count or 0
	slot4 = managers.statistics
	personal_stats.session_accuracy = managers.statistics.session_hit_accuracy(slot3) or 0
	slot4 = managers.statistics
	personal_stats.session_headshots = managers.statistics.session_total_head_shots(slot3) or 0
	personal_stats.session_headshot_percentage = 0

	if 0 < personal_stats.session_killed then
		personal_stats.session_headshot_percentage = personal_stats.session_headshots / personal_stats.session_killed * 100
	end

	slot4 = managers.statistics
	personal_stats.session_special_kills = managers.statistics.session_total_specials_kills(slot3) or 0
	slot4 = managers.statistics
	personal_stats.session_revives_data = managers.statistics.session_teammates_revived(slot3) or 0
	personal_stats.session_teammates_revived = 0
	slot4 = personal_stats.session_revives_data

	for i, count in pairs(slot3) do
		personal_stats.session_teammates_revived = personal_stats.session_teammates_revived + count
	end

	slot4 = managers.statistics
	personal_stats.session_bleedouts = managers.statistics.session_downed(slot3)
	self.personal_stats = personal_stats

	return 
end
function EventCompleteState:get_base_xp_breakdown()
	local is_in_operation = self._current_job_data.job_type == OperationsTweakData.JOB_TYPE_OPERATION
	local current_operation = (is_in_operation and self._current_job_data.job_id) or nil
	local current_event = nil

	if is_in_operation then
		current_event = self._current_job_data.events_index[self._current_job_data.current_event]
	else
		current_event = self._current_job_data.job_id
	end

	slot9 = true
	self.xp_breakdown = managers.experience.calculate_exp_brakedown(slot5, managers.experience, current_event, current_operation)
	slot6 = self

	if not self.is_success(slot5) then
		for i = 1, #self.xp_breakdown.additive, 1 do
			self.xp_breakdown.additive[i].amount = self.xp_breakdown.additive[i].amount * RaidJobManager.XP_MULTIPLIER_ON_FAIL
		end
	end

	return 
end
function EventCompleteState:calculate_xp()
	slot3 = self

	self.get_base_xp_breakdown(slot2)

	local additive = 0

	for i = 1, #self.xp_breakdown.additive, 1 do
		additive = additive + self.xp_breakdown.additive[i].amount
	end

	local multiplicative = 1

	for i = 1, #self.xp_breakdown.multiplicative, 1 do
		multiplicative = multiplicative + self.xp_breakdown.multiplicative[i].amount
	end

	self.total_xp = additive * multiplicative

	return self.total_xp
end
function EventCompleteState:recalculate_xp()
	slot3 = self
	local total_xp = self.calculate_xp(slot2)

	if total_xp ~= self._awarded_xp then
		slot5 = total_xp - self._awarded_xp

		self.award_xp(slot3, self)
	end

	return 
end
function EventCompleteState:award_xp(value)
	slot8 = value
	slot5 = "[EventCompleteState:award_xp()] value: " .. tostring(slot7)

	Application.trace(slot3, Application)

	slot6 = false

	managers.experience.add_points(slot3, managers.experience, value)

	if not self._awarded_xp then
		self._awarded_xp = 0
	end

	self._awarded_xp = self._awarded_xp + value
	self._awarded_rewards.xp = true

	return 
end
function EventCompleteState:is_success()
	return self._success
end
function EventCompleteState:at_exit(next_state)
	slot5 = "[EventCompleteState:at_exit()]"

	Application.trace(slot3, Application)

	slot5 = true

	managers.briefing.stop_event(slot3, managers.briefing)

	slot4 = self

	self._clear_controller(slot3)

	slot4 = managers.experience

	managers.experience.clear_loot_redeemed_xp(slot3)

	slot4 = managers.loot

	managers.loot.clear(slot3)

	slot4 = managers.greed

	managers.greed.clear_cache(slot3)

	self.initial_xp = nil
	self.xp_breakdown = nil
	self.total_xp = nil
	self.stats_ready = nil
	self.local_player_loot_drop = nil
	self._awarded_xp = 0
	self.loot_acquired = 0
	self.loot_spawned = 0
	self.loot_data = {}
	slot4 = managers.statistics

	managers.statistics.clear_peer_statistics(slot3)

	slot5 = SavefileManager.SETTING_SLOT

	managers.savefile.save_game(slot3, managers.savefile)

	slot4 = managers.player
	local player = managers.player.player_unit(slot3)

	if player then
		slot5 = player
		slot6 = true

		player.base(slot4).set_enabled(slot4, player.base(slot4))

		slot5 = player
		slot6 = true

		player.base(slot4).set_visible(slot4, player.base(slot4))

		slot5 = player
		slot6 = PlayerStandard.IDS_EQUIP

		player.camera(slot4).play_redirect(slot4, player.camera(slot4))
	end

	slot5 = Network

	if Network.is_server(slot4) then
		slot5 = managers.raid_job

		managers.raid_job.start_next_event(slot4)

		slot5 = managers.network
		slot6 = "in_game"

		managers.network.session(slot4).set_state(slot4, managers.network.session(slot4))

		slot5 = managers.network.matchmake

		managers.network.matchmake.set_job_info_by_current_job(slot4)
	end

	slot6 = "event_complete_state_top_stats_ready"

	managers.system_event_listener.remove_listener(slot4, managers.system_event_listener)

	slot6 = "event_complete_state_loot_data_ready"

	managers.system_event_listener.remove_listener(slot4, managers.system_event_listener)

	slot6 = LootScreenGui.EVENT_KEY_PEER_LOOT_RECEIVED

	managers.lootdrop.remove_listener(slot4, managers.lootdrop)

	slot5 = managers.music

	managers.music.stop(slot4)

	slot7 = true

	managers.music.post_event(slot4, managers.music, "music_camp")

	slot6 = "menu_volume_reset"

	managers.menu_component.post_event(slot4, managers.menu_component)

	slot6 = false

	managers.dialog.set_paused(slot4, managers.dialog)

	slot5 = Overlay
	slot6 = self._full_workspace

	Overlay.gui(slot4).destroy_workspace(slot4, Overlay.gui(slot4))

	slot5 = Overlay
	slot6 = self._safe_rect_workspace

	Overlay.gui(slot4).destroy_workspace(slot4, Overlay.gui(slot4))

	return 
end
function EventCompleteState:_shut_down_network()
	slot4 = false

	Network.set_multiplayer(slot2, Network)

	slot3 = managers.network

	managers.network.queue_stop_network(slot2)

	slot3 = managers.network.matchmake

	managers.network.matchmake.destroy_game(slot2)

	slot3 = managers.network.voice_chat

	managers.network.voice_chat.destroy_voice(slot2)

	return 
end
function EventCompleteState:_continue_blocked()
	slot3 = managers.menu
	local in_focus = managers.menu.active_menu(slot2) == self._mission_end_menu

	if not in_focus then
		return true
	end

	slot4 = managers.hud

	if managers.hud.showing_stats_screen(slot3) then
		return true
	end

	slot4 = managers.system_menu

	if managers.system_menu.is_active(slot3) then
		return true
	end

	slot4 = managers.menu_component

	if managers.menu_component.input_focus(slot3) == 1 then
		return true
	end

	if self._continue_block_timer then
		slot5 = Application

		if Application.time(slot4) < self._continue_block_timer then
			return true
		end
	end

	return false
end
function EventCompleteState:continue()
	slot3 = self

	self._continue(slot2)

	return 
end
function EventCompleteState:_continue()
	slot4 = "[EventCompleteState:_continue()]"

	Application.trace(slot2, Application)

	if self._active_screen == EventCompleteState.SCREEN_ACTIVE_DEBRIEF_VIDEO then
		slot3 = self

		if self.is_success(slot2) then
			slot5 = true

			managers.music.post_event(slot2, managers.music, "music_mission_success")
		else
			slot5 = true

			managers.music.post_event(slot2, managers.music, "music_mission_fail")
		end

		self._active_screen = EventCompleteState.SCREEN_ACTIVE_SPECIAL_HONORS
		slot3 = managers.network
		slot3 = managers.network.session(slot2)

		if managers.network.session(slot2).amount_of_players(slot2) == 1 then
			slot3 = self

			self._continue(slot2)

			return 
		end

		slot5 = false

		managers.raid_menu.open_menu(slot2, managers.raid_menu, "raid_menu_special_honors")
	elseif self._active_screen == EventCompleteState.SCREEN_ACTIVE_SPECIAL_HONORS then
		if self.is_at_last_event then
			slot3 = self
		else
			local base_xp = self.calculate_xp(slot2)
			slot5 = base_xp

			self.award_xp(self, self)

			slot6 = false
			local success = managers.raid_menu.open_menu(self, managers.raid_menu, "raid_menu_post_game_breakdown")

			if success then
				self._active_screen = EventCompleteState.SCREEN_ACTIVE_EXPERIENCE
			end
		end

		slot4 = "prize_set_volume_continue"

		managers.hud.post_event(slot2, managers.hud)

		slot4 = "next_page_woosh"

		managers.hud.post_event(slot2, managers.hud)
	elseif self._active_screen == EventCompleteState.SCREEN_ACTIVE_LOOT then
		self._active_screen = EventCompleteState.SCREEN_ACTIVE_GREED_LOOT
		slot3 = self

		if self.is_success(slot2) then
			slot3 = managers.greed
		else
			slot3 = self

			self._continue(slot2)

			return 
		end
	elseif self._active_screen == EventCompleteState.SCREEN_ACTIVE_GREED_LOOT then
		local base_xp = self.calculate_xp(slot2)
		slot5 = base_xp

		self.award_xp(self, self)

		slot6 = false
		local success = managers.raid_menu.open_menu(self, managers.raid_menu, "raid_menu_post_game_breakdown")

		if success then
			self._active_screen = EventCompleteState.SCREEN_ACTIVE_EXPERIENCE
		else
			self._active_screen = nil
			slot6 = self._old_state

			game_state_machine.change_state(slot4, game_state_machine)
		end

		slot6 = "prize_set_volume_continue"

		managers.hud.post_event(slot4, managers.hud)

		slot6 = "next_page_woosh"

		managers.hud.post_event(slot4, managers.hud)
	else
		self._active_screen = nil
		slot3 = managers.raid_menu

		managers.raid_menu.close_all_menus(slot2)

		slot4 = self._old_state

		game_state_machine.change_state(slot2, game_state_machine)
	end

	return 
end
function EventCompleteState:_clear_controller()
	slot4 = "event_complete_state"

	managers.controller.remove_hotswap_callback(slot2, managers.controller)

	if not self._controller then
		return 
	end

	slot4 = false

	self._controller.set_enabled(slot2, self._controller)

	slot3 = self._controller

	self._controller.destroy(slot2)

	self._controller = nil

	return 
end
function EventCompleteState:game_ended()
	return true
end
function EventCompleteState:check_complete_achievements()
	slot3 = self

	if self.is_success(slot2) then
		slot3 = managers.achievment

		managers.achievment.check_achievement_complete_raid_with_4_different_classes(slot2)

		slot3 = managers.achievment

		managers.achievment.check_achievement_complete_raid_with_no_kills(slot2)

		slot3 = managers.achievment

		managers.achievment.check_achievement_kill_30_enemies_with_vehicle_on_bank_level(slot2)
	end

	return 
end
function EventCompleteState:set_statistics_values()
	local usingChallengeCard = false

	if self._active_challenge_card ~= nil and self._active_challenge_card.key_name ~= nil and self._active_challenge_card.key_name ~= "empty" and self._active_challenge_card.card_category == ChallengeCardsTweakData.CARD_CATEGORY_CHALLENGE_CARD then
		usingChallengeCard = true
	end

	slot4 = self

	if self.is_success(slot3) and usingChallengeCard then
		slot6 = self._active_challenge_card

		managers.statistics.complete_job_with_challenge_card(slot3, managers.statistics, self._job_type)
	end

	return 
end
function EventCompleteState:is_joinable()
	return false
end

return 
