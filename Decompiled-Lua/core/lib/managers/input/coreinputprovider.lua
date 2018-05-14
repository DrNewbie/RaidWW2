slot3 = "CoreInputProvider"

core.module(slot1, core)

slot3 = "CoreInputLayerDescriptionPrioritizer"

core.import(slot1, core)

slot3 = "CoreInputLayer"

core.import(slot1, core)

Provider = Provider or class()
function Provider:init(input_layer_descriptions)
	self._layer_description_to_layer = {}
	self._input_layer_descriptions = input_layer_descriptions
	slot4 = CoreInputLayerDescriptionPrioritizer.Prioritizer
	self._prioritizer = CoreInputLayerDescriptionPrioritizer.Prioritizer.new(slot3)

	return 
end
function Provider:destroy()
	return 
end
function Provider:context()
	slot3 = self._prioritizer
	local layer_description = self._prioritizer.active_layer_description(slot2)

	if not layer_description then
		return 
	end

	local layer = self._layer_description_to_layer[layer_description]
	slot5 = layer

	return layer.context(slot4)
end
function Provider:create_layer(layer_description_name)
	local layer_description = self._input_layer_descriptions[layer_description_name]
	slot6 = "Illegal layer description '" .. layer_description_name .. "'"

	assert(slot4, layer_description)

	slot7 = layer_description
	local layer = CoreInputLayer.Layer.new(slot4, CoreInputLayer.Layer, self)
	self._layer_description_to_layer[layer_description] = layer
	slot7 = layer_description

	self._prioritizer.add_layer_description(CoreInputLayer.Layer, self._prioritizer)

	return layer
end
function Provider:_layer_destroyed(layer)
	local layer_description = layer.layer_description(slot3)
	slot6 = layer_description

	self._prioritizer.remove_layer_description(layer, self._prioritizer)

	return 
end

return 
