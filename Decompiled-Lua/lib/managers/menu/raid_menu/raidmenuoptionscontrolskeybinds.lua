if not RaidMenuOptionsControlsKeybinds then
	slot2 = RaidGuiBase
	slot0 = class(slot1)
end

RaidMenuOptionsControlsKeybinds = slot0
RaidMenuOptionsControlsKeybinds.init = function (self, ws, fullscreen_ws, node, component_name)
	slot11 = component_name

	RaidMenuOptionsControlsKeybinds.super.init(slot6, self, ws, fullscreen_ws, node)

	slot7 = managers.raid_menu
	slot12 = "_on_escape_callback"

	managers.raid_menu.register_on_escape_callback(slot6, callback(fullscreen_ws, self, self))

	return 
end
RaidMenuOptionsControlsKeybinds._set_initial_data = function (self)
	slot5 = "menu_header_options_controls_keybinds_subtitle"

	self._node.components.raid_menu_header.set_screen_name(slot2, self._node.components.raid_menu_header, "menu_header_options_main_screen_name")

	self._controller_category = "normal"
	self._keybind_controls_table = {}

	return 
end
RaidMenuOptionsControlsKeybinds._layout = function (self)
	slot3 = self

	RaidMenuOptionsControlsKeybinds.super._layout(slot2)

	slot4 = {
		name = "keybind_panel",
		x = 0,
		y = 0
	}
	self._keybind_panel = self._root_panel.panel(slot2, self._root_panel)
	slot4 = {
		tab_align = "center",
		name = "tabs_keybind_types",
		tab_width = 160,
		initial_tab_idx = 1,
		tab_height = 64,
		y = 96,
		dont_trigger_special_buttons = true,
		x = 0,
		on_click_callback = callback(slot6, self, self),
		tabs_params = {
			{
				name = "tab_on_foot",
				callback_param = "normal",
				text = self.translate(self, self, "menu_options_binding_type_on_foot")
			},
			{
				name = "tab_in_vehicle",
				callback_param = "vehicle",
				text = self.translate(self, self, "menu_options_binding_type_in_vehicle")
			}
		}
	}
	slot9 = "on_click_tabs_keybind_types"
	slot11 = true
	slot11 = true
	self._rarity_filters_tabs = self._root_panel.tabs(slot2, self._root_panel)
	local default_controls_keybinds_params = {
		name = "default_controls_keybinds",
		y = 832,
		x = 1472
	}
	slot7 = "menu_options_controls_default"
	default_controls_keybinds_params.text = utf8.to_upper(managers.localization.text(, managers.localization))
	slot6 = "on_click_default_controls_keybinds"
	default_controls_keybinds_params.on_click_callback = callback(self._root_panel, self, self)
	default_controls_keybinds_params.layer = RaidGuiBase.FOREGROUND_LAYER
	slot5 = default_controls_keybinds_params
	self._default_controls_button = self._root_panel.long_secondary_button(self._root_panel, self._root_panel)
	slot4 = self

	self._layout_controls_keybinds(self._root_panel)

	slot4 = self

	self.bind_controller_inputs(self._root_panel)

	return 
end
RaidMenuOptionsControlsKeybinds.on_click_tabs_keybind_types = function (self, controller_category)
	self._controller_category = controller_category
	slot4 = self._keybind_panel

	self._keybind_panel.clear(slot3)

	slot4 = self

	self._layout_controls_keybinds(slot3)

	return 
end
RaidMenuOptionsControlsKeybinds._on_escape_callback = function (self)
	local result = false
	slot4 = self._keybind_controls_table

	for _, control in ipairs(slot3) do
		slot9 = control
		local control_result = control.is_listening_to_input(slot8)

		if control_result then
			result = true
		end
	end

	return result
end
RaidMenuOptionsControlsKeybinds.close = function (self)
	slot3 = self

	self._save_controls_keybinds_values(slot2)

	Global.savefile_manager.setting_changed = true
	slot4 = true

	managers.savefile.save_setting(true, managers.savefile)

	slot4 = nil

	managers.raid_menu.register_on_escape_callback(true, managers.raid_menu)

	slot3 = self

	RaidMenuOptionsControlsKeybinds.super.close(true)

	return 
end
RaidMenuOptionsControlsKeybinds._save_controls_keybinds_values = function (self)
	return 
end
RaidMenuOptionsControlsKeybinds._layout_controls_keybinds = function (self)
	self._keybind_controls_table = {}
	slot3 = managers.controller
	local default_controller_type = managers.controller.get_default_wrapper_type(slot2)

	if default_controller_type ~= "pc" then
		return 
	end

	self._keybinds = {}
	local keybind_types = {
		"movement",
		"usage",
		"communication"
	}
	slot5 = keybind_types

	for _, keybind_type in ipairs(slot4) do
		slot11 = keybind_type

		self._keybinds_per_type(slot9, self)
	end

	local keybind_controls = {}
	local start_x = 0
	local start_y = 224
	local keybind_width = 512
	local column_padding = 608
	local column_title_y = start_y - 32
	slot11 = keybind_types

	for type_no, keybind_type in ipairs(slot10) do
		start_x = (type_no - 1) * column_padding
		slot17 = {
			align = "left",
			name = "column_title" .. keybind_type,
			x = start_x,
			y = column_title_y,
			text = utf8.to_upper(managers.localization.text(slot21, managers.localization)),
			color = RaidGuiControlKeyBind.TEXT_COLOR_NORMAL,
			font = tweak_data.gui.fonts.din_compressed,
			font_size = tweak_data.gui.font_sizes.small
		}
		slot23 = "menu_options_controls_edit_keybinds_" .. keybind_type

		self._keybind_panel.text(slot15, self._keybind_panel)

		slot16 = self._keybinds[keybind_type]

		for row, keybind_params in ipairs(slot15) do
			slot22 = {
				keybind_w = 120,
				name = "keybind_" .. keybind_params.button,
				x = start_x,
				y = start_y + row * RaidGuiBase.PADDING,
				w = keybind_width,
				h = MenuManager.MENU_ITEM_HEIGHT,
				text = utf8.to_upper(keybind_params.button),
				ws = self._ws,
				keybind_params = keybind_params
			}
			slot25 = keybind_params.button
			local keybind_control = self._keybind_panel.keybind(slot20, self._keybind_panel)
			slot23 = keybind_control

			table.insert(self._keybind_panel, self._keybind_controls_table)
		end
	end

	return 
end
RaidMenuOptionsControlsKeybinds.controls_info_by_category = function (category, keybind_type)
	local t = {}
	slot5 = MenuCustomizeControllerCreator.CONTROLS

	for _, name in ipairs(slot4) do
		if MenuCustomizeControllerCreator.CONTROLS_INFO[name].category == category and MenuCustomizeControllerCreator.CONTROLS_INFO[name].type == keybind_type then
			slot11 = name

			table.insert(slot9, t)
		end
	end

	return t
end
RaidMenuOptionsControlsKeybinds._keybinds_per_type = function (self, keybind_type)
	local controller_category = self._controller_category
	self._keybinds[keybind_type] = {}
	slot5 = managers.controller
	slot8 = managers.controller
	slot5 = managers.controller.get_settings(, managers.controller.get_default_wrapper_type(slot7))
	local connections = managers.controller.get_settings(, managers.controller.get_default_wrapper_type(slot7)).get_connection_map()
	slot9 = keybind_type

	for _, name in ipairs(self.controls_info_by_category(slot7, controller_category)) do
		local name_id = name
		local connection = connections[name]

		if connection._btn_connections then
			local ordered = MenuCustomizeControllerCreator.AXIS_ORDERED[name]
			slot14 = ordered

			for _, btn_name in ipairs(slot13) do
				local btn_connection = connection._btn_connections[btn_name]

				if btn_connection then
					local name_id = name
					local params = {
						localize = "false",
						name = btn_name,
						connection_name = name
					}
					slot25 = MenuCustomizeControllerCreator.CONTROLS_INFO[btn_name].text_id
					params.text_id = utf8.to_upper(managers.localization.text(slot23, managers.localization))
					params.binding = btn_connection.name
					params.axis = connection._name
					params.button = btn_name
					slot23 = params

					table.insert(slot21, self._keybinds[keybind_type])
				end
			end
		else
			local params = {
				localize = "false",
				name = name_id,
				connection_name = name
			}
			slot17 = MenuCustomizeControllerCreator.CONTROLS_INFO[name].text_id
			params.text_id = utf8.to_upper(managers.localization.text(slot15, managers.localization))
			slot14 = connection
			params.binding = connection.get_input_name_list(slot13)[1]
			params.button = name
			slot15 = params

			table.insert(slot13, self._keybinds[keybind_type])
		end
	end

	return 
end
RaidMenuOptionsControlsKeybinds.on_click_default_controls_keybinds = function (self)
	local params = {}
	slot5 = "dialog_reset_controls_keybinds_title"
	params.title = managers.localization.text(slot3, managers.localization)
	slot5 = "dialog_reset_controls_keybinds_message"
	params.message = managers.localization.text(slot3, managers.localization)
	params.callback = function ()
		slot3 = "settings/controller_settings"

		managers.controller.load_settings(slot1, managers.controller)

		slot4 = MenuCustomizeControllerCreator.CONTROLS_INFO

		managers.controller.clear_user_mod(slot1, managers.controller, "all")

		slot2 = self

		self.refresh_keybinds(slot1)

		return 
	end
	slot5 = params

	managers.menu.show_option_dialog(slot3, managers.menu)

	return 
end
RaidMenuOptionsControlsKeybinds.refresh_keybinds = function (self)
	slot3 = self._keybind_panel

	self._keybind_panel.clear(slot2)

	slot3 = self

	self._layout_controls_keybinds(slot2)

	return 
end
RaidMenuOptionsControlsKeybinds.bind_controller_inputs = function (self)
	local legend = {
		controller = {
			"menu_legend_back"
		}
	}
	slot9 = nil
	legend.keyboard = {
		{
			key = "footer_back",
			callback = callback(slot5, self, self, "_on_legend_pc_back")
		}
	}
	slot5 = legend

	self.set_legend(, self)

	return 
end

return 
