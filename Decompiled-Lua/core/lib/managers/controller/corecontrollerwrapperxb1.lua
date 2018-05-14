slot3 = "CoreControllerWrapperXB1"

core.module(slot1, core)

slot3 = "CoreControllerWrapper"

core.import(slot1, core)

if not ControllerWrapperXB1 then
	slot2 = CoreControllerWrapper.ControllerWrapper
	slot0 = class(slot1)
end

ControllerWrapperXB1 = slot0
ControllerWrapperXB1.TYPE = "xb1"
ControllerWrapperXB1.CONTROLLER_TYPE_LIST = {
	"xb1_controller"
}
function ControllerWrapperXB1:init(manager, id, name, controller, setup, debug, skip_virtual_controller)
	local func_map = {}
	slot13 = "virtual_connect_confirm"
	func_map.confirm = callback(slot10, self, self)
	slot13 = "virtual_connect_cancel"
	func_map.cancel = callback(slot10, self, self)
	slot20 = {
		xb1pad = func_map
	}

	ControllerWrapperXB1.super.init(slot10, self, manager, id, name, {
		xb1pad = controller
	}, "xb1pad", setup, debug, skip_virtual_controller)

	return 
end
function ControllerWrapperXB1:virtual_connect_confirm(controller_id, controller, input_name, connection_name, connection)
	slot13 = connection

	self.virtual_connect2(slot7, self, controller_id, controller, "a", connection_name)

	return 
end
function ControllerWrapperXB1:virtual_connect_cancel(controller_id, controller, input_name, connection_name, connection)
	slot13 = connection

	self.virtual_connect2(slot7, self, controller_id, controller, "b", connection_name)

	return 
end

return 
