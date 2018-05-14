-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreInputSettingsReader"

core.module(slot1, core)

slot3 = "CoreInputLayerDescription"

core.import(slot1, core)

slot3 = "CoreInputContextDescription"

core.import(slot1, core)

slot3 = "CoreInputLayoutDescription"

core.import(slot1, core)

slot3 = "CoreInputDeviceLayoutDescription"

core.import(slot1, core)

slot3 = "CoreInputTargetDescription"

core.import(slot1, core)

SettingsReader = SettingsReader or class()
SettingsReader.db_type = "input_settings"
SettingsReader.db_path = "settings/input"
function SettingsReader:init()
	self._layer_descriptions = {}
	slot3 = self

	self._read_settings(slot2)

	return 
end
function SettingsReader:layer_descriptions()
	return self._layer_descriptions
end
function SettingsReader:_read_settings()
	slot5 = SettingsReader.db_path

	if not DB.has(slot2, DB, SettingsReader.db_type) then
		return 
	end

	slot5 = SettingsReader.db_path
	local xml_node = DB.load_node(slot2, DB, SettingsReader.db_type)
	local xml_node_children = xml_node.children(DB)
	slot6 = xml_node_children

	self._read_children(xml_node, self)

	return 
end
function SettingsReader:_read_children(nodes)
	self._layer_descriptions = {}
	local layer_description_priority = 1

	for node in nil do
		slot11 = node
		slot9 = node.name(slot10) == "layer"

		assert(slot8)

		slot13 = "name"
		local layer_description = CoreInputLayerDescription.LayerDescription.new(slot8, CoreInputLayerDescription.LayerDescription, node.parameter(layer_description_priority, node))
		slot13 = node
		slot12 = layer_description

		self._read_layer_description_children(CoreInputLayerDescription.LayerDescription, self, node.children(node))

		slot11 = layer_description
		self._layer_descriptions[layer_description.layer_description_name(self)] = layer_description
		layer_description_priority = layer_description_priority + 1
	end

	return 
end
function SettingsReader:_read_layer_description_children(nodes, layer_description)
	for node in nil do
		slot9 = node.name(slot10) == "context"

		assert(slot8)

		slot13 = "name"
		local context_description = CoreInputContextDescription.ContextDescription.new(slot8, node.parameter(node, node))
		slot11 = context_description

		layer_description.set_context_description(CoreInputContextDescription.ContextDescription, layer_description)

		slot13 = node
		slot12 = context_description

		self._read_context_description_children(CoreInputContextDescription.ContextDescription, self, node.children(node))
	end

	return 
end
function SettingsReader:_read_context_description_children(nodes, context_description)
	for node in nil do
		slot9 = node

		if node.name(slot8) == "input" then
			slot11 = context_description

			self._read_input(slot8, self, node)
		else
			slot9 = node

			if node.name(slot8) == "layouts" then
				slot12 = node

				self._read_layout_descriptions_children(slot8, self, node.children(context_description))
			else
				slot9 = node

				if node.name(slot8) == "context" then
					slot13 = "name"
					local new_context_description = CoreInputContextDescription.ContextDescription.new(slot8, node.parameter(slot11, node))
					slot11 = new_context_description

					context_description.add_context_description(CoreInputContextDescription.ContextDescription, context_description)

					slot13 = node
					slot12 = new_context_description

					self._read_context_description_children(CoreInputContextDescription.ContextDescription, self, node.children(node))
				end
			end
		end
	end

	return 
end
function SettingsReader:_read_input(node, context_description)
	slot6 = "type"
	local type_name = node.parameter(slot4, node)
	slot7 = "name"
	local name = node.parameter(node, node)
	slot9 = type_name
	local input_target_description = CoreInputTargetDescription.TargetDescription.new(node, CoreInputTargetDescription.TargetDescription, name)
	slot9 = input_target_description

	context_description.add_input_target_description(CoreInputTargetDescription.TargetDescription, context_description)

	return 
end
function SettingsReader:_read_layout_descriptions_children(nodes, context_description)
	for node in nil do
		slot9 = node.name(slot10) == "layout"

		assert(slot8)

		slot13 = "name"
		local layout_description = CoreInputLayoutDescription.LayoutDescription.new(slot8, node.parameter(node, node))
		slot13 = node
		slot13 = layout_description

		self._read_layout_description_children(CoreInputLayoutDescription.LayoutDescription, self, node.children(node), context_description)

		slot11 = layout_description

		context_description.add_layout_description(CoreInputLayoutDescription.LayoutDescription, context_description)
	end

	return 
end
function SettingsReader:_read_layout_description_children(nodes, context_description, layout_description)
	for node in nil do
		slot12 = node
		slot14 = node
		slot11 = "Only <device> is allowed as children to <layout>. Encountered '" .. node.name(slot13) .. "'"

		assert(slot9, node.name(slot11) == "device")

		slot14 = "type"
		local device_layout_description = CoreInputDeviceLayoutDescription.DeviceLayoutDescription.new(slot9, node.parameter(node.name(slot13), node))
		slot14 = node
		slot14 = device_layout_description

		self._read_device_layout_description_children(CoreInputDeviceLayoutDescription.DeviceLayoutDescription, self, node.children(node), context_description)

		slot12 = device_layout_description

		layout_description.add_device_layout_description(CoreInputDeviceLayoutDescription.DeviceLayoutDescription, layout_description)
	end

	return 
end
function SettingsReader:_read_device_layout_description_children(nodes, context_description, device_layout_description)
	for node in nil do
		slot12 = node
		slot10 = node.name(slot11) == "bind"

		assert(slot9)

		slot13 = device_layout_description

		self._read_bind(slot9, self, node, context_description)
	end

	return 
end
function SettingsReader:_read_bind(node, context_description, device_layout_description)
	slot7 = "axis"
	local axis_name = node.parameter(slot5, node)
	slot8 = "input"
	local input_name = node.parameter(node, node)
	slot9 = input_name
	local input_target_description = context_description.input_target_description(node, context_description)
	slot10 = "Illegal input target name:'" .. input_name .. "'"

	assert(context_description, input_target_description)

	if axis_name then
		slot11 = input_target_description

		device_layout_description.add_bind_axis(slot8, device_layout_description, axis_name)
	else
		slot10 = "button"
		local button_name = node.parameter(slot8, node)

		if button_name then
			slot12 = input_target_description

			device_layout_description.add_bind_button(slot9, device_layout_description, button_name)
		else
			slot11 = "Unknown source, must be button or axis"

			assert(slot9, false)
		end
	end

	return 
end

return 
