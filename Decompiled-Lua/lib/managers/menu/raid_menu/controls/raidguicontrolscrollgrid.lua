if not RaidGUIControlScrollGrid then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlScrollGrid = slot0
RaidGUIControlScrollGrid.DEFAULT_BORDER_PADDING = 10
RaidGUIControlScrollGrid.DEFAULT_ITEM_PADDING = 16
RaidGUIControlScrollGrid.PAGING_PANEL_HEIGHT = 25
RaidGUIControlScrollGrid.PAGING_STEPPER_WIDTH = 100
RaidGUIControlScrollGrid.SCROLL_STEP = 30
function RaidGUIControlScrollGrid:init(parent, params)
	slot7 = params

	RaidGUIControlScrollGrid.super.init(slot4, self, parent)

	RaidGUIControlScrollGrid.control = self

	if not params.grid_params then
		slot7 = params.name

		Application.error(slot4, Application, "[RaidGUIControlScrollGrid:init] grid specific parameters not specified for grid: ")

		return 
	end

	if not params.grid_params.data_source_callback then
		slot7 = params.name

		Application.error(slot4, Application, "[RaidGUIControlScrollGrid:init] Data source callback not specified for grid: ")

		return 
	end

	slot6 = self._params
	self._wrapper_panel = self._panel.panel(slot4, self._panel)
	self._object = self._wrapper_panel
	self._grid_control_width = self._params.w

	if self._params and self._params.grid_params and self._params.grid_params.scroll_marker_w and 0 < self._params.grid_params.scroll_marker_w then
		self._grid_control_width = self._grid_control_width - self._params.grid_params.scroll_marker_w
		slot5 = self

		self._create_scroll_marker(self._params.grid_params.scroll_marker_w)
	end

	slot6 = {
		x = 0,
		y = 0,
		w = self._grid_control_width
	}
	self._grid_panel = self._wrapper_panel.panel(slot4, self._wrapper_panel)
	slot8 = self._grid_panel

	self._wrapper_panel.layer(slot4, self._wrapper_panel)

	self._pointer_type = "arrow"
	self._data_source_callback = self._params.grid_params.data_source_callback
	self._on_click_callback = self._params.grid_params.on_click_callback
	self._grid_params = self._params.grid_params or {}
	self._vertical_spacing = self._params.grid_params.vertical_spacing or 5
	self._item_params = self._params.item_params or {}
	self._item_width = self._item_params.item_w or 1
	self._item_height = self._item_params.item_h or 1
	self._selected_marker_w = self._item_params.selected_marker_w
	self._selected_marker_h = self._item_params.selected_marker_h
	slot7 = self._grid_panel
	slot5 = self._grid_panel.w(self._grid_panel.layer(self._grid_control_width) + 1) / self._selected_marker_w
	self._num_horizontal_items = math.floor(slot4)
	slot5 = self

	self._get_data(slot4)

	slot5 = self

	self._create_items(slot4)

	return 
end
function RaidGUIControlScrollGrid:_create_scroll_marker()
	slot4 = {
		w = 8,
		y = 0,
		x = self._grid_control_width + 24,
		h = self._wrapper_panel.h(slot6)
	}
	slot7 = self._wrapper_panel
	self._panel_scroll_marker = self._object.panel(slot2, self._object)
	slot4 = {
		h = 128,
		y = 0,
		x = 0,
		w = self._panel_scroll_marker.w(slot6),
		color = tweak_data.gui.colors.raid_grey.with_alpha(slot6, tweak_data.gui.colors.raid_grey)
	}
	slot7 = self._panel_scroll_marker
	slot8 = 0.2
	self._scroll_marker = self._panel_scroll_marker.rect(slot2, self._panel_scroll_marker)

	return 
end
function RaidGUIControlScrollGrid:_check_visibility_scroll_marker()
	slot4 = self._grid_panel

	if self._wrapper_panel.h(slot2) < self._grid_panel.h(self._wrapper_panel) then
		slot3 = self._panel_scroll_marker

		self._panel_scroll_marker.show(slot2)
	else
		slot3 = self._panel_scroll_marker

		self._panel_scroll_marker.hide(slot2)
	end

	return 
end
function RaidGUIControlScrollGrid:_move_scroll_marker_location()
	slot4 = self._wrapper_panel
	local height_difference = self._grid_panel.h(slot2) - self._wrapper_panel.h(self._grid_panel)

	if height_difference == 0 then
		return 
	end

	local grid_panel_bottom_y = self._grid_panel.world_bottom(slot3)
	slot5 = self._wrapper_panel
	local wrapper_bottom_y = self._wrapper_panel.world_bottom(self._grid_panel)
	local path_percentage = 1 - (grid_panel_bottom_y - wrapper_bottom_y) / height_difference

	if path_percentage < 0 then
		path_percentage = 0
	elseif 1 < path_percentage then
		path_percentage = 1
	end

	local marker_bottom_start = self._scroll_marker.h(slot6)
	local marker_bottom_end = self._panel_scroll_marker.h(self._scroll_marker)
	slot10 = (marker_bottom_end - marker_bottom_start) * path_percentage + marker_bottom_start

	self._scroll_marker.set_bottom(self._panel_scroll_marker, self._scroll_marker)

	return 
end
function RaidGUIControlScrollGrid:close()
	return 
end
function RaidGUIControlScrollGrid:_get_data()
	slot4 = 0

	self._grid_panel.set_y(slot2, self._grid_panel)

	slot4 = 0

	self._scroll_marker.set_y(slot2, self._scroll_marker)

	local grid_data = self._data_source_callback()

	if not grid_data or #grid_data == 0 then
		self._total_items = 0
		slot6 = self._params.name

		Application.error(slot3, Application, "[RaidGUIControlScrollGrid:_create_items] No items for grid: ")

		return 
	end

	self._grid_data = grid_data
	self._total_items = #grid_data
	local row_count = math.ceil(slot3)
	slot6 = row_count * (self._selected_marker_h + self._vertical_spacing)

	self._grid_panel.set_h(self._total_items / self._num_horizontal_items, self._grid_panel)

	return 
end
function RaidGUIControlScrollGrid:_create_items()
	slot3 = self

	self._check_visibility_scroll_marker(slot2)

	if self._total_items == 0 then
		return 
	end

	local item_count = 0
	local i_vertical = 1
	local i_horizontal = 1
	self._grid_items = {}
	local item_params = clone(slot5)
	slot9 = self._grid_panel
	slot7 = (self._grid_panel.w(slot8) - self._num_horizontal_items * self._selected_marker_w) / (self._num_horizontal_items - 1)
	local horizontal_spacing = math.floor(self._item_params)

	for i_item_data = 1, #self._grid_data, 1 do
		local item_data = self._grid_data[i_item_data]
		item_params.name = self._params.name .. "_grid_item_" .. i_horizontal .. "_" .. i_vertical
		item_params.x = (self._selected_marker_w + horizontal_spacing) * (i_horizontal - 1)
		item_params.y = (self._selected_marker_h + self._vertical_spacing) * (i_vertical - 1)
		item_params.item_w = self._item_width
		item_params.item_h = self._item_height
		item_params.selected_marker_w = self._selected_marker_w
		item_params.selected_marker_h = self._selected_marker_h
		item_params.show_amount = true
		slot15 = "_item_selected_callback"
		item_params.item_selected_callback = callback(i_vertical - 1, self, self)
		item_params.item_idx = i_item_data
		slot16 = self._grid_params
		local item = self._create_item(i_vertical - 1, self, item_params, item_data)
		slot15 = item

		table.insert(self, self._grid_items)

		i_horizontal = i_horizontal + 1

		if self._num_horizontal_items < i_horizontal then
			i_horizontal = 1
			i_vertical = i_vertical + 1
		end
	end

	return 
end
function RaidGUIControlScrollGrid:_create_item(item_params, item_data, grid_params)
	slot10 = grid_params
	local item = self._grid_panel.create_custom_control(slot5, self._grid_panel, item_params.row_class or RaidGUIControlCardBase, item_params, item_data)

	if item.set_card then
		slot8 = item_data

		item.set_card(slot6, item)
	end

	return item
end
function RaidGUIControlScrollGrid:_delete_items()
	self._grid_items = {}
	self._selected_item = nil
	slot3 = self._grid_panel

	self._grid_panel.clear(slot2)

	return 
end
function RaidGUIControlScrollGrid:_item_selected_callback(item_idx)
	for i_item_data = 1, #self._grid_items, 1 do
		if i_item_data == item_idx then
			slot8 = self._grid_items[i_item_data]

			self._grid_items[i_item_data].select(slot7)
		else
			slot8 = self._grid_items[i_item_data]

			self._grid_items[i_item_data].unselect(slot7)
		end
	end

	return 
end
function RaidGUIControlScrollGrid:mouse_moved(o, x, y)
	slot9 = y

	return self._grid_panel.mouse_moved(slot5, self._grid_panel, o, x)
end
function RaidGUIControlScrollGrid:mouse_released(o, button, x, y)
	return false
end
function RaidGUIControlScrollGrid:on_mouse_scroll_up()
	slot3 = self._grid_panel

	if self._grid_panel.top(slot2) < 0 then
		slot3 = self._grid_panel
		local coord_y = self._grid_panel.y(slot2) + RaidGUIControlScrollGrid.SCROLL_STEP

		if 1 < coord_y then
			coord_y = 0
		end

		slot5 = coord_y

		self._grid_panel.set_y(slot3, self._grid_panel)
	end

	slot3 = self

	self._move_scroll_marker_location(slot2)

	return 
end
function RaidGUIControlScrollGrid:on_mouse_scroll_down()
	slot4 = self._wrapper_panel

	if self._grid_panel.h(slot2) < self._wrapper_panel.h(self._grid_panel) then
		return 
	end

	slot6 = self._grid_panel
	slot4 = self._grid_panel.y(slot5) - RaidGUIControlScrollGrid.SCROLL_STEP

	self._grid_panel.set_y(slot2, self._grid_panel)

	slot4 = self._wrapper_panel

	if self._grid_panel.bottom(slot2) < self._wrapper_panel.h(self._grid_panel) then
		slot3 = self._grid_panel
		slot6 = self._wrapper_panel

		self._grid_panel.set_bottom(slot2, self._wrapper_panel.h(slot5))
	end

	slot3 = self

	self._move_scroll_marker_location(slot2)

	return 
end
function RaidGUIControlScrollGrid:highlight_on()
	return 
end
function RaidGUIControlScrollGrid:highlight_off()
	return 
end
function RaidGUIControlScrollGrid:refresh_data()
	slot3 = self

	self._delete_items(slot2)

	slot3 = self

	self._get_data(slot2)

	slot3 = self

	self._create_items(slot2)

	return 
end
function RaidGUIControlScrollGrid:select_grid_item_by_item(grid_item)
	if self._selected_item then
		slot4 = self._selected_item

		self._selected_item.unselect(slot3)
	end

	self._selected_item = grid_item

	if self._selected_item then
		slot4 = self._selected_item

		self._selected_item.select(slot3)
	end

	return 
end
function RaidGUIControlScrollGrid:select_grid_item_by_key_value(params)
	slot4 = self._grid_items

	for _, grid_item in ipairs(slot3) do
		slot9 = grid_item
		local grid_item_data = grid_item.get_data(slot8)

		if grid_item_data[params.key] == params.value then
			self._selected_item = grid_item
			slot10 = self._selected_item

			self._selected_item.select(slot9)
		else
			slot10 = grid_item

			grid_item.unselect(slot9)
		end
	end

	return self._selected_item
end
function RaidGUIControlScrollGrid:selected_grid_item()
	return self._selected_item
end
function RaidGUIControlScrollGrid:on_mouse_pressed(button, x, y)
	slot8 = y

	if self._scroll_marker.inside(slot5, self._scroll_marker, x) then
		slot6 = managers.raid_menu
		self._old_active_control = managers.raid_menu.get_active_control(slot5)
		slot7 = self

		managers.raid_menu.set_active_control(slot5, managers.raid_menu)

		self._active = true
	end

	return 
end
function RaidGUIControlScrollGrid:on_mouse_released()
	if self._active then
		slot4 = self._old_active_control

		managers.raid_menu.set_active_control(slot2, managers.raid_menu)

		self._active = false
		self._coord_y_from_marker_top = nil

		return true
	end

	return 
end
function RaidGUIControlScrollGrid:on_mouse_moved(o, x, y)
	if self._active then
		slot6 = self._panel_scroll_marker
		local coord_y_from_panel_top = y - self._panel_scroll_marker.world_y(slot5)

		if not self._coord_y_from_marker_top then
			slot7 = self._scroll_marker
			self._coord_y_from_marker_top = y - self._scroll_marker.world_y(slot6)
		end

		slot7 = self
		slot10 = coord_y_from_panel_top - self._coord_y_from_marker_top

		self.set_value_by_y_coord(slot6, math.floor(slot9))
	end

	return 
end
function RaidGUIControlScrollGrid:on_mouse_out(x, y)
	slot7 = y

	RaidGUIControlScrollGrid.super.on_mouse_out(slot4, self, x)

	return 
end
function RaidGUIControlScrollGrid:set_value_by_y_coord(selected_coord_y)
	if selected_coord_y < 0 then
		selected_coord_y = 0
	end

	slot5 = selected_coord_y

	self._scroll_marker.set_y(slot3, self._scroll_marker)

	slot5 = self._panel_scroll_marker

	if self._panel_scroll_marker.bottom(self._scroll_marker) < self._scroll_marker.bottom(slot3) then
		slot4 = self._scroll_marker
		slot7 = self._panel_scroll_marker

		self._scroll_marker.set_bottom(slot3, self._panel_scroll_marker.bottom(slot6))
	end

	return 
end

return 
