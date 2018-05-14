if not RaidGUIControlBranchingBarSkilltreeNode then
	slot2 = RaidGUIControlBranchingBarNode
	slot0 = class(slot1)
end

RaidGUIControlBranchingBarSkilltreeNode = slot0
RaidGUIControlBranchingBarSkilltreeNode.DEFAULT_W = 70
RaidGUIControlBranchingBarSkilltreeNode.DEFAULT_H = 70
RaidGUIControlBranchingBarSkilltreeNode.PADDING_HORIZONTAL = 12
RaidGUIControlBranchingBarSkilltreeNode.PADDING_VERTICAL = 8
RaidGUIControlBranchingBarSkilltreeNode.SELECTOR_TRIANGLE_W = 16
RaidGUIControlBranchingBarSkilltreeNode.SELECTOR_TRIANGLE_H = 16
function RaidGUIControlBranchingBarSkilltreeNode:init(parent, params)
	params.w = RaidGUIControlBranchingBarSkilltreeNode.W
	params.h = RaidGUIControlBranchingBarSkilltreeNode.H
	local icon = tweak_data.skilltree.skills[params.value.skill].icon or "skill_placeholder"
	slot7 = icon
	params.w = tweak_data.gui.icon_w(slot5, tweak_data.gui) + 2 * RaidGUIControlBranchingBarSkilltreeNode.PADDING_HORIZONTAL
	slot7 = icon
	params.h = tweak_data.gui.icon_h(2 * RaidGUIControlBranchingBarSkilltreeNode.PADDING_HORIZONTAL, tweak_data.gui) + 2 * RaidGUIControlBranchingBarSkilltreeNode.PADDING_VERTICAL
	slot8 = params

	RaidGUIControlBranchingBarSkilltreeNode.super.init(2 * RaidGUIControlBranchingBarSkilltreeNode.PADDING_VERTICAL, self, parent)

	self._data = params.value
	slot6 = self

	self._create_selector(2 * RaidGUIControlBranchingBarSkilltreeNode.PADDING_VERTICAL)

	slot6 = self

	self._create_icon(2 * RaidGUIControlBranchingBarSkilltreeNode.PADDING_VERTICAL)

	self._on_click_callback = params.on_click_callback
	self._on_mouse_enter_callback = params.on_mouse_enter_callback
	self._on_mouse_exit_callback = params.on_mouse_exit_callback
	self._on_mouse_released_callback = params.on_node_mouse_released_callback
	self._on_mouse_pressed_callback = params.on_node_mouse_pressed_callback
	self._on_mouse_moved_callback = params.on_node_mouse_moved_callback
	slot6 = self

	self._init_state_data(2 * RaidGUIControlBranchingBarSkilltreeNode.PADDING_VERTICAL)

	slot6 = self

	self.refresh_current_state(2 * RaidGUIControlBranchingBarSkilltreeNode.PADDING_VERTICAL)

	slot6 = self

	self._layout_breadcrumb(2 * RaidGUIControlBranchingBarSkilltreeNode.PADDING_VERTICAL)

	return 
end
function RaidGUIControlBranchingBarSkilltreeNode:_layout_breadcrumb()
	local breadcrumb_params = {
		padding = 3,
		category = BreadcrumbManager.CATEGORY_RANK_REWARD,
		identifiers = {
			self._data.skill
		}
	}
	slot4 = self._icon
	breadcrumb_params.layer = self._icon.layer(self._data.skill) + 1
	slot5 = breadcrumb_params
	self._breadcrumb = self._object.breadcrumb(self._data.skill, self._object)
	slot4 = self._breadcrumb
	slot7 = self._object

	self._breadcrumb.set_right(self._data.skill, self._object.w(slot6))

	slot5 = 0

	self._breadcrumb.set_y(self._data.skill, self._breadcrumb)

	return 
end
function RaidGUIControlBranchingBarSkilltreeNode:_create_selector()
	local selector_panel_params = {
		halign = "scale",
		name = "selector_panel",
		y = 0,
		alpha = 0,
		x = 0,
		valign = "scale"
	}
	slot4 = self._object
	selector_panel_params.w = self._object.w(slot3)
	slot4 = self._object
	selector_panel_params.h = self._object.h(slot3)
	slot5 = selector_panel_params
	self._selector_panel = self._object.panel(slot3, self._object)
	local selector_background_params = {
		halign = "scale",
		name = "selector_background",
		alpha = 1,
		y = 0,
		x = 0,
		valign = "scale"
	}
	slot5 = self._selector_panel
	selector_background_params.w = self._selector_panel.w(self._object)
	slot5 = self._selector_panel
	selector_background_params.h = self._selector_panel.h(self._object)
	selector_background_params.color = tweak_data.gui.colors.raid_select_card_background
	slot6 = selector_background_params
	self._selector_rect = self._selector_panel.rect(self._object, self._selector_panel)
	local selector_triangle_up_params = {
		name = "selector_triangle_up",
		y = 0,
		alpha = 1,
		halign = "left",
		x = 0,
		valign = "top",
		w = RaidGUIControlBranchingBarSkilltreeNode.SELECTOR_TRIANGLE_W,
		h = RaidGUIControlBranchingBarSkilltreeNode.SELECTOR_TRIANGLE_H,
		texture = tweak_data.gui.icons.ico_sel_rect_top_left.texture,
		texture_rect = tweak_data.gui.icons.ico_sel_rect_top_left.texture_rect
	}
	slot7 = selector_triangle_up_params
	self._selector_triangle_up = self._selector_panel.image(self._selector_panel, self._selector_panel)
	local selector_triangle_down_params = {
		name = "selector_triangle_down",
		alpha = 1,
		halign = "right",
		valign = "bottom"
	}
	slot7 = self._selector_panel
	selector_triangle_down_params.x = self._selector_panel.w(self._selector_panel) - RaidGUIControlBranchingBarSkilltreeNode.SELECTOR_TRIANGLE_W
	slot7 = self._selector_panel
	selector_triangle_down_params.y = self._selector_panel.h(RaidGUIControlBranchingBarSkilltreeNode.SELECTOR_TRIANGLE_W) - RaidGUIControlBranchingBarSkilltreeNode.SELECTOR_TRIANGLE_H
	selector_triangle_down_params.w = RaidGUIControlBranchingBarSkilltreeNode.SELECTOR_TRIANGLE_W
	selector_triangle_down_params.h = RaidGUIControlBranchingBarSkilltreeNode.SELECTOR_TRIANGLE_H
	selector_triangle_down_params.texture = tweak_data.gui.icons.ico_sel_rect_bottom_right.texture
	selector_triangle_down_params.texture_rect = tweak_data.gui.icons.ico_sel_rect_bottom_right.texture_rect
	slot8 = selector_triangle_down_params
	self._selector_triangle_down = self._selector_panel.image(RaidGUIControlBranchingBarSkilltreeNode.SELECTOR_TRIANGLE_H, self._selector_panel)

	return 
end
function RaidGUIControlBranchingBarSkilltreeNode:_create_icon()
	local icon = tweak_data.skilltree.skills[self._data.skill].icon or "skill_placeholder"
	local icon_params = {
		name = "skill_icon",
		y = 0,
		halign = "scale",
		x = 0,
		valign = "scale"
	}
	slot6 = icon
	icon_params.w = tweak_data.gui.icon_w(slot4, tweak_data.gui)
	slot6 = icon
	icon_params.h = tweak_data.gui.icon_h(slot4, tweak_data.gui)
	icon_params.texture = tweak_data.gui.icons[icon].texture
	icon_params.texture_rect = tweak_data.gui.icons[icon].texture_rect
	slot5 = self._selector_panel
	icon_params.layer = self._selector_panel.layer(slot4) + 5
	slot6 = icon_params
	self._icon = self._object.image(slot4, self._object)
	slot9 = self._object
	slot7 = self._object.h(self._object) / 2

	self._icon.set_center(slot4, self._icon, self._object.w(slot7) / 2)

	return 
end
function RaidGUIControlBranchingBarSkilltreeNode:_init_state_data()
	self._state_data = {
		STATE_INACTIVE = {}
	}
	slot4 = "9e9e9e"
	slot5 = 0.7
	self._state_data.STATE_INACTIVE.color = Color(slot3).with_alpha(slot3, Color(slot3))
	self._state_data.STATE_INACTIVE.selector_opacity = 0
	self._state_data.STATE_INACTIVE.show_triangles = false
	self._state_data.STATE_HOVER = {
		color = Color.white,
		selector_opacity = 1,
		show_triangles = false
	}
	self._state_data.STATE_SELECTED = {
		color = Color.white,
		selector_opacity = 1,
		show_triangles = true
	}
	self._state_data.STATE_ACTIVE = {
		color = tweak_data.gui.colors.raid_red,
		selector_opacity = 0,
		show_triangles = false
	}
	self._state_data.STATE_PENDING = {
		color = Color.white,
		selector_opacity = 0,
		show_triangles = false
	}
	self._state_data.STATE_PENDING_BLOCKED = {}
	slot6 = 0.615686274509804
	self._state_data.STATE_PENDING_BLOCKED.color = Color(slot3, 0.8705882352941177, 0.615686274509804)
	self._state_data.STATE_PENDING_BLOCKED.selector_opacity = 0
	self._state_data.STATE_PENDING_BLOCKED.show_triangles = false
	self._state_data.STATE_DISABLED = {}
	slot4 = "9e9e9e"
	slot5 = 0.7
	self._state_data.STATE_DISABLED.color = Color(slot3).with_alpha(slot3, Color(slot3))
	self._state_data.STATE_DISABLED.selector_opacity = 0
	self._state_data.STATE_DISABLED.show_triangles = false

	return 
end
function RaidGUIControlBranchingBarSkilltreeNode:set_inactive()
	self._state = self.STATE_INACTIVE
	slot3 = self

	self.refresh_current_state(slot2)

	return 
end
function RaidGUIControlBranchingBarSkilltreeNode:set_hovered()
	slot4 = 1

	self._selector_panel.set_alpha(slot2, self._selector_panel)

	slot4 = true

	self._selector_rect.set_visible(slot2, self._selector_rect)

	return 
end
function RaidGUIControlBranchingBarSkilltreeNode:set_selected()
	self._state = self.STATE_SELECTED
	slot3 = self

	self.refresh_current_state(slot2)

	if self._breadcrumb then
		slot5 = {
			self._data.skill
		}

		managers.breadcrumb.remove_breadcrumb(slot2, managers.breadcrumb, BreadcrumbManager.CATEGORY_RANK_REWARD)
	end

	return 
end
function RaidGUIControlBranchingBarSkilltreeNode:set_active()
	self._state = self.STATE_ACTIVE
	slot3 = self

	self.refresh_current_state(slot2)

	return 
end
function RaidGUIControlBranchingBarSkilltreeNode:set_pending()
	self._state = self.STATE_PENDING
	slot3 = self

	self.refresh_current_state(slot2)

	return 
end
function RaidGUIControlBranchingBarSkilltreeNode:set_pending_blocked()
	self._state = self.STATE_PENDING_BLOCKED
	slot3 = self

	self.refresh_current_state(slot2)

	return 
end
function RaidGUIControlBranchingBarSkilltreeNode:set_disabled()
	self._state = self.STATE_DISABLED
	slot3 = self

	self.refresh_current_state(slot2)

	return 
end
function RaidGUIControlBranchingBarSkilltreeNode:refresh_current_state()
	slot4 = self._state_data[self._state].color

	self._icon.set_color(slot2, self._icon)

	slot4 = self._state_data[self._state].selector_opacity

	self._selector_panel.set_alpha(slot2, self._selector_panel)

	slot4 = self._state_data[self._state].show_triangles

	self._selector_triangle_up.set_visible(slot2, self._selector_triangle_up)

	slot4 = self._state_data[self._state].show_triangles

	self._selector_triangle_down.set_visible(slot2, self._selector_triangle_down)

	slot4 = false

	self._selector_rect.set_visible(slot2, self._selector_rect)

	self._data.state = self._state

	return 
end
function RaidGUIControlBranchingBarSkilltreeNode:init_to_state(state)
	slot5 = self._state_data[state].color

	self._icon.set_color(slot3, self._icon)

	slot4 = self

	self.refresh_current_state(slot3)

	return 
end
function RaidGUIControlBranchingBarSkilltreeNode:mouse_clicked(o, button, x, y)
	slot9 = y

	if self.inside(slot6, self, x) then
		slot8 = button

		self.on_mouse_clicked(slot6, self)

		return true
	end

	return false
end
function RaidGUIControlBranchingBarSkilltreeNode:on_mouse_clicked(button)
	if self._on_click_callback then
		slot5 = self._data

		self._on_click_callback(slot3, self)
	end

	return 
end
function RaidGUIControlBranchingBarSkilltreeNode:on_mouse_pressed()
	if self._on_mouse_pressed_callback then
		self._on_mouse_pressed_callback()
	end

	self._pressed = true

	if self._state == self.STATE_PENDING then
		slot3 = self._panel

		self._panel.stop(slot2)
	end

	return 
end
function RaidGUIControlBranchingBarSkilltreeNode:on_mouse_moved(o, x, y)
	if self._pressed and self._on_mouse_moved_callback then
		slot8 = y

		self._on_mouse_moved_callback(slot5, o, x)
	end

	return 
end
function RaidGUIControlBranchingBarSkilltreeNode:on_mouse_released()
	if self._on_mouse_released_callback then
		self._on_mouse_released_callback()
	end

	self._pressed = false

	return 
end
function RaidGUIControlBranchingBarSkilltreeNode:on_mouse_over(x, y)
	self._mouse_inside = true

	if self._on_mouse_enter_callback then
		slot6 = self._data

		self._on_mouse_enter_callback(slot4, self)
	end

	if self._breadcrumb then
		slot7 = {
			self._data.skill
		}

		managers.breadcrumb.remove_breadcrumb(slot4, managers.breadcrumb, BreadcrumbManager.CATEGORY_RANK_REWARD)
	end

	return 
end
function RaidGUIControlBranchingBarSkilltreeNode:on_mouse_out(x, y)
	self._mouse_inside = false

	if self._on_mouse_exit_callback then
		slot6 = self._data

		self._on_mouse_exit_callback(slot4, self)
	end

	return 
end
function RaidGUIControlBranchingBarSkilltreeNode:_animate_pressed()
	local t = 0
	local duration = 0.15
	slot5 = self._icon
	local starting_color = self._icon.color(slot4)

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot10 = duration
		local current_r = Easing.quintic_out(slot6, t, starting_color.r, self._state_data.STATE_ACTIVE.color.r - starting_color.r)
		slot11 = duration
		local current_g = Easing.quintic_out(t, t, starting_color.g, self._state_data.STATE_ACTIVE.color.g - starting_color.g)
		local current_b = Easing.quintic_out(t, t, starting_color.b, self._state_data.STATE_ACTIVE.color.b - starting_color.b)
		slot10 = self._icon
		slot15 = current_b

		self._icon.set_color(t, Color(duration, current_r, current_g))
	end

	slot7 = self._state_data.STATE_ACTIVE.color

	self._icon.set_color(slot5, self._icon)

	return 
end

return 
