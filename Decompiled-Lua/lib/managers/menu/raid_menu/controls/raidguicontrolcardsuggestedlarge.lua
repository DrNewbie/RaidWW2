if not RaidGUIControlCardSuggestedLarge then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlCardSuggestedLarge = slot0
RaidGUIControlCardSuggestedLarge.ICON_PADDING = 20
RaidGUIControlCardSuggestedLarge.ICON_WIDTH = 32
RaidGUIControlCardSuggestedLarge.SELECT_TRINGLE_SIZE = 30
function RaidGUIControlCardSuggestedLarge:init(parent, params, item_data, grid_params)
	slot11 = grid_params

	RaidGUIControlCardSuggestedLarge.super.init(slot6, self, parent, params, item_data)

	self._item_data = item_data
	self._grid_params = grid_params
	slot8 = {
		name = "suggested_card_large_object_panel_" .. self._name,
		x = self._params.x,
		y = self._params.y,
		w = self._params.selected_marker_w,
		h = self._params.selected_marker_h,
		layer = self._parent.layer(self._name) + 10
	}
	slot11 = self._parent
	self._object = self._panel.panel(slot6, self._panel)

	if self._grid_params and self._grid_params.on_click_callback then
		self._on_click_callback = self._grid_params.on_click_callback
	end

	if self._params and self._params.item_selected_callback then
		self._item_selected_callback = self._params.item_selected_callback
	end

	slot8 = "challenge_card"
	self._sound_source = SoundDevice.create_source(slot6, SoundDevice)

	return 
end
function RaidGUIControlCardSuggestedLarge:get_data()
	return self._item_data
end
function RaidGUIControlCardSuggestedLarge:update()
	return 
end
function RaidGUIControlCardSuggestedLarge:set_card(card_data)
	self._item_data = card_data
	self._item_data.peer_id = self._params.peer_id

	if self._item_data.peer_id then
		slot4 = managers.network
		slot4 = managers.network.session(slot3)

		if managers.network.session(slot3).all_peers(slot3)[self._item_data.peer_id] then
			slot4 = managers.network
			slot4 = managers.network.session(slot3)
			slot4 = managers.network.session(slot3).all_peers(slot3)[self._item_data.peer_id]
			local peer_name = managers.network.session(slot3).all_peers(slot3)[self._item_data.peer_id].name(self._item_data.peer_id)
			self._item_data.peer_name = peer_name
		end
	end

	slot4 = self._object

	self._object.clear(slot3)

	local card_rarity = self._item_data.rarity
	local rarity_definition = tweak_data.challenge_cards.rarity_definition[card_rarity]
	local card_type = self._item_data.card_type
	local type_definition = tweak_data.challenge_cards.type_definition[card_type]
	local card_texture = tweak_data.challenge_cards.challenge_card_texture_path .. card_data.texture
	local card_texture_rect = tweak_data.challenge_cards.challenge_card_texture_rect
	slot10 = (self._params.selected_marker_w - self._params.item_width) / 2
	local card_x = math.floor(slot9)
	local card_y = 32
	slot13 = {
		name = "suggested_card_panel_card_" .. self._name,
		x = card_x,
		y = card_y,
		w = self._params.item_width,
		h = self._params.item_height,
		layer = self._object.layer(self._name) + 1
	}
	slot16 = self._object
	self._challenge_card_panel = self._object.panel(self._params.item_width, self._object)
	slot13 = {
		visible = false,
		y = 0,
		x = 0,
		name = "select_marker_panel_" .. self._name,
		w = self._object.w(self._name),
		h = self._object.h(self._name),
		layer = self._object.layer(self._name)
	}
	slot16 = self._object
	slot16 = self._object
	slot16 = self._object
	self._select_marker_panel = self._object.panel(self._params.item_width, self._object)
	slot13 = {
		y = 0,
		x = 0,
		name = "select_marker_rect_" .. self._name,
		w = self._object.w(self._name),
		h = self._object.h(self._name),
		color = tweak_data.gui.colors.raid_select_card_background
	}
	slot16 = self._object
	slot16 = self._object
	self._select_marker_rect = self._select_marker_panel.rect(self._params.item_width, self._select_marker_panel)
	slot13 = {
		y = 0,
		x = 0,
		w = RaidGUIControlCardSuggestedLarge.SELECT_TRINGLE_SIZE,
		h = RaidGUIControlCardSuggestedLarge.SELECT_TRINGLE_SIZE,
		texture = tweak_data.gui.icons.ico_sel_rect_top_left.texture,
		texture_rect = tweak_data.gui.icons.ico_sel_rect_top_left.texture_rect
	}
	self._top_select_triangle = self._select_marker_panel.image(self._params.item_width, self._select_marker_panel)
	slot13 = {
		x = self._select_marker_panel.w(self._name) - RaidGUIControlCardSuggestedLarge.SELECT_TRINGLE_SIZE,
		y = self._select_marker_panel.h(RaidGUIControlCardSuggestedLarge.SELECT_TRINGLE_SIZE) - RaidGUIControlCardSuggestedLarge.SELECT_TRINGLE_SIZE,
		w = RaidGUIControlCardSuggestedLarge.SELECT_TRINGLE_SIZE,
		h = RaidGUIControlCardSuggestedLarge.SELECT_TRINGLE_SIZE,
		texture = tweak_data.gui.icons.ico_sel_rect_bottom_right.texture,
		texture_rect = tweak_data.gui.icons.ico_sel_rect_bottom_right.texture_rect
	}
	slot16 = self._select_marker_panel
	slot16 = self._select_marker_panel
	self._bottom_select_triangle = self._select_marker_panel.image(self._params.item_width, self._select_marker_panel)
	slot13 = {
		y = 0,
		x = 0,
		name = "suggested_card_image_" .. self._name,
		w = self._challenge_card_panel.w(self._name),
		h = self._challenge_card_panel.h(self._name),
		texture = card_texture,
		texture_rect = card_texture_rect,
		layer = self._select_marker_panel.layer(self._name) + 1
	}
	slot16 = self._challenge_card_panel
	slot16 = self._challenge_card_panel
	slot16 = self._select_marker_panel
	self._card_image = self._challenge_card_panel.bitmap(self._params.item_width, self._challenge_card_panel)
	slot13 = {
		name = "suggested_card_type_icon_" .. self._name,
		x = RaidGUIControlCardSuggestedLarge.ICON_PADDING,
		y = RaidGUIControlCardSuggestedLarge.ICON_PADDING - 3,
		w = RaidGUIControlCardSuggestedLarge.ICON_WIDTH,
		h = RaidGUIControlCardSuggestedLarge.ICON_WIDTH,
		layer = self._card_image.layer(self._name) + 1,
		texture = type_definition.texture_path,
		texture_rect = type_definition.texture_rect
	}
	slot16 = self._card_image
	self._type_icon = self._challenge_card_panel.image(self._params.item_width, self._challenge_card_panel)

	if rarity_definition.texture_path_icon then
		slot13 = {
			name = "suggested_card_rarity_icon_" .. self._name,
			x = self._challenge_card_panel.w(self._name) - RaidGUIControlCardSuggestedLarge.ICON_PADDING - RaidGUIControlCardSuggestedLarge.ICON_WIDTH,
			y = RaidGUIControlCardSuggestedLarge.ICON_PADDING - 3,
			w = RaidGUIControlCardSuggestedLarge.ICON_WIDTH,
			h = RaidGUIControlCardSuggestedLarge.ICON_WIDTH,
			layer = self._card_image.layer(RaidGUIControlCardSuggestedLarge.ICON_WIDTH) + 1,
			texture = rarity_definition.texture_path_icon,
			texture_rect = rarity_definition.texture_rect_icon
		}
		slot16 = self._challenge_card_panel
		slot16 = self._card_image
		self._rarity_icon = self._challenge_card_panel.image(slot11, self._challenge_card_panel)
	end

	if not self._item_data.title_in_texture then
		slot12 = self._card_image
		local title_h = self._card_image.h(slot11) * RaidGUIControlCardBase.TITLE_H
		local title_font_size = tweak_data.gui.font_sizes.medium
		slot15 = {
			wrap = true,
			align = "center",
			vertical = "center",
			name = "suggested_card_title_" .. self._name,
			w = self._card_image.w(self._name) * (1 - 2 * RaidGUIControlCardBase.TITLE_PADDING),
			h = title_h,
			x = self._card_image.x(1 - 2 * RaidGUIControlCardBase.TITLE_PADDING) + self._card_image.w(self._card_image) * RaidGUIControlCardBase.TITLE_PADDING,
			y = self._card_image.y(self._card_image.w(self._card_image) * RaidGUIControlCardBase.TITLE_PADDING) + self._card_image.h(self._card_image) * RaidGUIControlCardBase.TITLE_Y,
			layer = self._card_image.layer(self._card_image.h(self._card_image) * RaidGUIControlCardBase.TITLE_Y) + 1,
			text = self.translate(self._card_image.h(self._card_image) * RaidGUIControlCardBase.TITLE_Y, self, self._item_data.name),
			font = tweak_data.gui.fonts.din_compressed,
			font_size = title_font_size
		}
		slot18 = self._card_image
		slot19 = self._card_image
		slot19 = self._card_image
		slot18 = self._card_image
		slot20 = true
		self._card_title = self._challenge_card_panel.label(slot13, self._challenge_card_panel)
		slot14 = self._card_title
		local _, _, w, h = self._card_title.text_rect(slot13)

		if title_h < h then
			slot19 = title_font_size

			self._refit_card_title_text(slot17, self)
		end
	end

	local params_xp_bonus = {
		name = "xp_bonus",
		vertical = "center",
		align = "center",
		text = "",
		x = 0
	}
	slot14 = self._card_image
	params_xp_bonus.y = self._card_image.y(slot12) + self._card_image.h(self._card_image) * RaidGUIControlCardBase.XP_BONUS_Y
	slot13 = self._card_image
	params_xp_bonus.w = self._card_image.w(self._card_image.h(self._card_image) * RaidGUIControlCardBase.XP_BONUS_Y) * RaidGUIControlCardBase.XP_BONUS_W
	slot13 = self._card_image
	params_xp_bonus.h = self._card_image.h(RaidGUIControlCardBase.XP_BONUS_W) * RaidGUIControlCardBase.XP_BONUS_H
	params_xp_bonus.font = RaidGUIControlCardBase.XP_BONUS_FONT
	slot16 = self._card_image
	slot13 = RaidGUIControlCardBase.XP_BONUS_FONT_SIZE * self._card_image.w(slot15) * 0.002
	params_xp_bonus.font_size = math.ceil(RaidGUIControlCardBase.XP_BONUS_H)
	params_xp_bonus.color = tweak_data.gui.colors.raid_white
	slot13 = self._card_image
	params_xp_bonus.layer = self._card_image.layer(RaidGUIControlCardBase.XP_BONUS_H) + 1
	slot14 = params_xp_bonus
	self._xp_bonus = self._challenge_card_panel.label(RaidGUIControlCardBase.XP_BONUS_H, self._challenge_card_panel)
	slot14 = self._item_data.key_name
	local bonus_xp_reward = managers.challenge_cards.get_card_xp_label(RaidGUIControlCardBase.XP_BONUS_H, managers.challenge_cards)
	slot15 = bonus_xp_reward

	self._xp_bonus.set_text(managers.challenge_cards, self._xp_bonus)

	slot14 = self._xp_bonus
	local x1, y1, w1, h1 = self._xp_bonus.text_rect(managers.challenge_cards)
	slot19 = w1

	self._xp_bonus.set_w(slot17, self._xp_bonus)

	slot19 = h1

	self._xp_bonus.set_h(slot17, self._xp_bonus)

	slot21 = self._card_image
	slot19 = self._card_image.w(slot20) / 2

	self._xp_bonus.set_center_x(slot17, self._xp_bonus)

	slot19 = self._item_data.key_name
	local bonus_description, malus_description = managers.challenge_cards.get_card_description(slot17, managers.challenge_cards)

	if bonus_description and bonus_description ~= "" then
		slot21 = {
			h = 64,
			w = 64,
			name = "suggested_card_bonus_image_" .. self._name,
			x = self._challenge_card_panel.x(self._name),
			y = self._challenge_card_panel.y(self._name) + self._challenge_card_panel.h(self._challenge_card_panel) + 32,
			layer = self._challenge_card_panel.layer(self._challenge_card_panel.h(self._challenge_card_panel)) + 1,
			texture = tweak_data.gui.icons.ico_bonus.texture,
			texture_rect = tweak_data.gui.icons.ico_bonus.texture_rect
		}
		slot24 = self._challenge_card_panel
		slot25 = self._challenge_card_panel
		slot24 = self._challenge_card_panel
		self._bonus_image = self._object.image(slot19, self._object)
		slot21 = {
			vertical = "top",
			h = 64,
			wrap = true,
			align = "left",
			name = "suggested_card_bonus_label_" .. self._name,
			x = self._bonus_image.x(self._name) + slot23 + 10,
			y = self._bonus_image.y(slot23),
			w = self._challenge_card_panel.w(slot23) - self._bonus_image.w(self._challenge_card_panel) - 10,
			layer = self._challenge_card_panel.layer(self._bonus_image.w(self._challenge_card_panel)) + 1,
			text = bonus_description,
			font = tweak_data.gui.fonts.din_compressed,
			font_size = tweak_data.gui.font_sizes.small,
			color = tweak_data.gui.colors.raid_grey
		}
		slot25 = self._bonus_image
		slot23 = self._bonus_image.w(self._bonus_image)
		slot24 = self._bonus_image
		slot25 = self._bonus_image
		slot24 = self._challenge_card_panel
		self._bonus_label = self._object.label(slot19, self._object)
	end

	if malus_description and malus_description ~= "" then
		slot21 = {
			h = 64,
			w = 64,
			name = "suggested_card_malus_image_" .. self._name,
			x = self._challenge_card_panel.x(self._name),
			y = self._challenge_card_panel.y(self._name) + self._challenge_card_panel.h(self._challenge_card_panel) + 112,
			layer = self._challenge_card_panel.layer(self._challenge_card_panel.h(self._challenge_card_panel)) + 1,
			texture = tweak_data.gui.icons.ico_malus.texture,
			texture_rect = tweak_data.gui.icons.ico_malus.texture_rect
		}
		slot24 = self._challenge_card_panel
		slot25 = self._challenge_card_panel
		slot24 = self._challenge_card_panel
		self._malus_image = self._object.image(slot19, self._object)
		slot21 = {
			vertical = "top",
			h = 64,
			wrap = true,
			align = "left",
			name = "suggested_card_malus_label_" .. self._name,
			x = self._malus_image.x(self._name) + slot23 + 10,
			y = self._malus_image.y(slot23),
			w = self._challenge_card_panel.w(slot23) - self._bonus_image.w(self._challenge_card_panel) - 10,
			layer = self._challenge_card_panel.layer(self._bonus_image.w(self._challenge_card_panel)) + 1,
			text = malus_description,
			font = tweak_data.gui.fonts.din_compressed,
			font_size = tweak_data.gui.font_sizes.small,
			color = tweak_data.gui.colors.raid_grey
		}
		slot25 = self._malus_image
		slot23 = self._malus_image.w(self._malus_image)
		slot24 = self._malus_image
		slot25 = self._bonus_image
		slot24 = self._challenge_card_panel
		self._malus_label = self._object.label(slot19, self._object)
	end

	slot21 = {
		h = 30,
		align = "right",
		x = 10,
		name = "suggested_card_malus_label_" .. self._name,
		y = self._object.h(self._name) - 64,
		w = self._card_image.w(self._name),
		layer = self._challenge_card_panel.layer(self._name) + 1,
		text = utf8.to_upper(self._name),
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.small
	}
	slot24 = self._object
	slot24 = self._card_image
	slot24 = self._challenge_card_panel
	slot24 = self._item_data.peer_name
	self._peer_name_label = self._object.label(slot19, self._object)
	slot20 = self._peer_name_label
	slot23 = self._challenge_card_panel

	self._peer_name_label.set_right(slot19, self._challenge_card_panel.right(tweak_data.gui.font_sizes.small))

	if self._item_data and self._item_data.key_name == ChallengeCardsManager.CARD_PASS_KEY_NAME then
		slot20 = self

		self._show_pass_card_controls(slot19)
	end

	slot21 = false

	self._set_visible_selected_marker(slot19, self)

	return 
end
function RaidGUIControlCardSuggestedLarge:_refit_card_title_text(original_font_size)
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
function RaidGUIControlCardSuggestedLarge:_show_pass_card_controls()
	local empty_slot_texture = tweak_data.gui.icons.cc_empty_slot_small
	slot5 = empty_slot_texture.texture

	self._card_image.set_image(slot3, self._card_image)

	slot4 = self._card_image
	slot7 = empty_slot_texture.texture_rect

	self._card_image.set_texture_rect(slot3, unpack(slot6))

	slot5 = false

	self._type_icon.set_visible(slot3, self._type_icon)

	if self._rarity_icon then
		slot5 = false

		self._rarity_icon.set_visible(slot3, self._rarity_icon)
	end

	slot5 = false

	self._card_title.set_visible(slot3, self._card_title)

	slot5 = false

	self._xp_bonus.set_visible(slot3, self._xp_bonus)

	if self._item_data.key_name ~= ChallengeCardsManager.CARD_PASS_KEY_NAME then
		slot5 = false

		self._bonus_image.set_visible(slot3, self._bonus_image)

		slot5 = false

		self._malus_image.set_visible(slot3, self._malus_image)

		slot5 = false

		self._bonus_label.set_visible(slot3, self._bonus_label)

		slot5 = false

		self._malus_label.set_visible(slot3, self._malus_label)
	else
		slot5 = {
			name = "peer_name",
			h = 32,
			align = "center",
			x = 0,
			y = self._object.h(slot7) - 192,
			w = self._object.w(slot7),
			layer = self._challenge_card_panel.layer(slot7) + 1,
			text = utf8.to_upper(slot7),
			font = tweak_data.gui.fonts.din_compressed,
			font_size = tweak_data.gui.font_sizes.size_32,
			color = tweak_data.gui.colors.dirty_white
		}
		slot8 = self._object
		slot8 = self._object
		slot8 = self._challenge_card_panel
		local peer_name_label = self._object.label(slot3, self._object)
		slot6 = {
			name = "didnt_select_card_label",
			h = 24,
			align = "center",
			x = 0,
			y = peer_name_label.bottom(self._item_data.peer_name) + 16,
			w = self._object.w(self._item_data.peer_name),
			layer = self._challenge_card_panel.layer(self._item_data.peer_name) + 1,
			text = self.translate(self._item_data.peer_name, self, "menu_didnt_select_a_card"),
			font = tweak_data.gui.fonts.din_compressed,
			font_size = tweak_data.gui.font_sizes.size_24,
			color = tweak_data.gui.colors.raid_grey
		}
		slot9 = peer_name_label
		slot9 = self._object
		slot9 = self._challenge_card_panel
		slot11 = true

		self._object.label(self._object, self._object)
	end

	return 
end
function RaidGUIControlCardSuggestedLarge:_set_visible_selected_marker(flag)
	slot5 = flag

	self._select_marker_panel.set_visible(slot3, self._select_marker_panel)

	return 
end
function RaidGUIControlCardSuggestedLarge:select()
	self._selected = true

	if self._select_marker_panel then
		slot4 = true

		self._set_visible_selected_marker(slot2, self)
	end

	return 
end
function RaidGUIControlCardSuggestedLarge:unselect()
	self._selected = false

	if self._select_marker_panel then
		slot4 = false

		self._set_visible_selected_marker(slot2, self)
	end

	return 
end
function RaidGUIControlCardSuggestedLarge:selected()
	return self._selected
end
function RaidGUIControlCardSuggestedLarge:mouse_released(o, button, x, y)
	slot10 = y

	self.on_mouse_released(slot6, self, button, x)

	return 
end
function RaidGUIControlCardSuggestedLarge:on_mouse_released(button, x, y)
	slot6 = Network
	local is_host = Network.is_server(slot5)

	if not self._item_data or not is_host then
		return true
	end

	if self._item_selected_callback then
		slot7 = self._params.item_idx

		self._item_selected_callback(slot6)
	end

	if self._on_click_callback then
		local item_data = clone(slot6)
		slot8 = self

		if not self.selected(self._item_data) then
			item_data = nil
		end

		slot8 = item_data

		self._on_click_callback(slot7)
	end

	slot8 = "challenge_card_select"

	self._sound_source.post_event(slot6, self._sound_source)

	return true
end
function RaidGUIControlCardSuggestedLarge:on_mouse_over(x, y)
	slot7 = y

	RaidGUIControlCardSuggestedLarge.super.on_mouse_over(slot4, self, x)

	slot6 = "card_mouse_over"

	self._sound_source.post_event(slot4, self._sound_source)

	return 
end
function RaidGUIControlCardSuggestedLarge:close()
	return 
end

return 
