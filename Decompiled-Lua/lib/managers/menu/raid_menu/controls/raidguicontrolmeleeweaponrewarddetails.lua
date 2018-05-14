if not RaidGUIControlMeleeWeaponRewardDetails then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlMeleeWeaponRewardDetails = slot0
RaidGUIControlMeleeWeaponRewardDetails.DEFAULT_WIDTH = 400
RaidGUIControlMeleeWeaponRewardDetails.HEIGHT = 400
RaidGUIControlMeleeWeaponRewardDetails.LEFT_PANEL_W = 860
RaidGUIControlMeleeWeaponRewardDetails.FONT = tweak_data.gui.fonts.din_compressed
RaidGUIControlMeleeWeaponRewardDetails.TITLE_DESCRIPTION_Y = 690
RaidGUIControlMeleeWeaponRewardDetails.TITLE_DESCRIPTION_H = 50
RaidGUIControlMeleeWeaponRewardDetails.TITLE_DESCRIPTION_FONT_SIZE = tweak_data.gui.font_sizes.size_32
RaidGUIControlMeleeWeaponRewardDetails.TITLE_DESCRIPTION_COLOR = tweak_data.gui.colors.raid_white
RaidGUIControlMeleeWeaponRewardDetails.TITLE_PADDING_TOP = -14
RaidGUIControlMeleeWeaponRewardDetails.TITLE_FONT_SIZE = tweak_data.gui.font_sizes.size_76
RaidGUIControlMeleeWeaponRewardDetails.TITLE_COLOR = tweak_data.gui.colors.raid_red
RaidGUIControlMeleeWeaponRewardDetails.REWARD_ICON_PANEL_Y = 144
RaidGUIControlMeleeWeaponRewardDetails.REWARD_ICON_PANEL_H = 560
RaidGUIControlMeleeWeaponRewardDetails.REWARD_ICON = "rwd_weapon_large"
RaidGUIControlMeleeWeaponRewardDetails.ITEM_TYPE_Y = 224
RaidGUIControlMeleeWeaponRewardDetails.ITEM_TYPE_H = 72
RaidGUIControlMeleeWeaponRewardDetails.ITEM_TYPE_FONT_SIZE = tweak_data.gui.font_sizes.size_38
RaidGUIControlMeleeWeaponRewardDetails.ITEM_TYPE_COLOR = tweak_data.gui.colors.raid_white
RaidGUIControlMeleeWeaponRewardDetails.DESCRIPTION_Y = 304
RaidGUIControlMeleeWeaponRewardDetails.DESCRIPTION_W = 416
RaidGUIControlMeleeWeaponRewardDetails.DESCRIPTION_FONT = tweak_data.gui.fonts.lato
RaidGUIControlMeleeWeaponRewardDetails.DESCRIPTION_FONT_SIZE = tweak_data.gui.font_sizes.size_20
RaidGUIControlMeleeWeaponRewardDetails.DESCRIPTION_COLOR = tweak_data.gui.colors.raid_grey
RaidGUIControlMeleeWeaponRewardDetails.REDEEM_DESCRIPTION_CENTER_Y_FROM_BOTTOM = 192
RaidGUIControlMeleeWeaponRewardDetails.REDEEM_DESCRIPTION_FONT_SIZE = tweak_data.gui.font_sizes.size_32
RaidGUIControlMeleeWeaponRewardDetails.REDEEM_DESCRIPTION_COLOR = tweak_data.gui.colors.raid_white
RaidGUIControlMeleeWeaponRewardDetails.REDEEM_VALUE_CENTER_Y_FROM_BOTTOM = 148
RaidGUIControlMeleeWeaponRewardDetails.REDEEM_VALUE_FONT_SIZE = tweak_data.gui.font_sizes.size_56
RaidGUIControlMeleeWeaponRewardDetails.REDEEM_VALUE_COLOR = tweak_data.gui.colors.raid_red
RaidGUIControlMeleeWeaponRewardDetails.REDEEM_BUTTON_CENTER_Y_FROM_BOTTOM = 92
function RaidGUIControlMeleeWeaponRewardDetails:init(parent, params)
	slot7 = params

	RaidGUIControlMeleeWeaponRewardDetails.super.init(slot4, self, parent)

	if not params then
		slot6 = "[RaidGUIControlMeleeWeaponRewardDetails:init] Parameters not specified for the melee weapon reward details"

		Application.error(slot4, Application)

		return 
	end

	self._xp_redeem_value = tweak_data.weapon_skills.weapon_point_reedemed_xp
	slot5 = self

	self._create_control_panel(slot4)

	slot5 = self

	self._create_left_panel(slot4)

	slot5 = self

	self._create_title(slot4)

	slot5 = self

	self._create_reward_image(slot4)

	slot5 = self

	self._create_right_panel(slot4)

	slot5 = self

	self._create_description(slot4)

	slot5 = self

	self._create_item_title(slot4)

	return 
end
function RaidGUIControlMeleeWeaponRewardDetails:_create_control_panel()
	slot3 = self._params
	local control_params = clone(slot2)
	control_params.x = control_params.x
	control_params.w = control_params.w or RaidGUIControlMeleeWeaponRewardDetails.DEFAULT_WIDTH
	control_params.h = control_params.h or RaidGUIControlMeleeWeaponRewardDetails.HEIGHT
	control_params.name = control_params.name .. "_customization_panel"
	slot4 = self._panel
	control_params.layer = self._panel.layer("_customization_panel") + 1
	slot5 = control_params
	self._control_panel = self._panel.panel("_customization_panel", self._panel)
	self._object = self._control_panel

	return 
end
function RaidGUIControlMeleeWeaponRewardDetails:_create_left_panel()
	local left_panel_params = {
		name = "left_panel",
		w = RaidGUIControlMeleeWeaponRewardDetails.LEFT_PANEL_W
	}
	slot4 = self._object
	left_panel_params.h = self._object.h(slot3)
	slot5 = left_panel_params
	self._left_panel = self._object.panel(slot3, self._object)

	return 
end
function RaidGUIControlMeleeWeaponRewardDetails:_create_title()
	local title_description_params = {
		name = "title_description",
		vertical = "center",
		alpha = 0,
		align = "left",
		layer = 10,
		y = RaidGUIControlMeleeWeaponRewardDetails.TITLE_DESCRIPTION_Y,
		h = RaidGUIControlMeleeWeaponRewardDetails.TITLE_DESCRIPTION_H,
		font = RaidGUIControlMeleeWeaponRewardDetails.FONT,
		font_size = RaidGUIControlMeleeWeaponRewardDetails.TITLE_DESCRIPTION_FONT_SIZE,
		color = RaidGUIControlMeleeWeaponRewardDetails.TITLE_DESCRIPTION_COLOR
	}
	slot6 = true
	title_description_params.text = self.translate(slot3, self, "menu_loot_screen_bracket_unlocked_title")
	slot5 = title_description_params
	self._title_description = self._left_panel.text(slot3, self._left_panel)
	slot4 = self._title_description
	local _, _, w, _ = self._title_description.text_rect(slot3)
	slot9 = w

	self._title_description.set_w(slot7, self._title_description)

	local title_params = {
		vertical = "top",
		name = "customization_name",
		alpha = 0,
		wrap = true,
		align = "left",
		layer = 10
	}
	slot10 = self._title_description
	title_params.y = self._title_description.y(self._title_description) + self._title_description.h(self._title_description) + RaidGUIControlMeleeWeaponRewardDetails.TITLE_PADDING_TOP
	title_params.font = RaidGUIControlMeleeWeaponRewardDetails.FONT
	title_params.font_size = RaidGUIControlMeleeWeaponRewardDetails.TITLE_FONT_SIZE
	title_params.color = RaidGUIControlMeleeWeaponRewardDetails.TITLE_COLOR
	slot11 = true
	title_params.text = self.translate(RaidGUIControlMeleeWeaponRewardDetails.TITLE_PADDING_TOP, self, "menu_loot_screen_melee_weapon")
	slot9 = self._left_panel
	title_params.w = self._left_panel.w(RaidGUIControlMeleeWeaponRewardDetails.TITLE_PADDING_TOP) * 0.8
	slot10 = title_params
	self._melee_weapon_name = self._left_panel.text(RaidGUIControlMeleeWeaponRewardDetails.TITLE_PADDING_TOP, self._left_panel)
	slot9 = self

	self._layout_title(RaidGUIControlMeleeWeaponRewardDetails.TITLE_PADDING_TOP)

	return 
end
function RaidGUIControlMeleeWeaponRewardDetails:_layout_title()
	slot3 = self._melee_weapon_name
	local _, _, w, h = self._melee_weapon_name.text_rect(slot2)
	slot8 = h

	self._melee_weapon_name.set_h(slot6, self._melee_weapon_name)

	slot10 = self._left_panel
	slot8 = self._left_panel.w(slot9) / 2

	self._melee_weapon_name.set_center_x(slot6, self._melee_weapon_name)

	slot7 = self._title_description
	slot10 = self._melee_weapon_name

	self._title_description.set_x(slot6, self._melee_weapon_name.x(slot9))

	return 
end
function RaidGUIControlMeleeWeaponRewardDetails:_create_reward_image()
	local reward_image_panel_params = {
		name = "reward_image_panel",
		layer = 10
	}
	slot4 = self._left_panel
	reward_image_panel_params.w = self._left_panel.w(slot3)
	slot5 = reward_image_panel_params
	self._reward_image_panel = self._left_panel.panel(slot3, self._left_panel)
	local reward_image_params = {
		name = "reward_image",
		alpha = 0,
		texture = tweak_data.gui.icons[RaidGUIControlMeleeWeaponRewardDetails.REWARD_ICON].texture,
		texture_rect = tweak_data.gui.icons[RaidGUIControlMeleeWeaponRewardDetails.REWARD_ICON].texture_rect
	}
	slot6 = reward_image_params
	self._reward_image = self._reward_image_panel.bitmap(RaidGUIControlMeleeWeaponRewardDetails.REWARD_ICON, self._reward_image_panel)
	slot8 = self._reward_image_panel
	slot6 = self._reward_image_panel.w(slot7) / 2

	self._reward_image.set_center_x(RaidGUIControlMeleeWeaponRewardDetails.REWARD_ICON, self._reward_image)

	slot8 = self._reward_image_panel
	slot6 = self._reward_image_panel.h(slot7) / 2

	self._reward_image.set_center_y(RaidGUIControlMeleeWeaponRewardDetails.REWARD_ICON, self._reward_image)

	return 
end
function RaidGUIControlMeleeWeaponRewardDetails:_create_redeem_info()
	local redeem_description_params = {
		name = "redeem_description",
		layer = 10,
		font = RaidGUIControlMeleeWeaponRewardDetails.FONT,
		font_size = RaidGUIControlMeleeWeaponRewardDetails.REDEEM_DESCRIPTION_FONT_SIZE,
		color = RaidGUIControlMeleeWeaponRewardDetails.REDEEM_DESCRIPTION_COLOR
	}
	slot6 = true
	redeem_description_params.text = self.translate(slot3, self, "menu_loot_screen_redeem_worth_title")
	slot5 = redeem_description_params
	local redeem_description = self._left_panel.text(slot3, self._left_panel)
	local redeem_value_params = {
		name = "redeem_value",
		layer = 10,
		font = RaidGUIControlMeleeWeaponRewardDetails.FONT,
		font_size = RaidGUIControlMeleeWeaponRewardDetails.REDEEM_VALUE_FONT_SIZE,
		color = RaidGUIControlMeleeWeaponRewardDetails.REDEEM_VALUE_COLOR
	}
	slot10 = true
	redeem_value_params.text = self._xp_redeem_value .. " " .. self.translate(slot7, self, "menu_label_xp")
	slot7 = redeem_value_params
	self._xp_redeem_value_text = self._left_panel.text(" ", self._left_panel)

	self._layout_redeem_info(" ")

	local redeem_xp_button_params = {
		name = "redeem_xp_button",
		x = 0
	}
	slot7 = self._left_panel
	redeem_xp_button_params.y = self._left_panel.h(self) - RaidGUIControlMeleeWeaponRewardDetails.REDEEM_BUTTON_CENTER_Y_FROM_BOTTOM
	slot9 = true
	redeem_xp_button_params.text = self.translate(RaidGUIControlMeleeWeaponRewardDetails.REDEEM_BUTTON_CENTER_Y_FROM_BOTTOM, self, "menu_loot_screen_redeem_xp")
	redeem_xp_button_params.layer = RaidGuiBase.FOREGROUND_LAYER
	redeem_xp_button_params.on_click_callback = callback(RaidGUIControlMeleeWeaponRewardDetails.REDEEM_BUTTON_CENTER_Y_FROM_BOTTOM, self, self)
	slot8 = redeem_xp_button_params
	self._redeem_button = self._left_panel.short_tertiary_button(RaidGUIControlMeleeWeaponRewardDetails.REDEEM_BUTTON_CENTER_Y_FROM_BOTTOM, self._left_panel)
	slot10 = self._left_panel
	slot8 = self._left_panel.w("_on_click_redeem") / 2

	self._redeem_button.set_center_x(RaidGUIControlMeleeWeaponRewardDetails.REDEEM_BUTTON_CENTER_Y_FROM_BOTTOM, self._redeem_button)

	return 
end
function RaidGUIControlMeleeWeaponRewardDetails:_layout_redeem_info()
	slot4 = "redeem_description"
	local redeem_description = self._left_panel.child(slot2, self._left_panel)
	slot4 = redeem_description
	local _, _, w, h = redeem_description.text_rect(self._left_panel)
	slot9 = w

	redeem_description.set_w(slot7, redeem_description)

	slot9 = h

	redeem_description.set_h(slot7, redeem_description)

	slot11 = self._left_panel
	slot9 = self._left_panel.w(slot10) / 2

	redeem_description.set_center_x(slot7, redeem_description)

	slot9 = self._left_panel.h(slot10) - RaidGUIControlMeleeWeaponRewardDetails.REDEEM_DESCRIPTION_CENTER_Y_FROM_BOTTOM

	redeem_description.set_center_y(slot7, redeem_description)

	slot8 = self._xp_redeem_value_text
	local _, _, w, h = self._xp_redeem_value_text.text_rect(slot7)
	slot13 = w

	self._xp_redeem_value_text.set_w(self._left_panel, self._xp_redeem_value_text)

	slot13 = h

	self._xp_redeem_value_text.set_h(self._left_panel, self._xp_redeem_value_text)

	slot15 = self._left_panel
	slot13 = self._left_panel.w(slot14) / 2

	self._xp_redeem_value_text.set_center_x(self._left_panel, self._xp_redeem_value_text)

	slot15 = self._left_panel
	slot13 = self._left_panel.h(slot14) - RaidGUIControlMeleeWeaponRewardDetails.REDEEM_VALUE_CENTER_Y_FROM_BOTTOM

	self._xp_redeem_value_text.set_center_y(self._left_panel, self._xp_redeem_value_text)

	return 
end
function RaidGUIControlMeleeWeaponRewardDetails:_create_right_panel()
	local right_panel_params = {
		name = "right_panel"
	}
	slot5 = self._left_panel
	slot3 = self._left_panel.w(self._object)
	right_panel_params.w = self._object.w(slot3) - slot3
	slot4 = self._object
	right_panel_params.h = self._object.h(slot3)
	slot5 = right_panel_params
	self._right_panel = self._object.panel(slot3, self._object)
	slot4 = self._right_panel
	slot7 = self._object

	self._right_panel.set_right(slot3, self._object.w(slot6))

	return 
end
function RaidGUIControlMeleeWeaponRewardDetails:_create_description()
	local description_params = {
		vertical = "top",
		name = "description",
		wrap = true,
		align = "left",
		alpha = 0,
		text = "",
		layer = 10,
		y = RaidGUIControlMeleeWeaponRewardDetails.DESCRIPTION_Y,
		w = RaidGUIControlMeleeWeaponRewardDetails.DESCRIPTION_W,
		font = RaidGUIControlMeleeWeaponRewardDetails.DESCRIPTION_FONT,
		font_size = RaidGUIControlMeleeWeaponRewardDetails.DESCRIPTION_FONT_SIZE,
		color = RaidGUIControlMeleeWeaponRewardDetails.DESCRIPTION_COLOR
	}
	slot5 = description_params
	self._description = self._right_panel.text(slot3, self._right_panel)
	slot4 = self._description
	slot7 = self._right_panel

	self._description.set_right(slot3, self._right_panel.w(slot6))

	return 
end
function RaidGUIControlMeleeWeaponRewardDetails:_create_item_title()
	local item_type_params = {
		name = "item_type",
		wrap = true,
		align = "left",
		alpha = 0,
		vertical = "center",
		text = "",
		layer = 10
	}
	slot4 = self._description
	item_type_params.x = self._description.x(slot3)
	item_type_params.y = RaidGUIControlMeleeWeaponRewardDetails.ITEM_TYPE_Y
	item_type_params.w = RaidGUIControlMeleeWeaponRewardDetails.DESCRIPTION_W
	item_type_params.h = RaidGUIControlMeleeWeaponRewardDetails.ITEM_TYPE_H
	item_type_params.font = RaidGUIControlMeleeWeaponRewardDetails.FONT
	item_type_params.font_size = RaidGUIControlMeleeWeaponRewardDetails.ITEM_TYPE_FONT_SIZE
	item_type_params.color = RaidGUIControlMeleeWeaponRewardDetails.ITEM_TYPE_COLOR
	slot5 = item_type_params
	self._item_title = self._right_panel.text(slot3, self._right_panel)

	return 
end
function RaidGUIControlMeleeWeaponRewardDetails:show()
	slot3 = self

	RaidGUIControlMeleeWeaponRewardDetails.super.show(slot2)

	local duration = 1.9
	local t = 0
	slot5 = self._reward_image
	local original_image_w, original_image_h = self._reward_image.size(slot4)
	local image_duration = 0.1
	local image_duration_slowdown = 1.75
	slot9 = self._title_description
	local title_description_y = self._title_description.y(slot8)
	local title_description_offset = 35
	slot11 = self._melee_weapon_name
	local customization_name_y = self._melee_weapon_name.y(slot10)
	local customization_name_offset = 20
	local title_delay = 0
	local title_duration = 1
	slot15 = self._description
	local description_x = self._description.x(slot14)
	local description_offset = 30
	slot17 = self._item_title
	local item_type_x = self._item_title.x(slot16)
	local item_type_offset = 30

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot23 = image_duration
		local current_alpha = Easing.quartic_out(slot19, t, 0, 1)
		slot22 = current_alpha

		self._reward_image.set_alpha(t, self._reward_image)

		if t < image_duration then
			slot24 = image_duration
			local current_scale = Easing.linear(slot20, t, 1.4, -0.35)
			slot24 = original_image_h * current_scale

			self._reward_image.set_size(t, self._reward_image, original_image_w * current_scale)
		elseif image_duration < t and t < image_duration + image_duration_slowdown then
			slot24 = image_duration_slowdown
			local current_scale = Easing.quartic_out(slot20, t - image_duration, 1.05, -0.05)
			slot24 = original_image_h * current_scale

			self._reward_image.set_size(t - image_duration, self._reward_image, original_image_w * current_scale)
		elseif image_duration + image_duration_slowdown < t then
			slot23 = original_image_h

			self._reward_image.set_size(slot20, self._reward_image, original_image_w)
		end

		slot24 = self._reward_image_panel
		slot22 = self._reward_image_panel.w(slot23) / 2

		self._reward_image.set_center_x(slot20, self._reward_image)

		slot24 = self._reward_image_panel
		slot22 = self._reward_image_panel.h(slot23) / 2

		self._reward_image.set_center_y(slot20, self._reward_image)

		if title_delay < t then
			slot24 = title_duration
			local current_title_alpha = Easing.quartic_out(slot20, t - title_delay, 0, 1)
			slot23 = current_title_alpha

			self._title_description.set_alpha(t - title_delay, self._title_description)

			slot23 = current_title_alpha

			self._melee_weapon_name.set_alpha(t - title_delay, self._melee_weapon_name)

			slot23 = current_title_alpha

			self._description.set_alpha(t - title_delay, self._description)

			slot23 = current_title_alpha

			self._item_title.set_alpha(t - title_delay, self._item_title)

			slot25 = title_duration
			local title_description_current_offset = Easing.quartic_out(t - title_delay, t - title_delay, title_description_offset, -title_description_offset)
			slot24 = title_description_y - title_description_current_offset

			self._title_description.set_y(t - title_delay, self._title_description)

			slot26 = title_duration
			local customization_name_current_offset = Easing.quartic_out(t - title_delay, t - title_delay, customization_name_offset, -customization_name_offset)
			slot25 = customization_name_y - customization_name_current_offset

			self._melee_weapon_name.set_y(t - title_delay, self._melee_weapon_name)

			slot27 = title_duration
			local description_current_offset = Easing.quartic_out(t - title_delay, t - title_delay, -description_offset, description_offset)
			slot26 = description_x + description_current_offset

			self._description.set_x(t - title_delay, self._description)

			slot28 = title_duration
			local item_type_current_offset = Easing.quartic_out(t - title_delay, t - title_delay, -item_type_offset, item_type_offset)
			slot27 = item_type_x + item_type_current_offset

			self._item_title.set_x(t - title_delay, self._item_title)
		end
	end

	slot20 = 1

	self._reward_image.set_alpha(slot18, self._reward_image)
	self._reward_image.set_size(slot18, self._reward_image, original_image_w)

	slot22 = self._reward_image_panel
	slot20 = self._reward_image_panel.w(original_image_h) / 2

	self._reward_image.set_center_x(slot18, self._reward_image)

	slot22 = self._reward_image_panel
	slot20 = self._reward_image_panel.h(original_image_h) / 2

	self._reward_image.set_center_y(slot18, self._reward_image)

	slot20 = 1

	self._title_description.set_alpha(slot18, self._title_description)

	slot20 = title_description_y

	self._title_description.set_y(slot18, self._title_description)

	slot20 = 1

	self._melee_weapon_name.set_alpha(slot18, self._melee_weapon_name)

	slot20 = customization_name_y

	self._melee_weapon_name.set_y(slot18, self._melee_weapon_name)

	slot20 = 1

	self._description.set_alpha(slot18, self._description)

	slot20 = description_x

	self._description.set_x(slot18, self._description)

	slot20 = 1

	self._item_title.set_alpha(slot18, self._item_title)

	slot20 = item_type_x

	self._item_title.set_x(slot18, self._item_title)

	return 
end
function RaidGUIControlMeleeWeaponRewardDetails:_on_click_redeem()
	local params = {}
	slot6 = "redeem"
	params.callback = callback(slot3, self, self)
	params.xp = self._xp_redeem_value
	slot5 = params

	managers.menu.show_redeem_weapon_point_dialog(slot3, managers.menu)

	return 
end
function RaidGUIControlMeleeWeaponRewardDetails:redeem()
	slot3 = managers.lootdrop

	managers.lootdrop.redeem_dropped_loot_for_xp(slot2)

	slot3 = game_state_machine
	slot3 = game_state_machine.current_state(slot2)

	game_state_machine.current_state(slot2).recalculate_xp(slot2)

	return 
end
function RaidGUIControlMeleeWeaponRewardDetails:set_melee_weapon(weapon_id)
	slot6 = weapon_id
	local melee_weapon = managers.weapon_inventory.get_weapon_data(slot3, managers.weapon_inventory, WeaponInventoryManager.CATEGORY_NAME_MELEE)
	local bm_tweak_data = tweak_data.blackmarket.melee_weapons[weapon_id]
	slot6 = self._item_title
	slot11 = true

	self._item_title.set_text(WeaponInventoryManager.CATEGORY_NAME_MELEE, self.translate(slot8, self, bm_tweak_data.name_id))

	slot6 = self._melee_weapon_name
	slot11 = true

	self._melee_weapon_name.set_text(WeaponInventoryManager.CATEGORY_NAME_MELEE, self.translate(slot8, self, bm_tweak_data.name_id))

	slot6 = self

	self._layout_title(WeaponInventoryManager.CATEGORY_NAME_MELEE)

	slot6 = self._description
	slot11 = false

	self._description.set_text(WeaponInventoryManager.CATEGORY_NAME_MELEE, self.translate(slot8, self, bm_tweak_data.desc_id))

	slot7 = bm_tweak_data.reward_image

	self._reward_image.set_image(WeaponInventoryManager.CATEGORY_NAME_MELEE, self._reward_image)

	return 
end
function RaidGUIControlMeleeWeaponRewardDetails:close()
	slot3 = self

	RaidGUIControlMeleeWeaponRewardDetails.super.close(slot2)

	return 
end

return 
