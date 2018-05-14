if not RaidGUIControlCharacterCustomizationDetails then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlCharacterCustomizationDetails = slot0
RaidGUIControlCharacterCustomizationDetails.DEFAULT_WIDTH = 128
RaidGUIControlCharacterCustomizationDetails.HEIGHT = 96
RaidGUIControlCharacterCustomizationDetails.LEFT_PANEL_W = 860
RaidGUIControlCharacterCustomizationDetails.FONT = tweak_data.gui.fonts.din_compressed
RaidGUIControlCharacterCustomizationDetails.TITLE_DESCRIPTION_Y = 690
RaidGUIControlCharacterCustomizationDetails.TITLE_DESCRIPTION_H = 50
RaidGUIControlCharacterCustomizationDetails.TITLE_DESCRIPTION_FONT_SIZE = tweak_data.gui.font_sizes.size_32
RaidGUIControlCharacterCustomizationDetails.TITLE_DESCRIPTION_COLOR = tweak_data.gui.colors.raid_white
RaidGUIControlCharacterCustomizationDetails.TITLE_PADDING_TOP = -14
RaidGUIControlCharacterCustomizationDetails.TITLE_FONT_SIZE = tweak_data.gui.font_sizes.size_76
RaidGUIControlCharacterCustomizationDetails.TITLE_COLOR = tweak_data.gui.colors.raid_red
RaidGUIControlCharacterCustomizationDetails.CUSTOMIZATION_IMAGE_PANEL_Y = 144
RaidGUIControlCharacterCustomizationDetails.CUSTOMIZATION_IMAGE_PANEL_H = 560
RaidGUIControlCharacterCustomizationDetails.CUSTOMIZATION_IMAGE_LOWER_PART_SCALE_FACTOR = 1.1
RaidGUIControlCharacterCustomizationDetails.DEFAULT_ICON_UPPER = "rwd_upper_body_large"
RaidGUIControlCharacterCustomizationDetails.DEFAULT_ICON_LOWER = "rwd_lower_body_large"
RaidGUIControlCharacterCustomizationDetails.REDEEM_DESCRIPTION_CENTER_Y_FROM_BOTTOM = 192
RaidGUIControlCharacterCustomizationDetails.REDEEM_DESCRIPTION_FONT_SIZE = tweak_data.gui.font_sizes.size_32
RaidGUIControlCharacterCustomizationDetails.REDEEM_DESCRIPTION_COLOR = tweak_data.gui.colors.raid_white
RaidGUIControlCharacterCustomizationDetails.REDEEM_VALUE_CENTER_Y_FROM_BOTTOM = 148
RaidGUIControlCharacterCustomizationDetails.REDEEM_VALUE_FONT_SIZE = tweak_data.gui.font_sizes.size_56
RaidGUIControlCharacterCustomizationDetails.REDEEM_VALUE_COLOR = tweak_data.gui.colors.raid_red
RaidGUIControlCharacterCustomizationDetails.REDEEM_BUTTON_CENTER_Y_FROM_BOTTOM = 92
RaidGUIControlCharacterCustomizationDetails.ITEM_TYPE_Y = 224
RaidGUIControlCharacterCustomizationDetails.ITEM_TYPE_H = 72
RaidGUIControlCharacterCustomizationDetails.ITEM_TYPE_FONT_SIZE = tweak_data.gui.font_sizes.size_38
RaidGUIControlCharacterCustomizationDetails.ITEM_TYPE_COLOR = tweak_data.gui.colors.raid_white
RaidGUIControlCharacterCustomizationDetails.DESCRIPTION_Y = 304
RaidGUIControlCharacterCustomizationDetails.DESCRIPTION_W = 416
RaidGUIControlCharacterCustomizationDetails.DESCRIPTION_FONT = tweak_data.gui.fonts.lato
RaidGUIControlCharacterCustomizationDetails.DESCRIPTION_FONT_SIZE = tweak_data.gui.font_sizes.size_20
RaidGUIControlCharacterCustomizationDetails.DESCRIPTION_COLOR = tweak_data.gui.colors.raid_grey
RaidGUIControlCharacterCustomizationDetails.DESCRIPTION_PADDING_DOWN = 32
RaidGUIControlCharacterCustomizationDetails.RARITY_W = 96
RaidGUIControlCharacterCustomizationDetails.RARITY_H = 96
RaidGUIControlCharacterCustomizationDetails.NATIONALITY_W = 128
RaidGUIControlCharacterCustomizationDetails.NATIONALITY_H = 96
RaidGUIControlCharacterCustomizationDetails.NATIONALITY_ICON_H = 64
RaidGUIControlCharacterCustomizationDetails.NATIONALITY_PADDING_RIGHT = 32
function RaidGUIControlCharacterCustomizationDetails:init(parent, params)
	slot7 = params

	RaidGUIControlCharacterCustomizationDetails.super.init(slot4, self, parent)

	if not params then
		slot6 = "[RaidGUIControlCharacterCustomizationDetails:init] Parameters not specified for the customization details"

		Application.error(slot4, Application)

		return 
	end

	slot5 = self

	self._create_control_panel(slot4)

	slot5 = self

	self._create_left_panel(slot4)

	slot5 = self

	self._create_title(slot4)

	slot5 = self

	self._create_customization_image(slot4)

	slot5 = self

	self._create_right_panel(slot4)

	slot5 = self

	self._create_description(slot4)

	slot5 = self

	self._create_item_description_name(slot4)

	slot5 = self

	self._create_customization_info(slot4)

	return 
end
function RaidGUIControlCharacterCustomizationDetails:close()
	return 
end
function RaidGUIControlCharacterCustomizationDetails:_create_control_panel()
	slot3 = self._params
	local control_params = clone(slot2)
	control_params.x = control_params.x
	control_params.w = control_params.w or RaidGUIControlCharacterCustomizationDetails.DEFAULT_WIDTH
	control_params.h = control_params.h or RaidGUIControlCharacterCustomizationDetails.HEIGHT
	control_params.name = control_params.name .. "_customization_panel"
	slot4 = self._panel
	control_params.layer = self._panel.layer("_customization_panel") + 1
	slot5 = control_params
	self._control_panel = self._panel.panel("_customization_panel", self._panel)
	self._object = self._control_panel

	return 
end
function RaidGUIControlCharacterCustomizationDetails:_create_left_panel()
	local left_panel_params = {
		name = "left_panel",
		w = RaidGUIControlCharacterCustomizationDetails.LEFT_PANEL_W
	}
	slot4 = self._object
	left_panel_params.h = self._object.h(slot3)
	slot5 = left_panel_params
	self._left_panel = self._object.panel(slot3, self._object)

	return 
end
function RaidGUIControlCharacterCustomizationDetails:_create_title()
	local title_description_params = {
		name = "title_description",
		vertical = "center",
		alpha = 0,
		align = "left",
		y = RaidGUIControlCharacterCustomizationDetails.TITLE_DESCRIPTION_Y,
		h = RaidGUIControlCharacterCustomizationDetails.TITLE_DESCRIPTION_H,
		font = RaidGUIControlCharacterCustomizationDetails.FONT,
		font_size = RaidGUIControlCharacterCustomizationDetails.TITLE_DESCRIPTION_FONT_SIZE,
		color = RaidGUIControlCharacterCustomizationDetails.TITLE_DESCRIPTION_COLOR
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
		text = "customization_name"
	}
	slot10 = self._title_description
	title_params.y = self._title_description.y(self._title_description) + self._title_description.h(self._title_description) + RaidGUIControlCharacterCustomizationDetails.TITLE_PADDING_TOP
	title_params.font = RaidGUIControlCharacterCustomizationDetails.FONT
	title_params.font_size = RaidGUIControlCharacterCustomizationDetails.TITLE_FONT_SIZE
	title_params.color = RaidGUIControlCharacterCustomizationDetails.TITLE_COLOR
	slot9 = self._left_panel
	title_params.w = self._left_panel.w(RaidGUIControlCharacterCustomizationDetails.TITLE_PADDING_TOP) * 0.8
	slot10 = title_params
	self._customization_name = self._left_panel.text(RaidGUIControlCharacterCustomizationDetails.TITLE_PADDING_TOP, self._left_panel)

	return 
end
function RaidGUIControlCharacterCustomizationDetails:_layout_title()
	slot3 = self._customization_name
	local _, _, w, h = self._customization_name.text_rect(slot2)
	slot8 = h

	self._customization_name.set_h(slot6, self._customization_name)

	slot10 = self._left_panel
	slot8 = self._left_panel.w(slot9) / 2

	self._customization_name.set_center_x(slot6, self._customization_name)

	slot7 = self._title_description
	slot10 = self._customization_name

	self._title_description.set_x(slot6, self._customization_name.x(slot9))

	return 
end
function RaidGUIControlCharacterCustomizationDetails:_create_customization_image()
	local customization_image_panel_params = {
		name = "customization_image_panel",
		y = RaidGUIControlCharacterCustomizationDetails.CUSTOMIZATION_IMAGE_PANEL_Y
	}
	slot4 = self._left_panel
	customization_image_panel_params.w = self._left_panel.w(slot3)
	customization_image_panel_params.h = RaidGUIControlCharacterCustomizationDetails.CUSTOMIZATION_IMAGE_PANEL_H
	slot5 = customization_image_panel_params
	local customization_image_panel = self._left_panel.panel(slot3, self._left_panel)
	slot6 = RaidGUIControlCharacterCustomizationDetails.DEFAULT_ICON_UPPER

	self._set_customization_image(self._left_panel, self)

	return 
end
function RaidGUIControlCharacterCustomizationDetails:_set_customization_image(texture, texture_rect)
	slot6 = "customization_image_panel"
	local customization_image_panel = self._left_panel.child(slot4, self._left_panel)

	if self._customization_image then
		slot7 = self._customization_image

		customization_image_panel.remove(slot5, customization_image_panel)

		self._customization_image = nil
	end

	local customization_image_params = {
		name = "customization_image",
		alpha = 0,
		texture = texture,
		texture_rect = texture_rect
	}
	slot8 = customization_image_params
	self._customization_image = customization_image_panel.bitmap(slot6, customization_image_panel)
	slot10 = customization_image_panel
	slot8 = customization_image_panel.w(slot9) / 2

	self._customization_image.set_center_x(slot6, self._customization_image)

	slot10 = customization_image_panel
	slot8 = customization_image_panel.h(slot9) / 2

	self._customization_image.set_center_y(slot6, self._customization_image)

	return 
end
function RaidGUIControlCharacterCustomizationDetails:_create_redeem_info()
	local redeem_description_params = {
		name = "redeem_description",
		alpha = 0,
		font = RaidGUIControlCharacterCustomizationDetails.FONT,
		font_size = RaidGUIControlCharacterCustomizationDetails.REDEEM_DESCRIPTION_FONT_SIZE,
		color = RaidGUIControlCharacterCustomizationDetails.REDEEM_DESCRIPTION_COLOR
	}
	slot6 = true
	redeem_description_params.text = self.translate(slot3, self, "menu_loot_screen_redeem_worth_title")
	local redeem_description = self._left_panel.text(slot3, self._left_panel)
	local redeem_value_params = {
		text = "456 XP",
		name = "redeem_value",
		alpha = 0,
		font = RaidGUIControlCharacterCustomizationDetails.FONT,
		font_size = RaidGUIControlCharacterCustomizationDetails.REDEEM_VALUE_FONT_SIZE,
		color = RaidGUIControlCharacterCustomizationDetails.REDEEM_VALUE_COLOR
	}
	slot7 = redeem_value_params
	self._xp_redeem_value_text = self._left_panel.text(redeem_description_params, self._left_panel)

	self._layout_redeem_info(redeem_description_params)

	local redeem_xp_button_params = {
		name = "redeem_xp_button",
		alpha = 0,
		x = 0
	}
	slot7 = self._left_panel
	redeem_xp_button_params.y = self._left_panel.h(self) - RaidGUIControlCharacterCustomizationDetails.REDEEM_BUTTON_CENTER_Y_FROM_BOTTOM
	slot9 = true
	redeem_xp_button_params.text = self.translate(RaidGUIControlCharacterCustomizationDetails.REDEEM_BUTTON_CENTER_Y_FROM_BOTTOM, self, "menu_loot_screen_redeem_xp")
	redeem_xp_button_params.layer = RaidGuiBase.FOREGROUND_LAYER
	redeem_xp_button_params.on_click_callback = callback(RaidGUIControlCharacterCustomizationDetails.REDEEM_BUTTON_CENTER_Y_FROM_BOTTOM, self, self)
	slot8 = redeem_xp_button_params
	self.redeem_xp_button = self._left_panel.short_tertiary_button(RaidGUIControlCharacterCustomizationDetails.REDEEM_BUTTON_CENTER_Y_FROM_BOTTOM, self._left_panel)
	slot10 = self._left_panel
	slot8 = self._left_panel.w("_on_click_redeem") / 2

	self.redeem_xp_button.set_center_x(RaidGUIControlCharacterCustomizationDetails.REDEEM_BUTTON_CENTER_Y_FROM_BOTTOM, self.redeem_xp_button)

	return 
end
function RaidGUIControlCharacterCustomizationDetails:_layout_redeem_info()
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

	slot9 = self._left_panel.h(slot10) - RaidGUIControlCharacterCustomizationDetails.REDEEM_DESCRIPTION_CENTER_Y_FROM_BOTTOM

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
	slot13 = self._left_panel.h(slot14) - RaidGUIControlCharacterCustomizationDetails.REDEEM_VALUE_CENTER_Y_FROM_BOTTOM

	self._xp_redeem_value_text.set_center_y(self._left_panel, self._xp_redeem_value_text)

	return 
end
function RaidGUIControlCharacterCustomizationDetails:_create_right_panel()
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
function RaidGUIControlCharacterCustomizationDetails:_create_description()
	local description_params = {
		vertical = "top",
		name = "description",
		wrap = true,
		align = "left",
		alpha = 0,
		text = "",
		y = RaidGUIControlCharacterCustomizationDetails.DESCRIPTION_Y,
		w = RaidGUIControlCharacterCustomizationDetails.DESCRIPTION_W,
		font = RaidGUIControlCharacterCustomizationDetails.DESCRIPTION_FONT,
		font_size = RaidGUIControlCharacterCustomizationDetails.DESCRIPTION_FONT_SIZE,
		color = RaidGUIControlCharacterCustomizationDetails.DESCRIPTION_COLOR
	}
	slot5 = description_params
	self._description = self._right_panel.text(slot3, self._right_panel)
	slot4 = self._description
	slot7 = self._right_panel

	self._description.set_right(slot3, self._right_panel.w(slot6))

	return 
end
function RaidGUIControlCharacterCustomizationDetails:_create_item_description_name()
	local item_type_params = {
		name = "item_type",
		wrap = true,
		align = "left",
		alpha = 0,
		vertical = "center"
	}
	slot4 = self._description
	item_type_params.x = self._description.x(slot3)
	item_type_params.y = RaidGUIControlCharacterCustomizationDetails.ITEM_TYPE_Y
	item_type_params.w = RaidGUIControlMeleeWeaponRewardDetails.DESCRIPTION_W
	item_type_params.h = RaidGUIControlCharacterCustomizationDetails.ITEM_TYPE_H
	item_type_params.font = RaidGUIControlCharacterCustomizationDetails.FONT
	item_type_params.font_size = RaidGUIControlCharacterCustomizationDetails.ITEM_TYPE_FONT_SIZE
	item_type_params.color = RaidGUIControlCharacterCustomizationDetails.ITEM_TYPE_COLOR
	slot6 = true
	item_type_params.text = self.translate(slot3, self, "menu_loot_screen_character_customization")
	slot5 = item_type_params
	self._item_description_name = self._right_panel.text(slot3, self._right_panel)

	return 
end
function RaidGUIControlCharacterCustomizationDetails:_create_customization_info()
	local rarity_info_params = {
		top_offset_y = 15,
		name = "rarity_info",
		alpha = 0,
		text = "",
		w = RaidGUIControlCharacterCustomizationDetails.RARITY_W,
		h = RaidGUIControlCharacterCustomizationDetails.RARITY_H,
		icon = LootDropTweakData.RARITY_RARE,
		icon_color = Color.white,
		text_size = tweak_data.gui.font_sizes.size_24,
		text_color = tweak_data.gui.colors.raid_grey_effects
	}
	slot5 = rarity_info_params
	self._rarity_info = self._right_panel.info_icon(slot3, self._right_panel)

	self._rarity_info.set_x(slot3, self._description.x(slot6))

	local nationality_info_params = {
		top_offset_y = 6,
		name = "nationality_info",
		alpha = 0,
		text = "",
		icon = "ico_flag_american",
		w = RaidGUIControlCharacterCustomizationDetails.NATIONALITY_W,
		h = RaidGUIControlCharacterCustomizationDetails.NATIONALITY_H,
		icon_color = Color.white,
		icon_h = RaidGUIControlCharacterCustomizationDetails.NATIONALITY_ICON_H,
		text_size = tweak_data.gui.font_sizes.size_24,
		text_color = tweak_data.gui.colors.raid_grey_effects
	}
	slot6 = nationality_info_params
	self._nationality_info = self._right_panel.info_icon(self._rarity_info, self._right_panel)
	slot9 = self._rarity_info
	slot6 = self._rarity_info.x(self._description) + self._rarity_info.w(self._rarity_info) + RaidGUIControlCharacterCustomizationDetails.NATIONALITY_PADDING_RIGHT

	self._nationality_info.set_x(self._rarity_info, self._nationality_info)

	return 
end
function RaidGUIControlCharacterCustomizationDetails:_layout_description()
	slot3 = self._description
	local _, _, _, h = self._description.text_rect(slot2)
	slot8 = h

	self._description.set_h(slot6, self._description)

	slot11 = self._description
	slot8 = self._description.y(slot9) + self._description.h(self._description) + RaidGUIControlCharacterCustomizationDetails.DESCRIPTION_PADDING_DOWN

	self._rarity_info.set_y(slot6, self._rarity_info)

	slot11 = self._description
	slot8 = self._description.y(RaidGUIControlCharacterCustomizationDetails.DESCRIPTION_PADDING_DOWN) + self._description.h(self._description) + RaidGUIControlCharacterCustomizationDetails.DESCRIPTION_PADDING_DOWN

	self._nationality_info.set_y(slot6, self._nationality_info)

	return 
end
function RaidGUIControlCharacterCustomizationDetails:show()
	slot3 = self

	RaidGUIControlCharacterCustomizationDetails.super.show(slot2)

	local duration = 1.9
	local t = 0
	slot6 = "customization_image_panel"
	local customization_image_panel = self._left_panel.child(slot4, self._left_panel)
	slot6 = self._customization_image
	local original_image_w, original_image_h = self._customization_image.size(self._left_panel)
	local image_duration = 0.1
	local image_duration_slowdown = 1.75
	slot10 = self._title_description
	local title_description_y = self._title_description.y(slot9)
	local title_description_offset = 35
	slot12 = self._customization_name
	local customization_name_y = self._customization_name.y(slot11)
	local customization_name_offset = 20
	local title_delay = 0
	local title_duration = 1
	slot16 = self._description
	local description_x = self._description.x(slot15)
	local description_offset = 30
	slot18 = self._item_description_name
	local item_type_x = self._item_description_name.x(slot17)
	local item_type_offset = 30

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot24 = image_duration
		local current_alpha = Easing.quartic_out(slot20, t, 0, 1)
		slot23 = current_alpha

		self._customization_image.set_alpha(t, self._customization_image)

		if t < image_duration then
			slot25 = image_duration
			local current_scale = Easing.linear(slot21, t, 1.4, -0.35)
			slot25 = original_image_h * current_scale

			self._customization_image.set_size(t, self._customization_image, original_image_w * current_scale)
		elseif image_duration < t and t < image_duration + image_duration_slowdown then
			slot25 = image_duration_slowdown
			local current_scale = Easing.quartic_out(slot21, t - image_duration, 1.05, -0.05)
			slot25 = original_image_h * current_scale

			self._customization_image.set_size(t - image_duration, self._customization_image, original_image_w * current_scale)
		elseif image_duration + image_duration_slowdown < t then
			slot24 = original_image_h

			self._customization_image.set_size(slot21, self._customization_image, original_image_w)
		end

		slot25 = customization_image_panel
		slot23 = customization_image_panel.w(slot24) / 2

		self._customization_image.set_center_x(slot21, self._customization_image)

		slot25 = customization_image_panel
		slot23 = customization_image_panel.h(slot24) / 2

		self._customization_image.set_center_y(slot21, self._customization_image)

		if title_delay < t then
			slot25 = title_duration
			local current_title_alpha = Easing.quartic_out(slot21, t - title_delay, 0, 1)
			slot24 = current_title_alpha

			self._title_description.set_alpha(t - title_delay, self._title_description)

			slot24 = current_title_alpha

			self._customization_name.set_alpha(t - title_delay, self._customization_name)

			slot24 = current_title_alpha

			self._description.set_alpha(t - title_delay, self._description)

			slot24 = current_title_alpha

			self._item_description_name.set_alpha(t - title_delay, self._item_description_name)

			slot24 = current_title_alpha

			self._rarity_info.set_alpha(t - title_delay, self._rarity_info)

			slot24 = current_title_alpha

			self._nationality_info.set_alpha(t - title_delay, self._nationality_info)

			slot26 = title_duration
			local title_description_current_offset = Easing.quartic_out(t - title_delay, t - title_delay, title_description_offset, -title_description_offset)
			slot25 = title_description_y - title_description_current_offset

			self._title_description.set_y(t - title_delay, self._title_description)

			slot27 = title_duration
			local customization_name_current_offset = Easing.quartic_out(t - title_delay, t - title_delay, customization_name_offset, -customization_name_offset)
			slot26 = customization_name_y - customization_name_current_offset

			self._customization_name.set_y(t - title_delay, self._customization_name)

			local description_current_offset = Easing.quartic_out(t - title_delay, t - title_delay, -description_offset, description_offset)
			slot27 = description_x + description_current_offset

			self._description.set_x(t - title_delay, self._description)

			slot26 = self._rarity_info
			slot29 = self._description

			self._rarity_info.set_x(t - title_delay, self._description.x(title_duration))

			slot30 = self._rarity_info
			slot27 = self._rarity_info.x(title_duration) + self._rarity_info.w(self._rarity_info) + RaidGUIControlCharacterCustomizationDetails.NATIONALITY_PADDING_RIGHT

			self._nationality_info.set_x(t - title_delay, self._nationality_info)

			slot29 = title_duration
			local item_type_current_offset = Easing.quartic_out(t - title_delay, t - title_delay, -item_type_offset, item_type_offset)
			slot28 = item_type_x + item_type_current_offset

			self._item_description_name.set_x(t - title_delay, self._item_description_name)
		end
	end

	slot21 = 1

	self._customization_image.set_alpha(slot19, self._customization_image)
	self._customization_image.set_size(slot19, self._customization_image, original_image_w)

	slot23 = customization_image_panel
	slot21 = customization_image_panel.w(original_image_h) / 2

	self._customization_image.set_center_x(slot19, self._customization_image)

	slot23 = customization_image_panel
	slot21 = customization_image_panel.h(original_image_h) / 2

	self._customization_image.set_center_y(slot19, self._customization_image)

	slot21 = 1

	self._title_description.set_alpha(slot19, self._title_description)

	slot21 = title_description_y

	self._title_description.set_y(slot19, self._title_description)

	slot21 = 1

	self._customization_name.set_alpha(slot19, self._customization_name)

	slot21 = customization_name_y

	self._customization_name.set_y(slot19, self._customization_name)

	slot21 = 1

	self._description.set_alpha(slot19, self._description)

	slot21 = description_x

	self._description.set_x(slot19, self._description)

	slot21 = 1

	self._item_description_name.set_alpha(slot19, self._item_description_name)

	slot21 = item_type_x

	self._item_description_name.set_x(slot19, self._item_description_name)

	slot21 = 1

	self._rarity_info.set_alpha(slot19, self._rarity_info)

	slot20 = self._rarity_info
	slot23 = self._description

	self._rarity_info.set_x(slot19, self._description.x(original_image_h))

	slot21 = 1

	self._nationality_info.set_alpha(slot19, self._nationality_info)

	slot24 = self._rarity_info
	slot21 = self._rarity_info.x(original_image_h) + self._rarity_info.w(self._rarity_info) + RaidGUIControlCharacterCustomizationDetails.NATIONALITY_PADDING_RIGHT

	self._nationality_info.set_x(slot19, self._nationality_info)

	return 
end
function RaidGUIControlCharacterCustomizationDetails:set_customization(customization)
	self._customization = customization
	slot4 = self._customization_name
	slot9 = true

	self._customization_name.set_text(slot3, self.translate(slot6, self, customization.name))

	slot4 = self._item_description_name
	slot9 = true

	self._item_description_name.set_text(slot3, self.translate(slot6, self, customization.name))

	slot4 = self

	self._layout_title(slot3)

	if customization.path_icon_large then
		slot5 = customization.path_icon_large

		self._set_customization_image(slot3, self)

		if customization.part_type == CharacterCustomizationTweakData.PART_TYPE_LOWER then
			local w = self._customization_image.w(slot3)
			local h = self._customization_image.h(self._customization_image)
			slot7 = w * RaidGUIControlCharacterCustomizationDetails.CUSTOMIZATION_IMAGE_LOWER_PART_SCALE_FACTOR

			self._customization_image.set_w(self._customization_image, self._customization_image)

			slot7 = h * RaidGUIControlCharacterCustomizationDetails.CUSTOMIZATION_IMAGE_LOWER_PART_SCALE_FACTOR

			self._customization_image.set_h(self._customization_image, self._customization_image)

			slot9 = self._customization_image
			slot9 = self._customization_image.parent(slot8)
			slot7 = self._customization_image.parent(slot8).w(slot8) / 2

			self._customization_image.set_center_x(self._customization_image, self._customization_image)

			slot9 = self._customization_image
			slot9 = self._customization_image.parent(slot8)
			slot7 = self._customization_image.parent(slot8).h(slot8) / 2

			self._customization_image.set_center_y(self._customization_image, self._customization_image)
		end
	else
		local icon = nil

		if customization.part_type == CharacterCustomizationTweakData.PART_TYPE_UPPER then
			icon = RaidGUIControlCharacterCustomizationDetails.DEFAULT_ICON_UPPER
		else
			icon = RaidGUIControlCharacterCustomizationDetails.DEFAULT_ICON_LOWER
		end

		slot7 = tweak_data.gui.icons[icon].texture_rect

		self._set_customization_image(slot4, self, tweak_data.gui.icons[icon].texture)
	end

	slot5 = customization.rarity

	self._rarity_info.set_icon(slot3, self._rarity_info)

	slot6 = {
		color = tweak_data.gui.colors.raid_grey
	}

	self._rarity_info.set_text(slot3, self._rarity_info, customization.rarity)

	local nationality = customization.nationalities[1]
	slot9 = nationality
	slot7 = {
		icon_h = RaidGUIControlCharacterCustomizationDetails.NATIONALITY_ICON_H
	}

	self._nationality_info.set_icon(self._rarity_info, self._nationality_info, "character_creation_nationality_" .. tostring(slot8))

	slot9 = nationality
	slot7 = {
		color = tweak_data.gui.colors.raid_grey
	}

	self._nationality_info.set_text(self._rarity_info, self._nationality_info, "nationality_" .. tostring(RaidGUIControlCharacterCustomizationDetails.NATIONALITY_ICON_H))

	if customization.description then
		slot5 = self._description
		slot9 = customization.description

		self._description.set_text(slot4, self.translate(slot7, self))
	else
		slot6 = ""

		self._description.set_text(slot4, self._description)
	end

	slot5 = self

	self._layout_description(slot4)

	return 
end
function RaidGUIControlCharacterCustomizationDetails:_on_click_redeem()
	local params = {}
	slot6 = "redeem"
	params.callback = callback(slot3, self, self)
	params.xp = self._xp_redeem_value
	slot5 = params

	managers.menu.show_redeem_character_customization_dialog(slot3, managers.menu)

	return 
end
function RaidGUIControlCharacterCustomizationDetails:redeem()
	slot3 = managers.lootdrop

	managers.lootdrop.redeem_dropped_loot_for_xp(slot2)

	slot3 = game_state_machine
	slot3 = game_state_machine.current_state(slot2)

	game_state_machine.current_state(slot2).recalculate_xp(slot2)

	return 
end
function RaidGUIControlCharacterCustomizationDetails:set_duplicate()
	return 
end

return 
