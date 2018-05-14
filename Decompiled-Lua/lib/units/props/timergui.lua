-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
TimerGui = TimerGui or class()
TimerGui.themes = {
	default = {}
}
TimerGui.themes.default.hide_background = false
TimerGui.themes.default.timer_color = tweak_data.hud.prime_color
TimerGui.themes.default.working_text_color = TimerGui.themes.default.timer_color
TimerGui.themes.default.time_header_text_color = TimerGui.themes.default.timer_color
TimerGui.themes.default.time_text_color = TimerGui.themes.default.timer_color
TimerGui.themes.old = {
	hide_background = true
}
slot5 = 0.3
TimerGui.themes.old.timer_color = Color(slot2, 0.3, 0.5)
slot6 = 0.1
TimerGui.themes.old.timer_background_color = Color(slot2, 0.2, 0.1, 0.2)
TimerGui.themes.old.working_text_color = TimerGui.themes.old.timer_color
TimerGui.themes.old.time_header_text_color = TimerGui.themes.old.timer_color
TimerGui.themes.old.time_text_color = TimerGui.themes.old.timer_color
TimerGui.themes.old.bg_rect_color = Color.black
TimerGui.themes.old.bg_rect_blend_mode = "mul"
TimerGui.themes.old.jammed = {}
slot5 = 0
TimerGui.themes.old.jammed.bg_rect = Color(slot2, 0.1, 0)
TimerGui.themes.old.jammed.bg_rect_blend_mode = "mul"
slot5 = 0
TimerGui.themes.old.upgrade_color_0 = Color(slot2, 0, 0)
slot5 = 0.3
TimerGui.themes.old.upgrade_color_1 = Color(slot2, 0.3, 0.6)
slot5 = 0.8
TimerGui.themes.old.upgrade_color_2 = Color(slot2, 0.8, 1)
TimerGui.themes.blue = {
	hide_background = true
}
slot5 = 0.8
TimerGui.themes.blue.timer_color = Color(slot2, 0.4, 0.6)
TimerGui.themes.blue.working_text_color = TimerGui.themes.blue.timer_color
TimerGui.themes.blue.time_header_text_color = TimerGui.themes.blue.timer_color
TimerGui.themes.blue.time_text_color = TimerGui.themes.blue.timer_color
slot6 = 0
TimerGui.themes.blue.bg_rect_color = Color(slot2, 0.4, 0, 0)
TimerGui.themes.blue.jammed = {}
slot5 = 0
TimerGui.themes.blue.jammed.bg_rect = Color(slot2, 0.1, 0)
slot5 = 0
TimerGui.themes.blue.upgrade_color_0 = Color(slot2, 0, 0)
slot5 = 0.4
TimerGui.themes.blue.upgrade_color_1 = Color(slot2, 0.2, 0.3)
TimerGui.themes.blue.upgrade_color_2 = TimerGui.themes.blue.timer_color
TimerGui.themes.custom_background = {
	hide_background = true
}
slot5 = 0.8
TimerGui.themes.custom_background.timer_color = Color(slot2, 0.8, 0.8)
TimerGui.themes.custom_background.working_text_color = TimerGui.themes.custom_background.timer_color
TimerGui.themes.custom_background.time_header_text_color = TimerGui.themes.custom_background.timer_color
TimerGui.themes.custom_background.time_text_color = TimerGui.themes.custom_background.timer_color
slot6 = 0
TimerGui.themes.custom_background.bg_rect_color = Color(slot2, 0, 0, 0)
TimerGui.themes.custom_background.jammed = {}
slot5 = 0
TimerGui.themes.custom_background.jammed.bg_rect = Color(slot2, 0.1, 0)
slot5 = 0
TimerGui.themes.custom_background.upgrade_color_0 = Color(slot2, 0, 0)
slot5 = 0.4
TimerGui.themes.custom_background.upgrade_color_1 = Color(slot2, 0.2, 0.3)
TimerGui.themes.custom_background.upgrade_color_2 = TimerGui.themes.custom_background.timer_color
TimerGui.upgrade_colors = {
	upgrade_color_0 = tweak_data.screen_colors.item_stage_3,
	upgrade_color_1 = tweak_data.screen_colors.text,
	upgrade_color_2 = tweak_data.hud.prime_color
}
TimerGui.EVENT_IDS = {
	jammed = 1,
	unjammed = 2
}
function TimerGui:init(unit)
	self._unit = unit
	self._visible = true
	self._powered = true
	self._jam_times = 3
	self._jammed = false
	self._can_jam = false
	self._gui_start = self._gui_start or "prop_timer_gui_start"
	self._gui_working = "prop_timer_gui_working"
	self._gui_malfunction = "prop_timer_gui_malfunction"
	self._gui_done = "prop_timer_gui_done"
	self._cull_distance = self._cull_distance or 5000
	self._size_multiplier = self._size_multiplier or 1
	self._gui_object = self._gui_object or "gui_name"
	slot4 = World
	self._new_gui = World.newgui(slot3)
	slot4 = self
	slot7 = self._unit
	slot10 = self._gui_object

	self.add_workspace(slot3, self._unit.get_object(slot6, Idstring(slot9)))

	slot4 = self

	self.setup(slot3)

	slot7 = "timer_gui"

	self._unit.set_extension_update_enabled(slot3, self._unit, Idstring(false))

	self._update_enabled = false

	return 
end
function TimerGui:set_can_jam(can_jam)
	self._can_jam = can_jam

	return 
end
function TimerGui:set_override_timer(override_timer)
	self._override_timer = override_timer

	return 
end
function TimerGui:add_workspace(gui_object)
	slot7 = gui_object
	slot12 = 0
	self._ws = self._new_gui.create_object_workspace(slot3, self._new_gui, 0, 0, Vector3(slot9, 0, 0))
	slot4 = self._ws
	slot4 = self._ws.panel(slot3)
	slot7 = "guis/timer_gui"
	self._gui = self._ws.panel(slot3).gui(slot3, Idstring(0))
	slot4 = self._gui
	self._gui_script = self._gui.script(slot3)

	return 
end
function TimerGui:get_upgrade_icon_color(upgrade_color)
	if not self.THEME then
		return TimerGui.upgrade_colors[upgrade_color]
	end

	local theme = TimerGui.themes[self.THEME]

	return (theme and theme[upgrade_color]) or TimerGui.upgrade_colors[upgrade_color]
end
function TimerGui:_set_theme(theme_name)
	local theme = TimerGui.themes[theme_name]

	if not theme then
		return 
	end

	slot6 = not theme.hide_background

	self._gui_script.drill_screen_background.set_visible(slot4, self._gui_script.drill_screen_background)

	if theme.timer_color then
		slot6 = theme.timer_color

		self._gui_script.timer.set_color(slot4, self._gui_script.timer)
	end

	if theme.timer_background_color then
		slot6 = theme.timer_background_color

		self._gui_script.timer_background.set_color(slot4, self._gui_script.timer_background)
	end

	if theme.working_text_color then
		slot6 = theme.working_text_color

		self._gui_script.working_text.set_color(slot4, self._gui_script.working_text)
	end

	if theme.time_header_text_color then
		slot6 = theme.time_header_text_color

		self._gui_script.time_header_text.set_color(slot4, self._gui_script.time_header_text)
	end

	if theme.time_text_color then
		slot6 = theme.time_text_color

		self._gui_script.time_text.set_color(slot4, self._gui_script.time_text)
	end

	slot6 = (theme.bg_rect_color and true) or false

	self._gui_script.bg_rect.set_visible(slot4, self._gui_script.bg_rect)

	if theme.bg_rect_color then
		slot6 = theme.bg_rect_color

		self._gui_script.bg_rect.set_color(slot4, self._gui_script.bg_rect)
	end

	if theme.bg_rect_blend_mode then
		slot6 = theme.bg_rect_blend_mode

		self._gui_script.bg_rect.set_blend_mode(slot4, self._gui_script.bg_rect)
	end

	if theme.bg_rect_render_template then
		slot6 = theme.bg_rect_render_template

		self._gui_script.bg_rect.set_render_template(slot4, self._gui_script.bg_rect)
	end

	slot5 = self

	self._set_original_colors(slot4)

	return 
end
function TimerGui:_set_original_colors()
	self._original_colors = {}
	slot5 = self._gui_script.panel

	for _, child in ipairs(self._gui_script.panel.children(slot4)) do
		slot10 = child
		self._original_colors[child.key(slot8)] = child.color(child)
	end

	return 
end
function TimerGui:setup()
	slot3 = self._gui_script.working_text
	slot6 = "Text"

	self._gui_script.working_text.set_render_template(slot2, Idstring(slot5))

	slot3 = self._gui_script.time_header_text
	slot6 = "Text"

	self._gui_script.time_header_text.set_render_template(slot2, Idstring(slot5))

	slot3 = self._gui_script.time_text
	slot6 = "Text"

	self._gui_script.time_text.set_render_template(slot2, Idstring(slot5))

	slot3 = self._gui_script.drill_screen_background
	slot6 = self._gui_script.drill_screen_background
	slot6 = self._gui_script.drill_screen_background.parent(slot5)

	self._gui_script.drill_screen_background.set_size(slot2, self._gui_script.drill_screen_background.parent(slot5).size(slot5))

	slot4 = 120 * self._size_multiplier

	self._gui_script.timer.set_h(slot2, self._gui_script.timer)

	slot6 = self._gui_script.timer
	slot7 = self._gui_script.timer
	slot4 = self._gui_script.timer.parent(slot5).w(slot5) - self._gui_script.timer.parent(self._gui_script.timer.parent(slot5)).w(self._gui_script.timer.parent(slot5)) / 5

	self._gui_script.timer.set_w(slot2, self._gui_script.timer)

	slot6 = self._gui_script.timer
	slot6 = self._gui_script.timer.parent(self._gui_script.timer.parent(self._gui_script.timer.parent(slot5)).w(self._gui_script.timer.parent(slot5)) / 5)
	slot4 = self._gui_script.timer.parent(self._gui_script.timer.parent(self._gui_script.timer.parent(slot5)).w(self._gui_script.timer.parent(slot5)) / 5).w(self._gui_script.timer.parent(self._gui_script.timer.parent(slot5)).w(self._gui_script.timer.parent(slot5)) / 5) * 0.5

	self._gui_script.timer.set_center_x(slot2, self._gui_script.timer)

	slot6 = self._gui_script.timer
	slot6 = self._gui_script.timer.parent(self._gui_script.timer.parent(self._gui_script.timer.parent(slot5)).w(self._gui_script.timer.parent(slot5)) / 5)
	slot4 = self._gui_script.timer.parent(self._gui_script.timer.parent(self._gui_script.timer.parent(slot5)).w(self._gui_script.timer.parent(slot5)) / 5).h(self._gui_script.timer.parent(self._gui_script.timer.parent(slot5)).w(self._gui_script.timer.parent(slot5)) / 5) * 0.5 + 45 * self._size_multiplier

	self._gui_script.timer.set_center_y(slot2, self._gui_script.timer)

	slot3 = self._gui_script.timer
	slot8 = self._gui_script.timer

	self._gui_script.timer.set_y(slot2, math.round(self._gui_script.timer.y(self._gui_script.timer.parent(self._gui_script.timer.parent(slot5)))))

	slot3 = self._gui_script.timer
	self._timer_lenght = self._gui_script.timer.w(slot2)
	slot6 = self._gui_script.timer
	slot4 = self._gui_script.timer.h(45 * self._size_multiplier) + 20 * self._size_multiplier

	self._gui_script.timer_background.set_h(slot2, self._gui_script.timer_background)

	slot6 = self._gui_script.timer
	slot4 = self._gui_script.timer.w(20 * self._size_multiplier) + 20 * self._size_multiplier

	self._gui_script.timer_background.set_w(slot2, self._gui_script.timer_background)

	slot3 = self._gui_script.timer_background
	slot6 = self._gui_script.timer

	self._gui_script.timer_background.set_center(slot2, self._gui_script.timer.center(20 * self._size_multiplier))

	slot4 = 0

	self._gui_script.timer.set_w(slot2, self._gui_script.timer)

	slot6 = self._gui_script.working_text
	slot6 = self._gui_script.working_text.parent(20 * self._size_multiplier)
	slot4 = self._gui_script.working_text.parent(20 * self._size_multiplier).w(20 * self._size_multiplier) / 2

	self._gui_script.working_text.set_center_x(slot2, self._gui_script.working_text)

	slot6 = self._gui_script.working_text
	slot6 = self._gui_script.working_text.parent(20 * self._size_multiplier)
	slot4 = self._gui_script.working_text.parent(20 * self._size_multiplier).h(20 * self._size_multiplier) / 2.75

	self._gui_script.working_text.set_center_y(slot2, self._gui_script.working_text)

	slot4 = 110 * self._size_multiplier

	self._gui_script.working_text.set_font_size(slot2, self._gui_script.working_text)

	slot3 = self._gui_script.working_text
	slot7 = self._gui_start

	self._gui_script.working_text.set_text(slot2, managers.localization.text(20 * self._size_multiplier, managers.localization))

	slot4 = true

	self._gui_script.working_text.set_visible(slot2, self._gui_script.working_text)

	slot4 = 80 * self._size_multiplier

	self._gui_script.time_header_text.set_font_size(slot2, self._gui_script.time_header_text)

	slot4 = false

	self._gui_script.time_header_text.set_visible(slot2, self._gui_script.time_header_text)

	slot6 = self._gui_script.working_text
	slot6 = self._gui_script.working_text.parent(20 * self._size_multiplier)
	slot4 = self._gui_script.working_text.parent(20 * self._size_multiplier).w(20 * self._size_multiplier) / 2

	self._gui_script.time_header_text.set_center_x(slot2, self._gui_script.time_header_text)

	slot6 = self._gui_script.working_text
	slot6 = self._gui_script.working_text.parent(20 * self._size_multiplier)
	slot4 = self._gui_script.working_text.parent(20 * self._size_multiplier).h(20 * self._size_multiplier) / 1.325

	self._gui_script.time_header_text.set_center_y(slot2, self._gui_script.time_header_text)

	slot4 = 110 * self._size_multiplier

	self._gui_script.time_text.set_font_size(slot2, self._gui_script.time_text)

	slot4 = false

	self._gui_script.time_text.set_visible(slot2, self._gui_script.time_text)

	slot6 = self._gui_script.working_text
	slot6 = self._gui_script.working_text.parent(20 * self._size_multiplier)
	slot4 = self._gui_script.working_text.parent(20 * self._size_multiplier).w(20 * self._size_multiplier) / 2

	self._gui_script.time_text.set_center_x(slot2, self._gui_script.time_text)

	slot6 = self._gui_script.working_text
	slot6 = self._gui_script.working_text.parent(20 * self._size_multiplier)
	slot4 = self._gui_script.working_text.parent(20 * self._size_multiplier).h(20 * self._size_multiplier) / 1.125

	self._gui_script.time_text.set_center_y(slot2, self._gui_script.time_text)

	if self.THEME then
		slot4 = self.THEME

		self._set_theme(slot2, self)
	end

	self._original_colors = {}

	self._gui_script.panel.set_alpha(slot2, self._gui_script.panel)

	slot5 = self._gui_script.panel

	for _, child in ipairs(self._gui_script.panel.children(1)) do
		slot10 = child
		self._original_colors[child.key(slot8)] = child.color(child)
	end

	slot4 = 1

	self._gui_script.panel.set_alpha(slot2, self._gui_script.panel)

	return 
end
function TimerGui:reset()
	self._started = false

	return 
end
function TimerGui:_start(timer, current_timer)
	self._started = true
	self._done = false
	self._timer = timer or 5
	self._current_timer = current_timer or self._timer
	slot7 = 0.01
	slot4 = math.max(slot5, self._timer_multiplier or 1)
	self._time_left = self._current_timer * slot4
	slot6 = self._timer_lenght * (1 - self._current_timer / self._timer)

	self._gui_script.timer.set_w(slot4, self._gui_script.timer)

	slot5 = self._gui_script.working_text

	self._gui_script.working_text.set_text(slot4, managers.localization.text(1 - self._current_timer / self._timer, managers.localization))

	slot8 = "timer_gui"

	self._unit.set_extension_update_enabled(slot4, self._unit, Idstring(1 - self._current_timer / self._timer))

	self._update_enabled = true
	slot6 = self._start_event

	self.post_event(slot4, self)

	slot6 = true

	self._gui_script.time_header_text.set_visible(slot4, self._gui_script.time_header_text)

	slot6 = true

	self._gui_script.time_text.set_visible(slot4, self._gui_script.time_text)

	slot8 = self._time_left or self._current_timer
	slot11 = "prop_timer_gui_seconds"
	slot6 = math.floor(true) .. " " .. managers.localization.text(self._gui_working, managers.localization)

	self._gui_script.time_text.set_text(slot4, self._gui_script.time_text)

	slot5 = self._unit
	slot5 = self._unit.base(slot4)

	self._unit.base(slot4).start(slot4)

	slot5 = Network

	if Network.is_client(slot4) then
		return 
	end

	slot5 = self

	self._set_jamming_values(slot4)

	return 
end
function TimerGui:_set_jamming_values()
	if not self._can_jam then
		return 
	end

	self._jamming_intervals = {}
	slot3 = self._jam_times
	local jammed_times = math.random(slot2)
	local interval = self._timer / jammed_times

	for i = 1, jammed_times, 1 do
		local start = interval / 2
		slot11 = start / 1.25
		self._jamming_intervals[i] = start + math.rand(slot10)
	end

	slot6 = 1
	self._current_jam_timer = table.remove(slot4, self._jamming_intervals)

	return 
end
function TimerGui:set_timer_multiplier(multiplier)
	self._timer_multiplier = multiplier

	return 
end
function TimerGui:set_skill(skill)
	if self._skill == nil or self._skill < skill then
		self._skill = skill
	end

	return 
end
function TimerGui:set_background_icons(background_icons)
	local panel = self._gui_script.panel
	slot6 = "background_icons_panel"

	if not panel.child(slot4, panel) then
		slot6 = {
			name = "background_icons_panel"
		}
		local background_icons_panel = panel.panel(slot4, panel)
	end

	background_icons_panel.rect(slot5, background_icons_panel)

	slot8 = background_icons_panel

	for _, child in ipairs(background_icons_panel.children({
		layer = 3,
		color = Color.green
	})) do
		slot12 = child
		self._original_colors[child.key(slot11)] = nil
	end

	slot6 = background_icons_panel

	background_icons_panel.clear(slot5)

	local alpha = self._gui_script.panel.alpha(slot5)
	slot8 = 1

	self._gui_script.panel.set_alpha(self._gui_script.panel, self._gui_script.panel)

	self._original_colors = self._original_colors or {}
	slot7 = background_icons

	for i, icon_data in ipairs(slot6) do
		local icon = background_icons_panel.bitmap(slot11, background_icons_panel)
		slot11 = self._original_colors
		slot14 = icon
		slot12 = icon.key(icon_data)

		if not icon_data.color then
			slot15 = icon
			slot13 = icon.color(slot14)
		end

		slot11[slot12] = slot13
	end

	slot8 = alpha

	self._gui_script.panel.set_alpha(slot6, self._gui_script.panel)

	return 
end
function TimerGui:start(timer)
	if not self._override_timer then
	end

	if self._jammed then
		slot5 = false

		self._set_jammed(slot3, self)

		return 
	end

	if not self._powered then
		slot5 = true

		self._set_powered(slot3, self)

		return 
	end

	if self._started then
		return 
	end

	slot5 = timer

	self._start(slot3, self)

	slot4 = managers.network

	if managers.network.session(slot3) then
		slot4 = managers.network
		slot7 = timer

		managers.network.session(slot3).send_to_peers_synched(slot3, managers.network.session(slot3), "start_timer_gui", self._unit)
	end

	return 
end
function TimerGui:sync_start(timer)
	slot5 = timer

	self._start(slot3, self)

	return 
end
function TimerGui:update(unit, t, dt)
	if self._jammed then
		slot6 = self._gui_script.drill_screen_background
		slot9 = self._gui_script.drill_screen_background
		slot12 = t * 750
		slot10 = 0.5 + (math.sin(slot11) + 1) / 4

		self._gui_script.drill_screen_background.set_color(slot5, self._gui_script.drill_screen_background.color(slot8).with_alpha(slot8, self._gui_script.drill_screen_background.color(slot8)))

		slot6 = self._gui_script.bg_rect
		slot9 = self._gui_script.bg_rect
		slot12 = t * 750
		slot10 = 0.5 + (math.sin(slot11) + 1) / 4

		self._gui_script.bg_rect.set_color(slot5, self._gui_script.bg_rect.color(slot8).with_alpha(slot8, self._gui_script.bg_rect.color(slot8)))

		return 
	end

	if not self._powered then
		return 
	end

	slot7 = 0.01
	local dt_mod = math.max(slot5, self._timer_multiplier or 1)

	if self._current_jam_timer then
		self._current_jam_timer = self._current_jam_timer - dt / dt_mod

		if self._current_jam_timer <= 0 then
			slot8 = true

			self.set_jammed(slot6, self)

			slot8 = 1
			self._current_jam_timer = table.remove(slot6, self._jamming_intervals)

			return 
		end
	end

	self._current_timer = self._current_timer - dt / dt_mod
	self._time_left = self._current_timer * dt_mod
	slot10 = self._time_left or self._current_timer
	slot13 = "prop_timer_gui_seconds"
	slot8 = math.floor(slot9) .. " " .. managers.localization.text(slot11, managers.localization)

	self._gui_script.time_text.set_text(slot6, self._gui_script.time_text)

	slot8 = self._timer_lenght * (1 - self._current_timer / self._timer)

	self._gui_script.timer.set_w(slot6, self._gui_script.timer)

	if self._current_timer <= 0 then
		slot10 = "timer_gui"

		self._unit.set_extension_update_enabled(slot6, self._unit, Idstring(false))

		self._update_enabled = false
		slot7 = self

		self.done(slot6)
	else
		slot7 = self._gui_script.working_text
		slot10 = self._gui_script.working_text
		slot13 = t * 750
		slot11 = 0.5 + (math.sin(slot12) + 1) / 4

		self._gui_script.working_text.set_color(slot6, self._gui_script.working_text.color(slot9).with_alpha(slot9, self._gui_script.working_text.color(slot9)))
	end

	return 
end
function TimerGui:set_visible(visible)
	self._visible = visible
	slot5 = visible

	self._gui.set_visible(slot3, self._gui)

	return 
end
function TimerGui:is_visible()
	return self._visible
end
function TimerGui:sync_net_event(event_id)
	if event_id == TimerGui.EVENT_IDS.jammed then
		slot5 = true

		self._set_jammed(slot3, self)
	elseif event_id == TimerGui.EVENT_IDS.unjammed then
		slot5 = false

		self._set_jammed(slot3, self)
	end

	return 
end
function TimerGui:set_jammed(jammed)
	slot4 = managers.network

	if managers.network.session(slot3) then
		local event_id = (jammed and TimerGui.EVENT_IDS.jammed) or TimerGui.EVENT_IDS.unjammed
		slot5 = managers.network
		slot9 = event_id

		managers.network.session(slot4).send_to_peers_synched(slot4, managers.network.session(slot4), "sync_unit_event_id_16", self._unit, "timer_gui")
	end

	slot5 = jammed

	self._set_jammed(slot3, self)

	return 
end
function TimerGui:_set_jammed(jammed)
	self._jammed = jammed

	if self._jammed then
		slot4 = self._unit

		if self._unit.damage(slot3) then
			slot4 = self._unit
			slot5 = "set_is_jammed"

			if self._unit.damage(slot3).has_sequence(slot3, self._unit.damage(slot3)) then
				slot4 = self._unit
				slot5 = "set_is_jammed"

				self._unit.damage(slot3).run_sequence_simple(slot3, self._unit.damage(slot3))
			end

			slot4 = self._unit
			slot5 = "jammed_trigger"

			if self._unit.damage(slot3).has_sequence(slot3, self._unit.damage(slot3)) then
				slot4 = self._unit
				slot5 = "jammed_trigger"

				self._unit.damage(slot3).run_sequence_simple(slot3, self._unit.damage(slot3))
			end
		end

		slot6 = self._gui_script.panel

		for _, child in ipairs(self._gui_script.panel.children(slot5)) do
			local theme = TimerGui.themes[self.THEME]

			if child.children then
				slot12 = child

				for _, grandchild in ipairs(child.children(slot11)) do
					slot16 = grandchild
					local color = self._original_colors[grandchild.key(slot15)]
					slot19 = 0
					local c = Color(slot15, color.a, 1, 0)
					slot18 = c

					grandchild.set_color(color.a, grandchild)
				end
			else

				-- Decompilation error in this vicinity:
				slot11 = child
				local color = self._original_colors[child.key(slot10)]

				if blend_mode then
					slot15 = blend_mode

					child.set_blend_mode(slot13, child)
				end
			end
		end

		slot4 = self._gui_script.working_text
		slot8 = self._gui_malfunction

		self._gui_script.working_text.set_text(slot3, managers.localization.text(slot6, managers.localization))

		slot4 = self._gui_script.time_text
		slot8 = "prop_timer_gui_error"

		self._gui_script.time_text.set_text(slot3, managers.localization.text(slot6, managers.localization))

		slot4 = self._unit

		if self._unit.interaction(slot3) then
			if self._jammed_tweak_data then
				slot4 = self._unit
				slot5 = self._jammed_tweak_data

				self._unit.interaction(slot3).set_tweak_data(slot3, self._unit.interaction(slot3))
			end

			slot4 = self._unit
			slot5 = true

			self._unit.interaction(slot3).set_active(slot3, self._unit.interaction(slot3))
		end

		slot5 = self._jam_event

		self.post_event(slot3, self)
	else
		slot6 = self._gui_script.panel

		for _, child in ipairs(self._gui_script.panel.children(slot5)) do
			if child.children then
				slot11 = child

				for _, grandchild in ipairs(child.children(slot10)) do
					slot18 = grandchild
					slot15 = self._original_colors[grandchild.key(slot17)]

					grandchild.set_color(slot13, grandchild)
				end
			else
				slot13 = child
				slot10 = self._original_colors[child.key(slot12)]

				child.set_color(slot8, child)
			end
		end

		slot4 = self._gui_script.working_text

		self._gui_script.working_text.set_text(slot3, managers.localization.text(slot6, managers.localization))

		slot7 = self._time_left or self._current_timer
		slot10 = "prop_timer_gui_seconds"
		slot5 = math.floor(slot6) .. " " .. managers.localization.text(self._gui_working, managers.localization)

		self._gui_script.time_text.set_text(slot3, self._gui_script.time_text)

		slot4 = self._gui_script.drill_screen_background
		slot7 = self._gui_script.drill_screen_background
		slot8 = 1

		self._gui_script.drill_screen_background.set_color(slot3, self._gui_script.drill_screen_background.color(" ").with_alpha(" ", self._gui_script.drill_screen_background.color(" ")))

		slot5 = self._resume_event

		self.post_event(slot3, self)

		local theme = TimerGui.themes[self.THEME]

		if theme and theme.bg_rect_blend_mode then
			slot6 = theme.bg_rect_blend_mode

			self._gui_script.bg_rect.set_blend_mode(slot4, self._gui_script.bg_rect)
		end
	end

	slot4 = self._unit
	slot5 = jammed

	self._unit.base(slot3).set_jammed(slot3, self._unit.base(slot3))

	slot4 = self._unit

	if self._unit.mission_door_device(slot3) then
		slot4 = self._unit
		slot5 = jammed

		self._unit.mission_door_device(slot3).report_jammed_state(slot3, self._unit.mission_door_device(slot3))
	end

	return 
end
function TimerGui:set_powered(powered, enable_interaction)
	slot7 = enable_interaction

	self._set_powered(slot4, self, powered)

	return 
end
function TimerGui:_set_powered(powered, enable_interaction)
	self._powered = powered

	if not self._powered then
		slot7 = self._gui_script.panel

		for _, child in ipairs(self._gui_script.panel.children(slot6)) do
			if child.children then
				slot12 = child

				for _, grandchild in ipairs(child.children(slot11)) do
					slot16 = grandchild
					local color = self._original_colors[grandchild.key(slot15)]
					slot19 = 0
					local c = Color(slot15, color.a, 1, 0)
					slot18 = c

					grandchild.set_color(color.a, grandchild)
				end
			else
				slot11 = child
				local color = self._original_colors[child.key(slot10)]
				slot14 = 0
				local c = Color(slot10, color.a, 1, 0)
				slot13 = c

				child.set_color(color.a, child)
			end
		end

		slot6 = self._power_off_event or self._jam_event

		self.post_event(slot4, self)

		if enable_interaction then
			slot5 = self._unit

			if self._unit.interaction(slot4) then
				self._powered_interaction_enabled = enable_interaction

				if self._jammed_tweak_data then
					slot5 = self._unit
					slot6 = self._jammed_tweak_data

					self._unit.interaction(slot4).set_tweak_data(slot4, self._unit.interaction(slot4))
				end

				slot5 = self._unit
				slot6 = true

				self._unit.interaction(slot4).set_active(slot4, self._unit.interaction(slot4))
			end
		end

		slot6 = self._power_off_event or self._jam_event

		self.post_event(slot4, self)
	else
		slot7 = self._gui_script.panel

		for _, child in ipairs(self._gui_script.panel.children(slot6)) do
			if child.children then
				slot12 = child

				for _, grandchild in ipairs(child.children(slot11)) do
					slot19 = grandchild
					slot16 = self._original_colors[grandchild.key(slot18)]

					grandchild.set_color(slot14, grandchild)
				end
			else
				slot14 = child
				slot11 = self._original_colors[child.key(slot13)]

				child.set_color(slot9, child)
			end
		end

		slot6 = self._resume_event

		self.post_event(slot4, self)

		if self._powered_interaction_enabled then
			self._powered_interaction_enabled = nil
			slot5 = self._unit

			if self._unit.mission_door_device(slot4) then
				slot5 = self._unit
				slot5 = self._unit.mission_door_device(slot4)

				self._unit.mission_door_device(slot4).report_resumed(slot4)
			end
		end
	end

	slot5 = self._unit
	slot6 = powered

	self._unit.base(slot4).set_powered(slot4, self._unit.base(slot4))

	return 
end
function TimerGui:done()
	slot3 = self

	self._set_done(slot2)

	slot3 = self._unit

	if self._unit.damage(slot2) then
		slot3 = self._unit
		slot4 = "timer_done"

		self._unit.damage(slot2).run_sequence_simple(slot2, self._unit.damage(slot2))
	end

	slot4 = self._done_event

	self.post_event(slot2, self)

	slot3 = self._unit

	if self._unit.mission_door_device(slot2) then
		slot3 = self._unit
		slot3 = self._unit.mission_door_device(slot2)

		self._unit.mission_door_device(slot2).report_completed(slot2)
	end

	return 
end
function TimerGui:_set_done()
	self._done = true
	slot4 = self._timer_lenght

	self._gui_script.timer.set_w(slot2, self._gui_script.timer)

	slot3 = self._gui_script.working_text
	slot6 = self._gui_script.working_text
	slot7 = 1

	self._gui_script.working_text.set_color(slot2, self._gui_script.working_text.color(slot5).with_alpha(slot5, self._gui_script.working_text.color(slot5)))

	slot3 = self._gui_script.working_text
	slot7 = self._gui_done

	self._gui_script.working_text.set_text(slot2, managers.localization.text(slot5, managers.localization))

	slot4 = false

	self._gui_script.time_header_text.set_visible(slot2, self._gui_script.time_header_text)

	slot4 = false

	self._gui_script.time_text.set_visible(slot2, self._gui_script.time_text)

	slot3 = self._unit
	slot3 = self._unit.base(slot2)

	self._unit.base(slot2).done(slot2)

	return 
end
function TimerGui:update_sound_event()
	if self._done or not self._started or self._jammed or not self._powered then
		return 
	end

	slot4 = self._resume_event

	self.post_event(slot2, self)

	return 
end
function TimerGui:lock_gui()
	slot4 = self._cull_distance

	self._ws.set_cull_distance(slot2, self._ws)

	slot4 = true

	self._ws.set_frozen(slot2, self._ws)

	return 
end
function TimerGui:destroy()
	slot3 = self._new_gui

	if alive(slot2) then
		slot3 = self._ws

		if alive(slot2) then
			slot4 = self._ws

			self._new_gui.destroy_workspace(slot2, self._new_gui)

			self._ws = nil
			self._new_gui = nil
		end
	end

	return 
end
function TimerGui:save(data)
	local state = {
		update_enabled = self._update_enabled,
		timer = self._timer,
		current_timer = self._current_timer,
		jammed = self._jammed,
		powered = self._powered,
		powered_interaction_enabled = self._powered_interaction_enabled,
		done = self._done,
		visible = self._visible,
		timer_multiplier = self._timer_multiplier,
		skill = self._skill
	}
	data.TimerGui = state

	return 
end
function TimerGui:load(data)
	local state = data.TimerGui
	slot6 = state.skill or 1

	self.set_skill(slot4, self)

	if state.done then
		slot5 = self

		self._set_done(slot4)
	elseif state.update_enabled then
		slot7 = state.current_timer

		self._start(slot4, self, state.timer)

		if state.jammed then
			slot6 = state.jammed

			self._set_jammed(slot4, self)
		end

		if not state.powered then
			slot7 = state.powered_interaction_enabled

			self._set_powered(slot4, self, state.powered)
		end

		if not state.jammed then
			slot5 = self._unit

			if self._unit.interaction(slot4) then
				slot5 = self._unit

				if self._unit.interaction(slot4).check_for_upgrade then
					slot5 = self._unit
					slot5 = self._unit.interaction(slot4)

					self._unit.interaction(slot4).check_for_upgrade(slot4)
				end
			end
		end
	end

	slot6 = state.visible

	self.set_visible(slot4, self)

	slot6 = state.timer_multiplier or 1

	self.set_timer_multiplier(slot4, self)

	return 
end
function TimerGui:post_event(event)
	if not event then
		return 
	end

	if event == self._start_event or event == self._resume_event or event == self._done_event then
		if self._skill == 3 then
			slot4 = self._unit
			slot5 = event .. "_aced"

			self._unit.sound_source(slot3).post_event(slot3, self._unit.sound_source(slot3))
		elseif self._skill == 2 then
			slot4 = self._unit
			slot5 = event .. "_basic"

			self._unit.sound_source(slot3).post_event(slot3, self._unit.sound_source(slot3))
		else
			slot4 = self._unit
			slot5 = event

			self._unit.sound_source(slot3).post_event(slot3, self._unit.sound_source(slot3))
		end
	else
		slot4 = self._unit
		slot5 = event

		self._unit.sound_source(slot3).post_event(slot3, self._unit.sound_source(slot3))
	end

	return 
end

if not DrillTimerGui then
	slot2 = TimerGui
	slot0 = class(slot1)
end

DrillTimerGui = slot0
function DrillTimerGui:post_event(event)
	if not event then
		return 
	end

	if event == self._start_event or event == self._resume_event or event == self._done_event then
		if self._skill == 3 then
			slot4 = self._unit
			slot5 = event .. "_aced"

			self._unit.sound_source(slot3).post_event(slot3, self._unit.sound_source(slot3))
		elseif self._skill == 2 then
			slot4 = self._unit
			slot5 = event .. "_basic"

			self._unit.sound_source(slot3).post_event(slot3, self._unit.sound_source(slot3))
		else
			slot4 = self._unit
			slot5 = event

			self._unit.sound_source(slot3).post_event(slot3, self._unit.sound_source(slot3))
		end
	else
		slot4 = self._unit
		slot5 = event

		self._unit.sound_source(slot3).post_event(slot3, self._unit.sound_source(slot3))
	end

	return 
end

return 
