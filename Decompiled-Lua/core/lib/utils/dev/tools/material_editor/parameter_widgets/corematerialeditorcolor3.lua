slot2 = "core/lib/utils/dev/tools/material_editor/CoreSmartNode"

require(slot1)

slot3 = "CoreClass"

core.import(slot1, core)

slot3 = "CoreEvent"

core.import(slot1, core)

slot3 = "CoreEws"

core.import(slot1, core)

slot3 = "CoreColorPickerPanel"

core.import(slot1, core)

slot2 = "core/lib/utils/dev/tools/material_editor/parameter_widgets/CoreMaterialEditorParameter"
local CoreMaterialEditorParameter = require(slot1)

if not CoreMaterialEditorColor3 then
	slot3 = CoreMaterialEditorParameter
	local CoreMaterialEditorColor3 = class(slot2)
end

function CoreMaterialEditorColor3:init(parent, editor, parameter_info, parameter_node)
	slot11 = parameter_node

	CoreMaterialEditorParameter.init(slot6, self, parent, editor, parameter_info)

	slot10 = "HORIZONTAL"
	self._picker_panel = CoreColorPickerPanel.ColorPickerPanel.new(slot6, CoreColorPickerPanel.ColorPickerPanel, self._right_panel, false)
	slot7 = self._picker_panel
	slot12 = self._value.z

	self._picker_panel.set_color(slot6, Color(false, self._value.x, self._value.y))

	slot13 = "_on_color"
	slot10 = self._picker_panel

	self._picker_panel.connect(slot6, self._picker_panel, "EVT_COLOR_UPDATED", CoreEvent.callback(self._value.x, self, self))

	slot10 = self._picker_panel
	slot11 = "ALL,EXPAND"

	self._right_box.add(slot6, self._right_box, self._picker_panel.panel(CoreEvent.callback(self._value.x, self, self)), 1, 0)

	return 
end
function CoreMaterialEditorColor3:update(t, dt)
	slot7 = dt

	CoreMaterialEditorParameter.update(slot4, self, t)

	slot7 = dt

	self._picker_panel.update(slot4, self._picker_panel, t)

	return 
end
function CoreMaterialEditorColor3:destroy()
	slot3 = self

	CoreMaterialEditorParameter.destroy(slot2)

	return 
end
function CoreMaterialEditorColor3:on_toggle_customize()
	self._customize = not self._customize
	slot3 = self

	self._load_value(slot2)

	slot3 = self._editor

	self._editor._update_output(slot2)

	slot4 = self._customize

	self._right_panel.set_enabled(slot2, self._right_panel)

	slot3 = self._picker_panel
	slot8 = self._value.z

	self._picker_panel.set_color(slot2, Color(slot5, self._value.x, self._value.y))

	slot3 = self

	self.update_live(slot2)

	return 
end
function CoreMaterialEditorColor3:_on_color(sender, color)
	slot7 = color.b
	self._value = Vector3(slot4, color.r, color.g)
	slot6 = "value"
	slot9 = self._value

	self._parameter_node.set_parameter(slot4, self._parameter_node, math.vector_to_string(slot8))

	slot5 = self

	self.update_live(slot4)

	return 
end

return CoreMaterialEditorColor3
