if not RaidGUIControlListItemOperations then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlListItemOperations = slot0
RaidGUIControlListItemOperations.HEIGHT = 94
RaidGUIControlListItemOperations.ICON_PADDING = 28
RaidGUIControlListItemOperations.ICON_CENTER_X = 48
RaidGUIControlListItemOperations.NAME_CENTER_Y = 34
RaidGUIControlListItemOperations.DIFFICULTY_CENTER_Y = 63
RaidGUIControlListItemOperations.LOCK_ICON = "ico_locker"
RaidGUIControlListItemOperations.LOCK_ICON_CENTER_DISTANCE_FROM_RIGHT = 43
RaidGUIControlListItemOperations.LOCKED_COLOR = tweak_data.gui.colors.raid_dark_grey
RaidGUIControlListItemOperations.UNLOCKED_COLOR = tweak_data.gui.colors.raid_dirty_white
function RaidGUIControlListItemOperations:init(parent, params, data)
	slot8 = params

	RaidGUIControlListItemOperations.super.init(slot5, self, parent)

	if not params.on_click_callback then
		slot8 = params.name

		Application.error(slot5, Application, "[RaidGUIControlListItemOperations:init] On click callback not specified for list item: ")
	end

	self._on_click_callback = params.on_click_callback
	self._on_item_selected_callback = params.on_item_selected_callback
	self._on_double_click_callback = params.on_double_click_callback
	self._data = data
	self._color = params.color or tweak_data.gui.colors.raid_white
	self._selected_color = params.selected_color or tweak_data.gui.colors.raid_red

	if not data.unlocked then
		slot8 = data.value
		slot4 = managers.progression.mission_unlocked(slot5, managers.progression, OperationsTweakData.JOB_TYPE_OPERATION)
	end

	self._unlocked = slot4
	self._mouse_over_sound = params.on_mouse_over_sound_event
	self._mouse_click_sound = params.on_mouse_click_sound_event
	slot7 = params

	self._layout_panel(slot5, self)

	slot7 = params

	self._layout_background(slot5, self)

	slot6 = self

	self._layout_highlight_marker(slot5)

	slot8 = data

	self._layout_icon(slot5, self, params)

	slot8 = data

	self._layout_operation_name(slot5, self, params)

	slot6 = self

	self._layout_difficulty(slot5)

	self._selectable = self._data.selectable
	self._selected = false

	if self._data.breadcrumb then
		slot6 = self

		self._layout_breadcrumb(slot5)
	end

	slot6 = self

	self.highlight_off(slot5)

	slot6 = self

	self._apply_progression_layout(slot5)

	return 
end
function RaidGUIControlListItemOperations:_layout_panel(params)
	local panel_params = {
		name = "list_item_" .. self._name,
		x = params.x,
		y = params.y,
		w = params.w,
		h = RaidGUIControlListItemOperations.HEIGHT
	}
	slot6 = panel_params
	self._object = self._panel.panel(self._name, self._panel)

	return 
end
function RaidGUIControlListItemOperations:_layout_background(params)
	local background_params = {
		y = 1,
		visible = false,
		x = 0,
		name = "list_item_back_" .. self._name,
		w = params.w
	}
	slot5 = self._object
	background_params.h = self._object.h(self._name) - 2
	background_params.color = tweak_data.gui.colors.raid_list_background
	slot6 = background_params
	self._item_background = self._object.rect(self._name, self._object)

	return 
end
function RaidGUIControlListItemOperations:_layout_highlight_marker()
	local marker_params = {
		y = 1,
		w = 3,
		visible = false,
		x = 0,
		name = "list_item_highlight_" .. self._name
	}
	slot4 = self._object
	marker_params.h = self._object.h(self._name) - 2
	marker_params.color = self._selected_color
	slot5 = marker_params
	self._item_highlight_marker = self._object.rect(self._name, self._object)

	return 
end
function RaidGUIControlListItemOperations:_layout_icon(params, data)
	local icon_params = {
		name = "list_item_icon_" .. self._name,
		x = RaidGUIControlListItemOperations.ICON_PADDING,
		y = (RaidGUIControlListItemOperations.HEIGHT - data.icon.texture_rect[4]) / 2,
		texture = data.icon.texture,
		texture_rect = data.icon.texture_rect,
		color = tweak_data.gui.colors.raid_dirty_white
	}
	slot7 = icon_params
	self._item_icon = self._object.image(data.icon.texture_rect[4], self._object)
	slot7 = RaidGUIControlListItemOperations.ICON_CENTER_X

	self._item_icon.set_center_x(data.icon.texture_rect[4], self._item_icon)

	slot9 = self._object
	slot7 = self._object.h(slot8) / 2

	self._item_icon.set_center_y(data.icon.texture_rect[4], self._item_icon)

	return 
end
function RaidGUIControlListItemOperations:_layout_operation_name(params, data)
	local raid_name_params = {
		vertical = "center",
		y = 0,
		name = "list_item_label_" .. self._name
	}
	slot7 = self._item_icon
	raid_name_params.x = self._item_icon.x(self._name) + self._item_icon.w(self._item_icon) + RaidGUIControlListItemOperations.ICON_PADDING
	raid_name_params.w = params.w
	raid_name_params.h = params.h
	slot6 = data.title
	raid_name_params.text = utf8.to_upper(RaidGUIControlListItemOperations.ICON_PADDING)
	raid_name_params.font = tweak_data.gui.fonts.din_compressed
	raid_name_params.font_size = tweak_data.gui.font_sizes.small
	raid_name_params.color = tweak_data.gui.colors.raid_dirty_white
	slot7 = raid_name_params
	self._item_label = self._object.label(RaidGUIControlListItemOperations.ICON_PADDING, self._object)
	slot7 = RaidGUIControlListItemOperations.NAME_CENTER_Y

	self._item_label.set_center_y(RaidGUIControlListItemOperations.ICON_PADDING, self._item_label)

	return 
end
function RaidGUIControlListItemOperations:_layout_difficulty()
	local difficulty_params = {}
	slot5 = self._item_icon
	difficulty_params.x = self._item_icon.x(slot3) + self._item_icon.w(self._item_icon) + RaidGUIControlListItemOperations.ICON_PADDING
	slot4 = tweak_data
	difficulty_params.amount = tweak_data.number_of_difficulties(RaidGUIControlListItemOperations.ICON_PADDING)
	slot6 = difficulty_params
	self._difficulty_indicator = self._object.create_custom_control(RaidGUIControlListItemOperations.ICON_PADDING, self._object, RaidGuiControlDifficultyStars)
	slot5 = RaidGUIControlListItemOperations.DIFFICULTY_CENTER_Y

	self._difficulty_indicator.set_center_y(RaidGUIControlListItemOperations.ICON_PADDING, self._difficulty_indicator)

	return 
end
function RaidGUIControlListItemOperations:_layout_breadcrumb()
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
function RaidGUIControlListItemOperations:_apply_progression_layout()
	if self._unlocked then
		slot3 = self._difficulty_indicator

		self._difficulty_indicator.show(slot2)

		slot4 = RaidGUIControlListItemOperations.UNLOCKED_COLOR

		self._item_icon.set_color(slot2, self._item_icon)

		slot4 = RaidGUIControlListItemOperations.UNLOCKED_COLOR

		self._item_label.set_color(slot2, self._item_label)

		slot5 = self._data.value
		local difficulty_available, difficulty_completed = managers.progression.get_mission_progression(slot2, managers.progression, OperationsTweakData.JOB_TYPE_OPERATION)

		if difficulty_available and difficulty_completed then
			slot7 = difficulty_completed

			self._difficulty_indicator.set_progress(slot4, self._difficulty_indicator, difficulty_available)
		end
	else
		slot3 = self._difficulty_indicator

		self._difficulty_indicator.hide(slot2)

		slot4 = RaidGUIControlListItemOperations.LOCKED_COLOR

		self._item_icon.set_color(slot2, self._item_icon)

		slot4 = RaidGUIControlListItemOperations.LOCKED_COLOR

		self._item_label.set_color(slot2, self._item_label)
	end

	return 
end
function RaidGUIControlListItemOperations:on_mouse_released(button)
	if self._data.breadcrumb then
		slot6 = self._data.breadcrumb.identifiers

		managers.breadcrumb.remove_breadcrumb(slot3, managers.breadcrumb, self._data.breadcrumb.category)
	end

	if self._mouse_click_sound then
		slot5 = self._mouse_click_sound

		managers.menu_component.post_event(slot3, managers.menu_component)
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
function RaidGUIControlListItemOperations:mouse_double_click(o, button, x, y)
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
function RaidGUIControlListItemOperations:selected()
	return self._selected
end
function RaidGUIControlListItemOperations:select()
	self._selected = true
	slot3 = self._item_background

	self._item_background.show(slot2)

	if self._unlocked then
		slot4 = self._selected_color

		self._item_label.set_color(slot2, self._item_label)
	end

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
function RaidGUIControlListItemOperations:unfocus()
	slot3 = self._item_background

	self._item_background.hide(slot2)

	slot3 = self._item_highlight_marker

	self._item_highlight_marker.hide(slot2)

	return 
end
function RaidGUIControlListItemOperations:unselect()
	self._selected = false
	slot3 = self._item_background

	self._item_background.hide(slot2)

	if self._unlocked then
		slot4 = self._color

		self._item_label.set_color(slot2, self._item_label)
	end

	slot3 = self._item_highlight_marker

	self._item_highlight_marker.hide(slot2)

	return 
end
function RaidGUIControlListItemOperations:data()
	return self._data
end
function RaidGUIControlListItemOperations:highlight_on()
	slot3 = self._item_background

	self._item_background.show(slot2)

	if self._mouse_over_sound then
		slot4 = self._mouse_over_sound

		managers.menu_component.post_event(slot2, managers.menu_component)
	end

	if not self._unlocked then
		return 
	end

	if self._selected then
		slot4 = self._selected_color

		self._item_label.set_color(slot2, self._item_label)
	else
		slot4 = self._color

		self._item_label.set_color(slot2, self._item_label)
	end

	return 
end
function RaidGUIControlListItemOperations:highlight_off()
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
function RaidGUIControlListItemOperations:confirm_pressed()
	if self._selected then
		slot4 = self._name

		self.on_mouse_released(slot2, self)

		return true
	end

	return 
end

return 
