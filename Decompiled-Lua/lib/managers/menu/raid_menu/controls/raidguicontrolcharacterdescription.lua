if not RaidGUIControlCharacterDescription then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlCharacterDescription = slot0
RaidGUIControlCharacterDescription.MODE_SELECTION = "mode_selection"
RaidGUIControlCharacterDescription.MODE_CUSTOMIZATION = "mode_customization"
function RaidGUIControlCharacterDescription:init(parent, params, item_data)
	slot9 = item_data

	RaidGUIControlCharacterDescription.super.init(slot5, self, parent, params)

	self._data = item_data
	self._mode = self._params.mode or RaidGUIControlCharacterDescription.MODE_SELECTION
	slot6 = self

	self._layout(slot5)

	return 
end
function RaidGUIControlCharacterDescription:_layout()
	slot4 = {
		name = "character_info_panel",
		x = self._params.x,
		y = self._params.y,
		w = self._params.w,
		h = self._params.h
	}
	self._object = self._panel.panel(slot2, self._panel)
	local text_rect = tweak_data.gui.icons.ico_class_recon.texture_rect
	slot5 = {
		name = "class_icon",
		y = 32,
		visible = false,
		x = 32,
		w = text_rect[3],
		h = text_rect[4],
		texture = tweak_data.gui.icons.ico_class_recon.texture,
		texture_rect = tweak_data.gui.icons.ico_class_recon.texture_rect
	}
	self._class_icon = self._object.image(self._panel, self._object)
	slot5 = {
		name = "class_label",
		vertical = "center",
		h = 32,
		w = 134,
		align = "center",
		text = "",
		y = 96,
		x = 0,
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.size_24,
		color = tweak_data.gui.colors.raid_grey
	}
	self._class_label = self._object.label(self._panel, self._object)
	slot5 = {
		name = "nation_flag_icon",
		h = 64,
		y = 32,
		w = 96,
		visible = false,
		x = 144,
		texture = tweak_data.gui.icons.ico_flag_empty.texture,
		texture_rect = tweak_data.gui.icons.ico_flag_empty.texture_rect
	}
	self._nation_flag_icon = self._object.image(self._panel, self._object)
	slot5 = {
		name = "nation_flag_label",
		vertical = "center",
		h = 32,
		w = 104,
		align = "center",
		text = "",
		y = 96,
		x = 144,
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.size_24,
		color = tweak_data.gui.colors.raid_grey
	}
	self._nation_flag_label = self._object.label(self._panel, self._object)
	slot5 = {
		name = "level_amount_level",
		vertical = "center",
		h = 64,
		w = 64,
		align = "center",
		text = "",
		y = 32,
		x = 280,
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.size_52,
		color = tweak_data.gui.colors.raid_white
	}
	self._level_amount_level = self._object.label(self._panel, self._object)
	slot5 = {
		name = "level_label",
		vertical = "center",
		h = 32,
		w = 72,
		align = "center",
		text = "",
		y = 96,
		x = 280,
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.size_24,
		color = tweak_data.gui.colors.raid_grey
	}
	self._level_label = self._object.label(self._panel, self._object)

	if self._mode == RaidGUIControlCharacterDescription.MODE_SELECTION then
		slot5 = {
			name = "description_label",
			vertical = "top",
			h = 224,
			wrap = true,
			w = 354,
			align = "left",
			y = 160,
			x = 0,
			text = self.translate(slot7, self, "skill_class_recon_desc"),
			font = tweak_data.gui.fonts.lato,
			font_size = tweak_data.gui.font_sizes.size_20,
			color = tweak_data.gui.colors.raid_grey
		}
		slot10 = false
		self._description_label = self._object.label(slot3, self._object)
		slot5 = {
			name = "health_amount_label",
			vertical = "center",
			h = 64,
			w = 64,
			align = "center",
			text = "",
			y = 398,
			x = 8,
			font = tweak_data.gui.fonts.din_compressed,
			font_size = tweak_data.gui.font_sizes.size_52,
			color = tweak_data.gui.colors.raid_white
		}
		self._health_amount_label = self._object.label(slot3, self._object)
		slot5 = {
			name = "health_label",
			vertical = "center",
			h = 32,
			w = 64,
			align = "center",
			text = "",
			y = 462,
			x = 8,
			font = tweak_data.gui.fonts.din_compressed,
			font_size = tweak_data.gui.font_sizes.size_24,
			color = tweak_data.gui.colors.raid_grey
		}
		self._health_label = self._object.label(slot3, self._object)
		slot5 = {
			name = "speed_amount_label",
			vertical = "center",
			h = 64,
			w = 96,
			align = "center",
			text = "",
			y = 398,
			x = 128,
			font = tweak_data.gui.fonts.din_compressed,
			font_size = tweak_data.gui.font_sizes.size_52,
			color = tweak_data.gui.colors.raid_white
		}
		self._speed_amount_label = self._object.label(slot3, self._object)
		slot5 = {
			name = "speed_label",
			vertical = "center",
			h = 32,
			w = 96,
			align = "center",
			text = "",
			y = 462,
			x = 128,
			font = tweak_data.gui.fonts.din_compressed,
			font_size = tweak_data.gui.font_sizes.size_24,
			color = tweak_data.gui.colors.raid_grey
		}
		self._speed_label = self._object.label(slot3, self._object)
		slot5 = {
			name = "stamina_amount_label",
			vertical = "center",
			h = 64,
			w = 96,
			align = "center",
			text = "",
			y = 398,
			x = 254,
			font = tweak_data.gui.fonts.din_compressed,
			font_size = tweak_data.gui.font_sizes.size_52,
			color = tweak_data.gui.colors.raid_white
		}
		self._stamina_amount_label = self._object.label(slot3, self._object)
		slot5 = {
			name = "stamina_label",
			vertical = "center",
			h = 32,
			w = 68,
			align = "center",
			text = "",
			y = 462,
			x = 270,
			font = tweak_data.gui.fonts.din_compressed,
			font_size = tweak_data.gui.font_sizes.size_24,
			color = tweak_data.gui.colors.raid_grey
		}
		self._stamina_label = self._object.label(slot3, self._object)
		slot5 = {
			name = "warcries_label",
			vertical = "center",
			h = 32,
			w = 96,
			align = "left",
			text = "",
			y = 528,
			x = 0,
			font = tweak_data.gui.fonts.din_compressed,
			font_size = tweak_data.gui.font_sizes.small,
			color = Color(slot7)
		}
		slot8 = "b8b8b8"
		self._warcries_label = self._object.label(slot3, self._object)
		slot5 = {
			name = "warcry_icon",
			h = 64,
			y = 576,
			w = 64,
			x = 0,
			texture = tweak_data.gui.icons.ico_flag_empty.texture,
			texture_rect = tweak_data.gui.icons.ico_flag_empty.texture_rect
		}
		self._warcry_icon = self._object.image(slot3, self._object)
		slot5 = {
			name = "warcry_name_label",
			vertical = "center",
			h = 32,
			w = 242,
			align = "left",
			text = "",
			y = 528,
			x = 79,
			font = tweak_data.gui.fonts.din_compressed,
			font_size = tweak_data.gui.font_sizes.small,
			color = Color(slot7)
		}
		slot8 = "d0d0d0"
		self._warcry_name_label = self._object.label(slot3, self._object)
		slot5 = {
			name = "warcry_description_label",
			vertical = "top",
			wrap = true,
			align = "left",
			text = "",
			y = 570,
			x = 79,
			w = self._object.w(slot7) - 79,
			h = self._object.h(slot7) - 570,
			font = tweak_data.gui.fonts.lato,
			font_size = tweak_data.gui.font_sizes.size_18,
			color = Color(slot7)
		}
		slot8 = self._object
		slot8 = self._object
		slot8 = "737373"
		self._warcry_description_label = self._object.label(slot3, self._object)
	end

	return 
end
function RaidGUIControlCharacterDescription:set_data(data)
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

	local nation_flag_data = tweak_data.gui.icons["ico_flag_" .. data.nationality] or tweak_data.gui.icons.ico_flag_empty
	slot7 = nation_flag_data.texture

	self._nation_flag_icon.set_image(slot5, self._nation_flag_icon)

	slot7 = nation_flag_data.texture_rect

	self._nation_flag_icon.set_texture_rect(slot5, self._nation_flag_icon)

	slot7 = true

	self._nation_flag_icon.set_visible(slot5, self._nation_flag_icon)

	slot6 = self._nation_flag_label
	slot12 = "nationality_" .. data.nationality

	self._nation_flag_label.set_text(slot5, utf8.to_upper(managers.localization.text(slot10, managers.localization)))

	slot7 = data.level

	self._level_amount_level.set_text(slot5, self._level_amount_level)

	slot6 = self._level_label
	slot11 = true

	self._level_label.set_text(slot5, self.translate(slot8, self, "select_character_level_label"))

	if self._mode == RaidGUIControlCharacterDescription.MODE_SELECTION then
		slot8 = false
		local class_description = self.translate(slot5, self, tweak_data.skilltree.classes[data.class_name].desc_id) or ""
		slot8 = class_description

		self._description_label.set_text(slot6, self._description_label)

		local health_amount = (data.character_stats and data.character_stats.health.base) or 0
		slot8 = self._health_amount_label
		slot12 = health_amount

		self._health_amount_label.set_text(slot7, string.format(slot10, "%.0f"))

		slot8 = self._health_label
		slot13 = true

		self._health_label.set_text(slot7, self.translate(slot10, self, "select_character_health_label"))

		slot8 = self._health_label
		local _, _, w, _ = self._health_label.text_rect(slot7)
		slot13 = w

		self._health_label.set_w(self, self._health_label)

		slot16 = self._health_amount_label
		slot13 = self._health_amount_label.x(slot14) + self._health_amount_label.w(self._health_amount_label) / 2

		self._health_label.set_center_x(self, self._health_label)

		local speed_amount = (data.character_stats and data.character_stats.speed.base) or 0
		slot13 = self._speed_amount_label
		slot17 = speed_amount

		self._speed_amount_label.set_text(slot12, string.format(slot15, "%.0f"))

		slot13 = self._speed_label
		slot18 = true

		self._speed_label.set_text(slot12, self.translate(slot15, self, "select_character_speed_label"))

		local stamina_amount = (data.character_stats and data.character_stats.stamina.base) or 0
		slot14 = self._stamina_amount_label
		slot18 = stamina_amount

		self._stamina_amount_label.set_text(slot13, string.format(slot16, "%.0f"))

		slot14 = self._stamina_label
		slot19 = true

		self._stamina_label.set_text(slot13, self.translate(slot16, self, "select_character_stamina_label"))

		slot14 = self._warcries_label
		slot19 = true

		self._warcries_label.set_text(slot13, self.translate(slot16, self, "select_character_warcries_label"))

		slot14 = self._warcries_label
		local _, _, w, _ = self._warcries_label.text_rect(slot13)
		slot19 = w

		self._warcries_label.set_w(self, self._warcries_label)

		local warcry_name_id = tweak_data.skilltree.class_warcry_data[data.class_name]
		slot21 = true
		local warcry_name = self.translate(self._warcries_label, self, tweak_data.warcry[warcry_name_id].name_id)
		local warcry_desc = self.translate(self, self, tweak_data.warcry[warcry_name_id].desc_id)
		local warcry_menu_icon_name = tweak_data.warcry[warcry_name_id].menu_icon
		local warcry_icon_data = tweak_data.gui.icons[warcry_menu_icon_name]
		slot24 = warcry_desc

		self._warcry_description_label.set_text(false, self._warcry_description_label)

		slot24 = warcry_icon_data.texture

		self._warcry_icon.set_image(false, self._warcry_icon)

		slot24 = warcry_icon_data.texture_rect

		self._warcry_icon.set_texture_rect(false, self._warcry_icon)

		slot24 = warcry_name

		self._warcry_name_label.set_text(false, self._warcry_name_label)

		slot23 = self._warcry_name_label
		local _, _, w, _ = self._warcry_name_label.text_rect(false)
		slot28 = w

		self._warcry_name_label.set_w(slot26, self._warcry_name_label)

		slot31 = self._warcries_label
		slot28 = self._warcries_label.x(slot29) + self._warcries_label.w(self._warcries_label) + 5

		self._warcry_name_label.set_x(slot26, self._warcry_name_label)
	end

	return 
end

return 
