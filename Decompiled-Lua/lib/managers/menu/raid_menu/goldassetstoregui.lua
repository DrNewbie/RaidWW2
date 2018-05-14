if not GoldAssetStoreGui then
	slot2 = RaidGuiBase
	slot0 = class(slot1)
end

GoldAssetStoreGui = slot0
GoldAssetStoreGui.CONFIRM_PRESSED_STATE_BUY = "state_buy"
GoldAssetStoreGui.CONFIRM_PRESSED_STATE_APPLY = "state_apply"
function GoldAssetStoreGui:init(ws, fullscreen_ws, node, component_name)
	slot11 = component_name

	GoldAssetStoreGui.super.init(slot6, self, ws, fullscreen_ws, node)

	slot8 = "menu_gold_asset_store_title"

	self._node.components.raid_menu_header.set_screen_name(slot6, self._node.components.raid_menu_header)

	self._confirm_pressed_state = nil
	slot7 = managers.raid_menu

	managers.raid_menu.hide_background(slot6)

	return 
end
function GoldAssetStoreGui:_setup_properties()
	slot3 = self

	GoldAssetStoreGui.super._setup_properties(slot2)

	self._background = nil
	self._background_rect = nil

	return 
end
function GoldAssetStoreGui:_set_initial_data()
	self._loaded_units = {}
	self._unit_data_to_show = nil

	return 
end
function GoldAssetStoreGui:_layout()
	self._disable_dof(slot2)

	local gold_asset_store_grid_scrollable_area_params = {
		scrollbar_offset = 14,
		name = "gold_asset_store_grid_scrollable_area",
		h = 612,
		y = 120,
		w = 498,
		x = 0,
		scroll_step = 30
	}
	self._gold_asset_store_grid_scrollable_area = self._root_panel.scrollable_area(self, self._root_panel)
	local gold_asset_store_grid_params = {
		name = "gold_asset_store_grid",
		y = 0,
		w = 480,
		x = 0,
		scrollable_area_ref = self._gold_asset_store_grid_scrollable_area
	}
	slot8 = "_data_source_gold_asset_store"
	slot8 = "_on_click_gold_asset_store"
	slot8 = "_on_double_click_gold_asset_store"
	slot8 = "_on_selected_gold_asset_store"
	gold_asset_store_grid_params.grid_params = {
		scroll_marker_w = 32,
		vertical_spacing = 5,
		data_source_callback = callback(gold_asset_store_grid_scrollable_area_params, self, self),
		on_click_callback = callback(gold_asset_store_grid_scrollable_area_params, self, self),
		on_double_click_callback = callback(gold_asset_store_grid_scrollable_area_params, self, self),
		on_select_callback = callback(gold_asset_store_grid_scrollable_area_params, self, self)
	}
	gold_asset_store_grid_params.item_params = {
		item_w = 134,
		grid_item_icon = "grid_icon",
		key_value_field = "key_name",
		item_h = 134,
		selected_marker_h = 148,
		selected_marker_w = 148,
		row_class = RaidGUIControlGridItem
	}
	slot5 = self._gold_asset_store_grid_scrollable_area
	slot6 = gold_asset_store_grid_params
	self._gold_asset_store_grid = self._gold_asset_store_grid_scrollable_area.get_panel(RaidGUIControlGridItem).grid(RaidGUIControlGridItem, self._gold_asset_store_grid_scrollable_area.get_panel(RaidGUIControlGridItem))
	local params_rotate_gold_item = {
		name = "rotate_gold_item",
		h = 750,
		y = 90,
		w = 800,
		x = 500
	}
	slot7 = params_rotate_gold_item
	self._rotate_gold_item = self._root_panel.rotate_unit(self._gold_asset_store_grid_scrollable_area.get_panel(RaidGUIControlGridItem), self._root_panel)
	slot7 = {
		w = 352,
		h = 64,
		align = "left",
		text = "",
		y = 0,
		x = 0,
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.size_38,
		color = tweak_data.gui.colors.raid_dirty_white
	}
	self._item_title = self._root_panel.label(self._gold_asset_store_grid_scrollable_area.get_panel(RaidGUIControlGridItem), self._root_panel)
	slot7 = {
		w = 352,
		h = 352,
		wrap = true,
		text = "",
		y = 176,
		x = 0,
		font = tweak_data.gui.fonts.lato,
		font_size = tweak_data.gui.font_sizes.size_20,
		color = tweak_data.gui.colors.raid_grey
	}
	self._item_description = self._root_panel.label(self._gold_asset_store_grid_scrollable_area.get_panel(RaidGUIControlGridItem), self._root_panel)
	slot6 = self._item_description
	slot9 = self._root_panel

	self._item_description.set_right(self._gold_asset_store_grid_scrollable_area.get_panel(RaidGUIControlGridItem), self._root_panel.w(tweak_data.gui.colors.raid_grey))

	slot6 = self._item_title

	self._item_title.set_x(self._gold_asset_store_grid_scrollable_area.get_panel(RaidGUIControlGridItem), self._item_description.x(tweak_data.gui.colors.raid_grey))

	slot7 = 140

	self._item_title.set_center_y(self._gold_asset_store_grid_scrollable_area.get_panel(RaidGUIControlGridItem), self._item_title)

	self._coord_center_y = 864
	slot7 = {
		name = "buy_button",
		visible = false,
		x = 0,
		text = self.translate(self._item_description, self, "gold_asset_store_buy_button"),
		layer = RaidGuiBase.FOREGROUND_LAYER,
		on_click_callback = callback(self._item_description, self, self)
	}
	slot12 = true
	slot12 = "_on_click_button_buy"
	self._buy_button = self._root_panel.short_primary_gold_button(self._gold_asset_store_grid_scrollable_area.get_panel(RaidGUIControlGridItem), self._root_panel)
	slot7 = self._coord_center_y

	self._buy_button.set_center_y(self._gold_asset_store_grid_scrollable_area.get_panel(RaidGUIControlGridItem), self._buy_button)

	slot7 = {
		name = "buy_button",
		visible = false,
		x = 0,
		text = self.translate(self._item_description, self, "gold_asset_store_apply_button"),
		layer = RaidGuiBase.FOREGROUND_LAYER,
		on_click_callback = callback(self._item_description, self, self)
	}
	slot12 = true
	slot12 = "_on_click_button_apply"
	self._apply_button = self._root_panel.short_primary_gold_button(self._gold_asset_store_grid_scrollable_area.get_panel(RaidGUIControlGridItem), self._root_panel)
	slot7 = self._coord_center_y

	self._apply_button.set_center_y(self._gold_asset_store_grid_scrollable_area.get_panel(RaidGUIControlGridItem), self._apply_button)

	slot7 = {
		name = "info_label",
		visible = false,
		x = 0,
		text = self.translate(self._item_description, self, "grid_item_insuficient_gold_label"),
		layer = RaidGuiBase.FOREGROUND_LAYER,
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.small
	}
	slot12 = true
	self._info_label = self._root_panel.label(self._gold_asset_store_grid_scrollable_area.get_panel(RaidGUIControlGridItem), self._root_panel)
	slot6 = self._info_label
	local x1, y1, w1, h1 = self._info_label.text_rect(self._gold_asset_store_grid_scrollable_area.get_panel(RaidGUIControlGridItem))
	slot11 = h1

	self._info_label.set_h(self._item_description, self._info_label)

	slot11 = self._coord_center_y

	self._info_label.set_center_y(self._item_description, self._info_label)

	slot11 = {
		text = "",
		name = "gold_currency_label",
		visible = false,
		x = 250,
		layer = RaidGuiBase.FOREGROUND_LAYER,
		color = tweak_data.gui.colors.gold_orange,
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.size_38
	}
	self._gold_currency_label = self._root_panel.label(self._item_description, self._root_panel)
	slot10 = self._gold_currency_label
	local x2, y2, w2, h2 = self._gold_currency_label.text_rect(self._item_description)
	slot15 = h2

	self._gold_currency_label.set_h(slot13, self._gold_currency_label)

	slot15 = w2

	self._gold_currency_label.set_w(slot13, self._gold_currency_label)

	slot15 = self._coord_center_y

	self._gold_currency_label.set_center_y(slot13, self._gold_currency_label)

	slot18 = self._gold_asset_store_grid
	slot18 = self._gold_asset_store_grid
	slot15 = self._gold_asset_store_grid_scrollable_area.x(slot16) + self._gold_asset_store_grid.x(self._gold_asset_store_grid_scrollable_area) + self._gold_asset_store_grid.w(self._gold_asset_store_grid_scrollable_area)

	self._gold_currency_label.set_right(slot13, self._gold_currency_label)

	slot15 = {
		name = "gold_currency_icon",
		visible = false,
		x = 200,
		layer = RaidGuiBase.FOREGROUND_LAYER,
		color = tweak_data.gui.colors.gold_orange,
		texture = tweak_data.gui.icons.gold_amount_purchase.texture,
		texture_rect = tweak_data.gui.icons.gold_amount_purchase.texture_rect
	}
	self._gold_currency_icon = self._root_panel.bitmap(slot13, self._root_panel)
	slot15 = self._coord_center_y

	self._gold_currency_icon.set_center_y(slot13, self._gold_currency_icon)

	slot17 = self._gold_currency_label
	slot15 = self._gold_currency_label.x(tweak_data.gui.icons.gold_amount_purchase.texture_rect) - 14

	self._gold_currency_icon.set_right(slot13, self._gold_currency_icon)

	slot15 = {
		name = "gold_item_bought_icon",
		visible = false,
		x = 200,
		layer = RaidGuiBase.FOREGROUND_LAYER,
		texture = tweak_data.gui.icons.consumable_purchased_confirmed.texture,
		texture_rect = tweak_data.gui.icons.consumable_purchased_confirmed.texture_rect
	}
	self._gold_item_bought_icon = self._root_panel.bitmap(slot13, self._root_panel)
	slot15 = self._coord_center_y

	self._gold_item_bought_icon.set_center_y(slot13, self._gold_item_bought_icon)

	slot17 = self._gold_currency_label
	slot15 = self._gold_currency_label.x(tweak_data.gui.icons.consumable_purchased_confirmed.texture_rect) - 14

	self._gold_item_bought_icon.set_right(slot13, self._gold_item_bought_icon)

	slot14 = self

	self._layout_greed_info(slot13)

	slot14 = self

	self.bind_controller_inputs(slot13)

	slot14 = self._gold_asset_store_grid_scrollable_area

	self._gold_asset_store_grid_scrollable_area.setup_scroll_area(slot13)

	slot15 = true

	self._gold_asset_store_grid.set_selected(slot13, self._gold_asset_store_grid)

	slot14 = self._gold_asset_store_grid
	local selected_item = self._gold_asset_store_grid.selected_grid_item(slot13)

	if selected_item then
		local selected_item_data = selected_item.get_data(slot14)
		slot17 = selected_item_data

		self._populate_selected_item_data_and_load(selected_item, self)
	end

	return 
end
function GoldAssetStoreGui:_layout_greed_info()
	local greed_panel_default_h = 288
	local greed_panel_bottom = 896
	local greed_info_panel_params = {
		w = 352,
		name = "greed_info_panel",
		h = greed_panel_default_h
	}
	slot7 = greed_info_panel_params
	self._greed_info_panel = self._root_panel.panel(slot5, self._root_panel)
	slot6 = self._greed_info_panel
	slot9 = self._root_panel

	self._greed_info_panel.set_right(slot5, self._root_panel.w(slot8))

	slot8 = {}
	local greed_bar = self._greed_info_panel.create_custom_control(slot5, self._greed_info_panel, RaidGUIControlGreedBarSmall)

	greed_bar.set_data_from_manager(self._greed_info_panel)

	local greed_description_params = {
		name = "greed_description",
		wrap = true,
		halign = "left",
		valign = "top"
	}
	slot8 = greed_bar
	greed_description_params.y = greed_bar.h(greed_bar)
	slot9 = greed_bar
	slot7 = greed_bar.h(self._greed_info_panel)
	greed_description_params.h = self._greed_info_panel.h(greed_bar) - slot7
	greed_description_params.font = tweak_data.gui.fonts.lato
	greed_description_params.font_size = tweak_data.gui.font_sizes.size_20
	greed_description_params.color = tweak_data.gui.colors.raid_grey
	slot10 = false
	greed_description_params.text = self.translate(slot7, self, "menu_greed_description")
	slot9 = greed_description_params
	local greed_description = self._greed_info_panel.text(slot7, self._greed_info_panel)
	slot9 = greed_description
	local _, _, _, h = greed_description.text_rect(self._greed_info_panel)

	greed_description.set_h(slot12, greed_description)

	slot16 = greed_description
	slot14 = greed_panel_default_h
	local greed_panel_h = math.max(slot12, greed_description.y(h) + greed_description.h(greed_description))
	slot15 = greed_panel_h

	self._greed_info_panel.set_h(greed_description.y(h) + greed_description.h(greed_description), self._greed_info_panel)

	slot15 = greed_panel_bottom

	self._greed_info_panel.set_bottom(greed_description.y(h) + greed_description.h(greed_description), self._greed_info_panel)

	return 
end
function GoldAssetStoreGui:_data_source_gold_asset_store()
	local gold_items_data_source = managers.gold_economy.get_store_items_data(slot2)
	slot4 = gold_items_data_source

	for _, gold_item in pairs(managers.gold_economy) do
		gold_item.key_name = gold_item.upgrade_name .. "_level_" .. gold_item.level
	end

	return gold_items_data_source
end
function GoldAssetStoreGui:_on_click_gold_asset_store(item_data)
	slot5 = item_data

	self._grid_item_clicked_selected(slot3, self)

	return 
end
function GoldAssetStoreGui:_on_double_click_gold_asset_store(item_data)
	slot5 = item_data

	self._grid_item_clicked_selected(slot3, self)

	return 
end
function GoldAssetStoreGui:_on_selected_gold_asset_store(item_idx, item_data)
	slot6 = item_data

	self._grid_item_clicked_selected(slot4, self)

	return 
end
function GoldAssetStoreGui:_on_click_button_buy()
	local selected_item = self._gold_asset_store_grid.selected_grid_item(slot2)
	slot4 = selected_item
	local selected_item_data = selected_item.get_data(self._gold_asset_store_grid)
	local dialog_params = {
		amount = selected_item_data.gold_price
	}
	slot8 = true
	dialog_params.item_name = self.translate(slot5, self, selected_item_data.name_id)
	slot9 = selected_item_data
	dialog_params.callback_yes = callback(slot5, self, self, "_buy_gold_item_yes_callback")
	slot7 = dialog_params

	managers.menu.show_gold_asset_store_purchase_dialog(slot5, managers.menu)

	return 
end
function GoldAssetStoreGui:_on_click_button_apply()
	local selected_item = self._gold_asset_store_grid.selected_grid_item(slot2)
	local selected_item_data = selected_item.get_data(self._gold_asset_store_grid)
	slot7 = selected_item_data.level

	self._apply_upgrade_to_camp(selected_item, self, selected_item_data.upgrade_name)

	return 
end
function GoldAssetStoreGui:update(t, dt)
	if self._unit_data_to_show and self._loaded_units[self._unit_data_to_show.scene_unit] and self._unit_data_to_show_changed then
		slot6 = self._unit_data_to_show

		self._spawn_scene_camp_unit(slot4, self)

		self._unit_data_to_show_changed = false
	end

	return 
end
function GoldAssetStoreGui:_grid_item_clicked_selected(item_data)
	if self._unit_data_to_show == item_data then
		return 
	end

	slot4 = self

	self._despawn_scene_camp_unit(slot3)

	self._unit_data_to_show = item_data
	self._unit_data_to_show_changed = true
	slot5 = item_data

	self._populate_selected_item_data_and_load(slot3, self)

	return 
end
function GoldAssetStoreGui:_populate_selected_item_data_and_load(item_data)
	slot5 = item_data

	self._load_scene_camp_unit(slot3, self)

	slot4 = self._item_description
	slot9 = false

	self._item_description.set_text(slot3, self.translate(slot6, self, item_data.description_id))

	slot4 = self._item_title
	slot9 = true

	self._item_title.set_text(slot3, self.translate(slot6, self, item_data.name_id))

	slot4 = self._item_title
	local _, _, w, _ = self._item_title.text_rect(slot3)

	self._item_title.set_w(self, self._item_title)

	slot8 = self._item_description.x(w)
	slot11 = self._root_panel
	slot9 = self._root_panel.w(self._item_description) - w
	local title_x = math.min(self, slot8)
	slot10 = title_x

	self._item_title.set_x(slot8, self._item_title)

	slot9 = self

	self._process_controls_states(slot8)

	return 
end
function GoldAssetStoreGui:_load_scene_camp_unit(item_data)
	if not item_data.scene_unit or item_data.scene_unit == "" then
		return 
	end

	self._loaded_units[item_data.scene_unit] = false
	slot8 = item_data.scene_unit
	slot7 = DynamicResourceManager.DYN_RESOURCES_PACKAGE
	slot13 = item_data

	managers.dyn_resource.load(item_data.scene_unit, managers.dyn_resource, Idstring(slot6), Idstring("unit"), callback(slot9, self, self, "_camp_scene_unit_loaded_callback"))

	return 
end
function GoldAssetStoreGui:_spawn_scene_camp_unit(unit_data_to_show)
	slot4 = self
	self._spawned_unit_position = self.get_character_spawn_location(slot3)
	slot7 = unit_data_to_show.scene_unit
	slot6 = self._spawned_unit_position
	slot11 = 0
	self._spawned_unit = World.spawn_unit(slot3, World, Idstring(slot6), Rotation(slot8, 0, 0))

	if unit_data_to_show and unit_data_to_show.scene_unit_rotation then
		slot5 = unit_data_to_show.scene_unit_rotation

		self._spawned_unit.set_rotation(slot3, self._spawned_unit)
	end

	slot8 = self._spawned_unit_offset
	slot13 = 0

	self._rotate_gold_item.set_unit(slot3, self._rotate_gold_item, self._spawned_unit, self._spawned_unit_position, 90, Vector3(slot10, 0, 0))

	return 
end
function GoldAssetStoreGui:get_character_spawn_location()
	slot4 = "all"
	slot8 = "env_effect"
	local units = World.find_units_quick(slot2, World, managers.slot.get_mask(slot6, managers.slot))
	local result = nil

	if units then
		slot5 = units

		for _, unit in pairs(slot4) do
			slot11 = "units/vanilla/props/props_camp_upgrades/golden_store_floor/golden_store_floor"

			if unit.name(slot9) == Idstring(unit) then
				slot10 = unit
				slot13 = "rp_golden_store_floor"
				slot10 = unit.get_object(slot9, Idstring(slot12))
				result = unit.get_object(slot9, Idstring(slot12)).position(slot9)
				slot10 = result
				slot15 = 10

				mvector3.add(slot9, Vector3(slot12, 0, 0))
			end
		end
	end

	return result
end
function GoldAssetStoreGui:pix_to_screen(px_x, px_y)
	local sx = (2 * px_x) / self._root_panel.w(slot5) - 1
	slot7 = self._root_panel
	local sy = (2 * px_y) / self._root_panel.h(self._root_panel) - 1

	return sx, sy
end
function GoldAssetStoreGui:_despawn_scene_camp_unit()
	if self._spawned_unit then
		slot4 = 0

		self._spawned_unit.set_slot(slot2, self._spawned_unit)

		self._spawned_unit = nil
	end

	return 
end
function GoldAssetStoreGui:_camp_scene_unit_loaded_callback(item_data)
	self._loaded_units[item_data.scene_unit] = true

	return 
end
function GoldAssetStoreGui:_process_controls_states()
	slot3 = self._gold_asset_store_grid
	slot3 = self._gold_asset_store_grid.selected_grid_item(slot2)
	local selected_item_data = self._gold_asset_store_grid.selected_grid_item(slot2).get_data(slot2)

	if selected_item_data.gold_price then
		slot5 = selected_item_data.gold_price

		self._gold_currency_label.set_text(slot3, self._gold_currency_label)

		slot4 = self._gold_currency_label
		local x2, y2, w2, h2 = self._gold_currency_label.text_rect(slot3)
		slot9 = h2

		self._gold_currency_label.set_h(slot7, self._gold_currency_label)

		slot9 = w2

		self._gold_currency_label.set_w(slot7, self._gold_currency_label)

		slot9 = self._coord_center_y

		self._gold_currency_label.set_center_y(slot7, self._gold_currency_label)

		slot12 = self._gold_asset_store_grid
		slot12 = self._gold_asset_store_grid
		slot10 = self._gold_asset_store_grid.w(self._gold_asset_store_grid_scrollable_area)
		slot9 = self._gold_asset_store_grid_scrollable_area.x(slot10) + self._gold_asset_store_grid.x(self._gold_asset_store_grid_scrollable_area) + slot10

		self._gold_currency_label.set_right(slot7, self._gold_currency_label)

		slot9 = self._coord_center_y

		self._gold_currency_icon.set_center_y(slot7, self._gold_currency_icon)

		slot11 = self._gold_currency_label
		slot9 = self._gold_currency_label.x(slot10) - 14

		self._gold_currency_icon.set_right(slot7, self._gold_currency_icon)

		slot9 = self._coord_center_y

		self._gold_item_bought_icon.set_center_y(slot7, self._gold_item_bought_icon)

		slot11 = self._gold_currency_label
		slot9 = self._gold_currency_label.x(slot10) - 14

		self._gold_item_bought_icon.set_right(slot7, self._gold_item_bought_icon)
	end

	slot4 = Network

	if not Network.is_server(slot3) then
		slot4 = self._info_label

		self._info_label.show(slot3)

		slot4 = self._info_label
		slot9 = true

		self._info_label.set_text(slot3, self.translate(slot6, self, "gold_asset_store_only_host"))

		slot5 = tweak_data.gui.colors.raid_red

		self._info_label.set_color(slot3, self._info_label)

		slot4 = self._gold_currency_icon

		self._gold_currency_icon.hide(slot3)

		slot4 = self._gold_currency_label

		self._gold_currency_label.hide(slot3)

		slot4 = self._gold_item_bought_icon

		self._gold_item_bought_icon.hide(slot3)

		slot4 = self

		self.bind_controller_inputs(slot3)

		return 
	end

	if selected_item_data.status == RaidGUIControlGridItem.STATUS_OWNED_OR_PURCHASED then
		slot4 = self._buy_button

		self._buy_button.hide(slot3)

		slot4 = self._gold_currency_icon

		self._gold_currency_icon.hide(slot3)

		slot4 = self._gold_currency_label

		self._gold_currency_label.hide(slot3)

		slot4 = self._gold_item_bought_icon

		self._gold_item_bought_icon.hide(slot3)

		slot6 = selected_item_data.level

		if managers.gold_economy.is_upgrade_applied(slot3, managers.gold_economy, selected_item_data.upgrade_name) then
			slot4 = self._apply_button

			self._apply_button.hide(slot3)

			slot4 = self._info_label

			self._info_label.show(slot3)

			slot4 = self._info_label
			slot9 = true

			self._info_label.set_text(slot3, self.translate(slot6, self, "gold_asset_store_upgrade_is_applied"))

			slot5 = tweak_data.gui.colors.raid_white

			self._info_label.set_color(slot3, self._info_label)

			slot4 = self

			self.bind_controller_inputs(slot3)
		else
			slot4 = self._apply_button

			self._apply_button.show(slot3)

			slot4 = self._info_label

			self._info_label.hide(slot3)

			slot4 = self

			self.bind_controller_inputs_apply(slot3)
		end
	elseif selected_item_data.status == RaidGUIControlGridItem.STATUS_PURCHASABLE then
		slot4 = self._apply_button

		self._apply_button.hide(slot3)

		slot4 = self._buy_button

		self._buy_button.show(slot3)

		slot4 = self._buy_button

		self._buy_button.enable(slot3)

		slot4 = self._buy_button
		slot9 = true

		self._buy_button.set_text(slot3, self.translate(slot6, self, "gold_asset_store_buy_button"))

		slot4 = self._info_label

		self._info_label.hide(slot3)

		slot4 = self._gold_currency_icon

		self._gold_currency_icon.show(slot3)

		slot4 = self._gold_currency_label

		self._gold_currency_label.show(slot3)

		slot4 = self._gold_item_bought_icon

		self._gold_item_bought_icon.hide(slot3)

		slot4 = self

		self.bind_controller_inputs_buy(slot3)
	elseif selected_item_data.status == RaidGUIControlGridItem.STATUS_NOT_ENOUGHT_RESOURCES then
		slot4 = self._apply_button

		self._apply_button.hide(slot3)

		slot4 = self._buy_button

		self._buy_button.hide(slot3)

		slot4 = self._info_label

		self._info_label.show(slot3)

		slot4 = self._info_label
		slot9 = true

		self._info_label.set_text(slot3, self.translate(slot6, self, "gold_asset_store_insuficient_gold_label"))

		slot5 = tweak_data.gui.colors.raid_red

		self._info_label.set_color(slot3, self._info_label)

		slot4 = self._gold_currency_icon

		self._gold_currency_icon.show(slot3)

		slot4 = self._gold_currency_label

		self._gold_currency_label.show(slot3)

		slot4 = self._gold_item_bought_icon

		self._gold_item_bought_icon.hide(slot3)

		slot4 = self

		self.bind_controller_inputs(slot3)
	end

	return 
end
function GoldAssetStoreGui:_buy_gold_item_yes_callback(item_data)
	slot5 = "[GoldAssetStoreGui:_buy_gold_item_yes_callback] item_data "
	slot8 = item_data

	Application.trace(slot3, Application, inspect(slot7))

	slot5 = item_data.gold_price

	managers.gold_economy.spend_gold(slot3, managers.gold_economy)

	slot6 = item_data.level

	self._apply_upgrade_to_camp(slot3, self, item_data.upgrade_name)

	return 
end
function GoldAssetStoreGui:_apply_upgrade_to_camp(upgrade_name, level)
	slot7 = level

	managers.gold_economy.update_camp_upgrade(slot4, managers.gold_economy, upgrade_name)

	slot5 = self._gold_asset_store_grid

	self._gold_asset_store_grid.refresh_data(slot4)

	slot6 = {
		key = "key_name",
		value = upgrade_name .. "_level_" .. level
	}

	self._gold_asset_store_grid.select_grid_item_by_key_value(slot4, self._gold_asset_store_grid)

	slot5 = self

	self._process_controls_states(slot4)

	slot5 = managers.savefile

	managers.savefile.setting_changed(slot4)

	slot6 = true

	managers.savefile.save_setting(slot4, managers.savefile)

	slot5 = managers.gold_economy

	managers.gold_economy.layout_camp(slot4)

	slot6 = "gold_spending_apply"

	managers.menu_component.post_event(slot4, managers.menu_component)

	return 
end
function GoldAssetStoreGui:close()
	slot3 = self._loaded_units

	for scene_unit, loaded in pairs(slot2) do
		if not loaded then
			Application.trace(slot7, Application, "[GoldAssetStoreGui][close] Unloading unit ")

			slot12 = scene_unit
			slot12 = false

			managers.dyn_resource.unload(slot7, managers.dyn_resource, Idstring(scene_unit), Idstring("unit"), managers.dyn_resource.DYN_RESOURCES_PACKAGE)
		end
	end

	slot3 = self

	self._despawn_scene_camp_unit(slot2)

	slot3 = self

	self._enable_dof(slot2)

	slot3 = self

	GoldAssetStoreGui.super.close(slot2)

	return 
end
function GoldAssetStoreGui:bind_controller_inputs()
	local legend = {
		controller = {
			"menu_legend_back"
		}
	}
	slot9 = nil
	legend.keyboard = {
		{
			key = "footer_back",
			callback = callback(slot5, self, self, "_on_legend_pc_back")
		}
	}
	slot5 = legend

	self.set_legend(, self)

	self._confirm_pressed_state = nil

	return 
end
function GoldAssetStoreGui:bind_controller_inputs_buy()
	local legend = {
		controller = {
			"menu_legend_back",
			"menu_legend_gold_asset_store_buy"
		}
	}
	slot9 = nil
	legend.keyboard = {
		{
			key = "footer_back",
			callback = callback(slot5, self, self, "_on_legend_pc_back")
		}
	}
	slot5 = legend

	self.set_legend(, self)

	self._confirm_pressed_state = GoldAssetStoreGui.CONFIRM_PRESSED_STATE_BUY

	return 
end
function GoldAssetStoreGui:bind_controller_inputs_apply()
	local legend = {
		controller = {
			"menu_legend_back",
			"menu_legend_gold_asset_store_apply"
		}
	}
	slot9 = nil
	legend.keyboard = {
		{
			key = "footer_back",
			callback = callback(slot5, self, self, "_on_legend_pc_back")
		}
	}
	slot5 = legend

	self.set_legend(, self)

	self._confirm_pressed_state = GoldAssetStoreGui.CONFIRM_PRESSED_STATE_APPLY

	return 
end
function GoldAssetStoreGui:confirm_pressed()
	slot3 = self._gold_asset_store_grid
	local selected_item = self._gold_asset_store_grid.selected_grid_item(slot2)

	if selected_item then
		slot4 = selected_item

		if selected_item.get_data(slot3) then
			if self._confirm_pressed_state == GoldAssetStoreGui.CONFIRM_PRESSED_STATE_BUY then
				slot4 = self

				self._on_click_button_buy(slot3)
			elseif self._confirm_pressed_state == GoldAssetStoreGui.CONFIRM_PRESSED_STATE_APPLY then
				slot4 = self

				self._on_click_button_apply(slot3)
			end
		end
	end

	return true
end

return 
