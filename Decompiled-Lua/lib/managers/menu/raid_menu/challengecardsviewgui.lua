if not ChallengeCardsViewGui then
	slot2 = RaidGuiBase
	slot0 = class(slot1)
end

ChallengeCardsViewGui = slot0
function ChallengeCardsViewGui:init(ws, fullscreen_ws, node, component_name)
	slot11 = component_name

	ChallengeCardsViewGui.super.init(slot6, self, ws, fullscreen_ws, node)

	return 
end
function ChallengeCardsViewGui:_set_initial_data()
	slot4 = "challenge_cards_album_view_title"

	self._node.components.raid_menu_header.set_screen_name(slot2, self._node.components.raid_menu_header)

	self._challenge_cards_data_source = {}
	self._challenge_cards_steam_data_source = {}
	self._filter_rarity = nil
	self._filter_type = nil

	return 
end
function ChallengeCardsViewGui:_layout()
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
	self._rarity_filters_tabs = self._root_panel.tabs(slot2, self._root_panel)
	slot4 = {
		name = "type_filters_tabs",
		tab_width = 140,
		initial_tab_idx = 3,
		tab_align = "center",
		dont_trigger_special_buttons = true,
		tab_height = 32,
		y = 176,
		x = 0,
		icon = tweak_data.gui.icons.ico_filter,
		item_class = RaidGUIControlTabFilter,
		on_click_callback = callback(, self, self),
		tabs_params = {
			{
				name = "filter_raid",
				text = self.translate(self, self, "menu_mission_selected_mission_type_raid"),
				callback_param = OperationsTweakData.JOB_TYPE_RAID
			},
			{
				name = "filter_operation",
				text = self.translate(self, self, "menu_mission_selected_mission_type_operation"),
				callback_param = OperationsTweakData.JOB_TYPE_OPERATION
			},
			{
				name = "filter_type_all",
				text = self.translate(self, self, "menu_mission_selected_mission_type_both")
			}
		}
	}
	slot9 = "on_click_filter_type"
	slot11 = true
	slot11 = true
	slot11 = true
	self._type_filters_tabs = self._root_panel.tabs(slot2, self._root_panel)
	local challenge_cards_grid_scrollable_area_params = {
		name = "challenge_cards_grid_scrollable_area",
		h = 580,
		y = 224,
		w = 640,
		x = 0,
		scroll_step = 30
	}
	self._challenge_cards_grid_scrollable_area = self._root_panel.scrollable_area(self._root_panel, self._root_panel)
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
		h = 736,
		visible = true,
		w = 992,
		x = 736
	}
	slot8 = card_details_params
	self._card_details = self._root_panel.create_custom_control(self._challenge_cards_grid_scrollable_area.get_panel(RaidGUIControlCardWithSelector), self._root_panel, RaidGUIControlCardDetails)
	slot7 = RaidGUIControlCardDetails.MODE_VIEW_ONLY

	self._card_details.set_control_mode(self._challenge_cards_grid_scrollable_area.get_panel(RaidGUIControlCardWithSelector), self._card_details)

	slot8 = {
		CoreSystemEventListenerManager.SystemEventListenerManager.EVENT_STEAM_INVENTORY_LOADED
	}
	slot13 = "render_player_inventory"

	managers.system_event_listener.add_listener(self._challenge_cards_grid_scrollable_area.get_panel(RaidGUIControlCardWithSelector), managers.system_event_listener, "challenge_cards_view_gui_steam_inventory_loaded", callback("menu_mission_selected_mission_type_both", self, self))

	slot6 = managers.network.account

	managers.network.account.inventory_load(self._challenge_cards_grid_scrollable_area.get_panel(RaidGUIControlCardWithSelector))

	slot6 = self

	self.bind_controller_inputs(self._challenge_cards_grid_scrollable_area.get_panel(RaidGUIControlCardWithSelector))

	return 
end
function ChallengeCardsViewGui:on_click_filter_rarity(rarity)
	self._filter_rarity = rarity
	slot4 = self

	self.reload_filtered_data(slot3)

	return 
end
function ChallengeCardsViewGui:on_click_filter_type(type)
	self._filter_type = type
	slot4 = self

	self.reload_filtered_data(slot3)

	return 
end
function ChallengeCardsViewGui:reload_filtered_data()
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
function ChallengeCardsViewGui:data_source_inventory_cards()
	self._challenge_cards_data_source = self._challenge_cards_data_source or {}

	return self._challenge_cards_data_source
end
function ChallengeCardsViewGui:_on_click_inventory_cards(item_data)
	if item_data then
		slot6 = item_data.steam_instance_id

		self._card_details.set_card(slot3, self._card_details, item_data.key_name)

		slot5 = RaidGUIControlCardDetails.MODE_VIEW_ONLY

		self._card_details.set_control_mode(slot3, self._card_details)
	end

	return 
end
function ChallengeCardsViewGui:_on_select_inventory_cards(item_idx, item_data)
	if item_data then
		slot7 = item_data.steam_instance_id

		self._card_details.set_card(slot4, self._card_details, item_data.key_name)

		slot6 = RaidGUIControlCardDetails.MODE_VIEW_ONLY

		self._card_details.set_control_mode(slot4, self._card_details)
	end

	return 
end
function ChallengeCardsViewGui:render_player_inventory(params)
	if not params or not params.list then
		return 
	end

	local result = {}

	if params.list then
		result = params.list
	end

	self._challenge_cards_steam_data_source = result
	slot5 = self._challenge_cards_steam_data_source
	self._challenge_cards_data_source = clone(slot4)
	slot5 = self._card_grid

	self._card_grid.refresh_data(slot4)

	slot5 = self

	self._auto_select_first_card_in_grid(slot4)

	slot5 = self._challenge_cards_grid_scrollable_area

	self._challenge_cards_grid_scrollable_area.setup_scroll_area(slot4)

	slot6 = true

	self._card_grid.set_selected(slot4, self._card_grid)

	return 
end
function ChallengeCardsViewGui:close()
	slot4 = "challenge_cards_view_gui_steam_inventory_loaded"

	managers.system_event_listener.remove_listener(slot2, managers.system_event_listener)

	slot3 = self

	ChallengeCardsGui.super.close(slot2)

	return 
end
function ChallengeCardsViewGui:_auto_select_first_card_in_grid()
	local card_data = nil

	if self._challenge_cards_data_source and 1 <= #self._challenge_cards_data_source then
		card_data = self._challenge_cards_data_source[1]
		slot6 = card_data.steam_instance_id

		self._card_details.set_card(slot3, self._card_details, card_data.key_name)

		slot5 = RaidGUIControlCardDetails.MODE_VIEW_ONLY

		self._card_details.set_control_mode(slot3, self._card_details)
	else
		slot5 = ChallengeCardsManager.CARD_PASS_KEY_NAME
		card_data = tweak_data.challenge_cards.get_card_by_key_name(slot3, tweak_data.challenge_cards)
	end

	return 
end
function ChallengeCardsViewGui:on_mouse_moved(o, x, y)
	return false
end
function ChallengeCardsViewGui:bind_controller_inputs()
	local bindings = {}
	slot5 = "menu_controller_shoulder_left"
	slot7 = "_on_tabs_rarity_left"
	bindings[1] = {
		key = Idstring(slot4),
		callback = callback(slot4, self, self)
	}
	slot5 = "menu_controller_shoulder_right"
	slot7 = "_on_tabs_rarity_right"
	bindings[2] = {
		key = Idstring(slot4),
		callback = callback(slot4, self, self)
	}
	slot5 = "menu_controller_trigger_left"
	slot7 = "_on_tabs_type_left"
	bindings[3] = {
		key = Idstring(slot4),
		callback = callback(slot4, self, self)
	}
	slot5 = "menu_controller_trigger_right"
	slot7 = "_on_tabs_type_right"
	bindings[4] = {
		key = Idstring(slot4),
		callback = callback(slot4, self, self)
	}

	self.set_controller_bindings(callback(slot4, self, self), self, bindings)

	local legend = {
		controller = {
			"menu_legend_back",
			"menu_legend_challenge_cards_rarity",
			"menu_legend_challenge_cards_type"
		}
	}
	slot10 = nil
	legend.keyboard = {
		{
			key = "footer_back",
			callback = callback(true, self, self, "_on_legend_pc_back")
		}
	}
	slot6 = legend

	self.set_legend(, self)

	return 
end
function ChallengeCardsViewGui:_on_tabs_rarity_left()
	slot3 = self._rarity_filters_tabs

	self._rarity_filters_tabs._move_left(slot2)

	return true, nil
end
function ChallengeCardsViewGui:_on_tabs_rarity_right()
	slot3 = self._rarity_filters_tabs

	self._rarity_filters_tabs._move_right(slot2)

	return true, nil
end
function ChallengeCardsViewGui:_on_tabs_type_left()
	slot3 = self._type_filters_tabs

	self._type_filters_tabs._move_left(slot2)

	return true, nil
end
function ChallengeCardsViewGui:_on_tabs_type_right()
	slot3 = self._type_filters_tabs

	self._type_filters_tabs._move_right(slot2)

	return true, nil
end
function ChallengeCardsViewGui:back_pressed()
	slot3 = managers.raid_menu

	managers.raid_menu.on_escape(slot2)

	return 
end

return 
