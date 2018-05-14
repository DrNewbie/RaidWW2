if not RaidGUIControlGoldBarRewardDetails then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlGoldBarRewardDetails = slot0
RaidGUIControlGoldBarRewardDetails.DEFAULT_WIDTH = 400
RaidGUIControlGoldBarRewardDetails.HEIGHT = 400
RaidGUIControlGoldBarRewardDetails.LEFT_PANEL_W = 860
RaidGUIControlGoldBarRewardDetails.FONT = tweak_data.gui.fonts.din_compressed
RaidGUIControlGoldBarRewardDetails.TITLE_DESCRIPTION_Y = 690
RaidGUIControlGoldBarRewardDetails.TITLE_DESCRIPTION_H = 50
RaidGUIControlGoldBarRewardDetails.TITLE_DESCRIPTION_FONT_SIZE = tweak_data.gui.font_sizes.size_32
RaidGUIControlGoldBarRewardDetails.TITLE_DESCRIPTION_COLOR = tweak_data.gui.colors.raid_white
RaidGUIControlGoldBarRewardDetails.TITLE_PADDING_TOP = -14
RaidGUIControlGoldBarRewardDetails.TITLE_FONT_SIZE = tweak_data.gui.font_sizes.size_76
RaidGUIControlGoldBarRewardDetails.TITLE_COLOR = tweak_data.gui.colors.raid_red
RaidGUIControlGoldBarRewardDetails.REWARD_ICON_PANEL_Y = 44
RaidGUIControlGoldBarRewardDetails.REWARD_ICON_PANEL_H = 660
RaidGUIControlGoldBarRewardDetails.REWARD_QUANTITY_FEW = 3
RaidGUIControlGoldBarRewardDetails.REWARD_QUANTITY_MANY = 10
RaidGUIControlGoldBarRewardDetails.REWARD_ICON_SINGLE = "gold_bar_single"
RaidGUIControlGoldBarRewardDetails.REWARD_ICON_FEW = "gold_bar_3"
RaidGUIControlGoldBarRewardDetails.REWARD_ICON_MANY = "gold_bar_box"
RaidGUIControlGoldBarRewardDetails.DESCRIPTION_Y = 304
RaidGUIControlGoldBarRewardDetails.DESCRIPTION_W = 416
RaidGUIControlGoldBarRewardDetails.DESCRIPTION_FONT = tweak_data.gui.fonts.lato
RaidGUIControlGoldBarRewardDetails.DESCRIPTION_FONT_SIZE = tweak_data.gui.font_sizes.size_20
RaidGUIControlGoldBarRewardDetails.DESCRIPTION_COLOR = tweak_data.gui.colors.raid_grey
RaidGUIControlGoldBarRewardDetails.XP_VALUE_CENTER_Y_FROM_BOTTOM = 188
RaidGUIControlGoldBarRewardDetails.XP_VALUE_FONT_SIZE = tweak_data.gui.font_sizes.size_76
RaidGUIControlGoldBarRewardDetails.XP_VALUE_COLOR = tweak_data.gui.colors.raid_red
RaidGUIControlGoldBarRewardDetails.ITEM_TYPE_Y = 224
RaidGUIControlGoldBarRewardDetails.ITEM_TYPE_H = 64
RaidGUIControlGoldBarRewardDetails.ITEM_TYPE_FONT_SIZE = tweak_data.gui.font_sizes.size_38
RaidGUIControlGoldBarRewardDetails.ITEM_TYPE_COLOR = tweak_data.gui.colors.raid_white
function RaidGUIControlGoldBarRewardDetails:init(parent, params)
	slot7 = params

	RaidGUIControlGoldBarRewardDetails.super.init(slot4, self, parent)

	if not params then
		slot6 = "[RaidGUIControlGoldBarRewardDetails:init] Parameters not specified for the gold bar reward details"

		Application.error(slot4, Application)

		return 
	end

	slot5 = self

	self._create_control_panel(slot4)

	slot5 = self

	self._create_left_panel(slot4)

	slot5 = self

	self._create_gold_bar_value(slot4)

	slot5 = self

	self._create_reward_image(slot4)

	slot5 = self

	self._create_right_panel(slot4)

	slot5 = self

	self._create_description(slot4)

	slot5 = self

	self._create_item_type(slot4)

	return 
end
function RaidGUIControlGoldBarRewardDetails:_create_control_panel()
	slot3 = self._params
	local control_params = clone(slot2)
	control_params.x = control_params.x
	control_params.w = control_params.w or RaidGUIControlGoldBarRewardDetails.DEFAULT_WIDTH
	control_params.h = control_params.h or RaidGUIControlGoldBarRewardDetails.HEIGHT
	control_params.name = control_params.name .. "_gold_bars_panel"
	slot4 = self._panel
	control_params.layer = self._panel.layer("_gold_bars_panel") + 1
	slot5 = control_params
	self._control_panel = self._panel.panel("_gold_bars_panel", self._panel)
	self._object = self._control_panel

	return 
end
function RaidGUIControlGoldBarRewardDetails:_create_left_panel()
	local left_panel_params = {
		name = "left_panel",
		w = RaidGUIControlGoldBarRewardDetails.LEFT_PANEL_W
	}
	slot4 = self._object
	left_panel_params.h = self._object.h(slot3)
	slot5 = left_panel_params
	self._left_panel = self._object.panel(slot3, self._object)

	return 
end
function RaidGUIControlGoldBarRewardDetails:_create_gold_bar_value()
	local title_description_params = {
		name = "title_description",
		vertical = "center",
		alpha = 0,
		align = "left",
		y = RaidGUIControlGoldBarRewardDetails.TITLE_DESCRIPTION_Y,
		h = RaidGUIControlGoldBarRewardDetails.TITLE_DESCRIPTION_H,
		font = RaidGUIControlGoldBarRewardDetails.FONT,
		font_size = RaidGUIControlGoldBarRewardDetails.TITLE_DESCRIPTION_FONT_SIZE,
		color = RaidGUIControlGoldBarRewardDetails.TITLE_DESCRIPTION_COLOR
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
		name = "gold_bars_name",
		alpha = 0,
		align = "center",
		text = ""
	}
	slot10 = self._title_description
	title_params.y = self._title_description.y(self._title_description) + self._title_description.h(self._title_description) + RaidGUIControlGoldBarRewardDetails.TITLE_PADDING_TOP
	title_params.font = RaidGUIControlGoldBarRewardDetails.FONT
	title_params.font_size = RaidGUIControlGoldBarRewardDetails.TITLE_FONT_SIZE
	title_params.color = RaidGUIControlGoldBarRewardDetails.TITLE_COLOR
	slot10 = title_params
	self._gold_bar_value = self._left_panel.text(RaidGUIControlGoldBarRewardDetails.TITLE_PADDING_TOP, self._left_panel)
	slot9 = self

	self._layout_gold_bar_value(RaidGUIControlGoldBarRewardDetails.TITLE_PADDING_TOP)

	return 
end
function RaidGUIControlGoldBarRewardDetails:_layout_gold_bar_value()
	slot3 = self._gold_bar_value
	local _, _, w, h = self._gold_bar_value.text_rect(slot2)
	slot8 = w

	self._gold_bar_value.set_w(slot6, self._gold_bar_value)

	slot8 = h

	self._gold_bar_value.set_h(slot6, self._gold_bar_value)

	slot10 = self._left_panel
	slot8 = self._left_panel.w(slot9) / 2

	self._gold_bar_value.set_center_x(slot6, self._gold_bar_value)

	slot7 = self._title_description
	slot10 = self._gold_bar_value

	self._title_description.set_x(slot6, self._gold_bar_value.x(slot9))

	return 
end
function RaidGUIControlGoldBarRewardDetails:_create_reward_image()
	local reward_image_panel_params = {
		name = "reward_image_panel",
		y = RaidGUIControlGoldBarRewardDetails.REWARD_ICON_PANEL_Y
	}
	slot4 = self._left_panel
	reward_image_panel_params.w = self._left_panel.w(slot3)
	reward_image_panel_params.h = RaidGUIControlGoldBarRewardDetails.REWARD_ICON_PANEL_H
	slot5 = reward_image_panel_params
	self._reward_image_panel = self._left_panel.panel(slot3, self._left_panel)
	local reward_image_params = {
		name = "reward_image",
		alpha = 0,
		texture = tweak_data.gui.icons[RaidGUIControlGoldBarRewardDetails.REWARD_ICON_SINGLE].texture,
		texture_rect = tweak_data.gui.icons[RaidGUIControlGoldBarRewardDetails.REWARD_ICON_SINGLE].texture_rect
	}
	slot6 = reward_image_params
	self._reward_image = self._reward_image_panel.bitmap(RaidGUIControlGoldBarRewardDetails.REWARD_ICON_SINGLE, self._reward_image_panel)
	slot8 = self._reward_image_panel
	slot6 = self._reward_image_panel.w(slot7) / 2

	self._reward_image.set_center_x(RaidGUIControlGoldBarRewardDetails.REWARD_ICON_SINGLE, self._reward_image)

	slot8 = self._reward_image_panel
	slot6 = self._reward_image_panel.h(slot7) / 2

	self._reward_image.set_center_y(RaidGUIControlGoldBarRewardDetails.REWARD_ICON_SINGLE, self._reward_image)

	return 
end
function RaidGUIControlGoldBarRewardDetails:_create_right_panel()
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
function RaidGUIControlGoldBarRewardDetails:_create_description()
	local description_params = {
		vertical = "top",
		name = "description",
		wrap = true,
		align = "left",
		alpha = 0,
		y = RaidGUIControlGoldBarRewardDetails.DESCRIPTION_Y,
		w = RaidGUIControlGoldBarRewardDetails.DESCRIPTION_W,
		font = RaidGUIControlGoldBarRewardDetails.DESCRIPTION_FONT,
		font_size = RaidGUIControlGoldBarRewardDetails.DESCRIPTION_FONT_SIZE,
		color = RaidGUIControlGoldBarRewardDetails.DESCRIPTION_COLOR
	}
	slot5 = "menu_loot_screen_gold_bars_description"
	description_params.text = self.translate(slot3, self)
	slot5 = description_params
	self._description = self._right_panel.text(slot3, self._right_panel)
	slot4 = self._description
	slot7 = self._right_panel

	self._description.set_right(slot3, self._right_panel.w(slot6))

	return 
end
function RaidGUIControlGoldBarRewardDetails:_create_item_type()
	local item_type_params = {
		name = "item_type",
		vertical = "center",
		align = "left",
		alpha = 0
	}
	slot4 = self._description
	item_type_params.x = self._description.x(slot3)
	item_type_params.y = RaidGUIControlGoldBarRewardDetails.ITEM_TYPE_Y
	slot4 = self._right_panel
	item_type_params.w = self._right_panel.w(slot3)
	item_type_params.h = RaidGUIControlGoldBarRewardDetails.ITEM_TYPE_H
	item_type_params.font = RaidGUIControlGoldBarRewardDetails.FONT
	item_type_params.font_size = RaidGUIControlGoldBarRewardDetails.ITEM_TYPE_FONT_SIZE
	item_type_params.color = RaidGUIControlGoldBarRewardDetails.ITEM_TYPE_COLOR
	slot6 = true
	item_type_params.text = self.translate(slot3, self, "menu_loot_screen_gold_bars_type")
	slot5 = item_type_params
	self._item_type = self._right_panel.text(slot3, self._right_panel)

	return 
end
function RaidGUIControlGoldBarRewardDetails:show()
	slot3 = self

	RaidGUIControlGoldBarRewardDetails.super.show(slot2)

	local duration = 1.9
	local t = 0
	slot5 = self._reward_image
	local original_image_w, original_image_h = self._reward_image.size(slot4)
	local image_duration = 0.1
	local image_duration_slowdown = 1.75
	slot9 = self._title_description
	local title_description_y = self._title_description.y(slot8)
	local title_description_offset = 35
	slot11 = self._gold_bar_value
	local gold_bar_value_y = self._gold_bar_value.y(slot10)
	local gold_bar_value_offset = 20
	local title_delay = 0
	local title_duration = 1
	slot15 = self._description
	local description_x = self._description.x(slot14)
	local description_offset = 30
	slot17 = self._item_type
	local item_type_x = self._item_type.x(slot16)
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

			self._gold_bar_value.set_alpha(t - title_delay, self._gold_bar_value)

			slot23 = current_title_alpha

			self._description.set_alpha(t - title_delay, self._description)

			slot23 = current_title_alpha

			self._item_type.set_alpha(t - title_delay, self._item_type)

			slot25 = title_duration
			local title_description_current_offset = Easing.quartic_out(t - title_delay, t - title_delay, title_description_offset, -title_description_offset)
			slot24 = title_description_y - title_description_current_offset

			self._title_description.set_y(t - title_delay, self._title_description)

			slot26 = title_duration
			local customization_name_current_offset = Easing.quartic_out(t - title_delay, t - title_delay, gold_bar_value_offset, -gold_bar_value_offset)
			slot25 = gold_bar_value_y - customization_name_current_offset

			self._gold_bar_value.set_y(t - title_delay, self._gold_bar_value)

			slot27 = title_duration
			local description_current_offset = Easing.quartic_out(t - title_delay, t - title_delay, -description_offset, description_offset)
			slot26 = description_x + description_current_offset

			self._description.set_x(t - title_delay, self._description)

			slot28 = title_duration
			local item_type_current_offset = Easing.quartic_out(t - title_delay, t - title_delay, -item_type_offset, item_type_offset)
			slot27 = item_type_x + item_type_current_offset

			self._item_type.set_x(t - title_delay, self._item_type)
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

	self._gold_bar_value.set_alpha(slot18, self._gold_bar_value)

	slot20 = gold_bar_value_y

	self._gold_bar_value.set_y(slot18, self._gold_bar_value)

	slot20 = 1

	self._description.set_alpha(slot18, self._description)

	slot20 = description_x

	self._description.set_x(slot18, self._description)

	slot20 = 1

	self._item_type.set_alpha(slot18, self._item_type)

	slot20 = item_type_x

	self._item_type.set_x(slot18, self._item_type)

	return 
end
function RaidGUIControlGoldBarRewardDetails:set_gold_bar_reward(amount)
	local text = ""

	if amount == 1 then
		slot7 = true
		text = self.translate(slot4, self, "menu_loot_screen_gold_bars_single")
	else
		slot9 = true
		text = (amount or 0) .. " " .. self.translate(slot6, self, "menu_loot_screen_gold_bars")
	end

	slot6 = text

	self._gold_bar_value.set_text(slot4, self._gold_bar_value)

	slot5 = self

	self._layout_gold_bar_value(slot4)

	local icon = RaidGUIControlGoldBarRewardDetails.REWARD_ICON_SINGLE

	if amount and RaidGUIControlGoldBarRewardDetails.REWARD_QUANTITY_MANY <= amount then
		icon = RaidGUIControlGoldBarRewardDetails.REWARD_ICON_MANY
	elseif amount and RaidGUIControlGoldBarRewardDetails.REWARD_QUANTITY_FEW <= amount then
		icon = RaidGUIControlGoldBarRewardDetails.REWARD_ICON_FEW
	end

	slot7 = tweak_data.gui.icons[icon].texture

	self._reward_image.set_image(slot5, self._reward_image)

	slot6 = self._reward_image
	slot9 = tweak_data.gui.icons[icon].texture_rect

	self._reward_image.set_texture_rect(slot5, unpack(slot8))

	return 
end

return 
