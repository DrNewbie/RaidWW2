if not RaidMenuOptionsVideoAdvanced then
	slot2 = RaidGuiBase
	slot0 = class(slot1)
end

RaidMenuOptionsVideoAdvanced = slot0
RaidMenuOptionsVideoAdvanced.init = function (self, ws, fullscreen_ws, node, component_name)
	slot8 = "RaidMenuOptionsVideoAdvanced:init: "
	slot11 = ws

	Application.trace(slot6, Application, inspect(slot10))

	slot11 = component_name

	RaidMenuOptionsVideoAdvanced.super.init(slot6, self, ws, fullscreen_ws, node)

	slot7 = game_state_machine

	if game_state_machine.current_state(slot6)._name ~= "menu_main" then
		slot7 = managers.raid_menu

		managers.raid_menu.hide_background(slot6)
	end

	return 
end
RaidMenuOptionsVideoAdvanced._set_initial_data = function (self)
	slot5 = "menu_header_options_video_advanced_subtitle"

	self._node.components.raid_menu_header.set_screen_name(slot2, self._node.components.raid_menu_header, "menu_header_options_main_screen_name")

	return 
end
RaidMenuOptionsVideoAdvanced._layout = function (self)
	slot3 = self

	RaidMenuOptionsVideoAdvanced.super._layout(slot2)

	slot3 = self

	self._layout_video_advanced(slot2)

	slot3 = self

	self._load_advanced_video_values(slot2)

	slot4 = true

	self._toggle_menu_toggle_ssao.set_selected(slot2, self._toggle_menu_toggle_ssao)

	slot3 = self

	self.bind_controller_inputs(slot2)

	return 
end
RaidMenuOptionsVideoAdvanced.close = function (self)
	slot3 = self

	self._save_advanced_video_values(slot2)

	Global.savefile_manager.setting_changed = true
	slot4 = true

	managers.savefile.save_setting(true, managers.savefile)

	slot3 = self

	RaidMenuOptionsVideoAdvanced.super.close(true)

	return 
end
RaidMenuOptionsVideoAdvanced._load_advanced_video_values = function (self)
	slot4 = "dof_setting"
	local dof_setting = (managers.user.get_setting(slot2, managers.user) == "standard" and true) or false
	slot5 = "ssao_setting"
	local ssao_setting = (managers.user.get_setting(slot3, managers.user) == "standard" and true) or false
	slot6 = "use_parallax"
	local use_parallax = managers.user.get_setting(slot4, managers.user)
	slot7 = "motion_blur_setting"
	local motion_blur_setting = (managers.user.get_setting(managers.user, managers.user) == "standard" and true) or false
	slot8 = "vls_setting"
	local vls_setting = (managers.user.get_setting(slot6, managers.user) == "standard" and true) or false
	slot9 = "flush_gpu_command_queue"
	local flush_gpu_command_queue = managers.user.get_setting(slot7, managers.user)
	slot10 = "use_lightfx"
	local use_lightfx = managers.user.get_setting(managers.user, managers.user)
	local vsync = RenderSettings.v_sync
	local buffer_count = RenderSettings.buffer_count
	local vsync_value = nil

	if not vsync then
		vsync_value = "OFF"
	elseif buffer_count == 1 then
		vsync_value = "DOUBLE_BUFFER"
	else
		vsync_value = "TRIPLE_BUFFER"
	end

	slot14 = "fov_multiplier"
	local fov_multiplier = managers.user.get_setting(slot12, managers.user)
	slot15 = "detail_distance"
	local detail_distance = managers.user.get_setting(managers.user, managers.user)
	slot16 = "AA_setting"
	local AA_setting = managers.user.get_setting(managers.user, managers.user)
	local texture_quality_default = RenderSettings.texture_quality_default
	local shadow_quality_default = RenderSettings.shadow_quality_default
	local max_anisotropy = RenderSettings.max_anisotropy
	slot20 = "video_animation_lod"
	local video_animation_lod = managers.user.get_setting(slot18, managers.user)
	slot21 = "fps_cap"
	local fps_cap = managers.user.get_setting(managers.user, managers.user)
	slot22 = "max_streaming_chunk"
	local max_streaming_chunk = managers.user.get_setting(managers.user, managers.user)
	slot23 = "colorblind_setting"
	local colorblind_setting = managers.user.get_setting(managers.user, managers.user)
	slot25 = true

	self._toggle_menu_toggle_dof.set_value_and_render(managers.user, self._toggle_menu_toggle_dof, dof_setting)

	slot25 = true

	self._toggle_menu_toggle_ssao.set_value_and_render(managers.user, self._toggle_menu_toggle_ssao, ssao_setting)

	slot25 = true

	self._toggle_menu_toggle_parallax.set_value_and_render(managers.user, self._toggle_menu_toggle_parallax, use_parallax)

	slot25 = true

	self._toggle_menu_toggle_motion_blur.set_value_and_render(managers.user, self._toggle_menu_toggle_motion_blur, motion_blur_setting)

	slot25 = true

	self._toggle_menu_toggle_volumetric_light_scattering.set_value_and_render(managers.user, self._toggle_menu_toggle_volumetric_light_scattering, vls_setting)

	slot25 = true

	self._toggle_menu_toggle_gpu_flush.set_value_and_render(managers.user, self._toggle_menu_toggle_gpu_flush, flush_gpu_command_queue)

	slot24 = use_lightfx

	self._toggle_menu_toggle_lightfx.set_value_and_render(managers.user, self._toggle_menu_toggle_lightfx)

	local fov_multiplier_value = (1 - fov_multiplier) / (1 - tweak_data.player.fov_multiplier.MAX)
	slot26 = true

	self._progress_bar_menu_fov_adjustment.set_value(self._toggle_menu_toggle_lightfx, self._progress_bar_menu_fov_adjustment, fov_multiplier_value * 100)

	slot26 = true

	self._progress_bar_menu_detail_distance.set_value(self._toggle_menu_toggle_lightfx, self._progress_bar_menu_detail_distance, detail_distance * 100)

	slot26 = true

	self._stepper_menu_antialias.set_value_and_render(self._toggle_menu_toggle_lightfx, self._stepper_menu_antialias, AA_setting)

	slot26 = true

	self._stepper_menu_texture_quality.set_value_and_render(self._toggle_menu_toggle_lightfx, self._stepper_menu_texture_quality, texture_quality_default)

	slot26 = true

	self._stepper_menu_shadow_quality.set_value_and_render(self._toggle_menu_toggle_lightfx, self._stepper_menu_shadow_quality, shadow_quality_default)

	slot26 = true

	self._stepper_menu_anisotropic.set_value_and_render(self._toggle_menu_toggle_lightfx, self._stepper_menu_anisotropic, max_anisotropy)

	slot26 = true

	self._stepper_menu_anim_lod.set_value_and_render(self._toggle_menu_toggle_lightfx, self._stepper_menu_anim_lod, video_animation_lod)

	slot26 = true

	self._stepper_menu_fps_limit.set_value_and_render(self._toggle_menu_toggle_lightfx, self._stepper_menu_fps_limit, fps_cap)

	slot26 = true

	self._stepper_menu_colorblind_setting.set_value_and_render(self._toggle_menu_toggle_lightfx, self._stepper_menu_colorblind_setting, colorblind_setting)

	slot26 = true

	self._stepper_menu_toggle_vsync.set_value_and_render(self._toggle_menu_toggle_lightfx, self._stepper_menu_toggle_vsync, vsync_value)

	slot24 = managers.viewport

	if managers.viewport.is_fullscreen(self._toggle_menu_toggle_lightfx) then
		slot25 = true

		self._stepper_menu_toggle_vsync.set_enabled(slot23, self._stepper_menu_toggle_vsync)
	else
		slot25 = false

		self._stepper_menu_toggle_vsync.set_enabled(slot23, self._stepper_menu_toggle_vsync)

		self._stepper_menu_colorblind_setting._on_menu_move.down = nil
	end

	return 
end
RaidMenuOptionsVideoAdvanced._save_advanced_video_values = function (self)
	slot3 = self

	self.on_click_toggle_ssao(slot2)

	slot3 = self

	self.on_click_toggle_motion_blur(slot2)

	slot3 = self

	self.on_click_toggle_volumetric_light_scattering(slot2)

	slot3 = self

	self.on_click_toggle_gpu_flush(slot2)

	slot3 = self

	self.on_click_toggle_lightfx(slot2)

	slot3 = self

	self.on_item_selected_anim_lod(slot2)

	slot3 = self

	self.on_item_selected_max_streaming_chunk(slot2)

	return 
end
RaidMenuOptionsVideoAdvanced._layout_video_advanced = function (self)
	local start_x = 0
	local start_y = 320
	local default_width = 512
	local toggle_menu_toggle_ssao_params = {
		name = "toggle_menu_toggle_ssao",
		x = start_x,
		y = start_y,
		w = default_width
	}
	slot9 = "on_click_toggle_ssao"
	toggle_menu_toggle_ssao_params.on_click_callback = callback(slot6, self, self)
	slot10 = "menu_toggle_ssao"
	toggle_menu_toggle_ssao_params.description = utf8.to_upper(managers.localization.text(self, managers.localization))
	toggle_menu_toggle_ssao_params.on_menu_move = {
		down = "toggle_menu_toggle_parallax"
	}
	slot8 = toggle_menu_toggle_ssao_params
	self._toggle_menu_toggle_ssao = self._root_panel.toggle_button(slot6, self._root_panel)
	local toggle_menu_toggle_parallax_params = {
		name = "toggle_menu_toggle_parallax",
		x = start_x,
		y = toggle_menu_toggle_ssao_params.y + RaidGuiBase.PADDING,
		w = default_width
	}
	slot10 = "on_click_toggle_parallax"
	toggle_menu_toggle_parallax_params.on_click_callback = callback(RaidGuiBase.PADDING, self, self)
	slot11 = "menu_toggle_parallax"
	toggle_menu_toggle_parallax_params.description = utf8.to_upper(managers.localization.text(self, managers.localization))
	toggle_menu_toggle_parallax_params.on_menu_move = {
		down = "toggle_menu_toggle_motion_blur",
		up = "toggle_menu_toggle_ssao"
	}
	slot9 = toggle_menu_toggle_parallax_params
	self._toggle_menu_toggle_parallax = self._root_panel.toggle_button(RaidGuiBase.PADDING, self._root_panel)
	local toggle_menu_toggle_motion_blur_params = {
		name = "toggle_menu_toggle_motion_blur",
		x = start_x,
		y = toggle_menu_toggle_parallax_params.y + RaidGuiBase.PADDING,
		w = default_width
	}
	slot11 = "on_click_toggle_motion_blur"
	toggle_menu_toggle_motion_blur_params.on_click_callback = callback(RaidGuiBase.PADDING, self, self)
	slot12 = "menu_toggle_motion_blur"
	toggle_menu_toggle_motion_blur_params.description = utf8.to_upper(managers.localization.text(self, managers.localization))
	toggle_menu_toggle_motion_blur_params.on_menu_move = {
		down = "toggle_menu_toggle_dof",
		up = "toggle_menu_toggle_parallax"
	}
	slot10 = toggle_menu_toggle_motion_blur_params
	self._toggle_menu_toggle_motion_blur = self._root_panel.toggle_button(RaidGuiBase.PADDING, self._root_panel)
	local toggle_menu_toggle_dof_params = {
		name = "toggle_menu_toggle_dof",
		x = start_x,
		y = toggle_menu_toggle_motion_blur_params.y + RaidGuiBase.PADDING,
		w = default_width
	}
	slot12 = "on_click_toggle_dof"
	toggle_menu_toggle_dof_params.on_click_callback = callback(RaidGuiBase.PADDING, self, self)
	slot13 = "menu_toggle_dof"
	toggle_menu_toggle_dof_params.description = utf8.to_upper(managers.localization.text(self, managers.localization))
	toggle_menu_toggle_dof_params.on_menu_move = {
		down = "toggle_menu_toggle_volumetric_light_scattering",
		up = "toggle_menu_toggle_motion_blur"
	}
	slot11 = toggle_menu_toggle_dof_params
	self._toggle_menu_toggle_dof = self._root_panel.toggle_button(RaidGuiBase.PADDING, self._root_panel)
	local toggle_menu_toggle_volumetric_light_scattering_params = {
		name = "toggle_menu_toggle_volumetric_light_scattering",
		x = start_x,
		y = toggle_menu_toggle_dof_params.y + RaidGuiBase.PADDING,
		w = default_width
	}
	slot13 = "on_click_toggle_volumetric_light_scattering"
	toggle_menu_toggle_volumetric_light_scattering_params.on_click_callback = callback(RaidGuiBase.PADDING, self, self)
	slot14 = "menu_toggle_volumetric_light_scattering"
	toggle_menu_toggle_volumetric_light_scattering_params.description = utf8.to_upper(managers.localization.text(self, managers.localization))
	toggle_menu_toggle_volumetric_light_scattering_params.on_menu_move = {
		down = "toggle_menu_toggle_gpu_flush",
		up = "toggle_menu_toggle_motion_blur"
	}
	slot12 = toggle_menu_toggle_volumetric_light_scattering_params
	self._toggle_menu_toggle_volumetric_light_scattering = self._root_panel.toggle_button(RaidGuiBase.PADDING, self._root_panel)
	local toggle_menu_toggle_gpu_flush_params = {
		name = "toggle_menu_toggle_gpu_flush",
		x = start_x,
		y = toggle_menu_toggle_volumetric_light_scattering_params.y + RaidGuiBase.PADDING,
		w = default_width
	}
	slot14 = "on_click_toggle_gpu_flush"
	toggle_menu_toggle_gpu_flush_params.on_click_callback = callback(RaidGuiBase.PADDING, self, self)
	slot15 = "menu_toggle_gpu_flush"
	toggle_menu_toggle_gpu_flush_params.description = utf8.to_upper(managers.localization.text(self, managers.localization))
	toggle_menu_toggle_gpu_flush_params.on_menu_move = {
		down = "toggle_menu_toggle_lightfx_params",
		up = "toggle_menu_toggle_volumetric_light_scattering"
	}
	slot13 = toggle_menu_toggle_gpu_flush_params
	self._toggle_menu_toggle_gpu_flush = self._root_panel.toggle_button(RaidGuiBase.PADDING, self._root_panel)
	local toggle_menu_toggle_lightfx_params = {
		name = "toggle_menu_toggle_lightfx_params",
		x = start_x,
		y = toggle_menu_toggle_gpu_flush_params.y + RaidGuiBase.PADDING,
		w = default_width
	}
	slot15 = "on_click_toggle_lightfx"
	toggle_menu_toggle_lightfx_params.on_click_callback = callback(RaidGuiBase.PADDING, self, self)
	slot16 = "menu_lightfx"
	toggle_menu_toggle_lightfx_params.description = utf8.to_upper(managers.localization.text(self, managers.localization))
	toggle_menu_toggle_lightfx_params.on_menu_move = {
		down = "progress_bar_menu_fov_adjustment",
		up = "toggle_menu_toggle_gpu_flush"
	}
	slot14 = toggle_menu_toggle_lightfx_params
	self._toggle_menu_toggle_lightfx = self._root_panel.toggle_button(RaidGuiBase.PADDING, self._root_panel)
	local progress_bar_menu_fov_adjustment_params = {
		name = "progress_bar_menu_fov_adjustment"
	}
	slot17 = "menu_fov_adjustment"
	progress_bar_menu_fov_adjustment_params.description = utf8.to_upper(managers.localization.text(managers.localization, managers.localization))
	progress_bar_menu_fov_adjustment_params.x = start_x
	progress_bar_menu_fov_adjustment_params.y = toggle_menu_toggle_lightfx_params.y + RaidGuiBase.PADDING
	progress_bar_menu_fov_adjustment_params.min_display_value = tweak_data.player.stances.default.standard.FOV
	slot14 = tweak_data.player.stances.default.standard.FOV * tweak_data.player.fov_multiplier.MAX
	progress_bar_menu_fov_adjustment_params.max_display_value = math.round(RaidGuiBase.PADDING)
	progress_bar_menu_fov_adjustment_params.on_value_change_callback = callback(RaidGuiBase.PADDING, self, self)
	progress_bar_menu_fov_adjustment_params.on_menu_move = {
		down = "progress_bar_menu_detail_distance",
		up = "toggle_menu_toggle_lightfx_params"
	}
	slot15 = progress_bar_menu_fov_adjustment_params
	self._progress_bar_menu_fov_adjustment = self._root_panel.slider(RaidGuiBase.PADDING, self._root_panel)
	local progress_bar_menu_detail_distance_params = {
		name = "progress_bar_menu_detail_distance",
		value_format = "%02d%%"
	}
	slot18 = "menu_detail_distance"
	progress_bar_menu_detail_distance_params.description = utf8.to_upper(managers.localization.text("on_value_change_fov_adjustment", managers.localization))
	progress_bar_menu_detail_distance_params.x = start_x
	progress_bar_menu_detail_distance_params.y = progress_bar_menu_fov_adjustment_params.y + RaidGuiBase.PADDING
	progress_bar_menu_detail_distance_params.on_value_change_callback = callback(RaidGuiBase.PADDING, self, self)
	progress_bar_menu_detail_distance_params.on_menu_move = {
		down = "stepper_menu_antialias",
		up = "progress_bar_menu_fov_adjustment"
	}
	slot16 = progress_bar_menu_detail_distance_params
	self._progress_bar_menu_detail_distance = self._root_panel.slider(RaidGuiBase.PADDING, self._root_panel)
	start_x = 704
	local stepper_menu_antialias_params = {
		name = "stepper_menu_antialias",
		x = start_x,
		y = start_y,
		w = default_width
	}
	slot19 = "menu_options_video_advanced_antialias"
	stepper_menu_antialias_params.description = utf8.to_upper(managers.localization.text("on_value_change_detail_distance", managers.localization))
	slot18 = "data_source_stepper_menu_antialias"
	stepper_menu_antialias_params.data_source_callback = callback(self._root_panel, self, self)
	stepper_menu_antialias_params.on_item_selected_callback = callback(self._root_panel, self, self)
	stepper_menu_antialias_params.on_menu_move = {
		down = "stepper_menu_texture_quality",
		up = "progress_bar_menu_detail_distance"
	}
	slot17 = stepper_menu_antialias_params
	self._stepper_menu_antialias = self._root_panel.stepper(self._root_panel, self._root_panel)
	local stepper_menu_texture_quality_params = {
		name = "stepper_menu_texture_quality",
		x = start_x,
		y = stepper_menu_antialias_params.y + RaidGuiBase.PADDING,
		w = default_width
	}
	slot20 = "menu_texture_quality"
	stepper_menu_texture_quality_params.description = utf8.to_upper(managers.localization.text("on_item_selected_antialias", managers.localization))
	slot19 = "data_source_stepper_menu_texture_quality"
	stepper_menu_texture_quality_params.data_source_callback = callback(RaidGuiBase.PADDING, self, self)
	stepper_menu_texture_quality_params.on_item_selected_callback = callback(RaidGuiBase.PADDING, self, self)
	stepper_menu_texture_quality_params.on_menu_move = {
		down = "stepper_menu_shadow_quality",
		up = "stepper_menu_antialias"
	}
	slot18 = stepper_menu_texture_quality_params
	self._stepper_menu_texture_quality = self._root_panel.stepper(RaidGuiBase.PADDING, self._root_panel)
	local stepper_menu_shadow_quality_params = {
		name = "stepper_menu_shadow_quality",
		x = start_x,
		y = stepper_menu_texture_quality_params.y + RaidGuiBase.PADDING,
		w = default_width
	}
	slot21 = "menu_shadow_quality"
	stepper_menu_shadow_quality_params.description = utf8.to_upper(managers.localization.text("on_item_selected_texture_quality", managers.localization))
	slot20 = "data_source_stepper_menu_shadow_quality"
	stepper_menu_shadow_quality_params.data_source_callback = callback(RaidGuiBase.PADDING, self, self)
	stepper_menu_shadow_quality_params.on_item_selected_callback = callback(RaidGuiBase.PADDING, self, self)
	stepper_menu_shadow_quality_params.on_menu_move = {
		down = "stepper_menu_anisotropic",
		up = "stepper_menu_texture_quality"
	}
	slot19 = stepper_menu_shadow_quality_params
	self._stepper_menu_shadow_quality = self._root_panel.stepper(RaidGuiBase.PADDING, self._root_panel)
	local stepper_menu_anisotropic_params = {
		name = "stepper_menu_anisotropic",
		x = start_x,
		y = stepper_menu_shadow_quality_params.y + RaidGuiBase.PADDING,
		w = default_width
	}
	slot22 = "menu_options_video_advanced_anisotropic"
	stepper_menu_anisotropic_params.description = utf8.to_upper(managers.localization.text("on_item_selected_shadow_quality", managers.localization))
	slot21 = "data_source_stepper_menu_anisotropic"
	stepper_menu_anisotropic_params.data_source_callback = callback(RaidGuiBase.PADDING, self, self)
	stepper_menu_anisotropic_params.on_item_selected_callback = callback(RaidGuiBase.PADDING, self, self)
	stepper_menu_anisotropic_params.on_menu_move = {
		down = "stepper_menu_anim_lod",
		up = "stepper_menu_shadow_quality"
	}
	slot20 = stepper_menu_anisotropic_params
	self._stepper_menu_anisotropic = self._root_panel.stepper(RaidGuiBase.PADDING, self._root_panel)
	local stepper_menu_anim_lod_params = {
		name = "stepper_menu_anim_lod",
		x = start_x,
		y = stepper_menu_anisotropic_params.y + RaidGuiBase.PADDING,
		w = default_width
	}
	slot23 = "menu_anim_lod"
	stepper_menu_anim_lod_params.description = utf8.to_upper(managers.localization.text("on_item_selected_anisotropic", managers.localization))
	slot22 = "data_source_stepper_menu_anim_lod"
	stepper_menu_anim_lod_params.data_source_callback = callback(RaidGuiBase.PADDING, self, self)
	stepper_menu_anim_lod_params.on_item_selected_callback = callback(RaidGuiBase.PADDING, self, self)
	stepper_menu_anim_lod_params.on_menu_move = {
		down = "stepper_menu_fps_limit",
		up = "stepper_menu_anisotropic"
	}
	slot21 = stepper_menu_anim_lod_params
	self._stepper_menu_anim_lod = self._root_panel.stepper(RaidGuiBase.PADDING, self._root_panel)
	local stepper_menu_fps_limit_params = {
		name = "stepper_menu_fps_limit",
		x = start_x,
		y = stepper_menu_anim_lod_params.y + RaidGuiBase.PADDING,
		w = default_width
	}
	slot24 = "menu_fps_limit"
	stepper_menu_fps_limit_params.description = utf8.to_upper(managers.localization.text("on_item_selected_anim_lod", managers.localization))
	slot23 = "data_source_stepper_menu_fps_limit"
	stepper_menu_fps_limit_params.data_source_callback = callback(RaidGuiBase.PADDING, self, self)
	stepper_menu_fps_limit_params.on_item_selected_callback = callback(RaidGuiBase.PADDING, self, self)
	stepper_menu_fps_limit_params.on_menu_move = {
		down = "stepper_menu_colorblind_setting",
		up = "stepper_menu_anim_lod"
	}
	slot22 = stepper_menu_fps_limit_params
	self._stepper_menu_fps_limit = self._root_panel.stepper(RaidGuiBase.PADDING, self._root_panel)
	local stepper_menu_colorblind_setting_params = {
		name = "stepper_menu_colorblind_setting",
		x = start_x,
		y = stepper_menu_fps_limit_params.y + RaidGuiBase.PADDING,
		w = default_width
	}
	slot25 = "menu_colorblind_setting"
	stepper_menu_colorblind_setting_params.description = utf8.to_upper(managers.localization.text("on_item_selected_fps_limit", managers.localization))
	slot24 = "data_source_stepper_menu_colorblind_setting"
	stepper_menu_colorblind_setting_params.data_source_callback = callback(RaidGuiBase.PADDING, self, self)
	stepper_menu_colorblind_setting_params.on_item_selected_callback = callback(RaidGuiBase.PADDING, self, self)
	stepper_menu_colorblind_setting_params.on_menu_move = {
		down = "label_menu_vsync",
		up = "stepper_menu_fps_limit"
	}
	slot23 = stepper_menu_colorblind_setting_params
	self._stepper_menu_colorblind_setting = self._root_panel.stepper(RaidGuiBase.PADDING, self._root_panel)
	local _stepper_menu_toggle_vsync_params = {
		name = "label_menu_vsync",
		x = start_x,
		y = stepper_menu_colorblind_setting_params.y + RaidGuiBase.PADDING,
		w = default_width
	}
	slot26 = "menu_options_video_advanced_vsync"
	_stepper_menu_toggle_vsync_params.description = utf8.to_upper(managers.localization.text("on_item_selected_colorblind_setting", managers.localization))
	slot25 = "data_source_stepper_menu_vsync"
	_stepper_menu_toggle_vsync_params.data_source_callback = callback(RaidGuiBase.PADDING, self, self)
	_stepper_menu_toggle_vsync_params.on_item_selected_callback = callback(RaidGuiBase.PADDING, self, self)
	_stepper_menu_toggle_vsync_params.on_menu_move = {
		up = "stepper_menu_colorblind_setting"
	}
	slot24 = _stepper_menu_toggle_vsync_params
	self._stepper_menu_toggle_vsync = self._root_panel.stepper(RaidGuiBase.PADDING, self._root_panel)
	local default_advanced_video_params = {
		name = "default_advanced_video",
		y = 832,
		x = 1472
	}
	slot27 = "menu_options_controls_default"
	default_advanced_video_params.text = utf8.to_upper(managers.localization.text("on_item_selected_vsync", managers.localization))
	slot26 = "on_click_default_advanced_video"
	default_advanced_video_params.on_click_callback = callback(self._root_panel, self, self)
	default_advanced_video_params.layer = RaidGuiBase.FOREGROUND_LAYER
	slot25 = default_advanced_video_params
	self._default_advanced_video_button = self._root_panel.long_secondary_button(self._root_panel, self._root_panel)
	slot24 = managers.raid_menu

	if managers.raid_menu.is_pc_controller(self._root_panel) then
		slot24 = self._default_advanced_video_button

		self._default_advanced_video_button.show(slot23)
	else
		slot24 = self._default_advanced_video_button

		self._default_advanced_video_button.hide(slot23)
	end

	return 
end
RaidMenuOptionsVideoAdvanced.on_click_toggle_ssao = function (self)
	local ssao_setting = self._toggle_menu_toggle_ssao.get_value(slot2)
	slot4 = managers.menu
	slot5 = ssao_setting

	managers.menu.active_menu(self._toggle_menu_toggle_ssao).callback_handler.toggle_ssao_setting_raid(self._toggle_menu_toggle_ssao, managers.menu.active_menu(self._toggle_menu_toggle_ssao).callback_handler)

	return 
end
RaidMenuOptionsVideoAdvanced.on_click_toggle_parallax = function (self)
	local use_parallax = self._toggle_menu_toggle_parallax.get_value(slot2)
	slot4 = managers.menu
	slot5 = use_parallax

	managers.menu.active_menu(self._toggle_menu_toggle_parallax).callback_handler.set_use_parallax_raid(self._toggle_menu_toggle_parallax, managers.menu.active_menu(self._toggle_menu_toggle_parallax).callback_handler)

	return 
end
RaidMenuOptionsVideoAdvanced.on_click_toggle_motion_blur = function (self)
	local motion_blur_setting = self._toggle_menu_toggle_motion_blur.get_value(slot2)
	slot4 = managers.menu
	slot5 = motion_blur_setting

	managers.menu.active_menu(self._toggle_menu_toggle_motion_blur).callback_handler.toggle_motion_blur_setting_raid(self._toggle_menu_toggle_motion_blur, managers.menu.active_menu(self._toggle_menu_toggle_motion_blur).callback_handler)

	return 
end
RaidMenuOptionsVideoAdvanced.on_click_toggle_dof = function (self)
	local dof_setting = self._toggle_menu_toggle_dof.get_value(slot2)
	slot4 = managers.menu
	slot5 = dof_setting

	managers.menu.active_menu(self._toggle_menu_toggle_dof).callback_handler.toggle_dof_setting_raid(self._toggle_menu_toggle_dof, managers.menu.active_menu(self._toggle_menu_toggle_dof).callback_handler)

	return 
end
RaidMenuOptionsVideoAdvanced.on_click_toggle_volumetric_light_scattering = function (self)
	local vls_setting = self._toggle_menu_toggle_volumetric_light_scattering.get_value(slot2)
	slot4 = managers.menu
	slot5 = vls_setting

	managers.menu.active_menu(self._toggle_menu_toggle_volumetric_light_scattering).callback_handler.toggle_volumetric_light_scattering_setting_raid(self._toggle_menu_toggle_volumetric_light_scattering, managers.menu.active_menu(self._toggle_menu_toggle_volumetric_light_scattering).callback_handler)

	return 
end
RaidMenuOptionsVideoAdvanced.on_click_toggle_gpu_flush = function (self)
	local flush_gpu_command_queue = self._toggle_menu_toggle_gpu_flush.get_value(slot2)
	slot4 = managers.menu
	slot5 = flush_gpu_command_queue

	managers.menu.active_menu(self._toggle_menu_toggle_gpu_flush).callback_handler.toggle_gpu_flush_setting_raid(self._toggle_menu_toggle_gpu_flush, managers.menu.active_menu(self._toggle_menu_toggle_gpu_flush).callback_handler)

	return 
end
RaidMenuOptionsVideoAdvanced.on_click_toggle_lightfx = function (self)
	local use_lightfx = self._toggle_menu_toggle_lightfx.get_value(slot2)
	slot4 = managers.menu
	slot5 = use_lightfx

	managers.menu.active_menu(self._toggle_menu_toggle_lightfx).callback_handler.toggle_lightfx_raid(self._toggle_menu_toggle_lightfx, managers.menu.active_menu(self._toggle_menu_toggle_lightfx).callback_handler)

	return 
end
RaidMenuOptionsVideoAdvanced.on_value_change_fov_adjustment = function (self)
	local fov_multiplier = self._progress_bar_menu_fov_adjustment.get_value(slot2) / 100
	fov_multiplier = fov_multiplier * (tweak_data.player.fov_multiplier.MAX - 1) + 1
	slot4 = managers.menu
	slot5 = fov_multiplier

	managers.menu.active_menu(self._progress_bar_menu_fov_adjustment).callback_handler.set_fov_multiplier_raid(self._progress_bar_menu_fov_adjustment, managers.menu.active_menu(self._progress_bar_menu_fov_adjustment).callback_handler)

	return 
end
RaidMenuOptionsVideoAdvanced.on_value_change_detail_distance = function (self)
	local detail_distance = self._progress_bar_menu_detail_distance.get_value(slot2) / 100
	slot4 = managers.menu
	slot5 = detail_distance

	managers.menu.active_menu(self._progress_bar_menu_detail_distance).callback_handler.set_detail_distance_raid(self._progress_bar_menu_detail_distance, managers.menu.active_menu(self._progress_bar_menu_detail_distance).callback_handler)

	return 
end
RaidMenuOptionsVideoAdvanced.on_item_selected_vsync = function (self)
	slot3 = self._stepper_menu_toggle_vsync
	local vsync_value = self._stepper_menu_toggle_vsync.get_value(slot2)

	if vsync_value == "OFF" then
		slot4 = managers.menu
		slot6 = 1

		managers.menu.active_menu(slot3).callback_handler.toggle_vsync_raid(slot3, managers.menu.active_menu(slot3).callback_handler, false)
	elseif vsync_value == "DOUBLE_BUFFER" then
		slot4 = managers.menu
		slot6 = 1

		managers.menu.active_menu(slot3).callback_handler.toggle_vsync_raid(slot3, managers.menu.active_menu(slot3).callback_handler, true)
	else
		slot4 = managers.menu
		slot6 = 2

		managers.menu.active_menu(slot3).callback_handler.toggle_vsync_raid(slot3, managers.menu.active_menu(slot3).callback_handler, true)
	end

	return 
end
RaidMenuOptionsVideoAdvanced.data_source_stepper_menu_vsync = function (self)
	local result = {}
	slot5 = {
		value = "OFF",
		text = utf8.to_upper(managers.localization.text(slot9, managers.localization)),
		info = utf8.to_upper(managers.localization.text(slot9, managers.localization))
	}
	slot11 = "menu_vsync_quality_off"
	slot11 = "menu_vsync_quality_off"

	table.insert(slot3, result)

	slot5 = {
		value = "DOUBLE_BUFFER",
		text = utf8.to_upper(managers.localization.text(slot9, managers.localization)),
		info = utf8.to_upper(managers.localization.text(slot9, managers.localization))
	}
	slot11 = "menu_vsync_quality_db"
	slot11 = "menu_vsync_quality_db"

	table.insert(slot3, result)

	slot5 = {
		value = "TRIPLE_BUFFER",
		selected = true,
		text = utf8.to_upper(managers.localization.text(slot9, managers.localization)),
		info = utf8.to_upper(managers.localization.text(slot9, managers.localization))
	}
	slot11 = "menu_vsync_quality_tb"
	slot11 = "menu_vsync_quality_tb"

	table.insert(slot3, result)

	return result
end
RaidMenuOptionsVideoAdvanced.on_item_selected_antialias = function (self)
	local AA_setting = self._stepper_menu_antialias.get_value(slot2)
	slot4 = managers.menu
	slot5 = AA_setting

	managers.menu.active_menu(self._stepper_menu_antialias).callback_handler.choice_choose_anti_alias_raid(self._stepper_menu_antialias, managers.menu.active_menu(self._stepper_menu_antialias).callback_handler)

	return 
end
RaidMenuOptionsVideoAdvanced.data_source_stepper_menu_antialias = function (self)
	local result = {}
	slot5 = {
		value = "OFF",
		text = utf8.to_upper(managers.localization.text(slot9, managers.localization)),
		info = utf8.to_upper(managers.localization.text(slot9, managers.localization))
	}
	slot11 = "menu_AA_quality_off"
	slot11 = "menu_AA_quality_off"

	table.insert(slot3, result)

	slot5 = {
		value = "FXAA",
		text = utf8.to_upper(managers.localization.text(slot9, managers.localization)),
		info = utf8.to_upper(managers.localization.text(slot9, managers.localization))
	}
	slot11 = "menu_AA_quality_fxaa"
	slot11 = "menu_AA_quality_fxaa"

	table.insert(slot3, result)

	slot5 = {
		value = "SMAA",
		selected = true,
		text = utf8.to_upper(managers.localization.text(slot9, managers.localization)),
		info = utf8.to_upper(managers.localization.text(slot9, managers.localization))
	}
	slot11 = "menu_AA_quality_smaa"
	slot11 = "menu_AA_quality_smaa"

	table.insert(slot3, result)

	return result
end
RaidMenuOptionsVideoAdvanced.on_item_selected_texture_quality = function (self)
	local texture_quality_default = self._stepper_menu_texture_quality.get_value(slot2)
	slot4 = managers.menu
	slot5 = texture_quality_default

	managers.menu.active_menu(self._stepper_menu_texture_quality).callback_handler.choice_choose_texture_quality_raid(self._stepper_menu_texture_quality, managers.menu.active_menu(self._stepper_menu_texture_quality).callback_handler)

	return 
end
RaidMenuOptionsVideoAdvanced.data_source_stepper_menu_texture_quality = function (self)
	local result = {}
	slot5 = {
		value = "very low",
		text = utf8.to_upper(managers.localization.text(slot9, managers.localization)),
		info = utf8.to_upper(managers.localization.text(slot9, managers.localization))
	}
	slot11 = "menu_texture_quality_very_low"
	slot11 = "menu_texture_quality_very_low"

	table.insert(slot3, result)

	slot5 = {
		value = "low",
		text = utf8.to_upper(managers.localization.text(slot9, managers.localization)),
		info = utf8.to_upper(managers.localization.text(slot9, managers.localization))
	}
	slot11 = "menu_texture_quality_low"
	slot11 = "menu_texture_quality_low"

	table.insert(slot3, result)

	slot5 = {
		value = "medium",
		text = utf8.to_upper(managers.localization.text(slot9, managers.localization)),
		info = utf8.to_upper(managers.localization.text(slot9, managers.localization))
	}
	slot11 = "menu_texture_quality_medium"
	slot11 = "menu_texture_quality_medium"

	table.insert(slot3, result)

	slot5 = {
		value = "high",
		selected = true,
		text = utf8.to_upper(managers.localization.text(slot9, managers.localization)),
		info = utf8.to_upper(managers.localization.text(slot9, managers.localization))
	}
	slot11 = "menu_texture_quality_high"
	slot11 = "menu_texture_quality_high"

	table.insert(slot3, result)

	return result
end
RaidMenuOptionsVideoAdvanced.on_item_selected_shadow_quality = function (self)
	local shadow_quality_default = self._stepper_menu_shadow_quality.get_value(slot2)
	slot4 = managers.menu
	slot5 = shadow_quality_default

	managers.menu.active_menu(self._stepper_menu_shadow_quality).callback_handler.choice_choose_shadow_quality_raid(self._stepper_menu_shadow_quality, managers.menu.active_menu(self._stepper_menu_shadow_quality).callback_handler)

	return 
end
RaidMenuOptionsVideoAdvanced.data_source_stepper_menu_shadow_quality = function (self)
	local result = {}
	slot5 = {
		value = "very low",
		text = utf8.to_upper(managers.localization.text(slot9, managers.localization)),
		info = utf8.to_upper(managers.localization.text(slot9, managers.localization))
	}
	slot11 = "menu_texture_quality_very_low"
	slot11 = "menu_texture_quality_very_low"

	table.insert(slot3, result)

	slot5 = {
		value = "low",
		text = utf8.to_upper(managers.localization.text(slot9, managers.localization)),
		info = utf8.to_upper(managers.localization.text(slot9, managers.localization))
	}
	slot11 = "menu_texture_quality_low"
	slot11 = "menu_texture_quality_low"

	table.insert(slot3, result)

	slot5 = {
		value = "medium",
		text = utf8.to_upper(managers.localization.text(slot9, managers.localization)),
		info = utf8.to_upper(managers.localization.text(slot9, managers.localization))
	}
	slot11 = "menu_texture_quality_medium"
	slot11 = "menu_texture_quality_medium"

	table.insert(slot3, result)

	slot5 = {
		value = "high",
		text = utf8.to_upper(managers.localization.text(slot9, managers.localization)),
		info = utf8.to_upper(managers.localization.text(slot9, managers.localization))
	}
	slot11 = "menu_texture_quality_high"
	slot11 = "menu_texture_quality_high"

	table.insert(slot3, result)

	slot5 = {
		value = "very high",
		selected = true,
		text = utf8.to_upper(managers.localization.text(slot9, managers.localization)),
		info = utf8.to_upper(managers.localization.text(slot9, managers.localization))
	}
	slot11 = "menu_texture_quality_very_high"
	slot11 = "menu_texture_quality_very_high"

	table.insert(slot3, result)

	return result
end
RaidMenuOptionsVideoAdvanced.on_item_selected_anisotropic = function (self)
	local max_anisotropy = self._stepper_menu_anisotropic.get_value(slot2)
	slot4 = managers.menu
	slot5 = max_anisotropy

	managers.menu.active_menu(self._stepper_menu_anisotropic).callback_handler.choice_choose_anisotropic_raid(self._stepper_menu_anisotropic, managers.menu.active_menu(self._stepper_menu_anisotropic).callback_handler)

	return 
end
RaidMenuOptionsVideoAdvanced.data_source_stepper_menu_anisotropic = function (self)
	local result = {}
	slot5 = {
		value = 1,
		text = utf8.to_upper(managers.localization.text(slot9, managers.localization)),
		info = utf8.to_upper(managers.localization.text(slot9, managers.localization))
	}
	slot11 = "menu_anisotropic_1"
	slot11 = "menu_anisotropic_1"

	table.insert(slot3, result)

	slot5 = {
		value = 2,
		text = utf8.to_upper(managers.localization.text(slot9, managers.localization)),
		info = utf8.to_upper(managers.localization.text(slot9, managers.localization))
	}
	slot11 = "menu_anisotropic_2"
	slot11 = "menu_anisotropic_2"

	table.insert(slot3, result)

	slot5 = {
		value = 4,
		text = utf8.to_upper(managers.localization.text(slot9, managers.localization)),
		info = utf8.to_upper(managers.localization.text(slot9, managers.localization))
	}
	slot11 = "menu_anisotropic_4"
	slot11 = "menu_anisotropic_4"

	table.insert(slot3, result)

	slot5 = {
		value = 8,
		text = utf8.to_upper(managers.localization.text(slot9, managers.localization)),
		info = utf8.to_upper(managers.localization.text(slot9, managers.localization))
	}
	slot11 = "menu_anisotropic_8"
	slot11 = "menu_anisotropic_8"

	table.insert(slot3, result)

	slot5 = {
		value = 16,
		selected = true,
		text = utf8.to_upper(managers.localization.text(slot9, managers.localization)),
		info = utf8.to_upper(managers.localization.text(slot9, managers.localization))
	}
	slot11 = "menu_anisotropic_16"
	slot11 = "menu_anisotropic_16"

	table.insert(slot3, result)

	return result
end
RaidMenuOptionsVideoAdvanced.on_item_selected_anim_lod = function (self)
	local video_animation_lod = self._stepper_menu_anim_lod.get_value(slot2)
	slot4 = managers.menu
	slot5 = video_animation_lod

	managers.menu.active_menu(self._stepper_menu_anim_lod).callback_handler.choice_choose_anim_lod_raid(self._stepper_menu_anim_lod, managers.menu.active_menu(self._stepper_menu_anim_lod).callback_handler)

	return 
end
RaidMenuOptionsVideoAdvanced.data_source_stepper_menu_anim_lod = function (self)
	local result = {}
	slot5 = {
		value = 1,
		text = utf8.to_upper(managers.localization.text(slot9, managers.localization)),
		info = utf8.to_upper(managers.localization.text(slot9, managers.localization))
	}
	slot11 = "menu_anim_lod_1"
	slot11 = "menu_anim_lod_1"

	table.insert(slot3, result)

	slot5 = {
		value = 2,
		text = utf8.to_upper(managers.localization.text(slot9, managers.localization)),
		info = utf8.to_upper(managers.localization.text(slot9, managers.localization))
	}
	slot11 = "menu_anim_lod_2"
	slot11 = "menu_anim_lod_2"

	table.insert(slot3, result)

	slot5 = {
		value = 3,
		selected = true,
		text = utf8.to_upper(managers.localization.text(slot9, managers.localization)),
		info = utf8.to_upper(managers.localization.text(slot9, managers.localization))
	}
	slot11 = "menu_anim_lod_3"
	slot11 = "menu_anim_lod_3"

	table.insert(slot3, result)

	return result
end
RaidMenuOptionsVideoAdvanced.on_item_selected_fps_limit = function (self)
	local fps_cap = self._stepper_menu_fps_limit.get_value(slot2)
	slot4 = managers.menu
	slot5 = fps_cap

	managers.menu.active_menu(self._stepper_menu_fps_limit).callback_handler.choice_fps_cap_raid(self._stepper_menu_fps_limit, managers.menu.active_menu(self._stepper_menu_fps_limit).callback_handler)

	return 
end
RaidMenuOptionsVideoAdvanced.data_source_stepper_menu_fps_limit = function (self)
	local result = {}
	slot5 = {
		value = 30,
		info = "30",
		text = "30"
	}

	table.insert(slot3, result)

	slot5 = {
		value = 45,
		info = "45",
		text = "45"
	}

	table.insert(slot3, result)

	slot5 = {
		value = 60,
		info = "60",
		text = "60"
	}

	table.insert(slot3, result)

	slot5 = {
		value = 75,
		info = "75",
		text = "75"
	}

	table.insert(slot3, result)

	slot5 = {
		value = 90,
		info = "90",
		text = "90"
	}

	table.insert(slot3, result)

	slot5 = {
		value = 105,
		info = "105",
		text = "105"
	}

	table.insert(slot3, result)

	slot5 = {
		value = 120,
		info = "120",
		text = "120"
	}

	table.insert(slot3, result)

	slot5 = {
		value = 135,
		info = "135",
		text = "135",
		selected = true
	}

	table.insert(slot3, result)

	slot5 = {
		value = 144,
		info = "144",
		text = "144"
	}

	table.insert(slot3, result)

	slot5 = {
		value = 600,
		text = utf8.to_upper(managers.localization.text(slot9, managers.localization)),
		info = utf8.to_upper(managers.localization.text(slot9, managers.localization))
	}
	slot11 = "menu_fps_unlimited"
	slot11 = "menu_fps_unlimited"

	table.insert(slot3, result)

	return result
end
RaidMenuOptionsVideoAdvanced.on_item_selected_max_streaming_chunk = function (self)
	local max_streaming_chunk = 4096
	slot4 = managers.menu
	slot5 = max_streaming_chunk

	managers.menu.active_menu(slot3).callback_handler.choice_max_streaming_chunk_raid(slot3, managers.menu.active_menu(slot3).callback_handler)

	return 
end
RaidMenuOptionsVideoAdvanced.data_source_stepper_menu_max_streaming_chunk = function (self)
	local result = {}
	slot5 = {
		value = 32,
		info = "32",
		text = "32"
	}

	table.insert(slot3, result)

	slot5 = {
		value = 64,
		info = "64",
		text = "64"
	}

	table.insert(slot3, result)

	slot5 = {
		value = 128,
		info = "128",
		text = "128"
	}

	table.insert(slot3, result)

	slot5 = {
		value = 256,
		info = "256",
		text = "256"
	}

	table.insert(slot3, result)

	slot5 = {
		value = 512,
		info = "512",
		text = "512"
	}

	table.insert(slot3, result)

	slot5 = {
		value = 1024,
		info = "1024",
		text = "1024"
	}

	table.insert(slot3, result)

	slot5 = {
		value = 2048,
		info = "2048",
		text = "2048"
	}

	table.insert(slot3, result)

	slot5 = {
		value = 4096,
		info = "4096",
		text = "4096",
		selected = true
	}

	table.insert(slot3, result)

	return result
end
RaidMenuOptionsVideoAdvanced.data_source_stepper_menu_colorblind_setting = function (self)
	local result = {}
	slot5 = {
		value = "off",
		text = utf8.to_upper(managers.localization.text(slot9, managers.localization)),
		info = utf8.to_upper(managers.localization.text(slot9, managers.localization))
	}
	slot11 = "menu_colorblind_setting_off"
	slot11 = "menu_colorblind_setting_off"

	table.insert(slot3, result)

	slot5 = {
		value = "protanope",
		text = utf8.to_upper(managers.localization.text(slot9, managers.localization)),
		info = utf8.to_upper(managers.localization.text(slot9, managers.localization))
	}
	slot11 = "menu_colorblind_setting_protanope"
	slot11 = "menu_colorblind_setting_protanope"

	table.insert(slot3, result)

	slot5 = {
		value = "deuteranope",
		text = utf8.to_upper(managers.localization.text(slot9, managers.localization)),
		info = utf8.to_upper(managers.localization.text(slot9, managers.localization))
	}
	slot11 = "menu_colorblind_setting_deuteranope"
	slot11 = "menu_colorblind_setting_deuteranope"

	table.insert(slot3, result)

	slot5 = {
		value = "tritanope",
		text = utf8.to_upper(managers.localization.text(slot9, managers.localization)),
		info = utf8.to_upper(managers.localization.text(slot9, managers.localization))
	}
	slot11 = "menu_colorblind_setting_tritanope"
	slot11 = "menu_colorblind_setting_tritanope"

	table.insert(slot3, result)

	return result
end
RaidMenuOptionsVideoAdvanced.on_click_default_advanced_video = function (self)
	local params = {}
	slot5 = "dialog_reset_advanced_video_title"
	params.title = managers.localization.text(slot3, managers.localization)
	slot5 = "dialog_reset_advanced_video_message"
	params.message = managers.localization.text(slot3, managers.localization)
	params.callback = function ()
		slot2 = managers.user

		managers.user.reset_advanced_video_setting_map(slot1)

		RenderSettings.texture_quality_default = "high"
		RenderSettings.shadow_quality_default = "high"
		RenderSettings.max_anisotropy = 16
		RenderSettings.v_sync = false
		slot2 = self

		self._load_advanced_video_values(false)

		slot2 = managers.menu
		slot2 = managers.menu.active_menu(false).callback_handler

		managers.menu.active_menu(false).callback_handler.apply_and_save_render_settings(false)

		slot2 = managers.menu
		slot2 = managers.menu.active_menu(false).callback_handler

		managers.menu.active_menu(false).callback_handler._refresh_brightness(false)

		return 
	end
	slot5 = params

	managers.menu.show_option_dialog(slot3, managers.menu)

	return 
end
RaidMenuOptionsVideoAdvanced.on_item_selected_colorblind_setting = function (self)
	local colorblind_setting = self._stepper_menu_colorblind_setting.get_value(slot2)
	slot4 = managers.menu
	slot5 = colorblind_setting

	managers.menu.active_menu(self._stepper_menu_colorblind_setting).callback_handler.choice_choose_cb_mode_raid(self._stepper_menu_colorblind_setting, managers.menu.active_menu(self._stepper_menu_colorblind_setting).callback_handler)

	return 
end
RaidMenuOptionsVideoAdvanced.bind_controller_inputs = function (self)
	local bindings = {}
	slot5 = "menu_controller_face_left"
	slot7 = "on_click_default_advanced_video"
	bindings[1] = {
		key = Idstring(slot4),
		callback = callback(slot4, self, self)
	}

	self.set_controller_bindings(callback(slot4, self, self), self, bindings)

	local legend = {
		controller = {
			"menu_legend_back",
			"menu_options_controls_default_controller"
		}
	}
	slot10 = nil
	legend.keyboard = {
		{
			key = "footer_back",
			callback = callback(true, self, self, "_on_legend_pc_back")
		}
	}
	slot6 = legend

	self.set_legend(, self)

	return 
end

return 
