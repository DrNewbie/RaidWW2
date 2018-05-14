-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not RaidGUIControlButtonSwitch then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlButtonSwitch = slot0
RaidGUIControlButtonSwitch.HEIGHT = 66
RaidGUIControlButtonSwitch.TEXT_FONT = tweak_data.gui.fonts.din_compressed
RaidGUIControlButtonSwitch.TEXT_FONT_SIZE = tweak_data.gui.font_sizes.size_16
RaidGUIControlButtonSwitch.TEXT_COLOR = tweak_data.gui.colors.raid_grey
RaidGUIControlButtonSwitch.TEXT_HIGHLIGHT_COLOR = tweak_data.gui.colors.raid_red
RaidGUIControlButtonSwitch.SWITCH_Y = 30
RaidGUIControlButtonSwitch.SWITCH_BORDER_ICON = "switch_bg"
RaidGUIControlButtonSwitch.SWITCH_BORDER_W = tweak_data.gui.icons[RaidGUIControlButtonSwitch.SWITCH_BORDER_ICON].texture_rect[3]
RaidGUIControlButtonSwitch.SWITCH_BORDER_H = tweak_data.gui.icons[RaidGUIControlButtonSwitch.SWITCH_BORDER_ICON].texture_rect[4]
RaidGUIControlButtonSwitch.SWITCH_BORDER_COLOR = tweak_data.gui.colors.raid_grey
RaidGUIControlButtonSwitch.SWITCH_BORDER_HIGHLIGHT_COLOR = tweak_data.gui.colors.raid_red
RaidGUIControlButtonSwitch.THUMB_ICON = "switch_thumb"
RaidGUIControlButtonSwitch.THUMB_W = tweak_data.gui.icons[RaidGUIControlButtonSwitch.THUMB_ICON].texture_rect[3]
RaidGUIControlButtonSwitch.THUMB_H = tweak_data.gui.icons[RaidGUIControlButtonSwitch.THUMB_ICON].texture_rect[4]
RaidGUIControlButtonSwitch.THUMB_COLOR_OFF = tweak_data.gui.colors.raid_grey
RaidGUIControlButtonSwitch.THUMB_COLOR_ON = tweak_data.gui.colors.raid_red
RaidGUIControlButtonSwitch.THUMB_COLOR_HIGHLIGHT = tweak_data.gui.colors.raid_red
function RaidGUIControlButtonSwitch:init(parent, params)
	slot7 = params

	RaidGUIControlButtonSwitch.super.init(slot4, self, parent)

	slot3 = self._params

	if not self._params.w then
		slot6 = self._panel
		slot4 = self._panel.w(slot5)
	end

	slot3.w = slot4
	self._params.h = RaidGUIControlButtonSwitch.HEIGHT
	slot6 = self._params
	self._object = self._panel.panel(RaidGUIControlButtonSwitch.HEIGHT, self._panel)
	slot6 = {
		vertical = "top",
		y = 0,
		x = 0,
		w = self._object.w(slot8),
		h = self._object.h(slot8),
		align = params.text_align or "center",
		color = RaidGUIControlButtonSwitch.TEXT_COLOR,
		font = RaidGUIControlButtonSwitch.TEXT_FONT,
		font_size = RaidGUIControlButtonSwitch.TEXT_FONT_SIZE,
		text = params.description,
		layer = self._object.layer(slot8) + 1
	}
	slot9 = self._object
	slot9 = self._object
	slot9 = self._object
	self._description = self._object.text(slot4, self._object)
	local switch_panel_params = {}
	slot6 = self._object
	switch_panel_params.x = self._object.w(self._object) - RaidGUIControlButtonSwitch.SWITCH_BORDER_W
	switch_panel_params.y = RaidGUIControlButtonSwitch.SWITCH_Y
	switch_panel_params.w = RaidGUIControlButtonSwitch.SWITCH_BORDER_W
	switch_panel_params.h = RaidGUIControlButtonSwitch.SWITCH_BORDER_H
	slot7 = switch_panel_params
	self._switch_panel = self._object.panel(RaidGUIControlButtonSwitch.SWITCH_BORDER_W, self._object)
	local switch_border_params = {
		halign = "scale",
		valign = "scale",
		y = 0,
		x = 0,
		texture = tweak_data.gui.icons[RaidGUIControlButtonSwitch.SWITCH_BORDER_ICON].texture,
		texture_rect = tweak_data.gui.icons[RaidGUIControlButtonSwitch.SWITCH_BORDER_ICON].texture_rect,
		w = RaidGUIControlButtonSwitch.SWITCH_BORDER_W,
		h = RaidGUIControlButtonSwitch.SWITCH_BORDER_H,
		layer = self._object.layer(RaidGUIControlButtonSwitch.SWITCH_BORDER_ICON),
		color = RaidGUIControlButtonSwitch.SWITCH_BORDER_COLOR
	}
	slot8 = switch_border_params
	self._border = self._switch_panel.bitmap(RaidGUIControlButtonSwitch.SWITCH_BORDER_ICON, self._switch_panel)
	local switch_params = {
		halign = "scale",
		valign = "scale",
		y = 0,
		x = 1,
		texture = tweak_data.gui.icons[RaidGUIControlButtonSwitch.THUMB_ICON].texture,
		texture_rect = tweak_data.gui.icons[RaidGUIControlButtonSwitch.THUMB_ICON].texture_rect,
		w = RaidGUIControlButtonSwitch.THUMB_W,
		h = RaidGUIControlButtonSwitch.THUMB_H,
		color = RaidGUIControlButtonSwitch.THUMB_COLOR_OFF
	}
	slot8 = self._object
	switch_params.layer = self._object.layer(RaidGUIControlButtonSwitch.THUMB_ICON) + 1
	slot9 = switch_params
	self._thumb = self._switch_panel.bitmap(RaidGUIControlButtonSwitch.THUMB_ICON, self._switch_panel)
	self._value = self._params.value or false
	self._play_mouse_over_sound = true
	self._on_click_callback = params.on_click_callback
	self._visible = self._params.visible
	slot8 = self

	self._render_images(self._object)

	return 
end
function RaidGUIControlButtonSwitch:highlight_on()
	slot3 = self._object

	self._object.stop(slot2)

	slot3 = self._object
	slot8 = "_animate_highlight_on"

	self._object.animate(slot2, callback(slot5, self, self))

	if self._play_mouse_over_sound then
		slot4 = "highlight"

		managers.menu_component.post_event(slot2, managers.menu_component)

		self._play_mouse_over_sound = false
	end

	return 
end
function RaidGUIControlButtonSwitch:highlight_off()
	slot3 = self._object

	self._object.stop(slot2)

	slot3 = self._object
	slot8 = "_animate_highlight_off"

	self._object.animate(slot2, callback(slot5, self, self))

	self._play_mouse_over_sound = true

	return 
end
function RaidGUIControlButtonSwitch:mouse_pressed(o, button, x, y)
	slot9 = y

	if self.inside(slot6, self, x) then
		slot7 = self._switch_panel

		self._switch_panel.stop(slot6)

		slot7 = self._switch_panel
		slot12 = "_animate_switch_press"

		self._switch_panel.animate(slot6, callback(slot9, self, self))
	end

	return 
end
function RaidGUIControlButtonSwitch:mouse_released(o, button, x, y)

	-- Decompilation error in this vicinity:
	slot9 = y

	if self.inside(slot6, self, x) then

		-- Decompilation error in this vicinity:
		if self._value then
			self._value = false
		else
			self._value = true
		end

		slot7 = self._switch_panel

		self._switch_panel.stop(slot6)

		slot7 = self._switch_panel
		slot12 = "_animate_switch_release"

		self._switch_panel.animate(slot6, callback(slot9, self, self))

		slot7 = self

		self._render_images(slot6)

		if self._on_click_callback then
			slot9 = self._value

			self._on_click_callback(slot6, button, self)
		end

		return true
	else
		return false
	end

	return 
end
function RaidGUIControlButtonSwitch:set_value(value)
	self._value = value

	return 
end
function RaidGUIControlButtonSwitch:get_value()
	return self._value
end
function RaidGUIControlButtonSwitch:set_value_and_render(value)
	slot5 = value

	self.set_value(slot3, self)

	slot4 = self

	self._render_images(slot3)

	slot4 = self

	self.highlight_off(slot3)

	return 
end
function RaidGUIControlButtonSwitch:_render_images()
	if self._visible == false then
		slot3 = self

		self.hide(slot2)

		return 
	else
		slot3 = self

		self.show(slot2)

		if self._value then
			slot3 = self._thumb
			slot6 = self._switch_panel

			self._thumb.set_right(slot2, self._switch_panel.w(slot5))
		else
			slot4 = 0

			self._thumb.set_left(slot2, self._thumb)
		end
	end

	return 
end
function RaidGUIControlButtonSwitch:set_visible(flag)
	self._visible = flag
	slot4 = self

	self._render_images(slot3)

	return 
end
function RaidGUIControlButtonSwitch:confirm_pressed()

	-- Decompilation error in this vicinity:
	if self._value then
		self._value = false
	else
		self._value = true
	end

	slot3 = self

	self._render_images(slot2)

	if self._on_click_callback then
		slot5 = self._value

		self._on_click_callback(slot2, self, self)
	end

	return true
end
function RaidGUIControlButtonSwitch:_animate_highlight_on()
	local duration = 0.2
	local t = 0

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot9 = duration
		local description_r = Easing.quartic_out(slot5, t, RaidGUIControlButtonSwitch.TEXT_COLOR.r, RaidGUIControlButtonSwitch.TEXT_HIGHLIGHT_COLOR.r - RaidGUIControlButtonSwitch.TEXT_COLOR.r)
		slot10 = duration
		local description_g = Easing.quartic_out(t, t, RaidGUIControlButtonSwitch.TEXT_COLOR.g, RaidGUIControlButtonSwitch.TEXT_HIGHLIGHT_COLOR.g - RaidGUIControlButtonSwitch.TEXT_COLOR.g)
		local description_b = Easing.quartic_out(t, t, RaidGUIControlButtonSwitch.TEXT_COLOR.b, RaidGUIControlButtonSwitch.TEXT_HIGHLIGHT_COLOR.b - RaidGUIControlButtonSwitch.TEXT_COLOR.b)
		slot9 = self._description
		slot14 = description_b

		self._description.set_color(t, Color(duration, description_r, description_g))

		slot12 = duration
		local border_r = Easing.quartic_out(t, t, RaidGUIControlButtonSwitch.SWITCH_BORDER_COLOR.r, RaidGUIControlButtonSwitch.SWITCH_BORDER_HIGHLIGHT_COLOR.r - RaidGUIControlButtonSwitch.SWITCH_BORDER_COLOR.r)
		slot13 = duration
		local border_g = Easing.quartic_out(t, t, RaidGUIControlButtonSwitch.SWITCH_BORDER_COLOR.g, RaidGUIControlButtonSwitch.SWITCH_BORDER_HIGHLIGHT_COLOR.g - RaidGUIControlButtonSwitch.SWITCH_BORDER_COLOR.g)
		local border_b = Easing.quartic_out(t, t, RaidGUIControlButtonSwitch.SWITCH_BORDER_COLOR.b, RaidGUIControlButtonSwitch.SWITCH_BORDER_HIGHLIGHT_COLOR.b - RaidGUIControlButtonSwitch.SWITCH_BORDER_COLOR.b)
		slot12 = self._border
		slot17 = border_b

		self._border.set_color(t, Color(duration, border_r, border_g))

		local thumb_color = (self._value and RaidGUIControlButtonSwitch.THUMB_COLOR_ON) or RaidGUIControlButtonSwitch.THUMB_COLOR_OFF
		slot16 = duration
		local thumb_r = Easing.quartic_out(slot12, t, thumb_color.r, RaidGUIControlButtonSwitch.THUMB_COLOR_HIGHLIGHT.r - thumb_color.r)
		slot17 = duration
		local thumb_g = Easing.quartic_out(t, t, thumb_color.g, RaidGUIControlButtonSwitch.THUMB_COLOR_HIGHLIGHT.g - thumb_color.g)
		local thumb_b = Easing.quartic_out(t, t, thumb_color.b, RaidGUIControlButtonSwitch.THUMB_COLOR_HIGHLIGHT.b - thumb_color.b)
		slot16 = self._thumb
		slot21 = thumb_b

		self._thumb.set_color(t, Color(duration, thumb_r, thumb_g))
	end

	slot6 = RaidGUIControlButtonSwitch.TEXT_HIGHLIGHT_COLOR

	self._description.set_color(slot4, self._description)

	slot6 = RaidGUIControlButtonSwitch.SWITCH_BORDER_HIGHLIGHT_COLOR

	self._border.set_color(slot4, self._border)

	return 
end
function RaidGUIControlButtonSwitch:_animate_highlight_off()
	local duration = 0.2
	local t = 0

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot9 = duration
		local description_r = Easing.quartic_out(slot5, t, RaidGUIControlButtonSwitch.TEXT_HIGHLIGHT_COLOR.r, RaidGUIControlButtonSwitch.TEXT_COLOR.r - RaidGUIControlButtonSwitch.TEXT_HIGHLIGHT_COLOR.r)
		slot10 = duration
		local description_g = Easing.quartic_out(t, t, RaidGUIControlButtonSwitch.TEXT_HIGHLIGHT_COLOR.g, RaidGUIControlButtonSwitch.TEXT_COLOR.g - RaidGUIControlButtonSwitch.TEXT_HIGHLIGHT_COLOR.g)
		local description_b = Easing.quartic_out(t, t, RaidGUIControlButtonSwitch.TEXT_HIGHLIGHT_COLOR.b, RaidGUIControlButtonSwitch.TEXT_COLOR.b - RaidGUIControlButtonSwitch.TEXT_HIGHLIGHT_COLOR.b)
		slot9 = self._description
		slot14 = description_b

		self._description.set_color(t, Color(duration, description_r, description_g))

		slot12 = duration
		local border_r = Easing.quartic_out(t, t, RaidGUIControlButtonSwitch.SWITCH_BORDER_HIGHLIGHT_COLOR.r, RaidGUIControlButtonSwitch.SWITCH_BORDER_COLOR.r - RaidGUIControlButtonSwitch.SWITCH_BORDER_HIGHLIGHT_COLOR.r)
		slot13 = duration
		local border_g = Easing.quartic_out(t, t, RaidGUIControlButtonSwitch.SWITCH_BORDER_HIGHLIGHT_COLOR.g, RaidGUIControlButtonSwitch.SWITCH_BORDER_COLOR.g - RaidGUIControlButtonSwitch.SWITCH_BORDER_HIGHLIGHT_COLOR.g)
		local border_b = Easing.quartic_out(t, t, RaidGUIControlButtonSwitch.SWITCH_BORDER_HIGHLIGHT_COLOR.b, RaidGUIControlButtonSwitch.SWITCH_BORDER_COLOR.b - RaidGUIControlButtonSwitch.SWITCH_BORDER_HIGHLIGHT_COLOR.b)
		slot12 = self._border
		slot17 = border_b

		self._border.set_color(t, Color(duration, border_r, border_g))

		local thumb_color = (self._value and RaidGUIControlButtonSwitch.THUMB_COLOR_ON) or RaidGUIControlButtonSwitch.THUMB_COLOR_OFF
		slot16 = duration
		local thumb_r = Easing.quartic_out(slot12, t, RaidGUIControlButtonSwitch.THUMB_COLOR_HIGHLIGHT.r, thumb_color.r - RaidGUIControlButtonSwitch.THUMB_COLOR_HIGHLIGHT.r)
		slot17 = duration
		local thumb_g = Easing.quartic_out(t, t, RaidGUIControlButtonSwitch.THUMB_COLOR_HIGHLIGHT.g, thumb_color.g - RaidGUIControlButtonSwitch.THUMB_COLOR_HIGHLIGHT.g)
		local thumb_b = Easing.quartic_out(t, t, RaidGUIControlButtonSwitch.THUMB_COLOR_HIGHLIGHT.b, thumb_color.b - RaidGUIControlButtonSwitch.THUMB_COLOR_HIGHLIGHT.b)
		slot16 = self._thumb
		slot21 = thumb_b

		self._thumb.set_color(t, Color(duration, thumb_r, thumb_g))
	end

	slot6 = RaidGUIControlButtonSwitch.TEXT_COLOR

	self._description.set_color(slot4, self._description)

	slot6 = RaidGUIControlButtonSwitch.SWITCH_BORDER_COLOR

	self._border.set_color(slot4, self._border)

	return 
end
function RaidGUIControlButtonSwitch:_animate_switch_press()
	local t = 0
	local original_w = RaidGUIControlButtonSwitch.SWITCH_BORDER_W
	local original_h = RaidGUIControlButtonSwitch.SWITCH_BORDER_H
	slot6 = self._switch_panel
	local starting_scale = self._switch_panel.w(slot5) / original_w
	local duration = 0.25 * (starting_scale - 0.9) / 0.1
	slot8 = self._switch_panel
	local center_x, center_y = self._switch_panel.center(slot7)

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot14 = duration
		local scale = Easing.quartic_out(slot10, t, starting_scale, 0.9 - starting_scale)
		slot13 = original_w * scale

		self._switch_panel.set_w(t, self._switch_panel)

		slot13 = original_h * scale

		self._switch_panel.set_h(t, self._switch_panel)

		slot14 = center_y

		self._switch_panel.set_center(t, self._switch_panel, center_x)
	end

	slot11 = original_w * 0.9

	self._switch_panel.set_w(slot9, self._switch_panel)

	slot11 = original_h * 0.9

	self._switch_panel.set_h(slot9, self._switch_panel)

	slot12 = center_y

	self._switch_panel.set_center(slot9, self._switch_panel, center_x)

	return 
end
function RaidGUIControlButtonSwitch:_animate_switch_release()
	local t = 0
	local duration = 0.25
	local target_w = RaidGUIControlButtonSwitch.SWITCH_BORDER_W
	local target_h = RaidGUIControlButtonSwitch.SWITCH_BORDER_H
	slot7 = self._switch_panel
	local center_x, center_y = self._switch_panel.center(slot6)
	slot10 = target_w * 0.9

	self._switch_panel.set_w(slot8, self._switch_panel)

	slot10 = target_h * 0.9

	self._switch_panel.set_h(slot8, self._switch_panel)

	slot11 = center_y

	self._switch_panel.set_center(slot8, self._switch_panel, center_x)

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot13 = duration
		local scale = Easing.quartic_out(slot9, t, 0.9, 0.1)
		slot12 = target_w * scale

		self._switch_panel.set_w(t, self._switch_panel)

		slot12 = target_h * scale

		self._switch_panel.set_h(t, self._switch_panel)

		slot13 = center_y

		self._switch_panel.set_center(t, self._switch_panel, center_x)
	end

	slot10 = target_w

	self._switch_panel.set_w(slot8, self._switch_panel)

	slot10 = target_h

	self._switch_panel.set_h(slot8, self._switch_panel)

	slot11 = center_y

	self._switch_panel.set_center(slot8, self._switch_panel, center_x)

	return 
end

return 
