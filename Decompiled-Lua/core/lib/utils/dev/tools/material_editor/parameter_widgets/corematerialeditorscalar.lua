slot2 = "core/lib/utils/dev/tools/material_editor/CoreSmartNode"

require(slot1)

slot2 = "core/lib/utils/dev/tools/material_editor/parameter_widgets/CoreMaterialEditorParameter"
local CoreMaterialEditorParameter = require(slot1)

if not CoreMaterialEditorScalar then
	slot3 = CoreMaterialEditorParameter
	local CoreMaterialEditorScalar = class(slot2)
end

function CoreMaterialEditorScalar:init(parent, editor, parameter_info, parameter_node)
	slot11 = parameter_node

	CoreMaterialEditorParameter.init(slot6, self, parent, editor, parameter_info)

	slot14 = parameter_info.step
	slot16 = parameter_info.step
	slot13 = ""
	self._slider = EWS.Slider(slot6, EWS, self._right_panel, self.to_slider_range(parameter_info, self, self._value, parameter_info.min), 0, self.to_slider_range(self._value, self, parameter_info.max, parameter_info.min), "")
	slot11 = self

	self._slider.connect(slot6, self._slider, "", "EVT_SCROLL_THUMBTRACK", self._on_slider)

	slot11 = self

	self._slider.connect(slot6, self._slider, "", "EVT_SCROLL_CHANGED", self._on_slider)

	slot11 = "ALL,EXPAND"

	self._right_box.add(slot6, self._right_box, self._slider, 1, 4)

	slot11 = self._value
	slot11 = "TE_PROCESS_ENTER"
	self._text_ctrl = EWS.TextCtrl(slot6, EWS, self._right_panel, tostring(4), "")
	slot11 = self

	self._text_ctrl.connect(slot6, self._text_ctrl, "", "EVT_COMMAND_TEXT_ENTER", self._on_text_ctrl)

	slot7 = self._text_ctrl
	slot12 = -1

	self._text_ctrl.set_min_size(slot6, Vector3("EVT_COMMAND_TEXT_ENTER", 40, -1))

	slot11 = "ALL,EXPAND"

	self._right_box.add(slot6, self._right_box, self._text_ctrl, 0, 4)

	return 
end
function CoreMaterialEditorScalar:update(t, dt)
	slot7 = dt

	CoreMaterialEditorParameter.update(slot4, self, t)

	return 
end
function CoreMaterialEditorScalar:destroy()
	slot3 = self

	CoreMaterialEditorParameter.destroy(slot2)

	return 
end
function CoreMaterialEditorScalar:on_toggle_customize()
	self._customize = not self._customize
	slot3 = self

	self._load_value(slot2)

	slot3 = self._editor

	self._editor._update_output(slot2)

	slot4 = self._customize

	self._right_panel.set_enabled(slot2, self._right_panel)

	slot3 = self._text_ctrl
	slot7 = self._value

	self._text_ctrl.set_value(slot2, string.format(slot5, "%.3f"))

	slot3 = self._slider
	slot9 = self._parameter_info.step

	self._slider.set_value(slot2, self.to_slider_range(slot5, self, self._value, self._parameter_info.min))

	slot3 = self

	self.update_live(slot2)

	return 
end
function CoreMaterialEditorScalar:_on_slider()
	slot6 = self._slider
	self._value = self.from_slider_range(slot2, self, self._slider.get_value(slot5), self._parameter_info.min)
	slot4 = "value"
	slot7 = self._value

	self._parameter_node.set_parameter(slot2, self._parameter_node, tostring(self._parameter_info.step))

	slot3 = self._text_ctrl
	slot7 = self._value

	self._text_ctrl.set_value(slot2, string.format(tostring, "%.3f"))

	slot3 = self

	self.update_live(slot2)

	return 
end
function CoreMaterialEditorScalar:_on_text_ctrl()
	slot5 = self._text_ctrl
	self._value = tonumber(self._text_ctrl.get_value(slot4)) or 0
	slot4 = "value"
	slot7 = self._value

	self._parameter_node.set_parameter(slot2, self._parameter_node, tostring(slot6))

	slot3 = self._slider
	slot9 = self._parameter_info.step

	self._slider.set_value(slot2, self.to_slider_range(tostring, self, self._value, self._parameter_info.min))

	slot3 = self._editor

	self._editor._update_output(slot2)

	slot3 = self

	self.update_live(slot2)

	return 
end

return CoreMaterialEditorScalar
