-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not RaidGUIControlCardSuggested then
	slot2 = RaidGUIControlCardBase
	slot0 = class(slot1)
end

RaidGUIControlCardSuggested = slot0
function RaidGUIControlCardSuggested:init(parent, params, item_data, grid_params)
	local card_image_params = {
		x = 16,
		y = 16,
		w = params.item_w - 32,
		h = params.item_h - 16
	}
	params.card_image_params = card_image_params
	slot12 = grid_params

	RaidGUIControlCardSuggested.super.init(slot7, self, parent, params, item_data)

	if self._grid_params and self._grid_params.on_remove_callback then
		self._on_remove_callback = self._grid_params.on_remove_callback
	end

	if self._grid_params and self._grid_params.on_lock_callback then
		self._on_lock_callback = self._grid_params.on_lock_callback
	end

	if self._on_remove_callback and self._grid_params and self._grid_params.remove_texture then
		slot9 = managers.network
		slot9 = managers.network.session(slot8)
		slot9 = managers.network.session(slot8).local_peer(slot8)

		if params.peer_id == managers.network.session(slot8).local_peer(slot8).id(slot8) then
			slot9 = {
				name = "remove_card_button",
				h = 36,
				y = 0,
				w = 36,
				x = self._card_panel.w(slot11) - 38,
				texture = tweak_data.gui.icons.btn_circ_x.texture,
				texture_rect = tweak_data.gui.icons.btn_circ_x.texture_rect,
				layer = self._card_image.layer(slot11) + 1
			}
			slot12 = self._card_panel
			slot12 = self._card_image
			self._remove_card_button = self._card_panel.image(slot7, self._card_panel)
		end
	end

	if self._on_lock_callback and self._grid_params and self._grid_params.lock_texture then
		slot9 = managers.network
		slot9 = managers.network.session(slot8)
		slot9 = managers.network.session(slot8).local_peer(slot8)

		if params.peer_id == managers.network.session(slot8).local_peer(slot8).id(slot8) then
			slot9 = {
				name = "lock_card_button",
				h = 36,
				y = 0,
				w = 36,
				x = 4,
				texture = tweak_data.gui.icons.btn_circ_lock.texture,
				texture_rect = tweak_data.gui.icons.btn_circ_lock.texture_rect,
				layer = self._card_image.layer(slot11) + 1
			}
			slot12 = self._card_image
			self._lock_card_button = self._card_panel.image(slot7, self._card_panel)
		end
	end

	if self._grid_params and self._grid_params.lock_texture then
		slot9 = {
			name = "lock_card_image",
			h = 48,
			w = 48,
			x = self._card_panel.w(slot11) / 2 - 18,
			y = self._card_panel.h(slot11) / 4,
			texture = tweak_data.gui.icons.btn_circ_lock.texture,
			texture_rect = tweak_data.gui.icons.btn_circ_lock.texture_rect,
			layer = self._card_image.layer(slot11) + 1
		}
		slot12 = self._card_panel
		slot12 = self._card_panel
		slot12 = self._card_image
		self._lock_card_image = self._card_panel.image(slot7, self._card_panel)
	end

	slot11 = self._card_image
	slot9 = self._card_image.w(slot10) * 0.9

	self._card_rarity_icon.set_x(slot7, self._card_rarity_icon)

	slot11 = self._card_image
	slot9 = self._card_image.h(slot10) * 0.11

	self._card_rarity_icon.set_y(slot7, self._card_rarity_icon)

	slot11 = self._card_image
	slot9 = self._card_image.w(slot10) * 0.18

	self._card_type_icon.set_x(slot7, self._card_type_icon)

	slot11 = self._card_image
	slot9 = self._card_image.h(slot10) * 0.11

	self._card_type_icon.set_y(slot7, self._card_type_icon)

	if self._params.peer_name ~= "" then
		slot8 = self

		self._show_controls_for_empty_cardback(slot7)
	end

	slot9 = "challenge_card"
	self._sound_source = SoundDevice.create_source(slot7, SoundDevice)

	return 
end
function RaidGUIControlCardSuggested:_show_controls_for_empty_cardback()
	local empty_slot_texture = tweak_data.gui.icons.cc_empty_slot_small
	slot5 = empty_slot_texture.texture

	self._card_image.set_image(slot3, self._card_image)

	slot4 = self._card_image

	self._card_image.set_texture_rect(slot3, unpack(slot6))

	slot5 = {
		name = "card_not_selected_label",
		h = 128,
		wrap = true,
		align = "center",
		x = self._card_image.x(empty_slot_texture.texture_rect) + 5,
		y = self._card_image.top(empty_slot_texture.texture_rect) + 90,
		w = self._card_image.w(empty_slot_texture.texture_rect) - 10,
		text = self.translate(empty_slot_texture.texture_rect, self, "menu_card_not_selected"),
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.extra_small,
		color = tweak_data.gui.colors.dirty_white
	}
	slot8 = self._card_image
	slot8 = self._card_image
	slot8 = self._card_image
	slot10 = true
	self._card_not_selected_label = self._card_panel.label(slot3, self._card_panel)
	slot5 = true

	self._card_not_selected_label.set_visible(slot3, self._card_not_selected_label)

	slot4 = self._card_panel

	self._card_panel.show(slot3)

	slot4 = self._card_image

	self._card_image.show(slot3)

	slot4 = self._card_title

	self._card_title.hide(slot3)

	slot4 = self._xp_bonus

	self._xp_bonus.hide(slot3)

	slot4 = self._card_rarity_icon

	self._card_rarity_icon.hide(slot3)

	slot4 = self._card_type_icon

	self._card_type_icon.hide(slot3)

	slot4 = self._card_amount_background

	self._card_amount_background.hide(slot3)

	slot4 = self._card_amount_label

	self._card_amount_label.hide(slot3)

	if self._remove_card_button then
		slot4 = self._remove_card_button

		self._remove_card_button.hide(slot3)
	end

	if self._lock_card_button then
		slot4 = self._lock_card_button

		self._lock_card_button.hide(slot3)
	end

	if self._lock_card_image then
		slot4 = self._lock_card_image

		self._lock_card_image.hide(slot3)
	end

	return 
end
function RaidGUIControlCardSuggested:_show_controls_for_empty_suggestion()
	local empty_slot_texture = tweak_data.gui.icons.cc_empty_slot_small
	slot5 = empty_slot_texture.texture

	self._card_image.set_image(slot3, self._card_image)

	slot4 = self._card_image

	self._card_image.set_texture_rect(slot3, unpack(slot6))

	slot5 = {
		name = "card_not_selected_label",
		h = 128,
		wrap = true,
		align = "center",
		x = self._card_image.x(empty_slot_texture.texture_rect) + 5,
		y = self._card_image.top(empty_slot_texture.texture_rect) + 90,
		w = self._card_image.w(empty_slot_texture.texture_rect) - 10,
		text = self.translate(empty_slot_texture.texture_rect, self, "menu_card_not_selected"),
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.extra_small,
		color = tweak_data.gui.colors.dirty_white
	}
	slot8 = self._card_image
	slot8 = self._card_image
	slot8 = self._card_image
	slot10 = true
	self._card_not_selected_label = self._card_panel.label(slot3, self._card_panel)
	slot5 = true

	self._card_not_selected_label.set_visible(slot3, self._card_not_selected_label)

	slot4 = self._card_panel

	self._card_panel.show(slot3)

	slot4 = self._card_image

	self._card_image.show(slot3)

	slot4 = self._card_title

	self._card_title.hide(slot3)

	slot4 = self._xp_bonus

	self._xp_bonus.hide(slot3)

	slot4 = self._card_rarity_icon

	self._card_rarity_icon.hide(slot3)

	slot4 = self._card_type_icon

	self._card_type_icon.hide(slot3)

	slot4 = self._card_amount_background

	self._card_amount_background.hide(slot3)

	slot4 = self._card_amount_label

	self._card_amount_label.hide(slot3)

	if self._remove_card_button then
		slot4 = self._remove_card_button

		self._remove_card_button.show(slot3)
	end

	if self._lock_card_button then
		slot4 = self._lock_card_button

		self._lock_card_button.show(slot3)
	end

	return 
end
function RaidGUIControlCardSuggested:_show_controls_for_suggestion()
	slot4 = false

	self._card_not_selected_label.set_visible(slot2, self._card_not_selected_label)

	slot3 = self._card_panel

	self._card_panel.show(slot2)

	slot3 = self._card_image

	self._card_image.show(slot2)

	slot3 = self._card_title

	self._card_title.show(slot2)

	slot3 = self._xp_bonus

	self._xp_bonus.show(slot2)

	slot3 = self._card_rarity_icon

	self._card_rarity_icon.show(slot2)

	slot3 = self._card_type_icon

	self._card_type_icon.show(slot2)

	slot3 = self._card_amount_background

	self._card_amount_background.hide(slot2)

	slot3 = self._card_amount_label

	self._card_amount_label.hide(slot2)

	if self._remove_card_button then
		slot3 = self._remove_card_button

		self._remove_card_button.show(slot2)
	end

	if self._lock_card_button then
		slot3 = self._lock_card_button

		self._lock_card_button.show(slot2)
	end

	return 
end
function RaidGUIControlCardSuggested:set_visible(flag)
	slot5 = flag

	RaidGUIControlCardSuggested.super.set_visible(slot3, self)

	if self._remove_card_button then
		slot5 = flag

		self._remove_card_button.set_visible(slot3, self._remove_card_button)
	end

	if self._lock_card_button then
		slot5 = flag

		self._lock_card_button.set_visible(slot3, self._lock_card_button)
	end

	return 
end
function RaidGUIControlCardSuggested:set_card(card_data)
	slot5 = card_data

	RaidGUIControlCardSuggested.super.set_card(slot3, self)

	slot5 = true

	self.set_visible(slot3, self)

	self._item_data.peer_id = self._params.peer_id

	if self._lock_card_image then
		if self._item_data and self._item_data.locked_suggestion then
			slot4 = self._lock_card_image

			self._lock_card_image.show(slot3)
		else
			slot4 = self._lock_card_image

			self._lock_card_image.hide(slot3)
		end

		if self._item_data.locked_suggestion and self._remove_card_button then
			slot4 = self._remove_card_button

			self._remove_card_button.hide(slot3)
		end
	end

	if card_data and card_data.key_name and card_data.key_name == ChallengeCardsManager.CARD_PASS_KEY_NAME then
		slot4 = self

		self._show_controls_for_empty_suggestion(slot3)
	elseif card_data and card_data.key_name and card_data.key_name ~= ChallengeCardsManager.CARD_PASS_KEY_NAME then
		slot4 = self

		self._show_controls_for_suggestion(slot3)
	end

	return 
end
function RaidGUIControlCardSuggested:mouse_released(o, button, x, y)
	slot10 = y

	self.on_mouse_released(slot6, self, button, x)

	return true
end
function RaidGUIControlCardSuggested:on_mouse_released(button, x, y)
	if self._remove_card_button then
		slot8 = y
	elseif self._lock_card_button then
		slot8 = y
	elseif self._on_click_callback then
		slot8 = self._item_data

		self._on_click_callback(slot5, button, self)
	end

	return 
end
function RaidGUIControlCardSuggested:on_mouse_over(x, y)
	slot7 = y

	RaidGUIControlCardSuggested.super.on_mouse_over(slot4, self, x)

	slot6 = "card_mouse_over"

	self._sound_source.post_event(slot4, self._sound_source)

	return 
end

return 
