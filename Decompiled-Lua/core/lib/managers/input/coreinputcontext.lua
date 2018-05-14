slot3 = "CoreInputContext"

core.module(slot1, core)

Context = Context or class()
function Context:init(input_context_description, input_context_stack)
	self._input_data = {}
	slot6 = input_context_description

	self._construct_input_data(slot4, self)

	self._input_context_description = input_context_description
	self._input_context_stack = input_context_stack
	slot5 = self._input_context_stack

	assert(slot4)

	slot6 = self

	self._input_context_stack.push_input_context(slot4, self._input_context_stack)

	return 
end
function Context:destroy()
	slot4 = self

	self._input_context_stack.pop_input_context(slot2, self._input_context_stack)

	self._input_source = nil

	return 
end
function Context:create_context(context_name)
	slot5 = context_name
	local context_description = self._input_context_description.context_description(slot3, self._input_context_description)
	slot6 = "Couldn't find subcontext with name:'" .. context_name .. "'"

	assert(self._input_context_description, context_description)

	slot7 = self._input_context_stack
	local context = Context.new(self._input_context_description, Context, context_description)

	return context
end
function Context:input()
	return self._input_data
end
function Context:_context_description()
	return self._input_context_description
end
function Context:_construct_input_data(input_context_description)
	slot6 = input_context_description

	for name, input_target in pairs(input_context_description.input_targets(slot5)) do
		slot9 = input_target
		local type_name = input_target.target_type_name(slot8)

		if type_name == "vector" then
			slot13 = 0
			self._input_data[name] = Vector3(slot10, 0, 0)
		elseif type_name == "bool" then
			self._input_data[name] = false
		else
			slot11 = "unknown type:'" .. type_name .. "'"

			assert(slot9, false)
		end
	end

	return 
end

return 
