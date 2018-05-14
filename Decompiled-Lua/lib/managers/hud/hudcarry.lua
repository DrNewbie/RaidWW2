HUDCarry = HUDCarry or class()
HUDCarry.H = 64
HUDCarry.BOTTOM_DISTANCE_WHILE_HIDDEN = 32
HUDCarry.ICON_PADDING_RIGHT = 16
HUDCarry.PROMPT_W = 192
HUDCarry.PROMPT_FONT = tweak_data.gui.fonts.din_compressed_outlined_24
HUDCarry.PROMPT_FONT_SIZE = tweak_data.gui.font_sizes.size_24
HUDCarry.PROMPT_TEXT_ID = "hud_carry_throw_prompt"
HUDCarry.GENERIC_THROW_ID = "carry_item_generic"
HUDCarry.init = function (self, hud)
	slot5 = hud

	self._create_panel(slot3, self)

	slot4 = self

	self._create_icon(slot3)

	slot4 = self

	self._create_prompt(slot3)

	return 
end
HUDCarry._create_panel = function (self, hud)
	local panel_params = {
		name = "carry_panel",
		halign = "center",
		alpha = 0,
		valign = "bottom",
		h = HUDCarry.H
	}
	slot6 = panel_params
	self._object = hud.panel.panel(slot4, hud.panel)

	return 
end
HUDCarry._create_icon = function (self)
	local placeholder_icon = "carry_planks"
	local icon_params = {
		name = "icon",
		valign = "center",
		halign = "left",
		texture = tweak_data.gui.icons[placeholder_icon].texture,
		texture_rect = tweak_data.gui.icons[placeholder_icon].texture_rect
	}
	slot6 = icon_params
	self._icon = self._object.bitmap(slot4, self._object)

	return 
end
HUDCarry._create_prompt = function (self)
	local prompt_params = {
		vertical = "top",
		wrap = true,
		align = "center",
		name = "prompt",
		text = "",
		halign = "left",
		valign = "top",
		w = HUDCarry.PROMPT_W
	}
	slot4 = self._object
	prompt_params.h = self._object.h(slot3)
	prompt_params.font = HUDCarry.PROMPT_FONT
	prompt_params.font_size = HUDCarry.PROMPT_FONT_SIZE
	slot5 = prompt_params
	self._prompt = self._object.text(slot3, self._object)

	return 
end
HUDCarry._size_panel = function (self)
	slot4 = 0

	self._icon.set_x(slot2, self._icon)

	slot4 = self._object.h(slot5) / 2

	self._icon.set_center_y(slot2, self._icon)

	slot3 = self._prompt
	local _, _, w, h = self._prompt.text_rect(slot2)
	slot8 = w

	self._prompt.set_w(self._object, self._prompt)

	slot8 = h

	self._prompt.set_h(self._object, self._prompt)

	slot11 = self._icon
	slot8 = self._icon.x(slot9) + self._icon.w(self._icon) + HUDCarry.ICON_PADDING_RIGHT

	self._prompt.set_x(self._object, self._prompt)

	slot8 = self._object.h(HUDCarry.ICON_PADDING_RIGHT) / 2 - 3

	self._prompt.set_center_y(self._object, self._prompt)

	local center_x = self._object.center_x(self._object)
	slot12 = self._prompt
	slot9 = self._prompt.x(self._object) + self._prompt.w(self._prompt)

	self._object.set_w(self._object, self._object)

	slot9 = center_x

	self._object.set_center_x(self._object, self._object)

	return 
end
HUDCarry.show_carry_item = function (self, carry_id)
	local carry_data = tweak_data.carry[carry_id]
	local item_icon = carry_data.hud_icon or "carry_planks"
	slot7 = tweak_data.gui.icons[item_icon].texture

	self._icon.set_image(slot5, self._icon)

	slot6 = self._icon
	slot9 = tweak_data.gui.icons[item_icon].texture_rect

	self._icon.set_texture_rect(slot5, unpack(slot8))

	local prompt_text_id = carry_data.prompt_text or HUDCarry.PROMPT_TEXT_ID
	local carry_item_id = carry_data.carry_item_id or HUDCarry.GENERIC_THROW_ID
	slot8 = self._prompt
	slot15 = {
		BTN_USE_ITEM = managers.localization.btn_macro(slot17, managers.localization),
		CARRY_ITEM = managers.localization.text(slot17, managers.localization)
	}
	slot19 = "use_item"
	slot19 = carry_item_id

	self._prompt.set_text(slot7, utf8.to_upper(managers.localization.text(slot12, managers.localization, prompt_text_id)))

	slot8 = self

	self._size_panel(slot7)

	slot8 = self._object

	self._object.stop(slot7)

	slot8 = self._object
	slot13 = "_animate_show_carry"

	self._object.animate(slot7, callback(slot10, self, self))

	return 
end
HUDCarry.hide_carry_item = function (self)
	slot3 = self._object

	self._object.stop(slot2)

	slot3 = self._object
	slot8 = "_animate_hide_carry"

	self._object.animate(slot2, callback(slot5, self, self))

	return 
end
HUDCarry.w = function (self)
	slot3 = self._object

	return self._object.w(slot2)
end
HUDCarry.h = function (self)
	slot3 = self._object

	return self._object.h(slot2)
end
HUDCarry.set_x = function (self, x)
	slot5 = x

	self._object.set_x(slot3, self._object)

	return 
end
HUDCarry.set_y = function (self, y)
	slot5 = y

	self._object.set_y(slot3, self._object)

	return 
end
HUDCarry._animate_show_carry = function (self)
	local duration = 0.5
	slot4 = self._object
	local t = self._object.alpha(slot3) * duration

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot9 = duration
		local current_alpha = Easing.quartic_out(slot5, t, 0, 1)
		slot8 = current_alpha

		self._object.set_alpha(t, self._object)

		local current_bottom_distance = Easing.quartic_out(t, t, HUDCarry.BOTTOM_DISTANCE_WHILE_HIDDEN, -HUDCarry.BOTTOM_DISTANCE_WHILE_HIDDEN)
		slot11 = self._object
		slot11 = self._object.parent(duration)
		slot9 = self._object.parent(duration).h(duration) - current_bottom_distance

		self._object.set_bottom(t, self._object)
	end

	slot6 = 1

	self._object.set_alpha(slot4, self._object)

	slot5 = self._object
	slot8 = self._object
	slot8 = self._object.parent(slot7)

	self._object.set_bottom(slot4, self._object.parent(slot7).h(slot7))

	return 
end
HUDCarry._animate_hide_carry = function (self)
	local duration = 0.25
	slot4 = self._object
	local t = (1 - self._object.alpha(slot3)) * duration

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot9 = duration
		local current_alpha = Easing.quartic_out(slot5, t, 1, -1)
		slot8 = current_alpha

		self._object.set_alpha(t, self._object)

		local current_bottom_distance = Easing.quartic_out(t, t, 0, HUDCarry.BOTTOM_DISTANCE_WHILE_HIDDEN)
		slot11 = self._object
		slot11 = self._object.parent(duration)
		slot9 = self._object.parent(duration).h(duration) - current_bottom_distance

		self._object.set_bottom(t, self._object)
	end

	slot6 = 0

	self._object.set_alpha(slot4, self._object)

	slot8 = self._object
	slot8 = self._object.parent(slot7)
	slot6 = self._object.parent(slot7).h(slot7) - HUDCarry.BOTTOM_DISTANCE_WHILE_HIDDEN

	self._object.set_bottom(slot4, self._object)

	return 
end

return 
