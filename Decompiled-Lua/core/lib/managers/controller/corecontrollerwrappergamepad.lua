-- Decompilation Error: self.ljd.ast.slotworks.eliminate_temporary(self.ast)

-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot0 = core
slot2 = slot0
slot0 = slot0.module
slot3 = "CoreControllerWrapperGamepad"

slot0(slot1, slot2)

slot0 = core
slot2 = slot0
slot0 = slot0.import
slot3 = "CoreControllerWrapper"

slot0(slot1, slot2)

slot0 = ControllerWrapperGamepad

if not slot0 then
	slot0 = class
	slot2 = CoreControllerWrapper
	slot2 = slot2.ControllerWrapper
	slot0 = slot0(slot1)
end

ControllerWrapperGamepad = slot0
slot0 = ControllerWrapperGamepad
slot1 = "gamepad"
slot0.TYPE = slot1
slot0 = ControllerWrapperGamepad
slot1 = {
	"win32_game_controller"
}
slot0.CONTROLLER_TYPE_LIST = slot1
slot0 = ControllerWrapperGamepad
slot1 = Idstring
slot3 = "pov 0"
slot1 = slot1(slot2)
slot0.IDS_POV_0 = slot1
slot0 = ControllerWrapperGamepad
slot1 = Idstring
slot3 = "axis"
slot1 = slot1(slot2)
slot0.IDS_AXIS = slot1
slot0 = ControllerWrapperGamepad
slot1 = Idstring
slot3 = "range"
slot1 = slot1(slot2)
slot0.IDS_RANGE = slot1
slot0 = ControllerWrapperGamepad
slot1 = Idstring
slot3 = "button"
slot1 = slot1(slot2)
slot0.IDS_BUTTON = slot1
slot0 = ControllerWrapperGamepad
slot1 = Idstring
slot3 = "direction"
slot1 = slot1(slot2)
slot0.IDS_DIRECTION = slot1
slot0 = ControllerWrapperGamepad
slot1 = Idstring
slot3 = "rotation"
slot1 = slot1(slot2)
slot0.IDS_ROTATION = slot1
slot0 = ControllerWrapperGamepad

function slot1(self, manager, id, name, controller, setup, debug, skip_virtual_controller)
	local func_map = {}
	slot9 = callback
	slot11 = self
	slot12 = self
	slot13 = "virtual_connect_up"
	slot9 = slot9(slot10, slot11, slot12)
	func_map.up = slot9
	slot9 = callback
	slot11 = self
	slot12 = self
	slot13 = "virtual_connect_down"
	slot9 = slot9(slot10, slot11, slot12)
	func_map.down = slot9
	slot9 = callback
	slot11 = self
	slot12 = self
	slot13 = "virtual_connect_right"
	slot9 = slot9(slot10, slot11, slot12)
	func_map.right = slot9
	slot9 = callback
	slot11 = self
	slot12 = self
	slot13 = "virtual_connect_left"
	slot9 = slot9(slot10, slot11, slot12)
	func_map.left = slot9
	slot9 = callback
	slot11 = self
	slot12 = self
	slot13 = "virtual_connect_confirm"
	slot9 = slot9(slot10, slot11, slot12)
	func_map.confirm = slot9
	slot9 = callback
	slot11 = self
	slot12 = self
	slot13 = "virtual_connect_cancel"
	slot9 = slot9(slot10, slot11, slot12)
	func_map.cancel = slot9
	slot9 = callback
	slot11 = self
	slot12 = self
	slot13 = "virtual_connect_axis1"
	slot9 = slot9(slot10, slot11, slot12)
	func_map.axis1 = slot9
	slot9 = callback
	slot11 = self
	slot12 = self
	slot13 = "virtual_connect_axis2"
	slot9 = slot9(slot10, slot11, slot12)
	func_map.axis2 = slot9
	slot9 = ControllerWrapperGamepad
	slot9 = slot9.super
	slot9 = slot9.init
	slot11 = self
	slot12 = manager
	slot13 = id
	slot14 = name
	slot15 = {
		gamepad = controller
	}
	slot16 = Input
	slot18 = slot16
	slot16 = slot16.keyboard
	slot16 = slot16(slot17)
	slot15.keyboard = slot16
	slot16 = Input
	slot18 = slot16
	slot16 = slot16.mouse
	slot16 = slot16(slot17)
	slot15.mouse = slot16
	slot16 = "gamepad"
	slot17 = setup
	slot18 = debug
	slot19 = skip_virtual_controller
	slot20 = {
		gamepad = func_map
	}

	slot9(slot10, slot11, slot12, slot13, slot14, slot15, slot16, slot17, slot18, slot19)

	return 
end

slot0.init = slot1
slot0 = ControllerWrapperGamepad

function slot1(self, controller_id, controller, input_name, connection_name, connection)
	slot8 = controller
	slot6 = controller.has_axis
	slot9 = self.IDS_POV_0
	slot6 = slot6(slot7, slot8)

	if slot6 then
		slot6 = self._virtual_controller
		slot8 = slot6
		slot6 = slot6.connect
		slot9 = controller
		slot10 = self.IDS_AXIS
		slot11 = self.IDS_POV_0
		slot12 = 1
		slot13 = self.IDS_RANGE
		slot14 = 0
		slot15 = -1
		slot16 = self.IDS_BUTTON
		slot17 = Idstring
		slot19 = connection_name

		slot6(slot7, slot8, slot9, slot10, slot11, slot12, slot13, slot14, slot15, slot17(slot18))
	else
		slot8 = self
		slot6 = self.get_fallback_button
		slot9 = controller_id
		slot10 = controller
		slot11 = input_name
		slot12 = connection_name
		slot13 = connection
		slot6, slot7, slot8, slot9, slot10 = slot6(slot7, slot8, slot9, slot10, slot11, slot12)
		connection = slot10
		connection_name = slot9
		input_name = slot8
		controller = slot7
		controller_id = slot6
		slot8 = self
		slot6 = self.virtual_connect2
		slot9 = controller_id
		slot10 = controller
		slot11 = input_name
		slot12 = connection_name
		slot13 = connection

		slot6(slot7, slot8, slot9, slot10, slot11, slot12)
	end

	return 
end

slot0.virtual_connect_up = slot1
slot0 = ControllerWrapperGamepad

function slot1(self, controller_id, controller, input_name, connection_name, connection)
	slot8 = controller
	slot6 = controller.has_axis
	slot9 = self.IDS_POV_0
	slot6 = slot6(slot7, slot8)

	if slot6 then
		slot6 = self._virtual_controller
		slot8 = slot6
		slot6 = slot6.connect
		slot9 = controller
		slot10 = self.IDS_AXIS
		slot11 = self.IDS_POV_0
		slot12 = 1
		slot13 = self.IDS_RANGE
		slot14 = 0
		slot15 = 1
		slot16 = self.IDS_BUTTON
		slot17 = Idstring
		slot19 = connection_name

		slot6(slot7, slot8, slot9, slot10, slot11, slot12, slot13, slot14, slot15, slot17(slot18))
	else
		slot8 = self
		slot6 = self.get_fallback_button
		slot9 = controller_id
		slot10 = controller
		slot11 = input_name
		slot12 = connection_name
		slot13 = connection
		slot6, slot7, slot8, slot9, slot10 = slot6(slot7, slot8, slot9, slot10, slot11, slot12)
		connection = slot10
		connection_name = slot9
		input_name = slot8
		controller = slot7
		controller_id = slot6
		slot8 = self
		slot6 = self.virtual_connect2
		slot9 = controller_id
		slot10 = controller
		slot11 = input_name
		slot12 = connection_name
		slot13 = connection

		slot6(slot7, slot8, slot9, slot10, slot11, slot12)
	end

	return 
end

slot0.virtual_connect_down = slot1
slot0 = ControllerWrapperGamepad

function slot1(self, controller_id, controller, input_name, connection_name, connection)
	slot8 = controller
	slot6 = controller.has_axis
	slot9 = self.IDS_POV_0
	slot6 = slot6(slot7, slot8)

	if slot6 then
		slot6 = self._virtual_controller
		slot8 = slot6
		slot6 = slot6.connect
		slot9 = controller
		slot10 = self.IDS_AXIS
		slot11 = self.IDS_POV_0
		slot12 = 0
		slot13 = self.IDS_RANGE
		slot14 = 0
		slot15 = 1
		slot16 = self.IDS_BUTTON
		slot17 = Idstring
		slot19 = connection_name

		slot6(slot7, slot8, slot9, slot10, slot11, slot12, slot13, slot14, slot15, slot17(slot18))
	else
		slot8 = self
		slot6 = self.get_fallback_button
		slot9 = controller_id
		slot10 = controller
		slot11 = input_name
		slot12 = connection_name
		slot13 = connection
		slot6, slot7, slot8, slot9, slot10 = slot6(slot7, slot8, slot9, slot10, slot11, slot12)
		connection = slot10
		connection_name = slot9
		input_name = slot8
		controller = slot7
		controller_id = slot6
		slot8 = self
		slot6 = self.virtual_connect2
		slot9 = controller_id
		slot10 = controller
		slot11 = input_name
		slot12 = connection_name
		slot13 = connection

		slot6(slot7, slot8, slot9, slot10, slot11, slot12)
	end

	return 
end

slot0.virtual_connect_right = slot1
slot0 = ControllerWrapperGamepad

function slot1(self, controller_id, controller, input_name, connection_name, connection)
	slot8 = controller
	slot6 = controller.has_axis
	slot9 = self.IDS_POV_0
	slot6 = slot6(slot7, slot8)

	if slot6 then
		slot6 = self._virtual_controller
		slot8 = slot6
		slot6 = slot6.connect
		slot9 = controller
		slot10 = self.IDS_AXIS
		slot11 = self.IDS_POV_0
		slot12 = 0
		slot13 = self.IDS_RANGE
		slot14 = 0
		slot15 = -1
		slot16 = self.IDS_BUTTON
		slot17 = Idstring
		slot19 = connection_name

		slot6(slot7, slot8, slot9, slot10, slot11, slot12, slot13, slot14, slot15, slot17(slot18))
	else
		slot8 = self
		slot6 = self.get_fallback_button
		slot9 = controller_id
		slot10 = controller
		slot11 = input_name
		slot12 = connection_name
		slot13 = connection
		slot6, slot7, slot8, slot9, slot10 = slot6(slot7, slot8, slot9, slot10, slot11, slot12)
		connection = slot10
		connection_name = slot9
		input_name = slot8
		controller = slot7
		controller_id = slot6
		slot8 = self
		slot6 = self.virtual_connect2
		slot9 = controller_id
		slot10 = controller
		slot11 = input_name
		slot12 = connection_name
		slot13 = connection

		slot6(slot7, slot8, slot9, slot10, slot11, slot12)
	end

	return 
end

slot0.virtual_connect_left = slot1
slot0 = ControllerWrapperGamepad

function slot1(self, controller_id, controller, input_name, connection_name, connection)
	slot8 = controller
	slot6 = controller.has_button
	slot9 = 2
	slot6 = slot6(slot7, slot8)

	if slot6 then
		slot8 = self
		slot6 = self.virtual_connect2
		slot9 = controller_id
		slot10 = controller
		slot11 = 2
		slot12 = connection_name
		slot13 = connection

		slot6(slot7, slot8, slot9, slot10, slot11, slot12)
	else
		slot8 = self
		slot6 = self.get_fallback_button
		slot9 = controller_id
		slot10 = controller
		slot11 = input_name
		slot12 = connection_name
		slot13 = connection
		slot6, slot7, slot8, slot9, slot10 = slot6(slot7, slot8, slot9, slot10, slot11, slot12)
		connection = slot10
		connection_name = slot9
		input_name = slot8
		controller = slot7
		controller_id = slot6
		slot8 = self
		slot6 = self.virtual_connect2
		slot9 = controller_id
		slot10 = controller
		slot11 = input_name
		slot12 = connection_name
		slot13 = connection

		slot6(slot7, slot8, slot9, slot10, slot11, slot12)
	end

	return 
end

slot0.virtual_connect_confirm = slot1
slot0 = ControllerWrapperGamepad

function slot1(self, controller_id, controller, input_name, connection_name, connection)
	slot8 = controller
	slot6 = controller.has_button
	slot9 = 1
	slot6 = slot6(slot7, slot8)

	if slot6 then
		slot8 = self
		slot6 = self.virtual_connect2
		slot9 = controller_id
		slot10 = controller
		slot11 = 1
		slot12 = connection_name
		slot13 = connection

		slot6(slot7, slot8, slot9, slot10, slot11, slot12)
	else
		slot8 = self
		slot6 = self.get_fallback_button
		slot9 = controller_id
		slot10 = controller
		slot11 = input_name
		slot12 = connection_name
		slot13 = connection
		slot6, slot7, slot8, slot9, slot10 = slot6(slot7, slot8, slot9, slot10, slot11, slot12)
		connection = slot10
		connection_name = slot9
		input_name = slot8
		controller = slot7
		controller_id = slot6
		slot8 = self
		slot6 = self.virtual_connect2
		slot9 = controller_id
		slot10 = controller
		slot11 = input_name
		slot12 = connection_name
		slot13 = connection

		slot6(slot7, slot8, slot9, slot10, slot11, slot12)
	end

	return 
end

slot0.virtual_connect_cancel = slot1
slot0 = ControllerWrapperGamepad

function slot1(self, controller_id, controller, input_name, connection_name, connection)
	input_name = "direction"
	slot8 = controller
	slot6 = controller.has_axis
	slot9 = self.IDS_DIRECTION
	slot6 = slot6(slot7, slot8)

	if not slot6 then
		slot8 = controller
		slot6 = controller.num_axes
		local axes_count = slot6(slot7)
		slot7 = 0

		if slot7 < axes_count then
			slot9 = controller
			slot7 = controller.axis_name
			slot10 = 0
			slot7 = slot7(slot8, slot9)
			input_name = slot7
			slot7 = 1

			if slot7 < axes_count and input_name == "rotation" then
				slot9 = controller
				slot7 = controller.axis_name
				slot10 = 1
				slot7 = slot7(slot8, slot9)
				input_name = slot7
			end
		end
	end

	slot8 = self
	slot6 = self.virtual_connect2
	slot9 = controller_id
	slot10 = controller
	slot11 = input_name
	slot12 = connection_name
	slot13 = connection

	slot6(slot7, slot8, slot9, slot10, slot11, slot12)

	return 
end

slot0.virtual_connect_axis1 = slot1
slot0 = ControllerWrapperGamepad

function slot1(self, controller_id, controller, input_name, connection_name, connection)
	input_name = "rotation"
	slot8 = controller
	slot6 = controller.has_axis
	slot9 = self.IDS_ROTATION
	slot6 = slot6(slot7, slot8)

	if not slot6 then
		slot8 = controller
		slot6 = controller.num_axes
		local axes_count = slot6(slot7)
		slot7 = 0

		if slot7 < axes_count then
			slot9 = controller
			slot7 = controller.axis_name
			slot10 = 0
			slot7 = slot7(slot8, slot9)
			input_name = slot7
			slot7 = 1

			if slot7 < axes_count and input_name == "direction" then
				slot9 = controller
				slot7 = controller.axis_name
				slot10 = 1
				slot7 = slot7(slot8, slot9)
				input_name = slot7
			end
		end
	end

	slot8 = self
	slot6 = self.virtual_connect2
	slot9 = controller_id
	slot10 = controller
	slot11 = input_name
	slot12 = connection_name
	slot13 = connection

	slot6(slot7, slot8, slot9, slot10, slot11, slot12)

	return 
end

slot0.virtual_connect_axis2 = slot1
slot0 = ControllerWrapperGamepad

function slot1(self, controller_id, controller, input_name, connection_name, connection)
	slot8 = connection
	slot6 = connection.get_connect_src_type
	slot6 = slot6(slot7)

	if slot6 == "axis" then
		slot8 = controller
		slot6 = controller.has_axis
		slot9 = Idstring
		slot11 = input_name
		slot6 = slot6(slot7, slot9(slot10))

		if not slot6 then
			slot8 = self
			slot6 = self.get_fallback_axis
			slot9 = controller_id
			slot10 = controller
			slot11 = input_name
			slot12 = connection_name
			slot13 = connection
			slot6, slot7, slot8, slot9, slot10 = slot6(slot7, slot8, slot9, slot10, slot11, slot12)
			connection = slot10
			connection_name = slot9
			input_name = slot8
			controller = slot7
			controller_id = slot6
		end
	else
		slot6 = tonumber
		slot8 = input_name
		local button_index = slot6(slot7)
	end

	slot6 = ControllerWrapperGamepad
	slot6 = slot6.super
	slot6 = slot6.virtual_connect2
	slot8 = self
	slot9 = controller_id
	slot10 = controller
	slot11 = input_name
	slot12 = connection_name
	slot13 = connection

	slot6(slot7, slot8, slot9, slot10, slot11, slot12)

	return 
end

slot0.virtual_connect2 = slot1
slot0 = ControllerWrapperGamepad

function slot1(self, controller_id, controller, input_name, connection_name, connection)
	slot6 = "mouse"
	slot7 = Input
	slot9 = slot7
	slot7 = slot7.mouse
	slot7 = slot7(slot8)
	slot8 = "mouse"
	slot9 = connection_name
	slot10 = connection

	return slot6, slot7, slot8, slot9, slot10
end

slot0.get_fallback_axis = slot1
slot0 = ControllerWrapperGamepad

function slot1(self, controller_id, controller, input_name, connection_name, connection)
	slot6 = Input
	slot8 = slot6
	slot6 = slot6.keyboard
	slot6 = slot6(slot7)
	controller = slot6

	if input_name == "cancel" then
		input_name = "esc"
	else
		slot8 = controller
		slot6 = controller.has_button
		slot9 = Idstring
		slot11 = input_name
		slot6 = slot6(slot7, slot9(slot10))

		if not slot6 then
			input_name = "enter"
		end
	end

	slot6 = "keyboard"
	slot7 = controller
	slot8 = input_name
	slot9 = connection_name
	slot10 = connection

	return slot6, slot7, slot8, slot9, slot10
end

slot0.get_fallback_button = slot1
slot0 = ControllerWrapperGamepad

function slot1(self, connection_name)
	slot2 = ControllerWrapperGamepad
	slot2 = slot2.super
	slot2 = slot2.get_input_axis
	slot4 = self
	slot5 = connection_name
	local cache = slot2(slot3, slot4)

	if connection_name == "look" then
		slot3 = Vector3
		slot5 = cache.y
		slot5 = -slot5
		slot6 = cache.x
		slot6 = -slot6
		slot7 = 0
		slot3 = slot3(slot4, slot5, slot6)
		cache = slot3
	end

	return cache
end

slot0.get_input_axis = slot1

return 
