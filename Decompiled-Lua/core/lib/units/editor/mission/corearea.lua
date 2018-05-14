-- Decompilation Error: self.ljd.ast.slotworks.eliminate_temporary(self.ast)

-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot0 = CoreAreaUnitElement

if not slot0 then
	slot0 = class
	slot2 = MissionElement
	slot0 = slot0(slot1)
end

CoreAreaUnitElement = slot0
slot0 = AreaUnitElement

if not slot0 then
	slot0 = class
	slot2 = CoreAreaUnitElement
	slot0 = slot0(slot1)
end

AreaUnitElement = slot0
slot0 = AreaUnitElement

function slot1(self, ...)
	slot1 = CoreAreaUnitElement
	slot1 = slot1.init
	slot3 = self

	slot1(slot2, ...)

	return 
end

slot0.init = slot1
slot0 = CoreAreaUnitElement

function slot1(self, unit)
	slot2 = MissionElement
	slot2 = slot2.init
	slot4 = self
	slot5 = unit

	slot2(slot3, slot4)

	slot2 = Vector3
	slot4 = 1
	slot5 = 1
	slot6 = 0
	slot2 = slot2(slot3, slot4, slot5)
	self._timeline_color = slot2
	slot2 = {
		"box",
		"sphere",
		"plane"
	}
	self._shapes_types = slot2
	slot2 = "box"
	self._shape_type = slot2
	slot2 = 1
	self._grid_size = slot2
	slot2 = 25
	self._kb_move_grid_size = slot2
	slot2 = RepKey
	slot4 = slot2
	slot2 = slot2.new
	slot5 = {
		"up",
		"down",
		"right",
		"left",
		"num 4",
		"num 6"
	}
	slot2 = slot2(slot3, slot4)
	self._move_shape_rep = slot2
	slot2 = Draw
	slot4 = slot2
	slot2 = slot2.brush
	slot2 = slot2(slot3)
	self._brush = slot2
	slot2 = self._hed
	slot3 = managers
	slot3 = slot3.area
	slot5 = slot3
	slot3 = slot3.default_interval
	slot3 = slot3(slot4)
	slot2.area_interval = slot3
	slot2 = self._hed
	slot3 = "on_enter"
	slot2.area_type = slot3
	slot2 = self._hed
	slot3 = {}
	slot2.shapes = slot3
	slot2 = table
	slot2 = slot2.insert
	slot4 = self._save_values
	slot5 = "area_interval"

	slot2(slot3, slot4)

	slot2 = table
	slot2 = slot2.insert
	slot4 = self._save_values
	slot5 = "area_type"

	slot2(slot3, slot4)

	slot2 = table
	slot2 = slot2.insert
	slot4 = self._save_values
	slot5 = "shapes"

	slot2(slot3, slot4)

	slot2 = table
	slot2 = slot2.insert
	slot4 = self._hed
	slot4 = slot4.action_types
	slot5 = "activate"

	slot2(slot3, slot4)

	slot2 = table
	slot2 = slot2.insert
	slot4 = self._hed
	slot4 = slot4.action_types
	slot5 = "deactivate"

	slot2(slot3, slot4)

	return 
end

slot0.init = slot1
slot0 = CoreAreaUnitElement

function slot1(self)
	slot1 = self._shapes_list
	slot3 = slot1
	slot1 = slot1.clear

	slot1(slot2)

	slot1 = pairs
	slot3 = self._hed
	slot3 = slot3.shapes
	slot1, slot2, slot3 = slot1(slot2)

	for name, shape in slot1, slot2, slot3 do
		slot6 = self._shapes_list
		slot8 = slot6
		slot6 = slot6.append
		slot9 = name

		slot6(slot7, slot8)
	end

	return 
end

slot0.populate_shapes_list = slot1
slot0 = CoreAreaUnitElement

function slot1(self, types)
	slot4 = types
	slot2 = types.get_value
	slot2 = slot2(slot3)
	self._shape_type = slot2

	return 
end

slot0.set_shape_type = slot1
slot0 = CoreAreaUnitElement

function slot1(self, shapes)
	slot4 = shapes
	slot2 = shapes.selected_index
	local i = slot2(slot3)
	slot3 = -1

	if slot3 < i then
		slot5 = shapes
		slot3 = shapes.get_string
		slot6 = i
		slot3 = slot3(slot4, slot5)
		self._current_shape = slot3
		slot5 = self
		slot3 = self.set_shape_values

		slot3(slot4)
	end

	return 
end

slot0.selected_shape = slot1
slot0 = CoreAreaUnitElement

function slot1(self)
	slot1 = self._current_shape

	if slot1 then
		slot1 = self._hed
		slot1 = slot1.shapes
		slot2 = self._current_shape
		slot1 = slot1[slot2]
		slot2 = self._hed
		slot2 = slot2.shapes
		slot3 = self._current_shape
		slot2 = slot2[slot3]
		slot2 = slot2.position
		slot4 = slot2
		slot2 = slot2.with_z
		slot5 = self._start_altitude
		slot7 = slot5
		slot5 = slot5.get_value
		slot2 = slot2(slot3, slot5(slot6))
		slot1.position = slot2
	end

	slot3 = self
	slot1 = self.set_shape_values

	slot1(slot2)

	return 
end

slot0.set_start_altitude = slot1
slot0 = CoreAreaUnitElement

function slot1(self, data)
	slot2 = self._current_shape

	if not slot2 then
		return 
	end

	slot2 = tonumber
	slot4 = data.ctrl
	slot6 = slot4
	slot4 = slot4.get_value
	local value = slot2(slot4(slot5))
	slot3 = data.type

	if slot3 == "start" then
		slot3 = self._hed
		slot3 = slot3.shapes
		slot4 = self._current_shape
		slot3 = slot3[slot4]
		slot4 = self._hed
		slot4 = slot4.shapes
		slot5 = self._current_shape
		slot4 = slot4[slot5]
		slot4 = slot4.position
		slot6 = slot4
		slot4 = slot4.with_z
		slot7 = value
		slot4 = slot4(slot5, slot6)
		slot3.position = slot4
	else
		slot3 = data.type

		if slot3 == "height" then
			slot3 = self._hed
			slot3 = slot3.shapes
			slot4 = self._current_shape
			slot3 = slot3[slot4]
			slot3.height = value
		end
	end

	slot5 = self
	slot3 = self.set_shape_values

	slot3(slot4)

	return 
end

slot0.set_altitude_text = slot1
slot0 = CoreAreaUnitElement

function slot1(self, data)
	slot2 = self._current_shape

	if not slot2 then
		return 
	end

	slot2 = data.type

	if slot2 == "start" then
		slot2 = self._hed
		slot2 = slot2.shapes
		slot3 = self._current_shape
		slot2 = slot2[slot3]
		slot2 = slot2.position
		slot2 = slot2.z
		slot3 = data.step
		local z = slot2 + slot3
		slot3 = self._hed
		slot3 = slot3.shapes
		slot4 = self._current_shape
		slot3 = slot3[slot4]
		slot4 = self._hed
		slot4 = slot4.shapes
		slot5 = self._current_shape
		slot4 = slot4[slot5]
		slot4 = slot4.position
		slot6 = slot4
		slot4 = slot4.with_z
		slot7 = z
		slot4 = slot4(slot5, slot6)
		slot3.position = slot4
	else
		slot2 = data.type

		if slot2 == "height" then
			slot2 = self._hed
			slot2 = slot2.shapes
			slot3 = self._current_shape
			slot2 = slot2[slot3]
			slot3 = self._hed
			slot3 = slot3.shapes
			slot4 = self._current_shape
			slot3 = slot3[slot4]
			slot3 = slot3.height
			slot4 = data.step
			slot3 = slot3 + slot4
			slot2.height = slot3
		end
	end

	slot4 = self
	slot2 = self.set_shape_values

	slot2(slot3)

	return 
end

slot0.set_altitude_spin = slot1
slot0 = CoreAreaUnitElement

function slot1(self)
	slot1 = self._current_shape

	if slot1 then
		slot1 = self._hed
		slot1 = slot1.shapes
		slot2 = self._current_shape
		slot1 = slot1[slot2]
		slot2 = self._height
		slot4 = slot2
		slot2 = slot2.get_value
		slot2 = slot2(slot3)
		slot1.height = slot2
	end

	slot3 = self
	slot1 = self.set_shape_values

	slot1(slot2)

	return 
end

slot0.set_height = slot1
slot0 = CoreAreaUnitElement

function slot1(self)
	slot1 = self._current_shape

	if slot1 then
		slot1 = self._hed
		slot1 = slot1.shapes
		slot2 = self._current_shape
		slot1 = slot1[slot2]
		slot2 = self._hed
		slot2 = slot2.shapes
		slot3 = self._current_shape
		slot2 = slot2[slot3]
		slot2 = slot2.position
		slot4 = slot2
		slot2 = slot2.with_z
		slot5 = 0
		slot2 = slot2(slot3, slot4)
		slot1.position = slot2
		slot1 = self._hed
		slot1 = slot1.shapes
		slot2 = self._current_shape
		slot1 = slot1[slot2]
		slot2 = 0
		slot1.height = slot2
	end

	slot3 = self
	slot1 = self.set_shape_values

	slot1(slot2)

	return 
end

slot0.set_2d = slot1
slot0 = CoreAreaUnitElement

function slot1(self)
	slot1 = self._current_shape

	if slot1 then
		slot1 = self._hed
		slot1 = slot1.shapes
		slot2 = self._current_shape
		slot1 = slot1[slot2]
		slot2 = math
		slot2 = slot2.pow
		slot4 = self._size
		slot6 = slot4
		slot4 = slot4.get_value
		slot4 = slot4(slot5)
		slot4 = slot4 / 10
		slot5 = 2
		slot2 = slot2(slot3, slot4)
		slot1.size_mul = slot2
	end

	return 
end

slot0.set_size = slot1
slot0 = CoreAreaUnitElement

function slot1(self)
	slot1 = self._hed
	slot1 = slot1.shapes
	slot2 = self._current_shape
	local current_shape = slot1[slot2]

	if current_shape then
		slot2 = current_shape.type

		if slot2 == "sphere" then
			slot2 = current_shape.radious
			slot3 = current_shape.size_mul
			slot2 = slot2 * slot3
			current_shape.radious = slot2
		else
			slot2 = current_shape.type

			if slot2 == "box" then
				slot2 = current_shape.width
				slot3 = current_shape.size_mul
				slot2 = slot2 * slot3
				current_shape.width = slot2
				slot2 = current_shape.length
				slot3 = current_shape.size_mul
				slot2 = slot2 * slot3
				current_shape.length = slot2
			else
				slot2 = current_shape.type

				if slot2 == "plane" then
					slot2 = current_shape.width
					slot3 = current_shape.size_mul
					slot2 = slot2 * slot3
					current_shape.width = slot2
				end
			end
		end

		slot2 = 1
		current_shape.size_mul = slot2
		slot2 = self._size
		slot4 = slot2
		slot2 = slot2.set_value
		slot5 = 10

		slot2(slot3, slot4)
	end

	return 
end

slot0.size_release = slot1
slot0 = CoreAreaUnitElement

function slot1(self)
	slot1 = self._hed
	slot1 = slot1.shapes
	slot2 = self._current_shape
	local current_shape = slot1[slot2]

	if current_shape then
		slot2 = self._start_altitude
		slot4 = slot2
		slot2 = slot2.set_enabled
		slot5 = true

		slot2(slot3, slot4)

		slot2 = self._start_altitude
		slot4 = slot2
		slot2 = slot2.set_value
		slot5 = current_shape.position
		slot5 = slot5.z

		slot2(slot3, slot4)

		slot2 = self._start_altitude_text
		slot4 = slot2
		slot2 = slot2.set_enabled
		slot5 = true

		slot2(slot3, slot4)

		slot2 = self._start_altitude_text
		slot4 = slot2
		slot2 = slot2.change_value
		slot5 = current_shape.position
		slot5 = slot5.z

		slot2(slot3, slot4)

		slot2 = self._start_altitude_spin
		slot4 = slot2
		slot2 = slot2.set_enabled
		slot5 = true

		slot2(slot3, slot4)

		slot2 = self._height
		slot4 = slot2
		slot2 = slot2.set_enabled
		slot5 = true

		slot2(slot3, slot4)

		slot2 = self._height
		slot4 = slot2
		slot2 = slot2.set_value
		slot5 = current_shape.height

		slot2(slot3, slot4)

		slot2 = self._height_altitude_text
		slot4 = slot2
		slot2 = slot2.set_enabled
		slot5 = true

		slot2(slot3, slot4)

		slot2 = self._height_altitude_text
		slot4 = slot2
		slot2 = slot2.change_value
		slot5 = current_shape.height

		slot2(slot3, slot4)

		slot2 = self._height_altitude_spin
		slot4 = slot2
		slot2 = slot2.set_enabled
		slot5 = true

		slot2(slot3, slot4)

		slot2 = self._size
		slot4 = slot2
		slot2 = slot2.set_enabled
		slot5 = true

		slot2(slot3, slot4)

		slot2 = self._size
		slot4 = slot2
		slot2 = slot2.set_value
		slot5 = math
		slot5 = slot5.sqrt
		slot7 = current_shape.size_mul
		slot5 = slot5(slot6)
		slot5 = slot5 * 10

		slot2(slot3, slot4)
	else
		slot2 = self._start_altitude
		slot4 = slot2
		slot2 = slot2.set_value
		slot5 = 0

		slot2(slot3, slot4)

		slot2 = self._start_altitude
		slot4 = slot2
		slot2 = slot2.set_enabled
		slot5 = false

		slot2(slot3, slot4)

		slot2 = self._start_altitude_text
		slot4 = slot2
		slot2 = slot2.change_value
		slot5 = 0

		slot2(slot3, slot4)

		slot2 = self._start_altitude_text
		slot4 = slot2
		slot2 = slot2.set_enabled
		slot5 = false

		slot2(slot3, slot4)

		slot2 = self._start_altitude_spin
		slot4 = slot2
		slot2 = slot2.set_enabled
		slot5 = false

		slot2(slot3, slot4)

		slot2 = self._height
		slot4 = slot2
		slot2 = slot2.set_value
		slot5 = 0

		slot2(slot3, slot4)

		slot2 = self._height
		slot4 = slot2
		slot2 = slot2.set_enabled
		slot5 = false

		slot2(slot3, slot4)

		slot2 = self._height_altitude_text
		slot4 = slot2
		slot2 = slot2.change_value
		slot5 = 0

		slot2(slot3, slot4)

		slot2 = self._height_altitude_text
		slot4 = slot2
		slot2 = slot2.set_enabled
		slot5 = false

		slot2(slot3, slot4)

		slot2 = self._height_altitude_spin
		slot4 = slot2
		slot2 = slot2.set_enabled
		slot5 = false

		slot2(slot3, slot4)

		slot2 = self._size
		slot4 = slot2
		slot2 = slot2.set_value
		slot5 = 0

		slot2(slot3, slot4)

		slot2 = self._size
		slot4 = slot2
		slot2 = slot2.set_enabled
		slot5 = false

		slot2(slot3, slot4)
	end

	return 
end

slot0.set_shape_values = slot1
slot0 = CoreAreaUnitElement

function slot1(self, time)
	slot2 = pairs
	slot4 = self._hed
	slot4 = slot4.shapes
	slot2, slot3, slot4 = slot2(slot3)

	for _, shape in slot2, slot3, slot4 do
		slot9 = self
		slot7 = self.draw
		slot10 = shape
		slot11 = 0
		slot12 = math
		slot12 = slot12.sin
		slot14 = time * 100
		slot12 = slot12(slot13)
		slot12 = 1 + slot12
		slot12 = slot12 * 0.5
		slot12 = slot12 * 0.5
		slot12 = 0.5 + slot12
		slot13 = 0

		slot7(slot8, slot9, slot10, slot11, slot12)
	end

	slot2 = self._current_shape

	if slot2 then
		slot4 = self
		slot2 = self.draw
		slot5 = self._hed
		slot5 = slot5.shapes
		slot6 = self._current_shape
		slot5 = slot5[slot6]
		slot6 = 0
		slot7 = 1
		slot8 = 1

		slot2(slot3, slot4, slot5, slot6, slot7)
	end

	return 
end

slot0.update_selected = slot1
slot0 = CoreAreaUnitElement

function slot1(self, shape, r, g, b)

	-- Decompilation error in this vicinity:
	local start_z = -20000
	local height = 40000
	local position = shape.position
	local rotation = shape.rotation
	slot9 = shape.height
	slot9 = self._brush
	slot11 = slot9
	slot9 = slot9.set_color
	slot12 = Color
	slot14 = 0.75
	slot15 = r
	slot16 = g
	slot17 = b

	slot9(slot10, slot12(slot13, slot14, slot15, slot16))

	slot9 = shape.type

	if slot9 == "sphere" then
		slot9 = self._brush
		slot11 = slot9
		slot9 = slot9.cylinder
		slot12 = Vector3
		slot14 = 0
		slot15 = 0
		slot16 = start_z
		slot12 = slot12(slot13, slot14, slot15)
		slot12 = position + slot12
		slot13 = Vector3
		slot15 = 0
		slot16 = 0
		slot17 = height + start_z
		slot13 = slot13(slot14, slot15, slot16)
		slot13 = position + slot13
		slot14 = shape.radious
		slot15 = shape.size_mul
		slot14 = slot14 * slot15

		slot9(slot10, slot11, slot12, slot13)

		slot9 = Application
		slot11 = slot9
		slot9 = slot9.draw_cylinder
		slot12 = Vector3
		slot14 = 0
		slot15 = 0
		slot16 = start_z
		slot12 = slot12(slot13, slot14, slot15)
		slot12 = position + slot12
		slot13 = Vector3
		slot15 = 0
		slot16 = 0
		slot17 = height + start_z
		slot13 = slot13(slot14, slot15, slot16)
		slot13 = position + slot13
		slot14 = shape.radious
		slot15 = shape.size_mul
		slot14 = slot14 * slot15
		slot15 = r
		slot16 = g
		slot17 = b

		slot9(slot10, slot11, slot12, slot13, slot14, slot15, slot16)
	else
		slot9 = shape.type

		if slot9 == "box" then
			slot9 = Vector3
			slot11 = 0
			slot12 = 0
			slot13 = start_z
			slot9 = slot9(slot10, slot11, slot12)
			local start = position + slot9
			slot10 = Vector3
			slot12 = shape.width
			slot13 = shape.size_mul
			slot12 = slot12 * slot13
			slot13 = shape.length
			slot14 = shape.size_mul
			slot13 = slot13 * slot14
			slot14 = height
			slot10 = slot10(slot11, slot12, slot13)
			slot10 = start + slot10
			slot10 = start + slot10
			local center = slot10 / 2
			slot11 = self._brush
			slot13 = slot11
			slot11 = slot11.box
			slot14 = center
			slot15 = Vector3
			slot17 = shape.width
			slot18 = shape.size_mul
			slot17 = slot17 * slot18
			slot17 = slot17 / 2
			slot18 = 0
			slot19 = 0
			slot15 = slot15(slot16, slot17, slot18)
			slot16 = Vector3
			slot18 = 0
			slot19 = shape.length
			slot20 = shape.size_mul
			slot19 = slot19 * slot20
			slot19 = slot19 / 2
			slot20 = 0
			slot16 = slot16(slot17, slot18, slot19)
			slot17 = Vector3
			slot19 = 0
			slot20 = 0
			slot21 = height / 2

			slot11(slot12, slot13, slot14, slot15, slot17(slot18, slot19, slot20))

			slot11 = Application
			slot13 = slot11
			slot11 = slot11.draw_box
			slot14 = Vector3
			slot16 = 0
			slot17 = 0
			slot18 = start_z
			slot14 = slot14(slot15, slot16, slot17)
			slot14 = position + slot14
			slot15 = Vector3
			slot17 = shape.width
			slot18 = shape.size_mul
			slot17 = slot17 * slot18
			slot18 = shape.length
			slot19 = shape.size_mul
			slot18 = slot18 * slot19
			slot19 = height + start_z
			slot15 = slot15(slot16, slot17, slot18)
			slot15 = position + slot15
			slot16 = r
			slot17 = g
			slot18 = b

			slot11(slot12, slot13, slot14, slot15, slot16, slot17)
		else
			slot9 = shape.type

			if slot9 == "plane" then
				slot9 = Vector3
				slot11 = 0
				slot12 = 0
				slot13 = start_z
				slot9 = slot9(slot10, slot11, slot12)
				local start = position + slot9
				slot10 = shape.width
				slot11 = shape.size_mul
				local width = slot10 * slot11
				slot11 = Vector3
				slot13 = 0
				slot14 = 0
				slot15 = start_z
				slot11 = slot11(slot12, slot13, slot14)
				local pos1 = position + slot11
				slot12 = shape.rotation
				slot14 = slot12
				slot12 = slot12.x
				slot12 = slot12(slot13)
				slot12 = slot12 * width
				slot12 = position + slot12
				slot13 = Vector3
				slot15 = 0
				slot16 = 0
				slot17 = start_z
				slot13 = slot13(slot14, slot15, slot16)
				local pos2 = slot12 + slot13
				slot13 = shape.rotation
				slot15 = slot13
				slot13 = slot13.x
				slot13 = slot13(slot14)
				slot13 = slot13 * width
				slot13 = position + slot13
				slot14 = Vector3
				slot16 = 0
				slot17 = 0
				slot18 = height + start_z
				slot14 = slot14(slot15, slot16, slot17)
				local pos3 = slot13 + slot14
				slot14 = Vector3
				slot16 = 0
				slot17 = 0
				slot18 = height + start_z
				slot14 = slot14(slot15, slot16, slot17)
				local pos4 = position + slot14
				slot15 = self._brush
				slot17 = slot15
				slot15 = slot15.quad
				slot18 = pos1
				slot19 = pos2
				slot20 = pos3
				slot21 = pos4

				slot15(slot16, slot17, slot18, slot19, slot20)

				slot15 = Application
				slot17 = slot15
				slot15 = slot15.draw_rotation
				slot18 = position
				slot19 = shape.rotation

				slot15(slot16, slot17, slot18)

				slot15 = Application
				slot17 = slot15
				slot15 = slot15.draw_line
				slot18 = pos1
				slot19 = pos2
				slot20 = r
				slot21 = g
				slot22 = b

				slot15(slot16, slot17, slot18, slot19, slot20, slot21)

				slot15 = Application
				slot17 = slot15
				slot15 = slot15.draw_line
				slot18 = pos2
				slot19 = pos3
				slot20 = r
				slot21 = g
				slot22 = b

				slot15(slot16, slot17, slot18, slot19, slot20, slot21)

				slot15 = Application
				slot17 = slot15
				slot15 = slot15.draw_line
				slot18 = pos3
				slot19 = pos4
				slot20 = r
				slot21 = g
				slot22 = b

				slot15(slot16, slot17, slot18, slot19, slot20, slot21)

				slot15 = Application
				slot17 = slot15
				slot15 = slot15.draw_line
				slot18 = pos4
				slot19 = pos1
				slot20 = r
				slot21 = g
				slot22 = b

				slot15(slot16, slot17, slot18, slot19, slot20, slot21)

				slot15 = math
				slot15 = slot15.clamp
				slot17 = height / 20
				slot18 = 250
				slot19 = 10000
				local step = slot15(slot16, slot17, slot18)
				slot16 = start_z
				slot17 = height + start_z
				slot18 = step

				for i = slot16, slot17, slot18 do
					slot20 = Vector3
					slot22 = 0
					slot23 = 0
					slot24 = i
					slot20 = slot20(slot21, slot22, slot23)
					local pos = position + slot20
					slot21 = Application
					slot23 = slot21
					slot21 = slot21.draw_line
					slot24 = pos
					slot25 = shape.rotation
					slot27 = slot25
					slot25 = slot25.y
					slot25 = slot25(slot26)
					slot25 = slot25 * 500
					slot25 = pos + slot25
					slot26 = 0
					slot27 = 1
					slot28 = 0

					slot21(slot22, slot23, slot24, slot25, slot26, slot27)

					slot21 = Application
					slot23 = slot21
					slot21 = slot21.draw_line
					slot24 = shape.rotation
					slot26 = slot24
					slot24 = slot24.x
					slot24 = slot24(slot25)
					slot24 = slot24 * width
					slot24 = pos + slot24
					slot25 = shape.rotation
					slot27 = slot25
					slot25 = slot25.x
					slot25 = slot25(slot26)
					slot25 = slot25 * width
					slot25 = pos + slot25
					slot26 = shape.rotation
					slot28 = slot26
					slot26 = slot26.y
					slot26 = slot26(slot27)
					slot26 = slot26 * 500
					slot25 = slot25 + slot26
					slot26 = 0
					slot27 = 1
					slot28 = 0

					slot21(slot22, slot23, slot24, slot25, slot26, slot27)

					slot21 = Application
					slot23 = slot21
					slot21 = slot21.draw_line
					slot24 = shape.rotation
					slot26 = slot24
					slot24 = slot24.x
					slot24 = slot24(slot25)
					slot24 = slot24 * width
					slot24 = slot24 / 2
					slot24 = pos + slot24
					slot25 = shape.rotation
					slot27 = slot25
					slot25 = slot25.x
					slot25 = slot25(slot26)
					slot25 = slot25 * width
					slot25 = slot25 / 2
					slot25 = pos + slot25
					slot26 = shape.rotation
					slot28 = slot26
					slot26 = slot26.y
					slot26 = slot26(slot27)
					slot26 = slot26 * 500
					slot25 = slot25 + slot26
					slot26 = 0
					slot27 = 1
					slot28 = 0

					slot21(slot22, slot23, slot24, slot25, slot26, slot27)

					slot21 = Application
					slot23 = slot21
					slot21 = slot21.draw_line
					slot24 = pos
					slot25 = shape.rotation
					slot27 = slot25
					slot25 = slot25.y
					slot25 = slot25(slot26)
					slot25 = slot25 * -500
					slot25 = pos + slot25
					slot26 = 1
					slot27 = 0
					slot28 = 0

					slot21(slot22, slot23, slot24, slot25, slot26, slot27)

					slot21 = Application
					slot23 = slot21
					slot21 = slot21.draw_line
					slot24 = shape.rotation
					slot26 = slot24
					slot24 = slot24.x
					slot24 = slot24(slot25)
					slot24 = slot24 * width
					slot24 = pos + slot24
					slot25 = shape.rotation
					slot27 = slot25
					slot25 = slot25.x
					slot25 = slot25(slot26)
					slot25 = slot25 * width
					slot25 = pos + slot25
					slot26 = shape.rotation
					slot28 = slot26
					slot26 = slot26.y
					slot26 = slot26(slot27)
					slot26 = slot26 * -500
					slot25 = slot25 + slot26
					slot26 = 1
					slot27 = 0
					slot28 = 0

					slot21(slot22, slot23, slot24, slot25, slot26, slot27)

					slot21 = Application
					slot23 = slot21
					slot21 = slot21.draw_line
					slot24 = shape.rotation
					slot26 = slot24
					slot24 = slot24.x
					slot24 = slot24(slot25)
					slot24 = slot24 * width
					slot24 = slot24 / 2
					slot24 = pos + slot24
					slot25 = shape.rotation
					slot27 = slot25
					slot25 = slot25.x
					slot25 = slot25(slot26)
					slot25 = slot25 * width
					slot25 = slot25 / 2
					slot25 = pos + slot25
					slot26 = shape.rotation
					slot28 = slot26
					slot26 = slot26.y
					slot26 = slot26(slot27)
					slot26 = slot26 * -500
					slot25 = slot25 + slot26
					slot26 = 1
					slot27 = 0
					slot28 = 0

					slot21(slot22, slot23, slot24, slot25, slot26, slot27)
				end
			end
		end
	end

	return 
end

slot0.draw = slot1
slot0 = CoreAreaUnitElement

function slot1(self, t, dt)
	slot3 = managers
	slot3 = slot3.editor
	slot5 = slot3
	slot3 = slot3.get_cursor_look_point
	slot6 = 0
	local p1 = slot3(slot4, slot5)
	slot4 = managers
	slot4 = slot4.editor
	slot6 = slot4
	slot4 = slot4.get_cursor_look_point
	slot7 = 100
	local p2 = slot4(slot5, slot6)
	slot5 = self._hed
	slot5 = slot5.shapes
	slot6 = self._current_shape
	local current_shape = slot5[slot6]
	slot6 = p1.z
	slot7 = p1.z
	slot8 = p2.z
	slot7 = slot7 - slot8
	local t = slot6 / slot7
	slot7 = p2 - p1
	slot7 = slot7 * t
	slot7 = p1 + slot7
	self._current_pos = slot7
	slot7 = self._grid_size
	slot8 = 0

	if slot8 < slot7 then
		slot9 = self
		slot7 = self.round_position
		slot10 = self._current_pos
		slot7 = slot7(slot8, slot9)
		self._current_pos = slot7
	end

	slot7 = self._creating

	if slot7 then
		slot7 = self._current_shape

		if slot7 then
			slot7 = self._hed
			slot7 = slot7.shapes
			slot8 = self._current_shape
			slot11 = self
			slot9 = self.set_shape_properties
			slot12 = self._shape_type
			slot13 = self._start_pos
			slot14 = self._current_pos
			slot9 = slot9(slot10, slot11, slot12, slot13)
			slot7[slot8] = slot9
		end
	end

	slot7 = self._grab_shape

	if slot7 then
		slot7 = self._move_all_shapes

		if slot7 then
			slot7 = pairs
			slot9 = self._hed
			slot9 = slot9.shapes
			slot7, slot8, slot9 = slot7(slot8)

			for name, shape in slot7, slot8, slot9 do
				slot12 = self._current_pos
				slot13 = shape.move_offset
				slot12 = slot12 + slot13
				shape.position = slot12
			end
		elseif current_shape then
			slot7 = self._current_pos
			slot8 = current_shape.move_offset
			slot7 = slot7 + slot8
			current_shape.position = slot7
		end
	end

	slot7 = Input
	slot9 = slot7
	slot7 = slot7.keyboard
	local kb = slot7(slot8)
	local mov_vec = nil
	slot9 = self._move_shape_rep
	slot11 = slot9
	slot9 = slot9.update
	slot12 = t
	slot13 = dt
	slot9 = slot9(slot10, slot11, slot12)

	if slot9 then
		slot11 = kb
		slot9 = kb.down
		slot12 = "up"
		slot9 = slot9(slot10, slot11)

		if slot9 then
			slot9 = Vector3
			slot11 = 0
			slot12 = 1
			slot13 = 0
			slot9 = slot9(slot10, slot11, slot12)
			mov_vec = slot9
		else
			slot11 = kb
			slot9 = kb.down
			slot12 = "down"
			slot9 = slot9(slot10, slot11)

			if slot9 then
				slot9 = Vector3
				slot11 = 0
				slot12 = 1
				slot13 = 0
				slot9 = slot9(slot10, slot11, slot12)
				mov_vec = slot9 * -1
			else
				slot11 = kb
				slot9 = kb.down
				slot12 = "right"
				slot9 = slot9(slot10, slot11)

				if slot9 then
					slot9 = Vector3
					slot11 = 1
					slot12 = 0
					slot13 = 0
					slot9 = slot9(slot10, slot11, slot12)
					mov_vec = slot9
				else
					slot11 = kb
					slot9 = kb.down
					slot12 = "left"
					slot9 = slot9(slot10, slot11)

					if slot9 then
						slot9 = Vector3
						slot11 = 1
						slot12 = 0
						slot13 = 0
						slot9 = slot9(slot10, slot11, slot12)
						mov_vec = slot9 * -1
					end
				end
			end
		end

		if mov_vec then
			slot9 = shift
			slot9 = slot9()

			if slot9 then
				slot9 = pairs
				slot11 = self._hed
				slot11 = slot11.shapes
				slot9, slot10, slot11 = slot9(slot10)

				for name, shape in slot9, slot10, slot11 do
					slot14 = shape.position
					slot15 = self._kb_move_grid_size
					slot15 = mov_vec * slot15
					slot14 = slot14 + slot15
					shape.position = slot14
				end
			elseif current_shape then
				slot9 = current_shape.position
				slot10 = self._kb_move_grid_size
				slot10 = mov_vec * slot10
				slot9 = slot9 + slot10
				current_shape.position = slot9
			end
		end
	end

	if current_shape then
		local rot_axis = nil
		slot12 = kb
		slot10 = kb.down
		slot13 = "num 4"
		slot10 = slot10(slot11, slot12)

		if slot10 then
			slot10 = Vector3
			slot12 = 0
			slot13 = 0
			slot14 = 1
			slot10 = slot10(slot11, slot12, slot13)
			rot_axis = slot10
		else
			slot12 = kb
			slot10 = kb.down
			slot13 = "num 6"
			slot10 = slot10(slot11, slot12)

			if slot10 then
				slot10 = Vector3
				slot12 = 0
				slot13 = 0
				slot14 = -1
				slot10 = slot10(slot11, slot12, slot13)
				rot_axis = slot10
			end
		end

		if rot_axis then
			slot10 = Rotation
			slot12 = rot_axis
			slot13 = 100 * dt
			slot10 = slot10(slot11, slot12)
			slot11 = current_shape.rotation
			slot10 = slot10 * slot11
			current_shape.rotation = slot10
		end
	end

	slot9 = Application
	slot11 = slot9
	slot9 = slot9.draw_rotation
	slot12 = self._current_pos
	slot13 = self._unit
	slot15 = slot13
	slot13 = slot13.rotation

	slot9(slot10, slot11, slot13(slot14))

	return 
end

slot0.update_editing = slot1
slot0 = CoreAreaUnitElement

function slot1(self, data)
	if not data then
		return 
	end

	slot2 = self._hed
	slot3 = data._area_type

	if not slot3 then
		slot3 = self._hed
		slot3 = slot3.area_type
	end

	slot2.area_type = slot3
	slot2 = ipairs
	slot4 = data._shapes
	slot2, slot3, slot4 = slot2(slot3)

	for _, shape in slot2, slot3, slot4 do
		slot9 = self
		slot7 = self.new_shape_name
		slot7 = slot7(slot8)
		self._current_shape = slot7
		local properties = nil
		slot8 = shape._generic
		local s_pos = slot8._position
		slot9 = shape._type

		if slot9 == "sphere" then
			slot9 = shape._generic
			slot9 = slot9._position
			slot10 = Vector3
			slot12 = shape._radious
			slot13 = 0
			slot14 = shape._height
			slot10 = slot10(slot11, slot12, slot13)
			local e_pos = slot9 + slot10
			slot12 = self
			slot10 = self.set_shape_properties
			slot13 = shape._type
			slot14 = s_pos
			slot15 = e_pos
			slot10 = slot10(slot11, slot12, slot13, slot14)
			properties = slot10
		else
			slot9 = shape._type

			if slot9 == "box" then
				slot9 = shape._generic
				slot9 = slot9._position
				slot10 = Vector3
				slot12 = shape._width
				slot13 = shape._length
				slot14 = shape._height
				slot10 = slot10(slot11, slot12, slot13)
				local e_pos = slot9 + slot10
				slot12 = self
				slot10 = self.set_shape_properties
				slot13 = shape._type
				slot14 = s_pos
				slot15 = e_pos
				slot10 = slot10(slot11, slot12, slot13, slot14)
				properties = slot10
			else
				slot9 = shape._type

				if slot9 == "plane" then
					slot9 = shape._generic
					slot9 = slot9._position
					slot10 = shape._generic
					slot10 = slot10._rotation
					slot12 = slot10
					slot10 = slot10.x
					slot10 = slot10(slot11)
					slot11 = shape._width
					slot10 = slot10 * slot11
					local e_pos = slot9 + slot10
					slot12 = self
					slot10 = self.set_shape_properties
					slot13 = shape._type
					slot14 = s_pos
					slot15 = e_pos
					slot10 = slot10(slot11, slot12, slot13, slot14)
					properties = slot10
					slot10 = shape._height
					properties.height = slot10
				end
			end
		end

		slot9 = self._hed
		slot9 = slot9.shapes
		slot10 = self._current_shape
		slot9[slot10] = properties
	end

	return 
end

slot0.load_data = slot1
slot0 = CoreAreaUnitElement

function slot1(self, p)
	slot2 = Vector3
	slot4 = math
	slot4 = slot4.round
	slot6 = p.x
	slot7 = self._grid_size
	slot6 = slot6 / slot7
	slot4 = slot4(slot5)
	slot5 = self._grid_size
	slot4 = slot4 * slot5
	slot5 = math
	slot5 = slot5.round
	slot7 = p.y
	slot8 = self._grid_size
	slot7 = slot7 / slot8
	slot5 = slot5(slot6)
	slot6 = self._grid_size
	slot5 = slot5 * slot6
	slot6 = 0

	return slot2(slot3, slot4, slot5)
end

slot0.round_position = slot1
slot0 = CoreAreaUnitElement

function slot1(self)
	slot1 = managers
	slot1 = slot1.editor
	slot3 = slot1
	slot1 = slot1.get_cursor_look_point
	slot4 = 0
	local p1 = slot1(slot2, slot3)
	slot2 = managers
	slot2 = slot2.editor
	slot4 = slot2
	slot2 = slot2.get_cursor_look_point
	slot5 = 100
	local p2 = slot2(slot3, slot4)
	slot3 = p1.z
	slot4 = p1.z
	slot5 = p2.z
	slot4 = slot4 - slot5
	local t = slot3 / slot4
	slot4 = p2 - p1
	slot4 = slot4 * t
	slot4 = p1 + slot4
	self._start_pos = slot4
	slot4 = self._grid_size
	slot5 = 0

	if slot5 < slot4 then
		slot6 = self
		slot4 = self.round_position
		slot7 = self._start_pos
		slot4 = slot4(slot5, slot6)
		self._start_pos = slot4
	end

	slot6 = self
	slot4 = self.new_shape_name
	slot4 = slot4(slot5)
	self._current_shape = slot4
	slot6 = self
	slot4 = self.set_shape_properties
	slot7 = self._shape_type
	slot8 = self._start_pos
	slot9 = self._start_pos
	local properties = slot4(slot5, slot6, slot7, slot8)
	slot5 = self._hed
	slot5 = slot5.shapes
	slot6 = self._current_shape
	slot5[slot6] = properties
	slot5 = self._shapes_list
	slot7 = slot5
	slot5 = slot5.append
	slot8 = self._current_shape

	slot5(slot6, slot7)

	slot5 = true
	self._creating = slot5
	slot7 = self
	slot5 = self.set_shape_values

	slot5(slot6)

	return 
end

slot0.create_shape = slot1
slot0 = CoreAreaUnitElement

function slot1(self)
	slot1 = 1
	slot2 = 100
	slot3 = 1

	for i = slot1, slot2, slot3 do
		slot5 = "shape"
		slot6 = i
		local name = slot5 .. slot6
		slot6 = self._hed
		slot6 = slot6.shapes
		slot6 = slot6[name]

		if not slot6 then
			return name
		end
	end

	return 
end

slot0.new_shape_name = slot1
slot0 = CoreAreaUnitElement

function slot1(self, type, pos, end_pos)
	local t = {
		type = type,
		position = pos
	}
	slot5 = Rotation
	slot5 = slot5()
	t.rotation = slot5
	slot5 = 1
	t.size_mul = slot5
	slot5 = end_pos.z
	slot6 = t.position
	slot6 = slot6.z
	slot5 = slot5 - slot6
	t.height = slot5

	if type == "sphere" then
		slot5 = Vector3
		slot7 = t.position
		slot7 = slot7.x
		slot8 = t.position
		slot8 = slot8.y
		slot9 = 0
		slot5 = slot5(slot6, slot7, slot8)
		slot6 = Vector3
		slot8 = end_pos.x
		slot9 = end_pos.y
		slot10 = 0
		slot6 = slot6(slot7, slot8, slot9)
		slot5 = slot5 - slot6
		slot7 = slot5
		slot5 = slot5.length
		slot5 = slot5(slot6)
		t.radious = slot5
	elseif type == "box" then
		slot5 = end_pos.y
		slot6 = t.position
		slot6 = slot6.y
		slot5 = slot5 - slot6
		t.length = slot5
		slot5 = end_pos.x
		slot6 = t.position
		slot6 = slot6.x
		slot5 = slot5 - slot6
		t.width = slot5
	elseif type == "plane" then
		slot5 = t.position
		slot5 = end_pos - slot5
		slot7 = slot5
		slot5 = slot5.normalized
		local x = slot5(slot6)
		slot6 = Vector3
		slot8 = 0
		slot9 = 0
		slot10 = 1
		local z = slot6(slot7, slot8, slot9)
		slot9 = z
		slot7 = z.cross
		slot10 = x
		local y = slot7(slot8, slot9)
		slot8 = Rotation
		slot10 = x
		slot11 = y
		slot12 = z
		slot8 = slot8(slot9, slot10, slot11)
		t.rotation = slot8
		slot8 = t.position
		slot8 = end_pos - slot8
		slot10 = slot8
		slot8 = slot8.length
		slot8 = slot8(slot9)
		t.width = slot8
	end

	return t
end

slot0.set_shape_properties = slot1
slot0 = CoreAreaUnitElement

function slot1(self)
	slot1 = self._current_shape

	if slot1 then
		slot1 = self._hed
		slot1 = slot1.shapes
		slot2 = self._current_shape
		slot3 = nil
		slot1[slot2] = slot3
		slot1 = nil
		self._current_shape = slot1
	end

	slot3 = self
	slot1 = self.populate_shapes_list

	slot1(slot2)

	slot3 = self
	slot1 = self.set_shape_values

	slot1(slot2)

	return 
end

slot0.delete = slot1
slot0 = CoreAreaUnitElement

function slot1(self)
	slot1 = false
	self._creating = slot1

	return 
end

slot0.create_shape_release = slot1
slot0 = CoreAreaUnitElement

function slot1(self)
	slot1 = true
	self._grab_shape = slot1
	slot1 = pairs
	slot3 = self._hed
	slot3 = slot3.shapes
	slot1, slot2, slot3 = slot1(slot2)

	for name, shape in slot1, slot2, slot3 do
		slot6 = shape.position
		slot7 = self._current_pos
		slot6 = slot6 - slot7
		shape.move_offset = slot6
	end

	slot1 = shift
	slot1 = slot1()
	self._move_all_shapes = slot1

	return 
end

slot0.move_shape = slot1
slot0 = CoreAreaUnitElement

function slot1(self)
	slot1 = false
	self._grab_shape = slot1
	slot1 = false
	self._move_all_shapes = slot1
	slot1 = pairs
	slot3 = self._hed
	slot3 = slot3.shapes
	slot1, slot2, slot3 = slot1(slot2)

	for name, shape in slot1, slot2, slot3 do
		slot6 = nil
		shape.move_offset = slot6
	end

	return 
end

slot0.release_shape = slot1
slot0 = CoreAreaUnitElement

function slot1(self, vc)
	slot4 = vc
	slot2 = vc.add_trigger
	slot5 = "lmb"
	slot6 = callback
	slot8 = self
	slot9 = self
	slot10 = "create_shape"

	slot2(slot3, slot4, slot6(slot7, slot8, slot9))

	slot4 = vc
	slot2 = vc.add_release_trigger
	slot5 = "lmb"
	slot6 = callback
	slot8 = self
	slot9 = self
	slot10 = "create_shape_release"

	slot2(slot3, slot4, slot6(slot7, slot8, slot9))

	slot4 = vc
	slot2 = vc.add_trigger
	slot5 = "emb"
	slot6 = callback
	slot8 = self
	slot9 = self
	slot10 = "move_shape"

	slot2(slot3, slot4, slot6(slot7, slot8, slot9))

	slot4 = vc
	slot2 = vc.add_release_trigger
	slot5 = "emb"
	slot6 = callback
	slot8 = self
	slot9 = self
	slot10 = "release_shape"

	slot2(slot3, slot4, slot6(slot7, slot8, slot9))

	slot4 = vc
	slot2 = vc.add_trigger
	slot5 = "destroy"
	slot6 = callback
	slot8 = self
	slot9 = self
	slot10 = "delete"

	slot2(slot3, slot4, slot6(slot7, slot8, slot9))

	return 
end

slot0.add_triggers = slot1
slot0 = CoreAreaUnitElement

function slot1(self, file, tab)
	slot5 = file
	slot3 = file.puts
	slot6 = tab
	slot7 = "<trigger type=\"UnitInArea\" name=\"area"
	slot8 = self._unit
	slot10 = slot8
	slot8 = slot8.unit_data
	slot8 = slot8(slot9)
	slot8 = slot8.unit_id
	slot9 = "\"/>"
	slot6 = slot6 .. slot7 .. slot8 .. slot9

	slot3(slot4, slot5)

	return 
end

slot0.save_mission_trigger = slot1
slot0 = CoreAreaUnitElement

function slot1(self, data)
	slot2 = tonumber
	slot4 = data.ctrlr
	slot6 = slot4
	slot4 = slot4.get_value
	local value = slot2(slot4(slot5))
	slot3 = math
	slot3 = slot3.clamp
	slot5 = value
	slot6 = 0
	slot7 = 1000000
	slot3 = slot3(slot4, slot5, slot6)
	value = slot3
	slot3 = self._hed
	slot3.area_interval = value
	slot3 = data.ctrlr
	slot5 = slot3
	slot3 = slot3.change_value
	slot6 = string
	slot6 = slot6.format
	slot8 = "%.2f"
	slot9 = self._hed
	slot9 = slot9.area_interval

	slot3(slot4, slot6(slot7, slot8))

	return 
end

slot0.set_interval = slot1
slot0 = CoreAreaUnitElement

function slot1(self, panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot3 = EWS
	slot5 = slot3
	slot3 = slot3.BoxSizer
	slot6 = "HORIZONTAL"
	local interval_sizer = slot3(slot4, slot5)
	slot6 = interval_sizer
	slot4 = interval_sizer.add
	slot7 = EWS
	slot9 = slot7
	slot7 = slot7.StaticText
	slot10 = panel
	slot11 = "Check Interval:"
	slot12 = 0
	slot13 = ""
	slot7 = slot7(slot8, slot9, slot10, slot11, slot12)
	slot8 = 2
	slot9 = 0
	slot10 = "ALIGN_CENTER_VERTICAL"

	slot4(slot5, slot6, slot7, slot8, slot9)

	slot4 = EWS
	slot6 = slot4
	slot4 = slot4.TextCtrl
	slot7 = self._panel
	slot8 = string
	slot8 = slot8.format
	slot10 = "%.2f"
	slot11 = self._hed
	slot11 = slot11.area_interval
	slot8 = slot8(slot9, slot10)
	slot9 = ""
	slot10 = "TE_PROCESS_ENTER"
	local interval_ctrlr = slot4(slot5, slot6, slot7, slot8, slot9)
	slot7 = interval_ctrlr
	slot5 = interval_ctrlr.set_tool_tip
	slot8 = "Set the check interval in seconds (set to 0 for every frame)."

	slot5(slot6, slot7)

	slot7 = interval_ctrlr
	slot5 = interval_ctrlr.connect
	slot8 = "EVT_CHAR"
	slot9 = callback
	slot11 = nil
	slot12 = _G
	slot13 = "verify_number"
	slot9 = slot9(slot10, slot11, slot12)
	slot10 = interval_ctrlr

	slot5(slot6, slot7, slot8, slot9)

	slot7 = interval_ctrlr
	slot5 = interval_ctrlr.connect
	slot8 = "EVT_COMMAND_TEXT_ENTER"
	slot9 = callback
	slot11 = self
	slot12 = self
	slot13 = "set_interval"
	slot9 = slot9(slot10, slot11, slot12)
	slot10 = {
		ctrlr = interval_ctrlr
	}

	slot5(slot6, slot7, slot8, slot9)

	slot7 = interval_ctrlr
	slot5 = interval_ctrlr.connect
	slot8 = "EVT_KILL_FOCUS"
	slot9 = callback
	slot11 = self
	slot12 = self
	slot13 = "set_interval"
	slot9 = slot9(slot10, slot11, slot12)
	slot10 = {
		ctrlr = interval_ctrlr
	}

	slot5(slot6, slot7, slot8, slot9)

	slot7 = interval_sizer
	slot5 = interval_sizer.add
	slot8 = interval_ctrlr
	slot9 = 3
	slot10 = 0
	slot11 = "EXPAND"

	slot5(slot6, slot7, slot8, slot9, slot10)

	slot7 = panel_sizer
	slot5 = panel_sizer.add
	slot8 = interval_sizer
	slot9 = 0
	slot10 = 0
	slot11 = "EXPAND"

	slot5(slot6, slot7, slot8, slot9, slot10)

	slot5 = EWS
	slot7 = slot5
	slot5 = slot5.BoxSizer
	slot8 = "HORIZONTAL"
	local types_sizer = slot5(slot6, slot7)
	slot8 = types_sizer
	slot6 = types_sizer.add
	slot9 = EWS
	slot11 = slot9
	slot9 = slot9.StaticText
	slot12 = panel
	slot13 = "Types:"
	slot14 = 0
	slot15 = ""
	slot9 = slot9(slot10, slot11, slot12, slot13, slot14)
	slot10 = 2
	slot11 = 0
	slot12 = "ALIGN_CENTER_VERTICAL"

	slot6(slot7, slot8, slot9, slot10, slot11)

	slot6 = EWS
	slot8 = slot6
	slot6 = slot6.ComboBox
	slot9 = panel
	slot10 = ""
	slot11 = ""
	slot12 = "CB_DROPDOWN,CB_READONLY"
	local area_type = slot6(slot7, slot8, slot9, slot10, slot11)
	slot7 = ipairs
	slot9 = {
		"on_enter",
		"on_exit",
		"toggle"
	}
	slot7, slot8, slot9 = slot7(slot8)

	for _, type in slot7, slot8, slot9 do
		slot14 = area_type
		slot12 = area_type.append
		slot15 = type

		slot12(slot13, slot14)
	end

	slot9 = area_type
	slot7 = area_type.set_value
	slot10 = self._hed
	slot10 = slot10.area_type

	slot7(slot8, slot9)

	slot9 = types_sizer
	slot7 = types_sizer.add
	slot10 = area_type
	slot11 = 3
	slot12 = 0
	slot13 = "EXPAND"

	slot7(slot8, slot9, slot10, slot11, slot12)

	slot9 = area_type
	slot7 = area_type.connect
	slot10 = "EVT_COMMAND_COMBOBOX_SELECTED"
	slot11 = callback
	slot13 = self
	slot14 = self
	slot15 = "set_element_data"
	slot11 = slot11(slot12, slot13, slot14)
	slot12 = {
		value = "area_type",
		ctrlr = area_type
	}

	slot7(slot8, slot9, slot10, slot11)

	slot9 = panel_sizer
	slot7 = panel_sizer.add
	slot10 = types_sizer
	slot11 = 0
	slot12 = 0
	slot13 = "EXPAND"

	slot7(slot8, slot9, slot10, slot11, slot12)

	slot7 = EWS
	slot9 = slot7
	slot7 = slot7.BoxSizer
	slot10 = "HORIZONTAL"
	local shape_names_sizer = slot7(slot8, slot9)
	slot10 = shape_names_sizer
	slot8 = shape_names_sizer.add
	slot11 = EWS
	slot13 = slot11
	slot11 = slot11.StaticText
	slot14 = panel
	slot15 = "Shape Types:"
	slot16 = 0
	slot17 = ""
	slot11 = slot11(slot12, slot13, slot14, slot15, slot16)
	slot12 = 2
	slot13 = 0
	slot14 = "ALIGN_CENTER_VERTICAL"

	slot8(slot9, slot10, slot11, slot12, slot13)

	slot8 = EWS
	slot10 = slot8
	slot8 = slot8.ComboBox
	slot11 = panel
	slot12 = ""
	slot13 = ""
	slot14 = "CB_DROPDOWN,CB_READONLY"
	local shape_names = slot8(slot9, slot10, slot11, slot12, slot13)
	slot9 = ipairs
	slot11 = self._shapes_types
	slot9, slot10, slot11 = slot9(slot10)

	for _, type in slot9, slot10, slot11 do
		slot16 = shape_names
		slot14 = shape_names.append
		slot17 = type

		slot14(slot15, slot16)
	end

	slot11 = shape_names
	slot9 = shape_names.set_value
	slot12 = self._shape_type

	slot9(slot10, slot11)

	slot11 = shape_names_sizer
	slot9 = shape_names_sizer.add
	slot12 = shape_names
	slot13 = 3
	slot14 = 0
	slot15 = "EXPAND"

	slot9(slot10, slot11, slot12, slot13, slot14)

	slot11 = shape_names
	slot9 = shape_names.connect
	slot12 = "EVT_COMMAND_COMBOBOX_SELECTED"
	slot13 = callback
	slot15 = self
	slot16 = self
	slot17 = "set_shape_type"
	slot13 = slot13(slot14, slot15, slot16)
	slot14 = shape_names

	slot9(slot10, slot11, slot12, slot13)

	slot11 = panel_sizer
	slot9 = panel_sizer.add
	slot12 = shape_names_sizer
	slot13 = 0
	slot14 = 0
	slot15 = "EXPAND"

	slot9(slot10, slot11, slot12, slot13, slot14)

	slot9 = EWS
	slot11 = slot9
	slot9 = slot9.StaticBoxSizer
	slot12 = panel
	slot13 = "VERTICAL"
	slot14 = "Shapes"
	local shapes_sizer = slot9(slot10, slot11, slot12, slot13)
	slot10 = EWS
	slot12 = slot10
	slot10 = slot10.ListBox
	slot13 = panel
	slot14 = "area_shapes_list_mission"
	slot15 = "LB_SINGLE,LB_HSCROLL,LB_NEEDED_SB,LB_SORT"
	slot10 = slot10(slot11, slot12, slot13, slot14)
	self._shapes_list = slot10
	slot12 = shapes_sizer
	slot10 = shapes_sizer.add
	slot13 = self._shapes_list
	slot14 = 0
	slot15 = 0
	slot16 = "EXPAND"

	slot10(slot11, slot12, slot13, slot14, slot15)

	slot10 = self._shapes_list
	slot12 = slot10
	slot10 = slot10.connect
	slot13 = "EVT_COMMAND_LISTBOX_SELECTED"
	slot14 = callback
	slot16 = self
	slot17 = self
	slot18 = "selected_shape"
	slot14 = slot14(slot15, slot16, slot17)
	slot15 = self._shapes_list

	slot10(slot11, slot12, slot13, slot14)

	slot12 = self
	slot10 = self.populate_shapes_list

	slot10(slot11)

	slot10 = EWS
	slot12 = slot10
	slot10 = slot10.Button
	slot13 = panel
	slot14 = "Delete Shape"
	slot15 = ""
	slot16 = "BU_EXACTFIT,NO_BORDER"
	local delete_shape = slot10(slot11, slot12, slot13, slot14, slot15)
	slot13 = shapes_sizer
	slot11 = shapes_sizer.add
	slot14 = delete_shape
	slot15 = 0
	slot16 = 0
	slot17 = "ALIGN_RIGHT"

	slot11(slot12, slot13, slot14, slot15, slot16)

	slot13 = delete_shape
	slot11 = delete_shape.connect
	slot14 = "EVT_COMMAND_BUTTON_CLICKED"
	slot15 = callback
	slot17 = self
	slot18 = self
	slot19 = "delete"
	slot15 = slot15(slot16, slot17, slot18)
	slot16 = nil

	slot11(slot12, slot13, slot14, slot15)

	slot13 = panel_sizer
	slot11 = panel_sizer.add
	slot14 = shapes_sizer
	slot15 = 0
	slot16 = 0
	slot17 = "EXPAND"

	slot11(slot12, slot13, slot14, slot15, slot16)

	slot11 = EWS
	slot13 = slot11
	slot11 = slot11.StaticBoxSizer
	slot14 = panel
	slot15 = "VERTICAL"
	slot16 = "Altitude"
	local altitude_sizer = slot11(slot12, slot13, slot14, slot15)
	slot12 = EWS
	slot14 = slot12
	slot12 = slot12.Slider
	slot15 = panel
	slot16 = 0
	slot17 = -20000
	slot18 = 20000
	slot19 = ""
	slot20 = ""
	slot12 = slot12(slot13, slot14, slot15, slot16, slot17, slot18, slot19)
	self._start_altitude = slot12
	slot12 = EWS
	slot14 = slot12
	slot12 = slot12.Slider
	slot15 = panel
	slot16 = 0
	slot17 = 0
	slot18 = 30000
	slot19 = ""
	slot20 = ""
	slot12 = slot12(slot13, slot14, slot15, slot16, slot17, slot18, slot19)
	self._height = slot12
	slot14 = self
	slot12 = self._altitude_ctrlr
	slot15 = panel
	slot16 = "Start Altitude:"
	slot17 = 0
	slot18 = "start"
	slot19 = altitude_sizer
	slot12, slot13 = slot12(slot13, slot14, slot15, slot16, slot17, slot18)
	self._start_altitude_spin = slot13
	self._start_altitude_text = slot12
	slot14 = altitude_sizer
	slot12 = altitude_sizer.add
	slot15 = self._start_altitude
	slot16 = 1
	slot17 = 10
	slot18 = "EXPAND"

	slot12(slot13, slot14, slot15, slot16, slot17)

	slot14 = self
	slot12 = self._altitude_ctrlr
	slot15 = panel
	slot16 = "Height:"
	slot17 = 0
	slot18 = "height"
	slot19 = altitude_sizer
	slot12, slot13 = slot12(slot13, slot14, slot15, slot16, slot17, slot18)
	self._height_altitude_spin = slot13
	self._height_altitude_text = slot12
	slot14 = altitude_sizer
	slot12 = altitude_sizer.add
	slot15 = self._height
	slot16 = 1
	slot17 = 0
	slot18 = "EXPAND"

	slot12(slot13, slot14, slot15, slot16, slot17)

	slot12 = self._start_altitude
	slot14 = slot12
	slot12 = slot12.connect
	slot15 = "EVT_SCROLL_CHANGED"
	slot16 = callback
	slot18 = self
	slot19 = self
	slot20 = "set_start_altitude"
	slot16 = slot16(slot17, slot18, slot19)
	slot17 = nil

	slot12(slot13, slot14, slot15, slot16)

	slot12 = self._start_altitude
	slot14 = slot12
	slot12 = slot12.connect
	slot15 = "EVT_SCROLL_THUMBTRACK"
	slot16 = callback
	slot18 = self
	slot19 = self
	slot20 = "set_start_altitude"
	slot16 = slot16(slot17, slot18, slot19)
	slot17 = nil

	slot12(slot13, slot14, slot15, slot16)

	slot12 = self._height
	slot14 = slot12
	slot12 = slot12.connect
	slot15 = "EVT_SCROLL_CHANGED"
	slot16 = callback
	slot18 = self
	slot19 = self
	slot20 = "set_height"
	slot16 = slot16(slot17, slot18, slot19)
	slot17 = nil

	slot12(slot13, slot14, slot15, slot16)

	slot12 = self._height
	slot14 = slot12
	slot12 = slot12.connect
	slot15 = "EVT_SCROLL_THUMBTRACK"
	slot16 = callback
	slot18 = self
	slot19 = self
	slot20 = "set_height"
	slot16 = slot16(slot17, slot18, slot19)
	slot17 = nil

	slot12(slot13, slot14, slot15, slot16)

	slot12 = EWS
	slot14 = slot12
	slot12 = slot12.Button
	slot15 = panel
	slot16 = "Set to 2D"
	slot17 = "_set_2d"
	slot18 = "BU_EXACTFIT,NO_BORDER"
	local set_2d = slot12(slot13, slot14, slot15, slot16, slot17)
	slot15 = altitude_sizer
	slot13 = altitude_sizer.add
	slot16 = set_2d
	slot17 = 1
	slot18 = 0
	slot19 = "EXPAND"

	slot13(slot14, slot15, slot16, slot17, slot18)

	slot15 = set_2d
	slot13 = set_2d.connect
	slot16 = "EVT_COMMAND_BUTTON_CLICKED"
	slot17 = callback
	slot19 = self
	slot20 = self
	slot21 = "set_2d"
	slot17 = slot17(slot18, slot19, slot20)
	slot18 = nil

	slot13(slot14, slot15, slot16, slot17)

	slot15 = panel_sizer
	slot13 = panel_sizer.add
	slot16 = altitude_sizer
	slot17 = 1
	slot18 = 0
	slot19 = "EXPAND"

	slot13(slot14, slot15, slot16, slot17, slot18)

	slot13 = EWS
	slot15 = slot13
	slot13 = slot13.StaticBoxSizer
	slot16 = panel
	slot17 = "VERTICAL"
	slot18 = "Size"
	local size_sizer = slot13(slot14, slot15, slot16, slot17)
	slot14 = EWS
	slot16 = slot14
	slot14 = slot14.Slider
	slot17 = panel
	slot18 = 10
	slot19 = 1
	slot20 = 40
	slot21 = ""
	slot22 = ""
	slot14 = slot14(slot15, slot16, slot17, slot18, slot19, slot20, slot21)
	self._size = slot14
	slot16 = size_sizer
	slot14 = size_sizer.add
	slot17 = self._size
	slot18 = 1
	slot19 = 0
	slot20 = "EXPAND"

	slot14(slot15, slot16, slot17, slot18, slot19)

	slot14 = self._size
	slot16 = slot14
	slot14 = slot14.connect
	slot17 = "EVT_SCROLL_CHANGED"
	slot18 = callback
	slot20 = self
	slot21 = self
	slot22 = "set_size"
	slot18 = slot18(slot19, slot20, slot21)
	slot19 = nil

	slot14(slot15, slot16, slot17, slot18)

	slot14 = self._size
	slot16 = slot14
	slot14 = slot14.connect
	slot17 = "EVT_SCROLL_CHANGED"
	slot18 = callback
	slot20 = self
	slot21 = self
	slot22 = "size_release"
	slot18 = slot18(slot19, slot20, slot21)
	slot19 = nil

	slot14(slot15, slot16, slot17, slot18)

	slot14 = self._size
	slot16 = slot14
	slot14 = slot14.connect
	slot17 = "EVT_SCROLL_THUMBTRACK"
	slot18 = callback
	slot20 = self
	slot21 = self
	slot22 = "set_size"
	slot18 = slot18(slot19, slot20, slot21)
	slot19 = nil

	slot14(slot15, slot16, slot17, slot18)

	slot14 = self._size
	slot16 = slot14
	slot14 = slot14.connect
	slot17 = "EVT_SCROLL_THUMBRELEASE"
	slot18 = callback
	slot20 = self
	slot21 = self
	slot22 = "size_release"
	slot18 = slot18(slot19, slot20, slot21)
	slot19 = nil

	slot14(slot15, slot16, slot17, slot18)

	slot16 = panel_sizer
	slot14 = panel_sizer.add
	slot17 = size_sizer
	slot18 = 0
	slot19 = 0
	slot20 = "EXPAND"

	slot14(slot15, slot16, slot17, slot18, slot19)

	slot16 = self
	slot14 = self.set_shape_values

	slot14(slot15)

	return 
end

slot0._build_panel = slot1
slot0 = CoreAreaUnitElement

function slot1(self, panel, name, value, type, sizer)
	slot6 = EWS
	slot8 = slot6
	slot6 = slot6.BoxSizer
	slot9 = "HORIZONTAL"
	local ctrl_sizer = slot6(slot7, slot8)
	slot9 = ctrl_sizer
	slot7 = ctrl_sizer.add
	slot10 = EWS
	slot12 = slot10
	slot10 = slot10.StaticText
	slot13 = panel
	slot14 = name
	slot15 = ""
	slot16 = "ALIGN_LEFT"
	slot10 = slot10(slot11, slot12, slot13, slot14, slot15)
	slot11 = 1
	slot12 = 0
	slot13 = "ALIGN_CENTER_VERTICAL"

	slot7(slot8, slot9, slot10, slot11, slot12)

	slot7 = EWS
	slot9 = slot7
	slot7 = slot7.TextCtrl
	slot10 = self._panel
	slot11 = value
	slot12 = ""
	slot13 = "TE_PROCESS_ENTER"
	local ctrl = slot7(slot8, slot9, slot10, slot11, slot12)
	slot10 = ctrl
	slot8 = ctrl.connect
	slot11 = "EVT_CHAR"
	slot12 = callback
	slot14 = nil
	slot15 = _G
	slot16 = "verify_number"
	slot12 = slot12(slot13, slot14, slot15)
	slot13 = ctrl

	slot8(slot9, slot10, slot11, slot12)

	slot10 = ctrl
	slot8 = ctrl.connect
	slot11 = "EVT_COMMAND_TEXT_ENTER"
	slot12 = callback
	slot14 = self
	slot15 = self
	slot16 = "set_altitude_text"
	slot12 = slot12(slot13, slot14, slot15)
	slot13 = {
		ctrl = ctrl,
		type = type
	}

	slot8(slot9, slot10, slot11, slot12)

	slot10 = ctrl
	slot8 = ctrl.connect
	slot11 = "EVT_KILL_FOCUS"
	slot12 = callback
	slot14 = self
	slot15 = self
	slot16 = "set_altitude_text"
	slot12 = slot12(slot13, slot14, slot15)
	slot13 = {
		ctrl = ctrl,
		type = type
	}

	slot8(slot9, slot10, slot11, slot12)

	slot10 = ctrl_sizer
	slot8 = ctrl_sizer.add
	slot11 = ctrl
	slot12 = 1
	slot13 = 0
	slot14 = "EXPAND"

	slot8(slot9, slot10, slot11, slot12, slot13)

	slot8 = EWS
	slot10 = slot8
	slot8 = slot8.SpinButton
	slot11 = self._panel
	slot12 = ""
	slot13 = "SP_VERTICAL"
	local spin = slot8(slot9, slot10, slot11, slot12)
	slot11 = spin
	slot9 = spin.set_min_size
	slot12 = Vector3
	slot14 = -1
	slot15 = 10
	slot16 = 0

	slot9(slot10, slot12(slot13, slot14, slot15))

	slot11 = spin
	slot9 = spin.connect
	slot12 = "EVT_SCROLL_LINEUP"
	slot13 = callback
	slot15 = self
	slot16 = self
	slot17 = "set_altitude_spin"
	slot13 = slot13(slot14, slot15, slot16)
	slot14 = {
		step = 1,
		ctrl = ctrl,
		type = type
	}

	slot9(slot10, slot11, slot12, slot13)

	slot11 = spin
	slot9 = spin.connect
	slot12 = "EVT_SCROLL_LINEDOWN"
	slot13 = callback
	slot15 = self
	slot16 = self
	slot17 = "set_altitude_spin"
	slot13 = slot13(slot14, slot15, slot16)
	slot14 = {
		step = -1,
		ctrl = ctrl,
		type = type
	}

	slot9(slot10, slot11, slot12, slot13)

	slot11 = ctrl_sizer
	slot9 = ctrl_sizer.add
	slot12 = spin
	slot13 = 0
	slot14 = 0
	slot15 = "EXPAND"

	slot9(slot10, slot11, slot12, slot13, slot14)

	slot11 = sizer
	slot9 = sizer.add
	slot12 = ctrl_sizer
	slot13 = 1
	slot14 = 10
	slot15 = "EXPAND,LEFT,RIGHT"

	slot9(slot10, slot11, slot12, slot13, slot14)

	slot9 = ctrl
	slot10 = spin

	return slot9, slot10
end

slot0._altitude_ctrlr = slot1
slot0 = CoreAreaUnitElement

function slot1(self)
	return 
end

slot0.destroy = slot1

return 
