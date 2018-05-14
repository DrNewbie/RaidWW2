HUDCombatDebug = HUDCombatDebug or class()
function HUDCombatDebug:init(hud)
	self._hud_panel = hud.panel
	self._is_shown = false
	slot5 = "combat_debug_panel"

	if self._hud_panel.child(slot3, self._hud_panel) then
		slot4 = self._hud_panel
		slot8 = "combat_debug_panel"

		self._hud_panel.remove(slot3, self._hud_panel.child(slot6, self._hud_panel))
	end

	slot5 = {
		halign = "center",
		name = "combat_debug_panel",
		h = 265,
		visible = false,
		w = 300,
		layer = 99,
		valign = "center"
	}
	self._combat_debug_panel = self._hud_panel.panel(slot3, self._hud_panel)
	slot7 = self._combat_debug_panel
	slot8 = self._combat_debug_panel
	slot8 = self._combat_debug_panel.parent(self._combat_debug_panel.parent(slot6))

	self._combat_debug_panel.set_center(slot3, self._combat_debug_panel, (0.8888888888888888 * self._combat_debug_panel.parent(slot6).w(slot6)) / 2)

	slot4 = self._combat_debug_panel
	slot7 = self._combat_debug_panel

	self._combat_debug_panel.set_right(slot3, self._combat_debug_panel.parent(self._combat_debug_panel.parent(self._combat_debug_panel.parent(slot6)).h(self._combat_debug_panel.parent(slot6)) / 2).w(self._combat_debug_panel.parent(self._combat_debug_panel.parent(slot6)).h(self._combat_debug_panel.parent(slot6)) / 2))

	slot5 = {
		name = "combat_debug_bg",
		y = 0,
		x = 0,
		w = self._combat_debug_panel.w(self._combat_debug_panel.parent(self._combat_debug_panel.parent(self._combat_debug_panel.parent(slot6)).h(self._combat_debug_panel.parent(slot6)) / 2)),
		h = self._combat_debug_panel.h(self._combat_debug_panel.parent(self._combat_debug_panel.parent(self._combat_debug_panel.parent(slot6)).h(self._combat_debug_panel.parent(slot6)) / 2)),
		color = Color.black.with_alpha(self._combat_debug_panel.parent(self._combat_debug_panel.parent(self._combat_debug_panel.parent(slot6)).h(self._combat_debug_panel.parent(slot6)) / 2), Color.black)
	}
	slot8 = self._combat_debug_panel
	slot8 = self._combat_debug_panel
	slot9 = 0.7
	local background = self._combat_debug_panel.rect(slot3, self._combat_debug_panel)
	self._default_font_size = tweak_data.gui.font_sizes.size_16
	slot7 = self._default_font_size
	self._default_font = tweak_data.gui.get_font_path(self._combat_debug_panel, tweak_data.gui, tweak_data.gui.fonts.lato)
	slot6 = {
		name = "combat_debug_intensity",
		vertical = "top",
		text = "Game intensity:",
		y = 10,
		align = "left",
		blend_mode = "normal",
		visible = true,
		x = 10,
		color = Color(Color.black, 0.937, 0.6),
		font = self._default_font,
		font_size = self._default_font_size,
		layer = background.layer(Color.black) + 1
	}
	slot11 = 0.2
	slot9 = background
	self._game_intensity = self._combat_debug_panel.text(self._combat_debug_panel, self._combat_debug_panel)
	slot6 = {
		name = "combat_debug_phase",
		vertical = "top",
		text = "Current phase:",
		y = 35,
		align = "left",
		blend_mode = "normal",
		visible = true,
		x = 10,
		color = Color(Color.black, 0.937, 0.6),
		font = self._default_font,
		font_size = self._default_font_size,
		layer = background.layer(Color.black) + 1
	}
	slot11 = 0.2
	slot9 = background
	self._current_phase = self._combat_debug_panel.text(self._combat_debug_panel, self._combat_debug_panel)
	slot6 = {
		name = "combat_debug_phase_duration",
		vertical = "top",
		text = "Current phase - time elapsed:",
		y = 60,
		align = "left",
		blend_mode = "normal",
		visible = true,
		x = 10,
		color = Color(Color.black, 0.937, 0.6),
		font = self._default_font,
		font_size = self._default_font_size,
		layer = background.layer(Color.black) + 1
	}
	slot11 = 0.2
	slot9 = background
	self._current_phase_duration = self._combat_debug_panel.text(self._combat_debug_panel, self._combat_debug_panel)
	slot6 = {
		name = "combat_debug_phase_number",
		vertical = "top",
		text = "Phase number:",
		y = 85,
		align = "left",
		blend_mode = "normal",
		visible = true,
		x = 10,
		color = Color(Color.black, 0.2, 0.7529411764705882),
		font = self._default_font,
		font_size = self._default_font_size,
		layer = background.layer(Color.black) + 1
	}
	slot11 = 0.9372549019607843
	slot9 = background
	self._phase_number = self._combat_debug_panel.text(self._combat_debug_panel, self._combat_debug_panel)
	slot6 = {
		name = "combat_debug_phase_enemies_spawned",
		vertical = "top",
		text = "Enemies spawned (phase):",
		y = 110,
		align = "left",
		blend_mode = "normal",
		visible = true,
		x = 10,
		color = Color(Color.black, 0.3058823529411765, 0.6745098039215687),
		font = self._default_font,
		font_size = self._default_font_size,
		layer = background.layer(Color.black) + 1
	}
	slot11 = 0.23137254901960785
	slot9 = background
	self._spawned_phase = self._combat_debug_panel.text(self._combat_debug_panel, self._combat_debug_panel)
	slot6 = {
		name = "combat_debug_phase_enemies_killed",
		vertical = "top",
		text = "Enemies killed (phase):",
		y = 135,
		align = "left",
		blend_mode = "normal",
		visible = true,
		x = 10,
		color = Color(Color.black, 0.2980392156862745, 0.796078431372549),
		font = self._default_font,
		font_size = self._default_font_size,
		layer = background.layer(Color.black) + 1
	}
	slot11 = 0.2823529411764706
	slot9 = background
	self._killed_phase = self._combat_debug_panel.text(self._combat_debug_panel, self._combat_debug_panel)
	slot6 = {
		name = "combat_debug_lifetime_enemies_spawned",
		vertical = "top",
		text = "Enemies spawned (lifetime):",
		y = 160,
		align = "left",
		blend_mode = "normal",
		visible = true,
		x = 10,
		color = Color(Color.black, 0.7137254901960784, 0.2627450980392157),
		font = self._default_font,
		font_size = self._default_font_size,
		layer = background.layer(Color.black) + 1
	}
	slot11 = 0.7411764705882353
	slot9 = background
	self._spawned_lifetime = self._combat_debug_panel.text(self._combat_debug_panel, self._combat_debug_panel)
	slot6 = {
		name = "combat_debug_lifetime_enemies_killed",
		vertical = "top",
		text = "Enemies killed (lifetime):",
		y = 185,
		align = "left",
		blend_mode = "normal",
		visible = true,
		x = 10,
		color = Color(Color.black, 0.8509803921568627, 0.3568627450980392),
		font = self._default_font,
		font_size = self._default_font_size,
		layer = background.layer(Color.black) + 1
	}
	slot11 = 0.8823529411764706
	slot9 = background
	self._killed_lifetime = self._combat_debug_panel.text(self._combat_debug_panel, self._combat_debug_panel)
	slot6 = {
		name = "combat_debug_enemies_alive",
		vertical = "top",
		text = "Enemies alive:",
		y = 210,
		align = "left",
		blend_mode = "normal",
		visible = true,
		x = 10,
		color = Color(Color.black, 0.8823529411764706, 0.3568627450980392),
		font = self._default_font,
		font_size = self._default_font_size,
		layer = background.layer(Color.black) + 1
	}
	slot11 = 0.3568627450980392
	slot9 = background
	self._enemies_alive = self._combat_debug_panel.text(self._combat_debug_panel, self._combat_debug_panel)
	slot6 = {
		name = "combat_debug_music_state",
		vertical = "top",
		text = "Music state:",
		y = 235,
		align = "left",
		blend_mode = "normal",
		visible = true,
		x = 10,
		color = Color(Color.black, 0.8823529411764706, 0.3568627450980392),
		font = self._default_font,
		font_size = self._default_font_size,
		layer = background.layer(Color.black) + 1
	}
	slot11 = 0.3568627450980392
	slot9 = background
	self._music_state = self._combat_debug_panel.text(self._combat_debug_panel, self._combat_debug_panel)
	slot6 = {
		name = "combat_debug_intensity_val",
		vertical = "top",
		text = "",
		align = "right",
		blend_mode = "normal",
		visible = true,
		x = -10,
		color = Color(Color.black, 0.937, 0.6),
		font = self._default_font,
		font_size = self._default_font_size,
		y = self._game_intensity.y(Color.black),
		layer = background.layer(Color.black) + 1
	}
	slot11 = 0.2
	slot9 = self._game_intensity
	slot9 = background
	self._game_intensity_val = self._combat_debug_panel.text(self._combat_debug_panel, self._combat_debug_panel)
	slot6 = {
		name = "combat_debug_phase_val",
		vertical = "top",
		text = "reenforce",
		align = "right",
		blend_mode = "normal",
		visible = true,
		x = -10,
		color = Color(Color.black, 0.937, 0.6),
		font = self._default_font,
		font_size = self._default_font_size,
		y = self._current_phase.y(Color.black),
		layer = background.layer(Color.black) + 1
	}
	slot11 = 0.2
	slot9 = self._current_phase
	slot9 = background
	self._current_phase_val = self._combat_debug_panel.text(self._combat_debug_panel, self._combat_debug_panel)
	slot6 = {
		name = "combat_debug_phase_duration_val",
		vertical = "top",
		text = "0",
		align = "right",
		blend_mode = "normal",
		visible = true,
		x = -10,
		color = Color(Color.black, 0.937, 0.6),
		font = self._default_font,
		font_size = self._default_font_size,
		y = self._current_phase_duration.y(Color.black),
		layer = background.layer(Color.black) + 1
	}
	slot11 = 0.2
	slot9 = self._current_phase_duration
	slot9 = background
	self._current_phase_duration_val = self._combat_debug_panel.text(self._combat_debug_panel, self._combat_debug_panel)
	self._current_phase_timer = 0
	slot6 = {
		name = "combat_debug_phase_number_val",
		vertical = "top",
		text = "0",
		align = "right",
		blend_mode = "normal",
		visible = true,
		x = -10,
		color = Color(Color.black, 0.2, 0.7529411764705882),
		font = self._default_font,
		font_size = self._default_font_size,
		y = self._phase_number.y(Color.black),
		layer = background.layer(Color.black) + 1
	}
	slot11 = 0.9372549019607843
	slot9 = self._phase_number
	slot9 = background
	self._phase_number_val = self._combat_debug_panel.text(self._combat_debug_panel, self._combat_debug_panel)
	slot6 = {
		name = "combat_debug_phase_enemies_spawned_val",
		vertical = "top",
		text = "0",
		align = "right",
		blend_mode = "normal",
		visible = true,
		x = -10,
		color = Color(Color.black, 0.3058823529411765, 0.6745098039215687),
		font = self._default_font,
		font_size = self._default_font_size,
		y = self._spawned_phase.y(Color.black),
		layer = background.layer(Color.black) + 1
	}
	slot11 = 0.23137254901960785
	slot9 = self._spawned_phase
	slot9 = background
	self._spawned_phase_val = self._combat_debug_panel.text(self._combat_debug_panel, self._combat_debug_panel)
	slot6 = {
		name = "combat_debug_phase_enemies_killed_val",
		vertical = "top",
		text = "0",
		align = "right",
		blend_mode = "normal",
		visible = true,
		x = -10,
		color = Color(Color.black, 0.2980392156862745, 0.796078431372549),
		font = self._default_font,
		font_size = self._default_font_size,
		y = self._killed_phase.y(Color.black),
		layer = background.layer(Color.black) + 1
	}
	slot11 = 0.2823529411764706
	slot9 = self._killed_phase
	slot9 = background
	self._killed_phase_val = self._combat_debug_panel.text(self._combat_debug_panel, self._combat_debug_panel)
	slot6 = {
		name = "combat_debug_lifetime_enemies_spawned_val",
		vertical = "top",
		text = "0",
		align = "right",
		blend_mode = "normal",
		visible = true,
		x = -10,
		color = Color(Color.black, 0.7137254901960784, 0.2627450980392157),
		font = self._default_font,
		font_size = self._default_font_size,
		y = self._spawned_lifetime.y(Color.black),
		layer = background.layer(Color.black) + 1
	}
	slot11 = 0.7411764705882353
	slot9 = self._spawned_lifetime
	slot9 = background
	self._spawned_lifetime_val = self._combat_debug_panel.text(self._combat_debug_panel, self._combat_debug_panel)
	slot6 = {
		name = "combat_debug_lifetime_enemies_killed_val",
		vertical = "top",
		text = "0",
		align = "right",
		blend_mode = "normal",
		visible = true,
		x = -10,
		color = Color(Color.black, 0.8509803921568627, 0.3568627450980392),
		font = self._default_font,
		font_size = self._default_font_size,
		y = self._killed_lifetime.y(Color.black),
		layer = background.layer(Color.black) + 1
	}
	slot11 = 0.8823529411764706
	slot9 = self._killed_lifetime
	slot9 = background
	self._killed_lifetime_val = self._combat_debug_panel.text(self._combat_debug_panel, self._combat_debug_panel)
	slot6 = {
		name = "combat_debug_enemies_alive_val",
		vertical = "top",
		text = "0",
		align = "right",
		blend_mode = "normal",
		visible = true,
		x = -10,
		color = Color(Color.black, 0.8823529411764706, 0.3568627450980392),
		font = self._default_font,
		font_size = self._default_font_size,
		y = self._enemies_alive.y(Color.black),
		layer = background.layer(Color.black) + 1
	}
	slot11 = 0.3568627450980392
	slot9 = self._enemies_alive
	slot9 = background
	self._enemies_alive_val = self._combat_debug_panel.text(self._combat_debug_panel, self._combat_debug_panel)
	slot6 = {
		name = "combat_debug_music_state_val",
		vertical = "top",
		text = "none",
		align = "right",
		blend_mode = "normal",
		visible = true,
		x = -10,
		color = Color(Color.black, 0.8823529411764706, 0.3568627450980392),
		font = self._default_font,
		font_size = self._default_font_size,
		y = self._music_state.y(Color.black),
		layer = background.layer(Color.black) + 1
	}
	slot11 = 0.3568627450980392
	slot9 = self._music_state
	slot9 = background
	self._music_state_val = self._combat_debug_panel.text(self._combat_debug_panel, self._combat_debug_panel)
	slot6 = "combat_debug_panel"
	slot11 = "update"

	managers.hud.add_updator(self._combat_debug_panel, managers.hud, callback(Color.black, self, self))

	return 
end
function HUDCombatDebug:update(t, dt)
	self._current_phase_timer = self._current_phase_timer + dt

	if self._is_shown == false then
		return 
	end

	slot10 = managers.groupai
	slot10 = managers.groupai.state(slot9)
	local game_intensity = string.format(slot4, tostring(managers.groupai.state(slot9).get_difficulty(slot9)))
	slot6 = self._game_intensity_val

	if self._game_intensity_val.text("%.3f") ~= game_intensity then
		slot7 = game_intensity

		self._game_intensity_val.set_text(slot5, self._game_intensity_val)

		slot6 = self._game_intensity_val

		self._game_intensity_val.stop(slot5)

		slot11 = "_animate_change"
		slot7 = callback(slot8, self, self)
		slot12 = 0.2

		self._game_intensity_val.animate(slot5, self._game_intensity_val, Color(self, 0.937, 0.6))
	end

	slot8 = managers.groupai
	slot8 = managers.groupai.state(self._current_phase_val)
	local current_phase = tostring(managers.groupai.state(self._current_phase_val).current_phase(slot7))

	if self._current_phase_val.text(managers.groupai.state(self._current_phase_val).current_phase) ~= current_phase then
		slot8 = current_phase

		self._current_phase_val.set_text(slot6, self._current_phase_val)

		slot7 = self._current_phase_val

		self._current_phase_val.stop(slot6)

		slot12 = "_animate_change"
		slot8 = callback(slot9, self, self)
		slot13 = 0.2

		self._current_phase_val.animate(slot6, self._current_phase_val, Color(self, 0.937, 0.6))

		slot7 = self._current_phase_duration_val

		self._current_phase_duration_val.stop(slot6)

		slot12 = "_animate_change"
		slot8 = callback(Color, self, self)
		slot13 = 0.2

		self._current_phase_duration_val.animate(slot6, self._current_phase_duration_val, Color(self, 0.937, 0.6))

		self._current_phase_timer = 0
	end

	local curr_t = math.floor(slot6)
	slot8 = self._current_phase_duration_val
	slot14 = curr_t % 60

	self._current_phase_duration_val.set_text(self._current_phase_timer + 0.5, string.format(slot10, "%.2d:%.2d:%.2d", curr_t / 3600, (curr_t / 60) % 60))

	slot10 = managers.groupai
	slot10 = managers.groupai.state(string.format)
	local phase_number = tostring(managers.groupai.state(string.format).wave_number(string.format))
	slot9 = self._phase_number_val

	if self._phase_number_val.text(managers.groupai.state(string.format).wave_number) ~= phase_number then
		slot10 = phase_number

		self._phase_number_val.set_text(slot8, self._phase_number_val)

		slot9 = self._phase_number_val

		self._phase_number_val.stop(slot8)

		slot14 = "_animate_change"
		slot10 = callback(slot11, self, self)
		slot15 = 0.9372549019607843

		self._phase_number_val.animate(slot8, self._phase_number_val, Color(self, 0.2, 0.7529411764705882))
	end

	slot11 = managers.groupai
	slot11 = managers.groupai.state(self._spawned_phase_val)
	local spawned_phase = tostring(managers.groupai.state(self._spawned_phase_val).enemies_spawned_in_current_phase(slot10))

	if self._spawned_phase_val.text(managers.groupai.state(self._spawned_phase_val).enemies_spawned_in_current_phase) ~= spawned_phase then
		slot11 = spawned_phase

		self._spawned_phase_val.set_text(slot9, self._spawned_phase_val)

		slot10 = self._spawned_phase_val

		self._spawned_phase_val.stop(slot9)

		slot15 = "_animate_change"
		slot11 = callback(slot12, self, self)
		slot16 = 0.23137254901960785

		self._spawned_phase_val.animate(slot9, self._spawned_phase_val, Color(self, 0.3058823529411765, 0.6745098039215687))
	end

	slot12 = managers.groupai
	slot12 = managers.groupai.state(self._killed_phase_val)
	local killed_phase = tostring(managers.groupai.state(self._killed_phase_val).enemies_killed_in_current_phase(slot11))

	if self._killed_phase_val.text(managers.groupai.state(self._killed_phase_val).enemies_killed_in_current_phase) ~= killed_phase then
		slot12 = killed_phase

		self._killed_phase_val.set_text(slot10, self._killed_phase_val)

		slot11 = self._killed_phase_val

		self._killed_phase_val.stop(slot10)

		slot16 = "_animate_change"
		slot12 = callback(slot13, self, self)
		slot17 = 0.2823529411764706

		self._killed_phase_val.animate(slot10, self._killed_phase_val, Color(self, 0.2980392156862745, 0.796078431372549))
	end

	slot13 = managers.groupai
	slot13 = managers.groupai.state(self._spawned_lifetime_val)
	local spawned_lifetime = tostring(managers.groupai.state(self._spawned_lifetime_val).enemies_spawned_lifetime(slot12))

	if self._spawned_lifetime_val.text(managers.groupai.state(self._spawned_lifetime_val).enemies_spawned_lifetime) ~= spawned_lifetime then
		slot13 = spawned_lifetime

		self._spawned_lifetime_val.set_text(slot11, self._spawned_lifetime_val)

		slot12 = self._spawned_lifetime_val

		self._spawned_lifetime_val.stop(slot11)

		slot17 = "_animate_change"
		slot13 = callback(slot14, self, self)
		slot18 = 0.7411764705882353

		self._spawned_lifetime_val.animate(slot11, self._spawned_lifetime_val, Color(self, 0.7137254901960784, 0.2627450980392157))
	end

	slot14 = managers.groupai
	slot14 = managers.groupai.state(self._killed_lifetime_val)
	local kills_lifetime = tostring(managers.groupai.state(self._killed_lifetime_val).enemies_killed_lifetime(slot13))

	if self._killed_lifetime_val.text(managers.groupai.state(self._killed_lifetime_val).enemies_killed_lifetime) ~= kills_lifetime then
		slot14 = kills_lifetime

		self._killed_lifetime_val.set_text(slot12, self._killed_lifetime_val)

		slot13 = self._killed_lifetime_val

		self._killed_lifetime_val.stop(slot12)

		slot18 = "_animate_change"
		slot14 = callback(slot15, self, self)
		slot19 = 0.8823529411764706

		self._killed_lifetime_val.animate(slot12, self._killed_lifetime_val, Color(self, 0.8509803921568627, 0.3568627450980392))
	end

	slot15 = managers.groupai
	slot15 = managers.groupai.state(self._enemies_alive_val)
	local enemies_alive = tostring(managers.groupai.state(self._enemies_alive_val).enemies_in_level(slot14))

	if self._enemies_alive_val.text(managers.groupai.state(self._enemies_alive_val).enemies_in_level) ~= enemies_alive then
		slot15 = enemies_alive

		self._enemies_alive_val.set_text(slot13, self._enemies_alive_val)

		slot14 = self._enemies_alive_val

		self._enemies_alive_val.stop(slot13)

		slot19 = "_animate_change"
		slot15 = callback(slot16, self, self)
		slot20 = 0.3568627450980392

		self._enemies_alive_val.animate(slot13, self._enemies_alive_val, Color(self, 0.8823529411764706, 0.3568627450980392))
	end

	return 
end
function HUDCombatDebug:set_music_state(state_flag)
	slot4 = self._music_state_val
	slot7 = state_flag

	self._music_state_val.set_text(slot3, tostring(slot6))

	slot4 = self._music_state_val

	self._music_state_val.stop(slot3)

	slot9 = "_animate_change"
	slot5 = callback(slot6, self, self)
	slot10 = 0.3568627450980392

	self._music_state_val.animate(slot3, self._music_state_val, Color(self, 0.8823529411764706, 0.3568627450980392))

	return 
end
function HUDCombatDebug:toggle()
	slot3 = self._combat_debug_panel

	if self._combat_debug_panel.visible(slot2) == true then
		slot4 = false

		self._combat_debug_panel.set_visible(slot2, self._combat_debug_panel)

		self._is_shown = false
	else
		slot4 = true

		self._combat_debug_panel.set_visible(slot2, self._combat_debug_panel)

		self._is_shown = true
	end

	return 
end
function HUDCombatDebug:is_shown()
	return self._is_shown
end
function HUDCombatDebug:clean_up()
	slot4 = "combat_debug_panel"

	managers.hud.remove_updator(slot2, managers.hud)

	slot3 = self._combat_debug_panel
	slot4 = self._combat_debug_panel

	self._combat_debug_panel.parent(slot2).remove(slot2, self._combat_debug_panel.parent(slot2))

	return 
end
function HUDCombatDebug:_animate_change(text, final_color)
	local starting_color = Color.red
	local curr_color = starting_color
	local t = 0
	slot9 = -30

	text.set_x(slot7, text)

	while t < 0.5 do
		local dt = coroutine.yield()
		t = t + dt
		slot9 = text
		slot16 = 0.5

		text.set_x(slot8, self._ease_in_quart(slot11, self, t, -30, 20))

		slot13 = 0.5
		local new_r = self._ease_in_quart(slot8, self, t, starting_color.r, final_color.r)
		slot14 = 0.5
		local new_g = self._ease_in_quart(self, self, t, starting_color.g, final_color.g)
		slot15 = 0.5
		local new_b = self._ease_in_quart(self, self, t, starting_color.b, final_color.b)
		slot12 = text
		slot17 = new_b

		text.set_color(self, Color(final_color.b, new_r, new_g))
	end

	slot9 = -10

	text.set_x(slot7, text)

	slot9 = final_color

	text.set_color(slot7, text)

	return 
end
function HUDCombatDebug:_ease_in_quart(t, starting_value, change, duration)
	t = t / duration

	return change * t * t * t * t + starting_value
end

return 
