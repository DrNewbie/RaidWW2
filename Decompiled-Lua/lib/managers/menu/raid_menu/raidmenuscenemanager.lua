-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
RaidMenuSceneManager = RaidMenuSceneManager or class()
RaidMenuSceneManager.default_camp_world = "levels/tests/menu_test"
RaidMenuSceneManager.CAMERA_TRANSITION_DURATION = 2.5
RaidMenuSceneManager.menus = {
	menu_main = {}
}
RaidMenuSceneManager.menus.menu_main.name = "menu_main"
RaidMenuSceneManager.menus.menu_main.camera = nil
RaidMenuSceneManager.menus.menu_main.keep_state = true
RaidMenuSceneManager.menus.raid_main_menu = {
	name = "raid_main_menu",
	camera = nil
}
RaidMenuSceneManager.menus.mission_selection_menu = {
	name = "mission_selection_menu",
	camera = nil
}
RaidMenuSceneManager.menus.mission_unlock_menu = {
	name = "mission_unlock_menu",
	camera = nil
}
RaidMenuSceneManager.menus.mission_join_menu = {
	name = "mission_join_menu",
	camera = nil
}
RaidMenuSceneManager.menus.profile_selection_menu = {
	name = "profile_selection_menu",
	camera = "character_menu_camera"
}
RaidMenuSceneManager.menus.profile_creation_menu = {
	name = "profile_creation_menu",
	camera = "character_menu_camera"
}
RaidMenuSceneManager.menus.character_customization_menu = {
	name = "character_customization_menu",
	camera = "character_menu_camera"
}
RaidMenuSceneManager.menus.challenge_cards_menu = {
	name = "challenge_cards_menu",
	camera = nil
}
RaidMenuSceneManager.menus.challenge_cards_view_menu = {
	name = "challenge_cards_view_menu",
	camera = nil
}
RaidMenuSceneManager.menus.ready_up_menu = {
	name = "ready_up_menu",
	camera = "ready_up_camera",
	keep_state = true
}
RaidMenuSceneManager.menus.raid_options_menu = {
	name = "raid_options_menu",
	camera = nil,
	keep_state = true
}
RaidMenuSceneManager.menus.raid_menu_options_controls = {
	name = "raid_menu_options_controls",
	camera = nil,
	keep_state = true
}
RaidMenuSceneManager.menus.raid_menu_options_controls_keybinds = {
	name = "raid_menu_options_controls_keybinds",
	camera = nil,
	keep_state = true
}
RaidMenuSceneManager.menus.raid_menu_options_controller_mapping = {
	name = "raid_menu_options_controller_mapping",
	camera = nil,
	keep_state = true
}
RaidMenuSceneManager.menus.raid_menu_options_video = {
	name = "raid_menu_options_video",
	camera = nil,
	keep_state = true
}
RaidMenuSceneManager.menus.raid_menu_options_video_advanced = {
	name = "raid_menu_options_video_advanced",
	camera = nil,
	keep_state = true
}
RaidMenuSceneManager.menus.raid_menu_options_sound = {
	name = "raid_menu_options_sound",
	camera = nil,
	keep_state = true
}
RaidMenuSceneManager.menus.raid_menu_options_network = {
	name = "raid_menu_options_network",
	camera = nil,
	keep_state = true
}
RaidMenuSceneManager.menus.raid_menu_loot_screen = {
	name = "raid_menu_loot_screen",
	camera = nil,
	keep_state = true
}
RaidMenuSceneManager.menus.raid_menu_greed_loot_screen = {
	name = "raid_menu_greed_loot_screen",
	camera = nil,
	keep_state = true
}
RaidMenuSceneManager.menus.raid_menu_xp = {
	name = "raid_menu_xp",
	camera = nil
}
RaidMenuSceneManager.menus.raid_menu_post_game_breakdown = {
	name = "raid_menu_post_game_breakdown",
	camera = nil,
	keep_state = true
}
RaidMenuSceneManager.menus.raid_menu_special_honors = {
	name = "raid_menu_special_honors",
	camera = nil,
	keep_state = true
}
RaidMenuSceneManager.menus.raid_menu_weapon_select = {
	name = "raid_menu_weapon_select",
	camera = "weapons_menu_camera"
}
RaidMenuSceneManager.menus.raid_credits_menu = {
	name = "raid_credits_menu",
	camera = nil
}
RaidMenuSceneManager.menus.gold_asset_store_menu = {
	name = "gold_asset_store_menu",
	camera = "gold_test"
}
RaidMenuSceneManager.menus.intel_menu = {
	name = "intel_menu"
}
RaidMenuSceneManager.menus.comic_book_menu = {
	name = "comic_book_menu"
}

function _get_background_image_instance()
	if not Global.background_image then
		slot3 = RaidGUIControlBackgroundImage
		Global.menu_background_image = RaidGUIControlBackgroundImage.new(slot2)
	end

	return Global.menu_background_image
end

slot2 = Application
local is_editor = Application.editor("comic_book_menu")
function RaidMenuSceneManager:init()
	self._menu_stack = {}
	self._character_sync_player_data = {}
	self._close_menu_allowed = true
	self._component_on_escape_callback = nil
	self._background_image = _get_background_image_instance()
	slot3 = Application
	self._pause_menu_enabled = Application.editor(slot2)
	slot3 = self

	self.hide_background(slot2)

	return 
end
function RaidMenuSceneManager:is_offline_mode()
	local callback_handler = RaidMenuCallbackHandler.new(slot2)
	slot4 = callback_handler

	return callback_handler.is_singleplayer(RaidMenuCallbackHandler)
end
function RaidMenuSceneManager:register_on_escape_callback(callback_ref)
	self._component_on_escape_callback = callback_ref

	return 
end
function RaidMenuSceneManager:show_background()
	slot3 = managers.menu

	managers.menu.hide_loading_screen(slot2)

	slot4 = true

	self._background_image.set_visible(slot2, self._background_image)

	return 
end
function RaidMenuSceneManager:hide_background()
	slot4 = false

	self._background_image.set_visible(slot2, self._background_image)

	return 
end
function RaidMenuSceneManager:clean_up_background()
	slot3 = self

	self.close_all_menus(slot2)

	if managers.hud then
		slot3 = managers.hud

		managers.hud.set_enabled(slot2)
	end

	return 
end
function RaidMenuSceneManager:set_pause_menu_enabled(enabled)
	self._pause_menu_enabled = enabled

	return 
end
function RaidMenuSceneManager:is_any_menu_open()
	local menu_open = self._menu_stack and 0 < #self._menu_stack

	return menu_open
end
function RaidMenuSceneManager:ct_open_menus()
	if not self._menu_stack then
		return 0
	end

	return #self._menu_stack
end
function RaidMenuSceneManager:open_menu(name, dont_add_on_stack)
	if name == "raid_main_menu" and not self._pause_menu_enabled then
		return 
	end

	local menu = RaidMenuSceneManager.menus[name]

	if not menu then
		slot8 = name

		Application.error(slot5, Application, "[RaidMenuSceneManager:open_menu] Not able to open menu menu, it does not exist: ")

		return false
	end

	slot7 = true

	managers.raid_menu.close_menu(slot5, managers.raid_menu)

	if #self._menu_stack == 0 and Global.game_settings.single_player then
		slot7 = "pause_all_gameplay_sounds"

		managers.menu_component.post_event(slot5, managers.menu_component)
	end

	slot7 = menu

	self._start_menu_camera(slot5, self)

	if #self._menu_stack == 0 then
		slot7 = "bckg_fire"

		managers.hud.post_event(slot5, managers.hud)
	end

	slot6 = self

	self.show_background(slot5)

	if managers.hud then
		slot6 = managers.hud

		managers.hud.hide_stats_screen(slot5)
	end

	slot9 = dont_add_on_stack

	managers.menu.open_menu(slot5, managers.menu, menu.name, nil)

	if not is_editor then
		slot6 = managers.viewport

		if not managers.viewport.is_fullscreen(slot5) then
			slot6 = managers.mouse_pointer

			managers.mouse_pointer.unacquire_input(slot5)
		end
	end

	return true
end
function RaidMenuSceneManager:close_all_menus()
	slot3 = managers.mouse_pointer

	managers.mouse_pointer.acquire_input(slot2)

	if self._menu_stack and 0 < #self._menu_stack then
		slot4 = "[RaidMenuSceneManager:close_all_menus] self._menu_stack "
		slot7 = self._menu_stack

		Application.trace(slot2, Application, inspect(slot6))

		for i = 1, #self._menu_stack, 1 do
			slot9 = self._menu_stack[i]

			Application.trace(slot6, Application, "[RaidMenuSceneManager:close_all_menus] self._menu_stack[ i ] ")

			slot8 = false

			self.close_menu(slot6, self)
		end
	end

	MenuRenderer._remove_blackborders()

	return 
end
function RaidMenuSceneManager:close_menu(dont_remove_from_stack)
	if not is_editor and #self._menu_stack == 1 and not dont_remove_from_stack then
		slot4 = managers.mouse_pointer

		managers.mouse_pointer.acquire_input(slot3)
	end

	slot4 = managers.menu

	managers.menu.close_menu(slot3)

	if not dont_remove_from_stack then
		local menu_stack_index = #self._menu_stack
		self._menu_stack[menu_stack_index] = nil
	end

	if #self._menu_stack == 0 then
		if Global.game_settings.single_player and not dont_remove_from_stack then
			slot5 = "resume_all_gameplay_sounds"

			managers.menu_component.post_event(slot3, managers.menu_component)
		end

		slot4 = managers.worldcamera

		managers.worldcamera.stop_sequences(slot3)

		if Global.game_settings.single_player then
			slot4 = game_state_machine

			if game_state_machine.current_state_name(slot3) ~= "menu_main" then
				slot5 = false

				Application.set_pause(slot3, Application)

				slot6 = 1

				SoundDevice.set_rtpc(slot3, SoundDevice, "ingame_sound")
			end
		end

		slot4 = game_state_machine

		if game_state_machine.current_state_name(slot3) == "ingame_menu" then
		end

		if managers.hud then
			slot4 = managers.hud

			managers.hud.set_enabled(slot3)
		end

		if managers.dialog then
			slot5 = false

			managers.dialog.set_paused(slot3, managers.dialog)

			slot5 = true

			managers.dialog.set_subtitles_shown(slot3, managers.dialog)
		end

		slot4 = self

		self._reinitialize_viewports(slot3)

		slot5 = "bckg_fire_stop"

		managers.hud.post_event(slot3, managers.hud)

		slot4 = self

		self.hide_background(slot3)
	end

	if managers.menu_component then
		slot4 = managers.menu_component

		managers.menu_component.close(slot3)
	end

	return 
end
function RaidMenuSceneManager:add_menu_name_on_stack(menu_name)
	slot5 = menu_name

	table.insert(slot3, self._menu_stack)

	if managers.hud then
		slot4 = managers.hud

		managers.hud.set_disabled(slot3)
	end

	if managers.dialog then
		slot4 = managers.raid_job

		if managers.raid_job.is_camp_loaded(slot3) then
			slot5 = true

			managers.dialog.set_paused(slot3, managers.dialog)
		else
			slot4 = managers.subtitle

			if managers.subtitle.is_showing_subtitles(slot3) then
				slot5 = false

				managers.dialog.set_subtitles_shown(slot3, managers.dialog)

				slot5 = false

				managers.subtitle.set_enabled(slot3, managers.subtitle)
			end
		end
	end

	return 
end
function RaidMenuSceneManager:remove_menu_name_from_stack(menu_name)
	for i = 1, #self._menu_stack, 1 do
		if self._menu_stack[i] == menu_name then
			slot9 = i

			table.remove(slot7, self._menu_stack)

			return 
		end
	end

	return 
end
function RaidMenuSceneManager:on_escape(flag_close_all_menus)
	if self._component_on_escape_callback then
		local handles = self._component_on_escape_callback()

		if handles then
			return 
		end
	end

	slot5 = "menu_main"

	if managers.menu.is_open(slot3, managers.menu) then
		slot4 = RaidMenuCallbackHandler
		local callback_handler = RaidMenuCallbackHandler.new(slot3)
		local params = {}
		slot8 = "_dialog_quit_yes"
		params.yes_func = callback(slot5, callback_handler, callback_handler)
		slot7 = params

		managers.menu.show_really_quit_the_game_dialog(slot5, managers.menu)

		return 
	end

	slot5 = "ready_up_menu"

	if managers.menu.is_open(slot3, managers.menu) then
		return 
	end

	slot4 = self

	if not self.get_close_menu_allowed(slot3) then
		slot4 = managers.menu

		managers.menu.show_no_active_characters(slot3)

		return 
	end

	slot4 = managers.menu
	local active_menu = managers.menu.active_menu(slot3)

	if not active_menu then
		if not flag_close_all_menus then
			slot6 = "[RaidMenuSceneManager:on_escape] Trying to close a menu while no menu active"

			Application.error(slot4, Application)
		end

		slot5 = managers.raid_menu

		managers.raid_menu.close_menu(slot4)

		return 
	end

	local active_menu = active_menu.name
	slot6 = managers.raid_menu

	managers.raid_menu.close_menu(slot5)

	if managers.queued_tasks then
		slot8 = self

		managers.queued_tasks.unqueue_all(slot5, managers.queued_tasks, nil)
	end

	if flag_close_all_menus then
		slot7 = "were here!"

		Application.trace(slot5, Application)

		slot6 = managers.worldcamera

		managers.worldcamera.stop_sequences(slot5)
	end

	if 0 < #self._menu_stack then
		slot8 = true

		self.open_menu(slot5, self, self._menu_stack[#self._menu_stack])
	end

	return 
end
function RaidMenuSceneManager:get_close_menu_allowed()
	return self._close_menu_allowed
end
function RaidMenuSceneManager:set_close_menu_allowed(flag)
	self._close_menu_allowed = flag

	return 
end
function RaidMenuSceneManager:_set_menu_state(menu)
	local camera_name = menu.camera

	if camera_name then
		slot6 = camera_name
	elseif not menu.keep_state then
		slot6 = "ingame_menu"

		game_state_machine.change_state_by_name(slot4, game_state_machine)
	end

	return 
end
function RaidMenuSceneManager:_reinitialize_viewports()
	local players = managers.player.players(slot2)
	slot4 = managers.subtitle

	if managers.subtitle.is_showing_subtitles(managers.player) then
		slot4 = managers.subtitle
		slot4 = managers.subtitle.presenter(slot3)

		managers.subtitle.presenter(slot3).show(slot3)
	end

	slot4 = players

	for k, player in ipairs(slot3) do
		slot9 = player
		slot9 = player.camera(slot8)
		local vp = player.camera(slot8).viewport(slot8)

		if vp then
			slot11 = true

			vp.set_active(slot9, vp)
		else
			slot14 = k
			slot11 = "No viewport for player " .. tostring(slot13)

			Application.error(slot9, Application)
		end
	end

	return 
end
function RaidMenuSceneManager:_start_menu_camera(menu)
	local camera_name = menu.camera

	if camera_name then
		slot6 = camera_name
	else
		slot5 = managers.worldcamera

		managers.worldcamera.stop_sequences(slot4)
	end

	return 
end
function RaidMenuSceneManager:get_active_control(control)
	return self._active_control
end
function RaidMenuSceneManager:set_active_control(control)
	self._active_control = control

	return 
end
function RaidMenuSceneManager:clear_active_control()
	self._active_control = nil

	return 
end
function RaidMenuSceneManager:save_sync_player_data()
	slot4 = managers.player._global.synced_ammo_info
	managers.raid_menu._character_sync_player_data.synced_ammo_info = clone(slot3)
	slot4 = managers.player._global.synced_bipod
	managers.raid_menu._character_sync_player_data.synced_bipod = clone(slot3)
	slot4 = managers.player._global.synced_bonuses
	managers.raid_menu._character_sync_player_data.synced_bonuses = clone(slot3)
	slot4 = managers.player._global.synced_cable_ties
	managers.raid_menu._character_sync_player_data.synced_cable_ties = clone(slot3)
	slot4 = managers.player._global.synced_carry
	managers.raid_menu._character_sync_player_data.synced_carry = clone(slot3)
	slot4 = managers.player._global.synced_deployables
	managers.raid_menu._character_sync_player_data.synced_deployables = clone(slot3)
	slot4 = managers.player._global.synced_drag_body
	managers.raid_menu._character_sync_player_data.synced_drag_body = clone(slot3)
	slot4 = managers.player._global.synced_equipment_possession
	managers.raid_menu._character_sync_player_data.synced_equipment_possession = clone(slot3)
	slot4 = managers.player._global.synced_grenades
	managers.raid_menu._character_sync_player_data.synced_grenades = clone(slot3)
	slot4 = managers.player._global.synced_team_upgrades
	managers.raid_menu._character_sync_player_data.synced_team_upgrades = clone(slot3)
	slot4 = managers.player._global.synced_turret
	managers.raid_menu._character_sync_player_data.synced_turret = clone(slot3)
	slot4 = managers.player._global.synced_vehicle_data
	managers.raid_menu._character_sync_player_data.synced_vehicle_data = clone(slot3)

	return 
end
function RaidMenuSceneManager:load_sync_player_data()
	slot4 = managers.raid_menu._character_sync_player_data.synced_ammo_info
	managers.player._global.synced_ammo_info = clone(slot3)
	slot4 = managers.raid_menu._character_sync_player_data.synced_bipod
	managers.player._global.synced_bipod = clone(slot3)
	slot4 = managers.raid_menu._character_sync_player_data.synced_bonuses
	managers.player._global.synced_bonuses = clone(slot3)
	slot4 = managers.raid_menu._character_sync_player_data.synced_cable_ties
	managers.player._global.synced_cable_ties = clone(slot3)
	slot4 = managers.raid_menu._character_sync_player_data.synced_carry
	managers.player._global.synced_carry = clone(slot3)
	slot4 = managers.raid_menu._character_sync_player_data.synced_deployables
	managers.player._global.synced_deployables = clone(slot3)
	slot4 = managers.raid_menu._character_sync_player_data.synced_drag_body
	managers.player._global.synced_drag_body = clone(slot3)
	slot4 = managers.raid_menu._character_sync_player_data.synced_equipment_possession
	managers.player._global.synced_equipment_possession = clone(slot3)
	slot4 = managers.raid_menu._character_sync_player_data.synced_grenades
	managers.player._global.synced_grenades = clone(slot3)
	slot4 = managers.raid_menu._character_sync_player_data.synced_team_upgrades
	managers.player._global.synced_team_upgrades = clone(slot3)
	slot4 = managers.raid_menu._character_sync_player_data.synced_turret
	managers.player._global.synced_turret = clone(slot3)
	slot4 = managers.raid_menu._character_sync_player_data.synced_vehicle_data
	managers.player._global.synced_vehicle_data = clone(slot3)

	return 
end
function RaidMenuSceneManager:first_login_check()
	slot4 = "[RaidMenuSceneManager:first_login_check]"

	Application.trace(slot2, Application)

	slot3 = managers.savefile

	if managers.savefile.get_active_characters_count(slot2) == 0 then
		slot4 = "profile_creation_menu"
		local success = managers.raid_menu.open_menu(slot2, managers.raid_menu)

		if success then
		end
	elseif managers.raid_job._tutorial_spawned then
		slot4 = "[RaidMenuSceneManager:first_login_check()] managers.global_state:fire_event(GlobalStateManager.EVENT_CHARACTER_CREATED)"

		Application.debug(slot2, Application)

		managers.global_state.fire_character_created_event = nil
		slot4 = GlobalStateManager.EVENT_CHARACTER_CREATED

		managers.global_state.fire_event(nil, managers.global_state)
	end

	slot4 = "game_played"

	managers.statistics.publish_custom_stat_to_steam(slot2, managers.statistics)

	return 
end
function RaidMenuSceneManager:system_start_raid()
	slot4 = "[RaidMenuSceneManager:system_start_raid]"

	Application.trace(slot2, Application)

	slot3 = managers.challenge_cards

	managers.challenge_cards.activate_challenge_card(slot2)

	slot3 = managers.player

	managers.player.replenish_player(slot2)

	slot3 = managers.player

	managers.player.replenish_player_weapons(slot2)

	return 
end
function RaidMenuSceneManager:set_current_legend_control(control)
	self._current_legend_control = control

	return 
end
function RaidMenuSceneManager:current_legend_control()
	return self._current_legend_control
end
function RaidMenuSceneManager:set_legend_labels(legend)
	if not self._current_legend_control then
		slot5 = "[RaidMenuSceneManager:set_legend_labels] Trying to set controller legend while no legend control is present"

		Application.error(slot3, Application)

		return 
	end

	slot5 = legend

	self._current_legend_control.set_labels(slot3, self._current_legend_control)

	return 
end
function RaidMenuSceneManager:toggle_fullscreen_raid()
	local is_fullscreen = managers.viewport.is_fullscreen(slot2)
	slot5 = not is_fullscreen

	managers.viewport.set_fullscreen(managers.viewport, managers.viewport)

	return 
end
function RaidMenuSceneManager:is_pc_controller()

	-- Decompilation error in this vicinity:
	slot3 = managers.controller

	return 
end
function RaidMenuSceneManager:refresh_footer_gold_amount()
	if not managers.menu_component._active_components.raid_menu_footer.component_object then
		return 
	end

	slot3 = managers.menu_component._active_components.raid_menu_footer.component_object

	managers.menu_component._active_components.raid_menu_footer.component_object.refresh_gold_amount(slot2)

	return 
end
function RaidMenuSceneManager:show_dialog_join_others_forbidden()
	local dialog_data = {}
	slot5 = "dialog_warning_title"
	dialog_data.title = managers.localization.text(slot3, managers.localization)
	slot5 = "dialog_join_others_forbidden_message"
	dialog_data.text = managers.localization.text(slot3, managers.localization)
	local ok_button = {}
	slot6 = "dialog_ok"
	ok_button.text = managers.localization.text(managers.localization, managers.localization)
	ok_button.class = RaidGUIControlButtonShortSecondary
	ok_button.cancel_button = true
	dialog_data.button_list = {
		ok_button
	}
	slot6 = dialog_data

	managers.system_menu.show(managers.localization, managers.system_menu)

	return 
end
function RaidMenuSceneManager:show_dialog_disconnected_from_steam()
	local dialog_data = {}
	slot5 = "dialog_warning_title"
	dialog_data.title = managers.localization.text(slot3, managers.localization)
	slot5 = "dialog_disconnected_from_steam"
	dialog_data.text = managers.localization.text(slot3, managers.localization)
	local ok_button = {}
	slot6 = "dialog_ok"
	ok_button.text = managers.localization.text(managers.localization, managers.localization)
	ok_button.class = RaidGUIControlButtonShortSecondary
	ok_button.cancel_button = true
	dialog_data.button_list = {
		ok_button
	}
	slot6 = dialog_data

	managers.system_menu.show(managers.localization, managers.system_menu)

	return 
end
function RaidMenuSceneManager:show_dialog_already_in_game()
	local dialog_data = {}
	slot5 = "dialog_warning_title"
	dialog_data.title = managers.localization.text(slot3, managers.localization)
	slot5 = "dialog_cant_join_in_mp"
	dialog_data.text = managers.localization.text(slot3, managers.localization)
	local ok_button = {}
	slot6 = "dialog_ok"
	ok_button.text = managers.localization.text(managers.localization, managers.localization)
	ok_button.class = RaidGUIControlButtonShortSecondary
	ok_button.cancel_button = true
	dialog_data.button_list = {
		ok_button
	}
	slot6 = dialog_data

	managers.system_menu.show(managers.localization, managers.system_menu)

	return 
end
function RaidMenuSceneManager:show_release_dialog_helper(message)
	local dialog_data = {
		title = "release dialog helper",
		text = message
	}
	local no_button = {
		text = "ok"
	}
	dialog_data.button_list = {
		no_button
	}
	slot7 = dialog_data

	managers.system_menu.show(slot5, managers.system_menu)

	return 
end

return 
