-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not RaidGUIControlTabs then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlTabs = slot0
RaidGUIControlTabs.DEFAULT_HEIGHT = 64
RaidGUIControlTabs.BOTTOM_LINE_HEIGHT = 5
RaidGUIControlTabs.ACTIVE_LINE_COLOR = tweak_data.gui.colors.raid_red
function RaidGUIControlTabs:init(parent, params)
	slot7 = params

	RaidGUIControlTabs.super.init(slot4, self, parent)

	if not self._params.tab_width then
		slot5 = parent
		slot3 = parent.w(slot4) / #self._params.tabs_params
	end

	self._tab_width = slot3
	self._tab_height = self._params.tab_height or RaidGUIControlTabs.DEFAULT_HEIGHT
	local panel_params = {
		name = "tabs_control",
		x = self._params.x,
		y = self._params.y,
		w = self._tab_width * #self._params.tabs_params,
		h = self._tab_height
	}
	slot6 = self._panel
	panel_params.layer = self._panel.layer(#self._params.tabs_params) + 1
	slot7 = panel_params
	self._object = self._panel.panel(#self._params.tabs_params, self._panel)

	if self._params.icon then
		slot7 = {
			name = "tabs_control_icon_title",
			y = 0,
			vertical = "center",
			x = 0,
			w = self._params.icon.texture_rect[3],
			h = self._params.icon.texture_rect[4],
			texture = self._params.icon.texture,
			texture_rect = self._params.icon.texture_rect
		}
		self._icon_title = self._object.image(slot5, self._object)
		slot10 = self._icon_title
		slot7 = self._object.w(self._params.icon.texture_rect) + self._icon_title.w(self._object)

		self._object.set_w(slot5, self._object)
	end

	self._on_click_callback = self._params.on_click_callback
	self._item_class = self._params.item_class or RaidGUIControlTab
	self._items = {}
	self._initial_tab_idx = self._params.initial_tab_idx or 1
	slot6 = self

	self._create_items(slot5)

	if self._item_class.needs_bottom_line() then
		slot6 = self

		self._create_bottom_line(slot5)
	end

	slot7 = self._initial_tab_idx

	self._initial_tab_selected(slot5, self)

	self._dont_trigger_special_buttons = self._params.dont_trigger_special_buttons or false
	self._abort_selection = false

	return 
end
function RaidGUIControlTabs:_create_items()
	if self._params.tabs_params then
		slot3 = self._params.tabs_params

		for index, tab_params in ipairs(slot2) do

			-- Decompilation error in this vicinity:
			slot6 = (index - 1) * self._tab_width
			slot10 = item

			table.insert(slot8, self._items)
		end
	end

	return 
end
function RaidGUIControlTabs:_create_bottom_line()
	local bottom_line_params = {
		name = "bottom_line",
		x = (self._initial_tab_idx - 1) * self._tab_width
	}
	slot4 = self._object
	bottom_line_params.y = self._object.h(self._tab_width) - RaidGUIControlTabs.BOTTOM_LINE_HEIGHT
	bottom_line_params.w = self._tab_width
	bottom_line_params.h = RaidGUIControlTabs.BOTTOM_LINE_HEIGHT
	bottom_line_params.color = RaidGUIControlTabs.ACTIVE_LINE_COLOR
	slot4 = self._object
	bottom_line_params.layer = self._object.layer(RaidGUIControlTabs.BOTTOM_LINE_HEIGHT) + 3
	slot5 = bottom_line_params
	self._bottom_line = self._object.rect(RaidGUIControlTabs.BOTTOM_LINE_HEIGHT, self._object)
	self._line_movement_t = 0

	return 
end
function RaidGUIControlTabs:_initial_tab_selected(tab_idx)
	slot4 = self._items

	for tab_index, tab in ipairs(slot3) do
		if tab_index == tab_idx then
			slot9 = tab

			tab.select(slot8)
		else
			slot9 = tab

			tab.unselect(slot8)
		end

		self._selected_item_idx = tab_idx
	end

	return 
end
function RaidGUIControlTabs:_tab_selected(tab_idx, callback_param)
	slot5 = self

	if self.get_abort_selection(slot4) then
		slot6 = "[RaidGUIControlTabs:_tab_selected] ABORT SELECTION"

		Application.trace(slot4, Application)

		return 
	end

	slot6 = tab_idx

	self._initial_tab_selected(slot4, self)

	slot5 = callback_param

	self._on_click_callback(slot4)

	if self._bottom_line then
		slot5 = self._bottom_line

		self._bottom_line.stop(slot4)

		self._line_movement_t = 0
		slot5 = self._bottom_line
		slot10 = "_move_bottom_line"

		self._bottom_line.animate(slot4, callback(slot7, self, self))
	end

	return 
end
function RaidGUIControlTabs:_unselect_all()
	slot3 = self._items

	for _, item in ipairs(slot2) do
		slot8 = item

		item.unselect(slot7)
	end

	return 
end
function RaidGUIControlTabs:set_abort_selection(value)
	self._abort_selection = value

	return 
end
function RaidGUIControlTabs:get_abort_selection()
	return self._abort_selection
end
function RaidGUIControlTabs:set_selected(value)
	self._selected = value
	slot4 = self

	self._unselect_all(slot3)

	if self._selected then
		self._selected_item_idx = self._selected_item_idx or self._initial_tab_idx
		local callback_param = self._items[self._selected_item_idx].get_callback_param(self._selected_item_idx)
		slot7 = callback_param

		self._tab_selected(self._items[self._selected_item_idx], self, self._selected_item_idx)
	end

	return 
end
function RaidGUIControlTabs:move_up()
	if self._selected and self._on_menu_move and self._on_menu_move.up then
		slot4 = self._on_menu_move.up
		local result, target = self._menu_move_to(slot2, self)

		return result, target
	end

	return 
end
function RaidGUIControlTabs:move_down()
	if self._selected and self._on_menu_move and self._on_menu_move.down then
		slot4 = self._on_menu_move.down
		local result, target = self._menu_move_to(slot2, self)

		return result, target
	end

	return 
end
function RaidGUIControlTabs:_move_left()
	if not self._enabled then
		return 
	end

	if self._selected_item_idx <= 1 then
		self._selected_item_idx = 1

		return true
	else
		self._selected_item_idx = self._selected_item_idx - 1
	end

	local callback_param = self._items[self._selected_item_idx].get_callback_param(self._selected_item_idx)
	slot6 = callback_param

	self._tab_selected(self._items[self._selected_item_idx], self, self._selected_item_idx)

	return true
end
function RaidGUIControlTabs:_move_right()
	if not self._enabled then
		return 
	end

	if self._selected_item_idx == #self._items then
		return true
	else
		self._selected_item_idx = self._selected_item_idx + 1
	end

	local callback_param = self._items[self._selected_item_idx].get_callback_param(self._selected_item_idx)
	slot6 = callback_param

	self._tab_selected(self._items[self._selected_item_idx], self, self._selected_item_idx)

	return true
end
function RaidGUIControlTabs:_move_bottom_line()
	local duration = 0.2
	local t = duration - (1 - self._line_movement_t) * duration
	slot5 = self._bottom_line
	local original_x = self._bottom_line.x(slot4)

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot10 = duration
		local current_x = Easing.quartic_in_out(slot6, t, original_x, (self._selected_item_idx - 1) * self._tab_width - original_x)
		slot9 = current_x

		self._bottom_line.set_x(t, self._bottom_line)

		self._line_movement_t = t / duration
	end

	slot7 = (self._selected_item_idx - 1) * self._tab_width

	self._bottom_line.set_x(slot5, self._bottom_line)

	self._line_movement_t = 1

	return 
end

return 
