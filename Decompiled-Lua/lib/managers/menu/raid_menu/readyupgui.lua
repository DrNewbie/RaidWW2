-- Decompilation Error: self.ljd.ast.slotworks.eliminate_temporary(self.ast)

-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot0 = ReadyUpGui

if not slot0 then
	slot0 = class
	slot2 = RaidGuiBase
	slot0 = slot0(slot1)
end

ReadyUpGui = slot0
slot0 = ReadyUpGui

function slot1(self, ws, fullscreen_ws, node, component_name)
	slot5 = Network
	slot7 = slot5
	slot5 = slot5.is_server
	slot5 = slot5(slot6)

	if slot5 then
		slot5 = managers
		slot5 = slot5.network
		slot7 = slot5
		slot5 = slot5.session
		slot5 = slot5(slot6)
		slot7 = slot5
		slot5 = slot5.set_state
		slot8 = "in_lobby"

		slot5(slot6, slot7)

		slot5 = managers
		slot5 = slot5.network
		slot7 = slot5
		slot5 = slot5.session
		slot5 = slot5(slot6)
		slot7 = slot5
		slot5 = slot5.chk_server_joinable_state

		slot5(slot6)
	else
		slot5 = false
		self._synced_document_spawn_chance_to_host = slot5
	end

	slot7 = managers.raid_job
	self._continuing_mission = managers.raid_job.current_job(slot6) ~= nil
	slot5 = ReadyUpGui.super.init
	slot7 = self
	slot8 = ws
	slot9 = fullscreen_ws
	slot10 = node
	slot11 = component_name

	slot5(slot6, slot7, slot8, slot9, slot10)

	slot7 = self
	slot5 = self._disable_dof

	slot5(slot6)

	slot5 = managers
	slot5 = slot5.system_event_listener
	slot7 = slot5
	slot5 = slot5.add_listener
	slot8 = "ready_up_gui_player_kicked"
	slot9 = {}
	slot10 = CoreSystemEventListenerManager
	slot10 = slot10.SystemEventListenerManager
	slot10 = slot10.PLAYER_KICKED
	slot9[1] = slot10
	slot10 = callback
	slot12 = self
	slot13 = self
	slot14 = "_on_peer_kicked"

	slot5(slot6, slot7, slot8, slot10(slot11, slot12, slot13))

	slot5 = managers
	slot5 = slot5.system_event_listener
	slot7 = slot5
	slot5 = slot5.add_listener
	slot8 = "ready_up_gui_player_left"
	slot9 = {}
	slot10 = CoreSystemEventListenerManager
	slot10 = slot10.SystemEventListenerManager
	slot10 = slot10.PLAYER_LEFT
	slot9[1] = slot10
	slot10 = callback
	slot12 = self
	slot13 = self
	slot14 = "_on_peer_left"

	slot5(slot6, slot7, slot8, slot10(slot11, slot12, slot13))

	slot5 = managers
	slot5 = slot5.system_event_listener
	slot7 = slot5
	slot5 = slot5.add_listener
	slot8 = "ready_up_gui_inventory_processed"
	slot9 = {}
	slot10 = CoreSystemEventListenerManager
	slot10 = slot10.SystemEventListenerManager
	slot10 = slot10.EVENT_STEAM_INVENTORY_PROCESSED
	slot9[1] = slot10
	slot10 = callback
	slot12 = self
	slot13 = self
	slot14 = "_players_inventory_processed"

	slot5(slot6, slot7, slot8, slot10(slot11, slot12, slot13))

	slot5 = managers
	slot5 = slot5.raid_menu
	slot7 = slot5
	slot5 = slot5.register_on_escape_callback
	slot8 = callback
	slot10 = self
	slot11 = self
	slot12 = "back_pressed"

	slot5(slot6, slot8(slot9, slot10, slot11))

	slot5 = RaidMenuCallbackHandler
	slot7 = slot5
	slot5 = slot5.new
	slot5 = slot5(slot6)
	self._callback_handler = slot5
	slot5 = managers
	slot5 = slot5.hud
	slot7 = slot5
	slot5 = slot5.hud_chat
	slot5 = slot5(slot6)
	slot7 = slot5
	slot5 = slot5.unregister

	slot5(slot6)

	slot5 = managers
	slot5 = slot5.raid_menu
	slot7 = slot5
	slot5 = slot5.hide_background

	slot5(slot6)

	slot5 = true
	self._local_player_selected = slot5
	slot5 = Global
	slot5 = slot5.statistics_manager
	slot6 = true
	slot5.playing_from_start = slot6

	return 
end

slot0.init = slot1
slot0 = ReadyUpGui

function slot1(self)
	slot1 = ReadyUpGui
	slot1 = slot1.super
	slot1 = slot1._setup_properties
	slot3 = self

	slot1(slot2)

	slot1 = nil
	self._background = slot1
	slot1 = nil
	self._background_rect = slot1

	return 
end

slot0._setup_properties = slot1

function slot0()
	slot0 = pairs
	slot2 = managers
	slot2 = slot2.network
	slot4 = slot2
	slot2 = slot2.session
	slot2 = slot2(slot3)
	slot4 = slot2
	slot2 = slot2.all_peers
	slot0, slot1, slot2 = slot0(slot2(slot3))

	for i, peer in slot0, slot1, slot2 do
		slot5 = managers
		slot5 = slot5.network
		slot7 = slot5
		slot5 = slot5.session
		slot5 = slot5(slot6)
		slot7 = slot5
		slot5 = slot5.local_peer
		slot5 = slot5(slot6)

		if peer == slot5 then
			return i
		end
	end

	return 
end

_get_local_peer_index = slot0
slot0 = ReadyUpGui

function slot1(self)
	slot3 = Network
	self._is_host = Network.is_server(slot2)
	slot3 = managers.network
	slot3 = managers.network.session(slot2)
	self._is_single_player = managers.network.session(slot2).count_all_peers(slot2) == 1
	self._local_peer_index = _get_local_peer_index()
	slot3 = self
	slot1 = self._layout_card_info

	slot1(slot2)

	slot3 = self
	slot1 = self._layout_buttons

	slot1(slot2)

	slot3 = self
	slot1 = self._layout_header

	slot1(slot2)

	slot3 = self
	slot1 = self._layout_player_list

	slot1(slot2)

	slot1 = HUDChat
	slot3 = slot1
	slot1 = slot1.new
	slot4 = self._ws
	slot5 = self._ws_panel
	slot6 = false
	slot1 = slot1(slot2, slot3, slot4, slot5)
	self._chat = slot1
	slot1 = self._chat
	slot3 = slot1
	slot1 = slot1.set_bottom
	slot4 = self._root_panel
	slot6 = slot4
	slot4 = slot4.h
	slot4 = slot4(slot5)
	slot5 = HUDManager
	slot5 = slot5.CHAT_DISTANCE_FROM_BOTTOM
	slot4 = slot4 - slot5

	slot1(slot2, slot3)

	slot1 = self._chat
	slot3 = slot1
	slot1 = slot1._on_focus

	slot1(slot2)

	slot3 = self
	slot1 = self._load_character_empty_skeleton

	slot1(slot2)

	slot1 = managers
	slot1 = slot1.challenge_cards
	slot3 = slot1
	slot1 = slot1.set_automatic_steam_inventory_refresh
	slot4 = true

	slot1(slot2, slot3)

	slot1 = managers
	slot1 = slot1.network
	slot1 = slot1.account
	slot3 = slot1
	slot1 = slot1.inventory_load

	slot1(slot2)

	return 
end

slot0._layout = slot1
slot0 = ReadyUpGui

function slot1(self)
	local button_y = 848
	slot2 = self._root_panel
	slot4 = slot2
	slot2 = slot2.short_primary_button
	slot5 = {
		name = "ready_up_button",
		visible = false,
		x = 0,
		y = button_y
	}
	slot8 = self
	slot6 = self.translate
	slot9 = "menu_ready_button"
	slot10 = true
	slot6 = slot6(slot7, slot8, slot9)
	slot5.text = slot6
	slot6 = callback
	slot8 = self
	slot9 = self
	slot10 = "_on_ready_up_button"
	slot6 = slot6(slot7, slot8, slot9)
	slot5.on_click_callback = slot6
	slot2 = slot2(slot3, slot4)
	self._ready_up_button = slot2
	slot2 = self._ready_up_button
	slot4 = slot2
	slot2 = slot2.disable

	slot2(slot3)

	slot2 = self._root_panel
	slot4 = slot2
	slot2 = slot2.short_secondary_button
	slot5 = {
		name = "suggest_card_button",
		visible = false,
		x = 1000,
		y = button_y
	}
	slot8 = self
	slot6 = self.translate
	slot9 = "menu_suggest_card_button"
	slot10 = true
	slot6 = slot6(slot7, slot8, slot9)
	slot5.text = slot6
	slot6 = callback
	slot8 = self
	slot9 = self
	slot10 = "_on_select_card_button"
	slot6 = slot6(slot7, slot8, slot9)
	slot5.on_click_callback = slot6
	slot2 = slot2(slot3, slot4)
	self._suggest_card_button = slot2
	slot2 = self._suggest_card_button
	slot4 = slot2
	slot2 = slot2.set_right
	slot5 = self._root_panel
	slot7 = slot5
	slot5 = slot5.right

	slot2(slot3, slot5(slot6))

	slot2 = self._suggest_card_button
	slot4 = slot2
	slot2 = slot2.disable

	slot2(slot3)

	slot2 = self._suggest_card_button
	slot4 = slot2
	slot2 = slot2.hide

	slot2(slot3)

	slot2 = self._root_panel
	slot4 = slot2
	slot2 = slot2.label
	slot5 = {
		visible = false,
		name = "no_cards_warning_label",
		align = "right",
		x = 1000,
		y = button_y
	}
	slot8 = self
	slot6 = self.translate
	slot9 = "menu_card_dont_own"
	slot10 = true
	slot6 = slot6(slot7, slot8, slot9)
	slot5.text = slot6
	slot6 = tweak_data
	slot6 = slot6.gui
	slot6 = slot6.fonts
	slot6 = slot6.din_compressed
	slot5.font = slot6
	slot6 = tweak_data
	slot6 = slot6.gui
	slot6 = slot6.font_sizes
	slot6 = slot6.extra_small
	slot5.font_size = slot6
	slot6 = tweak_data
	slot6 = slot6.gui
	slot6 = slot6.colors
	slot6 = slot6.raid_red
	slot5.color = slot6
	slot2 = slot2(slot3, slot4)
	self._no_cards_warning_label = slot2
	slot2 = self._no_cards_warning_label
	slot4 = slot2
	slot2 = slot2.text_rect
	local x1, y1, w1, h1 = slot2(slot3)
	slot6 = self._no_cards_warning_label
	slot8 = slot6
	slot6 = slot6.set_w
	slot9 = w1

	slot6(slot7, slot8)

	slot6 = self._no_cards_warning_label
	slot8 = slot6
	slot6 = slot6.set_h
	slot9 = h1

	slot6(slot7, slot8)

	slot6 = self._no_cards_warning_label
	slot8 = slot6
	slot6 = slot6.set_right
	slot9 = self._root_panel
	slot11 = slot9
	slot9 = slot9.right

	slot6(slot7, slot9(slot10))

	slot6 = self._no_cards_warning_label
	slot8 = slot6
	slot6 = slot6.set_center_y
	slot9 = self._suggest_card_button
	slot11 = slot9
	slot9 = slot9.center_y

	slot6(slot7, slot9(slot10))

	slot6 = self._is_host

	if slot6 then
		slot6 = self._root_panel
		slot8 = slot6
		slot6 = slot6.short_secondary_button
		slot9 = {
			name = "kick_button",
			x = 1000,
			y = button_y
		}
		slot12 = self
		slot10 = self.translate
		slot13 = "menu_kick_button"
		slot14 = true
		slot10 = slot10(slot11, slot12, slot13)
		slot9.text = slot10
		slot10 = callback
		slot12 = self
		slot13 = self
		slot14 = "_on_kick_button"
		slot10 = slot10(slot11, slot12, slot13)
		slot9.on_click_callback = slot10
		slot6 = slot6(slot7, slot8)
		self._kick_button = slot6
		slot6 = self._kick_button
		slot8 = slot6
		slot6 = slot6.set_right
		slot9 = self._root_panel
		slot11 = slot9
		slot9 = slot9.right

		slot6(slot7, slot9(slot10))

		slot6 = self._kick_button
		slot8 = slot6
		slot6 = slot6.hide

		slot6(slot7)
	end

	slot6 = self._root_panel
	slot8 = slot6
	slot6 = slot6.short_tertiary_button
	slot9 = {
		name = "leave_lobby_button",
		visible = false
	}
	slot10 = self._ready_up_button
	slot12 = slot10
	slot10 = slot10.right
	slot10 = slot10(slot11)
	slot10 = slot10 + 64
	slot9.x = slot10
	slot9.y = button_y
	slot12 = self
	slot10 = self.translate
	slot13 = "menu_leave_lobby_button"
	slot14 = true
	slot10 = slot10(slot11, slot12, slot13)
	slot9.text = slot10
	slot10 = callback
	slot12 = self
	slot13 = self
	slot14 = "_on_leave_lobby_button"
	slot10 = slot10(slot11, slot12, slot13)
	slot9.on_click_callback = slot10
	slot6 = slot6(slot7, slot8)
	self._leave_lobby_button = slot6
	slot6 = self._leave_lobby_button
	slot8 = slot6
	slot6 = slot6.disable

	slot6(slot7)

	slot6 = self._leave_lobby_button
	slot8 = slot6
	slot6 = slot6.hide

	slot6(slot7)

	slot6 = self._is_single_player

	if slot6 then
		slot6 = self._suggest_card_button
		slot8 = slot6
		slot6 = slot6.set_text
		slot11 = self
		slot9 = self.translate
		slot12 = "menu_select_card_button"
		slot13 = true

		slot6(slot7, slot9(slot10, slot11, slot12))

		slot6 = self._ready_up_button
		slot8 = slot6
		slot6 = slot6.set_text
		slot11 = self
		slot9 = self.translate
		slot12 = "menu_start_button_title"
		slot13 = true

		slot6(slot7, slot9(slot10, slot11, slot12))
	end

	return 
end

slot0._layout_buttons = slot1
slot0 = ReadyUpGui

function slot1(self)
	local selected_job = managers.raid_job.selected_job(slot2)
	slot4 = managers.raid_job
	local current_job = managers.raid_job.current_job(managers.raid_job)
	local selected_level_data = selected_job or current_job
	slot4 = tweak_data
	slot4 = slot4.operations
	slot6 = slot4
	slot4 = slot4.mission_data
	slot7 = selected_level_data.job_id
	local mission_data = slot4(slot5, slot6)
	local item_icon_name = mission_data.icon_menu
	local item_icon = {}
	slot7 = tweak_data
	slot7 = slot7.gui
	slot7 = slot7.icons
	slot7 = slot7[item_icon_name]
	slot7 = slot7.texture
	item_icon.texture = slot7
	slot7 = tweak_data
	slot7 = slot7.gui
	slot7 = slot7.icons
	slot7 = slot7[item_icon_name]
	slot7 = slot7.texture_rect
	item_icon.tex_rect = slot7
	slot7 = tweak_data
	slot7 = slot7.gui
	slot7 = slot7.colors
	slot7 = slot7.dirty_white
	item_icon.color = slot7
	slot7 = self._node
	slot7 = slot7.components
	slot7 = slot7.raid_menu_header
	slot9 = slot7
	slot7 = slot7.set_header_icon
	slot10 = item_icon

	slot7(slot8, slot9)

	local mission_name = nil

	if current_job then
		local name_id = current_job.name_id
		slot9 = current_job.events_index
		local total_events = #slot9
		slot10 = math
		slot10 = slot10.clamp
		slot12 = current_job.current_event
		slot13 = 1
		slot14 = total_events
		local current_event = slot10(slot11, slot12, slot13)
		slot11 = " "
		slot12 = current_event
		slot13 = "/"
		slot14 = total_events
		slot15 = ": "
		local mission_progress_fraction = slot11 .. slot12 .. slot13 .. slot14 .. slot15
		slot14 = self
		slot12 = self.translate
		slot15 = current_job.current_event_data
		slot15 = slot15.name_id
		slot16 = true
		local event_name = slot12(slot13, slot14, slot15)
		slot15 = self
		slot13 = self.translate
		slot16 = name_id
		slot17 = true
		slot13 = slot13(slot14, slot15, slot16)
		slot14 = mission_progress_fraction
		slot15 = event_name
		local title_text = slot13 .. slot14 .. slot15
		mission_name = title_text
	else
		slot8 = utf8
		slot8 = slot8.to_upper
		slot10 = managers
		slot10 = slot10.localization
		slot12 = slot10
		slot10 = slot10.text
		slot13 = tweak_data
		slot13 = slot13.operations
		slot13 = slot13.missions
		slot14 = selected_job.job_id
		slot13 = slot13[slot14]
		slot13 = slot13.name_id
		slot8 = slot8(slot10(slot11, slot12))
		mission_name = slot8
	end

	slot8 = tweak_data
	slot8 = slot8.gui
	slot10 = slot8
	slot8 = slot8.icon_w
	slot11 = item_icon_name
	slot8 = slot8(slot9, slot10)
	local mission_info_x = slot8 + 16
	local mission_name_params = {
		vertical = "center",
		name = "mission_name",
		h = 32,
		align = "left",
		y = 0,
		x = mission_info_x
	}
	slot10 = tweak_data
	slot10 = slot10.gui
	slot10 = slot10.fonts
	slot10 = slot10.din_compressed
	mission_name_params.font = slot10
	slot10 = tweak_data
	slot10 = slot10.gui
	slot10 = slot10.font_sizes
	slot10 = slot10.small
	mission_name_params.font_size = slot10
	slot10 = tweak_data
	slot10 = slot10.gui
	slot10 = slot10.colors
	slot10 = slot10.raid_red
	mission_name_params.color = slot10
	mission_name_params.text = mission_name
	slot10 = self._root_panel
	slot12 = slot10
	slot10 = slot10.label
	slot13 = mission_name_params
	local mission_name = slot10(slot11, slot12)
	local difficulty_params = {
		name = "mission_difficulty"
	}
	slot12 = tweak_data
	slot14 = slot12
	slot12 = slot12.number_of_difficulties
	slot12 = slot12(slot13)
	difficulty_params.amount = slot12
	slot12 = RaidGuiControlDifficultyStars
	slot14 = slot12
	slot12 = slot12.new
	slot15 = self._root_panel
	slot16 = difficulty_params
	slot12 = slot12(slot13, slot14, slot15)
	self._difficulty_indicator = slot12
	slot12 = self._difficulty_indicator
	slot14 = slot12
	slot12 = slot12.set_x
	slot17 = mission_name
	slot15 = mission_name.x

	slot12(slot13, slot15(slot16))

	slot12 = self._difficulty_indicator
	slot14 = slot12
	slot12 = slot12.set_center_y
	slot15 = 45

	slot12(slot13, slot14)

	slot12 = tweak_data
	slot14 = slot12
	slot12 = slot12.difficulty_to_index
	slot15 = Global
	slot15 = slot15.game_settings
	slot15 = slot15.difficulty
	local current_difficulty = slot12(slot13, slot14)
	slot13 = self._difficulty_indicator
	slot15 = slot13
	slot13 = slot13.set_active_difficulty
	slot16 = current_difficulty

	slot13(slot14, slot15)

	slot13 = self._node
	slot13 = slot13.components
	slot13 = slot13.raid_menu_header
	slot15 = slot13
	slot13 = slot13.set_screen_name_raw
	slot16 = ""

	slot13(slot14, slot15)

	return 
end

slot0._layout_header = slot1
slot0 = ReadyUpGui

function slot1(self, peer_index)
	local wanted_local_peer_list_index = 2
	slot3 = self._is_single_player

	if slot3 then
		wanted_local_peer_list_index = 1
	end

	slot3 = self._local_peer_index

	if peer_index == slot3 then
		return wanted_local_peer_list_index
	elseif peer_index == wanted_local_peer_list_index then
		slot3 = self._local_peer_index

		return slot3
	end

	return peer_index
end

slot0._get_list_index = slot1
slot0 = ReadyUpGui

function slot1(self)
	slot1 = {}
	self._player_control_list = slot1
	slot1 = nil
	self._current_peer = slot1
	slot1 = nil
	self._current_peer_index = slot1
	local width = 432
	slot2 = pairs
	slot4 = managers
	slot4 = slot4.network
	slot6 = slot4
	slot4 = slot4.session
	slot4 = slot4(slot5)
	slot6 = slot4
	slot4 = slot4.all_peers
	slot2, slot3, slot4 = slot2(slot4(slot5))

	for peer_index, peer in slot2, slot3, slot4 do
		slot10 = peer_index
		local list_index = self._get_list_index(slot8, self)
		slot10 = managers.network
		slot10 = managers.network.session(self)
		local current_player = peer == managers.network.session(self).local_peer(self)
		slot9 = self._root_panel
		slot11 = slot9
		slot9 = slot9.create_custom_control
		slot12 = RaidGUIControlReadyUpPlayerDescription
		slot13 = {
			h = 112,
			y = 96
		}
		slot14 = list_index - 1
		slot14 = slot14 * width
		slot13.x = slot14
		slot13.w = width
		slot14 = callback
		slot16 = self
		slot17 = self
		slot18 = "_on_player_click_callback"
		slot14 = slot14(slot15, slot16, slot17)
		slot13.on_click_callback = slot14
		slot13.is_current_player = current_player
		slot13.peer = peer
		slot13.peer_index = peer_index
		slot13.list_index = list_index
		local player_control = slot9(slot10, slot11, slot12)
		slot12 = peer
		slot10 = peer.blackmarket_outfit
		local outfit = slot10(slot11)
		local player_data = {}
		slot14 = peer
		slot12 = peer.name
		slot12 = slot12(slot13)
		player_data.player_name = slot12
		slot14 = peer
		slot12 = peer.level
		slot12 = slot12(slot13)

		if not slot12 then
			slot12 = managers
			slot12 = slot12.experience
			slot14 = slot12
			slot12 = slot12.current_level
			slot12 = slot12(slot13)
		end

		player_data.player_level = slot12
		slot12 = outfit.skills
		player_data.player_class = slot12
		slot14 = peer
		slot12 = peer.is_host
		slot12 = slot12(slot13)
		player_data.is_host = slot12
		slot14 = player_control
		slot12 = player_control.set_data
		slot15 = player_data

		slot12(slot13, slot14)

		if current_player then
			slot14 = player_control
			slot12 = player_control.on_mouse_clicked

			slot12(slot13)
		end

		slot12 = self._player_control_list
		slot12[peer] = player_control
	end

	return 
end

slot0._layout_player_list = slot1
slot0 = ReadyUpGui

function slot1(self)
	local card_w = 160
	local card_params = {
		name = "player_loot_card",
		y = 384,
		item_h = 224
	}
	slot3 = self._root_panel
	slot5 = slot3
	slot3 = slot3.w
	slot3 = slot3(slot4)
	slot3 = slot3 - 160
	card_params.x = slot3
	card_params.item_w = card_w
	slot3 = self._root_panel
	slot5 = slot3
	slot3 = slot3.create_custom_control
	slot6 = RaidGUIControlCardBase
	slot7 = card_params
	slot3 = slot3(slot4, slot5, slot6)
	self._card_control = slot3
	slot3 = self._card_control
	slot5 = slot3
	slot3 = slot3.set_visible
	slot6 = false

	slot3(slot4, slot5)

	slot3 = tweak_data
	slot3 = slot3.gui
	slot3 = slot3.icons
	local empty_slot_texture = slot3.cc_empty_slot_small
	slot4 = self._root_panel
	slot6 = slot4
	slot4 = slot4.bitmap
	slot7 = {
		name = "cc_empty_slot",
		y = 384
	}
	slot8 = self._root_panel
	slot10 = slot8
	slot8 = slot8.w
	slot8 = slot8(slot9)
	slot8 = slot8 - 160
	slot7.x = slot8
	slot8 = empty_slot_texture.texture_rect
	slot8 = slot8[3]
	slot7.w = slot8
	slot8 = empty_slot_texture.texture_rect
	slot8 = slot8[4]
	slot7.h = slot8
	slot8 = empty_slot_texture.texture
	slot7.texture = slot8
	slot8 = empty_slot_texture.texture_rect
	slot7.texture_rect = slot8
	slot4 = slot4(slot5, slot6)
	self._empty_card_slot = slot4
	slot4 = self._root_panel
	slot6 = slot4
	slot4 = slot4.label
	slot7 = {
		name = "card_not_selected_label",
		h = 128,
		wrap = true,
		align = "center"
	}
	slot8 = self._root_panel
	slot10 = slot8
	slot8 = slot8.w
	slot8 = slot8(slot9)
	slot8 = slot8 - 160
	slot7.x = slot8
	slot8 = self._card_control
	slot10 = slot8
	slot8 = slot8.top
	slot8 = slot8(slot9)
	slot8 = slot8 + 90
	slot7.y = slot8
	slot8 = self._empty_card_slot
	slot10 = slot8
	slot8 = slot8.w
	slot8 = slot8(slot9)
	slot8 = slot8 - 10
	slot7.w = slot8
	slot10 = self
	slot8 = self.translate
	slot11 = "menu_card_not_selected"
	slot12 = true
	slot8 = slot8(slot9, slot10, slot11)
	slot7.text = slot8
	slot8 = tweak_data
	slot8 = slot8.gui
	slot8 = slot8.fonts
	slot8 = slot8.din_compressed
	slot7.font = slot8
	slot8 = tweak_data
	slot8 = slot8.gui
	slot8 = slot8.font_sizes
	slot8 = slot8.extra_small
	slot7.font_size = slot8
	slot8 = tweak_data
	slot8 = slot8.gui
	slot8 = slot8.colors
	slot8 = slot8.dirty_white
	slot7.color = slot8
	slot4 = slot4(slot5, slot6)
	self._card_not_selected_label = slot4
	slot4 = self._card_not_selected_label
	slot6 = slot4
	slot4 = slot4.set_center_x
	slot7 = self._empty_card_slot
	slot9 = slot7
	slot7 = slot7.center_x

	slot4(slot5, slot7(slot8))

	slot4 = self._card_not_selected_label
	slot6 = slot4
	slot4 = slot4.set_visible
	slot7 = true

	slot4(slot5, slot6)

	slot4 = self._root_panel
	slot6 = slot4
	slot4 = slot4.label
	slot7 = {
		name = "positive_card_effect",
		h = 128,
		wrap = true,
		w = 352,
		align = "left",
		x = 0
	}
	slot8 = self._card_control
	slot10 = slot8
	slot8 = slot8.bottom
	slot8 = slot8(slot9)
	slot8 = slot8 + 32
	slot7.y = slot8
	slot10 = self
	slot8 = self.translate
	slot11 = "hud_no_challenge_card_text"
	slot12 = false
	slot8 = slot8(slot9, slot10, slot11)
	slot7.text = slot8
	slot8 = tweak_data
	slot8 = slot8.gui
	slot8 = slot8.fonts
	slot8 = slot8.lato
	slot7.font = slot8
	slot8 = tweak_data
	slot8 = slot8.gui
	slot8 = slot8.font_sizes
	slot8 = slot8.size_18
	slot7.font_size = slot8
	slot8 = tweak_data
	slot8 = slot8.gui
	slot8 = slot8.colors
	slot8 = slot8.raid_grey
	slot7.color = slot8
	slot4 = slot4(slot5, slot6)
	self._positive_card_effect_label = slot4
	slot4 = self._positive_card_effect_label
	slot6 = slot4
	slot4 = slot4.set_right
	slot7 = self._root_panel
	slot9 = slot7
	slot7 = slot7.right

	slot4(slot5, slot7(slot8))

	slot4 = self._root_panel
	slot6 = slot4
	slot4 = slot4.label
	slot7 = {
		name = "negative_card_effect",
		h = 64,
		wrap = true,
		w = 352,
		align = "left",
		text = "",
		x = 0
	}
	slot8 = self._card_control
	slot10 = slot8
	slot8 = slot8.bottom
	slot8 = slot8(slot9)
	slot8 = slot8 + 96
	slot7.y = slot8
	slot8 = tweak_data
	slot8 = slot8.gui
	slot8 = slot8.fonts
	slot8 = slot8.lato
	slot7.font = slot8
	slot8 = tweak_data
	slot8 = slot8.gui
	slot8 = slot8.font_sizes
	slot8 = slot8.size_18
	slot7.font_size = slot8
	slot8 = tweak_data
	slot8 = slot8.gui
	slot8 = slot8.colors
	slot8 = slot8.raid_grey
	slot7.color = slot8
	slot4 = slot4(slot5, slot6)
	self._negative_card_effect_label = slot4
	slot4 = self._negative_card_effect_label
	slot6 = slot4
	slot4 = slot4.set_right
	slot7 = self._root_panel
	slot9 = slot7
	slot7 = slot7.right

	slot4(slot5, slot7(slot8))

	slot4 = self._negative_card_effect_label
	slot6 = slot4
	slot4 = slot4.set_visible
	slot7 = false

	slot4(slot5, slot6)

	return 
end

slot0._layout_card_info = slot1
slot0 = ReadyUpGui

function slot1(self)
	slot1 = World
	slot3 = slot1
	slot1 = slot1.find_units_quick
	slot4 = "all"
	slot5 = managers
	slot5 = slot5.slot
	slot7 = slot5
	slot5 = slot5.get_mask
	slot8 = "env_effect"
	local units = slot1(slot2, slot3, slot5(slot6, slot7))
	slot2 = Idstring
	slot4 = "units/vanilla/characters/scenes/ready_up_scene"
	local ids_ready_up_scene_name = slot2(slot3)
	slot3 = {}
	self._character_spawn_locations = slot3

	if units then
		slot3 = pairs
		slot5 = units
		slot3, slot4, slot5 = slot3(slot4)

		for _, unit in slot3, slot4, slot5 do
			slot10 = unit
			slot8 = unit.name
			slot8 = slot8(slot9)

			if slot8 == ids_ready_up_scene_name then
				slot8 = 1
				slot9 = 4
				slot10 = 1

				for i = slot8, slot9, slot10 do
					slot12 = table
					slot12 = slot12.insert
					slot14 = self._character_spawn_locations
					slot17 = unit
					slot15 = unit.get_object
					slot18 = Idstring
					slot20 = "loc_player_0"
					slot21 = i
					slot20 = slot20 .. slot21

					slot12(slot13, slot15(slot16, slot18(slot19)))
				end
			end
		end
	end

	return 
end

slot0._get_character_spawn_locations = slot1
slot0 = ReadyUpGui

function slot1(self, params)
	slot2 = params.character_unit
	slot4 = slot2
	slot2 = slot2.get_object
	slot5 = Idstring
	slot7 = "a_weapon_right_front"
	local right_hand_locator = slot2(slot3, slot5(slot6))
	slot3 = safe_spawn_unit
	slot5 = params.unit_path
	slot8 = right_hand_locator
	slot6 = right_hand_locator.position
	slot6 = slot6(slot7)
	slot7 = Rotation
	slot9 = 0
	slot10 = 0
	slot11 = 0
	local weapon_unit = slot3(slot4, slot5, slot7(slot8, slot9, slot10))
	slot4 = params.character_unit
	slot6 = slot4
	slot4 = slot4.link
	slot7 = Idstring
	slot9 = "a_weapon_right_front"
	slot7 = slot7(slot8)
	slot8 = weapon_unit
	slot11 = weapon_unit
	slot9 = weapon_unit.orientation_object
	slot9 = slot9(slot10)
	slot11 = slot9
	slot9 = slot9.name

	slot4(slot5, slot6, slot7, slot9(slot10))

	slot4 = params.peer
	slot6 = slot4
	slot4 = slot4.blackmarket_outfit
	slot4 = slot4(slot5)
	slot4 = slot4.primary
	local weapon_blueprint = slot4.blueprint
	slot5 = managers
	slot5 = slot5.weapon_factory
	slot7 = slot5
	slot5 = slot5.assemble_from_blueprint
	slot8 = params.weapon_factory_id
	slot9 = weapon_unit
	slot10 = weapon_blueprint
	slot11 = true
	slot12 = callback
	slot14 = self
	slot15 = self
	slot16 = "_assemble_completed"
	slot17 = {}
	slot18 = params.peer
	slot17.peer = slot18
	slot12 = slot12(slot13, slot14, slot15, slot16)
	slot13 = true

	slot5(slot6, slot7, slot8, slot9, slot10, slot11, slot12)

	return 
end

slot0._spawn_weapon = slot1
slot0 = ReadyUpGui

function slot1(self, params, parts, blueprint)
	slot4 = self._spawned_weapon_parts
	slot5 = params.peer
	slot6 = {}
	slot4[slot5] = slot6
	slot4 = pairs
	slot6 = parts
	slot4, slot5, slot6 = slot4(slot5)

	for _, part in slot4, slot5, slot6 do
		slot9 = table
		slot9 = slot9.insert
		slot11 = self._spawned_weapon_parts
		slot12 = params.peer
		slot11 = slot11[slot12]
		slot12 = part.unit

		slot9(slot10, slot11)
	end

	slot4 = self._weapon_assembled
	slot5 = params.peer
	slot6 = true
	slot4[slot5] = slot6

	return 
end

slot0._assemble_completed = slot1
slot0 = ReadyUpGui

function slot1(self)
	slot1 = managers
	slot1 = slot1.dyn_resource
	slot3 = slot1
	slot1 = slot1.load
	slot4 = Idstring
	slot6 = "unit"
	slot4 = slot4(slot5)
	slot5 = Idstring
	slot7 = CharacterCustomizationTweakData
	slot7 = slot7.CRIMINAL_MENU_SELECT_UNIT
	slot5 = slot5(slot6)
	slot6 = DynamicResourceManager
	slot6 = slot6.DYN_RESOURCES_PACKAGE
	slot7 = callback
	slot9 = self
	slot10 = self
	slot11 = "_spawn_character_units"

	slot1(slot2, slot3, slot4, slot5, slot7(slot8, slot9, slot10))

	return 
end

slot0._load_character_empty_skeleton = slot1
slot0 = ReadyUpGui

function slot1(self, control_list_index)
	slot2 = self._is_single_player

	if slot2 then
		slot2 = 1

		return slot2
	end

	if control_list_index == 1 then
		slot2 = 2

		return slot2
	elseif control_list_index == 2 then
		slot2 = 1

		return slot2
	end

	return control_list_index
end

slot0._get_character_spawn_index = slot1
slot0 = ReadyUpGui

function slot1(self)
	slot3 = self
	slot1 = self._get_character_spawn_locations

	slot1(slot2)

	slot1 = {}
	self._spawned_character_units = slot1
	slot1 = {}
	self._weapon_assembled = slot1
	slot1 = {}
	self._spawned_weapon_parts = slot1
	slot1 = Idstring
	slot3 = CharacterCustomizationTweakData
	slot3 = slot3.CRIMINAL_MENU_SELECT_UNIT
	local ids_unit_name = slot1(slot2)
	slot2 = pairs
	slot4 = self._player_control_list
	slot2, slot3, slot4 = slot2(slot3)

	for peer, control in slot2, slot3, slot4 do
		slot9 = self
		slot7 = self._get_character_spawn_index
		slot12 = control
		slot10 = control.params
		slot10 = slot10(slot11)
		slot10 = slot10.list_index
		local locator_index = slot7(slot8, slot9)
		slot8 = self._character_spawn_locations
		slot8 = slot8[locator_index]
		slot10 = slot8
		slot8 = slot8.position
		slot8 = slot8(slot9)

		if not slot8 then
			slot8 = Vector3
			slot10 = 0
			slot11 = 0
			slot12 = 0
			local position = slot8(slot9, slot10, slot11)
		end

		slot9 = Rotation
		slot11 = 0
		slot12 = 0
		slot13 = 0
		local rotation = slot9(slot10, slot11, slot12)
		slot10 = World
		slot12 = slot10
		slot10 = slot10.spawn_unit
		slot13 = ids_unit_name
		slot14 = position
		slot15 = rotation
		local spawned_unit = slot10(slot11, slot12, slot13, slot14)
		slot11 = self._spawned_character_units
		slot11[peer] = spawned_unit
		slot13 = spawned_unit
		slot11 = spawned_unit.customization
		slot11 = slot11(slot12)
		slot13 = slot11
		slot11 = slot11.set_visible
		slot14 = false

		slot11(slot12, slot13)

		slot13 = peer
		slot11 = peer.blackmarket_outfit
		local outfit = slot11(slot12)
		slot14 = spawned_unit
		slot12 = spawned_unit.customization
		slot12 = slot12(slot13)
		slot14 = slot12
		slot12 = slot12.attach_all_parts_to_character_by_parts_for_husk
		slot15 = outfit.character_customization_nationality
		slot16 = outfit.character_customization_head
		slot17 = outfit.character_customization_upper
		slot18 = outfit.character_customization_lower
		slot19 = peer

		slot12(slot13, slot14, slot15, slot16, slot17, slot18)

		slot12 = managers
		slot12 = slot12.weapon_factory
		slot14 = slot12
		slot12 = slot12.get_weapon_id_by_factory_id
		slot15 = outfit.primary
		slot15 = slot15.factory_id
		local weapon_id = slot12(slot13, slot14)
		slot13 = managers
		slot13 = slot13.weapon_factory
		slot15 = slot13
		slot13 = slot13.get_factory_id_by_weapon_id
		slot16 = weapon_id
		local weapon_factory_id = slot13(slot14, slot15)
		slot14 = Idstring
		slot16 = tweak_data
		slot16 = slot16.weapon
		slot16 = slot16.factory
		slot16 = slot16[weapon_factory_id]
		slot16 = slot16.unit
		local unit_path = slot14(slot15)
		slot15 = self._weapon_assembled
		slot16 = false
		slot15[peer] = slot16
		slot15 = managers
		slot15 = slot15.dyn_resource
		slot17 = slot15
		slot15 = slot15.load
		slot18 = Idstring
		slot20 = "unit"
		slot18 = slot18(slot19)
		slot19 = unit_path
		slot20 = DynamicResourceManager
		slot20 = slot20.DYN_RESOURCES_PACKAGE
		slot21 = callback
		slot23 = self
		slot24 = self
		slot25 = "_spawn_weapon"
		slot26 = {
			weapon_factory_id = weapon_factory_id,
			unit_path = unit_path,
			weapon_id = weapon_id,
			character_unit = spawned_unit,
			peer = peer
		}

		slot15(slot16, slot17, slot18, slot19, slot21(slot22, slot23, slot24, slot25))

		slot15 = "hos_idle_loop_"
		slot16 = weapon_id
		local anim_state_name = slot15 .. slot16
		slot16 = math
		slot16 = slot16.random
		slot16 = slot16()
		local at_time = slot16 * 10
		slot19 = spawned_unit
		slot17 = spawned_unit.play_redirect
		slot20 = Idstring
		slot22 = anim_state_name
		slot20 = slot20(slot21)
		slot21 = at_time
		slot17 = slot17(slot18, slot19, slot20)
	end

	return 
end

slot0._spawn_character_units = slot1
slot0 = ReadyUpGui

function slot1(self)
	slot1 = managers
	slot1 = slot1.challenge_cards
	slot3 = slot1
	slot1 = slot1.get_cards_count_per_type
	slot4 = managers
	slot4 = slot4.challenge_cards
	slot6 = slot4
	slot4 = slot4.get_readyup_card_cache
	slot1, slot2 = slot1(slot2, slot4(slot5))
	self._operation_card_count = slot2
	self._raid_card_count = slot1
	slot1 = managers
	slot1 = slot1.raid_menu
	slot3 = slot1
	slot1 = slot1.is_pc_controller
	slot1 = slot1(slot2)

	if not slot1 then
		slot7 = managers.network
		slot7 = managers.network.session(slot6)
		slot5 = true

		self.bind_controller_inputs(slot2, self, self._current_peer == managers.network.session(slot6).local_peer(slot6))
	else
		slot1 = managers
		slot1 = slot1.raid_menu
		slot3 = slot1
		slot1 = slot1.is_offline_mode
		slot1 = slot1(slot2)

		if slot1 then
			slot1 = self._suggest_card_button
			slot3 = slot1
			slot1 = slot1.hide

			slot1(slot2)

			slot1 = self._suggest_card_button
			slot3 = slot1
			slot1 = slot1.disable

			slot1(slot2)

			slot1 = self._no_cards_warning_label
			slot3 = slot1
			slot1 = slot1.hide

			slot1(slot2)

			slot1 = self._card_not_selected_label
			slot3 = slot1
			slot1 = slot1.set_text
			slot6 = self
			slot4 = self.translate
			slot7 = "menu_no_cards_in_offline_mode"
			slot8 = true

			slot1(slot2, slot4(slot5, slot6, slot7))

			slot1 = self._card_not_selected_label
			slot3 = slot1
			slot1 = slot1.show

			slot1(slot2)

			slot1 = self._card_not_selected_label
			slot3 = slot1
			slot1 = slot1.set_center_x
			slot4 = self._empty_card_slot
			slot6 = slot4
			slot4 = slot4.center_x

			slot1(slot2, slot4(slot5))

			slot1 = self._card_not_selected_label
			slot3 = slot1
			slot1 = slot1.set_center_y
			slot4 = self._empty_card_slot
			slot6 = slot4
			slot4 = slot4.center_y

			slot1(slot2, slot4(slot5))

			slot1 = self._card_not_selected_label
			slot3 = slot1
			slot1 = slot1.text_rect
			local x1, y1, w1, h1 = slot1(slot2)
			slot5 = self._card_not_selected_label
			slot7 = slot5
			slot5 = slot5.set_h
			slot8 = h1

			slot5(slot6, slot7)

			slot5 = self._local_player_selected

			if not slot5 then
				slot5 = self._card_not_selected_label
				slot7 = slot5
				slot5 = slot5.hide

				slot5(slot6)
			end

			slot5 = self._positive_card_effect_label
			slot7 = slot5
			slot5 = slot5.hide

			slot5(slot6)
		else
			slot1 = managers
			slot1 = slot1.raid_job
			slot3 = slot1
			slot1 = slot1.selected_job
			slot1 = slot1(slot2)
		end
	end

	return 
end

slot0._set_card_selection_controls = slot1
slot0 = ReadyUpGui

function slot1(self, params)
	slot4 = self
	slot2 = self._set_card_selection_controls

	slot2(slot3)

	return 
end

slot0._players_inventory_processed = slot1
slot0 = ReadyUpGui

function slot1(self, control, params)
	slot3 = Application
	slot5 = slot3
	slot3 = slot3.trace
	slot6 = "[ReadyUpGui:_on_player_click_callback]"

	slot3(slot4, slot5)

	slot3 = pairs
	slot5 = self._player_control_list
	slot3, slot4, slot5 = slot3(slot4)

	for _, player_control in slot3, slot4, slot5 do
		slot10 = player_control
		slot8 = player_control.select_off

		slot8(slot9)
	end

	slot3 = params.peer
	self._current_peer = slot3
	slot3 = managers
	slot3 = slot3.raid_menu
	slot5 = slot3
	slot3 = slot3.is_pc_controller
	slot3 = slot3(slot4)

	if not slot3 then
		slot9 = managers.network
		slot9 = managers.network.session(slot8)
		slot7 = true

		self.bind_controller_inputs(slot4, self, self._current_peer == managers.network.session(slot8).local_peer(slot8))

		slot3 = self._kick_button

		if slot3 then
			slot3 = self._kick_button
			slot5 = slot3
			slot3 = slot3.hide

			slot3(slot4)
		end

		slot3 = self._suggest_card_button
		slot5 = slot3
		slot3 = slot3.hide

		slot3(slot4)

		slot3 = self._leave_lobby_button
		slot5 = slot3
		slot3 = slot3.hide

		slot3(slot4)
	else
		slot3 = self._is_host

		if slot3 then
			slot3 = params.is_current_player

			if not slot3 then
				slot3 = self._kick_button
				slot5 = slot3
				slot3 = slot3.show

				slot3(slot4)
			else
				slot3 = self._kick_button
				slot5 = slot3
				slot3 = slot3.hide

				slot3(slot4)
			end
		end

		slot3 = params.is_current_player

		if slot3 then
			slot3 = self._ready

			if not slot3 then
				slot3 = self._suggest_card_button
				slot5 = slot3
				slot3 = slot3.enabled
				slot3 = slot3(slot4)

				if slot3 then
					slot3 = self._suggest_card_button
					slot5 = slot3
					slot3 = slot3.show

					slot3(slot4)
				end
			end

			slot3 = self._leave_lobby_button
			slot5 = slot3
			slot3 = slot3.enabled
			slot3 = slot3(slot4)

			if slot3 then
				slot3 = managers
				slot3 = slot3.challenge_cards
				slot5 = slot3
				slot3 = slot3.did_everyone_locked_sugested_card
				slot3 = slot3(slot4)

				if not slot3 then
					slot3 = self._leave_lobby_button
					slot5 = slot3
					slot3 = slot3.show

					slot3(slot4)
				end
			end

			slot3 = self._ready_up_button
			slot5 = slot3
			slot3 = slot3.show

			slot3(slot4)

			slot3 = self._ready

			if slot3 then
				slot3 = self._ready_up_button
				slot5 = slot3
				slot3 = slot3.disable

				slot3(slot4)
			end

			slot3 = true
			self._local_player_selected = slot3
		else
			slot3 = self._suggest_card_button
			slot5 = slot3
			slot3 = slot3.hide

			slot3(slot4)

			slot3 = self._leave_lobby_button
			slot5 = slot3
			slot3 = slot3.enabled
			slot3 = slot3(slot4)

			if slot3 then
				slot3 = managers
				slot3 = slot3.challenge_cards
				slot5 = slot3
				slot3 = slot3.did_everyone_locked_sugested_card
				slot3 = slot3(slot4)

				if not slot3 then
					slot3 = self._leave_lobby_button
					slot5 = slot3
					slot3 = slot3.show

					slot3(slot4)
				end
			end

			slot3 = self._ready_up_button
			slot5 = slot3
			slot3 = slot3.show

			slot3(slot4)

			slot3 = self._ready

			if slot3 then
				slot3 = self._ready_up_button
				slot5 = slot3
				slot3 = slot3.disable

				slot3(slot4)
			end

			slot3 = false
			self._local_player_selected = slot3
		end
	end

	slot3 = params.peer_index
	self._current_peer_index = slot3
	slot3 = params.list_index
	self._current_list_index = slot3

	return 
end

slot0._on_player_click_callback = slot1
slot0 = ReadyUpGui

function slot1(self)
	slot1 = self._spawned_character_units

	if not slot1 then
		return 
	end

	local should_allow_ready_up = true
	slot2 = pairs
	slot4 = self._spawned_character_units
	slot2, slot3, slot4 = slot2(slot3)

	for _, unit in slot2, slot3, slot4 do
		slot9 = unit
		slot7 = unit.customization
		local unit_customization = slot7(slot8)
		slot10 = unit_customization
		slot8 = unit_customization.visible
		local is_visible = slot8(slot9)

		if not is_visible then
			slot11 = unit
			slot9 = unit.anim_data
			slot9 = slot9(slot10)
			slot9 = slot9.ready_up_idle_started

			if slot9 then
				slot11 = unit_customization
				slot9 = unit_customization.set_visible
				slot12 = true

				slot9(slot10, slot11)

				should_allow_ready_up = false
			end
		end
	end

	slot2 = pairs
	slot4 = self._weapon_assembled
	slot2, slot3, slot4 = slot2(slot3)

	for _, assembled in slot2, slot3, slot4 do
		if not assembled then
			should_allow_ready_up = false

			break
		end
	end

	if should_allow_ready_up then
		slot2 = self._ready

		if not slot2 then
			slot2 = self._ready_up_button
			slot4 = slot2
			slot2 = slot2.enable

			slot2(slot3)

			slot2 = self._suggest_card_button
			slot4 = slot2
			slot2 = slot2.enable

			slot2(slot3)

			slot2 = self._leave_lobby_button
			slot4 = slot2
			slot2 = slot2.enable

			slot2(slot3)

			slot2 = self._player_control_list
			slot3 = self._current_peer
			slot2 = slot2[slot3]
			slot4 = slot2
			slot2 = slot2.params
			slot2 = slot2(slot3)
			slot2 = slot2.is_current_player

			if slot2 then
				slot2 = managers
				slot2 = slot2.menu
				slot4 = slot2
				slot2 = slot2.is_pc_controller
				slot2 = slot2(slot3)

				if slot2 then
					slot2 = self._leave_lobby_button
					slot4 = slot2
					slot2 = slot2.show

					slot2(slot3)

					slot2 = self._suggest_card_button
					slot4 = slot2
					slot2 = slot2.show

					slot2(slot3)
				end
			end

			slot4 = self
			slot2 = self._set_card_selection_controls

			slot2(slot3)
		end
	end

	return 
end

slot0._show_characters = slot1
slot0 = ReadyUpGui

function slot1(self)
	slot1 = managers
	slot1 = slot1.challenge_cards
	slot3 = slot1
	slot1 = slot1.get_suggested_cards
	local challenge_cards = slot1(slot2)

	if challenge_cards then
		slot2 = self._current_peer_index
		slot2 = challenge_cards[slot2]
	else
		slot2 = self._card_control
		slot4 = slot2
		slot2 = slot2.set_card
		slot5 = nil

		slot2(slot3, slot4)

		slot2 = self._positive_card_effect_label
		slot4 = slot2
		slot2 = slot2.set_text
		slot7 = self
		slot5 = self.translate
		slot8 = "hud_no_challenge_card_text"
		slot9 = false

		slot2(slot3, slot5(slot6, slot7, slot8))

		slot2 = self._positive_card_effect_label
		slot4 = slot2
		slot2 = slot2.text_rect
		local _, _, _, h = slot2(slot3)
		slot6 = self._positive_card_effect_label
		slot8 = slot6
		slot6 = slot6.set_h
		slot9 = h

		slot6(slot7, slot8)

		slot6 = self._negative_card_effect_label
		slot8 = slot6
		slot6 = slot6.set_text
		slot9 = ""

		slot6(slot7, slot8)

		slot6 = self._card_control
		slot8 = slot6
		slot6 = slot6.set_visible
		slot9 = false

		slot6(slot7, slot8)

		slot6 = self._empty_card_slot
		slot8 = slot6
		slot6 = slot6.set_visible
		slot9 = true

		slot6(slot7, slot8)

		slot6 = self._card_not_selected_label
		slot8 = slot6
		slot6 = slot6.set_visible
		slot9 = true

		slot6(slot7, slot8)

		slot6 = self._negative_card_effect_label
		slot8 = slot6
		slot6 = slot6.set_visible
		slot9 = false

		slot6(slot7, slot8)
	end

	return 
end

slot0._show_player_challenge_card_info = slot1
slot0 = ReadyUpGui

function slot1(self)
	slot1 = managers
	slot1 = slot1.challenge_cards
	slot3 = slot1
	slot1 = slot1.get_suggested_cards
	local challenge_cards = slot1(slot2)
	slot2 = pairs
	slot4 = self._player_control_list
	slot2, slot3, slot4 = slot2(slot3)

	for _, control in slot2, slot3, slot4 do

		-- Decompilation error in this vicinity:
		slot9 = control
		slot7 = control.set_challenge_card_selected
		slot12 = control
		slot10 = control.params
		slot10 = slot10(slot11)
		slot10 = slot10.peer_index
		slot10 = challenge_cards[slot10]
	end

	return 
end

slot0._update_challenge_card_selected_icon = slot1
slot0 = ReadyUpGui

function slot1(self)
	slot1 = managers
	slot1 = slot1.challenge_cards
	slot3 = slot1
	slot1 = slot1.get_suggested_cards
	local challenge_cards = slot1(slot2)
	slot2 = pairs
	slot4 = self._player_control_list
	slot2, slot3, slot4 = slot2(slot3)

	for peer, control in slot2, slot3, slot4 do
		slot9 = control
		slot7 = control.params
		slot7 = slot7(slot8)
		slot7 = slot7.peer_index
		local card = challenge_cards[slot7]

		if card then
			slot8 = card.locked_suggestion

			if slot8 then
				slot10 = control
				slot8 = control.params
				slot8 = slot8(slot9)
				local was_ready = slot8.ready
				slot11 = control
				slot9 = control.set_state
				slot12 = "ready"

				slot9(slot10, slot11)

				slot11 = control
				slot9 = control.params
				slot9 = slot9(slot10)
				slot9 = slot9.ready

				if slot9 and not was_ready then
					slot11 = peer
					slot9 = peer.blackmarket_outfit
					local outfit = slot9(slot10)
					slot10 = managers
					slot10 = slot10.weapon_factory
					slot12 = slot10
					slot10 = slot10.get_weapon_id_by_factory_id
					slot13 = outfit.primary
					slot13 = slot13.factory_id
					local weapon_id = slot10(slot11, slot12)
					slot11 = "hos_to_cbt_"
					slot12 = weapon_id
					local anim_state_name = slot11 .. slot12
					slot12 = self._spawned_character_units
					slot12 = slot12[peer]
					slot14 = slot12
					slot12 = slot12.play_redirect
					slot15 = Idstring
					slot17 = anim_state_name
					local state = slot12(slot13, slot15(slot16))
					slot13 = managers
					slot13 = slot13.menu_component
					slot15 = slot13
					slot13 = slot13.post_event
					slot16 = "ready_up_"
					slot19 = peer
					slot17 = peer.character
					slot17 = slot17(slot18)
					slot16 = slot16 .. slot17

					slot13(slot14, slot15)
				end
			end
		end
	end

	local all_ready = true
	slot3 = pairs
	slot5 = self._player_control_list
	slot3, slot4, slot5 = slot3(slot4)

	for peer, control in slot3, slot4, slot5 do
		slot10 = control
		slot8 = control.params
		slot8 = slot8(slot9)
		slot8 = slot8.ready

		if not slot8 then
			all_ready = false

			break
		end
	end

	if all_ready then
		slot3 = managers
		slot3 = slot3.raid_menu
		slot5 = slot3
		slot3 = slot3.is_pc_controller
		slot3 = slot3(slot4)

		if not slot3 then
			slot5 = self
			slot3 = self.bind_controller_inputs
			slot6 = true
			slot7 = false

			slot3(slot4, slot5, slot6)
		else
			slot3 = self._leave_lobby_button
			slot5 = slot3
			slot3 = slot3.hide

			slot3(slot4)
		end
	end

	return 
end

slot0._update_status = slot1
slot0 = ReadyUpGui

function slot1(self)
	slot1 = self._suggest_card_button
	slot3 = slot1
	slot1 = slot1.enabled
	slot1 = slot1(slot2)

	if not slot1 then
		return 
	end

	slot1 = managers
	slot1 = slot1.raid_menu
	slot3 = slot1
	slot1 = slot1.open_menu
	slot4 = "challenge_cards_menu"

	slot1(slot2, slot3)

	return 
end

slot0._on_select_card_button = slot1
slot0 = ReadyUpGui

function slot1(self)
	slot1 = self._ready_up_button
	slot3 = slot1
	slot1 = slot1.enabled
	slot1 = slot1(slot2)

	if not slot1 then
		return 
	end

	slot1 = managers
	slot1 = slot1.network
	slot3 = slot1
	slot1 = slot1.session
	slot1 = slot1(slot2)
	slot3 = slot1
	slot1 = slot1.local_peer
	local local_peer = slot1(slot2)
	slot2 = self._player_control_list
	local local_peer_control = slot2[local_peer]
	slot3 = self._ready_up_button
	slot5 = slot3
	slot3 = slot3.disable

	slot3(slot4)

	slot3 = self._suggest_card_button
	slot5 = slot3
	slot3 = slot3.disable

	slot3(slot4)

	slot3 = self._suggest_card_button
	slot5 = slot3
	slot3 = slot3.hide

	slot3(slot4)

	slot3 = self._is_host

	if slot3 then
		slot3 = self._kick_button
		slot5 = slot3
		slot3 = slot3.disable

		slot3(slot4)

		slot3 = self._kick_button
		slot5 = slot3
		slot3 = slot3.hide

		slot3(slot4)
	end

	slot3 = managers
	slot3 = slot3.challenge_cards
	slot5 = slot3
	slot3 = slot3.get_suggested_cards
	local challenge_cards = slot3(slot4)

	if challenge_cards then
		slot6 = local_peer_control
		slot4 = local_peer_control.params
		slot4 = slot4(slot5)
		slot4 = slot4.peer_index
		slot4 = challenge_cards[slot4]

		if not slot4 then
			slot4 = managers
			slot4 = slot4.challenge_cards
			slot6 = slot4
			slot4 = slot4.suggest_challenge_card
			slot7 = ChallengeCardsManager
			slot7 = slot7.CARD_PASS_KEY_NAME
			slot8 = nil

			slot4(slot5, slot6, slot7)
		end
	end

	slot4 = managers
	slot4 = slot4.challenge_cards
	slot6 = slot4
	slot4 = slot4.toggle_lock_suggested_challenge_card

	slot4(slot5)

	slot4 = true
	self._ready = slot4
	slot6 = self
	slot4 = self.bind_controller_inputs
	slot7 = true
	slot8 = true

	slot4(slot5, slot6, slot7)

	return 
end

slot0._on_ready_up_button = slot1
slot0 = ReadyUpGui

function slot1(self)
	local params = {}
	slot2 = callback
	slot4 = self
	slot5 = self
	slot6 = "_on_kick_confirmed"
	slot2 = slot2(slot3, slot4, slot5)
	params.yes_callback = slot2
	slot2 = self._current_peer
	slot4 = slot2
	slot2 = slot2.name
	slot2 = slot2(slot3)
	params.player_name = slot2
	slot2 = managers
	slot2 = slot2.menu
	slot4 = slot2
	slot2 = slot2.show_kick_peer_dialog
	slot5 = params

	slot2(slot3, slot4)

	return 
end

slot0._on_kick_button = slot1
slot0 = ReadyUpGui

function slot1(self)
	slot1 = managers
	slot1 = slot1.vote
	slot3 = slot1
	slot1 = slot1.host_kick
	slot4 = self._current_peer

	slot1(slot2, slot3)

	return 
end

slot0._on_kick_confirmed = slot1
slot0 = ReadyUpGui

function slot1(self, params)
	slot4 = self
	slot2 = self._peer_no_longer_in_lobby
	slot5 = params.peer
	slot6 = "kicked"

	slot2(slot3, slot4, slot5)

	return 
end

slot0._on_peer_kicked = slot1
slot0 = ReadyUpGui

function slot1(self, params)
	slot4 = self
	slot2 = self._peer_no_longer_in_lobby
	slot5 = params.peer
	slot6 = "left"

	slot2(slot3, slot4, slot5)

	return 
end

slot0._on_peer_left = slot1
slot0 = ReadyUpGui

function slot1(self, peer, state)
	slot3 = self._player_control_list
	local peer_control = slot3[peer]
	slot6 = peer_control
	slot4 = peer_control.set_state
	slot7 = state

	slot4(slot5, slot6)

	slot4 = self._current_peer

	if peer == slot4 then
		slot6 = peer_control
		slot4 = peer_control.select_off

		slot4(slot5)

		slot4 = nil
		self._current_peer = slot4
		slot4 = managers
		slot4 = slot4.network
		slot6 = slot4
		slot4 = slot4.session
		slot4 = slot4(slot5)
		slot6 = slot4
		slot4 = slot4.local_peer
		local local_peer = slot4(slot5)

		if peer ~= local_peer then
			slot5 = self._player_control_list
			slot5 = slot5[local_peer]
			slot7 = slot5
			slot5 = slot5.on_mouse_clicked

			slot5(slot6)
		end
	end

	slot4 = ipairs
	slot6 = self._spawned_weapon_parts
	slot6 = slot6[peer]
	slot4, slot5, slot6 = slot4(slot5)

	for _, part in slot4, slot5, slot6 do
		slot11 = part
		slot9 = part.set_slot
		slot12 = 0

		slot9(slot10, slot11)

		part = nil
	end

	slot4 = self._spawned_weapon_parts
	slot5 = nil
	slot4[peer] = slot5
	slot4 = self._spawned_character_units
	slot4 = slot4[peer]
	slot6 = slot4
	slot4 = slot4.set_slot
	slot7 = 0

	slot4(slot5, slot6)

	slot4 = self._spawned_character_units
	slot5 = nil
	slot4[peer] = slot5

	return 
end

slot0._peer_no_longer_in_lobby = slot1
slot0 = ReadyUpGui

function slot1(self)
	slot1 = self._leave_lobby_button
	slot3 = slot1
	slot1 = slot1.enabled
	slot1 = slot1(slot2)

	if not slot1 then
		return 
	end

	slot1 = self._callback_handler
	slot3 = slot1
	slot1 = slot1.end_game

	slot1(slot2)

	return 
end

slot0._on_leave_lobby_button = slot1
slot0 = ReadyUpGui

function slot1(self)
	slot1 = managers
	slot1 = slot1.challenge_cards
	slot3 = slot1
	slot1 = slot1.set_automatic_steam_inventory_refresh
	slot4 = false

	slot1(slot2, slot3)

	slot3 = self
	slot1 = self._enable_dof

	slot1(slot2)

	slot1 = managers
	slot1 = slot1.system_event_listener
	slot3 = slot1
	slot1 = slot1.remove_listener
	slot4 = "ready_up_gui_player_kicked"

	slot1(slot2, slot3)

	slot1 = managers
	slot1 = slot1.system_event_listener
	slot3 = slot1
	slot1 = slot1.remove_listener
	slot4 = "ready_up_gui_player_left"

	slot1(slot2, slot3)

	slot1 = managers
	slot1 = slot1.system_event_listener
	slot3 = slot1
	slot1 = slot1.remove_listener
	slot4 = "ready_up_gui_inventory_processed"

	slot1(slot2, slot3)

	slot1 = self._chat
	slot3 = slot1
	slot1 = slot1.unregister

	slot1(slot2)

	slot1 = managers
	slot1 = slot1.hud
	slot3 = slot1
	slot1 = slot1.hud_chat
	slot1 = slot1(slot2)
	slot3 = slot1
	slot1 = slot1.register

	slot1(slot2)

	slot1 = pairs
	slot3 = self._spawned_character_units
	slot1, slot2, slot3 = slot1(slot2)

	for _, unit in slot1, slot2, slot3 do
		slot8 = unit
		slot6 = unit.set_slot
		slot9 = 0

		slot6(slot7, slot8)

		unit = nil
	end

	slot1 = nil
	self._spawned_character_units = slot1
	slot1 = pairs
	slot3 = self._spawned_weapon_parts
	slot1, slot2, slot3 = slot1(slot2)

	for _, parts in slot1, slot2, slot3 do
		slot6 = ipairs
		slot8 = parts
		slot6, slot7, slot8 = slot6(slot7)

		for _, part in slot6, slot7, slot8 do
			slot13 = part
			slot11 = part.set_slot
			slot14 = 0

			slot11(slot12, slot13)

			part = nil
		end
	end

	slot1 = nil
	self._spawned_weapon_parts = slot1
	slot1 = managers
	slot1 = slot1.lootdrop
	slot3 = slot1
	slot1 = slot1.clear_dropped_loot

	slot1(slot2)

	slot1 = ReadyUpGui
	slot1 = slot1.super
	slot1 = slot1.close
	slot3 = self

	slot1(slot2)

	return 
end

slot0.close = slot1
slot0 = ReadyUpGui

function slot1(self)
	slot1 = self._continuing_mission

	if slot1 then
		slot1 = self._suggest_card_button
		slot3 = slot1
		slot1 = slot1.hide

		slot1(slot2)

		slot1 = self._suggest_card_button
		slot3 = slot1
		slot1 = slot1.disable

		slot1(slot2)

		slot1 = self._no_cards_warning_label
		slot3 = slot1
		slot1 = slot1.hide

		slot1(slot2)

		slot1 = managers
		slot1 = slot1.challenge_cards
		slot3 = slot1
		slot1 = slot1.get_active_card
		local active_card = slot1(slot2)

		if active_card then
			local is_card_active = active_card.description ~= "PASS"
		end

		if is_card_active then
			slot3 = self._card_not_selected_label
			slot5 = slot3
			slot3 = slot3.hide

			slot3(slot4)

			slot3 = self._empty_card_slot
			slot5 = slot3
			slot3 = slot3.hide

			slot3(slot4)

			slot3 = self._card_control
			slot5 = slot3
			slot3 = slot3.set_visible
			slot6 = true

			slot3(slot4, slot5)

			slot3 = self._card_control
			slot5 = slot3
			slot3 = slot3.set_card
			slot6 = active_card

			slot3(slot4, slot5)

			slot3 = managers
			slot3 = slot3.challenge_cards
			slot5 = slot3
			slot3 = slot3.get_card_description
			slot6 = active_card.key_name
			local bonus_description, malus_description = slot3(slot4, slot5)
			slot5 = self._positive_card_effect_label
			slot7 = slot5
			slot5 = slot5.set_text
			slot8 = "+ "
			slot9 = bonus_description
			slot8 = slot8 .. slot9

			slot5(slot6, slot7)

			if malus_description ~= "" then
				slot5 = self._negative_card_effect_label
				slot7 = slot5
				slot5 = slot5.show

				slot5(slot6)

				slot5 = self._negative_card_effect_label
				slot7 = slot5
				slot5 = slot5.set_text
				slot8 = "- "
				slot9 = malus_description
				slot8 = slot8 .. slot9

				slot5(slot6, slot7)
			end
		else
			slot3 = self._card_not_selected_label
			slot5 = slot3
			slot3 = slot3.show

			slot3(slot4)

			slot3 = self._card_not_selected_label
			slot5 = slot3
			slot3 = slot3.set_text
			slot8 = self
			slot6 = self.translate
			slot9 = "menu_card_not_selected"
			slot10 = true

			slot3(slot4, slot6(slot7, slot8, slot9))

			slot3 = self._empty_card_slot
			slot5 = slot3
			slot3 = slot3.show

			slot3(slot4)

			slot3 = self._card_control
			slot5 = slot3
			slot3 = slot3.set_visible
			slot6 = false

			slot3(slot4, slot5)

			slot3 = self._positive_card_effect_label
			slot5 = slot3
			slot3 = slot3.set_text
			slot8 = self
			slot6 = self.translate
			slot9 = "menu_cards_continue_operation"
			slot10 = false

			slot3(slot4, slot6(slot7, slot8, slot9))

			slot3 = self._negative_card_effect_label
			slot5 = slot3
			slot3 = slot3.hide

			slot3(slot4)
		end
	end

	return 
end

slot0._update_controls_contining_mission = slot1
slot0 = ReadyUpGui

function slot1(self)
	slot1 = pairs
	slot3 = self._player_control_list
	slot1, slot2, slot3 = slot1(slot2)

	for control_peer, control in slot1, slot2, slot3 do
		local peer_present = false
		slot7 = pairs
		slot9 = managers
		slot9 = slot9.network
		slot11 = slot9
		slot9 = slot9.session
		slot9 = slot9(slot10)
		slot11 = slot9
		slot9 = slot9.all_peers
		slot7, slot8, slot9 = slot7(slot9(slot10))

		for _, peer in slot7, slot8, slot9 do
			if peer == control_peer then
				peer_present = true
			end
		end

		slot9 = control
		slot7 = control.enabled
		local control_enabled = slot7(slot8)
		slot8 = not peer_present
		slot9 = not control_enabled

		if slot8 ~= slot9 then
			slot8 = self._peer_no_longer_in_lobby
			slot10 = control_peer
			slot11 = "left"

			slot8(slot9, slot10)
		end
	end

	return 
end

slot0._update_peers = slot1
slot0 = ReadyUpGui

function slot1(self, t, dt)
	slot5 = self
	slot3 = self._show_characters

	slot3(slot4)

	slot5 = self
	slot3 = self._show_player_challenge_card_info

	slot3(slot4)

	slot5 = self
	slot3 = self._update_challenge_card_selected_icon

	slot3(slot4)

	slot5 = self
	slot3 = self._update_status

	slot3(slot4)

	slot5 = self
	slot3 = self._update_controls_contining_mission

	slot3(slot4)

	slot5 = self
	slot3 = self._update_peers

	slot3(slot4)

	slot3 = managers
	slot3 = slot3.challenge_cards
	slot5 = slot3
	slot3 = slot3.did_everyone_locked_sugested_card
	slot3 = slot3(slot4)

	if slot3 then
		slot3 = self._stinger_played

		if not slot3 then
			slot3 = managers
			slot3 = slot3.challenge_cards
			slot5 = slot3
			slot3 = slot3.get_suggested_cards
			slot3 = slot3(slot4)

			if slot3 then
				slot3 = managers
				slot3 = slot3.challenge_cards
				slot5 = slot3
				slot3 = slot3.get_suggested_cards
				slot3 = slot3(slot4)
				slot3 = slot3[1]
			else
				slot3 = managers
				slot3 = slot3.menu_component
				slot5 = slot3
				slot3 = slot3.post_event
				slot6 = "ready_up_stinger"

				slot3(slot4, slot5)
			end

			slot3 = true
			self._stinger_played = slot3
		end

		slot3 = pairs
		slot5 = self._spawned_character_units
		slot3, slot4, slot5 = slot3(slot4)

		for _, unit in slot3, slot4, slot5 do
			slot10 = unit
			slot8 = unit.anim_data
			slot8 = slot8(slot9)
			slot8 = slot8.ready_transition_anim_finished

			if not slot8 then
				return 
			end
		end

		slot3 = Network
		slot5 = slot3
		slot3 = slot3.is_server
		slot3 = slot3(slot4)

		if slot3 then
			slot3 = managers
			slot3 = slot3.network
			slot5 = slot3
			slot3 = slot3.session
			slot3 = slot3(slot4)
			slot5 = slot3
			slot3 = slot3.set_state
			slot6 = "in_game"

			slot3(slot4, slot5)
		else
			slot3 = self._synced_document_spawn_chance_to_host

			if not slot3 then
				slot3 = managers
				slot3 = slot3.consumable_missions
				slot5 = slot3
				slot3 = slot3.sync_document_spawn_chance

				slot3(slot4)

				slot3 = true
				self._synced_document_spawn_chance_to_host = slot3
			end
		end

		slot3 = self._continuing_mission

		if slot3 then
			slot3 = managers
			slot3 = slot3.global_state
			slot5 = slot3
			slot3 = slot3.fire_event
			slot6 = GlobalStateManager
			slot6 = slot6.EVENT_START_RAID

			slot3(slot4, slot5)
		else
			slot3 = self._is_single_player

			if slot3 then
				slot3 = managers
				slot3 = slot3.challenge_cards
				slot5 = slot3
				slot3 = slot3.select_challenge_card
				slot6 = self._current_peer_index

				slot3(slot4, slot5)

				slot3 = managers
				slot3 = slot3.global_state
				slot5 = slot3
				slot3 = slot3.fire_event
				slot6 = GlobalStateManager
				slot6 = slot6.EVENT_START_RAID

				slot3(slot4, slot5)
			else
				slot3 = managers
				slot3 = slot3.challenge_cards
				slot5 = slot3
				slot3 = slot3.get_suggested_cards
				local challenge_cards = slot3(slot4)
				local immidiate_start = true
				slot5 = pairs
				slot7 = challenge_cards
				slot5, slot6, slot7 = slot5(slot6)

				for _, card in slot5, slot6, slot7 do
					slot10 = card.key_name
					slot11 = ChallengeCardsManager
					slot11 = slot11.CARD_PASS_KEY_NAME

					if slot10 ~= slot11 then
						immidiate_start = false

						break
					end
				end

				if immidiate_start then
					slot5 = managers
					slot5 = slot5.global_state
					slot7 = slot5
					slot5 = slot5.fire_event
					slot8 = GlobalStateManager
					slot8 = slot8.EVENT_START_RAID

					slot5(slot6, slot7)
				else
					slot5 = ChallengeCardsGui
					slot6 = 2
					slot5.PHASE = slot6
					slot5 = managers
					slot5 = slot5.raid_menu
					slot7 = slot5
					slot5 = slot5.open_menu
					slot8 = "challenge_cards_menu"

					slot5(slot6, slot7)
				end
			end
		end
	end

	return 
end

slot0.update = slot1
slot0 = ReadyUpGui

function slot1(self)
	local ct_players = 0
	slot2 = pairs
	slot4 = self._player_control_list
	slot2, slot3, slot4 = slot2(slot3)

	for _, _ in slot2, slot3, slot4 do
		ct_players = ct_players + 1
	end

	return ct_players
end

slot0._ct_players = slot1
slot0 = ReadyUpGui

function slot1(self)
	slot3 = self
	slot1 = self._ct_players
	local ct_players = slot1(slot2)
	slot2 = self._current_list_index
	slot2 = slot2 + 1
	slot3 = ct_players + 1
	local next_list_idx = slot2 % slot3

	if next_list_idx == 0 then
		next_list_idx = 1
	end

	slot3 = pairs
	slot5 = self._player_control_list
	slot3, slot4, slot5 = slot3(slot4)

	for _, control in slot3, slot4, slot5 do
		slot10 = control
		slot8 = control.params
		slot8 = slot8(slot9)
		slot8 = slot8.list_index

		if slot8 == next_list_idx then
			slot10 = control
			slot8 = control.on_mouse_clicked

			slot8(slot9)

			return 
		end
	end

	return 
end

slot0._on_tab_right = slot1
slot0 = ReadyUpGui

function slot1(self)
	slot1 = self._current_list_index
	local next_list_idx = slot1 - 1
	slot2 = self._current_list_index

	if slot2 == 1 then
		slot4 = self
		slot2 = self._ct_players
		slot2 = slot2(slot3)
		next_list_idx = slot2
	end

	slot2 = pairs
	slot4 = self._player_control_list
	slot2, slot3, slot4 = slot2(slot3)

	for _, control in slot2, slot3, slot4 do
		slot9 = control
		slot7 = control.params
		slot7 = slot7(slot8)
		slot7 = slot7.list_index

		if slot7 == next_list_idx then
			slot9 = control
			slot7 = control.on_mouse_clicked

			slot7(slot8)

			return 
		end
	end

	return 
end

slot0._on_tab_left = slot1
slot0 = ReadyUpGui

function slot1(self)
	slot1 = Application
	slot3 = slot1
	slot1 = slot1.trace
	slot4 = "[ReadyUpGui:show_gamercard] showing gamercard for peer "
	slot5 = tostring
	slot7 = self._current_peer
	slot9 = slot7
	slot7 = slot7.name
	slot5 = slot5(slot7(slot8))
	slot4 = slot4 .. slot5

	slot1(slot2, slot3)

	slot1 = Application
	slot3 = slot1
	slot1 = slot1.debug
	slot4 = "[ReadyUpGui:show_gamercard]"
	slot5 = inspect
	slot7 = self._current_peer

	slot1(slot2, slot3, slot5(slot6))

	slot1 = self._callback_handler
	slot3 = slot1
	slot1 = slot1.view_gamer_card
	slot4 = self._current_peer
	slot6 = slot4
	slot4 = slot4.xuid

	slot1(slot2, slot4(slot5))

	return 
end

slot0.show_gamercard = slot1
slot0 = ReadyUpGui

function slot1(self, is_current_player, can_leave)
	slot3 = managers
	slot3 = slot3.menu
	slot5 = slot3
	slot3 = slot3.is_pc_controller
	slot3 = slot3(slot4)

	if slot3 then
		if is_current_player then
			slot3 = self._ready
		else
			slot5 = self
			slot3 = self.set_controller_bindings
			slot6 = {}
			slot7 = true

			slot3(slot4, slot5, slot6)
		end

		local legend = {}
		slot4 = {}
		legend.controller = slot4
		slot4 = {}
		legend.keyboard = slot4
		slot6 = self
		slot4 = self.set_legend
		slot7 = legend

		slot4(slot5, slot6)

		return 
	end

	local bindings = {}
	slot4 = {}
	slot5 = Idstring
	slot7 = "menu_controller_shoulder_left"
	slot5 = slot5(slot6)
	slot4.key = slot5
	slot5 = callback
	slot7 = self
	slot8 = self
	slot9 = "_on_tab_left"
	slot5 = slot5(slot6, slot7, slot8)
	slot4.callback = slot5
	bindings[1] = slot4
	slot4 = {}
	slot5 = Idstring
	slot7 = "menu_controller_shoulder_right"
	slot5 = slot5(slot6)
	slot4.key = slot5
	slot5 = callback
	slot7 = self
	slot8 = self
	slot9 = "_on_tab_right"
	slot5 = slot5(slot6, slot7, slot8)
	slot4.callback = slot5
	bindings[2] = slot4
	slot4 = {}
	slot5 = Idstring
	slot7 = "menu_controller_face_right"
	slot5 = slot5(slot6)
	slot4.key = slot5
	slot5 = callback
	slot7 = self
	slot8 = self
	slot9 = "back_pressed"
	slot5 = slot5(slot6, slot7, slot8)
	slot4.callback = slot5
	bindings[3] = slot4
	local controler_legend = {}
	slot5 = self._is_single_player

	if not slot5 then
		slot5 = table
		slot5 = slot5.insert
		slot7 = controler_legend
		slot8 = "menu_legend_ready_up_tab"

		slot5(slot6, slot7)
	end

	slot5 = self._is_host

	if slot5 and not is_current_player then
		slot5 = self._is_single_player

		if not slot5 then
			slot5 = table
			slot5 = slot5.insert
			slot7 = bindings
			slot8 = {}
			slot9 = Idstring
			slot11 = "menu_controller_face_right"
			slot9 = slot9(slot10)
			slot8.key = slot9
			slot9 = callback
			slot11 = self
			slot12 = self
			slot13 = "_on_kick_button"
			slot9 = slot9(slot10, slot11, slot12)
			slot8.callback = slot9

			slot5(slot6, slot7)

			slot5 = table
			slot5 = slot5.insert
			slot7 = controler_legend
			slot8 = "menu_legend_ready_up_kick"

			slot5(slot6, slot7)
		end
	end

	slot5 = self._ready

	if not slot5 and is_current_player then
		slot5 = managers
		slot5 = slot5.raid_job
		slot7 = slot5
		slot5 = slot5.selected_job
		slot5 = slot5(slot6)
	end

	if can_leave then
		slot5 = table
		slot5 = slot5.insert
		slot7 = bindings
		slot8 = {}
		slot9 = Idstring
		slot11 = "menu_controller_face_left"
		slot9 = slot9(slot10)
		slot8.key = slot9
		slot9 = callback
		slot11 = self
		slot12 = self
		slot13 = "_on_leave_lobby_button"
		slot9 = slot9(slot10, slot11, slot12)
		slot8.callback = slot9

		slot5(slot6, slot7)

		slot5 = table
		slot5 = slot5.insert
		slot7 = controler_legend
		slot8 = "menu_legend_ready_up_leave"

		slot5(slot6, slot7)
	end

	slot5 = self._ready

	if not slot5 then
		slot5 = table
		slot5 = slot5.insert
		slot7 = bindings
		slot8 = {}
		slot9 = Idstring
		slot11 = "menu_controller_face_bottom"
		slot9 = slot9(slot10)
		slot8.key = slot9
		slot9 = callback
		slot11 = self
		slot12 = self
		slot13 = "_on_ready_up_button"
		slot9 = slot9(slot10, slot11, slot12)
		slot8.callback = slot9

		slot5(slot6, slot7)

		slot5 = self._is_single_player

		if slot5 then
			slot5 = table
			slot5 = slot5.insert
			slot7 = controler_legend
			slot8 = "menu_legend_ready_up_start"

			slot5(slot6, slot7)
		else
			slot5 = table
			slot5 = slot5.insert
			slot7 = controler_legend
			slot8 = "menu_legend_ready_up_ready"

			slot5(slot6, slot7)
		end
	end

	if not is_current_player then
		slot5 = SystemInfo
		slot7 = slot5
		slot5 = slot5.platform
		slot5 = slot5(slot6)
		slot6 = Idstring
		slot8 = "XB1"
		slot6 = slot6(slot7)

		if slot5 == slot6 then
			local gamercard_key = {}
			slot6 = Idstring
			slot8 = "menu_controller_face_top"
			slot6 = slot6(slot7)
			gamercard_key.key = slot6
			slot6 = callback
			slot8 = self
			slot9 = self
			slot10 = "show_gamercard"
			slot6 = slot6(slot7, slot8, slot9)
			gamercard_key.callback = slot6
			slot6 = table
			slot6 = slot6.insert
			slot8 = bindings
			slot9 = gamercard_key

			slot6(slot7, slot8)

			slot6 = table
			slot6 = slot6.insert
			slot8 = controler_legend
			slot9 = "menu_legend_ready_up_gamercard"

			slot6(slot7, slot8)
		end
	end

	slot7 = self
	slot5 = self.set_controller_bindings
	slot8 = bindings
	slot9 = true

	slot5(slot6, slot7, slot8)

	local legend = {
		controller = controler_legend
	}
	slot6 = {}
	legend.keyboard = slot6
	slot8 = self
	slot6 = self.set_legend
	slot9 = legend

	slot6(slot7, slot8)

	return 
end

slot0.bind_controller_inputs = slot1
slot0 = ReadyUpGui

function slot1(self)
	slot1 = true

	return slot1
end

slot0.back_pressed = slot1

return 
