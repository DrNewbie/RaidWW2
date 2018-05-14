if not RaidGUIControlCardBase then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlCardBase = slot0
RaidGUIControlCardBase.TITLE_FONT = tweak_data.gui.fonts.din_compressed
RaidGUIControlCardBase.TITLE_TEXT_SIZE = 20
RaidGUIControlCardBase.TITLE_PADDING = 0.08
RaidGUIControlCardBase.TITLE_Y = 0.86
RaidGUIControlCardBase.TITLE_CENTER_Y = 0.92
RaidGUIControlCardBase.TITLE_H = 0.11
RaidGUIControlCardBase.DESCRIPTION_Y = 0.6494
RaidGUIControlCardBase.DESCRIPTION_H = 0.15
RaidGUIControlCardBase.DESCRIPTION_TEXT_SIZE = 14
RaidGUIControlCardBase.XP_BONUS_X = 0.03
RaidGUIControlCardBase.XP_BONUS_Y = 0.015
RaidGUIControlCardBase.XP_BONUS_W = 0.3394
RaidGUIControlCardBase.XP_BONUS_H = 0.09
RaidGUIControlCardBase.XP_BONUS_FONT = tweak_data.gui.fonts.din_compressed
RaidGUIControlCardBase.XP_BONUS_FONT_SIZE = tweak_data.gui.font_sizes.size_46
RaidGUIControlCardBase.XP_BONUS_LABEL_FONT_SIZE = RaidGUIControlCardBase.XP_BONUS_FONT_SIZE * 0.5
RaidGUIControlCardBase.ICON_H = 0.0853
RaidGUIControlCardBase.ICON_RIGHT_PADDING = 0.0627
RaidGUIControlCardBase.ICON_DOWN_PADDING = 0.0482
RaidGUIControlCardBase.ICON_LEFT_PADDING = 0.085
RaidGUIControlCardBase.ICON_TOP_PADDING = 0.045
RaidGUIControlCardBase.ICON_DISTANCE = 0
function RaidGUIControlCardBase:init(parent, params, item_data, grid_params)
	slot9 = params

	RaidGUIControlCardBase.super.init(slot6, self, parent)

	self._card_panel = nil
	local card = "ra_on_the_scrounge"
	self._grid_params = grid_params
	self._item_data = item_data

	if params.panel then
		self._card_panel = params.panel
	else
		slot9 = card
		local card_rarity = tweak_data.challenge_cards.get_card_by_key_name(slot7, tweak_data.challenge_cards).rarity
		local card_rect = tweak_data.challenge_cards.rarity_definition[card_rarity].texture_rect
		local params_card_panel = {
			halign = "center",
			name = "card_panel",
			valign = "center",
			x = params.x or 0,
			y = params.y or 0
		}

		if not params.item_h then
			slot11 = self._panel
			slot9 = self._panel.h(slot10)
		end

		params_card_panel.h = slot9

		if not params.item_w then
			slot11 = self._panel
			slot9 = self._panel.h(slot10) * card_rect[3] / card_rect[4]
		end

		params_card_panel.w = slot9
		slot12 = params_card_panel
		self._card_panel = self._panel.panel(slot10, self._panel)
	end

	self._object = self._card_panel
	slot9 = card
	local card_data = tweak_data.challenge_cards.get_card_by_key_name(slot7, tweak_data.challenge_cards)
	local card_rarity = card_data.rarity
	local card_texture = tweak_data.challenge_cards.challenge_card_texture_path .. "cc_raid_common_on_the_scrounge_hud"
	local card_texture_rect = tweak_data.challenge_cards.challenge_card_texture_rect
	local card_rect = {}

	if self._params.card_image_params and self._params.card_image_params.x then
		card_rect.x = self._params.card_image_params.x
	end

	if self._params.card_image_params and self._params.card_image_params.y then
		card_rect.y = self._params.card_image_params.y
	end

	if self._params.card_image_params and self._params.card_image_params.w then
		card_rect.w = self._params.card_image_params.w
	end

	if self._params.card_image_params and self._params.card_image_params.h then
		card_rect.h = self._params.card_image_params.h
	end

	local params_card_image = {
		name = "card_image",
		layer = 100,
		x = card_rect.x or 0,
		y = card_rect.y or 0
	}

	if not card_rect.w then
		slot14 = self._card_panel
		slot12 = self._card_panel.w(slot13)
	end

	params_card_image.w = slot12

	if not card_rect.h then
		slot14 = self._card_panel
		slot12 = self._card_panel.h(slot13)
	end

	params_card_image.h = slot12
	params_card_image.texture = card_texture
	params_card_image.texture_rect = card_texture_rect
	slot15 = params_card_image
	self._card_image = self._card_panel.bitmap(slot13, self._card_panel)
	local title_h = self._card_image.h(slot13) * RaidGUIControlCardBase.TITLE_H
	slot18 = self._card_image
	slot15 = RaidGUIControlCardBase.TITLE_TEXT_SIZE * self._card_image.h(slot17) / 255
	local title_font_size = math.ceil(self._card_image)
	local params_card_title = {
		name = "card_title",
		wrap = true,
		align = "center",
		vertical = "center",
		blend_mode = "normal"
	}
	slot17 = self._card_image
	params_card_title.w = self._card_image.w(self._card_image.h(slot17) / 255) * (1 - 2 * RaidGUIControlCardBase.TITLE_PADDING)
	params_card_title.h = title_h
	params_card_title.x = self._card_image.x(1 - 2 * RaidGUIControlCardBase.TITLE_PADDING) + self._card_image.w(self._card_image) * RaidGUIControlCardBase.TITLE_PADDING
	params_card_title.font = RaidGUIControlCardBase.TITLE_FONT
	params_card_title.font_size = title_font_size
	slot20 = card
	slot17 = tweak_data.challenge_cards.get_card_by_key_name(self._card_image, tweak_data.challenge_cards).name
	params_card_title.text = utf8.to_upper(self._card_image.w(self._card_image) * RaidGUIControlCardBase.TITLE_PADDING)
	slot17 = self._card_image
	params_card_title.layer = self._card_image.layer(self._card_image.w(self._card_image) * RaidGUIControlCardBase.TITLE_PADDING) + 10
	params_card_title.color = Color.white
	slot18 = params_card_title
	self._card_title = self._card_panel.label(self._card_image.w(self._card_image) * RaidGUIControlCardBase.TITLE_PADDING, self._card_panel)
	slot21 = self._card_image
	slot18 = self._card_image.y(tweak_data.challenge_cards) + self._card_image.h(self._card_image) * RaidGUIControlCardBase.TITLE_CENTER_Y

	self._card_title.set_center_y(self._card_image.w(self._card_image) * RaidGUIControlCardBase.TITLE_PADDING, self._card_title)

	slot17 = self._card_title
	local _, _, w, h = self._card_title.text_rect(self._card_image.w(self._card_image) * RaidGUIControlCardBase.TITLE_PADDING)

	if title_h < h then
		slot22 = title_font_size

		self._refit_card_title_text(slot20, self)
	end

	local params_card_description = {
		w = 0,
		name = "card_description",
		h = 0,
		wrap = true,
		align = "left",
		visible = false,
		y = 0,
		x = 0,
		font = RaidGUIControlCardBase.TITLE_FONT
	}
	slot22 = RaidGUIControlCardBase.DESCRIPTION_TEXT_SIZE * self._card_image.h(slot24) / 255
	params_card_description.font_size = math.ceil(slot21)
	slot22 = self._card_image
	params_card_description.layer = self._card_image.layer(slot21) + 1
	params_card_description.color = Color.black
	slot23 = card
	params_card_description.text = tweak_data.challenge_cards.get_card_by_key_name(slot21, tweak_data.challenge_cards).description
	slot23 = params_card_description
	self._card_description = self._card_panel.label(slot21, self._card_panel)
	local params_xp_bonus = {
		name = "xp_bonus",
		vertical = "center",
		align = "center",
		x = 0
	}
	slot24 = self._card_image
	params_xp_bonus.y = self._card_image.y(self._card_panel) + self._card_image.h(self._card_image) * RaidGUIControlCardBase.XP_BONUS_Y
	slot23 = self._card_image
	params_xp_bonus.w = self._card_image.w(self._card_image.h(self._card_image) * RaidGUIControlCardBase.XP_BONUS_Y) * RaidGUIControlCardBase.XP_BONUS_W
	slot23 = self._card_image
	params_xp_bonus.h = self._card_image.h(RaidGUIControlCardBase.XP_BONUS_W) * RaidGUIControlCardBase.XP_BONUS_H
	params_xp_bonus.font = RaidGUIControlCardBase.XP_BONUS_FONT
	slot26 = self._card_image
	slot23 = RaidGUIControlCardBase.XP_BONUS_FONT_SIZE * self._card_image.h(self._card_image) * 0.0015
	params_xp_bonus.font_size = math.ceil(RaidGUIControlCardBase.XP_BONUS_H)
	slot24 = card
	params_xp_bonus.text = tweak_data.challenge_cards.get_card_by_key_name(RaidGUIControlCardBase.XP_BONUS_H, tweak_data.challenge_cards).bonus_xp
	params_xp_bonus.color = tweak_data.gui.colors.raid_white
	slot23 = self._card_image
	params_xp_bonus.layer = self._card_image.layer(RaidGUIControlCardBase.XP_BONUS_H) + 1
	self._xp_bonus = self._card_panel.label(RaidGUIControlCardBase.XP_BONUS_H, self._card_panel)
	local card_rarity_icon_texture = tweak_data.challenge_cards.rarity_definition[card_rarity].texture_path_icon
	local card_rarity_icon_texture_rect = tweak_data.challenge_cards.rarity_definition[card_rarity].texture_rect_icon
	slot25 = self._card_image
	local card_rarity_h = self._card_image.h(params_xp_bonus) * RaidGUIControlCardBase.ICON_H
	local card_rarity_w = card_rarity_h * card_rarity_icon_texture_rect[3] / card_rarity_icon_texture_rect[4]
	local params_card_rarity = {
		name = "card_rarity_icon",
		w = card_rarity_w,
		h = card_rarity_h
	}
	slot29 = self._card_image
	params_card_rarity.x = self._card_image.w(slot27) - card_rarity_w - self._card_image.w(self._card_image) * RaidGUIControlCardBase.ICON_LEFT_PADDING
	slot28 = self._card_image
	params_card_rarity.y = self._card_image.h(self._card_image.w(self._card_image) * RaidGUIControlCardBase.ICON_LEFT_PADDING) * RaidGUIControlCardBase.ICON_TOP_PADDING
	params_card_rarity.texture = card_rarity_icon_texture
	params_card_rarity.texture_rect = card_rarity_icon_texture_rect
	slot28 = self._card_image
	params_card_rarity.layer = self._card_image.layer(RaidGUIControlCardBase.ICON_TOP_PADDING) + 1
	slot29 = params_card_rarity
	self._card_rarity_icon = self._card_panel.image(RaidGUIControlCardBase.ICON_TOP_PADDING, self._card_panel)
	slot29 = card
	local card_type = tweak_data.challenge_cards.get_card_by_key_name(RaidGUIControlCardBase.ICON_TOP_PADDING, tweak_data.challenge_cards).card_type
	local card_type_icon_texture = tweak_data.challenge_cards.type_definition[card_type].texture_path
	local card_type_icon_texture_rect = tweak_data.challenge_cards.type_definition[card_type].texture_rect
	local card_type_h = card_rarity_h
	local card_type_w = card_type_h * card_type_icon_texture_rect[3] / card_type_icon_texture_rect[4]
	local params_card_type = {
		name = "card_type_icon",
		w = card_type_w,
		h = card_type_h
	}
	slot34 = self._card_image
	params_card_type.x = self._card_image.w(slot33) * RaidGUIControlCardBase.ICON_LEFT_PADDING
	slot34 = self._card_image
	params_card_type.y = self._card_image.h(RaidGUIControlCardBase.ICON_LEFT_PADDING) * RaidGUIControlCardBase.ICON_TOP_PADDING
	params_card_type.texture = card_type_icon_texture
	params_card_type.texture_rect = card_type_icon_texture_rect
	slot34 = self._card_image
	params_card_type.layer = self._card_image.layer(RaidGUIControlCardBase.ICON_TOP_PADDING) + 1
	slot35 = params_card_type
	self._card_type_icon = self._card_panel.image(RaidGUIControlCardBase.ICON_TOP_PADDING, self._card_panel)

	if self._params and self._params.item_clicked_callback then
		self._on_click_callback = self._params.item_clicked_callback
	end

	if self._params and self._params.item_selected_callback then
		self._on_selected_callback = self._params.item_selected_callback
	end

	local image_size_multiplier = self._card_image.w(slot33) / tweak_data.challenge_cards.challenge_card_texture_rect[3]
	slot36 = {
		visible = false,
		x = self._card_image.x(slot38),
		y = self._card_image.y(slot38),
		layer = self._card_image.layer(slot38) - 1,
		w = self._card_image.w(slot38),
		h = self._card_image.h(slot38),
		texture = tweak_data.challenge_cards.challenge_card_stackable_2_texture_path,
		texture_rect = tweak_data.challenge_cards.challenge_card_stackable_2_texture_rect
	}
	slot39 = self._card_image
	slot39 = self._card_image
	slot39 = self._card_image
	slot39 = self._card_image
	slot39 = self._card_image
	self._card_stackable_image = self._object.bitmap(self._card_image, self._object)
	slot36 = {
		name = "card_amount_background",
		visible = false,
		layer = self._card_image.layer(slot38) + 1,
		x = self._card_image.w(slot38) * 0.145,
		y = self._card_image.h(slot38) * 0.84,
		w = tweak_data.gui.icons.card_counter_bg_large.texture_rect[3] * image_size_multiplier,
		h = tweak_data.gui.icons.card_counter_bg_large.texture_rect[4] * image_size_multiplier,
		texture = tweak_data.gui.icons.card_counter_bg_large.texture,
		texture_rect = tweak_data.gui.icons.card_counter_bg_large.texture_rect
	}
	slot39 = self._card_image
	slot39 = self._card_image
	slot39 = self._card_image
	self._card_amount_background = self._card_panel.image(self._card_image, self._card_panel)
	slot36 = {
		name = "card_amount_label",
		vertical = "center",
		visible = false,
		align = "center",
		text = "",
		layer = self._card_amount_background.layer(slot38) + 1,
		w = self._card_amount_background.w(slot38),
		h = self._card_amount_background.h(slot38),
		x = self._card_amount_background.x(slot38),
		y = self._card_amount_background.y(slot38)
	}
	slot39 = self._card_amount_background
	slot39 = self._card_amount_background
	slot39 = self._card_amount_background
	slot39 = self._card_amount_background
	slot39 = self._card_amount_background
	self._card_amount_label = self._card_panel.label(self._card_image, self._card_panel)

	if self._params and self._params.show_amount then
		slot35 = self._card_amount_background

		self._card_amount_background.show(slot34)

		slot35 = self._card_amount_label

		self._card_amount_label.show(slot34)
	end

	slot36 = false

	self._card_panel.set_visible(slot34, self._card_panel)

	return 
end
function RaidGUIControlCardBase:_refit_card_title_text(original_font_size)
	local font_sizes = {}
	slot5 = tweak_data.gui.font_sizes

	for index, size in pairs(slot4) do
		if size < original_font_size then
			slot11 = size

			table.insert(slot9, font_sizes)
		end
	end

	slot5 = font_sizes

	table.sort(slot4)

	for i = #font_sizes, 1, -1 do
		slot10 = font_sizes[i]

		self._card_title.set_font_size(slot8, self._card_title)

		slot9 = self._card_title
		local _, _, w, h = self._card_title.text_rect(slot8)
		slot13 = self._card_title

		if h <= self._card_title.h(slot12) then
			slot13 = self._card_title

			if w <= self._card_title.w(slot12) then
				break
			end
		end
	end

	return 
end
function RaidGUIControlCardBase:get_data()
	return self._item_data
end
function RaidGUIControlCardBase:set_card(card_data)
	self._item_data = card_data

	if self._item_data then
		local card_rarity = self._item_data.rarity
		local rarity_definition = tweak_data.challenge_cards.rarity_definition[card_rarity]
		local card_type = self._item_data.card_type
		local type_definition = tweak_data.challenge_cards.type_definition[card_type]
		local empty_slot_texture = tweak_data.gui.icons.cc_empty_slot_small
		local card_texture = empty_slot_texture.texture
		local card_texture_rect = empty_slot_texture.texture_rect

		if not self._item_data.title_in_texture then
			slot11 = self._card_title
			slot16 = true

			self._card_title.set_text(slot10, self.translate(slot13, self, self._item_data.name))

			slot14 = self._card_image
			local title_font_size = math.ceil(slot10)
			slot13 = title_font_size

			self._card_title.set_font_size(RaidGUIControlCardBase.TITLE_TEXT_SIZE * self._card_image.h(slot13) / 255, self._card_title)

			slot12 = self._card_title
			local _, _, w, h = self._card_title.text_rect(RaidGUIControlCardBase.TITLE_TEXT_SIZE * self._card_image.h(slot13) / 255)
			slot16 = self._card_title

			if self._card_title.h(self._item_data.name) < h then
				slot17 = title_font_size

				self._refit_card_title_text(slot15, self)
			end

			slot16 = self._card_title

			self._card_title.show(slot15)
		else
			slot12 = ""

			self._card_title.set_text(slot10, self._card_title)

			slot11 = self._card_title

			self._card_title.hide(slot10)
		end

		if rarity_definition.color then
		end

		slot11 = self._card_description

		self._card_description.set_text(slot10, self.translate(slot13, self))

		slot11 = self._card_description

		self._card_description.hide(slot10)

		slot12 = self._item_data.key_name
		local bonus_xp_reward = managers.challenge_cards.get_card_xp_label(slot10, managers.challenge_cards)
		slot13 = bonus_xp_reward

		self._xp_bonus.set_text(managers.challenge_cards, self._xp_bonus)

		slot12 = self._xp_bonus
		local x1, y1, w1, h1 = self._xp_bonus.text_rect(managers.challenge_cards)
		slot17 = w1

		self._xp_bonus.set_w(self._item_data.description, self._xp_bonus)

		slot17 = h1

		self._xp_bonus.set_h(self._item_data.description, self._xp_bonus)

		slot19 = self._card_image
		slot17 = self._card_image.w(slot18) / 2

		self._xp_bonus.set_center_x(self._item_data.description, self._xp_bonus)

		if self._item_data.card_category == ChallengeCardsTweakData.CARD_CATEGORY_BOOSTER then
			slot17 = false

			self._xp_bonus.set_visible(slot15, self._xp_bonus)
		else
			slot17 = true

			self._xp_bonus.set_visible(slot15, self._xp_bonus)
		end

		if rarity_definition.color then
		end

		if self._item_data.key_name ~= ChallengeCardsManager.CARD_PASS_KEY_NAME then
			card_texture = tweak_data.challenge_cards.challenge_card_texture_path .. card_data.texture
			card_texture_rect = tweak_data.challenge_cards.challenge_card_texture_rect
			slot16 = self._card_rarity_icon

			self._card_rarity_icon.show(card_data.texture)

			slot17 = rarity_definition.texture_path_icon

			self._card_rarity_icon.set_image(card_data.texture, self._card_rarity_icon)

			slot17 = rarity_definition.texture_rect_icon

			self._card_rarity_icon.set_texture_rect(card_data.texture, self._card_rarity_icon)

			slot16 = self._card_type_icon

			self._card_type_icon.show(card_data.texture)

			slot17 = type_definition.texture_path

			self._card_type_icon.set_image(card_data.texture, self._card_type_icon)

			slot17 = type_definition.texture_rect

			self._card_type_icon.set_texture_rect(card_data.texture, self._card_type_icon)
		else
			slot16 = self._card_rarity_icon

			self._card_rarity_icon.hide(slot15)

			slot16 = self._card_type_icon

			self._card_type_icon.hide(slot15)

			slot16 = self._card_title

			self._card_title.hide(slot15)
		end

		slot17 = card_texture

		self._card_image.set_image(slot15, self._card_image)

		slot16 = self._card_image
		slot19 = card_texture_rect

		self._card_image.set_texture_rect(slot15, unpack(slot18))

		slot16 = self._card_image

		self._card_image.show(slot15)

		if self._item_data.steam_instance_ids and 1 < #self._item_data.steam_instance_ids then
			slot17 = #self._item_data.steam_instance_ids

			self._card_amount_label.set_text(slot15, self._card_amount_label)

			slot16 = self._card_amount_label

			self._card_amount_label.show(slot15)

			slot16 = self._card_amount_background

			self._card_amount_background.show(slot15)

			slot17 = self._item_data
			local stacking_texture, stacking_texture_rect = managers.challenge_cards.get_cards_stacking_texture(slot15, managers.challenge_cards)

			if stacking_texture and stacking_texture_rect then
				slot19 = stacking_texture
				slot22 = stacking_texture_rect

				self._card_stackable_image.set_image(slot17, self._card_stackable_image, unpack(slot21))

				slot19 = true

				self._card_stackable_image.set_visible(slot17, self._card_stackable_image)
			end
		else
			slot17 = ""

			self._card_amount_label.set_text(slot15, self._card_amount_label)

			slot16 = self._card_amount_label

			self._card_amount_label.hide(slot15)

			slot16 = self._card_amount_background

			self._card_amount_background.hide(slot15)
		end

		slot17 = true

		self._card_panel.set_visible(slot15, self._card_panel)
	end

	return 
end
function RaidGUIControlCardBase:set_card_image(texture, texture_rect)
	slot6 = "[RaidGUIControlCardBase:set_card_image]"

	Application.trace(slot4, Application)

	slot6 = texture

	self._card_image.set_image(slot4, self._card_image)

	slot6 = texture_rect

	self._card_image.set_texture_rect(slot4, self._card_image)

	return 
end
function RaidGUIControlCardBase:set_title(title)
	slot5 = title

	self._card_title.set_text(slot3, self._card_title)

	return 
end
function RaidGUIControlCardBase:set_description(description)
	slot5 = description

	self._card_description.set_text(slot3, self._card_description)

	return 
end
function RaidGUIControlCardBase:set_xp_bonus(xp_bonus)
	slot5 = xp_bonus

	self._xp_bonus.set_text(slot3, self._xp_bonus)

	return 
end
function RaidGUIControlCardBase:set_color(color)
	slot5 = color

	self._card_title.set_color(slot3, self._card_title)

	slot5 = color

	self._xp_bonus.set_color(slot3, self._xp_bonus)

	return 
end
function RaidGUIControlCardBase:set_title_visible(flag)
	slot5 = flag

	self._card_title.set_visible(slot3, self._card_title)

	return 
end
function RaidGUIControlCardBase:set_description_visible(flag)
	slot5 = flag

	self._card_description.set_visible(slot3, self._card_description)

	return 
end
function RaidGUIControlCardBase:set_xp_bonus_visible(flag)
	slot5 = flag

	self._xp_bonus.set_visible(slot3, self._xp_bonus)

	return 
end
function RaidGUIControlCardBase:set_rarity_icon_visible(flag)
	slot5 = flag

	self._card_type_icon.set_visible(slot3, self._card_type_icon)

	return 
end
function RaidGUIControlCardBase:set_type_icon_visible(flag)
	slot5 = flag

	self._card_rarity_icon.set_visible(slot3, self._card_rarity_icon)

	return 
end
function RaidGUIControlCardBase:set_visible(flag)
	slot5 = flag

	self._card_image.set_visible(slot3, self._card_image)

	slot5 = flag

	self.set_title_visible(slot3, self)

	slot5 = flag

	self.set_rarity_icon_visible(slot3, self)

	slot5 = flag

	self.set_type_icon_visible(slot3, self)

	return 
end
function RaidGUIControlCardBase:show_card_only()
	slot4 = true

	self._card_image.set_visible(slot2, self._card_image)

	slot4 = false

	self.set_title_visible(slot2, self)

	slot4 = false

	self.set_xp_bonus_visible(slot2, self)

	slot4 = false

	self.set_rarity_icon_visible(slot2, self)

	slot4 = false

	self.set_type_icon_visible(slot2, self)

	return 
end
function RaidGUIControlCardBase:mouse_released(o, button, x, y)
	slot10 = y

	self.on_mouse_released(slot6, self, button, x)

	return true
end
function RaidGUIControlCardBase:on_mouse_released(button, x, y)
	if self._on_click_callback then
		slot8 = self._item_data

		self._on_click_callback(slot5, button, self)
	end

	return 
end
function RaidGUIControlCardBase:selected()
	return self._selected
end
function RaidGUIControlCardBase:select()
	self._selected = true

	return 
end
function RaidGUIControlCardBase:unselect()
	self._selected = false

	return 
end
function RaidGUIControlCardBase:w()
	slot3 = self._card_image

	return self._card_image.w(slot2)
end
function RaidGUIControlCardBase:h()
	slot3 = self._card_image

	return self._card_image.h(slot2)
end
function RaidGUIControlCardBase:left()
	slot3 = self._card_image

	return self._card_image.x(slot2)
end
function RaidGUIControlCardBase:right()
	slot4 = self

	return self.left(slot2) + self.w(self)
end
function RaidGUIControlCardBase:set_center_x(x)
	slot5 = x

	self._object.set_center_x(slot3, self._object)

	return 
end

return 
