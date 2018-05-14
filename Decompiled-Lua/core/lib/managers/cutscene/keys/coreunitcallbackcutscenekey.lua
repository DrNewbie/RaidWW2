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
slot2 = "core/lib/managers/cutscene/keys/CoreCutsceneKeyBase"

require(slot1)

if not CoreUnitCallbackCutsceneKey then
	slot2 = CoreCutsceneKeyBase
	slot0 = class(slot1)
end

CoreUnitCallbackCutsceneKey = slot0
CoreUnitCallbackCutsceneKey.ELEMENT_NAME = "unit_callback"
CoreUnitCallbackCutsceneKey.NAME = "Unit Callback"
slot4 = ""

CoreUnitCallbackCutsceneKey.register_serialized_attribute("Unit Callback", CoreUnitCallbackCutsceneKey, "unit_name")

slot4 = ""

CoreUnitCallbackCutsceneKey.register_serialized_attribute("Unit Callback", CoreUnitCallbackCutsceneKey, "extension")

slot4 = ""

CoreUnitCallbackCutsceneKey.register_serialized_attribute("Unit Callback", CoreUnitCallbackCutsceneKey, "method")

slot5 = toboolean

CoreUnitCallbackCutsceneKey.register_serialized_attribute("Unit Callback", CoreUnitCallbackCutsceneKey, "enabled", true)

slot3 = "arguments"

CoreUnitCallbackCutsceneKey.register_serialized_attribute("Unit Callback", CoreUnitCallbackCutsceneKey)

slot4 = "extension"

CoreUnitCallbackCutsceneKey.attribute_affects("Unit Callback", CoreUnitCallbackCutsceneKey, "unit_name")

slot4 = "method"

CoreUnitCallbackCutsceneKey.attribute_affects("Unit Callback", CoreUnitCallbackCutsceneKey, "extension")

slot4 = "arguments"

CoreUnitCallbackCutsceneKey.attribute_affects("Unit Callback", CoreUnitCallbackCutsceneKey, "method")

CoreUnitCallbackCutsceneKey.control_for_unit_name = CoreCutsceneKeyBase.standard_combo_box_control
CoreUnitCallbackCutsceneKey.control_for_extension = CoreCutsceneKeyBase.standard_combo_box_control
CoreUnitCallbackCutsceneKey.control_for_method = CoreCutsceneKeyBase.standard_combo_box_control
function CoreUnitCallbackCutsceneKey:__tostring()
	slot4 = self
	slot6 = self
	slot8 = self
	slot10 = self

	return "Call " .. self.unit_name(slot3) .. ":" .. self.extension(slot5) .. "():" .. self.method(slot7) .. "(" .. self.arguments_string(slot9) .. ")"
end
function CoreUnitCallbackCutsceneKey:arguments_string()

	-- Decompilation error in this vicinity:
	slot1 = string.join
	slot3 = ", "
	slot4 = table.collect
end
function CoreUnitCallbackCutsceneKey:load(key_node, loading_class)
	slot7 = loading_class

	self.super.load(slot4, self, key_node)

	self._method_params = {}
	local params = {}
	slot6 = key_node

	for param_node in key_node.children(self) do
		local param = CoreUnitCallbackCutsceneKeyParam.new(slot9)
		slot12 = param_node

		param.load(CoreUnitCallbackCutsceneKeyParam, param)

		slot12 = param

		table.insert(CoreUnitCallbackCutsceneKeyParam, params)
	end

	slot6 = self
	slot9 = self

	if self.is_valid_method(slot5, self.method(slot8)) then
		slot7 = self
		self._method_params[self.method(slot6)] = params
	end

	return 
end
function CoreUnitCallbackCutsceneKey:_save_under(parent_node)

	-- Decompilation error in this vicinity:
	slot5 = parent_node
	local key_node = self.super._save_under(slot3, self)
	slot3 = ipairs

	return key_node
end
function CoreUnitCallbackCutsceneKey:play(player, undo, fast_forward)
	slot6 = self

	if self.enabled(slot5) then
		slot9 = player

		self._invoke_if_exists(slot6, self, method_name)
	end

	return 
end
function CoreUnitCallbackCutsceneKey:skip(player)

	-- Decompilation error in this vicinity:
	slot4 = self

	if self.enabled(slot3) then
		slot8 = self
		slot6 = player

		self._invoke_if_exists(slot3, self, "skip_" .. self.method(slot7))
	end

	return 
end
function CoreUnitCallbackCutsceneKey:is_valid_unit_name(unit_name)
	slot5 = unit_name

	if self.super.is_valid_unit_name(slot3, self) then
		slot7 = unit_name
		slot2 = not table.empty(self._unit_extension_info(slot5, self))
	end

	return slot2
end
function CoreUnitCallbackCutsceneKey:is_valid_extension(extension)
	slot4 = self
	slot7 = self
	local methods = self._unit_extension_info(slot3, self.unit_name(slot6))[extension]

	if methods then
		slot5 = methods
		slot3 = not table.empty(slot4)
	end

	return slot3
end
function CoreUnitCallbackCutsceneKey:is_valid_method(method)
	if method ~= nil then
		slot5 = "undo_"
	else
		slot2 = false

		if false then
			slot2 = true
		end
	end

	return slot2
end
function CoreUnitCallbackCutsceneKey:refresh_control_for_extension(control)
	slot4 = control

	control.freeze(slot3)

	slot4 = control

	control.clear(slot3)

	slot8 = self
	slot11 = self

	function slot5(e)
		slot4 = e

		return self.is_valid_extension(slot2, self)
	end

	local unit_extensions = table.find_all_values(slot3, table.map_keys(self._unit_extension_info(slot7, self.unit_name(slot10))))
	slot5 = unit_extensions

	if not table.empty(table.map_keys(self._unit_extension_info(slot7, self.unit_name(slot10)))) then
		slot6 = true

		control.set_enabled(slot4, control)

		local value = self.extension(slot4)
		slot6 = unit_extensions

		for _, extension in ipairs(self) do
			slot12 = extension

			control.append(slot10, control)

			if extension == value then
				slot12 = value

				control.set_value(slot10, control)
			end
		end
	else
		slot6 = false

		control.set_enabled(slot4, control)
	end

	slot5 = control

	control.thaw(slot4)

	return 
end
function CoreUnitCallbackCutsceneKey:refresh_control_for_method(control)
	slot4 = control

	control.freeze(slot3)

	slot4 = control

	control.clear(slot3)

	slot7 = self
	slot5 = self
	local methods = self._unit_extension_info(slot3, self.unit_name(slot6))[self.extension(self)]

	if methods then
		slot6 = true

		control.set_enabled(slot4, control)

		slot5 = self
		local value = self.method(slot4)
		slot8 = methods

		for _, method in ipairs(table.map_keys(slot7)) do
			slot12 = method

			control.append(slot10, control)

			if method == value then
				slot12 = value

				control.set_value(slot10, control)
			end
		end
	else
		slot6 = false

		control.set_enabled(slot4, control)
	end

	slot5 = control

	control.thaw(slot4)

	return 
end
function CoreUnitCallbackCutsceneKey:refresh_control_for_arguments(panel)

	-- Decompilation error in this vicinity:
	slot4 = panel

	panel.freeze(slot3)

	slot4 = panel

	panel.destroy_children(slot3)

	slot5 = "VERTICAL"
	local panel_sizer = EWS.BoxSizer(slot3, EWS)
	slot8 = self
	slot6 = self
	local methods = self._unit_extension_info(EWS, self.unit_name(slot7))[self.extension(self)]
	slot8 = panel_sizer

	panel.set_sizer(slot6, panel)

	slot7 = panel

	panel.thaw(slot6)

	return 
end
function CoreUnitCallbackCutsceneKey:control_for_arguments(parent_frame, callback_func)
	slot6 = parent_frame
	local panel = EWS.Panel(slot4, EWS)

	return panel
end
function CoreUnitCallbackCutsceneKey:_invoke_if_exists(method_name, player)

	-- Decompilation error in this vicinity:
	slot9 = self
	slot8 = true
	local extension = self._unit_extension(slot4, self, self.unit_name(slot7), self.extension(self))

	if not extension then
		slot10 = self
		slot12 = self
		slot7 = "Unit \"" .. self.unit_name(slot9) .. "\" does not have the extension \"" .. self.extension(slot11) .. "\"."

		Application.error(slot5, Application)

		return 
	end

	local func = extension[method_name]

	if not func then
		slot12 = self
		slot12 = self
		slot8 = string.pretty(slot9, self.extension(slot11)) .. " extension on unit \"" .. self.unit_name(true) .. "\" does not support the call \"" .. method_name .. "\"."

		Application.error(slot6, Application)

		return 
	end
end
function CoreUnitCallbackCutsceneKey:_param_with_name(param_name)
	slot6 = self
	slot9 = self

	assert(slot3, self.is_valid_method("Method \"" .. self.method(self.method) .. "\" is invalid.", self.method(self)))

	if self._method_params then
		slot5 = self
		local params = self._method_params[self.method(slot4)]
	end

	if params == nil then
		params = {}
		self._method_params = self._method_params or {}
		slot6 = self
		self._method_params[self.method(slot5)] = params
	end

	function slot6(p)
		return p.name == param_name
	end

	local param = table.find_value(slot4, params)

	if param == nil then
		param = CoreUnitCallbackCutsceneKeyParam.new()
		param.name = param_name
		slot7 = param

		table.insert(slot5, params)
	end

	return param
end
CoreUnitCallbackCutsceneKeyParam = CoreUnitCallbackCutsceneKeyParam or class()
function CoreUnitCallbackCutsceneKeyParam:__tostring()
	slot3 = self.name
	slot7 = self

	return tostring(slot2) .. "=" .. tostring(self.inspect(slot6))
end
function CoreUnitCallbackCutsceneKeyParam:init()
	self.value_type = "nil"
	self.name = "nil"
	self.string_value = ""

	return 
end
function CoreUnitCallbackCutsceneKeyParam:load(param_node)
	slot4 = param_node
	self.value_type = param_node.name(slot3)
	slot5 = "name"
	self.name = param_node.parameter(slot3, param_node)
	slot5 = "value"
	self.string_value = param_node.parameter(slot3, param_node)

	return 
end
function CoreUnitCallbackCutsceneKeyParam:value(cutscene_key)
	slot4 = self

	if not self.is_nil(slot3) then
		if self.value_type == "string" then
			return self.string_value
		elseif self.value_type == "number" then
			slot4 = self.string_value

			return tonumber(slot3)
		elseif self.value_type == "boolean" then
			slot4 = self.string_value

			return toboolean(slot3)
		elseif self.value_type == "unit" then
			if cutscene_key then
				slot6 = true
				slot2 = cutscene_key._unit(slot3, cutscene_key, self.string_value)
			end

			return slot2
		end
	end

	return nil
end
function CoreUnitCallbackCutsceneKeyParam:is_nil()
	return self.value_type == "nil"
end
function CoreUnitCallbackCutsceneKeyParam:inspect()
	return self.string_value
end
function CoreUnitCallbackCutsceneKeyParam:_save_under(parent_node)
	slot5 = self.value_type
	local param_node = parent_node.make_child(slot3, parent_node)
	slot6 = "name"
	slot9 = self.name

	param_node.set_parameter(parent_node, param_node, tostring(slot8))

	slot7 = self.string_value

	param_node.set_parameter(parent_node, param_node, "value")

	return param_node
end

return 
