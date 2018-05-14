slot3 = "CoreViewportManager"

core.module(slot1, core)

slot3 = "CoreApp"

core.import(slot1, core)

slot3 = "CoreCode"

core.import(slot1, core)

slot3 = "CoreEvent"

core.import(slot1, core)

slot3 = "CoreManagerBase"

core.import(slot1, core)

slot3 = "CoreScriptViewport"

core.import(slot1, core)

slot3 = "CoreEnvironmentManager"

core.import(slot1, core)

if not ViewportManager then
	slot2 = CoreManagerBase.ManagerBase
	slot0 = class(slot1)
end

ViewportManager = slot0
ViewportManager.CAMERA_NEAR_RANGE = 3
ViewportManager.WORLD_CAMERA_NEAR_RANGE = 20
ViewportManager.CAMERA_FAR_RANGE = 100000
function ViewportManager:init(aspect_ratio)
	ViewportManager.super.init(slot3, self)

	slot6 = aspect_ratio
	slot4 = type("viewport") == "number"

	assert(slot3)

	self._aspect_ratio = aspect_ratio
	slot4 = CoreEvent.CallbackEventHandler
	self._resolution_changed_event_handler = CoreEvent.CallbackEventHandler.new(slot3)
	slot4 = CoreEnvironmentManager.EnvironmentManager
	self._env_manager = CoreEnvironmentManager.EnvironmentManager.new(slot3)
	self._allow_fvp_env_update = true
	Global.render_debug.render_sky = true
	self._current_camera_position = Vector3()
	slot4 = Application

	if Application.editor(true) then
		slot5 = "core/environments/default"

		self.preload_environment(slot3, self)
	end

	return 
end
function ViewportManager:skip_update_env_on_first_viewport(skip)
	self._allow_fvp_env_update = not skip

	return 
end
function ViewportManager:update(t, dt)
	slot7 = self

	for i, svp in ipairs(self._all_really_active(slot6)) do
		slot13 = dt

		svp._update(slot9, svp, i == 1 and self._allow_fvp_env_update, t)
	end

	return 
end
function ViewportManager:paused_update(t, dt)
	slot7 = dt

	self.update(slot4, self, t)

	return 
end
function ViewportManager:render()
	slot5 = self

	for i, svp in ipairs(self._all_really_active(slot4)) do
		slot9 = i

		svp._render(slot7, svp)
	end

	return 
end
function ViewportManager:end_frame(t, dt)
	if self._render_settings_change_map then
		local is_resolution_changed = self._render_settings_change_map.resolution ~= nil
		slot6 = self._render_settings_change_map

		for setting_name, setting_value in pairs(slot5) do
			RenderSettings[setting_name] = setting_value
		end

		self._render_settings_change_map = nil
		slot6 = Application

		Application.apply_render_settings(slot5)

		slot6 = Application

		Application.save_render_settings(slot5)

		if is_resolution_changed then
			slot6 = self

			self.resolution_changed(slot5)
		end
	end

	self._current_camera = nil
	self._current_camera_position_updated = nil
	self._current_camera_rotation = nil

	return 
end
function ViewportManager:destroy()
	slot5 = self

	for _, svp in pairs(self._all_ao(slot4)) do
		slot8 = svp

		svp.destroy(slot7)
	end

	slot3 = self._env_manager

	self._env_manager.destroy(slot2)

	return 
end
function ViewportManager:new_vp(x, y, width, height, name, priority)
	local name = name or ""
	local prio = priority or CoreManagerBase.PRIO_DEFAULT
	slot17 = name
	local svp = CoreScriptViewport._ScriptViewport.new(slot10, CoreScriptViewport._ScriptViewport, x, y, width, height, self)
	slot14 = prio

	self._add_accessobj(CoreScriptViewport._ScriptViewport, self, svp)

	return svp
end
function ViewportManager:vp_by_name(name)
	slot5 = name

	return self._ao_by_name(slot3, self)
end
function ViewportManager:active_viewports()
	slot4 = CoreManagerBase.PRIO_DEFAULT

	return self._all_active_requested_by_prio(slot2, self)
end
function ViewportManager:all_really_active_viewports()
	slot3 = self

	return self._all_really_active(slot2)
end
function ViewportManager:num_active_viewports()
	slot3 = self

	return #self.active_viewports(slot2)
end
function ViewportManager:first_active_viewport()
	slot3 = self
	local all_active = self._all_really_active(slot2)

	return (0 < #all_active and all_active[1]) or nil
end
function ViewportManager:viewports()
	slot3 = self

	return self._all_ao(slot2)
end
function ViewportManager:add_resolution_changed_func(func)
	slot5 = func

	self._resolution_changed_event_handler.add(slot3, self._resolution_changed_event_handler)

	return func
end
function ViewportManager:remove_resolution_changed_func(func)
	slot5 = func

	self._resolution_changed_event_handler.remove(slot3, self._resolution_changed_event_handler)

	return 
end
function ViewportManager:resolution_changed()
	slot3 = managers.gui_data

	managers.gui_data.resolution_changed(slot2)

	slot4 = "tweak_data"

	if rawget(slot2, _G).resolution_changed then
		slot4 = "tweak_data"
		slot3 = rawget(slot2, _G)

		rawget(slot2, _G).resolution_changed(slot2)
	end

	slot5 = self

	for i, svp in ipairs(self.viewports(slot4)) do
		slot9 = i

		svp._resolution_changed(slot7, svp)
	end

	slot3 = self._resolution_changed_event_handler

	self._resolution_changed_event_handler.dispatch(slot2)

	return 
end
function ViewportManager:editor_reload_environment(name)
	slot5 = name

	self._env_manager.editor_reload(slot3, self._env_manager)

	return 
end
function ViewportManager:editor_add_environment_created_callback(func)
	slot5 = func

	self._env_manager.editor_add_created_callback(slot3, self._env_manager)

	return 
end
function ViewportManager:preload_environment(name)
	slot5 = name

	self._env_manager.preload_environment(slot3, self._env_manager)

	return 
end
function ViewportManager:get_predefined_environment_filter_map()
	slot3 = self._env_manager

	return self._env_manager.get_predefined_environment_filter_map(slot2)
end
function ViewportManager:get_environment_value(path, data_path_key)
	slot7 = data_path_key

	return self._env_manager.get_value(slot4, self._env_manager, path)
end
function ViewportManager:has_data_path_key(data_path_key)
	slot5 = data_path_key

	return self._env_manager.has_data_path_key(slot3, self._env_manager)
end
function ViewportManager:create_global_environment_modifier(data_path_key, is_override, modifier_func)
	slot8 = self

	for _, vp in ipairs(self.viewports(slot7)) do
		slot14 = modifier_func

		vp.create_environment_modifier(slot10, vp, data_path_key, is_override)
	end

	slot9 = modifier_func

	self._env_manager.set_global_environment_modifier(slot5, self._env_manager, data_path_key, is_override)

	return data_path_key
end
function ViewportManager:destroy_global_environment_modifier(data_path_key)
	slot6 = self

	for _, vp in ipairs(self.viewports(slot5)) do
		slot10 = data_path_key

		vp.destroy_environment_modifier(slot8, vp)
	end

	self._env_manager.set_global_environment_modifier(slot3, self._env_manager, data_path_key, nil)

	return 
end
function ViewportManager:update_global_environment_value(data_path_key)
	slot6 = self

	for _, vp in ipairs(self.viewports(slot5)) do
		slot10 = data_path_key

		vp.update_environment_value(slot8, vp)
	end

	return 
end
function ViewportManager:set_default_environment(default_environment_path, blend_duration, blend_bezier_curve)
	self._env_manager.set_default_environment(slot5, self._env_manager)

	slot8 = self

	for _, viewport in ipairs(self.viewports(default_environment_path)) do
		slot14 = blend_bezier_curve

		viewport.on_default_environment_changed(slot10, viewport, default_environment_path, blend_duration)
	end

	return 
end
function ViewportManager:default_environment()
	slot3 = self._env_manager

	return self._env_manager.default_environment(slot2)
end
function ViewportManager:game_default_environment()
	slot3 = self._env_manager

	return self._env_manager.game_default_environment(slot2)
end
function ViewportManager:editor_reset_environment()
	slot5 = self

	for _, vp in ipairs(self.active_viewports(slot4)) do
		slot11 = self

		vp.set_environment(slot7, vp, self.game_default_environment(slot10), nil, nil, nil)
	end

	return 
end
function ViewportManager:_viewport_destroyed(vp)
	slot5 = vp

	self._del_accessobj(slot3, self)

	self._current_camera = nil

	return 
end
function ViewportManager:_get_environment_manager()
	return self._env_manager
end
function ViewportManager:_prioritize_and_activate()
	local old_first_vp = self.first_active_viewport(slot2)
	slot4 = self

	ViewportManager.super._prioritize_and_activate(self)

	slot4 = self
	local first_vp = self.first_active_viewport(self)

	if old_first_vp ~= first_vp then
		if old_first_vp then
			slot6 = false

			old_first_vp.set_first_viewport(slot4, old_first_vp)
		end

		if first_vp then
			slot6 = true

			first_vp.set_first_viewport(slot4, first_vp)
		end
	end

	return 
end
function ViewportManager:first_active_world_viewport()
	slot5 = self

	for _, vp in ipairs(self.active_viewports(slot4)) do
		slot9 = "World"

		if vp.is_rendering_scene(slot7, vp) then
			return vp
		end
	end

	return 
end
function ViewportManager:get_current_camera()
	if self._current_camera then
		return self._current_camera
	end

	slot3 = self
	local vps = self._all_really_active(slot2)

	if 0 < #vps then
		slot4 = vps[1]
		slot2 = vps[1].camera(slot3)
	else
		slot2 = false

		if false then
			slot2 = true
		end
	end

	self._current_camera = slot2

	return self._current_camera
end
function ViewportManager:get_current_camera_position()
	if self._current_camera_position_updated then
		return self._current_camera_position
	end

	slot3 = self

	if self.get_current_camera(slot2) then
		slot3 = self
		slot4 = self._current_camera_position

		self.get_current_camera(slot2).m_position(slot2, self.get_current_camera(slot2))

		self._current_camera_position_updated = true
	end

	return self._current_camera_position
end
function ViewportManager:get_current_camera_rotation()
	if self._current_camera_rotation then
		return self._current_camera_rotation
	end

	slot3 = self

	if self.get_current_camera(slot2) then
		slot3 = self
		slot3 = self.get_current_camera(slot2)
		slot1 = self.get_current_camera(slot2).rotation(slot2)
	end

	self._current_camera_rotation = slot1

	return self._current_camera_rotation
end
function ViewportManager:get_active_vp()
	slot3 = self
	slot3 = self.active_vp(slot2)

	return self.active_vp(slot2).vp(slot2)
end
function ViewportManager:active_vp()
	slot3 = self
	local vps = self.active_viewports(slot2)

	return 0 < #vps and vps[1]
end
slot3 = "WIN32"
local is_win32 = SystemInfo.platform(function (self)
	slot3 = self
	local vps = self.active_viewports(slot2)

	if 0 < #vps then
		slot2 = vps[1]
	else
		slot2 = false

		if false then
			slot2 = true
		end
	end

	return slot2
end) == Idstring(SystemInfo)
slot4 = "PS4"
local is_ps4 = SystemInfo.platform(slot2) == Idstring(SystemInfo)
slot5 = "XB1"
local is_xb1 = SystemInfo.platform(slot3) == Idstring(SystemInfo)
function ViewportManager:get_safe_rect()
	local a = 0.05
	local b = 1 - a * 2

	return {
		x = a,
		y = a,
		width = b,
		height = b
	}
end
function ViewportManager:get_safe_rect_pixels()
	local res = RenderSettings.resolution
	slot4 = self
	local safe_rect_scale = self.get_safe_rect(slot3)
	local safe_rect_pixels = {}
	slot6 = safe_rect_scale.x * res.x
	safe_rect_pixels.x = math.round(slot5)
	slot6 = safe_rect_scale.y * res.y
	safe_rect_pixels.y = math.round(slot5)
	slot6 = safe_rect_scale.width * res.x
	safe_rect_pixels.width = math.round(slot5)
	slot6 = safe_rect_scale.height * res.y
	safe_rect_pixels.height = math.round(slot5)

	return safe_rect_pixels
end
function ViewportManager:set_resolution(resolution)
	if RenderSettings.resolution ~= resolution or (self._render_settings_change_map and self._render_settings_change_map.resolution ~= resolution) then
		self._render_settings_change_map = self._render_settings_change_map or {}
		self._render_settings_change_map.resolution = resolution
	end

	return 
end
function ViewportManager:is_fullscreen()
	if self._render_settings_change_map and self._render_settings_change_map.fullscreen ~= nil then
		return self._render_settings_change_map.fullscreen
	else
		return RenderSettings.fullscreen
	end

	return 
end
function ViewportManager:is_borderless()
	if self._render_settings_change_map and self._render_settings_change_map.borderless ~= nil then
		return self._render_settings_change_map.borderless
	else
		return RenderSettings.borderless
	end

	return 
end
function ViewportManager:set_fullscreen(fullscreen)
	if not RenderSettings.fullscreen ~= not fullscreen or (self._render_settings_change_map and not self._render_settings_change_map.fullscreen ~= not fullscreen) then
		self._render_settings_change_map = self._render_settings_change_map or {}
		self._render_settings_change_map.fullscreen = not not fullscreen
	end

	return 
end
function ViewportManager:set_borderless(borderless)
	if not RenderSettings.borderless ~= not borderless or (self._render_settings_change_map and not self._render_settings_change_map.borderless ~= not borderless) then
		self._render_settings_change_map = self._render_settings_change_map or {}
		self._render_settings_change_map.borderless = not not borderless
	end

	return 
end
function ViewportManager:set_aspect_ratio(aspect_ratio)
	if RenderSettings.aspect_ratio ~= aspect_ratio or (self._render_settings_change_map and self._render_settings_change_map.aspect_ratio ~= aspect_ratio) then
		self._render_settings_change_map = self._render_settings_change_map or {}
		self._render_settings_change_map.aspect_ratio = aspect_ratio
		self._aspect_ratio = aspect_ratio
	end

	return 
end
function ViewportManager:set_vsync(vsync)
	if RenderSettings.v_sync ~= vsync or (self._render_settings_change_map and self._render_settings_change_map.v_sync ~= vsync) then
		self._render_settings_change_map = self._render_settings_change_map or {}
		self._render_settings_change_map.v_sync = vsync
		self._v_sync = vsync
	end

	return 
end
function ViewportManager:set_buffer_count(buffer_count)
	if RenderSettings.buffer_count ~= buffer_count or (self._render_settings_change_map and self._render_settings_change_map.buffer_count ~= buffer_count) then
		self._render_settings_change_map = self._render_settings_change_map or {}
		self._render_settings_change_map.buffer_count = buffer_count
	end

	return 
end
function ViewportManager:set_adapter_index(adapter_index)
	if RenderSettings.adapter_index ~= adapter_index or (self._render_settings_change_map and self._render_settings_change_map.adapter_index ~= adapter_index) then
		self._render_settings_change_map = self._render_settings_change_map or {}
		self._render_settings_change_map.adapter_index = adapter_index
	end

	return 
end
function ViewportManager:aspect_ratio()
	return self._aspect_ratio
end
function ViewportManager:set_aspect_ratio2(aspect_ratio)
	self._aspect_ratio = aspect_ratio

	return 
end
function ViewportManager:save(data)
	local state = {}
	slot5 = self
	state.default_environment = self.default_environment(slot4)
	data.ViewportManager = state

	return 
end
function ViewportManager:load(data)
	local state = data.ViewportManager

	if not state then
		return 
	end

	slot6 = state.default_environment

	self.set_default_environment(slot4, self)

	return 
end

return 
