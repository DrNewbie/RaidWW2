-- Decompilation Error: self.ljd.ast.slotworks.eliminate_temporary(self.ast)

-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot0 = core
slot2 = slot0
slot0 = slot0.import
slot3 = "CoreMenuInput"

slot0(slot1, slot2)

slot0 = MenuInput

if not slot0 then
	slot0 = class
	slot2 = CoreMenuInput
	slot2 = slot2.MenuInput
	slot0 = slot0(slot1)
end

MenuInput = slot0
slot0 = MenuInput
slot1 = {
	"menu_controller_face_right",
	"menu_controller_face_left",
	"menu_controller_face_bottom",
	"menu_controller_face_top",
	"menu_controller_shoulder_left",
	"menu_controller_shoulder_right",
	"menu_controller_trigger_left",
	"menu_controller_trigger_right",
	"menu_controller_dpad_up",
	"menu_controller_dpad_down",
	"menu_controller_dpad_left",
	"menu_controller_dpad_right"
}
slot0.special_buttons = slot1
slot0 = MenuInput

function slot1(self, logic, ...)
	slot2 = MenuInput
	slot2 = slot2.super
	slot2 = slot2.init
	slot4 = self
	slot5 = logic

	slot2(slot3, slot4, ...)

	slot2 = 0.5
	self._move_axis_limit = slot2
	slot2 = SoundDevice
	slot4 = slot2
	slot2 = slot2.create_source
	slot5 = "MenuInput"
	slot2 = slot2(slot3, slot4)
	self._sound_source = slot2
	slot2 = 0
	self._controller_mouse_active_counter = slot2
	slot2 = self._item_input_action_map
	slot3 = ItemColumn
	slot3 = slot3.TYPE
	slot4 = callback
	slot6 = self
	slot7 = self
	slot8 = "input_item"
	slot4 = slot4(slot5, slot6, slot7)
	slot2[slot3] = slot4
	slot2 = self._item_input_action_map
	slot3 = ItemServerColumn
	slot3 = slot3.TYPE
	slot4 = callback
	slot6 = self
	slot7 = self
	slot8 = "input_item"
	slot4 = slot4(slot5, slot6, slot7)
	slot2[slot3] = slot4
	slot2 = self._item_input_action_map
	slot3 = MenuItemLevel
	slot3 = slot3.TYPE
	slot4 = callback
	slot6 = self
	slot7 = self
	slot8 = "input_item"
	slot4 = slot4(slot5, slot6, slot7)
	slot2[slot3] = slot4
	slot2 = self._item_input_action_map
	slot3 = MenuItemMultiChoice
	slot3 = slot3.TYPE
	slot4 = callback
	slot6 = self
	slot7 = self
	slot8 = "input_multi_choice"
	slot4 = slot4(slot5, slot6, slot7)
	slot2[slot3] = slot4
	slot2 = self._item_input_action_map
	slot3 = MenuItemCustomizeController
	slot3 = slot3.TYPE
	slot4 = callback
	slot6 = self
	slot7 = self
	slot8 = "input_customize_controller"
	slot4 = slot4(slot5, slot6, slot7)
	slot2[slot3] = slot4
	slot2 = self._item_input_action_map
	slot3 = MenuItemDivider
	slot3 = slot3.TYPE
	slot4 = callback
	slot6 = self
	slot7 = self
	slot8 = "input_item"
	slot4 = slot4(slot5, slot6, slot7)
	slot2[slot3] = slot4
	slot2 = self._item_input_action_map
	slot3 = MenuItemInput
	slot3 = slot3.TYPE
	slot4 = callback
	slot6 = self
	slot7 = self
	slot8 = "input_item"
	slot4 = slot4(slot5, slot6, slot7)
	slot2[slot3] = slot4
	slot2 = {}
	self._callback_map = slot2
	slot2 = self._callback_map
	slot3 = {}
	slot2.mouse_moved = slot3
	slot2 = self._callback_map
	slot3 = {}
	slot2.mouse_pressed = slot3
	slot2 = self._callback_map
	slot3 = {}
	slot2.mouse_released = slot3
	slot2 = self._callback_map
	slot3 = {}
	slot2.mouse_clicked = slot3
	slot2 = self._callback_map
	slot3 = {}
	slot2.mouse_double_click = slot3

	return 
end

slot0.init = slot1
slot0 = MenuInput

function slot1(self, ...)
	slot1 = nil
	self._slider_marker = slot1
	slot1 = managers
	slot1 = slot1.menu
	slot3 = slot1
	slot1 = slot1.active_menu
	local active_menu = slot1(slot2)

	if active_menu then
		local menu_renderer = active_menu.renderer
		slot5 = menu_renderer
		slot3 = menu_renderer.active_node_gui
		local node_gui = slot3(slot4)

		if node_gui then
			slot4 = node_gui._listening_to_input

			if slot4 then
				return 
			end
		end

		slot4 = managers
		slot4 = slot4.system_menu

		if slot4 then
			slot4 = managers
			slot4 = slot4.system_menu
			slot6 = slot4
			slot4 = slot4.is_active
			slot4 = slot4(slot5)

			if slot4 then
				slot4 = managers
				slot4 = slot4.system_menu
				slot6 = slot4
				slot4 = slot4.is_closing
				slot4 = slot4(slot5)

				if not slot4 then
					return 
				end
			end
		end
	end

	slot2 = MenuInput
	slot2 = slot2.super
	slot2 = slot2.back
	slot4 = self

	slot2(slot3, ...)

	return 
end

slot0.back = slot1
slot0 = MenuInput

function slot1(self, position, controller_activated)
	if not controller_activated then
		slot3 = managers
		slot3 = slot3.controller
		slot5 = slot3
		slot3 = slot3.get_default_wrapper_type
		slot3 = slot3(slot4)

		if slot3 ~= "pc" then
			slot3 = managers
			slot3 = slot3.controller
			slot5 = slot3
			slot3 = slot3.get_default_wrapper_type
			slot3 = slot3(slot4)

			if slot3 ~= "steam" then
				return 
			end
		end
	end

	slot3 = true
	self._mouse_active = slot3
	local data = {}
	slot4 = callback
	slot6 = self
	slot7 = self
	slot8 = "mouse_moved"
	slot4 = slot4(slot5, slot6, slot7)
	data.mouse_move = slot4
	slot4 = callback
	slot6 = self
	slot7 = self
	slot8 = "mouse_pressed"
	slot4 = slot4(slot5, slot6, slot7)
	data.mouse_press = slot4
	slot4 = callback
	slot6 = self
	slot7 = self
	slot8 = "mouse_released"
	slot4 = slot4(slot5, slot6, slot7)
	data.mouse_release = slot4
	slot4 = callback
	slot6 = self
	slot7 = self
	slot8 = "mouse_clicked"
	slot4 = slot4(slot5, slot6, slot7)
	data.mouse_click = slot4
	slot4 = callback
	slot6 = self
	slot7 = self
	slot8 = "mouse_double_click"
	slot4 = slot4(slot5, slot6, slot7)
	data.mouse_double_click = slot4
	slot4 = self._menu_name
	data.id = slot4
	slot4 = managers
	slot4 = slot4.mouse_pointer
	slot6 = slot4
	slot4 = slot4.use_mouse
	slot7 = data
	slot8 = position

	slot4(slot5, slot6, slot7)

	return 
end

slot0.activate_mouse = slot1
slot0 = MenuInput

function slot1(self, position)
	slot2 = self._controller_mouse_active_counter
	slot2 = slot2 + 1
	self._controller_mouse_active_counter = slot2
	slot2 = Application
	slot4 = slot2
	slot2 = slot2.debug
	slot5 = "MenuInput:activate_controller_mouse()"
	slot6 = self._controller_mouse_active_counter

	slot2(slot3, slot4, slot5)

	slot2 = self._controller_mouse_active_counter

	if slot2 == 1 then
		slot2 = managers
		slot2 = slot2.mouse_pointer
		slot4 = slot2
		slot2 = slot2.change_mouse_to_controller
		slot5 = self._controller
		slot7 = slot5
		slot5 = slot5.get_controller
		slot2 = slot2(slot3, slot5(slot6))

		if slot2 then
			slot4 = self
			slot2 = self.activate_mouse
			slot5 = position
			slot6 = true

			slot2(slot3, slot4, slot5)
		end
	end

	return 
end

slot0.activate_controller_mouse = slot1
slot0 = MenuInput

function slot1(self)
	slot1 = self._controller_mouse_active_counter
	slot1 = slot1 - 1
	self._controller_mouse_active_counter = slot1
	slot1 = Application
	slot3 = slot1
	slot1 = slot1.debug
	slot4 = "MenuInput:deactivate_controller_mouse()"
	slot5 = self._controller_mouse_active_counter

	slot1(slot2, slot3, slot4)

	slot1 = self._controller_mouse_active_counter
	slot2 = 0

	if slot1 < slot2 then
	end

	slot1 = self._controller_mouse_active_counter

	if slot1 == 0 then
		slot1 = managers
		slot1 = slot1.mouse_pointer
		slot3 = slot1
		slot1 = slot1.change_controller_to_mouse
		slot1 = slot1(slot2)

		if slot1 then
			slot3 = self
			slot1 = self.deactivate_mouse

			slot1(slot2)
		end
	end

	return 
end

slot0.deactivate_controller_mouse = slot1
slot0 = MenuInput

function slot1(self)
	slot1 = self._controller

	return slot1
end

slot0.get_controller_class = slot1
slot0 = MenuInput

function slot1(self)
	slot1 = self._controller
	slot3 = slot1
	slot1 = slot1.get_controller

	return slot1(slot2)
end

slot0.get_controller = slot1
slot0 = MenuInput

function slot1(self)
	slot1 = self._mouse_active

	if not slot1 then
		return 
	end

	slot1 = false
	self._mouse_active = slot1
	slot1 = managers
	slot1 = slot1.mouse_pointer
	slot3 = slot1
	slot1 = slot1.remove_mouse
	slot4 = self._menu_name

	slot1(slot2, slot3)

	return 
end

slot0.deactivate_mouse = slot1
slot0 = MenuInput

function slot1(self, position, ...)
	slot2 = MenuInput
	slot2 = slot2.super
	slot2 = slot2.open
	slot4 = self

	slot2(slot3, ...)

	slot2 = 0
	self._page_timer = slot2
	slot2 = 0
	self.AXIS_STATUS_UP = slot2
	slot2 = 1
	self.AXIS_STATUS_PRESSED = slot2
	slot2 = 2
	self.AXIS_STATUS_DOWN = slot2
	slot2 = 3
	self.AXIS_STATUS_RELEASED = slot2
	slot2 = {}
	slot3 = self.AXIS_STATUS_UP
	slot2.x = slot3
	slot3 = self.AXIS_STATUS_UP
	slot2.y = slot3
	self._axis_status = slot2
	slot4 = self
	slot2 = self.activate_mouse
	slot5 = position

	slot2(slot3, slot4)

	slot2 = managers
	slot2 = slot2.controller
	slot4 = slot2
	slot2 = slot2.set_menu_mode_enabled
	slot5 = true

	slot2(slot3, slot4)

	return 
end

slot0.open = slot1
slot0 = MenuInput

function slot1(self, ...)
	slot1 = MenuInput
	slot1 = slot1.super
	slot1 = slot1.close
	slot3 = self

	slot1(slot2, ...)

	slot3 = self
	slot1 = self.deactivate_mouse

	slot1(slot2)

	slot1 = managers
	slot1 = slot1.controller
	slot3 = slot1
	slot1 = slot1.set_menu_mode_enabled
	slot4 = false

	slot1(slot2, slot3)

	return 
end

slot0.close = slot1
slot0 = MenuInput

function slot1(self, time)
	self._page_timer = time

	return 
end

slot0.set_page_timer = slot1
slot0 = MenuInput

function slot1(self)
	slot1 = self._force_input

	return slot1
end

slot0.force_input = slot1
slot0 = MenuInput

function slot1(self, enabled)
	self._force_input = enabled

	return 
end

slot0.set_force_input = slot1
slot0 = MenuInput

function slot1(self, accept, ...)
	slot2 = managers
	slot2 = slot2.menu
	slot4 = slot2
	slot2 = slot2.active_menu
	slot2 = slot2(slot3)

	if slot2 then
		slot2 = managers
		slot2 = slot2.menu
		slot4 = slot2
		slot2 = slot2.active_menu
		slot2 = slot2(slot3)
		slot2 = slot2.renderer
		slot4 = slot2
		slot2 = slot2.accept_input
		slot5 = accept

		slot2(slot3, slot4)
	end

	slot2 = MenuInput
	slot2 = slot2.super
	slot2 = slot2.accept_input
	slot4 = self
	slot5 = accept

	slot2(slot3, slot4, ...)

	return 
end

slot0.accept_input = slot1
slot0 = MenuInput

function slot1(self, x, y)
	slot3 = managers
	slot3 = slot3.mouse_pointer
	slot5 = slot3
	slot3 = slot3.convert_mouse_pos
	slot6 = x
	slot7 = y

	return slot3(slot4, slot5, slot6)
end

slot0._modified_mouse_pos = slot1
slot0 = MenuInput

function slot1(self, o, x, y, mouse_ws)
	slot5 = managers
	slot5 = slot5.menu
	slot7 = slot5
	slot5 = slot5.active_menu
	slot5 = slot5(slot6)

	if not slot5 then
		return 
	end

	slot5 = false
	self._keyboard_used = slot5
	slot5 = true
	self._mouse_moved = slot5
	slot7 = self
	slot5 = self._modified_mouse_pos
	slot8 = x
	slot9 = y
	slot5, slot6 = slot5(slot6, slot7, slot8)
	y = slot6
	x = slot5
	slot5 = self._slider_marker

	if slot5 then
		slot5 = self._slider_marker
		local row_item = slot5.row_item
		slot6 = alive
		slot8 = row_item.gui_slider
		slot6 = slot6(slot7)

		if slot6 then
			slot6 = row_item.gui_slider
			slot8 = slot6
			slot6 = slot6.world_left
			slot6 = slot6(slot7)
			slot6 = x - slot6
			slot7 = row_item.gui_slider
			slot9 = slot7
			slot7 = slot7.world_right
			slot7 = slot7(slot8)
			slot8 = row_item.gui_slider
			slot10 = slot8
			slot8 = slot8.world_left
			slot8 = slot8(slot9)
			slot7 = slot7 - slot8
			local where = slot6 / slot7
			slot7 = self._slider_marker
			local item = slot7.item
			slot10 = item
			slot8 = item.set_value_by_percentage
			slot11 = where * 100

			slot8(slot9, slot10)

			slot8 = self._logic
			slot10 = slot8
			slot8 = slot8.trigger_item
			slot11 = true
			slot12 = item

			slot8(slot9, slot10, slot11)

			slot8 = managers
			slot8 = slot8.mouse_pointer
			slot10 = slot8
			slot8 = slot8.set_pointer_image
			slot11 = "grab"

			slot8(slot9, slot10)
		end

		return 
	end

	slot5 = managers
	slot5 = slot5.menu
	slot7 = slot5
	slot5 = slot5.active_menu
	slot5 = slot5(slot6)
	slot5 = slot5.renderer
	slot7 = slot5
	slot5 = slot5.active_node_gui
	local node_gui = slot5(slot6)
	local select_item, select_row_item = nil

	if node_gui then
		slot8 = managers
		slot8 = slot8.menu_component
		slot10 = slot8
		slot8 = slot8.input_focus
		slot8 = slot8(slot9)

		if slot8 ~= true then
			slot10 = node_gui
			slot8 = node_gui.item_panel_parent
			slot8 = slot8(slot9)
			slot10 = slot8
			slot8 = slot8.inside
			slot11 = x
			slot12 = y
			local inside_item_panel_parent = slot8(slot9, slot10, slot11)
			slot9 = pairs
			slot11 = node_gui.row_items
			slot9, slot10, slot11 = slot9(slot10)

			for _, row_item in slot9, slot10, slot11 do
				slot14 = row_item.item
				slot16 = slot14
				slot14 = slot14.parameters
				slot14 = slot14(slot15)
				slot14 = slot14.pd2_corner

				if slot14 then
					slot14 = row_item.gui_text
					slot16 = slot14
					slot14 = slot14.inside
					slot17 = x
					slot18 = y
					slot14 = slot14(slot15, slot16, slot17)

					if slot14 then
						slot14 = self._logic
						slot16 = slot14
						slot14 = slot14.get_item
						slot17 = row_item.name
						slot14 = slot14(slot15, slot16)
						slot14 = slot14.TYPE

						if slot14 ~= "divider" then
							select_item = row_item.name
							select_row_item = row_item
						end
					end
				elseif inside_item_panel_parent then
					slot14 = row_item.gui_panel
					slot16 = slot14
					slot14 = slot14.inside
					slot17 = x
					slot18 = y
					slot14 = slot14(slot15, slot16, slot17)

					if slot14 then
						slot14 = self._logic
						slot16 = slot14
						slot14 = slot14.get_item
						slot17 = row_item.name
						local item = slot14(slot15, slot16)

						if item then
							slot15 = item.TYPE
						elseif not item then
							slot15 = Application
							slot17 = slot15
							slot15 = slot15.error
							slot18 = "[MenuInput:mouse_moved] Item not found in Menu Logic"
							slot19 = row_item.name

							slot15(slot16, slot17, slot18)
						end
					end
				end
			end
		end
	end

	if select_item then

		-- Decompilation error in this vicinity:
		slot8 = managers
		slot8 = slot8.menu
		slot10 = slot8
		slot8 = slot8.active_menu
		slot8 = slot8(slot9)
		slot8 = slot8.logic
		slot10 = slot8
		slot8 = slot8.selected_item
		local selected_item = slot8(slot9)

		return 
	end

	slot8 = managers
	slot8 = slot8.menu
	slot10 = slot8
	slot8 = slot8.active_menu
	slot8 = slot8(slot9)
	slot8 = slot8.renderer
	slot10 = slot8
	slot8 = slot8.mouse_moved
	slot11 = o
	slot12 = x
	slot13 = y
	local used, pointer = slot8(slot9, slot10, slot11, slot12)

	if used then
		slot10 = managers
		slot10 = slot10.mouse_pointer
		slot12 = slot10
		slot10 = slot10.set_pointer_image
		slot13 = pointer

		slot10(slot11, slot12)

		return 
	end

	slot10 = pairs
	slot12 = self._callback_map
	slot12 = slot12.mouse_moved
	slot10, slot11, slot12 = slot10(slot11)

	for i, clbk in slot10, slot11, slot12 do
		slot15 = clbk
		slot17 = o
		slot18 = x
		slot19 = y
		slot20 = mouse_ws

		slot15(slot16, slot17, slot18, slot19)
	end

	slot10 = managers
	slot10 = slot10.mouse_pointer
	slot12 = slot10
	slot10 = slot10.set_pointer_image
	slot13 = "arrow"

	slot10(slot11, slot12)

	return 
end

slot0.mouse_moved = slot1
slot0 = MenuInput

function slot1(self, item, controller, mouse_click)
	local slider_delay_down = 0.1
	local slider_delay_pressed = 0.2
	slot8 = self
	slot6 = self.menu_right_input_bool
	slot6 = slot6(slot7)

	if slot6 then
		slot8 = item
		slot6 = item.next
		slot6 = slot6(slot7)

		if slot6 then
			slot8 = self
			slot6 = self.post_event
			slot9 = "selection_next"

			slot6(slot7, slot8)
		end

		slot6 = self._logic
		slot8 = slot6
		slot6 = slot6.trigger_item
		slot9 = true
		slot10 = item

		slot6(slot7, slot8, slot9)

		slot8 = self
		slot6 = self.set_axis_x_timer
		slot9 = slider_delay_down

		slot6(slot7, slot8)

		slot8 = self
		slot6 = self.menu_right_pressed
		slot6 = slot6(slot7)

		if slot6 then
			slot8 = self
			slot6 = self.set_axis_x_timer
			slot9 = slider_delay_pressed

			slot6(slot7, slot8)
		end
	else
		slot8 = self
		slot6 = self.menu_left_input_bool
		slot6 = slot6(slot7)

		if slot6 then
			slot8 = item
			slot6 = item.previous
			slot6 = slot6(slot7)

			if slot6 then
				slot8 = self
				slot6 = self.post_event
				slot9 = "selection_previous"

				slot6(slot7, slot8)
			end

			slot6 = self._logic
			slot8 = slot6
			slot6 = slot6.trigger_item
			slot9 = true
			slot10 = item

			slot6(slot7, slot8, slot9)

			slot8 = self
			slot6 = self.set_axis_x_timer
			slot9 = slider_delay_down

			slot6(slot7, slot8)

			slot8 = self
			slot6 = self.menu_left_pressed
			slot6 = slot6(slot7)

			if slot6 then
				slot8 = self
				slot6 = self.set_axis_x_timer
				slot9 = slider_delay_pressed

				slot6(slot7, slot8)
			end
		end
	end

	slot8 = controller
	slot6 = controller.get_input_pressed
	slot9 = "confirm"
	slot6 = slot6(slot7, slot8)

	if slot6 or mouse_click then
		slot8 = item
		slot6 = item.next
		slot6 = slot6(slot7)

		if slot6 then
			slot8 = self
			slot6 = self.post_event
			slot9 = "selection_next"

			slot6(slot7, slot8)
		end

		slot6 = self._logic
		slot8 = slot6
		slot6 = slot6.trigger_item
		slot9 = true
		slot10 = item

		slot6(slot7, slot8, slot9)
	end

	return 
end

slot0.input_kitslot = slot1
slot0 = MenuInput

function slot1(self, item, controller, mouse_click)
	local slider_delay_down = 0.1
	local slider_delay_pressed = 0.2
	slot6 = managers
	slot6 = slot6.menu
	slot8 = slot6
	slot6 = slot6.active_menu
	slot6 = slot6(slot7)
	slot6 = slot6.renderer
	slot8 = slot6
	slot6 = slot6.active_node_gui
	local node_gui = slot6(slot7)

	if node_gui then
		slot7 = node_gui._listening_to_input

		if slot7 then
			return 
		end
	end

	slot9 = self
	slot7 = self.menu_right_input_bool
	slot7 = slot7(slot8)

	if slot7 then
		slot9 = item
		slot7 = item.next
		slot7 = slot7(slot8)

		if slot7 then
			slot9 = self
			slot7 = self.post_event
			slot10 = "selection_next"

			slot7(slot8, slot9)

			slot7 = self._logic
			slot9 = slot7
			slot7 = slot7.trigger_item
			slot10 = true
			slot11 = item

			slot7(slot8, slot9, slot10)
		end

		slot9 = self
		slot7 = self.set_axis_x_timer
		slot10 = slider_delay_down

		slot7(slot8, slot9)

		slot9 = self
		slot7 = self.menu_right_pressed
		slot7 = slot7(slot8)

		if slot7 then
			slot9 = self
			slot7 = self.set_axis_x_timer
			slot10 = slider_delay_pressed

			slot7(slot8, slot9)
		end
	else
		slot9 = self
		slot7 = self.menu_left_input_bool
		slot7 = slot7(slot8)

		if slot7 then
			slot9 = item
			slot7 = item.previous
			slot7 = slot7(slot8)

			if slot7 then
				slot9 = self
				slot7 = self.post_event
				slot10 = "selection_previous"

				slot7(slot8, slot9)

				slot7 = self._logic
				slot9 = slot7
				slot7 = slot7.trigger_item
				slot10 = true
				slot11 = item

				slot7(slot8, slot9, slot10)
			end

			slot9 = self
			slot7 = self.set_axis_x_timer
			slot10 = slider_delay_down

			slot7(slot8, slot9)

			slot9 = self
			slot7 = self.menu_left_pressed
			slot7 = slot7(slot8)

			if slot7 then
				slot9 = self
				slot7 = self.set_axis_x_timer
				slot10 = slider_delay_pressed

				slot7(slot8, slot9)
			end
		end
	end

	slot9 = controller
	slot7 = controller.get_input_pressed
	slot10 = "confirm"
	slot7 = slot7(slot8, slot9)

	if slot7 or mouse_click then
		slot9 = item
		slot7 = item.next
		slot7 = slot7(slot8)

		if slot7 then
			slot9 = self
			slot7 = self.post_event
			slot10 = "selection_next"

			slot7(slot8, slot9)

			slot7 = self._logic
			slot9 = slot7
			slot7 = slot7.trigger_item
			slot10 = true
			slot11 = item

			slot7(slot8, slot9, slot10)
		end
	end

	return 
end

slot0.input_multi_choice = slot1
slot0 = MenuInput

function slot1(self, item, controller, mouse_click)
	slot6 = controller
	slot4 = controller.get_input_pressed
	slot7 = "confirm"
	slot4 = slot4(slot5, slot6)

	if slot4 or mouse_click then
		slot6 = item
		slot4 = item.toggle

		slot4(slot5)

		slot4 = self._logic
		slot6 = slot4
		slot4 = slot4.trigger_item
		slot7 = true
		slot8 = item

		slot4(slot5, slot6, slot7)
	end

	return 
end

slot0.input_expand = slot1
slot0 = MenuInput

function slot1(self, item, controller, mouse_click)
	slot6 = controller
	slot4 = controller.get_input_pressed
	slot7 = "confirm"
	slot4 = slot4(slot5, slot6)

	if not slot4 and mouse_click then
	end

	return 
end

slot0.input_chat = slot1
slot0 = MenuInput

function slot1(self, item, controller, mouse_click)
	slot6 = controller
	slot4 = controller.get_input_pressed
	slot7 = "confirm"
	slot4 = slot4(slot5, slot6)

	if slot4 or mouse_click then
		slot4 = managers
		slot4 = slot4.menu
		slot6 = slot4
		slot4 = slot4.active_menu
		slot4 = slot4(slot5)
		slot4 = slot4.renderer
		slot6 = slot4
		slot4 = slot4.active_node_gui
		local node_gui = slot4(slot5)

		if node_gui then
			slot5 = node_gui._listening_to_input

			if slot5 then
				return 
			end
		end

		slot5 = managers
		slot5 = slot5.menu
		slot7 = slot5
		slot5 = slot5.active_menu
		slot5 = slot5(slot6)
		slot5 = slot5.renderer
		slot7 = slot5
		slot5 = slot5.active_node_gui
		local node_gui = slot5(slot6)
		slot8 = node_gui
		slot6 = node_gui.activate_customize_controller
		slot9 = item

		slot6(slot7, slot8)
	end

	return 
end

slot0.input_customize_controller = slot1
slot0 = MenuInput

function slot1(self)
	return (self._accept_input and true) or false
end

slot0.get_accept_input = slot1
slot0 = MenuInput

function slot1(self, input, name, callback)
	slot4 = self._callback_map
	slot4 = slot4[input]

	if not slot4 then
		slot4 = Application
		slot6 = slot4
		slot4 = slot4.error
		slot7 = "MenuInput:register_callback"
		slot8 = "Failed to register callback"
		slot9 = "input: "
		slot10 = input
		slot9 = slot9 .. slot10
		slot10 = "name: "
		slot11 = name
		slot10 = slot10 .. slot11

		slot4(slot5, slot6, slot7, slot8, slot9)

		return 
	end

	slot4 = self._callback_map
	slot4 = slot4[input]
	slot4[name] = callback

	return 
end

slot0.register_callback = slot1
slot0 = MenuInput

function slot1(self, input, name)
	slot3 = self._callback_map
	slot3 = slot3[input]

	if not slot3 then
		slot3 = Application
		slot5 = slot3
		slot3 = slot3.error
		slot6 = "MenuInput:register_callback"
		slot7 = "Failed to unregister callback"
		slot8 = "input: "
		slot9 = input
		slot8 = slot8 .. slot9
		slot9 = "name: "
		slot10 = name
		slot9 = slot9 .. slot10

		slot3(slot4, slot5, slot6, slot7, slot8)

		return 
	end

	slot3 = self._callback_map
	slot3 = slot3[input]
	slot4 = nil
	slot3[name] = slot4

	return 
end

slot0.unregister_callback = slot1
slot0 = MenuInput

function slot1(self)
	slot1 = self._logic
	slot3 = slot1
	slot1 = slot1.selected_item
	local item = slot1(slot2)

	if item then
		slot2 = item.TYPE

		if slot2 == "input" then
			slot4 = item
			slot2 = item.focus
			slot2 = slot2(slot3)
			slot2 = not slot2

			return slot2
		end
	end

	slot2 = true

	return slot2
end

slot0.can_toggle_chat = slot1
slot0 = MenuInput

function slot1(self, o, button, x, y)
	slot5 = self._accept_input

	if not slot5 then
		return 
	end

	slot5 = managers
	slot5 = slot5.blackmarket

	if slot5 then
		slot5 = managers
		slot5 = slot5.blackmarket
		slot7 = slot5
		slot5 = slot5.is_preloading_weapons
		slot5 = slot5(slot6)

		if slot5 then
			return 
		end
	end

	slot5 = managers
	slot5 = slot5.menu
	slot7 = slot5
	slot5 = slot5.active_menu
	slot5 = slot5(slot6)

	if not slot5 then
		return 
	end

	slot5 = false
	self._keyboard_used = slot5
	slot7 = self
	slot5 = self._modified_mouse_pos
	slot8 = x
	slot9 = y
	slot5, slot6 = slot5(slot6, slot7, slot8)
	y = slot6
	x = slot5
	slot5 = managers
	slot5 = slot5.menu
	slot7 = slot5
	slot5 = slot5.active_menu
	slot5 = slot5(slot6)
	slot5 = slot5.renderer
	slot7 = slot5
	slot5 = slot5.mouse_pressed
	slot8 = o
	slot9 = button
	slot10 = x
	slot11 = y
	slot5 = slot5(slot6, slot7, slot8, slot9, slot10)

	if slot5 then
		return 
	end

	slot5 = pairs
	slot7 = self._callback_map
	slot7 = slot7.mouse_pressed
	slot5, slot6, slot7 = slot5(slot6)

	for i, clbk in slot5, slot6, slot7 do
		slot10 = clbk
		slot12 = o
		slot13 = button
		slot14 = x
		slot15 = y

		slot10(slot11, slot12, slot13, slot14)
	end

	return 
end

slot0.mouse_pressed = slot1
slot0 = MenuInput

function slot1(self, o, button, x, y)
	slot5 = managers
	slot5 = slot5.menu
	slot7 = slot5
	slot5 = slot5.active_menu
	slot5 = slot5(slot6)

	if not slot5 then
		return 
	end

	slot7 = self
	slot5 = self._modified_mouse_pos
	slot8 = x
	slot9 = y
	slot5, slot6 = slot5(slot6, slot7, slot8)
	y = slot6
	x = slot5
	slot5 = self._slider_marker

	if slot5 then
		slot7 = self
		slot5 = self.post_event
		slot8 = "slider_release"

		slot5(slot6, slot7)
	end

	slot5 = nil
	self._slider_marker = slot5
	slot5 = Idstring
	slot7 = "0"
	slot5 = slot5(slot6)

	if button == slot5 then
		slot5 = managers
		slot5 = slot5.menu_component
		slot7 = slot5
		slot5 = slot5.input_focus
		slot5 = slot5(slot6)

		if slot5 ~= true then

			-- Decompilation error in this vicinity:
			slot5 = managers
			slot5 = slot5.menu
			slot7 = slot5
			slot5 = slot5.active_menu
			slot5 = slot5(slot6)
			slot5 = slot5.renderer
			slot7 = slot5
			slot5 = slot5.active_node_gui
			local node_gui = slot5(slot6)

			if node_gui then
				slot6 = pairs
				slot8 = node_gui.row_items
				slot6, slot7, slot8 = slot6(slot7)

				for _, row_item in slot6, slot7, slot8 do
					slot11 = row_item.item
					slot13 = slot11
					slot11 = slot11.parameters
					slot11 = slot11(slot12)
					slot11 = slot11.pd2_corner

					if slot11 then
						slot11 = row_item.gui_text
						slot13 = slot11
						slot11 = slot11.inside
						slot14 = x
						slot15 = y
						slot11 = slot11(slot12, slot13, slot14)

						if slot11 then
							slot11 = self._logic
							slot13 = slot11
							slot11 = slot11.selected_item
							local item = slot11(slot12)

							if item then
								slot12 = self._item_input_action_map
								slot13 = item.TYPE
								slot12 = slot12[slot13]
								slot14 = item
								slot15 = self._controller
								slot16 = true

								slot12(slot13, slot14, slot15)

								slot12 = node_gui.mouse_pressed

								if slot12 then
									slot14 = node_gui
									slot12 = node_gui.mouse_pressed
									slot15 = button
									slot16 = x
									slot17 = y
									slot12 = slot12(slot13, slot14, slot15, slot16)
								end

								return slot12
							end
						end
					else
						slot11 = row_item.gui_panel
						slot13 = slot11
						slot11 = slot11.inside
						slot14 = x
						slot15 = y
						slot11 = slot11(slot12, slot13, slot14)

						if slot11 then
							slot11 = node_gui._item_panel_parent
							slot13 = slot11
							slot11 = slot11.inside
							slot14 = x
							slot15 = y
							slot11 = slot11(slot12, slot13, slot14)

							if slot11 then
								slot11 = row_item.type

								if slot11 == "divider" then
								else
									slot11 = row_item.type

									if slot11 == "slider" then
										slot13 = self
										slot11 = self.post_event
										slot14 = "slider_grab"

										slot11(slot12, slot13)

										slot11 = row_item.gui_slider_marker
										slot13 = slot11
										slot11 = slot11.inside
										slot14 = x
										slot15 = y
										slot11 = slot11(slot12, slot13, slot14)

										if slot11 then
											slot11 = {
												button = button
											}
											slot12 = row_item.item
											slot11.item = slot12
											slot11.row_item = row_item
											self._slider_marker = slot11
										else
											slot11 = row_item.gui_slider
											slot13 = slot11
											slot11 = slot11.inside
											slot14 = x
											slot15 = y
											slot11 = slot11(slot12, slot13, slot14)

											if slot11 then
												slot11 = row_item.gui_slider
												slot13 = slot11
												slot11 = slot11.world_left
												slot11 = slot11(slot12)
												slot11 = x - slot11
												slot12 = row_item.gui_slider
												slot14 = slot12
												slot12 = slot12.world_right
												slot12 = slot12(slot13)
												slot13 = row_item.gui_slider
												slot15 = slot13
												slot13 = slot13.world_left
												slot13 = slot13(slot14)
												slot12 = slot12 - slot13
												local where = slot11 / slot12
												local item = row_item.item
												slot15 = item
												slot13 = item.set_value_by_percentage
												slot16 = where * 100

												slot13(slot14, slot15)

												slot13 = self._logic
												slot15 = slot13
												slot13 = slot13.trigger_item
												slot16 = true
												slot17 = item

												slot13(slot14, slot15, slot16)

												slot13 = {
													button = button
												}
												slot14 = row_item.item
												slot13.item = slot14
												slot13.row_item = row_item
												self._slider_marker = slot13
											end
										end
									else
										slot11 = row_item.type

										if slot11 == "kitslot" then
											slot11 = self._logic
											slot13 = slot11
											slot11 = slot11.selected_item
											local item = slot11(slot12)
											slot12 = row_item.arrow_right
											slot14 = slot12
											slot12 = slot12.inside
											slot15 = x
											slot16 = y
											slot12 = slot12(slot13, slot14, slot15)

											if slot12 then
												slot14 = item
												slot12 = item.next

												slot12(slot13)

												slot12 = self._logic
												slot14 = slot12
												slot12 = slot12.trigger_item
												slot15 = true
												slot16 = item

												slot12(slot13, slot14, slot15)

												slot12 = row_item.arrow_right
												slot14 = slot12
												slot12 = slot12.visible
												slot12 = slot12(slot13)

												if slot12 then
													slot14 = self
													slot12 = self.post_event
													slot15 = "selection_next"

													slot12(slot13, slot14)
												end
											else
												slot12 = row_item.arrow_left
												slot14 = slot12
												slot12 = slot12.inside
												slot15 = x
												slot16 = y
												slot12 = slot12(slot13, slot14, slot15)

												if slot12 then
													slot14 = item
													slot12 = item.previous

													slot12(slot13)

													slot12 = self._logic
													slot14 = slot12
													slot12 = slot12.trigger_item
													slot15 = true
													slot16 = item

													slot12(slot13, slot14, slot15)

													slot12 = row_item.arrow_left
													slot14 = slot12
													slot12 = slot12.visible
													slot12 = slot12(slot13)

													if slot12 then
														slot14 = self
														slot12 = self.post_event
														slot15 = "selection_previous"

														slot12(slot13, slot14)
													end
												else
													slot12 = row_item.choice_panel
													slot14 = slot12
													slot12 = slot12.inside
													slot15 = x
													slot16 = y
													slot12 = slot12(slot13, slot14, slot15)

													if not slot12 then
														slot12 = self._item_input_action_map
														slot13 = item.TYPE
														slot12 = slot12[slot13]
														slot14 = item
														slot15 = self._controller
														slot16 = true

														slot12(slot13, slot14, slot15)

														slot12 = node_gui.mouse_pressed

														if slot12 then
															slot14 = node_gui
															slot12 = node_gui.mouse_pressed
															slot15 = button
															slot16 = x
															slot17 = y
															slot12 = slot12(slot13, slot14, slot15, slot16)
														end

														return slot12
													end
												end
											end
										else
											slot11 = row_item.type

											if slot11 == "multi_choice" then
												local item = row_item.item
												slot12 = row_item.arrow_right
												slot14 = slot12
												slot12 = slot12.inside
												slot15 = x
												slot16 = y
												slot12 = slot12(slot13, slot14, slot15)

												if slot12 then
													slot14 = item
													slot12 = item.next
													slot12 = slot12(slot13)

													if slot12 then
														slot14 = self
														slot12 = self.post_event
														slot15 = "selection_next"

														slot12(slot13, slot14)

														slot12 = self._logic
														slot14 = slot12
														slot12 = slot12.trigger_item
														slot15 = true
														slot16 = item

														slot12(slot13, slot14, slot15)
													end
												else
													slot12 = row_item.arrow_left
													slot14 = slot12
													slot12 = slot12.inside
													slot15 = x
													slot16 = y
													slot12 = slot12(slot13, slot14, slot15)

													if slot12 then
														slot14 = item
														slot12 = item.previous
														slot12 = slot12(slot13)

														if slot12 then
															slot14 = self
															slot12 = self.post_event
															slot15 = "selection_previous"

															slot12(slot13, slot14)

															slot12 = self._logic
															slot14 = slot12
															slot12 = slot12.trigger_item
															slot15 = true
															slot16 = item

															slot12(slot13, slot14, slot15)
														end
													else
														slot12 = row_item.gui_text
														slot14 = slot12
														slot12 = slot12.inside
														slot15 = x
														slot16 = y
														slot12 = slot12(slot13, slot14, slot15)

														if slot12 then
															slot12 = row_item.align

															if slot12 == "left" then
																slot14 = item
																slot12 = item.previous
																slot12 = slot12(slot13)

																if slot12 then
																	slot14 = self
																	slot12 = self.post_event
																	slot15 = "selection_previous"

																	slot12(slot13, slot14)

																	slot12 = self._logic
																	slot14 = slot12
																	slot12 = slot12.trigger_item
																	slot15 = true
																	slot16 = item

																	slot12(slot13, slot14, slot15)
																end
															else
																slot14 = item
																slot12 = item.next
																slot12 = slot12(slot13)

																if slot12 then
																	slot14 = self
																	slot12 = self.post_event
																	slot15 = "selection_next"

																	slot12(slot13, slot14)

																	slot12 = self._logic
																	slot14 = slot12
																	slot12 = slot12.trigger_item
																	slot15 = true
																	slot16 = item

																	slot12(slot13, slot14, slot15)
																end
															end
														end
													end
												end
											else
												slot11 = row_item.type

												if slot11 == "chat" then
													slot11 = self._logic
													slot13 = slot11
													slot11 = slot11.selected_item
													local item = slot11(slot12)
													slot12 = row_item.chat_input
													slot14 = slot12
													slot12 = slot12.inside
													slot15 = x
													slot16 = y
													slot12 = slot12(slot13, slot14, slot15)

													if slot12 then
														slot12 = row_item.chat_input
														slot14 = slot12
														slot12 = slot12.script
														slot12 = slot12(slot13)
														slot12 = slot12.set_focus
														slot14 = true

														slot12(slot13)
													end
												else
													slot11 = self._logic
													slot13 = slot11
													slot11 = slot11.selected_item
													local item = slot11(slot12)

													if item then
														slot12 = self._item_input_action_map
														slot13 = item.TYPE
														slot12 = slot12[slot13]
														slot14 = item
														slot15 = self._controller
														slot16 = true

														slot12(slot13, slot14, slot15)

														slot12 = node_gui.mouse_pressed

														if slot12 then
															slot14 = node_gui
															slot12 = node_gui.mouse_pressed
															slot15 = button
															slot16 = x
															slot17 = y
															slot12 = slot12(slot13, slot14, slot15, slot16)
														end

														return slot12
													end
												end
											end
										end
									end
								end
							end
						end
					end
				end
			end
		end
	end

	slot5 = managers
	slot5 = slot5.menu
	slot7 = slot5
	slot5 = slot5.active_menu
	slot5 = slot5(slot6)
	slot5 = slot5.renderer
	slot7 = slot5
	slot5 = slot5.mouse_released
	slot8 = o
	slot9 = button
	slot10 = x
	slot11 = y
	slot5 = slot5(slot6, slot7, slot8, slot9, slot10)

	if slot5 then
		return 
	end

	slot5 = pairs
	slot7 = self._callback_map
	slot7 = slot7.mouse_released
	slot5, slot6, slot7 = slot5(slot6)

	for i, clbk in slot5, slot6, slot7 do
		slot10 = clbk
		slot12 = o
		slot13 = button
		slot14 = x
		slot15 = y

		slot10(slot11, slot12, slot13, slot14)
	end

	return 
end

slot0.mouse_released = slot1
slot0 = MenuInput

function slot1(self, o, button, x, y)

	-- Decompilation error in this vicinity:
	slot7 = self
	slot5 = self._modified_mouse_pos
	slot8 = x
	slot9 = y
	slot5, slot6 = slot5(slot6, slot7, slot8)
	y = slot6
	x = slot5
	slot5 = pairs
	slot7 = self._callback_map
	slot7 = slot7.mouse_clicked
	slot5, slot6, slot7 = slot5(slot6)

	for i, clbk in slot5, slot6, slot7 do
		slot10 = clbk
		slot12 = o
		slot13 = button
		slot14 = x
		slot15 = y

		slot10(slot11, slot12, slot13, slot14)
	end

	slot5 = managers
	slot5 = slot5.menu
	slot7 = slot5
	slot5 = slot5.active_menu
	slot5 = slot5(slot6)
	slot5 = managers
	slot5 = slot5.menu
	slot7 = slot5
	slot5 = slot5.active_menu
	slot5 = slot5(slot6)
	slot5 = slot5.renderer
	slot7 = slot5
	slot5 = slot5.mouse_clicked
	slot8 = o
	slot9 = button
	slot10 = x
	slot11 = y

	return slot5(slot6, slot7, slot8, slot9, slot10)
end

slot0.mouse_clicked = slot1
slot0 = MenuInput

function slot1(self, o, button, x, y)

	-- Decompilation error in this vicinity:
	slot7 = self
	slot5 = self._modified_mouse_pos
	slot8 = x
	slot9 = y
	slot5, slot6 = slot5(slot6, slot7, slot8)
	y = slot6
	x = slot5
	slot5 = pairs
	slot7 = self._callback_map
	slot7 = slot7.mouse_double_click
	slot5, slot6, slot7 = slot5(slot6)

	for i, clbk in slot5, slot6, slot7 do
		slot10 = clbk
		slot12 = o
		slot13 = button
		slot14 = x
		slot15 = y

		slot10(slot11, slot12, slot13, slot14)
	end

	slot5 = managers
	slot5 = slot5.menu
	slot7 = slot5
	slot5 = slot5.active_menu
	slot5 = slot5(slot6)
	slot5 = managers
	slot5 = slot5.menu
	slot7 = slot5
	slot5 = slot5.active_menu
	slot5 = slot5(slot6)
	slot5 = slot5.renderer
	slot7 = slot5
	slot5 = slot5.mouse_double_click
	slot8 = o
	slot9 = button
	slot10 = x
	slot11 = y

	return slot5(slot6, slot7, slot8, slot9, slot10)
end

slot0.mouse_double_click = slot1
slot0 = MenuInput

function slot1(self, t, dt)

	-- Decompilation error in this vicinity:
	slot3 = self._menu_plane

	if slot3 then
		slot3 = self._menu_plane
		slot5 = slot3
		slot3 = slot3.set_rotation
		slot6 = Rotation
		slot8 = math
		slot8 = slot8.sin
		slot10 = t * 60
		slot8 = slot8(slot9)
		slot8 = slot8 * 40
		slot9 = math
		slot9 = slot9.sin
		slot11 = t * 50
		slot9 = slot9(slot10)
		slot9 = slot9 * 30
		slot10 = 0

		slot3(slot4, slot6(slot7, slot8, slot9))
	end

	slot5 = self
	slot3 = self._update_axis_status

	slot3(slot4)

	slot3 = managers
	slot3 = slot3.blackmarket

	if slot3 then
		slot3 = managers
		slot3 = slot3.blackmarket
		slot5 = slot3
		slot3 = slot3.is_preloading_weapons
		slot3 = slot3(slot4)

		if slot3 then
			return 
		end
	end

	slot3 = managers
	slot3 = slot3.system_menu

	if slot3 then
		slot3 = managers
		slot3 = slot3.system_menu
		slot5 = slot3
		slot3 = slot3.is_active
		slot3 = slot3(slot4)

		if slot3 then
			slot3 = managers
			slot3 = slot3.system_menu
			slot5 = slot3
			slot3 = slot3.is_closing
			slot3 = slot3(slot4)

			if not slot3 then
				return 
			end
		end
	end

	slot3 = self._page_timer
	slot4 = 0

	if slot4 < slot3 then
		slot5 = self
		slot3 = self.set_page_timer
		slot6 = self._page_timer
		slot6 = slot6 - dt

		slot3(slot4, slot5)
	end

	slot3 = MenuInput
	slot3 = slot3.super
	slot3 = slot3.update
	slot5 = self
	slot6 = t
	slot7 = dt
	slot3 = slot3(slot4, slot5, slot6)
	slot3 = self._keyboard_used

	if not slot3 then
		slot3 = self._mouse_active

		if slot3 then
			slot3 = self._accept_input

			if slot3 then
				slot3 = self._mouse_moved

				if not slot3 then
					slot5 = self
					slot3 = self.mouse_moved
					slot6 = managers
					slot6 = slot6.mouse_pointer
					slot8 = slot6
					slot6 = slot6.mouse
					slot6 = slot6(slot7)
					slot7 = managers
					slot7 = slot7.mouse_pointer
					slot9 = slot7
					slot7 = slot7.world_position

					slot3(slot4, slot5, slot7(slot8))
				end
			end
		end
	end

	slot3 = nil
	self._mouse_moved = slot3

	return 
end

slot0.update = slot1
slot0 = MenuInput

function slot1(self)
	local axis_moved = {
		x = 0,
		y = 0
	}
	slot2 = self._controller

	if slot2 then
		slot2 = self._controller
		slot4 = slot2
		slot2 = slot2.get_input_axis
		slot5 = "menu_move"
		local move = slot2(slot3, slot4)

		if move then
			axis_moved = move
		end
	end

	return axis_moved
end

slot0.menu_axis_move = slot1
slot0 = MenuInput

function slot1(self)
	local axis_scrolled = {
		x = 0,
		y = 0
	}
	slot2 = self._controller

	if slot2 then
		slot2 = self._controller
		slot4 = slot2
		slot2 = slot2.get_input_axis
		slot5 = "menu_scroll"
		local scroll = slot2(slot3, slot4)

		if scroll then
			axis_scrolled = scroll
		end
	end

	return axis_scrolled
end

slot0.menu_axis_scroll = slot1
slot0 = MenuInput

function slot1(self, event)
	slot2 = self._sound_source
	slot4 = slot2
	slot2 = slot2.post_event
	slot5 = event

	slot2(slot3, slot4)

	return 
end

slot0.post_event = slot1
slot0 = MenuInput

function slot1(self)
	local result_1 = MenuInput.super.menu_up_input_bool(slot2)
	slot4 = self
	local result_2 = self._move_axis_limit < self.menu_axis_move(self).y

	return result_1 or result_2
end

slot0.menu_up_input_bool = slot1
slot0 = MenuInput

function slot1(self)
	slot1 = MenuInput
	slot1 = slot1.super
	slot1 = slot1.menu_up_pressed
	slot3 = self
	slot1 = slot1(slot2)

	if not slot1 then

		-- Decompilation error in this vicinity:
		slot1 = self._axis_status
		slot1 = slot1.y
		slot2 = self.AXIS_STATUS_PRESSED
		slot3 = self

		return 0 < self.menu_axis_move(slot2).y
	end
end

slot0.menu_up_pressed = slot1
slot0 = MenuInput

function slot1(self)
	slot1 = MenuInput
	slot1 = slot1.super
	slot1 = slot1.menu_up_released
	slot3 = self
	slot1 = slot1(slot2)

	if not slot1 then
		return self._axis_status.y == self.AXIS_STATUS_RELEASED
	end
end

slot0.menu_up_released = slot1
slot0 = MenuInput

function slot1(self)
	slot1 = MenuInput
	slot1 = slot1.super
	slot1 = slot1.menu_down_input_bool
	slot3 = self
	slot1 = slot1(slot2)

	if not slot1 then
		slot3 = self

		return self.menu_axis_move(slot2).y < -self._move_axis_limit
	end
end

slot0.menu_down_input_bool = slot1
slot0 = MenuInput

function slot1(self)
	slot1 = MenuInput
	slot1 = slot1.super
	slot1 = slot1.menu_down_pressed
	slot3 = self
	slot1 = slot1(slot2)

	if not slot1 then

		-- Decompilation error in this vicinity:
		slot1 = self._axis_status
		slot1 = slot1.y
		slot2 = self.AXIS_STATUS_PRESSED
		slot3 = self

		return self.menu_axis_move(slot2).y < 0
	end
end

slot0.menu_down_pressed = slot1
slot0 = MenuInput

function slot1(self)
	slot1 = MenuInput
	slot1 = slot1.super
	slot1 = slot1.menu_down_released
	slot3 = self
	slot1 = slot1(slot2)

	if not slot1 then
		return self._axis_status.y == self.AXIS_STATUS_RELEASED
	end
end

slot0.menu_down_released = slot1
slot0 = MenuInput

function slot1(self)
	local result_1 = MenuInput.super.menu_left_input_bool(slot2)
	slot4 = self
	local result_2 = self.menu_axis_move(self).x < -self._move_axis_limit

	return result_1 or result_2
end

slot0.menu_left_input_bool = slot1
slot0 = MenuInput

function slot1(self)
	slot1 = MenuInput
	slot1 = slot1.super
	slot1 = slot1.menu_left_pressed
	slot3 = self
	slot1 = slot1(slot2)

	if not slot1 then

		-- Decompilation error in this vicinity:
		slot1 = self._axis_status
		slot1 = slot1.x
		slot2 = self.AXIS_STATUS_PRESSED
		slot3 = self

		return self.menu_axis_move(slot2).x < 0
	end
end

slot0.menu_left_pressed = slot1
slot0 = MenuInput

function slot1(self)
	slot1 = MenuInput
	slot1 = slot1.super
	slot1 = slot1.menu_left_released
	slot3 = self
	slot1 = slot1(slot2)

	if not slot1 then
		return self._axis_status.x == self.AXIS_STATUS_RELEASED
	end
end

slot0.menu_left_released = slot1
slot0 = MenuInput

function slot1(self)
	slot1 = MenuInput
	slot1 = slot1.super
	slot1 = slot1.menu_right_input_bool
	slot3 = self
	slot1 = slot1(slot2)

	if not slot1 then
		slot3 = self

		return self._move_axis_limit < self.menu_axis_move(slot2).x
	end
end

slot0.menu_right_input_bool = slot1
slot0 = MenuInput

function slot1(self)
	slot1 = MenuInput
	slot1 = slot1.super
	slot1 = slot1.menu_right_pressed
	slot3 = self
	slot1 = slot1(slot2)

	if not slot1 then

		-- Decompilation error in this vicinity:
		slot1 = self._axis_status
		slot1 = slot1.x
		slot2 = self.AXIS_STATUS_PRESSED
		slot3 = self

		return 0 < self.menu_axis_move(slot2).x
	end
end

slot0.menu_right_pressed = slot1
slot0 = MenuInput

function slot1(self)
	slot1 = MenuInput
	slot1 = slot1.super
	slot1 = slot1.menu_right_released
	slot3 = self
	slot1 = slot1(slot2)

	if not slot1 then
		return self._axis_status.x == self.AXIS_STATUS_RELEASED
	end
end

slot0.menu_right_released = slot1
slot0 = MenuInput

function slot1(self)
	slot3 = self

	return self._move_axis_limit < self.menu_axis_scroll(slot2).y
end

slot0.menu_scroll_up_input_bool = slot1
slot0 = MenuInput

function slot1(self)

	-- Decompilation error in this vicinity:
	slot1 = self._axis_status
	slot1 = slot1.y
	slot2 = self.AXIS_STATUS_PRESSED
end

slot0.menu_scroll_up_pressed = slot1
slot0 = MenuInput

function slot1(self)
	return self._axis_status.y == self.AXIS_STATUS_RELEASED
end

slot0.menu_scroll_up_released = slot1
slot0 = MenuInput

function slot1(self)
	slot3 = self

	return self.menu_axis_scroll(slot2).y < -self._move_axis_limit
end

slot0.menu_scroll_down_input_bool = slot1
slot0 = MenuInput

function slot1(self)

	-- Decompilation error in this vicinity:
	slot1 = self._axis_status
	slot1 = slot1.y
	slot2 = self.AXIS_STATUS_PRESSED
end

slot0.menu_scroll_down_pressed = slot1
slot0 = MenuInput

function slot1(self)
	return self._axis_status.y == self.AXIS_STATUS_RELEASED
end

slot0.menu_scroll_down_released = slot1
slot0 = MenuInput

function slot1(self)
	slot3 = self

	return self.menu_axis_scroll(slot2).x < -self._move_axis_limit
end

slot0.menu_scroll_left_input_bool = slot1
slot0 = MenuInput

function slot1(self)

	-- Decompilation error in this vicinity:
	slot1 = self._axis_status
	slot1 = slot1.x
	slot2 = self.AXIS_STATUS_PRESSED
end

slot0.menu_scroll_left_pressed = slot1
slot0 = MenuInput

function slot1(self)
	return self._axis_status.x == self.AXIS_STATUS_RELEASED
end

slot0.menu_scroll_left_released = slot1
slot0 = MenuInput

function slot1(self)
	slot3 = self

	return self._move_axis_limit < self.menu_axis_scroll(slot2).x
end

slot0.menu_scroll_right_input_bool = slot1
slot0 = MenuInput

function slot1(self)

	-- Decompilation error in this vicinity:
	slot1 = self._axis_status
	slot1 = slot1.x
	slot2 = self.AXIS_STATUS_PRESSED
end

slot0.menu_scroll_right_pressed = slot1
slot0 = MenuInput

function slot1(self)
	return self._axis_status.x == self.AXIS_STATUS_RELEASED
end

slot0.menu_scroll_right_released = slot1
slot0 = MenuInput

function slot1(self)
	slot1 = self._controller

	if slot1 then
		slot1 = self._controller
		slot3 = slot1
		slot1 = slot1.get_input_bool
		slot4 = "next_page"

		return slot1(slot2, slot3)
	end

	slot1 = false

	return slot1
end

slot0.menu_next_page_input_bool = slot1
slot0 = MenuInput

function slot1(self)
	slot1 = self._controller

	if slot1 then
		slot1 = self._controller
		slot3 = slot1
		slot1 = slot1.get_input_pressed
		slot4 = "next_page"

		return slot1(slot2, slot3)
	end

	slot1 = false

	return slot1
end

slot0.menu_next_page_pressed = slot1
slot0 = MenuInput

function slot1(self)
	slot1 = self._controller

	if slot1 then
		slot1 = self._controller
		slot3 = slot1
		slot1 = slot1.get_input_released
		slot4 = "next_page"

		return slot1(slot2, slot3)
	end

	slot1 = false

	return slot1
end

slot0.menu_next_page_released = slot1
slot0 = MenuInput

function slot1(self)
	slot1 = self._controller

	if slot1 then
		slot1 = self._controller
		slot3 = slot1
		slot1 = slot1.get_input_bool
		slot4 = "previous_page"

		return slot1(slot2, slot3)
	end

	slot1 = false

	return slot1
end

slot0.menu_previous_page_input_bool = slot1
slot0 = MenuInput

function slot1(self)
	slot1 = self._controller

	if slot1 then
		slot1 = self._controller
		slot3 = slot1
		slot1 = slot1.get_input_pressed
		slot4 = "previous_page"

		return slot1(slot2, slot3)
	end

	slot1 = false

	return slot1
end

slot0.menu_previous_page_pressed = slot1
slot0 = MenuInput

function slot1(self)
	slot1 = self._controller

	if slot1 then
		slot1 = self._controller
		slot3 = slot1
		slot1 = slot1.get_input_released
		slot4 = "previous_page"

		return slot1(slot2, slot3)
	end

	slot1 = false

	return slot1
end

slot0.menu_previous_page_released = slot1
slot0 = MenuInput

function slot1(self)
	slot3 = self
	slot1 = self.menu_axis_move
	local axis_moved = slot1(slot2)
	slot2 = self._axis_status
	slot2 = slot2.x
	slot3 = self.AXIS_STATUS_UP

	if slot2 == slot3 then
		slot2 = math
		slot2 = slot2.abs
		slot4 = axis_moved.x
		slot2 = slot2(slot3)
		slot3 = self._move_axis_limit
		slot2 = slot2 - slot3
		slot3 = 0
	else
		slot2 = math
		slot2 = slot2.abs
		slot4 = axis_moved.x
		slot2 = slot2(slot3)
		slot3 = self._move_axis_limit
		slot2 = slot2 - slot3
		slot3 = 0

		if slot3 < slot2 then
			slot2 = self._axis_status
			slot3 = self.AXIS_STATUS_DOWN
			slot2.x = slot3
		else
			slot2 = self._axis_status
			slot2 = slot2.x
			slot3 = self.AXIS_STATUS_PRESSED
		end
	end

	slot2 = self._axis_status
	slot2 = slot2.y
	slot3 = self.AXIS_STATUS_UP

	if slot2 == slot3 then
		slot2 = math
		slot2 = slot2.abs
		slot4 = axis_moved.y
		slot2 = slot2(slot3)
		slot3 = self._move_axis_limit
		slot2 = slot2 - slot3
		slot3 = 0
	else
		slot2 = math
		slot2 = slot2.abs
		slot4 = axis_moved.y
		slot2 = slot2(slot3)
		slot3 = self._move_axis_limit
		slot2 = slot2 - slot3
		slot3 = 0

		if slot3 < slot2 then
			slot2 = self._axis_status
			slot3 = self.AXIS_STATUS_DOWN
			slot2.y = slot3
		else
			slot2 = self._axis_status
			slot2 = slot2.y
			slot3 = self.AXIS_STATUS_PRESSED
		end
	end

	return 
end

slot0._update_axis_status = slot1
slot0 = MenuInput

function slot1(self)
	slot3 = self
	slot1 = self.menu_axis_scroll
	local axis_scrolled = slot1(slot2)
	slot2 = self._axis_status
	slot2 = slot2.x
	slot3 = self.AXIS_STATUS_UP

	if slot2 == slot3 then
		slot2 = math
		slot2 = slot2.abs
		slot4 = axis_scrolled.x
		slot2 = slot2(slot3)
		slot3 = self._move_axis_limit
		slot2 = slot2 - slot3
		slot3 = 0
	else
		slot2 = math
		slot2 = slot2.abs
		slot4 = axis_scrolled.x
		slot2 = slot2(slot3)
		slot3 = self._move_axis_limit
		slot2 = slot2 - slot3
		slot3 = 0

		if slot3 < slot2 then
			slot2 = self._axis_status
			slot3 = self.AXIS_STATUS_DOWN
			slot2.x = slot3
		else
			slot2 = self._axis_status
			slot2 = slot2.x
			slot3 = self.AXIS_STATUS_PRESSED
		end
	end

	slot2 = self._axis_status
	slot2 = slot2.y
	slot3 = self.AXIS_STATUS_UP

	if slot2 == slot3 then
		slot2 = math
		slot2 = slot2.abs
		slot4 = axis_scrolled.y
		slot2 = slot2(slot3)
		slot3 = self._move_axis_limit
		slot2 = slot2 - slot3
		slot3 = 0
	else
		slot2 = math
		slot2 = slot2.abs
		slot4 = axis_scrolled.y
		slot2 = slot2(slot3)
		slot3 = self._move_axis_limit
		slot2 = slot2 - slot3
		slot3 = 0

		if slot3 < slot2 then
			slot2 = self._axis_status
			slot3 = self.AXIS_STATUS_DOWN
			slot2.y = slot3
		else
			slot2 = self._axis_status
			slot2 = slot2.y
			slot3 = self.AXIS_STATUS_PRESSED
		end
	end

	return 
end

slot0._update_axis_scroll_status = slot1

return 
