if not RaidGUIControlListItemIcon then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlListItemIcon = slot0
RaidGUIControlListItemIcon.ICON_PADDING = 28
RaidGUIControlListItemIcon.ICON_WIDTH = 42
RaidGUIControlListItemIcon.ICON_HEIGHT = 42
function RaidGUIControlListItemIcon:init(parent, params, data)
	slot8 = params

	RaidGUIControlListItemIcon.super.init(slot5, self, parent)

	if not params.on_click_callback then
		slot8 = params.name

		Application.error(slot5, Application, "[RaidGUIControlListItemIcon:init] On click callback not specified for list item: ")
	end

	self._on_click_callback = params.on_click_callback
	self._on_item_selected_callback = params.on_item_selected_callback
	self._on_double_click_callback = params.on_double_click_callback
	self._data = data
	slot7 = {
		name = "list_item_" .. self._name,
		x = params.x,
		y = params.y,
		w = params.w,
		h = params.h
	}
	self._object = self._panel.panel(slot5, self._panel)
	self._color = params.color or tweak_data.gui.colors.raid_white
	self._selected_color = params.selected_color or tweak_data.gui.colors.raid_red
	slot7 = {
		name = "list_item_icon_" .. self._name,
		x = RaidGUIControlListItemIcon.ICON_PADDING,
		y = (params.h - RaidGUIControlListItemIcon.ICON_HEIGHT) / 2,
		w = RaidGUIControlListItemIcon.ICON_WIDTH,
		h = RaidGUIControlListItemIcon.ICON_HEIGHT,
		texture = data.icon.texture,
		texture_rect = data.icon.texture_rect,
		color = params.color or tweak_data.gui.colors.raid_white
	}
	self._item_icon = self._object.image(slot5, self._object)
	slot7 = {
		vertical = "center",
		y = 0,
		name = "list_item_label_" .. self._name,
		x = self._item_icon.x(self._name) + self._item_icon.w(self._item_icon) + RaidGUIControlListItemIcon.ICON_PADDING,
		w = params.w,
		h = params.h,
		text = data.text,
		font = tweak_data.gui.fonts.lato,
		font_size = tweak_data.gui.font_sizes.size_24,
		color = params.color or tweak_data.gui.colors.raid_white
	}
	slot11 = self._item_icon
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
		color = self._selected_color
	}
	self._item_highlight_marker = self._object.rect(slot5, self._object)
	self._selectable = self._data.selectable
	self._selected = false

	if self._data.breadcrumb then
		slot6 = self

		self._layout_breadcrumb(slot5)
	end

	slot6 = self

	self.highlight_off(slot5)

	return 
end
function RaidGUIControlListItemIcon:_layout_breadcrumb()
	local breadcrumb_params = {
		category = self._data.breadcrumb.category,
		identifiers = self._data.breadcrumb.identifiers
	}
	slot5 = breadcrumb_params
	self._breadcrumb = self._object.breadcrumb(slot3, self._object)
	slot4 = self._breadcrumb
	slot7 = self._object

	self._breadcrumb.set_right(slot3, self._object.w(slot6))

	slot7 = self._object
	slot5 = self._object.h(slot6) / 2

	self._breadcrumb.set_center_y(slot3, self._breadcrumb)

	return 
end
function RaidGUIControlListItemIcon:on_mouse_released(button)
	if self._data.breadcrumb then
		slot6 = self._data.breadcrumb.identifiers

		managers.breadcrumb.remove_breadcrumb(slot3, managers.breadcrumb, self._data.breadcrumb.category)
	end

	if self._on_click_callback then
		slot6 = self._data

		self._on_click_callback(slot3, button, self)
	end

	if self._params.list_item_selected_callback then
		slot4 = self._name

		self._params.list_item_selected_callback(slot3)
	end

	return 
end
function RaidGUIControlListItemIcon:mouse_double_click(o, button, x, y)
	if self._params.no_click then
		return 
	end

	if self._on_double_click_callback then
		slot9 = self._data

		self._on_double_click_callback(slot6, nil, self)

		return true
	end

	return 
end
function RaidGUIControlListItemIcon:selected()
	return self._selected
end
function RaidGUIControlListItemIcon:select()
	self._selected = true
	slot3 = self._item_background

	self._item_background.show(slot2)

	slot4 = self._selected_color

	self._item_label.set_color(slot2, self._item_label)

	slot3 = self._item_highlight_marker

	self._item_highlight_marker.show(slot2)

	if self._data.breadcrumb then
		slot5 = self._data.breadcrumb.identifiers

		managers.breadcrumb.remove_breadcrumb(slot2, managers.breadcrumb, self._data.breadcrumb.category)
	end

	if self._on_item_selected_callback then
		slot4 = self._data

		self._on_item_selected_callback(slot2, self)
	end

	return 
end
function RaidGUIControlListItemIcon:unfocus()
	slot3 = self._item_background

	self._item_background.hide(slot2)

	slot3 = self._item_highlight_marker

	self._item_highlight_marker.hide(slot2)

	return 
end
function RaidGUIControlListItemIcon:unselect()
	self._selected = false
	slot3 = self._item_background

	self._item_background.hide(slot2)

	slot4 = self._color

	self._item_label.set_color(slot2, self._item_label)

	slot3 = self._item_highlight_marker

	self._item_highlight_marker.hide(slot2)

	return 
end
function RaidGUIControlListItemIcon:data()
	return self._data
end
function RaidGUIControlListItemIcon:highlight_on()
	slot3 = self._item_background

	self._item_background.show(slot2)

	if self._selected then
		slot4 = self._selected_color

		self._item_label.set_color(slot2, self._item_label)
	else
		slot4 = self._color

		self._item_label.set_color(slot2, self._item_label)
	end

	return 
end
function RaidGUIControlListItemIcon:highlight_off()
	slot3 = managers.menu

	if not managers.menu.is_pc_controller(slot2) then
		slot3 = self._item_highlight_marker

		self._item_highlight_marker.hide(slot2)

		slot3 = self._item_background

		self._item_background.hide(slot2)
	end

	if not self._selected then
		slot3 = self._item_background

		self._item_background.hide(slot2)
	end

	return 
end
function RaidGUIControlListItemIcon:confirm_pressed()
	if self._selected then
		slot4 = self._name

		self.on_mouse_released(slot2, self)

		return true
	end

	return 
end

return 
