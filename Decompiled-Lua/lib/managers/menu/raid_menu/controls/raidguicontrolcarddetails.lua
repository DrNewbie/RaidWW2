if not RaidGUIControlCardDetails then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlCardDetails = slot0
RaidGUIControlCardDetails.DEFAULT_WIDTH = 400
RaidGUIControlCardDetails.DEFAULT_HEIGHT = 255
RaidGUIControlCardDetails.CARD_WIDTH = 150
RaidGUIControlCardDetails.SCREEN_STATE_STARTING_MISSION_SERVER = "starting_mission_server"
RaidGUIControlCardDetails.SCREEN_STATE_STARTING_MISSION_CLIENT = "starting_mission_client"
RaidGUIControlCardDetails.SCREEN_STATE_EMPTY = "empty"
RaidGUIControlCardDetails.TITLE_FONT = tweak_data.hud.large_font
RaidGUIControlCardDetails.TITLE_TEXT_SIZE = 28
RaidGUIControlCardDetails.MISC_TEXT_SIZE = 18
RaidGUIControlCardDetails.DESCRIPTION_TEXT_SIZE = 14
RaidGUIControlCardDetails.DESCRIPTION_RIGHT_TEXT_SIZE = 18
RaidGUIControlCardDetails.TITLE_RIGHT_PADDING_DOWN = 5
RaidGUIControlCardDetails.MODE_VIEW_ONLY = "mode_view_only"
RaidGUIControlCardDetails.MODE_SUGGESTING = "mode_suggesting"
RaidGUIControlCardDetails.BONUS_EFFECT_Y = 224
RaidGUIControlCardDetails.MALUS_EFFECT_Y = 320
RaidGUIControlCardDetails.EFFECT_DISTANCE = 16
RaidGUIControlCardDetails.FONT = tweak_data.gui.fonts.din_compressed
function RaidGUIControlCardDetails:init(parent, params)
	slot7 = params

	RaidGUIControlCardDetails.super.init(slot4, self, parent)

	if not params then
		slot6 = "[RaidGUIControlCardDetails:init] Parameters not specified for the card details"

		Application.error(slot4, Application)

		return 
	end

	self._pointer_type = "arrow"
	slot5 = self

	self.highlight_off(slot4)

	slot5 = self

	self._create_object(slot4)

	slot5 = self

	self._create_card_details(slot4)

	return 
end
function RaidGUIControlCardDetails:close()
	return 
end
function RaidGUIControlCardDetails:_create_object()
	slot3 = self._params
	local control_params = clone(slot2)
	control_params.w = control_params.w or RaidGUIControlCardDetails.DEFAULT_WIDTH
	control_params.h = control_params.h or RaidGUIControlCardDetails.DEFAULT_HEIGHT
	control_params.x = control_params.x or 0
	control_params.y = control_params.y or 0
	control_params.name = control_params.name .. "_card_panel"
	slot4 = self._panel
	control_params.layer = self._panel.layer("_card_panel") + 1
	slot5 = control_params
	self._object = self._panel.panel("_card_panel", self._panel)

	return 
end
function RaidGUIControlCardDetails:_create_card_details()
	local card_params = {
		name = "player_loot_card",
		x = self._params.card_x or 0,
		y = self._params.card_y or 64,
		item_w = self._params.card_w or 496,
		item_h = self._params.card_h or 671
	}
	slot6 = card_params
	self._card_control = self._object.create_custom_control(slot3, self._object, RaidGUIControlCardBase)
	slot4 = self._card_control
	local x_spacing = self._card_control.w(slot3) + 48
	local params_card_name_right = {
		name = "card_name_label_right",
		h = 64,
		wrap = true,
		w = 640,
		align = "left",
		vertical = "bottom",
		text = "",
		y = 16,
		x = x_spacing,
		color = tweak_data.gui.colors.white
	}
	slot6 = self._object
	params_card_name_right.layer = self._object.layer(RaidGUIControlCardBase) + 1
	params_card_name_right.font = tweak_data.gui.fonts.din_compressed
	params_card_name_right.font_size = tweak_data.gui.font_sizes.size_38
	slot7 = params_card_name_right
	self._card_name_label_right = self._object.label(RaidGUIControlCardBase, self._object)
	local params_card_description_right = {
		name = "card_description_label_right",
		h = 0,
		wrap = true,
		w = 0,
		visible = false,
		text = "",
		y = 0,
		x = 0,
		color = Color.white
	}
	slot7 = self._object
	params_card_description_right.layer = self._object.layer(self._object) + 1
	params_card_description_right.font = tweak_data.gui.fonts.lato
	params_card_description_right.font_size = RaidGUIControlLootCardDetails.DESCRIPTION_RIGHT_TEXT_SIZE
	self._card_description_label_right = self._object.label(self._object, self._object)
	local label_y = 160
	local icon_y = 96
	slot10 = {
		w = 160,
		name = "experience_bonus_count",
		h = 64,
		visible = false,
		align = "right",
		text = "",
		x = x_spacing + 224,
		y = icon_y,
		font = RaidGUIControlCardDetails.FONT,
		font_size = tweak_data.gui.font_sizes.title,
		color = tweak_data.gui.colors.raid_white
	}
	self._experience_bonus_count = self._object.label(params_card_description_right, self._object)
	slot10 = {
		w = 160,
		name = "experience_bonus_label",
		h = 32,
		visible = false,
		align = "right",
		x = x_spacing + 224,
		y = label_y,
		font = RaidGUIControlCardDetails.FONT,
		font_size = tweak_data.gui.font_sizes.medium,
		text = self.translate(slot12, self, "challenge_cards_label_experience"),
		color = tweak_data.gui.colors.raid_grey
	}
	slot15 = true
	self._experience_bonus_label = self._object.label(params_card_description_right, self._object)
	slot10 = {
		name = "type_icon",
		visible = false,
		x = x_spacing,
		y = icon_y,
		texture = tweak_data.challenge_cards.type_definition.card_type_raid.texture_path,
		texture_rect = tweak_data.challenge_cards.type_definition.card_type_raid.texture_rect
	}
	self._type_icon = self._object.image(params_card_description_right, self._object)
	slot10 = {
		w = 96,
		name = "type_label",
		h = 32,
		align = "center",
		text = "",
		x = x_spacing,
		y = label_y,
		font = RaidGUIControlCardDetails.FONT,
		font_size = tweak_data.gui.font_sizes.medium,
		color = tweak_data.gui.colors.raid_grey
	}
	self._type_label = self._object.label(params_card_description_right, self._object)
	slot10 = {
		name = "rarity_icon",
		visible = false,
		x = x_spacing + 128,
		y = icon_y,
		texture = tweak_data.challenge_cards.rarity_definition.loot_rarity_common.texture_path_icon,
		texture_rect = tweak_data.challenge_cards.rarity_definition.loot_rarity_common.texture_rect_icon
	}
	self._rarity_icon = self._object.image(params_card_description_right, self._object)
	slot10 = {
		w = 128,
		name = "rarity_label",
		h = 32,
		align = "center",
		text = "",
		x = x_spacing + 96,
		y = label_y,
		font = RaidGUIControlCardDetails.FONT,
		font_size = tweak_data.gui.font_sizes.medium,
		color = tweak_data.gui.colors.raid_grey
	}
	self._rarity_label = self._object.label(params_card_description_right, self._object)
	slot10 = {
		name = "bonus_effect_icon",
		h = 64,
		w = 64,
		visible = false,
		x = x_spacing,
		y = RaidGUIControlCardDetails.BONUS_EFFECT_Y,
		texture = tweak_data.gui.icons.ico_bonus.texture,
		texture_rect = tweak_data.gui.icons.ico_bonus.texture_rect
	}
	self._bonus_effect_icon = self._object.image(params_card_description_right, self._object)
	slot10 = {
		name = "malus_effect_icon",
		h = 64,
		w = 64,
		visible = false,
		x = x_spacing,
		y = RaidGUIControlCardDetails.MALUS_EFFECT_Y,
		texture = tweak_data.gui.icons.ico_malus.texture,
		texture_rect = tweak_data.gui.icons.ico_malus.texture_rect
	}
	self._malus_effect_icon = self._object.image(params_card_description_right, self._object)
	slot10 = {
		w = 288,
		name = "bonus_effect_label",
		h = 64,
		wrap = true,
		align = "left",
		vertical = "center",
		text = "",
		x = x_spacing + 80,
		y = RaidGUIControlCardDetails.BONUS_EFFECT_Y,
		font = tweak_data.gui.fonts.lato,
		font_size = tweak_data.gui.font_sizes.size_20,
		color = tweak_data.gui.colors.raid_grey
	}
	self._bonus_effect_label = self._object.label(params_card_description_right, self._object)
	slot10 = {
		w = 288,
		name = "malus_effect_label",
		h = 150,
		wrap = true,
		align = "left",
		vertical = "center",
		text = "",
		x = x_spacing + 80,
		y = RaidGUIControlCardDetails.MALUS_EFFECT_Y,
		font = tweak_data.gui.fonts.lato,
		font_size = tweak_data.gui.font_sizes.size_20,
		color = tweak_data.gui.colors.raid_grey
	}
	self._malus_effect_label = self._object.label(params_card_description_right, self._object)

	return 
end
function RaidGUIControlCardDetails:set_card(card_key_name, steam_instance_id)
	slot6 = card_key_name
	self._card = tweak_data.challenge_cards.get_card_by_key_name(slot4, tweak_data.challenge_cards)

	if self._card then
		local card_rarity = self._card.rarity
		local card_type = self._card.card_type
		local card_rarity_icon_texture = tweak_data.challenge_cards.rarity_definition[card_rarity].texture_path_icon
		local card_rarity_icon_texture_rect = tweak_data.challenge_cards.rarity_definition[card_rarity].texture_rect_icon

		if card_rarity_icon_texture and card_rarity_icon_texture_rect then
			slot10 = card_rarity_icon_texture

			self._rarity_icon.set_image(slot8, self._rarity_icon)

			slot10 = card_rarity_icon_texture_rect

			self._rarity_icon.set_texture_rect(slot8, self._rarity_icon)

			slot9 = self._rarity_icon

			self._rarity_icon.show(slot8)
		else
			slot9 = self._rarity_icon

			self._rarity_icon.hide(slot8)
		end

		local card_type_icon_texture = tweak_data.challenge_cards.type_definition[card_type].texture_path
		local card_type_icon_texture_rect = tweak_data.challenge_cards.type_definition[card_type].texture_rect

		if card_type_icon_texture and card_rarity_icon_texture_rect then
			slot12 = card_type_icon_texture

			self._type_icon.set_image(slot10, self._type_icon)

			slot12 = card_type_icon_texture_rect

			self._type_icon.set_texture_rect(slot10, self._type_icon)

			slot11 = self._type_icon

			self._type_icon.show(slot10)
		else
			slot11 = self._type_icon

			self._type_icon.hide(slot10)
		end

		self._card.steam_instance_id = steam_instance_id
		slot12 = self._card

		self._card_control.set_card(slot10, self._card_control)
		self._card_control.set_visible(slot10, self._card_control)

		local card_name = self._card.name
		local card_description = self._card.description
		slot13 = self._card_name_label_right
		slot18 = true

		self._card_name_label_right.set_text(true, self.translate(slot15, self, card_name))

		slot13 = self._card_name_label_right
		local _, _, w, h = self._card_name_label_right.text_rect(true)
		slot18 = h

		self._card_name_label_right.set_height(self, self._card_name_label_right)

		slot17 = self._card_description_label_right
		slot21 = card_description

		self._card_description_label_right.set_text(self, self.translate(slot19, self))

		slot20 = self._card_name_label_right
		slot18 = self._card_name_label_right.y(slot19) + h

		self._card_description_label_right.set_y(self, self._card_description_label_right)

		slot19 = true
		local xp_label_value = managers.challenge_cards.get_card_xp_label(self, managers.challenge_cards, card_key_name)

		if xp_label_value and xp_label_value ~= "" then
			slot19 = xp_label_value

			self._experience_bonus_count.set_text(slot17, self._experience_bonus_count)

			slot19 = true

			self._experience_bonus_count.set_visible(slot17, self._experience_bonus_count)

			slot19 = true

			self._experience_bonus_label.set_visible(slot17, self._experience_bonus_label)
		else
			slot19 = ""

			self._experience_bonus_count.set_text(slot17, self._experience_bonus_count)

			slot19 = false

			self._experience_bonus_count.set_visible(slot17, self._experience_bonus_count)

			slot19 = false

			self._experience_bonus_label.set_visible(slot17, self._experience_bonus_label)
		end

		slot18 = self._type_label
		slot23 = true

		self._type_label.set_text(slot17, self.translate(slot20, self, self._card.card_type))

		slot18 = self._rarity_label
		slot23 = true

		self._rarity_label.set_text(slot17, self.translate(slot20, self, self._card.rarity))

		slot19 = card_key_name
		local bonus_description, malus_description = managers.challenge_cards.get_card_description(slot17, managers.challenge_cards)

		if bonus_description and bonus_description ~= "" then
			slot20 = self._bonus_effect_icon

			self._bonus_effect_icon.show(slot19)

			slot21 = bonus_description

			self._bonus_effect_label.set_text(slot19, self._bonus_effect_label)

			slot20 = self._bonus_effect_label
			local _, _, _, h = self._bonus_effect_label.text_rect(slot19)
			slot25 = h

			self._bonus_effect_label.set_h(slot23, self._bonus_effect_label)
		else
			slot21 = ""

			self._bonus_effect_label.set_text(slot19, self._bonus_effect_label)

			slot20 = self._bonus_effect_icon

			self._bonus_effect_icon.hide(slot19)
		end

		if malus_description and malus_description ~= "" then
			slot20 = self._malus_effect_icon

			self._malus_effect_icon.show(slot19)

			slot21 = malus_description

			self._malus_effect_label.set_text(slot19, self._malus_effect_label)

			slot20 = self._malus_effect_label
			local _, _, _, h = self._malus_effect_label.text_rect(slot19)
			slot25 = h

			self._malus_effect_label.set_h(slot23, self._malus_effect_label)

			local malus_effect_y = self._bonus_effect_icon.y(slot23)
			slot25 = self._bonus_effect_icon

			if self._bonus_effect_icon.visible(self._bonus_effect_icon) then
				slot25 = self._bonus_effect_icon.bottom(slot26)
				slot28 = self._bonus_effect_label
				malus_effect_y = math.max(slot24, self._bonus_effect_label.bottom(self._bonus_effect_icon)) + RaidGUIControlCardDetails.EFFECT_DISTANCE
			end

			slot26 = malus_effect_y

			self._malus_effect_label.set_y(slot24, self._malus_effect_label)

			slot26 = malus_effect_y

			self._malus_effect_icon.set_y(slot24, self._malus_effect_icon)
		else
			slot21 = ""

			self._malus_effect_label.set_text(slot19, self._malus_effect_label)

			slot20 = self._malus_effect_icon

			self._malus_effect_icon.hide(slot19)
		end
	else
		slot6 = false

		self._card_control.set_visible(slot4, self._card_control)

		slot6 = ""

		self._card_name_label_right.set_text(slot4, self._card_name_label_right)

		slot6 = ""

		self._card_description_label_right.set_text(slot4, self._card_description_label_right)

		slot6 = false

		self._experience_bonus_count.set_visible(slot4, self._experience_bonus_count)

		slot6 = false

		self._experience_bonus_label.set_visible(slot4, self._experience_bonus_label)
	end

	return 
end
function RaidGUIControlCardDetails:set_mode_layout()
	slot3 = self._type_icon
	slot6 = self._type_label

	self._type_icon.set_center_x(slot2, self._type_label.center_x(slot5))

	return 
end
function RaidGUIControlCardDetails:get_card()
	return self._card, self._card.steam_instance_id
end
function RaidGUIControlCardDetails:set_control_mode(mode)
	self._mode = mode
	slot4 = self

	self.set_mode_layout(slot3)

	return 
end

return 
