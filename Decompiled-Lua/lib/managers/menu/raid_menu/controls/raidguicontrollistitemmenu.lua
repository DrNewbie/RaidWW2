if not RaidGUIControlListItemMenu then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlListItemMenu = slot0
function RaidGUIControlListItemMenu:init(parent, params, data)
	slot8 = params

	RaidGUIControlListItemMenu.super.init(slot5, self, parent)

	if not params.on_click_callback then
		slot8 = params.name

		Application.error(slot5, Application, "[RaidGUIControlListItemMenu:init] On click callback not specified for list item: ")
	end

	self._on_click_callback = params.on_click_callback
	self._on_item_selected_callback = params.on_item_selected_callback
	self._on_double_click_callback = params.on_double_click_callback
	self._data = data
	slot6 = self
	local font, font_size = self._get_font_desc(slot5)
	slot9 = {
		name = "list_item_object_" .. self._name,
		x = params.x,
		y = params.y,
		w = params.w,
		h = params.h
	}
	self._object = self._panel.panel(slot7, self._panel)
	slot9 = {
		vertical = "center",
		y = 0,
		x = 32,
		name = "list_item_label_" .. self._name,
		w = params.w,
		h = params.h,
		text = data.text,
		font = font,
		font_size = font_size,
		color = tweak_data.gui.colors.raid_white
	}
	self._item_label = self._object.label(slot7, self._object)
	slot9 = {
		y = 1,
		visible = false,
		x = 0,
		name = "list_item_back_" .. self._name,
		w = params.w,
		h = params.h - 2,
		color = tweak_data.gui.colors.raid_list_background,
		layer = self._item_label.layer(self._name) - 1
	}
	slot12 = self._item_label
	self._item_background = self._object.rect(slot7, self._object)
	slot9 = {
		y = 1,
		w = 3,
		visible = false,
		x = 0,
		name = "list_item_highlight_" .. self._name,
		h = params.h - 2,
		color = tweak_data.gui.colors.raid_red
	}
	self._item_highlight_marker = self._object.rect(slot7, self._object)

	if self._data and self._data.value and not self._data.value.unlocked then
		local ico_locker = tweak_data.gui.icons.ico_locker
		local text_rect = ico_locker.texture_rect
		slot11 = {
			name = "locker_icon",
			x = self._object.right(slot13) - 74,
			y = self._object.h(slot13) / 2 - text_rect[4] / 2,
			w = text_rect[3],
			h = text_rect[4],
			texture = ico_locker.texture,
			texture_rect = text_rect
		}
		slot14 = self._object
		slot14 = self._object

		self._object.image(slot9, self._object)
	end

	self._enabled = true

	if params and params.use_unlocked and self._data and self._data.value and not self._data.value.unlocked then
		self._on_click_callback = nil
		slot9 = tweak_data.gui.colors.raid_dark_grey

		self.disable(slot7, self)
	end

	if self._data.breadcrumb then
		slot8 = self

		self._layout_breadcrumb(slot7)
	end

	self._selectable = self._data.selectable
	self._selected = false
	slot8 = self

	self.highlight_off(slot7)

	return 
end
function RaidGUIControlListItemMenu:_layout_breadcrumb()
	slot4 = self._data.breadcrumb
	self._breadcrumb = self._object.breadcrumb(slot2, self._object)
	slot3 = self._breadcrumb
	slot6 = self._object

	self._breadcrumb.set_right(slot2, self._object.w(slot5))

	slot6 = self._object
	slot4 = self._object.h(slot5) / 2

	self._breadcrumb.set_center_y(slot2, self._breadcrumb)

	return 
end
function RaidGUIControlListItemMenu:_get_font_desc()
	return tweak_data.gui.fonts.din_compressed, tweak_data.gui.font_sizes.menu_list
end
function RaidGUIControlListItemMenu:on_mouse_released(button)
	if self._on_click_callback then
		slot6 = self._data

		self._on_click_callback(slot3, button, self)
	end

	if self._params.on_mouse_click_sound_event then
		slot5 = self._params.on_mouse_click_sound_event

		managers.menu_component.post_event(slot3, managers.menu_component)
	end

	if self._data.breadcrumb then
		slot6 = self._data.breadcrumb.identifiers

		managers.breadcrumb.remove_breadcrumb(slot3, managers.breadcrumb, self._data.breadcrumb.category)
	end

	return true
end
function RaidGUIControlListItemMenu:mouse_double_click(o, button, x, y)
	if self._params.no_click then
		return 
	end

	if self._on_double_click_callback then
		slot9 = self._character_slot

		self._on_double_click_callback(slot6, nil, self)

		return true
	end

	return 
end
function RaidGUIControlListItemMenu:selected()
	return self._selected
end
function RaidGUIControlListItemMenu:select(dont_trigger_selected_callback)
	if self._params.no_click then
		return 
	end

	self._selected = true
	slot4 = self

	self.highlight_on(slot3)

	if self._on_item_selected_callback and not dont_trigger_selected_callback then
		slot5 = self._data

		self._on_item_selected_callback(slot3, self)
	end

	if self._data.breadcrumb then
		slot6 = self._data.breadcrumb.identifiers

		managers.breadcrumb.remove_breadcrumb(slot3, managers.breadcrumb, self._data.breadcrumb.category)
	end

	return 
end
function RaidGUIControlListItemMenu:unselect()
	self._selected = false
	slot3 = self

	self.highlight_off(slot2)

	return 
end
function RaidGUIControlListItemMenu:data()
	return self._data
end
function RaidGUIControlListItemMenu:highlight_on()
	if self._params.no_highlight then
		return 
	end

	if self._params.on_mouse_over_sound_event then
		slot4 = self._params.on_mouse_over_sound_event

		managers.menu_component.post_event(slot2, managers.menu_component)
	end

	slot3 = self._item_background

	self._item_background.show(slot2)

	return 
end
function RaidGUIControlListItemMenu:highlight_off()
	if not self._selected and not self._active and self._item_background then
		slot3 = self._item_background

		if alive(slot2) and self._item_highlight_marker then
			slot3 = self._item_background

			self._item_background.hide(slot2)
		end
	end

	return 
end
function RaidGUIControlListItemMenu:enable(active_texture_color)
	self._enabled = true
	slot5 = active_texture_color

	self._item_label.set_color(slot3, self._item_label)

	slot6 = false

	self.set_param_value(slot3, self, "no_highlight")

	slot6 = false

	self.set_param_value(slot3, self, "no_click")

	return 
end
function RaidGUIControlListItemMenu:disable(inactive_texture_color)
	self._enabled = false
	slot5 = inactive_texture_color

	self._item_label.set_color(slot3, self._item_label)

	slot6 = true

	self.set_param_value(slot3, self, "no_highlight")

	slot6 = true

	self.set_param_value(slot3, self, "no_click")

	return 
end
function RaidGUIControlListItemMenu:enabled()
	return self._enabled
end
function RaidGUIControlListItemMenu:activate_on()
	slot3 = self._item_background

	self._item_background.show(slot2)

	slot3 = self._item_highlight_marker

	self._item_highlight_marker.show(slot2)

	slot4 = tweak_data.gui.colors.raid_red

	self._item_label.set_color(slot2, self._item_label)

	return 
end
function RaidGUIControlListItemMenu:activate_off()
	slot3 = self

	self.highlight_off(slot2)

	if self._item_highlight_marker then
		slot3 = self._item_highlight_marker

		if alive(slot2) then
			slot3 = self._item_highlight_marker

			self._item_highlight_marker.hide(slot2)
		end
	end

	if self._item_label then
		slot3 = self._item_label._object

		if alive(slot2) then
			slot4 = tweak_data.gui.colors.raid_white

			self._item_label.set_color(slot2, self._item_label)
		end
	end

	return 
end
function RaidGUIControlListItemMenu:activate()
	self._active = true
	slot3 = self

	self.activate_on(slot2)

	slot3 = self

	self.highlight_on(slot2)

	return 
end
function RaidGUIControlListItemMenu:deactivate()
	self._active = false
	slot3 = self

	self.activate_off(slot2)

	return 
end
function RaidGUIControlListItemMenu:activated()
	return self._active
end

return 
