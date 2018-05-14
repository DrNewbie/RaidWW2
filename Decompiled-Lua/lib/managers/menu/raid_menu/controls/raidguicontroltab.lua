if not RaidGUIControlTab then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlTab = slot0
RaidGUIControlTab.PADDING = 16
RaidGUIControlTab.INACTIVE_COLOR = tweak_data.gui.colors.raid_grey
RaidGUIControlTab.ACTIVE_LINE_COLOR = tweak_data.gui.colors.raid_red
RaidGUIControlTab.ACTIVE_TEXT_COLOR = tweak_data.gui.colors.raid_white
RaidGUIControlTab.BOTTOM_LINE_NORMAL_HEIGHT = 2
RaidGUIControlTab.BOTTOM_LINE_ACTIVE_HEIGHT = 5
RaidGUIControlTab.BOTTOM_LINE_INACTIVE_ALPHA = 0.25
RaidGUIControlTab.BOTTOM_LINE_ACTIVE_ALPHA = 1
function RaidGUIControlTab:init(parent, params)
	slot7 = params

	RaidGUIControlTab.super.init(slot4, self, parent)

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
	local label_coord_x = 0
	local label_width = params.w

	if params.icon then
		slot8 = {
			vertical = "center",
			y = 0,
			name = "tab_control_icon_" .. self._name,
			x = RaidGUIControlTab.PADDING,
			w = params.icon.texture_rect[3],
			h = params.icon.texture_rect[4],
			texture = params.icon.texture,
			texture_rect = params.icon.texture_rect,
			color = RaidGUIControlTab.INACTIVE_COLOR,
			layer = self._object.layer(self._name) + 1
		}
		slot11 = self._object
		self._tab_icon = self._object.image(slot6, self._object)
		slot8 = self._tab_icon
		label_coord_x = self._tab_icon.x(slot6) + self._tab_icon.w(self._tab_icon) + RaidGUIControlTab.PADDING
		slot7 = self._tab_icon
		label_width = label_width - self._tab_icon.w(RaidGUIControlTab.PADDING) - 2 * RaidGUIControlTab.PADDING
	end

	slot8 = {
		vertical = "center",
		y = 0,
		name = "tab_control_label_" .. self._name,
		x = label_coord_x,
		w = label_width,
		h = params.h,
		text = params.text,
		font = tweak_data.gui.fonts.din_compressed,
		font_size = self._params.tab_font_size or tweak_data.gui.font_sizes.large,
		color = RaidGUIControlTab.INACTIVE_COLOR,
		layer = self._object.layer(slot10) + 1
	}
	slot11 = self._object
	self._tab_label = self._object.label(slot6, self._object)

	if params.tab_align then
		slot8 = params.tab_align

		self._tab_label.set_align(slot6, self._tab_label)
	end

	self._callback_param = params.callback_param
	self._tab_select_callback = params.tab_select_callback
	slot8 = {
		name = "tab_control_bottom_line",
		x = 0,
		y = params.h - RaidGUIControlTab.BOTTOM_LINE_NORMAL_HEIGHT,
		w = params.w,
		h = RaidGUIControlTab.BOTTOM_LINE_NORMAL_HEIGHT,
		color = RaidGUIControlTab.INACTIVE_COLOR
	}
	self._bottom_line = self._object.rect(slot6, self._object)
	slot8 = RaidGUIControlTab.BOTTOM_LINE_INACTIVE_ALPHA

	self._bottom_line.set_alpha(slot6, self._bottom_line)

	self._selected = false
	self._highlight_t = 0
	self._select_t = 0

	if params.breadcrumb then
		slot7 = self

		self._layout_breadcrumb(slot6)
	end

	return 
end
function RaidGUIControlTab:_layout_breadcrumb()
	self._params.breadcrumb.padding = 0
	slot4 = self._params.breadcrumb
	self._breadcrumb = self._object.breadcrumb(0, self._object)
	slot3 = self._breadcrumb
	slot6 = self._object

	self._breadcrumb.set_right(0, self._object.w(slot5))

	slot6 = self._object
	slot4 = self._object.h(slot5) / 2

	self._breadcrumb.set_center_y(0, self._breadcrumb)

	return 
end
function RaidGUIControlTab:needs_divider()
	return false
end
function RaidGUIControlTab:needs_bottom_line()
	return true
end
function RaidGUIControlTab:get_callback_param()
	return self._callback_param
end
function RaidGUIControlTab:highlight_on()
	slot3 = self._bottom_line

	self._bottom_line.stop(slot2)

	slot3 = self._bottom_line
	slot8 = "_animate_highlight_on"

	self._bottom_line.animate(slot2, callback(slot5, self, self))

	return 
end
function RaidGUIControlTab:highlight_off()
	if not self._selected then
		slot3 = self._bottom_line

		self._bottom_line.stop(slot2)

		slot3 = self._bottom_line
		slot8 = "_animate_highlight_off"

		self._bottom_line.animate(slot2, callback(slot5, self, self))
	end

	return 
end
function RaidGUIControlTab:select()
	slot3 = self._tab_label._object

	self._tab_label._object.stop(slot2)

	slot3 = self._tab_label._object
	slot8 = "_animate_select"

	self._tab_label._object.animate(slot2, callback(slot5, self, self))

	slot4 = RaidGUIControlTab.ACTIVE_LINE_COLOR

	self._bottom_line.set_color(slot2, self._bottom_line)

	slot4 = RaidGUIControlTab.BOTTOM_LINE_ACTIVE_ALPHA

	self._bottom_line.set_alpha(slot2, self._bottom_line)

	self._selected = true

	return 
end
function RaidGUIControlTab:unselect()
	slot3 = self._tab_label._object

	self._tab_label._object.stop(slot2)

	slot3 = self._tab_label._object
	slot8 = "_animate_deselect"

	self._tab_label._object.animate(slot2, callback(slot5, self, self))

	slot4 = RaidGUIControlTab.INACTIVE_COLOR

	self._bottom_line.set_color(slot2, self._bottom_line)

	slot4 = RaidGUIControlTab.BOTTOM_LINE_INACTIVE_ALPHA

	self._bottom_line.set_alpha(slot2, self._bottom_line)

	self._selected = false

	return 
end
function RaidGUIControlTab:mouse_released(o, button, x, y)
	slot10 = y

	self.on_mouse_released(slot6, self, button, x)

	return true
end
function RaidGUIControlTab:on_mouse_released(button, x, y)
	if self._params.tab_select_callback then
		slot7 = self._callback_param

		self._params.tab_select_callback(slot5, self._params.tab_idx)
	end

	return true
end
function RaidGUIControlTab:_animate_highlight_on()
	local duration = 0.3
	local t = duration - (1 - self._highlight_t) * duration

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot9 = duration
		local color_r = Easing.quartic_out(slot5, t, RaidGUIControlTab.INACTIVE_COLOR.r, RaidGUIControlTab.ACTIVE_LINE_COLOR.r - RaidGUIControlTab.INACTIVE_COLOR.r)
		slot10 = duration
		local color_g = Easing.quartic_out(t, t, RaidGUIControlTab.INACTIVE_COLOR.g, RaidGUIControlTab.ACTIVE_LINE_COLOR.g - RaidGUIControlTab.INACTIVE_COLOR.g)
		slot11 = duration
		local color_b = Easing.quartic_out(t, t, RaidGUIControlTab.INACTIVE_COLOR.b, RaidGUIControlTab.ACTIVE_LINE_COLOR.b - RaidGUIControlTab.INACTIVE_COLOR.b)
		local current_alpha = Easing.quartic_out(t, t, RaidGUIControlTab.BOTTOM_LINE_INACTIVE_ALPHA, RaidGUIControlTab.BOTTOM_LINE_ACTIVE_ALPHA - RaidGUIControlTab.BOTTOM_LINE_INACTIVE_ALPHA)
		slot10 = self._bottom_line
		slot15 = color_b

		self._bottom_line.set_color(t, Color(duration, color_r, color_g))

		slot11 = current_alpha

		self._bottom_line.set_alpha(t, self._bottom_line)

		self._highlight_t = t / duration
	end

	slot6 = RaidGUIControlTab.ACTIVE_LINE_COLOR

	self._bottom_line.set_color(slot4, self._bottom_line)

	slot6 = RaidGUIControlTab.BOTTOM_LINE_ACTIVE_ALPHA

	self._bottom_line.set_alpha(slot4, self._bottom_line)

	self._highlight_t = 1

	return 
end
function RaidGUIControlTab:_animate_highlight_off()
	local duration = 0.2
	local t = duration - self._highlight_t * duration

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot9 = duration
		local color_r = Easing.quartic_in(slot5, t, RaidGUIControlTab.ACTIVE_LINE_COLOR.r, RaidGUIControlTab.INACTIVE_COLOR.r - RaidGUIControlTab.ACTIVE_LINE_COLOR.r)
		slot10 = duration
		local color_g = Easing.quartic_in(t, t, RaidGUIControlTab.ACTIVE_LINE_COLOR.g, RaidGUIControlTab.INACTIVE_COLOR.g - RaidGUIControlTab.ACTIVE_LINE_COLOR.g)
		slot11 = duration
		local color_b = Easing.quartic_in(t, t, RaidGUIControlTab.ACTIVE_LINE_COLOR.b, RaidGUIControlTab.INACTIVE_COLOR.b - RaidGUIControlTab.ACTIVE_LINE_COLOR.b)
		local current_alpha = Easing.quartic_in(t, t, RaidGUIControlTab.BOTTOM_LINE_ACTIVE_ALPHA, RaidGUIControlTab.BOTTOM_LINE_INACTIVE_ALPHA - RaidGUIControlTab.BOTTOM_LINE_ACTIVE_ALPHA)
		slot10 = self._bottom_line
		slot15 = color_b

		self._bottom_line.set_color(t, Color(duration, color_r, color_g))

		slot11 = current_alpha

		self._bottom_line.set_alpha(t, self._bottom_line)

		self._highlight_t = 1 - t / duration
	end

	slot6 = RaidGUIControlTab.INACTIVE_COLOR

	self._bottom_line.set_color(slot4, self._bottom_line)

	slot6 = RaidGUIControlTab.BOTTOM_LINE_INACTIVE_ALPHA

	self._bottom_line.set_alpha(slot4, self._bottom_line)

	self._highlight_t = 0

	return 
end
function RaidGUIControlTab:_animate_select()
	local duration = 0.3
	local t = duration - (1 - self._select_t) * duration

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot9 = duration
		local color_r = Easing.quartic_out(slot5, t, RaidGUIControlTab.INACTIVE_COLOR.r, RaidGUIControlTab.ACTIVE_TEXT_COLOR.r - RaidGUIControlTab.INACTIVE_COLOR.r)
		slot10 = duration
		local color_g = Easing.quartic_out(t, t, RaidGUIControlTab.INACTIVE_COLOR.g, RaidGUIControlTab.ACTIVE_TEXT_COLOR.g - RaidGUIControlTab.INACTIVE_COLOR.g)
		slot11 = duration
		local color_b = Easing.quartic_out(t, t, RaidGUIControlTab.INACTIVE_COLOR.b, RaidGUIControlTab.ACTIVE_TEXT_COLOR.b - RaidGUIControlTab.INACTIVE_COLOR.b)

		if self._tab_icon then
			slot9 = self._tab_icon
			slot14 = color_b

			self._tab_icon.set_color(slot8, Color(slot11, color_r, color_g))
		end

		slot9 = self._tab_label
		slot14 = color_b

		self._tab_label.set_color(slot8, Color(slot11, color_r, color_g))

		self._select_t = t / duration
	end

	if self._tab_icon then
		slot6 = RaidGUIControlTab.ACTIVE_TEXT_COLOR

		self._tab_icon.set_color(slot4, self._tab_icon)
	end

	slot6 = RaidGUIControlTab.ACTIVE_TEXT_COLOR

	self._tab_label.set_color(slot4, self._tab_label)

	self._select_t = 1

	return 
end
function RaidGUIControlTab:_animate_deselect()
	local duration = 0.3
	local t = duration - self._select_t * duration

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot9 = duration
		local color_r = Easing.quartic_out(slot5, t, RaidGUIControlTab.ACTIVE_TEXT_COLOR.r, RaidGUIControlTab.INACTIVE_COLOR.r - RaidGUIControlTab.ACTIVE_TEXT_COLOR.r)
		slot10 = duration
		local color_g = Easing.quartic_out(t, t, RaidGUIControlTab.ACTIVE_TEXT_COLOR.g, RaidGUIControlTab.INACTIVE_COLOR.g - RaidGUIControlTab.ACTIVE_TEXT_COLOR.g)
		slot11 = duration
		local color_b = Easing.quartic_out(t, t, RaidGUIControlTab.ACTIVE_TEXT_COLOR.b, RaidGUIControlTab.INACTIVE_COLOR.b - RaidGUIControlTab.ACTIVE_TEXT_COLOR.b)

		if self._tab_icon then
			slot9 = self._tab_icon
			slot14 = color_b

			self._tab_icon.set_color(slot8, Color(slot11, color_r, color_g))
		end

		slot9 = self._tab_label
		slot14 = color_b

		self._tab_label.set_color(slot8, Color(slot11, color_r, color_g))

		self._select_t = 1 - t / duration
	end

	if self._tab_icon then
		slot6 = RaidGUIControlTab.INACTIVE_COLOR

		self._tab_icon.set_color(slot4, self._tab_icon)
	end

	slot6 = RaidGUIControlTab.INACTIVE_COLOR

	self._tab_label.set_color(slot4, self._tab_label)

	self._select_t = 0

	return 
end

return 
