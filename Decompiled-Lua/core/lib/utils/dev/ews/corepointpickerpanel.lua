-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CorePointPickerPanel"

core.module(slot1, core)

slot3 = "CorePointPicker"

core.import(slot1, core)

slot3 = "CorePointerDraw"

core.import(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

slot3 = "CoreEvent"

core.import(slot1, core)

slot3 = "CoreDebug"

core.import(slot1, core)

PointPickerPanel = PointPickerPanel or CoreClass.class()
function PointPickerPanel:init(parent_frame, title)
	slot5 = managers.viewport

	assert(slot4)

	slot5 = CorePointPicker.PointPicker
	self.__point_picker = CorePointPicker.PointPicker.new(slot4, managers.viewport.get_active_vp(slot7))
	slot11 = "_on_picking"

	self.__point_picker.connect(slot4, self.__point_picker, "EVT_PICKING", CoreEvent.callback(managers.viewport, self, self))

	slot11 = "_on_finished_picking"
	slot8 = self.__point_picker

	self.__point_picker.connect(slot4, self.__point_picker, "EVT_FINISHED_PICKING", CoreEvent.callback(self.__point_picker, self, self))

	slot8 = "ffffff"
	slot7 = 10
	self.__point_draw = CorePointerDraw.PointerDraw.new(slot4, CorePointerDraw.PointerDraw, Color(CoreEvent.callback(self.__point_picker, self, self)))
	slot6 = parent_frame

	self._create_panel(slot4, self)

	return 
end
function PointPickerPanel:_create_panel(parent_frame)
	slot5 = "HORIZONTAL"
	local panel_sizer = EWS.BoxSizer(slot3, EWS)
	slot6 = parent_frame
	self.__panel = EWS.Panel(EWS, EWS)
	slot6 = panel_sizer

	self.__panel.set_sizer(EWS, self.__panel)

	self.__picker_button = EWS.ToggleButton(EWS, EWS, self.__panel, "Pick", "")
	slot12 = "_on_picker_toggle"
	slot9 = ""

	self.__picker_button.connect(EWS, self.__picker_button, "", "EVT_COMMAND_TOGGLEBUTTON_CLICKED", CoreEvent.callback("NO_BORDER", self, self))

	slot9 = "TE_PROCESS_ENTER,TE_RIGHT"
	self.__x_textctrl = EWS.TextCtrl(EWS, EWS, self.__panel, 0, "")
	slot9 = "TE_PROCESS_ENTER,TE_RIGHT"
	self.__y_textctrl = EWS.TextCtrl(EWS, EWS, self.__panel, 0, "")
	slot9 = "TE_PROCESS_ENTER,TE_RIGHT"
	self.__z_textctrl = EWS.TextCtrl(EWS, EWS, self.__panel, 0, "")
	slot9 = "ALL,EXPAND"

	panel_sizer.add(EWS, panel_sizer, self.__picker_button, 1, 2)

	slot10 = "x:"
	slot9 = "ALL,ALIGN_CENTER_VERTICAL,ALIGN_RIGHT"

	panel_sizer.add(EWS, panel_sizer, EWS.StaticText(1, EWS, self.__panel), 0, 4)

	slot9 = "ALL,EXPAND,ALIGN_RIGHT"

	panel_sizer.add(EWS, panel_sizer, self.__x_textctrl, 1, 2)

	slot10 = "y:"
	slot9 = "ALL,ALIGN_CENTER_VERTICAL,ALIGN_RIGHT"

	panel_sizer.add(EWS, panel_sizer, EWS.StaticText(1, EWS, self.__panel), 0, 4)

	slot9 = "ALL,EXPAND,ALIGN_RIGHT"

	panel_sizer.add(EWS, panel_sizer, self.__y_textctrl, 1, 2)

	slot10 = "z:"
	slot9 = "ALL,ALIGN_CENTER_VERTICAL,ALIGN_RIGHT"

	panel_sizer.add(EWS, panel_sizer, EWS.StaticText(1, EWS, self.__panel), 0, 4)

	slot9 = "ALL,EXPAND,ALIGN_RIGHT"

	panel_sizer.add(EWS, panel_sizer, self.__z_textctrl, 1, 2)

	return 
end
function PointPickerPanel:panel()
	return self.__panel
end
function PointPickerPanel:get_value()
	return self.__current_position
end
function PointPickerPanel:set_value(vector)
	self.__current_position = vector
	slot5 = vector

	self._set_text(slot3, self)

	return 
end
function PointPickerPanel:update(time, delta_time)
	slot5 = self

	if self._text_ctrl_has_focus(slot4) then
		slot9 = self.__z_textctrl
		self.__current_position = Vector3(slot4, self.__x_textctrl.get_value(self.__y_textctrl.get_value(self.__x_textctrl)), self.__z_textctrl.get_value(self.__y_textctrl))
		self.__draw_position = self.__current_position
	end

	slot6 = self.__draw_position

	self.__point_draw.set_position(slot4, self.__point_draw)

	slot7 = delta_time

	self.__point_picker.update(slot4, self.__point_picker, time)

	slot7 = delta_time

	self.__point_draw.update(slot4, self.__point_draw, time)

	return 
end
function PointPickerPanel:_text_ctrl_has_focus()

	-- Decompilation error in this vicinity:
	slot3 = EWS
end
function PointPickerPanel:_set_text(vector)
	slot4 = self.__x_textctrl
	slot8 = vector.x

	self.__x_textctrl.set_value(slot3, string.format(slot6, "%.3f"))

	slot4 = self.__y_textctrl
	slot8 = vector.y

	self.__y_textctrl.set_value(slot3, string.format(slot6, "%.3f"))

	slot4 = self.__z_textctrl
	slot8 = vector.z

	self.__z_textctrl.set_value(slot3, string.format(slot6, "%.3f"))

	return 
end
function PointPickerPanel:_on_picker_toggle()
	slot3 = self.__picker_button

	if self.__picker_button.get_value(slot2) == false then
		slot3 = self.__point_picker

		self.__point_picker.stop_picking(slot2)

		slot4 = true

		self.__picker_button.set_value(slot2, self.__picker_button)
	else
		slot3 = self.__point_picker

		self.__point_picker.start_picking(slot2)

		slot4 = false

		self.__picker_button.set_value(slot2, self.__picker_button)
	end

	return 
end
function PointPickerPanel:_on_picking(sender, raycast)
	if raycast then
		slot6 = raycast.position

		self._set_text(slot4, self)

		self.__current_position = raycast.position
		self.__draw_position = raycast.position
	else
		slot5 = self
		slot10 = 0

		self.set_value(slot4, Vector3(slot7, 0, 0))

		self.__draw_position = nil
		self.__current_position = nil
	end

	return 
end
function PointPickerPanel:_on_finished_picking(sender, raycast)
	if raycast then
		slot6 = false

		self.__picker_button.set_value(slot4, self.__picker_button)

		self.__current_position = raycast.position
		self.__draw_position = nil
		slot6 = raycast.position

		self.set_value(slot4, self)
	end

	return 
end

return 
