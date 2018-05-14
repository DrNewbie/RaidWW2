if not RaidGUIControlPeerDetails then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlPeerDetails = slot0
RaidGUIControlPeerDetails.FONT = tweak_data.gui.fonts.din_compressed
RaidGUIControlPeerDetails.NAME_X = 70
RaidGUIControlPeerDetails.NAME_FONT_SIZE = 26
RaidGUIControlPeerDetails.NAME_PADDING_DOWN = 10
RaidGUIControlPeerDetails.NAME_COLOR = tweak_data.gui.colors.raid_light_red
RaidGUIControlPeerDetails.DEFAULT_W = 300
RaidGUIControlPeerDetails.DEFAULT_H = 64
RaidGUIControlPeerDetails.CLASS_ICON_PADDING_LEFT = 5
RaidGUIControlPeerDetails.ICON_TITLE_FONT_SIZE = 38
RaidGUIControlPeerDetails.ICON_FONT_SIZE = 14
RaidGUIControlPeerDetails.LEVEL_W = 64
function RaidGUIControlPeerDetails:init(parent, params)
	slot7 = params

	RaidGUIControlPeerDetails.super.init(slot4, self, parent)

	if not params then
		slot9 = self._name
		slot6 = "[RaidGUIControlPeerDetails:init] Parameters not specified for the peer details control " .. tostring(slot8)

		Application.error(slot4, Application)

		return 
	end

	self._pointer_type = "arrow"
	slot5 = self

	self.highlight_off(slot4)

	slot5 = self

	self._create_panel(slot4)

	slot5 = self

	self._create_profile_name(slot4)

	slot5 = self

	self._create_profile_details(slot4)

	return 
end
function RaidGUIControlPeerDetails:_create_panel()
	local panel_params = clone(slot2)
	panel_params.name = panel_params.name .. "_panel"
	slot4 = self._panel
	panel_params.layer = self._panel.layer("_panel") + 1
	panel_params.x = self._params.x or 0
	panel_params.y = self._params.y or 0
	panel_params.w = self._params.w or RaidGUIControlPeerDetails.DEFAULT_W
	panel_params.h = RaidGUIControlPeerDetails.DEFAULT_H
	slot5 = panel_params
	self._object = self._panel.panel(self._params, self._panel)

	return 
end
function RaidGUIControlPeerDetails:_create_profile_name()
	local profile_name_params = {
		name = "profile_name",
		h = 32,
		vertical = "center",
		align = "left",
		text = "PROFILE NAME",
		y = 0,
		x = RaidGUIControlPeerDetails.NAME_X
	}
	slot4 = self._object
	profile_name_params.w = self._object.w(slot3) - RaidGUIControlPeerDetails.NAME_X - RaidGUIControlPeerDetails.LEVEL_W
	profile_name_params.font = RaidGUIControlPeerDetails.FONT
	profile_name_params.font_size = RaidGUIControlPeerDetails.NAME_FONT_SIZE
	profile_name_params.color = tweak_data.gui.colors.raid_black
	slot5 = profile_name_params
	self._profile_name = self._object.text(RaidGUIControlPeerDetails.LEVEL_W, self._object)

	return 
end
function RaidGUIControlPeerDetails:_create_profile_details()
	local class_icon_params = {
		name = "class_icon",
		texture = tweak_data.gui.icons.ico_class_infiltrator.texture,
		texture_rect = tweak_data.gui.icons.ico_class_infiltrator.texture_rect,
		color = tweak_data.gui.colors.raid_black
	}
	slot5 = class_icon_params
	self._class_icon = self._object.bitmap(slot3, self._object)
	slot5 = self._object.h(slot6) / 2

	self._class_icon.set_center_y(slot3, self._class_icon)

	local nationality_params = {
		name = "nationality",
		h = 32,
		vertical = "center",
		align = "left",
		text = "GERMAN",
		y = 0,
		x = RaidGUIControlPeerDetails.NAME_X
	}
	slot5 = self._object
	nationality_params.w = self._object.w(self._class_icon) - RaidGUIControlPeerDetails.NAME_X
	nationality_params.font = RaidGUIControlPeerDetails.FONT
	nationality_params.font_size = tweak_data.gui.font_sizes.extra_small
	nationality_params.color = tweak_data.gui.colors.raid_black
	slot6 = nationality_params
	self._nationality = self._object.text(RaidGUIControlPeerDetails.NAME_X, self._object)

	self._nationality.set_bottom(RaidGUIControlPeerDetails.NAME_X, self._object.h(self._object))

	local level_text_params = {
		vertical = "center",
		h = 32,
		name = "level_text",
		align = "center",
		text = "10",
		w = RaidGUIControlPeerDetails.LEVEL_W,
		font = RaidGUIControlPeerDetails.FONT,
		font_size = tweak_data.gui.font_sizes.size_24,
		color = tweak_data.gui.colors.raid_black
	}
	slot7 = level_text_params
	self._level_text = self._object.text(self._nationality, self._object)
	slot6 = self._level_text
	slot9 = self._object

	self._level_text.set_right(self._nationality, self._object.w(self._object))

	return 
end
function RaidGUIControlPeerDetails:set_profile_name(name)
	slot4 = self._profile_name
	slot7 = name

	self._profile_name.set_text(slot3, utf8.to_upper(slot6))

	return 
end
function RaidGUIControlPeerDetails:set_class(character_class)
	slot5 = tweak_data.gui.icons["ico_class_" .. character_class].texture

	self._class_icon.set_image(slot3, self._class_icon)

	slot4 = self._class_icon
	slot7 = tweak_data.gui.icons["ico_class_" .. character_class].texture_rect

	self._class_icon.set_texture_rect(slot3, unpack("ico_class_" .. character_class))

	return 
end
function RaidGUIControlPeerDetails:set_nationality(nationality)
	local params = {
		icon_h = 48,
		text_size = RaidGUIControlPeerDetails.ICON_FONT_SIZE
	}
	slot5 = self._nationality
	slot11 = "nationality_" .. nationality

	self._nationality.set_text(slot4, utf8.to_upper(managers.localization.text(slot9, managers.localization)))

	return 
end
function RaidGUIControlPeerDetails:set_level(level)
	slot4 = self._level_text
	slot7 = level

	self._level_text.set_text(slot3, tostring(slot6))

	return 
end
function RaidGUIControlPeerDetails:close()
	return 
end

return 
