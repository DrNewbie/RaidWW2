-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreControllerWrapperPC"

core.module(slot1, core)

slot3 = "CoreControllerWrapper"

core.import(slot1, core)

if not ControllerWrapperPC then
	slot2 = CoreControllerWrapper.ControllerWrapper
	slot0 = class(slot1)
end

ControllerWrapperPC = slot0
ControllerWrapperPC.TYPE = "pc"
ControllerWrapperPC.CONTROLLER_TYPE_LIST = {
	"win32_keyboard",
	"win32_mouse"
}
function ControllerWrapperPC:init(manager, id, name, controller, setup, debug, skip_virtual_controller, gamepads)
	local func_map = {}
	slot14 = "virtual_connect_keyboard_axis_1"
	func_map.keyboard_axis_1 = callback(slot11, self, self)
	slot14 = "virtual_connect_keyboard_axis_2"
	func_map.keyboard_axis_2 = callback(slot11, self, self)
	slot14 = "virtual_connect_confirm"
	func_map.confirm = callback(slot11, self, self)
	slot14 = "virtual_connect_cancel"
	func_map.cancel = callback(slot11, self, self)
	slot19 = Input
	slot19 = Input
	slot21 = {
		keyboard = func_map
	}

	ControllerWrapperPC.super.init(slot11, self, manager, id, name, {
		keyboard = Input.keyboard(slot18),
		mouse = Input.mouse(slot18),
		gamepads = gamepads
	}, "keyboard", setup, debug, skip_virtual_controller)

	return 
end
function ControllerWrapperPC:virtual_connect_keyboard_axis_1(controller_id, controller, input_name, connection_name, connection)
	slot8 = self._virtual_controller

	self._virtual_controller.add_axis(slot7, Idstring(slot10))

	slot15 = connection_name
	slot17 = "range"
	slot17 = -1

	self._virtual_controller.connect(slot7, self._virtual_controller, controller, Idstring(connection_name), Idstring("button"), Idstring("a"), Idstring("axis"), 0, Idstring(slot16), 0)

	slot15 = connection_name
	slot17 = "range"
	slot17 = 1

	self._virtual_controller.connect(slot7, self._virtual_controller, controller, Idstring(Idstring("button")), Idstring("button"), Idstring("d"), Idstring("axis"), 0, Idstring(0), 0)

	slot15 = connection_name
	slot17 = "range"
	slot17 = 1

	self._virtual_controller.connect(slot7, self._virtual_controller, controller, Idstring(Idstring("button")), Idstring("button"), Idstring("w"), Idstring("axis"), 1, Idstring(0), 0)

	slot15 = connection_name
	slot17 = "range"
	slot17 = -1

	self._virtual_controller.connect(slot7, self._virtual_controller, controller, Idstring(Idstring("button")), Idstring("button"), Idstring("s"), Idstring("axis"), 1, Idstring(0), 0)

	return 
end
function ControllerWrapperPC:virtual_connect_keyboard_axis_2(controller_id, controller, input_name, connection_name, connection)
	slot9 = connection_name

	self._virtual_controller.add_axis(slot7, self._virtual_controller)

	slot15 = connection_name
	slot17 = "range"
	slot17 = -1

	self._virtual_controller.connect(slot7, self._virtual_controller, controller, Idstring(slot11), Idstring("button"), Idstring("left"), Idstring("axis"), 0, Idstring(slot16), 0)

	slot15 = connection_name
	slot17 = "range"
	slot17 = 1

	self._virtual_controller.connect(slot7, self._virtual_controller, controller, Idstring(Idstring("button")), Idstring("button"), Idstring("right"), Idstring("axis"), 0, Idstring(0), 0)

	slot15 = connection_name
	slot17 = "range"
	slot17 = 1

	self._virtual_controller.connect(slot7, self._virtual_controller, controller, Idstring(Idstring("button")), Idstring("button"), Idstring("up"), Idstring("axis"), 1, Idstring(0), 0)

	slot15 = connection_name
	slot17 = "range"
	slot17 = -1

	self._virtual_controller.connect(slot7, self._virtual_controller, controller, Idstring(Idstring("button")), Idstring("button"), Idstring("down"), Idstring("axis"), 1, Idstring(0), 0)

	return 
end
function ControllerWrapperPC:virtual_connect_confirm(controller_id, controller, input_name, connection_name, connection)
	slot13 = connection

	self.virtual_connect2(slot7, self, controller_id, controller, "enter", connection_name)

	return 
end
function ControllerWrapperPC:virtual_connect_cancel(controller_id, controller, input_name, connection_name, connection)
	slot13 = connection

	self.virtual_connect2(slot7, self, controller_id, controller, "esc", connection_name)

	return 
end
function ControllerWrapperPC:virtual_connect2(controller_id, controller, input_name, connection_name, connection)
	slot8 = connection
	local min_src, max_src, min_dest, max_dest = connection.get_range(slot7)
	local connect_src_type = connection.get_connect_src_type(slot11)
	slot13 = connection
	local connect_dest_type = connection.get_connect_dest_type(connection)

	if connection._btn_connections and input_name == "buttons" then
		local btn_data = {
			up = {
				1,
				0,
				1
			},
			down = {
				1,
				0,
				-1
			},
			left = {
				0,
				0,
				-1
			},
			right = {
				0,
				0,
				1
			},
			accelerate = {
				1,
				0,
				1
			},
			brake = {
				1,
				0,
				-1
			},
			turn_left = {
				0,
				0,
				-1
			},
			turn_right = {
				0,
				0,
				1
			}
		}
		slot15 = self._virtual_controller
		slot18 = connection_name

		if not self._virtual_controller.has_axis(slot14, Idstring(slot17)) then
			slot15 = self._virtual_controller
			slot18 = connection_name

			self._virtual_controller.add_axis(slot14, Idstring(slot17))
		end

		slot15 = connection._btn_connections

		for btn, input in pairs(slot14) do

			-- Decompilation error in this vicinity:
			local controller = self._controller_map.keyboard
			slot21 = controller
			slot24 = input.name

			if not controller.has_button(slot20, Idstring(slot23)) or input.type ~= "button" then
				slot21 = controller
				slot24 = input.name

				if not controller.has_axis(slot20, Idstring(slot23)) or input.type ~= "axis" then
					controller = self._controller_map.gamepads
				end
			end

			slot21 = controller
			slot24 = input.name
		end
	else

		-- Decompilation error in this vicinity:
		slot14 = input_name
		slot15 = controller
		slot18 = input_name_str
	end

	return 
end

return 
