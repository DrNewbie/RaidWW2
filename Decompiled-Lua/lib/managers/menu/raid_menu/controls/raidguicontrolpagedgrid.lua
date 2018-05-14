if not RaidGUIControlPagedGrid then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlPagedGrid = slot0
RaidGUIControlPagedGrid.DEFAULT_BORDER_PADDING = 10
RaidGUIControlPagedGrid.DEFAULT_ITEM_PADDING = 16
RaidGUIControlPagedGrid.PAGING_PANEL_HEIGHT = 25
RaidGUIControlPagedGrid.PAGING_STEPPER_WIDTH = 100
function RaidGUIControlPagedGrid:init(parent, params)
	slot7 = params

	RaidGUIControlPagedGrid.super.init(slot4, self, parent)

	RaidGUIControlPagedGrid.control = self

	if not params.grid_params then
		slot7 = params.name

		Application.error(slot4, Application, "[RaidGUIControlPagedGrid:init] grid specific parameters not specified for grid: ")

		return 
	end

	if not params.grid_params.data_source_callback then
		slot7 = params.name

		Application.error(slot4, Application, "[RaidGUIControlPagedGrid:init] Data source callback not specified for grid: ")

		return 
	end

	self._paged_grid_panel = self._panel.panel(slot4, self._panel)
	self._object = self._paged_grid_panel
	self._pointer_type = "arrow"
	self._data_source_callback = self._params.grid_params.data_source_callback
	self._grid_params = self._params.grid_params or {}
	self._border_padding = self._params.grid_params.border_padding or RaidGUIControlPagedGrid.DEFAULT_BORDER_PADDING
	self._item_padding = self._params.grid_params.item_padding or RaidGUIControlPagedGrid.DEFAULT_ITEM_PADDING
	self._data_source_filter_callback = self._grid_params.data_source_filter_callback
	self._filter_value = self._grid_params.filter_value
	self._item_params = self._params.item_params or {}
	self._item_width = self._item_params.w + self._item_padding
	self._item_height = self._item_params.h + self._item_padding
	slot5 = self

	self._create_grid_panel(self._item_padding)

	slot7 = self._grid_panel
	slot5 = (self._grid_panel.w(self._params) - 2 * self._border_padding + self._item_padding) / self._item_width
	self._num_horizontal_items = math.floor(self._item_padding)
	slot7 = self._grid_panel
	slot5 = (self._grid_panel.h(self._item_width) - 2 * self._border_padding + self._item_padding) / self._item_height
	self._num_vertical_items = math.floor(self._item_padding)
	self._items_per_page = self._num_horizontal_items * self._num_vertical_items
	slot5 = self

	self._get_data(self._num_vertical_items)

	self._current_page = 1

	if self._grid_params.use_paging then
		slot5 = self

		self._create_paging_controls(slot4)
	end

	if self._data_source_filter_callback then
		slot5 = self

		self._create_filter_controls(slot4)
	end

	slot5 = self

	self._create_items(slot4)

	return 
end
function RaidGUIControlPagedGrid:close()
	return 
end
function RaidGUIControlPagedGrid:_create_grid_panel()
	slot3 = self._params
	local grid_params = clone(slot2)
	grid_params.name = grid_params.name .. "_grid"
	slot4 = self._panel
	grid_params.layer = self._panel.layer("_grid") + 1
	grid_params.x = 0
	grid_params.y = 0
	grid_params.h = self._params.h - RaidGUIControlPagedGrid.PAGING_PANEL_HEIGHT
	slot6 = true
	self._grid_panel = self._paged_grid_panel.panel(RaidGUIControlPagedGrid.PAGING_PANEL_HEIGHT, self._paged_grid_panel, grid_params)

	return 
end
function RaidGUIControlPagedGrid:_get_data()
	local grid_data = self._data_source_callback()

	if not grid_data or #grid_data == 0 then
		self._total_items = 0
		self._total_pages = 1
		slot6 = self._params.name

		Application.error(slot3, Application, "[RaidGUIControlPagedGrid:_create_items] No items for grid: ")

		return 
	end

	slot6 = ChallengeCardsTweakData.FILTER_ALL_ITEMS

	if self._filter_value == self.translate(slot4, self) then
		self._grid_data = grid_data
	else
		self._grid_data = {}
		slot4 = grid_data

		for key, value in pairs(slot3) do
			slot10 = value.card_type

			if self.translate(slot8, self) == self._filter_value then
				slot10 = value

				table.insert(slot8, self._grid_data)
			end
		end
	end

	self._total_items = #self._grid_data
	slot4 = self._total_items / self._items_per_page
	self._total_pages = math.ceil(slot3)

	return 
end
function RaidGUIControlPagedGrid:_create_items()
	local item_count = 0
	local i_vertical = 1
	local i_horizontal = 1
	self._grid_items = {}
	slot6 = self._item_params
	local item_params = clone(slot5)
	local first_item = (self._current_page - 1) * self._items_per_page + 1
	slot9 = self._current_page * self._items_per_page
	local last_item = math.min(slot7, self._total_items)

	for i_item_data = first_item, last_item, 1 do
		local item_data = self._grid_data[i_item_data]
		item_params.name = self._params.name .. "_grid_item_" .. i_horizontal .. "_" .. i_vertical
		item_params.x = self._border_padding + (i_horizontal - 1) * self._item_width
		item_params.y = self._border_padding + (i_vertical - 1) * self._item_height
		item_params.color = Color.blue
		slot17 = self._grid_params
		local item = self._create_item((i_vertical - 1) * self._item_height, self, item_params, item_data)
		slot16 = item

		table.insert(self, self._grid_items)

		i_horizontal = i_horizontal + 1

		if self._num_horizontal_items < i_horizontal then
			i_horizontal = 1
			i_vertical = i_vertical + 1

			if self._num_vertical_items < i_vertical then
				return 
			end
		end
	end

	return 
end
function RaidGUIControlPagedGrid:_create_item(item_params, item_data, grid_params)
	local item_class = RaidGUIControlCard
	slot11 = grid_params
	local item = self._grid_panel.create_custom_control(slot6, self._grid_panel, item_class, item_params, item_data)

	return item
end
function RaidGUIControlPagedGrid:_create_paging_controls()
	if self._paging_controls_panel then
		slot3 = self._paging_controls_panel

		self._paging_controls_panel.clear(slot2)
	end

	if 1 <= self._total_pages then
		self._current_page = 1
		slot4 = self._grid_panel
		self._paging_controls_panel_params = {
			visible = true,
			x = 0,
			name = self._params.name .. "_paging_controls_panel",
			y = self._grid_panel.h("_paging_controls_panel"),
			w = self._params.w,
			h = RaidGUIControlPagedGrid.PAGING_PANEL_HEIGHT
		}
		slot4 = self._paging_controls_panel_params
		self._paging_controls_panel = self._paged_grid_panel.panel(RaidGUIControlPagedGrid.PAGING_PANEL_HEIGHT, self._paged_grid_panel)
		slot4 = self._paging_controls_panel
		slot6 = "on_item_selected_grid_page"
		slot6 = "data_source_grid_page_stepper"
		self._page_stepper_params = {
			h = 25,
			y = 0,
			name = self._params.name .. "_page_stepper_stepper",
			x = self._params.w / 2 + 25,
			w = RaidGUIControlPagedGrid.PAGING_STEPPER_WIDTH,
			w = self._paging_controls_panel.w("_page_stepper_stepper") / 2 - 50,
			on_item_selected_callback = callback("_page_stepper_stepper", self, self),
			data_source_callback = callback("_page_stepper_stepper", self, self)
		}
		slot4 = self._page_stepper_params
		self._page_stepper = self._paging_controls_panel.stepper(callback("_page_stepper_stepper", self, self), self._paging_controls_panel)
	end

	return 
end
function RaidGUIControlPagedGrid:_create_filter_controls()
	if not self._paging_controls_panel then
		slot4 = self._grid_panel
		self._paging_controls_panel_params = {
			visible = true,
			x = 0,
			name = self._params.name .. "_paging_controls_panel",
			y = self._grid_panel.h("_paging_controls_panel"),
			w = self._params.w,
			h = RaidGUIControlPagedGrid.PAGING_PANEL_HEIGHT
		}
		slot4 = self._paging_controls_panel_params
		self._paging_controls_panel = self._paged_grid_panel.panel(RaidGUIControlPagedGrid.PAGING_PANEL_HEIGHT, self._paged_grid_panel)
	end

	if self._paging_controls_panel then
		slot4 = self._paging_controls_panel
		slot6 = "on_item_selected_grid_filter"
		slot6 = "data_source_grid_filter_stepper"
		self._filter_stepper_params = {
			h = 25,
			y = 0,
			x = 0,
			name = self._params.name .. "_filter_stepper_stepper",
			w = RaidGUIControlPagedGrid.PAGING_STEPPER_WIDTH,
			w = self._paging_controls_panel.w("_filter_stepper_stepper") / 2 - 50,
			on_item_selected_callback = callback("_filter_stepper_stepper", self, self),
			data_source_callback = callback("_filter_stepper_stepper", self, self)
		}
		slot4 = self._filter_stepper_params
		self._filter_stepper = self._paging_controls_panel.stepper(callback("_filter_stepper_stepper", self, self), self._paging_controls_panel)
	end

	return 
end
function RaidGUIControlPagedGrid:_delete_items()
	self._grid_items = {}
	self._selected_item = nil
	slot3 = self._grid_panel

	self._grid_panel.clear(slot2)

	return 
end
function RaidGUIControlPagedGrid:mouse_moved(o, x, y)
	slot9 = y

	return self._grid_panel.mouse_moved(slot5, self._grid_panel, o, x)
end
function RaidGUIControlPagedGrid:mouse_released(o, button, x, y)
	slot7 = self._grid_items

	for _, grid_item in ipairs(slot6) do
		slot14 = y

		if grid_item.inside(slot11, grid_item, x) then
			slot16 = y
			local handled = grid_item.mouse_released(slot11, grid_item, o, button, x)

			if handled then
				slot14 = grid_item

				self.select_grid_item_by_item(slot12, self)

				return true
			end
		end
	end

	return false
end
function RaidGUIControlPagedGrid:highlight_on()
	return 
end
function RaidGUIControlPagedGrid:highlight_off()
	return 
end
function RaidGUIControlPagedGrid:refresh_data()
	slot3 = self

	self._delete_items(slot2)

	slot3 = self

	self._get_data(slot2)

	slot3 = self

	self._create_items(slot2)

	return 
end
function RaidGUIControlPagedGrid:select_grid_item_by_item(grid_item)
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
function RaidGUIControlPagedGrid:selected_grid_item()
	return self._selected_item
end
function RaidGUIControlPagedGrid:on_item_selected_grid_page(item)
	self._current_page = item.value
	slot4 = self

	self.refresh_data(slot3)

	return 
end
function RaidGUIControlPagedGrid:data_source_grid_page_stepper()
	local pages = {}

	for i_page = 1, self._total_pages, 1 do
		slot9 = {
			text = i_page .. "/" .. self._total_pages,
			value = i_page
		}

		table.insert(slot7, pages)
	end

	return pages
end
function RaidGUIControlPagedGrid:on_item_selected_grid_filter(item)
	self._filter_value = item.value
	self._current_page = 1
	slot4 = self

	self.refresh_data(slot3)

	return 
end
function RaidGUIControlPagedGrid:data_source_grid_filter_stepper()
	if self._data_source_filter_callback then
		return self._data_source_filter_callback()
	end

	return 
end

return 
