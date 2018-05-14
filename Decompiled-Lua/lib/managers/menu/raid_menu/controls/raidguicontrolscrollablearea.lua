if not RaidGUIControlScrollableArea then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlScrollableArea = slot0
RaidGUIControlScrollableArea.SCROLLBAR_WIDTH = 5
function RaidGUIControlScrollableArea:init(parent, params)
	slot7 = params

	RaidGUIControlScrollableArea.super.init(slot4, self, parent)

	self._scroll_step = params.scroll_step
	slot5 = self._params
	local outer_panel_params = clone(slot4)
	outer_panel_params.name = outer_panel_params.name .. "_outer"
	slot7 = outer_panel_params
	self._object = self._panel.panel("_outer", self._panel)
	local scrollbar_x_offset = self._params.scrollbar_offset or 0
	slot7 = self._params
	local inner_panel_params = clone(slot6)
	inner_panel_params.name = inner_panel_params.name .. "_inner"
	slot8 = self._object
	inner_panel_params.w = self._object.w("_inner") - RaidGUIControlScrollableArea.SCROLLBAR_WIDTH - scrollbar_x_offset
	inner_panel_params.scrollable = nil
	inner_panel_params.scroll_step = nil
	inner_panel_params.x = 0
	inner_panel_params.y = 0
	slot9 = inner_panel_params
	self._inner_panel = self._object.panel(RaidGUIControlScrollableArea.SCROLLBAR_WIDTH, self._object)
	slot8 = self._params
	local scrollbar_params = clone(RaidGUIControlScrollableArea.SCROLLBAR_WIDTH)
	scrollbar_params.x = inner_panel_params.w + scrollbar_x_offset
	scrollbar_params.y = 0
	scrollbar_params.w = self._params.scrollbar_width or RaidGUIControlScrollableArea.SCROLLBAR_WIDTH
	scrollbar_params.color = tweak_data.gui.colors.raid_dark_grey
	scrollbar_params.scrollable = nil
	scrollbar_params.scroll_step = nil
	scrollbar_params.name = inner_panel_params.name .. "_scrollbar"
	scrollbar_params.scroll_outer_panel = self._object
	scrollbar_params.scroll_inner_panel = self._inner_panel
	slot10 = scrollbar_params
	self._scrollbar = self._object.scrollbar("_scrollbar", self._object)

	return 
end
function RaidGUIControlScrollableArea:get_panel()
	return self._inner_panel
end
function RaidGUIControlScrollableArea:setup_scroll_area()
	slot4 = 0

	self._inner_panel.set_y(slot2, self._inner_panel)

	slot3 = self._inner_panel

	self._inner_panel.fit_content_height(slot2)

	slot4 = self._object

	if self._object.h(self._inner_panel) < self._inner_panel.h(slot2) then
		self._scrolling_enabled = true
		slot3 = self._scrollbar

		self._scrollbar.show(slot2)

		slot4 = 0

		self._scrollbar.set_y(slot2, self._scrollbar)

		slot5 = self._inner_panel
		slot3 = self._inner_panel.h(self._object)
		local scrollbar_h = self._object.h(slot2) * self._object.h(self._object) / slot3
		slot5 = scrollbar_h

		self._scrollbar.set_h(slot3, self._scrollbar)

		slot4 = self._scrollbar

		self._scrollbar.set_scroller_path_height(slot3)
	else
		self._scrolling_enabled = false
		slot3 = self._scrollbar

		self._scrollbar.hide(slot2)
	end

	if self._inner_panel._controls then
		slot3 = self._inner_panel._controls

		for control_index, control in pairs(slot2) do
			slot8 = control

			control.scrollable_area_post_setup(slot7)
		end
	end

	return 
end
function RaidGUIControlScrollableArea:move_scrollbar_manually()
	local new_y = self._inner_panel.y(slot2)
	local ep_h = self._inner_panel.h(self._inner_panel)
	slot6 = new_y

	self._inner_panel.set_y(self._inner_panel, self._inner_panel)

	local scroll_y = self._object.h(self._inner_panel) * -new_y / ep_h
	slot7 = scroll_y

	self._scrollbar.set_y(self._object, self._scrollbar)

	return 
end
function RaidGUIControlScrollableArea:mouse_scroll_up(o, button, x, y)
	if self._scrolling_enabled then
		local ep_h = self._inner_panel.h(slot6)
		local top_clip_y = -self._inner_panel.y(self._inner_panel)
		slot11 = self._scroll_step
		local scroll_move = math.clamp(self._inner_panel, top_clip_y, 0)
		local new_y = self._inner_panel.y(top_clip_y) + scroll_move
		slot12 = new_y

		self._inner_panel.set_y(self._inner_panel, self._inner_panel)

		local scroll_y = self._object.h(self._inner_panel) * -new_y / ep_h
		slot13 = scroll_y

		self._scrollbar.set_y(self._object, self._scrollbar)

		return 
	end

	slot11 = y

	return self._inner_panel.mouse_scroll_up(slot6, self._inner_panel, o, button, x)
end
function RaidGUIControlScrollableArea:mouse_scroll_down(o, button, x, y)
	if self._scrolling_enabled then
		local ep_y = self._inner_panel.y(slot6)
		local ep_h = self._inner_panel.h(self._inner_panel)
		local s_h = self._object.h(self._inner_panel)
		slot11 = self._inner_panel
		slot11 = self._object
		local bottom_clip_y = (self._inner_panel.y(self._object) + self._inner_panel.h(self._inner_panel)) - self._object.h(self._inner_panel)
		slot13 = self._scroll_step
		local scroll_move = math.clamp(self._inner_panel, bottom_clip_y, 0)
		local new_y = self._inner_panel.y(bottom_clip_y) - scroll_move
		slot14 = new_y

		self._inner_panel.set_y(self._inner_panel, self._inner_panel)

		local scroll_y = self._object.h(self._inner_panel) * -new_y / ep_h
		slot15 = scroll_y

		self._scrollbar.set_y(self._object, self._scrollbar)

		return 
	end

	slot11 = y

	return self._inner_panel.mouse_scroll_down(slot6, self._inner_panel, o, button, x)
end
function RaidGUIControlScrollableArea:scroll_up()
	if self._scrolling_enabled then
		local ep_h = self._inner_panel.h(slot2)
		local top_clip_y = -self._inner_panel.y(self._inner_panel)
		slot7 = self._scroll_step
		local scroll_move = math.clamp(self._inner_panel, top_clip_y, 0)
		local new_y = self._inner_panel.y(top_clip_y) + scroll_move
		slot8 = new_y

		self._inner_panel.set_y(self._inner_panel, self._inner_panel)

		local scroll_y = self._object.h(self._inner_panel) * -new_y / ep_h
		slot9 = scroll_y

		self._scrollbar.set_y(self._object, self._scrollbar)

		return 
	end

	return 
end
function RaidGUIControlScrollableArea:scroll_down()
	if self._scrolling_enabled then
		local ep_y = self._inner_panel.y(slot2)
		local ep_h = self._inner_panel.h(self._inner_panel)
		local s_h = self._object.h(self._inner_panel)
		slot7 = self._inner_panel
		slot7 = self._object
		local bottom_clip_y = (self._inner_panel.y(self._object) + self._inner_panel.h(self._inner_panel)) - self._object.h(self._inner_panel)
		slot9 = self._scroll_step
		local scroll_move = math.clamp(self._inner_panel, bottom_clip_y, 0)
		local new_y = self._inner_panel.y(bottom_clip_y) - scroll_move
		slot10 = new_y

		self._inner_panel.set_y(self._inner_panel, self._inner_panel)

		local scroll_y = self._object.h(self._inner_panel) * -new_y / ep_h
		slot11 = scroll_y

		self._scrollbar.set_y(self._object, self._scrollbar)

		return 
	end

	return 
end
function RaidGUIControlScrollableArea:highlight_on()
	return 
end
function RaidGUIControlScrollableArea:highlight_off()
	return 
end

return 
