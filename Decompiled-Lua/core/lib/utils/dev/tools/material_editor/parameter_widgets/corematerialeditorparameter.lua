-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot2 = "core/lib/utils/dev/tools/material_editor/CoreSmartNode"

require(slot1)

local CoreMaterialEditorParameter = CoreMaterialEditorParameter or class()
function CoreMaterialEditorParameter:init(parent, editor, parameter_info, parameter_node)
	slot11 = parameter_node

	self.set_params(slot6, self, parent, editor, parameter_info)

	slot10 = ""
	self._panel = EWS.Panel(slot6, EWS, parent, "")
	slot8 = "HORIZONTAL"
	self._box = EWS.BoxSizer(slot6, EWS)
	slot10 = ""
	self._left_panel = EWS.Panel(slot6, EWS, self._panel, "")
	slot8 = "VERTICAL"
	self._left_box = EWS.BoxSizer(slot6, EWS)
	slot8 = self._left_box

	self._left_panel.set_sizer(slot6, self._left_panel)

	slot11 = "RIGHT,EXPAND"

	self._box.add(slot6, self._box, self._left_panel, 0, 4)

	slot10 = ""
	local panel = EWS.Panel(slot6, EWS, self._panel, "")
	slot12 = "EXPAND"

	self._left_box.add(EWS, self._left_box, panel, 1, 0)

	slot12 = "NO_BORDER"
	self._parent_btn = EWS.Button(EWS, EWS, self._left_panel, "+", "")
	slot8 = self._parent_btn
	slot13 = 0

	self._parent_btn.set_min_size(EWS, Vector3("+", 15, 15))

	slot12 = self

	self._parent_btn.connect(EWS, self._parent_btn, "", "EVT_COMMAND_BUTTON_CLICKED", editor._on_parameter_popup)

	slot12 = "ALIGN_CENTER_HORIZONTAL"

	self._left_box.add(EWS, self._left_box, self._parent_btn, 0, 0)

	slot11 = ""
	panel = EWS.Panel(EWS, EWS, self._panel, "")

	self._left_box.add(EWS, self._left_box, panel, 1, 0)

	slot11 = ""
	self._right_panel = EWS.Panel(EWS, EWS, self._panel, "")
	slot10 = "HORIZONTAL"
	slot13 = parameter_info.ui_name
	self._right_box = EWS.StaticBoxSizer(EWS, EWS, self._right_panel, parameter_info.ui_name.s("EXPAND"))
	slot9 = self._right_box

	self._right_panel.set_sizer(EWS, self._right_panel)

	slot12 = "LEFT,EXPAND"

	self._box.add(EWS, self._box, self._right_panel, 1, 4)

	slot9 = self._box

	self._panel.set_sizer(EWS, self._panel)

	slot9 = "src"
	self._customize = (self._editor._current_material_node.parameter(EWS, self._editor._current_material_node) == nil or not self._parent_node or self._node) ~= nil
	slot9 = self._customize

	self._right_panel.set_enabled(slot7, self._right_panel)

	slot8 = self

	self._load_value(slot7)

	slot8 = self._editor

	self._editor._update_output(slot7)

	return 
end
function CoreMaterialEditorParameter:set_params(parent, editor, parameter_info, parameter_node)
	self._parent = parent
	self._editor = editor
	self._parameter_info = parameter_info
	self._parameter_node = parameter_node
	self._node = parameter_node
	self._value = (parameter_info.ui_type.s(slot6) == "intensity" and "sun") or parameter_info.default or "[NONE]"
	slot8 = self._editor._parent_combo_box
	self._parent_node = self._editor._parent_materials[self._editor._parent_combo_box.get_value(parameter_info.ui_type)]

	if self._parent_node then
		slot7 = self._parent_node

		for param in self._parent_node.children(slot6) do
			if self._parameter_info.type == "texture" then
				slot12 = self._parameter_info.name
			else
				slot12 = "name"
				slot12 = self._parameter_info.name

				if param.parameter(slot10, param) == self._parameter_info.name.s(param) then
					self._parent_param_node = param

					break
				end
			end
		end

		if not self._parent_param_node then
			self._parent_node = nil
		end
	end

	return 
end
function CoreMaterialEditorParameter:on_copy_to_parent()
	slot3 = self._editor._parent_combo_box

	if self._editor._parent_combo_box.get_value(slot2) ~= "[NONE]" then
		slot3 = self

		self._copy_to_parent(slot2)
	else
		slot12 = 0
		slot9 = true
		local name = EWS.get_text_from_user(slot2, EWS, self._editor._main_frame, "Name: ", "Create New Parent", "", Vector3(slot9, -1, -1))

		if name ~= "" then
			slot7 = name

			if self._editor._find_node(slot3, self._editor, self._editor._material_config_node, "name") then
				slot8 = "OK,ICON_ERROR"
				slot4 = EWS.MessageDialog(slot3, EWS, self._editor._main_frame, "A parent with that name already exists!", "Create New Parent")

				EWS.MessageDialog(slot3, EWS, self._editor._main_frame, "A parent with that name already exists!", "Create New Parent").show_modal(slot3)
			else
				slot5 = name

				self._copy_to_parent(slot3, self)
			end
		end
	end

	slot3 = self._editor

	self._editor._create_parameter_panel(slot2)

	return 
end
function CoreMaterialEditorParameter:update_live()
	slot6 = self._parameter_info.name
	slot8 = self._parameter_info.ui_type
	slot7 = self._value

	self._editor.live_update_parameter(slot2, self._editor, self._parameter_info.name.s(slot5), self._parameter_info.type, self._parameter_info.ui_type.s(slot7))

	return 
end
function CoreMaterialEditorParameter:update(t, dt)
	return 
end
function CoreMaterialEditorParameter:destroy()
	slot3 = self._panel

	self._panel.destroy(slot2)

	return 
end
function CoreMaterialEditorParameter:panel()
	return self._panel
end
function CoreMaterialEditorParameter:get_value()
	return self._value
end
function CoreMaterialEditorParameter:to_slider_range(v, min, step)
	return (v - min) / step
end
function CoreMaterialEditorParameter:from_slider_range(v, min, step)
	return v * step + min
end
function CoreMaterialEditorParameter:_create_node()
	if self._parameter_info.type == "vector3" then
		slot4 = "variable"
		self._parameter_node = self._editor._current_material_node.make_child(slot2, self._editor._current_material_node)
		slot4 = "name"
		slot7 = self._parameter_info.name

		self._parameter_node.set_parameter(slot2, self._parameter_node, self._parameter_info.name.s(slot6))

		slot5 = self._parameter_info.type

		self._parameter_node.set_parameter(slot2, self._parameter_node, "type")

		local str = math.vector_to_string(slot2)
		slot6 = str

		self._parameter_node.set_parameter(self._value, self._parameter_node, "value")
	elseif self._parameter_info.type == "texture" then
		slot3 = self._editor._current_material_node
		slot6 = self._parameter_info.name
		self._parameter_node = self._editor._current_material_node.make_child(slot2, self._parameter_info.name.s(slot5))
		local str = tostring(slot2)
		self._global_texture = false
		slot6 = str

		self._parameter_node.set_parameter(self._value, self._parameter_node, "file")
	else
		slot4 = "variable"
		self._parameter_node = self._editor._current_material_node.make_child(slot2, self._editor._current_material_node)
		slot4 = "name"
		slot7 = self._parameter_info.name

		self._parameter_node.set_parameter(slot2, self._parameter_node, self._parameter_info.name.s(slot6))

		slot5 = self._parameter_info.type

		self._parameter_node.set_parameter(slot2, self._parameter_node, "type")

		local str = tostring(slot2)
		slot6 = str

		self._parameter_node.set_parameter(self._value, self._parameter_node, "value")
	end

	return 
end
function CoreMaterialEditorParameter:_load_value()
	slot4 = "src"

	if self._editor._current_material_node.parameter(slot2, self._editor._current_material_node) and not self._customize then
		self._node = self._parent_param_node

		if self._parameter_node then
			slot3 = self._editor._current_material_node
			slot7 = self._parameter_node

			self._editor._current_material_node.remove_child_at(slot2, self._editor._current_material_node.index_of_child(slot5, self._editor._current_material_node))

			self._parameter_node = nil
		end
	end

	slot4 = "src"

	if not self._editor._current_material_node.parameter(slot2, self._editor._current_material_node) or self._customize then
		if not self._parameter_node then
			slot3 = self

			self._create_node(slot2)
		end

		self._node = self._parameter_node
	end

	if self._parameter_info.type == "vector3" then
		slot6 = "value"
		self._value = math.string_to_vector(self._node.parameter(slot4, self._node))
	elseif self._parameter_info.type == "texture" then
		slot4 = "file"
		self._value = self._node.parameter(slot2, self._node)
		self._global_texture = false

		if not self._value then
			self._global_texture = true
			slot4 = "global_texture"
			self._value = self._node.parameter(slot2, self._node)
			self._global_texture_type = "cube"
		end
	else
		slot3 = self._parameter_info.ui_type

		if self._parameter_info.ui_type.s(slot2) == "intensity" then
			slot4 = "value"
			self._value = self._node.parameter(slot2, self._node)
		else
			slot6 = "value"
			self._value = tonumber(self._node.parameter(slot4, self._node))
		end
	end

	return 
end
function CoreMaterialEditorParameter:_copy_to_parent(name)
	local material_node = nil

	if name then
		slot6 = "material"
		material_node = self._editor._global_material_config_node.make_child(slot4, self._editor._global_material_config_node)
		slot7 = name

		material_node.set_parameter(slot4, material_node, "name")
	else
		slot8 = "name"
		slot11 = self._editor._parent_combo_box
		material_node = self._editor._find_node(slot4, self._editor, self._editor._global_material_config_node, "material", self._editor._parent_combo_box.get_value(slot10))
	end

	local parent_param_node = nil

	if self._parameter_info.type == "texture" then
		slot7 = material_node
		slot10 = self._parameter_info.name
		parent_param_node = self._editor._get_node(slot5, self._editor, self._parameter_info.name.s(slot9))
	else
		slot9 = "name"
		slot12 = self._parameter_info.name
		parent_param_node = self._editor._find_node(slot5, self._editor, material_node, "variable", self._parameter_info.name.s(slot11))
	end

	if not parent_param_node then
		slot7 = self._parameter_node
		parent_param_node = material_node.add_child(slot5, material_node)
	end

	if self._parameter_info.type == "texture" then
		if self._global_texture then
			slot8 = self._value

			parent_param_node.set_parameter(slot5, parent_param_node, "global_texture")

			if self._global_texture_type then
				slot8 = self._global_texture_type

				parent_param_node.set_parameter(slot5, parent_param_node, "type")
			end
		else
			slot8 = self._value

			parent_param_node.set_parameter(slot5, parent_param_node, "file")
		end
	elseif self._parameter_info.type == "vector3" then
		slot7 = "value"
		slot10 = self._value

		parent_param_node.set_parameter(slot5, parent_param_node, math.vector_to_string(slot9))
	else
		slot7 = "value"
		slot10 = self._value

		parent_param_node.set_parameter(slot5, parent_param_node, tostring(slot9))
	end

	local parent = self._editor._parent_combo_box.get_value(slot5)
	slot7 = self._editor

	self._editor._load_parent_dropdown(self._editor._parent_combo_box)

	slot8 = parent

	self._editor._parent_combo_box.set_value(self._editor._parent_combo_box, self._editor._parent_combo_box)

	return 
end

return CoreMaterialEditorParameter
