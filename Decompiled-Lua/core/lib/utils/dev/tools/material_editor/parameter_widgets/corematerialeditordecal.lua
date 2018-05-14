-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot2 = "core/lib/utils/dev/tools/material_editor/CoreSmartNode"

require(slot1)

slot2 = "core/lib/utils/dev/tools/material_editor/parameter_widgets/CoreMaterialEditorParameter"
local CoreMaterialEditorParameter = require(slot1)

if not CoreMaterialEditorDecal then
	slot3 = CoreMaterialEditorParameter
	local CoreMaterialEditorDecal = class(slot2)
end

CoreMaterialEditorDecal.DECAL_MATERIAL_FILE = "settings/decals"
function CoreMaterialEditorDecal:init(parent, editor)
	slot7 = editor

	self._set_params(slot4, self, parent)

	slot8 = ""
	self._panel = EWS.Panel(slot4, EWS, parent, "")
	slot6 = "HORIZONTAL"
	self._box = EWS.BoxSizer(slot4, EWS)
	slot8 = ""
	self._left_panel = EWS.Panel(slot4, EWS, self._panel, "")
	slot6 = "VERTICAL"
	self._left_box = EWS.BoxSizer(slot4, EWS)
	slot6 = self._left_box

	self._left_panel.set_sizer(slot4, self._left_panel)

	slot9 = "RIGHT,EXPAND"

	self._box.add(slot4, self._box, self._left_panel, 0, 4)

	slot8 = ""
	local panel = EWS.Panel(slot4, EWS, self._panel, "")
	slot10 = "EXPAND"

	self._left_box.add(EWS, self._left_box, panel, 1, 0)

	slot10 = "NO_BORDER"
	self._parent_btn = EWS.Button(EWS, EWS, self._left_panel, "+", "")
	slot6 = self._parent_btn
	slot11 = 0

	self._parent_btn.set_min_size(EWS, Vector3("+", 15, 15))

	slot10 = self

	self._parent_btn.connect(EWS, self._parent_btn, "", "EVT_COMMAND_BUTTON_CLICKED", editor._on_parameter_popup)

	slot10 = "ALIGN_CENTER_HORIZONTAL"

	self._left_box.add(EWS, self._left_box, self._parent_btn, 0, 0)

	slot9 = ""
	panel = EWS.Panel(EWS, EWS, self._panel, "")
	slot10 = "EXPAND"

	self._left_box.add(EWS, self._left_box, panel, 1, 0)

	slot9 = ""
	self._right_panel = EWS.Panel(EWS, EWS, self._panel, "")
	slot9 = "Decal Material"
	self._right_box = EWS.StaticBoxSizer(EWS, EWS, self._right_panel, "HORIZONTAL")
	slot7 = self._right_box

	self._right_panel.set_sizer(EWS, self._right_panel)

	slot10 = "LEFT,EXPAND"

	self._box.add(EWS, self._box, self._right_panel, 1, 4)

	slot7 = self._box

	self._panel.set_sizer(EWS, self._panel)

	slot10 = "CB_READONLY,CB_SORT"
	self._combo_box = EWS.ComboBox(EWS, EWS, self._right_panel, "", "")
	slot7 = "src"
	self._customize = self._editor._current_material_node.parameter(EWS, self._editor._current_material_node) == nil or self._parameter_node ~= nil
	slot7 = self._customize

	self._right_panel.set_enabled(slot5, self._right_panel)

	slot6 = self

	self._fill_decal_materials(slot5)

	slot13 = "_on_combo_box_change"

	self._combo_box.connect(slot5, self._combo_box, "", "EVT_COMMAND_COMBOBOX_SELECTED", callback("", self, self))

	slot10 = "ALL,EXPAND"

	self._right_box.add(slot5, self._right_box, self._combo_box, 1, 4)

	slot6 = self._editor

	self._editor._update_output(slot5)

	return 
end
function CoreMaterialEditorDecal:update(t, dt)
	slot7 = dt

	CoreMaterialEditorParameter.update(slot4, self, t)

	return 
end
function CoreMaterialEditorDecal:destroy()
	slot3 = self

	CoreMaterialEditorParameter.destroy(slot2)

	return 
end
function CoreMaterialEditorDecal:on_toggle_customize()
	self._customize = not self._customize
	slot3 = self._editor

	self._editor._update_output(slot2)

	slot4 = self._customize

	self._right_panel.set_enabled(slot2, self._right_panel)

	if self._customize then
		slot4 = "decal_material"

		self._editor._current_material_node.clear_parameter(slot2, self._editor._current_material_node)

		if self._parent_node then
			slot4 = "decal_material"
		else
			slot4 = "[NONE]"

			self._combo_box.set_value(slot2, self._combo_box)
		end
	elseif self._value == "[NONE]" then
		slot4 = "decal_material"

		self._editor._current_material_node.clear_parameter(slot2, self._editor._current_material_node)
	else
		slot5 = self._value

		self._editor._current_material_node.set_parameter(slot2, self._editor._current_material_node, "decal_material")
	end

	return 
end
function CoreMaterialEditorDecal:on_copy_to_parent()
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
function CoreMaterialEditorDecal:_set_params(parent, editor)
	self._parent = parent
	self._editor = editor
	slot6 = "decal_material"
	self._value = self._editor._current_material_node.parameter(slot4, self._editor._current_material_node) or "[NONE]"
	slot6 = self._editor._parent_combo_box
	self._parent_node = self._editor._parent_materials[self._editor._parent_combo_box.get_value(slot5)]

	return 
end
function CoreMaterialEditorDecal:_copy_to_parent(name)
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

	if self._value == "[NONE]" and not name then
		slot6 = "decal_material"

		material_node.clear_parameter(slot4, material_node)
	else
		slot7 = self._value

		material_node.set_parameter(slot4, material_node, "decal_material")
	end

	local parent = self._editor._parent_combo_box.get_value(slot4)
	slot6 = self._editor

	self._editor._load_parent_dropdown(self._editor._parent_combo_box)

	slot7 = parent

	self._editor._parent_combo_box.set_value(self._editor._parent_combo_box, self._editor._parent_combo_box)

	return 
end
function CoreMaterialEditorDecal:_on_combo_box_change()
	slot3 = self._combo_box
	self._value = self._combo_box.get_value(slot2)

	if self._value == "[NONE]" then
		slot4 = "decal_material"

		self._editor._current_material_node.clear_parameter(slot2, self._editor._current_material_node)
	else
		slot5 = self._value

		self._editor._current_material_node.set_parameter(slot2, self._editor._current_material_node, "decal_material")
	end

	slot3 = self._editor

	self._editor._update_output(slot2)

	return 
end
function CoreMaterialEditorDecal:_fill_decal_materials()
	slot3 = self._combo_box

	self._combo_box.clear(slot2)

	slot4 = "[NONE]"

	self._combo_box.append(slot2, self._combo_box)

	slot5 = self.DECAL_MATERIAL_FILE
	local root = DB.load_node(slot2, DB, "decals")

	if root then
		slot4 = root

		if 0 < root.num_children(slot3) then
			slot4 = root

			for material in root.children(slot3) do
				slot8 = material

				if material.name(slot7) == "material" then
					slot8 = self._combo_box
					slot12 = "name"

					self._combo_box.append(slot7, material.parameter(slot10, material))
				end
			end
		end
	end

	slot5 = self._value

	self._combo_box.set_value(slot3, self._combo_box)

	return 
end

return CoreMaterialEditorDecal
