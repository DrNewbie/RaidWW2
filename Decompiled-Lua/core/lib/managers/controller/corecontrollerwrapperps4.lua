slot3 = "CoreControllerWrapperPS4"

core.module(slot1, core)

slot3 = "CoreControllerWrapper"

core.import(slot1, core)

if not ControllerWrapperPS4 then
	slot2 = CoreControllerWrapper.ControllerWrapper
	slot0 = class(slot1)
end

ControllerWrapperPS4 = slot0
ControllerWrapperPS4.TYPE = "ps4"
ControllerWrapperPS4.CONTROLLER_TYPE_LIST = {
	"ps4_controller"
}
function ControllerWrapperPS4:init(manager, id, name, controller, setup, debug, skip_virtual_controller)
	local func_map = {}
	slot13 = "virtual_connect_confirm"
	func_map.confirm = callback(slot10, self, self)
	slot13 = "virtual_connect_cancel"
	func_map.cancel = callback(slot10, self, self)
	slot20 = {
		ps4pad = func_map
	}

	ControllerWrapperPS4.super.init(slot10, self, manager, id, name, {
		ps4pad = controller
	}, "ps4pad", setup, debug, skip_virtual_controller)

	return 
end
function ControllerWrapperPS4:virtual_connect_confirm(controller_id, controller, input_name, connection_name, connection)
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
function ControllerWrapperPS4:virtual_connect_cancel(controller_id, controller, input_name, connection_name, connection)
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
slot3 = "PS4"
local is_PS4 = SystemInfo.platform(function (self, controller_id, controller, input_name, connection_name, connection)
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
function ControllerWrapperPS4:is_confirm_cancel_inverted()
	if is_PS4 then
		slot3 = PS3
		slot1 = PS3.pad_cross_circle_inverted(slot2)
	end

	return slot1
end

return 
