-- Decompilation Error: self.ljd.ast.slotworks.eliminate_temporary(self.ast)

slot0 = core
slot2 = slot0
slot0 = slot0.module
slot3 = "CoreColorPickerDraggables"

slot0(slot1, slot2)

slot0 = core
slot2 = slot0
slot0 = slot0.import
slot3 = "CoreClass"

slot0(slot1, slot2)

slot0 = core
slot2 = slot0
slot0 = slot0.import
slot3 = "CoreEvent"

slot0(slot1, slot2)

slot0 = core
slot2 = slot0
slot0 = slot0.import
slot3 = "CoreMath"

slot0(slot1, slot2)

slot0 = ColorPickerDraggables

if not slot0 then
	slot0 = CoreClass
	slot0 = slot0.mixin
	slot2 = CoreClass
	slot2 = slot2.class
	slot2 = slot2()
	slot3 = CoreEvent
	slot3 = slot3.BasicEventHandling
	slot0 = slot0(slot1, slot2)
end

ColorPickerDraggables = slot0
slot0 = ColorPickerDraggables

function slot1(self, parent_frame, enable_alpha, enable_value)
	slot6 = self
	slot4 = self._create_panel
	slot7 = parent_frame
	slot8 = enable_alpha
	slot9 = enable_value

	slot4(slot5, slot6, slot7, slot8)

	slot6 = self
	slot4 = self.set_color
	slot7 = Color
	slot7 = slot7.white

	slot4(slot5, slot6)

	return 
end

slot0.init = slot1
slot0 = ColorPickerDraggables

function slot1(self, time, delta_time)
	return 
end

slot0.update = slot1
slot0 = ColorPickerDraggables

function slot1(self)
	slot1 = self._panel

	return slot1
end

slot0.panel = slot1
slot0 = ColorPickerDraggables

function slot1(self)
	slot1 = self._alpha_slider

	if not slot1 then
		slot3 = self._value_slider or self._spectrum
	end

	slot1 = slot1.color

	return slot1(slot2)
end

slot0.color = slot1
slot0 = ColorPickerDraggables

function slot1(self, color)
	slot2 = CoreMath
	slot2 = slot2.rgb_to_hsv
	slot4 = color.red
	slot5 = color.green
	slot6 = color.blue
	slot2, slot3, slot4 = slot2(slot3, slot4, slot5)
	value = slot4
	saturation = slot3
	hue = slot2
	slot2 = self._spectrum
	slot4 = slot2
	slot2 = slot2.set_hue
	slot5 = hue

	slot2(slot3, slot4)

	slot2 = self._spectrum
	slot4 = slot2
	slot2 = slot2.set_saturation
	slot5 = saturation

	slot2(slot3, slot4)

	slot2 = self._spectrum
	slot4 = slot2
	slot2 = slot2.set_value
	slot5 = value

	slot2(slot3, slot4)

	slot2 = self._value_slider

	if slot2 then
		slot2 = self._value_slider
		slot4 = slot2
		slot2 = slot2.set_value
		slot5 = value

		slot2(slot3, slot4)
	end

	slot2 = self._alpha_slider

	if slot2 then
		slot2 = self._alpha_slider
		slot4 = slot2
		slot2 = slot2.set_value
		slot5 = color.alpha

		slot2(slot3, slot4)
	end

	slot4 = self
	slot2 = self._update_ui_except
	slot5 = self._spectrum

	slot2(slot3, slot4)

	return 
end

slot0.set_color = slot1
slot0 = ColorPickerDraggables

function slot1(self, parent_frame, enable_alpha, enable_value)
	if enable_alpha == nil then
		enable_alpha = true
	end

	if enable_value == nil then
		enable_value = true
	end

	slot4 = EWS
	slot6 = slot4
	slot4 = slot4.Panel
	slot7 = parent_frame
	slot4 = slot4(slot5, slot6)
	self._panel = slot4
	slot4 = self._panel
	slot6 = slot4
	slot4 = slot4.set_min_size
	slot7 = Vector3
	slot9 = 180
	slot10 = 134
	slot11 = 0

	slot4(slot5, slot7(slot8, slot9, slot10))

	slot4 = EWS
	slot6 = slot4
	slot4 = slot4.BoxSizer
	slot7 = "HORIZONTAL"
	local panel_sizer = slot4(slot5, slot6)
	slot5 = self._panel
	slot7 = slot5
	slot5 = slot5.set_sizer
	slot8 = panel_sizer

	slot5(slot6, slot7)

	local slider_width = 20
	local slider_margin = 3
	slot7 = EWS
	slot9 = slot7
	slot7 = slot7.ColorSpectrum
	slot10 = self._panel
	slot11 = ""
	slot7 = slot7(slot8, slot9, slot10)
	self._spectrum = slot7
	slot9 = panel_sizer
	slot7 = panel_sizer.add
	slot10 = self._spectrum
	slot11 = 0
	slot12 = slider_margin
	slot13 = "ALL"

	slot7(slot8, slot9, slot10, slot11, slot12)

	slot7 = self._spectrum
	slot9 = slot7
	slot7 = slot7.connect
	slot10 = "EVT_LEFT_DOWN"
	slot11 = CoreEvent
	slot11 = slot11.callback
	slot13 = self
	slot14 = self
	slot15 = "_on_drag_start"
	slot11 = slot11(slot12, slot13, slot14)
	slot12 = self._spectrum

	slot7(slot8, slot9, slot10, slot11)

	slot7 = self._spectrum
	slot9 = slot7
	slot7 = slot7.get_min_size
	local spectrum_size = slot7(slot8)

	if enable_value then
		slot8 = EWS
		slot10 = slot8
		slot8 = slot8.ColorSlider
		slot11 = self._panel
		slot12 = ""
		slot8 = slot8(slot9, slot10, slot11)
		self._value_slider = slot8
		slot10 = panel_sizer
		slot8 = panel_sizer.add
		slot11 = self._value_slider
		slot12 = 0
		slot13 = 0
		slot14 = "EXPAND"

		slot8(slot9, slot10, slot11, slot12, slot13)

		slot8 = self._value_slider
		slot10 = slot8
		slot8 = slot8.connect
		slot11 = "EVT_LEFT_DOWN"
		slot12 = CoreEvent
		slot12 = slot12.callback
		slot14 = self
		slot15 = self
		slot16 = "_on_drag_start"
		slot12 = slot12(slot13, slot14, slot15)
		slot13 = self._value_slider

		slot8(slot9, slot10, slot11, slot12)
	else
		slot10 = spectrum_size
		slot8 = spectrum_size.with_x
		slot11 = spectrum_size.x
		slot11 = slot11 + slider_width
		slot11 = slot11 + slider_margin
		slot8 = slot8(slot9, slot10)
		spectrum_size = slot8
	end

	if enable_alpha then
		slot8 = EWS
		slot10 = slot8
		slot8 = slot8.ColorSlider
		slot11 = self._panel
		slot12 = ""
		slot8 = slot8(slot9, slot10, slot11)
		self._alpha_slider = slot8
		slot10 = panel_sizer
		slot8 = panel_sizer.add
		slot11 = self._alpha_slider
		slot12 = 0
		slot13 = slider_margin
		slot14 = "LEFT,RIGHT,EXPAND"

		slot8(slot9, slot10, slot11, slot12, slot13)

		slot8 = self._alpha_slider
		slot10 = slot8
		slot8 = slot8.connect
		slot11 = "EVT_LEFT_DOWN"
		slot12 = CoreEvent
		slot12 = slot12.callback
		slot14 = self
		slot15 = self
		slot16 = "_on_drag_start"
		slot12 = slot12(slot13, slot14, slot15)
		slot13 = self._alpha_slider

		slot8(slot9, slot10, slot11, slot12)
	else
		slot10 = spectrum_size
		slot8 = spectrum_size.with_x
		slot11 = spectrum_size.x
		slot11 = slot11 + slider_width
		slot11 = slot11 + slider_margin
		slot8 = slot8(slot9, slot10)
		spectrum_size = slot8
	end

	slot8 = self._spectrum
	slot10 = slot8
	slot8 = slot8.set_min_size
	slot11 = spectrum_size

	slot8(slot9, slot10)

	return 
end

slot0._create_panel = slot1
slot0 = ColorPickerDraggables

function slot1(self, sender)
	slot2 = self._value_slider

	if slot2 ~= nil then
		slot2 = self._spectrum

		if sender ~= slot2 then
			slot2 = self._spectrum
			slot4 = slot2
			slot2 = slot2.set_value
			slot5 = self._value_slider
			slot7 = slot5
			slot5 = slot5.value

			slot2(slot3, slot5(slot6))
		end

		slot2 = self._value_slider

		if sender ~= slot2 then
			slot2 = self._value_slider
			slot4 = slot2
			slot2 = slot2.set_top_color
			slot5 = self._spectrum
			slot7 = slot5
			slot5 = slot5.unscaled_color

			slot2(slot3, slot5(slot6))
		end
	end

	slot2 = self._alpha_slider

	if sender ~= slot2 then
		slot2 = self._alpha_slider

		if slot2 ~= nil then
			slot4 = self._value_slider or self._spectrum
			slot2 = slot2.color
			local opaque_color = slot2(slot3)
			slot3 = self._alpha_slider
			slot5 = slot3
			slot3 = slot3.set_top_color
			slot6 = opaque_color

			slot3(slot4, slot5)

			slot3 = self._alpha_slider
			slot5 = slot3
			slot3 = slot3.set_bottom_color
			slot8 = opaque_color
			slot6 = opaque_color.with_alpha
			slot9 = 0

			slot3(slot4, slot6(slot7, slot8))
		end
	end

	return 
end

slot0._update_ui_except = slot1
slot0 = ColorPickerDraggables

function slot1(self, sender, event)
	slot5 = event
	slot3 = event.get_position
	slot6 = sender
	local event_position_in_sender = slot3(slot4, slot5)
	slot4 = self._spectrum

	if sender == slot4 then
		slot6 = sender
		slot4 = sender.set_hue
		slot9 = sender
		slot7 = sender.point_to_hue
		slot10 = event_position_in_sender

		slot4(slot5, slot7(slot8, slot9))

		slot6 = sender
		slot4 = sender.set_saturation
		slot9 = sender
		slot7 = sender.point_to_saturation
		slot10 = event_position_in_sender

		slot4(slot5, slot7(slot8, slot9))
	else
		slot6 = sender
		slot4 = sender.set_value
		slot9 = sender
		slot7 = sender.point_to_value
		slot10 = event_position_in_sender

		slot4(slot5, slot7(slot8, slot9))
	end

	slot6 = self
	slot4 = self._update_ui_except
	slot7 = sender

	slot4(slot5, slot6)

	slot6 = self
	slot4 = self._send_event
	slot7 = "EVT_COLOR_UPDATED"
	slot10 = self
	slot8 = self.color

	slot4(slot5, slot6, slot8(slot9))

	return 
end

slot0._process_color_update_event = slot1
slot0 = ColorPickerDraggables

function slot1(self, sender, event)
	slot5 = self
	slot3 = self._process_color_update_event
	slot6 = sender
	slot7 = event

	slot3(slot4, slot5, slot6)

	slot5 = self
	slot3 = self._send_event
	slot6 = "EVT_COLOR_CHANGED"
	slot9 = self
	slot7 = self.color

	slot3(slot4, slot5, slot7(slot8))

	return 
end

slot0._process_color_change_event = slot1
slot0 = ColorPickerDraggables

function slot1(self, sender, event)
	slot3 = EWS
	slot5 = slot3
	slot3 = slot3.MouseEvent
	slot6 = "EVT_LEFT_DOWN"
	slot3 = slot3(slot4, slot5)
	self._previous_mouse_event = slot3
	self._dragged_control = sender
	slot5 = self
	slot3 = self._process_color_update_event
	slot6 = sender
	slot7 = event

	slot3(slot4, slot5, slot6)

	return 
end

slot0._on_drag_start = slot1
slot0 = ColorPickerDraggables

function slot1(self, sender, event)
	slot5 = self
	slot3 = self._process_color_update_event
	slot6 = sender
	slot7 = event

	slot3(slot4, slot5, slot6)

	return 
end

slot0._on_dragging = slot1
slot0 = ColorPickerDraggables

function slot1(self, sender, event)
	slot5 = self
	slot3 = self._process_color_change_event
	slot6 = sender
	slot7 = event

	slot3(slot4, slot5, slot6)

	slot3 = nil
	self._dragged_control = slot3

	return 
end

slot0._on_drag_stop = slot1

return 
