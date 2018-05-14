if not RaidGUIControlSliderSimple then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlSliderSimple = slot0
RaidGUIControlSliderSimple.DEFAULT_WIDTH = 240
RaidGUIControlSliderSimple.HEIGHT = 32
RaidGUIControlSliderSimple.SLIDER_ICON = "ico_slider_thumb"
RaidGUIControlSliderSimple.SLIDER_BACKGROUND_COLOR = tweak_data.gui.colors.raid_grey
RaidGUIControlSliderSimple.SLIDER_COLOR = tweak_data.gui.colors.raid_white
RaidGUIControlSliderSimple.SLIDER_HIGHLIGHT_COLOR = tweak_data.gui.colors.raid_red
RaidGUIControlSliderSimple.DISABLED_COLOR = tweak_data.gui.colors.raid_dark_grey
RaidGUIControlSliderSimple.SLIDER_LINE_HEIGHT = 4
RaidGUIControlSliderSimple.CONTROLLER_STEP = 4
function RaidGUIControlSliderSimple:init(parent, params)
	slot7 = params

	RaidGUIControlSliderSimple.super.init(slot4, self, parent)

	if not params then
		slot9 = self._name
		slot6 = "[RaidGUIControlSliderSimple:init] Parameters not specified for simple slider " .. tostring(slot8)

		Application.error(slot4, Application)

		return 
	end

	self._value = self._params.value or 0
	self._on_value_change_callback = params.on_value_change_callback
	slot5 = self

	self._create_slider_panel(slot4)

	slot5 = self

	self._create_slider_controls(slot4)

	slot5 = self

	self.render_value(slot4)

	slot5 = self

	self.highlight_off(slot4)

	return 
end
function RaidGUIControlSliderSimple:_create_slider_panel()
	local slider_params = clone(slot2)
	slider_params.name = slider_params.name .. "_simple_slider"
	slot4 = self._panel
	slider_params.layer = self._panel.layer("_simple_slider") + 1
	slider_params.w = self._params.w or RaidGUIControlSliderSimple.DEFAULT_WIDTH
	slider_params.h = RaidGUIControlSliderSimple.HEIGHT
	slot5 = slider_params
	self._slider_panel = self._panel.panel(self._params, self._panel)
	self._object = self._slider_panel

	return 
end
function RaidGUIControlSliderSimple:_create_slider_controls()
	local w = self._params.w or RaidGUIControlSliderSimple.DEFAULT_WIDTH
	slot5 = {
		name = self._name .. "_slider_line_panel",
		x = tweak_data.gui.icons[RaidGUIControlSliderSimple.SLIDER_ICON].texture_rect[3] / 2,
		y = RaidGUIControlSliderSimple.HEIGHT / 2 - RaidGUIControlSliderSimple.SLIDER_LINE_HEIGHT / 2,
		w = w - tweak_data.gui.icons[RaidGUIControlSliderSimple.SLIDER_ICON].texture_rect[3],
		layer = self._object.layer(RaidGUIControlSliderSimple.SLIDER_ICON)
	}
	slot8 = self._object
	self._slider_line_panel = self._object.panel(slot3, self._object)
	slot5 = {
		center = "slider_line_center_base",
		right = "slider_line_right_base",
		left = "slider_line_left_base",
		y = 0,
		x = 0,
		name = self._name .. "_slider_line",
		w = self._slider_line_panel.w("_slider_line"),
		color = RaidGUIControlSliderSimple.SLIDER_BACKGROUND_COLOR,
		layer = self._slider_line_panel.layer("_slider_line")
	}
	slot8 = self._slider_line_panel
	slot8 = self._slider_line_panel
	self._slider_line = self._slider_line_panel.three_cut_bitmap(slot3, self._slider_line_panel)
	slot5 = {
		center = "slider_line_center_base",
		right = "slider_line_right_base",
		left = "slider_line_left_base",
		y = 0,
		x = 0,
		name = self._name .. "_slider_line_active",
		w = self._slider_line_panel.w("_slider_line_active"),
		color = RaidGUIControlSliderSimple.SLIDER_COLOR,
		layer = self._slider_line_panel.layer("_slider_line_active") + 1
	}
	slot8 = self._slider_line_panel
	slot8 = self._slider_line_panel
	self._slider_line_active = self._slider_line_panel.three_cut_bitmap(slot3, self._slider_line_panel)
	slot4 = self._slider_line_panel
	slot7 = self._slider_line

	self._slider_line_panel.set_h(slot3, self._slider_line.h(self._slider_line_panel.layer("_slider_line_active") + 1))

	slot5 = {
		y = 0,
		x = 0,
		texture = tweak_data.gui.icons[RaidGUIControlSliderSimple.SLIDER_ICON].texture,
		texture_rect = tweak_data.gui.icons[RaidGUIControlSliderSimple.SLIDER_ICON].texture_rect,
		w = tweak_data.gui.icons[RaidGUIControlSliderSimple.SLIDER_ICON].texture_rect[3],
		h = tweak_data.gui.icons[RaidGUIControlSliderSimple.SLIDER_ICON].texture_rect[4],
		layer = self._slider_line_panel.layer(RaidGUIControlSliderSimple.SLIDER_ICON) + 200
	}
	slot8 = self._slider_line_panel
	self._slider_thumb = self._object.bitmap(slot3, self._object)

	return 
end
function RaidGUIControlSliderSimple:on_mouse_pressed()
	if not self._enabled then
		return 
	end

	slot3 = managers.raid_menu
	self._old_active_control = managers.raid_menu.get_active_control(slot2)
	slot4 = self

	managers.raid_menu.set_active_control(slot2, managers.raid_menu)

	self._active = true
	slot4 = "music_slider_radio"

	managers.menu_component.post_event(slot2, managers.menu_component)

	return 
end
function RaidGUIControlSliderSimple:on_mouse_released()
	if not self._enabled then
		return 
	end

	slot4 = self._old_active_control

	managers.raid_menu.set_active_control(slot2, managers.raid_menu)

	self._active = false
	slot4 = "music_slider_radio_stop"

	managers.menu_component.post_event(slot2, managers.menu_component)

	return 
end
function RaidGUIControlSliderSimple:on_mouse_moved(o, x, y)
	if not self._enabled then
		return 
	end

	slot8 = y

	RaidGUIControlSliderSimple.super.on_mouse_moved(slot5, o, x)

	if self._active then
		slot6 = self._object._engine_panel

		if alive(slot5) then
			slot9 = self._slider_line_panel
			slot7 = x - self._slider_line_panel.world_x(slot8)

			self.set_value_by_x_coord(slot5, self)
		end
	end

	return 
end
function RaidGUIControlSliderSimple:on_mouse_out(x, y)
	slot7 = y

	RaidGUIControlSliderSimple.super.on_mouse_out(slot4, self, x)

	slot5 = self

	self.on_mouse_released(slot4)

	return 
end
function RaidGUIControlSliderSimple:set_enabled(enabled)
	slot5 = enabled

	RaidGUIControlSliderSimple.super.set_enabled(slot3, self)

	if enabled then
		slot5 = Color.white

		self._slider_thumb.set_color(slot3, self._slider_thumb)

		slot5 = RaidGUIControlSliderSimple.SLIDER_BACKGROUND_COLOR

		self._slider_line.set_color(slot3, self._slider_line)

		slot5 = RaidGUIControlSliderSimple.SLIDER_COLOR

		self._slider_line_active.set_color(slot3, self._slider_line_active)
	else
		slot5 = RaidGUIControlSliderSimple.DISABLED_COLOR

		self._slider_thumb.set_color(slot3, self._slider_thumb)

		slot5 = RaidGUIControlSliderSimple.DISABLED_COLOR

		self._slider_line.set_color(slot3, self._slider_line)

		slot5 = RaidGUIControlSliderSimple.DISABLED_COLOR

		self._slider_line_active.set_color(slot3, self._slider_line_active)
	end

	return 
end
function RaidGUIControlSliderSimple:set_value_by_x_coord(selected_coord_x)
	slot4 = self._slider_line_panel
	local value = selected_coord_x / self._slider_line_panel.w(slot3) * 100

	if value < 0 then
		value = 0
	end

	if 100 < value then
		value = 100
	end

	slot6 = value

	self.set_value_and_render(slot4, self)

	return 
end
function RaidGUIControlSliderSimple:get_value()
	return self._value
end
function RaidGUIControlSliderSimple:set_value(value)
	self._value = value

	return 
end
function RaidGUIControlSliderSimple:set_value_and_render(value)
	slot5 = value

	self.set_value(slot3, self)

	slot4 = self

	self.render_value(slot3)

	if self._on_value_change_callback then
		self._on_value_change_callback()
	end

	return 
end
function RaidGUIControlSliderSimple:render_value()
	slot5 = 100
	self._value = math.clamp(slot2, self._value, 0)
	slot4 = self._slider_line_panel
	local width = self._value / 100 * self._slider_line_panel.w(self._value)
	slot5 = width

	self._slider_line_active.set_w(self._value, self._slider_line_active)

	slot7 = self._slider_line_panel
	slot5 = self._slider_line_panel.x(slot6) + width

	self._slider_thumb.set_center_x(self._value, self._slider_thumb)

	return 
end
function RaidGUIControlSliderSimple:highlight_on()
	if not self._enabled then
		return 
	end

	self._highlighted = true
	slot3 = self._object

	self._object.stop(slot2)

	slot3 = self._object
	slot8 = "_animate_highlight_on"

	self._object.animate(slot2, callback(slot5, self, self))

	return 
end
function RaidGUIControlSliderSimple:highlight_off()
	if not self._enabled then
		return 
	end

	self._highlighted = true
	slot3 = self._object

	self._object.stop(slot2)

	slot3 = self._object
	slot8 = "_animate_highlight_off"

	self._object.animate(slot2, callback(slot5, self, self))

	return 
end
function RaidGUIControlSliderSimple:set_right(value)
	slot5 = value

	self._object.set_right(slot3, self._object)

	return 
end
function RaidGUIControlSliderSimple:set_left(value)
	slot5 = value

	self._object.set_left(slot3, self._object)

	return 
end
function RaidGUIControlSliderSimple:move_left()
	slot6 = self._selected

	Application.trace(slot2, Application, "[RaidGUIControlSliderSimple:move_left] ", self._name)

	if self._selected then
		local current_value = self.get_value(slot2)
		slot5 = current_value - RaidGUIControlSliderSimple.CONTROLLER_STEP

		self.set_value_and_render(self, self)

		return true
	end

	return 
end
function RaidGUIControlSliderSimple:move_right()
	slot6 = self._selected

	Application.trace(slot2, Application, "[RaidGUIControlSliderSimple:move_right] ", self._name)

	if self._selected then
		local current_value = self.get_value(slot2)
		slot5 = current_value + RaidGUIControlSliderSimple.CONTROLLER_STEP

		self.set_value_and_render(self, self)

		return true
	end

	return 
end
function RaidGUIControlSliderSimple:_animate_highlight_on()
	local t = 0
	slot4 = self._slider_line_active
	local starting_color = self._slider_line_active.color(slot3)
	local duration = 0.2 * (RaidGUIControlSliderSimple.SLIDER_HIGHLIGHT_COLOR.r - starting_color.r) / (RaidGUIControlSliderSimple.SLIDER_HIGHLIGHT_COLOR.r - RaidGUIControlSliderSimple.SLIDER_COLOR.r)

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot10 = duration
		local current_r = Easing.quartic_out(slot6, t, starting_color.r, RaidGUIControlSliderSimple.SLIDER_HIGHLIGHT_COLOR.r - starting_color.r)
		slot11 = duration
		local current_g = Easing.quartic_out(t, t, starting_color.g, RaidGUIControlSliderSimple.SLIDER_HIGHLIGHT_COLOR.g - starting_color.g)
		local current_b = Easing.quartic_out(t, t, starting_color.b, RaidGUIControlSliderSimple.SLIDER_HIGHLIGHT_COLOR.b - starting_color.b)
		slot10 = self._slider_line_active
		slot15 = current_b

		self._slider_line_active.set_color(t, Color(duration, current_r, current_g))

		slot10 = self._slider_thumb
		slot15 = current_b

		self._slider_thumb.set_color(t, Color(duration, current_r, current_g))
	end

	slot7 = RaidGUIControlSliderSimple.SLIDER_HIGHLIGHT_COLOR

	self._slider_line_active.set_color(slot5, self._slider_line_active)

	slot7 = RaidGUIControlSliderSimple.SLIDER_HIGHLIGHT_COLOR

	self._slider_thumb.set_color(slot5, self._slider_thumb)

	return 
end
function RaidGUIControlSliderSimple:_animate_highlight_off()
	local t = 0
	slot4 = self._slider_line_active
	local starting_color = self._slider_line_active.color(slot3)
	local duration = 0.2 * (RaidGUIControlSliderSimple.SLIDER_COLOR.r - starting_color.r) / (RaidGUIControlSliderSimple.SLIDER_COLOR.r - RaidGUIControlSliderSimple.SLIDER_HIGHLIGHT_COLOR.r)

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot10 = duration
		local current_r = Easing.quartic_out(slot6, t, starting_color.r, RaidGUIControlSliderSimple.SLIDER_COLOR.r - starting_color.r)
		slot11 = duration
		local current_g = Easing.quartic_out(t, t, starting_color.g, RaidGUIControlSliderSimple.SLIDER_COLOR.g - starting_color.g)
		local current_b = Easing.quartic_out(t, t, starting_color.b, RaidGUIControlSliderSimple.SLIDER_COLOR.b - starting_color.b)
		slot10 = self._slider_line_active
		slot15 = current_b

		self._slider_line_active.set_color(t, Color(duration, current_r, current_g))

		slot10 = self._slider_thumb
		slot15 = current_b

		self._slider_thumb.set_color(t, Color(duration, current_r, current_g))
	end

	slot7 = RaidGUIControlSliderSimple.SLIDER_COLOR

	self._slider_line_active.set_color(slot5, self._slider_line_active)

	slot7 = RaidGUIControlSliderSimple.SLIDER_COLOR

	self._slider_thumb.set_color(slot5, self._slider_thumb)

	return 
end
function RaidGUIControlSliderSimple:_animate_thumb_press()
	local t = 0
	local original_w = tweak_data.gui.icons[RaidGUIControlSliderSimple.SLIDER_ICON].texture_rect[3]
	local original_h = tweak_data.gui.icons[RaidGUIControlSliderSimple.SLIDER_ICON].texture_rect[4]
	slot6 = self._slider_thumb
	local starting_scale = self._slider_thumb.w(slot5) / original_w
	local duration = 0.25 * (starting_scale - 0.9) / 0.1
	slot8 = self._slider_thumb
	local center_x, center_y = self._slider_thumb.center(slot7)

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot14 = duration
		local scale = Easing.quartic_out(slot10, t, starting_scale, 0.9 - starting_scale)
		slot13 = original_w * scale

		self._slider_thumb.set_w(t, self._slider_thumb)

		slot13 = original_h * scale

		self._slider_thumb.set_h(t, self._slider_thumb)

		slot14 = center_y

		self._slider_thumb.set_center(t, self._slider_thumb, center_x)
	end

	slot11 = original_w * 0.9

	self._slider_thumb.set_w(slot9, self._slider_thumb)

	slot11 = original_h * 0.9

	self._slider_thumb.set_h(slot9, self._slider_thumb)

	slot12 = center_y

	self._slider_thumb.set_center(slot9, self._slider_thumb, center_x)

	return 
end
function RaidGUIControlSliderSimple:_animate_thumb_release()
	local t = 0
	local duration = 0.25
	local target_w = tweak_data.gui.icons[RaidGUIControlSliderSimple.SLIDER_ICON].texture_rect[3]
	local target_h = tweak_data.gui.icons[RaidGUIControlSliderSimple.SLIDER_ICON].texture_rect[4]
	slot7 = self._slider_thumb
	local center_x, center_y = self._slider_thumb.center(slot6)
	slot10 = target_w * 0.9

	self._slider_thumb.set_w(slot8, self._slider_thumb)

	slot10 = target_h * 0.9

	self._slider_thumb.set_h(slot8, self._slider_thumb)

	slot11 = center_y

	self._slider_thumb.set_center(slot8, self._slider_thumb, center_x)

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot13 = duration
		local scale = Easing.quartic_out(slot9, t, 0.9, 0.1)
		slot12 = target_w * scale

		self._slider_thumb.set_w(t, self._slider_thumb)

		slot12 = target_h * scale

		self._slider_thumb.set_h(t, self._slider_thumb)

		slot13 = center_y

		self._slider_thumb.set_center(t, self._slider_thumb, center_x)
	end

	slot10 = target_w

	self._slider_thumb.set_w(slot8, self._slider_thumb)

	slot10 = target_h

	self._slider_thumb.set_h(slot8, self._slider_thumb)

	slot11 = center_y

	self._slider_thumb.set_center(slot8, self._slider_thumb, center_x)

	return 
end

return 
