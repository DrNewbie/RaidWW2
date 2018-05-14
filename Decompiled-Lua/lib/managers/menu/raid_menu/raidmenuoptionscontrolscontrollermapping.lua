if not RaidMenuOptionsControlsControllerMapping then
	slot2 = RaidGuiBase
	slot0 = class(slot1)
end

RaidMenuOptionsControlsControllerMapping = slot0
function RaidMenuOptionsControlsControllerMapping:init(ws, fullscreen_ws, node, component_name)
	self._label_font = tweak_data.gui.fonts.din_compressed
	self._label_font_size = tweak_data.gui.font_sizes.size_24
	slot11 = component_name

	RaidMenuOptionsControlsControllerMapping.super.init(slot6, self, ws, fullscreen_ws, node)

	return 
end
function RaidMenuOptionsControlsControllerMapping:_set_initial_data()
	slot5 = "menu_header_options_controls_controller_mapping_on_foot"

	self._node.components.raid_menu_header.set_screen_name(slot2, self._node.components.raid_menu_header, "menu_header_options_main_screen_name")

	return 
end
function RaidMenuOptionsControlsControllerMapping:_layout()
	slot3 = self

	RaidMenuOptionsControlsControllerMapping.super._layout(slot2)

	slot4 = {
		texture = "ui/main_menu/textures/controller",
		name = "controller_image",
		h = 600,
		y = 0,
		w = 1200,
		x = 0
	}
	self._controller_image = self._root_panel.bitmap(slot2, self._root_panel)
	slot6 = self._root_panel
	slot4 = self._root_panel.w(slot5) / 2

	self._controller_image.set_center_x(slot2, self._controller_image)

	slot6 = self._root_panel
	slot4 = self._root_panel.h(slot5) / 2

	self._controller_image.set_center_y(slot2, self._controller_image)

	slot4 = {
		y = 0,
		name = "panel_on_foot",
		x = 0,
		visible = true
	}
	self._panel_on_foot = self._root_panel.panel(slot2, self._root_panel)
	slot4 = {
		y = 0,
		name = "panel_on_foot",
		x = 0,
		visible = false
	}
	self._panel_in_vehicle = self._root_panel.panel(slot2, self._root_panel)
	slot3 = self

	self._layout_on_foot(slot2)

	slot3 = self

	self._layout_in_vehicle(slot2)

	slot3 = self

	self.bind_controller_inputs_on_foot(slot2)

	return 
end
function RaidMenuOptionsControlsControllerMapping:close()
	slot3 = self

	RaidMenuOptionsControlsControllerMapping.super.close(slot2)

	return 
end
function RaidMenuOptionsControlsControllerMapping:_layout_on_foot()
	slot4 = "southpaw"
	local southpaw = managers.user.get_setting(slot2, managers.user)
	slot6 = true
	local controller_bind_move_text = self.translate(managers.user, self, "menu_controller_keybind_move")
	slot7 = true
	local controller_bind_malee_text = self.translate(self, self, "menu_controller_keybind_melee_attack")

	if southpaw then
		slot8 = true
		controller_bind_move_text = self.translate(slot5, self, "menu_controller_keybind_melee_attack")
		slot8 = true
		controller_bind_malee_text = self.translate(slot5, self, "menu_controller_keybind_move")
	end

	slot7 = {
		name = "aim_down_sight",
		text = self.translate(slot9, self, "menu_controller_keybind_aim_down_sight"),
		font = self._label_font,
		font_size = self._label_font_size
	}
	slot12 = true
	self._controller_keybind_aim = self._panel_on_foot.label(slot5, self._panel_on_foot)
	slot7 = {
		coord_y = 0.13,
		align = "left",
		control = self._controller_keybind_aim
	}

	self._set_position_size_controller_keybind_label(slot5, self)

	slot7 = {
		name = "lean",
		text = self.translate(slot9, self, "menu_controller_keybind_lean"),
		font = self._label_font,
		font_size = self._label_font_size
	}
	slot12 = true
	self._controller_keybind_lean = self._panel_on_foot.label(slot5, self._panel_on_foot)
	slot7 = {
		coord_y = 0.25,
		align = "left",
		control = self._controller_keybind_lean
	}

	self._set_position_size_controller_keybind_label(slot5, self)

	slot7 = {
		name = "move",
		text = controller_bind_move_text,
		font = self._label_font,
		font_size = self._label_font_size
	}
	self._controller_keybind_move = self._panel_on_foot.label(slot5, self._panel_on_foot)
	slot7 = {
		coord_y = 0.44,
		align = "left",
		control = self._controller_keybind_move
	}

	self._set_position_size_controller_keybind_label(slot5, self)

	slot7 = {
		name = "communication_wheel",
		text = self.translate(slot9, self, "menu_controller_keybind_comm_wheel"),
		font = self._label_font,
		font_size = self._label_font_size
	}
	slot12 = true
	self._controller_keybind_comm_wheel = self._panel_on_foot.label(slot5, self._panel_on_foot)
	slot7 = {
		coord_y = 0.57,
		align = "left",
		control = self._controller_keybind_comm_wheel
	}

	self._set_position_size_controller_keybind_label(slot5, self)

	slot7 = {
		name = "grenade",
		text = self.translate(slot9, self, "menu_controller_keybind_grenade"),
		font = self._label_font,
		font_size = self._label_font_size
	}
	slot12 = true
	self._controller_keybind_grenade = self._panel_on_foot.label(slot5, self._panel_on_foot)
	slot7 = {
		coord_y = 0.635,
		align = "left",
		control = self._controller_keybind_grenade
	}

	self._set_position_size_controller_keybind_label(slot5, self)

	slot7 = {
		name = "fire_mode",
		text = self.translate(slot9, self, "menu_controller_keybind_weap_fire_mode"),
		font = self._label_font,
		font_size = self._label_font_size
	}
	slot12 = true
	self._controller_keybind_fire_mode = self._panel_on_foot.label(slot5, self._panel_on_foot)
	slot7 = {
		coord_y = 0.83,
		align = "left",
		control = self._controller_keybind_fire_mode
	}

	self._set_position_size_controller_keybind_label(slot5, self)

	slot7 = {
		name = "knife",
		text = self.translate(slot9, self, "menu_controller_keybind_knife"),
		font = self._label_font,
		font_size = self._label_font_size
	}
	slot12 = true
	self._controller_keybind_knife = self._panel_on_foot.label(slot5, self._panel_on_foot)
	slot7 = {
		align = "bottom",
		coord_x = 0.47,
		control = self._controller_keybind_knife
	}

	self._set_position_size_controller_keybind_label(slot5, self)

	slot7 = {
		name = "melee_attack",
		text = controller_bind_malee_text,
		font = self._label_font,
		font_size = self._label_font_size
	}
	self._controller_keybind_melee_attack = self._panel_on_foot.label(slot5, self._panel_on_foot)
	slot7 = {
		align = "bottom",
		coord_x = 0.6,
		control = self._controller_keybind_melee_attack
	}

	self._set_position_size_controller_keybind_label(slot5, self)

	slot7 = {
		name = "fire_weapon",
		text = self.translate(slot9, self, "menu_controller_keybind_fire_weapon"),
		font = self._label_font,
		font_size = self._label_font_size
	}
	slot12 = true
	self._controller_keybind_fire_weapon = self._panel_on_foot.label(slot5, self._panel_on_foot)
	slot7 = {
		coord_y = 0.13,
		align = "right",
		control = self._controller_keybind_fire_weapon
	}

	self._set_position_size_controller_keybind_label(slot5, self)

	slot7 = {
		name = "interact",
		text = self.translate(slot9, self, "menu_controller_keybind_interact"),
		font = self._label_font,
		font_size = self._label_font_size
	}
	slot12 = true
	self._controller_keybind_interact = self._panel_on_foot.label(slot5, self._panel_on_foot)
	slot7 = {
		coord_y = 0.25,
		align = "right",
		control = self._controller_keybind_interact
	}

	self._set_position_size_controller_keybind_label(slot5, self)

	slot7 = {
		name = "switch_weapons",
		text = self.translate(slot9, self, "menu_controller_keybind_switch_weapons"),
		font = self._label_font,
		font_size = self._label_font_size
	}
	slot12 = true
	self._controller_keybind_switch_weapons = self._panel_on_foot.label(slot5, self._panel_on_foot)
	slot7 = {
		coord_y = 0.36,
		align = "right",
		control = self._controller_keybind_switch_weapons
	}

	self._set_position_size_controller_keybind_label(slot5, self)

	slot7 = {
		name = "crouch",
		text = self.translate(slot9, self, "menu_controller_keybind_crouch"),
		font = self._label_font,
		font_size = self._label_font_size
	}
	slot12 = true
	self._controller_keybind_crouch = self._panel_on_foot.label(slot5, self._panel_on_foot)
	slot7 = {
		coord_y = 0.44,
		align = "right",
		control = self._controller_keybind_crouch
	}

	self._set_position_size_controller_keybind_label(slot5, self)

	slot7 = {
		name = "jump",
		text = self.translate(slot9, self, "menu_controller_keybind_jump"),
		font = self._label_font,
		font_size = self._label_font_size
	}
	slot12 = true
	self._controller_keybind_jump = self._panel_on_foot.label(slot5, self._panel_on_foot)
	slot7 = {
		coord_y = 0.52,
		align = "right",
		control = self._controller_keybind_jump
	}

	self._set_position_size_controller_keybind_label(slot5, self)

	slot7 = {
		name = "reload",
		text = self.translate(slot9, self, "menu_controller_keybind_reload"),
		font = self._label_font,
		font_size = self._label_font_size
	}
	slot12 = true
	self._controller_keybind_reload = self._panel_on_foot.label(slot5, self._panel_on_foot)
	slot7 = {
		coord_y = 0.59,
		align = "right",
		control = self._controller_keybind_reload
	}

	self._set_position_size_controller_keybind_label(slot5, self)

	slot7 = {
		name = "mission_info",
		text = self.translate(slot9, self, "menu_controller_keybind_mission_info"),
		font = self._label_font,
		font_size = self._label_font_size
	}
	slot12 = true
	self._controller_keybind_mission_info = self._panel_on_foot.label(slot5, self._panel_on_foot)
	slot7 = {
		align = "top",
		coord_x = 0.465,
		control = self._controller_keybind_mission_info
	}

	self._set_position_size_controller_keybind_label(slot5, self)

	slot7 = {
		name = "ingame_menu",
		text = self.translate(slot9, self, "menu_controller_keybind_ingame_menu"),
		font = self._label_font,
		font_size = self._label_font_size
	}
	slot12 = true
	self._controller_keybind_ingame_menu = self._panel_on_foot.label(slot5, self._panel_on_foot)
	slot7 = {
		align = "top",
		coord_x = 0.56,
		control = self._controller_keybind_ingame_menu
	}

	self._set_position_size_controller_keybind_label(slot5, self)

	slot7 = {
		name = "warcry",
		text = self.translate(slot9, self, "menu_controller_keybind_warcry"),
		font = self._label_font,
		font_size = self._label_font_size
	}
	self._controller_keybind_warcry = self._panel_on_foot.label(slot5, self._panel_on_foot)
	slot6 = self._controller_keybind_warcry
	local x, y, w, h = self._controller_keybind_warcry.text_rect(slot5)
	slot11 = w

	self._controller_keybind_warcry.set_w(slot9, self._controller_keybind_warcry)

	slot11 = h

	self._controller_keybind_warcry.set_h(slot9, self._controller_keybind_warcry)

	slot11 = "center"

	self._controller_keybind_warcry.set_align(slot9, self._controller_keybind_warcry)

	slot13 = self._controller_image
	slot11 = self._controller_image.center_x(true) + 20

	self._controller_keybind_warcry.set_center_x(slot9, self._controller_keybind_warcry)

	slot13 = self._controller_image
	slot11 = self._controller_image.y(true) - 20

	self._controller_keybind_warcry.set_y(slot9, self._controller_keybind_warcry)

	return 
end
function RaidMenuOptionsControlsControllerMapping:_layout_in_vehicle()
	slot4 = "southpaw"
	local southpaw = managers.user.get_setting(slot2, managers.user)
	slot6 = true
	local controller_bind_steering_text = self.translate(managers.user, self, "menu_controller_keybind_steering")
	slot7 = true
	local controller_bind_look_back_text = self.translate(self, self, "menu_controller_keybind_look_back")

	if southpaw then
		slot8 = true
		controller_bind_steering_text = self.translate(slot5, self, "menu_controller_keybind_not_available")
		slot8 = true
		controller_bind_look_back_text = self.translate(slot5, self, "menu_controller_keybind_steering_southpaw")
	end

	slot7 = {
		name = "reverse",
		text = self.translate(slot9, self, "menu_controller_keybind_reverse"),
		font = self._label_font,
		font_size = self._label_font_size
	}
	slot12 = true
	self._controller_keybind_reverse = self._panel_in_vehicle.label(slot5, self._panel_in_vehicle)
	slot7 = {
		coord_y = 0.13,
		align = "left",
		control = self._controller_keybind_reverse
	}

	self._set_position_size_controller_keybind_label(slot5, self)

	slot7 = {
		name = "change_seat",
		text = self.translate(slot9, self, "menu_controller_keybind_change_seat"),
		font = self._label_font,
		font_size = self._label_font_size
	}
	slot12 = true
	self._controller_keybind_change_seat = self._panel_in_vehicle.label(slot5, self._panel_in_vehicle)
	slot7 = {
		coord_y = 0.25,
		align = "left",
		control = self._controller_keybind_change_seat
	}

	self._set_position_size_controller_keybind_label(slot5, self)

	slot7 = {
		name = "move",
		text = controller_bind_steering_text,
		font = self._label_font,
		font_size = self._label_font_size
	}
	self._controller_keybind_steering = self._panel_in_vehicle.label(slot5, self._panel_in_vehicle)
	slot7 = {
		coord_y = 0.44,
		align = "left",
		control = self._controller_keybind_steering
	}

	self._set_position_size_controller_keybind_label(slot5, self)

	slot7 = {
		name = "na2",
		text = self.translate(slot9, self, "menu_controller_keybind_not_available"),
		font = self._label_font,
		font_size = self._label_font_size
	}
	slot12 = true
	self._controller_keybind_na2 = self._panel_in_vehicle.label(slot5, self._panel_in_vehicle)
	slot7 = {
		coord_y = 0.57,
		align = "left",
		control = self._controller_keybind_na2
	}

	self._set_position_size_controller_keybind_label(slot5, self)

	slot7 = {
		name = "na3",
		text = self.translate(slot9, self, "menu_controller_keybind_not_available"),
		font = self._label_font,
		font_size = self._label_font_size
	}
	slot12 = true
	self._controller_keybind_na3 = self._panel_in_vehicle.label(slot5, self._panel_in_vehicle)
	slot7 = {
		coord_y = 0.635,
		align = "left",
		control = self._controller_keybind_na3
	}

	self._set_position_size_controller_keybind_label(slot5, self)

	slot7 = {
		name = "na4",
		text = self.translate(slot9, self, "menu_controller_keybind_not_available"),
		font = self._label_font,
		font_size = self._label_font_size
	}
	slot12 = true
	self._controller_keybind_na4 = self._panel_in_vehicle.label(slot5, self._panel_in_vehicle)
	slot7 = {
		coord_y = 0.83,
		align = "left",
		control = self._controller_keybind_na4
	}

	self._set_position_size_controller_keybind_label(slot5, self)

	slot7 = {
		name = "na5",
		text = self.translate(slot9, self, "menu_controller_keybind_not_available"),
		font = self._label_font,
		font_size = self._label_font_size
	}
	slot12 = true
	self._controller_keybind_na5 = self._panel_in_vehicle.label(slot5, self._panel_in_vehicle)
	slot7 = {
		align = "bottom",
		coord_x = 0.47,
		control = self._controller_keybind_na5
	}

	self._set_position_size_controller_keybind_label(slot5, self)

	slot7 = {
		name = "look_back",
		text = controller_bind_look_back_text,
		font = self._label_font,
		font_size = self._label_font_size
	}
	self._controller_keybind_look_back = self._panel_in_vehicle.label(slot5, self._panel_in_vehicle)
	slot7 = {
		align = "bottom",
		coord_x = 0.6,
		control = self._controller_keybind_look_back
	}

	self._set_position_size_controller_keybind_label(slot5, self)

	slot7 = {
		name = "accelerate",
		text = self.translate(slot9, self, "menu_controller_keybind_accelerate"),
		font = self._label_font,
		font_size = self._label_font_size
	}
	slot12 = true
	self._controller_keybind_na7 = self._panel_in_vehicle.label(slot5, self._panel_in_vehicle)
	slot7 = {
		coord_y = 0.13,
		align = "right",
		control = self._controller_keybind_na7
	}

	self._set_position_size_controller_keybind_label(slot5, self)

	slot7 = {
		name = "exit_vehicle",
		text = self.translate(slot9, self, "menu_controller_keybind_exit_vehicle"),
		font = self._label_font,
		font_size = self._label_font_size
	}
	slot12 = true
	self._controller_keybind_exit_vehicle = self._panel_in_vehicle.label(slot5, self._panel_in_vehicle)
	slot7 = {
		coord_y = 0.25,
		align = "right",
		control = self._controller_keybind_exit_vehicle
	}

	self._set_position_size_controller_keybind_label(slot5, self)

	slot7 = {
		name = "na8",
		text = self.translate(slot9, self, "menu_controller_keybind_not_available"),
		font = self._label_font,
		font_size = self._label_font_size
	}
	slot12 = true
	self._controller_keybind_na8 = self._panel_in_vehicle.label(slot5, self._panel_in_vehicle)
	slot7 = {
		coord_y = 0.36,
		align = "right",
		control = self._controller_keybind_na8
	}

	self._set_position_size_controller_keybind_label(slot5, self)

	slot7 = {
		name = "switch_pose",
		text = self.translate(slot9, self, "menu_controller_keybind_switch_pose"),
		font = self._label_font,
		font_size = self._label_font_size
	}
	slot12 = true
	self._controller_keybind_switch_pose = self._panel_in_vehicle.label(slot5, self._panel_in_vehicle)
	slot7 = {
		coord_y = 0.44,
		align = "right",
		control = self._controller_keybind_switch_pose
	}

	self._set_position_size_controller_keybind_label(slot5, self)

	slot7 = {
		name = "handbrake",
		text = self.translate(slot9, self, "menu_controller_keybind_handbrake"),
		font = self._label_font,
		font_size = self._label_font_size
	}
	slot12 = true
	self._controller_keybind_handbrake = self._panel_in_vehicle.label(slot5, self._panel_in_vehicle)
	slot7 = {
		coord_y = 0.52,
		align = "right",
		control = self._controller_keybind_handbrake
	}

	self._set_position_size_controller_keybind_label(slot5, self)

	slot7 = {
		name = "na10",
		text = self.translate(slot9, self, "menu_controller_keybind_not_available"),
		font = self._label_font,
		font_size = self._label_font_size
	}
	slot12 = true
	self._controller_keybind_na10 = self._panel_in_vehicle.label(slot5, self._panel_in_vehicle)
	slot7 = {
		coord_y = 0.59,
		align = "right",
		control = self._controller_keybind_na10
	}

	self._set_position_size_controller_keybind_label(slot5, self)

	slot7 = {
		name = "mission_info_vehicle",
		text = self.translate(slot9, self, "menu_controller_keybind_mission_info"),
		font = self._label_font,
		font_size = self._label_font_size
	}
	slot12 = true
	self._controller_keybind_mission_info_vehicle = self._panel_in_vehicle.label(slot5, self._panel_in_vehicle)
	slot7 = {
		align = "top",
		coord_x = 0.465,
		control = self._controller_keybind_mission_info_vehicle
	}

	self._set_position_size_controller_keybind_label(slot5, self)

	slot7 = {
		name = "ingame_menu_vehicle",
		text = self.translate(slot9, self, "menu_controller_keybind_ingame_menu"),
		font = self._label_font,
		font_size = self._label_font_size
	}
	slot12 = true
	self._controller_keybind_ingame_menu_vehicle = self._panel_in_vehicle.label(slot5, self._panel_in_vehicle)
	slot7 = {
		align = "top",
		coord_x = 0.56,
		control = self._controller_keybind_ingame_menu_vehicle
	}

	self._set_position_size_controller_keybind_label(slot5, self)

	return 
end
function RaidMenuOptionsControlsControllerMapping:_set_position_size_controller_keybind_label(params)
	slot4 = params.control
	local x, y, w, h = params.control.text_rect(slot3)
	slot9 = w

	params.control.set_w(slot7, params.control)

	slot9 = h

	params.control.set_h(slot7, params.control)

	slot9 = "center"

	params.control.set_align(slot7, params.control)

	if params.align == "left" then
		slot12 = self._controller_image
		slot9 = self._controller_image.x(slot10) + self._controller_image.w(self._controller_image) * 0.17

		params.control.set_right(slot7, params.control)

		slot12 = self._controller_image
		slot9 = self._controller_image.y(self._controller_image.w(self._controller_image) * 0.17) + self._controller_image.h(self._controller_image) * params.coord_y

		params.control.set_center_y(slot7, params.control)
	elseif params.align == "bottom" then
		slot8 = params.control
		slot11 = self._controller_image

		params.control.set_top(slot7, self._controller_image.bottom(slot10))

		slot12 = self._controller_image
		slot9 = self._controller_image.x(slot10) + self._controller_image.w(self._controller_image) * params.coord_x

		params.control.set_center_x(slot7, params.control)
	elseif params.align == "right" then
		slot12 = self._controller_image
		slot9 = self._controller_image.right(slot10) - self._controller_image.w(self._controller_image) * 0.17

		params.control.set_left(slot7, params.control)

		slot12 = self._controller_image
		slot9 = self._controller_image.y(self._controller_image.w(self._controller_image) * 0.17) + self._controller_image.h(self._controller_image) * params.coord_y

		params.control.set_center_y(slot7, params.control)
	elseif params.align == "top" then
		slot12 = self._controller_image
		slot9 = self._controller_image.top(slot10) + self._controller_image.top(self._controller_image) * 0.43

		params.control.set_bottom(slot7, params.control)

		slot12 = self._controller_image
		slot9 = self._controller_image.x(self._controller_image.top(self._controller_image) * 0.43) + self._controller_image.w(self._controller_image) * params.coord_x

		params.control.set_center_x(slot7, params.control)
	end

	return 
end
function RaidMenuOptionsControlsControllerMapping:bind_controller_inputs_on_foot()
	local bindings = {}
	slot5 = "menu_controller_shoulder_right"
	slot7 = "_show_vehicle_mapping"
	bindings[1] = {
		key = Idstring(slot4),
		callback = callback(slot4, self, self)
	}

	self.set_controller_bindings(callback(slot4, self, self), self, bindings)

	local legend = {
		controller = {
			"menu_legend_back",
			"menu_legend_options_controller_mapping_in_vehicle"
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
function RaidMenuOptionsControlsControllerMapping:bind_controller_inputs_in_vehicle()
	local bindings = {}
	slot5 = "menu_controller_shoulder_left"
	slot7 = "_show_on_foot_mapping"
	bindings[1] = {
		key = Idstring(slot4),
		callback = callback(slot4, self, self)
	}

	self.set_controller_bindings(callback(slot4, self, self), self, bindings)

	local legend = {
		controller = {
			"menu_legend_back",
			"menu_legend_options_controller_mapping_on_foot"
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
function RaidMenuOptionsControlsControllerMapping:_show_vehicle_mapping()
	slot3 = self._panel_on_foot

	self._panel_on_foot.hide(slot2)

	slot3 = self._panel_in_vehicle

	self._panel_in_vehicle.show(slot2)

	slot3 = self

	self.bind_controller_inputs_in_vehicle(slot2)

	slot5 = "menu_header_options_controls_controller_mapping_in_vehicle"

	self._node.components.raid_menu_header.set_screen_name(slot2, self._node.components.raid_menu_header, "menu_header_options_main_screen_name")

	return 
end
function RaidMenuOptionsControlsControllerMapping:_show_on_foot_mapping()
	slot3 = self._panel_on_foot

	self._panel_on_foot.show(slot2)

	slot3 = self._panel_in_vehicle

	self._panel_in_vehicle.hide(slot2)

	slot3 = self

	self.bind_controller_inputs_on_foot(slot2)

	slot5 = "menu_header_options_controls_controller_mapping_on_foot"

	self._node.components.raid_menu_header.set_screen_name(slot2, self._node.components.raid_menu_header, "menu_header_options_main_screen_name")

	return 
end

return 
