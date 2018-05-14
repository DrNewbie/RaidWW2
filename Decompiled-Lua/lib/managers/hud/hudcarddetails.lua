HUDCardDetails = HUDCardDetails or class()
HUDCardDetails.CARD_H = 234
HUDCardDetails.BONUS_ICON = "ico_bonus"
HUDCardDetails.BONUS_Y = 256
HUDCardDetails.BONUS_H = 64
HUDCardDetails.MALUS_ICON = "ico_malus"
HUDCardDetails.MALUS_Y = 332
HUDCardDetails.MALUS_H = 64
HUDCardDetails.EFFECT_DISTANCE = 12
HUDCardDetails.TEXT_X = 75
HUDCardDetails.TEXT_FONT = tweak_data.gui.fonts.lato
HUDCardDetails.TEXT_FONT_SIZE = tweak_data.gui.font_sizes.size_20
HUDCardDetails.init = function (self, panel, params)
	self._params = params
	slot7 = params

	self._create_panel(slot4, self, panel)

	slot5 = self

	self._create_card(slot4)

	slot5 = self

	self._create_bonus(slot4)

	slot5 = self

	self._create_malus(slot4)

	return 
end
HUDCardDetails._create_panel = function (self, panel, params)
	local panel_params = {
		name = "card_details_panel",
		x = params.x or 0,
		y = params.y or 0
	}

	if not params.w then
		slot6 = panel
		slot4 = panel.w(slot5)
	end

	panel_params.w = slot4

	if not params.h then
		slot6 = panel
		slot4 = panel.h(slot5)
	end

	panel_params.h = slot4
	slot7 = panel_params
	self._object = panel.panel(slot5, panel)

	return 
end
HUDCardDetails._create_card = function (self)
	local card_panel_params = {
		visible = true,
		name = "card_panel",
		y = 0,
		is_root_panel = true,
		x = 0
	}
	slot4 = self._object
	card_panel_params.w = self._object.w(slot3)
	card_panel_params.h = HUDCardDetails.CARD_H
	slot6 = card_panel_params
	self._card_panel = RaidGUIPanel.new(slot3, RaidGUIPanel, self._object)
	local card_params = {
		name = "card",
		panel = self._card_panel,
		card_image_params = {
			w = self._params.card_image_params.w,
			h = self._params.card_image_params.h
		}
	}
	slot7 = card_params
	self._card = self._card_panel.create_custom_control(self._params.card_image_params.h, self._card_panel, RaidGUIControlCardBase)

	return 
end
HUDCardDetails._create_bonus = function (self)
	local bonus_panel_params = {
		name = "bonus_panel",
		x = 0,
		y = HUDCardDetails.BONUS_Y
	}
	slot4 = self._object
	bonus_panel_params.w = self._object.w(slot3)
	bonus_panel_params.h = HUDCardDetails.BONUS_H
	slot5 = bonus_panel_params
	self._bonus_panel = self._object.panel(slot3, self._object)
	local bonus_icon_params = {
		name = "bonus_icon",
		valign = "top",
		texture = tweak_data.gui.icons[HUDCardDetails.BONUS_ICON].texture,
		texture_rect = tweak_data.gui.icons[HUDCardDetails.BONUS_ICON].texture_rect
	}
	slot6 = bonus_icon_params
	self._bonus_icon = self._bonus_panel.bitmap(HUDCardDetails.BONUS_ICON, self._bonus_panel)
	local bonus_text_params = {
		name = "bonus_text",
		wrap = true,
		align = "left",
		vertical = "top",
		text = "",
		y = 4,
		valign = "scale",
		x = HUDCardDetails.TEXT_X
	}
	slot6 = self._bonus_panel
	bonus_text_params.w = self._bonus_panel.w(self._bonus_panel) - HUDCardDetails.TEXT_X
	slot6 = self._bonus_panel
	bonus_text_params.h = self._bonus_panel.h(HUDCardDetails.TEXT_X) - 4
	slot8 = HUDCardDetails.TEXT_FONT_SIZE
	bonus_text_params.font = tweak_data.gui.get_font_path(HUDCardDetails.TEXT_X, tweak_data.gui, HUDCardDetails.TEXT_FONT)
	bonus_text_params.font_size = HUDCardDetails.TEXT_FONT_SIZE
	slot7 = bonus_text_params
	self._bonus_text = self._bonus_panel.text(HUDCardDetails.TEXT_X, self._bonus_panel)

	return 
end
HUDCardDetails._create_malus = function (self)
	local malus_panel_params = {
		name = "malus_panel",
		x = 0,
		y = HUDCardDetails.MALUS_Y
	}
	slot4 = self._object
	malus_panel_params.w = self._object.w(slot3)
	malus_panel_params.h = HUDCardDetails.MALUS_H
	slot5 = malus_panel_params
	self._malus_panel = self._object.panel(slot3, self._object)
	local malus_icon_params = {
		name = "malus_icon",
		valign = "top",
		texture = tweak_data.gui.icons[HUDCardDetails.MALUS_ICON].texture,
		texture_rect = tweak_data.gui.icons[HUDCardDetails.MALUS_ICON].texture_rect
	}
	slot6 = malus_icon_params
	self._malus_icon = self._malus_panel.bitmap(HUDCardDetails.MALUS_ICON, self._malus_panel)
	local malus_text_params = {
		name = "malus_text",
		wrap = true,
		align = "left",
		vertical = "top",
		text = "",
		y = 4,
		valign = "scale",
		x = HUDCardDetails.TEXT_X
	}
	slot6 = self._malus_panel
	malus_text_params.w = self._malus_panel.w(self._malus_panel) - HUDCardDetails.TEXT_X
	slot6 = self._malus_panel
	malus_text_params.h = self._malus_panel.h(HUDCardDetails.TEXT_X) - 4
	slot8 = HUDCardDetails.TEXT_FONT_SIZE
	malus_text_params.font = tweak_data.gui.get_font_path(HUDCardDetails.TEXT_X, tweak_data.gui, HUDCardDetails.TEXT_FONT)
	malus_text_params.font_size = HUDCardDetails.TEXT_FONT_SIZE
	slot7 = malus_text_params
	self._malus_text = self._malus_panel.text(HUDCardDetails.TEXT_X, self._malus_panel)

	return 
end
HUDCardDetails.set_card = function (self, card)
	slot5 = card

	self._card.set_card(slot3, self._card)

	if card and card.effects then
		local bonus_description, malus_description = managers.challenge_cards.get_card_description(slot3, managers.challenge_cards)
		slot7 = bonus_description

		self._bonus_text.set_text(card.key_name, self._bonus_text)

		slot7 = malus_description

		self._malus_text.set_text(card.key_name, self._malus_text)

		local effect_y = HUDCardDetails.BONUS_Y

		if bonus_description == "" then
			slot7 = self._bonus_icon

			self._bonus_icon.hide(slot6)
		else
			slot7 = self._bonus_icon

			self._bonus_icon.show(slot6)

			slot7 = self._bonus_text
			local _, _, _, h = self._bonus_text.text_rect(slot6)
			slot12 = h

			self._bonus_text.set_h(slot10, self._bonus_text)

			slot12 = effect_y

			self._bonus_panel.set_y(slot10, self._bonus_panel)

			slot11 = self._bonus_panel
			slot14 = self._bonus_text.h(slot15)
			slot17 = self._bonus_icon

			self._bonus_panel.set_h(slot10, math.max(slot13, self._bonus_icon.h(self._bonus_text)))

			slot11 = self._bonus_panel
			effect_y = effect_y + self._bonus_panel.h(slot10) + HUDCardDetails.EFFECT_DISTANCE
		end

		if malus_description == "" then
			slot7 = self._malus_icon

			self._malus_icon.hide(slot6)
		else
			slot7 = self._malus_icon

			self._malus_icon.show(slot6)

			slot7 = self._malus_text
			local _, _, _, h = self._malus_text.text_rect(slot6)
			slot12 = h

			self._malus_text.set_h(slot10, self._malus_text)

			slot12 = effect_y

			self._malus_panel.set_y(slot10, self._malus_panel)

			slot11 = self._malus_panel
			slot14 = self._malus_text.h(slot15)
			slot17 = self._malus_icon

			self._malus_panel.set_h(slot10, math.max(slot13, self._malus_icon.h(self._malus_text)))
		end
	end

	return 
end

return 
