if not RaidGUIControlListItemCharacterSelectButton then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlListItemCharacterSelectButton = slot0
RaidGUIControlListItemCharacterSelectButton.BUTTON_TYPE_CUSTOMIZE = "button_customize"
RaidGUIControlListItemCharacterSelectButton.BUTTON_TYPE_DELETE = "button_delete"
RaidGUIControlListItemCharacterSelectButton.BUTTON_TYPE_CREATE = "button_create"
function RaidGUIControlListItemCharacterSelectButton:init(parent, params)
	slot7 = params

	RaidGUIControlListItemCharacterSelectButton.super.init(slot4, self, parent)

	slot6 = {
		visible = false,
		x = self._params.x,
		y = self._params.y,
		w = self._params.w,
		h = self._params.h
	}
	self._object = self._panel.panel(slot4, self._panel)
	self._special_action_callback = self._params.special_action_callback
	slot6 = {
		h = 94,
		y = 0,
		w = 116,
		x = 0,
		texture = tweak_data.gui.icons.btn_list_rect.texture,
		texture_rect = tweak_data.gui.icons.btn_list_rect.texture_rect,
		layer = self._object.layer(slot8)
	}
	slot9 = self._object
	self._background = self._object.image(slot4, self._object)
	slot6 = {
		h = 32,
		y = 16,
		w = 32,
		x = 43,
		texture = tweak_data.gui.icons.list_btn_ico_plus.texture,
		texture_rect = tweak_data.gui.icons.list_btn_ico_plus.texture_rect,
		layer = self._background.layer(slot8) + 1
	}
	slot9 = self._background
	self._icon = self._object.image(slot4, self._object)
	slot6 = {
		vertical = "center",
		h = 25,
		w = 116,
		align = "center",
		text = "",
		y = 60,
		x = 0,
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.keybinding,
		color = tweak_data.gui.colors.raid_black
	}
	self._label = self._object.label(slot4, self._object)

	return 
end
function RaidGUIControlListItemCharacterSelectButton:set_button(button_type)
	if button_type == RaidGUIControlListItemCharacterSelectButton.BUTTON_TYPE_CUSTOMIZE then
		slot5 = tweak_data.gui.icons.list_btn_ico_customize.texture

		self._icon.set_image(slot3, self._icon)

		slot5 = tweak_data.gui.icons.list_btn_ico_customize.texture_rect

		self._icon.set_texture_rect(slot3, self._icon)

		slot4 = self._label
		slot9 = true

		self._label.set_text(slot3, self.translate(slot6, self, "character_selection_button_customize"))

		self._button_type = RaidGUIControlListItemCharacterSelectButton.BUTTON_TYPE_CUSTOMIZE
	elseif button_type == RaidGUIControlListItemCharacterSelectButton.BUTTON_TYPE_DELETE then
		slot5 = tweak_data.gui.icons.list_btn_ico_x.texture

		self._icon.set_image(slot3, self._icon)

		slot5 = tweak_data.gui.icons.list_btn_ico_x.texture_rect

		self._icon.set_texture_rect(slot3, self._icon)

		slot4 = self._label
		slot9 = true

		self._label.set_text(slot3, self.translate(slot6, self, "character_selection_button_delete"))

		self._button_type = RaidGUIControlListItemCharacterSelectButton.BUTTON_TYPE_DELETE
	elseif button_type == RaidGUIControlListItemCharacterSelectButton.BUTTON_TYPE_CREATE then
		slot5 = tweak_data.gui.icons.list_btn_ico_plus.texture

		self._icon.set_image(slot3, self._icon)

		slot5 = tweak_data.gui.icons.list_btn_ico_plus.texture_rect

		self._icon.set_texture_rect(slot3, self._icon)

		slot4 = self._label
		slot9 = true

		self._label.set_text(slot3, self.translate(slot6, self, "character_selection_button_create"))

		self._button_type = RaidGUIControlListItemCharacterSelectButton.BUTTON_TYPE_CREATE
	end

	return 
end
function RaidGUIControlListItemCharacterSelectButton:highlight_on()
	slot4 = tweak_data.gui.icons.btn_list_rect_hover.texture

	self._background.set_image(slot2, self._background)

	slot4 = tweak_data.gui.icons.btn_list_rect_hover.texture_rect

	self._background.set_texture_rect(slot2, self._background)

	return 
end
function RaidGUIControlListItemCharacterSelectButton:highlight_off()
	slot4 = tweak_data.gui.icons.btn_list_rect.texture

	self._background.set_image(slot2, self._background)

	slot4 = tweak_data.gui.icons.btn_list_rect.texture_rect

	self._background.set_texture_rect(slot2, self._background)

	return 
end
function RaidGUIControlListItemCharacterSelectButton:mouse_released(o, button, x, y)
	slot7 = self

	return self.on_mouse_released(slot6)
end
function RaidGUIControlListItemCharacterSelectButton:on_mouse_released()
	if self._special_action_callback then
		slot4 = self._button_type

		self._special_action_callback(slot2, self._params.slot_index)

		return true
	end

	return 
end

return 
