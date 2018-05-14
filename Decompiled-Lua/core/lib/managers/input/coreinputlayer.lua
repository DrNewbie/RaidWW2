slot3 = "CoreInputLayer"

core.module(slot1, core)

slot3 = "CoreInputContextStack"

core.import(slot1, core)

slot3 = "CoreInputProvider"

core.import(slot1, core)

slot3 = "CoreInputContext"

core.import(slot1, core)

Layer = Layer or class()
function Layer:init(input_provider, layer_description)
	slot5 = CoreInputContextStack.Stack
	self._input_context_stack = CoreInputContextStack.Stack.new(slot4)
	self._layer_description = layer_description
	self._input_provider = input_provider

	return 
end
function Layer:destroy()
	slot3 = self._input_context_stack

	self._input_context_stack.destroy(slot2)

	slot4 = self

	self._input_provider._layer_destroyed(slot2, self._input_provider)

	return 
end
function Layer:context()
	slot3 = self._input_context_stack

	return self._input_context_stack.active_context(slot2)
end
function Layer:layer_description()
	return self._layer_description
end
function Layer:create_context()
	local context_description = self._layer_description.context_description(slot2)
	slot6 = self._input_context_stack

	return CoreInputContext.Context.new(self._layer_description, CoreInputContext.Context, context_description)
end

return 
