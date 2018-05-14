ProgressBarGuiObject = ProgressBarGuiObject or class()
function ProgressBarGuiObject:init(panel, config)
	self._panel = panel
	self._width = 288
	self._height = 8
	slot5 = self._panel
	self._x = self._panel.w(slot4) / 2
	slot5 = self._panel
	self._y = self._panel.h(slot4) / 2 + 191
	slot7 = 0.1803921568627451
	self._color_red = Color(slot4, 0.7215686274509804, 0.2235294117647059)
	slot7 = 0.13725490196078433
	self._color_orange = Color(slot4, 0.8666666666666667, 0.3607843137254902)
	slot7 = 0.2196078431372549
	self._color_yellow = Color(slot4, 0.8666666666666667, 0.6039215686274509)
	slot7 = 0.2980392156862745
	self._color_green = Color(slot4, 0.39215686274509803, 0.7372549019607844)
	self._is_being_animated = false
	slot6 = {
		name = "progress_bar_bg",
		layer = 2,
		visible = false,
		x = self._x - self._width / 2,
		y = self._y - self._width / 2,
		texture = tweak_data.gui.icons.interaction_hold_meter_bg.texture,
		texture_rect = tweak_data.gui.icons.interaction_hold_meter_bg.texture_rect,
		w = self._width,
		h = self._height
	}
	self._progress_bar_bg = self._panel.bitmap(slot4, self._panel)
	slot6 = {
		blend_mode = "normal",
		name = "progress_bar",
		h = 0,
		w = 0,
		layer = 3,
		x = self._x - self._width / 2,
		y = self._y - self._height / 2,
		color = tweak_data.gui.colors.interaction_bar
	}
	self._progress_bar = self._panel.rect(slot4, self._panel)

	if config ~= nil and config.description then
		slot6 = config.description

		self._create_description(slot4, self)
	end

	return 
end
function ProgressBarGuiObject:_create_description(description)
	local description_params = {
		name = "progress_bar_description",
		h = 32,
		w = 256,
		align = "center",
		valign = "bottom",
		font = tweak_data.gui.fonts.din_compressed_outlined_24,
		font_size = tweak_data.gui.font_sizes.size_24,
		color = tweak_data.gui.colors.raid_white,
		text = description
	}
	slot6 = description_params
	self._description = self._panel.text(slot4, self._panel)
	slot5 = self._description
	slot8 = self._progress_bar_bg

	self._description.set_center_x(slot4, self._progress_bar_bg.center_x(slot7))

	slot6 = self._y - 10

	self._description.set_bottom(slot4, self._description)

	return 
end
function ProgressBarGuiObject:set_progress(current, total)
	if not self._progress_bar then
		return 
	end

	local progress = current / total
	slot7 = progress * self._width

	self._progress_bar.set_width(slot5, self._progress_bar)

	return 
end
function ProgressBarGuiObject:show()
	slot8 = "_animate_interaction_start"

	self._progress_bar_bg.animate(slot2, self._progress_bar_bg, callback(slot5, self, self))

	slot8 = "_animate_interaction_start"
	slot5 = 0.25

	self._progress_bar.animate(slot2, self._progress_bar, callback(0.25, self, self))

	return 
end
function ProgressBarGuiObject:hide(complete)
	if complete then
		slot4 = self._progress_bar_bg
		slot9 = "_animate_interaction_complete"

		self._progress_bar_bg.animate(slot3, callback(slot6, self, self))

		slot4 = self._progress_bar
		slot9 = "_animate_interaction_complete"

		self._progress_bar.animate(slot3, callback(slot6, self, self))
	else
		slot9 = "_animate_interaction_cancel"

		self._progress_bar_bg.animate(slot3, self._progress_bar_bg, callback(slot6, self, self))

		slot9 = "_animate_interaction_cancel"
		slot6 = 0.15

		self._progress_bar.animate(slot3, self._progress_bar, callback(0.15, self, self))
	end

	if self._description then
		slot5 = self._description

		self._panel.remove(slot3, self._panel)

		self._description = nil
	end

	if self._progress_bar then
		slot4 = self._progress_bar_bg

		self._progress_bar_bg.stop(slot3)

		slot4 = self._progress_bar

		self._progress_bar.stop(slot3)

		slot5 = 0

		self._progress_bar_bg.set_h(slot3, self._progress_bar_bg)

		slot5 = 0

		self._progress_bar.set_w(slot3, self._progress_bar)

		slot5 = 0

		self._progress_bar.set_h(slot3, self._progress_bar)
	end

	return 
end
function ProgressBarGuiObject:animate_progress(duration)
	slot9 = "_animate_interaction_duration"
	self._auto_animation = self._progress_bar.animate(slot3, self._progress_bar, callback(duration, self, self))

	return 
end
function ProgressBarGuiObject:set_position(x, y)
	if not self._progress_bar then
		return 
	end

	slot7 = y

	self._progress_bar_bg.set_center(slot4, self._progress_bar_bg, x)

	slot7 = y

	self._progress_bar.set_center(slot4, self._progress_bar, x)

	if self._description then
		slot5 = self._description
		slot8 = self._progress_bar_bg

		self._description.set_center_x(slot4, self._progress_bar_bg.center_x(slot7))

		slot8 = self._progress_bar_bg
		slot6 = self._progress_bar_bg.y(slot7) - 10

		self._description.set_bottom(slot4, self._description)
	end

	self._x = x
	self._y = y

	return 
end
function ProgressBarGuiObject:set_x(x)
	if not self._progress_bar then
		return 
	end

	slot5 = x

	self._progress_bar_bg.set_x(slot3, self._progress_bar_bg)

	slot5 = x

	self._progress_bar.set_x(slot3, self._progress_bar)

	if self._description then
		slot4 = self._description
		slot7 = self._progress_bar_bg

		self._description.set_center_x(slot3, self._progress_bar_bg.center_x(slot6))

		slot7 = self._progress_bar_bg
		slot5 = self._progress_bar_bg.y(slot6) - 10

		self._description.set_bottom(slot3, self._description)
	end

	self._x = x

	return 
end
function ProgressBarGuiObject:set_top(y)
	if not self._progress_bar then
		return 
	end

	slot5 = y

	self._progress_bar_bg.set_top(slot3, self._progress_bar_bg)

	slot5 = y

	self._progress_bar.set_top(slot3, self._progress_bar)

	if self._description then
		slot4 = self._description
		slot7 = self._progress_bar_bg

		self._description.set_center_x(slot3, self._progress_bar_bg.center_x(slot6))

		slot7 = self._progress_bar_bg
		slot5 = self._progress_bar_bg.y(slot6) - 10

		self._description.set_bottom(slot3, self._description)
	end

	self._y = y + self._height / 2

	return 
end
function ProgressBarGuiObject:set_bottom(y)
	if not self._progress_bar then
		return 
	end

	slot5 = y

	self._progress_bar_bg.set_bottom(slot3, self._progress_bar_bg)

	slot5 = y

	self._progress_bar.set_bottom(slot3, self._progress_bar)

	if self._description then
		slot4 = self._description
		slot7 = self._progress_bar_bg

		self._description.set_center_x(slot3, self._progress_bar_bg.center_x(slot6))

		slot7 = self._progress_bar_bg
		slot5 = self._progress_bar_bg.y(slot6) - 10

		self._description.set_bottom(slot3, self._description)
	end

	self._y = y - self._height / 2

	return 
end
function ProgressBarGuiObject:set_center_y(y)
	if not self._progress_bar then
		return 
	end

	slot5 = y

	self._progress_bar_bg.set_center_y(slot3, self._progress_bar_bg)

	slot5 = y

	self._progress_bar.set_center_y(slot3, self._progress_bar)

	if self._description then
		slot4 = self._description
		slot7 = self._progress_bar_bg

		self._description.set_center_x(slot3, self._progress_bar_bg.center_x(slot6))

		slot7 = self._progress_bar_bg
		slot5 = self._progress_bar_bg.y(slot6) - 10

		self._description.set_bottom(slot3, self._description)
	end

	self._y = y

	return 
end
function ProgressBarGuiObject:set_layer(layer)
	if not self._progress_bar then
		return 
	end

	slot5 = layer

	self._progress_bar_bg.set_layer(slot3, self._progress_bar_bg)

	slot5 = layer + 1

	self._progress_bar.set_layer(slot3, self._progress_bar)

	return 
end
function ProgressBarGuiObject:width()
	return self._width
end
function ProgressBarGuiObject:height()
	return self._height
end
function ProgressBarGuiObject:layer()
	slot3 = self._progress_bar_bg

	return self._progress_bar_bg.layer(slot2)
end
function ProgressBarGuiObject:remove()
	if not self._progress_bar then
		return 
	end

	slot4 = self._progress_bar_bg

	self._panel.remove(slot2, self._panel)

	slot4 = self._progress_bar

	self._panel.remove(slot2, self._panel)

	if self._description then
		slot4 = self._description

		self._panel.remove(slot2, self._panel)

		self._description = nil
	end

	return 
end
function ProgressBarGuiObject:_animate_interaction_start(progress_bar, duration)
	local t = 0
	slot7 = true

	progress_bar.set_visible(slot5, progress_bar)

	self._is_being_animated = true

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot11 = duration
		local current_height = self._ease_out_quint(slot6, self, t, 0, self._height)
		slot9 = current_height

		progress_bar.set_height(self, progress_bar)

		slot9 = self._y - current_height / 2

		progress_bar.set_y(self, progress_bar)
	end

	slot7 = self._height

	progress_bar.set_height(slot5, progress_bar)

	self._is_being_animated = false

	return 
end
function ProgressBarGuiObject:_animate_interaction_cancel(progress_bar, duration)
	local t = 0
	slot6 = progress_bar
	local start_height = progress_bar.h(slot5)

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot12 = duration
		local current_height = self._ease_in_quint(slot7, self, t, start_height, -start_height)
		slot10 = current_height

		progress_bar.set_height(self, progress_bar)

		slot10 = self._y - current_height / 2

		progress_bar.set_y(self, progress_bar)
	end

	slot8 = 0

	progress_bar.set_height(slot6, progress_bar)

	slot8 = false

	progress_bar.set_visible(slot6, progress_bar)

	return 
end
function ProgressBarGuiObject:_animate_interaction_complete(progress_bar)
	local duration = 0.3
	local t = 0

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot11 = duration
		local current_width = self._ease_out_quint(slot6, self, t, self._width, -self._width)
		slot9 = current_width

		progress_bar.set_width(self, progress_bar)

		slot9 = self._x + self._width / 2

		progress_bar.set_right(self, progress_bar)
	end

	slot7 = 0

	progress_bar.set_width(slot5, progress_bar)

	slot7 = false

	progress_bar.set_visible(slot5, progress_bar)

	return 
end
function ProgressBarGuiObject:_animate_interaction_duration(progress_bar, duration)
	local t = 0
	self._is_being_animated = true

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		local progress = t / duration
		slot9 = progress * self._width

		progress_bar.set_width(slot7, progress_bar)

		slot9 = self._x - self._width / 2

		progress_bar.set_left(slot7, progress_bar)
	end

	slot7 = self._width

	progress_bar.set_width(slot5, progress_bar)

	self._is_being_animated = false

	return 
end
function ProgressBarGuiObject:_ease_in_quint(t, starting_value, change, duration)
	t = t / duration

	return change * t * t * t * t * t + starting_value
end
function ProgressBarGuiObject:_ease_out_quint(t, starting_value, change, duration)
	t = t / duration
	t = t - 1

	return change * (t * t * t * t * t + 1) + starting_value
end

return 
