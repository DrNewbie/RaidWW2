-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
RaidGUIItemAvailabilityFlag = RaidGUIItemAvailabilityFlag or {}
RaidGUIItemAvailabilityFlag.ALWAYS_HIDE = "always_hide"
RaidGUIItemAvailabilityFlag.CAN_SAVE_GAME = "can_save_game"
RaidGUIItemAvailabilityFlag.CUSTOMIZE_CONTROLLER_ENABLED = "customize_controller_enabled"
RaidGUIItemAvailabilityFlag.DEBUG_MENU_ENABLED = "debug_menu_enabled"
RaidGUIItemAvailabilityFlag.HAS_INSTALLED_MODS = "has_installed_mods"
RaidGUIItemAvailabilityFlag.IS_CASH_SAFE_BACK_VISIBLE = "is_cash_safe_back_visible"
RaidGUIItemAvailabilityFlag.IS_FULLSCREEN = "is_fullscreen"
RaidGUIItemAvailabilityFlag.IS_IN_CAMP = "is_in_camp"
RaidGUIItemAvailabilityFlag.IS_MULTIPLAYER = "is_multiplayer"
RaidGUIItemAvailabilityFlag.IS_SINGLEPLAYER = "is_singleplayer"
RaidGUIItemAvailabilityFlag.IS_NOT_EDITOR = "is_not_editor"
RaidGUIItemAvailabilityFlag.IS_NOT_CONSUMABLE = "is_not_consumable"
RaidGUIItemAvailabilityFlag.IS_NOT_IN_CAMP = "is_not_in_camp"
RaidGUIItemAvailabilityFlag.IS_NOT_MULTIPLAYER = "is_not_multiplayer"
RaidGUIItemAvailabilityFlag.IS_NOT_PC_CONTROLLER = "is_not_pc_controller"
RaidGUIItemAvailabilityFlag.IS_NOT_XBOX = "is_not_xbox"
RaidGUIItemAvailabilityFlag.IS_PC_CONTROLLER = "is_pc_controller"
RaidGUIItemAvailabilityFlag.IS_SERVER = "is_server"
RaidGUIItemAvailabilityFlag.IS_WIN32 = "is_win32"
RaidGUIItemAvailabilityFlag.IS_X360 = "is_x360"
RaidGUIItemAvailabilityFlag.KICK_PLAYER_VISIBLE = "kick_player_visible"
RaidGUIItemAvailabilityFlag.KICK_VOTE_VISIBLE = "kick_vote_visible"
RaidGUIItemAvailabilityFlag.NON_OVERKILL_145 = "non_overkill_145"
RaidGUIItemAvailabilityFlag.REPUTATION_CHECK = "reputation_check"
RaidGUIItemAvailabilityFlag.RESTART_LEVEL_VISIBLE = "restart_level_visible"
RaidGUIItemAvailabilityFlag.RESTART_LEVEL_VISIBLE_CLIENT = "restart_level_visible_client"
RaidGUIItemAvailabilityFlag.RESTART_VOTE_VISIBLE = "restart_vote_visible"
RaidGUIItemAvailabilityFlag.SINGLEPLAYER_RESTART = "singleplayer_restart"
RaidGUIItemAvailabilityFlag.VOICE_ENABLED = "voice_enabled"
RaidGUIItemAvailabilityFlag.IS_IN_MAIN_MENU = "is_in_main_menu"
RaidGUIItemAvailabilityFlag.IS_NOT_IN_MAIN_MENU = "is_not_in_main_menu"
RaidGUIItemAvailabilityFlag.SHOULD_SHOW_TUTORIAL = "should_show_tutorial"
RaidGUIItemAvailabilityFlag.HAS_SPECIAL_EDITION = "has_special_edition"

if not RaidMenuCallbackHandler then
	slot2 = CoreMenuCallbackHandler.CallbackHandler
	slot0 = class(slot1)
end

RaidMenuCallbackHandler = slot0
RaidMenuCallbackHandler.menu_options_on_click_controls = function (self)
	slot4 = "raid_menu_options_controls"

	managers.raid_menu.open_menu(slot2, managers.raid_menu)

	return 
end
RaidMenuCallbackHandler.menu_options_on_click_video = function (self)
	slot4 = "raid_menu_options_video"

	managers.raid_menu.open_menu(slot2, managers.raid_menu)

	return 
end
RaidMenuCallbackHandler.menu_options_on_click_sound = function (self)
	slot4 = "raid_menu_options_sound"

	managers.raid_menu.open_menu(slot2, managers.raid_menu)

	return 
end
RaidMenuCallbackHandler.menu_options_on_click_network = function (self)
	slot4 = "raid_menu_options_network"

	managers.raid_menu.open_menu(slot2, managers.raid_menu)

	return 
end
RaidMenuCallbackHandler.menu_options_on_click_default = function (self)
	local params = {}
	slot5 = "dialog_reset_all_options_title"
	params.title = managers.localization.text(slot3, managers.localization)
	slot5 = "dialog_reset_all_options_message"
	params.message = managers.localization.text(slot3, managers.localization)
	params.callback = function ()
		slot2 = managers.user

		managers.user.reset_controls_setting_map(slot1)

		slot3 = "settings/controller_settings"

		managers.controller.load_settings(slot1, managers.controller)

		slot4 = MenuCustomizeControllerCreator.CONTROLS_INFO

		managers.controller.clear_user_mod(slot1, managers.controller, "normal")

		slot2 = managers.user

		managers.user.reset_video_setting_map(slot1)

		slot2 = managers.menu
		slot2 = managers.menu.active_menu(slot1).callback_handler

		managers.menu.active_menu(slot1).callback_handler.set_fullscreen_default_raid_no_dialog(slot1)

		slot4 = tweak_data.gui.base_resolution.z
		local resolution = Vector3(slot1, tweak_data.gui.base_resolution.x, tweak_data.gui.base_resolution.y)
		slot3 = managers.menu
		slot4 = resolution

		managers.menu.active_menu(tweak_data.gui.base_resolution.x).callback_handler.set_resolution_default_raid_no_dialog(tweak_data.gui.base_resolution.x, managers.menu.active_menu(tweak_data.gui.base_resolution.x).callback_handler)

		slot3 = managers.menu
		slot3 = managers.menu.active_menu(tweak_data.gui.base_resolution.x).callback_handler

		managers.menu.active_menu(tweak_data.gui.base_resolution.x).callback_handler._refresh_brightness(tweak_data.gui.base_resolution.x)

		slot3 = managers.user

		managers.user.reset_advanced_video_setting_map(tweak_data.gui.base_resolution.x)

		RenderSettings.texture_quality_default = "high"
		RenderSettings.shadow_quality_default = "high"
		RenderSettings.max_anisotropy = 16
		RenderSettings.v_sync = false
		slot3 = managers.menu
		slot3 = managers.menu.active_menu(false).callback_handler

		managers.menu.active_menu(false).callback_handler.apply_and_save_render_settings(false)

		slot3 = managers.menu
		slot3 = managers.menu.active_menu(false).callback_handler

		managers.menu.active_menu(false).callback_handler._refresh_brightness(false)

		slot3 = managers.user

		managers.user.reset_sound_setting_map(false)

		slot3 = managers.menu
		slot3 = managers.menu.active_menu(false).callback_handler

		managers.menu.active_menu(false).callback_handler._reset_mainmusic(false)

		slot3 = managers.user

		managers.user.reset_network_setting_map(false)

		return 
	end
	slot5 = params

	managers.menu.show_option_dialog(slot3, managers.menu)

	return 
end
RaidMenuCallbackHandler.menu_options_on_click_reset_progress = function (self)
	local dialog_data = {}
	slot5 = "dialog_warning_title"
	dialog_data.title = managers.localization.text(slot3, managers.localization)
	slot5 = "dialog_are_you_sure_you_want_to_clear_progress"
	dialog_data.text = managers.localization.text(slot3, managers.localization)
	local yes_button = {}
	slot6 = "dialog_yes"
	yes_button.text = managers.localization.text(managers.localization, managers.localization)
	slot7 = "_dialog_clear_progress_yes"
	yes_button.callback_func = callback(managers.localization, self, self)
	local no_button = {}
	slot7 = "dialog_no"
	no_button.text = managers.localization.text(self, managers.localization)
	no_button.class = RaidGUIControlButtonShortSecondary
	dialog_data.button_list = {
		yes_button,
		no_button
	}
	slot7 = dialog_data

	managers.system_menu.show(self, managers.system_menu)

	return 
end
RaidMenuCallbackHandler._dialog_clear_progress_yes = function (self)
	slot3 = game_state_machine

	if game_state_machine.current_state_name(slot2) == "menu_main" then
		slot3 = managers.savefile

		managers.savefile.clear_progress_data(slot2)
	else
		Global.reset_progress = true
		slot3 = MenuCallbackHandler

		MenuCallbackHandler._dialog_end_game_yes(true)
	end

	return 
end
RaidMenuCallbackHandler.init = function (self)
	slot3 = self

	RaidMenuCallbackHandler.super.init(slot2)

	return 
end
RaidMenuCallbackHandler.debug_menu_enabled = function (self)
	slot3 = managers.menu

	return managers.menu.debug_menu_enabled(slot2)
end
RaidMenuCallbackHandler.is_in_camp = function (self)
	slot3 = managers.raid_job

	return managers.raid_job.is_camp_loaded(slot2)
end
RaidMenuCallbackHandler.is_not_in_camp = function (self)
	slot3 = managers.raid_job

	return not managers.raid_job.is_camp_loaded(slot2)
end
RaidMenuCallbackHandler.is_not_editor = function (self)
	slot3 = Application

	return not Application.editor(slot2)
end
RaidMenuCallbackHandler.on_multiplayer_clicked = function (self)
	slot4 = "mission_join_menu"

	managers.raid_menu.open_menu(slot2, managers.raid_menu)

	return 
end
RaidMenuCallbackHandler.on_select_character_profile_clicked = function (self)
	slot4 = "profile_selection_menu"

	managers.raid_menu.open_menu(slot2, managers.raid_menu)

	return 
end
RaidMenuCallbackHandler.on_weapon_select_clicked = function (self)
	slot4 = "raid_menu_weapon_select"

	managers.raid_menu.open_menu(slot2, managers.raid_menu)

	return 
end
RaidMenuCallbackHandler.on_select_character_skills_clicked = function (self)
	slot4 = "raid_menu_xp"

	managers.raid_menu.open_menu(slot2, managers.raid_menu)

	return 
end
RaidMenuCallbackHandler.on_select_challenge_cards_view_clicked = function (self)
	slot4 = "challenge_cards_view_menu"

	managers.raid_menu.open_menu(slot2, managers.raid_menu)

	return 
end
RaidMenuCallbackHandler.on_mission_selection_clicked = function (self)
	slot3 = managers.progression

	if managers.progression.have_pending_missions_to_unlock(slot2) then
		slot4 = "mission_unlock_menu"

		managers.raid_menu.open_menu(slot2, managers.raid_menu)
	else
		slot4 = "mission_selection_menu"

		managers.raid_menu.open_menu(slot2, managers.raid_menu)
	end

	return 
end
RaidMenuCallbackHandler.on_options_clicked = function (self)
	slot4 = "raid_options_menu"

	managers.raid_menu.open_menu(slot2, managers.raid_menu)

	return 
end
RaidMenuCallbackHandler.on_gold_asset_store_clicked = function (self)
	slot4 = "gold_asset_store_menu"

	managers.raid_menu.open_menu(slot2, managers.raid_menu)

	return 
end
RaidMenuCallbackHandler.on_intel_clicked = function (self)
	slot4 = "intel_menu"

	managers.raid_menu.open_menu(slot2, managers.raid_menu)

	return 
end
RaidMenuCallbackHandler.on_comic_book_clicked = function (self)
	slot4 = "comic_book_menu"

	managers.raid_menu.open_menu(slot2, managers.raid_menu)

	return 
end
RaidMenuCallbackHandler.show_credits = function (self)
	slot4 = "raid_credits_menu"

	managers.raid_menu.open_menu(slot2, managers.raid_menu)

	return 
end
RaidMenuCallbackHandler.end_game = function (self)
	local dialog_data = {}
	slot5 = "dialog_warning_title"
	dialog_data.title = managers.localization.text(slot3, managers.localization)
	slot5 = "dialog_are_you_sure_you_want_to_leave_game"
	dialog_data.text = managers.localization.text(slot3, managers.localization)
	local yes_button = {}
	slot6 = "dialog_yes"
	yes_button.text = managers.localization.text(managers.localization, managers.localization)
	slot7 = "_dialog_end_game_yes"
	yes_button.callback_func = callback(managers.localization, self, self)
	local no_button = {}
	slot7 = "dialog_no"
	no_button.text = managers.localization.text(self, managers.localization)
	slot8 = "_dialog_end_game_no"
	no_button.callback_func = callback(self, self, self)
	no_button.class = RaidGUIControlButtonShortSecondary
	no_button.cancel_button = true
	dialog_data.button_list = {
		yes_button,
		no_button
	}
	slot7 = dialog_data

	managers.system_menu.show(self, managers.system_menu)

	return 
end
RaidMenuCallbackHandler._dialog_end_game_yes = function (self)
	setup.exit_to_main_menu = true
	slot3 = setup

	setup.quit_to_main_menu(true)

	return 
end
RaidMenuCallbackHandler._dialog_end_game_no = function (self)
	return 
end
RaidMenuCallbackHandler.debug_camp = function (self)
	slot4 = "debug_camp"

	managers.menu.open_node(slot2, managers.menu)

	return 
end
RaidMenuCallbackHandler.debug_ingame = function (self)
	slot4 = "debug_ingame"

	managers.menu.open_node(slot2, managers.menu)

	return 
end
RaidMenuCallbackHandler.debug_main = function (self)
	slot4 = "debug"

	managers.menu.open_node(slot2, managers.menu)

	return 
end
RaidMenuCallbackHandler.singleplayer_restart = function (self)
	local visible = true
	slot4 = game_state_machine
	local state = game_state_machine.current_state_name(slot3)
	visible = visible and state ~= "menu_main"

	if visible then
		slot5 = managers.raid_job
		visible = not managers.raid_job.is_camp_loaded(slot4)
	end

	if visible then
		slot5 = managers.raid_job
		visible = not managers.raid_job.is_in_tutorial(slot4)
	end

	if visible then
		slot5 = self
		visible = self.is_singleplayer(slot4)
	end

	if visible then
		slot5 = self
		visible = self.has_full_game(slot4)
	end

	return visible
end
RaidMenuCallbackHandler.is_singleplayer = function (self)
	return Global.game_settings.single_player
end
RaidMenuCallbackHandler.has_full_game = function (self)
	slot3 = managers.dlc

	return managers.dlc.has_full_game(slot2)
end
RaidMenuCallbackHandler.always_hide = function (self)
	return false
end
RaidMenuCallbackHandler.is_server = function (self)
	slot3 = Network

	return Network.is_server(slot2)
end
RaidMenuCallbackHandler.is_multiplayer = function (self)
	return not Global.game_settings.single_player
end
RaidMenuCallbackHandler.kick_player_visible = function (self)
	slot3 = self

	if self.is_server(slot2) then
		slot3 = self

		if self.is_multiplayer(slot2) then
			slot3 = managers.platform

			if managers.platform.presence(slot2) ~= "Mission_end" then
				slot3 = managers.vote
				slot1 = managers.vote.option_host_kick(slot2)
			else
				slot1 = false

				if false then
					slot1 = true
				end
			end
		end
	end

	return slot1
end
RaidMenuCallbackHandler.kick_vote_visible = function (self)
	slot3 = self

	if self.is_multiplayer(slot2) then
		slot3 = managers.platform

		if managers.platform.presence(slot2) ~= "Mission_end" then
			slot3 = managers.vote
			slot1 = managers.vote.option_vote_kick(slot2)
		else
			slot1 = false

			if false then
				slot1 = true
			end
		end
	end

	return slot1
end
RaidMenuCallbackHandler.voice_enabled = function (self)
	slot3 = self

	if not self.is_ps3(slot2) then
		slot3 = self

		if self.is_win32(slot2) and managers.network and managers.network.voice_chat then
			slot3 = managers.network.voice_chat
			slot1 = managers.network.voice_chat.enabled(slot2)
		end
	end

	return slot1
end
RaidMenuCallbackHandler.is_in_main_menu = function (self)
	slot3 = game_state_machine

	return game_state_machine.current_state_name(slot2) == "menu_main"
end
RaidMenuCallbackHandler.is_not_in_main_menu = function (self)
	slot3 = game_state_machine

	return game_state_machine.current_state_name(slot2) ~= "menu_main"
end
RaidMenuCallbackHandler.has_special_edition = function (self)
	slot4 = DLCTweakData.DLC_NAME_SPECIAL_EDITION

	return managers.dlc.is_dlc_unlocked(slot2, managers.dlc)
end
RaidMenuCallbackHandler.should_show_tutorial = function (self)
	slot3 = game_state_machine

	if game_state_machine.current_state_name(slot2) == "menu_main" then
		slot3 = managers.raid_job
		slot1 = managers.raid_job.played_tutorial(slot2)
	else
		slot1 = false

		if false then
			slot1 = true
		end
	end

	return slot1
end
RaidMenuCallbackHandler.is_ps3 = function (self)
	slot4 = "PS3"

	return SystemInfo.platform(slot2) == Idstring(SystemInfo)
end
RaidMenuCallbackHandler.is_win32 = function (self)
	slot4 = "WIN32"

	return SystemInfo.platform(slot2) == Idstring(SystemInfo)
end
RaidMenuCallbackHandler.restart_vote_visible = function (self)
	slot3 = self

	if self._restart_level_visible(slot2) then
		slot3 = managers.vote
		slot1 = managers.vote.option_vote_restart(slot2)
	end

	return slot1
end
RaidMenuCallbackHandler.restart_level_visible = function (self)
	slot3 = self

	if self.is_server(slot2) then
		slot3 = self

		if self._restart_level_visible(slot2) then
			slot3 = managers.vote
			local res = managers.vote.option_host_restart(slot2)
		end
	end

	return res
end
RaidMenuCallbackHandler.restart_level_visible_client = function (self)
	slot3 = self

	if not self.is_server(slot2) then
		slot3 = self

		if self.is_multiplayer(slot2) then
			slot3 = managers.raid_job
			slot1 = not managers.raid_job.is_in_tutorial(slot2)
		end
	else
		slot1 = false

		if false then
			local res = true
		end
	end

	if not res then
		return false
	end

	slot4 = game_state_machine
	local state = game_state_machine.current_state_name(slot3)

	return state ~= "ingame_waiting_for_players" and state ~= "ingame_lobby_menu" and state ~= "menu_main" and state ~= "empty"
end
RaidMenuCallbackHandler.is_not_consumable = function (self)
	slot3 = managers.raid_job

	if managers.raid_job.current_job(slot2) then
		slot3 = managers.raid_job

		if managers.raid_job.current_job(slot2).consumable then
			return false
		end
	end

	return true
end
RaidMenuCallbackHandler._restart_level_visible = function (self)

	-- Decompilation error in this vicinity:
	slot3 = self
	slot3 = game_state_machine
	local state = game_state_machine.current_state_name(slot2)

	return state ~= "ingame_waiting_for_players" and state ~= "ingame_lobby_menu" and state ~= "menu_main" and state ~= "empty"
end
RaidMenuCallbackHandler.resume_game_raid = function (self)
	slot3 = managers.raid_menu

	managers.raid_menu.on_escape(slot2)

	return 
end
RaidMenuCallbackHandler.edit_game_settings = function (self)
	slot4 = "edit_game_settings"

	managers.menu.open_node(slot2, managers.menu)

	return 
end
RaidMenuCallbackHandler.restart_mission = function (self, item)

	-- Decompilation error in this vicinity:
	slot4 = managers.vote
	local dialog_data = {}
	slot6 = "dialog_mp_restart_mission_title"
	dialog_data.title = managers.localization.text(slot4, managers.localization)
	slot8 = managers.vote
	slot6 = (managers.vote.option_vote_restart(slot7) and "dialog_mp_restart_level_message") or "dialog_mp_restart_mission_host_message"
	dialog_data.text = managers.localization.text(slot4, managers.localization)
	local yes_button = {}
	slot7 = "dialog_yes"
	yes_button.text = managers.localization.text(managers.localization, managers.localization)
	yes_button.callback_func = function ()
		slot2 = managers.vote

		if managers.vote.option_vote_restart(slot1) then
			slot2 = managers.vote

			managers.vote.restart_mission(slot1)
		else
			slot2 = managers.vote

			managers.vote.restart_mission_auto(slot1)
		end

		slot2 = managers.raid_menu

		managers.raid_menu.on_escape(slot1)

		return 
	end
	local no_button = {}
	slot8 = "dialog_no"
	no_button.text = managers.localization.text(managers.localization, managers.localization)
	no_button.class = RaidGUIControlButtonShortSecondary
	no_button.cancel_button = true
	dialog_data.button_list = {
		yes_button,
		no_button
	}
	slot8 = dialog_data

	managers.system_menu.show(managers.localization, managers.system_menu)

	return 
end
RaidMenuCallbackHandler.restart_to_camp_client = function (self, item)
	local dialog_data = {}
	slot6 = "dialog_mp_restart_level_title"
	dialog_data.title = managers.localization.text(slot4, managers.localization)
	slot6 = "dialog_mp_restart_level_client_message"
	dialog_data.text = managers.localization.text(slot4, managers.localization)
	local yes_button = {}
	slot7 = "dialog_yes"
	yes_button.text = managers.localization.text(managers.localization, managers.localization)
	yes_button.callback_func = function ()
		slot2 = managers.raid_menu

		managers.raid_menu.on_escape(slot1)

		slot2 = setup

		setup.return_to_camp_client(slot1)

		return 
	end
	local no_button = {}
	slot8 = "dialog_no"
	no_button.text = managers.localization.text(managers.localization, managers.localization)
	no_button.class = RaidGUIControlButtonShortSecondary
	no_button.cancel_button = true
	dialog_data.button_list = {
		yes_button,
		no_button
	}
	slot8 = dialog_data

	managers.system_menu.show(managers.localization, managers.system_menu)

	return 
end
RaidMenuCallbackHandler.restart_to_camp = function (self, item)

	-- Decompilation error in this vicinity:
	slot4 = managers.vote
	local dialog_data = {}
	slot6 = "dialog_mp_restart_level_title"
	dialog_data.title = managers.localization.text(slot4, managers.localization)
	slot8 = managers.vote
	slot6 = (managers.vote.option_vote_restart(slot7) and "dialog_mp_restart_level_message") or "dialog_mp_restart_level_host_message"
	dialog_data.text = managers.localization.text(slot4, managers.localization)
	local yes_button = {}
	slot7 = "dialog_yes"
	yes_button.text = managers.localization.text(managers.localization, managers.localization)
	yes_button.callback_func = function ()
		slot2 = managers.vote

		if managers.vote.option_vote_restart(slot1) then
			slot2 = managers.vote

			managers.vote.restart(slot1)
		else
			slot2 = managers.vote

			managers.vote.restart_auto(slot1)
		end

		slot2 = managers.raid_menu

		managers.raid_menu.on_escape(slot1)

		return 
	end
	local no_button = {}
	slot8 = "dialog_no"
	no_button.text = managers.localization.text(managers.localization, managers.localization)
	no_button.class = RaidGUIControlButtonShortSecondary
	no_button.cancel_button = true
	dialog_data.button_list = {
		yes_button,
		no_button
	}
	slot8 = dialog_data

	managers.system_menu.show(managers.localization, managers.system_menu)

	return 
end
RaidMenuCallbackHandler.singleplayer_restart_mission = function (self, item)
	slot5 = {
		yes_func = RaidMenuCallbackHandler.singleplayer_restart_restart_mission_yes
	}

	managers.menu.show_restart_mission_dialog(slot3, managers.menu)

	return 
end
RaidMenuCallbackHandler.singleplayer_restart_restart_mission_yes = function (self, item)
	slot5 = false

	Application.set_pause(slot3, Application)

	slot4 = managers.game_play_central

	managers.game_play_central.restart_the_mission(slot3)

	return 
end
RaidMenuCallbackHandler.singleplayer_restart_game_to_camp = function (self, item)
	slot5 = {
		yes_func = RaidMenuCallbackHandler.singleplayer_restart_game_to_camp_yes
	}

	managers.menu.show_return_to_camp_dialog(slot3, managers.menu)

	return 
end
RaidMenuCallbackHandler.singleplayer_restart_game_to_camp_yes = function (self, item)
	slot5 = false

	Application.set_pause(slot3, Application)

	slot4 = managers.game_play_central

	managers.game_play_central.restart_the_game(slot3)

	return 
end
RaidMenuCallbackHandler.quit_game = function (self)
	slot3 = self
	slot7 = "dialog_are_you_sure_you_want_to_quit"

	self._quit_game(slot2, managers.localization.text(slot5, managers.localization))

	return 
end
RaidMenuCallbackHandler.quit_game_pause_menu = function (self)
	slot3 = self
	slot7 = "dialog_are_you_sure_you_want_to_quit_pause_menu"

	self._quit_game(slot2, managers.localization.text(slot5, managers.localization))

	return 
end
RaidMenuCallbackHandler._quit_game = function (self, dialog_text)
	local dialog_data = {}
	slot6 = "dialog_warning_title"
	dialog_data.title = managers.localization.text(slot4, managers.localization)
	dialog_data.text = dialog_text
	local yes_button = {}
	slot7 = "dialog_yes"
	yes_button.text = managers.localization.text(managers.localization, managers.localization)
	slot8 = "_dialog_quit_yes"
	yes_button.callback_func = callback(managers.localization, self, self)
	local no_button = {}
	slot8 = "dialog_no"
	no_button.text = managers.localization.text(self, managers.localization)
	slot9 = "_dialog_quit_no"
	no_button.callback_func = callback(self, self, self)
	no_button.class = RaidGUIControlButtonShortSecondary
	no_button.cancel_button = true
	dialog_data.button_list = {
		yes_button,
		no_button
	}
	slot8 = dialog_data

	managers.system_menu.show(self, managers.system_menu)

	return 
end
RaidMenuCallbackHandler._dialog_quit_yes = function (self)
	slot3 = self

	self._dialog_save_progress_backup_no(slot2)

	return 
end
RaidMenuCallbackHandler._dialog_save_progress_backup_no = function (self)
	slot3 = setup

	setup.quit(slot2)

	return 
end
RaidMenuCallbackHandler._dialog_quit_no = function (self)
	return 
end
RaidMenuCallbackHandler.raid_play_online = function (self)
	Global.game_settings.single_player = false
	Global.exe_argument_level = "streaming_level"
	Global.exe_argument_difficulty = Global.exe_argument_difficulty or Global.DEFAULT_DIFFICULTY
	slot4 = {
		job_id = Global.exe_argument_level,
		difficulty = Global.exe_argument_difficulty
	}

	MenuCallbackHandler.start_job(Global.exe_argument_difficulty or Global.DEFAULT_DIFFICULTY, MenuCallbackHandler)

	return 
end
RaidMenuCallbackHandler.raid_play_offline = function (self)
	Global.exe_argument_level = "streaming_level"
	Global.exe_argument_difficulty = Global.exe_argument_difficulty or Global.DEFAULT_DIFFICULTY
	local mission = nil
	slot4 = managers.raid_job

	if managers.raid_job.played_tutorial(slot3) then
		slot5 = RaidJobManager.CAMP_ID
		mission = tweak_data.operations.mission_data(slot3, tweak_data.operations)
	else
		slot5 = RaidJobManager.TUTORIAL_ID
		mission = tweak_data.operations.mission_data(slot3, tweak_data.operations)
	end

	local data = {
		background = mission.loading.image,
		loading_text = mission.loading.text,
		mission = mission
	}
	slot6 = data
	slot11 = "_do_play_offline"

	managers.menu.show_loading_screen(slot4, managers.menu, callback(slot8, self, self))

	return 
end
RaidMenuCallbackHandler._do_play_offline = function (self)
	slot3 = MenuCallbackHandler

	MenuCallbackHandler.play_single_player(slot2)

	slot4 = {
		job_id = Global.exe_argument_level,
		difficulty = Global.exe_argument_difficulty
	}

	MenuCallbackHandler.start_single_player_job(slot2, MenuCallbackHandler)

	return 
end
RaidMenuCallbackHandler.raid_play_tutorial = function (self)
	slot4 = "[RaidMenuCallbackHandler][raid_play_tutorial] Starting tutorial"

	Application.debug(slot2, Application)

	slot3 = managers.raid_job

	managers.raid_job.set_temp_play_flag(slot2)

	slot3 = self

	self.raid_play_offline(slot2)

	return 
end
MenuCallbackHandler.on_play_clicked = function (self)
	slot4 = "mission_selection_menu"

	managers.raid_menu.open_menu(slot2, managers.raid_menu)

	return 
end
MenuCallbackHandler.on_multiplayer_clicked = function (self)
	slot4 = "mission_join_menu"

	managers.raid_menu.open_menu(slot2, managers.raid_menu)

	return 
end
MenuCallbackHandler.on_mission_selection_clicked = function (self)
	slot3 = managers.progression

	if managers.progression.have_pending_missions_to_unlock(slot2) then
		slot4 = "mission_unlock_menu"

		managers.raid_menu.open_menu(slot2, managers.raid_menu)
	else
		slot4 = "mission_selection_menu"

		managers.raid_menu.open_menu(slot2, managers.raid_menu)
	end

	return 
end
MenuCallbackHandler.on_select_character_profile_clicked = function (self)
	slot4 = "profile_selection_menu"

	managers.raid_menu.open_menu(slot2, managers.raid_menu)

	return 
end
MenuCallbackHandler.on_select_character_customization_clicked = function (self)
	slot4 = "character_customization_menu"

	managers.raid_menu.open_menu(slot2, managers.raid_menu)

	return 
end
MenuCallbackHandler.on_select_challenge_cards_clicked = function (self)
	slot4 = "challenge_cards_menu"

	managers.raid_menu.open_menu(slot2, managers.raid_menu)

	return 
end
MenuCallbackHandler.on_select_challenge_cards_view_clicked = function (self)
	slot4 = "challenge_cards_view_menu"

	managers.raid_menu.open_menu(slot2, managers.raid_menu)

	return 
end
MenuCallbackHandler.on_select_character_skills_clicked = function (self)
	slot4 = "raid_menu_xp"

	managers.raid_menu.open_menu(slot2, managers.raid_menu)

	return 
end
MenuCallbackHandler.choice_choose_raid_permission = function (self, item)
	slot4 = item
	local value = item.value(slot3)
	Global.game_settings.permission = value

	return 
end
MenuCallbackHandler.choice_choose_raid_mission_zone = function (self, item)
	slot4 = item
	local value = item.value(slot3)
	Global.game_settings.raid_zone = value

	if managers.menu_component._raid_menu_mission_selection_gui then
		slot5 = managers.menu_component._raid_menu_mission_selection_gui

		managers.menu_component._raid_menu_mission_selection_gui._show_jobs(slot4)
	end

	return 
end
MenuCallbackHandler.is_in_camp = function (self)
	slot3 = managers.raid_job

	return managers.raid_job.is_camp_loaded(slot2)
end
MenuCallbackHandler.is_not_in_camp = function (self)
	slot3 = managers.raid_job

	return not managers.raid_job.is_camp_loaded(slot2)
end
RaidMenuCallbackHandler.invite_friend = function ()
	slot3 = "[RaidMenuCallbackHandler:invite_friend]"

	Application.trace(slot1, Application)

	return 
end
RaidMenuCallbackHandler.view_gamer_card = function (self, xuid)

	-- Decompilation error in this vicinity:
	slot5 = "[RaidMenuCallbackHandler:view_gamer_card] xuid:"
	slot8 = xuid

	Application.trace(slot3, Application, tostring(slot7))

	slot5 = "XB1"

	return 
end
MenuCallbackHandler.set_camera_sensitivity_x_raid = function (self, value)
	slot6 = value

	managers.user.set_setting(slot3, managers.user, "camera_sensitivity_x")

	return 
end
MenuCallbackHandler.set_camera_sensitivity_y_raid = function (self, value)
	slot6 = value

	managers.user.set_setting(slot3, managers.user, "camera_sensitivity_y")

	return 
end
MenuCallbackHandler.set_camera_zoom_sensitivity_x_raid = function (self, value)
	slot6 = value

	managers.user.set_setting(slot3, managers.user, "camera_zoom_sensitivity_x")

	return 
end
MenuCallbackHandler.set_camera_zoom_sensitivity_y_raid = function (self, value)
	slot6 = value

	managers.user.set_setting(slot3, managers.user, "camera_zoom_sensitivity_y")

	return 
end
MenuCallbackHandler.toggle_zoom_sensitivity_raid = function (self, value)
	slot6 = value

	managers.user.set_setting(slot3, managers.user, "enable_camera_zoom_sensitivity")

	return 
end
MenuCallbackHandler.invert_camera_vertically_raid = function (self, value)
	slot6 = value

	managers.user.set_setting(slot3, managers.user, "invert_camera_y")

	return 
end
MenuCallbackHandler.hold_to_steelsight_raid = function (self, value)
	slot6 = value

	managers.user.set_setting(slot3, managers.user, "hold_to_steelsight")

	return 
end
MenuCallbackHandler.hold_to_run_raid = function (self, value)
	slot6 = value

	managers.user.set_setting(slot3, managers.user, "hold_to_run")

	return 
end
MenuCallbackHandler.hold_to_duck_raid = function (self, value)
	slot6 = value

	managers.user.set_setting(slot3, managers.user, "hold_to_duck")

	return 
end
MenuCallbackHandler.toggle_rumble = function (self, value)
	slot6 = value

	managers.user.set_setting(slot3, managers.user, "rumble")

	return 
end
MenuCallbackHandler.toggle_aim_assist = function (self, value)
	slot6 = value

	managers.user.set_setting(slot3, managers.user, "aim_assist")

	return 
end
MenuCallbackHandler.toggle_sticky_aim = function (self, value)
	slot6 = value

	managers.user.set_setting(slot3, managers.user, "sticky_aim")

	return 
end
MenuCallbackHandler.toggle_southpaw = function (self, value)
	slot6 = value

	managers.user.set_setting(slot3, managers.user, "southpaw")

	return 
end
MenuCallbackHandler.toggle_net_throttling_raid = function (self, value)
	slot6 = value

	managers.user.set_setting(slot3, managers.user, "net_packet_throttling")

	return 
end
MenuCallbackHandler.toggle_net_forwarding_raid = function (self, value)
	slot6 = value

	managers.user.set_setting(slot3, managers.user, "net_forwarding")

	return 
end
MenuCallbackHandler.toggle_net_use_compression_raid = function (self, value)
	slot6 = value

	managers.user.set_setting(slot3, managers.user, "net_use_compression")

	return 
end
MenuCallbackHandler.set_master_volume_raid = function (self, volume)
	slot5 = "master_volume"
	local old_volume = managers.user.get_setting(slot3, managers.user)
	slot7 = volume

	managers.user.set_setting(managers.user, managers.user, "master_volume")

	slot6 = volume / 100

	managers.video.volume_changed(managers.user, managers.video)

	if old_volume < volume then
		slot6 = "slider_increase"

		self._sound_source.post_event(slot4, self._sound_source)
	elseif volume < old_volume then
		slot6 = "slider_decrease"

		self._sound_source.post_event(slot4, self._sound_source)
	end

	return 
end
MenuCallbackHandler.set_music_volume_raid = function (self, volume)
	slot5 = "music_volume"
	local old_volume = managers.user.get_setting(slot3, managers.user)
	slot7 = volume

	managers.user.set_setting(managers.user, managers.user, "music_volume")

	if old_volume < volume then
		slot6 = "slider_increase"

		self._sound_source.post_event(slot4, self._sound_source)
	elseif volume < old_volume then
		slot6 = "slider_decrease"

		self._sound_source.post_event(slot4, self._sound_source)
	end

	return 
end
MenuCallbackHandler.set_sfx_volume_raid = function (self, volume)
	slot5 = "sfx_volume"
	local old_volume = managers.user.get_setting(slot3, managers.user)
	slot7 = volume

	managers.user.set_setting(managers.user, managers.user, "sfx_volume")

	if old_volume < volume then
		slot6 = "slider_increase"

		self._sound_source.post_event(slot4, self._sound_source)
	elseif volume < old_volume then
		slot6 = "slider_decrease"

		self._sound_source.post_event(slot4, self._sound_source)
	end

	return 
end
MenuCallbackHandler.set_voice_volume_raid = function (self, volume)
	slot5 = "voice_volume"
	local old_volume = managers.user.get_setting(slot3, managers.user)
	slot7 = volume / 100

	managers.user.set_setting(managers.user, managers.user, "voice_volume")

	if old_volume < volume then
		slot6 = "slider_increase"

		self._sound_source.post_event(slot4, self._sound_source)
	elseif volume < old_volume then
		slot6 = "slider_decrease"

		self._sound_source.post_event(slot4, self._sound_source)
	end

	return 
end
MenuCallbackHandler.set_voice_over_volume_raid = function (self, volume)
	slot5 = "voice_over_volume"
	local old_volume = managers.user.get_setting(slot3, managers.user)
	slot7 = volume

	managers.user.set_setting(managers.user, managers.user, "voice_over_volume")

	if old_volume < volume then
		slot6 = "slider_increase"

		self._sound_source.post_event(slot4, self._sound_source)
	elseif volume < old_volume then
		slot6 = "slider_decrease"

		self._sound_source.post_event(slot4, self._sound_source)
	end

	return 
end
MenuCallbackHandler.toggle_voicechat_raid = function (self, value)
	slot6 = value

	managers.user.set_setting(slot3, managers.user, "voice_chat")

	return 
end
MenuCallbackHandler.toggle_push_to_talk_raid = function (self, value)
	slot6 = value

	managers.user.set_setting(slot3, managers.user, "push_to_talk")

	return 
end
MenuCallbackHandler.change_resolution_raid = function (self, resolution, no_dialog)
	local old_resolution = RenderSettings.resolution

	if resolution == old_resolution then
		return 
	end

	slot7 = resolution

	managers.viewport.set_resolution(slot5, managers.viewport)

	slot7 = resolution.x / resolution.y

	managers.viewport.set_aspect_ratio(slot5, managers.viewport)

	slot7 = resolution.x / resolution.y

	managers.worldcamera.scale_worldcamera_fov(slot5, managers.worldcamera)

	RenderSettings.resolution = resolution

	Application.apply_render_settings(slot5)

	local blackborder_workspace = MenuRenderer.get_blackborder_workspace_instance()
	slot15 = resolution.y

	blackborder_workspace.set_screen(Application, blackborder_workspace, resolution.x, resolution.y, 0, 0, resolution.x, resolution.y, resolution.x)

	if not no_dialog then
		function slot8()
			slot3 = old_resolution

			managers.viewport.set_resolution(slot1, managers.viewport)

			slot3 = old_resolution.x / old_resolution.y

			managers.viewport.set_aspect_ratio(slot1, managers.viewport)

			slot3 = old_resolution.x / old_resolution.y

			managers.worldcamera.scale_worldcamera_fov(slot1, managers.worldcamera)

			local blackborder_workspace = MenuRenderer.get_blackborder_workspace_instance()
			slot11 = old_resolution.y

			blackborder_workspace.set_screen(managers.worldcamera, blackborder_workspace, old_resolution.x, old_resolution.y, 0, 0, old_resolution.x, old_resolution.y, old_resolution.x)

			return 
		end

		managers.menu.show_accept_gfx_settings_dialog(slot6, managers.menu)
	end

	slot7 = self

	self._refresh_brightness(slot6)

	return 
end
MenuCallbackHandler.set_resolution_default_raid_no_dialog = function (self, resolution)
	local old_resolution = RenderSettings.resolution

	if resolution == old_resolution then
		return 
	end

	slot6 = resolution

	managers.viewport.set_resolution(slot4, managers.viewport)

	slot6 = resolution.x / resolution.y

	managers.viewport.set_aspect_ratio(slot4, managers.viewport)

	slot6 = resolution.x / resolution.y

	managers.worldcamera.scale_worldcamera_fov(slot4, managers.worldcamera)

	local blackborder_workspace = MenuRenderer.get_blackborder_workspace_instance()
	slot14 = resolution.y

	blackborder_workspace.set_screen(managers.worldcamera, blackborder_workspace, resolution.x, resolution.y, 0, 0, resolution.x, resolution.y, resolution.x)

	return 
end
MenuCallbackHandler.toggle_fullscreen_raid = function (self, fullscreen, current_fullscreen, borderless, current_borderless, callback)
	if fullscreen then
		slot8 = managers.viewport

		if managers.viewport.is_fullscreen(slot7) then
			return 
		end
	end

	if fullscreen then
		slot8 = managers.mouse_pointer

		managers.mouse_pointer.acquire_input(slot7)
	else
		slot8 = managers.mouse_pointer

		managers.mouse_pointer.unacquire_input(slot7)
	end

	slot9 = fullscreen

	managers.viewport.set_fullscreen(slot7, managers.viewport)

	slot9 = borderless

	managers.viewport.set_borderless(slot7, managers.viewport)

	if borderless then
		local monitor_res = Application.monitor_resolution(slot7)
		slot14 = RenderSettings.resolution.z
		slot11 = true

		self.change_resolution_raid(Application, self, Vector3(slot11, monitor_res.x, monitor_res.y))
	end

	function slot9()
		slot3 = current_fullscreen

		managers.viewport.set_fullscreen(slot1, managers.viewport)

		slot3 = current_borderless

		managers.viewport.set_borderless(slot1, managers.viewport)

		slot2 = managers.viewport

		if managers.viewport.is_fullscreen(slot1) then
			slot2 = managers.mouse_pointer

			managers.mouse_pointer.acquire_input(slot1)
		else
			slot2 = managers.mouse_pointer

			managers.mouse_pointer.unacquire_input(slot1)
		end

		slot2 = self

		self.refresh_node(slot1)
		callback()

		return 
	end

	managers.menu.show_accept_gfx_settings_dialog(slot7, managers.menu)

	slot8 = self

	self.refresh_node(slot7)

	slot8 = self

	self._refresh_brightness(slot7)

	return 
end
MenuCallbackHandler.set_fullscreen_default_raid_no_dialog = function (self)
	local fullscreen = true
	slot4 = managers.viewport

	if managers.viewport.is_fullscreen(slot3) == fullscreen then
		return 
	end

	if fullscreen then
		slot4 = managers.mouse_pointer

		managers.mouse_pointer.acquire_input(slot3)
	else
		slot4 = managers.mouse_pointer

		managers.mouse_pointer.unacquire_input(slot3)
	end

	slot5 = fullscreen

	managers.viewport.set_fullscreen(slot3, managers.viewport)

	slot4 = self

	self.refresh_node(slot3)

	slot4 = self

	self._refresh_brightness(slot3)

	return 
end
MenuCallbackHandler.toggle_subtitle_raid = function (self, value)
	slot6 = value

	managers.user.set_setting(slot3, managers.user, "subtitle")

	return 
end
MenuCallbackHandler.toggle_hit_indicator_raid = function (self, value)
	slot6 = value

	managers.user.set_setting(slot3, managers.user, "hit_indicator")

	return 
end
MenuCallbackHandler.toggle_objective_reminder_raid = function (self, value)
	slot6 = value

	managers.user.set_setting(slot3, managers.user, "objective_reminder")

	return 
end
MenuCallbackHandler.toggle_headbob_raid = function (self, value)
	slot6 = value

	managers.user.set_setting(slot3, managers.user, "use_headbob")

	return 
end
MenuCallbackHandler.set_effect_quality_raid = function (self, value)
	slot6 = value

	managers.user.set_setting(slot3, managers.user, "effect_quality")

	return 
end
MenuCallbackHandler.set_brightness_raid = function (self, value)
	slot6 = value

	managers.user.set_setting(slot3, managers.user, "brightness")

	return 
end
MenuCallbackHandler.toggle_dof_setting_raid = function (self, value)
	slot6 = (value and "standard") or "none"

	managers.user.set_setting(slot3, managers.user, "dof_setting")

	return 
end
MenuCallbackHandler.toggle_ssao_setting_raid = function (self, value)
	slot6 = (value and "standard") or "none"

	managers.user.set_setting(slot3, managers.user, "ssao_setting")

	return 
end
MenuCallbackHandler.set_use_parallax_raid = function (self, value)
	slot6 = value

	managers.user.set_setting(slot3, managers.user, "use_parallax")

	return 
end
MenuCallbackHandler.toggle_motion_blur_setting_raid = function (self, value)
	slot6 = (value and "standard") or "none"

	managers.user.set_setting(slot3, managers.user, "motion_blur_setting")

	return 
end
MenuCallbackHandler.toggle_volumetric_light_scattering_setting_raid = function (self, value)
	slot6 = (value and "standard") or "none"

	managers.user.set_setting(slot3, managers.user, "vls_setting")

	return 
end
MenuCallbackHandler.toggle_gpu_flush_setting_raid = function (self, value)
	slot6 = value

	managers.user.set_setting(slot3, managers.user, "flush_gpu_command_queue")

	return 
end
MenuCallbackHandler.toggle_lightfx_raid = function (self, value)
	slot6 = value

	managers.user.set_setting(slot3, managers.user, "use_lightfx")

	return 
end
MenuCallbackHandler.toggle_vsync_raid = function (self, vsync_value, buffer_count)
	slot6 = vsync_value

	managers.viewport.set_vsync(slot4, managers.viewport)

	slot6 = buffer_count

	managers.viewport.set_buffer_count(slot4, managers.viewport)

	slot5 = self

	self.apply_and_save_render_settings(slot4)

	slot5 = self

	self._refresh_brightness(slot4)

	return 
end
MenuCallbackHandler.set_fov_multiplier_raid = function (self, value)
	slot6 = value

	managers.user.set_setting(slot3, managers.user, "fov_multiplier")

	slot6 = managers.player

	if alive(managers.player.player_unit("fov_multiplier")) then
		slot4 = managers.player
		slot4 = managers.player.player_unit(slot3)
		slot4 = managers.player.player_unit(slot3).movement(slot3)
		slot4 = managers.player.player_unit(slot3).movement(slot3).current_state(slot3)

		managers.player.player_unit(slot3).movement(slot3).current_state(slot3).update_fov_external(slot3)
	end

	return 
end
MenuCallbackHandler.set_detail_distance_raid = function (self, detail_distance)
	managers.user.set_setting(slot3, managers.user, "detail_distance")

	local min_maps = 0.01
	local max_maps = 0.04
	local maps = min_maps * detail_distance + max_maps * (1 - detail_distance)
	slot8 = maps

	World.set_min_allowed_projected_size(detail_distance, World)

	return 
end
MenuCallbackHandler.choice_choose_anti_alias_raid = function (self, value)
	slot6 = value

	managers.user.set_setting(slot3, managers.user, "AA_setting")

	return 
end
MenuCallbackHandler.choice_choose_texture_quality_raid = function (self, value)
	RenderSettings.texture_quality_default = value
	slot4 = self

	self.apply_and_save_render_settings(slot3)

	slot4 = self

	self._refresh_brightness(slot3)

	return 
end
MenuCallbackHandler.choice_choose_shadow_quality_raid = function (self, value)
	RenderSettings.shadow_quality_default = value
	slot4 = self

	self.apply_and_save_render_settings(slot3)

	slot4 = self

	self._refresh_brightness(slot3)

	return 
end
MenuCallbackHandler.choice_choose_anisotropic_raid = function (self, value)
	RenderSettings.max_anisotropy = value
	slot4 = self

	self.apply_and_save_render_settings(slot3)

	slot4 = self

	self._refresh_brightness(slot3)

	return 
end
MenuCallbackHandler.choice_choose_anim_lod_raid = function (self, value)
	slot6 = value

	managers.user.set_setting(slot3, managers.user, "video_animation_lod")

	return 
end
MenuCallbackHandler.choice_fps_cap_raid = function (self, value)
	slot5 = value

	setup.set_fps_cap(slot3, setup)

	slot6 = value

	managers.user.set_setting(slot3, managers.user, "fps_cap")

	return 
end
MenuCallbackHandler.choice_max_streaming_chunk_raid = function (self, value)
	slot6 = value

	managers.user.set_setting(slot3, managers.user, "max_streaming_chunk")

	return 
end
MenuCallbackHandler.choice_choose_cb_mode_raid = function (self, value)
	slot6 = value

	managers.user.set_setting(slot3, managers.user, "colorblind_setting")

	return 
end
MenuCallbackHandler.set_default_options_raid = function (self, node_component)
	local params = {}
	slot6 = "dialog_default_options_message"
	params.text = managers.localization.text(slot4, managers.localization)
	params.callback = function ()
		slot2 = managers.user

		managers.user.reset_setting_map(slot1)

		slot2 = self

		self._reset_mainmusic(slot1)

		slot2 = node_component

		node_component._load_controls_values(slot1)

		slot2 = node_component

		node_component._load_video_values(slot1)

		slot2 = node_component

		node_component._load_advanced_video_values(slot1)

		slot2 = node_component

		node_component._load_sound_values(slot1)

		slot2 = node_component

		node_component._load_network_values(slot1)

		return 
	end
	slot6 = params

	managers.menu.show_default_option_dialog(slot4, managers.menu)

	return 
end
MenuCallbackHandler.set_default_control_options_raid = function (self, node_component)
	local params = {}
	slot6 = "dialog_default_controls_options_message"
	params.text = managers.localization.text(slot4, managers.localization)
	params.callback = function ()
		slot2 = managers.user

		managers.user.reset_controls_setting_map(slot1)

		slot2 = node_component

		node_component._load_controls_values(slot1)

		return 
	end
	slot6 = params

	managers.menu.show_default_option_dialog(slot4, managers.menu)

	return 
end
MenuCallbackHandler.set_default_keybinds_raid = function (self, node_component)
	local params = {}
	slot6 = "dialog_use_default_keys_message"
	params.text = managers.localization.text(slot4, managers.localization)
	params.callback = function ()
		slot3 = "settings/controller_settings"

		managers.controller.load_settings(slot1, managers.controller)

		slot4 = MenuCustomizeControllerCreator.CONTROLS_INFO

		managers.controller.clear_user_mod(slot1, managers.controller, "normal")

		slot2 = node_component

		node_component.refresh_keybinds(slot1)

		return 
	end
	slot6 = params

	managers.menu.show_default_option_dialog(slot4, managers.menu)

	return 
end
MenuCallbackHandler.set_default_video_options_raid = function (self, node_component, callback_function)
	local params = {}
	slot7 = "dialog_default_video_options_message"
	params.text = managers.localization.text(slot5, managers.localization)
	params.callback = function ()
		slot2 = managers.user

		managers.user.reset_video_setting_map(slot1)

		slot2 = node_component

		node_component._load_video_values(slot1)

		slot2 = node_component

		node_component._load_advanced_video_values(slot1)
		callback_function()

		return 
	end
	slot7 = params

	managers.menu.show_default_option_dialog(slot5, managers.menu)

	return 
end
MenuCallbackHandler.set_default_sound_options_raid = function (self, node_component)
	local params = {}
	slot6 = "dialog_default_sound_options_message"
	params.text = managers.localization.text(slot4, managers.localization)
	params.callback = function ()
		slot2 = managers.user

		managers.user.reset_sound_setting_map(slot1)

		slot2 = self

		self._reset_mainmusic(slot1)

		slot2 = node_component

		node_component._load_sound_values(slot1)

		return 
	end
	slot6 = params

	managers.menu.show_default_option_dialog(slot4, managers.menu)

	return 
end
MenuCallbackHandler.set_default_network_options_raid = function (self, node_component)
	local params = {}
	slot6 = "dialog_default_network_options_message"
	params.text = managers.localization.text(slot4, managers.localization)
	params.callback = function ()
		slot2 = managers.user

		managers.user.reset_network_setting_map(slot1)

		slot2 = node_component

		node_component._load_network_values(slot1)

		return 
	end
	slot6 = params

	managers.menu.show_default_option_dialog(slot4, managers.menu)

	return 
end

return 
