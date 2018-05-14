if not RaidMenuOptionsVideo then
	slot2 = RaidGuiBase
	slot0 = class(slot1)
end

RaidMenuOptionsVideo = slot0
RaidMenuOptionsVideo.init = function (self, ws, fullscreen_ws, node, component_name)
	slot11 = component_name

	RaidMenuOptionsVideo.super.init(slot6, self, ws, fullscreen_ws, node)

	return 
end
RaidMenuOptionsVideo._set_initial_data = function (self)
	slot5 = "menu_header_options_video_subtitle"

	self._node.components.raid_menu_header.set_screen_name(slot2, self._node.components.raid_menu_header, "menu_header_options_main_screen_name")

	return 
end
RaidMenuOptionsVideo._layout = function (self)
	slot3 = self

	RaidMenuOptionsVideo.super._layout(slot2)

	self._fullscreen_only_controls = {}
	slot3 = self

	self._layout_video(slot2)

	slot3 = self

	self._load_video_values(slot2)

	slot3 = self

	self._setup_control_visibility(slot2)

	slot4 = true

	self._stepper_menu_resolution.set_selected(slot2, self._stepper_menu_resolution)

	slot3 = self

	self.bind_controller_inputs(slot2)

	return 
end
RaidMenuOptionsVideo.close = function (self)
	slot3 = self

	self._save_video_values(slot2)

	Global.savefile_manager.setting_changed = true
	slot4 = true

	managers.savefile.save_setting(true, managers.savefile)

	slot3 = self

	RaidMenuOptionsVideo.super.close(true)

	return 
end
RaidMenuOptionsVideo._layout_video = function (self)
	local start_x = 0
	local start_y = 320
	local default_width = 512
	local btn_advanced_options = {
		name = "btn_advanced_options",
		x = start_x,
		y = start_y - 128,
		w = default_width
	}
	slot10 = "menu_options_video_advanced_button"
	btn_advanced_options.text = utf8.to_upper(managers.localization.text(slot8, managers.localization))
	btn_advanced_options.on_click_callback = callback(slot6, self, self)
	btn_advanced_options.on_menu_move = {
		down = "stepper_menu_resolution"
	}
	slot8 = btn_advanced_options
	self._btn_advanced_options = self._root_panel.long_tertiary_button(slot6, self._root_panel)
	local stepper_menu_resolution = {
		name = "stepper_menu_resolution",
		x = start_x,
		y = start_y,
		w = default_width
	}
	slot11 = "menu_options_video_resolution"
	stepper_menu_resolution.description = utf8.to_upper(managers.localization.text("on_click_options_video_advanced_button", managers.localization))
	slot10 = "data_source_stepper_menu_resolution"
	stepper_menu_resolution.data_source_callback = callback(self._root_panel, self, self)
	slot10 = "on_item_selected_stepper_menu_resolution"
	stepper_menu_resolution.on_item_selected_callback = callback(self._root_panel, self, self)
	stepper_menu_resolution.on_menu_move = {
		down = "stepper_menu_refresh_rate",
		up = "btn_advanced_options"
	}
	slot9 = stepper_menu_resolution
	self._stepper_menu_resolution = self._root_panel.stepper(self._root_panel, self._root_panel)

	self._stepper_menu_resolution.set_value_and_render(self._root_panel, self._stepper_menu_resolution, {
		x = RenderSettings.resolution.x,
		y = RenderSettings.resolution.y,
		is_equal = function (self, check_x_y)
			if check_x_y.x == self.x and check_x_y.y == self.y then
				return true
			else
				return false
			end

			return 
		end
	})

	local apply_resolution = {
		name = "apply_resolution"
	}
	slot9 = self._stepper_menu_resolution
	apply_resolution.x = self._stepper_menu_resolution.w(self._stepper_menu_resolution) + RaidGuiBase.PADDING
	slot9 = self._stepper_menu_resolution
	apply_resolution.y = self._stepper_menu_resolution.y(RaidGuiBase.PADDING)
	slot12 = "menu_button_apply_resolution_refresh_rate"
	apply_resolution.text = utf8.to_upper(managers.localization.text(true, managers.localization))
	apply_resolution.layer = RaidGuiBase.FOREGROUND_LAYER
	apply_resolution.on_click_callback = callback(RaidGuiBase.PADDING, self, self)
	slot10 = apply_resolution
	self._button_apply_video_resolution = self._root_panel.small_button(RaidGuiBase.PADDING, self._root_panel)
	local stepper_menu_refresh_rate = {
		name = "stepper_menu_refresh_rate",
		x = start_x,
		y = stepper_menu_resolution.y + RaidGuiBase.PADDING,
		w = default_width
	}
	slot13 = "menu_options_video_refresh_rate"
	stepper_menu_refresh_rate.description = utf8.to_upper(managers.localization.text("on_click_apply_resolution_refresh_rate", managers.localization))
	slot12 = "data_source_stepper_menu_refresh_rate"
	stepper_menu_refresh_rate.data_source_callback = callback(RaidGuiBase.PADDING, self, self)
	stepper_menu_refresh_rate.on_item_selected_callback = callback(RaidGuiBase.PADDING, self, self)
	stepper_menu_refresh_rate.on_menu_move = {
		down = "window_mode",
		up = "stepper_menu_resolution"
	}
	slot11 = stepper_menu_refresh_rate
	self._stepper_menu_refresh_rate = self._root_panel.stepper(RaidGuiBase.PADDING, self._root_panel)
	slot11 = self._stepper_menu_refresh_rate

	table.insert(RaidGuiBase.PADDING, self._fullscreen_only_controls)

	local stepper_menu_window_mode = {
		name = "window_mode",
		stepper_w = 280
	}
	slot14 = "menu_window_mode"
	stepper_menu_window_mode.description = utf8.to_upper(managers.localization.text("on_item_selected_refresh_rate", managers.localization))
	stepper_menu_window_mode.x = start_x
	stepper_menu_window_mode.y = stepper_menu_refresh_rate.y + RaidGuiBase.PADDING
	stepper_menu_window_mode.w = default_width
	slot13 = "data_source_stepper_menu_window_mode"
	stepper_menu_window_mode.data_source_callback = callback(RaidGuiBase.PADDING, self, self)
	stepper_menu_window_mode.on_item_selected_callback = callback(RaidGuiBase.PADDING, self, self)
	stepper_menu_window_mode.on_menu_move = {
		down = "subtitle",
		up = "stepper_menu_refresh_rate"
	}
	slot12 = stepper_menu_window_mode
	self._stepper_menu_window_mode = self._root_panel.stepper(RaidGuiBase.PADDING, self._root_panel)
	local subtitle = {
		name = "subtitle"
	}
	slot15 = "menu_options_video_subtitle"
	subtitle.description = utf8.to_upper(managers.localization.text("on_item_selected_window_mode", managers.localization))
	subtitle.x = start_x
	subtitle.y = stepper_menu_window_mode.y + RaidGuiBase.PADDING
	subtitle.w = default_width
	subtitle.on_click_callback = callback(RaidGuiBase.PADDING, self, self)
	subtitle.on_menu_move = {
		down = "hit_confirm_indicator",
		up = "window_mode"
	}
	slot13 = subtitle
	self._toggle_menu_subtitle = self._root_panel.toggle_button(RaidGuiBase.PADDING, self._root_panel)
	local hit_confirm_indicator = {
		name = "hit_confirm_indicator"
	}
	slot16 = "menu_options_video_hit_confirm_indicator"
	hit_confirm_indicator.description = utf8.to_upper(managers.localization.text("on_click_subtitle", managers.localization))
	hit_confirm_indicator.x = start_x
	hit_confirm_indicator.y = subtitle.y + RaidGuiBase.PADDING
	hit_confirm_indicator.w = default_width
	hit_confirm_indicator.on_click_callback = callback(RaidGuiBase.PADDING, self, self)
	hit_confirm_indicator.on_menu_move = {
		down = "use_headbob",
		up = "subtitle"
	}
	slot14 = hit_confirm_indicator
	self._toggle_menu_hit_indicator = self._root_panel.toggle_button(RaidGuiBase.PADDING, self._root_panel)
	local use_headbob = {
		name = "use_headbob"
	}
	slot17 = "menu_options_video_use_headbob"
	use_headbob.description = utf8.to_upper(managers.localization.text("on_click_hit_indicator", managers.localization))
	use_headbob.x = start_x
	use_headbob.y = hit_confirm_indicator.y + RaidGuiBase.PADDING
	use_headbob.w = default_width
	use_headbob.on_click_callback = callback(RaidGuiBase.PADDING, self, self)
	use_headbob.on_menu_move = {
		down = "use_camera_accel",
		up = "hit_confirm_indicator"
	}
	slot15 = use_headbob
	self._toggle_menu_headbob = self._root_panel.toggle_button(RaidGuiBase.PADDING, self._root_panel)
	local use_camera_accel = {
		name = "use_camera_accel"
	}
	slot18 = "menu_options_video_use_camera_accel"
	use_camera_accel.description = utf8.to_upper(managers.localization.text("on_click_headbob", managers.localization))
	use_camera_accel.x = start_x
	use_camera_accel.y = use_headbob.y + RaidGuiBase.PADDING
	use_camera_accel.w = default_width
	use_camera_accel.on_click_callback = callback(RaidGuiBase.PADDING, self, self)
	use_camera_accel.on_menu_move = {
		down = "effect_quality",
		up = "use_headbob"
	}
	slot16 = use_camera_accel
	self._toggle_menu_camera_accel = self._root_panel.toggle_button(RaidGuiBase.PADDING, self._root_panel)
	local effect_quality = {
		name = "effect_quality",
		value_format = "%02d%%"
	}
	slot19 = "menu_options_video_effect_quality"
	effect_quality.description = utf8.to_upper(managers.localization.text("on_click_camera_accel", managers.localization))
	effect_quality.x = start_x
	effect_quality.y = use_camera_accel.y + RaidGuiBase.PADDING
	effect_quality.on_value_change_callback = callback(RaidGuiBase.PADDING, self, self)
	effect_quality.on_menu_move = {
		down = "progress_bar_menu_brightness",
		up = "use_camera_accel"
	}
	slot17 = effect_quality
	self._progress_bar_menu_effect_quality = self._root_panel.slider(RaidGuiBase.PADDING, self._root_panel)
	local progress_bar_menu_brightness_params = {
		name = "progress_bar_menu_brightness",
		value = 0,
		value_format = "%02d%%"
	}
	slot20 = "menu_options_video_brightness"
	progress_bar_menu_brightness_params.description = utf8.to_upper(managers.localization.text("on_value_change_effect_quality", managers.localization))
	progress_bar_menu_brightness_params.x = start_x
	progress_bar_menu_brightness_params.y = effect_quality.y + RaidGuiBase.PADDING
	progress_bar_menu_brightness_params.on_value_change_callback = callback(RaidGuiBase.PADDING, self, self)
	progress_bar_menu_brightness_params.on_menu_move = {
		up = "effect_quality"
	}
	slot18 = progress_bar_menu_brightness_params
	self._progress_bar_menu_brightness = self._root_panel.slider(RaidGuiBase.PADDING, self._root_panel)
	slot18 = self._progress_bar_menu_brightness

	table.insert(RaidGuiBase.PADDING, self._fullscreen_only_controls)

	local default_video_params = {
		name = "default_video",
		y = 832,
		x = 1472
	}
	slot21 = "menu_options_controls_default"
	default_video_params.text = utf8.to_upper(managers.localization.text("on_value_change_brightness", managers.localization))
	slot20 = "on_click_default_video"
	default_video_params.on_click_callback = callback(self._fullscreen_only_controls, self, self)
	default_video_params.layer = RaidGuiBase.FOREGROUND_LAYER
	slot19 = default_video_params
	self._default_video_button = self._root_panel.long_secondary_button(self._fullscreen_only_controls, self._root_panel)
	slot18 = managers.raid_menu

	if managers.raid_menu.is_pc_controller(self._fullscreen_only_controls) then
		slot18 = self._default_video_button

		self._default_video_button.show(slot17)
	else
		slot18 = self._default_video_button

		self._default_video_button.hide(slot17)
	end

	return 
end

function gcd(a, b)
	if b == 0 then
		return a
	end

	slot5 = a % b

	return gcd(slot3, b)
end

RaidMenuOptionsVideo.data_source_stepper_menu_resolution = function (self)
	local temp_resolutions = {}
	slot4 = RenderSettings.modes

	for _, res in ipairs(slot3) do
		slot10 = res

		table.insert(slot8, temp_resolutions)
	end

	table.sort(slot3)

	local resolutions = {}
	slot5 = temp_resolutions

	for _, resolution in ipairs(temp_resolutions) do
		slot12 = resolutions

		self._add_distinct_resolution(slot9, self, resolution)
	end

	local result = {}
	slot6 = resolutions

	for _, resolution in ipairs(slot5) do
		slot12 = {
			text = resolution.x .. " x " .. resolution.y,
			value = resolution,
			info = resolution.x .. " x " .. resolution.y
		}

		table.insert(slot10, result)
	end

	return result
end
RaidMenuOptionsVideo.data_source_stepper_menu_window_mode = function (self)
	local result = {}
	slot5 = {
		value = "WINDOWED",
		text = utf8.to_upper(managers.localization.text(slot9, managers.localization)),
		info = utf8.to_upper(managers.localization.text(slot9, managers.localization))
	}
	slot11 = "menu_windowed"
	slot11 = "menu_windowed"

	table.insert(slot3, result)

	slot5 = {
		value = "WINDOWED_FULLSCREEN",
		selected = true,
		text = utf8.to_upper(managers.localization.text(slot9, managers.localization)),
		info = utf8.to_upper(managers.localization.text(slot9, managers.localization))
	}
	slot11 = "menu_windowed_fullscreen"
	slot11 = "menu_windowed_fullscreen"

	table.insert(slot3, result)

	slot5 = {
		value = "FULLSCREEN",
		text = utf8.to_upper(managers.localization.text(slot9, managers.localization)),
		info = utf8.to_upper(managers.localization.text(slot9, managers.localization))
	}
	slot11 = "menu_fullscreen"
	slot11 = "menu_fullscreen"

	table.insert(slot3, result)

	return result
end
RaidMenuOptionsVideo.on_item_selected_options_video_advanced_button = function (self)
	return 
end
RaidMenuOptionsVideo.on_item_selected_stepper_menu_resolution = function (self)
	slot4 = true

	self._stepper_menu_refresh_rate.refresh_data(slot2, self._stepper_menu_refresh_rate)

	slot3 = self

	self._setup_control_visibility(slot2)

	return 
end
RaidMenuOptionsVideo._add_distinct_resolution = function (self, res, resolutions)
	if #resolutions == 0 then
		slot6 = {
			x = res.x,
			y = res.y
		}

		table.insert(slot4, resolutions)
	else
		local last_added_resolution = resolutions[#resolutions]

		if last_added_resolution.x ~= res.x or last_added_resolution.y ~= res.y then
			slot7 = {
				x = res.x,
				y = res.y
			}

			table.insert(slot5, resolutions)
		end
	end

	return 
end
RaidMenuOptionsVideo._get_refresh_rates_for_resolution = function (self, resolution)
	local temp_resolutions = {}
	slot5 = RenderSettings.modes

	for _, res in ipairs(slot4) do
		slot11 = res

		table.insert(slot9, temp_resolutions)
	end

	table.sort(slot4)

	local result = {}
	slot6 = temp_resolutions

	for _, res in ipairs(temp_resolutions) do
		if res.x == resolution.x and res.y == resolution.y then
			slot12 = {
				text = res.z .. " Hz",
				value = res.z,
				info = res.z .. " Hz"
			}

			table.insert(slot10, result)
		end
	end

	return result
end
RaidMenuOptionsVideo.data_source_stepper_menu_refresh_rate = function (self)
	local current_resolution = self._stepper_menu_resolution.get_value(slot2)
	slot5 = current_resolution

	return self._get_refresh_rates_for_resolution(self._stepper_menu_resolution, self)
end
RaidMenuOptionsVideo.on_item_selected_refresh_rate = function (self)
	return 
end
RaidMenuOptionsVideo.on_click_apply_resolution_refresh_rate = function (self)
	local selected_resolution = self._stepper_menu_resolution.get_value(slot2)
	local selected_refresh_rate = self._stepper_menu_refresh_rate.get_value(self._stepper_menu_resolution)
	slot7 = selected_refresh_rate
	local resolution = Vector3(self._stepper_menu_refresh_rate, selected_resolution.x, selected_resolution.y)
	slot6 = managers.menu
	slot7 = resolution

	managers.menu.active_menu(selected_resolution.x).callback_handler.change_resolution_raid(selected_resolution.x, managers.menu.active_menu(selected_resolution.x).callback_handler)

	return 
end
RaidMenuOptionsVideo.on_value_change_effect_quality = function (self)
	local effect_quality = self._progress_bar_menu_effect_quality.get_value(slot2) / 100
	slot4 = managers.menu
	slot5 = effect_quality

	managers.menu.active_menu(self._progress_bar_menu_effect_quality).callback_handler.set_effect_quality_raid(self._progress_bar_menu_effect_quality, managers.menu.active_menu(self._progress_bar_menu_effect_quality).callback_handler)

	return 
end
RaidMenuOptionsVideo.on_value_change_brightness = function (self)
	local brightness = self._progress_bar_menu_brightness.get_value(slot2) / 100 + 0.5
	slot4 = managers.menu
	slot5 = brightness

	managers.menu.active_menu(self._progress_bar_menu_brightness).callback_handler.set_brightness_raid(self._progress_bar_menu_brightness, managers.menu.active_menu(self._progress_bar_menu_brightness).callback_handler)

	return 
end
RaidMenuOptionsVideo.on_item_selected_window_mode = function (self)
	slot3 = self._stepper_menu_window_mode
	local mode = self._stepper_menu_window_mode.get_value(slot2)

	if mode == "WINDOWED" then
		slot8 = managers.viewport
		slot7 = false
		slot10 = managers.viewport

		self.set_fullscreen(slot3, self, false, managers.viewport.is_fullscreen(slot7), managers.viewport.is_borderless(slot9))
	elseif mode == "WINDOWED_FULLSCREEN" then
		slot8 = managers.viewport
		slot7 = true
		slot10 = managers.viewport

		self.set_fullscreen(slot3, self, false, managers.viewport.is_fullscreen(slot7), managers.viewport.is_borderless(slot9))
	else
		slot8 = managers.viewport
		slot7 = false
		slot10 = managers.viewport

		self.set_fullscreen(slot3, self, true, managers.viewport.is_fullscreen(slot7), managers.viewport.is_borderless(slot9))
	end

	slot4 = self

	self._setup_control_visibility(slot3)

	return 
end
RaidMenuOptionsVideo.set_fullscreen = function (self, fullscreen, is_fullscreen, borderless, is_borderless)
	slot7 = managers.menu
	slot11 = is_borderless
	slot16 = "fullscreen_toggled_callback"

	managers.menu.active_menu(slot6).callback_handler.toggle_fullscreen_raid(slot6, managers.menu.active_menu(slot6).callback_handler, fullscreen, is_fullscreen, borderless, callback(slot13, self, self))

	slot7 = self

	self.on_value_change_brightness(slot6)

	if borderless then
		local res = Application.monitor_resolution(slot6)
		slot10 = true

		self._stepper_menu_resolution.set_value_and_render(Application, self._stepper_menu_resolution, {
			x = res.x,
			y = res.y,
			is_equal = function (self, check_x_y)
				if check_x_y.x == self.x and check_x_y.y == self.y then
					return true
				else
					return false
				end

				return 
			end
		})
	end

	return 
end
RaidMenuOptionsVideo.on_click_default_video = function (self)
	slot5 = "callback_default_video"
	local callback_function = callback(slot2, self, self)
	local params = {}
	slot6 = "dialog_reset_video_title"
	params.title = managers.localization.text(self, managers.localization)
	slot6 = "dialog_reset_video_message"
	params.message = managers.localization.text(self, managers.localization)
	params.callback = function ()
		slot2 = managers.user

		managers.user.reset_video_setting_map(slot1)

		slot2 = self

		self._load_video_values(slot1)
		callback_function()

		return 
	end
	slot6 = params

	managers.menu.show_option_dialog(self, managers.menu)

	return 
end
RaidMenuOptionsVideo._get_default_resolution = function (self)
	local default_resolution = Vector3(slot2, tweak_data.gui.base_resolution.x, tweak_data.gui.base_resolution.y)
	slot4 = self
	local supported_resolutions = self.data_source_stepper_menu_resolution(tweak_data.gui.base_resolution.x)
	local resolution = supported_resolutions[1]
	slot6 = supported_resolutions

	for _, res in ipairs(tweak_data.gui.base_resolution.z) do
		if res.value.x < default_resolution.x or (res.value.x == default_resolution.x and res.value.y == default_resolution.y) then
			slot12 = {
				x = res.value.x,
				y = res.value.y
			}
			local refresh_rates = self._get_refresh_rates_for_resolution(slot10, self)
			slot14 = refresh_rates[#refresh_rates].value
			resolution = Vector3(self, res.value.x, res.value.y)
		end
	end

	return resolution
end
RaidMenuOptionsVideo.callback_default_video = function (self)
	slot3 = managers.menu
	slot3 = managers.menu.active_menu(slot2).callback_handler

	managers.menu.active_menu(slot2).callback_handler.set_fullscreen_default_raid_no_dialog(slot2)

	local resolution = self._get_default_resolution(slot2)
	slot4 = managers.menu
	slot5 = resolution

	managers.menu.active_menu(self).callback_handler.set_resolution_default_raid_no_dialog(self, managers.menu.active_menu(self).callback_handler)

	slot4 = managers.menu
	slot4 = managers.menu.active_menu(self).callback_handler

	managers.menu.active_menu(self).callback_handler._refresh_brightness(self)

	slot5 = {
		x = resolution.x,
		y = resolution.y,
		is_equal = function (self, check_x_y)
			if check_x_y.x == self.x and check_x_y.y == self.y then
				return true
			else
				return false
			end

			return 
		end
	}

	self._stepper_menu_resolution.set_value_and_render(self, self._stepper_menu_resolution)

	slot5 = resolution.z

	self._stepper_menu_refresh_rate.set_value_and_render(self, self._stepper_menu_refresh_rate)

	slot5 = "FULLSCREEN"

	self._stepper_menu_window_mode.set_value_and_render(self, self._stepper_menu_window_mode)

	slot4 = self

	self._setup_control_visibility(self)

	return 
end
RaidMenuOptionsVideo.fullscreen_toggled_callback = function (self)
	slot3 = self

	self._reload_video_and_adv_video_options(slot2)

	slot3 = self

	self._setup_control_visibility(slot2)

	return 
end
RaidMenuOptionsVideo._setup_control_visibility = function (self)
	slot3 = self._stepper_menu_window_mode
	local is_fullscreen = self._stepper_menu_window_mode.get_value(slot2) == "FULLSCREEN"
	slot4 = self._stepper_menu_window_mode
	local is_borderless = self._stepper_menu_window_mode.get_value(slot3) == "WINDOWED_FULLSCREEN"
	slot5 = self._fullscreen_only_controls

	for _, control in ipairs(slot4) do
		slot11 = is_fullscreen

		control.set_enabled(slot9, control)
	end

	slot6 = not is_borderless

	self._stepper_menu_resolution.set_enabled(slot4, self._stepper_menu_resolution)

	slot6 = not is_borderless

	self._button_apply_video_resolution.set_enabled(slot4, self._button_apply_video_resolution)

	if not is_fullscreen and not is_borderless then
		self._btn_advanced_options._on_menu_move.down = "stepper_menu_resolution"
		self._stepper_menu_resolution._on_menu_move.down = "window_mode"
		self._stepper_menu_window_mode._on_menu_move.up = "stepper_menu_resolution"
		self._progress_bar_menu_effect_quality._on_menu_move.down = nil
	elseif is_borderless then
		self._btn_advanced_options._on_menu_move.down = "window_mode"
		self._stepper_menu_window_mode._on_menu_move.up = "btn_advanced_options"
		self._progress_bar_menu_effect_quality._on_menu_move.down = nil
	else
		self._btn_advanced_options._on_menu_move.down = "stepper_menu_resolution"
		self._stepper_menu_resolution._on_menu_move.down = "stepper_menu_refresh_rate"
		self._stepper_menu_window_mode._on_menu_move.up = "stepper_menu_refresh_rate"
		self._progress_bar_menu_effect_quality._on_menu_move.down = "progress_bar_menu_brightness"
	end

	return 
end
RaidMenuOptionsVideo._reload_video_and_adv_video_options = function (self)
	slot3 = self

	self._load_video_values(slot2)

	return 
end
RaidMenuOptionsVideo._load_video_values = function (self)
	local resolution = RenderSettings.resolution
	local is_fullscreen = managers.viewport.is_fullscreen(slot3)
	local is_borderless = managers.viewport.is_borderless(managers.viewport)
	slot7 = "subtitle"
	local subtitle = managers.user.get_setting(managers.viewport, managers.user)
	slot8 = "hit_indicator"
	local hit_indicator = managers.user.get_setting(managers.user, managers.user)
	slot9 = "objective_reminder"
	local objective_reminder = managers.user.get_setting(managers.user, managers.user)
	slot10 = "use_headbob"
	local use_headbob = managers.user.get_setting(managers.user, managers.user)
	slot11 = "use_camera_accel"
	local use_camera_accel = managers.user.get_setting(managers.user, managers.user)
	slot12 = "effect_quality"
	local effect_quality = managers.user.get_setting(managers.user, managers.user)
	slot13 = "brightness"
	local brightness = managers.user.get_setting(managers.user, managers.user)
	slot15 = true

	self._stepper_menu_refresh_rate.set_value_and_render(managers.user, self._stepper_menu_refresh_rate, resolution.z)

	if is_borderless then
		local monitor_res = Application.monitor_resolution(slot12)
		slot15 = monitor_res.y
		slot18 = self._stepper_menu_refresh_rate
		resolution = Vector3(Application, monitor_res.x, self._stepper_menu_refresh_rate.get_value(slot17))
	end

	slot15 = true

	self._stepper_menu_resolution.set_value_and_render(slot12, self._stepper_menu_resolution, {
		x = resolution.x,
		y = resolution.y,
		is_equal = function (self, check_x_y)
			if check_x_y.x == self.x and check_x_y.y == self.y then
				return true
			else
				return false
			end

			return 
		end
	})

	if is_fullscreen then
		slot15 = true

		self._stepper_menu_window_mode.set_value_and_render(slot12, self._stepper_menu_window_mode, "FULLSCREEN")
	elseif is_borderless then
		slot15 = true

		self._stepper_menu_window_mode.set_value_and_render(slot12, self._stepper_menu_window_mode, "WINDOWED_FULLSCREEN")
	else
		slot15 = true

		self._stepper_menu_window_mode.set_value_and_render(slot12, self._stepper_menu_window_mode, "WINDOWED")
	end

	slot14 = subtitle

	self._toggle_menu_subtitle.set_value_and_render(slot12, self._toggle_menu_subtitle)

	slot14 = hit_indicator

	self._toggle_menu_hit_indicator.set_value_and_render(slot12, self._toggle_menu_hit_indicator)

	slot14 = use_headbob

	self._toggle_menu_headbob.set_value_and_render(slot12, self._toggle_menu_headbob)

	slot14 = use_camera_accel

	self._toggle_menu_camera_accel.set_value_and_render(slot12, self._toggle_menu_camera_accel)

	slot14 = effect_quality * 100

	self._progress_bar_menu_effect_quality.set_value(slot12, self._progress_bar_menu_effect_quality)

	slot14 = (brightness - 0.5) * 100

	self._progress_bar_menu_brightness.set_value(slot12, self._progress_bar_menu_brightness)

	return 
end
RaidMenuOptionsVideo._save_video_values = function (self)
	slot3 = self

	self.on_click_subtitle(slot2)

	slot3 = self

	self.on_click_hit_indicator(slot2)

	slot3 = self

	self.on_click_headbob(slot2)

	slot3 = self

	self.on_click_camera_accel(slot2)

	slot3 = self

	self.on_value_change_brightness(slot2)

	return 
end
RaidMenuOptionsVideo.on_click_subtitle = function (self)
	local subtitle = self._toggle_menu_subtitle.get_value(slot2)
	slot4 = managers.menu
	slot5 = subtitle

	managers.menu.active_menu(self._toggle_menu_subtitle).callback_handler.toggle_subtitle_raid(self._toggle_menu_subtitle, managers.menu.active_menu(self._toggle_menu_subtitle).callback_handler)

	return 
end
RaidMenuOptionsVideo.on_click_hit_indicator = function (self)
	local hit_indicator = self._toggle_menu_hit_indicator.get_value(slot2)
	slot4 = managers.menu
	slot5 = hit_indicator

	managers.menu.active_menu(self._toggle_menu_hit_indicator).callback_handler.toggle_hit_indicator_raid(self._toggle_menu_hit_indicator, managers.menu.active_menu(self._toggle_menu_hit_indicator).callback_handler)

	return 
end
RaidMenuOptionsVideo.on_click_headbob = function (self)
	local use_headbob = self._toggle_menu_headbob.get_value(slot2)
	slot4 = managers.menu
	slot5 = use_headbob

	managers.menu.active_menu(self._toggle_menu_headbob).callback_handler.toggle_headbob_raid(self._toggle_menu_headbob, managers.menu.active_menu(self._toggle_menu_headbob).callback_handler)

	return 
end
RaidMenuOptionsVideo.on_click_camera_accel = function (self)
	local use_camera_accel = self._toggle_menu_camera_accel.get_value(slot2)
	slot6 = use_camera_accel

	managers.user.set_setting(self._toggle_menu_camera_accel, managers.user, "use_camera_accel")

	return 
end
RaidMenuOptionsVideo.on_click_options_video_advanced_button = function (self)
	slot4 = "raid_menu_options_video_advanced"

	managers.raid_menu.open_menu(slot2, managers.raid_menu)

	return 
end
RaidMenuOptionsVideo.bind_controller_inputs = function (self)
	local bindings = {}
	slot5 = "menu_controller_face_left"
	slot7 = "on_click_default_video"
	bindings[1] = {
		key = Idstring(slot4),
		callback = callback(slot4, self, self)
	}
	slot5 = "menu_controller_face_top"
	slot7 = "on_click_apply_resolution_refresh_rate"
	bindings[2] = {
		key = Idstring(slot4),
		callback = callback(slot4, self, self)
	}

	self.set_controller_bindings(callback(slot4, self, self), self, bindings)

	local legend = {
		controller = {
			"menu_legend_back",
			"menu_legend_options_video_resolution",
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
RaidMenuOptionsVideo._apply_video_resolution = function (self)
	slot4 = "RaidMenuOptionsVideo:_apply_vidoe_resolution"

	Application.trace(slot2, Application)

	slot3 = self

	self.on_click_apply_resolution_refresh_rate(slot2)

	return true, nil
end

return 
