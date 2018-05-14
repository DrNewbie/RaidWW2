if not RaidGUIControlTopStat then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlTopStat = slot0
RaidGUIControlTopStat.WIDTH = 192
RaidGUIControlTopStat.HEIGHT = 320
RaidGUIControlTopStat.PLAYER_NAME_Y = 0
RaidGUIControlTopStat.PLAYER_NAME_H = 64
RaidGUIControlTopStat.PLAYER_NAME_COLOR = Color.white
RaidGUIControlTopStat.STAT_NAME_Y = 130
RaidGUIControlTopStat.STAT_NAME_H = 64
RaidGUIControlTopStat.STAT_NAME_COLOR = tweak_data.gui.colors.raid_grey
RaidGUIControlTopStat.STAT_ICON_SIZE = 192
RaidGUIControlTopStat.FONT = tweak_data.gui.fonts.din_compressed
RaidGUIControlTopStat.FONT_SIZE = tweak_data.gui.font_sizes.large
RaidGUIControlTopStat.FONT_KERNING = tweak_data.hud.medium_kern
function RaidGUIControlTopStat:init(parent, params)
	slot7 = params

	RaidGUIControlTopStat.super.init(slot4, self, parent)

	if not params then
		slot6 = "[RaidGUIControlTopStat:init] Parameters not specified for the customization details"

		Application.error(slot4, Application)

		return 
	end

	self._pointer_type = "arrow"
	slot5 = self

	self.highlight_off(slot4)

	slot5 = self

	self._create_control_panel(slot4)

	slot5 = self

	self._create_stat_info(slot4)

	slot5 = self

	self._create_icon_panel(slot4)

	return 
end
function RaidGUIControlTopStat:close()
	return 
end
function RaidGUIControlTopStat:_create_control_panel()
	slot3 = self._params
	local control_params = clone(slot2)
	control_params.w = RaidGUIControlTopStat.WIDTH
	control_params.h = RaidGUIControlTopStat.HEIGHT
	control_params.name = control_params.name .. "_customization_panel"
	slot4 = self._panel
	control_params.layer = self._panel.layer("_customization_panel") + 1
	slot5 = control_params
	self._control_panel = self._panel.panel("_customization_panel", self._panel)
	self._object = self._control_panel

	return 
end
function RaidGUIControlTopStat:_create_stat_info()
	local params_player_name = {
		vertical = "center",
		name = "player_name_label",
		align = "center",
		alpha = 0,
		text = "PLAYER NAME",
		y = 0,
		x = 0,
		layer = 1
	}
	slot4 = self._object
	params_player_name.w = self._object.w(slot3)
	params_player_name.h = RaidGUIControlTopStat.PLAYER_NAME_H
	params_player_name.color = RaidGUIControlTopStat.PLAYER_NAME_COLOR
	params_player_name.font = RaidGUIControlTopStat.FONT
	params_player_name.font_size = RaidGUIControlTopStat.FONT_SIZE
	slot5 = params_player_name
	self._player_name_label = self._control_panel.label(slot3, self._control_panel)
	local params_stat_name = {
		vertical = "top",
		name = "stat_name_label",
		wrap = true,
		align = "center",
		word_wrap = true,
		text = "Most specials killed",
		alpha = 0,
		x = 0,
		layer = 3
	}
	slot5 = self._object
	params_stat_name.y = self._object.h(self._control_panel) - RaidGUIControlTopStat.STAT_NAME_H
	params_stat_name.w = RaidGUIControlTopStat.WIDTH
	params_stat_name.h = RaidGUIControlTopStat.STAT_NAME_H
	params_stat_name.color = RaidGUIControlTopStat.STAT_NAME_COLOR
	params_stat_name.font = RaidGUIControlTopStat.FONT
	params_stat_name.font_size = RaidGUIControlTopStat.FONT_SIZE
	slot6 = params_stat_name
	self._stat_name_label = self._control_panel.label(RaidGUIControlTopStat.STAT_NAME_H, self._control_panel)

	return 
end
function RaidGUIControlTopStat:_create_icon_panel()
	local icon_panel_params = {
		name = "icon_panel",
		x = 0
	}
	slot5 = self._player_name_label
	slot3 = self._player_name_label.h(self._player_name_label)
	icon_panel_params.y = self._player_name_label.y(slot3) + slot3
	icon_panel_params.w = RaidGUIControlTopStat.STAT_ICON_SIZE
	icon_panel_params.h = RaidGUIControlTopStat.STAT_ICON_SIZE
	slot4 = self._object
	icon_panel_params.layer = self._object.layer(slot3) + 1
	slot5 = icon_panel_params
	self._icon_panel = self._object.panel(slot3, self._object)

	return 
end
function RaidGUIControlTopStat:set_data(data)
	slot4 = self._player_name_label
	slot7 = data.player_nickname

	self._player_name_label.set_text(slot3, utf8.to_upper(slot6))

	slot9 = true

	self._stat_name_label.set_text(slot3, self.translate(slot6, self, data.stat))

	local params_stat_icon = {
		name = "stat_icon",
		y = 0,
		alpha = 0,
		x = 0,
		w = data.icon_texture_rect[3],
		h = data.icon_texture_rect[4],
		texture = data.icon_texture,
		texture_rect = data.icon_texture_rect
	}
	slot6 = params_stat_icon
	self._stat_icon = self._icon_panel.bitmap(self._stat_name_label, self._icon_panel)
	slot8 = self._icon_panel
	slot6 = self._icon_panel.w(self) / 2

	self._stat_icon.set_center_x(self._stat_name_label, self._stat_icon)

	slot8 = self._icon_panel
	slot6 = self._icon_panel.h(self) / 2

	self._stat_icon.set_center_y(self._stat_name_label, self._stat_icon)

	return 
end
function RaidGUIControlTopStat:animate_show(delay)
	delay = delay or 0
	slot9 = "_animate_show_stat"
	slot8 = self._stat_name_label

	self._stat_icon.animate(slot3, self._stat_icon, callback(slot6, self, self), delay, self._stat_icon)

	slot9 = "_animate_show_player_name"
	slot6 = delay + 0.6

	self._player_name_label._object.animate(slot3, self._player_name_label._object, callback(delay, self, self))

	return 
end
function RaidGUIControlTopStat:_animate_show_stat(panel, delay, icon, label)
	if delay then
		slot7 = delay

		wait(slot6)
	end

	local t = 0
	local duration = 0.7
	local initial_offset = 15
	local stat_icon_y = icon.y(slot9)
	local stat_name_y = label.y(icon)
	slot13 = stat_icon_y + initial_offset

	icon.set_y(label, icon)

	slot13 = stat_name_y + initial_offset

	label.set_y(label, label)

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot16 = duration
		local current_offset = Easing.quintic_out(slot12, t, initial_offset, -initial_offset)
		slot15 = stat_icon_y + current_offset

		icon.set_y(t, icon)

		slot15 = stat_name_y + current_offset

		label.set_y(t, label)

		slot17 = duration
		local current_alpha = Easing.quintic_out(t, t, 0, 1)
		slot16 = current_alpha

		icon.set_alpha(t, icon)

		slot16 = current_alpha

		label.set_alpha(t, label)
	end

	slot13 = stat_icon_y

	icon.set_y(slot11, icon)

	slot13 = stat_name_y

	label.set_y(slot11, label)

	slot13 = 1

	icon.set_alpha(slot11, icon)

	slot13 = 1

	label.set_alpha(slot11, label)

	return 
end
function RaidGUIControlTopStat:_animate_show_player_name(label, delay)
	if delay then
		slot5 = delay

		wait(slot4)
	end

	local t = 0
	local duration = 0.15
	local font_size = RaidGUIControlTopStat.FONT_SIZE
	local center_x = self._player_name_label._object.center_x(slot7)
	slot9 = self._player_name_label._object
	local center_y = self._player_name_label._object.center_y(self._player_name_label._object)
	local mid_offset = 5
	local initial_offset = 10

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot16 = duration
		local current_offset = Easing.linear(slot12, t, -initial_offset, initial_offset + mid_offset)
		slot15 = font_size + current_offset

		self._player_name_label.set_font_size(t, self._player_name_label)

		slot16 = center_y

		self._player_name_label._object.set_center(t, self._player_name_label._object, center_x)

		slot17 = duration - 0.05
		local current_alpha = Easing.quintic_out(t, t, 0, 1)
		slot16 = current_alpha

		self._player_name_label.set_alpha(t, self._player_name_label)
	end

	slot13 = font_size + mid_offset

	self._player_name_label.set_font_size(slot11, self._player_name_label)

	slot17 = "_animate_text_glow"
	slot16 = 1

	self._player_name_label._object.animate(slot11, self._player_name_label._object, callback(slot14, self, self), tweak_data.gui.colors.raid_light_red, 1)

	t = 0
	duration = 0.6

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot16 = duration
		local current_offset = Easing.quartic_out(slot12, t, mid_offset, -mid_offset)
		slot15 = font_size + current_offset

		self._player_name_label.set_font_size(t, self._player_name_label)

		slot16 = center_y

		self._player_name_label._object.set_center(t, self._player_name_label._object, center_x)
	end

	slot13 = font_size

	self._player_name_label.set_font_size(slot11, self._player_name_label)

	slot14 = center_y

	self._player_name_label._object.set_center(slot11, self._player_name_label._object, center_x)

	return 
end
function RaidGUIControlTopStat:_animate_text_glow(text, new_color, duration, number_of_laps, delay)
	slot10 = text
	local number_of_letters = string.len(text.text(slot9))
	slot9 = text
	local original_color = text.color(text.text)
	local change_r = new_color.r - original_color.r
	local change_g = new_color.g - original_color.g
	local change_b = new_color.b - original_color.b
	local change_a = new_color.a - original_color.a
	local t = 0
	local delay_between_letters = 0.05
	local duration_per_letter = duration / number_of_laps - delay_between_letters * (number_of_letters - 1)

	if delay ~= nil then
		slot17 = delay

		wait(slot16)
	end

	local laps_done = 0
	local lap_time = duration / number_of_laps

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt

		for i = 1, number_of_letters, 1 do
			slot24 = (t - laps_done * lap_time - (i - 1) * delay_between_letters) / duration_per_letter
			local blend_amount = Easing.sine_pulse(slot23)
			local current_a = original_color.a + blend_amount * change_a
			local current_r = original_color.r + blend_amount * change_r
			local current_g = original_color.g + blend_amount * change_g
			local current_b = original_color.b + blend_amount * change_b
			slot31 = i
			slot37 = current_b

			text.set_range_color(slot28, text, i - 1, Color(slot33, current_a, current_r, current_g))
		end

		slot20 = t / duration / number_of_laps

		if laps_done < math.floor(slot19) then
			laps_done = laps_done + 1
		end
	end

	slot21 = number_of_letters

	text.clear_range_color(slot18, text, 0)

	return 
end

return 
