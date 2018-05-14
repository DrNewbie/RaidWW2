-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot2 = "lib/managers/menu/raid_menu/RaidGuiBase"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/WeaponSelectionGui"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/CharacterSelectionGui"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/CharacterCreationGui"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/CharacterCustomizationGui"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/ChallengeCardsGui"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/ChallengeCardsViewGui"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/ChallengeCardsLootRewardGui"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/MissionJoinGui"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/MissionSelectionGui"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/MissionUnlockGui"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/RaidMainMenuGui"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/RaidMenuHeader"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/RaidMenuFooter"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/RaidMenuLeftOptions"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/RaidMenuOptionsControls"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/RaidMenuOptionsControlsKeybinds"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/RaidMenuOptionsControlsControllerMapping"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/RaidMenuOptionsVideo"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/RaidMenuOptionsVideoAdvanced"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/RaidMenuOptionsSound"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/RaidMenuOptionsNetwork"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/RaidMenuCreditsGui"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/RaidOptionsBackground"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/ReadyUpGui"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/LootScreenGui"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/GreedLootScreenGui"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/ExperienceGui"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/PostGameBreakdownGui"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/GoldAssetStoreGui"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/IntelGui"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/ComicBookGui"

require(slot1)

slot2 = "lib/managers/menu/raid_menu/SpecialHonorsGui"

require(slot1)

MenuComponentManager = MenuComponentManager or class()
function MenuComponentManager:init()
	slot3 = Overlay
	slot3 = Overlay.gui(slot2)
	self._ws = Overlay.gui(slot2).create_screen_workspace(slot2)
	slot3 = managers.gui_data
	self._fullscreen_ws = managers.gui_data.create_fullscreen_16_9_workspace(slot2)
	slot4 = self._ws

	managers.gui_data.layout_workspace(slot2, managers.gui_data)

	slot3 = self._ws
	slot3 = self._ws.panel(slot2)
	self._main_panel = self._ws.panel(slot2).panel(slot2)
	self._requested_textures = {}
	self._block_texture_requests = false
	slot4 = "MenuComponentManager"
	self._sound_source = SoundDevice.create_source(slot2, SoundDevice)
	slot3 = managers.viewport
	slot8 = "resolution_changed"
	self._resolution_changed_callback_id = managers.viewport.add_resolution_changed_func(slot2, callback(slot5, self, self))
	slot5 = "_request_done_callback"
	self._request_done_clbk_func = callback(slot2, self, self)
	slot3 = managers.dlc
	local is_installing, install_progress = managers.dlc.is_installing(slot2)
	self._is_game_installing = is_installing
	self._active_components = {}
	slot9 = "create_raid_menu_mission_selection_gui"
	slot9 = "close_raid_menu_mission_selection_gui"
	self._active_components.raid_menu_mission_selection = {
		create = callback(self, self, self),
		close = callback(self, self, self)
	}
	slot9 = "create_raid_menu_mission_unlock_gui"
	slot9 = "close_raid_menu_mission_unlock_gui"
	self._active_components.raid_menu_mission_unlock = {
		create = callback(self, self, self),
		close = callback(self, self, self)
	}
	slot9 = "create_raid_menu_mission_join_gui"
	slot9 = "close_raid_menu_mission_join_gui"
	self._active_components.raid_menu_mission_join = {
		create = callback(self, self, self),
		close = callback(self, self, self)
	}
	slot9 = "create_raid_menu_weapon_select_gui"
	slot9 = "close_raid_menu_weapon_select_gui"
	self._active_components.raid_menu_weapon_select = {
		create = callback(self, self, self),
		close = callback(self, self, self)
	}
	slot9 = "create_raid_menu_select_character_profile_gui"
	slot9 = "close_raid_menu_select_character_profile_gui"
	self._active_components.raid_menu_profile_selection = {
		create = callback(self, self, self),
		close = callback(self, self, self)
	}
	slot9 = "create_raid_menu_create_character_profile_gui"
	slot9 = "close_raid_menu_create_character_profile_gui"
	self._active_components.raid_menu_profile_creation = {
		create = callback(self, self, self),
		close = callback(self, self, self)
	}
	slot9 = "create_raid_menu_character_customization_gui"
	slot9 = "close_raid_menu_character_customization_gui"
	self._active_components.raid_menu_character_customization = {
		create = callback(self, self, self),
		close = callback(self, self, self)
	}
	slot9 = "create_raid_menu_main_menu_gui"
	slot9 = "close_raid_menu_main_menu_gui"
	self._active_components.raid_menu_main = {
		create = callback(self, self, self),
		close = callback(self, self, self)
	}
	slot9 = "create_raid_menu_header_gui"
	slot9 = "close_raid_menu_header_gui"
	self._active_components.raid_menu_header = {
		create = callback(self, self, self),
		close = callback(self, self, self)
	}
	slot9 = "create_raid_menu_footer_gui"
	slot9 = "close_raid_menu_footer_gui"
	self._active_components.raid_menu_footer = {
		create = callback(self, self, self),
		close = callback(self, self, self)
	}
	slot9 = "create_raid_menu_left_options_gui"
	slot9 = "close_raid_menu_left_options_gui"
	self._active_components.raid_menu_left_options = {
		create = callback(self, self, self),
		close = callback(self, self, self)
	}
	slot9 = "create_raid_menu_options_controls_gui"
	slot9 = "close_raid_menu_options_controls_gui"
	self._active_components.raid_menu_options_controls = {
		create = callback(self, self, self),
		close = callback(self, self, self)
	}
	slot9 = "create_raid_menu_options_controls_keybinds_gui"
	slot9 = "close_raid_menu_options_controls_keybinds_gui"
	self._active_components.raid_menu_options_controls_keybinds = {
		create = callback(self, self, self),
		close = callback(self, self, self)
	}
	slot9 = "create_raid_menu_options_controller_mapping_gui"
	slot9 = "close_raid_menu_options_controller_mapping_gui"
	self._active_components.raid_menu_options_controller_mapping = {
		create = callback(self, self, self),
		close = callback(self, self, self)
	}
	slot9 = "create_raid_menu_options_sound_gui"
	slot9 = "close_raid_menu_options_sound_gui"
	self._active_components.raid_menu_options_sound = {
		create = callback(self, self, self),
		close = callback(self, self, self)
	}
	slot9 = "create_raid_menu_options_network_gui"
	slot9 = "close_raid_menu_options_network_gui"
	self._active_components.raid_menu_options_network = {
		create = callback(self, self, self),
		close = callback(self, self, self)
	}
	slot9 = "create_raid_menu_options_video_gui"
	slot9 = "close_raid_menu_options_video_gui"
	self._active_components.raid_menu_options_video = {
		create = callback(self, self, self),
		close = callback(self, self, self)
	}
	slot9 = "create_raid_menu_options_video_advanced_gui"
	slot9 = "close_raid_menu_options_video_advanced_gui"
	self._active_components.raid_menu_options_video_advanced = {
		create = callback(self, self, self),
		close = callback(self, self, self)
	}
	slot9 = "create_raid_options_background_gui"
	slot9 = "close_raid_options_background_gui"
	self._active_components.raid_options_background = {
		create = callback(self, self, self),
		close = callback(self, self, self)
	}
	slot9 = "create_raid_ready_up_gui"
	slot9 = "close_raid_ready_up_gui"
	self._active_components.raid_menu_ready_up = {
		create = callback(self, self, self),
		close = callback(self, self, self)
	}
	slot9 = "create_raid_challenge_cards_gui"
	slot9 = "close_raid_challenge_cards_gui"
	self._active_components.raid_menu_challenge_cards = {
		create = callback(self, self, self),
		close = callback(self, self, self)
	}
	slot9 = "create_raid_challenge_cards_view_gui"
	slot9 = "close_raid_challenge_cards_view_gui"
	self._active_components.raid_menu_challenge_cards_view = {
		create = callback(self, self, self),
		close = callback(self, self, self)
	}
	slot9 = "create_raid_challenge_cards_loot_reward_gui"
	slot9 = "close_raid_challenge_cards_loot_reward_gui"
	self._active_components.raid_menu_challenge_cards_loot_reward = {
		create = callback(self, self, self),
		close = callback(self, self, self)
	}
	slot9 = "create_raid_menu_xp"
	slot9 = "close_raid_menu_xp"
	self._active_components.raid_menu_xp = {
		create = callback(self, self, self),
		close = callback(self, self, self)
	}
	slot9 = "create_raid_menu_post_game_breakdown"
	slot9 = "close_raid_menu_post_game_breakdown"
	self._active_components.raid_menu_post_game_breakdown = {
		create = callback(self, self, self),
		close = callback(self, self, self)
	}
	slot9 = "create_raid_menu_special_honors"
	slot9 = "close_raid_menu_special_honors"
	self._active_components.raid_menu_special_honors = {
		create = callback(self, self, self),
		close = callback(self, self, self)
	}
	slot9 = "create_raid_menu_loot"
	slot9 = "close_raid_menu_loot"
	self._active_components.raid_menu_loot = {
		create = callback(self, self, self),
		close = callback(self, self, self)
	}
	slot9 = "create_raid_menu_greed_loot"
	slot9 = "close_raid_menu_greed_loot"
	self._active_components.raid_menu_greed_loot = {
		create = callback(self, self, self),
		close = callback(self, self, self)
	}
	slot9 = "create_raid_menu_gold_asset_store_gui"
	slot9 = "close_raid_menu_gold_asset_store_gui"
	self._active_components.raid_menu_gold_asset_store = {
		create = callback(self, self, self),
		close = callback(self, self, self)
	}
	slot9 = "create_raid_menu_intel_gui"
	slot9 = "close_raid_menu_intel_gui"
	self._active_components.raid_menu_intel = {
		create = callback(self, self, self),
		close = callback(self, self, self)
	}
	slot9 = "create_raid_menu_comic_book_gui"
	slot9 = "close_raid_menu_comic_book_gui"
	self._active_components.raid_menu_comic_book = {
		create = callback(self, self, self),
		close = callback(self, self, self)
	}
	slot9 = "create_raid_menu_credits"
	slot9 = "close_raid_menu_credits"
	self._active_components.raid_menu_credits = {
		create = callback(self, self, self),
		close = callback(self, self, self)
	}
	self._active_controls = {}
	self._update_components = {}

	return 
end
function MenuComponentManager:save(data)
	return 
end
function MenuComponentManager:load(data)
	slot4 = self

	self.on_whisper_mode_changed(slot3)

	return 
end
function MenuComponentManager:on_whisper_mode_changed()
	return 
end
function MenuComponentManager:get_controller_input_bool(button)

	-- Decompilation error in this vicinity:
	slot4 = managers.menu
	local controller = managers.menu.active_menu(slot3).input.get_controller_class(slot3)
	slot5 = managers.menu
	slot5 = managers.menu.active_menu(managers.menu.active_menu(slot3).input).input

	if managers.menu.active_menu(managers.menu.active_menu(slot3).input).input.get_accept_input(managers.menu.active_menu(slot3).input) then
		slot6 = button

		return controller.get_input_bool(slot4, controller)
	end

	return 
end
function MenuComponentManager:_setup_controller_input()
	if not self._controller_connected then
		self._left_axis_vector = Vector3()
		self._right_axis_vector = Vector3()
		slot3 = managers.menu

		if managers.menu.active_menu(slot2) then
			slot6 = managers.menu
			slot6 = managers.menu.active_menu(slot5).input

			self._fullscreen_ws.connect_controller(slot2, self._fullscreen_ws, managers.menu.active_menu(slot5).input.get_controller(slot5))

			slot3 = self._fullscreen_ws
			slot3 = self._fullscreen_ws.panel(slot2)
			slot8 = "_axis_move"

			self._fullscreen_ws.panel(slot2).axis_move(slot2, callback(true, self, self))
		end

		self._controller_connected = true
	end

	return 
end
function MenuComponentManager:_destroy_controller_input()
	if self._controller_connected then
		slot3 = self._fullscreen_ws

		self._fullscreen_ws.disconnect_all_controllers(slot2)

		slot5 = self._fullscreen_ws

		if alive(self._fullscreen_ws.panel(slot4)) then
			slot3 = self._fullscreen_ws
			slot4 = nil

			self._fullscreen_ws.panel(slot2).axis_move(slot2, self._fullscreen_ws.panel(slot2))
		end

		self._controller_connected = nil
		slot4 = "WIN32"

		if SystemInfo.platform(slot2) == Idstring(SystemInfo) then
			slot3 = self._fullscreen_ws

			self._fullscreen_ws.disconnect_keyboard(slot2)

			slot3 = self._fullscreen_ws
			slot4 = nil

			self._fullscreen_ws.panel(slot2).key_press(slot2, self._fullscreen_ws.panel(slot2))
		end
	end

	return 
end
function MenuComponentManager:saferect_ws()
	return self._ws
end
function MenuComponentManager:fullscreen_ws()
	return self._fullscreen_ws
end
function MenuComponentManager:resolution_changed()
	slot4 = self._ws

	managers.gui_data.layout_workspace(slot2, managers.gui_data)

	slot4 = self._fullscreen_ws

	managers.gui_data.layout_fullscreen_16_9_workspace(slot2, managers.gui_data)

	if self._tcst then
		slot4 = self._tcst

		managers.gui_data.layout_fullscreen_16_9_workspace(slot2, managers.gui_data)
	end

	return 
end
function MenuComponentManager:_axis_move(o, axis_name, axis_vector, controller)
	slot7 = "left"

	if axis_name == Idstring(slot6) then
		slot8 = axis_vector

		mvector3.set(slot6, self._left_axis_vector)
	else
		slot7 = "right"

		if axis_name == Idstring(slot6) then
			slot8 = axis_vector

			mvector3.set(slot6, self._right_axis_vector)
		end
	end

	return 
end
function MenuComponentManager:set_active_components(components, node)
	local to_close = {}
	slot6 = self._active_components

	for component, _ in pairs(slot5) do
		to_close[component] = true
	end

	slot6 = components

	for _, component in ipairs(slot5) do
		local component_data = self._active_components[component]

		if component_data then
			to_close[component] = nil
			slot13 = component
			local component_object = component_data.create(slot11, node)
			component_data.component_object = component_object
		end
	end

	slot6 = to_close

	for component, _ in pairs(slot5) do
		local component_data = self._active_components[component]
		slot13 = component

		component_data.close(slot11, node)

		component_data.component_object = nil
	end

	slot6 = managers.menu

	if not managers.menu.is_pc_controller(slot5) then
		slot6 = self

		self._setup_controller_input(slot5)
	end

	return 
end
function MenuComponentManager:make_color_text(text_object, color)
	local text = text_object.text(slot4)
	local text_dissected = utf8.characters(text_object)
	slot7 = "#"
	local idsp = Idstring(text)
	local start_ci = {}
	local end_ci = {}
	local first_ci = true
	slot11 = text_dissected

	for i, c in ipairs(slot10) do
		slot16 = c

		if Idstring(slot15) == idsp then
			local next_c = text_dissected[i + 1]

			if next_c then
				slot17 = next_c

				if Idstring(slot16) == idsp then
					if first_ci then
						slot18 = i

						table.insert(slot16, start_ci)
					else
						slot18 = i

						table.insert(slot16, end_ci)
					end

					first_ci = not first_ci
				end
			end
		end
	end

	if #start_ci ~= #end_ci then
	else
		for i = 1, #start_ci, 1 do
			start_ci[i] = start_ci[i] - ((i - 1) * 4 + 1)
			end_ci[i] = end_ci[i] - i * 4 - 1
		end
	end

	slot13 = ""
	text = string.gsub(slot10, text, "##")
	slot12 = text

	text_object.set_text(slot10, text_object)

	slot12 = 1
	slot15 = text

	text_object.clear_range_color(slot10, text_object, utf8.len(slot14))

	if #start_ci ~= #end_ci then
		slot14 = #end_ci

		Application.error(slot10, Application, "MenuComponentManager:make_color_text: Not even amount of ##'s in text", #start_ci)
	else
		for i = 1, #start_ci, 1 do
			slot18 = color or tweak_data.screen_colors.resource

			text_object.set_range_color(slot14, text_object, start_ci[i], end_ci[i])
		end
	end

	return 
end
function MenuComponentManager:on_job_updated()
	return 
end
function MenuComponentManager:update(t, dt)
	slot5 = self._update_components

	for _, component in pairs(slot4) do
		if component then
			slot12 = dt

			component.update(slot9, component, t)
		end
	end

	return 
end
function MenuComponentManager:get_left_controller_axis()
	slot3 = managers.menu

	if managers.menu.is_pc_controller(slot2) or not self._left_axis_vector then
		return 0, 0
	end

	local x = mvector3.x(slot2)
	slot4 = self._left_axis_vector
	local y = mvector3.y(self._left_axis_vector)

	return x, y
end
function MenuComponentManager:get_right_controller_axis()
	slot3 = managers.menu

	if managers.menu.is_pc_controller(slot2) or not self._right_axis_vector then
		return 0, 0
	end

	local x = mvector3.x(slot2)
	slot4 = self._right_axis_vector
	local y = mvector3.y(self._right_axis_vector)

	return x, y
end
function MenuComponentManager:accept_input(accept)
	return 
end
function MenuComponentManager:input_focus()
	if managers.system_menu then
		slot3 = managers.system_menu

		if managers.system_menu.is_active(slot2) then
			slot3 = managers.system_menu

			if not managers.system_menu.is_closing(slot2) then
				return true
			end
		end
	end

	return 
end
function MenuComponentManager:scroll_up()
	return 
end
function MenuComponentManager:scroll_down()
	return 
end
function MenuComponentManager:move_up()
	slot3 = self._active_components

	for _, component in pairs(slot2) do
		if component.component_object then
			slot8 = component.component_object
			local handled, target = component.component_object.move_up(slot7)

			if handled then
				return true
			end

			if not handled and target then
				slot11 = target

				return self._set_active_control(slot9, self)
			end
		end
	end

	return 
end
function MenuComponentManager:move_down()
	slot3 = self._active_components

	for _, component in pairs(slot2) do
		if component.component_object then
			slot8 = component.component_object
			local handled, target = component.component_object.move_down(slot7)

			if handled then
				return true
			end

			if not handled and target then
				slot11 = target

				return self._set_active_control(slot9, self)
			end
		end
	end

	return 
end
function MenuComponentManager:move_left()
	slot3 = self._active_components

	for _, component in pairs(slot2) do
		if component.component_object then
			slot8 = component.component_object
			local handled, target = component.component_object.move_left(slot7)

			if handled then
				return true
			end

			if not handled and target then
				slot11 = target

				return self._set_active_control(slot9, self)
			end
		end
	end

	return 
end
function MenuComponentManager:_set_active_control(target_control_name)
	slot4 = self._active_controls

	for _, active_control in pairs(slot3) do
		if active_control[target_control_name] then
			slot10 = active_control[target_control_name]

			managers.raid_menu.set_active_control(slot8, managers.raid_menu)

			slot10 = true

			active_control[target_control_name].set_selected(slot8, active_control[target_control_name])
		end
	end

	return 
end
function MenuComponentManager:move_right()
	slot3 = self._active_components

	for _, component in pairs(slot2) do
		if component.component_object then
			slot8 = component.component_object
			local handled, target = component.component_object.move_right(slot7)

			if handled then
				return true
			end

			if not handled and target then
				slot11 = target

				return self._set_active_control(slot9, self)
			end
		end
	end

	return 
end
function MenuComponentManager:scroll_up()
	slot3 = self._active_components

	for _, component in pairs(slot2) do
		if component.component_object then
			slot8 = component.component_object
			local handled, target = component.component_object.scroll_up(slot7)

			if handled then
				return true
			end
		end
	end

	return 
end
function MenuComponentManager:scroll_down()
	slot3 = self._active_components

	for _, component in pairs(slot2) do
		if component.component_object then
			slot8 = component.component_object
			local handled, target = component.component_object.scroll_down(slot7)

			if handled then
				return true
			end
		end
	end

	return 
end
function MenuComponentManager:scroll_left()
	slot3 = self._active_components

	for _, component in pairs(slot2) do
		if component.component_object then
			slot8 = component.component_object
			local handled, target = component.component_object.scroll_left(slot7)

			if handled then
				return true
			end
		end
	end

	return 
end
function MenuComponentManager:scroll_right()
	slot3 = self._active_components

	for _, component in pairs(slot2) do
		if component.component_object then
			slot8 = component.component_object
			local handled, target = component.component_object.scroll_right(slot7)

			if handled then
				return true
			end
		end
	end

	return 
end
function MenuComponentManager:next_page()
	if self._game_chat_gui then
		slot3 = self._game_chat_gui

		if self._game_chat_gui.input_focus(slot2) == true then
			return true
		end
	end

	if self._blackmarket_gui then
		slot3 = self._blackmarket_gui

		if self._blackmarket_gui.next_page(slot2) then
			return true
		end
	end

	return 
end
function MenuComponentManager:previous_page()
	if self._game_chat_gui then
		slot3 = self._game_chat_gui

		if self._game_chat_gui.input_focus(slot2) == true then
			return true
		end
	end

	if self._blackmarket_gui then
		slot3 = self._blackmarket_gui

		if self._blackmarket_gui.previous_page(slot2) then
			return true
		end
	end

	return 
end
function MenuComponentManager:confirm_pressed()
	slot3 = self._active_components

	for _, component in pairs(slot2) do
		if component.component_object then
			slot8 = component.component_object
			local handled = component.component_object.confirm_pressed(slot7)

			if handled then
				return true
			end
		end
	end

	if self._game_chat_gui then
		slot3 = self._game_chat_gui

		if self._game_chat_gui.input_focus(slot2) == true then
			return true
		end
	end

	if self._blackmarket_gui then
		slot3 = self._blackmarket_gui

		if self._blackmarket_gui.confirm_pressed(slot2) then
			return true
		end
	end

	slot3 = Application

	if Application.production_build(slot2) and self._debug_font_gui then
		slot3 = self._debug_font_gui

		self._debug_font_gui.toggle(slot2)
	end

	return 
end
function MenuComponentManager:back_pressed()
	slot3 = self._active_components

	for _, component in pairs(slot2) do
		if component.component_object then
			slot8 = component.component_object
			local handled = component.component_object.back_pressed(slot7)

			if handled then
				return true
			end
		end
	end

	if self._game_chat_gui then
		slot3 = self._game_chat_gui

		if self._game_chat_gui.input_focus(slot2) == true then
			return true
		end
	end

	return 
end
function MenuComponentManager:special_btn_pressed(...)
	slot3 = self._active_components

	for _, component in pairs(slot2) do
		if component.component_object and component.component_object.special_btn_pressed then
			slot8 = component.component_object
			local handled, target = component.component_object.special_btn_pressed(slot7, ...)

			if handled then
				return true
			end

			if not handled and target then
				slot11 = target

				return self._set_active_control(slot9, self)
			end
		end
	end

	if self._game_chat_gui then
		slot3 = self._game_chat_gui

		if self._game_chat_gui.input_focus(slot2) == true then
			return true
		end
	end

	if self._game_chat_gui then
		slot3 = self._game_chat_gui

		if self._game_chat_gui.special_btn_pressed(slot2, ...) then
			return true
		end
	end

	if self._blackmarket_gui then
		slot3 = self._blackmarket_gui

		if self._blackmarket_gui.special_btn_pressed(slot2, ...) then
			return true
		end
	end

	return 
end
function MenuComponentManager:mouse_pressed(o, button, x, y)
	slot7 = self._active_components

	for _, component in pairs(slot6) do
		if component.component_object then
			slot16 = y
			local handled = component.component_object.mouse_pressed(slot11, component.component_object, o, button, x)

			if handled then
				return true
			end
		end
	end

	if self._game_chat_gui then
		slot10 = y

		if self._game_chat_gui.mouse_pressed(slot6, self._game_chat_gui, button, x) then
			return true
		end
	end

	if self._blackmarket_gui then
		slot10 = y

		if self._blackmarket_gui.mouse_pressed(slot6, self._blackmarket_gui, button, x) then
			return true
		end
	end

	if self._server_info_gui then
		slot10 = y

		if self._server_info_gui.mouse_pressed(slot6, self._server_info_gui, button, x) then
			return true
		end

		slot7 = "0"

		if button == Idstring(slot6) then
			slot9 = y

			if self._server_info_gui.check_minimize(slot6, self._server_info_gui, x) then
				local minimized_data = {
					text = "SERVER INFO",
					help_text = "MAXIMIZE SERVER INFO WINDOW"
				}
				slot10 = minimized_data

				self._server_info_gui.set_minimized(slot7, self._server_info_gui, true)

				return true
			end

			slot9 = y

			if self._server_info_gui.check_grab_scroll_bar(slot6, self._server_info_gui, x) then
				return true
			end
		else
			slot7 = "mouse wheel down"

			if button == Idstring(slot6) then
				slot9 = y

				if self._server_info_gui.mouse_wheel_down(slot6, self._server_info_gui, x) then
					return true
				end
			else
				slot7 = "mouse wheel up"

				if button == Idstring(slot6) then
					slot9 = y

					if self._server_info_gui.mouse_wheel_up(slot6, self._server_info_gui, x) then
						return true
					end
				end
			end
		end
	end

	if self._lobby_profile_gui then
		slot10 = y

		if self._lobby_profile_gui.mouse_pressed(slot6, self._lobby_profile_gui, button, x) then
			return true
		end

		slot7 = "0"

		if button == Idstring(slot6) then
			slot9 = y

			if self._lobby_profile_gui.check_minimize(slot6, self._lobby_profile_gui, x) then
				return true
			end

			slot9 = y

			if self._lobby_profile_gui.check_grab_scroll_bar(slot6, self._lobby_profile_gui, x) then
				return true
			end
		else
			slot7 = "mouse wheel down"

			if button == Idstring(slot6) then
				slot9 = y

				if self._lobby_profile_gui.mouse_wheel_down(slot6, self._lobby_profile_gui, x) then
					return true
				end
			else
				slot7 = "mouse wheel up"

				if button == Idstring(slot6) then
					slot9 = y

					if self._lobby_profile_gui.mouse_wheel_up(slot6, self._lobby_profile_gui, x) then
						return true
					end
				end
			end
		end
	end

	if self._view_character_profile_gui then
		slot10 = y

		if self._view_character_profile_gui.mouse_pressed(slot6, self._view_character_profile_gui, button, x) then
			return true
		end

		slot7 = "0"

		if button == Idstring(slot6) then
			slot9 = y

			if self._view_character_profile_gui.check_minimize(slot6, self._view_character_profile_gui, x) then
				return true
			end

			slot9 = y

			if self._view_character_profile_gui.check_grab_scroll_bar(slot6, self._view_character_profile_gui, x) then
				return true
			end
		else
			slot7 = "mouse wheel down"

			if button == Idstring(slot6) then
				slot9 = y

				if self._view_character_profile_gui.mouse_wheel_down(slot6, self._view_character_profile_gui, x) then
					return true
				end
			else
				slot7 = "mouse wheel up"

				if button == Idstring(slot6) then
					slot9 = y

					if self._view_character_profile_gui.mouse_wheel_up(slot6, self._view_character_profile_gui, x) then
						return true
					end
				end
			end
		end
	end

	if self._test_profile1 then
		slot9 = y

		if self._test_profile1.check_grab_scroll_bar(slot6, self._test_profile1, x) then
			return true
		end

		slot9 = y

		if self._test_profile2.check_grab_scroll_bar(slot6, self._test_profile2, x) then
			return true
		end

		slot9 = y

		if self._test_profile3.check_grab_scroll_bar(slot6, self._test_profile3, x) then
			return true
		end

		slot9 = y

		if self._test_profile4.check_grab_scroll_bar(slot6, self._test_profile4, x) then
			return true
		end
	end

	if self._minimized_list then
		slot7 = "0"

		if button == Idstring(slot6) then
			slot7 = self._minimized_list

			for i, data in ipairs(slot6) do
				slot14 = y

				if data.panel.inside(slot11, data.panel, x) then
					slot12 = data

					data.callback(slot11)

					break
				end
			end
		end
	end

	return 
end
function MenuComponentManager:mouse_clicked(o, button, x, y)
	slot7 = self._active_components

	for _, component in pairs(slot6) do
		if component.component_object then
			slot16 = y
			local handled = component.component_object.mouse_clicked(slot11, component.component_object, o, button, x)

			if handled then
				return true
			end
		end
	end

	if self._blackmarket_gui then
		slot11 = y

		return self._blackmarket_gui.mouse_clicked(slot6, self._blackmarket_gui, o, button, x)
	end

	return 
end
function MenuComponentManager:mouse_double_click(o, button, x, y)
	slot7 = self._active_components

	for _, component in pairs(slot6) do
		if component.component_object then
			slot16 = y
			local handled = component.component_object.mouse_double_click(slot11, component.component_object, o, button, x)

			if handled then
				return true
			end
		end
	end

	if self._blackmarket_gui then
		slot11 = y

		return self._blackmarket_gui.mouse_double_click(slot6, self._blackmarket_gui, o, button, x)
	end

	return 
end
function MenuComponentManager:mouse_released(o, button, x, y)
	slot7 = self._active_components

	for _, component in pairs(slot6) do
		if component.component_object then
			slot16 = y
			local handled = component.component_object.mouse_released(slot11, component.component_object, o, button, x)

			if handled then
				return true
			end
		end
	end

	if self._game_chat_gui then
		slot11 = y

		if self._game_chat_gui.mouse_released(slot6, self._game_chat_gui, o, button, x) then
			return true
		end
	end

	if self._blackmarket_gui then
		slot10 = y

		return self._blackmarket_gui.mouse_released(slot6, self._blackmarket_gui, button, x)
	end

	if self._chat_book then
		slot7 = self._chat_book
		local used, pointer = self._chat_book.release_scroll_bar(slot6)

		if used then
			return true, pointer
		end
	end

	if self._server_info_gui then
		slot7 = self._server_info_gui

		if self._server_info_gui.release_scroll_bar(slot6) then
			return true
		end
	end

	if self._lobby_profile_gui then
		slot7 = self._lobby_profile_gui

		if self._lobby_profile_gui.release_scroll_bar(slot6) then
			return true
		end
	end

	if self._view_character_profile_gui then
		slot7 = self._view_character_profile_gui

		if self._view_character_profile_gui.release_scroll_bar(slot6) then
			return true
		end
	end

	if self._test_profile1 then
		slot7 = self._test_profile1

		if self._test_profile1.release_scroll_bar(slot6) then
			return true
		end

		slot7 = self._test_profile2

		if self._test_profile2.release_scroll_bar(slot6) then
			return true
		end

		slot7 = self._test_profile3

		if self._test_profile3.release_scroll_bar(slot6) then
			return true
		end

		slot7 = self._test_profile4

		if self._test_profile4.release_scroll_bar(slot6) then
			return true
		end
	end

	return false
end
function MenuComponentManager:mouse_moved(o, x, y)
	local wanted_pointer = "arrow"
	slot7 = self._active_components

	for _, component in pairs(slot6) do
		if component.component_object then
			slot15 = y
			local used, pointer = component.component_object.mouse_moved(slot11, component.component_object, o, x)

			if not pointer then
			end

			if used then
				return true, wanted_pointer
			end
		end
	end

	if self._game_chat_gui then
		slot9 = y
		local used, pointer = self._game_chat_gui.mouse_moved(slot6, self._game_chat_gui, x)

		if not pointer then
		end

		if used then
			return true, wanted_pointer
		end
	end

	if self._blackmarket_gui then
		slot10 = y
		local used, pointer = self._blackmarket_gui.mouse_moved(slot6, self._blackmarket_gui, o, x)

		if not pointer then
		end

		if used then
			return true, wanted_pointer
		end
	end

	if self._server_info_gui then
		slot9 = y
		local used, pointer = self._server_info_gui.moved_scroll_bar(slot6, self._server_info_gui, x)

		if used then
			return true, pointer
		end

		slot11 = y
		local used, pointer = self._server_info_gui.mouse_moved(slot8, self._server_info_gui, x)

		if not pointer then
		end

		if used then
			return true, wanted_pointer
		end
	end

	if self._backdrop_gui then
		slot9 = y
		local used, pointer = self._backdrop_gui.mouse_moved(slot6, self._backdrop_gui, x)

		if not pointer then
		end

		if used then
			return true, wanted_pointer
		end
	end

	if self._lobby_profile_gui then
		slot9 = y
		local used, pointer = self._lobby_profile_gui.moved_scroll_bar(slot6, self._lobby_profile_gui, x)

		if used then
			return true, pointer
		end

		slot11 = y
		local used, pointer = self._lobby_profile_gui.mouse_moved(slot8, self._lobby_profile_gui, x)

		if not pointer then
		end

		if used then
			return true, wanted_pointer
		end
	end

	if self._view_character_profile_gui then
		slot9 = y
		local used, pointer = self._view_character_profile_gui.moved_scroll_bar(slot6, self._view_character_profile_gui, x)

		if used then
			return true, pointer
		end

		slot11 = y
		local used, pointer = self._view_character_profile_gui.mouse_moved(slot8, self._view_character_profile_gui, x)

		if not pointer then
		end

		if used then
			return true, wanted_pointer
		end
	end

	if self._test_profile1 then
		slot9 = y
		local used, pointer = self._test_profile1.moved_scroll_bar(slot6, self._test_profile1, x)

		if used then
			return true, pointer
		end

		slot11 = y
		local used, pointer = self._test_profile2.moved_scroll_bar(slot8, self._test_profile2, x)

		if used then
			return true, pointer
		end

		slot13 = y
		local used, pointer = self._test_profile3.moved_scroll_bar(slot10, self._test_profile3, x)

		if used then
			return true, pointer
		end

		slot15 = y
		local used, pointer = self._test_profile4.moved_scroll_bar(slot12, self._test_profile4, x)

		if used then
			return true, pointer
		end
	end

	if self._minimized_list then
		slot7 = self._minimized_list

		for i, data in ipairs(slot6) do
			slot15 = y

			if data.mouse_over ~= data.panel.inside(slot12, data.panel, x) then
				slot14 = y
				data.mouse_over = data.panel.inside(slot11, data.panel, x)
				slot12 = data.text
				slot10 = data.text.set_font

				if not data.mouse_over or not tweak_data.menu.default_font_no_outline_id then
					slot15 = tweak_data.menu.default_font
					slot13 = Idstring(slot14)
				end

				slot10(slot11, slot12)

				slot13 = (data.mouse_over and Color.black) or Color.white

				data.text.set_color(slot11, data.text)

				slot13 = data.mouse_over

				data.selected.set_visible(slot11, data.selected)

				slot13 = data.mouse_over

				data.help_text.set_visible(slot11, data.help_text)
			end

			slot14 = y + 12

			data.help_text.set_position(slot11, data.help_text, x + 12)
		end
	end

	return false, wanted_pointer
end
function MenuComponentManager:peer_outfit_updated(peer_id)
	return 
end
function MenuComponentManager:on_peer_removed(peer, reason)
	return 
end
function MenuComponentManager:_create_chat_gui()
	slot4 = "WIN32"

	if SystemInfo.platform(slot2) == Idstring(SystemInfo) then
		slot3 = MenuCallbackHandler

		if MenuCallbackHandler.is_multiplayer(slot2) then
			slot3 = managers.network

			if managers.network.session(slot2) then
				if self._game_chat_gui then
					slot3 = self

					self.show_game_chat_gui(slot2)
				else
					slot3 = self

					self.add_game_chat(slot2)
				end

				slot4 = self._saved_game_chat_params or "default"

				self._game_chat_gui.set_params(slot2, self._game_chat_gui)

				self._saved_game_chat_params = nil
			end
		end
	end

	return 
end
function MenuComponentManager:create_chat_gui()
	self.close_chat_gui(slot2)

	local config = {
		w = 540,
		use_minimize_legend = true,
		h = 220,
		header_type = "fit",
		no_close_legend = true,
		x = 290
	}
	slot7 = config
	self._chat_book = BookBoxGui.new(self, BookBoxGui, self._ws, nil)
	slot5 = 8

	self._chat_book.set_layer(self, self._chat_book)

	local global_gui = ChatGui.new(self, ChatGui, self._ws, "Global")
	slot6 = ChatManager.GLOBAL

	global_gui.set_channel_id(ChatGui, global_gui)

	slot5 = global_gui
	slot8 = self._chat_book

	global_gui.set_layer(ChatGui, self._chat_book.layer(""))

	slot8 = false

	self._chat_book.add_page(ChatGui, self._chat_book, "Global", global_gui)

	slot6 = tweak_data.gui.MENU_COMPONENT_LAYER

	self._chat_book.set_layer(ChatGui, self._chat_book)

	return 
end
function MenuComponentManager:add_game_chat()
	slot4 = "WIN32"

	if SystemInfo.platform(slot2) == Idstring(SystemInfo) then
		slot4 = self._ws
		self._game_chat_gui = ChatGui.new(slot2, ChatGui)

		if self._game_chat_params then
			slot4 = self._game_chat_params

			self._game_chat_gui.set_params(slot2, self._game_chat_gui)

			self._game_chat_params = nil
		end
	end

	return 
end
function MenuComponentManager:set_max_lines_game_chat(max_lines)
	if self._game_chat_gui then
		slot5 = max_lines

		self._game_chat_gui.set_max_lines(slot3, self._game_chat_gui)
	else
		self._game_chat_params = self._game_chat_params or {}
		self._game_chat_params.max_lines = max_lines
	end

	return 
end
function MenuComponentManager:pre_set_game_chat_leftbottom(from_left, from_bottom)
	if self._game_chat_gui then
		slot7 = from_bottom

		self._game_chat_gui.set_leftbottom(slot4, self._game_chat_gui, from_left)
	else
		self._game_chat_params = self._game_chat_params or {}
		self._game_chat_params.left = from_left
		self._game_chat_params.bottom = from_bottom
	end

	return 
end
function MenuComponentManager:remove_game_chat()
	if not self._chat_book then
		return 
	end

	slot4 = "Game"

	self._chat_book.remove_page(slot2, self._chat_book)

	return 
end
function MenuComponentManager:hide_game_chat_gui()
	if self._game_chat_gui then
		slot3 = self._game_chat_gui

		self._game_chat_gui.hide(slot2)
	end

	return 
end
function MenuComponentManager:show_game_chat_gui()
	if self._game_chat_gui then
		slot3 = self._game_chat_gui

		self._game_chat_gui.show(slot2)
	end

	return 
end
function MenuComponentManager:_disable_chat_gui()
	if self._game_chat_gui then
		slot4 = false

		self._game_chat_gui.set_enabled(slot2, self._game_chat_gui)
	end

	return 
end
function MenuComponentManager:close_chat_gui()
	if self._game_chat_gui then
		slot3 = self._game_chat_gui

		self._game_chat_gui.close(slot2)

		self._game_chat_gui = nil
	end

	if self._chat_book_minimized_id then
		slot4 = self._chat_book_minimized_id

		self.remove_minimized(slot2, self)

		self._chat_book_minimized_id = nil
	end

	self._game_chat_bottom = nil

	return 
end
function MenuComponentManager:create_lobby_profile_gui(peer_id, x, y)
	slot6 = self

	self.close_lobby_profile_gui(slot5)

	slot12 = peer_id
	self._lobby_profile_gui = LobbyProfileBoxGui.new(slot5, LobbyProfileBoxGui, self._ws, nil, nil, nil, {
		h = 160,
		x = x,
		y = y
	})
	slot7 = nil

	self._lobby_profile_gui.set_title(slot5, self._lobby_profile_gui)

	slot7 = false

	self._lobby_profile_gui.set_use_minimize_legend(slot5, self._lobby_profile_gui)

	slot7 = self._lobby_profile_gui

	table.insert(slot5, self._update_components)

	return 
end
function MenuComponentManager:close_lobby_profile_gui()
	if self._lobby_profile_gui then
		slot4 = self._lobby_profile_gui

		self.removeFromUpdateTable(slot2, self)

		slot3 = self._lobby_profile_gui

		self._lobby_profile_gui.close(slot2)

		self._lobby_profile_gui = nil
	end

	if self._lobby_profile_gui_minimized_id then
		slot4 = self._lobby_profile_gui_minimized_id

		self.remove_minimized(slot2, self)

		self._lobby_profile_gui_minimized_id = nil
	end

	return 
end
function MenuComponentManager:create_view_character_profile_gui(user, x, y)
	slot6 = self

	self.close_view_character_profile_gui(slot5)

	slot12 = user
	self._view_character_profile_gui = ViewCharacterProfileBoxGui.new(slot5, ViewCharacterProfileBoxGui, self._ws, nil, nil, nil, {
		w = 360,
		x = 837,
		h = 160,
		y = 100
	})
	slot7 = nil

	self._view_character_profile_gui.set_title(slot5, self._view_character_profile_gui)

	slot7 = false

	self._view_character_profile_gui.set_use_minimize_legend(slot5, self._view_character_profile_gui)

	slot7 = self._view_character_profile_gui

	table.insert(slot5, self._update_components)

	return 
end
function MenuComponentManager:close_view_character_profile_gui()
	if self._view_character_profile_gui then
		slot4 = self._view_character_profile_gui

		self.removeFromUpdateTable(slot2, self)

		slot3 = self._view_character_profile_gui

		self._view_character_profile_gui.close(slot2)

		self._view_character_profile_gui = nil
	end

	if self._view_character_profile_gui_minimized_id then
		slot4 = self._view_character_profile_gui_minimized_id

		self.remove_minimized(slot2, self)

		self._view_character_profile_gui_minimized_id = nil
	end

	return 
end
function MenuComponentManager:get_texture_from_mod_type(type, sub_type, gadget, silencer, is_auto, equipped, mods, types, is_a_path)
	local texture = nil

	if is_a_path then
		texture = type
	elseif silencer then
		texture = "guis/textures/pd2/blackmarket/inv_mod_silencer"
	elseif type == "gadget" then
		texture = "guis/textures/pd2/blackmarket/inv_mod_" .. (gadget or "flashlight")
	elseif type == "upper_reciever" or type == "lower_reciever" then
		texture = "guis/textures/pd2/blackmarket/inv_mod_custom"
	elseif type == "custom" then
		texture = "guis/textures/pd2/blackmarket/inv_mod_" .. (sub_type or (is_auto and "autofire") or "singlefire")
	elseif type == "sight" then
		texture = "guis/textures/pd2/blackmarket/inv_mod_scope"
	elseif type == "ammo" then
		if equipped then
			slot14 = sub_type or type
			texture = "guis/textures/pd2/blackmarket/inv_mod_" .. tostring(slot13)
		elseif mods and 0 < #mods then
			local weapon_factory_tweak_data = tweak_data.weapon.factory.parts
			local part_id = mods[1][1]
			type = weapon_factory_tweak_data[part_id].type
			sub_type = weapon_factory_tweak_data[part_id].sub_type
			slot16 = sub_type or type
			texture = "guis/textures/pd2/blackmarket/inv_mod_" .. tostring(slot15)
		end

		slot14 = sub_type or type
		texture = "guis/textures/pd2/blackmarket/inv_mod_" .. tostring(slot13)
	elseif type == "bonus" then
		if equipped then
			slot14 = sub_type or type
			texture = "guis/textures/pd2/blackmarket/inv_mod_" .. tostring(slot13)
		else
			texture = "guis/textures/pd2/blackmarket/inv_mod_bonus"
		end

		slot14 = sub_type or type
		texture = "guis/textures/pd2/blackmarket/inv_mod_" .. tostring(slot13)
	else
		texture = "guis/textures/pd2/blackmarket/inv_mod_" .. type
	end

	return texture
end
function MenuComponentManager:set_blackmarket_tradable_loaded(error)
	if self._blackmarket_gui then
		slot5 = error

		self._blackmarket_gui.set_tradable_loaded(slot3, self._blackmarket_gui)
	end

	return 
end
function MenuComponentManager:_maximize_weapon_box(data)
	slot5 = data.id

	self.remove_minimized(slot3, self)

	return 
end
function MenuComponentManager:add_minimized(config)
	self._minimized_list = self._minimized_list or {}
	self._minimized_id = (self._minimized_id or 0) + 1
	slot5 = {
		w = 100,
		h = 20,
		layer = tweak_data.gui.MENU_COMPONENT_LAYER
	}
	local panel = self._main_panel.panel(slot3, self._main_panel)
	local text = nil

	if config.text then
		slot7 = {
			vertical = "center",
			hvertical = "center",
			halign = "left",
			font_size = 22,
			align = "center",
			layer = 2,
			text = config.text,
			font = tweak_data.menu.default_font
		}
		text = panel.text(slot5, panel)
		slot6 = text

		text.set_center_y(slot5, panel.center_y(tweak_data.menu.default_font))

		slot6 = text
		local _, _, w, h = text.text_rect(slot5)
		slot12 = h

		text.set_size(panel, text, w + 8)

		slot12 = h

		panel.set_size(panel, panel, w + 8)
	end

	slot6 = panel
	slot6 = panel.parent(slot5)
	slot7 = {
		halign = "left",
		vertical = "center",
		hvertical = "center",
		align = "left",
		visible = false,
		layer = 3,
		text = config.help_text or "CLICK TO MAXIMIZE WEAPON INFO",
		font = tweak_data.menu.small_font,
		font_size = tweak_data.menu.small_font_size,
		color = Color.white
	}
	local help_text = panel.parent(slot5).text(slot5, slot6)
	slot7 = help_text

	help_text.set_shape(slot6, help_text.text_rect(slot9))

	slot8 = {
		texture = "guis/textures/menu_unselected",
		layer = 0
	}
	local unselected = panel.bitmap(slot6, panel)
	slot11 = panel
	slot9 = (64 * panel.h(help_text)) / 32

	unselected.set_h(panel, unselected)

	slot8 = unselected

	unselected.set_center_y(panel, panel.center_y(help_text))

	slot9 = {
		texture = "guis/textures/menu_selected",
		visible = false,
		layer = 1
	}
	local selected = panel.bitmap(panel, panel)
	slot12 = panel
	slot10 = (64 * panel.h(panel)) / 32

	selected.set_h(panel, selected)

	slot9 = selected
	slot12 = panel

	selected.set_center_y(panel, panel.center_y(panel))

	slot10 = self._main_panel.h(panel) - CoreMenuRenderer.Renderer.border_height

	panel.set_bottom(panel, panel)

	slot9 = panel
	slot10 = {
		texture = "guis/textures/headershadow",
		layer = 1,
		visible = false,
		w = panel.w(self._main_panel)
	}
	slot13 = panel
	local top_line = panel.parent(panel).bitmap(panel, panel.parent(panel))
	slot10 = top_line
	slot13 = panel

	top_line.set_bottom(panel.parent(panel), panel.top(self._main_panel))

	slot11 = {
		mouse_over = false,
		id = self._minimized_id,
		panel = panel,
		selected = selected,
		text = text,
		help_text = help_text,
		top_line = top_line,
		callback = config.callback
	}

	table.insert(panel.parent(panel), self._minimized_list)

	slot10 = self

	self._layout_minimized(panel.parent(panel))

	return self._minimized_id
end
function MenuComponentManager:_layout_minimized()
	local x = 0
	slot4 = self._minimized_list

	for i, data in ipairs(slot3) do
		slot10 = x

		data.panel.set_x(slot8, data.panel)

		slot10 = x

		data.top_line.set_x(slot8, data.top_line)

		slot9 = data.panel
		x = x + data.panel.w(slot8) + 2
	end

	return 
end
function MenuComponentManager:remove_minimized(id)
	slot4 = self._minimized_list

	for i, data in ipairs(slot3) do
		if data.id == id then
			slot9 = data.help_text
			slot10 = data.help_text

			data.help_text.parent(slot8).remove(slot8, data.help_text.parent(slot8))

			slot9 = data.top_line
			slot10 = data.top_line

			data.top_line.parent(slot8).remove(slot8, data.top_line.parent(slot8))

			slot10 = data.panel

			self._main_panel.remove(slot8, self._main_panel)

			slot10 = i

			table.remove(slot8, self._minimized_list)

			break
		end
	end

	slot4 = self

	self._layout_minimized(slot3)

	return 
end
function MenuComponentManager:_request_done_callback(texture_ids)
	slot4 = texture_ids
	local key = texture_ids.key(slot3)
	local entry = self._requested_textures[key]

	if not entry then
		return 
	end

	local clbks = {}
	slot7 = entry.owners

	for index, owner_data in pairs(slot6) do
		slot13 = owner_data.clbk

		table.insert(slot11, clbks)

		owner_data.clbk = nil
	end

	slot7 = clbks

	for _, clbk in pairs(slot6) do
		slot12 = texture_ids

		clbk(slot11)
	end

	return 
end
function MenuComponentManager:request_texture(texture, done_cb)
	if self._block_texture_requests then
		slot8 = texture

		debug_pause(string.format(slot6, "[MenuComponentManager:request_texture] Requesting texture is blocked! %s"))

		return false
	end

	local texture_ids = Idstring(slot4)
	slot9 = "texture"

	if not DB.has(texture, DB, Idstring(texture_ids)) then
		slot6 = Application
		slot10 = texture

		Application.error(slot5, string.format(slot8, "[MenuComponentManager:request_texture] No texture entry named \"%s\" in database."))

		return false
	end

	slot6 = texture_ids
	local key = texture_ids.key(slot5)
	local entry = self._requested_textures[key]

	if not entry then
		entry = {
			next_index = 1,
			owners = {},
			texture_ids = texture_ids
		}
		self._requested_textures[key] = entry
	end

	local index = entry.next_index
	entry.owners[index] = {
		clbk = done_cb
	}
	local next_index = index + 1

	while entry.owners[next_index] do
		if index == next_index then
			slot10 = "[MenuComponentManager:request_texture] overflow!"

			debug_pause(slot9)
		end

		next_index = next_index + 1

		if next_index == 10000 then
			next_index = 1
		end
	end

	entry.next_index = next_index
	slot17 = "_request_done_callback"

	TextureCache.request(slot9, TextureCache, texture_ids, "NORMAL", callback(100, self, self))

	return index
end
function MenuComponentManager:unretrieve_texture(texture, index)
	local texture_ids = Idstring(slot4)
	slot6 = texture_ids
	local key = texture_ids.key(texture)
	local entry = self._requested_textures[key]

	if entry and entry.owners[index] then
		entry.owners[index] = nil
		slot8 = entry.owners

		if not next(nil) then
			self._requested_textures[key] = nil
		end

		slot9 = texture_ids

		TextureCache.unretrieve(slot7, TextureCache)
	end

	return 
end
function MenuComponentManager:retrieve_texture(texture)
	slot6 = "NORMAL"

	return TextureCache.retrieve(slot3, TextureCache, texture)
end
function MenuComponentManager:add_colors_to_text_object(text_object, ...)
	slot4 = text_object
	local text = text_object.text(slot3)
	local unchanged_text = text
	local colors = {
		...
	}
	local default_color = (#colors == 1 and colors[1]) or tweak_data.screen_colors.text
	local start_ci, end_ci, first_ci = nil
	local text_dissected = utf8.characters(slot10)
	local idsp = Idstring(text)
	start_ci = {}
	end_ci = {}
	first_ci = true
	slot13 = text_dissected

	for i, c in ipairs("#") do
		slot18 = c

		if Idstring(slot17) == idsp then
			local next_c = text_dissected[i + 1]

			if next_c then
				slot19 = next_c

				if Idstring(slot18) == idsp then
					if first_ci then
						slot20 = i

						table.insert(slot18, start_ci)
					else
						slot20 = i

						table.insert(slot18, end_ci)
					end

					first_ci = not first_ci
				end
			end
		end
	end

	if #start_ci ~= #end_ci then
	else
		for i = 1, #start_ci, 1 do
			start_ci[i] = start_ci[i] - ((i - 1) * 4 + 1)
			end_ci[i] = end_ci[i] - i * 4 - 1
		end
	end

	slot15 = ""
	text = string.gsub(slot12, text, "##")
	slot14 = text

	text_object.set_text(slot12, text_object)

	if colors then
		slot14 = 1
		slot17 = text

		text_object.clear_range_color(slot12, text_object, utf8.len(slot16))

		if #start_ci ~= #end_ci then
			slot17 = #end_ci

			Application.error(slot12, Application, "[MenuComponentManager:color_text_object]: Missing '#' in text:", unchanged_text, #start_ci)
		else
			for i = 1, #start_ci, 1 do
				slot20 = colors[i] or default_color

				text_object.set_range_color(slot16, text_object, start_ci[i], end_ci[i])
			end
		end
	end

	return 
end
MenuComponentPostEventInstance = MenuComponentPostEventInstance or class()
function MenuComponentPostEventInstance:init(sound_source)
	self._sound_source = sound_source
	self._post_event = false

	return 
end
function MenuComponentPostEventInstance:post_event(event)
	slot4 = self._post_event

	if alive(slot3) then
		slot4 = self._post_event

		self._post_event.stop(slot3)
	end

	self._post_event = false
	slot4 = self._sound_source

	if alive(slot3) then
		slot5 = event
		self._post_event = self._sound_source.post_event(slot3, self._sound_source)
	end

	return 
end
function MenuComponentPostEventInstance:stop_event()
	slot3 = self._post_event

	if alive(slot2) then
		slot3 = self._post_event

		self._post_event.stop(slot2)
	end

	self._post_event = false

	return 
end
function MenuComponentManager:new_post_event_instance()
	slot4 = self._sound_source
	local event_instance = MenuComponentPostEventInstance.new(slot2, MenuComponentPostEventInstance)
	self._unique_event_instances = self._unique_event_instances or {}
	slot5 = event_instance

	table.insert(slot3, self._unique_event_instances)

	return event_instance
end
function MenuComponentManager:post_event(event, unique)
	slot5 = self._post_event

	if alive(slot4) then
		slot5 = self._post_event

		self._post_event.stop(slot4)

		self._post_event = nil
	end

	slot6 = event
	local post_event = self._sound_source.post_event(slot4, self._sound_source)

	if unique then
		self._post_event = post_event
	end

	return post_event
end
function MenuComponentManager:stop_event()
	slot3 = "MenuComponentManager:stop_event()"

	print(slot2)

	slot3 = self._post_event

	if alive(slot2) then
		slot3 = self._post_event

		self._post_event.stop(slot2)

		self._post_event = nil
	end

	return 
end
function MenuComponentManager:close()
	slot3 = "[MenuComponentManager:close]"

	print(slot2)

	slot3 = self

	self.close_chat_gui(slot2)

	slot3 = self._sound_source

	if alive(slot2) then
		slot3 = self._sound_source

		self._sound_source.stop(slot2)
	end

	slot3 = self

	self._destroy_controller_input(slot2)

	if self._requested_textures then
		slot3 = self._requested_textures

		for key, entry in pairs(slot2) do
			slot9 = entry.texture_ids

			TextureCache.unretrieve(slot7, TextureCache)
		end
	end

	self._requested_textures = {}
	self._block_texture_requests = true

	return 
end
function MenuComponentManager:play_transition(run_in_pause)
	if self._transition_panel then
		slot4 = self._transition_panel
		slot5 = self._transition_panel

		self._transition_panel.parent(slot3).remove(slot3, self._transition_panel.parent(slot3))
	end

	slot4 = self._fullscreen_ws
	slot5 = {
		layer = 10000,
		name = "transition_panel"
	}
	self._transition_panel = self._fullscreen_ws.panel(slot3).panel(slot3, self._fullscreen_ws.panel(slot3))
	slot5 = {
		name = "fade1",
		valign = "scale ",
		halign = "scale",
		color = Color.black
	}

	self._transition_panel.rect(slot3, self._transition_panel)

	local function animate_transition(o)
		slot4 = "fade1"
		local fade1 = o.child(slot2, o)
		local seconds = 0.5
		local t = 0
		local dt, p = nil

		while t < seconds do
			dt = coroutine.yield()

			if dt == 0 and run_in_pause then
				slot8 = TimerManager
				slot8 = TimerManager.main(slot7)
				dt = TimerManager.main(slot7).delta_time(slot7)
			end

			t = t + dt
			p = t / seconds
			slot9 = 1 - p

			fade1.set_alpha(slot7, fade1)
		end

		return 
	end

	slot6 = animate_transition

	self._transition_panel.animate(self._transition_panel, self._transition_panel)

	return 
end
function MenuComponentManager:test_camera_shutter_tech()
	if not self._tcst then
		slot3 = managers.gui_data
		self._tcst = managers.gui_data.create_fullscreen_16_9_workspace(slot2)
		slot3 = self._tcst
		slot4 = {
			layer = 10000
		}
		local o = self._tcst.panel(slot2).panel(slot2, self._tcst.panel(slot2))
		local b = o.rect(self._tcst.panel(slot2), o)

		local function one_frame_hide(o)
			slot3 = o

			o.hide(slot2)
			coroutine.yield()

			slot3 = o

			o.show(slot2)

			return 
		end

		slot7 = one_frame_hide

		b.animate({
			valign = "scale",
			name = "black",
			halign = "scale",
			layer = 5,
			color = Color.black
		}, b)
	end

	slot3 = self._tcst
	slot3 = self._tcst.panel(slot2)
	local o = self._tcst.panel(slot2).children(slot2)[1]

	local function animate_fade(o)
		slot4 = "black"
		local black = o.child(slot2, o)

		function slot5(p)
			slot4 = 1 - p

			black.set_alpha(slot2, black)

			return 
		end

		over(o, 0.5)

		return 
	end

	slot5 = o

	o.stop(slot4)

	slot6 = animate_fade

	o.animate(slot4, o)

	return 
end
function MenuComponentManager:create_test_gui()
	slot3 = Global.test_gui

	if alive(slot2) then
		slot3 = Overlay
		slot4 = Global.test_gui

		Overlay.gui(slot2).destroy_workspace(slot2, Overlay.gui(slot2))

		Global.test_gui = nil
	end

	slot4 = managers.gui_data
	Global.test_gui = managers.gui_data.create_fullscreen_16_9_workspace(slot3)
	local panel = Global.test_gui.panel(managers.gui_data.create_fullscreen_16_9_workspace(slot3))
	slot5 = {
		layer = 1000,
		color = Color.black
	}
	local bg = panel.rect(Global.test_gui, panel)
	local size = 48
	local x = 0

	for i = 3, 3, 1 do
		slot12 = {
			texture = "guis/dlcs/big_bank/textures/pd2/pre_planning/mezzanine_test",
			name = "bitmap",
			rotation = 360,
			render_template = "TextDistanceField",
			layer = 1001
		}
		local bitmap = panel.bitmap(slot10, panel)
		slot16 = bitmap

		bitmap.set_size(panel, bitmap, bitmap.texture_width(bitmap.texture_height(bitmap) * i) * i)

		slot14 = 0

		bitmap.set_position(panel, bitmap, x)

		slot12 = bitmap
		x = bitmap.right(panel) + 10
	end

	return 
end
function MenuComponentManager:destroy_test_gui()
	slot3 = Global.test_gui

	if alive(slot2) then
		slot3 = Overlay
		slot4 = Global.test_gui

		Overlay.gui(slot2).destroy_workspace(slot2, Overlay.gui(slot2))

		Global.test_gui = nil
	end

	return 
end
function MenuComponentManager:close_raid_menu_test_gui(node, component)
	if component then
		self._active_controls[component] = {}
	end

	if self._raid_menu_test_gui then
		slot5 = self._raid_menu_test_gui

		self._raid_menu_test_gui.close(slot4)

		self._raid_menu_test_gui = nil
		slot5 = managers.menu
		local active_menu = managers.menu.active_menu(slot4)

		if active_menu then
			slot7 = false

			active_menu.input.set_force_input(slot5, active_menu.input)
		end
	end

	return 
end
function MenuComponentManager:create_raid_menu_mission_selection_gui(node, component)
	slot7 = component

	return self._create_raid_menu_mission_selection_gui(slot4, self, node)
end
function MenuComponentManager:_create_raid_menu_mission_selection_gui(node, component)
	slot7 = component

	self.close_raid_menu_mission_selection_gui(slot4, self, node)

	slot9 = component
	self._raid_menu_mission_selection_gui = MissionSelectionGui.new(slot4, MissionSelectionGui, self._ws, self._fullscreen_ws, node)
	slot6 = self._raid_menu_mission_selection_gui

	table.insert(slot4, self._update_components)

	if component then
		self._active_controls[component] = {}
		local final_list = self._active_controls[component]
		slot6 = self._raid_menu_mission_selection_gui._root_panel._controls

		for _, control in ipairs(slot5) do
			slot13 = final_list

			self._collect_controls(slot10, self, control)
		end

		final_list.raid_list = self._raid_menu_mission_selection_gui._raid_list
	end

	slot5 = managers.menu
	local active_menu = managers.menu.active_menu(slot4)

	if active_menu then
		slot7 = true

		active_menu.input.set_force_input(slot5, active_menu.input)
	end

	return self._raid_menu_mission_selection_gui
end
function MenuComponentManager:close_raid_menu_mission_selection_gui(node, component)
	if component then
		self._active_controls[component] = {}
	end

	if self._raid_menu_mission_selection_gui then
		slot6 = self._raid_menu_mission_selection_gui

		self.removeFromUpdateTable(slot4, self)

		slot5 = self._raid_menu_mission_selection_gui

		self._raid_menu_mission_selection_gui.close(slot4)

		self._raid_menu_mission_selection_gui = nil
		slot5 = managers.menu
		local active_menu = managers.menu.active_menu(slot4)

		if active_menu then
			slot7 = false

			active_menu.input.set_force_input(slot5, active_menu.input)
		end
	end

	return 
end
function MenuComponentManager:create_raid_menu_mission_unlock_gui(node, component)
	slot7 = component

	return self._create_raid_menu_mission_unlock_gui(slot4, self, node)
end
function MenuComponentManager:_create_raid_menu_mission_unlock_gui(node, component)
	slot7 = component

	self.close_raid_menu_mission_unlock_gui(slot4, self, node)

	slot9 = component
	self._raid_menu_mission_unlock_gui = MissionUnlockGui.new(slot4, MissionUnlockGui, self._ws, self._fullscreen_ws, node)

	if component then
		self._active_controls[component] = {}
		local final_list = self._active_controls[component]
		slot6 = self._raid_menu_mission_unlock_gui._root_panel._controls

		for _, control in ipairs(slot5) do
			slot13 = final_list

			self._collect_controls(slot10, self, control)
		end

		final_list.raid_list = self._raid_menu_mission_unlock_gui._raid_list
	end

	slot5 = managers.menu
	local active_menu = managers.menu.active_menu(slot4)

	if active_menu then
		slot7 = true

		active_menu.input.set_force_input(slot5, active_menu.input)
	end

	slot7 = self._raid_menu_mission_unlock_gui

	table.insert(slot5, self._update_components)

	return self._raid_menu_mission_unlock_gui
end
function MenuComponentManager:close_raid_menu_mission_unlock_gui(node, component)
	if component then
		self._active_controls[component] = {}
	end

	if self._raid_menu_mission_unlock_gui then
		slot6 = self._raid_menu_mission_unlock_gui

		self.removeFromUpdateTable(slot4, self)

		slot5 = self._raid_menu_mission_unlock_gui

		self._raid_menu_mission_unlock_gui.close(slot4)

		self._raid_menu_mission_unlock_gui = nil
		slot5 = managers.menu
		local active_menu = managers.menu.active_menu(slot4)

		if active_menu then
			slot7 = false

			active_menu.input.set_force_input(slot5, active_menu.input)
		end
	end

	return 
end
function MenuComponentManager:create_raid_menu_mission_join_gui(node, component)
	slot7 = component

	return self._create_raid_menu_mission_join_gui(slot4, self, node)
end
function MenuComponentManager:_create_raid_menu_mission_join_gui(node, component)
	slot7 = component

	self.close_raid_menu_mission_join_gui(slot4, self, node)

	slot9 = component
	self._raid_menu_mission_join_gui = MissionJoinGui.new(slot4, MissionJoinGui, self._ws, self._fullscreen_ws, node)

	if component then
		self._active_controls[component] = {}
		local final_list = self._active_controls[component]
		slot6 = self._raid_menu_mission_join_gui._root_panel._controls

		for _, control in ipairs(slot5) do
			slot13 = final_list

			self._collect_controls(slot10, self, control)
		end
	end

	slot5 = managers.menu
	local active_menu = managers.menu.active_menu(slot4)

	if active_menu then
		slot7 = true

		active_menu.input.set_force_input(slot5, active_menu.input)
	end

	slot7 = self._raid_menu_mission_join_gui

	table.insert(slot5, self._update_components)

	return self._raid_menu_mission_join_gui
end
function MenuComponentManager:close_raid_menu_mission_join_gui(node, component)
	if component then
		self._active_controls[component] = {}
	end

	if self._raid_menu_mission_join_gui then
		slot6 = self._raid_menu_mission_join_gui

		self.removeFromUpdateTable(slot4, self)

		slot5 = self._raid_menu_mission_join_gui

		self._raid_menu_mission_join_gui.close(slot4)

		self._raid_menu_mission_join_gui = nil
		slot5 = managers.menu
		local active_menu = managers.menu.active_menu(slot4)

		if active_menu then
			slot7 = false

			active_menu.input.set_force_input(slot5, active_menu.input)
		end
	end

	return 
end
function MenuComponentManager:create_raid_menu_weapon_select_gui(node, component)
	slot7 = component

	return self._create_raid_menu_weapon_select_gui(slot4, self, node)
end
function MenuComponentManager:_create_raid_menu_weapon_select_gui(node, component)
	slot7 = component

	self.close_raid_menu_weapon_select_gui(slot4, self, node)

	slot9 = component
	self._raid_menu_weapon_select_gui = WeaponSelectionGui.new(slot4, WeaponSelectionGui, self._ws, self._fullscreen_ws, node)

	if component then
		self._active_controls[component] = {}
		local final_list = self._active_controls[component]
		slot6 = self._raid_menu_weapon_select_gui._root_panel._controls

		for _, control in ipairs(slot5) do
			slot13 = final_list

			self._collect_controls(slot10, self, control)
		end

		final_list.weapon_list = self._raid_menu_weapon_select_gui._weapon_list
	end

	slot5 = managers.menu
	local active_menu = managers.menu.active_menu(slot4)

	if active_menu then
		slot7 = true

		active_menu.input.set_force_input(slot5, active_menu.input)
	end

	return self._raid_menu_weapon_select_gui
end
function MenuComponentManager:close_raid_menu_weapon_select_gui(node, component)
	if component then
		self._active_controls[component] = {}
	end

	if self._raid_menu_weapon_select_gui then
		slot5 = self._raid_menu_weapon_select_gui

		self._raid_menu_weapon_select_gui.close(slot4)

		self._raid_menu_weapon_select_gui = nil
		slot5 = managers.menu
		local active_menu = managers.menu.active_menu(slot4)

		if active_menu then
			slot7 = false

			active_menu.input.set_force_input(slot5, active_menu.input)
		end
	end

	return 
end
function MenuComponentManager:create_raid_menu_main_menu_gui(node, component)
	slot7 = component

	return self._create_raid_menu_main_menu_gui(slot4, self, node)
end
function MenuComponentManager:_create_raid_menu_main_menu_gui(node, component)
	slot7 = component

	self.close_raid_menu_main_menu_gui(slot4, self, node)

	slot9 = component
	self._raid_menu_main_menu_gui = RaidMainMenuGui.new(slot4, RaidMainMenuGui, self._ws, self._fullscreen_ws, node)

	if component then
		self._active_controls[component] = {}
		local final_list = self._active_controls[component]
		slot6 = self._raid_menu_main_menu_gui._root_panel._controls

		for _, control in ipairs(slot5) do
			slot13 = final_list

			self._collect_controls(slot10, self, control)
		end
	end

	slot5 = managers.menu
	local active_menu = managers.menu.active_menu(slot4)

	if active_menu then
		slot7 = true

		active_menu.input.set_force_input(slot5, active_menu.input)
	end

	return self._raid_menu_main_menu_gui
end
function MenuComponentManager:close_raid_menu_main_menu_gui(node, component)
	if component then
		self._active_controls[component] = {}
	end

	if self._raid_menu_main_menu_gui then
		slot5 = self._raid_menu_main_menu_gui

		self._raid_menu_main_menu_gui.close(slot4)

		self._raid_menu_main_menu_gui = nil
		slot5 = managers.menu
		local active_menu = managers.menu.active_menu(slot4)

		if active_menu then
			slot7 = false

			active_menu.input.set_force_input(slot5, active_menu.input)
		end
	end

	return 
end
function MenuComponentManager:create_raid_menu_select_character_profile_gui(node, component)
	slot7 = component

	return self._create_raid_menu_select_character_profile_gui(slot4, self, node)
end
function MenuComponentManager:_create_raid_menu_select_character_profile_gui(node, component)
	slot7 = component

	self.close_raid_menu_select_character_profile_gui(slot4, self, node)

	slot9 = component
	self._raid_menu_select_character_profile_gui = CharacterSelectionGui.new(slot4, CharacterSelectionGui, self._ws, self._fullscreen_ws, node)

	if component then
		self._active_controls[component] = {}
		local final_list = self._active_controls[component]
		slot6 = self._raid_menu_select_character_profile_gui._root_panel._controls

		for _, control in ipairs(slot5) do
			slot13 = final_list

			self._collect_controls(slot10, self, control)
		end
	end

	slot5 = managers.menu
	local active_menu = managers.menu.active_menu(slot4)

	if active_menu then
		slot7 = true

		active_menu.input.set_force_input(slot5, active_menu.input)
	end

	slot7 = self._raid_menu_select_character_profile_gui

	table.insert(slot5, self._update_components)

	return self._raid_menu_select_character_profile_gui
end
function MenuComponentManager:close_raid_menu_select_character_profile_gui(node, component)
	if component then
		self._active_controls[component] = {}
	end

	if self._raid_menu_select_character_profile_gui then
		slot6 = self._raid_menu_select_character_profile_gui

		self.removeFromUpdateTable(slot4, self)

		slot5 = self._raid_menu_select_character_profile_gui

		self._raid_menu_select_character_profile_gui.close(slot4)

		self._raid_menu_select_character_profile_gui = nil
		slot5 = managers.menu
		local active_menu = managers.menu.active_menu(slot4)

		if active_menu then
			slot7 = false

			active_menu.input.set_force_input(slot5, active_menu.input)
		end
	end

	return 
end
function MenuComponentManager:create_raid_menu_create_character_profile_gui(node, component)
	slot7 = component

	return self._create_raid_menu_create_character_profile_gui(slot4, self, node)
end
function MenuComponentManager:_create_raid_menu_create_character_profile_gui(node, component)
	slot7 = component

	self.close_raid_menu_create_character_profile_gui(slot4, self, node)

	slot9 = component
	self._raid_menu_create_character_profile_gui = CharacterCreationGui.new(slot4, CharacterCreationGui, self._ws, self._fullscreen_ws, node)

	if component then
		self._active_controls[component] = {}
		local final_list = self._active_controls[component]
		slot6 = self._raid_menu_create_character_profile_gui._root_panel._controls

		for _, control in ipairs(slot5) do
			slot13 = final_list

			self._collect_controls(slot10, self, control)
		end
	end

	slot5 = managers.menu
	local active_menu = managers.menu.active_menu(slot4)

	if active_menu then
		slot7 = true

		active_menu.input.set_force_input(slot5, active_menu.input)
	end

	slot7 = self._raid_menu_create_character_profile_gui

	table.insert(slot5, self._update_components)

	return self._raid_menu_create_character_profile_gui
end
function MenuComponentManager:close_raid_menu_create_character_profile_gui(node, component)
	if component then
		self._active_controls[component] = {}
	end

	if self._raid_menu_create_character_profile_gui then
		slot6 = self._raid_menu_create_character_profile_gui

		self.removeFromUpdateTable(slot4, self)

		slot5 = self._raid_menu_create_character_profile_gui

		self._raid_menu_create_character_profile_gui.close(slot4)

		self._raid_menu_create_character_profile_gui = nil
		slot5 = managers.menu
		local active_menu = managers.menu.active_menu(slot4)

		if active_menu then
			slot7 = false

			active_menu.input.set_force_input(slot5, active_menu.input)
		end
	end

	return 
end
function MenuComponentManager:create_raid_menu_character_customization_gui(node, component)
	slot7 = component

	return self._create_raid_menu_character_customization_gui(slot4, self, node)
end
function MenuComponentManager:_create_raid_menu_character_customization_gui(node, component)
	slot7 = component

	self.close_raid_menu_character_customization_gui(slot4, self, node)

	slot9 = component
	self._raid_menu_character_customization_gui = CharacterCustomizationGui.new(slot4, CharacterCustomizationGui, self._ws, self._fullscreen_ws, node)

	if component then
		self._active_controls[component] = {}
		local final_list = self._active_controls[component]
		slot6 = self._raid_menu_character_customization_gui._root_panel._controls

		for _, control in ipairs(slot5) do
			slot13 = final_list

			self._collect_controls(slot10, self, control)
		end

		final_list.character_customizations_grid = self._raid_menu_character_customization_gui._character_customizations_grid
	end

	slot5 = managers.menu
	local active_menu = managers.menu.active_menu(slot4)

	if active_menu then
		slot7 = true

		active_menu.input.set_force_input(slot5, active_menu.input)
	end

	return self._raid_menu_character_customization_gui
end
function MenuComponentManager:close_raid_menu_character_customization_gui(node, component)
	if component then
		self._active_controls[component] = {}
	end

	if self._raid_menu_character_customization_gui then
		slot5 = self._raid_menu_character_customization_gui

		self._raid_menu_character_customization_gui.close(slot4)

		self._raid_menu_character_customization_gui = nil
		slot5 = managers.menu
		local active_menu = managers.menu.active_menu(slot4)

		if active_menu then
			slot7 = false

			active_menu.input.set_force_input(slot5, active_menu.input)
		end
	end

	return 
end
function MenuComponentManager:create_raid_menu_gold_asset_store_gui(node, component)
	slot7 = component

	return self._create_raid_menu_gold_asset_store_gui(slot4, self, node)
end
function MenuComponentManager:_create_raid_menu_gold_asset_store_gui(node, component)
	slot7 = component

	self.close_raid_menu_gold_asset_store_gui(slot4, self, node)

	slot9 = component
	self._raid_menu_gold_asset_store_gui = GoldAssetStoreGui.new(slot4, GoldAssetStoreGui, self._ws, self._fullscreen_ws, node)

	if component then
		self._active_controls[component] = {}
		local final_list = self._active_controls[component]
		slot6 = self._raid_menu_gold_asset_store_gui._root_panel._controls

		for _, control in ipairs(slot5) do
			slot13 = final_list

			self._collect_controls(slot10, self, control)
		end

		final_list.gold_asset_store_grid = self._raid_menu_gold_asset_store_gui._gold_asset_store_grid
	end

	slot5 = managers.menu
	local active_menu = managers.menu.active_menu(slot4)

	if active_menu then
		slot7 = true

		active_menu.input.set_force_input(slot5, active_menu.input)
	end

	slot7 = self._raid_menu_gold_asset_store_gui

	table.insert(slot5, self._update_components)

	return self._raid_menu_gold_asset_store_gui
end
function MenuComponentManager:close_raid_menu_gold_asset_store_gui(node, component)
	if component then
		self._active_controls[component] = {}
	end

	if self._raid_menu_gold_asset_store_gui then
		slot6 = self._raid_menu_gold_asset_store_gui

		self.removeFromUpdateTable(slot4, self)

		slot5 = self._raid_menu_gold_asset_store_gui

		self._raid_menu_gold_asset_store_gui.close(slot4)

		self._raid_menu_gold_asset_store_gui = nil
		slot5 = managers.menu
		local active_menu = managers.menu.active_menu(slot4)

		if active_menu then
			slot7 = false

			active_menu.input.set_force_input(slot5, active_menu.input)
		end
	end

	return 
end
function MenuComponentManager:create_raid_menu_intel_gui(node, component)
	slot7 = component

	return self._create_raid_menu_intel_gui(slot4, self, node)
end
function MenuComponentManager:_create_raid_menu_intel_gui(node, component)
	slot7 = component

	self.close_raid_menu_intel_gui(slot4, self, node)

	slot9 = component
	self._raid_menu_intel_gui = IntelGui.new(slot4, IntelGui, self._ws, self._fullscreen_ws, node)

	if component then
		self._active_controls[component] = {}
		local final_list = self._active_controls[component]
		slot6 = self._raid_menu_intel_gui._root_panel._controls

		for _, control in ipairs(slot5) do
			slot13 = final_list

			self._collect_controls(slot10, self, control)
		end

		final_list.intel_grid = self._raid_menu_intel_gui._intel_grid
	end

	slot5 = managers.menu
	local active_menu = managers.menu.active_menu(slot4)

	if active_menu then
		slot7 = true

		active_menu.input.set_force_input(slot5, active_menu.input)
	end

	slot7 = self._raid_menu_intel_gui

	table.insert(slot5, self._update_components)

	return self._raid_menu_intel_gui
end
function MenuComponentManager:close_raid_menu_intel_gui(node, component)
	if component then
		self._active_controls[component] = {}
	end

	if self._raid_menu_intel_gui then
		slot6 = self._raid_menu_intel_gui

		self.removeFromUpdateTable(slot4, self)

		slot5 = self._raid_menu_intel_gui

		self._raid_menu_intel_gui.close(slot4)

		self._raid_menu_intel_gui = nil
		slot5 = managers.menu
		local active_menu = managers.menu.active_menu(slot4)

		if active_menu then
			slot7 = false

			active_menu.input.set_force_input(slot5, active_menu.input)
		end
	end

	return 
end
function MenuComponentManager:create_raid_menu_comic_book_gui(node, component)
	slot7 = component

	return self._create_raid_menu_comic_book_gui(slot4, self, node)
end
function MenuComponentManager:_create_raid_menu_comic_book_gui(node, component)
	slot7 = component

	self.close_raid_menu_comic_book_gui(slot4, self, node)

	slot9 = component
	self._raid_menu_comic_book_gui = ComicBookGui.new(slot4, ComicBookGui, self._ws, self._fullscreen_ws, node)

	if component then
		self._active_controls[component] = {}
		local final_list = self._active_controls[component]
		slot6 = self._raid_menu_comic_book_gui._root_panel._controls

		for _, control in ipairs(slot5) do
			slot13 = final_list

			self._collect_controls(slot10, self, control)
		end
	end

	slot5 = managers.menu
	local active_menu = managers.menu.active_menu(slot4)

	if active_menu then
		slot7 = true

		active_menu.input.set_force_input(slot5, active_menu.input)
	end

	return self._raid_menu_comic_book_gui
end
function MenuComponentManager:close_raid_menu_comic_book_gui(node, component)
	if component then
		self._active_controls[component] = {}
	end

	if self._raid_menu_comic_book_gui then
		slot5 = self._raid_menu_comic_book_gui

		self._raid_menu_comic_book_gui.close(slot4)

		self._raid_menu_comic_book_gui = nil
		slot5 = managers.menu
		local active_menu = managers.menu.active_menu(slot4)

		if active_menu then
			slot7 = false

			active_menu.input.set_force_input(slot5, active_menu.input)
		end
	end

	return 
end
function MenuComponentManager:create_raid_menu_header_gui(node, component)
	slot7 = component

	return self._create_raid_menu_header_gui(slot4, self, node)
end
function MenuComponentManager:_create_raid_menu_header_gui(node, component)
	slot5 = self

	self.close_raid_menu_header_gui(slot4)

	slot9 = component
	self._raid_menu_header_gui = RaidMenuHeader.new(slot4, RaidMenuHeader, self._ws, self._fullscreen_ws, node)
	slot5 = managers.menu
	local active_menu = managers.menu.active_menu(slot4)

	if active_menu then
		slot7 = true

		active_menu.input.set_force_input(slot5, active_menu.input)
	end

	return self._raid_menu_header_gui
end
function MenuComponentManager:close_raid_menu_header_gui()
	if self._raid_menu_header_gui then
		slot3 = self._raid_menu_header_gui

		self._raid_menu_header_gui.close(slot2)

		self._raid_menu_header_gui = nil
		slot3 = managers.menu
		local active_menu = managers.menu.active_menu(slot2)

		if active_menu then
			slot5 = false

			active_menu.input.set_force_input(slot3, active_menu.input)
		end
	end

	return 
end
function MenuComponentManager:create_raid_menu_footer_gui(node, component)
	slot7 = component

	return self._create_raid_menu_footer_gui(slot4, self, node)
end
function MenuComponentManager:_create_raid_menu_footer_gui(node, component)
	slot7 = component

	self.close_raid_menu_footer_gui(slot4, self, node)

	slot9 = component
	self._raid_menu_footer_gui = RaidMenuFooter.new(slot4, RaidMenuFooter, self._ws, self._fullscreen_ws, node)
	slot5 = managers.menu
	local active_menu = managers.menu.active_menu(slot4)

	if active_menu then
		slot7 = true

		active_menu.input.set_force_input(slot5, active_menu.input)
	end

	return self._raid_menu_footer_gui
end
function MenuComponentManager:close_raid_menu_footer_gui(node, component)
	if self._raid_menu_footer_gui then
		slot5 = self._raid_menu_footer_gui

		self._raid_menu_footer_gui.close(slot4)

		self._raid_menu_footer_gui = nil
		slot5 = managers.menu
		local active_menu = managers.menu.active_menu(slot4)

		if active_menu then
			slot7 = false

			active_menu.input.set_force_input(slot5, active_menu.input)
		end
	end

	return 
end
function MenuComponentManager:create_raid_menu_left_options_gui(node, component)
	slot7 = component

	return self._create_raid_menu_left_options_gui(slot4, self, node)
end
function MenuComponentManager:_create_raid_menu_left_options_gui(node, component)
	slot7 = component

	self.close_raid_menu_left_options_gui(slot4, self, node)

	slot9 = component
	self._raid_menu_left_options_gui = RaidMenuLeftOptions.new(slot4, RaidMenuLeftOptions, self._ws, self._fullscreen_ws, node)

	if component then
		self._active_controls[component] = {}
		local final_list = self._active_controls[component]
		slot6 = self._raid_menu_left_options_gui._root_panel._controls

		for _, control in ipairs(slot5) do
			slot13 = final_list

			self._collect_controls(slot10, self, control)
		end
	end

	slot5 = managers.menu
	local active_menu = managers.menu.active_menu(slot4)

	if active_menu then
		slot7 = true

		active_menu.input.set_force_input(slot5, active_menu.input)
	end

	return self._raid_menu_left_options_gui
end
function MenuComponentManager:close_raid_menu_left_options_gui(node, component)
	if component then
		self._active_controls[component] = {}
	end

	if self._raid_menu_left_options_gui then
		slot5 = self._raid_menu_left_options_gui

		self._raid_menu_left_options_gui.close(slot4)

		self._raid_menu_left_options_gui = nil
		slot5 = managers.menu
		local active_menu = managers.menu.active_menu(slot4)

		if active_menu then
			slot7 = false

			active_menu.input.set_force_input(slot5, active_menu.input)
		end
	end

	return 
end
function MenuComponentManager:create_raid_options_background_gui(node, component)
	slot7 = component

	return self._create_raid_options_background_gui(slot4, self, node)
end
function MenuComponentManager:_create_raid_options_background_gui(node, component)
	slot7 = component

	self.close_raid_options_background_gui(slot4, self, node)

	slot9 = component
	self._raid_options_background_gui = RaidOptionsBackground.new(slot4, RaidOptionsBackground, self._ws, self._fullscreen_ws, node)

	if component then
		self._active_controls[component] = {}
		local final_list = self._active_controls[component]
		slot6 = self._raid_options_background_gui._root_panel._controls

		for _, control in ipairs(slot5) do
			slot13 = final_list

			self._collect_controls(slot10, self, control)
		end
	end

	slot5 = managers.menu
	local active_menu = managers.menu.active_menu(slot4)

	if active_menu then
		slot7 = true

		active_menu.input.set_force_input(slot5, active_menu.input)
	end

	return self._raid_options_background_gui
end
function MenuComponentManager:close_raid_options_background_gui(node, component)
	if component then
		self._active_controls[component] = {}
	end

	if self._raid_options_background_gui then
		slot5 = self._raid_options_background_gui

		self._raid_options_background_gui.close(slot4)

		self._raid_options_background_gui = nil
		slot5 = managers.menu
		local active_menu = managers.menu.active_menu(slot4)

		if active_menu then
			slot7 = false

			active_menu.input.set_force_input(slot5, active_menu.input)
		end
	end

	return 
end
function MenuComponentManager:create_raid_menu_options_controls_gui(node, component)
	slot7 = component

	return self._create_raid_menu_options_controls_gui(slot4, self, node)
end
function MenuComponentManager:_create_raid_menu_options_controls_gui(node, component)
	slot7 = component

	self.close_raid_menu_options_controls_gui(slot4, self, node)

	slot9 = component
	self._raid_options_controls_gui = RaidMenuOptionsControls.new(slot4, RaidMenuOptionsControls, self._ws, self._fullscreen_ws, node)

	if component then
		self._active_controls[component] = {}
		local final_list = self._active_controls[component]
		slot6 = self._raid_options_controls_gui._root_panel._controls

		for _, control in ipairs(slot5) do
			slot13 = final_list

			self._collect_controls(slot10, self, control)
		end
	end

	slot5 = managers.menu
	local active_menu = managers.menu.active_menu(slot4)

	if active_menu then
		slot7 = true

		active_menu.input.set_force_input(slot5, active_menu.input)
	end

	return self._raid_options_controls_gui
end
function MenuComponentManager:close_raid_menu_options_controls_gui(node, component)
	if component then
		self._active_controls[component] = {}
	end

	if self._raid_options_controls_gui then
		slot5 = self._raid_options_controls_gui

		self._raid_options_controls_gui.close(slot4)

		self._raid_options_controls_gui = nil
		slot5 = managers.menu
		local active_menu = managers.menu.active_menu(slot4)

		if active_menu then
			slot7 = false

			active_menu.input.set_force_input(slot5, active_menu.input)
		end
	end

	return 
end
function MenuComponentManager:create_raid_menu_options_controls_keybinds_gui(node, component)
	slot7 = component

	return self._create_raid_menu_options_controls_keybinds_gui(slot4, self, node)
end
function MenuComponentManager:_create_raid_menu_options_controls_keybinds_gui(node, component)
	slot7 = component

	self.close_raid_menu_options_controls_keybinds_gui(slot4, self, node)

	slot9 = component
	self._raid_options_controls_keybinds_gui = RaidMenuOptionsControlsKeybinds.new(slot4, RaidMenuOptionsControlsKeybinds, self._ws, self._fullscreen_ws, node)

	if component then
		self._active_controls[component] = {}
		local final_list = self._active_controls[component]
		slot6 = self._raid_options_controls_keybinds_gui._root_panel._controls

		for _, control in ipairs(slot5) do
			slot13 = final_list

			self._collect_controls(slot10, self, control)
		end
	end

	slot5 = managers.menu
	local active_menu = managers.menu.active_menu(slot4)

	if active_menu then
		slot7 = true

		active_menu.input.set_force_input(slot5, active_menu.input)
	end

	return self._raid_options_controls_keybinds_gui
end
function MenuComponentManager:close_raid_menu_options_controls_keybinds_gui(node, component)
	if component then
		self._active_controls[component] = {}
	end

	if self._raid_options_controls_keybinds_gui then
		slot5 = self._raid_options_controls_keybinds_gui

		self._raid_options_controls_keybinds_gui.close(slot4)

		self._raid_options_controls_keybinds_gui = nil
		slot5 = managers.menu
		local active_menu = managers.menu.active_menu(slot4)

		if active_menu then
			slot7 = false

			active_menu.input.set_force_input(slot5, active_menu.input)
		end
	end

	return 
end
function MenuComponentManager:create_raid_menu_options_controller_mapping_gui(node, component)
	slot7 = component

	return self._create_raid_menu_options_controller_mapping_gui(slot4, self, node)
end
function MenuComponentManager:_create_raid_menu_options_controller_mapping_gui(node, component)
	slot7 = component

	self.close_raid_menu_options_controller_mapping_gui(slot4, self, node)

	slot9 = component
	self._raid_menu_options_controller_mapping_gui = RaidMenuOptionsControlsControllerMapping.new(slot4, RaidMenuOptionsControlsControllerMapping, self._ws, self._fullscreen_ws, node)

	if component then
		self._active_controls[component] = {}
		local final_list = self._active_controls[component]
		slot6 = self._raid_menu_options_controller_mapping_gui._root_panel._controls

		for _, control in ipairs(slot5) do
			slot13 = final_list

			self._collect_controls(slot10, self, control)
		end
	end

	slot5 = managers.menu
	local active_menu = managers.menu.active_menu(slot4)

	if active_menu then
		slot7 = true

		active_menu.input.set_force_input(slot5, active_menu.input)
	end

	return self._raid_menu_options_controller_mapping_gui
end
function MenuComponentManager:close_raid_menu_options_controller_mapping_gui(node, component)
	if component then
		self._active_controls[component] = {}
	end

	if self._raid_menu_options_controller_mapping_gui then
		slot5 = self._raid_menu_options_controller_mapping_gui

		self._raid_menu_options_controller_mapping_gui.close(slot4)

		self._raid_menu_options_controller_mapping_gui = nil
		slot5 = managers.menu
		local active_menu = managers.menu.active_menu(slot4)

		if active_menu then
			slot7 = false

			active_menu.input.set_force_input(slot5, active_menu.input)
		end
	end

	return 
end
function MenuComponentManager:create_raid_menu_options_sound_gui(node, component)
	slot7 = component

	return self._create_raid_menu_options_sound_gui(slot4, self, node)
end
function MenuComponentManager:_create_raid_menu_options_sound_gui(node, component)
	slot7 = component

	self.close_raid_menu_options_sound_gui(slot4, self, node)

	slot9 = component
	self._raid_options_sound_gui = RaidMenuOptionsSound.new(slot4, RaidMenuOptionsSound, self._ws, self._fullscreen_ws, node)

	if component then
		self._active_controls[component] = {}
		local final_list = self._active_controls[component]
		slot6 = self._raid_options_sound_gui._root_panel._controls

		for _, control in ipairs(slot5) do
			slot13 = final_list

			self._collect_controls(slot10, self, control)
		end
	end

	slot5 = managers.menu
	local active_menu = managers.menu.active_menu(slot4)

	if active_menu then
		slot7 = true

		active_menu.input.set_force_input(slot5, active_menu.input)
	end

	return self._raid_options_sound_gui
end
function MenuComponentManager:close_raid_menu_options_sound_gui(node, component)
	if component then
		self._active_controls[component] = {}
	end

	if self._raid_options_sound_gui then
		slot5 = self._raid_options_sound_gui

		self._raid_options_sound_gui.close(slot4)

		self._raid_options_sound_gui = nil
		slot5 = managers.menu
		local active_menu = managers.menu.active_menu(slot4)

		if active_menu then
			slot7 = false

			active_menu.input.set_force_input(slot5, active_menu.input)
		end
	end

	return 
end
function MenuComponentManager:create_raid_menu_options_network_gui(node, component)
	slot7 = component

	return self._create_raid_menu_options_network_gui(slot4, self, node)
end
function MenuComponentManager:_create_raid_menu_options_network_gui(node, component)
	slot7 = component

	self.close_raid_menu_options_network_gui(slot4, self, node)

	slot9 = component
	self._raid_options_network_gui = RaidMenuOptionsNetwork.new(slot4, RaidMenuOptionsNetwork, self._ws, self._fullscreen_ws, node)

	if component then
		self._active_controls[component] = {}
		local final_list = self._active_controls[component]
		slot6 = self._raid_options_network_gui._root_panel._controls

		for _, control in ipairs(slot5) do
			slot13 = final_list

			self._collect_controls(slot10, self, control)
		end
	end

	slot5 = managers.menu
	local active_menu = managers.menu.active_menu(slot4)

	if active_menu then
		slot7 = true

		active_menu.input.set_force_input(slot5, active_menu.input)
	end

	return self._raid_options_network_gui
end
function MenuComponentManager:close_raid_menu_options_network_gui(node, component)
	if component then
		self._active_controls[component] = {}
	end

	if self._raid_options_network_gui then
		slot5 = self._raid_options_network_gui

		self._raid_options_network_gui.close(slot4)

		self._raid_options_network_gui = nil
		slot5 = managers.menu
		local active_menu = managers.menu.active_menu(slot4)

		if active_menu then
			slot7 = false

			active_menu.input.set_force_input(slot5, active_menu.input)
		end
	end

	return 
end
function MenuComponentManager:create_raid_menu_options_video_gui(node, component)
	slot7 = component

	return self._create_raid_menu_options_video_gui(slot4, self, node)
end
function MenuComponentManager:_create_raid_menu_options_video_gui(node, component)
	slot7 = component

	self.close_raid_menu_options_video_gui(slot4, self, node)

	slot9 = component
	self._raid_options_video_gui = RaidMenuOptionsVideo.new(slot4, RaidMenuOptionsVideo, self._ws, self._fullscreen_ws, node)

	if component then
		self._active_controls[component] = {}
		local final_list = self._active_controls[component]
		slot6 = self._raid_options_video_gui._root_panel._controls

		for _, control in ipairs(slot5) do
			slot13 = final_list

			self._collect_controls(slot10, self, control)
		end
	end

	slot5 = managers.menu
	local active_menu = managers.menu.active_menu(slot4)

	if active_menu then
		slot7 = true

		active_menu.input.set_force_input(slot5, active_menu.input)
	end

	return self._raid_options_video_gui
end
function MenuComponentManager:close_raid_menu_options_video_gui(node, component)
	if component then
		self._active_controls[component] = {}
	end

	if self._raid_options_video_gui then
		slot5 = self._raid_options_video_gui

		self._raid_options_video_gui.close(slot4)

		self._raid_options_video_gui = nil
		slot5 = managers.menu
		local active_menu = managers.menu.active_menu(slot4)

		if active_menu then
			slot7 = false

			active_menu.input.set_force_input(slot5, active_menu.input)
		end
	end

	return 
end
function MenuComponentManager:create_raid_menu_options_video_advanced_gui(node, component)
	slot7 = component

	return self._create_raid_menu_options_video_advanced_gui(slot4, self, node)
end
function MenuComponentManager:_create_raid_menu_options_video_advanced_gui(node, component)
	slot7 = component

	self.close_raid_menu_options_video_advanced_gui(slot4, self, node)

	slot9 = component
	self._raid_options_video_advanced_gui = RaidMenuOptionsVideoAdvanced.new(slot4, RaidMenuOptionsVideoAdvanced, self._ws, self._fullscreen_ws, node)

	if component then
		self._active_controls[component] = {}
		local final_list = self._active_controls[component]
		slot6 = self._raid_options_video_advanced_gui._root_panel._controls

		for _, control in ipairs(slot5) do
			slot13 = final_list

			self._collect_controls(slot10, self, control)
		end
	end

	slot5 = managers.menu
	local active_menu = managers.menu.active_menu(slot4)

	if active_menu then
		slot7 = true

		active_menu.input.set_force_input(slot5, active_menu.input)
	end

	return self._raid_options_video_advanced_gui
end
function MenuComponentManager:close_raid_menu_options_video_advanced_gui(node, component)
	if component then
		self._active_controls[component] = {}
	end

	if self._raid_options_video_advanced_gui then
		slot5 = self._raid_options_video_advanced_gui

		self._raid_options_video_advanced_gui.close(slot4)

		self._raid_options_video_advanced_gui = nil
		slot5 = managers.menu
		local active_menu = managers.menu.active_menu(slot4)

		if active_menu then
			slot7 = false

			active_menu.input.set_force_input(slot5, active_menu.input)
		end
	end

	return 
end
function MenuComponentManager:create_raid_ready_up_gui(node, component)
	slot7 = component

	self.close_raid_ready_up_gui(slot4, self, node)

	slot9 = component
	self._raid_ready_up_gui = ReadyUpGui.new(slot4, ReadyUpGui, self._ws, self._fullscreen_ws, node)
	slot5 = managers.menu
	local active_menu = managers.menu.active_menu(slot4)

	if active_menu then
		slot7 = true

		active_menu.input.set_force_input(slot5, active_menu.input)
	end

	slot7 = self._raid_ready_up_gui

	table.insert(slot5, self._update_components)

	return self._raid_ready_up_gui
end
function MenuComponentManager:close_raid_ready_up_gui(node, component)
	if component then
		self._active_controls[component] = {}
	end

	if self._raid_ready_up_gui then
		slot6 = self._raid_ready_up_gui

		self.removeFromUpdateTable(slot4, self)

		slot5 = self._raid_ready_up_gui

		self._raid_ready_up_gui.close(slot4)

		self._raid_ready_up_gui = nil
	end

	return 
end
function MenuComponentManager:create_raid_challenge_cards_gui(node, component)
	slot7 = component

	return self._create_raid_challenge_cards_gui(slot4, self, node)
end
function MenuComponentManager:_create_raid_challenge_cards_gui(node, component)
	slot7 = component

	self.close_raid_challenge_cards_gui(slot4, self, node)

	slot9 = component
	self._raid_challenge_cards_gui = ChallengeCardsGui.new(slot4, ChallengeCardsGui, self._ws, self._fullscreen_ws, node)

	if component then
		self._active_controls[component] = {}
		local final_list = self._active_controls[component]
		slot6 = self._raid_challenge_cards_gui._root_panel._controls

		for _, control in ipairs(slot5) do
			slot13 = final_list

			self._collect_controls(slot10, self, control)
		end

		final_list.card_grid = self._raid_challenge_cards_gui._card_grid
	end

	slot5 = managers.menu
	local active_menu = managers.menu.active_menu(slot4)

	if active_menu then
		slot7 = true

		active_menu.input.set_force_input(slot5, active_menu.input)
	end

	slot7 = self._raid_challenge_cards_gui

	table.insert(slot5, self._update_components)

	return self._raid_challenge_cards_gui
end
function MenuComponentManager:close_raid_challenge_cards_gui(node, component)
	if component then
		self._active_controls[component] = {}
	end

	if self._raid_challenge_cards_gui then
		slot6 = self._raid_challenge_cards_gui

		self.removeFromUpdateTable(slot4, self)

		slot5 = self._raid_challenge_cards_gui

		self._raid_challenge_cards_gui.close(slot4)

		self._raid_challenge_cards_gui = nil
	end

	return 
end
function MenuComponentManager:create_raid_challenge_cards_view_gui(node, component)
	slot7 = component

	return self._create_raid_challenge_cards_view_gui(slot4, self, node)
end
function MenuComponentManager:_create_raid_challenge_cards_view_gui(node, component)
	slot7 = component

	self.close_raid_challenge_cards_view_gui(slot4, self, node)

	slot9 = component
	self._raid_challenge_cards_view_gui = ChallengeCardsViewGui.new(slot4, ChallengeCardsViewGui, self._ws, self._fullscreen_ws, node)

	if component then
		self._active_controls[component] = {}
		local final_list = self._active_controls[component]
		slot6 = self._raid_challenge_cards_view_gui._root_panel._controls

		for _, control in ipairs(slot5) do
			slot13 = final_list

			self._collect_controls(slot10, self, control)
		end
	end

	slot5 = managers.menu
	local active_menu = managers.menu.active_menu(slot4)

	if active_menu then
		slot7 = true

		active_menu.input.set_force_input(slot5, active_menu.input)
	end

	return self._raid_challenge_cards_view_gui
end
function MenuComponentManager:close_raid_challenge_cards_view_gui(node, component)
	if component then
		self._active_controls[component] = {}
	end

	if self._raid_challenge_cards_view_gui then
		slot5 = self._raid_challenge_cards_view_gui

		self._raid_challenge_cards_view_gui.close(slot4)

		self._raid_challenge_cards_view_gui = nil
		slot5 = managers.menu
		local active_menu = managers.menu.active_menu(slot4)

		if active_menu then
			slot7 = false

			active_menu.input.set_force_input(slot5, active_menu.input)
		end
	end

	return 
end
function MenuComponentManager:create_raid_challenge_cards_loot_reward_gui(node, component)
	slot7 = component

	return self._create_raid_challenge_cards_loot_reward_gui(slot4, self, node)
end
function MenuComponentManager:_create_raid_challenge_cards_loot_reward_gui(node, component)
	slot7 = component

	self.close_raid_challenge_cards_loot_reward_gui(slot4, self, node)

	slot9 = component
	self._raid_challenge_cards_loot_reward_gui = ChallengeCardsLootRewardGui.new(slot4, ChallengeCardsLootRewardGui, self._ws, self._fullscreen_ws, node)

	if component then
		self._active_controls[component] = {}
		local final_list = self._active_controls[component]
		slot6 = self._raid_challenge_cards_loot_reward_gui._root_panel._controls

		for _, control in ipairs(slot5) do
			slot13 = final_list

			self._collect_controls(slot10, self, control)
		end
	end

	slot5 = managers.menu
	local active_menu = managers.menu.active_menu(slot4)

	if active_menu then
		slot7 = true

		active_menu.input.set_force_input(slot5, active_menu.input)
	end

	slot7 = self._raid_challenge_cards_loot_reward_gui

	table.insert(slot5, self._update_components)

	return self._raid_challenge_cards_loot_reward_gui
end
function MenuComponentManager:close_raid_challenge_cards_loot_reward_gui(node, component)
	if component then
		self._active_controls[component] = {}
	end

	if self._raid_challenge_cards_loot_reward_gui then
		slot6 = self._raid_challenge_cards_loot_reward_gui

		self.removeFromUpdateTable(slot4, self)

		slot5 = self._raid_challenge_cards_loot_reward_gui

		self._raid_challenge_cards_loot_reward_gui.close(slot4)

		self._raid_challenge_cards_loot_reward_gui = nil
		slot5 = managers.menu
		local active_menu = managers.menu.active_menu(slot4)

		if active_menu then
			slot7 = false

			active_menu.input.set_force_input(slot5, active_menu.input)
		end
	end

	return 
end
function MenuComponentManager:create_raid_menu_xp(node, component)
	slot7 = component

	return self._create_raid_menu_xp(slot4, self, node)
end
function MenuComponentManager:_create_raid_menu_xp(node, component)
	slot7 = component

	self.close_raid_menu_xp(slot4, self, node)

	slot9 = component
	self._raid_menu_xp_gui = ExperienceGui.new(slot4, ExperienceGui, self._ws, self._fullscreen_ws, node)

	if component then
		self._active_controls[component] = {}
		local final_list = self._active_controls[component]
		slot6 = self._raid_menu_xp_gui._root_panel._controls

		for _, control in ipairs(slot5) do
			slot13 = final_list

			self._collect_controls(slot10, self, control)
		end
	end

	slot5 = managers.menu
	local active_menu = managers.menu.active_menu(slot4)

	if active_menu then
		slot7 = true

		active_menu.input.set_force_input(slot5, active_menu.input)
	end

	return self._raid_menu_xp_gui
end
function MenuComponentManager:close_raid_menu_xp(node, component)
	if component then
		self._active_controls[component] = {}
	end

	if self._raid_menu_xp_gui then
		slot5 = self._raid_menu_xp_gui

		self._raid_menu_xp_gui.close(slot4)

		self._raid_menu_xp_gui = nil
		slot5 = managers.menu
		local active_menu = managers.menu.active_menu(slot4)

		if active_menu then
			slot7 = false

			active_menu.input.set_force_input(slot5, active_menu.input)
		end
	end

	return 
end
function MenuComponentManager:create_raid_menu_post_game_breakdown(node, component)
	slot7 = component

	return self._create_raid_menu_post_game_breakdown(slot4, self, node)
end
function MenuComponentManager:_create_raid_menu_post_game_breakdown(node, component)
	slot7 = component

	self.close_raid_menu_post_game_breakdown(slot4, self, node)

	slot9 = component
	self._raid_menu_post_game_breakdown_gui = PostGameBreakdownGui.new(slot4, PostGameBreakdownGui, self._ws, self._fullscreen_ws, node)

	if component then
		self._active_controls[component] = {}
		local final_list = self._active_controls[component]
		slot6 = self._raid_menu_post_game_breakdown_gui._root_panel._controls

		for _, control in ipairs(slot5) do
			slot13 = final_list

			self._collect_controls(slot10, self, control)
		end
	end

	slot5 = managers.menu
	local active_menu = managers.menu.active_menu(slot4)

	if active_menu then
		slot7 = true

		active_menu.input.set_force_input(slot5, active_menu.input)
	end

	return self._raid_menu_post_game_breakdown_gui
end
function MenuComponentManager:close_raid_menu_post_game_breakdown(node, component)
	if component then
		self._active_controls[component] = {}
	end

	if self._raid_menu_post_game_breakdown_gui then
		slot5 = self._raid_menu_post_game_breakdown_gui

		self._raid_menu_post_game_breakdown_gui.close(slot4)

		self._raid_menu_post_game_breakdown_gui = nil
		slot5 = managers.menu
		local active_menu = managers.menu.active_menu(slot4)

		if active_menu then
			slot7 = false

			active_menu.input.set_force_input(slot5, active_menu.input)
		end
	end

	return 
end
function MenuComponentManager:create_raid_menu_special_honors(node, component)
	slot7 = component

	return self._create_raid_menu_special_honors(slot4, self, node)
end
function MenuComponentManager:_create_raid_menu_special_honors(node, component)
	slot7 = component

	self.close_raid_menu_special_honors(slot4, self, node)

	slot9 = component
	self._raid_menu_special_honors_gui = SpecialHonorsGui.new(slot4, SpecialHonorsGui, self._ws, self._fullscreen_ws, node)

	if component then
		self._active_controls[component] = {}
		local final_list = self._active_controls[component]
		slot6 = self._raid_menu_special_honors_gui._root_panel._controls

		for _, control in ipairs(slot5) do
			slot13 = final_list

			self._collect_controls(slot10, self, control)
		end
	end

	slot5 = managers.menu
	local active_menu = managers.menu.active_menu(slot4)

	if active_menu then
		slot7 = true

		active_menu.input.set_force_input(slot5, active_menu.input)
	end

	return self._raid_menu_special_honors_gui
end
function MenuComponentManager:close_raid_menu_special_honors(node, component)
	if component then
		self._active_controls[component] = {}
	end

	if self._raid_menu_special_honors_gui then
		slot5 = self._raid_menu_special_honors_gui

		self._raid_menu_special_honors_gui.close(slot4)

		self._raid_menu_special_honors_gui = nil
		slot5 = managers.menu
		local active_menu = managers.menu.active_menu(slot4)

		if active_menu then
			slot7 = false

			active_menu.input.set_force_input(slot5, active_menu.input)
		end
	end

	return 
end
function MenuComponentManager:create_raid_menu_loot(node, component)
	slot7 = component

	return self._create_raid_menu_loot(slot4, self, node)
end
function MenuComponentManager:_create_raid_menu_loot(node, component)
	slot7 = component

	self.close_raid_menu_loot(slot4, self, node)

	slot9 = component
	self._raid_menu_loot_gui = LootScreenGui.new(slot4, LootScreenGui, self._ws, self._fullscreen_ws, node)

	if component then
		self._active_controls[component] = {}
		local final_list = self._active_controls[component]
		slot6 = self._raid_menu_loot_gui._root_panel._controls

		for _, control in ipairs(slot5) do
			slot13 = final_list

			self._collect_controls(slot10, self, control)
		end
	end

	slot5 = managers.menu
	local active_menu = managers.menu.active_menu(slot4)

	if active_menu then
		slot7 = true

		active_menu.input.set_force_input(slot5, active_menu.input)
	end

	return self._raid_menu_loot_gui
end
function MenuComponentManager:close_raid_menu_loot(node, component)
	if component then
		self._active_controls[component] = {}
	end

	if self._raid_menu_loot_gui then
		slot5 = self._raid_menu_loot_gui

		self._raid_menu_loot_gui.close(slot4)

		self._raid_menu_loot_gui = nil
		slot5 = managers.menu
		local active_menu = managers.menu.active_menu(slot4)

		if active_menu then
			slot7 = false

			active_menu.input.set_force_input(slot5, active_menu.input)
		end
	end

	return 
end
function MenuComponentManager:create_raid_menu_greed_loot(node, component)
	slot7 = component

	return self._create_raid_menu_greed_loot(slot4, self, node)
end
function MenuComponentManager:_create_raid_menu_greed_loot(node, component)
	slot7 = component

	self.close_raid_menu_loot(slot4, self, node)

	slot9 = component
	self._raid_menu_greed_loot_gui = GreedLootScreenGui.new(slot4, GreedLootScreenGui, self._ws, self._fullscreen_ws, node)

	if component then
		self._active_controls[component] = {}
		local final_list = self._active_controls[component]
		slot6 = self._raid_menu_greed_loot_gui._root_panel._controls

		for _, control in ipairs(slot5) do
			slot13 = final_list

			self._collect_controls(slot10, self, control)
		end
	end

	slot5 = managers.menu
	local active_menu = managers.menu.active_menu(slot4)

	if active_menu then
		slot7 = true

		active_menu.input.set_force_input(slot5, active_menu.input)
	end

	return self._raid_menu_greed_loot_gui
end
function MenuComponentManager:close_raid_menu_greed_loot(node, component)
	if component then
		self._active_controls[component] = {}
	end

	if self._raid_menu_greed_loot_gui then
		slot5 = self._raid_menu_greed_loot_gui

		self._raid_menu_greed_loot_gui.close(slot4)

		self._raid_menu_greed_loot_gui = nil
		slot5 = managers.menu
		local active_menu = managers.menu.active_menu(slot4)

		if active_menu then
			slot7 = false

			active_menu.input.set_force_input(slot5, active_menu.input)
		end
	end

	return 
end
function MenuComponentManager:create_raid_menu_credits(node, component)
	slot7 = component

	return self._create_raid_menu_credits(slot4, self, node)
end
function MenuComponentManager:_create_raid_menu_credits(node, component)
	slot7 = component

	self.close_raid_menu_credits(slot4, self, node)

	slot9 = component
	self._raid_menu_credits_gui = RaidMenuCreditsGui.new(slot4, RaidMenuCreditsGui, self._ws, self._fullscreen_ws, node)
	slot6 = self._raid_menu_credits_gui

	table.insert(slot4, self._update_components)

	slot5 = managers.menu
	local active_menu = managers.menu.active_menu(slot4)

	if active_menu then
		slot7 = true

		active_menu.input.set_force_input(slot5, active_menu.input)
	end

	return self._raid_menu_credits_gui
end
function MenuComponentManager:close_raid_menu_credits(node, component)
	if component then
		self._active_controls[component] = {}
	end

	if self._raid_menu_credits_gui then
		slot6 = self._raid_menu_credits_gui

		self.removeFromUpdateTable(slot4, self)

		slot5 = self._raid_menu_credits_gui

		self._raid_menu_credits_gui.close(slot4)

		self._raid_menu_credits_gui = nil
		slot5 = managers.menu
		local active_menu = managers.menu.active_menu(slot4)

		if active_menu then
			slot7 = false

			active_menu.input.set_force_input(slot5, active_menu.input)
		end
	end

	return 
end
function MenuComponentManager:_collect_controls(controls_list, final_list)
	if controls_list._controls then
		slot5 = controls_list._controls

		for _, control in ipairs(slot4) do
			if control._controls then
				slot12 = final_list

				self._collect_controls(slot9, self, control._controls)
			elseif control._name and control._type and control._type == "raid_gui_control" then
				final_list[control._name] = control
			end
		end
	end

	if controls_list._name and controls_list._type and controls_list._type == "raid_gui_control" then
		final_list[controls_list._name] = controls_list
	else
		slot5 = controls_list

		for _, control in ipairs(slot4) do
			if control._type and control._type == "raid_gui_control" then
				final_list[control._name] = control
			end
		end
	end

	return 
end
function MenuComponentManager:gather_controls_for_component(component_name)
	if component_name then
		self._active_controls[component_name] = {}
		local final_list = self._active_controls[component_name]
		local component_object = self._active_components[component_name].component_object

		if component_object then
			slot6 = component_object._root_panel._controls

			for _, control in ipairs(slot5) do
				slot13 = final_list

				self._collect_controls(slot10, self, control)
			end
		end
	end

	return 
end
function MenuComponentManager:debug_controls()
	local component_controls = self._active_controls
	slot4 = component_controls

	for name, controls in pairs(slot3) do
		slot10 = name

		print(slot8, "MenuComponentManager:debug_controls - inspecting ")

		slot9 = controls

		for name, control in pairs(slot8) do
			slot17 = control._name

			print(slot13, "MenuComponentManager:debug_controls: ", control._type, name)
		end
	end

	slot4 = self._raid_menu_mission_join_gui._root_panel._controls

	for idx, control in ipairs(slot3) do
		slot11 = control._name

		Application.trace(slot8, Application, idx)
	end

	return 
end
function MenuComponentManager:removeFromUpdateTable(unit)
	for i = 1, #self._update_components, 1 do
		if self._update_components[i] == unit then
			slot9 = i

			table.remove(slot7, self._update_components)
		end
	end

	return 
end

return 
