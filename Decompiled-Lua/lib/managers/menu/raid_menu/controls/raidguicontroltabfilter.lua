if not RaidGUIControlTabFilter then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlTabFilter = slot0
RaidGUIControlTabFilter.PADDING = 16
RaidGUIControlTabFilter.BOTTOM_LINE_NORMAL_HEIGHT = 2
RaidGUIControlTabFilter.BOTTOM_LINE_ACTIVE_HEIGHT = 5
RaidGUIControlTabFilter.DIVIDER_WIDTH = 2
RaidGUIControlTabFilter.DIVIDER_HEIGHT = 14
function RaidGUIControlTabFilter:init(parent, params)
	slot7 = params

	RaidGUIControlTabFilter.super.init(slot4, self, parent)

	slot6 = {
		name = "tab_panel_" .. self._name,
		x = params.x,
		y = params.y,
		w = params.w,
		h = params.h,
		layer = parent.layer(self._name) + 1
	}
	slot9 = parent
	self._object = parent.panel(slot4, parent)
	slot6 = {
		vertical = "center",
		align = "center",
		y = 0,
		x = 0,
		name = "tab_control_label_" .. self._name,
		w = params.w,
		h = params.h,
		text = params.text,
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.extra_small,
		color = tweak_data.gui.colors.raid_grey,
		layer = self._object.layer(self._name) + 1
	}
	slot9 = self._object
	self._tab_label = self._object.label(slot4, self._object)
	self._callback_param = params.callback_param
	self._tab_select_callback = params.tab_select_callback
	self._selected = false

	return 
end
function RaidGUIControlTabFilter:needs_divider()
	return true
end
function RaidGUIControlTabFilter:needs_bottom_line()
	return false
end
function RaidGUIControlTabFilter:set_divider()
	slot4 = {
		x = self._tab_label.right(slot6) - RaidGUIControlTabFilter.DIVIDER_WIDTH / 2,
		y = (self._params.h - RaidGUIControlTabFilter.DIVIDER_HEIGHT) / 2,
		w = RaidGUIControlTabFilter.DIVIDER_WIDTH,
		h = RaidGUIControlTabFilter.DIVIDER_HEIGHT,
		color = tweak_data.gui.colors.raid_grey
	}
	slot7 = self._tab_label
	self._divider = self._object.rect(slot2, self._object)

	return 
end
function RaidGUIControlTabFilter:get_callback_param()
	return self._callback_param
end
function RaidGUIControlTabFilter:highlight_on()
	return 
end
function RaidGUIControlTabFilter:highlight_off()
	return 
end
function RaidGUIControlTabFilter:select()
	slot4 = tweak_data.gui.colors.raid_white

	self._tab_label.set_color(slot2, self._tab_label)

	self._selected = true

	return 
end
function RaidGUIControlTabFilter:unselect()
	slot4 = tweak_data.gui.colors.raid_grey

	self._tab_label.set_color(slot2, self._tab_label)

	self._selected = false

	return 
end
function RaidGUIControlTabFilter:mouse_released(o, button, x, y)
	slot10 = y

	self.on_mouse_released(slot6, self, button, x)

	return true
end
function RaidGUIControlTabFilter:on_mouse_released(button, x, y)
	if self._params.tab_select_callback then
		slot7 = self._callback_param

		self._params.tab_select_callback(slot5, self._params.tab_idx)
	end

	return true
end

return 
