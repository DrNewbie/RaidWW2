if not RaidGUIControlTable then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlTable = slot0
RaidGUIControlTable.DIVIDER_HEIGHT = 1
function RaidGUIControlTable:init(parent, params)
	slot7 = params

	RaidGUIControlTable.super.init(slot4, self, parent)

	if not params.table_params then
		slot7 = params.name

		Application.error(slot4, Application, "[RaidGUIControlTable:init] table specific parameters not specified for table: ")

		return 
	end

	if not params.table_params.data_source_callback then
		slot7 = params.name

		Application.error(slot4, Application, "[RaidGUIControlTable:init] Data source callback not specified for table: ")

		return 
	end

	self._pointer_type = "arrow"
	self._data_source_callback = params.table_params.data_source_callback
	self._on_selected_callback = params.on_selected_callback
	self._table_params = params.table_params
	self._table_rows = {}
	slot5 = self

	self._create_table_panel(slot4)

	self._use_row_dividers = params.use_row_dividers
	slot6 = self._use_row_dividers

	self._create_items(slot4, self)

	self._loop_items = params.loop_items
	self._autoconfirm_row = params.autoconfirm_row

	if not params.h then
		slot5 = self

		self._fit_panel(slot4)
	end

	return 
end
function RaidGUIControlTable:is_alive()
	if self._object then
		slot3 = self._object._engine_panel
		slot1 = alive(slot2)
	end

	return slot1
end
function RaidGUIControlTable:close()
	slot3 = self

	self._delete_items(slot2)

	slot3 = self._table_panel

	self._table_panel.clear(slot2)

	return 
end
function RaidGUIControlTable:_create_table_panel()
	slot3 = self._params
	local table_params = clone(slot2)
	table_params.name = table_params.name .. "_table"
	slot4 = self._panel
	table_params.layer = self._panel.layer("_table") + 1
	slot5 = table_params
	self._table_panel = self._panel.panel("_table", self._panel)
	self._object = self._table_panel

	return 
end
function RaidGUIControlTable:_fit_panel()
	local header_height = 0
	local row_height = 0
	local dividers_height = 0

	if self._table_params.header_params then
		header_height = self._table_params.header_params.header_height
	end

	if self._table_params.row_params.height then
		row_height = self._table_params.row_params.height
	end

	if self._params.use_row_dividers then
		dividers_height = RaidGUIControlTable.DIVIDER_HEIGHT
	end

	local object_height = header_height + #self._table_rows * row_height + #self._table_rows * dividers_height
	slot8 = object_height

	self._object.set_h(slot6, self._object)

	return 
end
function RaidGUIControlTable:_create_items(use_row_dividers)
	local table_data = self._data_source_callback()

	if table_data and #table_data == 0 then
	end

	self._table_data = table_data
	local y = 0

	if self._table_params.header_params then
		slot6 = self

		self._create_header(slot5)

		y = y + self._table_params.header_params.header_height
	end

	local row_height = self._table_params.row_params.height
	local row_params = {}
	slot8 = self._table_params.row_params
	row_params = clone(slot7)
	row_params.x = row_params.x or 0

	if not row_params.layer then
		slot8 = self._table_panel
		slot6 = self._table_panel.layer(slot7) + 1
	end

	row_params.layer = slot6
	row_params.color = row_params.color or Color.white
	row_params.panel = row_params.panel or self._table_panel
	row_params.row_class = row_params.row_class or self._params.row_class
	slot8 = table_data

	for i, row_data in ipairs(slot7) do
		row_params.name = self._params.name .. "_table_row_" .. i
		row_params.y = y
		row_params.height = row_height
		row_params.text = row_data.text
		row_params.panel = nil
		row_params.color = self._table_params.row_color
		row_params.background_color = row_params.row_background_color
		row_params.highlight_background_color = row_params.row_highlight_background_color
		row_params.selected_background_color = row_params.row_selected_background_color
		row_params.row_index = i
		row_params.use_selector_mark = self._params.use_selector_mark

		if self._table_params.alternate_row_color and i % 2 == 1 then
			row_params.color = self._table_params.alternate_row_color
		end

		if row_params.alternate_row_background_color and i % 2 == 1 then
			row_params.background_color = row_params.alternate_row_background_color
		end

		if self._table_params.row_params.row_texture_background then
			row_params.texture = self._table_params.row_params.row_texture_background
		end

		if self._table_params.row_params.row_texture_rect_background then
			row_params.texture_rect = self._table_paramsrow_params .. row_texture_rect_background
		end

		if self._table_params.row_params.row_texture_color then
			row_params.color = self._table_params.row_params.row_texture_color
		end

		row_params.w = self._table_params.w
		slot16 = self._table_params
		local row = self._create_row(slot12, self, row_params, row_data)
		slot15 = row

		table.insert(self, self._table_rows)

		y = y + row_height + (row_params.spacing or 0)

		if use_row_dividers then
			slot15 = y

			self._create_row_separator(slot13, self)

			y = y + RaidGUIControlTable.DIVIDER_HEIGHT
		end
	end

	if not self._params.h then
		slot8 = self

		self._fit_panel(slot7)
	end

	return 
end
function RaidGUIControlTable:_create_header()
	local header_params = {
		y = 0,
		x = 0,
		h = self._table_params.header_params.header_height
	}
	slot4 = self._table_panel
	header_params.layer = self._table_panel.layer(slot3) + 1
	header_params.text_color = self._table_params.header_params.text_color
	header_params.background_color = self._table_params.header_params.background_color
	header_params.panel = self._table_panel

	if self._table_params.header_params.background_color then
		slot5 = header_params
		self._header_background = self._table_panel.rect(slot3, self._table_panel)
	end

	local header_column_params = header_params
	local x = 0
	self._header_column_items = {}
	slot6 = self._table_panel
	header_params.layer = self._table_panel.layer(slot5) + 2
	slot6 = self._table_params.columns

	for column_index, column_data in ipairs(slot5) do
		header_column_params.name = "table_header_column_" .. column_index
		header_column_params.x = x + (column_data.header_padding or 0)
		header_column_params.w = column_data.w - 2 * (column_data.header_padding or 0)
		header_column_params.text_id = column_data.header_text_id
		header_column_params.text = column_data.header_text
		header_column_params.color = self._table_params.header_params.text_color or tweak_data.gui.colors.raid_white
		header_column_params.align = column_data.header_align
		header_column_params.vertical = column_data.header_vertical
		slot11 = self._table_panel
		header_column_params.layer = self._table_panel.layer(column_data.header_padding or 0) + 10 + column_index
		header_column_params.font = self._params.table_params.header_params.font
		header_column_params.font_size = self._params.table_params.header_params.font_size
		slot13 = header_column_params
		local item = RaidGUIControlLabel.new(column_data.header_padding or 0, RaidGUIControlLabel, self._parent)
		slot13 = item

		table.insert(RaidGUIControlLabel, self._header_column_items)

		x = x + column_data.w
	end

	return 
end
function RaidGUIControlTable:_create_row(row_params, row_data, table_params)
	row_params.x = 0
	row_params.w = table_params.w
	slot8 = "on_row_clicked"
	row_params.on_row_click_callback = callback(slot5, self, self)
	slot8 = "on_row_double_clicked"
	row_params.on_row_double_click_callback = callback(slot5, self, self)
	local row_class = row_params.row_class or RaidGUIControlTableRow
	slot11 = table_params
	local row = self._table_panel.create_custom_control(slot6, self._table_panel, row_class, row_params, row_data)

	return row
end
function RaidGUIControlTable:on_row_clicked(row_data, row_index)
	slot6 = row_index

	self.select_table_row_by_row_idx(slot4, self)

	if self._table_params.row_params.on_row_click_callback then
		slot6 = row_index

		self._table_params.row_params.on_row_click_callback(slot4, row_data)
	end

	return 
end
function RaidGUIControlTable:on_row_double_clicked(row_data, row_index)
	slot6 = row_index

	self.select_table_row_by_row_idx(slot4, self)

	if self._table_params.row_params.on_row_double_clicked_callback then
		slot6 = row_index

		self._table_params.row_params.on_row_double_clicked_callback(slot4, row_data)
	end

	return 
end
function RaidGUIControlTable:get_selected_row()
	return self._selected_row
end
function RaidGUIControlTable:_create_row_separator(y)
	slot5 = {
		h = 1,
		x = 0,
		y = y + 0.6,
		w = self._table_panel.w(slot7),
		color = tweak_data.gui.colors.raid_white.with_alpha(slot7, tweak_data.gui.colors.raid_white)
	}
	slot8 = self._table_panel
	slot9 = 0.25
	local divider_line = self._table_panel.rect(slot3, self._table_panel)

	return 
end
function RaidGUIControlTable:_delete_items()
	self._table_rows = {}
	self._selected_row = nil
	slot3 = self._table_panel

	self._table_panel.clear(slot2)

	return 
end
function RaidGUIControlTable:get_rows()
	return self._table_rows
end
function RaidGUIControlTable:get_row(i)
	return self._table_rows[i]
end
function RaidGUIControlTable:get_last_row()
	return self._table_rows and self._table_rows[#self._table_rows]
end
function RaidGUIControlTable:mouse_moved(o, x, y)
	slot9 = y

	return self._table_panel.mouse_moved(slot5, self._table_panel, o, x)
end
function RaidGUIControlTable:mouse_released(o, button, x, y)
	slot10 = y

	return self._table_panel.mouse_released(slot6, self._table_panel, o, x)
end
function RaidGUIControlTable:highlight_on()
	return 
end
function RaidGUIControlTable:highlight_off()
	return 
end
function RaidGUIControlTable:refresh_data()
	slot3 = self

	self._delete_items(slot2)

	slot4 = self._use_row_dividers

	self._create_items(slot2, self)

	return 
end
function RaidGUIControlTable:select_table_row_by_row_idx(row_index)
	if self._selected_row then
		slot4 = self._selected_row

		self._selected_row.unselect(slot3)
	end

	self._selected_row = self._table_rows[row_index]

	if self._selected_row then
		self._selected_row_idx = row_index
		slot4 = self._selected_row

		self._selected_row.select(slot3)
	end

	return 
end
function RaidGUIControlTable:select_table_row_by_row(table_row)
	if self._selected_row then
		slot4 = self._selected_row

		self._selected_row.unselect(slot3)
	end

	self._selected_row = table_row
	slot4 = self._selected_row

	self._selected_row.select(slot3)

	return 
end
function RaidGUIControlTable:selected_table_row()
	return self._selected_row
end
function RaidGUIControlTable:set_selected(value)
	self._selected = value
	slot4 = self

	self._unselect_all(slot3)

	if self._selected then
		slot4 = self
		local rows = self.get_rows(slot3)

		if 0 < #rows then
			self._selected_row_idx = self._selected_row_idx or 1
			slot6 = self._selected_row_idx

			self.select_table_row_by_row_idx(slot4, self)
		end

		if self._on_selected_callback then
			self._on_selected_callback()
		end
	end

	return 
end
function RaidGUIControlTable:_unselect_all()
	self._selected_row = nil
	slot3 = self._table_rows

	for _, row in ipairs(slot2) do
		slot8 = row

		row.unselect(slot7)
	end

	return 
end
function RaidGUIControlTable:move_up()
	if self._selected then
		slot3 = self

		if 0 < #self.get_rows(slot2) then
			slot3 = self
			local previous_row_idx = self._previous_row_idx(slot2)

			if previous_row_idx then
				slot5 = self._selected_row_idx

				self.select_table_row_by_row_idx(slot3, self)

				if self._table_params.row_params.on_row_select_callback then
					local row_data = self._selected_row.get_data(slot3)
					slot6 = self._selected_row_idx

					self._table_params.row_params.on_row_select_callback(self._selected_row, row_data)
				end

				slot4 = self

				self._calculate_selected_item_position(slot3)

				return true
			else
				slot4 = self

				return self.super.move_up(slot3)
			end
		end
	end

	return 
end
function RaidGUIControlTable:move_down()
	if self._selected then
		slot3 = self

		if 0 < #self.get_rows(slot2) then
			slot3 = self
			local next_row = self._next_row_idx(slot2)

			if next_row then
				slot5 = self._selected_row_idx

				self.select_table_row_by_row_idx(slot3, self)

				if self._table_params.row_params.on_row_select_callback then
					local row_data = self._selected_row.get_data(slot3)
					slot6 = self._selected_row_idx

					self._table_params.row_params.on_row_select_callback(self._selected_row, row_data)
				end

				slot4 = self

				self._calculate_selected_item_position(slot3)

				return true
			else
				slot4 = self

				return self.super.move_down(slot3)
			end
		end
	end

	return 
end
function RaidGUIControlTable:move_left()
	if self._selected then
		slot3 = self

		return self.super.move_left(slot2)
	end

	return 
end
function RaidGUIControlTable:confirm_pressed()
	if self._selected and self._selected_row then
		slot3 = self._selected_row

		self._selected_row.confirm_pressed(slot2)

		return true
	end

	return 
end
function RaidGUIControlTable:_previous_row_idx()
	self._selected_row_idx = self._selected_row_idx - 1

	if self._selected_row_idx <= 0 then
		if self._loop_items then
			self._selected_row_idx = #self._table_rows

			return true
		else
			return false
		end
	end

	return true
end
function RaidGUIControlTable:_next_row_idx()
	self._selected_row_idx = self._selected_row_idx + 1

	if #self._table_rows < self._selected_row_idx then
		if self._loop_items then
			self._selected_row_idx = 1

			return true
		else
			return false
		end
	end

	return true
end
function RaidGUIControlTable:_calculate_selected_item_position()
	self._selected_item = self._selected_row

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
		slot8 = self._selected_item

		if selected_item_y < self._selected_item.h(slot7) then
			slot9 = 0

			self._inner_panel.set_y(slot7, self._inner_panel)
		else
			slot9 = -selected_item_y

			self._inner_panel.set_y(slot7, self._inner_panel)
		end
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

return 
