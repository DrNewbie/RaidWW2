if not RaidGUIControlServerPlayerDescription then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlServerPlayerDescription = slot0
function RaidGUIControlServerPlayerDescription:init(parent, params)
	slot7 = params

	RaidGUIControlServerPlayerDescription.super.init(slot4, self, parent)

	self._selected = false
	slot6 = params
	self._object = self._panel.panel(slot4, self._panel)
	slot5 = self

	self._create_selector(slot4)

	slot5 = self

	self._layout(slot4)

	self._on_selected_callback = params.on_selected_callback

	return 
end
function RaidGUIControlServerPlayerDescription:_create_selector()
	local selector_params = {
		name = "selector",
		visible = false,
		layer = 1,
		color = tweak_data.gui.colors.raid_list_background
	}
	slot5 = selector_params
	self._selector = self._object.rect(slot3, self._object)

	return 
end
function RaidGUIControlServerPlayerDescription:_layout()
	local class_icon = tweak_data.gui.icons.ico_class_assault
	slot5 = {
		name = "class_icon",
		y = 0,
		x = 0,
		texture = class_icon.texture,
		texture_rect = class_icon.texture_rect,
		layer = self._selector.layer(slot7) + 1
	}
	slot8 = self._selector
	self._class_icon = self._object.bitmap(slot3, self._object)
	slot4 = self._class_icon

	self._class_icon.hide(slot3)

	slot5 = {
		name = "player_name",
		vertical = "center",
		h = 64,
		w = 336,
		align = "left",
		text = "PLAYER NAME 1",
		y = 0,
		x = 80,
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.small,
		color = tweak_data.gui.colors.raid_dirty_white,
		layer = self._selector.layer(slot7) + 1
	}
	slot8 = self._selector
	self._player_name = self._object.label(slot3, self._object)
	slot4 = self._player_name

	self._player_name.hide(slot3)

	slot5 = {
		name = "player_class_nation",
		vertical = "center",
		h = 64,
		w = 336,
		align = "left",
		text = "INFILTRATOR  |  GERMAN",
		y = 32,
		x = 80,
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.extra_small,
		color = tweak_data.gui.colors.raid_grey_effects,
		layer = self._selector.layer(slot7) + 1
	}
	slot8 = self._selector
	self._player_class_nation = self._object.label(slot3, self._object)
	slot4 = self._player_class_nation

	self._player_class_nation.hide(slot3)

	slot5 = {
		name = "host_icon",
		y = 16,
		x = 416,
		texture = tweak_data.gui.icons.player_panel_host_indicator.texture,
		texture_rect = tweak_data.gui.icons.player_panel_host_indicator.texture_rect,
		layer = self._selector.layer(slot7) + 1
	}
	slot8 = self._selector
	self._host_icon = self._object.bitmap(slot3, self._object)
	slot4 = self._host_icon

	self._host_icon.hide(slot3)

	slot5 = {
		name = "player_level",
		vertical = "center",
		h = 64,
		w = 64,
		align = "right",
		text = "17",
		y = 0,
		x = 450,
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.small,
		color = tweak_data.gui.colors.raid_dirty_white,
		layer = self._selector.layer(slot7) + 1
	}
	slot8 = self._selector
	self._player_level = self._object.label(slot3, self._object)
	slot4 = self._player_level

	self._player_level.hide(slot3)

	return 
end
function RaidGUIControlServerPlayerDescription:set_data(data)
	if data == NetworkMatchMakingSTEAM.EMPTY_PLAYER_INFO or not data then
		slot4 = self

		self.hide(slot3)
	else
		slot4 = self

		self.show(slot3)

		slot5 = ","
		local data_list = string.split(slot3, data or "")
		local level = data_list[1] or ""
		local class = data_list[2] or ""
		local name = data_list[3] or ""
		local nationality = data_list[4] or ""
		local class_icon_data = tweak_data.gui.icons["ico_class_" .. class]

		if class_icon_data then
			slot11 = class_icon_data.texture
			slot14 = class_icon_data.texture_rect

			self._class_icon.set_image(slot9, self._class_icon, unpack(slot13))

			slot10 = self._class_icon

			self._class_icon.show(slot9)
		else
			slot10 = self._class_icon

			self._class_icon.hide(slot9)
		end

		slot11 = 32

		self._class_icon.set_center_x(slot9, self._class_icon)

		slot11 = 48

		self._class_icon.set_center_y(slot9, self._class_icon)

		slot10 = self._class_icon

		self._class_icon.show(slot9)

		slot10 = self._player_name
		slot13 = name

		self._player_name.set_text(slot9, utf8.to_upper(slot12))

		slot10 = self._player_name

		self._player_name.show(slot9)

		if class and tweak_data.skilltree.classes[class] and nationality then
			slot10 = self._player_class_nation
			slot17 = true
			slot19 = true
			slot13 = self.translate(slot14, self, tweak_data.skilltree.classes[class].name_id) .. "  |  " .. self.translate(tweak_data.skilltree.classes[class].name_id, self, "nationality_" .. nationality)

			self._player_class_nation.set_text(slot9, utf8.to_upper(slot12))

			slot10 = self._player_class_nation

			self._player_class_nation.show(slot9)
		else
			slot10 = self._player_class_nation

			self._player_class_nation.hide(slot9)
		end

		slot11 = level

		self._player_level.set_text(slot9, self._player_level)

		slot10 = self._player_level
		local x1, y1, w1, h1 = self._player_level.text_rect(slot9)
		slot15 = w1

		self._player_level.set_w(slot13, self._player_level)

		slot18 = self._class_icon
		slot15 = self._object.w(slot16) - self._class_icon.x(self._object)

		self._player_level.set_right(slot13, self._player_level)

		slot14 = self._player_level

		self._player_level.show(slot13)

		slot17 = self._player_level
		slot15 = self._player_level.x(self._class_icon.x(self._object)) - 12

		self._host_icon.set_right(slot13, self._host_icon)
	end

	return 
end
function RaidGUIControlServerPlayerDescription:set_host(flag)
	if flag then
		slot4 = self._host_icon

		self._host_icon.show(slot3)
	else
		slot4 = self._host_icon

		self._host_icon.hide(slot3)
	end

	return 
end
function RaidGUIControlServerPlayerDescription:set_selected(value)
	self._selected = value
	slot5 = self._selected

	self._selector.set_visible(slot3, self._selector)

	if self._selected and self._on_selected_callback then
		self._on_selected_callback()
	end

	return 
end
function RaidGUIControlServerPlayerDescription:show()
	slot3 = self._object

	self._object.show(slot2)

	return 
end
function RaidGUIControlServerPlayerDescription:hide()
	slot3 = self._object

	self._object.hide(slot2)

	return 
end
function RaidGUIControlServerPlayerDescription:confirm_pressed()
	if self._selected then
		slot3 = self._xuid

		RaidMenuCallbackHandler.view_gamer_card(slot2)
	end

	return 
end

return 
