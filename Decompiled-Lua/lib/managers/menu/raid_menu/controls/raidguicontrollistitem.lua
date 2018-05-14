if not RaidGUIControlListItem then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlListItem = slot0
function RaidGUIControlListItem:init(parent, params, data)
	slot8 = params

	RaidGUIControlListItem.super.init(slot5, self, parent)

	if not params.on_click_callback then
		slot8 = params.name

		Application.error(slot5, Application, "[RaidGUIControlListItem:init] On click callback not specified for list item: ")
	end

	self._on_click_callback = params.on_click_callback
	self._on_double_click_callback = params.on_double_click_callback
	self._on_item_selected_callback = params.on_item_selected_callback
	self._data = data
	slot7 = {
		name = "list_item_" .. self._name,
		x = params.x,
		y = params.y,
		w = params.w,
		h = params.h
	}
	self._object = self._panel.panel(slot5, self._panel)
	slot7 = {
		vertical = "center",
		y = 0,
		x = 32,
		name = "list_item_label_" .. self._name,
		w = params.w,
		h = params.h,
		text = data.text,
		font = self._params.item_font or tweak_data.gui.fonts.din_compressed,
		font_size = self._params.item_font_size or tweak_data.gui.font_sizes.menu_list,
		color = params.color or tweak_data.gui.colors.raid_white
	}
	self._item_label = self._object.label(slot5, self._object)
	slot7 = {
		y = 1,
		visible = false,
		x = 0,
		name = "list_item_back_" .. self._name,
		w = params.w,
		h = params.h - 2,
		color = tweak_data.gui.colors.raid_list_background
	}
	self._item_background = self._object.rect(slot5, self._object)
	slot7 = {
		y = 1,
		w = 3,
		visible = false,
		x = 0,
		name = "list_item_highlight_" .. self._name,
		h = params.h - 2,
		color = tweak_data.gui.colors.raid_red
	}
	self._item_highlight_marker = self._object.rect(slot5, self._object)

	if params and params.use_unlocked and self._data and self._data.value and not self._data.value.unlocked then
		self._on_click_callback = nil
		self._on_double_click_callback = nil
		slot6 = self
		slot10 = 0.3

		RaidGUIControlListItem.super.disable(slot5, params.color.with_alpha(slot8, params.color))
	end

	if self._data.breadcrumb then
		slot6 = self

		self._layout_breadcrumb(slot5)
	end

	self._mouse_over_sound = params.on_mouse_over_sound_event
	self._click_sound = params.on_mouse_click_sound_event
	self._selectable = self._data.selectable
	self._selected = false
	slot6 = self

	self.highlight_off(slot5)

	return 
end
function RaidGUIControlListItem:_layout_breadcrumb()
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
function RaidGUIControlListItem:on_mouse_released(button)
	if self._on_click_callback then
		slot6 = self._data

		self._on_click_callback(slot3, button, self)
	end

	if self._data.breadcrumb then
		slot6 = self._data.breadcrumb.identifiers

		managers.breadcrumb.remove_breadcrumb(slot3, managers.breadcrumb, self._data.breadcrumb.category)
	end

	return 
end
function RaidGUIControlListItem:selected()
	return self._selected
end
function RaidGUIControlListItem:select(dont_trigger_selected_callback)
	self._selected = true
	slot4 = self

	self.highlight_on(slot3)

	slot4 = self._item_highlight_marker

	if alive(slot3) then
		slot4 = self._item_highlight_marker

		self._item_highlight_marker.show(slot3)
	end

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
function RaidGUIControlListItem:unfocus()
	slot4 = true

	self.unselect(slot2, self)

	return 
end
function RaidGUIControlListItem:unselect(force)
	self._selected = false
	slot5 = force

	self.highlight_off(slot3, self)

	slot4 = self._item_highlight_marker

	if alive(slot3) then
		slot4 = self._item_highlight_marker

		self._item_highlight_marker.hide(slot3)
	end

	return 
end
function RaidGUIControlListItem:data()
	return self._data
end
function RaidGUIControlListItem:highlight_on()
	slot3 = self._item_background

	if alive(slot2) then
		slot3 = self._item_background

		self._item_background.show(slot2)
	end

	if self._params.on_mouse_over_sound_event then
		slot4 = self._params.on_mouse_over_sound_event

		managers.menu_component.post_event(slot2, managers.menu_component)
	end

	return 
end
function RaidGUIControlListItem:highlight_off(force)
	if force or not self._selected then
		slot4 = self._item_background

		if alive(slot3) then
			slot4 = self._item_background

			self._item_background.hide(slot3)
		end
	end

	return 
end
function RaidGUIControlListItem:confirm_pressed(button)
	if self._selected then
		if self._on_click_callback then
			slot4 = self

			self.unselect(slot3)

			slot7 = true

			self._on_click_callback(slot3, button, self, self._data)

			return true
		end

		if self._params.list_item_selected_callback then
			slot4 = self

			self.unselect(slot3)

			slot4 = self._name

			self._params.list_item_selected_callback(slot3)

			return true
		end
	end

	return 
end

return 
