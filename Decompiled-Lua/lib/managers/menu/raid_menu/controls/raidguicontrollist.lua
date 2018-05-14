if not RaidGUIControlList then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlList = slot0
RaidGUIControlList.DIVIDER_HEIGHT = 2
function RaidGUIControlList:init(parent, params)
	slot7 = params

	RaidGUIControlList.super.init(slot4, self, parent)

	self._on_click_callback = params.on_item_clicked_callback
	self._on_double_click_callback = params.on_item_double_clicked_callback
	self._on_item_selected_callback = params.on_item_selected_callback
	self._data_source_callback = params.data_source_callback
	self._list_params = params
	self._loop_items = params.loop_items
	self._list_items = {}
	slot5 = self

	self._create_list_panel(slot4)

	slot5 = self

	self._create_items(slot4)

	self._selection_enabled = self._list_params.selection_enabled
	self._abort_selection = false

	return 
end
function RaidGUIControlList:scrollable_area_post_setup(params)
	slot4 = self

	self._reposition_selected_item(slot3)

	return 
end
function RaidGUIControlList:set_abort_selection(value)
	self._abort_selection = value

	return 
end
function RaidGUIControlList:get_abort_selection()
	return self._abort_selection
end
function RaidGUIControlList:close()
	slot3 = self

	self._delete_items(slot2)

	return 
end
function RaidGUIControlList:get_data()
	return self._list_data
end
function RaidGUIControlList:_create_list_panel()
	slot3 = self._params
	local list_params = clone(slot2)
	list_params.name = list_params.name .. "_list"
	slot5 = list_params
	self._object = self._panel.panel("_list", self._panel)

	return 
end
function RaidGUIControlList:_create_items()
	self._list_data = self._data_source_callback()

	if not self._list_data then
		slot5 = self._params.name

		Application.error(slot2, Application, "[RaidGUIControlList:_create_items] No items for list: ")

		return 
	end

	local selected_item = nil
	local y = self._params.padding_top or 0
	local counter = 1
	slot6 = self._list_data

	for i, item_data in ipairs(slot5) do
		item_data.availability_flags = item_data.availability_flags or {}
		slot13 = item_data.availability_flags
		local item_is_available = RaidGUIControl.check_item_availability(slot10, RaidGUIControl, self)

		if item_is_available then
			local item_params = self._params.item_params or {}
			item_params.name = self._params.name .. "_list_item_" .. i
			item_params.use_unlocked = self._list_params.use_unlocked
			item_params.x = 0
			item_params.y = y
			item_params.w = self._params.w
			item_params.h = self._params.item_h or 64
			item_params.text = item_data.text
			item_params.text_id = item_data.text_id
			item_params.panel = self._object
			item_params.selectable = self._selection_enabled
			item_params.color = item_data.color
			item_params.selected_color = item_data.selected_color
			item_params.item_font = self._params.item_font
			item_params.item_font_size = self._params.item_font_size
			slot15 = "on_item_clicked"
			item_params.on_click_callback = callback(slot12, self, self)
			slot15 = "on_item_double_clicked"
			item_params.on_double_click_callback = callback(slot12, self, self)
			slot15 = "on_item_selected"
			item_params.on_item_selected_callback = callback(slot12, self, self)
			item_params.on_mouse_over_sound_event = self._params.on_mouse_over_sound_event
			item_params.on_mouse_click_sound_event = self._params.on_mouse_click_sound_event
			slot13 = item_data.availability_flags

			for _, flag in pairs(slot12) do
				if flag == RaidGUIItemAvailabilityFlag.DEBUG_MENU_ENABLED then
					item_params.color = tweak_data.gui.colors.raid_debug
				end
			end

			slot16 = item_data
			local item = self._create_item(slot12, self, self._params.item_class or RaidGUIControlListItem, item_params)
			slot15 = item

			table.insert(self, self._list_items)

			if item_data.selected == true then
				selected_item = item
				self._selected_item_idx = counter
			end

			slot14 = item
			y = y + item.h(slot13)

			if self._list_params and self._list_params.vertical_spacing and 0 < self._list_params.vertical_spacing then
				y = y + self._list_params.vertical_spacing
			end

			counter = counter + 1
		end
	end

	if selected_item then
		slot8 = true

		self._select_item(slot5, self, selected_item)
	end

	slot6 = self._object

	self._object.fit_content_height(slot5)

	return 
end
function RaidGUIControlList:_create_item(item_class, item_params, item_data)
	slot9 = item_data

	return self._object.create_custom_control(slot5, self._object, item_class, item_params)
end
function RaidGUIControlList:_delete_items()
	if self._list_items then
		slot3 = self._list_items

		for _, item in ipairs(slot2) do
			slot8 = item

			item.close(slot7)
		end
	end

	self._list_items = {}
	self._selected = false
	self._selected_item = nil
	slot3 = self._object

	self._object.clear(slot2)

	return 
end
function RaidGUIControlList:mouse_moved(o, x, y)
	slot8 = y

	if not self.inside(slot5, self, x) then
		if self._mouse_inside then
			slot6 = self._list_items

			for _, item in ipairs(slot5) do
				slot11 = item

				item.on_mouse_out(slot10)
			end

			self._mouse_inside = false
		end

		return false
	end

	self._mouse_inside = true
	local used = false
	local pointer = nil
	slot8 = self._list_items

	for _, item in ipairs(slot7) do
		slot16 = y
		local u, p = item.mouse_moved(slot12, item, o, x)

		if not used and u then
			used = u
			pointer = p
		end
	end

	return used, pointer
end
function RaidGUIControlList:highlight_on()
	return 
end
function RaidGUIControlList:highlight_off()
	return 
end
function RaidGUIControlList:selected_item()
	if self._selected_item then
		slot3 = self._selected_item

		if self._selected_item.data(slot2) then
			return self._selected_item
		end
	end

	return 
end
function RaidGUIControlList:_select_item(item, dont_trigger_selected_callback)
	if self._selected_item then
		slot5 = self._selected_item

		self._selected_item.unselect(slot4)
	end

	self._selected_item = item
	slot6 = dont_trigger_selected_callback

	item.select(slot4, item)

	if self._on_item_selected_callback then
	end

	slot5 = self._list_items

	for list_item_idx, list_item in ipairs(slot4) do
		if item == list_item then
			self._selected_item_idx = list_item_idx

			break
		end
	end

	return 
end
function RaidGUIControlList:_reposition_selected_item()
	if self._params.scrollable_area_ref and self._selected_item then
		self._inner_panel = self._params.scrollable_area_ref._inner_panel
		self._outer_panel = self._params.scrollable_area_ref._object
		self._scrollbar = self._params.scrollable_area_ref._scrollbar
		local inner_panel_top = self._inner_panel.top(slot2)
		local outer_panel_height = self._outer_panel.h(self._inner_panel)
		local inner_panel_y = self._inner_panel.y(self._outer_panel)
		local selected_item_bottom = self._selected_item.bottom(self._inner_panel)
		slot8 = inner_panel_y

		if self._selected_item.y(self._selected_item) < math.abs(self._selected_item) then
			local new_y = self._selected_item.y(slot6)
			slot9 = -new_y

			self._inner_panel.set_y(self._selected_item, self._inner_panel)
		else
			slot9 = inner_panel_y

			if self._outer_panel.h(self._selected_item) + math.abs(self._outer_panel) <= self._selected_item.bottom(slot6) then
				slot8 = self._outer_panel
				local new_y = -(self._selected_item.bottom(slot6) - self._outer_panel.h(self._selected_item))
				slot9 = new_y

				self._inner_panel.set_y(self._selected_item, self._inner_panel)
			end
		end

		slot7 = self._params.scrollable_area_ref

		self._params.scrollable_area_ref.move_scrollbar_manually(slot6)
	end

	return 
end
function RaidGUIControlList:click_item(item_index)
	if self._list_items[item_index] then
		slot4 = self._list_items[item_index]
		slot7 = "0"

		self._list_items[item_index].on_mouse_released(slot3, Idstring(slot6))
	end

	return 
end
function RaidGUIControlList:select_item_by_index(item_index, dont_trigger_selected_callback, regaining_focus)
	local new_item = self._list_items[item_index]

	if self._selected_item == new_item and not regaining_focus then
		return 
	end

	if self._selected_item then
		slot7 = self._selected_item

		self._selected_item.unselect(slot6)
	end

	self._selected_item = new_item

	if self._selected_item then
		slot9 = dont_trigger_selected_callback

		self._select_item(slot6, self, self._selected_item)

		self._selected_item_idx = item_index
	end

	if self._on_item_selected_callback then
	end

	return 
end
function RaidGUIControlList:select_item_by_value(item_value)
	if self._selected_item then
		slot4 = self._selected_item

		self._selected_item.unselect(slot3)
	end

	if self._list_items then
		slot4 = self._list_items

		for item_index, item in ipairs(slot3) do
			slot9 = item

			if item.data(slot8).value == item_value then
				self._selected_item = item
				slot9 = self._selected_item

				self._selected_item.select(slot8)

				self._selected_item_idx = item_index
				slot9 = self

				self._reposition_selected_item(slot8)

				if self._on_item_selected_callback then
				end

				return 
			end
		end
	end

	return 
end
function RaidGUIControlList:on_item_clicked(button, item, data, skip_select)
	slot7 = self

	if self.get_abort_selection(slot6) then
		slot8 = "[RaidGUIControlList:on_item_clicked] ABORT SELECTION"

		Application.trace(slot6, Application)

		return 
	end

	slot9 = true

	self._select_item(slot6, self, item)

	if self._on_click_callback then
		slot7 = data

		self._on_click_callback(slot6)
	end

	return 
end
function RaidGUIControlList:on_item_double_clicked(button, item, data, skip_select)
	slot7 = self

	if self.get_abort_selection(slot6) then
		slot8 = "[RaidGUIControlList:on_item_double_clicked] ABORT SELECTION"

		Application.trace(slot6, Application)

		return 
	end

	if not skip_select then
		slot8 = item

		self._select_item(slot6, self)
	end

	if self._on_double_click_callback then
		slot7 = data

		self._on_double_click_callback(slot6)
	end

	return 
end
function RaidGUIControlList:on_item_selected(item, data)
	slot5 = self

	if self.get_abort_selection(slot4) then
		slot6 = "[RaidGUIControlList:on_item_selected] ABORT SELECTION"

		Application.trace(slot4, Application)

		return 
	end

	if self._on_item_selected_callback then
		slot5 = data

		self._on_item_selected_callback(slot4)
	end

	return 
end
function RaidGUIControlList:refresh_data()
	local cached_selected_value = self._selected
	slot4 = self

	self._delete_items(slot3)

	slot4 = self

	self._create_items(slot3)

	self._selected = cached_selected_value

	return 
end
function RaidGUIControlList:set_selected(value, dont_trigger_selected_callback)
	if self._selected_item and self._selected then
		slot5 = self._selected_item

		self._selected_item.unfocus(slot4)
	end

	self._selected = value

	if self._selected then
		self._selected_item_idx = self._selected_item_idx or 1
		slot8 = true

		self.select_item_by_index(slot4, self, self._selected_item_idx, dont_trigger_selected_callback)
	end

	if not self._selected and self._list_items then
		slot5 = self._list_items

		for _, item in pairs(slot4) do
			if _ ~= self._selected_item_idx then
				slot10 = item

				item.unfocus(slot9)
			else
				slot10 = item

				item.highlight_off(slot9)
			end
		end
	end

	return 
end
function RaidGUIControlList:selected_item_index()
	return self._selected_item_idx
end
function RaidGUIControlList:move_up()
	slot3 = self

	if self.get_abort_selection(slot2) then
		slot4 = "[RaidGUIControlList:move_up] ABORT SELECTION"

		Application.trace(slot2, Application)

		return 
	end

	if self._selected then
		slot3 = self

		return self.select_previous_row(slot2)
	end

	return 
end
function RaidGUIControlList:select_previous_row()
	slot3 = self

	if self._previous_row_idx(slot2) then
		slot4 = self._selected_item_idx

		self.select_item_by_index(slot2, self)

		slot3 = self

		self._reposition_selected_item(slot2)

		return true
	end

	return 
end
function RaidGUIControlList:move_down()
	slot3 = self

	if self.get_abort_selection(slot2) then
		slot4 = "[RaidGUIControlList:move_down] ABORT SELECTION"

		Application.trace(slot2, Application)

		return 
	end

	if self._selected then
		slot3 = self
		local next_row_selected = self.select_next_row(slot2)

		if not next_row_selected then
			slot4 = self

			return RaidGUIControlList.super.move_down(slot3)
		end

		return next_row_selected
	end

	return 
end
function RaidGUIControlList:select_next_row()
	slot3 = self

	if self._next_row_idx(slot2) then
		slot4 = self._selected_item_idx

		self.select_item_by_index(slot2, self)

		slot3 = self

		self._reposition_selected_item(slot2)

		return true
	end

	return 
end
function RaidGUIControlList:confirm_pressed()
	if self._selected and self._selected_item then
		slot3 = self._selected_item

		self._selected_item.confirm_pressed(slot2)

		return true
	end

	return 
end
function RaidGUIControlList:special_btn_pressed(...)
	return 
end
function RaidGUIControlList:_previous_row_idx()
	self._new_selected_item_idx = self._selected_item_idx - 1

	if self._new_selected_item_idx <= 0 then
		if self._loop_items then
			for counter = #self._list_items, 1, -1 do
				slot7 = self._list_items[counter]

				if self._list_items[counter].enabled(slot6) then
					self._selected_item_idx = counter

					return true
				end
			end
		end
	else
		for counter = self._new_selected_item_idx, 1, -1 do
			slot7 = self._list_items[counter]

			if self._list_items[counter].enabled(slot6) then
				self._selected_item_idx = counter

				return true
			end
		end

		if self._loop_items then
			for counter = #self._list_items, self._selected_item_idx + 1, -1 do
				slot7 = self._list_items[counter]

				if self._list_items[counter].enabled(slot6) then
					self._selected_item_idx = counter

					return true
				end
			end
		end
	end

	return false
end
function RaidGUIControlList:_next_row_idx()
	self._new_selected_item_idx = self._selected_item_idx + 1

	if #self._list_items < self._new_selected_item_idx then
		if self._loop_items then
			for counter = 1, self._selected_item_idx - 1, 1 do
				slot7 = self._list_items[counter]

				if self._list_items[counter].enabled(slot6) then
					self._selected_item_idx = counter

					return true
				end
			end
		end
	else
		for counter = self._new_selected_item_idx, #self._list_items, 1 do
			slot7 = self._list_items[counter]

			if self._list_items[counter].enabled(slot6) then
				self._selected_item_idx = counter

				return true
			end
		end

		if self._loop_items then
			for counter = 1, self._selected_item_idx - 1, 1 do
				slot7 = self._list_items[counter]

				if self._list_items[counter].enabled(slot6) then
					self._selected_item_idx = counter

					return true
				end
			end
		end
	end

	return false
end

return 
