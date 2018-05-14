-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not RaidGUIControlSlider then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlSlider = slot0
RaidGUIControlSlider.DEFAULT_WIDTH = 576
RaidGUIControlSlider.DEFAULT_HEIGHT = 32
RaidGUIControlSlider.TEXT_PADDING = 16
RaidGUIControlSlider.TEXT_COLOR = tweak_data.gui.colors.raid_grey
RaidGUIControlSlider.TEXT_HIGHLIGHT_COLOR = tweak_data.gui.colors.raid_white
RaidGUIControlSlider.DISABLED_COLOR = tweak_data.gui.colors.raid_dark_grey
RaidGUIControlSlider.SIDELINE_COLOR = tweak_data.gui.colors.raid_red
RaidGUIControlSlider.SIDELINE_W = 3
RaidGUIControlSlider.VALUE_LABEL_W = 64
function RaidGUIControlSlider:init(parent, params)

	-- Decompilation error in this vicinity:
	slot7 = params

	RaidGUIControlSlider.super.init(slot4, self, parent)

	if not params then
		slot9 = self._name
		slot6 = "[RaidGUIControlSlider:init] Parameters not specified for slider " .. tostring(slot8)

		Application.error(slot4, Application)

		return 
	end

	slot6 = "\r\n"
	self._value = self._params.value or 0
	self._value_label_format = self._params.value_format or "%d"
	self._on_value_change_callback = params.on_value_change_callback
	self._min_display_value = params.min_display_value or 0
	self._max_display_value = params.max_display_value or 100
	self._slider_params = params.slider_params
	slot5 = self

	self._create_slider_panel(slot4)

	slot5 = self

	self._create_slider_controls(slot4)

	slot6 = self._value

	self.set_value(slot4, self)

	slot5 = self

	self.highlight_off(slot4)

	return 
end
function RaidGUIControlSlider:set_selected(value)
	slot5 = value

	RaidGUIControlSlider.super.set_selected(slot3, self)

	slot5 = value

	self._slider.set_selected(slot3, self._slider)

	return 
end
function RaidGUIControlSlider:set_enabled(enabled)
	slot5 = enabled

	RaidGUIControlSlider.super.set_enabled(slot3, self)

	slot5 = enabled

	self._slider.set_enabled(slot3, self._slider)

	slot5 = enabled

	self._slider.set_enabled(slot3, self._slider)

	if enabled then
		if self._highlighted then
			slot5 = RaidGUIControlSlider.TEXT_HIGHLIGHT_COLOR

			self._description.set_color(slot3, self._description)

			slot5 = RaidGUIControlSlider.TEXT_HIGHLIGHT_COLOR

			self._value_label.set_color(slot3, self._value_label)

			slot5 = 1

			self._sideline.set_alpha(slot3, self._sideline)
		else
			slot5 = RaidGUIControlSlider.TEXT_COLOR

			self._description.set_color(slot3, self._description)

			slot5 = RaidGUIControlSlider.TEXT_COLOR

			self._value_label.set_color(slot3, self._value_label)

			slot5 = 0

			self._sideline.set_alpha(slot3, self._sideline)
		end
	else
		slot5 = RaidGUIControlSlider.DISABLED_COLOR

		self._description.set_color(slot3, self._description)

		slot5 = RaidGUIControlSlider.DISABLED_COLOR

		self._value_label.set_color(slot3, self._value_label)

		slot5 = 0

		self._sideline.set_alpha(slot3, self._sideline)
	end

	return 
end
function RaidGUIControlSlider:_create_slider_panel()
	local slider_params = clone(slot2)
	slider_params.name = slider_params.name .. "_slider"
	slot4 = self._panel
	slider_params.layer = self._panel.layer("_slider") + 1
	slider_params.w = self._params.w or RaidGUIControlSlider.DEFAULT_WIDTH
	slider_params.h = self._params.h or RaidGUIControlSlider.DEFAULT_HEIGHT
	slot5 = slider_params
	self._slider_panel = self._panel.panel(self._params, self._panel)
	self._object = self._slider_panel

	return 
end
function RaidGUIControlSlider:_create_slider_controls()
	local sideline_params = {
		alpha = 0,
		y = 0,
		x = 0,
		w = RaidGUIControlSlider.SIDELINE_W
	}
	slot4 = self._object
	sideline_params.h = self._object.h(slot3)
	sideline_params.color = RaidGUIControlSlider.SIDELINE_COLOR
	slot5 = sideline_params
	self._sideline = self._object.rect(slot3, self._object)
	local value_label_params = {
		vertical = "center",
		align = "left",
		y = 0
	}
	slot5 = self._object
	value_label_params.x = self._object.w(self._object) - RaidGUIControlSlider.VALUE_LABEL_W
	value_label_params.w = RaidGUIControlSlider.VALUE_LABEL_W
	slot5 = self._object
	value_label_params.h = self._object.h(RaidGUIControlSlider.VALUE_LABEL_W)
	value_label_params.color = RaidGUIControlSlider.TEXT_COLOR
	value_label_params.font = tweak_data.gui.fonts.din_compressed
	value_label_params.font_size = tweak_data.gui.font_sizes.small
	slot5 = self._object
	value_label_params.layer = self._object.layer(RaidGUIControlSlider.VALUE_LABEL_W) + 1
	slot6 = value_label_params
	self._value_label = self._object.text(RaidGUIControlSlider.VALUE_LABEL_W, self._object)
	slot6 = {
		x = 0,
		y = 0,
		name = "slider_simple_" .. self._name,
		on_value_change_callback = slot7
	}
	slot11 = "_on_value_changed"
	slot7 = callback(self._name, self, self)
	self._slider = self._object.slider_simple(RaidGUIControlSlider.VALUE_LABEL_W, self._object)
	slot5 = self._slider
	slot8 = self._value_label

	self._slider.set_right(RaidGUIControlSlider.VALUE_LABEL_W, self._value_label.x(slot7))

	slot9 = self._slider
	slot6 = self._object.h(slot7) / 2 - self._slider.h(self._object) / 2

	self._slider.set_y(RaidGUIControlSlider.VALUE_LABEL_W, self._slider)

	local description_params = {
		vertical = "center",
		align = "left",
		y = 0,
		x = RaidGUIControlSlider.SIDELINE_W + RaidGUIControlSlider.TEXT_PADDING
	}
	slot6 = self._object
	description_params.w = self._object.w(RaidGUIControlSlider.TEXT_PADDING) - RaidGUIControlSlider.SIDELINE_W - RaidGUIControlSlider.VALUE_LABEL_W - RaidGUIControlSlider.TEXT_PADDING * 2
	slot6 = self._object
	description_params.h = self._object.h(RaidGUIControlSlider.TEXT_PADDING * 2)
	description_params.color = RaidGUIControlSlider.TEXT_COLOR
	description_params.font = tweak_data.gui.fonts.din_compressed
	description_params.font_size = tweak_data.gui.font_sizes.small
	description_params.text = self._params.description
	slot6 = self._object
	description_params.layer = self._object.layer(RaidGUIControlSlider.TEXT_PADDING * 2) + 1
	slot7 = description_params
	self._description = self._object.text(RaidGUIControlSlider.TEXT_PADDING * 2, self._object)

	return 
end
function RaidGUIControlSlider:on_mouse_out(x, y)
	slot7 = y

	RaidGUIControlSlider.super.on_mouse_out(slot4, self, x)

	slot5 = self

	self.on_mouse_released(slot4)

	return 
end
function RaidGUIControlSlider:get_value()
	return self._value
end
function RaidGUIControlSlider:set_value(value)
	slot6 = 100
	self._value = math.clamp(slot3, value, 0)
	slot6 = self._value / 100
	local display_value = math.lerp(slot3, self._min_display_value, self._max_display_value)
	slot5 = self._value_label
	slot9 = display_value

	self._value_label.set_text(self._min_display_value, string.format(slot7, self._value_label_format))

	slot6 = value

	self._slider.set_value(self._min_display_value, self._slider)

	slot5 = self._slider

	self._slider.render_value(self._min_display_value)

	return 
end
function RaidGUIControlSlider:_on_value_changed()
	local current_value = self._slider.get_value(slot2)
	slot5 = current_value

	self.set_value(self._slider, self)

	if self._on_value_change_callback then
		slot4 = self._value

		self._on_value_change_callback(slot3)
	end

	return 
end
function RaidGUIControlSlider:highlight_on()
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
function RaidGUIControlSlider:highlight_off()
	if not self._enabled then
		return 
	end

	self._highlighted = false
	slot3 = self._object

	self._object.stop(slot2)

	slot3 = self._object
	slot8 = "_animate_highlight_off"

	self._object.animate(slot2, callback(slot5, self, self))

	return 
end
function RaidGUIControlSlider:_animate_highlight_on()
	slot3 = self._sideline
	local starting_alpha = self._sideline.alpha(slot2)
	local duration = 0.2
	local t = duration - (1 - starting_alpha) * duration

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot10 = duration
		local alpha = Easing.quartic_out(slot6, t, 0, 1)
		slot9 = alpha

		self._sideline.set_alpha(t, self._sideline)

		slot11 = duration
		local description_r = Easing.quartic_out(t, t, RaidGUIControlSlider.TEXT_COLOR.r, RaidGUIControlSlider.TEXT_HIGHLIGHT_COLOR.r - RaidGUIControlSlider.TEXT_COLOR.r)
		slot12 = duration
		local description_g = Easing.quartic_out(t, t, RaidGUIControlSlider.TEXT_COLOR.g, RaidGUIControlSlider.TEXT_HIGHLIGHT_COLOR.g - RaidGUIControlSlider.TEXT_COLOR.g)
		local description_b = Easing.quartic_out(t, t, RaidGUIControlSlider.TEXT_COLOR.b, RaidGUIControlSlider.TEXT_HIGHLIGHT_COLOR.b - RaidGUIControlSlider.TEXT_COLOR.b)
		slot11 = self._description
		slot16 = description_b

		self._description.set_color(t, Color(duration, description_r, description_g))

		slot11 = self._value_label
		slot16 = description_b

		self._value_label.set_color(t, Color(duration, description_r, description_g))
	end

	slot7 = 1

	self._sideline.set_alpha(slot5, self._sideline)

	slot7 = RaidGUIControlSlider.TEXT_HIGHLIGHT_COLOR

	self._description.set_color(slot5, self._description)

	slot7 = RaidGUIControlSlider.TEXT_HIGHLIGHT_COLOR

	self._value_label.set_color(slot5, self._value_label)

	return 
end
function RaidGUIControlSlider:_animate_highlight_off()
	slot3 = self._sideline
	local starting_alpha = self._sideline.alpha(slot2)
	local duration = 0.2
	local t = duration - starting_alpha * duration

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot10 = duration
		local alpha = Easing.quartic_out(slot6, t, 1, -1)
		slot9 = alpha

		self._sideline.set_alpha(t, self._sideline)

		slot11 = duration
		local description_r = Easing.quartic_out(t, t, RaidGUIControlSlider.TEXT_HIGHLIGHT_COLOR.r, RaidGUIControlSlider.TEXT_COLOR.r - RaidGUIControlSlider.TEXT_HIGHLIGHT_COLOR.r)
		slot12 = duration
		local description_g = Easing.quartic_out(t, t, RaidGUIControlSlider.TEXT_HIGHLIGHT_COLOR.g, RaidGUIControlSlider.TEXT_COLOR.g - RaidGUIControlSlider.TEXT_HIGHLIGHT_COLOR.g)
		local description_b = Easing.quartic_out(t, t, RaidGUIControlSlider.TEXT_HIGHLIGHT_COLOR.b, RaidGUIControlSlider.TEXT_COLOR.b - RaidGUIControlSlider.TEXT_HIGHLIGHT_COLOR.b)
		slot11 = self._description
		slot16 = description_b

		self._description.set_color(t, Color(duration, description_r, description_g))

		slot11 = self._value_label
		slot16 = description_b

		self._value_label.set_color(t, Color(duration, description_r, description_g))
	end

	slot7 = 0

	self._sideline.set_alpha(slot5, self._sideline)

	slot7 = RaidGUIControlSlider.TEXT_COLOR

	self._description.set_color(slot5, self._description)

	slot7 = RaidGUIControlSlider.TEXT_COLOR

	self._value_label.set_color(slot5, self._value_label)

	return 
end

return 
