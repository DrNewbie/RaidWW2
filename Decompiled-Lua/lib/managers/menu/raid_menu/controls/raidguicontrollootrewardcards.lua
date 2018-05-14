if not RaidGUIControlLootRewardCards then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlLootRewardCards = slot0
RaidGUIControlLootRewardCards.CARD_COUNT = 3
RaidGUIControlLootRewardCards.INITIAL_CARD_Y = 150
RaidGUIControlLootRewardCards.FONT = tweak_data.gui.fonts.din_compressed
RaidGUIControlLootRewardCards.TITLE_DESCRIPTION_Y = 609
RaidGUIControlLootRewardCards.TITLE_DESCRIPTION_H = 50
RaidGUIControlLootRewardCards.TITLE_DESCRIPTION_FONT_SIZE = tweak_data.gui.font_sizes.size_32
RaidGUIControlLootRewardCards.TITLE_DESCRIPTION_COLOR = tweak_data.gui.colors.raid_white
RaidGUIControlLootRewardCards.TITLE_PADDING_TOP = -14
RaidGUIControlLootRewardCards.TITLE_FONT_SIZE = tweak_data.gui.font_sizes.size_76
RaidGUIControlLootRewardCards.TITLE_COLOR = tweak_data.gui.colors.raid_red
RaidGUIControlLootRewardCards.CARD_DETAILS_Y = 533
function RaidGUIControlLootRewardCards:init(parent, params)
	slot7 = params

	RaidGUIControlLootRewardCards.super.init(slot4, self, parent)

	RaidGUIControlLootRewardCards.control = self
	self._item_params = self._params.item_params
	self._items = {}
	slot5 = self

	self.layout(slot4)

	return 
end
function RaidGUIControlLootRewardCards:layout()
	slot4 = {
		name = "loot_rewards_cards_panel",
		x = self._params.x,
		y = self._params.y,
		w = self._params.w,
		h = self._params.h
	}
	self._object = self._panel.panel(slot2, self._panel)

	if self._params.loot_list then
		slot3 = self

		self._create_items(slot2)
	end

	slot3 = self

	self._create_title(slot2)

	slot3 = self

	self._create_card_details(slot2)

	return 
end
function RaidGUIControlLootRewardCards:_create_items()
	local horizontal_spacing = 0

	if 1 < RaidGUIControlLootRewardCards.CARD_COUNT then
		slot6 = self._object
		slot4 = (self._object.w(slot5) - RaidGUIControlLootRewardCards.CARD_COUNT * self._item_params.item_w) / (RaidGUIControlLootRewardCards.CARD_COUNT - 1)
		horizontal_spacing = math.floor(slot3)
	end

	horizontal_spacing = 0

	for i = 1, RaidGUIControlLootRewardCards.CARD_COUNT, 1 do
		local item_params = {
			x = (self._item_params.item_w + horizontal_spacing) * (i - 1),
			y = RaidGUIControlLootRewardCards.INITIAL_CARD_Y,
			item_w = self._item_params.item_w,
			item_h = self._item_params.item_h,
			wrapper_h = self._item_params.wrapper_h,
			name = "loot_reward_card_" .. i,
			item_idx = i,
			hide_card_details = true
		}
		slot11 = "on_card_click"
		item_params.click_callback = callback(i, self, self)
		slot11 = "on_card_hover"
		item_params.hover_callback = callback(i, self, self)
		local card_key_name = self._params.loot_list[i].entry
		slot11 = card_key_name
		local card_data = tweak_data.challenge_cards.get_card_by_key_name(self, tweak_data.challenge_cards)
		slot14 = card_data
		local item = self._object.create_custom_control(tweak_data.challenge_cards, self._object, RaidGUIControlLootCardDetails, item_params)
		self._items[i] = item
	end

	return 
end
function RaidGUIControlLootRewardCards:_create_title()
	local title_panel_params = {
		name = "title_panel"
	}
	slot5 = title_panel_params
	self._title_panel = self._object.panel(slot3, self._object)
	local title_description_params = {
		name = "title_description",
		vertical = "center",
		alpha = 0,
		align = "left",
		y = RaidGUIControlLootRewardCards.TITLE_DESCRIPTION_Y,
		h = RaidGUIControlLootRewardCards.TITLE_DESCRIPTION_H,
		font = RaidGUIControlLootRewardCards.FONT,
		font_size = RaidGUIControlLootRewardCards.TITLE_DESCRIPTION_FONT_SIZE,
		color = RaidGUIControlLootRewardCards.TITLE_DESCRIPTION_COLOR
	}
	slot7 = true
	title_description_params.text = self.translate(self._object, self, "menu_loot_screen_bracket_unlocked_title")
	slot6 = title_description_params
	self._title_description = self._title_panel.text(self._object, self._title_panel)
	slot5 = self._title_description
	local _, _, w, _ = self._title_description.text_rect(self._object)
	slot10 = w

	self._title_description.set_w(slot8, self._title_description)

	local title_params = {
		vertical = "top",
		name = "pack_title",
		alpha = 0,
		align = "center"
	}
	slot11 = self._title_description
	title_params.y = self._title_description.y(self._title_description) + self._title_description.h(self._title_description) + RaidGUIControlLootRewardCards.TITLE_PADDING_TOP
	title_params.font = RaidGUIControlLootRewardCards.FONT
	title_params.font_size = RaidGUIControlLootRewardCards.TITLE_FONT_SIZE
	title_params.color = RaidGUIControlLootRewardCards.TITLE_COLOR
	slot12 = true
	title_params.text = self.translate(RaidGUIControlLootRewardCards.TITLE_PADDING_TOP, self, "menu_loot_screen_card_pack")
	slot11 = title_params
	self._pack_title = self._title_panel.text(RaidGUIControlLootRewardCards.TITLE_PADDING_TOP, self._title_panel)
	slot10 = self._pack_title
	local _, _, w, h = self._pack_title.text_rect(RaidGUIControlLootRewardCards.TITLE_PADDING_TOP)
	slot15 = w

	self._pack_title.set_w(slot13, self._pack_title)

	slot15 = h

	self._pack_title.set_h(slot13, self._pack_title)

	slot17 = self._title_panel
	slot15 = self._title_panel.w(slot16) / 2

	self._pack_title.set_center_x(slot13, self._pack_title)

	slot14 = self._title_description
	slot17 = self._pack_title

	self._title_description.set_x(slot13, self._pack_title.x(slot16))

	return 
end
function RaidGUIControlLootRewardCards:_create_card_details()
	local details_panel_params = {
		alpha = 0,
		name = "details_panel",
		y = RaidGUIControlLootRewardCards.CARD_DETAILS_Y
	}
	slot5 = details_panel_params
	self._details_panel = self._object.panel(slot3, self._object)
	local bonus_image_params = {
		name = "bonus_image_" .. self._name,
		texture = tweak_data.gui.icons.ico_bonus.texture,
		texture_rect = tweak_data.gui.icons.ico_bonus.texture_rect
	}
	slot6 = bonus_image_params
	self._bonus_image = self._details_panel.bitmap(self._name, self._details_panel)
	local malus_image_params = {
		name = "malus_image_" .. self._name
	}
	slot7 = self._bonus_image
	malus_image_params.y = self._bonus_image.y(self._name) + self._bonus_image.h(self._bonus_image) + 32
	malus_image_params.texture = tweak_data.gui.icons.ico_malus.texture
	malus_image_params.texture_rect = tweak_data.gui.icons.ico_malus.texture_rect
	slot7 = malus_image_params
	self._malus_image = self._details_panel.bitmap(self._bonus_image.h(self._bonus_image), self._details_panel)
	local bonus_label_params = {
		vertical = "center",
		h = 64,
		wrap = true,
		w = 390,
		align = "left",
		text = "",
		name = "bonus_label_" .. self._name
	}
	slot8 = self._bonus_image
	slot6 = self._bonus_image.w(self._bonus_image)
	bonus_label_params.x = self._bonus_image.x(self._name) + slot6 + 16
	slot7 = self._bonus_image
	bonus_label_params.y = self._bonus_image.y(slot6)
	bonus_label_params.font = tweak_data.gui.fonts.lato
	bonus_label_params.font_size = tweak_data.gui.font_sizes.size_20
	bonus_label_params.color = tweak_data.gui.colors.raid_grey
	slot8 = bonus_label_params
	self._bonus_label = self._details_panel.label(slot6, self._details_panel)
	local malus_label_params = {
		vertical = "center",
		h = 64,
		wrap = true,
		w = 390,
		align = "left",
		text = "",
		name = "malus_label_" .. self._name
	}
	slot9 = self._malus_image
	slot7 = self._malus_image.w(self._malus_image)
	malus_label_params.x = self._malus_image.x(self._name) + slot7 + 16
	slot8 = self._malus_image
	malus_label_params.y = self._malus_image.y(slot7)
	malus_label_params.font = tweak_data.gui.fonts.lato
	malus_label_params.font_size = tweak_data.gui.font_sizes.size_20
	malus_label_params.color = tweak_data.gui.colors.raid_grey
	slot9 = malus_label_params
	self._malus_label = self._details_panel.label(slot7, self._details_panel)

	return 
end
function RaidGUIControlLootRewardCards:get_items()
	return self._items
end
function RaidGUIControlLootRewardCards:set_cards(loot_list)
	self._params.loot_list = loot_list
	slot4 = self

	self._create_items(slot3)

	return 
end
function RaidGUIControlLootRewardCards:mouse_released(o, button, x, y)
	return false
end
function RaidGUIControlLootRewardCards:on_card_click(item_data, revealed)
	if not revealed then
		slot8 = item_data.negative_description

		self.show_card_details(slot4, self, item_data.key_name, item_data.positive_description)
	end

	return 
end
function RaidGUIControlLootRewardCards:on_card_hover(item_data, revealed)
	if revealed and item_data.key_name ~= self._shown_card_key then
		slot8 = item_data.negative_description

		self.show_card_details(slot4, self, item_data.key_name, item_data.positive_description)
	end

	return 
end
function RaidGUIControlLootRewardCards:show_card_details(key_name, positive_description, negative_description)
	slot6 = self._pack_title

	self._pack_title.stop(slot5)

	slot11 = "_animate_show_card_details"
	slot10 = negative_description

	self._pack_title.animate(slot5, self._pack_title, callback(slot8, self, self), key_name, positive_description)

	return 
end
function RaidGUIControlLootRewardCards:_animate_show_card_details(object, key_name, positive_description, negative_description)
	local fade_out_duration = 0.2
	local fade_out_object = nil
	slot9 = self._pack_title

	if 0 < self._pack_title.alpha(slot8) then
		fade_out_object = self._title_panel
	else
		fade_out_object = self._details_panel
	end

	slot9 = fade_out_object
	local t = (1 - fade_out_object.alpha(slot8)) * fade_out_duration

	while t < fade_out_duration do
		local dt = coroutine.yield()
		t = t + dt
		slot14 = fade_out_duration
		local current_alpha = Easing.quartic_in_out(slot10, t, 1, -1)
		slot13 = current_alpha

		fade_out_object.set_alpha(t, fade_out_object)
	end

	slot11 = 0

	self._title_panel.set_alpha(slot9, self._title_panel)

	slot11 = 0

	self._details_panel.set_alpha(slot9, self._details_panel)

	slot10 = self._bonus_label
	slot15 = positive_description.desc_params

	self._bonus_label.set_text(slot9, managers.localization.text(slot12, managers.localization, positive_description.desc_id))

	local bonus_label_center_y = self._bonus_label.center_y(slot9)
	slot11 = self._bonus_label
	local _, _, _, h = self._bonus_label.text_rect(self._bonus_label)
	slot16 = h

	self._bonus_label.set_h(positive_description.desc_id, self._bonus_label)

	slot15 = self._bonus_label
	slot18 = self._bonus_image

	self._bonus_label.set_center_y(positive_description.desc_id, self._bonus_image.center_y(slot17))

	slot16 = self._bonus_image

	if self._bonus_label.y(positive_description.desc_id) < self._bonus_image.y(self._bonus_label) then
		slot15 = self._bonus_label
		slot18 = self._bonus_image

		self._bonus_label.set_y(slot14, self._bonus_image.y(slot17))
	end

	if negative_description ~= nil then
		slot15 = self._malus_label

		self._malus_label.set_text(slot14, managers.localization.text(slot17, managers.localization, negative_description.desc_id))

		slot18 = self._bonus_image
		slot19 = self._bonus_label
		slot16 = self._bonus_label.y(self._bonus_image) + self._bonus_label.h(self._bonus_label) + 32
		local malus_image_y = math.max(slot14, self._bonus_image.y(managers.localization.text) + self._bonus_image.h(self._bonus_image) + 32)
		slot17 = malus_image_y

		self._malus_image.set_y(self._bonus_image.y(managers.localization.text) + self._bonus_image.h(self._bonus_image) + 32, self._malus_image)

		slot17 = malus_image_y

		self._malus_label.set_y(self._bonus_image.y(managers.localization.text) + self._bonus_image.h(self._bonus_image) + 32, self._malus_label)

		local malus_label_center_y = self._malus_label.center_y(self._bonus_image.y(managers.localization.text) + self._bonus_image.h(self._bonus_image) + 32)
		slot17 = self._malus_label
		local _, _, _, h = self._malus_label.text_rect(self._malus_label)
		slot22 = h

		self._malus_label.set_h(negative_description.desc_params, self._malus_label)

		slot21 = self._malus_label
		slot24 = self._malus_image

		self._malus_label.set_center_y(negative_description.desc_params, self._malus_image.center_y(slot23))

		slot22 = self._malus_image

		if self._malus_label.y(negative_description.desc_params) < self._malus_image.y(self._malus_label) then
			slot21 = self._malus_label
			slot24 = self._malus_image

			self._malus_label.set_y(slot20, self._malus_image.y(slot23))
		end

		slot22 = true

		self._malus_image.set_visible(slot20, self._malus_image)

		slot22 = true

		self._malus_label.set_visible(slot20, self._malus_label)
	else
		slot16 = false

		self._malus_image.set_visible(slot14, self._malus_image)

		slot16 = false

		self._malus_label.set_visible(slot14, self._malus_label)
	end

	self._shown_card_key = key_name
	local fade_in_duration = 0.25
	t = 0

	while t < fade_in_duration do
		local dt = coroutine.yield()
		t = t + dt
		slot20 = fade_in_duration
		local current_alpha = Easing.quartic_in_out(slot16, t, 0, 1)
		slot19 = current_alpha

		self._details_panel.set_alpha(t, self._details_panel)
	end

	slot17 = 1

	self._details_panel.set_alpha(slot15, self._details_panel)

	return 
end
function RaidGUIControlLootRewardCards:animate_show()
	slot3 = self._object

	self._object.stop(slot2)

	slot3 = self._object
	slot8 = "_animate_show"

	self._object.animate(slot2, callback(slot5, self, self))

	return 
end
function RaidGUIControlLootRewardCards:_animate_show(panel)
	local initial_offset = {}
	local timings = {}

	for i = 1, RaidGUIControlLootRewardCards.CARD_COUNT, 1 do
		slot11 = 150
		local offset = math.random(slot9, 50)
		slot12 = offset

		table.insert(50, initial_offset)

		local timing = math.random() * 0.4 + 0.9
		slot13 = timing

		table.insert(initial_offset, timings)
	end

	local duration = 1.9
	local t = 0
	local card_duration_fast_time_percentage = 0.25
	local card_duration_slow_time_percentage = 0.75
	local card_fast_move_percentage = 0.8
	slot11 = self._title_description
	local title_description_y = self._title_description.y(slot10)
	local title_description_offset = 35
	slot13 = self._pack_title
	local pack_title_y = self._pack_title.y(slot12)
	local pack_title_offset = 20
	local title_delay = 0
	local title_duration = 1

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot21 = title_duration
		local current_title_alpha = Easing.quartic_out(slot17, t - title_delay, 0, 1)
		slot20 = current_title_alpha

		self._title_description.set_alpha(t - title_delay, self._title_description)

		slot20 = current_title_alpha

		self._pack_title.set_alpha(t - title_delay, self._pack_title)

		slot22 = title_duration
		local title_description_current_offset = Easing.quartic_out(t - title_delay, t - title_delay, title_description_offset, -title_description_offset)
		slot21 = title_description_y - title_description_current_offset

		self._title_description.set_y(t - title_delay, self._title_description)

		slot23 = title_duration
		local customization_name_current_offset = Easing.quartic_out(t - title_delay, t - title_delay, pack_title_offset, -pack_title_offset)
		slot22 = pack_title_y - customization_name_current_offset

		self._pack_title.set_y(t - title_delay, self._pack_title)

		for i = 1, RaidGUIControlLootRewardCards.CARD_COUNT, 1 do
			slot28 = duration
			local current_alpha = Easing.quartic_out(slot24, t, 0, 1)
			slot27 = current_alpha

			self._items[i].set_alpha(t, self._items[i])

			local current_offset = nil

			if t < timings[i] * card_duration_fast_time_percentage then
				slot30 = timings[i] * card_duration_fast_time_percentage
				current_offset = Easing.linear(slot26, t, initial_offset[i], -initial_offset[i] * card_fast_move_percentage)
			else
				slot30 = timings[i] * card_duration_slow_time_percentage
				current_offset = Easing.quartic_out(slot26, t - timings[i] * card_duration_fast_time_percentage, initial_offset[i] * (1 - card_fast_move_percentage), -initial_offset[i] * (1 - card_fast_move_percentage))
			end

			slot28 = RaidGUIControlLootRewardCards.INITIAL_CARD_Y - current_offset

			self._items[i].set_y(slot26, self._items[i])
		end
	end

	slot18 = 1

	self._title_description.set_alpha(slot16, self._title_description)

	slot18 = title_description_y

	self._title_description.set_y(slot16, self._title_description)

	slot18 = 1

	self._pack_title.set_alpha(slot16, self._pack_title)

	slot18 = pack_title_y

	self._pack_title.set_y(slot16, self._pack_title)

	for i = 1, RaidGUIControlLootRewardCards.CARD_COUNT, 1 do
		slot22 = 1

		self._items[i].set_alpha(slot20, self._items[i])

		slot22 = RaidGUIControlLootRewardCards.INITIAL_CARD_Y

		self._items[i].set_y(slot20, self._items[i])
	end

	return 
end

return 
