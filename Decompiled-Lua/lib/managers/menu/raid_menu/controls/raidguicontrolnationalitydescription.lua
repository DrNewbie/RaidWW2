if not RaidGUIControlNationalityDescription then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlNationalityDescription = slot0
RaidGUIControlNationalityDescription.PREFERRED_NATIONALITY_LABEL_DEFAULT_Y = 242
function RaidGUIControlNationalityDescription:init(parent, params, item_data)
	slot9 = item_data

	RaidGUIControlNationalityDescription.super.init(slot5, self, parent, params)

	self._data = item_data
	slot6 = self

	self._layout(slot5)

	return 
end
function RaidGUIControlNationalityDescription:_layout()
	slot4 = {
		name = "character_info_panel",
		x = self._params.x,
		y = self._params.y,
		w = self._params.w,
		h = self._params.h
	}
	self._object = self._panel.panel(slot2, self._panel)
	local tex_rect = tweak_data.gui.icons.character_creation_nationality_british.texture_rect
	slot5 = {
		name = "nation_icon",
		y = 5,
		x = 0,
		w = tex_rect[3],
		h = tex_rect[4],
		texture = tweak_data.gui.icons.character_creation_nationality_british.texture,
		texture_rect = tex_rect
	}
	self._nation_icon = self._object.image(self._panel, self._object)
	slot5 = {
		w = 224,
		name = "character_name_label",
		h = 42,
		y = 8,
		x = 64,
		text = utf8.to_upper(slot7),
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.menu_list,
		color = tweak_data.gui.colors.raid_red
	}
	slot8 = "Stirling"
	self._character_name_label = self._object.label(self._panel, self._object)
	slot5 = {
		name = "backstory_label",
		vertical = "top",
		h = 128,
		wrap = true,
		w = 416,
		align = "left",
		x = 0,
		y = self._character_name_label.bottom(slot7) + 32,
		text = self.translate(slot7, self, "character_profile_creation_british_description"),
		font = tweak_data.gui.fonts.lato,
		font_size = tweak_data.gui.font_sizes.size_20,
		color = tweak_data.gui.colors.raid_grey
	}
	slot8 = self._character_name_label
	slot10 = false
	self._backstory_label = self._object.label(self._panel, self._object)
	slot5 = {
		w = 320,
		name = "preferred_nationality",
		h = 32,
		x = 0,
		y = RaidGUIControlNationalityDescription.PREFERRED_NATIONALITY_LABEL_DEFAULT_Y,
		text = self.translate(slot7, self, "character_creation_preferred_nationality"),
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.size_32,
		color = tweak_data.gui.colors.raid_dirty_white
	}
	slot10 = true
	self._prefered_nationality_label = self._object.label(self._panel, self._object)
	slot5 = {
		name = "preferred_nationality_disclaimer",
		vertical = "top",
		h = 320,
		wrap = true,
		w = 416,
		align = "left",
		x = 0,
		y = self._prefered_nationality_label.bottom(slot7) + 32,
		text = self.translate(slot7, self, "character_creation_preferred_nationality_disclaimer"),
		font = tweak_data.gui.fonts.lato,
		font_size = tweak_data.gui.font_sizes.size_20,
		color = tweak_data.gui.colors.raid_grey
	}
	slot8 = self._prefered_nationality_label
	slot10 = false
	self._disclaimer_label = self._object.label(self._panel, self._object)

	return 
end
function RaidGUIControlNationalityDescription:set_data(data)
	local nation_icon_data = tweak_data.gui.icons["character_creation_nationality_" .. data.nationality] or tweak_data.gui.icons.ico_flag_empty
	slot6 = nation_icon_data.texture

	self._nation_icon.set_image(slot4, self._nation_icon)

	slot6 = nation_icon_data.texture_rect

	self._nation_icon.set_texture_rect(slot4, self._nation_icon)

	slot6 = true

	self._nation_icon.set_visible(slot4, self._nation_icon)

	slot5 = self._character_name_label
	slot10 = true

	self._character_name_label.set_text(slot4, self.translate(slot7, self, "menu_" .. data.nationality))

	slot7 = false
	local backstory_text = self.translate(slot4, self, "character_profile_creation_" .. data.nationality .. "_description") or ""
	slot7 = backstory_text

	self._backstory_label.set_text(slot5, self._backstory_label)

	slot6 = self._backstory_label
	local _, _, _, h = self._backstory_label.text_rect(slot5)
	slot11 = h

	self._backstory_label.set_h(slot9, self._backstory_label)

	slot10 = self._prefered_nationality_label
	slot16 = self._backstory_label
	slot14 = self._backstory_label.bottom(slot15) + 32

	self._prefered_nationality_label.set_y(slot9, math.max(slot12, RaidGUIControlNationalityDescription.PREFERRED_NATIONALITY_LABEL_DEFAULT_Y))

	slot13 = self._prefered_nationality_label
	slot11 = self._prefered_nationality_label.bottom(slot12) + 32

	self._disclaimer_label.set_y(slot9, self._disclaimer_label)

	return 
end

return 
