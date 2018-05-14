if not RaidGUIControlReadyUpPlayerDescription then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlReadyUpPlayerDescription = slot0
function RaidGUIControlReadyUpPlayerDescription:init(parent, params)
	slot7 = params

	RaidGUIControlReadyUpPlayerDescription.super.init(slot4, self, parent)

	self._params = params
	slot6 = params
	self._object = self._panel.panel(slot4, self._panel)
	self._on_click_callback = params.on_click_callback
	slot5 = self

	self._layout(slot4)

	return 
end
function RaidGUIControlReadyUpPlayerDescription:_layout()
	local class_icon = tweak_data.gui.icons.ico_class_assault
	slot5 = {
		name = "class_icon",
		y = 32,
		x = 32,
		texture = class_icon.texture,
		texture_rect = class_icon.texture_rect
	}
	self._class_icon = self._object.bitmap(slot3, self._object)
	slot5 = {
		name = "player_name",
		vertical = "center",
		h = 26,
		w = 256,
		align = "left",
		text = "PLAYER NAME 1",
		x = self._class_icon.right(slot7) + 8,
		y = self._class_icon.top(slot7),
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.small,
		color = tweak_data.gui.colors.raid_dirty_white
	}
	slot8 = self._class_icon
	slot8 = self._class_icon
	self._player_name = self._object.label(slot3, self._object)
	slot5 = {
		name = "player_status",
		vertical = "center",
		h = 22,
		w = 256,
		align = "left",
		x = self._player_name.left(slot7),
		y = self._player_name.bottom(slot7) + 6,
		text = self.translate(slot7, self, "menu_not_ready"),
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.extra_small,
		color = tweak_data.gui.colors.raid_grey_effects
	}
	slot8 = self._player_name
	slot8 = self._player_name
	slot10 = true
	self._status_label = self._object.label(slot3, self._object)
	slot5 = {
		name = "selected_card_icon",
		x = 352,
		y = self._player_name.top(slot7),
		texture = tweak_data.gui.icons.ready_up_card_not_selected.texture,
		texture_rect = tweak_data.gui.icons.ready_up_card_not_selected.texture_rect
	}
	slot8 = self._player_name
	self._selected_card_icon = self._object.bitmap(slot3, self._object)
	slot5 = {
		name = "player_level",
		vertical = "center",
		h = 24,
		w = 64,
		align = "left",
		text = "17",
		x = self._selected_card_icon.right(slot7) + 16,
		y = self._player_name.top(slot7),
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.size_24,
		color = tweak_data.gui.colors.raid_dirty_white
	}
	slot8 = self._selected_card_icon
	slot8 = self._player_name
	self._player_level = self._object.label(slot3, self._object)
	slot5 = {
		name = "select_marker_rect",
		y = 0,
		x = 0,
		w = self._object.w(slot7),
		h = self._object.h(slot7),
		color = tweak_data.gui.colors.raid_select_card_background
	}
	slot8 = self._object
	slot8 = self._object
	self._select_marker_rect = self._object.rect(slot3, self._object)
	slot4 = self._select_marker_rect

	self._select_marker_rect.hide(slot3)

	slot5 = {
		y = 0,
		x = 0,
		w = RaidGUIControlCardSuggestedLarge.SELECT_TRINGLE_SIZE,
		h = RaidGUIControlCardSuggestedLarge.SELECT_TRINGLE_SIZE,
		texture = tweak_data.gui.icons.ico_sel_rect_top_left.texture,
		texture_rect = tweak_data.gui.icons.ico_sel_rect_top_left.texture_rect
	}
	self._top_select_triangle = self._object.image(slot3, self._object)
	slot4 = self._top_select_triangle

	self._top_select_triangle.hide(slot3)

	slot5 = {
		x = self._object.w(slot7) - RaidGUIControlCardSuggestedLarge.SELECT_TRINGLE_SIZE,
		y = self._object.h(RaidGUIControlCardSuggestedLarge.SELECT_TRINGLE_SIZE) - RaidGUIControlCardSuggestedLarge.SELECT_TRINGLE_SIZE,
		w = RaidGUIControlCardSuggestedLarge.SELECT_TRINGLE_SIZE,
		h = RaidGUIControlCardSuggestedLarge.SELECT_TRINGLE_SIZE,
		texture = tweak_data.gui.icons.ico_sel_rect_bottom_right.texture,
		texture_rect = tweak_data.gui.icons.ico_sel_rect_bottom_right.texture_rect
	}
	slot8 = self._object
	slot8 = self._object
	self._bottom_select_triangle = self._object.image(slot3, self._object)
	slot4 = self._bottom_select_triangle

	self._bottom_select_triangle.hide(slot3)

	return 
end
function RaidGUIControlReadyUpPlayerDescription:set_data(data)
	if not data then
		return 
	end

	if data.player_class then
		local class_icon = tweak_data.gui.icons["ico_class_" .. data.player_class]
		slot6 = class_icon.texture
		slot9 = class_icon.texture_rect

		self._class_icon.set_image(data.player_class, self._class_icon, unpack(slot8))
	end

	if data.player_name then
		slot4 = self._player_name
		slot7 = data.player_name

		self._player_name.set_text(slot3, utf8.to_upper(slot6))
	end

	if data.player_status then
		slot4 = self._status_label
		slot9 = true

		self._status_label.set_text(slot3, self.translate(slot6, self, "menu_" .. data.player_status))
	end

	if data.player_level then
		slot5 = data.player_level

		self._player_level.set_text(slot3, self._player_level)
	end

	if data.is_host then
		slot5 = {
			name = "host_icon",
			x = self._class_icon.left(slot7) + 28,
			y = self._class_icon.top(slot7) + 28,
			texture = tweak_data.gui.icons.player_panel_host_indicator.texture,
			texture_rect = tweak_data.gui.icons.player_panel_host_indicator.texture_rect
		}
		slot8 = self._class_icon
		slot8 = self._class_icon

		self._object.bitmap(slot3, self._object)
	end

	return 
end
function RaidGUIControlReadyUpPlayerDescription:params()
	return self._params
end
function RaidGUIControlReadyUpPlayerDescription:highlight_on()
	if not self._enabled then
		return 
	end

	slot3 = self._select_marker_rect

	self._select_marker_rect.show(slot2)

	if self._play_mouse_over_sound then
		slot4 = "highlight"

		managers.menu_component.post_event(slot2, managers.menu_component)

		self._play_mouse_over_sound = false
	end

	return 
end
function RaidGUIControlReadyUpPlayerDescription:highlight_off()
	if self._selected then
		return 
	end

	slot3 = self._select_marker_rect

	self._select_marker_rect.hide(slot2)

	self._play_mouse_over_sound = true

	return 
end
function RaidGUIControlReadyUpPlayerDescription:on_mouse_clicked()
	if not self._enabled then
		return 
	end

	if self._on_click_callback then
		slot4 = self._params

		self._on_click_callback(slot2, self)
	end

	slot3 = self

	self.select_on(slot2)

	return 
end
function RaidGUIControlReadyUpPlayerDescription:select_on()
	slot4 = true

	self.set_selected(slot2, self)

	slot3 = self._top_select_triangle

	self._top_select_triangle.show(slot2)

	slot3 = self._bottom_select_triangle

	self._bottom_select_triangle.show(slot2)

	return 
end
function RaidGUIControlReadyUpPlayerDescription:select_off()
	slot4 = false

	self.set_selected(slot2, self)

	slot3 = self._top_select_triangle

	self._top_select_triangle.hide(slot2)

	slot3 = self._bottom_select_triangle

	self._bottom_select_triangle.hide(slot2)

	return 
end
function RaidGUIControlReadyUpPlayerDescription:set_state(state)
	if state == "ready" then
		slot4 = self._status_label
		slot9 = true

		self._status_label.set_text(slot3, self.translate(slot6, self, "menu_ready"))

		slot5 = tweak_data.gui.colors.raid_red

		self._status_label.set_color(slot3, self._status_label)

		self._params.ready = true
	elseif state == "kicked" then
		slot4 = self._status_label
		slot9 = true

		self._status_label.set_text(slot3, self.translate(slot6, self, "menu_kicked"))

		slot5 = tweak_data.gui.colors.raid_grey_effects

		self._class_icon.set_color(slot3, self._class_icon)

		slot5 = tweak_data.gui.colors.raid_grey_effects

		self._player_name.set_color(slot3, self._player_name)

		slot5 = tweak_data.gui.colors.raid_grey_effects

		self._status_label.set_color(slot3, self._status_label)

		slot5 = tweak_data.gui.colors.raid_grey_effects

		self._selected_card_icon.set_color(slot3, self._selected_card_icon)

		slot5 = tweak_data.gui.colors.raid_grey_effects

		self._player_level.set_color(slot3, self._player_level)

		slot5 = false

		self.set_selected(slot3, self)

		self._enabled = false
	elseif state == "left" then
		slot4 = self._status_label
		slot9 = true

		self._status_label.set_text(slot3, self.translate(slot6, self, "menu_left"))

		slot5 = tweak_data.gui.colors.raid_grey_effects

		self._class_icon.set_color(slot3, self._class_icon)

		slot5 = tweak_data.gui.colors.raid_grey_effects

		self._player_name.set_color(slot3, self._player_name)

		slot5 = tweak_data.gui.colors.raid_grey_effects

		self._status_label.set_color(slot3, self._status_label)

		slot5 = tweak_data.gui.colors.raid_grey_effects

		self._selected_card_icon.set_color(slot3, self._selected_card_icon)

		slot5 = tweak_data.gui.colors.raid_grey_effects

		self._player_level.set_color(slot3, self._player_level)

		slot5 = false

		self.set_selected(slot3, self)

		self._enabled = false
	end

	return 
end
function RaidGUIControlReadyUpPlayerDescription:set_challenge_card_selected(selected)
	if selected then
		slot5 = tweak_data.gui.icons.ready_up_card_selected_active.texture
		slot8 = tweak_data.gui.icons.ready_up_card_selected_active.texture_rect

		self._selected_card_icon.set_image(slot3, self._selected_card_icon, unpack(slot7))
	else
		slot5 = tweak_data.gui.icons.ready_up_card_not_selected.texture
		slot8 = tweak_data.gui.icons.ready_up_card_not_selected.texture_rect

		self._selected_card_icon.set_image(slot3, self._selected_card_icon, unpack(slot7))
	end

	return 
end

return 
