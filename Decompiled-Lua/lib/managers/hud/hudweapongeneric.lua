if not HUDWeaponGeneric then
	slot2 = HUDWeaponBase
	slot0 = class(slot1)
end

HUDWeaponGeneric = slot0
HUDWeaponGeneric.W = 138
HUDWeaponGeneric.H = 84
HUDWeaponGeneric.AMMO_PANEL_X = 15
HUDWeaponGeneric.AMMO_PANEL_W = 110
HUDWeaponGeneric.AMMO_PANEL_H = 34
HUDWeaponGeneric.CLIP_BACKGROUND_W = 54
HUDWeaponGeneric.CLIP_BACKGROUND_THICKNESS = 1
HUDWeaponGeneric.CLIP_BACKGROUND_OUTLINE_COLOR = tweak_data.gui.colors.ammo_background_outline
HUDWeaponGeneric.CLIP_BACKGROUND_COLORS = tweak_data.gui.colors.ammo_clip_colors
HUDWeaponGeneric.CURRENT_CLIP_FONT = tweak_data.gui.fonts.din_compressed
HUDWeaponGeneric.CURRENT_CLIP_FONT_SIZE = tweak_data.gui.font_sizes.size_32
HUDWeaponGeneric.CURRENT_CLIP_TEXT_COLOR = tweak_data.gui.colors.ammo_text
HUDWeaponGeneric.AMMO_LEFT_FONT = tweak_data.gui.fonts.din_compressed_outlined_32
HUDWeaponGeneric.AMMO_LEFT_FONT_SIZE = tweak_data.gui.font_sizes.size_32
HUDWeaponGeneric.AMMO_LEFT_TEXT_COLOR = Color.white
HUDWeaponGeneric.AMMO_LEFT_ALPHA_WHEN_SELECTED = 1
HUDWeaponGeneric.AMMO_LEFT_ALPHA_WHEN_UNSELECTED = 0.7
HUDWeaponGeneric.FIREMODE_AUTO_ICON = "weapon_panel_indicator_rapid_fire"
HUDWeaponGeneric.FIREMODE_SINGLE_ICON = "weapon_panel_indicator_single_fire"
HUDWeaponGeneric.FIREMODE_DISTANCE_FROM_RIGHT_EDGE = 19
function HUDWeaponGeneric:init(index, weapons_panel, tweak_data)
	slot9 = tweak_data

	HUDWeaponGeneric.super.init(slot5, self, index, weapons_panel)

	self._index = index
	slot7 = weapons_panel

	self._create_panel(slot5, self)

	slot7 = tweak_data.hud.icon

	self._create_icon(slot5, self)

	slot7 = weapons_panel

	self._create_ammo_info(slot5, self)

	slot6 = self

	self._create_firemodes(slot5)

	return 
end
function HUDWeaponGeneric:_create_panel(weapons_panel)
	local panel_params = {
		halign = "right",
		valign = "bottom"
	}
	slot6 = self._index
	panel_params.name = "weapon_" .. tostring(slot5)
	panel_params.w = HUDWeaponGeneric.W
	panel_params.h = HUDWeaponGeneric.H
	slot6 = panel_params
	self._object = weapons_panel.panel(tostring(slot5), weapons_panel)

	return 
end
function HUDWeaponGeneric:_create_icon(icon)
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
function HUDWeaponGeneric:_create_ammo_info(weapons_panel)
	local ammo_panel_params = {
		name = "ammo_panel",
		halign = "center",
		valign = "bottom",
		x = HUDWeaponGeneric.AMMO_PANEL_X,
		w = HUDWeaponGeneric.AMMO_PANEL_W,
		h = HUDWeaponGeneric.AMMO_PANEL_H
	}
	slot6 = ammo_panel_params
	self._ammo_panel = self._object.panel(slot4, self._object)
	slot8 = self._object

	self._ammo_panel.set_bottom(slot4, self._object.h(slot7))

	local current_clip_background_border_params = {
		halign = "left",
		name = "current_clip_background_border",
		y = 0,
		x = 0,
		valign = "top",
		w = HUDWeaponGeneric.CLIP_BACKGROUND_W
	}
	slot6 = self._ammo_panel
	current_clip_background_border_params.h = self._ammo_panel.h(self._ammo_panel)
	current_clip_background_border_params.color = HUDWeaponGeneric.CLIP_BACKGROUND_OUTLINE_COLOR
	current_clip_background_border_params.alpha = HUDWeaponBase.ALPHA_WHEN_UNSELECTED
	local current_clip_background_border = self._ammo_panel.rect(self._ammo_panel, self._ammo_panel)
	local current_clip_background_params = {
		halign = "left",
		name = "current_clip_background",
		valign = "top",
		x = HUDWeaponGeneric.CLIP_BACKGROUND_THICKNESS,
		y = HUDWeaponGeneric.CLIP_BACKGROUND_THICKNESS
	}
	slot8 = current_clip_background_border
	current_clip_background_params.w = current_clip_background_border.w(current_clip_background_border_params) - HUDWeaponGeneric.CLIP_BACKGROUND_THICKNESS * 2
	slot8 = current_clip_background_border
	current_clip_background_params.h = current_clip_background_border.h(HUDWeaponGeneric.CLIP_BACKGROUND_THICKNESS * 2) - HUDWeaponGeneric.CLIP_BACKGROUND_THICKNESS * 2
	current_clip_background_params.color = tweak_data.gui.colors.progress_75
	slot8 = current_clip_background_border
	current_clip_background_params.layer = current_clip_background_border.layer(HUDWeaponGeneric.CLIP_BACKGROUND_THICKNESS * 2) + 1
	current_clip_background_params.alpha = HUDWeaponBase.ALPHA_WHEN_UNSELECTED
	slot9 = current_clip_background_params
	self._current_clip_background = self._ammo_panel.rect(HUDWeaponGeneric.CLIP_BACKGROUND_THICKNESS * 2, self._ammo_panel)
	local current_clip_text_params = {
		text = "",
		name = "current_clip_amount",
		halign = "left",
		valign = "top"
	}
	slot11 = HUDWeaponGeneric.CURRENT_CLIP_FONT_SIZE
	current_clip_text_params.font = tweak_data.gui.get_font_path(self._ammo_panel, tweak_data.gui, HUDWeaponGeneric.CURRENT_CLIP_FONT)
	current_clip_text_params.font_size = HUDWeaponGeneric.CURRENT_CLIP_FONT_SIZE
	current_clip_text_params.color = HUDWeaponGeneric.CURRENT_CLIP_TEXT_COLOR
	slot9 = self._current_clip_background
	current_clip_text_params.layer = self._current_clip_background.layer(self._ammo_panel) + 1
	slot10 = current_clip_text_params
	self._current_clip_text = self._ammo_panel.text(self._ammo_panel, self._ammo_panel)
	slot10 = 1

	self.set_max_clip(self._ammo_panel, self)

	slot10 = 0

	self.set_current_clip(self._ammo_panel, self)

	local ammo_left_text_params = {
		text = "",
		name = "ammo_left_amount",
		halign = "right",
		valign = "top",
		font = HUDWeaponGeneric.AMMO_LEFT_FONT,
		font_size = HUDWeaponGeneric.AMMO_LEFT_FONT_SIZE,
		color = HUDWeaponGeneric.AMMO_LEFT_TEXT_COLOR,
		alpha = HUDWeaponGeneric.AMMO_LEFT_ALPHA_WHEN_UNSELECTED
	}
	slot11 = ammo_left_text_params
	self._ammo_left_text = self._ammo_panel.text(self, self._ammo_panel)
	slot11 = 0

	self.set_current_left(self, self)

	return 
end
function HUDWeaponGeneric:_create_firemodes()
	local firemode_auto_params = {
		name = "firemode_auto",
		halign = "center",
		valign = "bottom",
		texture = tweak_data.gui.icons[HUDWeaponGeneric.FIREMODE_AUTO_ICON].texture,
		texture_rect = tweak_data.gui.icons[HUDWeaponGeneric.FIREMODE_AUTO_ICON].texture_rect,
		alpha = HUDWeaponBase.ALPHA_WHEN_UNSELECTED
	}
	slot5 = firemode_auto_params
	self._firemode_auto = self._icon_panel.bitmap(HUDWeaponGeneric.FIREMODE_AUTO_ICON, self._icon_panel)
	slot7 = self._icon_panel
	slot5 = self._icon_panel.w(slot6) - 17

	self._firemode_auto.set_right(HUDWeaponGeneric.FIREMODE_AUTO_ICON, self._firemode_auto)

	slot5 = self._icon_panel.h(slot6) + 2

	self._firemode_auto.set_bottom(HUDWeaponGeneric.FIREMODE_AUTO_ICON, self._firemode_auto)

	local firemode_single_params = {
		name = "firemode_single",
		halign = "center",
		valign = "bottom",
		texture = tweak_data.gui.icons[HUDWeaponGeneric.FIREMODE_SINGLE_ICON].texture,
		texture_rect = tweak_data.gui.icons[HUDWeaponGeneric.FIREMODE_SINGLE_ICON].texture_rect,
		alpha = HUDWeaponBase.ALPHA_WHEN_UNSELECTED
	}
	slot6 = firemode_single_params
	self._firemode_single = self._icon_panel.bitmap(HUDWeaponGeneric.FIREMODE_SINGLE_ICON, self._icon_panel)
	slot8 = self._icon_panel
	slot6 = self._icon_panel.w(self._icon_panel) - 12

	self._firemode_single.set_right(HUDWeaponGeneric.FIREMODE_SINGLE_ICON, self._firemode_single)

	slot8 = self._icon_panel
	slot6 = self._icon_panel.h(self._icon_panel) + 2

	self._firemode_single.set_bottom(HUDWeaponGeneric.FIREMODE_SINGLE_ICON, self._firemode_single)

	slot6 = self._tweak_data.FIRE_MODE

	self.set_firemode(HUDWeaponGeneric.FIREMODE_SINGLE_ICON, self)

	return 
end
function HUDWeaponGeneric:set_current_clip(current_clip)
	slot4 = self._current_clip_text
	slot8 = current_clip

	self._current_clip_text.set_text(slot3, string.format(slot6, "%03d"))

	slot4 = self._current_clip_text
	local _, _, w, h = self._current_clip_text.text_rect(slot3)
	slot9 = w

	self._current_clip_text.set_w("%03d", self._current_clip_text)

	slot9 = h

	self._current_clip_text.set_h("%03d", self._current_clip_text)

	slot11 = self._current_clip_background
	slot9 = self._current_clip_background.w(slot10) / 2 + 1

	self._current_clip_text.set_center_x("%03d", self._current_clip_text)

	slot11 = self._current_clip_background
	slot9 = self._current_clip_background.h(slot10) / 2 - 1

	self._current_clip_text.set_center_y("%03d", self._current_clip_text)

	local clip_percentage = (0 < self._max_clip and current_clip / self._max_clip) or 0
	slot9 = self._current_clip_background
	slot14 = clip_percentage

	self._current_clip_background.set_color(slot8, self._get_color_for_percentage(slot11, self, HUDWeaponGeneric.CLIP_BACKGROUND_COLORS))

	return 
end
function HUDWeaponGeneric:set_current_left(current_left)
	slot4 = self._ammo_left_text
	slot8 = current_left

	self._ammo_left_text.set_text(slot3, string.format(slot6, "%03d"))

	slot4 = self._ammo_left_text
	local _, _, w, h = self._ammo_left_text.text_rect(slot3)
	slot9 = w

	self._ammo_left_text.set_w("%03d", self._ammo_left_text)

	slot9 = h

	self._ammo_left_text.set_h("%03d", self._ammo_left_text)

	slot11 = self._ammo_panel
	slot9 = self._ammo_panel.w(slot10) - 6

	self._ammo_left_text.set_right("%03d", self._ammo_left_text)

	slot11 = self._ammo_panel
	slot9 = self._ammo_panel.h(slot10) / 2 - 3

	self._ammo_left_text.set_center_y("%03d", self._ammo_left_text)

	if current_left == 0 then
		slot8 = self._ammo_left_text
		slot13 = 0

		self._ammo_left_text.set_color(slot7, self._get_color_for_percentage(slot10, self, HUDWeaponGeneric.CLIP_BACKGROUND_COLORS))
	else
		slot9 = HUDWeaponGeneric.AMMO_LEFT_TEXT_COLOR

		self._ammo_left_text.set_color(slot7, self._ammo_left_text)
	end

	return 
end
function HUDWeaponGeneric:set_max_clip(max_clip)
	self._max_clip = max_clip

	return 
end
function HUDWeaponGeneric:set_max(max)
	self._max = max

	return 
end
function HUDWeaponGeneric:set_firemode(mode)
	slot5 = (mode == "single" and true) or false

	self._firemode_single.set_visible(slot3, self._firemode_single)

	slot5 = (mode == "auto" and true) or false

	self._firemode_auto.set_visible(slot3, self._firemode_auto)

	return 
end
function HUDWeaponGeneric:_get_color_for_percentage(color_table, percentage)
	for i = #color_table, 1, -1 do
		if color_table[i].start_percentage < percentage then
			return color_table[i].color
		end
	end

	return color_table[1].color
end
function HUDWeaponGeneric:_animate_alpha(root_panel, new_alpha)
	local start_alpha = (new_alpha == HUDWeaponBase.ALPHA_WHEN_SELECTED and HUDWeaponBase.ALPHA_WHEN_UNSELECTED) or HUDWeaponBase.ALPHA_WHEN_SELECTED
	local start_ammo_left_alpha = (start_alpha == HUDWeaponBase.ALPHA_WHEN_SELECTED and HUDWeaponGeneric.AMMO_LEFT_ALPHA_WHEN_SELECTED) or HUDWeaponGeneric.AMMO_LEFT_ALPHA_WHEN_UNSELECTED
	local new_ammo_left_alpha = (start_ammo_left_alpha == HUDWeaponGeneric.AMMO_LEFT_ALPHA_WHEN_SELECTED and HUDWeaponGeneric.AMMO_LEFT_ALPHA_WHEN_UNSELECTED) or HUDWeaponGeneric.AMMO_LEFT_ALPHA_WHEN_SELECTED
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

		slot13 = current_alpha

		self._firemode_single.set_alpha(t, self._firemode_single)

		slot13 = current_alpha

		self._firemode_auto.set_alpha(t, self._firemode_auto)

		slot13 = "current_clip_background_border"
		slot13 = current_alpha

		self._ammo_panel.child(t, self._ammo_panel).set_alpha(t, self._ammo_panel.child(t, self._ammo_panel))

		slot13 = current_alpha

		self._current_clip_background.set_alpha(t, self._current_clip_background)

		slot15 = duration
		local ammo_left_alpha = Easing.quartic_in_out(t, t, start_ammo_left_alpha, new_ammo_left_alpha - start_ammo_left_alpha)
		slot14 = ammo_left_alpha

		self._ammo_left_text.set_alpha(t, self._ammo_left_text)
	end

	slot11 = new_alpha

	self._icon.set_alpha(slot9, self._icon)

	slot11 = new_alpha

	self._firemode_single.set_alpha(slot9, self._firemode_single)

	slot11 = new_alpha

	self._firemode_auto.set_alpha(slot9, self._firemode_auto)

	slot11 = "current_clip_background_border"
	slot11 = new_alpha

	self._ammo_panel.child(slot9, self._ammo_panel).set_alpha(slot9, self._ammo_panel.child(slot9, self._ammo_panel))

	slot11 = new_alpha

	self._current_clip_background.set_alpha(slot9, self._current_clip_background)

	slot11 = new_ammo_left_alpha

	self._ammo_left_text.set_alpha(slot9, self._ammo_left_text)

	return 
end

return 
