if not RaidMenuOptionsNetwork then
	slot2 = RaidGuiBase
	slot0 = class(slot1)
end

RaidMenuOptionsNetwork = slot0
function RaidMenuOptionsNetwork:init(ws, fullscreen_ws, node, component_name)
	slot11 = component_name

	RaidMenuOptionsNetwork.super.init(slot6, self, ws, fullscreen_ws, node)

	return 
end
function RaidMenuOptionsNetwork:_set_initial_data()
	slot5 = "menu_header_options_network_subtitle"

	self._node.components.raid_menu_header.set_screen_name(slot2, self._node.components.raid_menu_header, "menu_header_options_main_screen_name")

	return 
end
function RaidMenuOptionsNetwork:_layout()
	slot3 = self

	RaidMenuOptionsNetwork.super._layout(slot2)

	slot3 = self

	self._layout_network(slot2)

	slot3 = self

	self._load_network_values(slot2)

	slot4 = true

	self._toggle_menu_packet_throttling.set_selected(slot2, self._toggle_menu_packet_throttling)

	slot3 = self

	self.bind_controller_inputs(slot2)

	return 
end
function RaidMenuOptionsNetwork:close()
	slot3 = self

	self._save_network_values(slot2)

	Global.savefile_manager.setting_changed = true
	slot4 = true

	managers.savefile.save_setting(true, managers.savefile)

	slot3 = self

	RaidMenuOptionsNetwork.super.close(true)

	return 
end
function RaidMenuOptionsNetwork:_layout_network()
	local start_x = 0
	local start_y = 320
	local default_width = 512
	local packet_throttling_params = {
		name = "packet_throttling_params"
	}
	slot10 = "menu_packet_throttling"
	packet_throttling_params.description = utf8.to_upper(managers.localization.text(slot8, managers.localization))
	packet_throttling_params.x = start_x
	packet_throttling_params.y = start_y
	packet_throttling_params.w = default_width
	packet_throttling_params.on_click_callback = callback(slot6, self, self)
	packet_throttling_params.on_menu_move = {
		down = "push_to_talk"
	}
	slot8 = packet_throttling_params
	self._toggle_menu_packet_throttling = self._root_panel.toggle_button(slot6, self._root_panel)
	local forwarding_params = {
		name = "push_to_talk"
	}
	slot11 = "menu_net_forwarding"
	forwarding_params.description = utf8.to_upper(managers.localization.text("on_click_toggle_packet_throttling", managers.localization))
	forwarding_params.x = start_x
	forwarding_params.y = packet_throttling_params.y + RaidGuiBase.PADDING
	forwarding_params.w = default_width
	forwarding_params.on_click_callback = callback(RaidGuiBase.PADDING, self, self)
	forwarding_params.on_menu_move = {
		down = "use_compression",
		up = "packet_throttling_params"
	}
	slot9 = forwarding_params
	self._toggle_menu_net_forwarding = self._root_panel.toggle_button(RaidGuiBase.PADDING, self._root_panel)
	local use_compression_params = {
		name = "use_compression"
	}
	slot12 = "menu_net_use_compression"
	use_compression_params.description = utf8.to_upper(managers.localization.text("on_click_toggle_net_forwarding", managers.localization))
	use_compression_params.x = start_x
	use_compression_params.y = forwarding_params.y + RaidGuiBase.PADDING
	use_compression_params.w = default_width
	slot11 = "on_click_toggle_net_use_compression"
	use_compression_params.on_click_callback = callback(RaidGuiBase.PADDING, self, self)
	use_compression_params.on_menu_move = {
		up = "push_to_talk"
	}
	slot10 = use_compression_params
	self._toggle_menu_net_use_compression = self._root_panel.toggle_button(RaidGuiBase.PADDING, self._root_panel)

	return 
end
function RaidMenuOptionsNetwork:_load_network_values()
	slot4 = "net_packet_throttling"
	local net_packet_throttling = managers.user.get_setting(slot2, managers.user)
	slot5 = "net_forwarding"
	local net_forwarding = managers.user.get_setting(managers.user, managers.user)
	slot6 = "net_use_compression"
	local net_use_compression = managers.user.get_setting(managers.user, managers.user)
	slot7 = net_packet_throttling

	self._toggle_menu_packet_throttling.set_value_and_render(managers.user, self._toggle_menu_packet_throttling)

	slot7 = net_forwarding

	self._toggle_menu_net_forwarding.set_value_and_render(managers.user, self._toggle_menu_net_forwarding)

	slot7 = net_use_compression

	self._toggle_menu_net_use_compression.set_value_and_render(managers.user, self._toggle_menu_net_use_compression)

	return 
end
function RaidMenuOptionsNetwork:_save_network_values()
	slot3 = self

	self.on_click_toggle_packet_throttling(slot2)

	slot3 = self

	self.on_click_toggle_net_forwarding(slot2)

	slot3 = self

	self.on_click_toggle_net_use_compression(slot2)

	return 
end
function RaidMenuOptionsNetwork:on_click_toggle_packet_throttling()
	local net_packet_throttling = self._toggle_menu_packet_throttling.get_value(slot2)
	slot4 = managers.menu
	slot5 = net_packet_throttling

	managers.menu.active_menu(self._toggle_menu_packet_throttling).callback_handler.toggle_net_throttling_raid(self._toggle_menu_packet_throttling, managers.menu.active_menu(self._toggle_menu_packet_throttling).callback_handler)

	return 
end
function RaidMenuOptionsNetwork:on_click_toggle_net_forwarding()
	local net_forwarding = self._toggle_menu_net_forwarding.get_value(slot2)
	slot4 = managers.menu
	slot5 = net_forwarding

	managers.menu.active_menu(self._toggle_menu_net_forwarding).callback_handler.toggle_net_forwarding_raid(self._toggle_menu_net_forwarding, managers.menu.active_menu(self._toggle_menu_net_forwarding).callback_handler)

	return 
end
function RaidMenuOptionsNetwork:on_click_toggle_net_use_compression()
	local net_use_compression = self._toggle_menu_net_use_compression.get_value(slot2)
	slot4 = managers.menu
	slot5 = net_use_compression

	managers.menu.active_menu(self._toggle_menu_net_use_compression).callback_handler.toggle_net_use_compression_raid(self._toggle_menu_net_use_compression, managers.menu.active_menu(self._toggle_menu_net_use_compression).callback_handler)

	return 
end
function RaidMenuOptionsNetwork:on_click_default_network()
	slot3 = managers.menu
	slot4 = self._node.components.raid_options

	managers.menu.active_menu(slot2).callback_handler.set_default_network_options_raid(slot2, managers.menu.active_menu(slot2).callback_handler)

	return 
end
function RaidMenuOptionsNetwork:bind_controller_inputs()
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
