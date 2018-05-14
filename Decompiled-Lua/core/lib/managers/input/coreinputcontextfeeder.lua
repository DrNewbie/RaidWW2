slot3 = "CoreInputContextFeeder"

core.module(slot1, core)

slot3 = "CoreInputProvider"

core.import(slot1, core)

Feeder = Feeder or class()
function Feeder:init(engine_controller, input_layer_descriptions)
	self._engine_controller = engine_controller
	slot5 = self._engine_controller
	self._device_type = self._engine_controller.type(slot4)
	slot6 = input_layer_descriptions
	self._input_provider = CoreInputProvider.Provider.new(slot4, CoreInputProvider.Provider)
	self._previous_state = {}

	return 
end
function Feeder:input_provider()
	return self._input_provider
end
function Feeder:update(t, dt)
	slot5 = self._input_provider
	local target_input_context = self._input_provider.context(slot4)

	if not target_input_context then
		return 
	end

	local context_description = target_input_context._context_description(slot5)
	slot8 = self._device_type
	local device_layout_description = context_description.device_layout_description(target_input_context, context_description)

	if device_layout_description == nil then
		return 
	end

	local binds = device_layout_description.binds(slot7)
	slot9 = target_input_context
	local input_data = target_input_context.input(device_layout_description)
	local controller = self._engine_controller
	slot11 = binds

	for hardware_name, bind in pairs(slot10) do
		slot16 = bind.input_target_description
		local input_data_name = bind.input_target_description.target_name(slot15)
		local control_type = bind.type_name
		local data = nil

		if control_type == "axis" then
			slot21 = controller
			slot24 = hardware_name

			assert(slot18, controller.has_axis("Binding '" .. hardware_name .. "'", Idstring(slot23)))

			slot19 = controller
			slot22 = hardware_name
			data = controller.axis(slot18, Idstring(hardware_name))
		elseif control_type == "button" then
			slot21 = controller
			slot24 = hardware_name

			assert(slot18, controller.has_button("Binding '" .. hardware_name .. "'", Idstring(slot23)))

			slot19 = controller
			slot22 = hardware_name
			data = controller.pressed(slot18, Idstring(hardware_name))
		else
			slot19 = "Bad!"

			error(slot18)
		end

		input_data[input_data_name] = data
	end

	return 
end

return 
