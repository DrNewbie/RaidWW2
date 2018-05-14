if not HUDTeammateAI then
	slot2 = HUDTeammateBase
	slot0 = class(slot1)
end

HUDTeammateAI = slot0
HUDTeammateAI.PADDING_DOWN = 18
HUDTeammateAI.DEFAULT_X = 0
HUDTeammateAI.DEFAULT_H = 46
HUDTeammateAI.LEFT_PANEL_W = 56
HUDTeammateAI.RIGHT_PANEL_X = 62
HUDTeammateAI.PLAYER_NAME_FONT = "din_compressed_outlined_22"
HUDTeammateAI.PLAYER_NAME_FONT_SIZE = 22
HUDTeammateAI.INTERACTION_METER_BG = "player_panel_ai_downed_and_objective_countdown_bg"
HUDTeammateAI.INTERACTION_METER_FILL = "teammate_interact_fill_large"
HUDTeammateAI.TIMER_BG = "player_panel_ai_downed_and_objective_countdown_bg"
HUDTeammateAI.TIMER_ICON = "teammate_circle_fill_small"
HUDTeammateAI.TIMER_FONT = "din_compressed_outlined_24"
HUDTeammateAI.TIMER_FONT_SIZE = 24
HUDTeammateAI.MOUNTED_WEAPON_ICON = "player_panel_status_mounted_weapon"
HUDTeammateAI.DEAD_ICON = "player_panel_status_dead_ai"
HUDTeammateAI.STATES = {
	{
		id = "dead",
		control = "dead_icon"
	},
	{
		id = "downed",
		control = "timer_panel"
	},
	{
		id = "interaction",
		control = "interaction_meter_panel"
	},
	{
		id = "mounted_weapon",
		control = "mounted_weapon_icon"
	},
	{
		id = "normal",
		control = "nationality_icon"
	}
}
function HUDTeammateAI:init(i, teammates_panel, params)
	self._id = i
	self._states = HUDTeammateAI.STATES
	self._displayed_state = self._states[#self._states]
	self._active_states = {}
	slot7 = self._displayed_state.id

	self._add_active_state(#self._states, self)

	slot7 = teammates_panel

	self._create_panel(#self._states, self)

	slot6 = self

	self._create_left_panel(#self._states)

	slot6 = self

	self._create_status_panel(#self._states)

	slot6 = self

	self._create_nationality_icon(#self._states)

	slot6 = self

	self._create_mounted_weapon_icon(#self._states)

	slot6 = self

	self._create_dead_icon(#self._states)

	slot6 = self

	self._create_interaction_meter(#self._states)

	slot6 = self

	self._create_timer(#self._states)

	slot6 = self

	self._create_right_panel(#self._states)

	slot6 = self

	self._create_player_name(#self._states)

	return 
end
function HUDTeammateAI:_create_panel(teammates_panel)
	local panel_params = {
		visible = false,
		halign = "left",
		valign = "top",
		x = HUDTeammateAI.DEFAULT_X
	}
	slot5 = teammates_panel
	panel_params.w = teammates_panel.w(slot4)
	panel_params.h = HUDTeammateAI.DEFAULT_H
	panel_params.layer = tweak_data.gui.PLAYER_PANELS_LAYER
	slot6 = panel_params
	self._object = teammates_panel.panel(slot4, teammates_panel)

	return 
end
function HUDTeammateAI:_create_left_panel()
	local left_panel_params = {
		name = "left_panel",
		y = 0,
		x = 0,
		w = HUDTeammateAI.LEFT_PANEL_W
	}
	slot4 = self._object
	left_panel_params.h = self._object.h(slot3)
	slot5 = left_panel_params
	self._left_panel = self._object.panel(slot3, self._object)

	return 
end
function HUDTeammateAI:_create_status_panel()
	local status_panel_params = {
		name = "status_panel",
		y = 0,
		x = 0
	}
	slot4 = self._left_panel
	status_panel_params.w = self._left_panel.w(slot3)
	slot4 = self._left_panel
	status_panel_params.h = self._left_panel.h(slot3)
	slot5 = status_panel_params
	self._status_panel = self._left_panel.panel(slot3, self._left_panel)

	return 
end
function HUDTeammateAI:_create_nationality_icon()
	local nationality = "german"
	local nationality_icon = "player_panel_nationality_" .. tostring(slot4)
	local nationality_icon_params = {
		name = "nationality_icon",
		halign = "center",
		valign = "center",
		texture = tweak_data.gui.icons[nationality_icon].texture,
		texture_rect = tweak_data.gui.icons[nationality_icon].texture_rect
	}
	slot7 = nationality_icon_params
	self._nationality_icon = self._status_panel.bitmap(nationality, self._status_panel)
	slot9 = self._status_panel
	slot7 = self._status_panel.w(slot8) / 2

	self._nationality_icon.set_center_x(nationality, self._nationality_icon)

	slot9 = self._status_panel
	slot7 = self._status_panel.h(slot8) / 2

	self._nationality_icon.set_center_y(nationality, self._nationality_icon)

	return 
end
function HUDTeammateAI:_create_interaction_meter()
	local interaction_meter_panel_params = {
		layer = 4,
		name = "interaction_meter_panel",
		halign = "left",
		alpha = 0,
		valign = "center"
	}
	slot5 = interaction_meter_panel_params
	self._interaction_meter_panel = self._status_panel.panel(slot3, self._status_panel)
	local interaction_meter_background_params = {
		name = "interaction_meter_background",
		halign = "scale",
		layer = 1,
		valign = "scale",
		texture = tweak_data.gui.icons[HUDTeammateAI.INTERACTION_METER_BG].texture,
		texture_rect = tweak_data.gui.icons[HUDTeammateAI.INTERACTION_METER_BG].texture_rect
	}
	slot6 = interaction_meter_background_params
	local interaction_meter_background = self._interaction_meter_panel.bitmap(HUDTeammateAI.INTERACTION_METER_BG, self._interaction_meter_panel)
	slot9 = self._interaction_meter_panel
	slot7 = self._interaction_meter_panel.w(slot8) / 2

	interaction_meter_background.set_center_x(self._interaction_meter_panel, interaction_meter_background)

	slot9 = self._interaction_meter_panel

	interaction_meter_background.set_center_y(self._interaction_meter_panel, interaction_meter_background)

	local interaction_meter_params = {
		name = "interaction_meter",
		layer = 2,
		position_z = 0,
		halign = "scale",
		render_template = "VertexColorTexturedRadial",
		valign = "scale",
		texture = tweak_data.gui.icons[HUDTeammateAI.INTERACTION_METER_FILL].texture
	}
	slot9 = HUDTeammateAI.INTERACTION_METER_FILL
	slot9 = HUDTeammateAI.INTERACTION_METER_FILL
	interaction_meter_params.texture_rect = {
		tweak_data.gui.icon_w(self._interaction_meter_panel.h(slot8) / 2, tweak_data.gui),
		0,
		-tweak_data.gui.icon_w(self._interaction_meter_panel.h(slot8) / 2, tweak_data.gui),
		tweak_data.gui.icon_h(self._interaction_meter_panel.h(slot8) / 2, tweak_data.gui)
	}
	slot7 = interaction_meter_background
	interaction_meter_params.w = interaction_meter_background.w(tweak_data.gui.icon_h) + 8
	slot7 = interaction_meter_background
	interaction_meter_params.h = interaction_meter_background.h(tweak_data.gui.icon_h) + 8
	interaction_meter_params.color = tweak_data.gui.colors.teammate_interaction_bar
	slot8 = interaction_meter_params
	self._interaction_meter = self._interaction_meter_panel.bitmap(tweak_data.gui.icon_h, self._interaction_meter_panel)
	slot10 = self._interaction_meter_panel
	slot8 = self._interaction_meter_panel.w(HUDTeammateAI.INTERACTION_METER_FILL) / 2

	self._interaction_meter.set_center_x(tweak_data.gui.icon_h, self._interaction_meter)

	slot10 = self._interaction_meter_panel
	slot8 = self._interaction_meter_panel.h(HUDTeammateAI.INTERACTION_METER_FILL) / 2

	self._interaction_meter.set_center_y(tweak_data.gui.icon_h, self._interaction_meter)

	return 
end
function HUDTeammateAI:_create_timer()
	local timer_panel_params = {
		halign = "left",
		name = "timer_panel",
		layer = 5,
		y = 0,
		alpha = 0,
		x = 0,
		valign = "center"
	}
	slot5 = timer_panel_params
	self._timer_panel = self._status_panel.panel(slot3, self._status_panel)
	local timer_background_params = {
		name = "timer_background",
		halign = "scale",
		layer = 1,
		valign = "scale",
		texture = tweak_data.gui.icons[HUDTeammateAI.TIMER_BG].texture,
		texture_rect = tweak_data.gui.icons[HUDTeammateAI.TIMER_BG].texture_rect
	}
	slot6 = timer_background_params
	local timer_background = self._timer_panel.bitmap(HUDTeammateAI.TIMER_BG, self._timer_panel)
	slot9 = self._timer_panel
	slot7 = self._timer_panel.w(slot8) / 2

	timer_background.set_center_x(self._timer_panel, timer_background)

	slot9 = self._timer_panel

	timer_background.set_center_y(self._timer_panel, timer_background)

	local timer_bar_params = {
		name = "timer_bar",
		layer = 2,
		halign = "scale",
		render_template = "VertexColorTexturedRadial",
		valign = "scale",
		texture = tweak_data.gui.icons[HUDTeammateAI.TIMER_ICON].texture
	}
	slot9 = HUDTeammateAI.TIMER_ICON
	slot9 = HUDTeammateAI.TIMER_ICON
	timer_bar_params.texture_rect = {
		tweak_data.gui.icon_w(self._timer_panel.h(slot8) / 2, tweak_data.gui),
		0,
		-tweak_data.gui.icon_w(self._timer_panel.h(slot8) / 2, tweak_data.gui),
		tweak_data.gui.icon_h(self._timer_panel.h(slot8) / 2, tweak_data.gui)
	}
	slot8 = HUDTeammateAI.TIMER_ICON
	timer_bar_params.w = tweak_data.gui.icon_w(tweak_data.gui.icon_h, tweak_data.gui)
	slot8 = HUDTeammateAI.TIMER_ICON
	timer_bar_params.h = tweak_data.gui.icon_h(tweak_data.gui.icon_h, tweak_data.gui)
	slot8 = timer_bar_params
	self._timer_bar = self._timer_panel.bitmap(tweak_data.gui.icon_h, self._timer_panel)
	slot10 = self._timer_panel
	slot8 = self._timer_panel.w(HUDTeammateAI.TIMER_ICON) / 2

	self._timer_bar.set_center_x(tweak_data.gui.icon_h, self._timer_bar)

	slot10 = self._timer_panel
	slot8 = self._timer_panel.h(HUDTeammateAI.TIMER_ICON) / 2

	self._timer_bar.set_center_y(tweak_data.gui.icon_h, self._timer_bar)

	local timer_text_params = {
		name = "timer_text",
		vertical = "center",
		align = "center",
		text = "23",
		y = 0,
		x = 0,
		layer = 3
	}
	slot8 = self._timer_panel
	timer_text_params.w = self._timer_panel.w(self._timer_bar)
	slot8 = self._timer_panel
	timer_text_params.h = self._timer_panel.h(self._timer_bar)
	timer_text_params.font = tweak_data.gui.fonts[HUDTeammateAI.TIMER_FONT]
	timer_text_params.font_size = HUDTeammateAI.TIMER_FONT_SIZE
	slot9 = timer_text_params
	self._timer_text = self._timer_panel.text(HUDTeammateAI.TIMER_FONT, self._timer_panel)
	slot8 = self._timer_text
	local _, _, _, h = self._timer_text.text_rect(HUDTeammateAI.TIMER_FONT)
	slot13 = h

	self._timer_text.set_h(slot11, self._timer_text)

	slot15 = self._timer_panel
	slot13 = self._timer_panel.h(slot14) / 2 - 2

	self._timer_text.set_center_y(slot11, self._timer_text)

	return 
end
function HUDTeammateAI:_create_dead_icon()
	local dead_icon_params = {
		name = "dead_icon",
		halign = "center",
		alpha = 0,
		valign = "center",
		texture = tweak_data.gui.icons[HUDTeammateAI.DEAD_ICON].texture,
		texture_rect = tweak_data.gui.icons[HUDTeammateAI.DEAD_ICON].texture_rect
	}
	slot5 = dead_icon_params
	self._dead_icon = self._status_panel.bitmap(HUDTeammateAI.DEAD_ICON, self._status_panel)
	slot7 = self._status_panel
	slot5 = self._status_panel.w(slot6) / 2

	self._dead_icon.set_center_x(HUDTeammateAI.DEAD_ICON, self._dead_icon)

	slot7 = self._status_panel
	slot5 = self._status_panel.h(slot6) / 2

	self._dead_icon.set_center_y(HUDTeammateAI.DEAD_ICON, self._dead_icon)

	return 
end
function HUDTeammateAI:_create_mounted_weapon_icon()
	local mounted_weapon_icon_params = {
		name = "mounted_weapon_icon",
		halign = "center",
		alpha = 0,
		valign = "center",
		texture = tweak_data.gui.icons[HUDTeammateAI.MOUNTED_WEAPON_ICON].texture,
		texture_rect = tweak_data.gui.icons[HUDTeammateAI.MOUNTED_WEAPON_ICON].texture_rect
	}
	slot5 = mounted_weapon_icon_params
	self._mounted_weapon_icon = self._status_panel.bitmap(HUDTeammateAI.MOUNTED_WEAPON_ICON, self._status_panel)
	slot7 = self._status_panel
	slot5 = self._status_panel.w(slot6) / 2

	self._mounted_weapon_icon.set_center_x(HUDTeammateAI.MOUNTED_WEAPON_ICON, self._mounted_weapon_icon)

	slot7 = self._status_panel
	slot5 = self._status_panel.h(slot6) / 2

	self._mounted_weapon_icon.set_center_y(HUDTeammateAI.MOUNTED_WEAPON_ICON, self._mounted_weapon_icon)

	return 
end
function HUDTeammateAI:_create_right_panel()
	local right_panel_params = {
		name = "right_panel",
		y = 0,
		x = HUDTeammateAI.RIGHT_PANEL_X
	}
	slot4 = self._object
	right_panel_params.w = self._object.w(slot3) - HUDTeammateAI.RIGHT_PANEL_X
	slot4 = self._object
	right_panel_params.h = self._object.h(HUDTeammateAI.RIGHT_PANEL_X)
	slot5 = right_panel_params
	self._right_panel = self._object.panel(HUDTeammateAI.RIGHT_PANEL_X, self._object)

	return 
end
function HUDTeammateAI:_create_player_name()
	local player_name_params = {
		name = "player_name",
		vertical = "center",
		align = "left",
		text = "TEST",
		y = 0,
		x = 0
	}
	slot4 = self._right_panel
	player_name_params.w = self._right_panel.w(slot3)
	slot4 = self._right_panel
	player_name_params.h = self._right_panel.h(slot3)
	player_name_params.font = tweak_data.gui.fonts[HUDTeammateAI.PLAYER_NAME_FONT]
	player_name_params.font_size = HUDTeammateAI.PLAYER_NAME_FONT_SIZE
	slot5 = player_name_params
	self._player_name = self._right_panel.text(HUDTeammateAI.PLAYER_NAME_FONT, self._right_panel)
	slot4 = self._player_name
	local _, _, _, h = self._player_name.text_rect(HUDTeammateAI.PLAYER_NAME_FONT)
	slot9 = h

	self._player_name.set_h(slot7, self._player_name)

	slot11 = self._right_panel
	slot9 = self._right_panel.h(slot10) / 2 - 2

	self._player_name.set_center_y(slot7, self._player_name)

	slot8 = self._player_name
	slot13 = self._player_name
	slot11 = self._player_name.y(slot12) - 0.5

	self._player_name.set_y(slot7, math.ceil(slot10))

	return 
end
function HUDTeammateAI:padding_down()
	return HUDTeammateAI.PADDING_DOWN
end
function HUDTeammateAI:is_ai()
	return true
end
function HUDTeammateAI:set_name(name)
	slot4 = self._player_name

	self._player_name.set_text(slot3, utf8.to_upper(slot6))

	slot4 = self._player_name
	local _, _, _, h = self._player_name.text_rect(slot3)
	slot9 = h

	self._player_name.set_h(name, self._player_name)

	slot11 = self._right_panel
	slot9 = self._right_panel.h(slot10) / 2 - 2

	self._player_name.set_center_y(name, self._player_name)

	slot11 = self._right_panel
	slot9 = self._right_panel.h(slot10) / 2 - 2

	self._player_name.set_center_y(name, self._player_name)

	slot8 = self._player_name
	slot13 = self._player_name
	slot11 = self._player_name.y(slot12) - 0.5

	self._player_name.set_y(name, math.ceil(slot10))

	return 
end
function HUDTeammateAI:set_nationality(nationality)
	slot5 = nationality
	local nationality_icon = "player_panel_nationality_" .. tostring(slot4)
	slot6 = tweak_data.gui.icons[nationality_icon].texture

	self._nationality_icon.set_image(slot4, self._nationality_icon)

	slot5 = self._nationality_icon
	slot8 = tweak_data.gui.icons[nationality_icon].texture_rect

	self._nationality_icon.set_texture_rect(slot4, unpack(slot7))

	slot8 = self._left_panel
	slot6 = self._left_panel.w(slot7) / 2

	self._nationality_icon.set_center_x(slot4, self._nationality_icon)

	slot8 = self._left_panel
	slot6 = self._left_panel.h(slot7) / 2

	self._nationality_icon.set_center_y(slot4, self._nationality_icon)

	return 
end
function HUDTeammateAI:show_turret_icon()
	slot4 = "mounted_weapon"

	self._add_active_state(slot2, self)

	return 
end
function HUDTeammateAI:hide_turret_icon()
	slot4 = "mounted_weapon"

	self._remove_active_state(slot2, self)

	return 
end
function HUDTeammateAI:start_timer(time, current)
	slot7 = current

	HUDTeammateAI.super.start_timer(slot4, self, time)

	return 
end
function HUDTeammateAI:stop_timer()
	slot3 = self

	HUDTeammateAI.super.stop_timer(slot2)

	return 
end
function HUDTeammateAI:set_condition(icon_data, text)
	if icon_data == self._state then
		return 
	end

	if icon_data == "mugshot_in_custody" then
		slot6 = self._dead_icon

		self._set_status_icon(slot4, self)
	elseif icon_data == "mugshot_turret" then
		slot6 = self._mounted_weapon_icon

		self._set_status_icon(slot4, self)
	else
		slot6 = self._nationality_icon

		self._set_status_icon(slot4, self)
	end

	self._state = icon_data

	return 
end
function HUDTeammateAI:reset_state()
	slot4 = self._displayed_state.control
	slot4 = 0

	self._status_panel.child(slot2, self._status_panel).set_alpha(slot2, self._status_panel.child(slot2, self._status_panel))

	self._displayed_state = self._states[#self._states]
	self._active_states = {}
	slot4 = self._displayed_state.id

	self._add_active_state(#self._states, self)

	slot4 = self._displayed_state.control
	slot4 = 1

	self._status_panel.child(#self._states, self._status_panel).set_alpha(#self._states, self._status_panel.child(#self._states, self._status_panel))

	return 
end
function HUDTeammateAI:start_interact(timer)
	slot5 = "interaction"

	self._add_active_state(slot3, self)

	slot4 = self._interaction_meter

	self._interaction_meter.stop(slot3)

	slot9 = "_animate_interact"
	slot6 = timer

	self._interaction_meter.animate(slot3, self._interaction_meter, callback(slot6, self, self))

	return 
end
function HUDTeammateAI:cancel_interact()
	slot4 = "interaction"

	self._remove_active_state(slot2, self)

	slot3 = self._interaction_meter

	self._interaction_meter.stop(slot2)

	slot3 = self._interaction_meter
	slot8 = "_animate_cancel_interact"

	self._interaction_meter.animate(slot2, callback(slot5, self, self))

	return 
end
function HUDTeammateAI:complete_interact()
	slot4 = "interaction"

	self._remove_active_state(slot2, self)

	slot3 = self._interaction_meter

	self._interaction_meter.stop(slot2)

	slot3 = self._interaction_meter
	slot8 = "_animate_complete_interact"

	self._interaction_meter.animate(slot2, callback(slot5, self, self))

	return 
end
function HUDTeammateAI:_animate_interact(interact_image, duration)
	local t = 0
	slot7 = 0

	self._interaction_meter.set_position_z(slot5, self._interaction_meter)

	slot7 = 0

	self._interaction_meter.set_rotation(slot5, self._interaction_meter)

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot10 = duration
		local current_progress = Easing.linear(slot6, t, 0, 1)
		slot9 = current_progress

		self._interaction_meter.set_position_z(t, self._interaction_meter)

		self._current_progress = current_progress
	end

	slot7 = 1

	self._interaction_meter.set_position_z(slot5, self._interaction_meter)

	return 
end
function HUDTeammateAI:_animate_cancel_interact()
	local duration = 0.2
	local t = nil

	if not self._current_progress then
		t = duration
	else
		t = (1 - self._current_progress) * duration
	end

	self._current_progress = 0

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot9 = duration
		local current_progress = Easing.linear(slot5, t, 1, -1)
		slot8 = current_progress

		self._interaction_meter.set_position_z(t, self._interaction_meter)
	end

	slot6 = 0

	self._interaction_meter.set_position_z(slot4, self._interaction_meter)

	return 
end
function HUDTeammateAI:_animate_complete_interact()
	local size_decrease_duration = 0.18
	local duration = 0.2
	local t = 0
	self._current_progress = 0
	slot7 = 1

	self._interaction_meter.set_position_z(slot5, self._interaction_meter)

	slot7 = 0

	self._interaction_meter.set_rotation(slot5, self._interaction_meter)

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot10 = duration
		local current_progress = Easing.linear(slot6, t, 1, -1)
		slot9 = current_progress

		self._interaction_meter.set_position_z(t, self._interaction_meter)

		slot11 = duration
		local current_rotation = Easing.linear(t, t, 360, -360)
		slot10 = current_rotation

		self._interaction_meter.set_rotation(t, self._interaction_meter)
	end

	slot7 = 0

	self._interaction_meter.set_position_z(slot5, self._interaction_meter)

	slot7 = 0

	self._interaction_meter.set_rotation(slot5, self._interaction_meter)

	return 
end

return 
