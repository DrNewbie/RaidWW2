slot2 = "core/lib/utils/dev/tools/material_editor/CoreSmartNode"

require(slot1)

slot2 = "core/lib/utils/dev/tools/material_editor/parameter_widgets/CoreMaterialEditorParameter"
local CoreMaterialEditorParameter = require(slot1)

if not CoreMaterialEditorDBValue then
	slot3 = CoreMaterialEditorParameter
	local CoreMaterialEditorDBValue = class(slot2)
end

function CoreMaterialEditorDBValue:init(parent, editor, parameter_info, parameter_node)
	slot11 = parameter_node

	CoreMaterialEditorParameter.init(slot6, self, parent, editor, parameter_info)

	self._combobox = EWS.ComboBox(slot6, EWS, self._right_panel, self._value, "")
	slot7 = self

	self._fill_combobox(slot6)

	slot8 = self._value

	self._combobox.set_value(slot6, self._combobox)

	slot14 = "_on_combobox_changed"
	slot11 = ""

	self._combobox.connect(slot6, self._combobox, "", "EVT_COMMAND_COMBOBOX_SELECTED", callback("CB_READONLY", self, self))

	slot11 = "ALL,EXPAND"

	self._right_box.add(slot6, self._right_box, self._combobox, 0, 4)

	return 
end
function CoreMaterialEditorDBValue:update(t, dt)
	slot7 = dt

	CoreMaterialEditorParameter.update(slot4, self, t)

	return 
end
function CoreMaterialEditorDBValue:destroy()
	slot3 = self

	CoreMaterialEditorParameter.destroy(slot2)

	return 
end
function CoreMaterialEditorDBValue:on_toggle_customize()
	self._customize = not self._customize
	slot3 = self

	self._load_value(slot2)

	slot3 = self._editor

	self._editor._update_output(slot2)

	slot4 = self._customize

	self._right_panel.set_enabled(slot2, self._right_panel)

	slot4 = self._value

	self._combobox.set_value(slot2, self._combobox)

	slot3 = self

	self.update_live(slot2)

	return 
end
function CoreMaterialEditorDBValue:_on_combobox_changed()
	slot3 = self._combobox
	self._value = self._combobox.get_value(slot2)
	slot4 = "value"
	slot7 = self._value

	self._parameter_node.set_parameter(slot2, self._parameter_node, tostring(slot6))

	slot3 = self

	self.update_live(slot2)

	return 
end
function CoreMaterialEditorDBValue:_fill_combobox()
	slot5 = LightIntensityDB

	for _, v in ipairs(LightIntensityDB.list(slot4)) do
		slot8 = self._combobox
		slot11 = v

		self._combobox.append(slot7, v.s(slot10))
	end

	return 
end

return CoreMaterialEditorDBValue
