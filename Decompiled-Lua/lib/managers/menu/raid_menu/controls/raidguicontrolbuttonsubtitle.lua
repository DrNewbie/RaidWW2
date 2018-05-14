if not RaidGUIControlButtonSubtitle then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlButtonSubtitle = slot0
RaidGUIControlButtonSubtitle.DEFAULT_WIDTH = 80
RaidGUIControlButtonSubtitle.DEFAULT_HEIGHT = 80
RaidGUIControlButtonSubtitle.TEXT_FONT = tweak_data.gui.fonts.din_compressed
RaidGUIControlButtonSubtitle.TEXT_SIZE = tweak_data.gui.font_sizes.extra_small
RaidGUIControlButtonSubtitle.COLOR = tweak_data.gui.colors.raid_black
RaidGUIControlButtonSubtitle.ACTIVE_COLOR = tweak_data.gui.colors.raid_light_red
RaidGUIControlButtonSubtitle.DISABLED_ALPHA = 0.4
RaidGUIControlButtonSubtitle.ICON_PADDING_DOWN = 5
RaidGUIControlButtonSubtitle.ICON_W = 32
RaidGUIControlButtonSubtitle.ICON_H = 32
RaidGUIControlButtonSubtitle.PRESSED_SIZE = 0.9
RaidGUIControlButtonSubtitle.SELECTOR_TOP_LEFT = "ico_sel_rect_small_top_left"
RaidGUIControlButtonSubtitle.SELECTOR_BOTTOM_RIGHT = "ico_sel_rect_small_bottom_right"
function RaidGUIControlButtonSubtitle:init(parent, params)
	slot7 = params

	RaidGUIControlButtonSubtitle.super.init(slot4, self, parent)

	if not params.icon then
		slot9 = self._name
		slot6 = "[RaidGUIControlButtonSubtitle:init] No icon set for subtitle button " .. tostring(slot8)

		Application.error(slot4, Application)

		return 
	end

	if not params.text then
		slot9 = self._name
		slot6 = "[RaidGUIControlButtonSubtitle:init] No text set for subtitle button " .. tostring(slot8)

		Application.error(slot4, Application)

		return 
	end

	if not params.on_click_callback then
		slot9 = self._name
		slot6 = "[RaidGUIControlButtonSubtitle:init] No callback set for subtitle button " .. tostring(slot8)

		Application.error(slot4, Application)

		return 
	end

	slot5 = self

	self._init_panel(slot4)
	self._create_selectors(slot4)

	self._on_click_callback = params.on_click_callback
	local icon_params = {
		name = "subtitle_icon",
		y = 0,
		x = 0
	}
	slot6 = self._object
	icon_params.layer = self._object.layer(self) + 1
	icon_params.texture = tweak_data.gui.icons[self._params.icon].texture
	icon_params.texture_rect = tweak_data.gui.icons[self._params.icon].texture_rect
	icon_params.color = RaidGUIControlButtonSubtitle.COLOR
	slot7 = icon_params
	self._icon = self._object.bitmap(self._params.icon, self._object)
	self._icon_w = self._icon.w(self._params.icon)
	self._icon_h = self._icon.h(self._params.icon)
	local text_params = {
		name = "subtitle_text",
		vertical = "top",
		wrap = false,
		align = "center",
		y = 0,
		x = 0,
		font = RaidGUIControlButtonSubtitle.TEXT_FONT,
		font_size = RaidGUIControlButtonSubtitle.TEXT_SIZE,
		text = params.text,
		color = RaidGUIControlButtonSubtitle.COLOR
	}
	slot7 = self._object
	text_params.layer = self._object.layer(self._icon) + 1
	slot8 = text_params
	self._text = self._object.text(self._icon, self._object)
	self._align = params.align or "left"
	slot7 = self

	self._fit_size(self._icon)

	self._color_t = 0

	if params.active then
		slot8 = true

		self.highlight_on(slot6, self)
	else
		slot8 = true

		self.highlight_off(slot6, self)
	end

	if params.disabled then
		slot7 = self

		self.disable(slot6)
	end

	self._auto_deactivate = params.auto_deactivate

	return 
end
function RaidGUIControlButtonSubtitle:_init_panel()
	local panel_params = clone(slot2)
	panel_params.name = panel_params.name .. "_subtitle_button"
	slot4 = self._panel
	panel_params.layer = self._panel.layer("_subtitle_button") + 1
	panel_params.x = self._params.x or 0
	panel_params.y = self._params.y or 0
	panel_params.w = self._params.w or RaidGUIControlButtonSubtitle.DEFAULT_WIDTH
	panel_params.h = RaidGUIControlButtonSubtitle.DEFAULT_HEIGHT
	slot5 = panel_params
	self._object = self._panel.panel(self._params, self._panel)

	return 
end
function RaidGUIControlButtonSubtitle:_create_selectors()
	local selector_panel_params = {
		alpha = 0,
		name = "selector_panel",
		halign = "scale",
		valign = "scale"
	}
	slot5 = selector_panel_params
	self._selector_panel = self._object.panel(slot3, self._object)
	local selector_top_left_params = {
		name = "selector_top_left",
		texture = tweak_data.gui.icons[RaidGUIControlButtonSubtitle.SELECTOR_TOP_LEFT].texture,
		texture_rect = tweak_data.gui.icons[RaidGUIControlButtonSubtitle.SELECTOR_TOP_LEFT].texture_rect
	}
	slot6 = selector_top_left_params
	local selector_top_left = self._selector_panel.bitmap(RaidGUIControlButtonSubtitle.SELECTOR_TOP_LEFT, self._selector_panel)
	local selector_bottom_right_params = {
		name = "selector_bottom_right",
		valign = "bottom",
		halign = "right",
		texture = tweak_data.gui.icons[RaidGUIControlButtonSubtitle.SELECTOR_BOTTOM_RIGHT].texture,
		texture_rect = tweak_data.gui.icons[RaidGUIControlButtonSubtitle.SELECTOR_BOTTOM_RIGHT].texture_rect
	}
	slot8 = selector_bottom_right_params
	local selector_bottom_right = self._selector_panel.bitmap(RaidGUIControlButtonSubtitle.SELECTOR_BOTTOM_RIGHT, self._selector_panel)
	slot8 = selector_bottom_right
	slot11 = self._selector_panel

	selector_bottom_right.set_right(self._selector_panel, self._selector_panel.w(slot10))

	slot8 = selector_bottom_right
	slot11 = self._selector_panel

	selector_bottom_right.set_bottom(self._selector_panel, self._selector_panel.h(slot10))

	return 
end
function RaidGUIControlButtonSubtitle:_fit_size()
	slot3 = self._text
	local _, _, w, h = self._text.text_rect(slot2)
	slot8 = w

	self._text.set_w(slot6, self._text)

	slot8 = h

	self._text.set_h(slot6, self._text)

	slot8 = self._text
	local h = self._icon.h(slot6) + RaidGUIControlButtonSubtitle.ICON_PADDING_DOWN + self._text.h(self._icon)
	local object_center_x = self._object.center_x(self._icon)
	slot11 = self._icon
	slot9 = self._icon.w(slot10)
	slot10 = w
	local object_w = math.max(self._object, slot9)
	slot11 = RaidGUIControlButtonSubtitle.DEFAULT_WIDTH
	object_w = math.max(slot9, object_w)
	slot11 = object_w

	self._object.set_w(slot9, self._object)

	slot11 = object_center_x

	self._object.set_center_x(slot9, self._object)

	slot13 = self._object
	slot11 = self._object.w(slot12) / 2

	self._icon.set_center_x(slot9, self._icon)

	slot13 = self._object
	slot11 = self._object.h(slot12) / 2 - h / 2

	self._icon.set_y(slot9, self._icon)

	slot11 = self._icon
	self._icon_center_x = self._icon.x(slot9) + self._icon.w(self._icon) / 2
	slot11 = self._icon
	self._icon_center_y = self._icon.y(self._icon.w(self._icon) / 2) + self._icon.h(self._icon) / 2
	slot13 = self._object
	slot11 = self._object.w(h / 2) / 2

	self._text.set_center_x(self._icon.h(self._icon) / 2, self._text)

	slot13 = self._object
	slot11 = self._object.h(h / 2) / 2 + h / 2

	self._text.set_bottom(self._icon.h(self._icon) / 2, self._text)

	return 
end
function RaidGUIControlButtonSubtitle:set_x(x)
	slot5 = x

	self._object.set_x(slot3, self._object)

	self._align = "left"

	return 
end
function RaidGUIControlButtonSubtitle:set_center_x(x)
	slot5 = x

	self._object.set_center_x(slot3, self._object)

	self._align = "center"

	return 
end
function RaidGUIControlButtonSubtitle:set_center_y(y)
	slot5 = y

	self._object.set_center_y(slot3, self._object)

	return 
end
function RaidGUIControlButtonSubtitle:set_right(x)
	slot5 = x

	self._object.set_right(slot3, self._object)

	self._align = "right"

	return 
end
function RaidGUIControlButtonSubtitle:set_y(y)
	slot5 = y

	self._object.set_y(slot3, self._object)

	return 
end
function RaidGUIControlButtonSubtitle:set_bottom(bottom)
	slot5 = bottom

	self._object.set_bottom(slot3, self._object)

	return 
end
function RaidGUIControlButtonSubtitle:highlight_on(skip_animation)
	if self._params.no_highlight then
		return 
	end

	if skip_animation then
		slot5 = RaidGUIControlButtonSubtitle.ACTIVE_COLOR

		self._icon.set_color(slot3, self._icon)

		slot5 = RaidGUIControlButtonSubtitle.ACTIVE_COLOR

		self._text.set_color(slot3, self._text)
	else
		slot4 = self._text

		self._text.stop(slot3)

		slot4 = self._text
		slot9 = "_animate_highlight_on"

		self._text.animate(slot3, callback(slot6, self, self))
	end

	if self._play_mouse_over_sound then
		slot5 = "highlight"

		managers.menu_component.post_event(slot3, managers.menu_component)

		self._play_mouse_over_sound = false
	end

	return 
end
function RaidGUIControlButtonSubtitle:highlight_off(skip_animation)
	if self._params.no_highlight or self._active then
		return 
	end

	if skip_animation then
		slot5 = RaidGUIControlButtonSubtitle.COLOR

		self._icon.set_color(slot3, self._icon)

		slot5 = RaidGUIControlButtonSubtitle.COLOR

		self._text.set_color(slot3, self._text)
	else
		slot4 = self._text

		self._text.stop(slot3)

		slot4 = self._text
		slot9 = "_animate_highlight_off"

		self._text.animate(slot3, callback(slot6, self, self))
	end

	self._play_mouse_over_sound = true

	return 
end
function RaidGUIControlButtonSubtitle:mouse_released(o, button, x, y)
	slot8 = button

	self.on_mouse_released(slot6, self)

	return true
end
function RaidGUIControlButtonSubtitle:on_mouse_pressed(button)
	if self._params.no_click then
		return 
	end

	slot4 = self._icon

	self._icon.stop(slot3)

	slot4 = self._icon
	slot9 = "_animate_press"

	self._icon.animate(slot3, callback(slot6, self, self))

	return 
end
function RaidGUIControlButtonSubtitle:on_mouse_released(button)
	if self._params.no_click then
		return 
	end

	slot4 = self._icon

	self._icon.stop(slot3)

	slot4 = self._icon
	slot9 = "_animate_release"

	self._icon.animate(slot3, callback(slot6, self, self))

	if self._on_click_callback then
		slot6 = self._data

		self._on_click_callback(slot3, button, self)
	end

	return 
end
function RaidGUIControlButtonSubtitle:on_double_click(button)
	if self.on_double_click_callback then
		slot6 = self._data

		self.on_double_click_callback(slot3, button, self)
	end

	return 
end
function RaidGUIControlButtonSubtitle:set_alpha(alpha)
	slot5 = alpha

	self._object.set_alpha(slot3, self._object)

	return 
end
function RaidGUIControlButtonSubtitle:set_selected(value)
	self._selected = value

	if self._selected then
		slot5 = 1

		self._selector_panel.set_alpha(slot3, self._selector_panel)
	else
		slot5 = 0

		self._selector_panel.set_alpha(slot3, self._selector_panel)
	end

	return 
end
function RaidGUIControlButtonSubtitle:selected()
	return self._selected
end
function RaidGUIControlButtonSubtitle:set_active(value)
	self._active = value

	if self._active then
		slot4 = self

		self.highlight_on(slot3)
	else
		slot4 = self

		self.highlight_off(slot3)
	end

	return 
end
function RaidGUIControlButtonSubtitle:active()
	return self._active
end
function RaidGUIControlButtonSubtitle:show()
	slot4 = true

	self._object.set_visible(slot2, self._object)

	return 
end
function RaidGUIControlButtonSubtitle:hide()
	slot3 = self._object

	self._object.stop(slot2)

	slot4 = false

	self._object.set_visible(slot2, self._object)

	return 
end
function RaidGUIControlButtonSubtitle:enable(active_texture_color)
	slot5 = 1

	self._icon.set_alpha(slot3, self._icon)

	slot5 = 1

	self._text.set_alpha(slot3, self._text)

	slot6 = false

	self.set_param_value(slot3, self, "no_highlight")

	slot6 = false

	self.set_param_value(slot3, self, "no_click")

	self._enabled = true

	return 
end
function RaidGUIControlButtonSubtitle:disable(inactive_texture_color)
	slot5 = RaidGUIControlButtonSubtitle.DISABLED_ALPHA

	self._icon.set_alpha(slot3, self._icon)

	slot5 = RaidGUIControlButtonSubtitle.DISABLED_ALPHA

	self._text.set_alpha(slot3, self._text)

	slot6 = true

	self.set_param_value(slot3, self, "no_highlight")

	slot6 = true

	self.set_param_value(slot3, self, "no_click")

	self._enabled = false

	return 
end
function RaidGUIControlButtonSubtitle:confirm_pressed()
	if self._selected then
		slot3 = self
		slot6 = "0"

		self.on_mouse_released(slot2, Idstring(slot5))
	end

	return 
end
function RaidGUIControlButtonSubtitle:_animate_highlight_on()
	slot3 = self._text
	local starting_color = self._text.color(slot2)
	local duration = 0.2
	local t = self._color_t

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot10 = duration
		local current_r = Easing.quartic_out(slot6, t, RaidGUIControlButtonSubtitle.COLOR.r, RaidGUIControlButtonSubtitle.ACTIVE_COLOR.r - RaidGUIControlButtonSubtitle.COLOR.r)
		slot11 = duration
		local current_g = Easing.quartic_out(t, t, RaidGUIControlButtonSubtitle.COLOR.g, RaidGUIControlButtonSubtitle.ACTIVE_COLOR.g - RaidGUIControlButtonSubtitle.COLOR.g)
		local current_b = Easing.quartic_out(t, t, RaidGUIControlButtonSubtitle.COLOR.b, RaidGUIControlButtonSubtitle.ACTIVE_COLOR.b - RaidGUIControlButtonSubtitle.COLOR.b)
		slot10 = self._icon
		slot15 = current_b

		self._icon.set_color(t, Color(duration, current_r, current_g))

		slot10 = self._text
		slot15 = current_b

		self._text.set_color(t, Color(duration, current_r, current_g))

		self._color_t = t / duration
	end

	slot7 = RaidGUIControlButtonSubtitle.ACTIVE_COLOR

	self._icon.set_color(slot5, self._icon)

	slot7 = RaidGUIControlButtonSubtitle.ACTIVE_COLOR

	self._text.set_color(slot5, self._text)

	self._color_t = 1

	if self._auto_deactivate and self._active then
		self._active = false
		slot6 = self

		self._animate_highlight_off(slot5)
	end

	return 
end
function RaidGUIControlButtonSubtitle:_animate_highlight_off()
	slot3 = self._text
	local starting_color = self._text.color(slot2)
	local duration = 0.2
	local t = 1 - self._color_t

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot10 = duration
		local current_r = Easing.quartic_out(slot6, t, RaidGUIControlButtonSubtitle.ACTIVE_COLOR.r, RaidGUIControlButtonSubtitle.COLOR.r - RaidGUIControlButtonSubtitle.ACTIVE_COLOR.r)
		slot11 = duration
		local current_g = Easing.quartic_out(t, t, RaidGUIControlButtonSubtitle.ACTIVE_COLOR.g, RaidGUIControlButtonSubtitle.COLOR.g - RaidGUIControlButtonSubtitle.ACTIVE_COLOR.g)
		local current_b = Easing.quartic_out(t, t, RaidGUIControlButtonSubtitle.ACTIVE_COLOR.b, RaidGUIControlButtonSubtitle.COLOR.b - RaidGUIControlButtonSubtitle.ACTIVE_COLOR.b)
		slot10 = self._icon
		slot15 = current_b

		self._icon.set_color(t, Color(duration, current_r, current_g))

		slot10 = self._text
		slot15 = current_b

		self._text.set_color(t, Color(duration, current_r, current_g))

		self._color_t = 1 - t / duration
	end

	slot7 = RaidGUIControlButtonSubtitle.COLOR

	self._icon.set_color(slot5, self._icon)

	slot7 = RaidGUIControlButtonSubtitle.COLOR

	self._text.set_color(slot5, self._text)

	self._color_t = 0

	return 
end
function RaidGUIControlButtonSubtitle:_animate_press()
	local t = 0
	local duration = 0.05

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot9 = duration
		local scale = Easing.quartic_in(slot5, t, 1, -(1 - RaidGUIControlButtonSubtitle.PRESSED_SIZE))
		slot9 = self._icon_w * scale

		self._icon.set_size(t, self._icon, self._icon_w * scale)

		slot9 = self._icon_center_y

		self._icon.set_center(t, self._icon, self._icon_center_x)
	end

	slot7 = self._icon_w * RaidGUIControlButtonSubtitle.PRESSED_SIZE

	self._icon.set_size(slot4, self._icon, self._icon_w * RaidGUIControlButtonSubtitle.PRESSED_SIZE)

	slot7 = self._icon_center_y

	self._icon.set_center(slot4, self._icon, self._icon_center_x)

	return 
end
function RaidGUIControlButtonSubtitle:_animate_release()
	local t = 0
	local duration = 0.25
	slot7 = self._icon_w * RaidGUIControlButtonSubtitle.PRESSED_SIZE

	self._icon.set_size(slot4, self._icon, self._icon_w * RaidGUIControlButtonSubtitle.PRESSED_SIZE)

	slot7 = self._icon_center_y

	self._icon.set_center(slot4, self._icon, self._icon_center_x)

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot9 = duration
		local scale = Easing.quartic_out(slot5, t, RaidGUIControlButtonSubtitle.PRESSED_SIZE, 1 - RaidGUIControlButtonSubtitle.PRESSED_SIZE)
		slot9 = self._icon_w * scale

		self._icon.set_size(t, self._icon, self._icon_w * scale)

		slot9 = self._icon_center_y

		self._icon.set_center(t, self._icon, self._icon_center_x)
	end

	slot7 = self._icon_w

	self._icon.set_size(slot4, self._icon, self._icon_w)

	slot7 = self._icon_center_y

	self._icon.set_center(slot4, self._icon, self._icon_center_x)

	return 
end

return 
