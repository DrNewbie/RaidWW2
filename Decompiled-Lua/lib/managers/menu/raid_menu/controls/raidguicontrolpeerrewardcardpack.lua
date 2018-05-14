if not RaidGUIControlPeerRewardCardPack then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlPeerRewardCardPack = slot0
RaidGUIControlPeerRewardCardPack.WIDTH = 544
RaidGUIControlPeerRewardCardPack.HEIGHT = 96
RaidGUIControlPeerRewardCardPack.ICON = "rwd_card_pack"
RaidGUIControlPeerRewardCardPack.DESCRIPTION = "menu_loot_screen_card_pack"
RaidGUIControlPeerRewardCardPack.FONT = tweak_data.gui.fonts.din_compressed
RaidGUIControlPeerRewardCardPack.NAME_Y = 12
RaidGUIControlPeerRewardCardPack.NAME_COLOR = tweak_data.gui.colors.raid_dirty_white
RaidGUIControlPeerRewardCardPack.NAME_PADDING_DOWN = 2
RaidGUIControlPeerRewardCardPack.NAME_FONT_SIZE = tweak_data.gui.font_sizes.size_32
RaidGUIControlPeerRewardCardPack.DESCRIPTION_COLOR = tweak_data.gui.colors.raid_grey_effects
RaidGUIControlPeerRewardCardPack.DESCRIPTION_FONT_SIZE = tweak_data.gui.font_sizes.size_24
RaidGUIControlPeerRewardCardPack.IMAGE_PADDING_RIGHT = 10
RaidGUIControlPeerRewardCardPack.TEXT_X = 128
function RaidGUIControlPeerRewardCardPack:init(parent, params)
	slot7 = params

	RaidGUIControlPeerRewardCardPack.super.init(slot4, self, parent)

	if not params then
		slot6 = "[RaidGUIControlPeerRewardCardPack:init] Parameters not specified for the weapon point peer drop details"

		Application.error(slot4, Application)

		return 
	end

	slot5 = self

	self._create_control_panel(slot4)

	slot5 = self

	self._create_card_pack_details(slot4)

	return 
end
function RaidGUIControlPeerRewardCardPack:_create_control_panel()
	slot3 = self._params
	local control_params = clone(slot2)
	control_params.x = control_params.x
	control_params.w = control_params.w or RaidGUIControlPeerRewardCardPack.WIDTH
	control_params.h = control_params.h or RaidGUIControlPeerRewardCardPack.HEIGHT
	control_params.name = control_params.name .. "_card_pack_peer_panel"
	slot4 = self._panel
	control_params.layer = self._panel.layer("_card_pack_peer_panel") + 1
	slot5 = control_params
	self._control_panel = self._panel.panel("_card_pack_peer_panel", self._panel)
	self._object = self._control_panel

	return 
end
function RaidGUIControlPeerRewardCardPack:_create_card_pack_details()
	local params_weapon_point_image = {
		name = "card_pack_image",
		y = 0,
		x = 0,
		texture = tweak_data.gui.icons[RaidGUIControlPeerRewardCardPack.ICON].texture,
		texture_rect = tweak_data.gui.icons[RaidGUIControlPeerRewardCardPack.ICON].texture_rect
	}
	slot5 = params_weapon_point_image
	self._weapon_point_image = self._object.bitmap(RaidGUIControlPeerRewardCardPack.ICON, self._object)
	local params_player_name = {
		name = "peer_card_pack_name_label",
		align = "left",
		text = "",
		layer = 1,
		x = RaidGUIControlPeerRewardCardPack.TEXT_X,
		y = RaidGUIControlPeerRewardCardPack.NAME_Y
	}
	slot5 = self._object
	params_player_name.w = self._object.w(self._object) - RaidGUIControlPeerRewardCardPack.TEXT_X
	params_player_name.color = RaidGUIControlPeerRewardCardPack.NAME_COLOR
	params_player_name.font = RaidGUIControlPeerRewardCardPack.FONT
	params_player_name.font_size = RaidGUIControlPeerRewardCardPack.NAME_FONT_SIZE
	slot6 = params_player_name
	self._name_label = self._object.text(RaidGUIControlPeerRewardCardPack.TEXT_X, self._object)
	slot5 = self._name_label
	local _, _, _, h = self._name_label.text_rect(RaidGUIControlPeerRewardCardPack.TEXT_X)
	slot10 = h

	self._name_label.set_h(slot8, self._name_label)

	local params_card_pack_description = {
		name = "card_pack_description_label",
		align = "left",
		layer = 1
	}
	slot12 = true
	params_card_pack_description.text = self.translate(self._name_label, self, RaidGUIControlPeerRewardCardPack.DESCRIPTION)
	slot10 = self._name_label
	params_card_pack_description.x = self._name_label.x(self._name_label)
	slot11 = self._name_label
	params_card_pack_description.y = self._name_label.y(self._name_label) + self._name_label.h(self._name_label) + RaidGUIControlPeerRewardCardPack.NAME_PADDING_DOWN
	slot10 = self._name_label
	params_card_pack_description.w = self._name_label.w(RaidGUIControlPeerRewardCardPack.NAME_PADDING_DOWN)
	params_card_pack_description.color = RaidGUIControlPeerRewardCardPack.DESCRIPTION_COLOR
	params_card_pack_description.font = RaidGUIControlPeerRewardCardPack.FONT
	params_card_pack_description.font_size = RaidGUIControlPeerRewardCardPack.DESCRIPTION_FONT_SIZE
	slot11 = params_card_pack_description
	self._card_pack_description_label = self._object.text(RaidGUIControlPeerRewardCardPack.NAME_PADDING_DOWN, self._object)
	slot10 = self._card_pack_description_label
	local _, _, _, h = self._card_pack_description_label.text_rect(RaidGUIControlPeerRewardCardPack.NAME_PADDING_DOWN)
	slot15 = h

	self._card_pack_description_label.set_h(slot13, self._card_pack_description_label)

	return 
end
function RaidGUIControlPeerRewardCardPack:set_player_name(name)
	slot4 = self._name_label
	slot7 = name

	self._name_label.set_text(slot3, utf8.to_upper(slot6))

	slot4 = self

	self._layout_text(slot3)

	return 
end
function RaidGUIControlPeerRewardCardPack:_layout_text()
	slot3 = self._name_label
	local _, _, _, h = self._name_label.text_rect(slot2)
	slot8 = h

	self._name_label.set_h(slot6, self._name_label)

	slot8 = RaidGUIControlPeerRewardCardPack.NAME_Y

	self._name_label.set_y(slot6, self._name_label)

	slot11 = self._name_label
	slot8 = self._name_label.y(slot9) + self._name_label.h(self._name_label) + RaidGUIControlPeerRewardCardPack.NAME_PADDING_DOWN

	self._card_pack_description_label.set_y(slot6, self._card_pack_description_label)

	return 
end

return 
