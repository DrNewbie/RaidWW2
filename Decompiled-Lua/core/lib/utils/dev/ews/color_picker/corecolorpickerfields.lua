-- Decompilation Error: self.ljd.ast.slotworks.eliminate_temporary(self.ast)

-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot0 = core
slot2 = slot0
slot0 = slot0.module
slot3 = "CoreColorPickerFields"

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
slot3 = "CoreTable"

slot0(slot1, slot2)

slot0 = core
slot2 = slot0
slot0 = slot0.import
slot3 = "CoreEws"

slot0(slot1, slot2)

slot0 = core
slot2 = slot0
slot0 = slot0.import
slot3 = "CoreMath"

slot0(slot1, slot2)

slot0 = ColorPickerFields

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

ColorPickerFields = slot0
slot0 = ColorPickerFields

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
slot0 = ColorPickerFields

function slot1(self, time, delta_time)
	slot3 = self._is_picking_color_from_screen

	if slot3 then
		slot6 = "EVT_MOTION"
		local current_mouse_event = EWS.MouseEvent(slot4, EWS)
		self._previous_mouse_event = self._previous_mouse_event or current_mouse_event
		slot4 = current_mouse_event.get_position(EWS)
		slot7 = self._previous_mouse_event
		slot5 = self._previous_mouse_event.get_position(current_mouse_event)

		if slot4 ~= slot5 then
			slot4 = EWS
			slot6 = slot4
			slot4 = slot4.get_screen_pixel
			slot9 = current_mouse_event
			slot7 = current_mouse_event.get_position_on_screen
			slot4 = slot4(slot5, slot7(slot8))
			local pixel_rgb = slot4 / 255
			slot5 = Color
			slot7 = pixel_rgb.x
			slot8 = pixel_rgb.y
			slot9 = pixel_rgb.z
			local color_under_cursor = slot5(slot6, slot7, slot8)
			slot8 = self
			slot6 = self.set_color
			slot9 = color_under_cursor

			slot6(slot7, slot8)

			slot8 = self
			slot6 = self._send_event
			slot9 = "EVT_COLOR_UPDATED"
			slot10 = color_under_cursor

			slot6(slot7, slot8, slot9)
		end

		slot6 = current_mouse_event
		slot4 = current_mouse_event.left_is_down
		slot4 = slot4(slot5)

		if slot4 == true then
			slot4 = self._previous_mouse_event
			slot6 = slot4
			slot4 = slot4.left_is_down
			slot4 = slot4(slot5)

			if slot4 == false then
				slot6 = self
				slot4 = self._on_exit_eyedropper_mode
				slot7 = nil
				slot8 = current_mouse_event

				slot4(slot5, slot6, slot7)

				current_mouse_event = nil
			end
		end

		self._previous_mouse_event = current_mouse_event
	end

	return 
end

slot0.update = slot1
slot0 = ColorPickerFields

function slot1(self)
	slot1 = self._panel

	return slot1
end

slot0.panel = slot1
slot0 = ColorPickerFields

function slot1(self)
	slot4 = "Alpha"
	local a = self._field_value(slot2, self) or 255
	slot5 = "Red"
	local r = self._field_value(slot3, self) or 0
	slot6 = "Green"
	local g = self._field_value(slot4, self) or 0
	slot7 = "Blue"
	local b = self._field_value(slot5, self) or 0
	slot5 = Color
	slot7 = a / 255
	slot8 = r / 255
	slot9 = g / 255
	slot10 = b / 255

	return slot5(slot6, slot7, slot8, slot9)
end

slot0.color = slot1
slot0 = ColorPickerFields

function slot1(self, color)
	slot4 = self
	slot2 = self._set_field_values_except
	slot5 = nil
	slot6 = color

	slot2(slot3, slot4, slot5)

	return 
end

slot0.set_color = slot1
slot0 = ColorPickerFields

function slot1(self, field_name)

	-- Decompilation error in this vicinity:
	slot2 = self._field_groups

	return 
end

slot0._field_value = slot1
slot0 = ColorPickerFields

function slot1(self, field_name, value)
	slot3 = assert
	slot5 = self._field_groups
	slot5 = slot5[field_name]
	slot6 = "Invalid field."
	local field_group = slot3(slot4, slot5)
	slot4 = ipairs
	slot6 = field_group
	slot4, slot5, slot6 = slot4(slot5)

	for _, field in slot4, slot5, slot6 do
		slot11 = field
		slot9 = field.change_value
		slot12 = string
		slot12 = slot12.format
		slot14 = "%.0f"
		slot15 = value

		slot9(slot10, slot12(slot13, slot14))
	end

	return 
end

slot0._change_field_value = slot1
slot0 = ColorPickerFields

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

	slot5 = EWS
	slot7 = slot5
	slot5 = slot5.Notebook
	slot8 = self._panel
	slot9 = ""
	slot10 = "NB_TOP"
	local notebook = slot5(slot6, slot7, slot8, slot9)
	slot8 = notebook
	slot6 = notebook.add_page
	slot11 = self
	slot9 = self._create_rgb_fields
	slot12 = notebook
	slot9 = slot9(slot10, slot11)
	slot10 = "RGB"
	slot11 = true

	slot6(slot7, slot8, slot9, slot10)

	slot8 = notebook
	slot6 = notebook.add_page
	slot11 = self
	slot9 = self._create_hsv_fields
	slot12 = notebook
	slot9 = slot9(slot10, slot11)
	slot10 = "HSV"
	slot11 = false

	slot6(slot7, slot8, slot9, slot10)

	if not enable_alpha then
		slot6 = ipairs
		slot8 = self._field_groups
		slot8 = slot8.Alpha
		slot6, slot7, slot8 = slot6(slot7)

		for _, field in slot6, slot7, slot8 do
			slot13 = field
			slot11 = field.set_enabled
			slot14 = false

			slot11(slot12, slot13)
		end
	end

	if not enable_value then
		slot6 = ipairs
		slot8 = self._field_groups
		slot8 = slot8.Value
		slot6, slot7, slot8 = slot6(slot7)

		for _, field in slot6, slot7, slot8 do
			slot13 = field
			slot11 = field.set_enabled
			slot14 = false

			slot11(slot12, slot13)
		end
	end

	slot8 = panel_sizer
	slot6 = panel_sizer.add
	slot9 = notebook
	slot10 = 1
	slot11 = 3
	slot12 = "ALL,EXPAND"

	slot6(slot7, slot8, slot9, slot10, slot11)

	slot6 = EWS
	slot8 = slot6
	slot6 = slot6.Panel
	slot9 = self._panel
	slot6 = slot6(slot7, slot8)
	self._color_well_column_panel = slot6
	slot6 = EWS
	slot8 = slot6
	slot6 = slot6.BoxSizer
	slot9 = "VERTICAL"
	local color_well_column_panel_sizer = slot6(slot7, slot8)
	slot7 = self._color_well_column_panel
	slot9 = slot7
	slot7 = slot7.set_sizer
	slot10 = color_well_column_panel_sizer

	slot7(slot8, slot9)

	slot9 = color_well_column_panel_sizer
	slot7 = color_well_column_panel_sizer.add
	slot12 = self
	slot10 = self._create_color_well
	slot13 = self._color_well_column_panel
	slot10 = slot10(slot11, slot12)
	slot11 = 1
	slot12 = 23
	slot13 = "TOP,EXPAND"

	slot7(slot8, slot9, slot10, slot11, slot12)

	slot9 = color_well_column_panel_sizer
	slot7 = color_well_column_panel_sizer.add
	slot12 = self
	slot10 = self._create_color_picker_button
	slot13 = self._color_well_column_panel
	slot10 = slot10(slot11, slot12)
	slot11 = 0
	slot12 = 4
	slot13 = "TOP,BOTTOM,EXPAND"

	slot7(slot8, slot9, slot10, slot11, slot12)

	slot9 = panel_sizer
	slot7 = panel_sizer.add
	slot10 = self._color_well_column_panel
	slot11 = 0
	slot12 = 3
	slot13 = "RIGHT,EXPAND"

	slot7(slot8, slot9, slot10, slot11, slot12)

	return 
end

slot0._create_panel = slot1
slot0 = ColorPickerFields

function slot1(self, parent_frame)
	slot2 = EWS
	slot4 = slot2
	slot2 = slot2.ColorWell
	slot5 = parent_frame
	slot6 = ""
	slot2 = slot2(slot3, slot4, slot5)
	self._color_well = slot2
	slot2 = self._color_well
	slot4 = slot2
	slot2 = slot2.set_tool_tip
	slot5 = "Active color"

	slot2(slot3, slot4)

	slot2 = self._color_well
	slot4 = slot2
	slot2 = slot2.set_size
	slot5 = Vector3
	slot7 = 41
	slot8 = 80
	slot9 = 0

	slot2(slot3, slot5(slot6, slot7, slot8))

	slot2 = self._color_well
	slot4 = slot2
	slot2 = slot2.set_color
	slot7 = self
	slot5 = self.color

	slot2(slot3, slot5(slot6))

	slot2 = self._color_well

	return slot2
end

slot0._create_color_well = slot1
slot0 = ColorPickerFields

function slot1(self, parent_frame)
	slot2 = EWS
	slot4 = slot2
	slot2 = slot2.BitmapButton
	slot5 = parent_frame
	slot6 = CoreEws
	slot6 = slot6.image_path
	slot8 = "toolbar/eye_dropper_16x16.png"
	slot6 = slot6(slot7)
	slot7 = ""
	slot8 = ""
	slot2 = slot2(slot3, slot4, slot5, slot6, slot7)
	self._color_picker_button = slot2
	slot2 = self._color_picker_button
	slot4 = slot2
	slot2 = slot2.set_tool_tip
	slot5 = "Pick a color from the screen"

	slot2(slot3, slot4)

	slot2 = self._color_picker_button
	slot4 = slot2
	slot2 = slot2.connect
	slot5 = "EVT_COMMAND_BUTTON_CLICKED"
	slot6 = CoreEvent
	slot6 = slot6.callback
	slot8 = self
	slot9 = self
	slot10 = "_on_enter_eyedropper_mode"
	slot6 = slot6(slot7, slot8, slot9)
	slot7 = self._color_picker_button

	slot2(slot3, slot4, slot5, slot6)

	slot2 = self._color_picker_button

	return slot2
end

slot0._create_color_picker_button = slot1
slot0 = ColorPickerFields

function slot1(self, parent_frame)
	local fields = {
		"Red",
		nil,
		"Green",
		nil,
		"Blue",
		nil,
		"Alpha"
	}
	slot3 = {
		max = 255
	}
	fields[2] = slot3
	slot3 = {
		max = 255
	}
	fields[4] = slot3
	slot3 = {
		max = 255
	}
	fields[6] = slot3
	slot3 = {
		max = 255
	}
	fields[8] = slot3
	slot5 = self
	slot3 = self._create_panel_with_fields
	slot6 = parent_frame
	slot7 = fields

	return slot3(slot4, slot5, slot6)
end

slot0._create_rgb_fields = slot1
slot0 = ColorPickerFields

function slot1(self, parent_frame)
	local fields = {
		"Hue",
		nil,
		"Sat",
		nil,
		"Value",
		nil,
		"Alpha"
	}
	slot3 = {
		wrap = true,
		max = 359
	}
	fields[2] = slot3
	slot3 = {
		max = 100
	}
	fields[4] = slot3
	slot3 = {
		max = 100
	}
	fields[6] = slot3
	slot3 = {
		max = 255
	}
	fields[8] = slot3
	slot5 = self
	slot3 = self._create_panel_with_fields
	slot6 = parent_frame
	slot7 = fields

	return slot3(slot4, slot5, slot6)
end

slot0._create_hsv_fields = slot1
slot0 = ColorPickerFields

function slot1(self, parent_frame, fields)
	slot3 = EWS
	slot5 = slot3
	slot3 = slot3.Panel
	slot6 = parent_frame
	local panel = slot3(slot4, slot5)
	slot4 = EWS
	slot6 = slot4
	slot4 = slot4.FlexGridSizer
	slot7 = 0
	slot8 = 2
	slot9 = 3
	slot10 = 0
	local panel_sizer = slot4(slot5, slot6, slot7, slot8, slot9)
	slot7 = panel_sizer
	slot5 = panel_sizer.add_growable_col
	slot8 = 1
	slot9 = 1

	slot5(slot6, slot7, slot8)

	slot7 = panel
	slot5 = panel.set_sizer
	slot8 = panel_sizer

	slot5(slot6, slot7)

	slot7 = panel_sizer
	slot5 = panel_sizer.add_spacer
	slot8 = 50
	slot9 = 0

	slot5(slot6, slot7, slot8)

	slot7 = panel_sizer
	slot5 = panel_sizer.add_spacer
	slot8 = 0
	slot9 = 0

	slot5(slot6, slot7, slot8)

	slot5 = table
	slot5 = slot5.tuple_iterator
	slot7 = fields
	slot8 = 2
	slot5, slot6, slot7 = slot5(slot6, slot7)

	for field_name, field_attributes in slot5, slot6, slot7 do
		local value = 0
		slot15 = field_name .. ":"
		local label = EWS.StaticText(slot12, EWS, panel)
		slot18 = value
		slot18 = (field_attributes.wrap and "SP_WRAP,SP_ARROW_KEYS") or "SP_ARROW_KEYS"
		local field = EWS.SpinCtrl(EWS, EWS, panel, tostring(slot17), "")
		slot17 = field_attributes.max or 255

		field.set_range(EWS, field, 0)

		slot21 = "_on_field_edited"

		field.connect(EWS, field, "EVT_COMMAND_TEXT_UPDATED", CoreEvent.callback(field, self, self))

		slot19 = "LEFT,ALIGN_CENTER_VERTICAL"

		panel_sizer.add(EWS, panel_sizer, label, 0, 5)

		slot19 = "RIGHT,EXPAND"

		panel_sizer.add(EWS, panel_sizer, field, 1, 5)

		self._field_groups = self._field_groups or {}
		self._field_groups[field_name] = self._field_groups[field_name] or {}
		slot16 = field

		table.insert(self._field_groups[field_name] or , self._field_groups[field_name])
	end

	return panel
end

slot0._create_panel_with_fields = slot1
slot0 = ColorPickerFields

function slot1(self, edited_field, event)
	slot3 = ipairs
	slot7 = self
	slot5 = self._mirroring_fields
	slot8 = edited_field
	slot3, slot4, slot5 = slot3(slot5(slot6, slot7))

	for _, field in slot3, slot4, slot5 do
		slot10 = field
		slot8 = field.change_value
		slot13 = edited_field
		slot11 = edited_field.get_value

		slot8(slot9, slot11(slot12))
	end

	slot5 = self
	slot3 = self._field_label
	slot6 = edited_field
	local edited_field_label = slot3(slot4, slot5)
	slot4 = table
	slot4 = slot4.contains
	slot6 = {
		"Red",
		"Green",
		"Blue"
	}
	slot7 = edited_field_label
	slot4 = slot4(slot5, slot6)

	if slot4 then
		slot6 = self
		slot4 = self._parse_values
		slot7 = {
			Blue = 255,
			Green = 255,
			Alpha = 255,
			Red = 255
		}
		local rgb_values = slot4(slot5, slot6)

		if rgb_values then
			slot7 = self
			slot5 = self._set_field_values_except
			slot8 = edited_field_label
			slot9 = Color
			slot11 = rgb_values.Alpha
			slot12 = rgb_values.Red
			slot13 = rgb_values.Green
			slot14 = rgb_values.Blue

			slot5(slot6, slot7, slot9(slot10, slot11, slot12, slot13))
		end
	else
		slot4 = table
		slot4 = slot4.contains
		slot6 = {
			"Hue",
			"Sat",
			"Value"
		}
		slot7 = edited_field_label
		slot4 = slot4(slot5, slot6)

		if slot4 then
			slot6 = self
			slot4 = self._parse_values
			slot7 = {
				Value = 100,
				Sat = 100,
				Alpha = 255,
				Hue = 1
			}
			local hsv_values = slot4(slot5, slot6)

			if hsv_values then
				slot5 = CoreMath
				slot5 = slot5.hsv_to_rgb
				slot7 = hsv_values.Hue
				slot8 = hsv_values.Sat
				slot9 = hsv_values.Value
				slot5, slot6, slot7 = slot5(slot6, slot7, slot8)
				b = slot7
				g = slot6
				r = slot5
				slot7 = self
				slot5 = self._set_field_values_except
				slot8 = edited_field_label
				slot9 = Color
				slot11 = hsv_values.Alpha
				slot12 = r
				slot13 = g
				slot14 = b

				slot5(slot6, slot7, slot9(slot10, slot11, slot12, slot13))
			end
		end
	end

	slot6 = self
	slot4 = self._send_event
	slot7 = "EVT_COLOR_UPDATED"
	slot10 = self
	slot8 = self.color

	slot4(slot5, slot6, slot8(slot9))

	slot6 = self
	slot4 = self._send_event
	slot7 = "EVT_COLOR_CHANGED"
	slot10 = self
	slot8 = self.color

	slot4(slot5, slot6, slot8(slot9))

	return 
end

slot0._on_field_edited = slot1
slot0 = ColorPickerFields

function slot1(self, sender, event)
	slot3 = true
	self._is_picking_color_from_screen = slot3

	return 
end

slot0._on_enter_eyedropper_mode = slot1
slot0 = ColorPickerFields

function slot1(self, sender, event)
	slot3 = nil
	self._is_picking_color_from_screen = slot3
	slot3 = self._panel
	slot5 = slot3
	slot3 = slot3.set_focus

	slot3(slot4)

	slot5 = self
	slot3 = self._send_event
	slot6 = "EVT_COLOR_CHANGED"
	slot7 = color_under_cursor

	slot3(slot4, slot5, slot6)

	return 
end

slot0._on_exit_eyedropper_mode = slot1
slot0 = ColorPickerFields

function slot1(self, field_names)
	local values = {}
	slot3 = pairs
	slot5 = field_names
	slot3, slot4, slot5 = slot3(slot4)

	for field_name, range in slot3, slot4, slot5 do
		slot10 = self
		slot8 = self._field_value
		slot11 = field_name
		local numeric_value = slot8(slot9, slot10)

		if numeric_value == nil then
			slot9 = nil

			return slot9
		else
			slot9 = numeric_value / range
			values[field_name] = slot9
		end
	end

	return values
end

slot0._parse_values = slot1
slot0 = ColorPickerFields

function slot1(self, skipped_field_name, color)
	slot3 = CoreMath
	slot3 = slot3.rgb_to_hsv
	slot5 = color.red
	slot6 = color.green
	slot7 = color.blue
	slot3, slot4, slot5 = slot3(slot4, slot5, slot6)
	value = slot5
	saturation = slot4
	hue = slot3
	local field_values = {}
	slot4 = color.red
	slot4 = slot4 * 255
	field_values.Red = slot4
	slot4 = color.green
	slot4 = slot4 * 255
	field_values.Green = slot4
	slot4 = color.blue
	slot4 = slot4 * 255
	field_values.Blue = slot4
	slot4 = color.alpha
	slot4 = slot4 * 255
	field_values.Alpha = slot4
	slot4 = hue
	field_values.Hue = slot4
	slot4 = saturation
	slot4 = slot4 * 100
	field_values.Sat = slot4
	slot4 = value
	slot4 = slot4 * 100
	field_values.Value = slot4
	slot4 = pairs
	slot6 = field_values
	slot4, slot5, slot6 = slot4(slot5)

	for field_name, value in slot4, slot5, slot6 do
		if field_name ~= skipped_field_name then
			slot11 = self
			slot9 = self._change_field_value
			slot12 = field_name
			slot13 = value

			slot9(slot10, slot11, slot12)
		end
	end

	slot4 = self._color_well
	slot6 = slot4
	slot4 = slot4.set_color
	slot7 = color

	slot4(slot5, slot6)

	return 
end

slot0._set_field_values_except = slot1
slot0 = ColorPickerFields

function slot1(self, field)
	slot2 = pairs
	slot4 = self._field_groups
	slot2, slot3, slot4 = slot2(slot3)

	for label, field_list in slot2, slot3, slot4 do
		slot7 = table
		slot7 = slot7.contains
		slot9 = field_list
		slot10 = field
		slot7 = slot7(slot8, slot9)

		if slot7 then
			return label
		end
	end

	return 
end

slot0._field_label = slot1
slot0 = ColorPickerFields

function slot1(self, field)
	slot2 = table
	slot2 = slot2.map_values
	slot4 = self._field_groups
	local field_groups = slot2(slot3)
	slot3 = table
	slot3 = slot3.find_value
	slot5 = field_groups

	function slot6(group)
		slot1 = table
		slot1 = slot1.contains
		slot3 = group
		slot4 = field

		return slot1(slot2, slot3)
	end

	local my_group = slot3(slot4, slot5)
	slot4 = table
	slot4 = slot4.exclude
	slot6 = my_group
	slot7 = field

	return slot4(slot5, slot6)
end

slot0._mirroring_fields = slot1

return 
