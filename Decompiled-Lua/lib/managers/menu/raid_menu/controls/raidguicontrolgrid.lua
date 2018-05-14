if not RaidGUIControlGrid then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlGrid = slot0
RaidGUIControlGrid.DEFAULT_BORDER_PADDING = 10
RaidGUIControlGrid.DEFAULT_ITEM_PADDING = 16
RaidGUIControlGrid.PAGING_PANEL_HEIGHT = 25
RaidGUIControlGrid.PAGING_STEPPER_WIDTH = 100
RaidGUIControlGrid.SCROLL_STEP = 30
function RaidGUIControlGrid:init(parent, params)
	slot7 = params

	RaidGUIControlGrid.super.init(slot4, self, parent)

	RaidGUIControlGrid.control = self

	if not params.grid_params then
		slot7 = params.name

		Application.error(slot4, Application, "[RaidGUIControlGrid:init] grid specific parameters not specified for grid: ")

		return 
	end

	if not params.grid_params.data_source_callback then
		slot7 = params.name

		Application.error(slot4, Application, "[RaidGUIControlGrid:init] Data source callback not specified for grid: ")

		return 
	end

	slot6 = {
		x = 0,
		y = 0,
		w = self._grid_control_width
	}
	self._grid_panel = self._panel.panel(slot4, self._panel)
	self._object = self._grid_panel
	slot8 = self._panel

	self._object.layer(slot4, self._object)

	self._pointer_type = "arrow"
	self._data_source_callback = self._params.grid_params.data_source_callback
	self._on_click_callback = self._params.grid_params.on_click_callback
	self._on_double_click_callback = self._params.grid_params.on_double_click_callback
	self._on_select_callback = self._params.grid_params.on_select_callback
	self._grid_params = self._params.grid_params or {}
	self._vertical_spacing = self._params.grid_params.vertical_spacing or 5
	self._item_params = self._params.item_params or {}
	self._item_width = self._item_params.item_w or 1
	self._item_height = self._item_params.item_h or 1
	self._selected_marker_w = self._item_params.selected_marker_w
	self._selected_marker_h = self._item_params.selected_marker_h
	slot7 = self._grid_panel
	slot5 = self._grid_panel.w(self._panel.layer(self._grid_control_width) - 100) / self._selected_marker_w
	self._num_horizontal_items = math.floor(slot4)
	slot5 = self

	self._get_data(slot4)

	slot5 = self

	self._create_items(slot4)

	return 
end
function RaidGUIControlGrid:close()
	return 
end
function RaidGUIControlGrid:_get_data()
	slot4 = 0

	self._grid_panel.set_y(slot2, self._grid_panel)

	local grid_data = self._data_source_callback()

	if not grid_data or #grid_data == 0 then
		self._total_items = 0

		return 
	end

	self._grid_data = grid_data
	self._total_items = #grid_data
	local row_count = math.ceil(slot3)
	slot6 = row_count * (self._selected_marker_h + self._vertical_spacing)

	self._grid_panel.set_h(self._total_items / self._num_horizontal_items, self._grid_panel)

	return 
end
function RaidGUIControlGrid:_create_items()
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
		slot15 = "_on_item_selected_callback"
		item_params.item_selected_callback = callback(i_vertical - 1, self, self)
		slot15 = "_on_item_clicked_callback"
		item_params.item_clicked_callback = callback(i_vertical - 1, self, self)
		slot15 = "_on_item_double_clicked_callback"
		item_params.item_double_clicked_callback = callback(i_vertical - 1, self, self)
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
function RaidGUIControlGrid:_create_item(item_params, item_data, grid_params)
	slot10 = grid_params
	local item = self._grid_panel.create_custom_control(slot5, self._grid_panel, item_params.row_class or RaidGUIControlCardBase, item_params, item_data)

	if item.set_card then
		slot8 = item_data

		item.set_card(slot6, item)
	end

	return item
end
function RaidGUIControlGrid:_delete_items()
	self._grid_items = {}
	self._selected_item = nil
	slot3 = self._grid_panel

	self._grid_panel.clear(slot2)

	return 
end
function RaidGUIControlGrid:highlight_on()
	return 
end
function RaidGUIControlGrid:highlight_off()
	return 
end
function RaidGUIControlGrid:refresh_data()
	slot3 = self

	self._delete_items(slot2)

	slot3 = self

	self._get_data(slot2)

	slot3 = self

	self._create_items(slot2)

	return 
end
function RaidGUIControlGrid:select_grid_item_by_item(grid_item, dont_fire_select_callback)
	if self._selected_item then
		slot5 = self._selected_item

		self._selected_item.unselect(slot4)
	end

	self._selected_item = grid_item

	if self._selected_item then
		slot6 = dont_fire_select_callback

		self._selected_item.select(slot4, self._selected_item)
	end

	return 
end
function RaidGUIControlGrid:select_grid_item_by_key_value(params)
	slot4 = self._grid_items

	for grid_item_index, grid_item in ipairs(slot3) do
		slot9 = grid_item
		local grid_item_data = grid_item.get_data(slot8)

		if grid_item_data[params.key] == params.value then
			self._selected_item = grid_item
			slot11 = params.dont_fire_select_callback

			self._selected_item.select(slot9, self._selected_item)

			self._selected_item_idx = grid_item_index
		else
			slot10 = grid_item

			grid_item.unselect(slot9)
		end
	end

	return self._selected_item
end
function RaidGUIControlGrid:selected_grid_item()
	return self._selected_item
end
function RaidGUIControlGrid:_on_item_clicked_callback(item_data, key_field_name)
	slot6 = {
		dont_fire_select_callback = true,
		key = key_field_name,
		value = item_data[key_field_name]
	}

	self.select_grid_item_by_key_value(slot4, self)

	if self._on_click_callback then
		slot5 = item_data

		self._on_click_callback(slot4)
	end

	return 
end
function RaidGUIControlGrid:_on_item_double_clicked_callback(item_data, key_field_name)
	if self._on_double_click_callback then
		slot5 = item_data

		self._on_double_click_callback(slot4)
	end

	return 
end
function RaidGUIControlGrid:_on_item_selected_callback(item_idx, item_data)
	if self._on_select_callback then
		slot6 = item_data

		self._on_select_callback(slot4, item_idx)
	end

	return 
end
function RaidGUIControlGrid:set_selected(value, dont_fire_select_callback)
	self._selected = value
	slot5 = self

	self._unselect_all(slot4)

	if self._selected then
		slot7 = dont_fire_select_callback

		self.select_grid_item_by_item(slot4, self, self._grid_items[1])

		self._selected_item_idx = 1
	end

	return 
end
function RaidGUIControlGrid:_unselect_all()
	self._selected_item = nil
	self._selected_item_idx = 0
	slot3 = self._grid_items

	for _, grid_item in ipairs(slot2) do
		slot8 = grid_item

		grid_item.unselect(slot7)
	end

	return 
end
function RaidGUIControlGrid:move_up()
	if self._selected then
		local new_item_idx = self._selected_item_idx - self._num_horizontal_items

		if self._selected_item_idx == 0 then
		elseif new_item_idx < 1 then
			new_item_idx = #self._grid_items
		end

		self._selected_item_idx = new_item_idx
		slot5 = self._grid_items[new_item_idx]

		self.select_grid_item_by_item(slot3, self)

		slot4 = self

		self._calculate_selected_item_position(slot3)

		return true
	end

	return 
end
function RaidGUIControlGrid:move_down()
	if self._selected then
		local new_item_idx = self._selected_item_idx + self._num_horizontal_items

		if self._selected_item_idx == 0 then
		elseif #self._grid_items < new_item_idx and self._filtering_controls_panel and self._filter_stepper then
			slot4 = self

			self._unselect_all(slot3)

			slot5 = true

			self._filter_stepper.set_selected(slot3, self._filter_stepper)

			return true
		elseif #self._grid_items < new_item_idx then
			new_item_idx = 1
		end

		self._selected_item_idx = new_item_idx
		slot5 = self._grid_items[new_item_idx]

		self.select_grid_item_by_item(slot3, self)

		slot4 = self

		self._calculate_selected_item_position(slot3)

		return true
	end

	return 
end
function RaidGUIControlGrid:move_left()
	if self._selected then
		local new_item_idx = self._selected_item_idx - 1

		if self._selected_item_idx == 0 then
		elseif new_item_idx % self._num_horizontal_items == 0 and new_item_idx < 1 and self._on_menu_move and self._on_menu_move.left then
			slot5 = self._on_menu_move.left

			return self._menu_move_to(slot3, self)
		elseif new_item_idx < 1 then
			new_item_idx = #self._grid_items
		end

		self._selected_item_idx = new_item_idx
		slot5 = self._grid_items[new_item_idx]

		self.select_grid_item_by_item(slot3, self)

		slot4 = self

		self._calculate_selected_item_position(slot3)

		return true
	end

	return 
end
function RaidGUIControlGrid:move_right()
	if self._selected then
		local new_item_idx = self._selected_item_idx + 1

		if self._selected_item_idx == 0 then
		elseif self._selected_item_idx % self._num_horizontal_items == 0 and #self._grid_items < new_item_idx and self._on_menu_move and self._on_menu_move.right then
			slot5 = self._on_menu_move.right

			return self._menu_move_to(slot3, self)
		elseif #self._grid_items < new_item_idx then
			new_item_idx = 1
		end

		self._selected_item_idx = new_item_idx
		slot5 = self._grid_items[new_item_idx]

		self.select_grid_item_by_item(slot3, self)

		slot4 = self

		self._calculate_selected_item_position(slot3)

		return true
	end

	return 
end
function RaidGUIControlGrid:_calculate_selected_item_position()
	if not self._selected_item or not self._params.scrollable_area_ref then
		return 
	end

	self._inner_panel = self._params.scrollable_area_ref._inner_panel
	self._outer_panel = self._params.scrollable_area_ref._object
	self._scrollbar = self._params.scrollable_area_ref._scrollbar
	local inner_panel_y = self._inner_panel.y(slot2)
	local selected_item_bottom = self._selected_item.bottom(self._inner_panel)
	slot5 = self._selected_item
	local selected_item_y = self._selected_item.y(self._selected_item)
	slot8 = self._inner_panel
	slot7 = self._outer_panel
	local inner_panel_bottom = math.abs(self._inner_panel.y(slot7)) + self._outer_panel.h(self._inner_panel.y)
	local outer_panel_height = self._outer_panel.h(self._inner_panel.y)
	slot8 = inner_panel_y

	if selected_item_y < math.abs(self._outer_panel) then
		slot9 = -selected_item_y

		self._inner_panel.set_y(slot7, self._inner_panel)
	elseif inner_panel_y <= 0 and inner_panel_bottom < selected_item_bottom then
		slot9 = -(selected_item_bottom - outer_panel_height)

		self._inner_panel.set_y(slot7, self._inner_panel)
	end

	local new_y = self._inner_panel.y(slot7)
	local ep_h = self._inner_panel.h(self._inner_panel)
	slot11 = new_y

	self._inner_panel.set_y(self._inner_panel, self._inner_panel)

	local scroll_y = self._outer_panel.h(self._inner_panel) * -new_y / ep_h
	slot12 = scroll_y

	self._scrollbar.set_y(self._outer_panel, self._scrollbar)

	return 
end
function RaidGUIControlGrid:confirm_pressed()
	return 
end

return 
