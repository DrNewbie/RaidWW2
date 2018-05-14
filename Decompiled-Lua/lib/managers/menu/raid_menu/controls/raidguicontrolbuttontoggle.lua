-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not RaidGUIControlButtonToggle then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlButtonToggle = slot0
RaidGUIControlButtonToggle.HEIGHT = 32
RaidGUIControlButtonToggle.TEXT_PADDING = 16
RaidGUIControlButtonToggle.TEXT_COLOR = tweak_data.gui.colors.raid_grey
RaidGUIControlButtonToggle.TEXT_COLOR_DISABLED = tweak_data.gui.colors.raid_dark_grey
RaidGUIControlButtonToggle.TEXT_HIGHLIGHT_COLOR = tweak_data.gui.colors.raid_white
RaidGUIControlButtonToggle.SIDELINE_COLOR = tweak_data.gui.colors.raid_red
RaidGUIControlButtonToggle.SIDELINE_W = 3
RaidGUIControlButtonToggle.BORDER_ICON = "checkbox_base"
RaidGUIControlButtonToggle.W = tweak_data.gui.icons[RaidGUIControlButtonToggle.BORDER_ICON].texture_rect[3]
RaidGUIControlButtonToggle.H = tweak_data.gui.icons[RaidGUIControlButtonToggle.BORDER_ICON].texture_rect[4]
RaidGUIControlButtonToggle.BORDER_COLOR = tweak_data.gui.colors.raid_grey
RaidGUIControlButtonToggle.BORDER_HOVER_COLOR = tweak_data.gui.colors.raid_red
RaidGUIControlButtonToggle.CHECK_ICON = "checkbox_check_base"
RaidGUIControlButtonToggle.CHECK_W = tweak_data.gui.icons[RaidGUIControlButtonToggle.CHECK_ICON].texture_rect[3]
RaidGUIControlButtonToggle.CHECK_H = tweak_data.gui.icons[RaidGUIControlButtonToggle.CHECK_ICON].texture_rect[4]
function RaidGUIControlButtonToggle:init(parent, params)
	slot7 = params

	RaidGUIControlButtonToggle.super.init(slot4, self, parent)

	slot3 = self._params

	if not self._params.w then
		slot6 = self._panel
		slot4 = self._panel.w(slot5)
	end

	slot3.w = slot4
	self._params.h = RaidGUIControlButtonToggle.H
	slot6 = self._params
	self._object = self._panel.panel(RaidGUIControlButtonToggle.H, self._panel)
	local sideline_params = {
		alpha = 0,
		y = 0,
		x = 0,
		w = RaidGUIControlButtonToggle.SIDELINE_W
	}
	slot6 = self._object
	sideline_params.h = self._object.h(self._panel)
	sideline_params.color = RaidGUIControlButtonToggle.SIDELINE_COLOR
	slot7 = sideline_params
	self._sideline = self._object.rect(self._panel, self._object)
	slot7 = {
		vertical = "center",
		align = "left",
		y = 0,
		x = RaidGUIControlButtonToggle.SIDELINE_W + RaidGUIControlButtonToggle.TEXT_PADDING,
		w = self._object.w(RaidGUIControlButtonToggle.TEXT_PADDING) - RaidGUIControlButtonToggle.SIDELINE_W - RaidGUIControlButtonToggle.TEXT_PADDING * 2,
		h = self._object.h(RaidGUIControlButtonToggle.TEXT_PADDING * 2),
		color = RaidGUIControlButtonToggle.TEXT_COLOR,
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.small,
		text = params.description,
		layer = self._object.layer(RaidGUIControlButtonToggle.TEXT_PADDING * 2) + 1
	}
	slot10 = self._object
	slot10 = self._object
	slot10 = self._object
	self._description = self._object.text(self._panel, self._object)
	local checkbox_panel_params = {}
	slot7 = self._object
	checkbox_panel_params.x = self._object.w(self._object) - RaidGUIControlButtonToggle.W
	slot7 = self._object
	checkbox_panel_params.y = self._object.h(RaidGUIControlButtonToggle.W) / 2 - RaidGUIControlButtonToggle.H / 2
	checkbox_panel_params.w = RaidGUIControlButtonToggle.W
	checkbox_panel_params.h = RaidGUIControlButtonToggle.H
	slot8 = checkbox_panel_params
	self._checkbox_panel = self._object.panel(RaidGUIControlButtonToggle.H / 2, self._object)
	local checkbox_border_params = {
		halign = "scale",
		valign = "scale",
		y = 0,
		x = 0,
		texture = tweak_data.gui.icons[RaidGUIControlButtonToggle.BORDER_ICON].texture,
		texture_rect = tweak_data.gui.icons[RaidGUIControlButtonToggle.BORDER_ICON].texture_rect,
		w = RaidGUIControlButtonToggle.W,
		h = RaidGUIControlButtonToggle.H,
		layer = self._object.layer(RaidGUIControlButtonToggle.BORDER_ICON),
		color = RaidGUIControlButtonToggle.BORDER_COLOR
	}
	slot9 = checkbox_border_params
	self._border = self._checkbox_panel.bitmap(RaidGUIControlButtonToggle.BORDER_ICON, self._checkbox_panel)
	local checkbox_params = {
		halign = "scale",
		valign = "scale",
		texture = tweak_data.gui.icons[RaidGUIControlButtonToggle.CHECK_ICON].texture,
		texture_rect = tweak_data.gui.icons[RaidGUIControlButtonToggle.CHECK_ICON].texture_rect
	}
	slot9 = self._checkbox_panel
	checkbox_params.x = self._checkbox_panel.w(RaidGUIControlButtonToggle.CHECK_ICON) / 2 - RaidGUIControlButtonToggle.CHECK_W / 2
	slot9 = self._checkbox_panel
	checkbox_params.y = self._checkbox_panel.h(RaidGUIControlButtonToggle.CHECK_W / 2) / 2 - RaidGUIControlButtonToggle.CHECK_H / 2
	checkbox_params.w = RaidGUIControlButtonToggle.CHECK_W
	checkbox_params.h = RaidGUIControlButtonToggle.CHECK_H
	slot9 = self._object
	checkbox_params.layer = self._object.layer(RaidGUIControlButtonToggle.CHECK_H / 2) + 1
	slot10 = checkbox_params
	self._check = self._checkbox_panel.bitmap(RaidGUIControlButtonToggle.CHECK_H / 2, self._checkbox_panel)
	self._value = self._params.value or false
	self._play_mouse_over_sound = true
	self._on_click_callback = params.on_click_callback
	self._visible = self._params.visible
	slot9 = self

	self._render_images(self._object)

	return 
end
function RaidGUIControlButtonToggle:highlight_on()
	self._highlighted = true

	if not self._enabled then
		return 
	end

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
function RaidGUIControlButtonToggle:highlight_off()
	self._highlighted = false

	if not self._enabled then
		return 
	end

	slot3 = self._object

	self._object.stop(slot2)

	slot3 = self._object
	slot8 = "_animate_highlight_off"

	self._object.animate(slot2, callback(slot5, self, self))

	self._play_mouse_over_sound = true

	return 
end
function RaidGUIControlButtonToggle:mouse_pressed(o, button, x, y)
	if not self._enabled then
		return 
	end

	slot9 = y

	if self.inside(slot6, self, x) then
		slot7 = self._checkbox_panel

		self._checkbox_panel.stop(slot6)

		slot7 = self._checkbox_panel
		slot12 = "_animate_checkbox_press"

		self._checkbox_panel.animate(slot6, callback(slot9, self, self))
	end

	return 
end
function RaidGUIControlButtonToggle:mouse_released(o, button, x, y)

	-- Decompilation error in this vicinity:
	if not self._enabled then
		return 
	end

	slot9 = y

	if self.inside(slot6, self, x) then

		-- Decompilation error in this vicinity:
		if self._value then
			self._value = false
		else
			self._value = true
		end

		slot7 = self._checkbox_panel

		self._checkbox_panel.stop(slot6)

		slot7 = self._checkbox_panel
		slot12 = "_animate_checkbox_release"

		self._checkbox_panel.animate(slot6, callback(slot9, self, self))

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
function RaidGUIControlButtonToggle:set_value(value)
	self._value = value

	return 
end
function RaidGUIControlButtonToggle:get_value()
	return self._value
end
function RaidGUIControlButtonToggle:set_value_and_render(value)
	slot5 = value

	self.set_value(slot3, self)

	slot4 = self

	self._render_images(slot3)

	return 
end
function RaidGUIControlButtonToggle:_render_images()
	if self._visible == false then
		slot3 = self

		self.hide(slot2)

		return 
	elseif self._value then
		slot4 = true

		self._check.set_visible(slot2, self._check)
	else
		slot4 = false

		self._check.set_visible(slot2, self._check)
	end

	return 
end
function RaidGUIControlButtonToggle:show()
	slot3 = self._object

	self._object.show(slot2)

	return 
end
function RaidGUIControlButtonToggle:hide()
	slot3 = self._object

	self._object.hide(slot2)

	return 
end
function RaidGUIControlButtonToggle:set_visible(flag)
	self._visible = flag
	slot4 = self

	self._render_images(slot3)

	return 
end
function RaidGUIControlButtonToggle:confirm_pressed()

	-- Decompilation error in this vicinity:
	if not self._enabled then
		return 
	end

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
function RaidGUIControlButtonToggle:set_enabled(enabled)
	slot5 = enabled

	RaidGUIControlButtonToggle.super.set_enabled(slot3, self)

	if enabled then
		if self._highlighted then
			slot5 = RaidGUIControlButtonToggle.TEXT_HIGHLIGHT_COLOR

			self._description.set_color(slot3, self._description)

			slot5 = RaidGUIControlButtonToggle.BORDER_HOVER_COLOR

			self._border.set_color(slot3, self._border)

			slot5 = Color.white

			self._check.set_color(slot3, self._check)

			slot5 = 1

			self._sideline.set_alpha(slot3, self._sideline)
		else
			slot5 = RaidGUIControlButtonToggle.TEXT_COLOR

			self._description.set_color(slot3, self._description)

			slot5 = RaidGUIControlButtonToggle.BORDER_COLOR

			self._border.set_color(slot3, self._border)

			slot5 = Color.white

			self._check.set_color(slot3, self._check)

			slot5 = 0

			self._sideline.set_alpha(slot3, self._sideline)
		end
	else
		slot5 = RaidGUIControlButtonToggle.TEXT_COLOR_DISABLED

		self._description.set_color(slot3, self._description)

		slot5 = RaidGUIControlButtonToggle.TEXT_COLOR_DISABLED

		self._border.set_color(slot3, self._border)

		slot5 = RaidGUIControlButtonToggle.TEXT_COLOR_DISABLED

		self._check.set_color(slot3, self._check)

		slot5 = 0

		self._sideline.set_alpha(slot3, self._sideline)
	end

	return 
end
function RaidGUIControlButtonToggle:_animate_highlight_on()
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
		local description_r = Easing.quartic_out(t, t, RaidGUIControlButtonToggle.TEXT_COLOR.r, RaidGUIControlButtonToggle.TEXT_HIGHLIGHT_COLOR.r - RaidGUIControlButtonToggle.TEXT_COLOR.r)
		slot12 = duration
		local description_g = Easing.quartic_out(t, t, RaidGUIControlButtonToggle.TEXT_COLOR.g, RaidGUIControlButtonToggle.TEXT_HIGHLIGHT_COLOR.g - RaidGUIControlButtonToggle.TEXT_COLOR.g)
		local description_b = Easing.quartic_out(t, t, RaidGUIControlButtonToggle.TEXT_COLOR.b, RaidGUIControlButtonToggle.TEXT_HIGHLIGHT_COLOR.b - RaidGUIControlButtonToggle.TEXT_COLOR.b)
		slot11 = self._description
		slot16 = description_b

		self._description.set_color(t, Color(duration, description_r, description_g))

		slot14 = duration
		local border_r = Easing.quartic_out(t, t, RaidGUIControlButtonToggle.BORDER_COLOR.r, RaidGUIControlButtonToggle.BORDER_HOVER_COLOR.r - RaidGUIControlButtonToggle.BORDER_COLOR.r)
		slot15 = duration
		local border_g = Easing.quartic_out(t, t, RaidGUIControlButtonToggle.BORDER_COLOR.g, RaidGUIControlButtonToggle.BORDER_HOVER_COLOR.g - RaidGUIControlButtonToggle.BORDER_COLOR.g)
		local border_b = Easing.quartic_out(t, t, RaidGUIControlButtonToggle.BORDER_COLOR.b, RaidGUIControlButtonToggle.BORDER_HOVER_COLOR.b - RaidGUIControlButtonToggle.BORDER_COLOR.b)
		slot14 = self._border
		slot19 = border_b

		self._border.set_color(t, Color(duration, border_r, border_g))
	end

	slot7 = 1

	self._sideline.set_alpha(slot5, self._sideline)

	slot7 = RaidGUIControlButtonToggle.TEXT_HIGHLIGHT_COLOR

	self._description.set_color(slot5, self._description)

	slot7 = RaidGUIControlButtonToggle.BORDER_HOVER_COLOR

	self._border.set_color(slot5, self._border)

	return 
end
function RaidGUIControlButtonToggle:_animate_highlight_off()
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
		local description_r = Easing.quartic_out(t, t, RaidGUIControlButtonToggle.TEXT_HIGHLIGHT_COLOR.r, RaidGUIControlButtonToggle.TEXT_COLOR.r - RaidGUIControlButtonToggle.TEXT_HIGHLIGHT_COLOR.r)
		slot12 = duration
		local description_g = Easing.quartic_out(t, t, RaidGUIControlButtonToggle.TEXT_HIGHLIGHT_COLOR.g, RaidGUIControlButtonToggle.TEXT_COLOR.g - RaidGUIControlButtonToggle.TEXT_HIGHLIGHT_COLOR.g)
		local description_b = Easing.quartic_out(t, t, RaidGUIControlButtonToggle.TEXT_HIGHLIGHT_COLOR.b, RaidGUIControlButtonToggle.TEXT_COLOR.b - RaidGUIControlButtonToggle.TEXT_HIGHLIGHT_COLOR.b)
		slot11 = self._description
		slot16 = description_b

		self._description.set_color(t, Color(duration, description_r, description_g))

		slot14 = duration
		local border_r = Easing.quartic_out(t, t, RaidGUIControlButtonToggle.BORDER_HOVER_COLOR.r, RaidGUIControlButtonToggle.BORDER_COLOR.r - RaidGUIControlButtonToggle.BORDER_HOVER_COLOR.r)
		slot15 = duration
		local border_g = Easing.quartic_out(t, t, RaidGUIControlButtonToggle.BORDER_HOVER_COLOR.g, RaidGUIControlButtonToggle.BORDER_COLOR.g - RaidGUIControlButtonToggle.BORDER_HOVER_COLOR.g)
		local border_b = Easing.quartic_out(t, t, RaidGUIControlButtonToggle.BORDER_HOVER_COLOR.b, RaidGUIControlButtonToggle.BORDER_COLOR.b - RaidGUIControlButtonToggle.BORDER_HOVER_COLOR.b)
		slot14 = self._border
		slot19 = border_b

		self._border.set_color(t, Color(duration, border_r, border_g))
	end

	slot7 = 0

	self._sideline.set_alpha(slot5, self._sideline)

	slot7 = RaidGUIControlButtonToggle.TEXT_COLOR

	self._description.set_color(slot5, self._description)

	slot7 = RaidGUIControlButtonToggle.BORDER_COLOR

	self._border.set_color(slot5, self._border)

	return 
end
function RaidGUIControlButtonToggle:_animate_checkbox_press()
	local t = 0
	local original_w = RaidGUIControlButtonToggle.W
	local original_h = RaidGUIControlButtonToggle.H
	slot6 = self._checkbox_panel
	local starting_scale = self._checkbox_panel.w(slot5) / original_w
	local duration = 0.25 * (starting_scale - 0.9) / 0.1
	slot8 = self._checkbox_panel
	local center_x, center_y = self._checkbox_panel.center(slot7)

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot14 = duration
		local scale = Easing.quartic_out(slot10, t, starting_scale, 0.9 - starting_scale)
		slot13 = original_w * scale

		self._checkbox_panel.set_w(t, self._checkbox_panel)

		slot13 = original_h * scale

		self._checkbox_panel.set_h(t, self._checkbox_panel)

		slot14 = center_y

		self._checkbox_panel.set_center(t, self._checkbox_panel, center_x)
	end

	slot11 = original_w * 0.9

	self._checkbox_panel.set_w(slot9, self._checkbox_panel)

	slot11 = original_h * 0.9

	self._checkbox_panel.set_h(slot9, self._checkbox_panel)

	slot12 = center_y

	self._checkbox_panel.set_center(slot9, self._checkbox_panel, center_x)

	return 
end
function RaidGUIControlButtonToggle:_animate_checkbox_release()
	local t = 0
	local duration = 0.25
	local target_w = RaidGUIControlButtonToggle.W
	local target_h = RaidGUIControlButtonToggle.H
	slot7 = self._checkbox_panel
	local center_x, center_y = self._checkbox_panel.center(slot6)
	slot10 = target_w * 0.9

	self._checkbox_panel.set_w(slot8, self._checkbox_panel)

	slot10 = target_h * 0.9

	self._checkbox_panel.set_h(slot8, self._checkbox_panel)

	slot11 = center_y

	self._checkbox_panel.set_center(slot8, self._checkbox_panel, center_x)

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot13 = duration
		local scale = Easing.quartic_out(slot9, t, 0.9, 0.1)
		slot12 = target_w * scale

		self._checkbox_panel.set_w(t, self._checkbox_panel)

		slot12 = target_h * scale

		self._checkbox_panel.set_h(t, self._checkbox_panel)

		slot13 = center_y

		self._checkbox_panel.set_center(t, self._checkbox_panel, center_x)
	end

	slot10 = target_w

	self._checkbox_panel.set_w(slot8, self._checkbox_panel)

	slot10 = target_h

	self._checkbox_panel.set_h(slot8, self._checkbox_panel)

	slot11 = center_y

	self._checkbox_panel.set_center(slot8, self._checkbox_panel, center_x)

	return 
end

return 
