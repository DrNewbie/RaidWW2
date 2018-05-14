-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not RaidGUIControlClassDescription then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlClassDescription = slot0
RaidGUIControlClassDescription.CLASS_DESCRIPTION_DEFAULT_Y = 82
RaidGUIControlClassDescription.CLASS_DESCRIPTION_DEFAULT_H = 160
RaidGUIControlClassDescription.CLASS_STATS_DEFAULT_Y = 258
RaidGUIControlClassDescription.WARCRY_DEFAULT_Y = 386
RaidGUIControlClassDescription.WARCRY_DEFAULT_H = 64
RaidGUIControlClassDescription.PERSONAL_BUFF_DEFAULT_Y = 470
function RaidGUIControlClassDescription:init(parent, params, item_data)
	slot9 = item_data

	RaidGUIControlClassDescription.super.init(slot5, self, parent, params)

	self._data = item_data
	slot6 = self

	self._layout(slot5)

	return 
end
function RaidGUIControlClassDescription:_layout()
	slot4 = {
		name = "character_info_panel",
		x = self._params.x,
		y = self._params.y,
		w = self._params.w,
		h = self._params.h
	}
	self._object = self._panel.panel(slot2, self._panel)
	local class_icon_data = tweak_data.gui.icons.ico_class_recon or tweak_data.gui.icons.ico_flag_empty
	local text_rect = class_icon_data.texture_rect
	slot6 = {
		name = "class_icon",
		y = 6,
		x = 0,
		w = text_rect[3],
		h = text_rect[4],
		texture = class_icon_data.texture,
		texture_rect = text_rect
	}
	self._class_icon = self._object.image(slot4, self._object)
	slot6 = {
		text = "",
		name = "class_label",
		h = 42,
		y = 8,
		x = 64,
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.menu_list,
		color = tweak_data.gui.colors.raid_red
	}
	self._class_label = self._object.label(slot4, self._object)
	slot9 = self._class_label
	slot6 = self._object.w(tweak_data.gui.colors.raid_red) - self._class_label.x(self._object)

	self._class_label.set_w(slot4, self._class_label)

	slot9 = self._object
	self._description_label = self._object.label(slot4, self._object)
	local y_stats = RaidGUIControlClassDescription.CLASS_STATS_DEFAULT_Y
	local y_stats_label = y_stats + 64
	slot8 = {
		name = "health_amount_label",
		vertical = "center",
		h = 64,
		w = 64,
		align = "center",
		text = "",
		x = 0,
		y = y_stats,
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.size_52,
		color = tweak_data.gui.colors.raid_dirty_white
	}
	self._health_amount_label = self._object.label({
		name = "description_label",
		vertical = "top",
		wrap = true,
		align = "left",
		x = 0,
		y = RaidGUIControlClassDescription.CLASS_DESCRIPTION_DEFAULT_Y,
		w = self._object.w(self._object),
		h = RaidGUIControlClassDescription.CLASS_DESCRIPTION_DEFAULT_H,
		text = self.translate(self._object, self, "skill_class_recon_desc"),
		font = tweak_data.gui.fonts.lato,
		font_size = tweak_data.gui.font_sizes.size_20,
		color = tweak_data.gui.colors.raid_grey
	}, self._object)
	slot8 = {
		name = "health_label",
		vertical = "center",
		h = 32,
		w = 64,
		align = "center",
		text = "",
		x = 0,
		y = y_stats_label,
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.size_24,
		color = tweak_data.gui.colors.raid_grey
	}
	self._health_label = self._object.label(, self._object)
	slot8 = {
		name = "speed_amount_label",
		vertical = "center",
		h = 64,
		w = 96,
		align = "center",
		text = "",
		x = 160,
		y = y_stats,
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.size_52,
		color = tweak_data.gui.colors.raid_dirty_white
	}
	self._speed_amount_label = self._object.label(, self._object)
	slot8 = {
		name = "speed_label",
		vertical = "center",
		h = 32,
		w = 96,
		align = "center",
		text = "",
		x = 160,
		y = y_stats_label,
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.size_24,
		color = tweak_data.gui.colors.raid_grey
	}
	self._speed_label = self._object.label(, self._object)
	slot8 = {
		name = "stamina_amount_label",
		vertical = "center",
		h = 64,
		w = 96,
		align = "center",
		text = "",
		x = 320,
		y = y_stats,
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.size_52,
		color = tweak_data.gui.colors.raid_dirty_white
	}
	self._stamina_amount_label = self._object.label(, self._object)
	slot8 = {
		name = "stamina_label",
		vertical = "center",
		h = 32,
		w = 96,
		align = "center",
		text = "",
		x = 320,
		y = y_stats_label,
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.size_24,
		color = tweak_data.gui.colors.raid_grey
	}
	self._stamina_label = self._object.label(, self._object)
	local y_warcry = RaidGUIControlClassDescription.WARCRY_DEFAULT_Y
	slot9 = {
		name = "warcry_icon",
		x = 0,
		y = y_warcry,
		texture = tweak_data.gui.icons.warcry_sharpshooter.texture,
		texture_rect = tweak_data.gui.icons.warcry_sharpshooter.texture_rect
	}
	self._warcry_icon = self._object.image(self._object, self._object)
	slot9 = {
		w = 242,
		name = "warcry_name_label",
		h = 32,
		text = "",
		x = self._warcry_icon.right(false) + 16,
		y = y_warcry + 12,
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.size_32,
		color = tweak_data.gui.colors.raid_dirty_white
	}
	slot12 = self._warcry_icon
	self._warcry_name_label = self._object.label(self._object, self._object)
	slot9 = {
		name = "warcries_label",
		vertical = "center",
		h = 32,
		w = 96,
		x = 352,
		y = y_warcry + 16,
		text = self.translate(false, self, "select_character_warcries_label"),
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.size_24,
		color = tweak_data.gui.colors.raid_grey
	}
	self._warcries_label = self._object.label(self._object, self._object)
	slot8 = self._warcries_label

	self._warcries_label.set_center_y(self._object, self._warcry_name_label.center_y(tweak_data.gui.colors.raid_grey))

	slot8 = self._warcries_label
	local _, _, w, _ = self._warcries_label.text_rect(self._object)
	slot13 = w

	self._warcries_label.set_w(self._warcry_name_label, self._warcries_label)

	slot12 = self._warcries_label

	self._warcries_label.set_right(self._warcry_name_label, self._object.w(true))

	slot13 = {
		name = "warcry_description_short",
		h = 24,
		text = "",
		x = 0,
		y = self._warcry_icon.bottom(self._object) + 32,
		w = self._object.w(self._object),
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.size_24,
		color = tweak_data.gui.colors.raid_dirty_white
	}
	slot16 = self._warcry_icon
	slot16 = self._object
	self._warcry_description_short = self._object.label(self._warcry_name_label, self._object)
	slot13 = {
		name = "warcry_description_label",
		vertical = "top",
		h = 64,
		wrap = true,
		align = "left",
		text = "",
		x = 0,
		y = self._warcry_description_short.bottom(self._object) + 24,
		w = self._object.w(self._object),
		font = tweak_data.gui.fonts.lato,
		font_size = tweak_data.gui.font_sizes.size_18,
		color = tweak_data.gui.colors.raid_grey
	}
	slot16 = self._warcry_description_short
	slot16 = self._object
	self._warcry_description_label = self._object.label(self._warcry_name_label, self._object)
	slot13 = {
		name = "warcry_description_team_short_label",
		h = 24,
		text = "",
		x = 0,
		y = self._warcry_description_label.bottom(self._object) + 24,
		w = self._object.w(self._object),
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.size_24,
		color = tweak_data.gui.colors.raid_dirty_white
	}
	slot16 = self._warcry_description_label
	slot16 = self._object
	self._warcry_team_buff_description_short = self._object.label(self._warcry_name_label, self._object)
	slot13 = {
		name = "warcry_description_team_label",
		vertical = "top",
		h = 120,
		wrap = true,
		align = "left",
		text = "",
		x = 0,
		y = self._warcry_team_buff_description_short.bottom(self._object) + 24,
		w = self._object.w(self._object),
		font = tweak_data.gui.fonts.lato,
		font_size = tweak_data.gui.font_sizes.size_18,
		color = tweak_data.gui.colors.raid_grey
	}
	slot16 = self._warcry_team_buff_description_short
	slot16 = self._object
	self._warcry_team_buff_description = self._object.label(self._warcry_name_label, self._object)

	return 
end
function RaidGUIControlClassDescription:set_data(data)

	-- Decompilation error in this vicinity:
	local class_icon_data = tweak_data.gui.icons["ico_class_" .. data.class_name] or tweak_data.gui.icons.ico_flag_empty
	slot6 = class_icon_data.texture

	self._class_icon.set_image(slot4, self._class_icon)

	slot6 = class_icon_data.texture_rect

	self._class_icon.set_texture_rect(slot4, self._class_icon)

	slot6 = true

	self._class_icon.set_visible(slot4, self._class_icon)

	slot5 = self._class_label
	slot10 = true

	self._class_label.set_text(slot4, self.translate(slot7, self, tweak_data.skilltree.classes[data.class_name].name_id))

	slot7 = false
	local class_description = self.translate(slot4, self, tweak_data.skilltree.classes[data.class_name].desc_id) or ""
	slot7 = class_description

	self._description_label.set_text(slot5, self._description_label)

	slot6 = self._description_label
	local _, _, _, h = self._description_label.text_rect(slot5)
	slot11 = h

	self._description_label.set_h(slot9, self._description_label)

	local description_extra_h = 0

	if RaidGUIControlClassDescription.CLASS_DESCRIPTION_DEFAULT_H < h then
		description_extra_h = h - RaidGUIControlClassDescription.CLASS_DESCRIPTION_DEFAULT_H
	end

	local health_amount = (data.class_stats and data.class_stats.health.base) or 0
	slot12 = self._health_amount_label
	slot16 = health_amount

	self._health_amount_label.set_text(slot11, string.format(slot14, "%.0f"))

	slot12 = self._health_amount_label
	local _, _, w, _ = self._health_amount_label.text_rect(slot11)
	slot17 = w

	self._health_amount_label.set_w("%.0f", self._health_amount_label)

	slot17 = 0

	self._health_amount_label.set_x("%.0f", self._health_amount_label)

	slot16 = self._health_label
	slot21 = true

	self._health_label.set_text("%.0f", self.translate(slot18, self, "select_character_health_label"))

	slot16 = self._health_label
	local _, _, w, _ = self._health_label.text_rect("%.0f")
	slot21 = w

	self._health_label.set_w(self, self._health_label)

	slot21 = 0

	self._health_label.set_x(self, self._health_label)

	slot21 = self._health_label
	slot22 = health_center_x

	self._health_label.set_center_x(slot20, self._health_label)

	slot22 = health_center_x

	self._health_amount_label.set_center_x(slot20, self._health_amount_label)

	slot22 = RaidGUIControlClassDescription.CLASS_STATS_DEFAULT_Y + description_extra_h

	self._health_amount_label.set_y(slot20, self._health_amount_label)

	slot25 = self._health_amount_label
	slot22 = self._health_amount_label.y(slot23) + self._health_amount_label.h(self._health_amount_label)

	self._health_label.set_y(slot20, self._health_label)

	local speed_amount = (data.class_stats and data.class_stats.speed.base) or 0
	slot22 = self._speed_amount_label
	slot26 = speed_amount

	self._speed_amount_label.set_text(slot21, string.format(slot24, "%.0f"))

	slot22 = self._speed_amount_label
	local _, _, w, _ = self._speed_amount_label.text_rect(slot21)
	slot27 = w

	self._speed_amount_label.set_w("%.0f", self._speed_amount_label)

	slot29 = self._object
	slot27 = self._object.w(slot28) / 2

	self._speed_amount_label.set_center_x("%.0f", self._speed_amount_label)

	slot26 = self._speed_label
	slot31 = true

	self._speed_label.set_text("%.0f", self.translate(slot28, self, "select_character_speed_label"))

	slot26 = self._speed_label
	local _, _, w, _ = self._speed_label.text_rect("%.0f")
	slot31 = w

	self._speed_label.set_w(self, self._speed_label)

	slot33 = self._object
	slot31 = self._object.w(slot32) / 2

	self._speed_label.set_center_x(self, self._speed_label)

	slot31 = RaidGUIControlClassDescription.CLASS_STATS_DEFAULT_Y + description_extra_h

	self._speed_amount_label.set_y(self, self._speed_amount_label)

	slot34 = self._speed_amount_label
	slot31 = self._speed_amount_label.y(slot32) + self._speed_amount_label.h(self._speed_amount_label)

	self._speed_label.set_y(self, self._speed_label)

	local stamina_amount = (data.class_stats and data.class_stats.stamina.base) or 0
	slot31 = self._stamina_amount_label
	slot35 = stamina_amount

	self._stamina_amount_label.set_text(slot30, string.format(slot33, "%.0f"))

	slot31 = self._stamina_amount_label
	local _, _, w, _ = self._stamina_amount_label.text_rect(slot30)
	slot36 = w

	self._stamina_amount_label.set_w("%.0f", self._stamina_amount_label)

	slot35 = self._stamina_amount_label
	slot38 = self._object

	self._stamina_amount_label.set_right("%.0f", self._object.w(slot37))

	slot35 = self._stamina_label
	slot40 = true

	self._stamina_label.set_text("%.0f", self.translate(slot37, self, "select_character_stamina_label"))

	slot35 = self._stamina_label
	local _, _, w, _ = self._stamina_label.text_rect("%.0f")
	slot40 = w

	self._stamina_label.set_w(self, self._stamina_label)

	slot39 = self._stamina_label
	slot42 = self._object

	self._stamina_label.set_right(self, self._object.w(slot41))

	slot40 = self._stamina_amount_label

	if self._stamina_amount_label.w(self._stamina_label) < self._stamina_label.w(self) then
		slot39 = self._stamina_amount_label
		slot42 = self._stamina_label

		self._stamina_amount_label.set_center_x(slot38, self._stamina_label.center_x(slot41))
	else
		slot39 = self._stamina_label
		slot42 = self._stamina_amount_label

		self._stamina_label.set_center_x(slot38, self._stamina_amount_label.center_x(slot41))
	end

	slot40 = RaidGUIControlClassDescription.CLASS_STATS_DEFAULT_Y + description_extra_h

	self._stamina_amount_label.set_y(slot38, self._stamina_amount_label)

	slot43 = self._stamina_amount_label
	slot40 = self._stamina_amount_label.y(slot41) + self._stamina_amount_label.h(self._stamina_amount_label)

	self._stamina_label.set_y(slot38, self._stamina_label)

	local warcry_name_id = tweak_data.skilltree.class_warcry_data[data.class_name]
	slot42 = true
	local warcry_name = self.translate(self._stamina_label, self, tweak_data.warcry[warcry_name_id].name_id)
	local warcry_desc = self.translate(self, self, tweak_data.warcry[warcry_name_id].desc_self_id)
	local warcry_menu_icon_name = tweak_data.warcry[warcry_name_id].menu_icon
	local warcry_icon_data = tweak_data.gui.icons[warcry_menu_icon_name]
	slot45 = warcry_desc

	self._warcry_description_label.set_text(false, self._warcry_description_label)

	slot44 = self._warcry_description_label
	local _, _, _, h = self._warcry_description_label.text_rect(false)
	slot49 = h

	self._warcry_description_label.set_h(slot47, self._warcry_description_label)

	slot49 = warcry_icon_data.texture

	self._warcry_icon.set_image(slot47, self._warcry_icon)

	slot49 = warcry_icon_data.texture_rect

	self._warcry_icon.set_texture_rect(slot47, self._warcry_icon)

	slot49 = RaidGUIControlClassDescription.WARCRY_DEFAULT_Y + RaidGUIControlClassDescription.WARCRY_DEFAULT_H / 2 + description_extra_h

	self._warcry_icon.set_center_y(slot47, self._warcry_icon)

	slot49 = warcry_name

	self._warcry_name_label.set_text(slot47, self._warcry_name_label)

	slot49 = RaidGUIControlClassDescription.WARCRY_DEFAULT_Y + description_extra_h

	self._warcry_name_label.set_y(slot47, self._warcry_name_label)

	slot48 = self._warcries_label
	slot51 = self._warcry_name_label

	self._warcries_label.set_x(slot47, self._warcry_name_label.x(RaidGUIControlClassDescription.WARCRY_DEFAULT_H / 2))

	slot49 = RaidGUIControlClassDescription.WARCRY_DEFAULT_Y + RaidGUIControlClassDescription.WARCRY_DEFAULT_H + description_extra_h

	self._warcries_label.set_bottom(slot47, self._warcries_label)

	slot48 = self._warcry_description_short
	slot53 = true

	self._warcry_description_short.set_text(slot47, self.translate(RaidGUIControlClassDescription.WARCRY_DEFAULT_H, self, tweak_data.warcry[warcry_name_id].desc_short_id))

	slot48 = self._warcry_team_buff_description_short
	slot53 = true

	self._warcry_team_buff_description_short.set_text(slot47, self.translate(RaidGUIControlClassDescription.WARCRY_DEFAULT_H, self, tweak_data.warcry[warcry_name_id].desc_team_short_id))

	slot48 = self._warcry_team_buff_description
	slot53 = false

	self._warcry_team_buff_description.set_text(slot47, self.translate(RaidGUIControlClassDescription.WARCRY_DEFAULT_H, self, tweak_data.warcry[warcry_name_id].desc_team_id))

	slot49 = self._warcry_description_label.bottom(RaidGUIControlClassDescription.WARCRY_DEFAULT_H) + 24
	local team_buff_y = math.max(slot47, RaidGUIControlClassDescription.PERSONAL_BUFF_DEFAULT_Y)
	slot50 = team_buff_y

	self._warcry_team_buff_description_short.set_y(RaidGUIControlClassDescription.PERSONAL_BUFF_DEFAULT_Y, self._warcry_team_buff_description_short)

	slot52 = self._warcry_team_buff_description_short
	slot50 = self._warcry_team_buff_description_short.bottom(self._warcry_description_label) + 24

	self._warcry_team_buff_description.set_y(RaidGUIControlClassDescription.PERSONAL_BUFF_DEFAULT_Y, self._warcry_team_buff_description)

	slot50 = RaidGUIControlClassDescription.PERSONAL_BUFF_DEFAULT_Y + description_extra_h

	self._warcry_description_short.set_y(RaidGUIControlClassDescription.PERSONAL_BUFF_DEFAULT_Y, self._warcry_description_short)

	slot52 = self._warcry_description_short
	slot50 = self._warcry_description_short.bottom(self._warcry_description_label) + 24

	self._warcry_description_label.set_y(RaidGUIControlClassDescription.PERSONAL_BUFF_DEFAULT_Y, self._warcry_description_label)

	slot52 = self._warcry_description_label
	slot50 = self._warcry_description_label.bottom(self._warcry_description_label) + 24

	self._warcry_team_buff_description_short.set_y(RaidGUIControlClassDescription.PERSONAL_BUFF_DEFAULT_Y, self._warcry_team_buff_description_short)

	slot52 = self._warcry_team_buff_description_short
	slot50 = self._warcry_team_buff_description_short.bottom(self._warcry_description_label) + 24

	self._warcry_team_buff_description.set_y(RaidGUIControlClassDescription.PERSONAL_BUFF_DEFAULT_Y, self._warcry_team_buff_description)

	return 
end

return 
