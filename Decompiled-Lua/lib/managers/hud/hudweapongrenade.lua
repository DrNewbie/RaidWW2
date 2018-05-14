if not HUDWeaponGrenade then
	slot2 = HUDWeaponBase
	slot0 = class(slot1)
end

HUDWeaponGrenade = slot0
HUDWeaponGrenade.W = 108
HUDWeaponGrenade.H = 84
HUDWeaponGrenade.AMOUNT_FONT = tweak_data.gui.fonts.din_compressed_outlined_32
HUDWeaponGrenade.AMOUNT_FONT_SIZE = tweak_data.gui.font_sizes.size_32
HUDWeaponGrenade.AMOUNT_TEXT_COLOR = Color.white
HUDWeaponGrenade.AMOUNT_TEXT_ALPHA_WHEN_SELECTED = 1
HUDWeaponGrenade.AMOUNT_TEXT_ALPHA_WHEN_UNSELECTED = 0.7
function HUDWeaponGrenade:init(index, weapons_panel, tweak_data)
	slot9 = tweak_data

	HUDWeaponGrenade.super.init(slot5, self, index, weapons_panel)

	self._index = index
	slot7 = weapons_panel

	self._create_panel(slot5, self)

	slot7 = tweak_data.hud.icon

	self._create_icon(slot5, self)

	slot7 = weapons_panel

	self._create_amount_text(slot5, self)

	return 
end
function HUDWeaponGrenade:_create_panel(weapons_panel)
	local panel_params = {
		halign = "right",
		valign = "bottom"
	}
	slot6 = self._index
	panel_params.name = "grenade_" .. tostring(slot5)
	panel_params.w = HUDWeaponGrenade.W
	panel_params.h = HUDWeaponGrenade.H
	slot6 = panel_params
	self._object = weapons_panel.panel(tostring(slot5), weapons_panel)

	return 
end
function HUDWeaponGrenade:_create_icon(icon)
	local icon_panel_params = {
		halign = "center",
		name = "icon_panel",
		y = 0,
		x = 0,
		valign = "top"
	}
	slot5 = self._object
	icon_panel_params.w = self._object.w(slot4)
	slot5 = self._object
	icon_panel_params.h = self._object.h(slot4) / 2
	slot6 = icon_panel_params
	self._icon_panel = self._object.panel(slot4, self._object)
	local icon_params = {
		name = "weapon_icon",
		texture = tweak_data.gui.icons[icon].texture,
		texture_rect = tweak_data.gui.icons[icon].texture_rect,
		alpha = HUDWeaponBase.ALPHA_WHEN_UNSELECTED
	}
	slot7 = icon_params
	self._icon = self._icon_panel.bitmap(self._object, self._icon_panel)
	slot9 = self._icon_panel
	slot7 = self._icon_panel.w(slot8) / 2

	self._icon.set_center_x(self._object, self._icon)

	slot9 = self._icon_panel
	slot7 = self._icon_panel.h(slot8) / 2

	self._icon.set_center_y(self._object, self._icon)

	return 
end
function HUDWeaponGrenade:_create_amount_text()
	local amount_text_params = {
		text = "",
		name = "amount_text",
		font = HUDWeaponGrenade.AMOUNT_FONT,
		font_size = HUDWeaponGrenade.AMOUNT_FONT_SIZE,
		color = HUDWeaponGrenade.AMOUNT_TEXT_COLOR,
		alpha = HUDWeaponGrenade.AMOUNT_TEXT_ALPHA_WHEN_UNSELECTED
	}
	slot5 = amount_text_params
	self._amount_text = self._object.text(slot3, self._object)
	slot5 = 0

	self.set_amount(slot3, self)

	return 
end
function HUDWeaponGrenade:set_amount(amount)
	slot4 = self._amount_text
	slot8 = amount

	self._amount_text.set_text(slot3, string.format(slot6, "%03d"))

	slot4 = self._amount_text
	local _, _, w, h = self._amount_text.text_rect(slot3)
	slot9 = w

	self._amount_text.set_w("%03d", self._amount_text)

	slot9 = h

	self._amount_text.set_h("%03d", self._amount_text)

	slot11 = self._object
	slot9 = self._object.w(slot10) / 2 - 4

	self._amount_text.set_center_x("%03d", self._amount_text)

	slot11 = self._object
	slot9 = self._object.h(slot10) - 4

	self._amount_text.set_bottom("%03d", self._amount_text)

	if amount == 0 then
		slot9 = tweak_data.gui.colors.progress_red

		self._amount_text.set_color(slot7, self._amount_text)
	else
		slot9 = Color.white

		self._amount_text.set_color(slot7, self._amount_text)
	end

	return 
end
function HUDWeaponGrenade:_animate_alpha(root_panel, new_alpha)
	local start_alpha = (new_alpha == HUDWeaponBase.ALPHA_WHEN_SELECTED and HUDWeaponBase.ALPHA_WHEN_UNSELECTED) or HUDWeaponBase.ALPHA_WHEN_SELECTED
	local start_amount_text_alpha = (start_alpha == HUDWeaponBase.ALPHA_WHEN_SELECTED and HUDWeaponGrenade.AMOUNT_TEXT_ALPHA_WHEN_SELECTED) or HUDWeaponGrenade.AMOUNT_TEXT_ALPHA_WHEN_UNSELECTED
	local new_amount_text_alpha = (start_amount_text_alpha == HUDWeaponGrenade.AMOUNT_TEXT_ALPHA_WHEN_SELECTED and HUDWeaponGrenade.AMOUNT_TEXT_ALPHA_WHEN_UNSELECTED) or HUDWeaponGrenade.AMOUNT_TEXT_ALPHA_WHEN_SELECTED
	local duration = 0.2
	slot9 = self._icon
	local t = (self._icon.alpha(slot8) - start_alpha) / (new_alpha - start_alpha) * duration

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot14 = duration
		local current_alpha = Easing.quartic_in_out(slot10, t, start_alpha, new_alpha - start_alpha)
		slot13 = current_alpha

		self._icon.set_alpha(t, self._icon)

		slot15 = duration
		local amount_text_alpha = Easing.quartic_in_out(t, t, start_amount_text_alpha, new_amount_text_alpha - start_amount_text_alpha)
		slot14 = amount_text_alpha

		self._amount_text.set_alpha(t, self._amount_text)
	end

	slot11 = new_alpha

	self._icon.set_alpha(slot9, self._icon)

	slot11 = new_amount_text_alpha

	self._amount_text.set_alpha(slot9, self._amount_text)

	return 
end

return 
