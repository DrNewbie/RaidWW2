-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreScriptViewport"

core.module(slot1, core)

slot3 = "CoreApp"

core.import(slot1, core)

slot3 = "CoreMath"

core.import(slot1, core)

slot3 = "CoreCode"

core.import(slot1, core)

slot3 = "CoreAccessObjectBase"

core.import(slot1, core)

slot3 = "CoreEnvironmentFeeder"

core.import(slot1, core)

slot3 = "CoreEnvironmentHandler"

core.import(slot1, core)

if not _ScriptViewport then
	slot2 = CoreAccessObjectBase.AccessObjectBase
	slot0 = class(slot1)
end

_ScriptViewport = slot0
DEFAULT_NETWORK_PORT = 31254
DEFAULT_NETWORK_LSPORT = 31255
slot2 = "scriptviewport_slave"
NETWORK_SLAVE_RECEIVER = Idstring(slot1)
slot2 = "scriptviewport_master"
NETWORK_MASTER_RECEIVER = Idstring(slot1)
function _ScriptViewport:init(x, y, width, height, vpm, name)
	slot11 = name

	_ScriptViewport.super.init(slot8, self, vpm)

	slot13 = height
	self._vp = Application.create_world_viewport(slot8, Application, x, y, width)
	self._vpm = vpm
	self._replaced_vp = false
	self._width_mul_enabled = true
	self._render_params = (Global.render_debug.render_sky and {
		"World",
		self._vp,
		nil,
		"Underlay",
		self._vp
	}) or {
		"World",
		self._vp
	}
	slot13 = vpm
	self._env_handler = CoreEnvironmentHandler.EnvironmentHandler.new(slot8, CoreEnvironmentHandler.EnvironmentHandler, vpm._get_environment_manager(self == vpm.active_vp(vpm)))
	self._ref_fov_stack = {}
	self._init_trace = debug.traceback()

	return 
end
function _ScriptViewport:enable_slave(port)
	slot5 = "Deprecated call"

	Application.stack_dump_error(slot3, Application)

	return 
end
function _ScriptViewport:enable_master(host_name, port, master_listener_port, net_pump)
	slot8 = "Deprecated call"

	Application.stack_dump_error(slot6, Application)

	return 
end
function _ScriptViewport:render_params()
	return self._render_params
end
function _ScriptViewport:set_render_params(...)
	self._render_params = {
		...
	}

	return 
end
function _ScriptViewport:destroy()
	slot4 = false

	self.set_active(slot2, self)

	local vp = not self._replaced_vp and self._vp
	slot4 = vp

	if CoreCode.alive(slot3) then
		slot5 = vp

		Application.destroy_viewport(slot3, Application)
	end

	slot5 = self

	self._vpm._viewport_destroyed(slot3, self._vpm)

	slot4 = self._env_handler

	self._env_handler.destroy(slot3)

	return 
end
function _ScriptViewport:set_width_mul_enabled(b)
	self._width_mul_enabled = b

	return 
end
function _ScriptViewport:width_mul_enabled()
	return self._width_mul_enabled
end
function _ScriptViewport:set_first_viewport(set_first_viewport)
	slot5 = set_first_viewport

	self._env_handler.set_first_viewport(slot3, self._env_handler)

	return 
end
function _ScriptViewport:get_environment_value(data_path_key)
	slot5 = data_path_key

	return self._env_handler.get_value(slot3, self._env_handler)
end
function _ScriptViewport:get_environment_path()
	slot3 = self._env_handler

	return self._env_handler.get_path(slot2)
end
function _ScriptViewport:set_environment(environment_path, blend_duration, blend_bezier_curve, filter_list, unfiltered_environment_path)
	slot13 = unfiltered_environment_path

	self._env_handler.set_environment(slot7, self._env_handler, environment_path, blend_duration, blend_bezier_curve, filter_list)

	return 
end
function _ScriptViewport:set_force_feeder_update()
	slot3 = self._env_handler

	self._env_handler.set_force_feeder_update(slot2)

	return 
end
function _ScriptViewport:on_default_environment_changed(environment_path, blend_duration, blend_bezier_curve)
	slot9 = blend_bezier_curve

	self._env_handler.on_default_environment_changed(slot5, self._env_handler, environment_path, blend_duration)

	return 
end
function _ScriptViewport:create_environment_modifier(data_path_key, is_override, modifier_func)
	slot9 = modifier_func

	return self._env_handler.create_modifier(slot5, self._env_handler, data_path_key, is_override)
end
function _ScriptViewport:destroy_environment_modifier(data_path_key)
	slot5 = data_path_key

	self._env_handler.destroy_modifier(slot3, self._env_handler)

	return 
end
function _ScriptViewport:update_environment_value(data_path_key)
	slot5 = data_path_key

	return self._env_handler.update_value(slot3, self._env_handler)
end
function _ScriptViewport:update_environment_area(area_list, position_offset)
	slot5 = self._vp
	local camera = self._vp.camera(slot4)

	if not camera then
		return 
	end

	local check_pos = Vector3()
	slot8 = check_pos

	camera.m_position(slot6, camera)

	slot9 = area_list

	self._env_handler.update_environment_area(slot6, self._env_handler, check_pos)

	return 
end
function _ScriptViewport:on_environment_area_removed(area)
	slot5 = area

	self._env_handler.on_environment_area_removed(slot3, self._env_handler)

	return 
end
function _ScriptViewport:set_camera(camera)
	slot5 = camera

	self._vp.set_camera(slot3, self._vp)

	slot4 = self

	self._set_width_multiplier(slot3)

	return 
end
function _ScriptViewport:camera()
	slot3 = self._vp

	return self._vp.camera(slot2)
end
function _ScriptViewport:director()
	slot3 = self._vp

	return self._vp.director(slot2)
end
function _ScriptViewport:shaker()
	slot3 = self
	slot3 = self.director(slot2)

	return self.director(slot2).shaker(slot2)
end
function _ScriptViewport:vp()
	return self._vp
end
function _ScriptViewport:alive()
	slot3 = self._vp

	return CoreCode.alive(slot2)
end
function _ScriptViewport:reference_fov()
	local scene = self._render_params[1]
	local fov = -1
	slot7 = Idstring(slot8)
	slot10 = "shadow_rendering"
	local sh_pro = self._vp.get_post_processor_effect(slot4, self._vp, scene, Idstring("shadow_processor"))

	if sh_pro then
		slot6 = sh_pro
		slot9 = "shadow_modifier"
		local sh_mod = sh_pro.modifier(slot5, Idstring(slot8))

		if sh_mod then
			slot9 = sh_mod
			fov = math.deg(sh_mod.reference_fov(slot8))
		end
	end

	return fov
end
function _ScriptViewport:push_ref_fov(fov)
	local scene = self._render_params[1]
	slot3 = math.rad
	slot7 = self._vp

	if self._vp.camera(slot6) then
		slot7 = self._vp
		slot7 = self._vp.camera(slot6)
		slot5 = self._vp.camera(slot6).fov(slot6)
	end

	if fov < slot3(slot4) then
		return false
	end

	slot7 = Idstring(slot8)
	slot10 = "shadow_rendering"
	local sh_pro = self._vp.get_post_processor_effect(slot4, self._vp, scene, Idstring("shadow_processor"))

	if sh_pro then
		slot6 = sh_pro
		slot9 = "shadow_modifier"
		local sh_mod = sh_pro.modifier(slot5, Idstring(slot8))

		if sh_mod then
			slot7 = self._ref_fov_stack
			slot10 = sh_mod

			table.insert(slot6, sh_mod.reference_fov(slot9))

			slot7 = sh_mod
			slot10 = fov

			sh_mod.set_reference_fov(slot6, math.rad(slot9))

			return true
		end
	end

	return false
end
function _ScriptViewport:pop_ref_fov()
	local scene = self._render_params[1]
	slot6 = Idstring(slot7)
	slot9 = "shadow_rendering"
	local sh_pro = self._vp.get_post_processor_effect(slot3, self._vp, scene, Idstring("shadow_processor"))

	if sh_pro then
		slot5 = sh_pro
		slot8 = "shadow_modifier"
		local sh_mod = sh_pro.modifier(slot4, Idstring(slot7))

		if sh_mod and 0 < #self._ref_fov_stack then
			local last = self._ref_fov_stack[#self._ref_fov_stack]
			slot7 = self._vp
		end
	end

	return false
end
function _ScriptViewport:set_visualization_mode(effect_name)
	local scene = self._render_params[1]
	local effects = {
		"dof_prepare_post_processor",
		"bloom_combine_post_processor",
		"lens_flare_post_processor",
		"bloom_prepare_post_processor",
		"volumetric_light_scatter",
		"lens_distortion",
		"post_motion_blur",
		"lens_flare_apply_post_processor",
		"color_grading_post",
		"colorblind_correction_post"
	}
	local is_deferred = effect_name == "deferred_lighting"
	slot7 = effects

	for _, effect in ipairs(slot6) do
		slot13 = scene
		slot16 = effect
		local effect_interface = self._vp.get_post_processor_effect(slot11, self._vp, Idstring(slot15))

		if effect_interface then
			slot14 = is_deferred

			effect_interface.set_visibility(slot12, effect_interface)
		end
	end

	slot9 = Idstring(slot10)
	slot12 = effect_name
	slot8 = true

	self._vp.set_post_processor_effect(slot6, self._vp, scene, Idstring("deferred")).set_visibility(slot6, self._vp.set_post_processor_effect(slot6, self._vp, scene, Idstring("deferred")))

	return 
end
function _ScriptViewport:is_rendering_scene(scene_name)
	slot6 = self

	for _, param in ipairs(self.render_params(slot5)) do
		if param == scene_name then
			return true
		end
	end

	return false
end
function _ScriptViewport:set_dof(clamp, near_focus_distance_min, near_focus_distance_max, far_focus_distance_min, far_focus_distance_max)
	return 
end
function _ScriptViewport:replace_engine_vp(vp)
	slot4 = self

	self.destroy(slot3)

	self._replaced_vp = true
	self._vp = vp

	return 
end
function _ScriptViewport:set_environment_editor_callback(env_editor_callback)
	self._env_editor_callback = env_editor_callback

	return 
end
function _ScriptViewport:_update(is_first_viewport, t, dt)
	local scene = self._render_params[1]
	slot7 = self._vp

	self._vp.update(slot6)

	if self._env_editor_callback then
		slot9 = scene

		self._env_editor_callback(slot6, self._env_handler, self._vp)
	else
		slot10 = dt

		self._env_handler.update(slot6, self._env_handler, is_first_viewport, self._vp)
	end

	slot10 = scene

	self._env_handler.apply(slot6, self._env_handler, is_first_viewport, self._vp)

	return 
end
function _ScriptViewport:_render(nr)
	if Global.render_debug.render_world then
		slot4 = Application
		slot7 = self._render_params

		Application.render(slot3, unpack(slot6))
	end

	return 
end
function _ScriptViewport:_resolution_changed()
	slot3 = self

	self._set_width_multiplier(slot2)

	return 
end
function _ScriptViewport:_set_width_multiplier()
	local camera = self.camera(slot2)
	slot4 = camera

	if CoreCode.alive(self) and self._width_mul_enabled then
		slot4 = Application
		local screen_res = Application.screen_resolution(slot3)
		local screen_pixel_aspect = screen_res.x / screen_res.y
		slot6 = self._vp
		local rect = self._vp.get_rect(slot5)
		local vp_pixel_aspect = screen_pixel_aspect

		if 0 < rect.ph then
			vp_pixel_aspect = rect.pw / rect.ph
		end

		slot13 = self._vpm
		slot9 = CoreMath.width_mul(self._vpm.aspect_ratio(slot12)) * vp_pixel_aspect / screen_pixel_aspect

		camera.set_width_multiplier(slot7, camera)
	end

	return 
end
function _ScriptViewport:set_active(state)
	slot5 = state

	_ScriptViewport.super.set_active(slot3, self)

	slot4 = self._vp

	if alive(slot3) then
		slot5 = state

		self._vp.set_LOD_active(slot3, self._vp)
	end

	return 
end

return 
