if not RaidGUIControlWeaponPointPeerLoot then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlWeaponPointPeerLoot = slot0
RaidGUIControlWeaponPointPeerLoot.WIDTH = 544
RaidGUIControlWeaponPointPeerLoot.HEIGHT = 96
RaidGUIControlWeaponPointPeerLoot.ICON = "rwd_weapon"
RaidGUIControlWeaponPointPeerLoot.FONT = tweak_data.gui.fonts.din_compressed
RaidGUIControlWeaponPointPeerLoot.NAME_Y = 9
RaidGUIControlWeaponPointPeerLoot.NAME_COLOR = tweak_data.gui.colors.raid_white
RaidGUIControlWeaponPointPeerLoot.NAME_PADDING_DOWN = 5
RaidGUIControlWeaponPointPeerLoot.NAME_FONT_SIZE = tweak_data.gui.font_sizes.size_38
RaidGUIControlWeaponPointPeerLoot.DESCRIPTION_COLOR = tweak_data.gui.colors.raid_grey
RaidGUIControlWeaponPointPeerLoot.DESCRIPTION_FONT_SIZE = tweak_data.gui.font_sizes.small
RaidGUIControlWeaponPointPeerLoot.IMAGE_PADDING_RIGHT = 10
RaidGUIControlWeaponPointPeerLoot.TEXT_X = 128
function RaidGUIControlWeaponPointPeerLoot:init(parent, params)
	slot7 = params

	RaidGUIControlWeaponPointPeerLoot.super.init(slot4, self, parent)

	if not params then
		slot6 = "[RaidGUIControlWeaponPointPeerLoot:init] Parameters not specified for the weapon point peer drop details"

		Application.error(slot4, Application)

		return 
	end

	slot5 = self

	self._create_control_panel(slot4)

	slot5 = self

	self._create_weapon_point_details(slot4)

	return 
end
function RaidGUIControlWeaponPointPeerLoot:_create_control_panel()
	slot3 = self._params
	local control_params = clone(slot2)
	control_params.x = control_params.x
	control_params.w = control_params.w or RaidGUIControlWeaponPointPeerLoot.WIDTH
	control_params.h = control_params.h or RaidGUIControlWeaponPointPeerLoot.HEIGHT
	control_params.name = control_params.name .. "_weapon_point_peer_panel"
	slot4 = self._panel
	control_params.layer = self._panel.layer("_weapon_point_peer_panel") + 1
	slot5 = control_params
	self._control_panel = self._panel.panel("_weapon_point_peer_panel", self._panel)
	self._object = self._control_panel

	return 
end
function RaidGUIControlWeaponPointPeerLoot:_create_weapon_point_details()
	local params_weapon_point_image = {
		name = "weapon_point_image",
		y = 0,
		x = 0,
		texture = tweak_data.gui.icons[RaidGUIControlWeaponPointPeerLoot.ICON].texture,
		texture_rect = tweak_data.gui.icons[RaidGUIControlWeaponPointPeerLoot.ICON].texture_rect
	}
	slot5 = params_weapon_point_image
	self._weapon_point_image = self._object.bitmap(RaidGUIControlWeaponPointPeerLoot.ICON, self._object)
	local params_player_name = {
		name = "peer_weapon_point_name_label",
		align = "left",
		text = "",
		layer = 1,
		x = RaidGUIControlWeaponPointPeerLoot.TEXT_X,
		y = RaidGUIControlWeaponPointPeerLoot.NAME_Y
	}
	slot5 = self._object
	params_player_name.w = self._object.w(self._object) - RaidGUIControlWeaponPointPeerLoot.TEXT_X
	params_player_name.color = RaidGUIControlWeaponPointPeerLoot.NAME_COLOR
	params_player_name.font = RaidGUIControlWeaponPointPeerLoot.FONT
	params_player_name.font_size = RaidGUIControlWeaponPointPeerLoot.NAME_FONT_SIZE
	slot6 = params_player_name
	self._name_label = self._object.text(RaidGUIControlWeaponPointPeerLoot.TEXT_X, self._object)
	slot5 = self._name_label
	local _, _, _, h = self._name_label.text_rect(RaidGUIControlWeaponPointPeerLoot.TEXT_X)
	slot10 = h

	self._name_label.set_h(slot8, self._name_label)

	local params_weapon_point_description = {
		name = "weapon_point_description_label",
		align = "left",
		layer = 1
	}
	slot12 = true
	params_weapon_point_description.text = self.translate(self._name_label, self, "weapon_point")
	slot10 = self._name_label
	params_weapon_point_description.x = self._name_label.x(self._name_label)
	slot11 = self._name_label
	params_weapon_point_description.y = self._name_label.y(self._name_label) + self._name_label.h(self._name_label) + RaidGUIControlWeaponPointPeerLoot.NAME_PADDING_DOWN
	slot10 = self._name_label
	params_weapon_point_description.w = self._name_label.w(RaidGUIControlWeaponPointPeerLoot.NAME_PADDING_DOWN)
	params_weapon_point_description.color = RaidGUIControlWeaponPointPeerLoot.DESCRIPTION_COLOR
	params_weapon_point_description.font = RaidGUIControlWeaponPointPeerLoot.FONT
	params_weapon_point_description.font_size = RaidGUIControlWeaponPointPeerLoot.DESCRIPTION_FONT_SIZE
	slot11 = params_weapon_point_description
	self._xp_value_label = self._object.text(RaidGUIControlWeaponPointPeerLoot.NAME_PADDING_DOWN, self._object)
	slot10 = self._xp_value_label
	local _, _, _, h = self._xp_value_label.text_rect(RaidGUIControlWeaponPointPeerLoot.NAME_PADDING_DOWN)
	slot15 = h

	self._xp_value_label.set_h(slot13, self._xp_value_label)

	return 
end
function RaidGUIControlWeaponPointPeerLoot:set_player_name(name)
	slot4 = self._name_label
	slot7 = name

	self._name_label.set_text(slot3, utf8.to_upper(slot6))

	slot4 = self

	self._layout_text(slot3)

	return 
end
function RaidGUIControlWeaponPointPeerLoot:_layout_text()
	slot3 = self._name_label
	local _, _, _, h = self._name_label.text_rect(slot2)
	slot8 = h

	self._name_label.set_h(slot6, self._name_label)

	slot8 = RaidGUIControlWeaponPointPeerLoot.NAME_Y

	self._name_label.set_y(slot6, self._name_label)

	slot11 = self._name_label
	slot8 = self._name_label.y(slot9) + self._name_label.h(self._name_label) + RaidGUIControlWeaponPointPeerLoot.NAME_PADDING_DOWN

	self._xp_value_label.set_y(slot6, self._xp_value_label)

	return 
end

return 
