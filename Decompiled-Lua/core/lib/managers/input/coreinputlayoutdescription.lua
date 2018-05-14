slot3 = "CoreInputLayoutDescription"

core.module(slot1, core)

LayoutDescription = LayoutDescription or class()
function LayoutDescription:init(name)
	self._name = name
	self._device_layout_descriptions = {}

	return 
end
function LayoutDescription:layout_name()
	return self._name
end
function LayoutDescription:add_device_layout_description(device_layout_description)
	slot5 = device_layout_description
	self._device_layout_descriptions[device_layout_description.device_type(slot4)] = device_layout_description

	return 
end
function LayoutDescription:device_layout_description(device_type)
	return self._device_layout_descriptions[device_type]
end

return 
