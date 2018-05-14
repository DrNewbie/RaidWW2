if not RaidMenuLeftOptions then
	slot2 = RaidGuiBase
	slot0 = class(slot1)
end

RaidMenuLeftOptions = slot0
function RaidMenuLeftOptions:init(ws, fullscreen_ws, node, component_name)
	slot11 = component_name

	RaidMenuLeftOptions.super.init(slot6, self, ws, fullscreen_ws, node)

	slot8 = false

	managers.menu.mark_main_menu(slot6, managers.menu)

	return 
end
function RaidMenuLeftOptions:_set_initial_data()
	slot5 = "menu_header_options_main_screen_subtitle"

	self._node.components.raid_menu_header.set_screen_name(slot2, self._node.components.raid_menu_header, "menu_header_options_main_screen_name")

	return 
end
function RaidMenuLeftOptions:_layout()
	slot3 = self

	RaidMenuLeftOptions.super._layout(slot2)

	slot3 = self

	self._layout_list_menu(slot2)

	slot3 = RaidMenuCallbackHandler

	if RaidMenuCallbackHandler.is_in_main_menu(slot2) then
		slot3 = self

		self.bind_controller_inputs_reset_progress(slot2)
	else
		slot3 = self

		self.bind_controller_inputs(slot2)
	end

	return 
end
function RaidMenuLeftOptions:close()
	slot3 = self

	RaidMenuLeftOptions.super.close(slot2)

	return 
end
function RaidMenuLeftOptions:_layout_list_menu()
	local list_menu_options_params = {
		selection_enabled = true,
		name = "list_menu_options",
		h = 640,
		w = 480,
		loop_items = true,
		y = 144,
		x = 0
	}
	slot6 = "_on_list_menu_options_item_selected"
	list_menu_options_params.on_item_clicked_callback = callback(slot3, self, self)
	list_menu_options_params.data_source_callback = callback(slot3, self, self)
	slot5 = list_menu_options_params
	self.list_menu_options = self._root_panel.list(slot3, self._root_panel)
	slot5 = true

	self.list_menu_options.set_selected(slot3, self.list_menu_options)

	local default_video_params = {
		name = "default_video",
		y = 832,
		x = 1472
	}
	slot8 = "menu_option_default"
	default_video_params.text = utf8.to_upper(managers.localization.text("_list_menu_options_data_source", managers.localization))
	slot8 = {
		callback = "menu_options_on_click_default"
	}
	default_video_params.on_click_callback = callback(self.list_menu_options, self, self, "_on_list_menu_options_item_selected")
	default_video_params.layer = RaidGuiBase.FOREGROUND_LAYER
	slot6 = default_video_params
	self._default_video_button = self._root_panel.long_secondary_button(self.list_menu_options, self._root_panel)
	local reset_progress_params = {
		name = "reset_progress",
		y = 768,
		x = 1472
	}
	slot9 = "menu_clear_progress"
	reset_progress_params.text = utf8.to_upper(managers.localization.text("_on_list_menu_options_item_selected", managers.localization))
	slot9 = {
		callback = "menu_options_on_click_reset_progress"
	}
	reset_progress_params.on_click_callback = callback(self._root_panel, self, self, "_on_list_menu_options_item_selected")
	reset_progress_params.layer = RaidGuiBase.FOREGROUND_LAYER
	slot7 = reset_progress_params
	self._reset_progress_button = self._root_panel.long_secondary_button(self._root_panel, self._root_panel)
	slot6 = self._reset_progress_button
	slot9 = RaidMenuCallbackHandler

	self._reset_progress_button.set_visible(self._root_panel, RaidMenuCallbackHandler.is_in_main_menu("_on_list_menu_options_item_selected"))

	return 
end
function RaidMenuLeftOptions:_list_menu_options_data_source()
	local _list_items = {}
	slot5 = {
		callback = "menu_options_on_click_controls",
		text = utf8.to_upper(managers.localization.text(slot9, managers.localization))
	}
	slot11 = "menu_controls"

	table.insert(slot3, _list_items)

	slot5 = {
		callback = "menu_options_on_click_video",
		text = utf8.to_upper(managers.localization.text(slot9, managers.localization))
	}
	slot11 = "menu_video"

	table.insert(slot3, _list_items)

	slot5 = {
		callback = "menu_options_on_click_sound",
		text = utf8.to_upper(managers.localization.text(slot9, managers.localization))
	}
	slot11 = "menu_sound"

	table.insert(slot3, _list_items)

	slot5 = {
		callback = "menu_options_on_click_network",
		text = utf8.to_upper(managers.localization.text(slot9, managers.localization))
	}
	slot11 = "menu_network"

	table.insert(slot3, _list_items)

	return _list_items
end
function RaidMenuLeftOptions:_on_list_menu_options_item_selected(data)
	if not data.callback then
		return 
	end

	if not self._callback_handler then
		slot4 = RaidMenuCallbackHandler
		slot2 = RaidMenuCallbackHandler.new(slot3)
	end

	self._callback_handler = slot2
	slot6 = data.callback
	local on_click_callback = callback(slot3, self._callback_handler, self._callback_handler)

	if on_click_callback then
		on_click_callback()
	end

	return 
end
function RaidMenuLeftOptions:bind_controller_inputs()
	local bindings = {}
	slot5 = "menu_controller_face_top"
	slot8 = {
		callback = "menu_options_on_click_default"
	}
	bindings[1] = {
		key = Idstring(slot4),
		callback = callback(slot4, self, self, "_on_list_menu_options_item_selected")
	}

	self.set_controller_bindings(callback(slot4, self, self, "_on_list_menu_options_item_selected"), self, bindings)

	local legend = {
		controller = {
			"menu_legend_back",
			"menu_legend_default_options"
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
function RaidMenuLeftOptions:bind_controller_inputs_reset_progress()
	local bindings = {}
	slot5 = "menu_controller_face_left"
	slot8 = {
		callback = "menu_options_on_click_reset_progress"
	}
	bindings[1] = {
		key = Idstring(slot4),
		callback = callback(slot4, self, self, "_on_list_menu_options_item_selected")
	}
	slot5 = "menu_controller_face_top"
	slot8 = {
		callback = "menu_options_on_click_default"
	}
	bindings[2] = {
		key = Idstring(slot4),
		callback = callback(slot4, self, self, "_on_list_menu_options_item_selected")
	}

	self.set_controller_bindings(callback(slot4, self, self, "_on_list_menu_options_item_selected"), self, bindings)

	local legend = {
		controller = {
			"menu_legend_back",
			"menu_legend_clear_progress",
			"menu_legend_default_options"
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
