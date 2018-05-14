if not RaidGUIControlCardWithSelector then
	slot2 = RaidGUIControlCardBase
	slot0 = class(slot1)
end

RaidGUIControlCardWithSelector = slot0
RaidGUIControlCardWithSelector.SELECT_TRINGLE_SIZE = 30
function RaidGUIControlCardWithSelector:init(parent, params, item_data, grid_params)
	slot11 = grid_params

	RaidGUIControlCardWithSelector.super.init(slot6, self, parent, params, item_data)

	slot5 = self._params

	if not params.selected_marker_w and not params.item_w then
		slot8 = self._panel
		slot6 = self._panel.w(slot7)
	end

	slot5.selected_marker_w = slot6
	slot5 = self._params

	if not params.selected_marker_h and not params.item_h then
		slot8 = self._panel
		slot6 = self._panel.h(slot7)
	end

	slot5.selected_marker_h = slot6
	slot5 = self._params

	if not params.item_w then
		slot8 = self._panel
		slot6 = self._panel.w(slot7)
	end

	slot5.item_w = slot6
	slot5 = self._params

	if not params.item_h then
		slot8 = self._panel
		slot6 = self._panel.h(slot7)
	end

	slot5.item_h = slot6
	slot8 = {
		visible = false,
		y = 0,
		x = 0,
		layer = 1,
		w = self._params.selected_marker_w,
		h = self._params.selected_marker_h
	}
	self._select_background_panel = self._object.panel(slot6, self._object)
	slot8 = {
		y = 0,
		x = 0,
		layer = 2,
		w = self._params.selected_marker_w,
		h = self._params.selected_marker_h,
		color = tweak_data.gui.colors.raid_select_card_background
	}
	self._select_background = self._select_background_panel.rect(slot6, self._select_background_panel)
	slot8 = {
		layer = 15,
		y = 0,
		x = 0,
		w = RaidGUIControlCardWithSelector.SELECT_TRINGLE_SIZE,
		h = RaidGUIControlCardWithSelector.SELECT_TRINGLE_SIZE,
		texture = tweak_data.gui.icons.ico_sel_rect_top_left.texture,
		texture_rect = tweak_data.gui.icons.ico_sel_rect_top_left.texture_rect
	}
	self._top_select_triangle = self._select_background_panel.image(slot6, self._select_background_panel)
	slot8 = {
		layer = 15,
		x = self._select_background_panel.w(slot10) - RaidGUIControlCardWithSelector.SELECT_TRINGLE_SIZE,
		y = self._select_background_panel.h(RaidGUIControlCardWithSelector.SELECT_TRINGLE_SIZE) - RaidGUIControlCardWithSelector.SELECT_TRINGLE_SIZE,
		w = RaidGUIControlCardWithSelector.SELECT_TRINGLE_SIZE,
		h = RaidGUIControlCardWithSelector.SELECT_TRINGLE_SIZE,
		texture = tweak_data.gui.icons.ico_sel_rect_bottom_right.texture,
		texture_rect = tweak_data.gui.icons.ico_sel_rect_bottom_right.texture_rect
	}
	slot11 = self._select_background_panel
	slot11 = self._select_background_panel
	self._bottom_select_triangle = self._select_background_panel.image(slot6, self._select_background_panel)
	slot11 = self._card_image
	slot8 = self._card_image.y(tweak_data.gui.icons.ico_sel_rect_bottom_right.texture_rect) + self._card_image.h(self._card_image) * RaidGUIControlCardBase.XP_BONUS_Y + (self._params.selected_marker_h - self._params.item_h) / 2

	self._xp_bonus.set_y(slot6, self._xp_bonus)

	slot8 = "challenge_card"
	self._sound_source = SoundDevice.create_source(slot6, SoundDevice)

	return 
end
function RaidGUIControlCardWithSelector:set_card(card_data)
	slot5 = card_data

	RaidGUIControlCardWithSelector.super.set_card(slot3, self)

	if self._item_data then
		slot5 = self._params.selected_marker_w

		self._card_panel.set_w(slot3, self._card_panel)

		slot5 = self._params.selected_marker_h

		self._card_panel.set_h(slot3, self._card_panel)

		slot4 = self._select_background_panel

		self._select_background_panel.hide(slot3)

		local image_coord_x = math.floor(slot3)
		local image_coord_y = math.floor((self._params.selected_marker_w - self._params.item_w) / 2)
		slot7 = image_coord_x

		self._card_image.set_x((self._params.selected_marker_h - self._params.item_h) / 2, self._card_image)

		slot7 = image_coord_y

		self._card_image.set_y((self._params.selected_marker_h - self._params.item_h) / 2, self._card_image)

		slot7 = self._params.item_w

		self._card_image.set_w((self._params.selected_marker_h - self._params.item_h) / 2, self._card_image)

		slot7 = self._params.item_h

		self._card_image.set_h((self._params.selected_marker_h - self._params.item_h) / 2, self._card_image)

		slot7 = image_coord_x

		self._card_stackable_image.set_x((self._params.selected_marker_h - self._params.item_h) / 2, self._card_stackable_image)

		slot7 = image_coord_y

		self._card_stackable_image.set_y((self._params.selected_marker_h - self._params.item_h) / 2, self._card_stackable_image)

		slot7 = self._params.item_w

		self._card_stackable_image.set_w((self._params.selected_marker_h - self._params.item_h) / 2, self._card_stackable_image)

		slot7 = self._params.item_h

		self._card_stackable_image.set_h((self._params.selected_marker_h - self._params.item_h) / 2, self._card_stackable_image)

		slot7 = self._params.selected_marker_w / 2

		self._card_title.set_center_x((self._params.selected_marker_h - self._params.item_h) / 2, self._card_title)

		slot9 = self._card_title
		slot7 = self._card_title.y(slot8) + (self._params.selected_marker_h - self._params.item_h) / 2

		self._card_title.set_y((self._params.selected_marker_h - self._params.item_h) / 2, self._card_title)

		slot6 = self._card_description

		self._card_description.hide((self._params.selected_marker_h - self._params.item_h) / 2)

		slot7 = 138

		self._card_rarity_icon.set_x((self._params.selected_marker_h - self._params.item_h) / 2, self._card_rarity_icon)

		slot7 = 27

		self._card_rarity_icon.set_y((self._params.selected_marker_h - self._params.item_h) / 2, self._card_rarity_icon)

		slot7 = 22

		self._card_rarity_icon.set_w((self._params.selected_marker_h - self._params.item_h) / 2, self._card_rarity_icon)

		slot7 = 22

		self._card_rarity_icon.set_h((self._params.selected_marker_h - self._params.item_h) / 2, self._card_rarity_icon)

		slot7 = 31

		self._card_type_icon.set_x((self._params.selected_marker_h - self._params.item_h) / 2, self._card_type_icon)

		slot7 = 27

		self._card_type_icon.set_y((self._params.selected_marker_h - self._params.item_h) / 2, self._card_type_icon)

		slot7 = 22

		self._card_type_icon.set_w((self._params.selected_marker_h - self._params.item_h) / 2, self._card_type_icon)

		slot7 = 22

		self._card_type_icon.set_h((self._params.selected_marker_h - self._params.item_h) / 2, self._card_type_icon)

		slot7 = self._params.selected_marker_w / 2

		self._xp_bonus.set_center_x((self._params.selected_marker_h - self._params.item_h) / 2, self._xp_bonus)
	end

	return 
end
function RaidGUIControlCardWithSelector:select(dont_fire_selected_callback)
	slot4 = self

	RaidGUIControlCardWithSelector.super.select(slot3)

	slot4 = self._select_background_panel

	self._select_background_panel.show(slot3)

	if self._on_selected_callback and not dont_fire_selected_callback then
		slot5 = self._item_data

		self._on_selected_callback(slot3, self._params.item_idx)
	end

	return 
end
function RaidGUIControlCardWithSelector:unselect()
	slot3 = self

	RaidGUIControlCardWithSelector.super.unselect(slot2)

	slot3 = self._select_background_panel

	self._select_background_panel.hide(slot2)

	return 
end
function RaidGUIControlCardWithSelector:on_mouse_over(x, y)
	slot7 = y

	RaidGUIControlCardWithSelector.super.on_mouse_over(slot4, self, x)

	slot6 = "card_mouse_over"

	self._sound_source.post_event(slot4, self._sound_source)

	return 
end
function RaidGUIControlCardWithSelector:on_mouse_released(button, x, y)
	if self._on_click_callback then
		slot7 = self._params.key_value_field

		self._on_click_callback(slot5, self._item_data)
	end

	return 
end

return 
