-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not RaidGUIControlButtonToggleSmall then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlButtonToggleSmall = slot0
RaidGUIControlButtonToggleSmall.BORDER_ICON = "players_icon_outline"
RaidGUIControlButtonToggleSmall.BORDER_COLOR = tweak_data.gui.colors.raid_grey
RaidGUIControlButtonToggleSmall.BORDER_HOVER_COLOR = tweak_data.gui.colors.raid_red
function RaidGUIControlButtonToggleSmall:init(parent, params)
	slot7 = params

	RaidGUIControlButtonToggleSmall.super.init(slot4, self, parent)

	slot5 = self

	self._create_panel(slot4)

	slot5 = self

	self._create_image_panel(slot4)

	slot5 = self

	self._create_border(slot4)

	slot5 = self

	self._create_active_icon(slot4)

	slot5 = self

	self._create_inactive_icon(slot4)

	self._value = self._params.value or false
	self._play_mouse_over_sound = true
	self._on_selected_callback = params.on_selected_callback
	self._on_unselected_callback = params.on_unselected_callback
	self._on_click_callback = params.on_click_callback
	self._visible = self._params.visible
	self._highlight_animation_t = 0
	slot5 = self

	self._render_images(slot4)

	return 
end
function RaidGUIControlButtonToggleSmall:_create_panel()
	local panel_params = {}
	slot5 = self._name
	slot3 = tostring(slot4)
	panel_params.name = "button_toggle_small_" .. slot3
	slot5 = RaidGUIControlButtonToggleSmall.BORDER_ICON
	panel_params.w = tweak_data.gui.icon_w(slot3, tweak_data.gui)
	slot5 = RaidGUIControlButtonToggleSmall.BORDER_ICON
	panel_params.h = tweak_data.gui.icon_h(slot3, tweak_data.gui)
	slot5 = panel_params
	self._object = self._panel.panel(slot3, self._panel)

	return 
end
function RaidGUIControlButtonToggleSmall:_create_image_panel()
	local image_panel_params = {
		name = "image_panel"
	}
	slot5 = image_panel_params
	self._image_panel = self._object.panel(slot3, self._object)

	return 
end
function RaidGUIControlButtonToggleSmall:_create_border()
	local checkbox_border_params = {
		valign = "scale",
		halign = "scale",
		texture = tweak_data.gui.icons[RaidGUIControlButtonToggleSmall.BORDER_ICON].texture,
		texture_rect = tweak_data.gui.icons[RaidGUIControlButtonToggleSmall.BORDER_ICON].texture_rect,
		color = RaidGUIControlButtonToggleSmall.BORDER_COLOR
	}
	slot5 = checkbox_border_params
	self._border = self._image_panel.bitmap(RaidGUIControlButtonToggleSmall.BORDER_ICON, self._image_panel)

	return 
end
function RaidGUIControlButtonToggleSmall:_create_active_icon()
	local active_icon = (self._params.active_icon ~= nil and self._params.active_icon) or self._params.inactive_icon
	local active_icon_params = {
		valign = "scale",
		halign = "scale",
		texture = tweak_data.gui.icons[active_icon].texture,
		texture_rect = tweak_data.gui.icons[active_icon].texture_rect
	}
	slot6 = active_icon_params
	self._active_icon = self._image_panel.bitmap(slot4, self._image_panel)
	slot9 = self._image_panel
	slot7 = self._image_panel.h(self._image_panel) / 2

	self._active_icon.set_center(slot4, self._active_icon, self._image_panel.w(slot7) / 2)

	return 
end
function RaidGUIControlButtonToggleSmall:_create_inactive_icon()
	local inactive_icon = (self._params.inactive_icon ~= nil and self._params.inactive_icon) or self._params.active_icon
	local inactive_icon_params = {
		valign = "scale",
		halign = "scale",
		texture = tweak_data.gui.icons[inactive_icon].texture,
		texture_rect = tweak_data.gui.icons[inactive_icon].texture_rect
	}
	slot6 = inactive_icon_params
	self._inactive_icon = self._image_panel.bitmap(slot4, self._image_panel)
	slot9 = self._image_panel
	slot7 = self._image_panel.h(self._image_panel) / 2

	self._inactive_icon.set_center(slot4, self._inactive_icon, self._image_panel.w(slot7) / 2)

	return 
end
function RaidGUIControlButtonToggleSmall:highlight_on()
	if self._object then
		slot3 = self._object._engine_panel

		if alive(slot2) then
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

			if self._on_selected_callback then
				self._on_selected_callback()
			end
		end
	end

	return 
end
function RaidGUIControlButtonToggleSmall:highlight_off()
	if self._object then
		slot3 = self._object._engine_panel

		if alive(slot2) then
			slot3 = self._object

			self._object.stop(slot2)

			slot3 = self._object
			slot8 = "_animate_highlight_off"

			self._object.animate(slot2, callback(slot5, self, self))

			self._play_mouse_over_sound = true

			if self._on_unselected_callback then
				self._on_unselected_callback()
			end
		end
	end

	return 
end
function RaidGUIControlButtonToggleSmall:mouse_pressed(o, button, x, y)
	slot9 = y

	if self.inside(slot6, self, x) then
		slot7 = self._image_panel

		self._image_panel.stop(slot6)

		slot7 = self._image_panel
		slot12 = "_animate_press"

		self._image_panel.animate(slot6, callback(slot9, self, self))
	end

	return 
end
function RaidGUIControlButtonToggleSmall:mouse_released(o, button, x, y)

	-- Decompilation error in this vicinity:
	slot9 = y

	if self.inside(slot6, self, x) then

		-- Decompilation error in this vicinity:
		if self._value then
			self._value = false
		else
			self._value = true
		end

		slot7 = self._image_panel

		self._image_panel.stop(slot6)

		slot7 = self._image_panel
		slot12 = "_animate_release"

		self._image_panel.animate(slot6, callback(slot9, self, self))

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
function RaidGUIControlButtonToggleSmall:set_value(value)
	self._value = value

	return 
end
function RaidGUIControlButtonToggleSmall:get_value()
	return self._value
end
function RaidGUIControlButtonToggleSmall:set_value_and_render(value)
	slot5 = value

	self.set_value(slot3, self)

	slot4 = self

	self._render_images(slot3)

	return 
end
function RaidGUIControlButtonToggleSmall:_render_images()
	if self._visible == false then
		slot3 = self

		self.hide(slot2)

		return 
	else
		if self._value then
			slot4 = true

			self._active_icon.set_visible(slot2, self._active_icon)

			slot4 = false

			self._inactive_icon.set_visible(slot2, self._inactive_icon)
		else
			slot4 = false

			self._active_icon.set_visible(slot2, self._active_icon)

			slot4 = true

			self._inactive_icon.set_visible(slot2, self._inactive_icon)
		end

		slot3 = self

		self.show(slot2)
	end

	return 
end
function RaidGUIControlButtonToggleSmall:show()
	slot3 = self._object

	self._object.show(slot2)

	return 
end
function RaidGUIControlButtonToggleSmall:hide()
	slot3 = self._object

	self._object.hide(slot2)

	return 
end
function RaidGUIControlButtonToggleSmall:set_visible(flag)
	self._visible = flag
	slot4 = self

	self._render_images(slot3)

	return 
end
function RaidGUIControlButtonToggleSmall:confirm_pressed()

	-- Decompilation error in this vicinity:
	if self._selected then

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

	return false
end
function RaidGUIControlButtonToggleSmall:_animate_highlight_on()
	local duration = 0.2
	local t = duration - (1 - self._highlight_animation_t) * duration

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		self._highlight_animation_t = t / duration
		slot9 = duration
		local border_r = Easing.quartic_out(slot5, t, RaidGUIControlButtonToggleSmall.BORDER_COLOR.r, RaidGUIControlButtonToggleSmall.BORDER_HOVER_COLOR.r - RaidGUIControlButtonToggleSmall.BORDER_COLOR.r)
		slot10 = duration
		local border_g = Easing.quartic_out(t, t, RaidGUIControlButtonToggleSmall.BORDER_COLOR.g, RaidGUIControlButtonToggleSmall.BORDER_HOVER_COLOR.g - RaidGUIControlButtonToggleSmall.BORDER_COLOR.g)
		local border_b = Easing.quartic_out(t, t, RaidGUIControlButtonToggleSmall.BORDER_COLOR.b, RaidGUIControlButtonToggleSmall.BORDER_HOVER_COLOR.b - RaidGUIControlButtonToggleSmall.BORDER_COLOR.b)
		slot9 = self._border
		slot14 = border_b

		self._border.set_color(t, Color(duration, border_r, border_g))
	end

	self._highlight_animation_t = 1
	slot6 = RaidGUIControlButtonToggleSmall.BORDER_HOVER_COLOR

	self._border.set_color(slot4, self._border)

	return 
end
function RaidGUIControlButtonToggleSmall:_animate_highlight_off()
	local duration = 0.2
	local t = duration - self._highlight_animation_t * duration

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		self._highlight_animation_t = 1 - t / duration
		slot9 = duration
		local border_r = Easing.quartic_out(slot5, t, RaidGUIControlButtonToggleSmall.BORDER_HOVER_COLOR.r, RaidGUIControlButtonToggleSmall.BORDER_COLOR.r - RaidGUIControlButtonToggleSmall.BORDER_HOVER_COLOR.r)
		slot10 = duration
		local border_g = Easing.quartic_out(t, t, RaidGUIControlButtonToggleSmall.BORDER_HOVER_COLOR.g, RaidGUIControlButtonToggleSmall.BORDER_COLOR.g - RaidGUIControlButtonToggleSmall.BORDER_HOVER_COLOR.g)
		local border_b = Easing.quartic_out(t, t, RaidGUIControlButtonToggleSmall.BORDER_HOVER_COLOR.b, RaidGUIControlButtonToggleSmall.BORDER_COLOR.b - RaidGUIControlButtonToggleSmall.BORDER_HOVER_COLOR.b)
		slot9 = self._border
		slot14 = border_b

		self._border.set_color(t, Color(duration, border_r, border_g))
	end

	self._highlight_animation_t = 0
	slot6 = RaidGUIControlButtonToggleSmall.BORDER_COLOR

	self._border.set_color(slot4, self._border)

	return 
end
function RaidGUIControlButtonToggleSmall:_animate_press()
	local t = 0
	slot5 = RaidGUIControlButtonToggleSmall.BORDER_ICON
	local original_w = tweak_data.gui.icon_w(slot3, tweak_data.gui)
	slot6 = RaidGUIControlButtonToggleSmall.BORDER_ICON
	local original_h = tweak_data.gui.icon_h(tweak_data.gui, tweak_data.gui)
	slot6 = self._image_panel
	local starting_scale = self._image_panel.w(tweak_data.gui) / original_w
	local duration = 0.25 * (starting_scale - 0.9) / 0.1
	slot8 = self._image_panel
	local center_x, center_y = self._image_panel.center(slot7)

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot14 = duration
		local scale = Easing.quartic_out(slot10, t, starting_scale, 0.9 - starting_scale)
		slot13 = original_w * scale

		self._image_panel.set_w(t, self._image_panel)

		slot13 = original_h * scale

		self._image_panel.set_h(t, self._image_panel)

		slot14 = center_y

		self._image_panel.set_center(t, self._image_panel, center_x)
	end

	slot11 = original_w * 0.9

	self._image_panel.set_w(slot9, self._image_panel)

	slot11 = original_h * 0.9

	self._image_panel.set_h(slot9, self._image_panel)

	slot12 = center_y

	self._image_panel.set_center(slot9, self._image_panel, center_x)

	return 
end
function RaidGUIControlButtonToggleSmall:_animate_release()
	local t = 0
	local duration = 0.25
	slot6 = RaidGUIControlButtonToggleSmall.BORDER_ICON
	local target_w = tweak_data.gui.icon_w(slot4, tweak_data.gui)
	slot7 = RaidGUIControlButtonToggleSmall.BORDER_ICON
	local target_h = tweak_data.gui.icon_h(tweak_data.gui, tweak_data.gui)
	slot7 = self._image_panel
	local center_x, center_y = self._image_panel.center(tweak_data.gui)
	slot10 = target_w * 0.9

	self._image_panel.set_w(slot8, self._image_panel)

	slot10 = target_h * 0.9

	self._image_panel.set_h(slot8, self._image_panel)

	slot11 = center_y

	self._image_panel.set_center(slot8, self._image_panel, center_x)

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot13 = duration
		local scale = Easing.quartic_out(slot9, t, 0.9, 0.1)
		slot12 = target_w * scale

		self._image_panel.set_w(t, self._image_panel)

		slot12 = target_h * scale

		self._image_panel.set_h(t, self._image_panel)

		slot13 = center_y

		self._image_panel.set_center(t, self._image_panel, center_x)
	end

	slot10 = target_w

	self._image_panel.set_w(slot8, self._image_panel)

	slot10 = target_h

	self._image_panel.set_h(slot8, self._image_panel)

	slot11 = center_y

	self._image_panel.set_center(slot8, self._image_panel, center_x)

	return 
end

return 
