if not RaidGUIControlScrollbar then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlScrollbar = slot0
RaidGUIControlScrollbar.SCROLLBAR_WIDTH = 5
function RaidGUIControlScrollbar:init(parent, params)
	slot7 = params

	RaidGUIControlScrollbar.super.init(slot4, self, parent)

	slot6 = params
	self._object = self._parent.panel(slot4, self._parent)
	slot6 = {
		color = tweak_data.gui.colors.raid_dark_grey
	}
	self._scrollbar_rect = self._object.rect(slot4, self._object)

	return 
end
function RaidGUIControlScrollbar:close()
	RaidGUIControlScrollbar.super.close()

	self._dragging = false

	return 
end
function RaidGUIControlScrollbar:set_y(y)
	slot5 = y

	self._object.set_y(slot3, self._object)

	return 
end
function RaidGUIControlScrollbar:set_scroller_path_height()
	slot4 = self._object
	self._scroller_path_height = self._params.scroll_outer_panel.h(slot2) - self._object.bottom(self._params.scroll_outer_panel)
	slot3 = self._object
	self._scroller_path_start = self._object.bottom(self._object.bottom(self._params.scroll_outer_panel))

	return 
end
function RaidGUIControlScrollbar:mouse_moved(o, x, y)
	slot9 = y

	RaidGUIControlScrollbar.super.mouse_moved(slot5, self, o, x)

	return 
end
function RaidGUIControlScrollbar:on_mouse_moved(o, x, y)
	if not self._dragging then
		return 
	end

	if not self._last_y then
		self._last_y = y
	end

	local dy = y - self._last_y
	self._last_y = self._last_y + dy
	slot7 = self
	slot10 = dy

	self.set_bottom_by_y_coord(slot6, math.floor(slot9))

	return 
end
function RaidGUIControlScrollbar:on_mouse_out()
	self._pointer_type = "link"
	self._dragging = false

	return 
end
function RaidGUIControlScrollbar:on_mouse_pressed()
	slot3 = managers.raid_menu
	self._old_active_control = managers.raid_menu.get_active_control(slot2)
	slot4 = self

	managers.raid_menu.set_active_control(slot2, managers.raid_menu)

	self._dragging = true

	return 
end
function RaidGUIControlScrollbar:on_mouse_released()
	slot4 = self._old_active_control

	managers.raid_menu.set_active_control(slot2, managers.raid_menu)

	self._dragging = false

	return true
end
function RaidGUIControlScrollbar:set_bottom_by_y_coord(dy)
	slot7 = self._object
	slot5 = self._object.y(slot6) + dy

	self._object.set_y(slot3, self._object)

	slot5 = self._params.scroll_outer_panel

	if self._params.scroll_outer_panel.h(self._object) < self._object.bottom(slot3) then
		slot4 = self._object
		slot7 = self._params.scroll_outer_panel

		self._object.set_bottom(slot3, self._params.scroll_outer_panel.h(slot6))
	end

	slot4 = self._object

	if self._object.top(slot3) < 0 then
		slot5 = 0

		self._object.set_top(slot3, self._object)
	end

	slot4 = self._object
	local scroller_bottom_position = self._object.bottom(slot3)
	local scroller_current_path_percentage = (scroller_bottom_position - self._scroller_path_start) / self._scroller_path_height
	slot10 = self._params.scroll_inner_panel
	slot7 = (self._params.scroll_outer_panel.h(slot8) - self._params.scroll_inner_panel.h(self._params.scroll_outer_panel)) * scroller_current_path_percentage

	self._params.scroll_inner_panel.set_y(slot5, self._params.scroll_inner_panel)

	return 
end

return 
