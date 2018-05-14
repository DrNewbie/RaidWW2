slot3 = "CoreInputLayerDescription"

core.module(slot1, core)

LayerDescription = LayerDescription or class()
function LayerDescription:init(name, priority)
	self._name = name
	self._priority = priority

	return 
end
function LayerDescription:layer_description_name()
	return self._name
end
function LayerDescription:set_context_description(context_description)
	slot4 = self._context_description == nil

	assert(slot3)

	self._context_description = context_description

	return 
end
function LayerDescription:context_description()
	slot4 = "Must specify context for this layer_description"

	assert(slot2, self._context_description)

	return self._context_description
end
function LayerDescription:priority()
	return self._priority
end

return 
