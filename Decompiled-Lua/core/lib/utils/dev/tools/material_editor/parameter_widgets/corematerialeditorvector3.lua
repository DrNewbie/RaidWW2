slot2 = "core/lib/utils/dev/tools/material_editor/CoreSmartNode"

require(slot1)

slot2 = "core/lib/utils/dev/tools/material_editor/parameter_widgets/CoreMaterialEditorParameter"
local CoreMaterialEditorParameter = require(slot1)

if not CoreMaterialEditorVector3 then
	slot3 = CoreMaterialEditorParameter
	local CoreMaterialEditorVector3 = class(slot2)
end

function CoreMaterialEditorVector3:init(parent, editor, parameter_info, parameter_node)
	slot11 = parameter_node

	CoreMaterialEditorParameter.init(slot6, self, parent, editor, parameter_info)

	slot8 = "VERTICAL"
	local main_box = EWS.BoxSizer(slot6, EWS)
	slot9 = "HORIZONTAL"
	local box = EWS.BoxSizer(EWS, EWS)
	slot13 = "EXPAND"

	main_box.add(EWS, main_box, box, 1, 0)

	slot16 = parameter_info.max
	slot15 = ""
	self._x_slider = EWS.Slider(EWS, EWS, self._right_panel, self._to_slider_range(0, self).x, 0, self._to_slider_range(self._value, self).x, "")
	slot13 = self

	self._x_slider.connect(EWS, self._x_slider, "", "EVT_SCROLL_THUMBTRACK", self._on_slider)

	slot13 = self

	self._x_slider.connect(EWS, self._x_slider, "", "EVT_SCROLL_CHANGED", self._on_slider)

	slot13 = "ALL,EXPAND"

	box.add(EWS, box, self._x_slider, 1, 4)

	slot13 = self._value.x
	slot13 = "TE_PROCESS_ENTER"
	self._x_text_ctrl = EWS.TextCtrl(EWS, EWS, self._right_panel, tostring(4), "")
	slot13 = self

	self._x_text_ctrl.connect(EWS, self._x_text_ctrl, "", "EVT_COMMAND_TEXT_ENTER", self._on_text_ctrl)

	slot9 = self._x_text_ctrl
	slot14 = -1

	self._x_text_ctrl.set_min_size(EWS, Vector3("EVT_COMMAND_TEXT_ENTER", 40, -1))

	slot13 = "ALL,EXPAND"

	box.add(EWS, box, self._x_text_ctrl, 0, 4)

	slot10 = "HORIZONTAL"
	box = EWS.BoxSizer(EWS, EWS)
	slot13 = "EXPAND"

	main_box.add(EWS, main_box, box, 1, 0)

	slot16 = parameter_info.max
	slot15 = ""
	self._y_slider = EWS.Slider(EWS, EWS, self._right_panel, self._to_slider_range(0, self).y, 0, self._to_slider_range(self._value, self).y, "")
	slot13 = self

	self._y_slider.connect(EWS, self._y_slider, "", "EVT_SCROLL_THUMBTRACK", self._on_slider)

	slot13 = self

	self._y_slider.connect(EWS, self._y_slider, "", "EVT_SCROLL_CHANGED", self._on_slider)

	slot13 = "ALL,EXPAND"

	box.add(EWS, box, self._y_slider, 1, 4)

	slot13 = self._value.y
	slot13 = "TE_PROCESS_ENTER"
	self._y_text_ctrl = EWS.TextCtrl(EWS, EWS, self._right_panel, tostring(4), "")
	slot13 = self

	self._y_text_ctrl.connect(EWS, self._y_text_ctrl, "", "EVT_COMMAND_TEXT_ENTER", self._on_text_ctrl)

	slot9 = self._y_text_ctrl
	slot14 = -1

	self._y_text_ctrl.set_min_size(EWS, Vector3("EVT_COMMAND_TEXT_ENTER", 40, -1))

	slot13 = "ALL,EXPAND"

	box.add(EWS, box, self._y_text_ctrl, 0, 4)

	slot10 = "HORIZONTAL"
	box = EWS.BoxSizer(EWS, EWS)
	slot13 = "EXPAND"

	main_box.add(EWS, main_box, box, 1, 0)

	slot16 = parameter_info.max
	slot15 = ""
	self._z_slider = EWS.Slider(EWS, EWS, self._right_panel, self._to_slider_range(0, self).z, 0, self._to_slider_range(self._value, self).z, "")
	slot13 = self

	self._z_slider.connect(EWS, self._z_slider, "", "EVT_SCROLL_THUMBTRACK", self._on_slider)

	slot13 = self

	self._z_slider.connect(EWS, self._z_slider, "", "EVT_SCROLL_CHANGED", self._on_slider)

	slot13 = "ALL,EXPAND"

	box.add(EWS, box, self._z_slider, 1, 4)

	slot13 = self._value.z
	slot13 = "TE_PROCESS_ENTER"
	self._z_text_ctrl = EWS.TextCtrl(EWS, EWS, self._right_panel, tostring(4), "")
	slot13 = self

	self._z_text_ctrl.connect(EWS, self._z_text_ctrl, "", "EVT_COMMAND_TEXT_ENTER", self._on_text_ctrl)

	slot9 = self._z_text_ctrl
	slot14 = -1

	self._z_text_ctrl.set_min_size(EWS, Vector3("EVT_COMMAND_TEXT_ENTER", 40, -1))

	slot13 = "ALL,EXPAND"

	box.add(EWS, box, self._z_text_ctrl, 0, 4)

	slot13 = "EXPAND"

	self._right_box.add(EWS, self._right_box, main_box, 1, 0)

	return 
end
function CoreMaterialEditorVector3:update(t, dt)
	slot7 = dt

	CoreMaterialEditorParameter.update(slot4, self, t)

	return 
end
function CoreMaterialEditorVector3:destroy()
	slot3 = self

	CoreMaterialEditorParameter.destroy(slot2)

	return 
end
function CoreMaterialEditorVector3:on_toggle_customize()
	self._customize = not self._customize
	slot3 = self

	self._load_value(slot2)

	slot3 = self._editor

	self._editor._update_output(slot2)

	slot4 = self._customize

	self._right_panel.set_enabled(slot2, self._right_panel)

	slot3 = self._x_text_ctrl
	slot7 = self._value.x

	self._x_text_ctrl.set_value(slot2, string.format(slot5, "%.3f"))

	slot3 = self._y_text_ctrl
	slot7 = self._value.y

	self._y_text_ctrl.set_value(slot2, string.format(slot5, "%.3f"))

	slot3 = self._z_text_ctrl
	slot7 = self._value.z

	self._z_text_ctrl.set_value(slot2, string.format(slot5, "%.3f"))

	slot4 = self._value
	local value = self._to_slider_range(slot2, self)
	slot5 = value.x

	self._x_slider.set_value(self, self._x_slider)

	slot5 = value.y

	self._y_slider.set_value(self, self._y_slider)

	slot5 = value.z

	self._z_slider.set_value(self, self._z_slider)

	slot4 = self

	self.update_live(self)

	return 
end
function CoreMaterialEditorVector3:_on_slider()
	slot3 = self
	slot7 = self._y_slider.get_value(self._x_slider)
	slot10 = self._z_slider
	self._value = self._from_slider_range(slot2, Vector3(slot5, self._x_slider.get_value(slot7), self._z_slider.get_value(self._y_slider)))
	slot4 = "value"
	slot7 = self._value

	self._parameter_node.set_parameter(slot2, self._parameter_node, math.vector_to_string(self._x_slider.get_value(slot7)))

	slot3 = self

	self.update_live(slot2)

	slot3 = self._x_text_ctrl
	slot7 = self._value.x

	self._x_text_ctrl.set_value(slot2, string.format(math.vector_to_string, "%.3f"))

	slot3 = self._y_text_ctrl
	slot7 = self._value.y

	self._y_text_ctrl.set_value(slot2, string.format(math.vector_to_string, "%.3f"))

	slot3 = self._z_text_ctrl
	slot7 = self._value.z

	self._z_text_ctrl.set_value(slot2, string.format(math.vector_to_string, "%.3f"))

	return 
end
function CoreMaterialEditorVector3:_on_text_ctrl()
	slot9 = self._z_text_ctrl
	slot5 = tonumber(self._z_text_ctrl.get_value(self._y_text_ctrl)) or 0
	self._value = Vector3(slot2, tonumber(self._x_text_ctrl.get_value(slot6)) or 0, tonumber(self._y_text_ctrl.get_value(self._x_text_ctrl)) or 0)
	slot4 = "value"
	slot7 = self._value

	self._parameter_node.set_parameter(slot2, self._parameter_node, math.vector_to_string(slot6))

	slot3 = self

	self.update_live(slot2)

	slot4 = self._value
	local value = self._to_slider_range(slot2, self)
	slot5 = value.x

	self._x_slider.set_value(self, self._x_slider)

	slot5 = value.y

	self._y_slider.set_value(self, self._y_slider)

	slot5 = value.z

	self._z_slider.set_value(self, self._z_slider)

	slot4 = self._editor

	self._editor._update_output(self)

	return 
end
function CoreMaterialEditorVector3:_to_slider_range(v)
	local step_x = self._parameter_info.step.x

	if step_x == 0 then
		step_x = step_x + 0.001
	end

	local step_y = self._parameter_info.step.y

	if step_y == 0 then
		step_y = step_y + 0.001
	end

	local step_z = self._parameter_info.step.z

	if step_z == 0 then
		step_z = step_z + 0.001
	end

	slot12 = step_x
	slot13 = step_y
	slot8 = CoreMaterialEditorParameter.to_slider_range(self, self, v.y, self._parameter_info.min.y)
	slot14 = step_z

	return Vector3(slot6, CoreMaterialEditorParameter.to_slider_range(slot8, self, v.x, self._parameter_info.min.x), CoreMaterialEditorParameter.to_slider_range(self, self, v.z, self._parameter_info.min.z))
end
function CoreMaterialEditorVector3:_from_slider_range(v)
	local step_x = self._parameter_info.step.x

	if step_x == 0 then
		step_x = step_x + 0.001
	end

	local step_y = self._parameter_info.step.y

	if step_y == 0 then
		step_y = step_y + 0.001
	end

	local step_z = self._parameter_info.step.z

	if step_z == 0 then
		step_z = step_z + 0.001
	end

	slot12 = step_x
	slot13 = step_y
	slot8 = CoreMaterialEditorParameter.from_slider_range(self, self, v.y, self._parameter_info.min.y)
	slot14 = step_z

	return Vector3(slot6, CoreMaterialEditorParameter.from_slider_range(slot8, self, v.x, self._parameter_info.min.x), CoreMaterialEditorParameter.from_slider_range(self, self, v.z, self._parameter_info.min.z))
end

return CoreMaterialEditorVector3
