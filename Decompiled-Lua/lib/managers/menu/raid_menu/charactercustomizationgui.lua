-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not CharacterCustomizationGui then
	slot2 = RaidGuiBase
	slot0 = class(slot1)
end

CharacterCustomizationGui = slot0
slot5 = -620.056
CharacterCustomizationGui.CHARACTER_SPAWN_LOCATION = Vector3(slot2, -514.259, -3565.31)
slot5 = 0
CharacterCustomizationGui.CHARACTER_SPAWN_ROTATION = Rotation(slot2, 0, 0)
CharacterCustomizationGui.CONFIRM_PRESSED_STATE_BUY = "state_buy"
CharacterCustomizationGui.CONFIRM_PRESSED_STATE_EQUIP = "state_equip"
function CharacterCustomizationGui:init(ws, fullscreen_ws, node, component_name)
	slot11 = component_name

	CharacterCustomizationGui.super.init(slot6, self, ws, fullscreen_ws, node)

	slot8 = "character_customization_title"

	self._node.components.raid_menu_header.set_screen_name(slot6, self._node.components.raid_menu_header)

	self._confirm_pressed_state = nil
	slot7 = managers.raid_menu

	managers.raid_menu.hide_background(slot6)

	return 
end
function CharacterCustomizationGui:_setup_properties()
	slot3 = self

	CharacterCustomizationGui.super._setup_properties(slot2)

	self._background = nil
	self._background_rect = nil

	return 
end
function CharacterCustomizationGui:_set_initial_data()
	slot3 = managers.character_customization

	managers.character_customization.reset_current_version_to_attach(slot2)

	self._all_customizations = tweak_data.character_customization.customizations
	slot3 = managers.player
	self._equipped_head_name = managers.player.get_customization_equiped_head_name(slot2)
	slot3 = managers.player
	self._equipped_upper_name = managers.player.get_customization_equiped_upper_name(slot2)
	slot3 = managers.player
	self._equipped_lower_name = managers.player.get_customization_equiped_lower_name(slot2)
	slot3 = managers.player
	self._selected_head_name = managers.player.get_customization_equiped_head_name(slot2)
	slot3 = managers.player
	self._selected_upper_name = managers.player.get_customization_equiped_upper_name(slot2)
	slot3 = managers.player
	self._selected_lower_name = managers.player.get_customization_equiped_lower_name(slot2)
	self._character_spawn_location = nil
	slot3 = self

	self.get_character_spawn_location(slot2)

	slot3 = self

	self.spawn_character_unit(slot2)

	slot3 = self

	self.render_all_parts(slot2)

	return 
end
function CharacterCustomizationGui:_layout()
	local character_nationality = managers.player.get_character_profile_nation(slot2)
	slot4 = self

	self._disable_dof(managers.player)

	slot5 = {
		tab_align = "center",
		name = "filter_body_part",
		tab_width = 240,
		initial_tab_idx = 1,
		tab_height = 64,
		y = 96,
		x = 0,
		on_click_callback = callback(slot7, self, self),
		tabs_params = {
			{
				name = "tab_upper",
				text = self.translate(self, self, "character_customization_filter_body_part_upper"),
				callback_param = CharacterCustomizationTweakData.PART_TYPE_UPPER,
				breadcrumb = {
					category = BreadcrumbManager.CATEGORY_CHARACTER_CUSTOMIZATION_UPPER,
					identifiers = {
						character_nationality
					}
				}
			},
			{
				name = "tab_lower",
				text = self.translate(, self, "character_customization_filter_body_part_lower"),
				callback_param = CharacterCustomizationTweakData.PART_TYPE_LOWER,
				breadcrumb = {
					category = BreadcrumbManager.CATEGORY_CHARACTER_CUSTOMIZATION_LOWER,
					identifiers = {
						character_nationality
					}
				}
			}
		}
	}
	slot10 = "_on_click_filter_body_part"
	slot12 = true
	slot12 = true
	self._filter_body_part = self._root_panel.tabs(managers.player, self._root_panel)
	self._selected_filter_body_part = CharacterCustomizationTweakData.PART_TYPE_UPPER
	local customization_grid_scrollable_area_params = {
		name = "customization_grid_scrollable_area",
		h = 598,
		y = 190,
		w = 484,
		x = 0,
		scroll_step = 30
	}
	self._customization_grid_scrollable_area = self._root_panel.scrollable_area(self._root_panel, self._root_panel)
	local customization_grid_params = {
		name = "customization_grid",
		y = 0,
		w = 480,
		x = 0,
		scrollable_area_ref = self._customization_grid_scrollable_area
	}
	slot9 = "_data_source_character_customizations"
	slot9 = "_on_click_character_customizations"
	slot9 = "_on_double_click_character_customizations"
	slot9 = "_on_selected_character_customizations"
	customization_grid_params.grid_params = {
		scroll_marker_w = 32,
		vertical_spacing = 5,
		data_source_callback = callback(customization_grid_scrollable_area_params, self, self),
		on_click_callback = callback(customization_grid_scrollable_area_params, self, self),
		on_double_click_callback = callback(customization_grid_scrollable_area_params, self, self),
		on_select_callback = callback(customization_grid_scrollable_area_params, self, self)
	}
	customization_grid_params.item_params = {
		item_w = 134,
		grid_item_icon = "path_icon",
		key_value_field = "key_name",
		item_h = 134,
		selected_marker_h = 148,
		selected_marker_w = 148,
		row_class = RaidGUIControlGridItemActive
	}
	slot6 = self._customization_grid_scrollable_area
	slot7 = customization_grid_params
	self._character_customizations_grid = self._customization_grid_scrollable_area.get_panel(RaidGUIControlGridItemActive).grid_active(RaidGUIControlGridItemActive, self._customization_grid_scrollable_area.get_panel(RaidGUIControlGridItemActive))
	slot7 = {
		name = "profile_name_label",
		h = 32,
		w = 356,
		align = "right",
		text = "",
		y = 96,
		x = 1376,
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.large,
		color = tweak_data.gui.colors.raid_white
	}
	self._profile_name_label = self._root_panel.label(RaidGUIControlGridItemActive, self._root_panel)
	slot6 = self._profile_name_label
	slot9 = self._root_panel

	self._profile_name_label.set_right(RaidGUIControlGridItemActive, self._root_panel.right(tweak_data.gui.colors.raid_white))

	slot7 = {
		name = "character_name_label",
		h = 32,
		w = 356,
		align = "right",
		text = "",
		y = 128,
		x = 1376,
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.small,
		color = tweak_data.gui.colors.raid_grey
	}
	self._character_name_label = self._root_panel.label(RaidGUIControlGridItemActive, self._root_panel)
	slot6 = self._character_name_label
	slot9 = self._root_panel

	self._character_name_label.set_right(RaidGUIControlGridItemActive, self._root_panel.right(tweak_data.gui.colors.raid_grey))

	slot9 = {}
	self._right_side_info = self._root_panel.create_custom_control(RaidGUIControlGridItemActive, self._root_panel, RaidGUIControlCharacterDescription, {
		name = "right_side_info_panel",
		h = 640,
		y = 192,
		w = 356,
		x = 1376,
		mode = RaidGUIControlCharacterDescription.MODE_CUSTOMIZATION
	})
	slot6 = self._right_side_info
	slot9 = self._root_panel

	self._right_side_info.set_right(RaidGUIControlGridItemActive, self._root_panel.right())

	slot6 = PlayerManager
	local nationality = PlayerManager.get_character_profile_nation(RaidGUIControlGridItemActive)
	local class_name = managers.skilltree._global.character_profile_base_class
	slot10 = false
	local level = Application.digest_value(self._root_panel.right, Application, managers.experience._global.level)
	slot10 = {
		class_name = class_name,
		nationality = nationality,
		level = level
	}

	self._right_side_info.set_data(Application, self._right_side_info)

	slot10 = self._selected_filter_body_part
	local icon_data = self.get_icon_data_for_body_part(Application, self)
	slot11 = {
		x = self._right_side_info.x(slot13),
		y = self._right_side_info.y(slot13) + 176,
		w = icon_data.texture_rect[3],
		h = icon_data.texture_rect[4],
		texture = icon_data.texture,
		texture_rect = icon_data.texture_rect
	}
	slot14 = self._right_side_info
	self._body_part_icon = self._root_panel.image(self, self._root_panel)
	local body_part_data = self._all_customizations[self._selected_upper_name]
	slot12 = {
		wor_wrap = true,
		wrap = true,
		w = 288,
		x = self._body_part_icon.x(self._right_side_info) + 48,
		y = self._body_part_icon.y(self._right_side_info),
		text = self.translate(self._right_side_info, self, body_part_data.name),
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.large,
		color = tweak_data.gui.colors.raid_white
	}
	slot15 = self._body_part_icon
	slot15 = self._body_part_icon
	slot17 = true
	self._body_part_title = self._root_panel.label(self._root_panel, self._root_panel)
	slot12 = {
		h = 448,
		wrap = true,
		w = 352,
		x = self._body_part_icon.x(self._right_side_info),
		text = self.translate(self._right_side_info, self, body_part_data.description),
		font = tweak_data.gui.fonts.lato,
		font_size = tweak_data.gui.font_sizes.size_20,
		color = tweak_data.gui.colors.raid_grey
	}
	slot15 = self._body_part_icon
	slot17 = false
	self._body_part_description = self._root_panel.label(self._root_panel, self._root_panel)
	slot12 = self._body_part_title.bottom(tweak_data.gui.colors.raid_grey) + 10

	self._body_part_description.set_top(self._root_panel, self._body_part_description)

	self._coord_center_y = 864
	slot12 = {
		name = "equip_button",
		visible = false,
		x = 0,
		text = self.translate(self._body_part_title, self, "character_customization_equip_button"),
		layer = RaidGuiBase.FOREGROUND_LAYER,
		on_click_callback = callback(self._body_part_title, self, self)
	}
	slot17 = true
	slot17 = "_on_click_button_equip"
	self._equip_button = self._root_panel.short_primary_button(self._root_panel, self._root_panel)
	slot12 = self._coord_center_y

	self._equip_button.set_center_y(self._root_panel, self._equip_button)

	slot12 = {
		name = "equip_gold_button",
		visible = false,
		x = 0,
		text = self.translate(self._body_part_title, self, "character_customization_equip_button"),
		layer = RaidGuiBase.FOREGROUND_LAYER,
		on_click_callback = callback(self._body_part_title, self, self)
	}
	slot17 = true
	slot17 = "_on_click_button_equip"
	self._equip_gold_button = self._root_panel.short_primary_gold_button(self._root_panel, self._root_panel)
	slot12 = self._coord_center_y

	self._equip_gold_button.set_center_y(self._root_panel, self._equip_gold_button)

	slot12 = {
		name = "buy_button",
		visible = false,
		x = 0,
		text = self.translate(self._body_part_title, self, "character_customization_buy_button"),
		layer = RaidGuiBase.FOREGROUND_LAYER,
		on_click_callback = callback(self._body_part_title, self, self)
	}
	slot17 = true
	slot17 = "_on_click_button_buy"
	self._buy_button = self._root_panel.short_primary_gold_button(self._root_panel, self._root_panel)
	slot12 = self._coord_center_y

	self._buy_button.set_center_y(self._root_panel, self._buy_button)

	slot12 = {
		name = "info_label",
		h = 60,
		wrap = true,
		w = 520,
		word_wrap = true,
		visible = false,
		x = 0,
		text = self.translate(self._body_part_title, self, "character_customization_insuficient_gold_label"),
		layer = RaidGuiBase.FOREGROUND_LAYER,
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.small
	}
	slot17 = true
	self._info_label = self._root_panel.label(self._root_panel, self._root_panel)
	slot12 = self._coord_center_y

	self._info_label.set_center_y(self._root_panel, self._info_label)

	slot12 = {
		text = "",
		name = "gold_currency_label",
		visible = false,
		x = 250,
		layer = RaidGuiBase.FOREGROUND_LAYER,
		color = tweak_data.gui.colors.gold_orange,
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.size_38
	}
	self._gold_currency_label = self._root_panel.label(self._root_panel, self._root_panel)
	slot11 = self._gold_currency_label
	local x2, y2, w2, h2 = self._gold_currency_label.text_rect(self._root_panel)
	slot16 = h2

	self._gold_currency_label.set_h(self._body_part_title, self._gold_currency_label)

	slot16 = w2

	self._gold_currency_label.set_w(self._body_part_title, self._gold_currency_label)

	slot16 = self._coord_center_y

	self._gold_currency_label.set_center_y(self._body_part_title, self._gold_currency_label)

	slot16 = 512

	self._gold_currency_label.set_right(self._body_part_title, self._gold_currency_label)

	slot16 = {
		name = "gold_currency_icon",
		visible = false,
		x = 200,
		layer = RaidGuiBase.FOREGROUND_LAYER,
		color = tweak_data.gui.colors.gold_orange,
		texture = tweak_data.gui.icons.gold_amount_purchase.texture,
		texture_rect = tweak_data.gui.icons.gold_amount_purchase.texture_rect
	}
	self._gold_currency_icon = self._root_panel.bitmap(self._body_part_title, self._root_panel)
	slot16 = self._coord_center_y

	self._gold_currency_icon.set_center_y(self._body_part_title, self._gold_currency_icon)

	slot18 = self._gold_currency_label
	slot16 = self._gold_currency_label.x(tweak_data.gui.icons.gold_amount_purchase.texture_rect) - 14

	self._gold_currency_icon.set_right(self._body_part_title, self._gold_currency_icon)

	slot16 = {
		name = "gold_item_bought_icon",
		visible = false,
		x = 200,
		layer = RaidGuiBase.FOREGROUND_LAYER,
		texture = tweak_data.gui.icons.consumable_purchased_confirmed.texture,
		texture_rect = tweak_data.gui.icons.consumable_purchased_confirmed.texture_rect
	}
	self._gold_item_bought_icon = self._root_panel.bitmap(self._body_part_title, self._root_panel)
	slot16 = self._coord_center_y

	self._gold_item_bought_icon.set_center_y(self._body_part_title, self._gold_item_bought_icon)

	slot16 = self._gold_currency_label.x(tweak_data.gui.icons.consumable_purchased_confirmed.texture_rect) - 14

	self._gold_item_bought_icon.set_right(self._body_part_title, self._gold_item_bought_icon)

	slot15 = self

	self.bind_controller_inputs(self._body_part_title)

	slot15 = self._customization_grid_scrollable_area

	self._customization_grid_scrollable_area.setup_scroll_area(self._body_part_title)

	slot17 = true

	self._character_customizations_grid.set_selected(self._body_part_title, self._character_customizations_grid, true)

	slot16 = {
		key = "key_name",
		value = self._equipped_upper_name
	}
	local selected_item = self._character_customizations_grid.select_grid_item_by_key_value(self._body_part_title, self._character_customizations_grid)
	slot16 = self
	slot19 = selected_item

	self.show_character_description(self._character_customizations_grid, selected_item.get_data(self._gold_currency_label))

	slot17 = {
		key = "key_name",
		value = self._equipped_upper_name
	}

	self._character_customizations_grid.activate_item_by_value(self._character_customizations_grid, self._character_customizations_grid)

	slot16 = self

	self._process_controls_states(self._character_customizations_grid)

	return 
end
function CharacterCustomizationGui:close()
	slot3 = self

	self._enable_dof(slot2)

	slot3 = self

	self.save_equipped_customizations(slot2)

	slot3 = self

	self.destroy_character_unit(slot2)

	slot3 = self

	CharacterCustomizationGui.super.close(slot2)

	return 
end
function CharacterCustomizationGui:_on_click_button_equip()
	slot3 = self

	self._equip_selected_customization(slot2)

	return 
end
function CharacterCustomizationGui:_on_click_button_buy()
	slot4 = "[CharacterCustomizationGui:_on_click_button_buy]"

	Application.trace(slot2, Application)

	local selected_item = self._character_customizations_grid.selected_grid_item(slot2)
	slot4 = selected_item
	local selected_item_data = selected_item.get_data(self._character_customizations_grid)
	local dialog_params = {
		amount = selected_item_data.gold_price
	}
	slot8 = true
	dialog_params.customization_name = self.translate(slot5, self, selected_item_data.name)
	slot8 = "_buy_customization_yes_callback"
	dialog_params.callback_yes = callback(slot5, self, self)
	slot7 = dialog_params

	managers.menu.show_character_customization_purchase_dialog(slot5, managers.menu)

	return 
end
function CharacterCustomizationGui:_on_click_filter_body_part(data)
	slot5 = data

	self._process_body_part_filter(slot3, self)

	return 
end
function CharacterCustomizationGui:_data_source_character_customizations()
	local character_nationality = managers.player.get_character_profile_nation(slot2)
	slot7 = false
	local grid_data = managers.character_customization.get_all_parts_indexed_filtered(managers.player, managers.character_customization, self._selected_filter_body_part, character_nationality)

	return grid_data
end
function CharacterCustomizationGui:_on_click_character_customizations(item_data)
	slot5 = item_data

	self._select_grid_item(slot3, self)

	return 
end
function CharacterCustomizationGui:_on_double_click_character_customizations(item_data)
	slot4 = self

	self._equip_selected_customization(slot3)

	return 
end
function CharacterCustomizationGui:_on_selected_character_customizations(item_idx, item_data)
	slot6 = item_data

	self._select_grid_item(slot4, self)

	return 
end
function CharacterCustomizationGui:_equip_selected_customization()
	local selected_item_data, character_customizations = nil

	if self._selected_filter_body_part == CharacterCustomizationTweakData.PART_TYPE_UPPER then
		slot6 = CharacterCustomizationTweakData.PART_TYPE_UPPER
		character_customizations = managers.character_customization.get_all_parts(slot4, managers.character_customization)
		selected_item_data = character_customizations[self._selected_upper_name]
	elseif self._selected_filter_body_part == CharacterCustomizationTweakData.PART_TYPE_LOWER then
		slot6 = CharacterCustomizationTweakData.PART_TYPE_LOWER
		character_customizations = managers.character_customization.get_all_parts(slot4, managers.character_customization)
		selected_item_data = character_customizations[self._selected_lower_name]
	end

	local selected_item = self._character_customizations_grid.selected_grid_item(slot4)
	local selected_item_data = selected_item.get_data(self._character_customizations_grid)
	slot8 = selected_item_data.key_name

	if not managers.character_customization.is_character_customization_owned(selected_item, managers.character_customization) then
		return 
	end

	slot8 = {
		key = "key_name",
		value = selected_item_data.key_name
	}

	self._character_customizations_grid.activate_item_by_value(slot6, self._character_customizations_grid)

	if self._selected_filter_body_part == CharacterCustomizationTweakData.PART_TYPE_UPPER then
		self._equipped_upper_name = selected_item_data.key_name
	elseif self._selected_filter_body_part == CharacterCustomizationTweakData.PART_TYPE_LOWER then
		self._equipped_lower_name = selected_item_data.key_name
	end

	slot7 = managers.raid_menu

	managers.raid_menu.refresh_footer_gold_amount(slot6)

	slot7 = self

	self._process_controls_states(slot6)

	return 
end
function CharacterCustomizationGui:_buy_customization_yes_callback()
	local selected_item_data, character_customizations = nil
	slot5 = managers.gold_economy
	local owned_gold = managers.gold_economy.current(slot4)

	if self._selected_filter_body_part == CharacterCustomizationTweakData.PART_TYPE_UPPER then
		slot7 = CharacterCustomizationTweakData.PART_TYPE_UPPER
		character_customizations = managers.character_customization.get_all_parts(slot5, managers.character_customization)
		selected_item_data = character_customizations[self._selected_upper_name]
	elseif self._selected_filter_body_part == CharacterCustomizationTweakData.PART_TYPE_LOWER then
		slot7 = CharacterCustomizationTweakData.PART_TYPE_LOWER
		character_customizations = managers.character_customization.get_all_parts(slot5, managers.character_customization)
		selected_item_data = character_customizations[self._selected_lower_name]
	end

	if not selected_item_data.gold_price or (selected_item_data.gold_price and owned_gold < selected_item_data.gold_price) then
		return 
	end

	slot8 = false

	managers.gold_economy.spend_gold(slot5, managers.gold_economy, selected_item_data.gold_price)

	slot8 = true

	managers.character_customization.add_character_customization_to_inventory(slot5, managers.character_customization, selected_item_data.key_name)

	slot7 = self._selected_filter_body_part

	self._process_body_part_filter(slot5, self)

	slot7 = {
		key = "key_name",
		value = selected_item_data.key_name
	}

	self._character_customizations_grid.select_grid_item_by_key_value(slot5, self._character_customizations_grid)

	slot7 = {
		key = "key_name",
		value = selected_item_data.key_name
	}

	self._character_customizations_grid.activate_item_by_value(slot5, self._character_customizations_grid)

	if self._selected_filter_body_part == CharacterCustomizationTweakData.PART_TYPE_UPPER then
		self._selected_upper_name = selected_item_data.key_name
		self._equipped_upper_name = selected_item_data.key_name
	elseif self._selected_filter_body_part == CharacterCustomizationTweakData.PART_TYPE_LOWER then
		self._selected_lower_name = selected_item_data.key_name
		self._equipped_lower_name = selected_item_data.key_name
	end

	slot6 = self

	self._process_controls_states(slot5)

	slot8 = false

	managers.savefile.save_game(slot5, managers.savefile, SavefileManager.SETTING_SLOT)

	return 
end
function CharacterCustomizationGui:_process_controls_states()
	slot3 = self._character_customizations_grid
	local equipped_item_data = self._character_customizations_grid.get_active_item(slot2).get_data(slot2)
	slot4 = self._character_customizations_grid
	slot4 = self._character_customizations_grid.selected_grid_item(self._character_customizations_grid.get_active_item(slot2))
	local selected_item_data = self._character_customizations_grid.selected_grid_item(self._character_customizations_grid.get_active_item(slot2)).get_data(self._character_customizations_grid.get_active_item(slot2))

	if selected_item_data.gold_price then
		slot6 = selected_item_data.gold_price

		self._gold_currency_label.set_text(slot4, self._gold_currency_label)

		slot5 = self._gold_currency_label
		local x2, y2, w2, h2 = self._gold_currency_label.text_rect(slot4)
		slot10 = h2

		self._gold_currency_label.set_h(slot8, self._gold_currency_label)

		slot10 = w2

		self._gold_currency_label.set_w(slot8, self._gold_currency_label)

		slot10 = self._coord_center_y

		self._gold_currency_label.set_center_y(slot8, self._gold_currency_label)

		slot10 = 512

		self._gold_currency_label.set_right(slot8, self._gold_currency_label)

		slot10 = self._coord_center_y

		self._gold_currency_icon.set_center_y(slot8, self._gold_currency_icon)

		slot12 = self._gold_currency_label
		slot10 = self._gold_currency_label.x(slot11) - 14

		self._gold_currency_icon.set_right(slot8, self._gold_currency_icon)

		slot10 = self._coord_center_y

		self._gold_item_bought_icon.set_center_y(slot8, self._gold_item_bought_icon)

		slot12 = self._gold_currency_label
		slot10 = self._gold_currency_label.x(slot11) - 14

		self._gold_item_bought_icon.set_right(slot8, self._gold_item_bought_icon)
	end

	if selected_item_data.locked == CharacterCustomizationManager.LOCKED_GOLD_NOT_OWNED and selected_item_data.gold_price then
		slot6 = managers.gold_economy
	elseif selected_item_data.locked == CharacterCustomizationManager.LOCKED_GOLD_NOT_OWNED and selected_item_data.gold_price then
		slot6 = managers.gold_economy
	elseif selected_item_data.locked == CharacterCustomizationManager.LOCKED_NOT_OWNED then
		slot5 = self._equip_button

		self._equip_button.hide(slot4)

		slot5 = self._equip_gold_button

		self._equip_gold_button.hide(slot4)

		slot5 = self._buy_button

		self._buy_button.hide(slot4)

		slot5 = self._info_label

		self._info_label.show(slot4)

		slot5 = self._info_label
		slot10 = true

		self._info_label.set_text(slot4, self.translate(slot7, self, "character_customization_locked_drop_label"))

		slot6 = tweak_data.gui.colors.raid_red

		self._info_label.set_color(slot4, self._info_label)

		slot5 = self._gold_currency_icon

		self._gold_currency_icon.hide(slot4)

		slot5 = self._gold_currency_label

		self._gold_currency_label.hide(slot4)

		slot5 = self._gold_item_bought_icon

		self._gold_item_bought_icon.hide(slot4)

		slot5 = self

		self.bind_controller_inputs(slot4)
	elseif selected_item_data.locked == CharacterCustomizationManager.LOCKED_DLC_SPECIFIC then
		slot5 = self._equip_button

		self._equip_button.hide(slot4)

		slot5 = self._equip_gold_button

		self._equip_gold_button.hide(slot4)

		slot5 = self._buy_button

		self._buy_button.hide(slot4)

		slot5 = self._info_label

		self._info_label.show(slot4)

		slot5 = self._info_label
		slot10 = true

		self._info_label.set_text(slot4, self.translate(slot7, self, "character_customization_locked_dlc_label"))

		slot6 = tweak_data.gui.colors.raid_red

		self._info_label.set_color(slot4, self._info_label)

		slot5 = self._gold_currency_icon

		self._gold_currency_icon.hide(slot4)

		slot5 = self._gold_currency_label

		self._gold_currency_label.hide(slot4)

		slot5 = self._gold_item_bought_icon

		self._gold_item_bought_icon.hide(slot4)

		slot5 = self

		self.bind_controller_inputs(slot4)
	elseif not selected_item_data.locked and selected_item_data.gold_price then
		slot5 = self._equip_button

		self._equip_button.hide(slot4)

		slot5 = self._equip_gold_button

		self._equip_gold_button.show(slot4)

		slot5 = self._buy_button

		self._buy_button.hide(slot4)

		slot5 = self._info_label

		self._info_label.hide(slot4)

		slot5 = self._gold_currency_icon

		self._gold_currency_icon.hide(slot4)

		slot5 = self._gold_currency_label

		self._gold_currency_label.show(slot4)

		slot5 = self._gold_item_bought_icon

		self._gold_item_bought_icon.show(slot4)

		if selected_item_data.key_name == equipped_item_data.key_name then
			slot5 = self._equip_gold_button

			self._equip_gold_button.disable(slot4)

			slot5 = self._equip_gold_button
			slot10 = true

			self._equip_gold_button.set_text(slot4, self.translate(slot7, self, "character_customization_equipped_button"))
		else
			slot5 = self._equip_gold_button

			self._equip_gold_button.enable(slot4)

			slot5 = self._equip_gold_button
			slot10 = true

			self._equip_gold_button.set_text(slot4, self.translate(slot7, self, "character_customization_equip_button"))
		end

		slot5 = self

		self.bind_controller_inputs_equip(slot4)
	elseif not selected_item_data.locked and not selected_item_data.gold_price then
		slot5 = self._equip_button

		self._equip_button.show(slot4)

		slot5 = self._equip_gold_button

		self._equip_gold_button.hide(slot4)

		slot5 = self._buy_button

		self._buy_button.hide(slot4)

		slot5 = self._info_label

		self._info_label.hide(slot4)

		slot5 = self._gold_currency_icon

		self._gold_currency_icon.hide(slot4)

		slot5 = self._gold_currency_label

		self._gold_currency_label.hide(slot4)

		slot5 = self._gold_item_bought_icon

		self._gold_item_bought_icon.hide(slot4)

		if selected_item_data.key_name == equipped_item_data.key_name then
			slot5 = self._equip_button

			self._equip_button.disable(slot4)

			slot5 = self._equip_button
			slot10 = true

			self._equip_button.set_text(slot4, self.translate(slot7, self, "character_customization_equipped_button"))
		else
			slot5 = self._equip_button

			self._equip_button.enable(slot4)

			slot5 = self._equip_button
			slot10 = true

			self._equip_button.set_text(slot4, self.translate(slot7, self, "character_customization_equip_button"))
		end

		slot5 = self

		self.bind_controller_inputs_equip(slot4)
	end

	return 
end
function CharacterCustomizationGui:_process_body_part_filter(data)
	slot4 = self._character_customizations_grid
	local active_item_data = self._character_customizations_grid.get_active_item(slot3).get_data(slot3)
	slot6 = {
		key = "key_name",
		value = active_item_data.key_name
	}

	self._character_customizations_grid.select_grid_item_by_key_value(self._character_customizations_grid.get_active_item(slot3), self._character_customizations_grid)

	slot5 = self

	self._equip_selected_customization(self._character_customizations_grid.get_active_item(slot3))

	self._selected_filter_body_part = data
	slot5 = self._character_customizations_grid

	self._character_customizations_grid.refresh_data(self._character_customizations_grid.get_active_item(slot3))

	local body_part_name = ""

	if self._selected_filter_body_part == CharacterCustomizationTweakData.PART_TYPE_UPPER then
		body_part_name = self._equipped_upper_name
	elseif self._selected_filter_body_part == CharacterCustomizationTweakData.PART_TYPE_LOWER then
		body_part_name = self._equipped_lower_name
	end

	slot6 = self._customization_grid_scrollable_area

	self._customization_grid_scrollable_area.setup_scroll_area(slot5)

	slot8 = true

	self._character_customizations_grid.set_selected(slot5, self._character_customizations_grid, true)

	slot7 = {
		key = "key_name",
		value = body_part_name
	}
	local selected_item = self._character_customizations_grid.select_grid_item_by_key_value(slot5, self._character_customizations_grid)
	slot7 = self

	self.show_character_description(self._character_customizations_grid, selected_item.get_data(slot9))

	slot8 = {
		key = "key_name",
		value = selected_item.get_data(selected_item).key_name
	}
	slot11 = selected_item

	self._character_customizations_grid.activate_item_by_value(self._character_customizations_grid, self._character_customizations_grid)

	slot7 = self

	self._process_controls_states(self._character_customizations_grid)

	return 
end
function CharacterCustomizationGui:_select_grid_item(item_data)
	if self._selected_filter_body_part == CharacterCustomizationTweakData.PART_TYPE_HEAD then
		if self._selected_head_name == item_data.key_name then
			return 
		end

		self._selected_head_name = item_data.key_name
		slot6 = item_data

		self._set_selected_piece(slot3, self, CharacterCustomizationTweakData.PART_TYPE_HEAD)
	elseif self._selected_filter_body_part == CharacterCustomizationTweakData.PART_TYPE_UPPER then
		if self._selected_upper_name == item_data.key_name then
			return 
		end

		self._selected_upper_name = item_data.key_name
		slot6 = item_data

		self._set_selected_piece(slot3, self, CharacterCustomizationTweakData.PART_TYPE_UPPER)
	elseif self._selected_filter_body_part == CharacterCustomizationTweakData.PART_TYPE_LOWER then
		if self._selected_lower_name == item_data.key_name then
			return 
		end

		self._selected_lower_name = item_data.key_name
		slot6 = item_data

		self._set_selected_piece(slot3, self, CharacterCustomizationTweakData.PART_TYPE_LOWER)
	end

	slot4 = self

	self._process_controls_states(slot3)

	slot6 = {
		skip_idle_check = true,
		instigator = managers.player.local_player(slot8)
	}
	slot9 = managers.player

	managers.dialog.queue_dialog(slot3, managers.dialog, "player_gen_custom_right_clothes")

	local random_animation_index = math.random(slot3, 1)
	local anim_state_name = tweak_data.character_customization.customization_animations[random_animation_index]
	slot9 = anim_state_name
	local state = self._spawned_character_unit.play_redirect(#tweak_data.character_customization.customization_animations, Idstring(slot8))
	slot7 = self._spawned_character_unit
	slot8 = state

	self._spawned_character_unit.anim_state_machine(self._spawned_character_unit).set_parameter(self._spawned_character_unit, self._spawned_character_unit.anim_state_machine(self._spawned_character_unit))

	slot8 = item_data

	self.show_character_description(self._spawned_character_unit, self)

	slot8 = "clothes_selection_change"

	managers.menu_component.post_event(self._spawned_character_unit, managers.menu_component)

	return 
end
function CharacterCustomizationGui:show_character_description(item_data)
	slot5 = self._selected_filter_body_part
	local icon_data = self.get_icon_data_for_body_part(slot3, self)
	slot6 = icon_data.texture

	self._body_part_icon.set_image(self, self._body_part_icon)

	slot6 = icon_data.texture_rect

	self._body_part_icon.set_texture_rect(self, self._body_part_icon)

	slot5 = self._body_part_title
	slot10 = true

	self._body_part_title.set_text(self, self.translate(slot7, self, item_data.name))

	slot5 = self._body_part_title
	local x, y, w, h = self._body_part_title.text_rect(self)
	slot10 = h

	self._body_part_title.set_h(self, self._body_part_title)

	slot12 = self._body_part_title
	slot10 = self._body_part_title.bottom(slot11) + 10

	self._body_part_description.set_top(self, self._body_part_description)

	slot9 = self._body_part_description
	slot14 = false

	self._body_part_description.set_text(self, self.translate(slot11, self, item_data.description))

	return 
end
function CharacterCustomizationGui:get_character_spawn_location()
	slot4 = "all"
	slot8 = "env_effect"
	local units = World.find_units_quick(slot2, World, managers.slot.get_mask(slot6, managers.slot))

	if units then
		slot4 = units

		for _, unit in pairs(slot3) do
			slot10 = "units/vanilla/arhitecture/ber_a/ber_a_caracter_menu/caracter_menu_floor/caracter_menu_floor"

			if unit.name(slot8) == Idstring(unit) then
				slot9 = unit
				slot12 = "rp_caracter_menu_floor"
				self._character_spawn_location = unit.get_object(slot8, Idstring(slot11))
			end
		end
	end

	return 
end
function CharacterCustomizationGui:spawn_character_unit()
	if not self._spawned_character_unit then
		self.destroy_character_unit(slot2)

		local unit_name = CharacterCustomizationTweakData.CRIMINAL_MENU_SELECT_UNIT
		slot4 = self._character_spawn_location

		if not self._character_spawn_location.position(self) then
			slot6 = 0
			local position = Vector3(slot3, 0, 0)
		end

		slot7 = 0
		local rotation = Rotation(slot4, 0, 0)
		slot9 = unit_name
		slot9 = rotation
		self._spawned_character_unit = World.spawn_unit(0, World, Idstring(slot8), position)
	end

	return 
end
function CharacterCustomizationGui:destroy_character_unit()
	if self._spawned_character_unit then
		slot3 = self._spawned_character_unit
		slot3 = self._spawned_character_unit.customization(slot2)

		self._spawned_character_unit.customization(slot2).destroy_all_parts_on_character(slot2)

		slot4 = 0

		self._spawned_character_unit.set_slot(slot2, self._spawned_character_unit)

		self._spawned_character_unit = nil
	end

	return 
end
function CharacterCustomizationGui:render_all_parts()
	local character_nationality = managers.player.get_character_profile_nation(slot2)
	slot4 = self._spawned_character_unit
	slot8 = self._selected_lower_name

	self._spawned_character_unit.customization(managers.player).attach_all_parts_to_character_by_parts(managers.player, self._spawned_character_unit.customization(managers.player), character_nationality, self._selected_head_name, self._selected_upper_name)

	local anim_state_name = tweak_data.character_customization.customization_animation_idle_loop
	slot8 = anim_state_name
	local state = self._spawned_character_unit.play_redirect(self._spawned_character_unit.customization(managers.player), Idstring(self._selected_upper_name))
	slot6 = self._spawned_character_unit
	slot7 = state

	self._spawned_character_unit.anim_state_machine(self._spawned_character_unit).set_parameter(self._spawned_character_unit, self._spawned_character_unit.anim_state_machine(self._spawned_character_unit))

	return 
end
function CharacterCustomizationGui:_set_selected_piece(part_type, part_data)
	if part_type == CharacterCustomizationTweakData.PART_TYPE_UPPER then
		slot5 = self._spawned_character_unit
		slot7 = part_data.path

		self._spawned_character_unit.customization(slot4).set_unit(slot4, self._spawned_character_unit.customization(slot4), part_type)

		local lower_data = self._all_customizations[self._selected_lower_name]
		local lower_path = (part_data.length == CharacterCustomizationTweakData.PART_LENGTH_SHORT and lower_data.path_long) or lower_data.path_short
		slot7 = self._spawned_character_unit
		slot9 = lower_path

		self._spawned_character_unit.customization(slot6).set_unit(slot6, self._spawned_character_unit.customization(slot6), CharacterCustomizationTweakData.PART_TYPE_LOWER)
	elseif part_type == CharacterCustomizationTweakData.PART_TYPE_LOWER then
		local upper_data = self._all_customizations[self._selected_upper_name]
		local lower_path = (upper_data.length == CharacterCustomizationTweakData.PART_LENGTH_SHORT and part_data.path_long) or part_data.path_short
		slot7 = self._spawned_character_unit
		slot9 = lower_path

		self._spawned_character_unit.customization(slot6).set_unit(slot6, self._spawned_character_unit.customization(slot6), part_type)
	else
		slot5 = self._spawned_character_unit
		slot7 = part_data.path

		self._spawned_character_unit.customization(slot4).set_unit(slot4, self._spawned_character_unit.customization(slot4), part_type)
	end

	return 
end
function CharacterCustomizationGui:save_equipped_customizations()
	slot4 = "self._equipped_upper_name "
	slot7 = self._equipped_upper_name

	Application.trace(slot2, Application, inspect(slot6))

	slot4 = self._equipped_head_name

	managers.player.set_customization_equiped_head_name(slot2, managers.player)

	slot4 = self._equipped_upper_name

	managers.player.set_customization_equiped_upper_name(slot2, managers.player)

	slot4 = self._equipped_lower_name

	managers.player.set_customization_equiped_lower_name(slot2, managers.player)

	slot6 = managers.savefile
	slot5 = false

	managers.savefile.save_game(slot2, managers.savefile, managers.savefile.get_save_progress_slot(inspect))

	slot3 = managers.network
	local local_peer = managers.network.session(slot2).local_peer(slot2)
	local outfit_string = managers.blackmarket.outfit_string(managers.network.session(slot2))
	slot6 = "outfit_string "
	slot9 = outfit_string

	Application.trace(managers.blackmarket, Application, inspect(slot8))

	local outfit_version = local_peer.outfit_version(managers.blackmarket)
	slot8 = outfit_version

	local_peer.set_outfit_string(local_peer, local_peer, outfit_string)

	slot7 = "player"
	local team_id = tweak_data.levels.get_default_team_ID(local_peer, tweak_data.levels)
	slot7 = managers.network
	slot12 = local_peer._id

	managers.network.session(tweak_data.levels).send_to_peers_synched(tweak_data.levels, managers.network.session(tweak_data.levels), "set_character_customization", local_peer._unit, outfit_string, outfit_version)

	slot7 = managers.player
	slot7 = managers.player.local_player(tweak_data.levels)
	slot7 = managers.player.local_player(tweak_data.levels).camera(tweak_data.levels)
	slot7 = managers.player.local_player(tweak_data.levels).camera(tweak_data.levels).camera_unit(tweak_data.levels)
	slot10 = managers.player
	slot9 = self._equipped_upper_name

	managers.player.local_player(tweak_data.levels).camera(tweak_data.levels).camera_unit(tweak_data.levels).customizationfps(tweak_data.levels).attach_fps_hands(tweak_data.levels, managers.player.local_player(tweak_data.levels).camera(tweak_data.levels).camera_unit(tweak_data.levels).customizationfps(tweak_data.levels), managers.player.get_character_profile_nation(local_peer._unit))

	return 
end
function CharacterCustomizationGui:get_icon_data_for_body_part(body_part)
	local icon_data = nil

	if body_part == CharacterCustomizationTweakData.PART_TYPE_UPPER then
		icon_data = tweak_data.gui.icons.ico_upper_body
	elseif body_part == CharacterCustomizationTweakData.PART_TYPE_LOWER then
		icon_data = tweak_data.gui.icons.ico_lower_body
	end

	return icon_data
end
function CharacterCustomizationGui:bind_controller_inputs()
	local bindings = {}
	slot5 = "menu_controller_shoulder_left"
	slot7 = "_on_filter_body_part_left"
	bindings[1] = {
		key = Idstring(slot4),
		callback = callback(slot4, self, self)
	}
	slot5 = "menu_controller_shoulder_right"
	slot7 = "_on_filter_body_part_right"
	bindings[2] = {
		key = Idstring(slot4),
		callback = callback(slot4, self, self)
	}

	self.set_controller_bindings(callback(slot4, self, self), self, bindings)

	local legend = {
		controller = {
			"menu_legend_back",
			"menu_legend_character_customization_shoulder"
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

	self._confirm_pressed_state = nil

	return 
end
function CharacterCustomizationGui:bind_controller_inputs_equip()
	local bindings = {}
	slot5 = "menu_controller_shoulder_left"
	slot7 = "_on_filter_body_part_left"
	bindings[1] = {
		key = Idstring(slot4),
		callback = callback(slot4, self, self)
	}
	slot5 = "menu_controller_shoulder_right"
	slot7 = "_on_filter_body_part_right"
	bindings[2] = {
		key = Idstring(slot4),
		callback = callback(slot4, self, self)
	}

	self.set_controller_bindings(callback(slot4, self, self), self, bindings)

	local legend = {
		controller = {
			"menu_legend_back",
			"menu_legend_character_customization_shoulder",
			"menu_legend_character_customization_equip"
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

	self._confirm_pressed_state = CharacterCustomizationGui.CONFIRM_PRESSED_STATE_EQUIP

	return 
end
function CharacterCustomizationGui:bind_controller_inputs_buy()
	local bindings = {}
	slot5 = "menu_controller_shoulder_left"
	slot7 = "_on_filter_body_part_left"
	bindings[1] = {
		key = Idstring(slot4),
		callback = callback(slot4, self, self)
	}
	slot5 = "menu_controller_shoulder_right"
	slot7 = "_on_filter_body_part_right"
	bindings[2] = {
		key = Idstring(slot4),
		callback = callback(slot4, self, self)
	}

	self.set_controller_bindings(callback(slot4, self, self), self, bindings)

	local legend = {
		controller = {
			"menu_legend_back",
			"menu_legend_character_customization_shoulder",
			"menu_legend_character_customization_buy"
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

	self._confirm_pressed_state = CharacterCustomizationGui.CONFIRM_PRESSED_STATE_BUY

	return 
end
function CharacterCustomizationGui:_on_filter_body_part_left()
	slot3 = self._filter_body_part

	self._filter_body_part._move_left(slot2)

	return true, nil
end
function CharacterCustomizationGui:_on_filter_body_part_right()
	slot3 = self._filter_body_part

	self._filter_body_part._move_right(slot2)

	return true, nil
end
function CharacterCustomizationGui:confirm_pressed()
	slot3 = self._character_customizations_grid
	local selected_item = self._character_customizations_grid.selected_grid_item(slot2)

	if selected_item then
		slot4 = selected_item
	elseif selected_item then
		slot4 = selected_item

		if selected_item.get_data(slot3) and self._confirm_pressed_state == CharacterCustomizationGui.CONFIRM_PRESSED_STATE_BUY then
			slot4 = self

			self._on_click_button_buy(slot3)
		end
	end

	return true
end

return 
