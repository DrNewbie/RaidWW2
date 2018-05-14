if not RaidGUIControlExperiencePeerLoot then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlExperiencePeerLoot = slot0
RaidGUIControlExperiencePeerLoot.WIDTH = 544
RaidGUIControlExperiencePeerLoot.HEIGHT = 96
RaidGUIControlExperiencePeerLoot.ICON = "rwd_xp"
RaidGUIControlExperiencePeerLoot.FONT = tweak_data.gui.fonts.din_compressed
RaidGUIControlExperiencePeerLoot.NAME_Y = 12
RaidGUIControlExperiencePeerLoot.NAME_COLOR = tweak_data.gui.colors.raid_dirty_white
RaidGUIControlExperiencePeerLoot.NAME_PADDING_DOWN = 2
RaidGUIControlExperiencePeerLoot.NAME_FONT_SIZE = tweak_data.gui.font_sizes.size_32
RaidGUIControlExperiencePeerLoot.XP_VALUE_COLOR = tweak_data.gui.colors.raid_grey_effects
RaidGUIControlExperiencePeerLoot.XP_VALUE_FONT_SIZE = tweak_data.gui.font_sizes.size_24
RaidGUIControlExperiencePeerLoot.TEXT_X = 128
function RaidGUIControlExperiencePeerLoot:init(parent, params)
	slot7 = params

	RaidGUIControlExperiencePeerLoot.super.init(slot4, self, parent)

	if not params then
		slot6 = "[RaidGUIControlExperiencePeerLoot:init] Parameters not specified for the xp drop details"

		Application.error(slot4, Application)

		return 
	end

	slot5 = self

	self._create_control_panel(slot4)

	slot5 = self

	self._create_experience_details(slot4)

	return 
end
function RaidGUIControlExperiencePeerLoot:close()
	return 
end
function RaidGUIControlExperiencePeerLoot:_create_control_panel()
	slot3 = self._params
	local control_params = clone(slot2)
	control_params.x = control_params.x
	control_params.w = control_params.w or RaidGUIControlExperiencePeerLoot.WIDTH
	control_params.h = control_params.h or RaidGUIControlExperiencePeerLoot.HEIGHT
	control_params.name = control_params.name .. "_xp_panel"
	slot4 = self._panel
	control_params.layer = self._panel.layer("_xp_panel") + 1
	slot5 = control_params
	self._control_panel = self._panel.panel("_xp_panel", self._panel)
	self._object = self._control_panel

	return 
end
function RaidGUIControlExperiencePeerLoot:_create_experience_details()
	local params_xp_image = {
		name = "xp_image",
		x = 0,
		texture = tweak_data.gui.icons[RaidGUIControlExperiencePeerLoot.ICON].texture,
		texture_rect = tweak_data.gui.icons[RaidGUIControlExperiencePeerLoot.ICON].texture_rect
	}
	slot5 = params_xp_image
	self._xp_image = self._object.bitmap(RaidGUIControlExperiencePeerLoot.ICON, self._object)
	slot7 = self._object
	slot5 = self._object.h(slot6) / 2

	self._xp_image.set_center_y(RaidGUIControlExperiencePeerLoot.ICON, self._xp_image)

	local params_player_name = {
		name = "peer_xp_name_label",
		align = "left",
		text = "aa",
		layer = 1,
		x = RaidGUIControlExperiencePeerLoot.TEXT_X,
		y = RaidGUIControlExperiencePeerLoot.NAME_Y
	}
	slot5 = self._object
	params_player_name.w = self._object.w(self._xp_image) - RaidGUIControlExperiencePeerLoot.TEXT_X
	params_player_name.color = RaidGUIControlExperiencePeerLoot.NAME_COLOR
	params_player_name.font = RaidGUIControlExperiencePeerLoot.FONT
	params_player_name.font_size = RaidGUIControlExperiencePeerLoot.NAME_FONT_SIZE
	slot6 = params_player_name
	self._name_label = self._object.text(RaidGUIControlExperiencePeerLoot.TEXT_X, self._object)
	slot5 = self._name_label
	local _, _, _, h = self._name_label.text_rect(RaidGUIControlExperiencePeerLoot.TEXT_X)
	slot10 = h

	self._name_label.set_h(slot8, self._name_label)

	local params_customization_xp_value = {
		name = "customization_xp_value_label",
		align = "left",
		text = "a",
		layer = 1
	}
	slot10 = self._name_label
	params_customization_xp_value.x = self._name_label.x(self._name_label)
	slot11 = self._name_label
	params_customization_xp_value.y = self._name_label.y(self._name_label) + self._name_label.h(self._name_label) + RaidGUIControlExperiencePeerLoot.NAME_PADDING_DOWN
	slot10 = self._name_label
	params_customization_xp_value.w = self._name_label.w(RaidGUIControlExperiencePeerLoot.NAME_PADDING_DOWN)
	params_customization_xp_value.color = RaidGUIControlExperiencePeerLoot.XP_VALUE_COLOR
	params_customization_xp_value.font = RaidGUIControlExperiencePeerLoot.FONT
	params_customization_xp_value.font_size = RaidGUIControlExperiencePeerLoot.XP_VALUE_FONT_SIZE
	slot11 = params_customization_xp_value
	self._xp_value_label = self._object.text(RaidGUIControlExperiencePeerLoot.NAME_PADDING_DOWN, self._object)
	slot10 = self._xp_value_label
	local _, _, _, h = self._xp_value_label.text_rect(RaidGUIControlExperiencePeerLoot.NAME_PADDING_DOWN)
	slot15 = h

	self._xp_value_label.set_h(slot13, self._xp_value_label)

	return 
end
function RaidGUIControlExperiencePeerLoot:set_xp(xp)
	slot12 = true
	slot5 = "+" .. xp .. " " .. self.translate(slot9, self, "experience_points")

	self._xp_value_label.set_text(slot3, self._xp_value_label)

	slot4 = self

	self._layout_text(slot3)

	return 
end
function RaidGUIControlExperiencePeerLoot:set_player_name(name)
	slot4 = self._name_label
	slot7 = name

	self._name_label.set_text(slot3, utf8.to_upper(slot6))

	slot4 = self

	self._layout_text(slot3)

	return 
end
function RaidGUIControlExperiencePeerLoot:_layout_text()
	slot3 = self._name_label
	local _, _, _, h = self._name_label.text_rect(slot2)
	slot8 = h

	self._name_label.set_h(slot6, self._name_label)

	slot8 = RaidGUIControlExperiencePeerLoot.NAME_Y

	self._name_label.set_y(slot6, self._name_label)

	slot11 = self._name_label
	slot8 = self._name_label.y(slot9) + self._name_label.h(self._name_label) + RaidGUIControlExperiencePeerLoot.NAME_PADDING_DOWN

	self._xp_value_label.set_y(slot6, self._xp_value_label)

	return 
end

return 
