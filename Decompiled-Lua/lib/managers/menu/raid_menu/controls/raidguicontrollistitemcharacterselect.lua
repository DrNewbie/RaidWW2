-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not RaidGUIControlListItemCharacterSelect then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlListItemCharacterSelect = slot0
RaidGUIControlListItemCharacterSelect.SLOTS = {
	{
		x = 417,
		y = 0
	},
	{
		x = 534,
		y = 0
	}
}
function RaidGUIControlListItemCharacterSelect:init(parent, params, item_data)
	slot9 = item_data

	RaidGUIControlListItemCharacterSelect.super.init(slot5, self, parent, params)

	self._character_slot = nil
	self._item_data = item_data
	self._on_click_callback = self._params.on_click_callback
	self._on_item_selected_callback = params.on_item_selected_callback
	self._on_double_click_callback = params.on_double_click_callback
	self.special_action_callback = self._params.special_action_callback

	if item_data and item_data.value then
		self._character_slot = item_data.value
		local slot_data = Global.savefile_manager.meta_data_list[item_data.value]

		if slot_data and slot_data.cache then
			self._item_data.cache = slot_data.cache
		end
	end

	slot7 = {
		x = self._params.x,
		y = self._params.y,
		w = self._params.w,
		h = self._params.h
	}
	self._object = self._panel.panel(slot5, self._panel)
	self._special_action_buttons = {}
	slot6 = self

	self._layout(slot5)

	slot6 = self

	self._load_data(slot5)

	return 
end
function RaidGUIControlListItemCharacterSelect:_layout()
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
	slot4 = {
		text = "",
		h = 28,
		y = 21,
		w = 272,
		x = 128,
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.medium,
		color = tweak_data.gui.colors.raid_white
	}
	self._profile_name_label = self._object.label(slot2, self._object)
	slot4 = {
		text = "",
		h = 22,
		y = 53,
		w = 272,
		x = 128,
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.extra_small,
		color = tweak_data.gui.colors.raid_grey
	}
	self._character_name_label = self._object.label(slot2, self._object)
	slot4 = {
		h = 64,
		y = 16,
		w = 95,
		x = 16,
		texture = tweak_data.gui.icons.ico_flag_empty.texture,
		texture_rect = tweak_data.gui.icons.ico_flag_empty.texture_rect
	}
	self._nationality_flag = self._object.image(slot2, self._object)

	return 
end
function RaidGUIControlListItemCharacterSelect:_load_data()
	slot5 = true
	local profile_name = self.translate(slot2, self, "character_selection_empty_slot")
	local character_nationality = nil
	local character_name = "---"
	local character_flag = nil

	if self._item_data.cache then
		profile_name = self._item_data.cache.PlayerManager.character_profile_name
		character_nationality = self._item_data.cache.PlayerManager.character_profile_nation
		slot9 = true
		character_name = self.translate(slot6, self, "menu_" .. character_nationality)
		character_flag = tweak_data.criminals.character_nation_name[character_nationality].flag_name
		slot9 = {
			visible = false,
			h = 94,
			y = 0,
			w = 116,
			x = 534,
			special_action_callback = self.special_action_callback,
			slot_index = self._character_slot
		}
		self._customize_button = self._object.create_custom_control(slot6, self._object, RaidGUIControlListItemCharacterSelectButton)
		slot8 = RaidGUIControlListItemCharacterSelectButton.BUTTON_TYPE_CUSTOMIZE

		self._customize_button.set_button(slot6, self._customize_button)

		slot8 = self._customize_button

		table.insert(slot6, self._special_action_buttons)

		slot9 = {
			visible = false,
			h = 94,
			y = 0,
			w = 116,
			x = 417,
			special_action_callback = self.special_action_callback,
			slot_index = self._character_slot
		}
		self._delete_button = self._object.create_custom_control(slot6, self._object, RaidGUIControlListItemCharacterSelectButton)
		slot8 = RaidGUIControlListItemCharacterSelectButton.BUTTON_TYPE_DELETE

		self._delete_button.set_button(slot6, self._delete_button)

		slot8 = self._delete_button

		table.insert(slot6, self._special_action_buttons)
	else
		slot9 = {
			visible = false,
			h = 94,
			y = 0,
			w = 116,
			x = 417,
			special_action_callback = self.special_action_callback,
			slot_index = self._character_slot
		}
		self._create_button = self._object.create_custom_control(slot6, self._object, RaidGUIControlListItemCharacterSelectButton)
		slot8 = RaidGUIControlListItemCharacterSelectButton.BUTTON_TYPE_CREATE

		self._create_button.set_button(slot6, self._create_button)

		slot8 = self._create_button

		table.insert(slot6, self._special_action_buttons)
	end

	slot7 = self._profile_name_label
	slot10 = profile_name

	self._profile_name_label.set_text(slot6, utf8.to_upper(slot9))

	slot7 = self._character_name_label
	slot10 = character_name

	self._character_name_label.set_text(slot6, utf8.to_upper(slot9))

	if character_flag then
		slot8 = tweak_data.gui.icons[character_flag].texture

		self._nationality_flag.set_image(slot6, self._nationality_flag)

		slot8 = tweak_data.gui.icons[character_flag].texture_rect

		self._nationality_flag.set_texture_rect(slot6, self._nationality_flag)
	end

	if character_nationality then
		slot8 = character_nationality

		self._layout_breadcrumb(slot6, self)
	end

	return 
end
function RaidGUIControlListItemCharacterSelect:_layout_breadcrumb(character_nationality)
	local breadcrumb_params = {
		category = BreadcrumbManager.CATEGORY_CHARACTER_CUSTOMIZATION,
		identifiers = {
			character_nationality
		}
	}
	slot6 = breadcrumb_params
	self._breadcrumb = self._object.breadcrumb(slot4, self._object)
	slot9 = self._background
	slot6 = self._background.x(slot7) + self._background.w(self._background)

	self._breadcrumb.set_right(slot4, self._breadcrumb)

	slot8 = self._object
	slot6 = self._object.h(self._background.w(self._background)) / 2

	self._breadcrumb.set_center_y(slot4, self._breadcrumb)

	return 
end
function RaidGUIControlListItemCharacterSelect:data()
	return self._item_data
end
function RaidGUIControlListItemCharacterSelect:inside(x, y)
	return slot3
end
function RaidGUIControlListItemCharacterSelect:highlight_on()
	slot3 = self._background

	self._background.show(slot2)

	return 
end
function RaidGUIControlListItemCharacterSelect:highlight_off()

	-- Decompilation error in this vicinity:
	if not self._selected and not self._active and self._background and self._red_selected_line and self._background then
		slot3 = self._background

		if alive(slot2) then
			slot4 = false

			self._background.set_visible(slot2, self._background)
		end
	end

	return 
end
function RaidGUIControlListItemCharacterSelect:activate_on()
	slot3 = self._background

	self._background.show(slot2)

	slot3 = self._red_selected_line

	self._red_selected_line.show(slot2)

	slot4 = tweak_data.gui.colors.raid_red

	self._profile_name_label.set_color(slot2, self._profile_name_label)

	slot4 = tweak_data.gui.colors.raid_red

	self._character_name_label.set_color(slot2, self._character_name_label)

	return 
end
function RaidGUIControlListItemCharacterSelect:activate_off()
	slot3 = self

	self.highlight_off(slot2)

	if self._red_selected_line then
		slot3 = self._red_selected_line

		if alive(slot2) then
			slot3 = self._red_selected_line

			self._red_selected_line.hide(slot2)
		end
	end

	if self._profile_name_label then
		slot3 = self._profile_name_label._object

		if alive(slot2) then
			slot4 = tweak_data.gui.colors.raid_white

			self._profile_name_label.set_color(slot2, self._profile_name_label)
		end
	end

	if self._character_name_label then
		slot3 = self._character_name_label._object

		if alive(slot2) then
			slot4 = tweak_data.gui.colors.raid_grey

			self._character_name_label.set_color(slot2, self._character_name_label)
		end
	end

	return 
end
function RaidGUIControlListItemCharacterSelect:mouse_released(o, button, x, y)
	if self._special_action_buttons then
		slot7 = self._special_action_buttons

		for _, special_button in ipairs(slot6) do
			slot14 = y

			if special_button.inside(slot11, special_button, x) then
				slot16 = y

				special_button.mouse_released(slot11, special_button, o, button, x)
			end
		end
	end

	slot9 = y

	if self.inside(slot6, self, x) then
		slot8 = button

		return self.on_mouse_released(slot6, self)
	end

	return 
end
function RaidGUIControlListItemCharacterSelect:on_mouse_released(button)
	if self._on_click_callback then
		slot7 = true

		self._on_click_callback(slot3, nil, self, self._character_slot)

		return true
	end

	return 
end
function RaidGUIControlListItemCharacterSelect:confirm_pressed()
	if not self._item_data or not self._item_data.cache then
		slot3 = self._create_button

		return self._create_button.on_mouse_released(slot2)
	end

	if self._on_double_click_callback then
		slot5 = self._character_slot

		self._on_double_click_callback(slot2, nil, self)

		return true
	end

	return 
end
function RaidGUIControlListItemCharacterSelect:mouse_double_click(o, button, x, y)
	if self._on_double_click_callback then
		slot9 = self._character_slot

		self._on_double_click_callback(slot6, nil, self)

		return true
	end

	return 
end
function RaidGUIControlListItemCharacterSelect:select(dont_trigger_selected_callback)
	self._selected = true
	slot4 = self

	self.highlight_on(slot3)

	if self._on_item_selected_callback and not dont_trigger_selected_callback then
		slot5 = self._character_slot

		self._on_item_selected_callback(slot3, self)
	end

	if self._customize_button and self._active then
		slot5 = true

		self._customize_button.set_visible(slot3, self._customize_button)
	end

	if self._delete_button then
		slot5 = true

		self._delete_button.set_visible(slot3, self._delete_button)
	end

	if self._create_button then
		slot5 = true

		self._create_button.set_visible(slot3, self._create_button)
	end

	if self._active then
		slot6 = 1

		self._set_button_slot(slot3, self, self._customize_button)

		slot6 = 2

		self._set_button_slot(slot3, self, self._delete_button)
	elseif not self._item_data.cache then
		slot6 = 1

		self._set_button_slot(slot3, self, self._create_button)
	else
		slot6 = 2

		self._set_button_slot(slot3, self, self._customize_button)

		slot6 = 1

		self._set_button_slot(slot3, self, self._delete_button)
	end

	return 
end
function RaidGUIControlListItemCharacterSelect:unselect()
	self._selected = false
	slot3 = self

	self.highlight_off(slot2)

	if self._delete_button then
		slot3 = self._delete_button._object._engine_panel

		if alive(slot2) then
			slot4 = false

			self._delete_button.set_visible(slot2, self._delete_button)
		end
	end

	if self._create_button then
		slot3 = self._create_button._object._engine_panel

		if alive(slot2) then
			slot4 = false

			self._create_button.set_visible(slot2, self._create_button)
		end
	end

	if self._customize_button then
		slot3 = self._customize_button._object._engine_panel

		if alive(slot2) then
			slot4 = false

			self._customize_button.set_visible(slot2, self._customize_button)
		end
	end

	return 
end
function RaidGUIControlListItemCharacterSelect:selected()
	return self._selected
end
function RaidGUIControlListItemCharacterSelect:activate()
	self._active = true
	slot3 = self

	self.activate_on(slot2)

	slot3 = self

	self.highlight_on(slot2)

	return 
end
function RaidGUIControlListItemCharacterSelect:deactivate()
	self._active = false
	slot3 = self

	self.activate_off(slot2)

	return 
end
function RaidGUIControlListItemCharacterSelect:activated()
	return self._active
end
function RaidGUIControlListItemCharacterSelect:empty()
	return not self._item_data or not self._item_data.cache
end
function RaidGUIControlListItemCharacterSelect:_set_button_slot(button_ref, slot_index)
	slot6 = RaidGUIControlListItemCharacterSelect.SLOTS[slot_index].x

	button_ref.set_x(slot4, button_ref)

	slot6 = RaidGUIControlListItemCharacterSelect.SLOTS[slot_index].y

	button_ref.set_y(slot4, button_ref)

	return 
end

return 
