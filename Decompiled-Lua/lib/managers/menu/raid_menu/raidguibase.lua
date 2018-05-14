-- Decompilation Error: self.ljd.ast.slotworks.eliminate_temporary(self.ast)

slot0 = RaidGuiBase

if not slot0 then
	slot0 = class
	slot0 = slot0()
end

RaidGuiBase = slot0
slot0 = RaidGuiBase
slot1 = 10
slot0.BACKGROUND_LAYER = slot1
slot0 = RaidGuiBase
slot1 = 20
slot0.FOREGROUND_LAYER = slot1
slot0 = RaidGuiBase
slot1 = 42
slot0.PADDING = slot1
slot0 = RaidGuiBase
slot1 = {}
slot0.Colors = slot1
slot0 = RaidGuiBase
slot0 = slot0.Colors
slot1 = Color
slot3 = 0.85
slot4 = 0
slot5 = 0
slot6 = 0
slot1 = slot1(slot2, slot3, slot4, slot5)
slot0.screen_background = slot1
slot0 = RaidGuiBase

function slot1(self, ws, fullscreen_ws, node, component_name)
	slot5 = managers
	slot5 = slot5.raid_menu
	slot7 = slot5
	slot5 = slot5.register_on_escape_callback
	slot8 = callback
	slot10 = self
	slot11 = self
	slot12 = "on_escape"

	slot5(slot6, slot8(slot9, slot10, slot11))

	self._name = component_name
	self._ws = ws
	self._fullscreen_ws = fullscreen_ws
	self._node = node
	slot5 = self._ws
	slot7 = slot5
	slot5 = slot5.panel
	slot5 = slot5(slot6)
	self._ws_panel = slot5
	slot5 = self._ws_panel
	slot7 = slot5
	slot5 = slot5.panel
	slot8 = {}
	slot9 = self._name
	slot10 = "_ws_panel"
	slot9 = slot9 .. slot10
	slot8.name = slot9
	slot9 = self._background_color
	slot8.background_color = slot9
	slot9 = self._panel_x
	slot8.x = slot9
	slot9 = self._panel_y
	slot8.y = slot9
	slot9 = self._panel_h
	slot8.h = slot9
	slot9 = self._panel_w
	slot8.w = slot9
	slot9 = self._panel_layer
	slot8.layer = slot9
	slot5 = slot5(slot6, slot7)
	self._ws_panel = slot5
	slot5 = self._fullscreen_ws
	slot7 = slot5
	slot5 = slot5.panel
	slot5 = slot5(slot6)
	self._fullscreen_ws_panel = slot5
	slot7 = self
	slot5 = self._setup_properties

	slot5(slot6)

	slot7 = self
	slot5 = self._clear_controller_bindings

	slot5(slot6)

	slot5 = node.components

	if not slot5 then
		slot5 = {}
		node.components = slot5
	end

	slot5 = self._node
	slot5 = slot5.components
	slot6 = self._name
	slot5[slot6] = self
	slot5 = {}
	self._controls = slot5
	slot7 = self
	slot5 = self._set_initial_data

	slot5(slot6)

	local params_root_panel = {}
	slot6 = self._name
	slot7 = "_panel"
	slot6 = slot6 .. slot7
	params_root_panel.name = slot6
	slot6 = self._background_color
	params_root_panel.background_color = slot6
	slot6 = self._panel_x
	params_root_panel.x = slot6
	slot6 = self._panel_y
	params_root_panel.y = slot6
	slot6 = self._panel_h
	params_root_panel.h = slot6
	slot6 = self._panel_w
	params_root_panel.w = slot6
	slot6 = self._panel_layer
	params_root_panel.layer = slot6
	slot6 = self._panel_is_root_panel
	params_root_panel.is_root_panel = slot6
	slot6 = RaidGUIPanel
	slot8 = slot6
	slot6 = slot6.new
	slot9 = self._ws_panel
	slot10 = params_root_panel
	slot6 = slot6(slot7, slot8, slot9)
	self._root_panel = slot6
	slot8 = self
	slot6 = self._layout

	slot6(slot7)

	slot6 = managers
	slot6 = slot6.menu_component
	slot8 = slot6
	slot6 = slot6.post_event
	slot9 = "menu_enter"

	slot6(slot7, slot8)

	return 
end

slot0.init = slot1
slot0 = RaidGuiBase

function slot1(self)
	slot1 = 0
	self._panel_x = slot1
	slot1 = 0
	self._panel_y = slot1
	slot1 = self._ws
	slot3 = slot1
	slot1 = slot1.width
	slot1 = slot1(slot2)
	self._panel_w = slot1
	slot1 = self._ws
	slot3 = slot1
	slot1 = slot1.height
	slot1 = slot1(slot2)
	self._panel_h = slot1
	slot1 = RaidGuiBase
	slot1 = slot1.FOREGROUND_LAYER
	self._panel_layer = slot1
	slot1 = true
	self._panel_is_root_panel = slot1
	slot1 = true
	self._background = slot1

	return 
end

slot0._setup_properties = slot1
slot0 = RaidGuiBase

function slot1(self)
	return 
end

slot0._set_initial_data = slot1
slot0 = RaidGuiBase

function slot1(self, text, upper_case_flag)
	slot3 = managers
	slot3 = slot3.localization
	slot5 = slot3
	slot3 = slot3.get_default_macros
	local button_macros = slot3(slot4)
	slot4 = managers
	slot4 = slot4.localization
	slot6 = slot4
	slot4 = slot4.text
	slot7 = text
	slot8 = button_macros
	local result = slot4(slot5, slot6, slot7)

	if upper_case_flag then
		slot5 = utf8
		slot5 = slot5.to_upper
		slot7 = result
		slot5 = slot5(slot6)
		result = slot5
	end

	return result
end

slot0.translate = slot1
slot0 = RaidGuiBase

function slot1(self)
	slot1 = managers
	slot1 = slot1.environment_controller
	slot3 = slot1
	slot1 = slot1.get_dof_override_ranges
	slot1, slot2, slot3, slot4 = slot1(slot2)
	self._odof_far_pad = slot4
	self._odof_far = slot3
	self._odof_near_pad = slot2
	self._odof_near = slot1
	slot1 = managers
	slot1 = slot1.environment_controller
	slot3 = slot1
	slot1 = slot1.set_dof_override
	slot4 = true

	slot1(slot2, slot3)

	slot1 = managers
	slot1 = slot1.environment_controller
	slot3 = slot1
	slot1 = slot1.set_dof_override_ranges
	slot4 = 0
	slot5 = 0
	slot6 = 100000
	slot7 = 0

	slot1(slot2, slot3, slot4, slot5, slot6)

	return 
end

slot0._disable_dof = slot1
slot0 = RaidGuiBase

function slot1(self)
	slot1 = managers
	slot1 = slot1.environment_controller
	slot3 = slot1
	slot1 = slot1.set_dof_override_ranges
	slot4 = self._odof_near
	slot5 = self._odof_near_pad
	slot6 = self._odof_far
	slot7 = self._odof_far_pad

	slot1(slot2, slot3, slot4, slot5, slot6)

	slot1 = managers
	slot1 = slot1.environment_controller
	slot3 = slot1
	slot1 = slot1.set_dof_override
	slot4 = false

	slot1(slot2, slot3)

	return 
end

slot0._enable_dof = slot1
slot0 = RaidGuiBase

function slot1(self)
	return 
end

slot0._layout = slot1
slot0 = RaidGuiBase

function slot1(self)
	local border_thickness = 1.6
	slot2 = self._root_panel
	slot4 = slot2
	slot2 = slot2.gradient
	slot5 = {
		name = "border_left",
		y = 0,
		orientation = "vertical",
		x = 0,
		layer = 100,
		w = border_thickness
	}
	slot6 = self._root_panel
	slot8 = slot6
	slot6 = slot6.h
	slot6 = slot6(slot7)
	slot5.h = slot6
	slot2 = slot2(slot3, slot4)
	self._border_left = slot2
	slot2 = self._border_left
	slot4 = slot2
	slot2 = slot2.set_gradient_points
	slot5 = {
		0,
		nil,
		1
	}
	slot6 = Color
	slot8 = 0.19215686274509805
	slot9 = 0.23529411764705882
	slot10 = 0.25098039215686274
	slot6 = slot6(slot7, slot8, slot9)
	slot5[2] = slot6
	slot6 = Color
	slot8 = 0.3137254901960784
	slot9 = 0.40784313725490196
	slot10 = 0.35294117647058826
	slot5[MULTRES] = slot6(slot7, slot8, slot9)

	slot2(slot3, slot4)

	slot2 = self._root_panel
	slot4 = slot2
	slot2 = slot2.gradient
	slot5 = {
		name = "border_right",
		y = 0,
		orientation = "vertical",
		layer = 100
	}
	slot6 = self._root_panel
	slot8 = slot6
	slot6 = slot6.w
	slot6 = slot6(slot7)
	slot6 = slot6 - border_thickness
	slot5.x = slot6
	slot5.w = border_thickness
	slot6 = self._root_panel
	slot8 = slot6
	slot6 = slot6.h
	slot6 = slot6(slot7)
	slot5.h = slot6
	slot2 = slot2(slot3, slot4)
	self._border_right = slot2
	slot2 = self._border_right
	slot4 = slot2
	slot2 = slot2.set_gradient_points
	slot5 = {
		0,
		nil,
		1
	}
	slot6 = Color
	slot8 = 0.3058823529411765
	slot9 = 0.40784313725490196
	slot10 = 0.36470588235294116
	slot6 = slot6(slot7, slot8, slot9)
	slot5[2] = slot6
	slot6 = Color
	slot8 = 0.3411764705882353
	slot9 = 0.35294117647058826
	slot10 = 0.3176470588235294
	slot5[MULTRES] = slot6(slot7, slot8, slot9)

	slot2(slot3, slot4)

	slot2 = self._root_panel
	slot4 = slot2
	slot2 = slot2.gradient
	slot5 = {
		name = "border_up",
		y = 0,
		orientation = "horizontal",
		x = 0,
		layer = 100
	}
	slot6 = self._root_panel
	slot8 = slot6
	slot6 = slot6.w
	slot6 = slot6(slot7)
	slot5.w = slot6
	slot5.h = border_thickness
	slot2 = slot2(slot3, slot4)
	self._border_up = slot2
	slot2 = self._border_up
	slot4 = slot2
	slot2 = slot2.set_gradient_points
	slot5 = {
		0,
		nil,
		0.38,
		nil,
		0.544,
		nil,
		0.77,
		nil,
		1
	}
	slot6 = Color
	slot8 = 0.19215686274509805
	slot9 = 0.23529411764705882
	slot10 = 0.25098039215686274
	slot6 = slot6(slot7, slot8, slot9)
	slot5[2] = slot6
	slot6 = Color
	slot8 = 0.34901960784313724
	slot9 = 0.34901960784313724
	slot10 = 0.3411764705882353
	slot6 = slot6(slot7, slot8, slot9)
	slot5[4] = slot6
	slot6 = Color
	slot8 = 0.596078431372549
	slot9 = 0.6274509803921569
	slot10 = 0.5843137254901961
	slot6 = slot6(slot7, slot8, slot9)
	slot5[6] = slot6
	slot6 = Color
	slot8 = 0.34901960784313724
	slot9 = 0.34901960784313724
	slot10 = 0.3411764705882353
	slot6 = slot6(slot7, slot8, slot9)
	slot5[8] = slot6
	slot6 = Color
	slot8 = 0.3058823529411765
	slot9 = 0.40784313725490196
	slot10 = 0.36470588235294116
	slot5[MULTRES] = slot6(slot7, slot8, slot9)

	slot2(slot3, slot4)

	slot2 = self._root_panel
	slot4 = slot2
	slot2 = slot2.gradient
	slot5 = {
		name = "border_down",
		orientation = "horizontal",
		x = 0,
		layer = 100
	}
	slot6 = self._root_panel
	slot8 = slot6
	slot6 = slot6.h
	slot6 = slot6(slot7)
	slot6 = slot6 - border_thickness
	slot5.y = slot6
	slot6 = self._root_panel
	slot8 = slot6
	slot6 = slot6.w
	slot6 = slot6(slot7)
	slot5.w = slot6
	slot5.h = border_thickness
	slot2 = slot2(slot3, slot4)
	self._border_down = slot2
	slot2 = self._border_down
	slot4 = slot2
	slot2 = slot2.set_gradient_points
	slot5 = {
		0,
		nil,
		0.3,
		nil,
		0.69,
		nil,
		1
	}
	slot6 = Color
	slot8 = 0.3137254901960784
	slot9 = 0.40784313725490196
	slot10 = 0.35294117647058826
	slot6 = slot6(slot7, slot8, slot9)
	slot5[2] = slot6
	slot6 = Color
	slot8 = 0.596078431372549
	slot9 = 0.615686274509804
	slot10 = 0.592156862745098
	slot6 = slot6(slot7, slot8, slot9)
	slot5[4] = slot6
	slot6 = Color
	slot8 = 0.6039215686274509
	slot9 = 0.615686274509804
	slot10 = 0.5882352941176471
	slot6 = slot6(slot7, slot8, slot9)
	slot5[6] = slot6
	slot6 = Color
	slot8 = 0.3411764705882353
	slot9 = 0.35294117647058826
	slot10 = 0.3176470588235294
	slot5[MULTRES] = slot6(slot7, slot8, slot9)

	slot2(slot3, slot4)

	return 
end

slot0._create_border = slot1
slot0 = RaidGuiBase

function slot1(self)
	slot1 = self._border_left
	slot3 = slot1
	slot1 = slot1.parent
	slot1 = slot1(slot2)
	slot3 = slot1
	slot1 = slot1.remove
	slot4 = self._border_left

	slot1(slot2, slot3)

	slot1 = nil
	self._border_left = slot1
	slot1 = self._border_right
	slot3 = slot1
	slot1 = slot1.parent
	slot1 = slot1(slot2)
	slot3 = slot1
	slot1 = slot1.remove
	slot4 = self._border_right

	slot1(slot2, slot3)

	slot1 = nil
	self._border_right = slot1
	slot1 = self._border_down
	slot3 = slot1
	slot1 = slot1.parent
	slot1 = slot1(slot2)
	slot3 = slot1
	slot1 = slot1.remove
	slot4 = self._border_down

	slot1(slot2, slot3)

	slot1 = nil
	self._border_down = slot1
	slot1 = self._border_up
	slot3 = slot1
	slot1 = slot1.parent
	slot1 = slot1(slot2)
	slot3 = slot1
	slot1 = slot1.remove
	slot4 = self._border_up

	slot1(slot2, slot3)

	slot1 = nil
	self._border_up = slot1

	return 
end

slot0._remove_border = slot1
slot0 = RaidGuiBase

function slot1(self)
	slot1 = self._node
	slot1 = slot1.components
	slot2 = self._name
	slot3 = nil
	slot1[slot2] = slot3
	slot1 = ipairs
	slot3 = self._controls
	slot1, slot2, slot3 = slot1(slot2)

	for _, control in slot1, slot2, slot3 do
		slot8 = control
		slot6 = control.close

		slot6(slot7)
	end

	slot1 = self._root_panel
	slot3 = slot1
	slot1 = slot1.close

	slot1(slot2)

	slot1 = self._ws_panel
	slot3 = slot1
	slot1 = slot1.clear

	slot1(slot2)

	slot1 = self._fullscreen_ws_panel
	slot3 = slot1
	slot1 = slot1.clear

	slot1(slot2)

	slot1 = managers
	slot1 = slot1.menu_component
	slot3 = slot1
	slot1 = slot1.post_event
	slot4 = "menu_exit"

	slot1(slot2, slot3)

	return 
end

slot0.close = slot1
slot0 = RaidGuiBase

function slot1(self, o, x, y)
	slot4 = managers
	slot4 = slot4.raid_menu
	slot6 = slot4
	slot4 = slot4.get_active_control
	local active_control = slot4(slot5)

	if active_control then
		slot7 = active_control
		slot5 = active_control.on_mouse_moved
		slot8 = o
		slot9 = x
		slot10 = y
		local used, pointer = slot5(slot6, slot7, slot8, slot9)
		slot7 = used
		slot8 = pointer

		return slot7, slot8
	end

	slot5 = self._root_panel
	slot7 = slot5
	slot5 = slot5.mouse_moved
	slot8 = o
	slot9 = x
	slot10 = y

	return slot5(slot6, slot7, slot8, slot9)
end

slot0.mouse_moved = slot1
slot0 = RaidGuiBase

function slot1(self, o, button, x, y)
	slot5 = Idstring
	slot7 = "mouse wheel up"
	slot5 = slot5(slot6)

	if button == slot5 then
		slot5 = self._root_panel
		slot7 = slot5
		slot5 = slot5.mouse_scroll_up
		slot8 = o
		slot9 = button
		slot10 = x
		slot11 = y

		return slot5(slot6, slot7, slot8, slot9, slot10)
	else
		slot5 = Idstring
		slot7 = "mouse wheel down"
		slot5 = slot5(slot6)

		if button == slot5 then
			slot5 = self._root_panel
			slot7 = slot5
			slot5 = slot5.mouse_scroll_down
			slot8 = o
			slot9 = button
			slot10 = x
			slot11 = y

			return slot5(slot6, slot7, slot8, slot9, slot10)
		else
			slot5 = self._root_panel
			slot7 = slot5
			slot5 = slot5.mouse_pressed
			slot8 = o
			slot9 = button
			slot10 = x
			slot11 = y

			return slot5(slot6, slot7, slot8, slot9, slot10)
		end
	end

	return 
end

slot0.mouse_pressed = slot1
slot0 = RaidGuiBase

function slot1(self, o, button, x, y)
	slot5 = self._root_panel
	slot7 = slot5
	slot5 = slot5.mouse_clicked
	slot8 = o
	slot9 = button
	slot10 = x
	slot11 = y

	return slot5(slot6, slot7, slot8, slot9, slot10)
end

slot0.mouse_clicked = slot1
slot0 = RaidGuiBase

function slot1(self, o, button, x, y)
	slot5 = self._root_panel
	slot7 = slot5
	slot5 = slot5.mouse_double_click
	slot8 = o
	slot9 = button
	slot10 = x
	slot11 = y

	return slot5(slot6, slot7, slot8, slot9, slot10)
end

slot0.mouse_double_click = slot1
slot0 = RaidGuiBase

function slot1(self, o, button, x, y)
	slot7 = "0"
	local is_left_click = button == Idstring(slot6)

	if not is_left_click then
		slot6 = true

		return slot6
	end

	slot6 = managers
	slot6 = slot6.raid_menu
	slot8 = slot6
	slot6 = slot6.clear_active_control

	slot6(slot7)

	slot6 = self._root_panel
	slot8 = slot6
	slot6 = slot6.mouse_released
	slot9 = o
	slot10 = button
	slot11 = x
	slot12 = y

	return slot6(slot7, slot8, slot9, slot10, slot11)
end

slot0.mouse_released = slot1
slot0 = RaidGuiBase

function slot1(self)
	slot1 = managers
	slot1 = slot1.raid_menu
	slot3 = slot1
	slot1 = slot1.on_escape

	slot1(slot2)

	slot1 = true

	return slot1
end

slot0.back_pressed = slot1
slot0 = RaidGuiBase

function slot1(self)
	slot1 = self._root_panel
	slot3 = slot1
	slot1 = slot1.move_up

	return slot1(slot2)
end

slot0.move_up = slot1
slot0 = RaidGuiBase

function slot1(self)
	slot1 = self._root_panel
	slot3 = slot1
	slot1 = slot1.move_down

	return slot1(slot2)
end

slot0.move_down = slot1
slot0 = RaidGuiBase

function slot1(self)
	slot1 = self._root_panel
	slot3 = slot1
	slot1 = slot1.move_left

	return slot1(slot2)
end

slot0.move_left = slot1
slot0 = RaidGuiBase

function slot1(self)
	slot1 = self._root_panel
	slot3 = slot1
	slot1 = slot1.move_right

	return slot1(slot2)
end

slot0.move_right = slot1
slot0 = RaidGuiBase

function slot1(self)
	slot1 = self._root_panel
	slot3 = slot1
	slot1 = slot1.scroll_up

	return slot1(slot2)
end

slot0.scroll_up = slot1
slot0 = RaidGuiBase

function slot1(self)
	slot1 = self._root_panel
	slot3 = slot1
	slot1 = slot1.scroll_down

	return slot1(slot2)
end

slot0.scroll_down = slot1
slot0 = RaidGuiBase

function slot1(self)
	slot1 = self._root_panel
	slot3 = slot1
	slot1 = slot1.scroll_left

	return slot1(slot2)
end

slot0.scroll_left = slot1
slot0 = RaidGuiBase

function slot1(self)
	slot1 = self._root_panel
	slot3 = slot1
	slot1 = slot1.scroll_right

	return slot1(slot2)
end

slot0.scroll_right = slot1
slot0 = RaidGuiBase

function slot1(self)
	slot1 = self._root_panel
	slot3 = slot1
	slot1 = slot1.confirm_pressed

	return slot1(slot2)
end

slot0.confirm_pressed = slot1
slot0 = RaidGuiBase

function slot1(self)
	slot1 = false

	return slot1
end

slot0.on_escape = slot1
slot0 = RaidGuiBase

function slot1(self)
	slot1 = {}
	self._controller_bindings = slot1

	return 
end

slot0._clear_controller_bindings = slot1
slot0 = RaidGuiBase

function slot1(self, bindings, clear_old)
	if clear_old then
		slot5 = self
		slot3 = self._clear_controller_bindings

		slot3(slot4)
	end

	slot3 = ipairs
	slot5 = bindings
	slot3, slot4, slot5 = slot3(slot4)

	for _, binding in slot3, slot4, slot5 do
		local found = false
		slot9 = ipairs
		slot11 = self._controller_bindings
		slot9, slot10, slot11 = slot9(slot10)

		for index, current_binding in slot9, slot10, slot11 do
			slot14 = current_binding.key
			slot15 = binding.key

			if slot14 == slot15 then
				slot14 = self._controller_bindings
				slot14[index] = binding
				found = true
			end
		end

		if not found then
			slot9 = table
			slot9 = slot9.insert
			slot11 = self._controller_bindings
			slot12 = binding

			slot9(slot10, slot11)
		end
	end

	return 
end

slot0.set_controller_bindings = slot1
slot0 = RaidGuiBase

function slot1(self, button)
	local binding_to_trigger = nil
	slot3 = ipairs
	slot5 = self._controller_bindings
	slot3, slot4, slot5 = slot3(slot4)

	for index, binding in slot3, slot4, slot5 do
		slot8 = binding.key

		if slot8 == button then
			binding_to_trigger = binding
		end
	end

	if binding_to_trigger then
		slot3 = binding_to_trigger.callback
		slot5 = binding_to_trigger.data

		return slot3(slot4)
	end

	slot3 = false
	slot4 = nil

	return slot3, slot4
end

slot0.special_btn_pressed = slot1
slot0 = RaidGuiBase

function slot1(self, legend)
	slot2 = managers
	slot2 = slot2.raid_menu
	slot4 = slot2
	slot2 = slot2.set_legend_labels
	slot5 = legend

	slot2(slot3, slot4)

	return 
end

slot0.set_legend = slot1
slot0 = RaidGuiBase

function slot1(self)
	slot1 = managers
	slot1 = slot1.raid_menu
	slot3 = slot1
	slot1 = slot1.on_escape

	slot1(slot2)

	return 
end

slot0._on_legend_pc_back = slot1

return 
