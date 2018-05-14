if not RaidGUIControlGoldBarPeerLoot then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlGoldBarPeerLoot = slot0
RaidGUIControlGoldBarPeerLoot.WIDTH = 544
RaidGUIControlGoldBarPeerLoot.HEIGHT = 96
RaidGUIControlGoldBarPeerLoot.REWARD_ICON_SINGLE = "rwd_gold_bar"
RaidGUIControlGoldBarPeerLoot.REWARD_ICON_FEW = "rwd_gold_bars"
RaidGUIControlGoldBarPeerLoot.REWARD_ICON_MANY = "rwd_gold_crate"
RaidGUIControlGoldBarPeerLoot.FONT = tweak_data.gui.fonts.din_compressed
RaidGUIControlGoldBarPeerLoot.NAME_Y = 12
RaidGUIControlGoldBarPeerLoot.NAME_COLOR = tweak_data.gui.colors.raid_dirty_white
RaidGUIControlGoldBarPeerLoot.NAME_PADDING_DOWN = 2
RaidGUIControlGoldBarPeerLoot.NAME_FONT_SIZE = tweak_data.gui.font_sizes.size_32
RaidGUIControlGoldBarPeerLoot.DESCRIPTION_COLOR = tweak_data.gui.colors.raid_grey_effects
RaidGUIControlGoldBarPeerLoot.DESCRIPTION_FONT_SIZE = tweak_data.gui.font_sizes.size_24
RaidGUIControlGoldBarPeerLoot.IMAGE_PADDING_RIGHT = 10
RaidGUIControlGoldBarPeerLoot.TEXT_X = 128
function RaidGUIControlGoldBarPeerLoot:init(parent, params)
	slot7 = params

	RaidGUIControlGoldBarPeerLoot.super.init(slot4, self, parent)

	if not params then
		slot6 = "[RaidGUIControlGoldBarPeerLoot:init] Parameters not specified for the melee weapon peer drop details"

		Application.error(slot4, Application)

		return 
	end

	slot5 = self

	self._create_control_panel(slot4)

	slot5 = self

	self._create_gold_bar_details(slot4)

	return 
end
function RaidGUIControlGoldBarPeerLoot:_create_control_panel()
	slot3 = self._params
	local control_params = clone(slot2)
	control_params.x = control_params.x
	control_params.w = control_params.w or RaidGUIControlGoldBarPeerLoot.WIDTH
	control_params.h = control_params.h or RaidGUIControlGoldBarPeerLoot.HEIGHT
	control_params.name = control_params.name .. "_melee_weapon_peer_panel"
	slot4 = self._panel
	control_params.layer = self._panel.layer("_melee_weapon_peer_panel") + 1
	slot5 = control_params
	self._control_panel = self._panel.panel("_melee_weapon_peer_panel", self._panel)
	self._object = self._control_panel

	return 
end
function RaidGUIControlGoldBarPeerLoot:_create_gold_bar_details()
	local params_gold_bar_image = {
		name = "melee_weapon_image",
		y = 0,
		x = 0,
		texture = tweak_data.gui.icons[RaidGUIControlGoldBarPeerLoot.REWARD_ICON_SINGLE].texture,
		texture_rect = tweak_data.gui.icons[RaidGUIControlGoldBarPeerLoot.REWARD_ICON_SINGLE].texture_rect
	}
	slot5 = params_gold_bar_image
	self._gold_bar_image = self._object.bitmap(RaidGUIControlGoldBarPeerLoot.REWARD_ICON_SINGLE, self._object)
	local params_player_name = {
		name = "peer_name_label",
		align = "left",
		text = "",
		layer = 1,
		x = RaidGUIControlGoldBarPeerLoot.TEXT_X,
		y = RaidGUIControlGoldBarPeerLoot.NAME_Y
	}
	slot5 = self._object
	params_player_name.w = self._object.w(self._object) - RaidGUIControlGoldBarPeerLoot.TEXT_X
	params_player_name.color = RaidGUIControlGoldBarPeerLoot.NAME_COLOR
	params_player_name.font = RaidGUIControlGoldBarPeerLoot.FONT
	params_player_name.font_size = RaidGUIControlGoldBarPeerLoot.NAME_FONT_SIZE
	slot6 = params_player_name
	self._name_label = self._object.text(RaidGUIControlGoldBarPeerLoot.TEXT_X, self._object)
	slot5 = self._name_label
	local _, _, _, h = self._name_label.text_rect(RaidGUIControlGoldBarPeerLoot.TEXT_X)
	slot10 = h

	self._name_label.set_h(slot8, self._name_label)

	local params_gold_bar_description = {
		name = "melee_weapon_description_label",
		align = "left",
		layer = 1
	}
	slot12 = true
	params_gold_bar_description.text = self.translate(self._name_label, self, "gold_bars")
	slot10 = self._name_label
	params_gold_bar_description.x = self._name_label.x(self._name_label)
	slot11 = self._name_label
	params_gold_bar_description.y = self._name_label.y(self._name_label) + self._name_label.h(self._name_label) + RaidGUIControlGoldBarPeerLoot.NAME_PADDING_DOWN
	slot10 = self._name_label
	params_gold_bar_description.w = self._name_label.w(RaidGUIControlGoldBarPeerLoot.NAME_PADDING_DOWN)
	params_gold_bar_description.color = RaidGUIControlGoldBarPeerLoot.DESCRIPTION_COLOR
	params_gold_bar_description.font = RaidGUIControlGoldBarPeerLoot.FONT
	params_gold_bar_description.font_size = RaidGUIControlGoldBarPeerLoot.DESCRIPTION_FONT_SIZE
	slot11 = params_gold_bar_description
	self._gold_bars_value_label = self._object.text(RaidGUIControlGoldBarPeerLoot.NAME_PADDING_DOWN, self._object)
	slot10 = self._gold_bars_value_label
	local _, _, _, h = self._gold_bars_value_label.text_rect(RaidGUIControlGoldBarPeerLoot.NAME_PADDING_DOWN)
	slot15 = h

	self._gold_bars_value_label.set_h(slot13, self._gold_bars_value_label)

	return 
end
function RaidGUIControlGoldBarPeerLoot:set_player_name(name)
	slot4 = self._name_label
	slot7 = name

	self._name_label.set_text(slot3, utf8.to_upper(slot6))

	slot4 = self

	self._layout_text(slot3)

	return 
end
function RaidGUIControlGoldBarPeerLoot:_layout_text()
	slot3 = self._name_label
	local _, _, _, h = self._name_label.text_rect(slot2)
	slot8 = h

	self._name_label.set_h(slot6, self._name_label)

	slot8 = RaidGUIControlGoldBarPeerLoot.NAME_Y

	self._name_label.set_y(slot6, self._name_label)

	slot11 = self._name_label
	slot8 = self._name_label.y(slot9) + self._name_label.h(self._name_label) + RaidGUIControlGoldBarPeerLoot.NAME_PADDING_DOWN

	self._gold_bars_value_label.set_y(slot6, self._gold_bars_value_label)

	return 
end
function RaidGUIControlGoldBarPeerLoot:set_gold_bar_reward(amount)
	slot11 = true
	slot5 = (amount or 0) .. " " .. self.translate(slot8, self, "menu_loot_screen_gold_bars")

	self._gold_bars_value_label.set_text(slot3, self._gold_bars_value_label)

	return 
end
function RaidGUIControlGoldBarPeerLoot:set_gold_bar_reward(amount)
	local text = ""

	if amount == 1 then
		slot7 = true
		text = self.translate(slot4, self, "menu_loot_screen_gold_bars_single")
	else
		slot9 = true
		text = (amount or 0) .. " " .. self.translate(slot6, self, "menu_loot_screen_gold_bars")
	end

	slot6 = text

	self._gold_bars_value_label.set_text(slot4, self._gold_bars_value_label)

	local icon = RaidGUIControlGoldBarPeerLoot.REWARD_ICON_SINGLE

	if amount and RaidGUIControlGoldBarRewardDetails.REWARD_QUANTITY_MANY <= amount then
		icon = RaidGUIControlGoldBarPeerLoot.REWARD_ICON_MANY
	elseif amount and RaidGUIControlGoldBarRewardDetails.REWARD_QUANTITY_FEW <= amount then
		icon = RaidGUIControlGoldBarPeerLoot.REWARD_ICON_FEW
	end

	slot7 = tweak_data.gui.icons[icon].texture

	self._gold_bar_image.set_image(slot5, self._gold_bar_image)

	slot6 = self._gold_bar_image
	slot9 = tweak_data.gui.icons[icon].texture_rect

	self._gold_bar_image.set_texture_rect(slot5, unpack(slot8))

	return 
end

return 
