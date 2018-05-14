if not RaidGUIControlXPRewardDetails then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlXPRewardDetails = slot0
RaidGUIControlXPRewardDetails.DEFAULT_WIDTH = 400
RaidGUIControlXPRewardDetails.HEIGHT = 400
RaidGUIControlXPRewardDetails.LEFT_PANEL_W = 860
RaidGUIControlXPRewardDetails.FONT = tweak_data.gui.fonts.din_compressed
RaidGUIControlXPRewardDetails.TITLE_DESCRIPTION_Y = 690
RaidGUIControlXPRewardDetails.TITLE_DESCRIPTION_H = 50
RaidGUIControlXPRewardDetails.TITLE_DESCRIPTION_FONT_SIZE = tweak_data.gui.font_sizes.size_32
RaidGUIControlXPRewardDetails.TITLE_DESCRIPTION_COLOR = tweak_data.gui.colors.raid_white
RaidGUIControlXPRewardDetails.TITLE_PADDING_TOP = -14
RaidGUIControlXPRewardDetails.TITLE_FONT_SIZE = tweak_data.gui.font_sizes.size_76
RaidGUIControlXPRewardDetails.TITLE_COLOR = tweak_data.gui.colors.raid_red
RaidGUIControlXPRewardDetails.REWARD_ICON_PANEL_Y = 144
RaidGUIControlXPRewardDetails.REWARD_ICON_PANEL_H = 560
RaidGUIControlXPRewardDetails.REWARD_ICON = "rwd_xp_large"
RaidGUIControlXPRewardDetails.TITLE_DESCRIPTION_RIGHT_Y = 224
RaidGUIControlXPRewardDetails.TITLE_DESCRIPTION_RIGHT_H = 72
RaidGUIControlXPRewardDetails.TITLE_DESCRIPTION_RIGHT_FONT_SIZE = tweak_data.gui.font_sizes.size_38
RaidGUIControlXPRewardDetails.TITLE_DESCRIPTION_RIGHT_COLOR = tweak_data.gui.colors.raid_white
RaidGUIControlXPRewardDetails.DESCRIPTION_Y = 304
RaidGUIControlXPRewardDetails.DESCRIPTION_W = 416
RaidGUIControlXPRewardDetails.DESCRIPTION_FONT = tweak_data.gui.fonts.lato
RaidGUIControlXPRewardDetails.DESCRIPTION_FONT_SIZE = tweak_data.gui.font_sizes.size_20
RaidGUIControlXPRewardDetails.DESCRIPTION_COLOR = tweak_data.gui.colors.raid_grey
RaidGUIControlXPRewardDetails.XP_VALUE_CENTER_Y_FROM_BOTTOM = 60
RaidGUIControlXPRewardDetails.XP_VALUE_FONT_SIZE = tweak_data.gui.font_sizes.size_56
RaidGUIControlXPRewardDetails.XP_VALUE_COLOR = tweak_data.gui.colors.raid_white
RaidGUIControlXPRewardDetails.XP_VALUE_DESCRIPTION_PADDING = 20
RaidGUIControlXPRewardDetails.XP_VALUE_LABEL_FONT_SIZE = tweak_data.gui.font_sizes.size_20
RaidGUIControlXPRewardDetails.XP_VALUE_LABEL_COLOR = tweak_data.gui.colors.raid_grey
RaidGUIControlXPRewardDetails.XP_VALUE_LABEL_VALUE_PADDING = 0
function RaidGUIControlXPRewardDetails:init(parent, params)
	slot7 = params

	RaidGUIControlXPRewardDetails.super.init(slot4, self, parent)

	if not params then
		slot6 = "[RaidGUIControlXPRewardDetails:init] Parameters not specified for the XP reward details"

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

	self._create_reward_image(slot4)

	slot5 = self

	self._create_right_panel(slot4)

	slot5 = self

	self._create_description(slot4)

	slot5 = self

	self._create_xp_value(slot4)

	RaidGUIControlXPRewardDetails.gui = self

	return 
end
function RaidGUIControlXPRewardDetails:_create_control_panel()
	slot3 = self._params
	local control_params = clone(slot2)
	control_params.x = control_params.x
	control_params.w = control_params.w or RaidGUIControlXPRewardDetails.DEFAULT_WIDTH
	control_params.h = control_params.h or RaidGUIControlXPRewardDetails.HEIGHT
	control_params.name = control_params.name .. "_customization_panel"
	slot4 = self._panel
	control_params.layer = self._panel.layer("_customization_panel") + 1
	slot5 = control_params
	self._control_panel = self._panel.panel("_customization_panel", self._panel)
	self._object = self._control_panel

	return 
end
function RaidGUIControlXPRewardDetails:_create_left_panel()
	local left_panel_params = {
		name = "left_panel",
		w = RaidGUIControlXPRewardDetails.LEFT_PANEL_W
	}
	slot4 = self._object
	left_panel_params.h = self._object.h(slot3)
	slot5 = left_panel_params
	self._left_panel = self._object.panel(slot3, self._object)

	return 
end
function RaidGUIControlXPRewardDetails:_create_title()
	local title_description_params = {
		name = "title_description",
		vertical = "center",
		alpha = 0,
		align = "left",
		y = RaidGUIControlXPRewardDetails.TITLE_DESCRIPTION_Y,
		h = RaidGUIControlXPRewardDetails.TITLE_DESCRIPTION_H,
		font = RaidGUIControlXPRewardDetails.FONT,
		font_size = RaidGUIControlXPRewardDetails.TITLE_DESCRIPTION_FONT_SIZE,
		color = RaidGUIControlXPRewardDetails.TITLE_DESCRIPTION_COLOR
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
		align = "center"
	}
	slot10 = self._title_description
	title_params.y = self._title_description.y(self._title_description) + self._title_description.h(self._title_description) + RaidGUIControlXPRewardDetails.TITLE_PADDING_TOP
	title_params.font = RaidGUIControlXPRewardDetails.FONT
	title_params.font_size = RaidGUIControlXPRewardDetails.TITLE_FONT_SIZE
	title_params.color = RaidGUIControlXPRewardDetails.TITLE_COLOR
	slot11 = true
	title_params.text = self.translate(RaidGUIControlXPRewardDetails.TITLE_PADDING_TOP, self, "menu_loot_screen_experience_bonus_title")
	slot10 = title_params
	self._customization_name = self._left_panel.text(RaidGUIControlXPRewardDetails.TITLE_PADDING_TOP, self._left_panel)
	slot9 = self

	self._layout_title(RaidGUIControlXPRewardDetails.TITLE_PADDING_TOP)

	return 
end
function RaidGUIControlXPRewardDetails:_layout_title()
	slot3 = self._customization_name
	local _, _, w, h = self._customization_name.text_rect(slot2)
	slot8 = w

	self._customization_name.set_w(slot6, self._customization_name)

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
function RaidGUIControlXPRewardDetails:_create_reward_image()
	local reward_image_panel_params = {
		name = "reward_image_panel",
		y = RaidGUIControlXPRewardDetails.REWARD_ICON_PANEL_Y
	}
	slot4 = self._left_panel
	reward_image_panel_params.w = self._left_panel.w(slot3)
	reward_image_panel_params.h = RaidGUIControlXPRewardDetails.REWARD_ICON_PANEL_H
	slot5 = reward_image_panel_params
	self._reward_image_panel = self._left_panel.panel(slot3, self._left_panel)
	local reward_image_params = {
		name = "reward_image",
		alpha = 0,
		texture = tweak_data.gui.icons[RaidGUIControlXPRewardDetails.REWARD_ICON].texture,
		texture_rect = tweak_data.gui.icons[RaidGUIControlXPRewardDetails.REWARD_ICON].texture_rect
	}
	slot6 = reward_image_params
	self._reward_image = self._reward_image_panel.bitmap(RaidGUIControlXPRewardDetails.REWARD_ICON, self._reward_image_panel)
	slot8 = self._reward_image_panel
	slot6 = self._reward_image_panel.w(slot7) / 2

	self._reward_image.set_center_x(RaidGUIControlXPRewardDetails.REWARD_ICON, self._reward_image)

	slot8 = self._reward_image_panel
	slot6 = self._reward_image_panel.h(slot7) / 2

	self._reward_image.set_center_y(RaidGUIControlXPRewardDetails.REWARD_ICON, self._reward_image)

	return 
end
function RaidGUIControlXPRewardDetails:_create_xp_value()
	local xp_value_params = {
		text = "456 XP",
		name = "xp_value",
		alpha = 0,
		font = RaidGUIControlXPRewardDetails.FONT,
		font_size = RaidGUIControlXPRewardDetails.XP_VALUE_FONT_SIZE,
		color = RaidGUIControlXPRewardDetails.XP_VALUE_COLOR
	}
	slot5 = xp_value_params
	self._xp_value_text = self._right_panel.text(slot3, self._right_panel)
	local xp_value_label_params = {
		name = "xp_value_label",
		alpha = 0,
		font = RaidGUIControlXPRewardDetails.FONT,
		font_size = RaidGUIControlXPRewardDetails.XP_VALUE_LABEL_FONT_SIZE,
		color = RaidGUIControlXPRewardDetails.XP_VALUE_LABEL_COLOR
	}
	slot7 = true
	xp_value_label_params.text = self.translate(self._right_panel, self, "xp_label")
	slot6 = xp_value_label_params
	self._xp_value_label = self._right_panel.text(self._right_panel, self._right_panel)
	slot5 = self

	self._layout_xp_value(self._right_panel)

	return 
end
function RaidGUIControlXPRewardDetails:_layout_xp_value()
	slot3 = self._xp_value_text
	local _, _, w, h = self._xp_value_text.text_rect(slot2)
	slot8 = w

	self._xp_value_text.set_w(slot6, self._xp_value_text)

	slot8 = h

	self._xp_value_text.set_h(slot6, self._xp_value_text)

	slot7 = self._xp_value_text
	slot10 = self._description

	self._xp_value_text.set_x(slot6, self._description.x(slot9))

	slot11 = self._description
	slot8 = self._description.y(slot9) + self._description.h(self._description) + RaidGUIControlXPRewardDetails.XP_VALUE_DESCRIPTION_PADDING

	self._xp_value_text.set_y(slot6, self._xp_value_text)

	slot7 = self._xp_value_label
	local x1, y1, w1, h1 = self._xp_value_label.text_rect(slot6)
	slot12 = w1

	self._xp_value_label.set_w(self._description, self._xp_value_label)

	slot12 = h1

	self._xp_value_label.set_h(self._description, self._xp_value_label)

	slot11 = self._xp_value_label
	slot14 = self._xp_value_text

	self._xp_value_label.set_x(self._description, self._xp_value_text.x(slot13))

	slot15 = self._xp_value_text
	slot12 = self._xp_value_text.y(slot13) + self._xp_value_text.h(self._xp_value_text) + RaidGUIControlXPRewardDetails.XP_VALUE_LABEL_VALUE_PADDING

	self._xp_value_label.set_y(self._description, self._xp_value_label)

	return 
end
function RaidGUIControlXPRewardDetails:show()
	slot3 = self

	RaidGUIControlXPRewardDetails.super.show(slot2)

	local duration = 1.9
	local t = 0
	slot5 = self._reward_image
	local original_image_w, original_image_h = self._reward_image.size(slot4)
	local image_duration = 0.1
	local image_duration_slowdown = 1.75
	slot9 = self._title_description
	local title_description_y = self._title_description.y(slot8)
	local title_description_offset = 40
	slot11 = self._customization_name
	local customization_name_y = self._customization_name.y(slot10)
	local customization_name_offset = 30
	local xp_value_offset = 20
	local title_delay = 0
	local title_duration = 1
	slot16 = self._description
	local description_x = self._description.x(slot15)
	local description_offset = 30
	slot18 = self._title_description_right
	local title_description_right_x = self._title_description_right.x(slot17)
	local title_description_right_offset = 30
	local xp_value_text_y = self._xp_value_text.y(slot19)
	slot21 = self._xp_value_label
	local xp_value_label_y = self._xp_value_label.y(self._xp_value_text)

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot26 = image_duration
		local current_alpha = Easing.quartic_out(slot22, t, 0, 1)
		slot25 = current_alpha

		self._reward_image.set_alpha(t, self._reward_image)

		if t < image_duration then
			slot27 = image_duration
			local current_scale = Easing.linear(slot23, t, 1.4, -0.35)
			slot27 = original_image_h * current_scale

			self._reward_image.set_size(t, self._reward_image, original_image_w * current_scale)
		elseif image_duration < t and t < image_duration + image_duration_slowdown then
			slot27 = image_duration_slowdown
			local current_scale = Easing.quartic_out(slot23, t - image_duration, 1.05, -0.05)
			slot27 = original_image_h * current_scale

			self._reward_image.set_size(t - image_duration, self._reward_image, original_image_w * current_scale)
		elseif image_duration + image_duration_slowdown < t then
			slot26 = original_image_h

			self._reward_image.set_size(slot23, self._reward_image, original_image_w)
		end

		slot27 = self._reward_image_panel
		slot25 = self._reward_image_panel.w(slot26) / 2

		self._reward_image.set_center_x(slot23, self._reward_image)

		slot27 = self._reward_image_panel
		slot25 = self._reward_image_panel.h(slot26) / 2

		self._reward_image.set_center_y(slot23, self._reward_image)

		if title_delay < t then
			slot27 = title_duration
			local current_title_alpha = Easing.quartic_out(slot23, t - title_delay, 0, 1)
			slot26 = current_title_alpha

			self._title_description.set_alpha(t - title_delay, self._title_description)

			slot26 = current_title_alpha

			self._customization_name.set_alpha(t - title_delay, self._customization_name)

			slot26 = current_title_alpha

			self._xp_value_text.set_alpha(t - title_delay, self._xp_value_text)

			slot26 = current_title_alpha

			self._xp_value_label.set_alpha(t - title_delay, self._xp_value_label)

			slot26 = current_title_alpha

			self._description.set_alpha(t - title_delay, self._description)

			slot26 = current_title_alpha

			self._title_description_right.set_alpha(t - title_delay, self._title_description_right)

			slot28 = title_duration
			local title_description_current_offset = Easing.quartic_out(t - title_delay, t - title_delay, title_description_offset, -title_description_offset)
			slot27 = title_description_y - title_description_current_offset

			self._title_description.set_y(t - title_delay, self._title_description)

			slot29 = title_duration
			local customization_name_current_offset = Easing.quartic_out(t - title_delay, t - title_delay, customization_name_offset, -customization_name_offset)
			slot28 = customization_name_y - customization_name_current_offset

			self._customization_name.set_y(t - title_delay, self._customization_name)

			slot30 = title_duration
			local xp_value_current_offset = Easing.quartic_out(t - title_delay, t - title_delay, xp_value_offset, -xp_value_offset)
			slot29 = xp_value_text_y - xp_value_current_offset

			self._xp_value_text.set_y(t - title_delay, self._xp_value_text)

			slot31 = title_duration
			local xp_value_label_current_offset = Easing.quartic_out(t - title_delay, t - title_delay, xp_value_offset, -xp_value_offset)
			slot30 = xp_value_label_y - xp_value_label_current_offset

			self._xp_value_label.set_y(t - title_delay, self._xp_value_label)

			slot32 = title_duration
			local description_current_offset = Easing.quartic_out(t - title_delay, t - title_delay, -description_offset, description_offset)
			slot31 = description_x + description_current_offset

			self._description.set_x(t - title_delay, self._description)

			slot33 = title_duration
			local title_description_right_current_offset = Easing.quartic_out(t - title_delay, t - title_delay, -title_description_right_offset, title_description_right_offset)
			slot32 = title_description_right_x + title_description_right_current_offset

			self._title_description_right.set_x(t - title_delay, self._title_description_right)
		end
	end

	slot23 = 1

	self._reward_image.set_alpha(slot21, self._reward_image)
	self._reward_image.set_size(slot21, self._reward_image, original_image_w)

	slot25 = self._reward_image_panel
	slot23 = self._reward_image_panel.w(original_image_h) / 2

	self._reward_image.set_center_x(slot21, self._reward_image)

	slot25 = self._reward_image_panel
	slot23 = self._reward_image_panel.h(original_image_h) / 2

	self._reward_image.set_center_y(slot21, self._reward_image)

	slot23 = 1

	self._title_description.set_alpha(slot21, self._title_description)

	slot23 = title_description_y

	self._title_description.set_y(slot21, self._title_description)

	slot23 = 1

	self._customization_name.set_alpha(slot21, self._customization_name)

	slot23 = customization_name_y

	self._customization_name.set_y(slot21, self._customization_name)

	slot23 = 1

	self._description.set_alpha(slot21, self._description)

	slot23 = description_x

	self._description.set_x(slot21, self._description)

	slot23 = 1

	self._title_description_right.set_alpha(slot21, self._title_description_right)

	slot23 = title_description_right_x

	self._title_description_right.set_x(slot21, self._title_description_right)

	return 
end
function RaidGUIControlXPRewardDetails:_create_right_panel()
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
function RaidGUIControlXPRewardDetails:_create_description()
	local description_params = {
		vertical = "top",
		name = "description",
		wrap = true,
		align = "left",
		alpha = 0,
		y = RaidGUIControlXPRewardDetails.DESCRIPTION_Y,
		w = RaidGUIControlXPRewardDetails.DESCRIPTION_W,
		font = RaidGUIControlXPRewardDetails.DESCRIPTION_FONT,
		font_size = RaidGUIControlXPRewardDetails.DESCRIPTION_FONT_SIZE,
		color = RaidGUIControlXPRewardDetails.DESCRIPTION_COLOR
	}
	slot5 = "menu_loot_screen_experience_bonus_description"
	description_params.text = self.translate(slot3, self)
	slot5 = description_params
	self._description = self._right_panel.text(slot3, self._right_panel)
	slot7 = self._right_panel

	self._description.set_right(slot3, self._right_panel.w(slot6))

	local title_description_right_params = {
		name = "title_description_right",
		wrap = true,
		align = "left",
		alpha = 0,
		vertical = "center"
	}
	slot5 = self._description
	title_description_right_params.x = self._description.x(self._description)
	title_description_right_params.y = RaidGUIControlXPRewardDetails.TITLE_DESCRIPTION_RIGHT_Y
	title_description_right_params.w = RaidGUIControlXPRewardDetails.DESCRIPTION_W
	title_description_right_params.h = RaidGUIControlXPRewardDetails.TITLE_DESCRIPTION_RIGHT_H
	title_description_right_params.font = RaidGUIControlXPRewardDetails.FONT
	title_description_right_params.font_size = RaidGUIControlXPRewardDetails.TITLE_DESCRIPTION_RIGHT_FONT_SIZE
	title_description_right_params.color = RaidGUIControlXPRewardDetails.TITLE_DESCRIPTION_RIGHT_COLOR
	slot7 = true
	title_description_right_params.text = self.translate(self._description, self, "menu_loot_screen_bonus_xp_points")
	slot6 = title_description_right_params
	self._title_description_right = self._right_panel.text(self._description, self._right_panel)
	slot5 = self

	self._layout_description(self._description)

	return 
end
function RaidGUIControlXPRewardDetails:_layout_description()
	slot3 = self._description
	local x, y, w, h = self._description.text_rect(slot2)
	slot8 = w

	self._description.set_w(slot6, self._description)

	slot8 = h

	self._description.set_h(slot6, self._description)

	return 
end
function RaidGUIControlXPRewardDetails:set_xp_reward(xp_reward)
	slot5 = "+" .. xp_reward

	self._xp_value_text.set_text(slot3, self._xp_value_text)

	slot4 = self

	self._layout_xp_value(slot3)

	return 
end

return 
