slot3 = "CoreControllerWrapperXbox360"

core.module(slot1, core)

slot3 = "CoreControllerWrapper"

core.import(slot1, core)

if not ControllerWrapperXbox360 then
	slot2 = CoreControllerWrapper.ControllerWrapper
	slot0 = class(slot1)
end

ControllerWrapperXbox360 = slot0
ControllerWrapperXbox360.TYPE = "xbox360"
ControllerWrapperXbox360.CONTROLLER_TYPE_LIST = {
	"xbox_controller"
}
function ControllerWrapperXbox360:init(manager, id, name, controller, setup, debug, skip_virtual_controller)
	local func_map = {}
	slot13 = "virtual_connect_confirm"
	func_map.confirm = callback(slot10, self, self)
	slot13 = "virtual_connect_cancel"
	func_map.cancel = callback(slot10, self, self)
	slot20 = {
		xbox360pad = func_map
	}

	ControllerWrapperXbox360.super.init(slot10, self, manager, id, name, {
		xbox360pad = controller
	}, "xbox360pad", setup, debug, skip_virtual_controller)

	return 
end
function ControllerWrapperXbox360:virtual_connect_confirm(controller_id, controller, input_name, connection_name, connection)
	slot13 = connection

	self.virtual_connect2(slot7, self, controller_id, controller, "a", connection_name)

	return 
end
function ControllerWrapperXbox360:virtual_connect_cancel(controller_id, controller, input_name, connection_name, connection)
	slot13 = connection

	self.virtual_connect2(slot7, self, controller_id, controller, "b", connection_name)

	return 
end

return 
