if not RaidGUIControlTopStatBig then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlTopStatBig = slot0
RaidGUIControlTopStatBig.WIDTH = 576
RaidGUIControlTopStatBig.HEIGHT = 928
RaidGUIControlTopStatBig.ICON_BACKGROUND = "bonus_bg_flag"
RaidGUIControlTopStatBig.ICON_BACKGROUND_FAIL = "bonus_bg_flag_fail"
RaidGUIControlTopStatBig.ICON_BACKGROUND_CENTER_Y = 413
RaidGUIControlTopStatBig.STAT_NAME_CENTER_Y_FROM_BOTTOM = 226
RaidGUIControlTopStatBig.STAT_NAME_H = 64
RaidGUIControlTopStatBig.STAT_NAME_COLOR = tweak_data.gui.colors.raid_grey
RaidGUIControlTopStatBig.STAT_NAME_FONT_SIZE = tweak_data.gui.font_sizes.size_32
RaidGUIControlTopStatBig.STAT_VALUE_CENTER_Y_FROM_BOTTOM = 101
RaidGUIControlTopStatBig.STAT_VALUE_H = 96
RaidGUIControlTopStatBig.STAT_VALUE_COLOR = tweak_data.gui.colors.raid_dirty_white
RaidGUIControlTopStatBig.STAT_VALUE_FONT_SIZE = tweak_data.gui.font_sizes.size_84
RaidGUIControlTopStatBig.PLAYER_NAME_CENTER_Y_FROM_BOTTOM = 179
RaidGUIControlTopStatBig.PLAYER_NAME_H = 64
RaidGUIControlTopStatBig.PLAYER_NAME_COLOR = tweak_data.gui.colors.raid_white
RaidGUIControlTopStatBig.PLAYER_NAME_FONT_SIZE = tweak_data.gui.font_sizes.menu_list
RaidGUIControlTopStatBig.FONT = tweak_data.gui.fonts.din_compressed
RaidGUIControlTopStatBig.FONT_KERNING = tweak_data.hud.medium_kern
function RaidGUIControlTopStatBig:init(parent, params)
	slot7 = params

	RaidGUIControlTopStatBig.super.init(slot4, self, parent)

	if not params then
		slot7 = params.name

		Application.error(slot4, Application, "[RaidGUIControlTopStatBig:init] Parameters not specified for RaidGUIControlTopStatBig")

		return 
	end

	slot5 = self

	self._create_panel(slot4)

	slot5 = self

	self._create_stat_info(slot4)

	slot5 = self

	self._create_icon_background(slot4)

	self._shown = false

	return 
end
function RaidGUIControlTopStatBig:close()
	return 
end
function RaidGUIControlTopStatBig:_create_panel()
	slot3 = self._params
	local control_params = clone(slot2)
	control_params.x = control_params.x or 0
	control_params.w = RaidGUIControlTopStatBig.WIDTH
	control_params.h = RaidGUIControlTopStatBig.HEIGHT
	control_params.name = control_params.name .. "_top_stat_big_panel"
	slot4 = self._panel
	control_params.layer = self._panel.layer("_top_stat_big_panel") + 1
	slot5 = control_params
	self._control_panel = self._panel.panel("_top_stat_big_panel", self._panel)
	self._object = self._control_panel

	return 
end
function RaidGUIControlTopStatBig:_create_stat_info()
	local player_name_params = {
		vertical = "center",
		name = "player_name_label",
		align = "center",
		alpha = 0,
		text = "PLAYER NAME",
		layer = 1
	}
	slot4 = self._object
	player_name_params.w = self._object.w(slot3)
	player_name_params.h = RaidGUIControlTopStatBig.PLAYER_NAME_H
	player_name_params.font = RaidGUIControlTopStatBig.FONT
	player_name_params.font_size = RaidGUIControlTopStatBig.PLAYER_NAME_FONT_SIZE
	player_name_params.color = RaidGUIControlTopStatBig.PLAYER_NAME_COLOR
	slot5 = player_name_params
	self._player_name_label = self._object.label(slot3, self._object)
	slot5 = self._object.h(slot6) - RaidGUIControlTopStatBig.PLAYER_NAME_CENTER_Y_FROM_BOTTOM

	self._player_name_label.set_center_y(slot3, self._player_name_label)

	local stat_name_params = {
		vertical = "center",
		wrap = true,
		align = "center",
		name = "stat_name_label",
		word_wrap = true,
		text = "Most specials killed",
		alpha = 0,
		layer = 3
	}
	slot5 = self._object
	stat_name_params.w = self._object.w(self._player_name_label)
	stat_name_params.h = RaidGUIControlTopStatBig.STAT_NAME_H
	stat_name_params.font = RaidGUIControlTopStatBig.FONT
	stat_name_params.font_size = RaidGUIControlTopStatBig.STAT_NAME_FONT_SIZE
	stat_name_params.color = RaidGUIControlTopStatBig.STAT_NAME_COLOR
	slot6 = stat_name_params
	self._stat_name_label = self._object.label(self._player_name_label, self._object)
	slot6 = self._object.h(self._object) - RaidGUIControlTopStatBig.STAT_NAME_CENTER_Y_FROM_BOTTOM

	self._stat_name_label.set_center_y(self._player_name_label, self._stat_name_label)

	local stat_value_params = {
		vertical = "center",
		wrap = true,
		align = "center",
		name = "stat_value_label",
		word_wrap = true,
		text = "1",
		alpha = 0,
		layer = 3
	}
	slot6 = self._object
	stat_value_params.w = self._object.w(self._stat_name_label)
	stat_value_params.h = RaidGUIControlTopStatBig.STAT_VALUE_H
	stat_value_params.font = RaidGUIControlTopStatBig.FONT
	stat_value_params.font_size = RaidGUIControlTopStatBig.STAT_VALUE_FONT_SIZE
	stat_value_params.color = RaidGUIControlTopStatBig.STAT_VALUE_COLOR
	slot7 = stat_value_params
	self._stat_value_label = self._object.label(self._stat_name_label, self._object)
	slot9 = self._object
	slot7 = self._object.h(self._object) - RaidGUIControlTopStatBig.STAT_VALUE_CENTER_Y_FROM_BOTTOM

	self._stat_value_label.set_center_y(self._stat_name_label, self._stat_value_label)

	return 
end
function RaidGUIControlTopStatBig:_create_icon_background()
	local icon_background_params = {
		name = "icon_background",
		alpha = 0,
		texture = tweak_data.gui.icons[RaidGUIControlTopStatBig.ICON_BACKGROUND].texture,
		texture_rect = tweak_data.gui.icons[RaidGUIControlTopStatBig.ICON_BACKGROUND].texture_rect
	}
	slot5 = icon_background_params
	local icon_background = self._object.bitmap(RaidGUIControlTopStatBig.ICON_BACKGROUND, self._object)
	slot8 = self._object
	slot6 = self._object.w(slot7) / 2

	icon_background.set_center_x(self._object, icon_background)

	slot6 = RaidGUIControlTopStatBig.ICON_BACKGROUND_CENTER_Y

	icon_background.set_center_y(self._object, icon_background)

	return 
end
function RaidGUIControlTopStatBig:set_data(data)
	slot4 = self._player_name_label
	slot7 = data.player_nickname

	self._player_name_label.set_text(slot3, utf8.to_upper(slot6))

	slot4 = self._stat_name_label
	slot9 = true

	self._stat_name_label.set_text(slot3, self.translate(slot6, self, data.text_id))

	local score = data.score

	if data.score_format then
		slot6 = data.score
		score = string.format(slot4, data.score_format)
	end

	slot6 = score

	self._stat_value_label.set_text(slot4, self._stat_value_label)

	local icon_params = {
		name = "stat_icon",
		alpha = 0,
		texture = tweak_data.gui.icons[data.icon].texture,
		texture_rect = tweak_data.gui.icons[data.icon].texture_rect
	}
	slot7 = icon_params
	self._stat_icon = self._object.bitmap(data.icon, self._object)
	slot7 = self._object.w(slot8) / 2

	self._stat_icon.set_center_x(data.icon, self._stat_icon)

	self._sound_effect = data.sound_effect
	slot7 = "icon_background"
	local icon_background = self._object.child(data.icon, self._object)
	slot11 = icon_background
	slot8 = icon_background.y(self._object) + icon_background.h(icon_background) / 2

	self._stat_icon.set_center_y(self._object, self._stat_icon)

	if not data.mission_successful then
		slot8 = tweak_data.gui.icons[RaidGUIControlTopStatBig.ICON_BACKGROUND_FAIL].texture

		icon_background.set_image(slot6, icon_background)

		slot7 = icon_background
		slot10 = tweak_data.gui.icons[RaidGUIControlTopStatBig.ICON_BACKGROUND_FAIL].texture_rect

		icon_background.set_texture_rect(slot6, unpack(RaidGUIControlTopStatBig.ICON_BACKGROUND_FAIL))
	end

	return 
end
function RaidGUIControlTopStatBig:animate_show(delay, clbk)
	slot8 = clbk

	Application.trace(slot4, Application, "RaidGUIControlTopStatBig:animate_show", delay)

	delay = delay or 0
	slot10 = "_animate_show_stat"
	slot9 = self._stat_name_label

	self._stat_icon.animate(slot4, self._stat_icon, callback(slot7, self, self), delay, self._stat_icon)

	slot10 = "_animate_show_result"
	slot8 = clbk

	self._player_name_label._object.animate(slot4, self._player_name_label._object, callback(delay, self, self), delay + 0.6)

	return 
end
function RaidGUIControlTopStatBig:shown()
	return self._shown
end
function RaidGUIControlTopStatBig:_animate_show_stat(panel, delay, icon, label)
	if delay then
		slot7 = delay

		wait(slot6)
	end

	local t = 0
	local duration = 0.7
	local initial_offset = 15
	local stat_icon_y = icon.y(slot9)
	local stat_name_y = label.y(icon)
	slot13 = "icon_background"
	local icon_background = self._object.child(label, self._object)
	local icon_background_y = icon_background.y(self._object)
	slot15 = icon_background_y + initial_offset

	icon_background.set_y(icon_background, icon_background)

	slot15 = stat_icon_y + initial_offset

	icon.set_y(icon_background, icon)

	slot15 = stat_name_y + initial_offset

	label.set_y(icon_background, label)

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot18 = duration
		local current_offset = Easing.quintic_out(slot14, t, initial_offset, -initial_offset)
		slot17 = icon_background_y + current_offset

		icon_background.set_y(t, icon_background)

		slot17 = stat_icon_y + current_offset

		icon.set_y(t, icon)

		slot17 = stat_name_y + current_offset

		label.set_y(t, label)

		slot19 = duration
		local current_alpha = Easing.quintic_out(t, t, 0, 1)
		slot18 = current_alpha

		icon_background.set_alpha(t, icon_background)

		slot18 = current_alpha

		icon.set_alpha(t, icon)

		slot18 = current_alpha

		label.set_alpha(t, label)
	end

	slot15 = icon_background_y

	icon_background.set_y(slot13, icon_background)

	slot15 = stat_icon_y

	icon.set_y(slot13, icon)

	slot15 = stat_name_y

	label.set_y(slot13, label)

	slot15 = 1

	icon_background.set_alpha(slot13, icon_background)

	slot15 = 1

	icon.set_alpha(slot13, icon)

	slot15 = 1

	label.set_alpha(slot13, label)

	return 
end
function RaidGUIControlTopStatBig:_animate_show_result(label, delay, clbk)
	if delay then
		slot6 = delay

		wait(slot5)
	end

	local t = 0
	local duration = 0.7
	local initial_offset = 15
	local player_name_y = self._player_name_label.y(slot8)
	local stat_value_y = self._stat_value_label.y(self._player_name_label)
	slot12 = player_name_y + initial_offset

	self._player_name_label.set_y(self._stat_value_label, self._player_name_label)

	slot12 = stat_value_y + initial_offset

	self._stat_value_label.set_y(self._stat_value_label, self._stat_value_label)

	if self._sound_effect then
		slot12 = self._sound_effect

		managers.menu_component.post_event(slot10, managers.menu_component)
	end

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot15 = duration
		local current_offset = Easing.quintic_out(slot11, t, initial_offset, -initial_offset)
		slot14 = player_name_y + current_offset

		self._player_name_label.set_y(t, self._player_name_label)

		slot14 = stat_value_y + current_offset

		self._stat_value_label.set_y(t, self._stat_value_label)

		slot16 = duration
		local current_alpha = Easing.quintic_out(t, t, 0, 1)
		slot15 = current_alpha

		self._player_name_label.set_alpha(t, self._player_name_label)

		slot15 = current_alpha

		self._stat_value_label.set_alpha(t, self._stat_value_label)
	end

	slot12 = player_name_y

	self._player_name_label.set_y(slot10, self._player_name_label)

	slot12 = stat_value_y

	self._stat_value_label.set_y(slot10, self._stat_value_label)

	slot12 = 1

	self._player_name_label.set_alpha(slot10, self._player_name_label)

	slot12 = 1

	self._stat_value_label.set_alpha(slot10, self._stat_value_label)

	self._shown = true

	if clbk then
		clbk()
	end

	return 
end

return 
