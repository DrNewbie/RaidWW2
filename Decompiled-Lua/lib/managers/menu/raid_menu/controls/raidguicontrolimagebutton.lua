if not RaidGUIControlImageButton then
	slot2 = RaidGUIControlImage
	slot0 = class(slot1)
end

RaidGUIControlImageButton = slot0
RaidGUIControlImageButton.DISABLED_COLOR = tweak_data.gui.colors.raid_dark_grey
function RaidGUIControlImageButton:init(parent, params)
	slot7 = params

	RaidGUIControlImageButton.super.init(slot4, self, parent)

	if not params.on_click_callback then
		slot7 = params.name

		Application.error(slot4, Application, "[RaidGUIControlImageButton:init] On click callback not specified for image button: ")
	end

	self._data = {
		value = params.value
	}
	self._pointer_type = "link"
	self._on_click_callback = params.on_click_callback
	self._color = params.color or Color.red
	self._highlight_color = params.highlight_color or Color.red
	self._disabled_color = params.disabled_color or RaidGUIControlImageButton.DISABLED_COLOR
	slot5 = self

	self._create_highlight_image(slot4)

	self._highlight_texture = params.highlight_texture
	self._highlight_texture_rect = params.highlight_texture_rect
	slot5 = self._object
	self._w = self._object.w(slot4)
	slot5 = self._object
	self._h = self._object.h(slot4)
	slot5 = self

	self.highlight_off(slot4)

	slot6 = self._color

	self._object.set_color(slot4, self._object)

	return 
end
function RaidGUIControlImageButton:_create_highlight_image()
	self._highlight_texture = self._params.highlight_texture
	self._highlight_texture_rect = self._params.highlight_texture_rect

	if not self._highlight_texture then
		return 
	end

	slot3 = self.params
	self._highlight_image_params = clone(slot2)
	self._highlight_image_params.texture = self._highlight_texture
	self._highlight_image_params.texture_rect = self._highlight_texture_rect
	self._highlight_image_params.color = self._highlight_color or Color.red
	slot4 = params
	self._highlight_image = self._panel.bitmap(self._highlight_color or Color.red, self._panel)

	return 
end
function RaidGUIControlImageButton:highlight_on()
	if self._params.no_highlight then
		return 
	end

	self._highlighted = true

	if not self._enabled then
		return 
	end

	if self._highlight_image then
		slot3 = self._object

		self._object.hide(slot2)

		slot3 = self._highlight_image

		self._highlight_image.show(slot2)
	else
		slot3 = self._object

		self._object.stop(slot2)

		if self._highlight_color ~= self._color then
			slot3 = self._object
			slot8 = "_animate_highlight_on"

			self._object.animate(slot2, callback(slot5, self, self))
		end
	end

	return 
end
function RaidGUIControlImageButton:highlight_off()
	self._highlighted = false

	if not self._enabled then
		return 
	end

	if self._highlight_image then
		slot3 = self._object

		self._object.show(slot2)

		slot3 = self._highlight_image

		self._highlight_image.hide(slot2)
	else
		slot3 = self._object

		self._object.stop(slot2)

		if self._highlight_color ~= self._color then
			slot3 = self._object
			slot8 = "_animate_highlight_off"

			self._object.animate(slot2, callback(slot5, self, self))
		end
	end

	return 
end
function RaidGUIControlImageButton:on_mouse_pressed(button)
	if not self._enabled then
		return 
	end

	if self._active_click_animation then
		slot5 = self._active_click_animation

		self._object.stop(slot3, self._object)
	end

	if self._active_click_animation then
		slot5 = self._active_click_animation

		self._object.stop(slot3, self._object)
	end

	slot4 = self._object
	slot9 = "_animate_press"
	self._active_click_animation = self._object.animate(slot3, callback(slot6, self, self))

	return 
end
function RaidGUIControlImageButton:mouse_released(o, button, x, y)
	if not self._enabled then
		return 
	end

	if self._active_click_animation then
		slot8 = self._active_click_animation

		self._object.stop(slot6, self._object)
	end

	slot8 = button

	self.on_mouse_released(slot6, self)

	return true
end
function RaidGUIControlImageButton:on_mouse_released(button)
	if self._active_click_animation then
		slot5 = self._active_click_animation

		self._object.stop(slot3, self._object)
	end

	slot4 = self._object
	slot9 = "_animate_release"
	self._active_click_animation = self._object.animate(slot3, callback(slot6, self, self))
	slot6 = self._data

	self._on_click_callback(slot3, button, self)

	return 
end
function RaidGUIControlImageButton:set_enabled(enabled)
	slot5 = enabled

	RaidGUIControlImageButton.super.set_enabled(slot3, self)

	if enabled then
		if self._highlighted then
			slot5 = self._highlight_color

			self._object.set_color(slot3, self._object)
		else
			slot5 = self._color

			self._object.set_color(slot3, self._object)
		end
	else
		slot5 = self._disabled_color

		self._object.set_color(slot3, self._object)
	end

	return 
end
function RaidGUIControlImageButton:_animate_highlight_on()
	self._highlight_animation_t = self._highlight_animation_t or 0
	local duration = 0.2
	local t = self._highlight_animation_t * duration

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot9 = duration
		local border_r = Easing.quartic_out(slot5, t, self._color.r, self._highlight_color.r - self._color.r)
		slot10 = duration
		local border_g = Easing.quartic_out(t, t, self._color.g, self._highlight_color.g - self._color.g)
		local border_b = Easing.quartic_out(t, t, self._color.b, self._highlight_color.b - self._color.b)
		slot9 = self._object
		slot14 = border_b

		self._object.set_color(t, Color(duration, border_r, border_g))

		self._highlight_animation_t = t / duration
	end

	slot6 = self._highlight_color

	self._object.set_color(slot4, self._object)

	self._highlight_animation_t = 1

	return 
end
function RaidGUIControlImageButton:_animate_highlight_off()
	self._highlight_animation_t = self._highlight_animation_t or 0
	local duration = 0.2
	local t = (1 - self._highlight_animation_t) * duration

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot9 = duration
		local border_r = Easing.quartic_out(slot5, t, self._highlight_color.r, self._color.r - self._highlight_color.r)
		slot10 = duration
		local border_g = Easing.quartic_out(t, t, self._highlight_color.g, self._color.g - self._highlight_color.g)
		local border_b = Easing.quartic_out(t, t, self._highlight_color.b, self._color.b - self._highlight_color.b)
		slot9 = self._object
		slot14 = border_b

		self._object.set_color(t, Color(duration, border_r, border_g))

		self._highlight_animation_t = 1 - t / duration
	end

	slot6 = self._color

	self._object.set_color(slot4, self._object)

	self._highlight_animation_t = 0

	return 
end
function RaidGUIControlImageButton:_animate_press()
	local t = 0
	local original_w = self._w
	local original_h = self._h
	slot6 = self._object
	local starting_scale = self._object.w(slot5) / original_w
	local duration = 0.25 * (starting_scale - 0.9) / 0.1
	slot8 = self._object
	local center_x, center_y = self._object.center(slot7)

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot14 = duration
		local scale = Easing.quartic_out(slot10, t, starting_scale, 0.9 - starting_scale)
		slot13 = original_w * scale

		self._object.set_w(t, self._object)

		slot13 = original_h * scale

		self._object.set_h(t, self._object)

		slot14 = center_y

		self._object.set_center(t, self._object, center_x)
	end

	slot11 = original_w * 0.9

	self._object.set_w(slot9, self._object)

	slot11 = original_h * 0.9

	self._object.set_h(slot9, self._object)

	slot12 = center_y

	self._object.set_center(slot9, self._object, center_x)

	return 
end
function RaidGUIControlImageButton:_animate_release()
	local t = 0
	local duration = 0.25
	local target_w = self._w
	local target_h = self._h
	slot7 = self._object
	local center_x, center_y = self._object.center(slot6)
	slot10 = target_w * 0.9

	self._object.set_w(slot8, self._object)

	slot10 = target_h * 0.9

	self._object.set_h(slot8, self._object)

	slot11 = center_y

	self._object.set_center(slot8, self._object, center_x)

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot13 = duration
		local scale = Easing.quartic_out(slot9, t, 0.9, 0.1)
		slot12 = target_w * scale

		self._object.set_w(t, self._object)

		slot12 = target_h * scale

		self._object.set_h(t, self._object)

		slot13 = center_y

		self._object.set_center(t, self._object, center_x)
	end

	slot10 = target_w

	self._object.set_w(slot8, self._object)

	slot10 = target_h

	self._object.set_h(slot8, self._object)

	slot11 = center_y

	self._object.set_center(slot8, self._object, center_x)

	return 
end

return 
