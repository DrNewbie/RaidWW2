-- Decompilation Error: self.ljd.ast.slotworks.eliminate_temporary(self.ast)

-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot0 = core
slot2 = slot0
slot0 = slot0.module
slot3 = "CoreVectorSliderBox"

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
slot3 = "CoreEws"

slot0(slot1, slot2)

slot0 = core
slot2 = slot0
slot0 = slot0.import
slot3 = "CoreDebug"

slot0(slot1, slot2)

slot0 = VectorSliderBox

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

VectorSliderBox = slot0
slot0 = VectorSliderBox

function slot1(self, parent_frame, title, min, max, step)
	slot8 = min < max

	assert(slot7)

	self._parent_frame = parent_frame
	self._step = step
	self._min = min
	self._max = max
	self._slider_max = (max - min) / step
	slot6 = EWS
	slot8 = slot6
	slot6 = slot6.StaticBoxSizer
	slot9 = self._parent_frame
	slot10 = "VERTICAL"
	slot11 = title
	slot6 = slot6(slot7, slot8, slot9, slot10)
	self._box = slot6

	return 
end

slot0.init = slot1
slot0 = VectorSliderBox

function slot1(self)
	slot1 = self._box

	return slot1
end

slot0.box = slot1
slot0 = VectorSliderBox

function slot1(self)
	slot3 = self
	slot1 = self._update_text

	slot1(slot2)

	return 
end

slot0._on_slider_movement = slot1
slot0 = VectorSliderBox

function slot1(self)
	slot3 = self
	slot1 = self._update_values

	slot1(slot2)

	return 
end

slot0._on_slider_changed = slot1
slot0 = VectorSliderBox

function slot1(self)
	slot1 = self.__mute_toggle
	slot3 = slot1
	slot1 = slot1.get_value
	slot1 = slot1(slot2)

	if slot1 == true then
		slot3 = self
		slot1 = self._set_enabled_all
		slot4 = false

		slot1(slot2, slot3)
	else
		slot3 = self
		slot1 = self._set_enabled_all
		slot4 = true

		slot1(slot2, slot3)
	end

	return 
end

slot0._on_mute_toggle = slot1
slot0 = VectorSliderBox

function slot1(self)
	slot1 = EWS
	slot3 = slot1
	slot1 = slot1.Slider
	slot4 = self._parent_frame
	slot5 = 0
	slot6 = 0
	slot7 = self._slider_max
	local new_slider = slot1(slot2, slot3, slot4, slot5, slot6)
	slot4 = new_slider
	slot2 = new_slider.connect
	slot5 = ""
	slot6 = "EVT_SCROLL_THUMBTRACK"
	slot7 = CoreEvent
	slot7 = slot7.callback
	slot9 = self
	slot10 = self
	slot11 = "_on_slider_movement"
	slot7 = slot7(slot8, slot9, slot10)
	slot8 = ""

	slot2(slot3, slot4, slot5, slot6, slot7)

	slot4 = new_slider
	slot2 = new_slider.connect
	slot5 = ""
	slot6 = "EVT_SCROLL_CHANGED"
	slot7 = CoreEvent
	slot7 = slot7.callback
	slot9 = self
	slot10 = self
	slot11 = "_on_slider_changed"
	slot7 = slot7(slot8, slot9, slot10)
	slot8 = ""

	slot2(slot3, slot4, slot5, slot6, slot7)

	return new_slider
end

slot0._create_slider = slot1
slot0 = VectorSliderBox

function slot1(self)
	local box, mute_button = nil
	slot3 = EWS
	slot5 = slot3
	slot3 = slot3.BoxSizer
	slot6 = "HORIZONTAL"
	slot3 = slot3(slot4, slot5)
	box = slot3
	slot3 = EWS
	slot5 = slot3
	slot3 = slot3.ToggleButton
	slot6 = self._parent_frame
	slot7 = "Feed Zero"
	slot8 = ""
	slot9 = "BU_EXACTFIT,NO_BORDER"
	slot3 = slot3(slot4, slot5, slot6, slot7, slot8)
	mute_button = slot3
	slot5 = mute_button
	slot3 = mute_button.connect
	slot6 = ""
	slot7 = "EVT_COMMAND_TOGGLEBUTTON_CLICKED"
	slot8 = CoreEvent
	slot8 = slot8.callback
	slot10 = self
	slot11 = self
	slot12 = "_on_mute_toggle"
	slot8 = slot8(slot9, slot10, slot11)
	slot9 = ""

	slot3(slot4, slot5, slot6, slot7, slot8)

	slot5 = box
	slot3 = box.add
	slot6 = mute_button
	slot7 = 0
	slot8 = 0
	slot9 = "EXPAND,ALIGN_LEFT"

	slot3(slot4, slot5, slot6, slot7, slot8)

	slot3 = self._box
	slot5 = slot3
	slot3 = slot3.add
	slot6 = box
	slot7 = 1
	slot8 = 0
	slot9 = "EXPAND"

	slot3(slot4, slot5, slot6, slot7, slot8)

	return mute_button
end

slot0._create_mute_button = slot1
slot0 = VectorSliderBox

function slot1(self)
	local box, text_ctrl, slider = nil
	slot4 = EWS
	slot6 = slot4
	slot4 = slot4.BoxSizer
	slot7 = "HORIZONTAL"
	slot4 = slot4(slot5, slot6)
	box = slot4
	slot6 = self
	slot4 = self._create_slider
	slot4 = slot4(slot5)
	slider = slot4
	slot4 = EWS
	slot6 = slot4
	slot4 = slot4.TextCtrl
	slot7 = self._parent_frame
	slot8 = string
	slot8 = slot8.format
	slot10 = "%.3f"
	slot11 = self._min
	slot8 = slot8(slot9, slot10)
	slot9 = ""
	slot10 = "TE_PROCESS_ENTER"
	slot4 = slot4(slot5, slot6, slot7, slot8, slot9)
	text_ctrl = slot4
	slot6 = text_ctrl
	slot4 = text_ctrl.connect
	slot7 = ""
	slot8 = "EVT_COMMAND_TEXT_ENTER"
	slot9 = CoreEvent
	slot9 = slot9.callback
	slot11 = self
	slot12 = self
	slot13 = "_on_update_textctrl"
	slot9 = slot9(slot10, slot11, slot12)
	slot10 = ""

	slot4(slot5, slot6, slot7, slot8, slot9)

	slot6 = box
	slot4 = box.add
	slot7 = slider
	slot8 = 5
	slot9 = 0
	slot10 = "EXPAND"

	slot4(slot5, slot6, slot7, slot8, slot9)

	slot6 = box
	slot4 = box.add
	slot7 = text_ctrl
	slot8 = 1
	slot9 = 0
	slot10 = "EXPAND"

	slot4(slot5, slot6, slot7, slot8, slot9)

	slot4 = self._box
	slot6 = slot4
	slot4 = slot4.add
	slot7 = box
	slot8 = 1
	slot9 = 0
	slot10 = "EXPAND"

	slot4(slot5, slot6, slot7, slot8, slot9)

	slot4 = slider
	slot5 = text_ctrl

	return slot4, slot5
end

slot0._create_sizer = slot1
slot0 = VectorSliderBox

function slot1(self)
	slot1 = self._mute_toggle
	slot3 = slot1
	slot1 = slot1.get_value
	slot1 = slot1(slot2)

	if slot1 == true then
		slot1 = Vector3
		slot3 = 0
		slot4 = 0
		slot5 = 0

		return slot1(slot2, slot3, slot4)
	else
		slot1 = Vector3
		slot3 = self._slider_x
		slot5 = slot3
		slot3 = slot3.get_value
		slot3 = slot3(slot4)
		slot4 = self._slider_y
		slot6 = slot4
		slot4 = slot4.get_value
		slot4 = slot4(slot5)
		slot5 = self._slider_z
		slot7 = slot5
		slot5 = slot5.get_value

		return slot1(slot2, slot3, slot5(slot6))
	end

	return 
end

slot0.get_value = slot1
slot0 = VectorSliderBox

function slot1(self, vector)
	slot2 = self.__slider_x
	slot4 = slot2
	slot2 = slot2.set_value
	slot7 = self
	slot5 = self._actual_to_slider
	slot8 = vector.x

	slot2(slot3, slot5(slot6, slot7))

	slot2 = self.__slider_y
	slot4 = slot2
	slot2 = slot2.set_value
	slot7 = self
	slot5 = self._actual_to_slider
	slot8 = vector.y

	slot2(slot3, slot5(slot6, slot7))

	slot2 = self.__slider_z
	slot4 = slot2
	slot2 = slot2.set_value
	slot7 = self
	slot5 = self._actual_to_slider
	slot8 = vector.z

	slot2(slot3, slot5(slot6, slot7))

	slot4 = self
	slot2 = self._set_text
	slot5 = vector.x
	slot6 = vector.y
	slot7 = vector.z

	slot2(slot3, slot4, slot5, slot6)

	slot2 = self._vector3

	if slot2 then
		slot4 = self
		slot2 = self._send_event
		slot5 = "EVT_VALUE_CHANGED"
		slot6 = vector

		slot2(slot3, slot4, slot5)
	else
		slot4 = self
		slot2 = self._send_event
		slot5 = "EVT_VALUE_CHANGED"
		slot8 = vector
		slot6 = vector.with_z
		slot9 = 0

		slot2(slot3, slot4, slot6(slot7, slot8))
	end

	return 
end

slot0.set_value = slot1
slot0 = VectorSliderBox

function slot1(self, value)
	slot2 = self._min
	slot2 = value - slot2
	slot3 = self._step
	slot2 = slot2 / slot3

	return slot2
end

slot0._actual_to_slider = slot1
slot0 = VectorSliderBox

function slot1(self, value)
	slot2 = self._step
	slot2 = value * slot2
	slot3 = self._min
	slot2 = slot2 + slot3

	return slot2
end

slot0._slider_to_actual = slot1
slot0 = VectorSliderBox

function slot1(self)
	local x, y, z = nil
	slot6 = self
	slot4 = self._slider_to_actual
	slot7 = self.__slider_x
	slot9 = slot7
	slot7 = slot7.get_value
	slot4 = slot4(slot5, slot7(slot8))
	x = slot4
	slot6 = self
	slot4 = self._slider_to_actual
	slot7 = self.__slider_y
	slot9 = slot7
	slot7 = slot7.get_value
	slot4 = slot4(slot5, slot7(slot8))
	y = slot4
	slot6 = self
	slot4 = self._slider_to_actual
	slot7 = self.__slider_z
	slot9 = slot7
	slot7 = slot7.get_value
	slot4 = slot4(slot5, slot7(slot8))
	z = slot4
	slot6 = self
	slot4 = self.set_value
	slot7 = Vector3
	slot9 = x
	slot10 = y
	slot11 = z

	slot4(slot5, slot7(slot8, slot9, slot10))

	slot6 = self
	slot4 = self._set_text
	slot7 = x
	slot8 = y
	slot9 = z

	slot4(slot5, slot6, slot7, slot8)

	return 
end

slot0._update_values = slot1
slot0 = VectorSliderBox

function slot1(self)
	local x, y, z = nil
	slot6 = self
	slot4 = self._slider_to_actual
	slot7 = self.__slider_x
	slot9 = slot7
	slot7 = slot7.get_value
	slot4 = slot4(slot5, slot7(slot8))
	x = slot4
	slot6 = self
	slot4 = self._slider_to_actual
	slot7 = self.__slider_y
	slot9 = slot7
	slot7 = slot7.get_value
	slot4 = slot4(slot5, slot7(slot8))
	y = slot4
	slot6 = self
	slot4 = self._slider_to_actual
	slot7 = self.__slider_z
	slot9 = slot7
	slot7 = slot7.get_value
	slot4 = slot4(slot5, slot7(slot8))
	z = slot4
	slot6 = self
	slot4 = self._set_text
	slot7 = x
	slot8 = y
	slot9 = z

	slot4(slot5, slot6, slot7, slot8)

	return 
end

slot0._update_text = slot1
slot0 = VectorSliderBox

function slot1(self, x, y, z)
	slot4 = self.__slider_x_textctrl
	slot6 = slot4
	slot4 = slot4.set_value
	slot7 = string
	slot7 = slot7.format
	slot9 = "%.3f"
	slot10 = x

	slot4(slot5, slot7(slot8, slot9))

	slot4 = self.__slider_y_textctrl
	slot6 = slot4
	slot4 = slot4.set_value
	slot7 = string
	slot7 = slot7.format
	slot9 = "%.3f"
	slot10 = y

	slot4(slot5, slot7(slot8, slot9))

	slot4 = self.__slider_z_textctrl
	slot6 = slot4
	slot4 = slot4.set_value
	slot7 = string
	slot7 = slot7.format
	slot9 = "%.3f"
	slot10 = z

	slot4(slot5, slot7(slot8, slot9))

	return 
end

slot0._set_text = slot1
slot0 = VectorSliderBox

function slot1(self)
	local x, y, z = nil
	slot6 = self
	slot4 = self._check_input
	slot7 = self.__slider_x_textctrl
	slot9 = slot7
	slot7 = slot7.get_value
	slot4 = slot4(slot5, slot7(slot8))
	x = slot4
	slot6 = self
	slot4 = self._check_input
	slot7 = self.__slider_y_textctrl
	slot9 = slot7
	slot7 = slot7.get_value
	slot4 = slot4(slot5, slot7(slot8))
	y = slot4
	slot6 = self
	slot4 = self._check_input
	slot7 = self.__slider_z_textctrl
	slot9 = slot7
	slot7 = slot7.get_value
	slot4 = slot4(slot5, slot7(slot8))
	z = slot4
	slot6 = self
	slot4 = self.set_value
	slot7 = Vector3
	slot9 = x
	slot10 = y
	slot11 = z

	slot4(slot5, slot7(slot8, slot9, slot10))

	return 
end

slot0._on_update_textctrl = slot1
slot0 = VectorSliderBox

function slot1(self, input)
	slot2 = tonumber
	slot4 = input
	local value = slot2(slot3)
	slot3 = type
	slot5 = value
	slot3 = slot3(slot4)

	if slot3 ~= "number" then
		value = self._min
	else
		slot3 = self._min
	end

	return value
end

slot0._check_input = slot1
slot0 = VectorSliderBox

function slot1(self, value)
	slot2 = self.__slider_x
	slot4 = slot2
	slot2 = slot2.set_enabled
	slot5 = value

	slot2(slot3, slot4)

	slot2 = self.__slider_y
	slot4 = slot2
	slot2 = slot2.set_enabled
	slot5 = value

	slot2(slot3, slot4)

	slot2 = self.__slider_x_textctrl
	slot4 = slot2
	slot2 = slot2.set_enabled
	slot5 = value

	slot2(slot3, slot4)

	slot2 = self.__slider_y_textctrl
	slot4 = slot2
	slot2 = slot2.set_enabled
	slot5 = value

	slot2(slot3, slot4)

	slot2 = self.__slider_z
	slot4 = slot2
	slot2 = slot2.set_enabled
	slot5 = value

	slot2(slot3, slot4)

	slot2 = self.__slider_z_textctrl
	slot4 = slot2
	slot2 = slot2.set_enabled
	slot5 = value

	slot2(slot3, slot4)

	return 
end

slot0._set_enabled_all = slot1
slot0 = Vector2SliderBox

if not slot0 then
	slot0 = CoreClass
	slot0 = slot0.class
	slot2 = VectorSliderBox
	slot0 = slot0(slot1)
end

Vector2SliderBox = slot0
slot0 = Vector2SliderBox

function slot1(self, parent_frame, title, min, max, step)
	slot6 = self.super
	slot8 = slot6
	slot6 = slot6.init
	slot9 = parent_frame
	slot10 = title
	slot11 = min
	slot12 = max
	slot13 = step

	slot6(slot7, slot8, slot9, slot10, slot11, slot12)

	slot6 = false
	self._vector3 = slot6
	slot8 = self
	slot6 = self._create_mute_button
	slot6 = slot6(slot7)
	self.__mute_toggle = slot6
	slot8 = self
	slot6 = self._create_sizer
	slot6, slot7 = slot6(slot7)
	self.__slider_x_textctrl = slot7
	self.__slider_x = slot6
	slot8 = self
	slot6 = self._create_sizer
	slot6, slot7 = slot6(slot7)
	self.__slider_y_textctrl = slot7
	self.__slider_y = slot6
	slot6 = EWS
	slot8 = slot6
	slot6 = slot6.Slider
	slot9 = self._parent_frame
	slot10 = 0
	slot11 = 0
	slot12 = 0
	slot6 = slot6(slot7, slot8, slot9, slot10, slot11)
	self.__slider_z = slot6
	slot6 = EWS
	slot8 = slot6
	slot6 = slot6.TextCtrl
	slot9 = self._parent_frame
	slot10 = 0
	slot11 = ""
	slot12 = ""
	slot6 = slot6(slot7, slot8, slot9, slot10, slot11)
	self.__slider_z_textctrl = slot6

	return 
end

slot0.init = slot1
slot0 = Vector3SliderBox

if not slot0 then
	slot0 = CoreClass
	slot0 = slot0.class
	slot2 = VectorSliderBox
	slot0 = slot0(slot1)
end

Vector3SliderBox = slot0
slot0 = Vector3SliderBox

function slot1(self, parent_frame, title, min, max, step)
	slot6 = self.super
	slot6 = slot6.init
	slot8 = self
	slot9 = parent_frame
	slot10 = title
	slot11 = min
	slot12 = max
	slot13 = step

	slot6(slot7, slot8, slot9, slot10, slot11, slot12)

	slot6 = true
	self._vector3 = slot6
	slot8 = self
	slot6 = self._create_mute_button
	slot6 = slot6(slot7)
	self.__mute_toggle = slot6
	slot8 = self
	slot6 = self._create_sizer
	slot6, slot7 = slot6(slot7)
	self.__slider_x_textctrl = slot7
	self.__slider_x = slot6
	slot8 = self
	slot6 = self._create_sizer
	slot6, slot7 = slot6(slot7)
	self.__slider_y_textctrl = slot7
	self.__slider_y = slot6
	slot8 = self
	slot6 = self._create_sizer
	slot6, slot7 = slot6(slot7)
	self.__slider_z_textctrl = slot7
	self.__slider_z = slot6

	return 
end

slot0.init = slot1

return 
