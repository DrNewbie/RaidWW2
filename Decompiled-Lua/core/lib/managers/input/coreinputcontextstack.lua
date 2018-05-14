slot3 = "CoreInputContextStack"

core.module(slot1, core)

slot3 = "CoreStack"

core.import(slot1, core)

Stack = Stack or class()
function Stack:init(device_type)
	self._device_type = device_type
	slot4 = CoreStack.Stack
	self._active_input_context = CoreStack.Stack.new(slot3)

	return 
end
function Stack:destroy()
	slot3 = self._active_input_context

	self._active_input_context.destroy(slot2)

	return 
end
function Stack:active_device_layout()
	local target_context = self._active_input_context.top(slot2)
	slot5 = self._device_type

	return target_context.device_layout(self._active_input_context, target_context)
end
function Stack:active_context()
	slot3 = self._active_input_context

	if self._active_input_context.is_empty(slot2) then
		return 
	end

	slot3 = self._active_input_context

	return self._active_input_context.top(slot2)
end
function Stack:pop_input_context(input_context)
	slot6 = self._active_input_context
	slot4 = self._active_input_context.top(slot5) == input_context

	assert(slot3)

	slot4 = self._active_input_context

	self._active_input_context.pop(slot3)

	return 
end
function Stack:push_input_context(input_context)
	slot5 = input_context

	self._active_input_context.push(slot3, self._active_input_context)

	return 
end

return 
