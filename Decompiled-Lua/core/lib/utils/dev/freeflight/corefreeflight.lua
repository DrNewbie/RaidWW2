-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreFreeFlight"

core.module(slot1, core)

slot3 = "CoreEvent"

core.import(slot1, core)

slot3 = "CoreApp"

core.import(slot1, core)

slot3 = "CoreFreeFlightAction"

core.import(slot1, core)

slot3 = "CoreFreeFlightModifier"

core.import(slot1, core)

slot4 = "PRIO_FREEFLIGHT"

core.from_module_import(slot1, core, "CoreManagerBase")

local FF_ON = 0
local FF_OFF = 1
local FF_ON_NOCON = 2
local MOVEMENT_SPEED_BASE = 1000
local TURN_SPEED_BASE = 1
local FAR_RANGE_MAX = 250000
local PITCH_LIMIT_MIN = -80
local PITCH_LIMIT_MAX = 80
local TEXT_FADE_TIME = 0.3
local TEXT_ON_SCREEN_TIME = 2
local FREEFLIGHT_HEADER_TEXT = "FREEFLIGHT, PRESS 'F' OR 'C'"
slot15 = 0.5
local DESELECTED = Color(slot12, 0.5, 0.5)
slot16 = 1
local SELECTED = Color(0.5, 1, 1)
FreeFlight = FreeFlight or class()
function FreeFlight:init(gsm, viewport_manager, controller_manager)
	slot6 = gsm

	assert(slot5)

	slot6 = viewport_manager

	assert(slot5)

	slot6 = controller_manager

	assert(slot5)

	self._state = FF_OFF
	self._gsm = gsm
	self._vpm = viewport_manager
	slot6 = Input
	self._keyboard = Input.keyboard(slot5)
	slot6 = Input
	self._mouse = Input.mouse(slot5)
	self._rot = Rotation()
	slot8 = 1000
	self._pos = Vector3(slot5, 0, 0)
	slot6 = self

	self._setup_F9_key(slot5)

	slot6 = self

	self._setup_modifiers(slot5)

	slot6 = self

	self._setup_actions(slot5)

	slot7 = viewport_manager

	self._setup_viewport(slot5, self)

	slot7 = controller_manager

	self._setup_controller(slot5, self)

	slot6 = self

	self._setup_gui(slot5)

	return 
end
function FreeFlight:_setup_F9_key()
	return 
end
function FreeFlight:_setup_modifiers()
	local FFM = CoreFreeFlightModifier.FreeFlightModifier
	slot7 = 9
	local ms = FFM.new(slot3, FFM, "MOVE SPEED", {
		0.02,
		0.05,
		0.1,
		0.2,
		0.3,
		0.4,
		0.5,
		1,
		2,
		3,
		4,
		5,
		8,
		11,
		14,
		18,
		25,
		30,
		40,
		50,
		60,
		70,
		80,
		100,
		120,
		140,
		160,
		180,
		200
	})
	slot8 = 5
	local ts = FFM.new(FFM, FFM, "TURN SPEED", {
		1,
		2,
		3,
		4,
		5,
		6,
		7,
		8,
		9,
		10
	})
	slot9 = 10
	slot14 = "_set_game_timer"
	local gt = FFM.new(FFM, FFM, "GAME TIMER", {
		0.1,
		0.2,
		0.3,
		0.4,
		0.5,
		0.6,
		0.7,
		0.8,
		0.9,
		1,
		1.1,
		1.2,
		1.3,
		1.4,
		1.5,
		1.6,
		1.7,
		1.8,
		1.9,
		2,
		2.5,
		3,
		3.5,
		4,
		4.5,
		5
	}, callback(slot11, self, self))
	slot10 = 13
	slot15 = "_set_fov"
	local fov = FFM.new(FFM, FFM, "FOV", {
		2,
		5,
		7,
		10,
		20,
		30,
		40,
		50,
		55,
		60,
		65,
		70,
		75
	}, callback(self, self, self))
	self._modifiers = {
		ms,
		ts,
		gt,
		fov
	}
	self._modifier_index = 1
	self._fov = fov
	self._move_speed = ms
	self._turn_speed = ts

	return 
end
function FreeFlight:_setup_actions()
	local FFA = CoreFreeFlightAction.FreeFlightAction
	local FFAT = CoreFreeFlightAction.FreeFlightActionToggle
	slot6 = "DROP PLAYER"
	slot11 = "_drop_player"
	local dp = FFA.new(slot4, FFA, callback(slot8, self, self))
	slot7 = "ATTACH TO UNIT"
	slot12 = "_attach_unit"
	local au = FFA.new(FFA, FFA, callback(self, self, self))
	slot8 = "POSITION DEBUG"
	slot13 = "_position_debug"
	local pd = FFA.new(FFA, FFA, callback(self, self, self))
	slot9 = "YIELD CONTROL (F9 EXIT)"
	slot14 = "_yield_control"
	local yc = FFA.new(FFA, FFA, callback(self, self, self))
	slot10 = "EXIT FREEFLIGHT"
	slot15 = "_exit_freeflight"
	local ef = FFA.new(FFA, FFA, callback(self, self, self))
	slot17 = "_pause"
	slot13 = callback(self, self, self)
	slot18 = "_unpause"
	local ps = FFAT.new(FFA, FFAT, "PAUSE", "UNPAUSE", callback(self, self, self))
	slot18 = "_frustum_freeze"
	slot14 = callback(self, self, self)
	slot19 = "_frustum_unfreeze"
	local ff = FFAT.new(FFAT, FFAT, "FRUSTUM FREEZE", "FRUSTUM UNFREEZE", callback(self, self, self))
	self._actions = {
		ps,
		dp,
		au,
		pd,
		yc,
		ff,
		ef
	}
	self._action_index = 1

	return 
end
function FreeFlight:_setup_viewport(viewport_manager)
	slot4 = World
	self._camera_object = World.create_camera(slot3)
	slot5 = FAR_RANGE_MAX

	self._camera_object.set_far_range(slot3, self._camera_object)

	slot4 = self._camera_object
	slot7 = self._fov

	self._camera_object.set_fov(slot3, self._fov.value(slot6))

	slot10 = PRIO_FREEFLIGHT
	self._vp = viewport_manager.new_vp(slot3, viewport_manager, 0, 0, 1, 1, "freeflight")
	slot5 = self._camera_object

	self._vp.set_camera(slot3, self._vp)

	slot4 = self._camera_object
	self._camera_pos = self._camera_object.position(slot3)
	slot4 = self._camera_object
	self._camera_rot = self._camera_object.rotation(slot3)

	return 
end
function FreeFlight:_setup_controller(controller_manager)
	slot8 = PRIO_FREEFLIGHT
	self._con = controller_manager.create_controller(slot3, controller_manager, "freeflight", nil, true)
	slot5 = "freeflight_action_toggle"
	slot10 = "_action_toggle"

	self._con.add_trigger(slot3, self._con, callback(true, self, self))

	slot5 = "freeflight_action_execute"
	slot10 = "_action_execute"

	self._con.add_trigger(slot3, self._con, callback(true, self, self))

	slot5 = "freeflight_quick_action_execute"
	slot10 = "_quick_action_execute"

	self._con.add_trigger(slot3, self._con, callback(true, self, self))

	slot5 = "freeflight_modifier_toggle"
	slot10 = "_next_modifier_toggle"

	self._con.add_trigger(slot3, self._con, callback(true, self, self))

	slot5 = "freeflight_modifier_up"
	slot10 = "_curr_modifier_up"

	self._con.add_trigger(slot3, self._con, callback(true, self, self))

	slot5 = "freeflight_modifier_down"
	slot10 = "_curr_modifier_down"

	self._con.add_trigger(slot3, self._con, callback(true, self, self))

	return 
end
function FreeFlight:_setup_gui()
	slot3 = Overlay
	local gui_scene = Overlay.gui(slot2)
	local res = RenderSettings.resolution
	slot5 = gui_scene
	self._workspace = gui_scene.create_screen_workspace(slot4)
	slot5 = self._workspace
	slot8 = TimerManager

	self._workspace.set_timer(slot4, TimerManager.main(slot7))

	slot5 = self._workspace
	self._panel = self._workspace.panel(slot4)
	local SCREEN_RIGHT_OFFSET = 420
	local TEXT_HEIGHT_OFFSET = 27
	local config = {
		font = "core/fonts/system_font",
		font_scale = 0.9,
		color = DESELECTED,
		x = 45,
		y = 25,
		layer = 1000000
	}

	local function anim_fade_out_func(o)
		function slot4(t)
			slot3 = o
			slot6 = o
			slot7 = 1 - t

			o.set_color(slot2, o.color(slot5).with_alpha(slot5, o.color(slot5)))

			return 
		end

		CoreEvent.over(slot2, TEXT_FADE_TIME)

		return 
	end

	local function anim_fade_in_func(o)
		function slot4(t)
			slot3 = o
			slot6 = o
			slot7 = t

			o.set_color(slot2, o.color(slot5).with_alpha(slot5, o.color(slot5)))

			return 
		end

		CoreEvent.over(slot2, TEXT_FADE_TIME)

		return 
	end

	local text_script = {
		fade_out = anim_fade_out_func,
		fade_in = anim_fade_in_func
	}
	self._action_gui = {}
	self._action_vis_time = nil
	slot11 = self._actions

	for i, a in ipairs(slot10) do
		slot17 = config
		local text = self._panel.text(slot15, self._panel)
		slot18 = text_script

		text.set_script(self._panel, text)

		slot17 = text
		slot20 = a

		text.set_text(self._panel, a.name(slot19))

		slot20 = text
		slot18 = text.y(slot19) + i * TEXT_HEIGHT_OFFSET

		text.set_y(self._panel, text)

		if i == self._action_index then
			slot18 = SELECTED

			text.set_color(slot16, text)
		end

		slot17 = text
		slot20 = text
		slot21 = 0

		text.set_color(slot16, text.color(slot19).with_alpha(slot19, text.color(slot19)))

		slot18 = text

		table.insert(slot16, self._action_gui)
	end

	self._modifier_gui = {}
	self._modifier_vis_time = nil
	slot11 = self._modifiers

	for i, m in ipairs(slot10) do
		slot17 = config
		local text = self._panel.text(slot15, self._panel)
		slot18 = text_script

		text.set_script(self._panel, text)

		slot17 = text
		slot20 = m

		text.set_text(self._panel, m.name_value(slot19))

		slot20 = text
		slot18 = text.y(slot19) + i * TEXT_HEIGHT_OFFSET

		text.set_y(self._panel, text)

		slot18 = res.x - SCREEN_RIGHT_OFFSET

		text.set_x(self._panel, text)

		if i == self._modifier_index then
			slot18 = SELECTED

			text.set_color(slot16, text)
		end

		slot17 = text
		slot20 = text
		slot21 = 0

		text.set_color(slot16, text.color(slot19).with_alpha(slot19, text.color(slot19)))

		slot18 = text

		table.insert(slot16, self._modifier_gui)
	end

	slot11 = self._workspace

	self._workspace.hide(slot10)

	return 
end
function FreeFlight:enable()
	slot3 = self._gsm
	slot3 = self._gsm.current_state(slot2)

	if self._gsm.current_state(slot2).allow_freeflight(slot2) then
		slot3 = self._vpm
		local active_vp = self._vpm.first_active_viewport(slot2)

		if active_vp then
			slot4 = active_vp
			self._start_cam = active_vp.camera(slot3)

			if self._start_cam then
				slot2 = self._start_cam.position(slot3)
				slot5 = self._attached_to_unit
			end
		end

		self._state = FF_ON
		slot5 = true

		self._vp.set_active(slot3, self._vp)

		slot4 = self._con

		self._con.enable(slot3)

		slot4 = self._workspace

		self._workspace.show(slot3)

		slot4 = self

		self._draw_actions(slot3)

		slot4 = self

		self._draw_modifiers(slot3)

		if managers.enemy then
			slot5 = false

			managers.enemy.set_gfx_lod_enabled(slot3, managers.enemy)
		end
	end

	return 
end
function FreeFlight:disable()
	slot3 = self._actions

	for _, a in ipairs(slot2) do
		slot8 = a

		a.reset(slot7)
	end

	self._state = FF_OFF
	slot3 = self._con

	self._con.disable(slot2)

	slot3 = self._workspace

	self._workspace.hide(slot2)

	slot4 = false

	self._vp.set_active(slot2, self._vp)

	if managers.enemy then
		slot4 = true

		managers.enemy.set_gfx_lod_enabled(slot2, managers.enemy)
	end

	return 
end
function FreeFlight:enabled()
	return self._state ~= FF_OFF
end
function FreeFlight:_on_F9()
	slot3 = Application

	if Application.editor(slot2) and not Global.running_simulation then
		return 
	end

	if self._state == FF_ON then
		slot3 = self

		self.disable(slot2)
	elseif self._state == FF_OFF then
		slot3 = self

		self.enable(slot2)
	elseif self._state == FF_ON_NOCON then
		self._state = FF_ON
		slot3 = self._con

		self._con.enable(slot2)
	end

	return 
end
function FreeFlight:_action_toggle()
	slot3 = self

	if self._actions_are_visible(slot2) then
		slot4 = DESELECTED

		self._action_gui[self._action_index].set_color(self._action_index, self._action_gui[self._action_index])

		self._action_index = self._action_index % #self._actions + 1
		slot4 = SELECTED

		self._action_gui[self._action_index].set_color(self._action_index, self._action_gui[self._action_index])
	end

	slot3 = self

	self._draw_actions(slot2)

	return 
end
function FreeFlight:_action_execute()
	slot3 = self

	if self._actions_are_visible(slot2) then
		slot3 = self
		slot3 = self._current_action(slot2)

		self._current_action(slot2).do_action(slot2)
	end

	slot3 = self

	self._draw_actions(slot2)

	return 
end
function FreeFlight:_quick_action_execute()
	slot3 = self
	slot3 = self._current_action(slot2)

	self._current_action(slot2).do_action(slot2)

	return 
end
function FreeFlight:_exit_freeflight()
	slot3 = self

	self.disable(slot2)

	return 
end
function FreeFlight:_yield_control()
	slot3 = self._state == FF_ON

	assert(slot2)

	self._state = FF_ON_NOCON
	slot3 = self._con

	self._con.disable(slot2)

	return 
end
function FreeFlight:_drop_player()
	slot5 = self._camera_rot
	slot3 = self._camera_rot.yaw(slot4)
	slot5 = 0
	local rot_new = Rotation(slot2, slot3, 0)
	slot4 = self._gsm
	slot6 = rot_new

	self._gsm.current_state(slot3).freeflight_drop_player(slot3, self._gsm.current_state(slot3), self._camera_pos)

	return 
end
function FreeFlight:_position_debug()
	local p = self._camera_pos
	slot5 = "CAMERA POSITION: Vector3(" .. p.x .. "," .. p.y .. "," .. p.z .. ")"

	cat_print(slot3, "debug")

	return 
end
function FreeFlight:_pause()
	slot4 = true

	Application.set_pause(slot2, Application)

	return 
end
function FreeFlight:_unpause()
	slot4 = false

	Application.set_pause(slot2, Application)

	return 
end
function FreeFlight:_frustum_freeze()
	local old_cam = self._camera_object
	local new_cam = World.create_camera(slot3)
	slot5 = new_cam
	slot8 = old_cam

	new_cam.set_fov(World, old_cam.fov(slot7))

	slot5 = new_cam
	slot8 = old_cam

	new_cam.set_position(World, old_cam.position(slot7))

	slot5 = new_cam
	slot8 = old_cam

	new_cam.set_rotation(World, old_cam.rotation(slot7))

	slot5 = new_cam
	slot8 = old_cam

	new_cam.set_far_range(World, old_cam.far_range(slot7))

	slot5 = new_cam
	slot8 = old_cam

	new_cam.set_near_range(World, old_cam.near_range(slot7))

	slot5 = new_cam
	slot8 = old_cam

	new_cam.set_aspect_ratio(World, old_cam.aspect_ratio(slot7))

	slot5 = new_cam
	slot8 = old_cam

	new_cam.set_width_multiplier(World, old_cam.width_multiplier(slot7))

	if self._start_cam then
		slot5 = old_cam
		slot8 = self._start_cam

		old_cam.set_far_range(slot4, self._start_cam.far_range(slot7))
	end

	slot7 = new_cam

	Application.set_frustum_freeze_camera(slot4, Application, old_cam)

	self._frozen_camera = old_cam
	self._camera_object = new_cam

	return 
end
function FreeFlight:_frustum_unfreeze()
	local old_cam = self._frozen_camera
	slot5 = FAR_RANGE_MAX

	old_cam.set_far_range(slot3, old_cam)

	slot6 = old_cam

	Application.set_frustum_freeze_camera(slot3, Application, old_cam)

	self._camera_object = old_cam
	self._frozen_camera = nil

	return 
end
function FreeFlight:_next_modifier_toggle()
	slot3 = self

	if self._modifiers_are_visible(slot2) then
		slot4 = DESELECTED

		self._modifier_gui[self._modifier_index].set_color(self._modifier_index, self._modifier_gui[self._modifier_index])

		self._modifier_index = self._modifier_index % #self._modifiers + 1
		slot4 = SELECTED

		self._modifier_gui[self._modifier_index].set_color(self._modifier_index, self._modifier_gui[self._modifier_index])
	end

	slot3 = self

	self._draw_modifiers(slot2)

	return 
end
function FreeFlight:_curr_modifier_up()
	slot3 = self

	if self._modifiers_are_visible(slot2) then
		slot3 = self
		slot3 = self._current_modifier(slot2)

		self._current_modifier(slot2).step_up(slot2)

		slot3 = self._modifier_gui[self._modifier_index]
		slot6 = self
		slot6 = self._current_modifier(slot5)

		self._modifier_gui[self._modifier_index].set_text(self._modifier_index, self._current_modifier(slot5).name_value(slot5))
	end

	slot3 = self

	self._draw_modifiers(slot2)

	return 
end
function FreeFlight:_curr_modifier_down()
	slot3 = self

	if self._modifiers_are_visible(slot2) then
		slot3 = self
		slot3 = self._current_modifier(slot2)

		self._current_modifier(slot2).step_down(slot2)

		slot3 = self._modifier_gui[self._modifier_index]
		slot6 = self
		slot6 = self._current_modifier(slot5)

		self._modifier_gui[self._modifier_index].set_text(self._modifier_index, self._current_modifier(slot5).name_value(slot5))
	end

	slot3 = self

	self._draw_modifiers(slot2)

	return 
end
function FreeFlight:_set_fov(value)
	slot5 = value

	self._camera_object.set_fov(slot3, self._camera_object)

	return 
end
function FreeFlight:_set_game_timer(value)
	slot4 = TimerManager
	slot5 = value

	TimerManager.pausable(slot3).set_multiplier(slot3, TimerManager.pausable(slot3))

	slot4 = TimerManager
	slot5 = value

	TimerManager.game_animation(slot3).set_multiplier(slot3, TimerManager.game_animation(slot3))

	return 
end
function FreeFlight:_current_action()
	return self._actions[self._action_index]
end
function FreeFlight:_current_modifier()
	return self._modifiers[self._modifier_index]
end
function FreeFlight:_actions_are_visible()
	slot3 = TimerManager
	slot3 = TimerManager.main(slot2)
	local t = TimerManager.main(slot2).time(slot2)

	return self._action_vis_time and t + TEXT_FADE_TIME < self._action_vis_time
end
function FreeFlight:_modifiers_are_visible()
	slot3 = TimerManager
	slot3 = TimerManager.main(slot2)
	local t = TimerManager.main(slot2).time(slot2)

	return self._modifier_vis_time and t + TEXT_FADE_TIME < self._modifier_vis_time
end
function FreeFlight:_draw_actions()
	slot3 = self

	if not self._actions_are_visible(slot2) then
		slot3 = self._action_gui

		for i, text in ipairs(slot2) do
			slot8 = text

			text.stop(slot7)

			slot11 = text
			slot9 = text.script(slot10).fade_in

			text.animate(slot7, text)
		end
	end

	slot3 = self._actions

	for i, _ in ipairs(slot2) do
		slot8 = self._action_gui[i]
		slot11 = self._actions[i]

		self._action_gui[i].set_text(slot7, self._actions[i].name(slot10))
	end

	slot3 = TimerManager
	slot3 = TimerManager.main(slot2)
	self._action_vis_time = TimerManager.main(slot2).time(slot2) + TEXT_ON_SCREEN_TIME

	return 
end
function FreeFlight:_draw_modifiers()
	slot3 = self

	if not self._modifiers_are_visible(slot2) then
		slot3 = self._modifier_gui

		for _, text in ipairs(slot2) do
			slot8 = text

			text.stop(slot7)

			slot11 = text
			slot9 = text.script(slot10).fade_in

			text.animate(slot7, text)
		end
	end

	slot3 = TimerManager
	slot3 = TimerManager.main(slot2)
	self._modifier_vis_time = TimerManager.main(slot2).time(slot2) + TEXT_ON_SCREEN_TIME

	return 
end
function FreeFlight:_set_camera(pos, rot)

	-- Decompilation error in this vicinity:
	slot5 = self._camera_object
	slot3 = self._camera_object.set_position
	slot8 = self._attached_to_unit
end
function FreeFlight:update(t, dt)
	slot5 = TimerManager
	local main_t = TimerManager.main(slot4).time(slot4)
	slot6 = TimerManager
	local main_dt = TimerManager.main(TimerManager.main(slot4)).delta_time(TimerManager.main(slot4))
	slot7 = self

	if self.enabled(TimerManager.main(TimerManager.main(slot4))) then
		slot9 = main_dt

		self._update_controller(slot6, self, main_t)

		slot9 = main_dt

		self._update_gui(slot6, self, main_t)

		slot9 = main_dt

		self._update_camera(slot6, self, main_t)

		slot9 = main_dt

		self._update_frustum_debug_box(slot6, self, main_t)
	end

	return 
end
function FreeFlight:_update_controller(t, dt)
	return 
end
function FreeFlight:_update_gui(t, dt)
	if self._action_vis_time and self._action_vis_time < t then
		slot5 = self._action_gui

		for _, text in ipairs(slot4) do
			slot10 = text

			text.stop(slot9)

			slot13 = text
			slot11 = text.script(slot12).fade_out

			text.animate(slot9, text)
		end

		self._action_vis_time = nil
	end

	if self._modifier_vis_time and self._modifier_vis_time < t then
		slot5 = self._modifier_gui

		for _, text in ipairs(slot4) do
			slot10 = text

			text.stop(slot9)

			slot13 = text
			slot11 = text.script(slot12).fade_out

			text.animate(slot9, text)
		end

		self._modifier_vis_time = nil
	end

	return 
end
function FreeFlight:_update_camera(t, dt)
	slot6 = "freeflight_axis_move"
	local axis_move = self._con.get_input_axis(slot4, self._con)
	slot7 = "freeflight_axis_look"
	local axis_look = self._con.get_input_axis(self._con, self._con)
	slot8 = "freeflight_move_up"
	local btn_move_up = self._con.get_input_float(self._con, self._con)
	slot9 = "freeflight_move_down"
	local btn_move_down = self._con.get_input_float(self._con, self._con)
	slot10 = self._camera_rot
	local move_dir = self._camera_rot.x(self._con) * axis_move.x + self._camera_rot.y(self._camera_rot) * axis_move.y
	slot12 = 1
	move_dir = move_dir + btn_move_up * Vector3(axis_move.y, 0, 0) + btn_move_down * Vector3(0, 0, 0)
	slot10 = self._move_speed
	local move_delta = move_dir * self._move_speed.value(btn_move_down * Vector3(0, 0, 0)) * MOVEMENT_SPEED_BASE * dt
	local pos_new = self._camera_pos + move_delta
	slot12 = self._camera_rot
	local yaw_new = self._camera_rot.yaw(0) + axis_look.x * -1 * self._turn_speed.value(-1) * TURN_SPEED_BASE
	slot15 = self._camera_rot
	slot17 = self._turn_speed
	slot15 = PITCH_LIMIT_MAX
	local pitch_new = math.clamp(TURN_SPEED_BASE, self._camera_rot.pitch(self._turn_speed) + axis_look.y * self._turn_speed.value(0) * TURN_SPEED_BASE, PITCH_LIMIT_MIN)
	local rot_new = Rotation(self._camera_rot.pitch(self._turn_speed) + axis_look.y * self._turn_speed.value(0) * TURN_SPEED_BASE, yaw_new, pitch_new)
	slot15 = "-vpslave"

	if not CoreApp.arg_supplied(yaw_new) then
		slot17 = rot_new

		self._set_camera(slot14, self, pos_new)
	end

	return 
end
function FreeFlight:_attach_unit()
	local cam = self._camera_object
	slot10 = cam
	slot10 = cam.rotation(cam)
	local ray = World.raycast(slot3, World, "ray", cam.position(cam.position(cam) + cam.rotation(cam).y(cam) * 10000))

	if ray then
		slot8 = ray.unit
		slot6 = ray.unit.name(slot7).s(slot7)
		slot9 = ray.body

		print(slot4, "ray hit", ray.body.name(ray.unit.name(slot7)))

		slot5 = self._attached_to_unit

		if alive(slot4) and self._attached_to_unit == ray.unit then
			slot5 = "[FreeFlight] Detach"

			print(slot4)

			slot6 = nil

			self.attach_to_unit(slot4, self)
		else
			slot5 = "[FreeFlight] Attach"

			print(slot4)

			slot6 = ray.unit

			self.attach_to_unit(slot4, self)
		end
	end

	return 
end
function FreeFlight:attach_to_unit(unit)

	-- Decompilation error in this vicinity:
	slot4 = unit
	slot4 = unit

	if alive(slot3) and unit ~= self._attached_to_unit then
		self._attached_to_unit_pos = unit.position(slot3)
		local pos = self._camera_pos - self._attached_to_unit_pos
		slot7 = self._camera_rot

		self._set_camera(unit, self, pos)
	end

	self._attached_to_unit = unit

	return 
end
function FreeFlight:_update_frustum_debug_box(t, dt)
	if self._frozen_camera then
		local near = self._frozen_camera.near_range(slot4)
		slot6 = self._frozen_camera
		local far = self._frozen_camera.far_range(self._frozen_camera)
		local R = 1
		local G = 0
		local B = 1
		slot15 = near
		local n1 = self._frozen_camera.screen_to_world(slot9, Vector3(slot12, -1, -1))
		slot16 = near
		local n2 = self._frozen_camera.screen_to_world(self._frozen_camera, Vector3(-1, 1, -1))
		slot17 = near
		local n3 = self._frozen_camera.screen_to_world(self._frozen_camera, Vector3(1, 1, 1))
		slot18 = near
		local n4 = self._frozen_camera.screen_to_world(self._frozen_camera, Vector3(1, -1, 1))
		slot19 = far
		local f1 = self._frozen_camera.screen_to_world(self._frozen_camera, Vector3(-1, -1, -1))
		slot20 = far
		local f2 = self._frozen_camera.screen_to_world(self._frozen_camera, Vector3(-1, 1, -1))
		slot21 = far
		local f3 = self._frozen_camera.screen_to_world(self._frozen_camera, Vector3(1, 1, 1))
		slot22 = far
		local f4 = self._frozen_camera.screen_to_world(self._frozen_camera, Vector3(1, -1, 1))
		slot23 = B

		Application.draw_line(self._frozen_camera, Application, n1, n2, R, G)

		slot23 = B

		Application.draw_line(self._frozen_camera, Application, n2, n3, R, G)

		slot23 = B

		Application.draw_line(self._frozen_camera, Application, n3, n4, R, G)

		slot23 = B

		Application.draw_line(self._frozen_camera, Application, n4, n1, R, G)

		slot23 = B

		Application.draw_line(self._frozen_camera, Application, n1, f1, R, G)

		slot23 = B

		Application.draw_line(self._frozen_camera, Application, n2, f2, R, G)

		slot23 = B

		Application.draw_line(self._frozen_camera, Application, n3, f3, R, G)

		slot23 = B

		Application.draw_line(self._frozen_camera, Application, n4, f4, R, G)

		slot23 = B

		Application.draw_line(self._frozen_camera, Application, f1, f2, R, G)

		slot23 = B

		Application.draw_line(self._frozen_camera, Application, f2, f3, R, G)

		slot23 = B

		Application.draw_line(self._frozen_camera, Application, f3, f4, R, G)

		slot23 = B

		Application.draw_line(self._frozen_camera, Application, f4, f1, R, G)
	end

	return 
end
function FreeFlight:destroy()
	slot3 = self._con_toggle

	if alive(slot2) then
		slot4 = self._con_toggle

		Input.destroy_virtual_controller(slot2, Input)

		self._con_toggle = nil
	end

	slot3 = self._con

	if alive(slot2) then
		slot3 = self._con

		self._con.destroy(slot2)

		self._con = nil
	end

	slot3 = self._vp

	self._vp.destroy(slot2)

	self._vp = nil

	return 
end

return 
