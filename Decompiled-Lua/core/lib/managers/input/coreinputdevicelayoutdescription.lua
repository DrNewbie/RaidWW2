slot3 = "CoreInputDeviceLayoutDescription"

core.module(slot1, core)

DeviceLayoutDescription = DeviceLayoutDescription or class()
function DeviceLayoutDescription:init(device_type)
	slot4 = device_type == "xbox_controller" or device_type == "ps3_controller" or device_type == "win32_mouse"

	assert(slot3)

	self._device_type = device_type
	self._binds = {}

	return 
end
function DeviceLayoutDescription:device_type()
	return self._device_type
end
function DeviceLayoutDescription:add_bind_button(hardware_button_name, input_target_description)
	self._binds[hardware_button_name] = {
		type_name = "button",
		input_target_description = input_target_description
	}

	return 
end
function DeviceLayoutDescription:add_bind_axis(hardware_axis_name, input_target_description)
	self._binds[hardware_axis_name] = {
		type_name = "axis",
		input_target_description = input_target_description
	}

	return 
end
function DeviceLayoutDescription:binds()
	return self._binds
end

return 
