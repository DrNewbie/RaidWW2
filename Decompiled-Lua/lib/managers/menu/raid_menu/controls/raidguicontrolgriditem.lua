if not RaidGUIControlGridItem then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlGridItem = slot0
RaidGUIControlGridItem.SELECT_TRINGLE_SIZE = 30
RaidGUIControlGridItem.LAYER_OBJECT = 30
RaidGUIControlGridItem.LAYER_ICON = 10
RaidGUIControlGridItem.LAYER_SELECTOR = 20
RaidGUIControlGridItem.LAYER_TRIANGE = 15
RaidGUIControlGridItem.STATUS_OWNED_OR_PURCHASED = "grid_item_status_owned_or_purchased"
RaidGUIControlGridItem.STATUS_LOCKED = "grid_item_status_locked"
RaidGUIControlGridItem.STATUS_PURCHASABLE = "grid_item_status_purchasable"
RaidGUIControlGridItem.STATUS_NOT_ENOUGHT_RESOURCES = "grid_item_status_not_enought_resources"
RaidGUIControlGridItem.STATUS_LOCKED_DLC = "grid_item_status_locked_dlc"
function RaidGUIControlGridItem:init(parent, params, item_data, grid_params)
	slot9 = params

	RaidGUIControlGridItem.super.init(slot6, self, parent)

	self._item_data = item_data
	slot9 = true
	self._object = self._panel.panel(slot6, self._panel, {
		name = "panel_grid_item",
		layer = 0,
		x = params.x,
		y = params.y,
		w = params.selected_marker_w,
		h = params.selected_marker_w
	})
	self._selected = false
	self._locked = false

	if self._params and self._params.item_clicked_callback then
		self._on_click_callback = self._params.item_clicked_callback
	end

	if self._params and self._params.item_double_clicked_callback then
		self._on_double_click_callback = self._params.item_double_clicked_callback
	end

	if self._params and self._params.item_selected_callback then
		self._on_selected_callback = self._params.item_selected_callback
	end

	slot5 = self._params

	if not params.selected_marker_w and not params.item_w then
		slot8 = self._panel
		slot6 = self._panel.w(slot7)
	end

	slot5.selected_marker_w = slot6
	slot5 = self._params

	if not params.selected_marker_h and not params.item_h then
		slot8 = self._panel
		slot6 = self._panel.h(slot7)
	end

	slot5.selected_marker_h = slot6
	slot5 = self._params

	if not params.item_w then
		slot8 = self._panel
		slot6 = self._panel.w(slot7)
	end

	slot5.item_w = slot6
	slot5 = self._params

	if not params.item_h then
		slot8 = self._panel
		slot6 = self._panel.h(slot7)
	end

	slot5.item_h = slot6
	self._name = "grid_item"
	local background_panel_params = {
		visible = false,
		y = 0,
		x = 0,
		layer = 1,
		w = self._params.selected_marker_w,
		h = self._params.selected_marker_h
	}
	local background_rect_params = {
		y = 0,
		x = 0,
		layer = 2,
		w = self._params.selected_marker_w,
		h = self._params.selected_marker_h
	}
	slot10 = 0.3
	background_rect_params.color = tweak_data.gui.colors.raid_grey.with_alpha(slot8, tweak_data.gui.colors.raid_grey)
	slot10 = background_panel_params
	self._select_background_panel = self._object.panel(slot8, self._object)
	slot10 = background_rect_params
	self._select_background = self._select_background_panel.rect(slot8, self._select_background_panel)
	slot10 = background_panel_params
	self._triangle_markers_panel = self._object.panel(slot8, self._object)
	slot10 = {
		y = 0,
		x = 0,
		w = RaidGUIControlGridItem.SELECT_TRINGLE_SIZE,
		h = RaidGUIControlGridItem.SELECT_TRINGLE_SIZE,
		color = tweak_data.gui.colors.gold_orange,
		texture = tweak_data.gui.icons.ico_sel_rect_top_left_white.texture,
		texture_rect = tweak_data.gui.icons.ico_sel_rect_top_left_white.texture_rect,
		layer = RaidGUIControlGridItem.LAYER_TRIANGE
	}
	self._top_marker_triangle = self._triangle_markers_panel.image(slot8, self._triangle_markers_panel)
	slot13 = self._triangle_markers_panel
	slot13 = self._triangle_markers_panel
	self._bottom_marker_triangle = self._triangle_markers_panel.image(slot8, self._triangle_markers_panel)
	local image_coord_x = (params.selected_marker_w - params.item_w) / 2
	local image_coord_y = (params.selected_marker_h - params.item_h) / 2
	slot12 = {
		name = "grid_item_icon",
		layer = 100,
		x = image_coord_x,
		y = image_coord_y,
		w = params.item_w,
		h = params.item_h,
		texture = self._item_data[self._params.grid_item_icon]
	}
	self._grid_item_icon = self._object.image({
		layer = 2,
		x = self._triangle_markers_panel.w(slot12) - RaidGUIControlGridItem.SELECT_TRINGLE_SIZE,
		y = self._triangle_markers_panel.h(RaidGUIControlGridItem.SELECT_TRINGLE_SIZE) - RaidGUIControlGridItem.SELECT_TRINGLE_SIZE,
		color = tweak_data.gui.colors.gold_orange,
		w = RaidGUIControlGridItem.SELECT_TRINGLE_SIZE,
		h = RaidGUIControlGridItem.SELECT_TRINGLE_SIZE,
		texture = tweak_data.gui.icons.ico_sel_rect_bottom_right_white.texture,
		texture_rect = tweak_data.gui.icons.ico_sel_rect_bottom_right_white.texture_rect
	}, self._object)
	slot12 = {
		name = "grid_item_resource_icon",
		y = 5,
		x = 100,
		layer = 200,
		color = tweak_data.gui.colors.gold_orange,
		texture = tweak_data.gui.icons.gold_amount_footer.texture,
		texture_rect = tweak_data.gui.icons.gold_amount_footer.texture_rect
	}
	self._item_status_resource_icon = self._object.image(, self._object)
	slot14 = self._grid_item_icon
	slot12 = self._grid_item_icon.right(tweak_data.gui.icons.gold_amount_footer.texture_rect) - 14

	self._item_status_resource_icon.set_right(, self._item_status_resource_icon)

	slot14 = self._grid_item_icon
	slot12 = self._grid_item_icon.bottom(tweak_data.gui.icons.gold_amount_footer.texture_rect) - 14

	self._item_status_resource_icon.set_bottom(, self._item_status_resource_icon)

	slot12 = {
		name = "grid_item_lock_icon",
		y = 5,
		x = 100,
		layer = 200,
		texture = tweak_data.gui.icons.ico_locker.texture,
		texture_rect = tweak_data.gui.icons.ico_locker.texture_rect
	}
	self._item_status_lock_icon = self._object.image(, self._object)
	slot14 = self._grid_item_icon
	slot12 = self._grid_item_icon.right(tweak_data.gui.icons.ico_locker.texture_rect) - 14

	self._item_status_lock_icon.set_right(, self._item_status_lock_icon)

	slot14 = self._grid_item_icon
	slot12 = self._grid_item_icon.bottom(tweak_data.gui.icons.ico_locker.texture_rect) - 14

	self._item_status_lock_icon.set_bottom(, self._item_status_lock_icon)

	slot12 = {
		name = "grid_item_dlc_lock_icon",
		y = 5,
		x = 100,
		layer = 200,
		texture = tweak_data.gui.icons.ico_dlc.texture,
		texture_rect = tweak_data.gui.icons.ico_dlc.texture_rect
	}
	self._item_status_dlc_lock = self._object.image(, self._object)
	slot14 = self._grid_item_icon
	slot12 = self._grid_item_icon.right(tweak_data.gui.icons.ico_dlc.texture_rect) - 14

	self._item_status_dlc_lock.set_right(, self._item_status_dlc_lock)

	slot14 = self._grid_item_icon
	slot12 = self._grid_item_icon.bottom(tweak_data.gui.icons.ico_dlc.texture_rect) - 14

	self._item_status_dlc_lock.set_bottom(, self._item_status_dlc_lock)

	slot11 = self

	self._toggle_visibility_status_icons()

	if self._item_data.breadcrumb then
		slot11 = self

		self._layout_breadcrumb(slot10)
	end

	return 
end
function RaidGUIControlGridItem:_layout_breadcrumb()
	local breadcrumb_params = {
		padding = 10,
		category = self._item_data.breadcrumb.category,
		identifiers = self._item_data.breadcrumb.identifiers
	}
	slot4 = self._grid_item_icon
	breadcrumb_params.layer = self._grid_item_icon.layer(slot3) + 1
	slot5 = breadcrumb_params
	self._breadcrumb = self._object.breadcrumb(slot3, self._object)
	slot4 = self._breadcrumb
	slot7 = self._object

	self._breadcrumb.set_right(slot3, self._object.w(slot6))

	slot5 = 0

	self._breadcrumb.set_y(slot3, self._breadcrumb)

	return 
end
function RaidGUIControlGridItem:_toggle_visibility_status_icons()
	if self._item_data.status == RaidGUIControlGridItem.STATUS_OWNED_OR_PURCHASED then
		slot3 = self._item_status_resource_icon

		self._item_status_resource_icon.hide(slot2)

		slot3 = self._item_status_lock_icon

		self._item_status_lock_icon.hide(slot2)

		slot3 = self._item_status_dlc_lock

		self._item_status_dlc_lock.hide(slot2)
	elseif self._item_data.status == RaidGUIControlGridItem.STATUS_LOCKED then
		slot3 = self._item_status_resource_icon

		self._item_status_resource_icon.hide(slot2)

		slot3 = self._item_status_lock_icon

		self._item_status_lock_icon.show(slot2)

		slot3 = self._item_status_dlc_lock

		self._item_status_dlc_lock.hide(slot2)
	elseif self._item_data.status == RaidGUIControlGridItem.STATUS_PURCHASABLE then
		slot3 = self._item_status_resource_icon

		self._item_status_resource_icon.show(slot2)

		slot3 = self._item_status_lock_icon

		self._item_status_lock_icon.hide(slot2)

		slot3 = self._item_status_dlc_lock

		self._item_status_dlc_lock.hide(slot2)
	elseif self._item_data.status == RaidGUIControlGridItem.STATUS_NOT_ENOUGHT_RESOURCES then
		slot3 = self._item_status_resource_icon

		self._item_status_resource_icon.show(slot2)

		slot3 = self._item_status_lock_icon

		self._item_status_lock_icon.hide(slot2)

		slot3 = self._item_status_dlc_lock

		self._item_status_dlc_lock.hide(slot2)
	elseif self._item_data.status == RaidGUIControlGridItem.STATUS_LOCKED_DLC then
		slot3 = self._item_status_resource_icon

		self._item_status_resource_icon.hide(slot2)

		slot3 = self._item_status_lock_icon

		self._item_status_lock_icon.hide(slot2)

		slot3 = self._item_status_dlc_lock

		self._item_status_dlc_lock.show(slot2)
	end

	return 
end
function RaidGUIControlGridItem:get_data()
	return self._item_data
end
function RaidGUIControlGridItem:mouse_released(o, button, x, y)
	slot8 = button

	self.on_mouse_released(slot6, self)

	return true
end
function RaidGUIControlGridItem:on_mouse_released(button)
	if self._on_click_callback then
		slot5 = self._params.key_value_field

		self._on_click_callback(slot3, self._item_data)
	end

	return 
end
function RaidGUIControlGridItem:mouse_double_click(o, button, x, y)
	slot8 = button

	self.on_mouse_double_click(slot6, self)

	return true
end
function RaidGUIControlGridItem:on_mouse_double_click(button)
	if self._on_double_click_callback then
		slot5 = self._params.key_value_field

		self._on_double_click_callback(slot3, self._item_data)
	end

	return 
end
function RaidGUIControlGridItem:selected()
	return self._selected
end
function RaidGUIControlGridItem:select(dont_fire_selected_callback)
	self._selected = true
	slot4 = self

	self.select_on(slot3)

	if self._item_data.breadcrumb then
		slot6 = self._item_data.breadcrumb.identifiers

		managers.breadcrumb.remove_breadcrumb(slot3, managers.breadcrumb, self._item_data.breadcrumb.category)
	end

	if self._on_selected_callback and not dont_fire_selected_callback then
		slot5 = self._item_data

		self._on_selected_callback(slot3, self._params.item_idx)
	end

	return 
end
function RaidGUIControlGridItem:unselect()
	self._selected = false
	slot3 = self

	self.select_off(slot2)

	return 
end
function RaidGUIControlGridItem:select_on()
	slot3 = self._select_background_panel

	self._select_background_panel.show(slot2)

	slot3 = self._triangle_markers_panel

	self._triangle_markers_panel.show(slot2)

	return 
end
function RaidGUIControlGridItem:select_off()
	slot3 = self._select_background_panel

	self._select_background_panel.hide(slot2)

	slot3 = self._triangle_markers_panel

	self._triangle_markers_panel.hide(slot2)

	return 
end
function RaidGUIControlGridItem:confirm_pressed()
	slot4 = nil

	self.on_mouse_released(slot2, self)

	return 
end

return 
