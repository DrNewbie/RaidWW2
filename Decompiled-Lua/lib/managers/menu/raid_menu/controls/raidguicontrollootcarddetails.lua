if not RaidGUIControlLootCardDetails then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlLootCardDetails = slot0
function RaidGUIControlLootCardDetails:init(parent, params, item_data)
	slot8 = params

	RaidGUIControlLootCardDetails.super.init(slot5, self, parent)

	if not params then
		slot7 = "[RaidGUIControlLootCardDetails:init] Parameters not specified for the card details"

		Application.error(slot5, Application)

		return 
	end

	self._item_data = item_data
	local object_params = clone(slot5)
	object_params.w = params.item_w
	object_params.h = params.wrapper_h
	slot7 = self._panel
	object_params.layer = self._panel.layer(params) + 1
	slot8 = object_params
	self._object = self._panel.panel(params, self._panel)
	self._params.panel = nil
	slot8 = {
		y = 10,
		x = 5,
		name = "card_panel_" .. self._name,
		w = params.item_w - 10,
		h = params.item_h - 20,
		layer = object_params.layer + 1
	}
	self._card_panel = self._object.panel(nil, self._object)
	slot8 = {
		visible = false,
		y = 0,
		x = 0,
		layer = 1,
		w = params.item_w,
		h = params.item_h
	}
	self._select_background_panel = self._object.panel(nil, self._object)
	slot8 = {
		layer = 2,
		color = tweak_data.gui.colors.raid_select_card_background
	}
	self._select_background = self._select_background_panel.rect(nil, self._select_background_panel)
	slot8 = {
		layer = 15,
		y = 0,
		x = 0,
		w = RaidGUIControlCardWithSelector.SELECT_TRINGLE_SIZE,
		h = RaidGUIControlCardWithSelector.SELECT_TRINGLE_SIZE,
		texture = tweak_data.gui.icons.ico_sel_rect_top_left.texture,
		texture_rect = tweak_data.gui.icons.ico_sel_rect_top_left.texture_rect
	}
	self._top_select_triangle = self._select_background_panel.image(nil, self._select_background_panel)
	slot8 = {
		layer = 15,
		x = self._select_background_panel.w(self._name) - RaidGUIControlCardWithSelector.SELECT_TRINGLE_SIZE,
		y = self._select_background_panel.h(RaidGUIControlCardWithSelector.SELECT_TRINGLE_SIZE) - RaidGUIControlCardWithSelector.SELECT_TRINGLE_SIZE,
		w = RaidGUIControlCardWithSelector.SELECT_TRINGLE_SIZE,
		h = RaidGUIControlCardWithSelector.SELECT_TRINGLE_SIZE,
		texture = tweak_data.gui.icons.ico_sel_rect_bottom_right.texture,
		texture_rect = tweak_data.gui.icons.ico_sel_rect_bottom_right.texture_rect
	}
	slot11 = self._select_background_panel
	slot11 = self._select_background_panel
	self._bottom_select_triangle = self._select_background_panel.image(nil, self._select_background_panel)
	slot7 = self

	self._create_empty_card(nil)

	slot8 = "challenge_card"
	self._sound_source = SoundDevice.create_source(nil, SoundDevice)

	return 
end
function RaidGUIControlLootCardDetails:close()
	return 
end
function RaidGUIControlLootCardDetails:_create_empty_card()
	local card_back_texture, card_back_texture_rect = managers.challenge_cards.get_cards_back_texture(slot2, managers.challenge_cards)
	slot6 = {
		name = "card_empty",
		y = 0,
		x = 0,
		layer = self._card_panel.layer(slot8) + 1,
		w = self._card_panel.w(slot8),
		h = self._card_panel.h(slot8),
		texture = card_back_texture,
		texture_rect = card_back_texture_rect
	}
	slot9 = self._card_panel
	slot9 = self._card_panel
	slot9 = self._card_panel
	self._card_empty = self._card_panel.image(self._item_data, self._card_panel)
	self._state = "card_empty"

	return 
end
function RaidGUIControlLootCardDetails:_create_card_details()
	slot3 = self._params
	local card_params = clone(slot2)
	card_params.x = 0
	card_params.y = 0
	card_params.w = self._params.item_w
	card_params.h = self._params.item_h
	card_params.card_image_params = {
		x = 0,
		y = 0
	}
	slot5 = self._card_panel
	card_params.card_image_params.w = self._card_panel.w(slot4)
	slot5 = self._card_panel
	slot3 = self._card_panel.h(slot4)
	card_params.card_image_params.h = slot3
	slot4 = self._card_panel
	card_params.layer = self._card_panel.layer(slot3) + 1
	slot7 = self._item_data
	self._card_control = self._card_panel.create_custom_control(slot3, self._card_panel, RaidGUIControlCardBase, card_params)
	slot5 = self._item_data

	self._card_control.set_card(slot3, self._card_control)

	slot5 = {
		h = 64,
		visible = false,
		w = 64,
		x = 0,
		name = "bonus_image_" .. self._name,
		layer = self._card_panel.layer(self._name),
		y = self._card_panel.h(self._name) + 20,
		layer = self._card_control.layer(self._name),
		texture = tweak_data.gui.icons.ico_bonus.texture,
		texture_rect = tweak_data.gui.icons.ico_bonus.texture_rect
	}
	slot8 = self._card_panel
	slot8 = self._card_panel
	slot8 = self._card_control
	self._bonus_image = self._object.image(slot3, self._object)
	slot5 = {
		h = 64,
		visible = false,
		w = 64,
		x = 0,
		name = "malus_image_" .. self._name,
		y = self._bonus_image.y(self._name) + self._bonus_image.h(self._bonus_image) + 26,
		layer = self._card_control.layer(self._bonus_image.h(self._bonus_image)),
		texture = tweak_data.gui.icons.ico_malus.texture,
		texture_rect = tweak_data.gui.icons.ico_malus.texture_rect
	}
	slot9 = self._bonus_image
	slot8 = self._card_control
	self._malus_image = self._object.image(slot3, self._object)
	slot5 = {
		vertical = "center",
		h = 64,
		wrap = true,
		align = "left",
		visible = false,
		text = "",
		name = "bonus_label_" .. self._name,
		layer = self._card_control.layer(self._name),
		x = self._bonus_image.x(self._name) + slot7,
		y = self._bonus_image.y(slot7),
		w = self._card_control.w(slot7) - self._bonus_image.w(self._card_control) - 10,
		font = tweak_data.gui.fonts.lato,
		font_size = tweak_data.gui.font_sizes.size_20,
		color = tweak_data.gui.colors.raid_white
	}
	slot8 = self._card_control
	slot9 = self._bonus_image
	slot7 = self._bonus_image.w(self._bonus_image)
	slot8 = self._bonus_image
	slot9 = self._bonus_image
	self._bonus_label = self._object.label(slot3, self._object)
	slot5 = {
		vertical = "center",
		h = 64,
		wrap = true,
		align = "left",
		visible = false,
		text = "",
		name = "malus_label_" .. self._name,
		layer = self._card_control.layer(self._name),
		x = self._malus_image.x(self._name) + slot7,
		y = self._malus_image.y(slot7),
		w = self._bonus_label.w(slot7),
		font = tweak_data.gui.fonts.lato,
		font_size = tweak_data.gui.font_sizes.size_20,
		color = tweak_data.gui.colors.raid_white
	}
	slot8 = self._card_control
	slot9 = self._malus_image
	slot7 = self._malus_image.w(self._malus_image)
	slot8 = self._malus_image
	slot8 = self._bonus_label
	self._malus_label = self._object.label(slot3, self._object)

	if self._item_data and self._item_data.effects then
		slot4 = self._item_data.effects

		for _, effect_data in ipairs(slot3) do
			if effect_data.type == ChallengeCardsTweakData.EFFECT_TYPE_POSITIVE then
				slot9 = self._bonus_label
				slot14 = self._item_data.positive_description.desc_params

				self._bonus_label.set_text(slot8, managers.localization.text(slot11, managers.localization, self._item_data.positive_description.desc_id))

				slot10 = true

				self._bonus_image.set_visible(slot8, self._bonus_image)

				slot10 = true

				self._bonus_label.set_visible(slot8, self._bonus_label)
			elseif effect_data.type == ChallengeCardsTweakData.EFFECT_TYPE_NEGATIVE then
				slot9 = self._malus_label
				slot14 = self._item_data.negative_description.desc_params

				self._malus_label.set_text(slot8, managers.localization.text(slot11, managers.localization, self._item_data.negative_description.desc_id))

				slot10 = true

				self._malus_image.set_visible(slot8, self._malus_image)

				slot10 = true

				self._malus_label.set_visible(slot8, self._malus_label)
			end
		end
	end

	slot5 = 0

	self._card_control.set_alpha(slot3, self._card_control)

	slot5 = 0

	self._bonus_image.set_alpha(slot3, self._bonus_image)

	slot5 = 0

	self._malus_image.set_alpha(slot3, self._malus_image)

	slot5 = 0

	self._bonus_label.set_alpha(slot3, self._bonus_label)

	slot5 = 0

	self._malus_label.set_alpha(slot3, self._malus_label)

	return 
end
function RaidGUIControlLootCardDetails:_switch_card()
	return 
end
function RaidGUIControlLootCardDetails:set_debug(value)
	slot5 = value

	self._object.set_debug(slot3, self._object)

	return 
end
function RaidGUIControlLootCardDetails:revealed()
	return self._state == "card_details"
end
function RaidGUIControlLootCardDetails:_reveal_card()
	if self._state == "card_empty" then
		self._state = "card_details"
		slot3 = self._card_panel._engine_panel

		self._card_panel._engine_panel.stop(slot2)

		slot3 = self._card_panel._engine_panel
		slot8 = "_animate_show_card"

		self._card_panel._engine_panel.animate(slot2, callback(slot5, self, self))

		slot3 = self

		self._create_card_details(slot2)
	end

	return 
end
function RaidGUIControlLootCardDetails:on_mouse_released()
	if self._params.click_callback then
		slot4 = self._state == "card_details"

		self._params.click_callback(slot2, self._item_data)
	end

	slot3 = self

	self._reveal_card(slot2)

	return 
end
function RaidGUIControlLootCardDetails:confirm_pressed()
	slot3 = self

	self.on_mouse_released(slot2)

	return 
end
function RaidGUIControlLootCardDetails:on_mouse_over(x, y)
	slot7 = y

	RaidGUIControlLootCardDetails.super.on_mouse_over(slot4, self, x)

	if self._params.hover_callback then
		slot6 = self._state == "card_details"

		self._params.hover_callback(slot4, self._item_data)
	end

	slot6 = "card_mouse_over"

	self._sound_source.post_event(slot4, self._sound_source)

	slot5 = self

	self._highlight_on(slot4)

	return 
end
function RaidGUIControlLootCardDetails:on_mouse_out(x, y)
	slot7 = y

	RaidGUIControlLootCardDetails.super.on_mouse_out(slot4, self, x)

	slot5 = self

	self._highlight_off(slot4)

	return 
end
function RaidGUIControlLootCardDetails:_highlight_on()
	slot4 = true

	self._select_background_panel.set_visible(slot2, self._select_background_panel)

	return 
end
function RaidGUIControlLootCardDetails:_highlight_off()
	if self._select_background_panel and self._select_background_panel._engine_panel then
		slot3 = self._select_background_panel._engine_panel

		if alive(slot2) then
			slot4 = false

			self._select_background_panel.set_visible(slot2, self._select_background_panel)
		end
	end

	return 
end
function RaidGUIControlLootCardDetails:select()
	self._selected = true

	if self._params.hover_callback then
		slot4 = self._state == "card_details"

		self._params.hover_callback(slot2, self._item_data)
	end

	slot4 = "card_mouse_over"

	self._sound_source.post_event(slot2, self._sound_source)

	slot3 = self

	self._highlight_on(slot2)

	return 
end
function RaidGUIControlLootCardDetails:unselect()
	self._selected = false
	slot3 = self

	self._highlight_off(slot2)

	return 
end
function RaidGUIControlLootCardDetails:_animate_reveal_card()
	self._sound_source.post_event(slot2, self._sound_source)

	local close_duration = 0.25
	local t = 0
	local initial_card_empty_w = self._card_empty.w("reward_reveal_card")
	slot6 = self._card_empty
	local card_center_x = self._card_empty.center_x(self._card_empty)

	while t < close_duration do
		local dt = coroutine.yield()
		t = t + dt
		slot11 = close_duration
		local current_scale = Easing.quartic_in(slot7, t, 1, -1)
		slot10 = initial_card_empty_w * current_scale

		self._card_empty.set_w(t, self._card_empty)

		slot10 = card_center_x

		self._card_empty.set_center_x(t, self._card_empty)
	end

	slot8 = 0

	self._card_empty.set_w(slot6, self._card_empty)

	slot8 = card_center_x

	self._card_empty.set_center_x(slot6, self._card_empty)

	slot8 = 0

	self._card_control.set_w(slot6, self._card_control)

	slot8 = 1

	self._card_control.set_alpha(slot6, self._card_control)

	local open_duration = 0.25
	t = 0

	while t < open_duration do
		local dt = coroutine.yield()
		t = t + dt
		slot12 = open_duration
		local current_scale = Easing.quartic_out(slot8, t, 0, 1)
		slot11 = initial_card_empty_w * current_scale

		self._card_control.set_w(t, self._card_control)

		slot11 = card_center_x

		self._card_control.set_center_x(t, self._card_control)
	end

	slot9 = initial_card_empty_w

	self._card_control.set_w(slot7, self._card_control)

	slot9 = card_center_x

	self._card_control.set_center_x(slot7, self._card_control)

	return 
end
function RaidGUIControlLootCardDetails:_animate_show_card()
	slot4 = "reward_reveal_card"

	self._sound_source.post_event(slot2, self._sound_source)

	self._animation_t = 0
	local duration = 0.45
	local t = 0

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot7 = 1 - self._animation_t

		self._card_empty.set_alpha(slot5, self._card_empty)

		slot7 = self._animation_t

		self._card_control.set_alpha(slot5, self._card_control)

		if not self._params.hide_card_details then
			slot7 = self._animation_t

			self._bonus_image.set_alpha(slot5, self._bonus_image)

			slot7 = self._animation_t

			self._malus_image.set_alpha(slot5, self._malus_image)

			slot7 = self._animation_t

			self._bonus_label.set_alpha(slot5, self._bonus_label)

			slot7 = self._animation_t

			self._malus_label.set_alpha(slot5, self._malus_label)
		end

		self._animation_t = t / duration
	end

	self._animation_t = 1
	slot6 = self._card_empty

	self._card_panel.remove(slot4, self._card_panel)

	slot6 = self._animation_t

	self._card_control.set_alpha(slot4, self._card_control)

	if not self._params.hide_card_details then
		slot6 = self._animation_t

		self._bonus_image.set_alpha(slot4, self._bonus_image)

		slot6 = self._animation_t

		self._malus_image.set_alpha(slot4, self._malus_image)

		slot6 = self._animation_t

		self._bonus_label.set_alpha(slot4, self._bonus_label)

		slot6 = self._animation_t

		self._malus_label.set_alpha(slot4, self._malus_label)
	end

	return 
end

return 
