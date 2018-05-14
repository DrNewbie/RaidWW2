HUDTabGreedBar = HUDTabGreedBar or class()
HUDTabGreedBar.WIDTH = 192
HUDTabGreedBar.HEIGHT = 96
HUDTabGreedBar.ICONS_W = 96
HUDTabGreedBar.FRAME_ICON = "rewards_extra_loot_small_frame"
HUDTabGreedBar.LOOT_ICON = "rewards_extra_loot_small_middle_loot"
HUDTabGreedBar.GOLD_ICON = "rewards_extra_loot_small_middle_gold"
HUDTabGreedBar.TITLE_H = 64
HUDTabGreedBar.TITLE_STRING = "menu_save_info_loot_title"
HUDTabGreedBar.TITLE_FONT = tweak_data.gui.fonts.din_compressed
HUDTabGreedBar.TITLE_FONT_SIZE = tweak_data.gui.font_sizes.size_32
HUDTabGreedBar.TITLE_COLOR = tweak_data.gui.colors.raid_dirty_white
HUDTabGreedBar.LOOT_BAR_W = 80
HUDTabGreedBar.LOOT_BAR_ICON_L = "loot_meter_parts_l"
HUDTabGreedBar.LOOT_BAR_ICON_M = "loot_meter_parts_m"
HUDTabGreedBar.LOOT_BAR_ICON_R = "loot_meter_parts_r"
HUDTabGreedBar.LOOT_BAR_COLOR = tweak_data.gui.colors.raid_dark_grey
HUDTabGreedBar.LOOT_BAR_FOREGROUND_COLOR = tweak_data.gui.colors.raid_gold
HUDTabGreedBar.COUNTER_H = 16
HUDTabGreedBar.COUNTER_FONT = tweak_data.gui.fonts.din_compressed
HUDTabGreedBar.COUNTER_FONT_SIZE = tweak_data.gui.font_sizes.size_18
HUDTabGreedBar.COUNTER_COLOR = tweak_data.gui.colors.raid_dark_grey
HUDTabGreedBar.COUNTER_OFFSET = 6
HUDTabGreedBar.COUNTER_INCREASE_COLOR = tweak_data.gui.colors.raid_gold
HUDTabGreedBar.TUTORIALIZATION_STRING = "hud_greed_complete_mission_to_secure"
HUDTabGreedBar.TUTORIALIZATION_FONT = tweak_data.gui.fonts.lato
HUDTabGreedBar.TUTORIALIZATION_FONT_SIZE = tweak_data.gui.font_sizes.extra_small
HUDTabGreedBar.TUTORIALIZATION_COLOR = tweak_data.gui.colors.raid_grey
HUDTabGreedBar.ICON_HIDDEN_OFFSET = 40
HUDTabGreedBar.FRAME_PULSE_SPEEDS = {
	2.2,
	1,
	0.5,
	0.25
}
function HUDTabGreedBar:init(panel, params)
	self._gold_bars_obtained_in_mission = 0
	slot7 = params

	self._create_panel(slot4, self, panel)

	slot5 = self

	self._create_icons(slot4)

	slot5 = self

	self._create_right_panel(slot4)

	slot5 = self

	self._create_title(slot4)

	slot5 = self

	self._create_bar(slot4)

	slot5 = self

	self._create_counter(slot4)

	return 
end
function HUDTabGreedBar:_create_panel(panel, params)
	local panel_params = {
		halign = "right",
		name = "hud_tab_greed_bar",
		valign = "bottom",
		x = params.x or 0,
		y = params.y or 0,
		w = HUDTabGreedBar.WIDTH,
		h = HUDTabGreedBar.HEIGHT
	}

	if not params.layer then
		slot6 = panel
		slot4 = panel.layer(slot5)
	end

	panel_params.layer = slot4
	slot7 = panel_params
	self._object = panel.panel(slot5, panel)

	return 
end
function HUDTabGreedBar:_create_icons()
	local icons_panel_params = {
		name = "icons_panel",
		halign = "left",
		valign = "top",
		w = HUDTabGreedBar.ICONS_W
	}
	slot4 = self._object
	icons_panel_params.h = self._object.h(slot3)
	slot5 = icons_panel_params
	self._icons_panel = self._object.panel(slot3, self._object)
	local frame_icon_params = {
		name = "frame_icon",
		valign = "center",
		halign = "center",
		layer = 10,
		texture = tweak_data.gui.icons[HUDTabGreedBar.FRAME_ICON].texture,
		texture_rect = tweak_data.gui.icons[HUDTabGreedBar.FRAME_ICON].texture_rect
	}
	slot6 = frame_icon_params
	self._frame_icon = self._icons_panel.bitmap(HUDTabGreedBar.FRAME_ICON, self._icons_panel)
	slot8 = self._icons_panel
	slot6 = self._icons_panel.w(slot7) / 2

	self._frame_icon.set_center_x(HUDTabGreedBar.FRAME_ICON, self._frame_icon)

	slot6 = self._icons_panel.h(slot7) / 2

	self._frame_icon.set_center_y(HUDTabGreedBar.FRAME_ICON, self._frame_icon)

	local loot_icon_params = {
		name = "loot_icon",
		valign = "center",
		halign = "center",
		layer = 10,
		texture = tweak_data.gui.icons[HUDTabGreedBar.LOOT_ICON].texture,
		texture_rect = tweak_data.gui.icons[HUDTabGreedBar.LOOT_ICON].texture_rect
	}
	slot7 = loot_icon_params
	self._loot_icon = self._icons_panel.bitmap(HUDTabGreedBar.LOOT_ICON, self._icons_panel)
	slot9 = self._icons_panel
	slot7 = self._icons_panel.w(self._icons_panel) / 2

	self._loot_icon.set_center_x(HUDTabGreedBar.LOOT_ICON, self._loot_icon)

	slot7 = self._icons_panel.h(self._icons_panel) / 2

	self._loot_icon.set_center_y(HUDTabGreedBar.LOOT_ICON, self._loot_icon)

	local gold_icon_params = {
		name = "gold_icon",
		valign = "center",
		halign = "center",
		alpha = 0,
		layer = 10,
		texture = tweak_data.gui.icons[HUDTabGreedBar.GOLD_ICON].texture,
		texture_rect = tweak_data.gui.icons[HUDTabGreedBar.GOLD_ICON].texture_rect,
		color = tweak_data.gui.colors.raid_gold
	}
	slot8 = gold_icon_params
	self._gold_icon = self._icons_panel.bitmap(HUDTabGreedBar.GOLD_ICON, self._icons_panel)
	slot10 = self._icons_panel
	slot8 = self._icons_panel.w(self._icons_panel) / 2

	self._gold_icon.set_center_x(HUDTabGreedBar.GOLD_ICON, self._gold_icon)

	slot10 = self._icons_panel
	slot8 = self._icons_panel.h(self._icons_panel) / 2

	self._gold_icon.set_center_y(HUDTabGreedBar.GOLD_ICON, self._gold_icon)

	return 
end
function HUDTabGreedBar:_create_right_panel()
	local right_panel_params = {
		name = "right_panel",
		halign = "right",
		valign = "top"
	}
	slot5 = self._icons_panel
	slot3 = self._icons_panel.w(self._object)
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
function HUDTabGreedBar:_create_title()
	local title_params = {
		vertical = "center",
		name = "tab_greed_bar_title",
		align = "center"
	}
	slot4 = self._right_panel
	title_params.w = self._right_panel.w(slot3)
	title_params.h = HUDTabGreedBar.TITLE_H
	slot6 = HUDTabGreedBar.TITLE_FONT_SIZE
	title_params.font = tweak_data.gui.get_font_path(slot3, tweak_data.gui, HUDTabGreedBar.TITLE_FONT)
	title_params.font_size = HUDTabGreedBar.TITLE_FONT_SIZE
	title_params.color = HUDTabGreedBar.TITLE_COLOR
	slot7 = HUDTabGreedBar.TITLE_STRING
	title_params.text = utf8.to_upper(managers.localization.text(HUDTabGreedBar.TITLE_FONT, managers.localization))
	slot5 = title_params
	self._title = self._right_panel.text(slot3, self._right_panel)
	slot7 = self._right_panel
	slot5 = self._right_panel.w(managers.localization) / 2

	self._title.set_center_x(slot3, self._title)

	slot5 = 32

	self._title.set_center_y(slot3, self._title)

	return 
end
function HUDTabGreedBar:_create_bar()
	local progress_bar_background_params = {
		name = "tab_greed_progress_bar_background",
		layer = 1,
		w = HUDTabGreedBar.LOOT_BAR_W,
		left = HUDTabGreedBar.LOOT_BAR_ICON_L,
		center = HUDTabGreedBar.LOOT_BAR_ICON_M,
		right = HUDTabGreedBar.LOOT_BAR_ICON_R,
		color = HUDTabGreedBar.LOOT_BAR_COLOR
	}
	slot6 = progress_bar_background_params
	self._progress_bar_background = RaidGUIControlThreeCutBitmap.new(slot3, RaidGUIControlThreeCutBitmap, self._right_panel)
	slot5 = 64

	self._progress_bar_background.set_center_y(slot3, self._progress_bar_background)

	local progress_bar_progress_panel_params = {
		name = "tab_progress_bar_progress_panel"
	}
	slot5 = self._progress_bar_background
	progress_bar_progress_panel_params.w = self._progress_bar_background.w(self._progress_bar_background)
	slot5 = self._progress_bar_background
	progress_bar_progress_panel_params.h = self._progress_bar_background.h(self._progress_bar_background)
	slot5 = self._progress_bar_background
	progress_bar_progress_panel_params.layer = self._progress_bar_background.layer(self._progress_bar_background) + 1
	slot6 = progress_bar_progress_panel_params
	self._progress_bar_progress_panel = self._right_panel.panel(self._progress_bar_background, self._right_panel)
	slot5 = self._progress_bar_progress_panel
	slot8 = self._progress_bar_background

	self._progress_bar_progress_panel.set_x(self._progress_bar_background, self._progress_bar_background.x(slot7))

	slot8 = self._progress_bar_background

	self._progress_bar_progress_panel.set_center_y(self._progress_bar_background, self._progress_bar_background.center_y(slot7))

	local progress_bar_foreground_params = {
		name = "tab_loot_bar_foreground",
		alpha = 0
	}
	slot6 = self._progress_bar_background
	progress_bar_foreground_params.w = self._progress_bar_background.w(self._progress_bar_progress_panel)
	progress_bar_foreground_params.left = HUDTabGreedBar.LOOT_BAR_ICON_L
	progress_bar_foreground_params.center = HUDTabGreedBar.LOOT_BAR_ICON_M
	progress_bar_foreground_params.right = HUDTabGreedBar.LOOT_BAR_ICON_R
	progress_bar_foreground_params.color = HUDTabGreedBar.LOOT_BAR_FOREGROUND_COLOR
	slot8 = progress_bar_foreground_params
	self._loot_bar_foreground = RaidGUIControlThreeCutBitmap.new(self._progress_bar_progress_panel, RaidGUIControlThreeCutBitmap, self._progress_bar_progress_panel)

	return 
end
function HUDTabGreedBar:_create_counter()
	local counter_params = {
		vertical = "center",
		name = "tab_greed_bar_counter",
		align = "right",
		text = "0"
	}
	slot4 = self._right_panel
	counter_params.w = self._right_panel.w(slot3)
	counter_params.h = HUDTabGreedBar.COUNTER_H
	counter_params.font = tweak_data.gui.get_font_path(slot3, tweak_data.gui, HUDTabGreedBar.COUNTER_FONT)
	counter_params.font_size = HUDTabGreedBar.COUNTER_FONT_SIZE
	counter_params.color = HUDTabGreedBar.COUNTER_COLOR
	slot5 = counter_params
	self._counter = self._right_panel.text(slot3, self._right_panel)
	slot4 = self._counter
	slot7 = self._right_panel

	self._counter.set_right(slot3, self._right_panel.w(HUDTabGreedBar.COUNTER_FONT_SIZE))

	slot4 = self._counter
	slot7 = self._progress_bar_background

	self._counter.set_center_y(slot3, self._progress_bar_background.center_y(HUDTabGreedBar.COUNTER_FONT_SIZE))

	return 
end
function HUDTabGreedBar:_create_tutorialization()
	local tutorialization_params = {
		wrap = true,
		name = "tab_greed_tutorialization"
	}
	slot4 = self._object
	tutorialization_params.y = self._object.h(slot3)
	slot4 = self._object
	tutorialization_params.w = self._object.w(slot3)
	slot6 = HUDTabGreedBar.TUTORIALIZATION_FONT_SIZE
	tutorialization_params.font = tweak_data.gui.get_font_path(slot3, tweak_data.gui, HUDTabGreedBar.TUTORIALIZATION_FONT)
	tutorialization_params.font_size = HUDTabGreedBar.TUTORIALIZATION_FONT_SIZE
	tutorialization_params.color = HUDTabGreedBar.TUTORIALIZATION_COLOR
	slot5 = HUDTabGreedBar.TUTORIALIZATION_STRING
	tutorialization_params.text = managers.localization.text(slot3, managers.localization)
	slot5 = tutorialization_params
	self._tutorialization = self._object.text(slot3, self._object)
	slot4 = self._tutorialization
	local _, _, _, h = self._tutorialization.text_rect(slot3)
	slot9 = h

	self._tutorialization.set_h(slot7, self._tutorialization)

	slot11 = self._icons_panel
	slot9 = self._icons_panel.h(slot10) + h

	self._object.set_h(slot7, self._object)

	return 
end
function HUDTabGreedBar:change_progress(old_progress, new_progress)
	self._updated_progress = new_progress

	if not self._animating_progress_change then
		self._current_progress = old_progress
		slot5 = self._progress_bar_progress_panel

		self._progress_bar_progress_panel.stop(slot4)

		slot5 = self._progress_bar_progress_panel
		slot10 = "_animate_change_progress"

		self._progress_bar_progress_panel.animate(slot4, callback(slot7, self, self))
	end

	return 
end
function HUDTabGreedBar:set_current_greed_amount(amount)
	slot8 = managers.greed
	slot5 = amount % managers.greed.loot_needed_for_gold_bar(slot6) / managers.greed.loot_needed_for_gold_bar(managers.greed)

	self.set_progress(slot3, self)

	return 
end
function HUDTabGreedBar:set_progress(progress)
	slot7 = self._progress_bar_background
	slot5 = self._progress_bar_background.w(slot6) * progress

	self._progress_bar_progress_panel.set_w(slot3, self._progress_bar_progress_panel)

	slot5 = 1

	self._loot_bar_foreground.set_alpha(slot3, self._loot_bar_foreground)

	return 
end
function HUDTabGreedBar:reset_state()
	slot3 = self._frame_icon

	self._frame_icon.stop(slot2)

	slot3 = self._frame_icon
	slot7 = HUDTabGreedBar.FRAME_ICON

	self._frame_icon.set_w(slot2, tweak_data.gui.icon_w(slot5, tweak_data.gui))

	slot3 = self._frame_icon
	slot7 = HUDTabGreedBar.FRAME_ICON

	self._frame_icon.set_h(slot2, tweak_data.gui.icon_h(slot5, tweak_data.gui))

	slot6 = self._icons_panel
	slot4 = self._icons_panel.w(slot5) / 2

	self._frame_icon.set_center_x(slot2, self._frame_icon)

	slot6 = self._icons_panel
	slot4 = self._icons_panel.h(slot5) / 2

	self._frame_icon.set_center_y(slot2, self._frame_icon)

	slot4 = Color.white

	self._frame_icon.set_color(slot2, self._frame_icon)

	slot3 = self._icons_panel

	self._icons_panel.stop(slot2)

	slot4 = 1

	self._loot_icon.set_alpha(slot2, self._loot_icon)

	slot4 = 0

	self._gold_icon.set_alpha(slot2, self._gold_icon)

	slot6 = self._icons_panel
	slot4 = self._icons_panel.h(slot5) / 2

	self._loot_icon.set_center_y(slot2, self._loot_icon)

	slot6 = self._icons_panel
	slot4 = self._icons_panel.h(slot5) / 2

	self._gold_icon.set_center_y(slot2, self._gold_icon)

	slot3 = self._counter

	self._counter.stop(slot2)

	slot3 = self._counter
	slot6 = self._progress_bar_background

	self._counter.set_center_y(slot2, self._progress_bar_background.center_y(slot5))

	slot4 = HUDTabGreedBar.COUNTER_COLOR

	self._counter.set_color(slot2, self._counter)

	slot4 = "0"

	self._counter.set_text(slot2, self._counter)

	self._gold_bars_obtained_in_mission = 0
	slot3 = self
	slot6 = managers.greed

	self.set_current_greed_amount(slot2, managers.greed.current_loot_counter(slot5))

	return 
end
function HUDTabGreedBar:_animate_change_progress(o)
	self._animating_progress_change = true
	local points_per_second = 120
	local t = 0

	while 0 < self._updated_progress - self._current_progress do
		local dt = coroutine.yield()
		t = t + dt
		self._current_progress = self._current_progress + points_per_second * dt
		slot8 = managers.greed
		slot8 = managers.greed
		local current_percentage = self._current_progress % managers.greed.loot_needed_for_gold_bar(slot7) / managers.greed.loot_needed_for_gold_bar(slot7)
		slot9 = current_percentage

		self.set_progress(slot7, self)

		if self._previous_percentage and current_percentage < self._previous_percentage then
			slot8 = self

			self._acquire_gold_bar(slot7)
		end

		self._previous_percentage = current_percentage
	end

	slot7 = managers.greed
	slot7 = managers.greed
	local current_percentage = self._updated_progress % managers.greed.loot_needed_for_gold_bar(slot6) / managers.greed.loot_needed_for_gold_bar(slot6)
	slot8 = current_percentage

	self.set_progress(slot6, self)

	self._current_progress = self._updated_progress
	self._animating_progress_change = false

	return 
end
function HUDTabGreedBar:_acquire_gold_bar()
	self._gold_bars_obtained_in_mission = self._gold_bars_obtained_in_mission + 1
	slot3 = self._icons_panel

	self._icons_panel.stop(slot2)

	slot3 = self._icons_panel
	slot8 = "_animate_gold_bar"

	self._icons_panel.animate(slot2, callback(slot5, self, self))

	if not self._pulsing then
		slot3 = self._frame_icon

		self._frame_icon.stop(slot2)

		slot3 = self._frame_icon
		slot8 = "_animate_pulse"

		self._frame_icon.animate(slot2, callback(slot5, self, self))
	end

	slot3 = self._counter

	self._counter.stop(slot2)

	slot3 = self._counter
	slot8 = "_animate_counter_increase"

	self._counter.animate(slot2, callback(slot5, self, self))

	return 
end
function HUDTabGreedBar:_animate_counter_increase(o)
	local duration = 0.5
	local t = 0
	slot6 = self._counter
	slot9 = self._gold_bars_obtained_in_mission

	self._counter.set_text(slot5, tostring(slot8))

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		local current_offset = Easing.quartic_in(slot6, t, HUDTabGreedBar.COUNTER_OFFSET, -HUDTabGreedBar.COUNTER_OFFSET)
		slot11 = self._progress_bar_background
		slot9 = self._progress_bar_background.center_y(duration) - current_offset

		self._counter.set_center_y(t, self._counter)

		slot11 = duration
		local current_r = Easing.quartic_in(t, t, HUDTabGreedBar.COUNTER_INCREASE_COLOR.r, HUDTabGreedBar.COUNTER_COLOR.r - HUDTabGreedBar.COUNTER_INCREASE_COLOR.r)
		slot12 = duration
		local current_g = Easing.quartic_in(t, t, HUDTabGreedBar.COUNTER_INCREASE_COLOR.g, HUDTabGreedBar.COUNTER_COLOR.g - HUDTabGreedBar.COUNTER_INCREASE_COLOR.g)
		local current_b = Easing.quartic_in(t, t, HUDTabGreedBar.COUNTER_INCREASE_COLOR.b, HUDTabGreedBar.COUNTER_COLOR.b - HUDTabGreedBar.COUNTER_INCREASE_COLOR.b)
		slot11 = self._counter
		slot16 = current_b

		self._counter.set_color(t, Color(duration, current_r, current_g))
	end

	slot6 = self._counter
	slot9 = self._progress_bar_background

	self._counter.set_center_y(slot5, self._progress_bar_background.center_y(slot8))

	slot7 = HUDTabGreedBar.COUNTER_COLOR

	self._counter.set_color(slot5, self._counter)

	return 
end
function HUDTabGreedBar:_animate_pulse(o)
	self._pulsing = true
	slot5 = HUDTabGreedBar.FRAME_ICON
	local frame_default_w = tweak_data.gui.icon_w(slot3, tweak_data.gui)
	slot6 = HUDTabGreedBar.FRAME_ICON
	local frame_default_h = tweak_data.gui.icon_h(tweak_data.gui, tweak_data.gui)
	local duration_in = 0.5
	local t = 0

	while true do
		while t < duration_in do
			local dt = coroutine.yield()
			t = t + dt
			local current_frame_scale = Easing.quartic_out(slot8, t, 1.4, -0.4)
			slot11 = frame_default_w * current_frame_scale

			self._frame_icon.set_w(t, self._frame_icon)

			slot11 = frame_default_h * current_frame_scale

			self._frame_icon.set_h(t, self._frame_icon)

			slot13 = self._icons_panel
			slot11 = self._icons_panel.w(duration_in) / 2

			self._frame_icon.set_center_x(t, self._frame_icon)

			slot13 = self._icons_panel
			slot11 = self._icons_panel.h(duration_in) / 2

			self._frame_icon.set_center_y(t, self._frame_icon)

			slot13 = duration_in
			local current_r = Easing.quartic_out(t, t, tweak_data.gui.colors.raid_light_gold.r, tweak_data.gui.colors.raid_gold.r - tweak_data.gui.colors.raid_light_gold.r)
			slot14 = duration_in
			local current_g = Easing.quartic_out(t, t, tweak_data.gui.colors.raid_light_gold.g, tweak_data.gui.colors.raid_gold.g - tweak_data.gui.colors.raid_light_gold.g)
			local current_b = Easing.quartic_out(t, t, tweak_data.gui.colors.raid_light_gold.b, tweak_data.gui.colors.raid_gold.b - tweak_data.gui.colors.raid_light_gold.b)
			slot13 = self._frame_icon
			slot18 = current_b

			self._frame_icon.set_color(t, Color(duration_in, current_r, current_g))
		end

		slot11 = #HUDTabGreedBar.FRAME_PULSE_SPEEDS
		local wait_time = HUDTabGreedBar.FRAME_PULSE_SPEEDS[math.clamp(slot8, self._gold_bars_obtained_in_mission, 1)]
		slot9 = wait_time

		wait(slot8)

		t = 0
	end

	return 
end
function HUDTabGreedBar:_animate_gold_bar(o)
	self._animating_gold_bar = true
	local duration_in = 0.5
	local t = 0

	while t < duration_in do
		local dt = coroutine.yield()
		t = t + dt
		slot10 = duration_in
		local current_offset = Easing.quartic_in_out(slot6, t, 0, HUDTabGreedBar.ICON_HIDDEN_OFFSET)
		local current_loot_icon_alpha = Easing.quartic_in_out(t, t, 1, -1)
		slot10 = current_loot_icon_alpha

		self._loot_icon.set_alpha(t, self._loot_icon)

		slot12 = self._icons_panel
		slot10 = self._icons_panel.h(duration_in / 2) / 2 - current_offset

		self._loot_icon.set_center_y(t, self._loot_icon)

		if duration_in / 2 <= t then
			slot12 = duration_in / 2
			local current_gold_icon_alpha = Easing.quartic_in_out(slot8, t - duration_in / 2, 0, 1)
			slot11 = current_gold_icon_alpha

			self._gold_icon.set_alpha(t - duration_in / 2, self._gold_icon)
		end

		slot12 = self._icons_panel
		slot10 = (self._icons_panel.h(slot11) / 2 + HUDTabGreedBar.ICON_HIDDEN_OFFSET) - current_offset

		self._gold_icon.set_center_y(slot8, self._gold_icon)
	end

	slot7 = 0

	self._loot_icon.set_alpha(slot5, self._loot_icon)

	slot7 = 1

	self._gold_icon.set_alpha(slot5, self._gold_icon)

	slot9 = self._icons_panel
	slot7 = self._icons_panel.h(slot8) / 2

	self._loot_icon.set_center_y(slot5, self._loot_icon)

	slot9 = self._icons_panel
	slot7 = self._icons_panel.h(slot8) / 2

	self._gold_icon.set_center_y(slot5, self._gold_icon)

	slot6 = 1.5

	wait(slot5)

	local duration_out = 0.7
	t = 0

	while t < duration_out do
		local dt = coroutine.yield()
		t = t + dt
		slot11 = duration_in
		local current_offset = Easing.quartic_in_out(slot7, t, 0, HUDTabGreedBar.ICON_HIDDEN_OFFSET)
		local current_gold_icon_alpha = Easing.quartic_in_out(t, t, 1, -1)
		slot11 = current_gold_icon_alpha

		self._gold_icon.set_alpha(t, self._gold_icon)

		slot13 = self._icons_panel
		slot11 = self._icons_panel.h(duration_in / 2) / 2 - current_offset

		self._gold_icon.set_center_y(t, self._gold_icon)

		if duration_in / 2 <= t then
			slot13 = duration_in / 2
			local current_loot_icon_alpha = Easing.quartic_in_out(slot9, t - duration_in / 2, 0, 1)
			slot12 = current_loot_icon_alpha

			self._loot_icon.set_alpha(t - duration_in / 2, self._loot_icon)
		end

		slot13 = self._icons_panel
		slot11 = (self._icons_panel.h(slot12) / 2 + HUDTabGreedBar.ICON_HIDDEN_OFFSET) - current_offset

		self._loot_icon.set_center_y(slot9, self._loot_icon)
	end

	slot8 = 1

	self._loot_icon.set_alpha(slot6, self._loot_icon)

	slot8 = 0

	self._gold_icon.set_alpha(slot6, self._gold_icon)

	slot10 = self._icons_panel
	slot8 = self._icons_panel.h(slot9) / 2

	self._loot_icon.set_center_y(slot6, self._loot_icon)

	slot10 = self._icons_panel
	slot8 = self._icons_panel.h(slot9) / 2

	self._gold_icon.set_center_y(slot6, self._gold_icon)

	slot7 = 0.8

	wait(slot6)

	self._animating_gold_bar = false

	return 
end
function HUDTabGreedBar:set_right(right)
	slot5 = right

	self._object.set_right(slot3, self._object)

	return 
end

return 
