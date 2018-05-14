-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not ChallengeCardsGui then
	slot2 = RaidGuiBase
	slot0 = class(slot1)
end

ChallengeCardsGui = slot0
ChallengeCardsGui.PHASE = 1
ChallengeCardsGui.SUGGESTED_CARDS_Y = 540
function ChallengeCardsGui:init(ws, fullscreen_ws, node, component_name)
	slot11 = component_name

	ChallengeCardsGui.super.init(slot6, self, ws, fullscreen_ws, node)

	self._phase_two_timer = ChallengeCardsTweakData.CARD_SELECTION_TIMER
	slot7 = managers.raid_menu
	slot12 = "back_pressed"

	managers.raid_menu.register_on_escape_callback(slot6, callback(fullscreen_ws, self, self))

	slot9 = {
		CoreSystemEventListenerManager.SystemEventListenerManager.CHALLENGE_CARDS_SUGGESTED_CARDS_CHANGED,
		CoreSystemEventListenerManager.SystemEventListenerManager.EVENT_DROP_IN
	}
	slot14 = "suggestions_changed"

	managers.system_event_listener.add_listener(slot6, managers.system_event_listener, "challenge_cards_gui_suggestions_changed", callback(self, self, self))

	slot9 = {
		CoreSystemEventListenerManager.SystemEventListenerManager.EVENT_STEAM_INVENTORY_PROCESSED
	}
	slot14 = "_players_inventory_processed"

	managers.system_event_listener.add_listener(slot6, managers.system_event_listener, "challenge_cards_gui_inventory_processed", callback(self, self, self))

	return 
end
function ChallengeCardsGui:_set_initial_data()
	self._challenge_cards_data_source = {}
	self._challenge_cards_steam_data_source = {}
	self._filter_rarity = nil
	self._filter_type = nil
	slot4 = "challenge_card"
	self._sound_source = SoundDevice.create_source(slot2, SoundDevice)

	return 
end
function ChallengeCardsGui:_layout()
	slot4 = {
		name = "phase_one_panel",
		x = 0,
		y = 0
	}
	self._phase_one_panel = self._root_panel.panel(slot2, self._root_panel)
	slot4 = {
		name = "phase_two_panel",
		x = 0,
		y = 0
	}
	self._phase_two_panel = self._root_panel.panel(slot2, self._root_panel)
	slot4 = {
		name = "cards_suggest_title",
		vertical = "top",
		h = 60,
		w = 800,
		visible = true,
		text = "",
		y = 0,
		x = 0,
		color = tweak_data.gui.colors.raid_red,
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.title
	}
	self._cards_suggest_title = self._root_panel.label(slot2, self._root_panel)
	slot4 = {
		tab_align = "center",
		name = "rarity_filters_tabs",
		tab_width = 160,
		initial_tab_idx = 4,
		tab_height = 64,
		y = 96,
		dont_trigger_special_buttons = true,
		x = 0,
		on_click_callback = callback(slot6, self, self),
		tabs_params = {
			{
				name = "tab_common",
				text = self.translate(self, self, "loot_rarity_common"),
				callback_param = LootDropTweakData.RARITY_COMMON
			},
			{
				name = "tab_uncommon",
				text = self.translate(self, self, "loot_rarity_uncommon"),
				callback_param = LootDropTweakData.RARITY_UNCOMMON
			},
			{
				name = "tab_rare",
				text = self.translate(self, self, "loot_rarity_rare"),
				callback_param = LootDropTweakData.RARITY_RARE
			},
			{
				name = "tab_all",
				text = self.translate(self, self, "menu_filter_all")
			}
		}
	}
	slot9 = "on_click_filter_rarity"
	slot11 = true
	slot11 = true
	slot11 = true
	slot11 = true
	self._rarity_filters_tabs = self._phase_one_panel.tabs(slot2, self._phase_one_panel)
	local challenge_cards_grid_scrollable_area_params = {
		name = "challenge_cards_grid_scrollable_area",
		h = 612,
		y = 192,
		w = 640,
		x = 0,
		scroll_step = 30
	}
	self._challenge_cards_grid_scrollable_area = self._phase_one_panel.scrollable_area(self._phase_one_panel, self._phase_one_panel)
	local challenge_cards_grid_params = {
		name = "challenge_cards_grid",
		y = 0,
		w = 636,
		x = 0,
		scrollable_area_ref = self._challenge_cards_grid_scrollable_area
	}
	slot8 = "data_source_inventory_cards"
	slot8 = "_on_click_inventory_cards"
	slot8 = "_on_select_inventory_cards"
	challenge_cards_grid_params.grid_params = {
		scroll_marker_w = 32,
		vertical_spacing = 5,
		data_source_callback = callback(challenge_cards_grid_scrollable_area_params, self, self),
		on_click_callback = callback(challenge_cards_grid_scrollable_area_params, self, self),
		on_select_callback = callback(challenge_cards_grid_scrollable_area_params, self, self)
	}
	challenge_cards_grid_params.item_params = {
		item_w = 156,
		key_value_field = "key_name",
		item_h = 216,
		selected_marker_h = 250,
		selected_marker_w = 192,
		row_class = RaidGUIControlCardWithSelector
	}
	slot5 = self._challenge_cards_grid_scrollable_area
	slot6 = challenge_cards_grid_params
	self._card_grid = self._challenge_cards_grid_scrollable_area.get_panel(RaidGUIControlCardWithSelector).grid(RaidGUIControlCardWithSelector, self._challenge_cards_grid_scrollable_area.get_panel(RaidGUIControlCardWithSelector))
	local card_details_params = {
		y = 96,
		name = "card_deatils",
		h = 544,
		card_y = 0,
		w = 892,
		card_h = 384,
		card_x = 0,
		visible = true,
		card_w = 272
	}
	slot6 = self._card_grid
	card_details_params.x = self._card_grid.right(self._challenge_cards_grid_scrollable_area.get_panel(RaidGUIControlCardWithSelector)) + 224
	slot8 = card_details_params
	self._card_details = self._phase_one_panel.create_custom_control(self._challenge_cards_grid_scrollable_area.get_panel(RaidGUIControlCardWithSelector), self._phase_one_panel, RaidGUIControlCardDetails)
	local suggested_cards_grid_params = {
		name = "suggested_cards_grid",
		h = 265,
		visible = true,
		w = 856
	}
	slot7 = self._card_details
	suggested_cards_grid_params.x = self._card_details.left(self._phase_one_panel)
	suggested_cards_grid_params.y = ChallengeCardsGui.SUGGESTED_CARDS_Y
	suggested_cards_grid_params.grid_params = {
		lock_texture = true,
		remove_texture = true
	}
	suggested_cards_grid_params.item_params = {
		w = 192,
		h = 232
	}
	slot8 = suggested_cards_grid_params
	self._suggested_cards_grid = self._phase_one_panel.suggested_cards_grid(self._phase_one_panel, self._phase_one_panel)
	slot8 = {
		text = "",
		name = "suggest_card_button",
		x = 0,
		y = self._phase_one_panel.bottom("menu_filter_all") - 128,
		on_click_callback = callback("menu_filter_all", self, self)
	}
	slot11 = self._phase_one_panel
	slot13 = "suggest_card"
	self._suggest_card_button = self._phase_one_panel.short_primary_button(self._phase_one_panel, self._phase_one_panel)
	slot8 = {
		name = "clear_card_button",
		x = 0,
		text = self.translate("menu_filter_all", self, "menu_clear_selection"),
		y = self._suggest_card_button.top("menu_filter_all"),
		on_click_callback = callback("menu_filter_all", self, self)
	}
	slot13 = true
	slot11 = self._suggest_card_button
	slot13 = "cancel_card"
	self._clear_card_button = self._phase_one_panel.short_secondary_button(self._phase_one_panel, self._phase_one_panel)
	slot7 = self._clear_card_button

	self._clear_card_button.set_right(self._phase_one_panel, self._phase_one_panel.right(callback("menu_filter_all", self, self)))

	slot7 = self

	self._setup_single_player(self._phase_one_panel)

	slot8 = {
		name = "cards_title_ph2_host",
		vertical = "top",
		h = 60,
		w = 800,
		visible = false,
		y = 0,
		x = 0,
		text = self.translate(self._phase_one_panel, self, "menu_challenge_cards_title_ph2_host"),
		color = tweak_data.gui.colors.raid_red,
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.title
	}
	slot13 = true
	self._cards_title_ph2_host = self._root_panel.label(self._phase_one_panel, self._root_panel)
	slot13 = true
	self._cards_title_ph2_client = self._root_panel.label(self._phase_one_panel, self._root_panel)
	local host_activates_card_grid_params = {
		y = 96,
		name = "host_activates_card_grid",
		h = 675,
		visible = true,
		w = 1725,
		x = 0
	}
	slot7 = callback({
		name = "cards_title_ph2_client",
		vertical = "top",
		h = 60,
		w = 800,
		visible = false,
		y = 0,
		x = 0,
		text = self.translate(self._phase_one_panel, self, "menu_challenge_cards_title_ph2_client"),
		color = tweak_data.gui.colors.raid_red,
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.title
	}, self, self)
	host_activates_card_grid_params.grid_params = {
		on_click_callback = slot7
	}
	host_activates_card_grid_params.item_params = {
		item_w = 266,
		item_h = 383,
		selected_marker_h = 675,
		selected_marker_w = 352
	}
	slot9 = host_activates_card_grid_params
	self._host_activates_card_grid = self._phase_two_panel.suggested_cards_grid_large(slot7, self._phase_two_panel)
	slot9 = {
		name = "phase_two_activate_button",
		x = 0,
		y = self._suggested_cards_grid.bottom("on_item_host_clicks_suggested_card_grid") + 32,
		text = self.translate("on_item_host_clicks_suggested_card_grid", self, "menu_select_card_button"),
		on_click_callback = callback("on_item_host_clicks_suggested_card_grid", self, self)
	}
	slot12 = self._suggested_cards_grid
	slot14 = true
	slot14 = "phase_two_activate"
	self._phase_two_activate_button = self._phase_two_panel.long_primary_button(slot7, self._phase_two_panel)
	slot9 = {
		name = "continue_without_a_card",
		x = 0,
		y = self._suggested_cards_grid.bottom("on_item_host_clicks_suggested_card_grid") + 32,
		text = self.translate("on_item_host_clicks_suggested_card_grid", self, "menu_challenge_cards_host_skip_suggestions"),
		on_click_callback = callback("on_item_host_clicks_suggested_card_grid", self, self)
	}
	slot12 = self._suggested_cards_grid
	slot14 = true
	slot14 = "_on_continue_without_card"
	self._continue_without_a_card_button = self._phase_two_panel.long_secondary_button(slot7, self._phase_two_panel)
	slot8 = self._continue_without_a_card_button
	slot11 = self._phase_two_panel

	self._continue_without_a_card_button.set_right(slot7, self._phase_two_panel.right(callback("on_item_host_clicks_suggested_card_grid", self, self)))

	slot8 = managers.raid_job
	self._filter_type = managers.raid_job.current_job_type(slot7)

	if self._filter_type == OperationsTweakData.JOB_TYPE_RAID then
		slot9 = "menu_challenge_cards_suggest_raid_title"

		self._node.components.raid_menu_header.set_screen_name(slot7, self._node.components.raid_menu_header)
	elseif self._filter_type == OperationsTweakData.JOB_TYPE_OPERATION then
		slot9 = "menu_challenge_cards_suggest_operation_title"

		self._node.components.raid_menu_header.set_screen_name(slot7, self._node.components.raid_menu_header)
	end

	slot8 = self

	self.suggestions_changed(slot7)

	slot8 = self._phase_one_panel

	self._phase_one_panel.show(slot7)

	slot8 = self._phase_two_panel

	self._phase_two_panel.hide(slot7)

	slot8 = Network

	if Network.is_server(slot7) then
	else
		slot8 = managers.network
		slot8 = managers.network.session(slot7)
		local host_name = managers.network.session(slot7).all_peers(slot7)[1].name(slot7)
		slot10 = {
			name = "client_waiting_message",
			h = 36,
			align = "center",
			x = 0,
			y = self._phase_two_activate_button.y(slot12) - 48,
			w = self._phase_two_panel.w(slot12),
			text = utf8.to_upper(managers.localization.text(slot14, managers.localization, "menu_challenge_cards_waiting_choose_card_msg")),
			font = tweak_data.gui.fonts.din_compressed,
			font_size = tweak_data.gui.font_sizes.large
		}
		slot13 = self._phase_two_activate_button
		slot13 = self._phase_two_panel
		slot17 = {
			PEER_NAME = host_name
		}
		self._host_ph2_message = self._phase_two_panel.label(managers.network.session(slot7).all_peers(slot7)[1], self._phase_two_panel)
	end

	slot8 = managers.raid_menu

	if not managers.raid_menu.is_pc_controller(slot7) then
		slot8 = self._suggest_card_button

		self._suggest_card_button.hide(slot7)

		slot8 = self._clear_card_button

		self._clear_card_button.hide(slot7)
	end

	if ChallengeCardsGui.PHASE == 2 then
		slot9 = {
			name = "timer_label",
			vertical = "top",
			h = 60,
			w = 200,
			visible = true,
			text = "",
			y = 0,
			x = 0,
			color = tweak_data.gui.colors.raid_white,
			font = tweak_data.gui.fonts.din_compressed,
			font_size = tweak_data.gui.font_sizes.title
		}
		self._timer_label = self._root_panel.label(slot7, self._root_panel)
		slot8 = self._timer_label
		slot11 = self._root_panel

		self._timer_label.set_right(slot7, self._root_panel.right(tweak_data.gui.font_sizes.title))

		slot9 = {
			name = "timer_icon",
			h = 34,
			y = 20,
			w = 34,
			x = 0,
			texture = tweak_data.gui.icons.ico_time.texture,
			texture_rect = tweak_data.gui.icons.ico_time.texture_rect
		}
		self._timer_icon = self._root_panel.image(slot7, self._root_panel)
		slot8 = self

		self.redirect_to_phase_two_screen(slot7)
	end

	slot8 = self

	self.bind_controller_inputs(slot7)

	slot9 = true

	managers.challenge_cards.set_automatic_steam_inventory_refresh(slot7, managers.challenge_cards)

	slot8 = managers.network.account

	managers.network.account.inventory_load(slot7)

	slot9 = {
		list = managers.challenge_cards.get_readyup_card_cache(slot11)
	}
	slot12 = managers.challenge_cards

	self._players_inventory_processed(slot7, self)

	return 
end
function ChallengeCardsGui:_setup_single_player()
	slot3 = managers.network
	slot3 = managers.network.session(slot2)
	self._is_single_player = managers.network.session(slot2).count_all_peers(slot2) == 1
	self._suggest_button_string_id = "menu_suggest_card_buton"
	self._disabled_suggest_button_string_id = "menu_suggested"

	if self._is_single_player then
		self._suggest_button_string_id = "menu_select_card_buton"
		self._disabled_suggest_button_string_id = "menu_selected"
	end

	slot3 = self._suggest_card_button
	slot8 = true

	self._suggest_card_button.set_text(slot2, self.translate(slot5, self, self._suggest_button_string_id))

	return 
end
function ChallengeCardsGui:host_skip_suggestions()
	slot3 = self

	self.phase_two_cancel(slot2)

	slot3 = self

	self.redirect_to_level_loading(slot2)

	return 
end
function ChallengeCardsGui:on_item_host_clicks_suggested_card_grid(selected_item_data)
	slot5 = selected_item_data

	self.select_suggested_card(slot3, self)

	return 
end
function ChallengeCardsGui:sync_host_selects_suggested_card(card_key_name, peer_id, steam_instance_id)
	if card_key_name == nil and peer_id == nil and steam_instance_id == nil then
		self._host_selected_card = nil
	else
		self._host_selected_card = {
			key_name = card_key_name,
			peer_id = peer_id,
			steam_instance_id = steam_instance_id
		}
		slot6 = Network
		local is_host = Network.is_server(slot5)

		if not is_host then
			slot8 = peer_id

			self._host_activates_card_grid.select_item(slot6, self._host_activates_card_grid)
		end
	end

	return 
end
function ChallengeCardsGui:on_click_filter_rarity(rarity)
	self._filter_rarity = rarity
	slot4 = self

	self.reload_filtered_data(slot3)

	return 
end
function ChallengeCardsGui:filter_cards_by_type(type)
	slot4 = managers.raid_job
	self._filter_type = managers.raid_job.current_job_type(slot3)
	slot4 = self

	self.reload_filtered_data(slot3)

	return 
end
function ChallengeCardsGui:reload_filtered_data()
	if self._challenge_cards_steam_data_source and (self._filter_rarity == LootDropTweakData.RARITY_ALL or not self._filter_rarity) then
		slot3 = self._challenge_cards_steam_data_source
		self._challenge_cards_data_source = clone(slot2)
	elseif self._challenge_cards_steam_data_source and self._filter_rarity ~= LootDropTweakData.RARITY_ALL then
		local result = {}
		slot4 = self._challenge_cards_steam_data_source

		for _, card_data in ipairs(slot3) do
			if self._filter_rarity == card_data.rarity then
				slot9 = result
				slot12 = card_data

				table.insert(slot8, clone(slot11))
			end
		end

		slot4 = result
		self._challenge_cards_data_source = clone(slot3)
	end

	local result = {}

	if self._filter_type then
		slot4 = self._challenge_cards_data_source

		for _, card_data in ipairs(slot3) do
			if (self._filter_type == OperationsTweakData.JOB_TYPE_RAID and card_data.card_type == ChallengeCardsTweakData.CARD_TYPE_RAID) or (self._filter_type == OperationsTweakData.JOB_TYPE_OPERATION and card_data.card_type == ChallengeCardsTweakData.CARD_TYPE_OPERATION) then
				slot10 = card_data

				table.insert(slot8, result)
			end
		end

		slot4 = result
		self._challenge_cards_data_source = clone(slot3)
	end

	slot4 = self._card_grid

	self._card_grid.refresh_data(slot3)

	slot4 = self._challenge_cards_grid_scrollable_area

	self._challenge_cards_grid_scrollable_area.setup_scroll_area(slot3)

	slot4 = self

	self._auto_select_first_card_in_grid(slot3)

	slot5 = true

	self._card_grid.set_selected(slot3, self._card_grid)

	return 
end
function ChallengeCardsGui:data_source_inventory_cards()
	self._challenge_cards_data_source = self._challenge_cards_data_source or {}

	return self._challenge_cards_data_source
end
function ChallengeCardsGui:_on_click_inventory_cards(item_data)
	if item_data then
		slot6 = item_data.steam_instance_ids[1]

		self._card_details.set_card(slot3, self._card_details, item_data.key_name)

		slot5 = RaidGUIControlCardDetails.MODE_SUGGESTING

		self._card_details.set_control_mode(slot3, self._card_details)

		slot5 = nil

		self._suggested_cards_grid.select_grid_item_by_item(slot3, self._suggested_cards_grid)
	end

	slot4 = self

	self._update_suggest_card_button(slot3)

	return 
end
function ChallengeCardsGui:_on_select_inventory_cards(item_idx, item_data)
	if item_data then
		slot7 = item_data.steam_instance_ids[1]

		self._card_details.set_card(slot4, self._card_details, item_data.key_name)

		slot6 = RaidGUIControlCardDetails.MODE_SUGGESTING

		self._card_details.set_control_mode(slot4, self._card_details)

		slot6 = nil

		self._suggested_cards_grid.select_grid_item_by_item(slot4, self._suggested_cards_grid)
	end

	slot5 = self

	self._update_suggest_card_button(slot4)

	return 
end
function ChallengeCardsGui:suggest_card()
	slot3 = self._card_details
	local card, steam_instance_id = self._card_details.get_card(slot2)

	if card then
		slot7 = steam_instance_id

		managers.challenge_cards.suggest_challenge_card(slot4, managers.challenge_cards, card.key_name)
	end

	slot6 = nil

	managers.raid_menu.register_on_escape_callback(slot4, managers.raid_menu)

	slot5 = managers.raid_menu

	managers.raid_menu.on_escape(slot4)

	return 
end
function ChallengeCardsGui:cancel_card()
	slot3 = managers.challenge_cards

	managers.challenge_cards.remove_suggested_challenge_card(slot2)

	slot4 = nil

	managers.raid_menu.register_on_escape_callback(slot2, managers.raid_menu)

	slot3 = managers.raid_menu

	managers.raid_menu.on_escape(slot2)

	return 
end
function ChallengeCardsGui:phase_two_activate()
	local peer_id = nil

	if self._host_selected_card then
		peer_id = self._host_selected_card.peer_id
	end

	slot6 = peer_id

	self.sync_phase_two_execute_action(slot3, self, "ACTIVATE")

	slot4 = managers.network
	slot7 = peer_id

	managers.network.session(slot3).send_to_peers_synched(slot3, managers.network.session(slot3), "sync_phase_two_execute_action", "ACTIVATE")

	slot4 = self

	self.redirect_to_level_loading(slot3)

	return 
end
function ChallengeCardsGui:_on_continue_without_card()
	slot3 = self

	self.host_skip_suggestions(slot2)

	return true, nil
end
function ChallengeCardsGui:phase_two_cancel()
	slot5 = nil

	self.sync_phase_two_execute_action(slot2, self, "CANCEL")

	slot3 = managers.network
	slot6 = nil

	managers.network.session(slot2).send_to_peers_synched(slot2, managers.network.session(slot2), "sync_phase_two_execute_action", "CANCEL")

	return 
end
function ChallengeCardsGui:sync_phase_two_execute_action(action, peer_id)
	if action == "ACTIVATE" and self._host_selected_card then
		slot6 = peer_id

		managers.challenge_cards.select_challenge_card(slot4, managers.challenge_cards)
	end

	return 
end
function ChallengeCardsGui:_players_inventory_processed(params)
	slot4 = managers.challenge_cards
	self._challenge_cards_steam_data_source = managers.challenge_cards.get_readyup_card_cache(slot3)
	slot4 = self._challenge_cards_steam_data_source
	self._challenge_cards_data_source = clone(slot3)
	slot4 = self

	self.reload_filtered_data(slot3)

	slot4 = self._card_grid

	self._card_grid.refresh_data(slot3)

	slot4 = self._challenge_cards_grid_scrollable_area

	self._challenge_cards_grid_scrollable_area.setup_scroll_area(slot3)

	slot5 = true

	self._card_grid.set_selected(slot3, self._card_grid)

	return 
end
function ChallengeCardsGui:suggestions_changed()
	slot3 = self._suggested_cards_grid

	self._suggested_cards_grid.refresh_data(slot2)

	slot3 = self._host_activates_card_grid

	self._host_activates_card_grid.refresh_data(slot2)

	return 
end
function ChallengeCardsGui:close()
	slot4 = false

	managers.challenge_cards.set_automatic_steam_inventory_refresh(slot2, managers.challenge_cards)

	slot4 = "challenge_cards_gui_suggestions_changed"

	managers.system_event_listener.remove_listener(slot2, managers.system_event_listener)

	slot4 = "challenge_cards_gui_inventory_processed"

	managers.system_event_listener.remove_listener(slot2, managers.system_event_listener)

	ChallengeCardsGui.PHASE = 1
	slot3 = self

	ChallengeCardsGui.super.close(1)

	return 
end
function ChallengeCardsGui:select_suggested_card(selected_item_data)
	slot4 = Network
	local is_host = Network.is_server(slot3)

	if is_host then
		local key_name, peer_id, steam_instance_id = nil

		if selected_item_data then
			key_name = selected_item_data.key_name
			peer_id = selected_item_data.peer_id
			steam_instance_id = selected_item_data.steam_instance_id
		end

		slot11 = steam_instance_id

		self.sync_host_selects_suggested_card(slot7, self, key_name, peer_id)

		slot8 = managers.network
		slot12 = steam_instance_id

		managers.network.session(slot7).send_to_peers_synched(slot7, managers.network.session(slot7), "sync_host_selects_suggested_card", key_name, peer_id)
	end

	return 
end
function ChallengeCardsGui:_update_suggest_card_button()
	slot3 = managers.network
	local local_peer = managers.network.session(slot2).local_peer(slot2)
	slot4 = managers.challenge_cards
	local suggested_card = managers.challenge_cards.get_suggested_cards(managers.network.session(slot2))[local_peer._id]

	if (self._challenge_cards_data_source and #self._challenge_cards_data_source < 1) or not self._challenge_cards_data_source then
		slot5 = self._suggest_card_button

		self._suggest_card_button.disable(slot4)

		slot5 = self._suggest_card_button

		self._suggest_card_button.hide(slot4)
	elseif suggested_card then
		slot5 = self._card_details
	else
		slot5 = self._suggest_card_button

		self._suggest_card_button.enable(slot4)

		slot5 = self._suggest_card_button

		self._suggest_card_button.show(slot4)

		slot5 = self._suggest_card_button
		slot10 = true

		self._suggest_card_button.set_text(slot4, self.translate(slot7, self, self._suggest_button_string_id))
	end

	return 
end
function ChallengeCardsGui:_auto_select_first_card_in_grid()
	local card_data = nil

	if self._challenge_cards_data_source and 1 <= #self._challenge_cards_data_source then
		card_data = self._challenge_cards_data_source[1]
		slot6 = card_data.steam_instance_ids[1]

		self._card_details.set_card(slot3, self._card_details, card_data.key_name)

		slot5 = RaidGUIControlCardDetails.MODE_SUGGESTING

		self._card_details.set_control_mode(slot3, self._card_details)

		slot5 = nil

		self._suggested_cards_grid.select_grid_item_by_item(slot3, self._suggested_cards_grid)

		slot4 = self._card_details

		self._card_details.show(slot3)
	else
		slot4 = managers.challenge_cards

		managers.challenge_cards.remove_suggested_challenge_card(slot3)

		slot4 = self._card_details

		self._card_details.hide(slot3)
	end

	slot4 = self

	self._update_suggest_card_button(slot3)

	return 
end
function ChallengeCardsGui:update(t, dt)
	if ChallengeCardsGui.PHASE == 2 then
		if 0 < self._phase_two_timer then
			self._phase_two_timer = self._phase_two_timer - dt

			if self._phase_two_timer < 0 then
				self._phase_two_timer = 0
			end

			slot9 = self._phase_two_timer
			slot6 = " " .. math.floor(slot8)

			self._timer_label.set_text(slot4, self._timer_label)

			slot5 = self._timer_label
			local x, y, w, h = self._timer_label.text_rect(slot4)
			slot10 = w

			self._timer_label.set_width(slot8, self._timer_label)

			slot9 = self._timer_label
			slot12 = self._root_panel

			self._timer_label.set_right(slot8, self._root_panel.right(slot11))

			slot9 = self._timer_icon
			slot12 = self._timer_label

			self._timer_icon.set_right(slot8, self._timer_label.left(slot11))
		elseif self._phase_two_timer == 0 then
			slot5 = self

			self.redirect_to_level_loading(slot4)
		end
	end

	return 
end
function ChallengeCardsGui:redirect_to_phase_two_screen()
	if not self._phase_one_completed then
		self._phase_one_completed = true
		local all_players_passed = true
		slot6 = managers.challenge_cards

		for _, suggested_card_data in pairs(managers.challenge_cards.get_suggested_cards(slot5)) do
			if suggested_card_data.key_name ~= ChallengeCardsManager.CARD_PASS_KEY_NAME then
				all_players_passed = false

				break
			end
		end

		if all_players_passed then
			slot4 = self

			self.phase_two_cancel(slot3)
		end

		slot5 = false

		self._phase_one_panel.set_visible(slot3, self._phase_one_panel)

		slot5 = true

		self._phase_two_panel.set_visible(slot3, self._phase_two_panel)

		slot4 = Network

		if Network.is_server(slot3) then
			slot5 = "menu_challenge_cards_choose_suggested_card"

			self._node.components.raid_menu_header.set_screen_name(slot3, self._node.components.raid_menu_header)
		else
			slot5 = "menu_challenge_cards_waiting_choose_card"

			self._node.components.raid_menu_header.set_screen_name(slot3, self._node.components.raid_menu_header)
		end

		slot4 = Network
		local is_host = Network.is_server(slot3)

		if is_host then
			slot6 = true

			self._phase_two_activate_button.set_visible(slot4, self._phase_two_activate_button)

			slot6 = true

			self._continue_without_a_card_button.set_visible(slot4, self._continue_without_a_card_button)
		else
			slot6 = false

			self._phase_two_activate_button.set_visible(slot4, self._phase_two_activate_button)

			slot6 = false

			self._continue_without_a_card_button.set_visible(slot4, self._continue_without_a_card_button)
		end

		local selected_suggested_card_item = self._host_activates_card_grid.select_first_available_item(slot4)
		local selected_suggested_card_data = selected_suggested_card_item.get_data(self._host_activates_card_grid)
		slot8 = selected_suggested_card_data

		self.select_suggested_card(selected_suggested_card_item, self)
	end

	return 
end
function ChallengeCardsGui:redirect_to_level_loading()
	self._phase_two_completed = true
	slot4 = false

	managers.raid_menu.close_menu(slot2, managers.raid_menu)

	slot4 = GlobalStateManager.EVENT_START_RAID

	managers.global_state.fire_event(slot2, managers.global_state)

	return 
end
function ChallengeCardsGui:bind_controller_inputs()
	local legend = {
		controller = {},
		keyboard = {}
	}
	local bindings = {}

	if ChallengeCardsGui.PHASE == 1 then
		slot7 = "menu_controller_shoulder_left"
		slot9 = "_on_tabs_rarity_left"
		slot7 = "menu_controller_shoulder_right"
		slot9 = "_on_tabs_rarity_right"
		slot7 = "menu_controller_face_bottom"
		slot9 = "suggest_card"
		slot7 = "menu_controller_face_left"
		slot9 = "cancel_card"
		slot7 = "menu_controller_face_right"
		slot9 = "back_pressed"
		bindings = {
			{
				key = Idstring(slot6),
				callback = callback(slot6, self, self)
			},
			{
				key = Idstring(slot6),
				callback = callback(slot6, self, self)
			},
			{
				key = Idstring(slot6),
				callback = callback(slot6, self, self)
			},
			{
				key = Idstring(slot6),
				callback = callback(slot6, self, self)
			},
			{
				key = Idstring(slot6),
				callback = callback(slot6, self, self)
			}
		}
		local selection_legend_string = "menu_legend_challenge_cards_suggest_card"

		if self._is_single_player then
			selection_legend_string = "menu_legend_challenge_cards_select_card"
		end

		slot12 = nil
		legend = {
			controller = {
				"menu_legend_challenge_cards_rarity",
				selection_legend_string,
				"menu_legend_challenge_cards_remove_suggestion",
				"menu_legend_back"
			},
			keyboard = {
				{
					key = "footer_back",
					callback = callback(slot8, self, self, "_on_legend_pc_back")
				}
			}
		}
	else
		slot5 = Network

		if Network.is_server(slot4) then
			slot7 = "menu_controller_shoulder_left"
			slot9 = "_on_select_card_left"
			slot7 = "menu_controller_shoulder_right"
			slot9 = "_on_select_card_right"
			slot7 = "menu_controller_face_bottom"
			slot9 = "phase_two_activate"
			slot7 = "menu_controller_face_top"
			slot9 = "_on_continue_without_card"
			bindings = {
				{
					key = Idstring(slot6),
					callback = callback(slot6, self, self)
				},
				{
					key = Idstring(slot6),
					callback = callback(slot6, self, self)
				},
				{
					key = Idstring(slot6),
					callback = callback(slot6, self, self)
				},
				{
					key = Idstring(slot6),
					callback = callback(slot6, self, self)
				}
			}
			slot11 = nil
			legend = {
				controller = {
					"menu_legend_challenge_cards_toggle",
					"menu_legend_challenge_cards_select_card",
					"menu_legend_challenge_cards_continue_without_card"
				},
				keyboard = {
					{
						key = "footer_back",
						callback = callback(self, self, self, "_on_legend_pc_back")
					}
				}
			}
		end
	end

	slot7 = true

	self.set_controller_bindings(slot4, self, bindings)

	slot6 = legend

	self.set_legend(slot4, self)

	return 
end
function ChallengeCardsGui:_on_tabs_rarity_left()
	slot3 = self._rarity_filters_tabs

	self._rarity_filters_tabs._move_left(slot2)

	return true, nil
end
function ChallengeCardsGui:_on_tabs_rarity_right()
	slot3 = self._rarity_filters_tabs

	self._rarity_filters_tabs._move_right(slot2)

	return true, nil
end
function ChallengeCardsGui:_on_select_card_left()
	local item_data = self._host_activates_card_grid.move_selection_left(slot2)
	slot5 = item_data

	self.select_suggested_card(self._host_activates_card_grid, self)

	return true, nil
end
function ChallengeCardsGui:_on_select_card_right()
	local item_data = self._host_activates_card_grid.move_selection_right(slot2)
	slot5 = item_data

	self.select_suggested_card(self._host_activates_card_grid, self)

	return true, nil
end
function ChallengeCardsGui:back_pressed()
	if ChallengeCardsGui.PHASE == 2 then
		return true
	end

	slot3 = managers.controller

	if managers.controller.is_xbox_controller_present(slot2) then
		slot3 = managers.menu

		if not managers.menu.is_pc_controller(slot2) then
			slot4 = nil

			managers.raid_menu.register_on_escape_callback(slot2, managers.raid_menu)

			slot3 = managers.raid_menu

			managers.raid_menu.on_escape(slot2)
		end
	end

	return 
end
function ChallengeCardsGui:confirm_pressed()
	if ChallengeCardsGui.PHASE == 1 then
		slot3 = self

		self.suggest_card(slot2)
	else
		slot3 = Network

		if Network.is_server(slot2) then
			slot3 = self

			self.phase_two_activate(slot2)
		end
	end

	return 
end

return 
