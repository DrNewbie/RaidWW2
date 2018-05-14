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
if not RaidGUIControlPagedGridCharacterCustomization then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlPagedGridCharacterCustomization = slot0
RaidGUIControlPagedGridCharacterCustomization.DEFAULT_BORDER_PADDING = 10
RaidGUIControlPagedGridCharacterCustomization.DEFAULT_ITEM_PADDING = 16
RaidGUIControlPagedGridCharacterCustomization.PAGING_PANEL_HEIGHT = 25
RaidGUIControlPagedGridCharacterCustomization.PAGING_STEPPER_WIDTH = 100
function RaidGUIControlPagedGridCharacterCustomization:init(parent, params)
	slot7 = params

	RaidGUIControlPagedGridCharacterCustomization.super.init(slot4, self, parent)

	RaidGUIControlPagedGridCharacterCustomization.control = self

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

	slot6 = self._params
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

	self._num_horizontal_items = 3
	self._num_vertical_items = 4
	self._items_per_page = self._num_horizontal_items * self._num_vertical_items
	self._filter = 1
	slot5 = self

	self._get_data(self._num_vertical_items)

	self._current_page = 1
	slot5 = self

	self._create_paging_controls(self._num_vertical_items)

	slot5 = self

	self._create_filtering_controls(self._num_vertical_items)

	slot5 = self

	self._create_items(self._num_vertical_items)

	return 
end
function RaidGUIControlPagedGridCharacterCustomization:close()
	return 
end
function RaidGUIControlPagedGridCharacterCustomization:mouse_moved(o, x, y)
	slot9 = y

	return self._grid_panel.mouse_moved(slot5, self._grid_panel, o, x)
end
function RaidGUIControlPagedGridCharacterCustomization:mouse_released(o, button, x, y)
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
function RaidGUIControlPagedGridCharacterCustomization:_get_data()
	local grid_data = self._data_source_callback()
	self._grid_data = {}
	slot4 = grid_data

	for index, part_data in pairs(slot3) do
		local add_check = false

		if self._filter == 1 and not part_data.locked then
			add_check = true
		elseif self._filter == 2 and (not part_data.locked or part_data.locked == CharacterCustomizationManager.LOCKED_NOT_OWNED) then
			add_check = true
		elseif self._filter == 3 then
			add_check = true
		end

		if add_check then
			slot11 = part_data

			table.insert(slot9, self._grid_data)
		end
	end

	self._total_items = #self._grid_data
	slot4 = self._total_items / self._items_per_page
	self._total_pages = math.ceil(slot3)
	slot4 = self

	self._refresh_paging_control(slot3)

	slot4 = self

	self._refresh_filtering_control(slot3)

	return 
end
function RaidGUIControlPagedGridCharacterCustomization:_create_grid_panel()
	slot3 = self._params
	local grid_params = clone(slot2)
	grid_params.name = grid_params.name .. "_grid"
	slot4 = self._panel
	grid_params.layer = self._panel.layer("_grid") + 1
	grid_params.x = 0
	grid_params.y = 0
	grid_params.h = self._params.h - RaidGUIControlPagedGridCharacterCustomization.PAGING_PANEL_HEIGHT
	slot6 = true
	self._grid_panel = self._paged_grid_panel.panel(RaidGUIControlPagedGridCharacterCustomization.PAGING_PANEL_HEIGHT, self._paged_grid_panel, grid_params)

	return 
end
function RaidGUIControlPagedGridCharacterCustomization:_create_items()
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
function RaidGUIControlPagedGridCharacterCustomization:_create_item(item_params, item_data, grid_params)
	local item_class = RaidGUIControlCustomizationPiece
	slot11 = grid_params
	local item = self._grid_panel.create_custom_control(slot6, self._grid_panel, item_class, item_params, item_data)

	return item
end
function RaidGUIControlPagedGridCharacterCustomization:_create_paging_controls()
	if self._paging_controls_panel then
		slot3 = self._paging_controls_panel

		self._paging_controls_panel.clear(slot2)
	end

	self._current_page = 1

	if self._grid_params.use_paging then
		slot4 = self._grid_panel
		self._paging_controls_panel_params = {
			visible = true,
			name = self._params.name .. "_paging_controls_panel",
			x = self._params.w / 2 + 25,
			y = self._grid_panel.h("_paging_controls_panel"),
			w = self._params.w / 2 - 25,
			h = RaidGUIControlPagedGridCharacterCustomization.PAGING_PANEL_HEIGHT
		}
		slot4 = self._paging_controls_panel_params
		self._paging_controls_panel = self._paged_grid_panel.panel(RaidGUIControlPagedGridCharacterCustomization.PAGING_PANEL_HEIGHT, self._paged_grid_panel)
		slot4 = self._paging_controls_panel
		slot6 = "on_item_selected_grid_page"
		slot6 = "data_source_grid_page_stepper"
		slot4 = self._paging_controls_panel
		self._page_stepper_params = {
			h = 25,
			y = 0,
			x = 0,
			name = self._params.name .. "_page_stepper_stepper",
			w = self._paging_controls_panel.w("_page_stepper_stepper"),
			on_item_selected_callback = callback("_page_stepper_stepper", self, self),
			data_source_callback = callback("_page_stepper_stepper", self, self),
			color = tweak_data.menu.raid_red,
			highlight_color = Color.white,
			arrow_color = tweak_data.menu.raid_red,
			arrow_highlight_color = Color.white,
			button_w = MissionJoinGui.FILTER_BUTTON_W,
			button_h = MissionJoinGui.FILTER_BUTTON_H,
			stepper_w = self._paging_controls_panel.w("_page_stepper_stepper"),
			background_color = RaidOptions.BACKGROUND_COLOR_UNSELECTED,
			on_menu_move = {
				up = self._params.name .. "_grid",
				down = self._params.name .. "_grid",
				left = self._params.name .. "_filter_stepper_stepper"
			}
		}
		slot4 = self._page_stepper_params
		self._page_stepper = self._paging_controls_panel.stepper(, self._paging_controls_panel)
	end

	slot3 = self

	self._show_hide_paging(slot2)

	return 
end
function RaidGUIControlPagedGridCharacterCustomization:data_source_grid_page_stepper()
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
function RaidGUIControlPagedGridCharacterCustomization:on_item_selected_grid_page(item)
	self._current_page = item.value
	slot4 = self

	self.refresh_data(slot3)

	return 
end
function RaidGUIControlPagedGridCharacterCustomization:_refresh_paging_control()
	if self._page_stepper then
		slot3 = self._page_stepper

		self._page_stepper.refresh_data(slot2)

		slot4 = self._current_page

		self._page_stepper.select_item_by_value(slot2, self._page_stepper)
	end

	slot3 = self

	self._show_hide_paging(slot2)

	return 
end
function RaidGUIControlPagedGridCharacterCustomization:_show_hide_paging()
	if self._paging_controls_panel then
		if self._total_pages <= 1 then
			self._paging_controls_panel = nil
		else
			slot3 = self

			self._create_paging_controls(slot2)
		end
	end

	return 
end
function RaidGUIControlPagedGridCharacterCustomization:_create_filtering_controls()
	if self._filtering_controls_panel then
		slot3 = self._filtering_controls_panel

		self._filtering_controls_panel.clear(slot2)
	end

	slot4 = self._grid_panel
	self._filtering_controls_panel_params = {
		visible = true,
		x = 0,
		name = self._params.name .. "_filtering_controls_panel",
		y = self._grid_panel.h("_filtering_controls_panel"),
		w = self._params.w / 2 - 25,
		h = RaidGUIControlPagedGridCharacterCustomization.PAGING_PANEL_HEIGHT
	}
	slot4 = self._filtering_controls_panel_params
	self._filtering_controls_panel = self._paged_grid_panel.panel(RaidGUIControlPagedGridCharacterCustomization.PAGING_PANEL_HEIGHT, self._paged_grid_panel)
	slot4 = self._filtering_controls_panel
	slot6 = "on_item_selected_grid_filter"
	slot6 = "data_source_grid_filter_stepper"
	slot4 = self._filtering_controls_panel
	self._filter_stepper_params = {
		h = 25,
		y = 0,
		x = 0,
		name = self._params.name .. "_filter_stepper_stepper",
		w = self._filtering_controls_panel.w("_filter_stepper_stepper"),
		on_item_selected_callback = callback("_filter_stepper_stepper", self, self),
		data_source_callback = callback("_filter_stepper_stepper", self, self),
		color = tweak_data.menu.raid_red,
		highlight_color = Color.white,
		arrow_color = tweak_data.menu.raid_red,
		arrow_highlight_color = Color.white,
		button_w = MissionJoinGui.FILTER_BUTTON_W,
		button_h = MissionJoinGui.FILTER_BUTTON_H,
		stepper_w = self._filtering_controls_panel.w("_filter_stepper_stepper"),
		background_color = RaidOptions.BACKGROUND_COLOR_UNSELECTED,
		on_menu_move = {
			up = self._params.name .. "_grid",
			down = self._params.name .. "_grid",
			right = self._params.name .. "_page_stepper_stepper"
		}
	}
	slot4 = self._filter_stepper_params
	self._filter_stepper = self._filtering_controls_panel.stepper(, self._filtering_controls_panel)

	if self._filtering_controls_panel then
	end

	return 
end
function RaidGUIControlPagedGridCharacterCustomization:data_source_grid_filter_stepper()
	local filters = {}
	slot5 = {
		value = 1,
		text = self.translate(slot7, self, "character_customization_filter_equipable")
	}
	slot10 = true

	table.insert(slot3, filters)

	slot5 = {
		value = 2,
		text = self.translate(slot7, self, "character_customization_filter_character")
	}
	slot10 = true

	table.insert(slot3, filters)

	slot5 = {
		value = 3,
		text = self.translate(slot7, self, "character_customization_filter_all")
	}
	slot10 = true

	table.insert(slot3, filters)

	return filters
end
function RaidGUIControlPagedGridCharacterCustomization:on_item_selected_grid_filter(item)
	if self._filter == item.value then
		return 
	end

	self._filter = item.value
	self._current_page = 1
	slot4 = self

	self.refresh_data(slot3)

	return 
end
function RaidGUIControlPagedGridCharacterCustomization:_refresh_filtering_control()
	if self._filter_stepper then
		slot3 = self._filter_stepper

		self._filter_stepper.refresh_data(slot2)

		slot4 = self._filter

		self._filter_stepper.select_item_by_value(slot2, self._filter_stepper)
	end

	return 
end
function RaidGUIControlPagedGridCharacterCustomization:select_grid_item_by_item(grid_item)
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
function RaidGUIControlPagedGridCharacterCustomization:_delete_items()
	self._grid_items = {}
	self._selected_item = nil
	slot3 = self._grid_panel

	self._grid_panel.clear(slot2)

	return 
end
function RaidGUIControlPagedGridCharacterCustomization:refresh_data()
	slot3 = self

	self._delete_items(slot2)

	slot3 = self

	self._get_data(slot2)

	slot3 = self

	self._create_items(slot2)

	return 
end
function RaidGUIControlPagedGridCharacterCustomization:get_filter_value()
	return self._filter
end
function RaidGUIControlPagedGridCharacterCustomization:set_selected(value)
	self._selected = value
	slot4 = self

	self._unselect_all(slot3)

	if self._selected then
		slot5 = self._grid_items[1]

		self.select_grid_item_by_item(slot3, self)

		self._selected_item_idx = 1
	end

	return 
end
function RaidGUIControlPagedGridCharacterCustomization:_unselect_all()
	self._selected_item = nil
	self._selected_item_idx = 0
	slot3 = self._grid_items

	for _, grid_item in ipairs(slot2) do
		slot8 = grid_item

		grid_item.unselect(slot7)
	end

	return 
end
function RaidGUIControlPagedGridCharacterCustomization:move_up()
	if self._selected then
		local new_item_idx = self._selected_item_idx - self._num_horizontal_items

		if self._selected_item_idx == 0 then
			slot4 = self._filter_stepper

			if self._filter_stepper.is_selected(slot3) then
				slot4 = self._filter_stepper

				self._filter_stepper.move_up(slot3)

				slot4 = self

				self._unselect_all(slot3)

				slot5 = self._grid_items[1]

				self.select_grid_item_by_item(slot3, self)

				self._selected_item_idx = 1

				return true
			else
				slot4 = self._page_stepper

				if self._page_stepper.is_selected(slot3) then
					slot4 = self._page_stepper

					self._page_stepper.move_up(slot3)

					slot4 = self

					self._unselect_all(slot3)

					slot5 = self._grid_items[1]

					self.select_grid_item_by_item(slot3, self)

					self._selected_item_idx = 1

					return true
				end
			end
		elseif new_item_idx < 1 and self._on_menu_move and self._on_menu_move.up then
			slot5 = self._on_menu_move.up

			return self._menu_move_to(slot3, self)
		end

		self._selected_item_idx = new_item_idx
		slot5 = self._grid_items[new_item_idx]

		self.select_grid_item_by_item(slot3, self)

		return true
	end

	return 
end
function RaidGUIControlPagedGridCharacterCustomization:move_down()
	if self._selected then
		local new_item_idx = self._selected_item_idx + self._num_horizontal_items

		if self._selected_item_idx == 0 then
			slot4 = self._filter_stepper

			if self._filter_stepper.is_selected(slot3) then
				slot4 = self._filter_stepper

				self._filter_stepper.move_down(slot3)

				slot4 = self

				self._unselect_all(slot3)
			else
				slot4 = self._page_stepper

				if self._page_stepper.is_selected(slot3) then
					slot4 = self._page_stepper

					self._page_stepper.move_down(slot3)

					slot4 = self

					self._unselect_all(slot3)
				end
			end

			slot5 = self._on_menu_move.down

			return self._menu_move_to(slot3, self)
		elseif #self._grid_items < new_item_idx and self._filtering_controls_panel and self._filter_stepper then
			slot4 = self

			self._unselect_all(slot3)

			slot5 = true

			self._filter_stepper.set_selected(slot3, self._filter_stepper)

			return true
		elseif #self._grid_items < new_item_idx and self._on_menu_move and self._on_menu_move.down then
			slot5 = self._on_menu_move.down

			return self._menu_move_to(slot3, self)
		end

		self._selected_item_idx = new_item_idx
		slot5 = self._grid_items[new_item_idx]

		self.select_grid_item_by_item(slot3, self)

		return true
	end

	return 
end
function RaidGUIControlPagedGridCharacterCustomization:move_left()
	if self._selected then
		local new_item_idx = self._selected_item_idx - 1

		if self._selected_item_idx == 0 then
			new_item_idx = 0
			slot4 = self._filter_stepper

			if self._filter_stepper.is_selected(slot3) then
				slot4 = self._filter_stepper
			else
				slot4 = self._page_stepper

				if self._page_stepper.is_selected(slot3) then
					slot4 = self._page_stepper
				else
					slot4 = self._filter_stepper

					if self._filter_stepper.is_selected(slot3) then
						slot4 = self._filter_stepper
					else
						slot4 = self._page_stepper

						if self._page_stepper.is_selected(slot3) then
							slot4 = self._page_stepper

							if not self._page_stepper.is_selected_control(slot3) then
								slot4 = self

								self._unselect_all(slot3)

								slot5 = true

								self._filter_stepper.set_selected(slot3, self._filter_stepper)

								slot5 = false

								self._page_stepper.set_selected(slot3, self._page_stepper)

								return true
							end
						end
					end
				end
			end
		elseif new_item_idx % self._num_horizontal_items == 0 and new_item_idx < 1 and self._on_menu_move and self._on_menu_move.left then
			slot5 = self._on_menu_move.left

			return self._menu_move_to(slot3, self)
		elseif new_item_idx < 1 then
			new_item_idx = #self._grid_items
		end

		self._selected_item_idx = new_item_idx
		slot5 = self._grid_items[new_item_idx]

		self.select_grid_item_by_item(slot3, self)

		return true
	end

	return 
end
function RaidGUIControlPagedGridCharacterCustomization:move_right()
	if self._selected then
		local new_item_idx = self._selected_item_idx + 1

		if self._selected_item_idx == 0 then
			new_item_idx = 0
			slot4 = self._filter_stepper

			if self._filter_stepper.is_selected(slot3) then
				slot4 = self._filter_stepper
			else
				slot4 = self._page_stepper

				if self._page_stepper.is_selected(slot3) then
					slot4 = self._page_stepper
				else
					slot4 = self._filter_stepper

					if self._filter_stepper.is_selected(slot3) then
						slot4 = self._filter_stepper
					else
						slot4 = self._page_stepper

						if self._page_stepper.is_selected(slot3) then
							slot4 = self._page_stepper

							if not self._page_stepper.is_selected_control(slot3) then
								slot4 = self

								self._unselect_all(slot3)

								slot5 = true

								self._filter_stepper.set_selected(slot3, self._filter_stepper)

								slot5 = false

								self._page_stepper.set_selected(slot3, self._page_stepper)

								return true
							end
						end
					end
				end
			end
		elseif self._selected_item_idx % self._num_horizontal_items == 0 and #self._grid_items < new_item_idx and self._on_menu_move and self._on_menu_move.right then
			slot5 = self._on_menu_move.right

			return self._menu_move_to(slot3, self)
		elseif #self._grid_items < new_item_idx then
			new_item_idx = 1
		end

		self._selected_item_idx = new_item_idx
		slot5 = self._grid_items[new_item_idx]

		self.select_grid_item_by_item(slot3, self)

		return true
	end

	return 
end
function RaidGUIControlPagedGridCharacterCustomization:confirm_pressed()
	if self._selected then
		if self._selected_item_idx == 0 then
			slot3 = self._filter_stepper

			self._filter_stepper.confirm_pressed(slot2)
		elseif self._selected_item then
			slot3 = self._selected_item

			self._selected_item.confirm_pressed(slot2)
		end
	end

	return 
end

return 
