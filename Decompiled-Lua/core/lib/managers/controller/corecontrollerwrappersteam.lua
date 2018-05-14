slot3 = "CoreControllerWrapperSteam"

core.module(slot1, core)

slot3 = "CoreControllerWrapper"

core.import(slot1, core)

if not ControllerWrapperSteam then
	slot2 = CoreControllerWrapper.ControllerWrapper
	slot0 = class(slot1)
end

ControllerWrapperSteam = slot0
ControllerWrapperSteam.TYPE = "steam"
ControllerWrapperSteam.CONTROLLER_TYPE_LIST = {
	"steam_controller"
}
ControllerWrapperSteam.init = function (self, manager, id, name, controller, setup, debug, skip_virtual_controller)
	local func_map = {}
	slot13 = "virtual_connect_confirm"
	func_map.confirm = callback(slot10, self, self)
	slot13 = "virtual_connect_cancel"
	func_map.cancel = callback(slot10, self, self)
	slot18 = Input
	slot18 = Input
	slot20 = {
		steampad = func_map
	}

	ControllerWrapperSteam.super.init(slot10, self, manager, id, name, {
		keyboard = Input.keyboard(slot17),
		mouse = Input.mouse(slot17),
		steampad = controller
	}, "steampad", setup, debug, skip_virtual_controller)

	return 
end
ControllerWrapperSteam.virtual_connect_confirm = function (self, controller_id, controller, input_name, connection_name, connection)
	slot13 = connection

	self.virtual_connect2(slot7, self, controller_id, controller, "button_a", connection_name)

	return 
end
ControllerWrapperSteam.virtual_connect_cancel = function (self, controller_id, controller, input_name, connection_name, connection)
	slot13 = connection

	self.virtual_connect2(slot7, self, controller_id, controller, "button_b", connection_name)

	return 
end
ControllerWrapperSteam.show_binding_panel = function (self)
	if self._controller_map and self._controller_map.steampad then
		slot3 = self._controller_map.steampad

		return self._controller_map.steampad.show_binding_panel(slot2)
	end

	return 
end
ControllerWrapperSteam.convert_virtual_action = function (action)
	if action == "confirm" then
		return "button_a"
	elseif action == "cancel" then
		return "button_b"
	end

	return action
end
ControllerWrapperSteam.change_mode = function (controller, mode)
	if controller and mode then
		slot5 = mode

		controller.change_mode(slot3, controller)

		return mode
	end

	return 
end

return 
