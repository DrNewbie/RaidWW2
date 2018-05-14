if not RaidMenuOptionsControls then
	slot2 = RaidGuiBase
	slot0 = class(slot1)
end

RaidMenuOptionsControls = slot0
RaidMenuOptionsControls.init = function (self, ws, fullscreen_ws, node, component_name)
	slot11 = component_name

	RaidMenuOptionsControls.super.init(slot6, self, ws, fullscreen_ws, node)

	return 
end
RaidMenuOptionsControls._set_initial_data = function (self)
	slot5 = "menu_header_options_controls_subtitle"

	self._node.components.raid_menu_header.set_screen_name(slot2, self._node.components.raid_menu_header, "menu_header_options_main_screen_name")

	return 
end
RaidMenuOptionsControls._layout = function (self)
	slot3 = self

	RaidMenuOptionsControls.super._layout(slot2)

	slot3 = self

	self._layout_controls(slot2)

	slot3 = self

	self._load_controls_values(slot2)

	slot4 = true

	self._progress_bar_menu_camera_sensitivity_horizontal.set_selected(slot2, self._progress_bar_menu_camera_sensitivity_horizontal)

	slot3 = self

	self.bind_controller_inputs(slot2)

	return 
end
RaidMenuOptionsControls.close = function (self)
	slot3 = self

	self._save_controls_values(slot2)

	Global.savefile_manager.setting_changed = true
	slot4 = true

	managers.savefile.save_setting(true, managers.savefile)

	slot3 = self

	RaidMenuOptionsControls.super.close(true)

	return 
end
RaidMenuOptionsControls._layout_controls = function (self)
	local start_x = 0
	local start_y = 320
	local default_width = 512
	RaidMenuOptionsControls.SLIDER_PADDING = RaidGuiBase.PADDING + 24
	local btn_keybinding_params = {
		name = "btn_keybinding",
		x = start_x,
		y = start_y - 128,
		w = default_width
	}
	slot10 = "menu_options_controls_keybinds_button"
	btn_keybinding_params.text = utf8.to_upper(managers.localization.text(slot8, managers.localization))
	btn_keybinding_params.on_click_callback = callback(slot6, self, self)
	btn_keybinding_params.on_menu_move = {
		down = "slider_look_sensitivity_horizontal"
	}
	slot8 = btn_keybinding_params
	self._btn_keybinding = self._root_panel.long_tertiary_button(slot6, self._root_panel)
	local look_sensitivity_horizontal_params = {
		name = "slider_look_sensitivity_horizontal",
		value_format = "%02d%%"
	}
	slot11 = "menu_options_controls_look_sensitivity_horizontal"
	look_sensitivity_horizontal_params.description = utf8.to_upper(managers.localization.text("on_click_options_controls_keybinds_button", managers.localization))
	look_sensitivity_horizontal_params.x = start_x
	look_sensitivity_horizontal_params.y = start_y
	look_sensitivity_horizontal_params.on_value_change_callback = callback(self._root_panel, self, self)
	look_sensitivity_horizontal_params.on_menu_move = {
		down = "slider_look_sensitivity_vertical",
		up = "btn_keybinding"
	}
	slot9 = look_sensitivity_horizontal_params
	self._progress_bar_menu_camera_sensitivity_horizontal = self._root_panel.slider(self._root_panel, self._root_panel)
	local look_sensitivity_vertical_params = {
		name = "slider_look_sensitivity_vertical",
		value_format = "%02d%%"
	}
	slot12 = "menu_options_controls_look_sensitivity_vertical"
	look_sensitivity_vertical_params.description = utf8.to_upper(managers.localization.text("on_value_change_camera_sensitivity_horizontal", managers.localization))
	look_sensitivity_vertical_params.x = start_x
	look_sensitivity_vertical_params.y = look_sensitivity_horizontal_params.y + ((self._progress_bar_menu_camera_sensitivity_horizontal._double_height and RaidMenuOptionsControls.SLIDER_PADDING) or RaidGuiBase.PADDING)
	look_sensitivity_vertical_params.on_value_change_callback = callback((self._progress_bar_menu_camera_sensitivity_horizontal._double_height and RaidMenuOptionsControls.SLIDER_PADDING) or RaidGuiBase.PADDING, self, self)
	look_sensitivity_vertical_params.on_menu_move = {
		down = "slider_aiming_sensitivity_horizontal",
		up = "slider_look_sensitivity_horizontal"
	}
	slot10 = look_sensitivity_vertical_params
	self._progress_bar_menu_camera_sensitivity_vertical = self._root_panel.slider((self._progress_bar_menu_camera_sensitivity_horizontal._double_height and RaidMenuOptionsControls.SLIDER_PADDING) or RaidGuiBase.PADDING, self._root_panel)
	local aiming_sensitivity_horizontal_params = {
		name = "slider_aiming_sensitivity_horizontal",
		value_format = "%02d%%"
	}
	slot13 = "menu_options_controls_aiming_sensitivity_horizontal"
	aiming_sensitivity_horizontal_params.description = utf8.to_upper(managers.localization.text("on_value_change_camera_sensitivity_vertical", managers.localization))
	aiming_sensitivity_horizontal_params.x = start_x
	aiming_sensitivity_horizontal_params.y = look_sensitivity_vertical_params.y + ((self._progress_bar_menu_camera_sensitivity_vertical._double_height and RaidMenuOptionsControls.SLIDER_PADDING) or RaidGuiBase.PADDING)
	aiming_sensitivity_horizontal_params.on_value_change_callback = callback((self._progress_bar_menu_camera_sensitivity_vertical._double_height and RaidMenuOptionsControls.SLIDER_PADDING) or RaidGuiBase.PADDING, self, self)
	aiming_sensitivity_horizontal_params.on_menu_move = {
		down = "slider_aiming_sensitivity_vertical",
		up = "slider_look_sensitivity_vertical"
	}
	slot11 = aiming_sensitivity_horizontal_params
	self._progress_bar_menu_camera_zoom_sensitivity_horizontal = self._root_panel.slider((self._progress_bar_menu_camera_sensitivity_vertical._double_height and RaidMenuOptionsControls.SLIDER_PADDING) or RaidGuiBase.PADDING, self._root_panel)
	local aiming_sensitivity_vertical_params = {
		name = "slider_aiming_sensitivity_vertical",
		value_format = "%02d%%"
	}
	slot14 = "menu_options_controls_aiming_sensitivity_vertical"
	aiming_sensitivity_vertical_params.description = utf8.to_upper(managers.localization.text("on_value_change_camera_zoom_sensitivity_horizontal", managers.localization))
	aiming_sensitivity_vertical_params.x = start_x
	aiming_sensitivity_vertical_params.y = aiming_sensitivity_horizontal_params.y + ((self._progress_bar_menu_camera_zoom_sensitivity_horizontal._double_height and RaidMenuOptionsControls.SLIDER_PADDING) or RaidGuiBase.PADDING)
	aiming_sensitivity_vertical_params.on_value_change_callback = callback((self._progress_bar_menu_camera_zoom_sensitivity_horizontal._double_height and RaidMenuOptionsControls.SLIDER_PADDING) or RaidGuiBase.PADDING, self, self)
	aiming_sensitivity_vertical_params.on_menu_move = {
		down = "separate_aiming_settings",
		up = "slider_aiming_sensitivity_horizontal"
	}
	slot12 = aiming_sensitivity_vertical_params
	self._progress_bar_menu_camera_zoom_sensitivity_vertical = self._root_panel.slider((self._progress_bar_menu_camera_zoom_sensitivity_horizontal._double_height and RaidMenuOptionsControls.SLIDER_PADDING) or RaidGuiBase.PADDING, self._root_panel)
	local separate_aiming_settings = {
		name = "separate_aiming_settings"
	}
	slot15 = "menu_options_separate_aiming_settings"
	separate_aiming_settings.description = utf8.to_upper(managers.localization.text("on_value_change_camera_zoom_sensitivity_vertical", managers.localization))
	separate_aiming_settings.x = start_x
	separate_aiming_settings.y = aiming_sensitivity_vertical_params.y + ((self._progress_bar_menu_camera_zoom_sensitivity_vertical._double_height and RaidMenuOptionsControls.SLIDER_PADDING) or RaidGuiBase.PADDING)
	separate_aiming_settings.w = default_width
	separate_aiming_settings.on_click_callback = callback((self._progress_bar_menu_camera_zoom_sensitivity_vertical._double_height and RaidMenuOptionsControls.SLIDER_PADDING) or RaidGuiBase.PADDING, self, self)
	separate_aiming_settings.on_menu_move = {
		down = "inverted_y_axis",
		up = "slider_aiming_sensitivity_vertical"
	}
	slot13 = separate_aiming_settings
	self._toggle_menu_toggle_zoom_sensitivity = self._root_panel.toggle_button((self._progress_bar_menu_camera_zoom_sensitivity_vertical._double_height and RaidMenuOptionsControls.SLIDER_PADDING) or RaidGuiBase.PADDING, self._root_panel)
	local inverted_y_axis = {
		name = "inverted_y_axis"
	}
	slot16 = "menu_options_inverted_y_axis"
	inverted_y_axis.description = utf8.to_upper(managers.localization.text("on_click_toggle_zoom_sensitivity", managers.localization))
	inverted_y_axis.x = start_x
	inverted_y_axis.y = separate_aiming_settings.y + RaidGuiBase.PADDING
	inverted_y_axis.w = default_width
	inverted_y_axis.on_click_callback = callback(RaidGuiBase.PADDING, self, self)
	inverted_y_axis.on_menu_move = {
		down = "hold_to_aim",
		up = "separate_aiming_settings"
	}
	slot14 = inverted_y_axis
	self._toggle_menu_invert_camera_vertically = self._root_panel.toggle_button(RaidGuiBase.PADDING, self._root_panel)
	local hold_to_aim = {
		name = "hold_to_aim"
	}
	slot17 = "menu_options_hold_to_aim"
	hold_to_aim.description = utf8.to_upper(managers.localization.text("on_click_toggle_invert_camera_vertically", managers.localization))
	hold_to_aim.x = start_x
	hold_to_aim.y = inverted_y_axis.y + RaidGuiBase.PADDING
	hold_to_aim.w = default_width
	hold_to_aim.on_click_callback = callback(RaidGuiBase.PADDING, self, self)
	hold_to_aim.on_menu_move = {
		down = "hold_to_run",
		up = "inverted_y_axis"
	}
	slot15 = hold_to_aim
	self._toggle_menu_hold_to_steelsight = self._root_panel.toggle_button(RaidGuiBase.PADDING, self._root_panel)
	local hold_to_run = {
		name = "hold_to_run"
	}
	slot18 = "menu_options_hold_to_run"
	hold_to_run.description = utf8.to_upper(managers.localization.text("on_click_toggle_hold_to_steelsight", managers.localization))
	hold_to_run.x = start_x
	hold_to_run.y = hold_to_aim.y + RaidGuiBase.PADDING
	hold_to_run.w = default_width
	hold_to_run.on_click_callback = callback(RaidGuiBase.PADDING, self, self)
	hold_to_run.on_menu_move = {
		down = "hold_to_crouch",
		up = "hold_to_aim"
	}
	slot16 = hold_to_run
	self._toggle_menu_hold_to_run = self._root_panel.toggle_button(RaidGuiBase.PADDING, self._root_panel)
	local hold_to_crouch = {
		name = "hold_to_crouch"
	}
	slot19 = "menu_options_hold_to_crouch"
	hold_to_crouch.description = utf8.to_upper(managers.localization.text("on_click_toggle_hold_to_run", managers.localization))
	hold_to_crouch.x = start_x
	hold_to_crouch.y = hold_to_run.y + RaidGuiBase.PADDING
	hold_to_crouch.w = default_width
	hold_to_crouch.on_click_callback = callback(RaidGuiBase.PADDING, self, self)
	hold_to_crouch.on_menu_move = {
		down = "controller_vibration",
		up = "hold_to_run"
	}
	slot17 = hold_to_crouch
	self._toggle_menu_hold_to_duck = self._root_panel.toggle_button(RaidGuiBase.PADDING, self._root_panel)
	local controller_vibration_params = {
		name = "controller_vibration"
	}
	slot20 = "menu_options_controller_vibration"
	controller_vibration_params.description = utf8.to_upper(managers.localization.text("on_click_toggle_hold_to_duck", managers.localization))
	controller_vibration_params.x = start_x
	controller_vibration_params.y = hold_to_crouch.y + RaidGuiBase.PADDING
	controller_vibration_params.w = default_width
	controller_vibration_params.on_click_callback = callback(RaidGuiBase.PADDING, self, self)
	controller_vibration_params.on_menu_move = {
		down = "controller_aim_assist",
		up = "hold_to_crouch"
	}
	slot18 = controller_vibration_params
	self._toggle_menu_controller_vibration = self._root_panel.toggle_button(RaidGuiBase.PADDING, self._root_panel)
	local controller_aim_assist_params = {
		name = "controller_aim_assist"
	}
	slot21 = "menu_options_controller_aim_assist"
	controller_aim_assist_params.description = utf8.to_upper(managers.localization.text("on_click_toggle_controller_vibration", managers.localization))
	controller_aim_assist_params.x = start_x
	controller_aim_assist_params.y = controller_vibration_params.y + RaidGuiBase.PADDING
	controller_aim_assist_params.w = default_width
	controller_aim_assist_params.on_click_callback = callback(RaidGuiBase.PADDING, self, self)
	controller_aim_assist_params.on_menu_move = {
		down = "controller_southpaw",
		up = "controller_vibration"
	}
	slot19 = controller_aim_assist_params
	self._toggle_menu_controller_aim_assist = self._root_panel.toggle_button(RaidGuiBase.PADDING, self._root_panel)
	local controller_southpaw_params = {
		name = "controller_southpaw"
	}
	slot22 = "menu_options_controller_southpaw"
	controller_southpaw_params.description = utf8.to_upper(managers.localization.text("on_click_toggle_controller_aim_assist", managers.localization))
	controller_southpaw_params.x = start_x
	controller_southpaw_params.y = controller_aim_assist_params.y + RaidGuiBase.PADDING
	controller_southpaw_params.w = default_width
	controller_southpaw_params.on_click_callback = callback(RaidGuiBase.PADDING, self, self)
	controller_southpaw_params.on_menu_move = {
		down = "controller_sticky_aim",
		up = "controller_aim_assist"
	}
	slot20 = controller_southpaw_params
	self._toggle_menu_controller_southpaw = self._root_panel.toggle_button(RaidGuiBase.PADDING, self._root_panel)
	local controller_sticky_aim_params = {
		name = "controller_sticky_aim"
	}
	slot23 = "menu_options_controller_sticky_aim"
	controller_sticky_aim_params.description = utf8.to_upper(managers.localization.text("on_click_toggle_controller_southpaw", managers.localization))
	controller_sticky_aim_params.x = start_x
	controller_sticky_aim_params.y = controller_southpaw_params.y + RaidGuiBase.PADDING
	controller_sticky_aim_params.w = default_width
	controller_sticky_aim_params.on_click_callback = callback(RaidGuiBase.PADDING, self, self)
	controller_sticky_aim_params.on_menu_move = {
		up = "controller_southpaw"
	}
	slot21 = controller_sticky_aim_params
	self._toggle_menu_controller_sticky_aim = self._root_panel.toggle_button(RaidGuiBase.PADDING, self._root_panel)
	local default_controls_params = {
		name = "default_controls",
		y = 832,
		x = 1472
	}
	slot24 = "menu_options_controls_default"
	default_controls_params.text = utf8.to_upper(managers.localization.text("on_click_toggle_controller_sticky_aim", managers.localization))
	slot23 = "on_click_default_controls"
	default_controls_params.on_click_callback = callback(self._root_panel, self, self)
	default_controls_params.layer = RaidGuiBase.FOREGROUND_LAYER
	slot22 = default_controls_params
	self._default_controls_button = self._root_panel.long_secondary_button(self._root_panel, self._root_panel)
	slot21 = self

	self._modify_controller_layout(self._root_panel)

	slot21 = managers.raid_menu

	if managers.raid_menu.is_pc_controller(self._root_panel) then
		slot21 = self._default_controls_button

		self._default_controls_button.show(slot20)
	else
		slot21 = self._default_controls_button

		self._default_controls_button.hide(slot20)
	end

	return 
end
RaidMenuOptionsControls._modify_controller_layout = function (self)
	slot3 = managers.raid_menu

	if managers.raid_menu.is_pc_controller(slot2) then
		slot3 = self._toggle_menu_controller_vibration

		self._toggle_menu_controller_vibration.hide(slot2)

		slot3 = self._toggle_menu_controller_aim_assist

		self._toggle_menu_controller_aim_assist.hide(slot2)

		slot3 = self._toggle_menu_controller_southpaw

		self._toggle_menu_controller_southpaw.hide(slot2)

		slot3 = self._toggle_menu_controller_sticky_aim

		self._toggle_menu_controller_sticky_aim.hide(slot2)
	else
		slot3 = self._toggle_menu_controller_vibration

		self._toggle_menu_controller_vibration.show(slot2)

		slot3 = self._toggle_menu_controller_aim_assist

		self._toggle_menu_controller_aim_assist.show(slot2)

		slot3 = self._toggle_menu_controller_southpaw

		self._toggle_menu_controller_southpaw.show(slot2)

		slot3 = self._toggle_menu_controller_sticky_aim

		self._toggle_menu_controller_sticky_aim.show(slot2)

		slot3 = self._btn_keybinding
		slot8 = true

		self._btn_keybinding.set_text(slot2, self.translate(slot5, self, "menu_options_controls_controller_mapping"))
	end

	return 
end
RaidMenuOptionsControls.on_click_toggle_controller_vibration = function (self)
	local value = self._toggle_menu_controller_vibration.get_value(slot2)
	slot4 = managers.menu
	slot5 = value

	managers.menu.active_menu(self._toggle_menu_controller_vibration).callback_handler.toggle_rumble(self._toggle_menu_controller_vibration, managers.menu.active_menu(self._toggle_menu_controller_vibration).callback_handler)

	return 
end
RaidMenuOptionsControls.on_click_toggle_controller_aim_assist = function (self)
	local value = self._toggle_menu_controller_aim_assist.get_value(slot2)
	slot4 = managers.menu
	slot5 = value

	managers.menu.active_menu(self._toggle_menu_controller_aim_assist).callback_handler.toggle_aim_assist(self._toggle_menu_controller_aim_assist, managers.menu.active_menu(self._toggle_menu_controller_aim_assist).callback_handler)

	return 
end
RaidMenuOptionsControls.on_click_toggle_controller_sticky_aim = function (self, item)
	local value = self._toggle_menu_controller_sticky_aim.get_value(slot3)
	slot5 = managers.menu
	slot6 = value

	managers.menu.active_menu(self._toggle_menu_controller_sticky_aim).callback_handler.toggle_sticky_aim(self._toggle_menu_controller_sticky_aim, managers.menu.active_menu(self._toggle_menu_controller_sticky_aim).callback_handler)

	return 
end
RaidMenuOptionsControls.on_click_toggle_controller_southpaw = function (self)
	local value = self._toggle_menu_controller_southpaw.get_value(slot2)
	slot4 = managers.menu
	slot5 = value

	managers.menu.active_menu(self._toggle_menu_controller_southpaw).callback_handler.toggle_southpaw(self._toggle_menu_controller_southpaw, managers.menu.active_menu(self._toggle_menu_controller_southpaw).callback_handler)

	return 
end
RaidMenuOptionsControls.on_click_options_controls_keybinds_button = function (self)
	slot3 = managers.raid_menu

	if managers.raid_menu.is_pc_controller(slot2) then
		slot4 = "raid_menu_options_controls_keybinds"

		managers.raid_menu.open_menu(slot2, managers.raid_menu)
	else
		slot4 = "raid_menu_options_controller_mapping"

		managers.raid_menu.open_menu(slot2, managers.raid_menu)
	end

	return 
end
RaidMenuOptionsControls.on_value_change_camera_sensitivity_horizontal = function (self)
	slot5 = self._progress_bar_menu_camera_sensitivity_horizontal
	slot5 = 100
	local camera_sensitivity_percentage = math.clamp(slot2, self._progress_bar_menu_camera_sensitivity_horizontal.get_value(slot4), 0)
	slot4 = self._toggle_menu_toggle_zoom_sensitivity
	local enable_camera_zoom_sensitivity = self._toggle_menu_toggle_zoom_sensitivity.get_value(self._progress_bar_menu_camera_sensitivity_horizontal.get_value(slot4))
	local camera_sensitivity = camera_sensitivity_percentage / 100 * (tweak_data.player.camera.MAX_SENSITIVITY - tweak_data.player.camera.MIN_SENSITIVITY) + tweak_data.player.camera.MIN_SENSITIVITY
	slot6 = managers.menu
	slot7 = camera_sensitivity

	managers.menu.active_menu(tweak_data.player.camera.MIN_SENSITIVITY).callback_handler.set_camera_sensitivity_x_raid(tweak_data.player.camera.MIN_SENSITIVITY, managers.menu.active_menu(tweak_data.player.camera.MIN_SENSITIVITY).callback_handler)

	if not enable_camera_zoom_sensitivity then
		slot7 = camera_sensitivity_percentage

		self._progress_bar_menu_camera_sensitivity_vertical.set_value(slot5, self._progress_bar_menu_camera_sensitivity_vertical)

		slot7 = camera_sensitivity_percentage

		self._progress_bar_menu_camera_zoom_sensitivity_horizontal.set_value(slot5, self._progress_bar_menu_camera_zoom_sensitivity_horizontal)

		slot7 = camera_sensitivity_percentage

		self._progress_bar_menu_camera_zoom_sensitivity_vertical.set_value(slot5, self._progress_bar_menu_camera_zoom_sensitivity_vertical)
	end

	return 
end
RaidMenuOptionsControls.on_value_change_camera_sensitivity_vertical = function (self)
	slot5 = self._progress_bar_menu_camera_sensitivity_vertical
	slot5 = 100
	local camera_sensitivity_percentage = math.clamp(slot2, self._progress_bar_menu_camera_sensitivity_vertical.get_value(slot4), 0)
	slot4 = self._toggle_menu_toggle_zoom_sensitivity
	local enable_camera_zoom_sensitivity = self._toggle_menu_toggle_zoom_sensitivity.get_value(self._progress_bar_menu_camera_sensitivity_vertical.get_value(slot4))
	local camera_sensitivity = camera_sensitivity_percentage / 100 * (tweak_data.player.camera.MAX_SENSITIVITY - tweak_data.player.camera.MIN_SENSITIVITY) + tweak_data.player.camera.MIN_SENSITIVITY
	slot6 = managers.menu
	slot7 = camera_sensitivity

	managers.menu.active_menu(tweak_data.player.camera.MIN_SENSITIVITY).callback_handler.set_camera_sensitivity_y_raid(tweak_data.player.camera.MIN_SENSITIVITY, managers.menu.active_menu(tweak_data.player.camera.MIN_SENSITIVITY).callback_handler)

	if not enable_camera_zoom_sensitivity then
		slot7 = camera_sensitivity_percentage

		self._progress_bar_menu_camera_sensitivity_horizontal.set_value(slot5, self._progress_bar_menu_camera_sensitivity_horizontal)

		slot7 = camera_sensitivity_percentage

		self._progress_bar_menu_camera_zoom_sensitivity_horizontal.set_value(slot5, self._progress_bar_menu_camera_zoom_sensitivity_horizontal)

		slot7 = camera_sensitivity_percentage

		self._progress_bar_menu_camera_zoom_sensitivity_vertical.set_value(slot5, self._progress_bar_menu_camera_zoom_sensitivity_vertical)
	end

	return 
end
RaidMenuOptionsControls.on_value_change_camera_zoom_sensitivity_horizontal = function (self)
	slot5 = self._progress_bar_menu_camera_zoom_sensitivity_horizontal
	slot5 = 100
	local camera_zoom_sensitivity_percentage = math.clamp(slot2, self._progress_bar_menu_camera_zoom_sensitivity_horizontal.get_value(slot4), 0)
	slot4 = self._toggle_menu_toggle_zoom_sensitivity
	local enable_camera_zoom_sensitivity = self._toggle_menu_toggle_zoom_sensitivity.get_value(self._progress_bar_menu_camera_zoom_sensitivity_horizontal.get_value(slot4))
	local camera_zoom_sensitivity = camera_zoom_sensitivity_percentage / 100 * (tweak_data.player.camera.MAX_SENSITIVITY - tweak_data.player.camera.MIN_SENSITIVITY) + tweak_data.player.camera.MIN_SENSITIVITY
	slot6 = managers.menu
	slot7 = camera_zoom_sensitivity

	managers.menu.active_menu(tweak_data.player.camera.MIN_SENSITIVITY).callback_handler.set_camera_zoom_sensitivity_x_raid(tweak_data.player.camera.MIN_SENSITIVITY, managers.menu.active_menu(tweak_data.player.camera.MIN_SENSITIVITY).callback_handler)

	if not enable_camera_zoom_sensitivity then
		slot7 = camera_zoom_sensitivity_percentage

		self._progress_bar_menu_camera_sensitivity_horizontal.set_value(slot5, self._progress_bar_menu_camera_sensitivity_horizontal)

		slot7 = camera_zoom_sensitivity_percentage

		self._progress_bar_menu_camera_sensitivity_vertical.set_value(slot5, self._progress_bar_menu_camera_sensitivity_vertical)

		slot7 = camera_zoom_sensitivity_percentage

		self._progress_bar_menu_camera_zoom_sensitivity_vertical.set_value(slot5, self._progress_bar_menu_camera_zoom_sensitivity_vertical)
	end

	return 
end
RaidMenuOptionsControls.on_value_change_camera_zoom_sensitivity_vertical = function (self)
	slot5 = self._progress_bar_menu_camera_zoom_sensitivity_vertical
	slot5 = 100
	local camera_zoom_sensitivity_percentage = math.clamp(slot2, self._progress_bar_menu_camera_zoom_sensitivity_vertical.get_value(slot4), 0)
	slot4 = self._toggle_menu_toggle_zoom_sensitivity
	local enable_camera_zoom_sensitivity = self._toggle_menu_toggle_zoom_sensitivity.get_value(self._progress_bar_menu_camera_zoom_sensitivity_vertical.get_value(slot4))
	local camera_zoom_sensitivity = camera_zoom_sensitivity_percentage / 100 * (tweak_data.player.camera.MAX_SENSITIVITY - tweak_data.player.camera.MIN_SENSITIVITY) + tweak_data.player.camera.MIN_SENSITIVITY
	slot6 = managers.menu
	slot7 = camera_zoom_sensitivity

	managers.menu.active_menu(tweak_data.player.camera.MIN_SENSITIVITY).callback_handler.set_camera_zoom_sensitivity_y_raid(tweak_data.player.camera.MIN_SENSITIVITY, managers.menu.active_menu(tweak_data.player.camera.MIN_SENSITIVITY).callback_handler)

	if not enable_camera_zoom_sensitivity then
		slot7 = camera_zoom_sensitivity_percentage

		self._progress_bar_menu_camera_sensitivity_horizontal.set_value(slot5, self._progress_bar_menu_camera_sensitivity_horizontal)

		slot7 = camera_zoom_sensitivity_percentage

		self._progress_bar_menu_camera_sensitivity_vertical.set_value(slot5, self._progress_bar_menu_camera_sensitivity_vertical)

		slot7 = camera_zoom_sensitivity_percentage

		self._progress_bar_menu_camera_zoom_sensitivity_horizontal.set_value(slot5, self._progress_bar_menu_camera_zoom_sensitivity_horizontal)
	end

	return 
end
RaidMenuOptionsControls.on_click_toggle_zoom_sensitivity = function (self)
	local enable_camera_zoom_sensitivity = self._toggle_menu_toggle_zoom_sensitivity.get_value(slot2)
	slot4 = managers.menu
	slot5 = enable_camera_zoom_sensitivity

	managers.menu.active_menu(self._toggle_menu_toggle_zoom_sensitivity).callback_handler.toggle_zoom_sensitivity_raid(self._toggle_menu_toggle_zoom_sensitivity, managers.menu.active_menu(self._toggle_menu_toggle_zoom_sensitivity).callback_handler)

	return 
end
RaidMenuOptionsControls.on_click_toggle_invert_camera_vertically = function (self)
	local invert_camera_y = self._toggle_menu_invert_camera_vertically.get_value(slot2)
	slot4 = managers.menu
	slot5 = invert_camera_y

	managers.menu.active_menu(self._toggle_menu_invert_camera_vertically).callback_handler.invert_camera_vertically_raid(self._toggle_menu_invert_camera_vertically, managers.menu.active_menu(self._toggle_menu_invert_camera_vertically).callback_handler)

	return 
end
RaidMenuOptionsControls.on_click_toggle_hold_to_steelsight = function (self)
	local hold_to_steelsight = self._toggle_menu_hold_to_steelsight.get_value(slot2)
	slot4 = managers.menu
	slot5 = hold_to_steelsight

	managers.menu.active_menu(self._toggle_menu_hold_to_steelsight).callback_handler.hold_to_steelsight_raid(self._toggle_menu_hold_to_steelsight, managers.menu.active_menu(self._toggle_menu_hold_to_steelsight).callback_handler)

	return 
end
RaidMenuOptionsControls.on_click_toggle_hold_to_run = function (self)
	local hold_to_run = self._toggle_menu_hold_to_run.get_value(slot2)
	slot4 = managers.menu
	slot5 = hold_to_run

	managers.menu.active_menu(self._toggle_menu_hold_to_run).callback_handler.hold_to_run_raid(self._toggle_menu_hold_to_run, managers.menu.active_menu(self._toggle_menu_hold_to_run).callback_handler)

	return 
end
RaidMenuOptionsControls.on_click_toggle_hold_to_duck = function (self)
	local hold_to_duck = self._toggle_menu_hold_to_duck.get_value(slot2)
	slot4 = managers.menu
	slot5 = hold_to_duck

	managers.menu.active_menu(self._toggle_menu_hold_to_duck).callback_handler.hold_to_duck_raid(self._toggle_menu_hold_to_duck, managers.menu.active_menu(self._toggle_menu_hold_to_duck).callback_handler)

	return 
end
RaidMenuOptionsControls.on_click_default_controls = function (self)
	local params = {}
	slot5 = "dialog_reset_controls_title"
	params.title = managers.localization.text(slot3, managers.localization)
	slot5 = "dialog_reset_controls_message"
	params.message = managers.localization.text(slot3, managers.localization)
	params.callback = function ()
		slot2 = managers.user

		managers.user.reset_controls_setting_map(slot1)

		slot2 = self

		self._load_controls_values(slot1)

		return 
	end
	slot5 = params

	managers.menu.show_option_dialog(slot3, managers.menu)

	return 
end
RaidMenuOptionsControls._load_controls_values = function (self)
	slot6 = "camera_sensitivity_x"
	local camera_sensitivity_x = math.clamp(slot2, managers.user.get_setting(slot4, managers.user), 0)
	slot7 = "camera_sensitivity_y"
	local camera_sensitivity_y = math.clamp(managers.user.get_setting(slot4, managers.user), managers.user.get_setting(100, managers.user), 0)
	slot8 = "camera_zoom_sensitivity_x"
	local camera_zoom_sensitivity_x = math.clamp(managers.user.get_setting(100, managers.user), managers.user.get_setting(100, managers.user), 0)
	slot9 = "camera_zoom_sensitivity_y"
	slot8 = 100
	local camera_zoom_sensitivity_y = math.clamp(managers.user.get_setting(100, managers.user), managers.user.get_setting(100, managers.user), 0)
	slot8 = "enable_camera_zoom_sensitivity"
	local enable_camera_zoom_sensitivity = managers.user.get_setting(managers.user.get_setting(100, managers.user), managers.user)
	slot9 = "invert_camera_y"
	local invert_camera_y = managers.user.get_setting(managers.user, managers.user)
	slot10 = "hold_to_steelsight"
	local hold_to_steelsight = managers.user.get_setting(managers.user, managers.user)
	slot11 = "hold_to_run"
	local hold_to_run = managers.user.get_setting(managers.user, managers.user)
	slot12 = "hold_to_duck"
	local hold_to_duck = managers.user.get_setting(managers.user, managers.user)
	slot13 = "rumble"
	local rumble = managers.user.get_setting(managers.user, managers.user)
	slot14 = "aim_assist"
	local aim_assist = managers.user.get_setting(managers.user, managers.user)
	slot15 = "southpaw"
	local southpaw = managers.user.get_setting(managers.user, managers.user)
	slot16 = "sticky_aim"
	local sticky_aim = managers.user.get_setting(managers.user, managers.user)
	local set_camera_sensitivity_x = (camera_sensitivity_x - tweak_data.player.camera.MIN_SENSITIVITY) / (tweak_data.player.camera.MAX_SENSITIVITY - tweak_data.player.camera.MIN_SENSITIVITY) * 100
	local set_camera_sensitivity_y = (camera_sensitivity_y - tweak_data.player.camera.MIN_SENSITIVITY) / (tweak_data.player.camera.MAX_SENSITIVITY - tweak_data.player.camera.MIN_SENSITIVITY) * 100
	slot19 = set_camera_sensitivity_x

	self._progress_bar_menu_camera_sensitivity_horizontal.set_value(tweak_data.player.camera.MIN_SENSITIVITY, self._progress_bar_menu_camera_sensitivity_horizontal)

	slot19 = set_camera_sensitivity_y

	self._progress_bar_menu_camera_sensitivity_vertical.set_value(tweak_data.player.camera.MIN_SENSITIVITY, self._progress_bar_menu_camera_sensitivity_vertical)

	local set_camera_zoom_sensitivity_x = (camera_zoom_sensitivity_x - tweak_data.player.camera.MIN_SENSITIVITY) / (tweak_data.player.camera.MAX_SENSITIVITY - tweak_data.player.camera.MIN_SENSITIVITY) * 100
	local set_camera_zoom_sensitivity_y = (camera_zoom_sensitivity_y - tweak_data.player.camera.MIN_SENSITIVITY) / (tweak_data.player.camera.MAX_SENSITIVITY - tweak_data.player.camera.MIN_SENSITIVITY) * 100
	slot21 = set_camera_zoom_sensitivity_x

	self._progress_bar_menu_camera_zoom_sensitivity_horizontal.set_value(tweak_data.player.camera.MIN_SENSITIVITY, self._progress_bar_menu_camera_zoom_sensitivity_horizontal)

	slot21 = set_camera_zoom_sensitivity_y

	self._progress_bar_menu_camera_zoom_sensitivity_vertical.set_value(tweak_data.player.camera.MIN_SENSITIVITY, self._progress_bar_menu_camera_zoom_sensitivity_vertical)

	slot21 = enable_camera_zoom_sensitivity

	self._toggle_menu_toggle_zoom_sensitivity.set_value_and_render(tweak_data.player.camera.MIN_SENSITIVITY, self._toggle_menu_toggle_zoom_sensitivity)

	slot21 = invert_camera_y

	self._toggle_menu_invert_camera_vertically.set_value_and_render(tweak_data.player.camera.MIN_SENSITIVITY, self._toggle_menu_invert_camera_vertically)

	slot21 = hold_to_steelsight

	self._toggle_menu_hold_to_steelsight.set_value_and_render(tweak_data.player.camera.MIN_SENSITIVITY, self._toggle_menu_hold_to_steelsight)

	slot21 = hold_to_run

	self._toggle_menu_hold_to_run.set_value_and_render(tweak_data.player.camera.MIN_SENSITIVITY, self._toggle_menu_hold_to_run)

	slot21 = hold_to_duck

	self._toggle_menu_hold_to_duck.set_value_and_render(tweak_data.player.camera.MIN_SENSITIVITY, self._toggle_menu_hold_to_duck)

	slot21 = rumble

	self._toggle_menu_controller_vibration.set_value_and_render(tweak_data.player.camera.MIN_SENSITIVITY, self._toggle_menu_controller_vibration)

	slot21 = aim_assist

	self._toggle_menu_controller_aim_assist.set_value_and_render(tweak_data.player.camera.MIN_SENSITIVITY, self._toggle_menu_controller_aim_assist)

	slot21 = southpaw

	self._toggle_menu_controller_southpaw.set_value_and_render(tweak_data.player.camera.MIN_SENSITIVITY, self._toggle_menu_controller_southpaw)

	slot21 = sticky_aim

	self._toggle_menu_controller_sticky_aim.set_value_and_render(tweak_data.player.camera.MIN_SENSITIVITY, self._toggle_menu_controller_sticky_aim)

	return 
end
RaidMenuOptionsControls._save_controls_values = function (self)
	slot3 = self

	self.on_value_change_camera_sensitivity_horizontal(slot2)

	slot3 = self

	self.on_value_change_camera_sensitivity_vertical(slot2)

	slot3 = self

	self.on_value_change_camera_zoom_sensitivity_horizontal(slot2)

	slot3 = self

	self.on_value_change_camera_zoom_sensitivity_vertical(slot2)

	slot3 = self

	self.on_click_toggle_zoom_sensitivity(slot2)

	slot3 = self

	self.on_click_toggle_invert_camera_vertically(slot2)

	slot3 = self

	self.on_click_toggle_hold_to_steelsight(slot2)

	slot3 = self

	self.on_click_toggle_hold_to_run(slot2)

	slot3 = self

	self.on_click_toggle_hold_to_duck(slot2)

	slot3 = self

	self.on_click_toggle_controller_vibration(slot2)

	slot3 = self

	self.on_click_toggle_controller_aim_assist(slot2)

	slot3 = self

	self.on_click_toggle_controller_southpaw(slot2)

	slot3 = self

	self.on_click_toggle_controller_sticky_aim(slot2)

	return 
end
RaidMenuOptionsControls.bind_controller_inputs = function (self)
	local bindings = {}
	slot5 = "menu_controller_face_left"
	slot7 = "on_click_default_controls"
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
