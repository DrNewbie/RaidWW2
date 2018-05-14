if not RaidGUIControlListItemCharacterCreateNation then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlListItemCharacterCreateNation = slot0
function RaidGUIControlListItemCharacterCreateNation:init(parent, params, item_data)
	slot9 = item_data

	RaidGUIControlListItemCharacterCreateNation.super.init(slot5, self, parent, params)

	self._nation_name = item_data.value
	self._data = item_data
	self._character_name = item_data.text
	self.on_click_callback = self._params.on_click_callback
	self._on_double_click_callback = self._params.on_double_click_callback
	self._on_item_selected_callback = params.on_item_selected_callback
	slot7 = {
		x = self._params.x,
		y = self._params.y,
		w = self._params.w,
		h = self._params.h
	}
	self._object = self._panel.panel(slot5, self._panel)
	slot6 = self

	self._layout(slot5)

	return 
end
function RaidGUIControlListItemCharacterCreateNation:_layout()
	slot4 = {
		visible = false,
		y = 0,
		w = 416,
		x = 0,
		h = self._params.h,
		color = tweak_data.gui.colors.raid_list_background
	}
	self._background = self._object.rect(slot2, self._object)
	slot4 = {
		visible = false,
		y = 0,
		w = 2,
		x = 0,
		h = self._params.h,
		color = tweak_data.gui.colors.raid_red
	}
	self._red_selected_line = self._object.rect(slot2, self._object)
	slot5 = true
	local nationality_text = self.translate(slot2, self, "character_profile_creation_" .. self._nation_name)
	slot5 = {
		h = 32,
		y = 32,
		w = 272,
		x = 96,
		text = nationality_text,
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.size_32,
		color = tweak_data.gui.colors.raid_dirty_white
	}
	self._nation_name_label = self._object.label(self, self._object)
	slot8 = self._nation_name_label
	slot5 = self._object.w(tweak_data.gui.colors.raid_dirty_white) - self._nation_name_label.x(self._object)

	self._nation_name_label.set_w(self, self._nation_name_label)

	local nation_icon_data = tweak_data.gui.icons["character_creation_nationality_" .. self._nation_name] or tweak_data.gui.icons.ico_flag_empty
	local tex_rect = nation_icon_data.texture_rect
	slot7 = {
		y = 24,
		x = 22,
		w = tex_rect[3],
		h = tex_rect[4],
		texture = nation_icon_data.texture,
		texture_rect = tex_rect
	}
	self._nationality_icon = self._object.image(slot5, self._object)
	slot7 = 48

	self._nationality_icon.set_center_x(slot5, self._nationality_icon)

	slot9 = self._object
	slot7 = self._object.h(nation_icon_data.texture) / 2

	self._nationality_icon.set_center_y(slot5, self._nationality_icon)

	return 
end
function RaidGUIControlListItemCharacterCreateNation:data()
	return self._data
end
function RaidGUIControlListItemCharacterCreateNation:highlight_on()
	slot3 = self._background

	self._background.show(slot2)

	return 
end
function RaidGUIControlListItemCharacterCreateNation:highlight_off()
	if not self._selected and not self._active and self._background and self._red_selected_line then
		slot3 = self._background

		self._background.hide(slot2)

		slot3 = self._red_selected_line

		self._red_selected_line.hide(slot2)
	end

	return 
end
function RaidGUIControlListItemCharacterCreateNation:activate_on()
	slot3 = self._background

	self._background.show(slot2)

	slot3 = self._red_selected_line

	self._red_selected_line.show(slot2)

	if self._selected then
		slot4 = tweak_data.gui.colors.raid_red

		self._nation_name_label.set_color(slot2, self._nation_name_label)

		slot4 = tweak_data.gui.colors.raid_red

		self._nationality_icon.set_color(slot2, self._nationality_icon)
	else
		slot4 = tweak_data.gui.colors.raid_dirty_white

		self._nation_name_label.set_color(slot2, self._nation_name_label)

		slot4 = tweak_data.gui.colors.raid_dirty_white

		self._nationality_icon.set_color(slot2, self._nationality_icon)
	end

	return 
end
function RaidGUIControlListItemCharacterCreateNation:activate_off()
	slot3 = self

	self.highlight_off(slot2)

	if self._nation_name_label then
		slot3 = self._nation_name_label._object

		if alive(slot2) then
			slot4 = tweak_data.gui.colors.raid_dirty_white

			self._nation_name_label.set_color(slot2, self._nation_name_label)

			slot4 = tweak_data.gui.colors.raid_dirty_white

			self._nationality_icon.set_color(slot2, self._nationality_icon)
		end
	end

	return 
end
function RaidGUIControlListItemCharacterCreateNation:mouse_released(o, button, x, y)
	slot9 = y

	if self.inside(slot6, self, x) then
		slot8 = button

		return self.on_mouse_released(slot6, self)
	end

	return 
end
function RaidGUIControlListItemCharacterCreateNation:on_mouse_released(button)
	if self.on_click_callback then
		slot6 = self._data

		self.on_click_callback(slot3, button, self)

		return true
	end

	return 
end
function RaidGUIControlListItemCharacterCreateNation:select()
	self._selected = true
	slot4 = tweak_data.gui.colors.raid_red

	self._nation_name_label.set_color(slot2, self._nation_name_label)

	slot4 = tweak_data.gui.colors.raid_red

	self._nationality_icon.set_color(slot2, self._nationality_icon)

	if self._on_item_selected_callback then
		slot4 = self._data

		self._on_item_selected_callback(slot2, self)
	end

	return 
end
function RaidGUIControlListItemCharacterCreateNation:unselect()
	self._selected = false
	slot4 = tweak_data.gui.colors.raid_dirty_white

	self._nation_name_label.set_color(slot2, self._nation_name_label)

	slot4 = tweak_data.gui.colors.raid_dirty_white

	self._nationality_icon.set_color(slot2, self._nationality_icon)

	return 
end
function RaidGUIControlListItemCharacterCreateNation:selected()
	return self._selected
end
function RaidGUIControlListItemCharacterCreateNation:activate()
	self._active = true
	slot3 = self

	self.activate_on(slot2)

	slot3 = self

	self.highlight_on(slot2)

	return 
end
function RaidGUIControlListItemCharacterCreateNation:deactivate()
	self._active = false
	slot3 = self

	self.activate_off(slot2)

	return 
end
function RaidGUIControlListItemCharacterCreateNation:activated()
	return self._active
end
function RaidGUIControlListItemCharacterCreateNation:confirm_pressed()
	if not self._selected then
		return false
	end

	if self._on_double_click_callback then
		slot5 = self._data

		self._on_double_click_callback(slot2, nil, self)

		return true
	end

	return 
end
function RaidGUIControlListItemCharacterCreateNation:mouse_double_click(o, button, x, y)
	if self._on_double_click_callback then
		slot9 = self._data

		self._on_double_click_callback(slot6, nil, self)

		return true
	end

	return 
end

return 
