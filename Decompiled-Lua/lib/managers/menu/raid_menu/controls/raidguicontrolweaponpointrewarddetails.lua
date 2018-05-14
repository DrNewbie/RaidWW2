if not RaidGUIControlWeaponPointRewardDetails then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlWeaponPointRewardDetails = slot0
RaidGUIControlWeaponPointRewardDetails.DEFAULT_WIDTH = 400
RaidGUIControlWeaponPointRewardDetails.HEIGHT = 400
RaidGUIControlWeaponPointRewardDetails.LEFT_PANEL_W = 860
RaidGUIControlWeaponPointRewardDetails.FONT = tweak_data.gui.fonts.din_compressed
RaidGUIControlWeaponPointRewardDetails.TITLE_DESCRIPTION_H = 50
RaidGUIControlWeaponPointRewardDetails.TITLE_DESCRIPTION_FONT_SIZE = tweak_data.gui.font_sizes.size_32
RaidGUIControlWeaponPointRewardDetails.TITLE_DESCRIPTION_COLOR = tweak_data.gui.colors.raid_white
RaidGUIControlWeaponPointRewardDetails.TITLE_PADDING_TOP = -14
RaidGUIControlWeaponPointRewardDetails.TITLE_FONT_SIZE = tweak_data.gui.font_sizes.size_76
RaidGUIControlWeaponPointRewardDetails.TITLE_COLOR = tweak_data.gui.colors.raid_red
RaidGUIControlWeaponPointRewardDetails.REWARD_ICON_PANEL_Y = 144
RaidGUIControlWeaponPointRewardDetails.REWARD_ICON_PANEL_H = 560
RaidGUIControlWeaponPointRewardDetails.REWARD_ICON = "rwd_weapon_large"
RaidGUIControlWeaponPointRewardDetails.ITEM_TYPE_Y = 224
RaidGUIControlWeaponPointRewardDetails.ITEM_TYPE_H = 64
RaidGUIControlWeaponPointRewardDetails.ITEM_TYPE_FONT_SIZE = tweak_data.gui.font_sizes.size_38
RaidGUIControlWeaponPointRewardDetails.ITEM_TYPE_COLOR = tweak_data.gui.colors.raid_white
RaidGUIControlWeaponPointRewardDetails.DESCRIPTION_Y = 304
RaidGUIControlWeaponPointRewardDetails.DESCRIPTION_W = 352
RaidGUIControlWeaponPointRewardDetails.DESCRIPTION_FONT = tweak_data.gui.fonts.lato
RaidGUIControlWeaponPointRewardDetails.DESCRIPTION_FONT_SIZE = tweak_data.gui.font_sizes.size_20
RaidGUIControlWeaponPointRewardDetails.DESCRIPTION_COLOR = tweak_data.gui.colors.raid_grey
RaidGUIControlWeaponPointRewardDetails.REDEEM_DESCRIPTION_CENTER_Y_FROM_BOTTOM = 192
RaidGUIControlWeaponPointRewardDetails.REDEEM_DESCRIPTION_FONT_SIZE = tweak_data.gui.font_sizes.size_32
RaidGUIControlWeaponPointRewardDetails.REDEEM_DESCRIPTION_COLOR = tweak_data.gui.colors.raid_white
RaidGUIControlWeaponPointRewardDetails.REDEEM_VALUE_CENTER_Y_FROM_BOTTOM = 148
RaidGUIControlWeaponPointRewardDetails.REDEEM_VALUE_FONT_SIZE = tweak_data.gui.font_sizes.size_56
RaidGUIControlWeaponPointRewardDetails.REDEEM_VALUE_COLOR = tweak_data.gui.colors.raid_red
RaidGUIControlWeaponPointRewardDetails.REDEEM_BUTTON_CENTER_Y_FROM_BOTTOM = 92
function RaidGUIControlWeaponPointRewardDetails:init(parent, params)
	slot7 = params

	RaidGUIControlWeaponPointRewardDetails.super.init(slot4, self, parent)

	if not params then
		slot6 = "[RaidGUIControlWeaponPointRewardDetails:init] Parameters not specified for the XP reward details"

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

	self._create_redeem_info(slot4)

	slot5 = self

	self._create_right_panel(slot4)

	slot5 = self

	self._create_item_type(slot4)

	slot5 = self

	self._create_description(slot4)

	return 
end
function RaidGUIControlWeaponPointRewardDetails:_create_control_panel()
	slot3 = self._params
	local control_params = clone(slot2)
	control_params.x = control_params.x
	control_params.w = control_params.w or RaidGUIControlWeaponPointRewardDetails.DEFAULT_WIDTH
	control_params.h = control_params.h or RaidGUIControlWeaponPointRewardDetails.HEIGHT
	control_params.name = control_params.name .. "_customization_panel"
	slot4 = self._panel
	control_params.layer = self._panel.layer("_customization_panel") + 1
	slot5 = control_params
	self._control_panel = self._panel.panel("_customization_panel", self._panel)
	self._object = self._control_panel

	return 
end
function RaidGUIControlWeaponPointRewardDetails:_create_left_panel()
	local left_panel_params = {
		name = "left_panel",
		w = RaidGUIControlWeaponPointRewardDetails.LEFT_PANEL_W
	}
	slot4 = self._object
	left_panel_params.h = self._object.h(slot3)
	slot5 = left_panel_params
	self._left_panel = self._object.panel(slot3, self._object)

	return 
end
function RaidGUIControlWeaponPointRewardDetails:_create_title()
	local title_description_params = {
		align = "left",
		vertical = "center",
		name = "title_description",
		h = RaidGUIControlWeaponPointRewardDetails.TITLE_DESCRIPTION_H,
		font = RaidGUIControlWeaponPointRewardDetails.FONT,
		font_size = RaidGUIControlWeaponPointRewardDetails.TITLE_DESCRIPTION_FONT_SIZE,
		color = RaidGUIControlWeaponPointRewardDetails.TITLE_DESCRIPTION_COLOR
	}
	slot6 = true
	title_description_params.text = self.translate(slot3, self, "menu_loot_screen_bracket_unlocked_title")
	slot5 = title_description_params
	local title_description = self._left_panel.text(slot3, self._left_panel)
	slot5 = title_description
	local _, _, w, _ = title_description.text_rect(self._left_panel)
	slot10 = w

	title_description.set_w(slot8, title_description)

	local title_params = {
		align = "center",
		vertical = "top",
		name = "customization_name"
	}
	slot11 = title_description
	title_params.y = title_description.y(title_description) + title_description.h(title_description) + RaidGUIControlWeaponPointRewardDetails.TITLE_PADDING_TOP
	title_params.font = RaidGUIControlWeaponPointRewardDetails.FONT
	title_params.font_size = RaidGUIControlWeaponPointRewardDetails.TITLE_FONT_SIZE
	title_params.color = RaidGUIControlWeaponPointRewardDetails.TITLE_COLOR
	slot12 = true
	title_params.text = self.translate(RaidGUIControlWeaponPointRewardDetails.TITLE_PADDING_TOP, self, "menu_loot_screen_weapon_point")
	slot11 = title_params
	self._customization_name = self._left_panel.text(RaidGUIControlWeaponPointRewardDetails.TITLE_PADDING_TOP, self._left_panel)
	slot10 = self

	self._layout_title(RaidGUIControlWeaponPointRewardDetails.TITLE_PADDING_TOP)

	return 
end
function RaidGUIControlWeaponPointRewardDetails:_layout_title()
	slot3 = self._customization_name
	local _, _, w, h = self._customization_name.text_rect(slot2)
	slot8 = w

	self._customization_name.set_w(slot6, self._customization_name)

	slot8 = h

	self._customization_name.set_h(slot6, self._customization_name)

	slot8 = self._left_panel.w(slot9) / 2

	self._customization_name.set_center_x(slot6, self._customization_name)

	slot8 = "title_description"
	local title_description = self._left_panel.child(slot6, self._left_panel)
	slot8 = title_description
	slot11 = self._customization_name

	title_description.set_x(self._left_panel, self._customization_name.x(self._left_panel))

	return 
end
function RaidGUIControlWeaponPointRewardDetails:_create_reward_image()
	local reward_image_panel_params = {
		name = "reward_image_panel",
		y = RaidGUIControlWeaponPointRewardDetails.REWARD_ICON_PANEL_Y
	}
	slot4 = self._left_panel
	reward_image_panel_params.w = self._left_panel.w(slot3)
	reward_image_panel_params.h = RaidGUIControlWeaponPointRewardDetails.REWARD_ICON_PANEL_H
	slot5 = reward_image_panel_params
	local reward_image_panel = self._left_panel.panel(slot3, self._left_panel)
	local reward_image_params = {
		name = "reward_image",
		texture = tweak_data.gui.icons[RaidGUIControlWeaponPointRewardDetails.REWARD_ICON].texture,
		texture_rect = tweak_data.gui.icons[RaidGUIControlWeaponPointRewardDetails.REWARD_ICON].texture_rect
	}
	slot7 = reward_image_params
	self._reward_image = reward_image_panel.bitmap(RaidGUIControlWeaponPointRewardDetails.REWARD_ICON, reward_image_panel)
	slot9 = reward_image_panel
	slot7 = reward_image_panel.w(slot8) / 2

	self._reward_image.set_center_x(RaidGUIControlWeaponPointRewardDetails.REWARD_ICON, self._reward_image)

	slot9 = reward_image_panel
	slot7 = reward_image_panel.h(slot8) / 2

	self._reward_image.set_center_y(RaidGUIControlWeaponPointRewardDetails.REWARD_ICON, self._reward_image)

	return 
end
function RaidGUIControlWeaponPointRewardDetails:_create_redeem_info()
	local redeem_description_params = {
		name = "redeem_description",
		font = RaidGUIControlWeaponPointRewardDetails.FONT,
		font_size = RaidGUIControlWeaponPointRewardDetails.REDEEM_DESCRIPTION_FONT_SIZE,
		color = RaidGUIControlWeaponPointRewardDetails.REDEEM_DESCRIPTION_COLOR
	}
	slot6 = true
	redeem_description_params.text = self.translate(slot3, self, "menu_loot_screen_redeem_worth_title")
	slot5 = redeem_description_params
	local redeem_description = self._left_panel.text(slot3, self._left_panel)
	local redeem_value_params = {
		name = "redeem_value",
		font = RaidGUIControlWeaponPointRewardDetails.FONT,
		font_size = RaidGUIControlWeaponPointRewardDetails.REDEEM_VALUE_FONT_SIZE,
		color = RaidGUIControlWeaponPointRewardDetails.REDEEM_VALUE_COLOR
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
	redeem_xp_button_params.y = self._left_panel.h(self) - RaidGUIControlWeaponPointRewardDetails.REDEEM_BUTTON_CENTER_Y_FROM_BOTTOM
	slot9 = true
	redeem_xp_button_params.text = self.translate(RaidGUIControlWeaponPointRewardDetails.REDEEM_BUTTON_CENTER_Y_FROM_BOTTOM, self, "menu_loot_screen_redeem_xp")
	redeem_xp_button_params.layer = RaidGuiBase.FOREGROUND_LAYER
	redeem_xp_button_params.on_click_callback = callback(RaidGUIControlWeaponPointRewardDetails.REDEEM_BUTTON_CENTER_Y_FROM_BOTTOM, self, self)
	slot8 = redeem_xp_button_params
	self._redeem_button = self._left_panel.short_tertiary_button(RaidGUIControlWeaponPointRewardDetails.REDEEM_BUTTON_CENTER_Y_FROM_BOTTOM, self._left_panel)
	slot10 = self._left_panel
	slot8 = self._left_panel.w("_on_click_redeem") / 2

	self._redeem_button.set_center_x(RaidGUIControlWeaponPointRewardDetails.REDEEM_BUTTON_CENTER_Y_FROM_BOTTOM, self._redeem_button)

	return 
end
function RaidGUIControlWeaponPointRewardDetails:_layout_redeem_info()
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

	slot9 = self._left_panel.h(slot10) - RaidGUIControlWeaponPointRewardDetails.REDEEM_DESCRIPTION_CENTER_Y_FROM_BOTTOM

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
	slot13 = self._left_panel.h(slot14) - RaidGUIControlWeaponPointRewardDetails.REDEEM_VALUE_CENTER_Y_FROM_BOTTOM

	self._xp_redeem_value_text.set_center_y(self._left_panel, self._xp_redeem_value_text)

	return 
end
function RaidGUIControlWeaponPointRewardDetails:_create_right_panel()
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
function RaidGUIControlWeaponPointRewardDetails:_create_item_type()
	local item_type_params = {
		vertical = "center",
		name = "item_type",
		align = "right",
		y = RaidGUIControlWeaponPointRewardDetails.ITEM_TYPE_Y
	}
	slot4 = self._right_panel
	item_type_params.w = self._right_panel.w(slot3)
	item_type_params.h = RaidGUIControlWeaponPointRewardDetails.ITEM_TYPE_H
	item_type_params.font = RaidGUIControlWeaponPointRewardDetails.FONT
	item_type_params.font_size = RaidGUIControlWeaponPointRewardDetails.ITEM_TYPE_FONT_SIZE
	item_type_params.color = RaidGUIControlWeaponPointRewardDetails.ITEM_TYPE_COLOR
	slot6 = true
	item_type_params.text = self.translate(slot3, self, "menu_loot_screen_weapon_point_title_text")
	slot5 = item_type_params
	self._item_type = self._right_panel.text(slot3, self._right_panel)

	return 
end
function RaidGUIControlWeaponPointRewardDetails:_create_description()
	local description_params = {
		vertical = "top",
		name = "description",
		wrap = true,
		align = "left",
		y = RaidGUIControlWeaponPointRewardDetails.DESCRIPTION_Y,
		w = RaidGUIControlWeaponPointRewardDetails.DESCRIPTION_W,
		font = RaidGUIControlWeaponPointRewardDetails.DESCRIPTION_FONT,
		font_size = RaidGUIControlWeaponPointRewardDetails.DESCRIPTION_FONT_SIZE,
		color = RaidGUIControlWeaponPointRewardDetails.DESCRIPTION_COLOR
	}
	slot5 = "menu_loot_screen_weapon_point_description"
	description_params.text = self.translate(slot3, self)
	slot5 = description_params
	self._description = self._right_panel.text(slot3, self._right_panel)
	slot4 = self._description
	slot7 = self._right_panel

	self._description.set_right(slot3, self._right_panel.w(slot6))

	return 
end
function RaidGUIControlWeaponPointRewardDetails:_on_click_redeem()
	local params = {}
	slot6 = "redeem"
	params.callback = callback(slot3, self, self)
	params.xp = self._xp_redeem_value
	slot5 = params

	managers.menu.show_redeem_weapon_point_dialog(slot3, managers.menu)

	return 
end
function RaidGUIControlWeaponPointRewardDetails:redeem()
	slot3 = managers.lootdrop

	managers.lootdrop.redeem_dropped_loot_for_xp(slot2)

	slot3 = game_state_machine
	slot3 = game_state_machine.current_state(slot2)

	game_state_machine.current_state(slot2).recalculate_xp(slot2)

	slot3 = self._redeem_button

	self._redeem_button.hide(slot2)

	return 
end

return 
