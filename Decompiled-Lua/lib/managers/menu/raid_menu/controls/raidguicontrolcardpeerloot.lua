if not RaidGUIControlCardPeerLoot then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlCardPeerLoot = slot0
RaidGUIControlCardPeerLoot.WIDTH = 98
RaidGUIControlCardPeerLoot.HEIGHT = 166
RaidGUIControlCardPeerLoot.IMAGE_PADDING_DOWN = 5
RaidGUIControlCardPeerLoot.CARD_TITLE_PADDING_PERCENT = 7
RaidGUIControlCardPeerLoot.TEXT_H = 40
RaidGUIControlCardPeerLoot.TEXT_FONT = tweak_data.hud.large_font
RaidGUIControlCardPeerLoot.FONT_SIZE = 18
function RaidGUIControlCardPeerLoot:init(parent, params)
	slot7 = params

	RaidGUIControlCardPeerLoot.super.init(slot4, self, parent)

	if not params then
		slot6 = "[RaidGUIControlCardPeerLoot:init] Parameters not specified for the card details"

		Application.error(slot4, Application)

		return 
	end

	self._pointer_type = "arrow"
	slot5 = self

	self.highlight_off(slot4)

	slot5 = self

	self._create_control_panel(slot4)

	slot5 = self

	self._create_card_details(slot4)

	return 
end
function RaidGUIControlCardPeerLoot:close()
	return 
end
function RaidGUIControlCardPeerLoot:_create_control_panel()
	slot3 = self._params
	local control_params = clone(slot2)
	control_params.x = control_params.x
	control_params.w = control_params.w or RaidGUIControlCardPeerLoot.WIDTH
	control_params.h = control_params.h or RaidGUIControlCardPeerLoot.HEIGHT
	control_params.name = control_params.name .. "_card_panel"
	slot4 = self._panel
	control_params.layer = self._panel.layer("_card_panel") + 1
	slot5 = control_params
	self._control_panel = self._panel.panel("_card_panel", self._panel)
	self._object = self._control_panel

	return 
end
function RaidGUIControlCardPeerLoot:_create_card_details()
	local params_card_image = {
		texture = "ui/main_menu/textures/cards_atlas",
		name = "card_image",
		y = 0,
		x = 0
	}
	slot4 = self._control_panel
	params_card_image.w = self._control_panel.w(slot3)
	slot4 = self._control_panel
	params_card_image.h = self._control_panel.w(slot3) * 1.45
	params_card_image.texture_rect = {
		56,
		669,
		144,
		209
	}
	slot5 = params_card_image
	self._card_image = self._control_panel.bitmap(slot3, self._control_panel)
	local params_player_name = {
		name = "peer_player_name_label",
		align = "center",
		text = "PLAYER 1",
		x = 0,
		layer = 1
	}
	slot6 = self._card_image
	params_player_name.y = self._card_image.y(self._control_panel) + self._card_image.h(self._card_image) + RaidGUIControlCardPeerLoot.IMAGE_PADDING_DOWN
	slot5 = self._control_panel
	params_player_name.w = self._control_panel.w(RaidGUIControlCardPeerLoot.IMAGE_PADDING_DOWN)
	params_player_name.h = RaidGUIControlCardPeerLoot.TEXT_H
	params_player_name.color = tweak_data.menu.raid_red
	params_player_name.font = RaidGUIControlCardPeerLoot.TEXT_FONT
	params_player_name.font_size = RaidGUIControlCardPeerLoot.FONT_SIZE
	slot6 = params_player_name
	self._name_label = self._control_panel.label(RaidGUIControlCardPeerLoot.IMAGE_PADDING_DOWN, self._control_panel)
	local params_card_title = {
		name = "card_title_label",
		wrap = true,
		align = "right",
		text = "22xp",
		layer = 1
	}
	slot6 = self._card_image
	params_card_title.x = (self._card_image.w(self._control_panel) * RaidGUIControlCardPeerLoot.CARD_TITLE_PADDING_PERCENT) / 100
	slot7 = self._card_image
	params_card_title.y = (self._card_image.y(RaidGUIControlCardPeerLoot.CARD_TITLE_PADDING_PERCENT) + self._card_image.h(self._card_image) / 2) - RaidGUIControlCardPeerLoot.TEXT_H / 2
	slot6 = self._card_image
	params_card_title.w = self._card_image.w(RaidGUIControlCardPeerLoot.TEXT_H / 2) * (1 - (2 * RaidGUIControlCardPeerLoot.CARD_TITLE_PADDING_PERCENT) / 100)
	params_card_title.h = RaidGUIControlCardPeerLoot.TEXT_H
	params_card_title.color = Color.white
	params_card_title.font = tweak_data.menu.pd2_small_font
	params_card_title.font_size = tweak_data.menu.pd2_small_font_size
	slot7 = params_card_title
	self._card_title_label = self._control_panel.label(1 - (2 * RaidGUIControlCardPeerLoot.CARD_TITLE_PADDING_PERCENT) / 100, self._control_panel)

	return 
end
function RaidGUIControlCardPeerLoot:set_debug(value)
	slot5 = value

	self._control_panel.set_debug(slot3, self._control_panel)

	return 
end
function RaidGUIControlCardPeerLoot:set_card(card)
	self._card = card
	slot4 = self._card_title_label
	slot9 = true

	self._card_title_label.set_text(slot3, self.translate(slot6, self, card.name))

	slot4 = self._card_title_label
	slot7 = card.name

	self._card_title_label.set_text(slot3, utf8.to_upper(slot6))
	self._card_title_label.set_color(slot3, self._card_title_label)

	local card_texture = tweak_data.challenge_cards.rarity_definition[card.rarity].texture_path_thumb
	local card_texture_rect = tweak_data.challenge_cards.rarity_definition[card.rarity].texture_rect_thumb
	slot7 = card_texture

	self._card_image.set_image(tweak_data.challenge_cards.rarity_definition[card.rarity].color, self._card_image)

	slot6 = self._card_image
	slot9 = card_texture_rect

	self._card_image.set_texture_rect(tweak_data.challenge_cards.rarity_definition[card.rarity].color, unpack(card.name))

	return 
end
function RaidGUIControlCardPeerLoot:get_card()
	return self._card
end
function RaidGUIControlCardPeerLoot:set_player_name(name)
	slot5 = name

	self._name_label.set_text(slot3, self._name_label)

	return 
end

return 
