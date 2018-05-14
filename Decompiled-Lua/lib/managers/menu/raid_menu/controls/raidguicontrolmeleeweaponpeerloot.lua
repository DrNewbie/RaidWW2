if not RaidGUIControlMeleeWeaponPeerLoot then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlMeleeWeaponPeerLoot = slot0
RaidGUIControlMeleeWeaponPeerLoot.WIDTH = 544
RaidGUIControlMeleeWeaponPeerLoot.HEIGHT = 96
RaidGUIControlMeleeWeaponPeerLoot.ICON = "rwd_melee"
RaidGUIControlMeleeWeaponPeerLoot.FONT = tweak_data.gui.fonts.din_compressed
RaidGUIControlMeleeWeaponPeerLoot.NAME_Y = 12
RaidGUIControlMeleeWeaponPeerLoot.NAME_COLOR = tweak_data.gui.colors.raid_dirty_white
RaidGUIControlMeleeWeaponPeerLoot.NAME_PADDING_DOWN = 2
RaidGUIControlMeleeWeaponPeerLoot.NAME_FONT_SIZE = tweak_data.gui.font_sizes.size_32
RaidGUIControlMeleeWeaponPeerLoot.DESCRIPTION_COLOR = tweak_data.gui.colors.raid_grey_effects
RaidGUIControlMeleeWeaponPeerLoot.DESCRIPTION_FONT_SIZE = tweak_data.gui.font_sizes.size_24
RaidGUIControlMeleeWeaponPeerLoot.IMAGE_PADDING_RIGHT = 10
RaidGUIControlMeleeWeaponPeerLoot.TEXT_X = 128
function RaidGUIControlMeleeWeaponPeerLoot:init(parent, params)
	slot7 = params

	RaidGUIControlMeleeWeaponPeerLoot.super.init(slot4, self, parent)

	if not params then
		slot6 = "[RaidGUIControlMeleeWeaponPeerLoot:init] Parameters not specified for the melee weapon peer drop details"

		Application.error(slot4, Application)

		return 
	end

	slot5 = self

	self._create_control_panel(slot4)

	slot5 = self

	self._create_weapon_point_details(slot4)

	return 
end
function RaidGUIControlMeleeWeaponPeerLoot:_create_control_panel()
	slot3 = self._params
	local control_params = clone(slot2)
	control_params.x = control_params.x
	control_params.w = control_params.w or RaidGUIControlMeleeWeaponPeerLoot.WIDTH
	control_params.h = control_params.h or RaidGUIControlMeleeWeaponPeerLoot.HEIGHT
	control_params.name = control_params.name .. "_melee_weapon_peer_panel"
	slot4 = self._panel
	control_params.layer = self._panel.layer("_melee_weapon_peer_panel") + 1
	slot5 = control_params
	self._control_panel = self._panel.panel("_melee_weapon_peer_panel", self._panel)
	self._object = self._control_panel

	return 
end
function RaidGUIControlMeleeWeaponPeerLoot:_create_weapon_point_details()
	local params_weapon_point_image = {
		name = "melee_weapon_image",
		y = 0,
		x = 0,
		texture = tweak_data.gui.icons[RaidGUIControlMeleeWeaponPeerLoot.ICON].texture,
		texture_rect = tweak_data.gui.icons[RaidGUIControlMeleeWeaponPeerLoot.ICON].texture_rect
	}
	slot5 = params_weapon_point_image
	self._weapon_point_image = self._object.bitmap(RaidGUIControlMeleeWeaponPeerLoot.ICON, self._object)
	local params_player_name = {
		name = "peer_melee_weapon_name_label",
		align = "left",
		text = "",
		layer = 1,
		x = RaidGUIControlMeleeWeaponPeerLoot.TEXT_X,
		y = RaidGUIControlMeleeWeaponPeerLoot.NAME_Y
	}
	slot5 = self._object
	params_player_name.w = self._object.w(self._object) - RaidGUIControlMeleeWeaponPeerLoot.TEXT_X
	params_player_name.color = RaidGUIControlMeleeWeaponPeerLoot.NAME_COLOR
	params_player_name.font = RaidGUIControlMeleeWeaponPeerLoot.FONT
	params_player_name.font_size = RaidGUIControlMeleeWeaponPeerLoot.NAME_FONT_SIZE
	slot6 = params_player_name
	self._name_label = self._object.text(RaidGUIControlMeleeWeaponPeerLoot.TEXT_X, self._object)
	slot5 = self._name_label
	local _, _, _, h = self._name_label.text_rect(RaidGUIControlMeleeWeaponPeerLoot.TEXT_X)
	slot10 = h

	self._name_label.set_h(slot8, self._name_label)

	local params_weapon_point_description = {
		name = "melee_weapon_description_label",
		align = "left",
		layer = 1
	}
	slot12 = true
	params_weapon_point_description.text = self.translate(self._name_label, self, "melee_weapon")
	slot10 = self._name_label
	params_weapon_point_description.x = self._name_label.x(self._name_label)
	slot11 = self._name_label
	params_weapon_point_description.y = self._name_label.y(self._name_label) + self._name_label.h(self._name_label) + RaidGUIControlMeleeWeaponPeerLoot.NAME_PADDING_DOWN
	slot10 = self._name_label
	params_weapon_point_description.w = self._name_label.w(RaidGUIControlMeleeWeaponPeerLoot.NAME_PADDING_DOWN)
	params_weapon_point_description.color = RaidGUIControlMeleeWeaponPeerLoot.DESCRIPTION_COLOR
	params_weapon_point_description.font = RaidGUIControlMeleeWeaponPeerLoot.FONT
	params_weapon_point_description.font_size = RaidGUIControlMeleeWeaponPeerLoot.DESCRIPTION_FONT_SIZE
	slot11 = params_weapon_point_description
	self._xp_value_label = self._object.text(RaidGUIControlMeleeWeaponPeerLoot.NAME_PADDING_DOWN, self._object)
	slot10 = self._xp_value_label
	local _, _, _, h = self._xp_value_label.text_rect(RaidGUIControlMeleeWeaponPeerLoot.NAME_PADDING_DOWN)
	slot15 = h

	self._xp_value_label.set_h(slot13, self._xp_value_label)

	return 
end
function RaidGUIControlMeleeWeaponPeerLoot:set_player_name(name)
	slot4 = self._name_label
	slot7 = name

	self._name_label.set_text(slot3, utf8.to_upper(slot6))

	slot4 = self

	self._layout_text(slot3)

	return 
end
function RaidGUIControlMeleeWeaponPeerLoot:_layout_text()
	slot3 = self._name_label
	local _, _, _, h = self._name_label.text_rect(slot2)
	slot8 = h

	self._name_label.set_h(slot6, self._name_label)

	slot8 = RaidGUIControlMeleeWeaponPeerLoot.NAME_Y

	self._name_label.set_y(slot6, self._name_label)

	slot11 = self._name_label
	slot8 = self._name_label.y(slot9) + self._name_label.h(self._name_label) + RaidGUIControlMeleeWeaponPeerLoot.NAME_PADDING_DOWN

	self._xp_value_label.set_y(slot6, self._xp_value_label)

	return 
end
function RaidGUIControlMeleeWeaponPeerLoot:set_melee_weapon(weapon_id)
	local weapon_name = ""
	local tweak_data = tweak_data.blackmarket.melee_weapons[weapon_id]

	if tweak_data then
		slot8 = true
		weapon_name = self.translate(slot5, self, tweak_data.name_id)
	end

	slot7 = weapon_name

	self._xp_value_label.set_text(slot5, self._xp_value_label)

	return 
end

return 
