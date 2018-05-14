if not RaidGUIControlListItemCharacterCreateClass then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlListItemCharacterCreateClass = slot0
function RaidGUIControlListItemCharacterCreateClass:init(parent, params, item_data)
	slot9 = item_data

	RaidGUIControlListItemCharacterCreateClass.super.init(slot5, self, parent, params)

	self._class_name = item_data.value
	self._data = item_data
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
function RaidGUIControlListItemCharacterCreateClass:_layout()
	local class_icon_data = tweak_data.gui.icons["ico_class_" .. self._class_name] or tweak_data.gui.icons.ico_flag_empty
	slot5 = {
		visible = false,
		y = 0,
		x = 0,
		w = self._params.w,
		h = self._params.h,
		color = tweak_data.gui.colors.raid_list_background
	}
	self._background = self._object.rect(slot3, self._object)
	slot5 = {
		visible = false,
		y = 0,
		w = 2,
		x = 0,
		h = self._params.h,
		color = tweak_data.gui.colors.raid_red
	}
	self._red_selected_line = self._object.rect(slot3, self._object)
	slot5 = {
		vertical = "center",
		h = 28,
		w = 174,
		align = "left",
		y = 34,
		x = 96,
		text = self.translate(slot7, self, tweak_data.skilltree.classes[self._class_name].name_id),
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.size_32,
		color = tweak_data.gui.colors.raid_dirty_white
	}
	slot10 = true
	self._class_name_label = self._object.label(slot3, self._object)
	slot8 = self._class_name_label
	slot5 = self._object.w(tweak_data.gui.colors.raid_dirty_white) - self._class_name_label.x(self._object)

	self._class_name_label.set_w(slot3, self._class_name_label)

	slot5 = {
		y = 20,
		x = 32,
		w = class_icon_data.texture_rect[3],
		h = class_icon_data.texture_rect[4],
		texture = class_icon_data.texture,
		texture_rect = class_icon_data.texture_rect
	}
	self._class_icon = self._object.image(slot3, self._object)
	slot5 = tweak_data.gui.colors.raid_dirty_white

	self._class_icon.set_color(slot3, self._class_icon)

	slot5 = 48

	self._class_icon.set_center_x(slot3, self._class_icon)

	slot7 = self._object
	slot5 = self._object.h(class_icon_data.texture_rect) / 2

	self._class_icon.set_center_y(slot3, self._class_icon)

	return 
end
function RaidGUIControlListItemCharacterCreateClass:data()
	return self._data
end
function RaidGUIControlListItemCharacterCreateClass:highlight_on()
	slot3 = self._background

	self._background.show(slot2)

	return 
end
function RaidGUIControlListItemCharacterCreateClass:highlight_off()
	if not self._selected and not self._active and self._background and self._red_selected_line then
		slot3 = self._background

		self._background.hide(slot2)

		slot3 = self._red_selected_line

		self._red_selected_line.hide(slot2)
	end

	return 
end
function RaidGUIControlListItemCharacterCreateClass:activate_on()
	slot3 = self._background

	self._background.show(slot2)

	slot3 = self._red_selected_line

	self._red_selected_line.show(slot2)

	if self._selected then
		slot4 = tweak_data.gui.colors.raid_red

		self._class_name_label.set_color(slot2, self._class_name_label)

		slot4 = tweak_data.gui.colors.raid_red

		self._class_icon.set_color(slot2, self._class_icon)
	else
		slot4 = tweak_data.gui.colors.raid_dirty_white

		self._class_name_label.set_color(slot2, self._class_name_label)

		slot4 = tweak_data.gui.colors.raid_dirty_white

		self._class_icon.set_color(slot2, self._class_icon)
	end

	return 
end
function RaidGUIControlListItemCharacterCreateClass:activate_off()
	slot3 = self

	self.highlight_off(slot2)

	if self._class_name_label then
		slot3 = self._class_name_label._object

		if alive(slot2) then
			slot4 = tweak_data.gui.colors.raid_dirty_white

			self._class_name_label.set_color(slot2, self._class_name_label)
		end
	end

	if self._class_icon then
		slot3 = self._class_icon._object

		if alive(slot2) then
			slot4 = tweak_data.gui.colors.raid_dirty_white

			self._class_icon.set_color(slot2, self._class_icon)
		end
	end

	return 
end
function RaidGUIControlListItemCharacterCreateClass:mouse_released(o, button, x, y)
	slot9 = y

	if self.inside(slot6, self, x) then
		slot8 = button

		return self.on_mouse_released(slot6, self)
	end

	return 
end
function RaidGUIControlListItemCharacterCreateClass:on_mouse_released(button)
	if self.on_click_callback then
		slot6 = self._data

		self.on_click_callback(slot3, button, self)

		return true
	end

	return 
end
function RaidGUIControlListItemCharacterCreateClass:select()
	self._selected = true
	slot4 = tweak_data.gui.colors.raid_red

	self._class_name_label.set_color(slot2, self._class_name_label)

	slot4 = tweak_data.gui.colors.raid_red

	self._class_icon.set_color(slot2, self._class_icon)

	if self._on_item_selected_callback then
		slot4 = self._data

		self._on_item_selected_callback(slot2, self)
	end

	return 
end
function RaidGUIControlListItemCharacterCreateClass:unselect()
	self._selected = false
	slot4 = tweak_data.gui.colors.raid_dirty_white

	self._class_name_label.set_color(slot2, self._class_name_label)

	slot4 = tweak_data.gui.colors.raid_dirty_white

	self._class_icon.set_color(slot2, self._class_icon)

	return 
end
function RaidGUIControlListItemCharacterCreateClass:selected()
	return self._selected
end
function RaidGUIControlListItemCharacterCreateClass:activate()
	self._active = true
	slot3 = self

	self.activate_on(slot2)

	slot3 = self

	self.highlight_on(slot2)

	return 
end
function RaidGUIControlListItemCharacterCreateClass:deactivate()
	self._active = false
	slot3 = self

	self.activate_off(slot2)

	return 
end
function RaidGUIControlListItemCharacterCreateClass:activated()
	return self._active
end
function RaidGUIControlListItemCharacterCreateClass:confirm_pressed()
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
function RaidGUIControlListItemCharacterCreateClass:mouse_double_click(o, button, x, y)
	if self._on_double_click_callback then
		slot9 = self._data

		self._on_double_click_callback(slot6, nil, self)

		return true
	end

	return 
end

return 
