if not RaidGUIControlListItemRaids then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlListItemRaids = slot0
RaidGUIControlListItemRaids.HEIGHT = 94
RaidGUIControlListItemRaids.ICON_PADDING = 28
RaidGUIControlListItemRaids.ICON_CENTER_X = 48
RaidGUIControlListItemRaids.NAME_CENTER_Y = 34
RaidGUIControlListItemRaids.DIFFICULTY_CENTER_Y = 63
RaidGUIControlListItemRaids.LOCK_ICON = "ico_locker"
RaidGUIControlListItemRaids.LOCK_ICON_CENTER_DISTANCE_FROM_RIGHT = 43
RaidGUIControlListItemRaids.LOCKED_COLOR = tweak_data.gui.colors.raid_dark_grey
RaidGUIControlListItemRaids.UNLOCKED_COLOR = tweak_data.gui.colors.raid_dirty_white
function RaidGUIControlListItemRaids:init(parent, params, data)
	slot8 = params

	RaidGUIControlListItemRaids.super.init(slot5, self, parent)

	if not params.on_click_callback then
		slot8 = params.name

		Application.error(slot5, Application, "[RaidGUIControlListItemRaids:init] On click callback not specified for list item: ")
	end

	self._on_click_callback = params.on_click_callback
	self._on_item_selected_callback = params.on_item_selected_callback
	self._on_double_click_callback = params.on_double_click_callback
	self._data = data
	self._is_consumable = tweak_data.operations.missions[data.value].consumable ~= nil
	self._color = params.color or tweak_data.gui.colors.raid_white
	self._selected_color = params.selected_color or tweak_data.gui.colors.raid_red

	if not data.unlocked then
		slot8 = data.value
		slot4 = managers.progression.mission_unlocked(slot5, managers.progression, OperationsTweakData.JOB_TYPE_RAID)
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

	self._layout_raid_name(slot5, self, params)

	if not self._is_consumable then
		slot6 = self

		self._layout_difficulty_locked(slot5)

		slot6 = self

		self._layout_difficulty(slot5)

		slot6 = self

		self._layout_lock_icon(slot5)
	else
		slot6 = self

		self._layout_consumable_mission_label(slot5)
	end

	self._selectable = self._data.selectable
	self._selected = false

	if self._data.breadcrumb then
		slot6 = self

		self._layout_breadcrumb(slot5)
	end

	slot6 = self

	self.highlight_off(slot5)

	if not self._is_consumable then
		slot6 = self

		self._apply_progression_layout(slot5)
	end

	return 
end
function RaidGUIControlListItemRaids:_layout_panel(params)
	local panel_params = {
		name = "list_item_" .. self._name,
		x = params.x,
		y = params.y,
		w = params.w,
		h = RaidGUIControlListItemRaids.HEIGHT
	}
	slot6 = panel_params
	self._object = self._panel.panel(self._name, self._panel)

	return 
end
function RaidGUIControlListItemRaids:_layout_background(params)
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
function RaidGUIControlListItemRaids:_layout_highlight_marker()
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
function RaidGUIControlListItemRaids:_layout_icon(params, data)
	local icon_params = {
		name = "list_item_icon_" .. self._name,
		x = RaidGUIControlListItemRaids.ICON_PADDING,
		y = (RaidGUIControlListItemRaids.HEIGHT - data.icon.texture_rect[4]) / 2,
		texture = data.icon.texture,
		texture_rect = data.icon.texture_rect,
		color = tweak_data.gui.colors.raid_dirty_white
	}
	slot7 = icon_params
	self._item_icon = self._object.image(data.icon.texture_rect[4], self._object)
	slot7 = RaidGUIControlListItemRaids.ICON_CENTER_X

	self._item_icon.set_center_x(data.icon.texture_rect[4], self._item_icon)

	slot9 = self._object
	slot7 = self._object.h(slot8) / 2

	self._item_icon.set_center_y(data.icon.texture_rect[4], self._item_icon)

	return 
end
function RaidGUIControlListItemRaids:_layout_raid_name(params, data)
	local raid_name_params = {
		vertical = "center",
		y = 0,
		name = "list_item_label_" .. self._name
	}
	slot7 = self._item_icon
	raid_name_params.x = self._item_icon.x(self._name) + self._item_icon.w(self._item_icon) + RaidGUIControlListItemRaids.ICON_PADDING
	raid_name_params.w = params.w
	raid_name_params.h = params.h
	slot6 = data.text
	raid_name_params.text = utf8.to_upper(RaidGUIControlListItemRaids.ICON_PADDING)
	raid_name_params.font = tweak_data.gui.fonts.din_compressed
	raid_name_params.font_size = tweak_data.gui.font_sizes.small
	raid_name_params.color = tweak_data.gui.colors.raid_dirty_white
	slot7 = raid_name_params
	self._item_label = self._object.label(RaidGUIControlListItemRaids.ICON_PADDING, self._object)
	slot7 = RaidGUIControlListItemRaids.NAME_CENTER_Y

	self._item_label.set_center_y(RaidGUIControlListItemRaids.ICON_PADDING, self._item_label)

	return 
end
function RaidGUIControlListItemRaids:_layout_consumable_mission_label()
	local consumable_mission_label_params = {
		vertical = "center",
		name = "list_item_label_" .. self._name
	}
	slot5 = self._item_icon
	consumable_mission_label_params.x = self._item_icon.x(self._name) + self._item_icon.w(self._item_icon) + RaidGUIControlListItemRaids.ICON_PADDING
	slot6 = true
	consumable_mission_label_params.text = self.translate(RaidGUIControlListItemRaids.ICON_PADDING, self, "menu_mission_selected_mission_type_consumable")
	consumable_mission_label_params.font = tweak_data.gui.fonts.din_compressed
	consumable_mission_label_params.font_size = tweak_data.gui.font_sizes.extra_small
	consumable_mission_label_params.color = tweak_data.gui.colors.raid_gold
	slot5 = consumable_mission_label_params
	self._consumable_mission_label = self._object.text(RaidGUIControlListItemRaids.ICON_PADDING, self._object)
	slot4 = self._consumable_mission_label
	local _, _, w, h = self._consumable_mission_label.text_rect(RaidGUIControlListItemRaids.ICON_PADDING)
	slot9 = w

	self._consumable_mission_label.set_w(slot7, self._consumable_mission_label)

	slot9 = h

	self._consumable_mission_label.set_h(slot7, self._consumable_mission_label)

	slot9 = RaidGUIControlListItemRaids.DIFFICULTY_CENTER_Y

	self._consumable_mission_label.set_center_y(slot7, self._consumable_mission_label)

	slot8 = self._consumable_mission_label

	self._consumable_mission_label.stop(slot7)

	slot12 = "e4a13d"
	slot13 = 1.4

	self._consumable_mission_label.animate(slot7, self._consumable_mission_label, UIAnimation.animate_text_glow, Color(slot11), 0.55, 0.04)

	return 
end
function RaidGUIControlListItemRaids:_layout_difficulty_locked()
	local difficulty_locked_params = {
		text = "--",
		vertical = "center",
		name = "list_item_label_" .. self._name
	}
	slot5 = self._item_icon
	difficulty_locked_params.x = self._item_icon.x(self._name) + self._item_icon.w(self._item_icon) + RaidGUIControlListItemRaids.ICON_PADDING
	difficulty_locked_params.font = tweak_data.gui.fonts.din_compressed
	difficulty_locked_params.font_size = tweak_data.gui.font_sizes.extra_small
	difficulty_locked_params.color = tweak_data.gui.colors.raid_dark_grey
	slot5 = difficulty_locked_params
	self._difficulty_locked_indicator = self._object.label(RaidGUIControlListItemRaids.ICON_PADDING, self._object)
	slot4 = self._difficulty_locked_indicator
	local _, _, w, h = self._difficulty_locked_indicator.text_rect(RaidGUIControlListItemRaids.ICON_PADDING)
	slot9 = w

	self._difficulty_locked_indicator.set_w(slot7, self._difficulty_locked_indicator)

	slot9 = h

	self._difficulty_locked_indicator.set_h(slot7, self._difficulty_locked_indicator)

	slot9 = RaidGUIControlListItemRaids.DIFFICULTY_CENTER_Y

	self._difficulty_locked_indicator.set_center_y(slot7, self._difficulty_locked_indicator)

	return 
end
function RaidGUIControlListItemRaids:_layout_difficulty()
	local difficulty_params = {}
	slot5 = self._item_icon
	difficulty_params.x = self._item_icon.x(slot3) + self._item_icon.w(self._item_icon) + RaidGUIControlListItemRaids.ICON_PADDING
	slot4 = tweak_data
	difficulty_params.amount = tweak_data.number_of_difficulties(RaidGUIControlListItemRaids.ICON_PADDING)
	slot6 = difficulty_params
	self._difficulty_indicator = self._object.create_custom_control(RaidGUIControlListItemRaids.ICON_PADDING, self._object, RaidGuiControlDifficultyStars)
	slot5 = RaidGUIControlListItemRaids.DIFFICULTY_CENTER_Y

	self._difficulty_indicator.set_center_y(RaidGUIControlListItemRaids.ICON_PADDING, self._difficulty_indicator)

	return 
end
function RaidGUIControlListItemRaids:_layout_lock_icon()
	local lock_icon_params = {
		texture = tweak_data.gui.icons[RaidGUIControlListItemRaids.LOCK_ICON].texture,
		texture_rect = tweak_data.gui.icons[RaidGUIControlListItemRaids.LOCK_ICON].texture_rect,
		color = tweak_data.gui.colors.raid_dark_grey
	}
	slot5 = lock_icon_params
	self._lock_icon = self._object.bitmap(RaidGUIControlListItemRaids.LOCK_ICON, self._object)
	slot7 = self._object
	slot5 = self._object.w(slot6) - RaidGUIControlListItemRaids.LOCK_ICON_CENTER_DISTANCE_FROM_RIGHT

	self._lock_icon.set_center_x(RaidGUIControlListItemRaids.LOCK_ICON, self._lock_icon)

	slot7 = self._object
	slot5 = self._object.h(RaidGUIControlListItemRaids.LOCK_ICON_CENTER_DISTANCE_FROM_RIGHT) / 2

	self._lock_icon.set_center_y(RaidGUIControlListItemRaids.LOCK_ICON, self._lock_icon)

	return 
end
function RaidGUIControlListItemRaids:_layout_breadcrumb()
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
function RaidGUIControlListItemRaids:_apply_progression_layout()
	if self._unlocked then
		slot3 = self._lock_icon

		self._lock_icon.hide(slot2)

		slot3 = self._difficulty_locked_indicator

		self._difficulty_locked_indicator.hide(slot2)

		slot3 = self._difficulty_indicator

		self._difficulty_indicator.show(slot2)

		slot4 = RaidGUIControlListItemRaids.UNLOCKED_COLOR

		self._item_icon.set_color(slot2, self._item_icon)

		slot4 = RaidGUIControlListItemRaids.UNLOCKED_COLOR

		self._item_label.set_color(slot2, self._item_label)

		slot5 = self._data.value
		local difficulty_available, difficulty_completed = managers.progression.get_mission_progression(slot2, managers.progression, OperationsTweakData.JOB_TYPE_RAID)

		if difficulty_available and difficulty_completed then
			slot7 = difficulty_completed

			self._difficulty_indicator.set_progress(slot4, self._difficulty_indicator, difficulty_available)
		end
	else
		slot3 = self._lock_icon

		self._lock_icon.show(slot2)

		slot3 = self._difficulty_locked_indicator

		self._difficulty_locked_indicator.show(slot2)

		slot3 = self._difficulty_indicator

		self._difficulty_indicator.hide(slot2)

		slot4 = RaidGUIControlListItemRaids.LOCKED_COLOR

		self._item_icon.set_color(slot2, self._item_icon)

		slot4 = RaidGUIControlListItemRaids.LOCKED_COLOR

		self._item_label.set_color(slot2, self._item_label)
	end

	return 
end
function RaidGUIControlListItemRaids:on_mouse_released(button)
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
function RaidGUIControlListItemRaids:mouse_double_click(o, button, x, y)
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
function RaidGUIControlListItemRaids:selected()
	return self._selected
end
function RaidGUIControlListItemRaids:select()
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
function RaidGUIControlListItemRaids:unfocus()
	slot3 = self._item_background

	self._item_background.hide(slot2)

	slot3 = self._item_highlight_marker

	self._item_highlight_marker.hide(slot2)

	return 
end
function RaidGUIControlListItemRaids:unselect()
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
function RaidGUIControlListItemRaids:data()
	return self._data
end
function RaidGUIControlListItemRaids:highlight_on()
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
function RaidGUIControlListItemRaids:highlight_off()
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
function RaidGUIControlListItemRaids:confirm_pressed()
	if self._selected then
		slot4 = self._name

		self.on_mouse_released(slot2, self)

		return true
	end

	return 
end

return 
