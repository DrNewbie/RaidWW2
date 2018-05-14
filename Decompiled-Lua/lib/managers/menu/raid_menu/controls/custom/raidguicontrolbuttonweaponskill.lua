-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not RaidGUIControlButtonWeaponSkill then
	slot2 = RaidGUIControlButton
	slot0 = class(slot1)
end

RaidGUIControlButtonWeaponSkill = slot0
RaidGUIControlButtonWeaponSkill.STATE_NORMAL = "state_normal"
RaidGUIControlButtonWeaponSkill.STATE_CHALLENGE_ACTIVE = "state_challenge_active"
RaidGUIControlButtonWeaponSkill.STATE_SELECTED = "state_selected"
RaidGUIControlButtonWeaponSkill.STATE_ACTIVE = "state_active"
RaidGUIControlButtonWeaponSkill.STATE_BLOCKED = "state_blocked"
RaidGUIControlButtonWeaponSkill.STATE_UNAVAILABLE = "state_unavailable"
RaidGUIControlButtonWeaponSkill.STATE_HOVER = "state_hover"
RaidGUIControlButtonWeaponSkill.TIER_MARKER_X = 33
RaidGUIControlButtonWeaponSkill.TIER_MARKER_Y = 46
RaidGUIControlButtonWeaponSkill.ICON = "wpn_skill_blank"
RaidGUIControlButtonWeaponSkill.ICON_LOCKED = "wpn_skill_locked"
RaidGUIControlButtonWeaponSkill.ROMAN_NUMERALS = {
	" I",
	" II",
	" III",
	" IV"
}
RaidGUIControlButtonWeaponSkill.SELECTOR_TRIANGLE_W = 16
RaidGUIControlButtonWeaponSkill.SELECTOR_TRIANGLE_H = 16
RaidGUIControlButtonWeaponSkill.SELECTOR_SIZE_EXTENSION = 10
function RaidGUIControlButtonWeaponSkill:init(parent, params, tier_number, line_object, left_button)
	slot8 = self

	self._init_state_data(slot7)

	self._state = params.state or RaidGUIControlButtonWeaponSkill.STATE_NORMAL
	self._line_object = line_object
	slot8 = params
	local tier_marker_params = clone(slot7)
	tier_marker_params.x = params.x + RaidGUIControlButtonWeaponSkill.TIER_MARKER_X
	tier_marker_params.y = params.y + RaidGUIControlButtonWeaponSkill.TIER_MARKER_Y
	tier_marker_params.font = tweak_data.gui.fonts.din_compressed
	tier_marker_params.font_size = tweak_data.gui.font_sizes.size_16
	slot11 = true
	tier_marker_params.text = self.translate(RaidGUIControlButtonWeaponSkill.TIER_MARKER_Y, self, "menu_weapons_stats_tier_abbreviation") .. RaidGUIControlButtonWeaponSkill.ROMAN_NUMERALS[tier_number]
	local icon = RaidGUIControlButtonWeaponSkill.ICON_LOCKED
	params.texture = tweak_data.gui.icons[icon].texture
	params.texture_rect = tweak_data.gui.icons[icon].texture_rect
	self._on_selected_weapon_skill_callback = params.on_selected_weapon_skill_callback
	self._on_unselected_weapon_skill_callback = params.on_unselected_weapon_skill_callback
	self._get_available_points_callback = params.get_available_points_callback
	self._on_click_weapon_skill_callback = params.on_click_weapon_skill_callback
	self._toggle_select_item_callback = params.toggle_select_item_callback
	slot10 = params
	local new_params = clone(self)
	new_params.w = new_params.w + 2 * RaidGUIControlButtonWeaponSkill.SELECTOR_SIZE_EXTENSION
	new_params.h = new_params.h + 2 * RaidGUIControlButtonWeaponSkill.SELECTOR_SIZE_EXTENSION
	slot13 = new_params

	RaidGUIControlButtonWeaponSkill.super.init(2 * RaidGUIControlButtonWeaponSkill.SELECTOR_SIZE_EXTENSION, self, parent)

	if left_button then
		slot12 = self

		left_button.set_right_button(slot10, left_button)
	end

	slot12 = RaidGUIControlButtonWeaponSkill.SELECTOR_SIZE_EXTENSION

	self._object_image.set_x(slot10, self._object_image)

	slot12 = RaidGUIControlButtonWeaponSkill.SELECTOR_SIZE_EXTENSION

	self._object_image.set_y(slot10, self._object_image)

	slot12 = params.w

	self._object_image.set_w(slot10, self._object_image)

	slot12 = params.h

	self._object_image.set_h(slot10, self._object_image)

	slot11 = self

	self._create_selector(slot10)

	return 
end
function RaidGUIControlButtonWeaponSkill:_create_selector()
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
		alpha = 0,
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
		alpha = 0,
		halign = "left",
		x = 0,
		valign = "top",
		w = RaidGUIControlButtonWeaponSkill.SELECTOR_TRIANGLE_W,
		h = RaidGUIControlButtonWeaponSkill.SELECTOR_TRIANGLE_H,
		texture = tweak_data.gui.icons.ico_sel_rect_top_left.texture,
		texture_rect = tweak_data.gui.icons.ico_sel_rect_top_left.texture_rect
	}
	slot7 = selector_triangle_up_params
	self._selector_triangle_up = self._selector_panel.image(self._selector_panel, self._selector_panel)
	local selector_triangle_down_params = {
		name = "selector_triangle_down",
		alpha = 0,
		halign = "right",
		valign = "bottom"
	}
	slot7 = self._selector_panel
	selector_triangle_down_params.x = self._selector_panel.w(self._selector_panel) - RaidGUIControlButtonWeaponSkill.SELECTOR_TRIANGLE_W
	slot7 = self._selector_panel
	selector_triangle_down_params.y = self._selector_panel.h(RaidGUIControlButtonWeaponSkill.SELECTOR_TRIANGLE_W) - RaidGUIControlButtonWeaponSkill.SELECTOR_TRIANGLE_H
	selector_triangle_down_params.w = RaidGUIControlButtonWeaponSkill.SELECTOR_TRIANGLE_W
	selector_triangle_down_params.h = RaidGUIControlButtonWeaponSkill.SELECTOR_TRIANGLE_H
	selector_triangle_down_params.texture = tweak_data.gui.icons.ico_sel_rect_bottom_right.texture
	selector_triangle_down_params.texture_rect = tweak_data.gui.icons.ico_sel_rect_bottom_right.texture_rect
	slot8 = selector_triangle_down_params
	self._selector_triangle_down = self._selector_panel.image(RaidGUIControlButtonWeaponSkill.SELECTOR_TRIANGLE_H, self._selector_panel)

	return 
end
function RaidGUIControlButtonWeaponSkill:set_right_button(button)
	self._right_button = button

	return 
end
function RaidGUIControlButtonWeaponSkill:set_skill(weapon_id, skill, skill_data, left_skill, unlocked, i_tier, i_skill)
	self._unlocked = unlocked

	if not skill then
		slot10 = self

		self.hide(slot9)

		if self._line_object then
			slot10 = self._line_object

			self._line_object.hide(slot9)
		end

		return 
	else
		slot10 = self

		self.show(slot9)

		if self._line_object then
			slot10 = self._line_object

			self._line_object.show(slot9)
		end

		self._name = "weapon_skill_button_" .. skill.skill_name .. "_" .. i_tier .. "_" .. i_skill
	end

	if self._line_object then
		if not left_skill then
			slot10 = self._line_object

			self._line_object.hide(slot9)
		else
			slot10 = self._line_object

			self._line_object.show(slot9)
		end
	end

	if (left_skill and left_skill.active) or not left_skill then
		if skill.challenge_unlocked then
			slot12 = skill.challenge_id
			slot10 = managers.challenge.get_challenge(slot9, managers.challenge, ChallengeManager.CATEGORY_WEAPON_UPGRADE)
			slot8 = not managers.challenge.get_challenge(slot9, managers.challenge, ChallengeManager.CATEGORY_WEAPON_UPGRADE).completed(slot9)
		end
	else
		slot8 = false

		if false then
			local is_pending_challenge_active = true
		end
	end

	local icon = skill_data.icon or RaidGUIControlButtonWeaponSkill.ICON

	if not self._unlocked or (left_skill and not left_skill.active) then
		icon = RaidGUIControlButtonWeaponSkill.ICON_LOCKED
	end

	local texture = tweak_data.gui.icons[icon]
	slot14 = texture.texture

	self._object_image.set_image(slot12, self._object_image)

	slot13 = self._object_image
	slot16 = texture.texture_rect

	self._object_image.set_texture_rect(slot12, unpack(slot15))

	if skill.active then
		slot14 = RaidGUIControlButtonWeaponSkill.STATE_ACTIVE

		self.set_state(slot12, self)
	elseif self._unlocked and left_skill then
		slot15 = left_skill.challenge_id
		slot13 = managers.challenge.get_challenge(slot12, managers.challenge, ChallengeManager.CATEGORY_WEAPON_UPGRADE)
	elseif not self._unlocked or (left_skill and not left_skill.active) then
		slot14 = RaidGUIControlButtonWeaponSkill.STATE_UNAVAILABLE

		self.set_state(slot12, self)
	elseif is_pending_challenge_active then
		slot14 = RaidGUIControlButtonWeaponSkill.STATE_CHALLENGE_ACTIVE

		self.set_state(slot12, self)
	else
		slot14 = RaidGUIControlButtonWeaponSkill.STATE_NORMAL

		self.set_state(slot12, self)
	end

	self._data = {
		value = skill,
		i_tier = i_tier,
		i_skill = i_skill
	}
	slot13 = self

	self.highlight_off(slot12)

	slot16 = i_skill

	self._layout_breadcrumb(slot12, self, weapon_id, i_tier)

	return 
end
function RaidGUIControlButtonWeaponSkill:_layout_breadcrumb(weapon_id, i_tier, i_skill)
	if self._breadcrumb then
		slot6 = self._breadcrumb

		self._breadcrumb.close(slot5)

		slot7 = self._breadcrumb

		self._object.remove(slot5, self._object)

		self._breadcrumb = nil
	end

	local weapon_selection_index = tweak_data.weapon[weapon_id].use_data.selection_index
	local weapon_category = managers.weapon_inventory.get_weapon_category_name_by_bm_category_id(slot6, managers.weapon_inventory)
	local breadcrumb_params = {
		padding = 3,
		category = BreadcrumbManager.CATEGORY_WEAPON_UPGRADE,
		identifiers = {
			weapon_category,
			weapon_id,
			i_tier,
			i_skill
		}
	}
	slot9 = self._object_image
	breadcrumb_params.layer = self._object_image.layer(weapon_selection_index) + 1
	slot10 = breadcrumb_params
	self._breadcrumb = self._object.breadcrumb(weapon_selection_index, self._object)
	slot9 = self._breadcrumb
	slot12 = self._object

	self._breadcrumb.set_right(weapon_selection_index, self._object.w(slot11))

	slot10 = 0

	self._breadcrumb.set_y(weapon_selection_index, self._breadcrumb)

	return 
end
function RaidGUIControlButtonWeaponSkill:select_skill(dont_trigger_selected_callback)
	self._mouse_inside = true
	slot4 = self

	self.highlight_on(slot3)

	if not dont_trigger_selected_callback then
		slot5 = self._data

		self._on_selected_weapon_skill_callback(slot3, self)
	end

	return 
end
function RaidGUIControlButtonWeaponSkill:unselect_skill()
	self._mouse_inside = false
	slot3 = self

	self.highlight_off(slot2)

	slot4 = self._data

	self._on_unselected_weapon_skill_callback(slot2, self)

	return 
end
function RaidGUIControlButtonWeaponSkill:set_state(state)
	if not self._unlocked and state ~= RaidGUIControlButtonWeaponSkill.STATE_UNAVAILABLE then
		return 
	end

	self._state = state
	local color = self._state_data[self._state].highlight_off
	slot7 = color

	self.set_param_value(slot4, self, "color")

	slot7 = color

	self.set_param_value(slot4, self, "texture_color")

	local highlight_color = self._state_data[self._state].highlight_on
	slot8 = highlight_color

	self.set_param_value(self, self, "highlight_color")

	slot8 = highlight_color

	self.set_param_value(self, self, "texture_highlight_color")

	slot6 = self

	self.highlight_off(self)

	slot7 = self._state_data[state].show_selector_panel_alpha

	self._selector_panel.set_alpha(self, self._selector_panel)

	slot7 = 0

	self._selector_rect.set_alpha(self, self._selector_rect)

	slot7 = self._state_data[state].show_selector_triangles_alpha

	self._selector_triangle_up.set_alpha(self, self._selector_triangle_up)

	slot7 = self._state_data[state].show_selector_triangles_alpha

	self._selector_triangle_down.set_alpha(self, self._selector_triangle_down)

	return 
end
function RaidGUIControlButtonWeaponSkill:_init_state_data()
	self._state_data = {
		[RaidGUIControlButtonWeaponSkill.STATE_NORMAL] = {
			show_selector_triangles_alpha = 0,
			show_selector_panel_alpha = 1,
			highlight_off = tweak_data.gui.colors.raid_white,
			highlight_on = tweak_data.gui.colors.raid_white
		},
		[RaidGUIControlButtonWeaponSkill.STATE_CHALLENGE_ACTIVE] = {
			show_selector_triangles_alpha = 0,
			show_selector_panel_alpha = 1,
			highlight_off = tweak_data.gui.colors.raid_white,
			highlight_on = tweak_data.gui.colors.raid_white
		},
		[RaidGUIControlButtonWeaponSkill.STATE_BLOCKED] = {
			show_selector_triangles_alpha = 0,
			show_selector_panel_alpha = 1,
			highlight_off = tweak_data.gui.colors.raid_white,
			highlight_on = tweak_data.gui.colors.raid_white
		},
		[RaidGUIControlButtonWeaponSkill.STATE_SELECTED] = {
			show_selector_triangles_alpha = 1,
			show_selector_panel_alpha = 1,
			highlight_off = tweak_data.gui.colors.raid_white,
			highlight_on = tweak_data.gui.colors.raid_white
		},
		[RaidGUIControlButtonWeaponSkill.STATE_ACTIVE] = {
			show_selector_triangles_alpha = 0,
			show_selector_panel_alpha = 1,
			highlight_off = tweak_data.gui.colors.raid_red,
			highlight_on = tweak_data.gui.colors.raid_red
		},
		[RaidGUIControlButtonWeaponSkill.STATE_UNAVAILABLE] = {
			show_selector_triangles_alpha = 0,
			show_selector_panel_alpha = 0,
			highlight_off = tweak_data.gui.colors.raid_dark_grey,
			highlight_on = tweak_data.gui.colors.raid_dark_grey
		}
	}

	return 
end
function RaidGUIControlButtonWeaponSkill:get_state()
	return self._state
end
function RaidGUIControlButtonWeaponSkill:get_data()
	return self._data
end
function RaidGUIControlButtonWeaponSkill:highlight_on()
	local color = self._state_data[self._state].highlight_on
	slot5 = color

	self._object_image.set_color(slot3, self._object_image)

	if self._line_object then
		slot5 = color

		self._line_object.set_color(slot3, self._line_object)
	end

	slot5 = "weapon_increase"

	managers.menu_component.post_event(slot3, managers.menu_component)

	slot4 = self

	self.show_hover_selector(slot3)

	return 
end
function RaidGUIControlButtonWeaponSkill:highlight_off()
	local color = self._state_data[self._state].highlight_off
	slot5 = color

	self._object_image.set_color(slot3, self._object_image)

	if self._line_object then
		slot5 = color

		self._line_object.set_color(slot3, self._line_object)
	end

	slot4 = self

	self.hide_hover_selector(slot3)

	return 
end
function RaidGUIControlButtonWeaponSkill:show_hover_selector()
	if self._selector_panel then
		slot4 = 1

		self._selector_panel.set_alpha(slot2, self._selector_panel)

		slot4 = 1

		self._selector_rect.set_alpha(slot2, self._selector_rect)
	end

	return 
end
function RaidGUIControlButtonWeaponSkill:hide_hover_selector()
	if self._selector_panel then
		slot4 = 0

		self._selector_rect.set_alpha(slot2, self._selector_rect)
	end

	return 
end
function RaidGUIControlButtonWeaponSkill:on_mouse_released(button)
	if self._state == RaidGUIControlButtonWeaponSkill.STATE_ACTIVE and self._data.value.active then
		return 
	elseif self._state == RaidGUIControlButtonWeaponSkill.STATE_SELECTED then
		slot5 = RaidGUIControlButtonWeaponSkill.STATE_NORMAL

		self.set_state(slot3, self)

		slot5 = "weapon_upgrade_deselect"

		managers.menu_component.post_event(slot3, managers.menu_component)
	elseif self._state == RaidGUIControlButtonWeaponSkill.STATE_NORMAL then
		slot5 = RaidGUIControlButtonWeaponSkill.STATE_SELECTED

		self.set_state(slot3, self)

		slot5 = "weapon_upgrade_select"

		managers.menu_component.post_event(slot3, managers.menu_component)
	elseif self._state == RaidGUIControlButtonWeaponSkill.STATE_UNAVAILABLE then
		return 
	end

	if self._on_click_weapon_skill_callback then
		slot5 = self._data

		self._on_click_weapon_skill_callback(slot3, self)
	end

	slot4 = self

	self.show_hover_selector(slot3)

	return 
end
function RaidGUIControlButtonWeaponSkill:on_mouse_pressed(button)
	return 
end
function RaidGUIControlButtonWeaponSkill:mouse_moved(o, x, y)
	slot8 = y

	if self.inside(slot5, self, x) then
		if not self._mouse_inside then
			slot8 = y

			self.on_mouse_over(slot5, self, x)
		end

		slot9 = y

		self.on_mouse_moved(slot5, self, o, x)

		return true, self._pointer_type
	end

	if self._mouse_inside then
		slot8 = y

		self.on_mouse_out(slot5, self, x)
	end

	return false
end
function RaidGUIControlButtonWeaponSkill:propagating_skill_deallocating()
	if self._state == RaidGUIControlButtonWeaponSkill.STATE_SELECTED then
		slot4 = RaidGUIControlButtonWeaponSkill.STATE_NORMAL

		self.set_state(slot2, self)

		slot4 = self._data

		self._on_click_weapon_skill_callback(slot2, self)
	end

	slot4 = RaidGUIControlButtonWeaponSkill.STATE_UNAVAILABLE

	self.set_state(slot2, self)

	if self._right_button then
		slot3 = self._right_button

		self._right_button.propagating_skill_deallocating(slot2)
	end

	slot3 = self

	self._get_available_points_callback(slot2)

	return 
end
function RaidGUIControlButtonWeaponSkill:on_mouse_over(x, y)
	self._mouse_inside = true
	slot7 = self._data.i_tier

	self._toggle_select_item_callback(slot4, true, self._data.i_skill)

	return 
end
function RaidGUIControlButtonWeaponSkill:on_mouse_out(x, y)
	self._mouse_inside = false
	slot6 = "weapon_decrease"

	managers.menu_component.post_event(slot4, managers.menu_component)

	slot7 = self._data.i_tier

	self._toggle_select_item_callback(slot4, false, self._data.i_skill)

	return 
end

return 
