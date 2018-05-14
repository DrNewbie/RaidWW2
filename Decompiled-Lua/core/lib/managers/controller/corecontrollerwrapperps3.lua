slot3 = "CoreControllerWrapperPS3"

core.module(slot1, core)

slot3 = "CoreControllerWrapper"

core.import(slot1, core)

if not ControllerWrapperPS3 then
	slot2 = CoreControllerWrapper.ControllerWrapper
	slot0 = class(slot1)
end

ControllerWrapperPS3 = slot0
ControllerWrapperPS3.TYPE = "ps3"
ControllerWrapperPS3.CONTROLLER_TYPE_LIST = {
	"ps3_controller"
}
function ControllerWrapperPS3:init(manager, id, name, controller, setup, debug, skip_virtual_controller)
	local func_map = {}
	slot13 = "virtual_connect_confirm"
	func_map.confirm = callback(slot10, self, self)
	slot13 = "virtual_connect_cancel"
	func_map.cancel = callback(slot10, self, self)
	slot20 = {
		ps3pad = func_map
	}

	ControllerWrapperPS3.super.init(slot10, self, manager, id, name, {
		ps3pad = controller
	}, "ps3pad", setup, debug, skip_virtual_controller)

	return 
end
function ControllerWrapperPS3:virtual_connect_confirm(controller_id, controller, input_name, connection_name, connection)
	slot8 = self

	if self.is_confirm_cancel_inverted(slot7) then
		input_name = "circle"
	else
		input_name = "cross"
	end

	slot13 = connection

	self.virtual_connect2(slot7, self, controller_id, controller, input_name, connection_name)

	return 
end
function ControllerWrapperPS3:virtual_connect_cancel(controller_id, controller, input_name, connection_name, connection)
	slot8 = self

	if self.is_confirm_cancel_inverted(slot7) then
		input_name = "cross"
	else
		input_name = "circle"
	end

	slot13 = connection

	self.virtual_connect2(slot7, self, controller_id, controller, input_name, connection_name)

	return 
end
slot3 = "PS3"
local is_PS3 = SystemInfo.platform(function (self, controller_id, controller, input_name, connection_name, connection)
	slot8 = self

	if self.is_confirm_cancel_inverted(slot7) then
		input_name = "cross"
	else
		input_name = "circle"
	end

	slot13 = connection

	self.virtual_connect2(slot7, self, controller_id, controller, input_name, connection_name)

	return 
end) == Idstring(SystemInfo)
function ControllerWrapperPS3:is_confirm_cancel_inverted()
	if is_PS3 then
		slot3 = PS3
		slot1 = PS3.pad_cross_circle_inverted(slot2)
	end

	return slot1
end

return 
