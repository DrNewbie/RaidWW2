if not RaidGUIControlIntelImage then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlIntelImage = slot0
RaidGUIControlIntelImage.DEFAULT_W = 236
RaidGUIControlIntelImage.DEFAULT_H = 175
RaidGUIControlIntelImage.BACKGROUND_SIZE_PERCENTAGE = 0.85
RaidGUIControlIntelImage.FOREGROUND_SIZE_PERCENTAGE = 0.92
RaidGUIControlIntelImage.SELECTOR_ICON = "ico_sel_rect_top_left"
RaidGUIControlIntelImage.PRESSED_SIZE = 0.95
RaidGUIControlIntelImage.HOVER_SIZE = 1.05
RaidGUIControlIntelImage.ACTIVE_SIZE = 0.97
function RaidGUIControlIntelImage:init(parent, params)
	slot7 = params

	RaidGUIControlIntelImage.super.init(slot4, self, parent)

	self._on_click_callback = params.on_click_callback
	self._static = params.static
	slot5 = self

	self._create_panels(slot4)

	slot5 = self

	self._create_image(slot4)

	slot5 = self._object
	self._center_x, self._center_y = self._object.center(slot4)

	return 
end
function RaidGUIControlIntelImage:_create_panels()
	slot3 = self._params
	local panel_params = clone(slot2)
	panel_params.name = panel_params.name .. "_panel"

	if not panel_params.layer then
		slot4 = self._panel
		slot2 = self._panel.layer(slot3) + 1
	end

	panel_params.layer = slot2
	panel_params.x = self._params.x or 0
	panel_params.y = self._params.y or 0
	panel_params.w = self._params.w or RaidGUIControlIntelImage.DEFAULT_W
	panel_params.h = self._params.h or RaidGUIControlIntelImage.DEFAULT_H
	panel_params.alpha = panel_params.alpha or 1
	slot5 = panel_params
	self._object = self._panel.panel(slot3, self._panel)

	return 
end
function RaidGUIControlIntelImage:_create_image()
	local default_image = "ui/loading_screens/loading_trainyard"
	local default_rect = {
		256,
		0,
		1536,
		1024
	}
	local image_panel_params = {
		valign = "scale",
		name = "background_panel",
		halign = "scale"
	}
	slot6 = self._object
	image_panel_params.w = self._object.w(slot5) * RaidGUIControlIntelImage.BACKGROUND_SIZE_PERCENTAGE
	slot6 = self._object
	image_panel_params.h = self._object.h(RaidGUIControlIntelImage.BACKGROUND_SIZE_PERCENTAGE) * RaidGUIControlIntelImage.BACKGROUND_SIZE_PERCENTAGE
	slot6 = self._object
	image_panel_params.layer = self._object.layer(RaidGUIControlIntelImage.BACKGROUND_SIZE_PERCENTAGE) + 1
	slot7 = image_panel_params
	self._image_panel = self._object.panel(RaidGUIControlIntelImage.BACKGROUND_SIZE_PERCENTAGE, self._object)
	slot9 = self._object
	slot7 = self._object.w(slot8) / 2

	self._image_panel.set_center_x(RaidGUIControlIntelImage.BACKGROUND_SIZE_PERCENTAGE, self._image_panel)

	slot9 = self._object
	slot7 = self._object.h(slot8) / 2

	self._image_panel.set_center_y(RaidGUIControlIntelImage.BACKGROUND_SIZE_PERCENTAGE, self._image_panel)

	local background_params = {
		texture = "ui/main_menu/textures/mission_paper_background",
		name = "background",
		halign = "scale",
		valign = "scale",
		y = 0,
		x = 0
	}
	slot7 = self._image_panel
	background_params.w = self._image_panel.w(self._image_panel)
	slot7 = self._image_panel
	background_params.h = self._image_panel.h(self._image_panel)
	background_params.texture_rect = {
		1063,
		5,
		882,
		613
	}
	background_params.layer = self._object.layer(self._image_panel) + 1
	slot8 = background_params
	self._background = self._image_panel.bitmap(self._image_panel, self._image_panel)
	local foreground_params = {
		name = "foreground",
		halign = "scale",
		valign = "scale"
	}
	slot8 = self._image_panel
	foreground_params.w = self._image_panel.w(self._image_panel) * RaidGUIControlIntelImage.FOREGROUND_SIZE_PERCENTAGE
	slot8 = self._image_panel
	foreground_params.h = self._image_panel.h(RaidGUIControlIntelImage.FOREGROUND_SIZE_PERCENTAGE) * RaidGUIControlIntelImage.FOREGROUND_SIZE_PERCENTAGE
	foreground_params.texture = (self._params.photo and tweak_data.gui.mission_photos[self._params.photo].texture) or default_image
	foreground_params.texture_rect = (self._params.photo and tweak_data.gui.mission_photos[self._params.photo].texture_rect) or default_rect
	slot8 = self._object
	foreground_params.layer = self._object.layer(self._object) + 2
	slot9 = foreground_params
	self._foreground = self._image_panel.bitmap(self._object, self._image_panel)
	slot11 = self._image_panel
	slot9 = self._image_panel.w(slot10) / 2

	self._foreground.set_center_x(self._object, self._foreground)

	slot11 = self._image_panel
	slot9 = self._image_panel.h(slot10) / 2

	self._foreground.set_center_y(self._object, self._foreground)

	local selector_params = {
		name = "selector",
		h = 24,
		w = 24,
		halign = "scale",
		valign = "scale",
		alpha = 0,
		y = 0,
		x = 0,
		texture = tweak_data.gui.icons[RaidGUIControlIntelImage.SELECTOR_ICON].texture,
		texture_rect = tweak_data.gui.icons[RaidGUIControlIntelImage.SELECTOR_ICON].texture_rect
	}
	slot9 = self._object
	selector_params.layer = self._object.layer(RaidGUIControlIntelImage.SELECTOR_ICON) + 3
	slot10 = selector_params
	self._selector = self._image_panel.bitmap(RaidGUIControlIntelImage.SELECTOR_ICON, self._image_panel)
	slot9 = self._object
	self._size_w = self._object.w(RaidGUIControlIntelImage.SELECTOR_ICON)
	slot9 = self._object
	self._size_h = self._object.h(RaidGUIControlIntelImage.SELECTOR_ICON)

	return 
end
function RaidGUIControlIntelImage:on_mouse_pressed(button)
	if self._static then
		return 
	end

	slot4 = self._object

	self._object.stop(slot3)

	slot4 = self._object
	slot9 = "_animate_press"

	self._object.animate(slot3, callback(slot6, self, self))

	return 
end
function RaidGUIControlIntelImage:on_mouse_released(button)
	if self._static then
		return 
	end

	if self._on_click_callback and not self._params.no_click then
		self._on_click_callback()
	end

	slot4 = self

	self.select(slot3)

	slot4 = self._object

	self._object.stop(slot3)

	slot4 = self._object
	slot9 = "_animate_release"

	self._object.animate(slot3, callback(slot6, self, self))

	return true
end
function RaidGUIControlIntelImage:highlight_on()
	if self._active or self._static then
		return 
	end

	slot3 = self._object

	self._object.stop(slot2)

	slot3 = self._object
	slot8 = "_animate_highlight_on"

	self._object.animate(slot2, callback(slot5, self, self))

	return 
end
function RaidGUIControlIntelImage:highlight_off()
	if self._active or self._static then
		return 
	end

	slot3 = self._object

	self._object.stop(slot2)

	slot3 = self._object
	slot8 = "_animate_highlight_off"

	self._object.animate(slot2, callback(slot5, self, self))

	return 
end
function RaidGUIControlIntelImage:set_left(left)
	slot5 = left

	self._object.set_left(slot3, self._object)

	slot4 = self._object
	self._center_x, self._center_y = self._object.center(slot3)

	return 
end
function RaidGUIControlIntelImage:set_right(right)
	slot5 = right

	self._object.set_right(slot3, self._object)

	slot4 = self._object
	self._center_x, self._center_y = self._object.center(slot3)

	return 
end
function RaidGUIControlIntelImage:set_top(top)
	slot5 = top

	self._object.set_top(slot3, self._object)

	slot4 = self._object
	self._center_x, self._center_y = self._object.center(slot3)

	return 
end
function RaidGUIControlIntelImage:set_bottom(bottom)
	slot5 = bottom

	self._object.set_bottom(slot3, self._object)

	slot4 = self._object
	self._center_x, self._center_y = self._object.center(slot3)

	return 
end
function RaidGUIControlIntelImage:set_center_x(center_x)
	slot5 = center_x

	self._object.set_center_x(slot3, self._object)

	slot4 = self._object
	self._center_x, self._center_y = self._object.center(slot3)

	return 
end
function RaidGUIControlIntelImage:set_center_y(center_y)
	slot5 = center_y

	self._object.set_center_y(slot3, self._object)

	slot4 = self._object
	self._center_x, self._center_y = self._object.center(slot3)

	return 
end
function RaidGUIControlIntelImage:select(skip_animation)
	if self._static then
		return 
	end

	self._active = true

	if skip_animation then
		slot5 = 1

		self._selector.set_alpha(slot3, self._selector)
	else
		slot4 = self._selector

		self._selector.stop(slot3)

		slot4 = self._selector
		slot9 = "_animate_selected"

		self._selector.animate(slot3, callback(slot6, self, self))
	end

	return 
end
function RaidGUIControlIntelImage:unselect()
	if self._static then
		return 
	end

	self._active = false
	slot3 = self._selector

	self._selector.stop(slot2)

	slot3 = self._selector
	slot8 = "_animate_unselected"

	self._selector.animate(slot2, callback(slot5, self, self))

	return 
end
function RaidGUIControlIntelImage:set_selected(value)
	if self._static then
		return 
	end

	self._selected = value

	if self._selected then
		slot4 = self
		slot7 = "0"

		self.on_mouse_released(slot3, Idstring(slot6))

		slot4 = self

		self.highlight_on(slot3)
	else
		slot4 = self

		self.unselect(slot3)

		slot4 = self

		self.highlight_off(slot3)
	end

	return 
end
function RaidGUIControlIntelImage:confirm_pressed()
	if self._static then
		return 
	end

	if self._selected then
		slot3 = self

		self.select(slot2)

		return true
	end

	return false
end
function RaidGUIControlIntelImage:close()
	return 
end
function RaidGUIControlIntelImage:_animate_selected()
	slot3 = self._selector
	local starting_alpha = self._selector.alpha(slot2)
	local duration = 0.2
	local t = duration - (1 - starting_alpha) * duration

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot10 = duration
		local alpha = Easing.quartic_out(slot6, t, 0, 1)
		slot9 = alpha

		self._selector.set_alpha(t, self._selector)
	end

	slot7 = 1

	self._selector.set_alpha(slot5, self._selector)

	return 
end
function RaidGUIControlIntelImage:_animate_unselected()
	slot3 = self._selector
	local starting_alpha = self._selector.alpha(slot2)
	local duration = 0.2
	local t = duration - starting_alpha * duration

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot10 = duration
		local alpha = Easing.quartic_out(slot6, t, 1, -1)
		slot9 = alpha

		self._selector.set_alpha(t, self._selector)

		slot11 = duration
		local scale = Easing.quartic_out(t, t, RaidGUIControlIntelImage.ACTIVE_SIZE, 1 - RaidGUIControlIntelImage.ACTIVE_SIZE)
		slot11 = self._size_h * scale

		self._object.set_size(t, self._object, self._size_w * scale)

		slot11 = self._center_y

		self._object.set_center(t, self._object, self._center_x)
	end

	slot7 = 0

	self._selector.set_alpha(slot5, self._selector)

	slot8 = self._size_h

	self._object.set_size(slot5, self._object, self._size_w)

	slot8 = self._center_y

	self._object.set_center(slot5, self._object, self._center_x)

	return 
end
function RaidGUIControlIntelImage:_animate_highlight_on()
	local t = 0
	local duration = 0.05

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot9 = duration
		local scale = Easing.quartic_in(slot5, t, 1, RaidGUIControlIntelImage.HOVER_SIZE - 1)
		slot9 = self._size_h * scale

		self._object.set_size(t, self._object, self._size_w * scale)

		slot9 = self._center_y

		self._object.set_center(t, self._object, self._center_x)
	end

	slot7 = self._size_h * RaidGUIControlIntelImage.HOVER_SIZE

	self._object.set_size(slot4, self._object, self._size_w * RaidGUIControlIntelImage.HOVER_SIZE)

	slot7 = self._center_y

	self._object.set_center(slot4, self._object, self._center_x)

	return 
end
function RaidGUIControlIntelImage:_animate_highlight_off()
	local t = 0
	local duration = 0.25
	slot7 = self._size_h * RaidGUIControlIntelImage.HOVER_SIZE

	self._object.set_size(slot4, self._object, self._size_w * RaidGUIControlIntelImage.HOVER_SIZE)

	slot7 = self._center_y

	self._object.set_center(slot4, self._object, self._center_x)

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot9 = duration
		local scale = Easing.quartic_out(slot5, t, RaidGUIControlIntelImage.HOVER_SIZE, 1 - RaidGUIControlIntelImage.HOVER_SIZE)
		slot9 = self._size_h * scale

		self._object.set_size(t, self._object, self._size_w * scale)

		slot9 = self._center_y

		self._object.set_center(t, self._object, self._center_x)
	end

	slot7 = self._size_h

	self._object.set_size(slot4, self._object, self._size_w)

	slot7 = self._center_y

	self._object.set_center(slot4, self._object, self._center_x)

	return 
end
function RaidGUIControlIntelImage:_animate_press()
	local t = 0
	local duration = 0.05
	slot5 = self._object
	local initial_size = self._object.w(slot4) / self._size_w

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot10 = duration
		local scale = Easing.quartic_in(slot6, t, initial_size, -(initial_size - RaidGUIControlIntelImage.PRESSED_SIZE))
		slot10 = self._size_h * scale

		self._object.set_size(t, self._object, self._size_w * scale)

		slot10 = self._center_y

		self._object.set_center(t, self._object, self._center_x)
	end

	slot8 = self._size_h * RaidGUIControlIntelImage.PRESSED_SIZE

	self._object.set_size(slot5, self._object, self._size_w * RaidGUIControlIntelImage.PRESSED_SIZE)

	slot8 = self._center_y

	self._object.set_center(slot5, self._object, self._center_x)

	return 
end
function RaidGUIControlIntelImage:_animate_release()
	local t = 0
	local duration = 0.25
	slot7 = self._size_h * RaidGUIControlIntelImage.PRESSED_SIZE

	self._object.set_size(slot4, self._object, self._size_w * RaidGUIControlIntelImage.PRESSED_SIZE)

	slot7 = self._center_y

	self._object.set_center(slot4, self._object, self._center_x)

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot9 = duration
		local scale = Easing.quartic_out(slot5, t, RaidGUIControlIntelImage.PRESSED_SIZE, RaidGUIControlIntelImage.ACTIVE_SIZE - RaidGUIControlIntelImage.PRESSED_SIZE)
		slot9 = self._size_h * scale

		self._object.set_size(t, self._object, self._size_w * scale)

		slot9 = self._center_y

		self._object.set_center(t, self._object, self._center_x)
	end

	slot7 = self._size_h * RaidGUIControlIntelImage.ACTIVE_SIZE

	self._object.set_size(slot4, self._object, self._size_w * RaidGUIControlIntelImage.ACTIVE_SIZE)

	slot7 = self._center_y

	self._object.set_center(slot4, self._object, self._center_x)

	return 
end

return 
