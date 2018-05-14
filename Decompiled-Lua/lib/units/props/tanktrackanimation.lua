TankTrackAnimation = TankTrackAnimation or class()
slot2 = "uv_offset"
local ids_uv_offset = Idstring(slot1)
function TankTrackAnimation:init(unit)
	self._unit = unit
	slot7 = "tank_track_animation"

	self._unit.set_extension_update_enabled(slot3, self._unit, Idstring(slot6))

	slot4 = self._unit
	slot7 = "mat_track_left"
	self._left_track_mat = self._unit.material(slot3, Idstring(true))
	slot4 = self._unit
	slot7 = "wheel_left_drive"
	self._left_ref_object = self._unit.get_object(slot3, Idstring(true))
	slot4 = self._left_ref_object
	self._prev_left_pos = self._left_ref_object.position(slot3)
	slot4 = self._unit
	slot7 = "mat_track_right"
	self._right_track_mat = self._unit.material(slot3, Idstring(true))
	slot4 = self._unit
	slot7 = "wheel_right_drive"
	self._right_ref_object = self._unit.get_object(slot3, Idstring(true))
	slot4 = self._right_ref_object
	self._prev_right_pos = self._right_ref_object.position(slot3)
	self._wheels_left = {}
	self._wheels_right = {}

	for i = 1, 20, 1 do
		slot8 = self._unit
		slot11 = "wheel_left_" .. i
		local o = self._unit.get_object(slot7, Idstring(slot10))

		if o then
			slot10 = {
				o,
				self._wheel_diameter
			}

			table.insert(slot8, self._wheels_left)
		else
			break
		end

		slot9 = self._unit
		slot12 = "wheel_right_" .. i
		o = self._unit.get_object(slot8, Idstring(slot11))

		if o then
			slot10 = {
				o,
				self._wheel_diameter
			}

			table.insert(slot8, self._wheels_right)
		end
	end

	slot5 = {
		self._unit.get_object(slot7, Idstring(slot10)),
		self._tension_diameter
	}
	slot8 = self._unit
	slot11 = "wheel_left_tension"

	table.insert(slot3, self._wheels_left)

	slot5 = {
		self._unit.get_object(slot7, Idstring(slot10)),
		self._drive_diameter
	}
	slot8 = self._unit
	slot11 = "wheel_right_tension"

	table.insert(slot3, self._wheels_right)

	slot5 = {
		self._unit.get_object(slot7, Idstring(slot10)),
		self._tension_diameter
	}
	slot8 = self._unit
	slot11 = "wheel_left_drive"

	table.insert(slot3, self._wheels_left)

	slot5 = {
		self._unit.get_object(slot7, Idstring(slot10)),
		self._drive_diameter
	}
	slot8 = self._unit
	slot11 = "wheel_right_drive"

	table.insert(slot3, self._wheels_right)

	slot4 = self._unit
	slot7 = "wheel_left_tension"
	self._left_tesnion = self._unit.get_object(slot3, Idstring(self._drive_diameter))

	return 
end
function TankTrackAnimation:update(unit, t, dt)
	local curr_left_tension_pos = self._left_tesnion.position(slot5)
	local curr_left_pos = self._left_ref_object.position(self._left_tesnion)
	slot8 = curr_left_pos - curr_left_tension_pos
	local forward_dir = curr_left_pos - curr_left_tension_pos.normalized(self._left_ref_object)
	local diff_left_pos = curr_left_pos - self._prev_left_pos
	slot13 = forward_dir
	local diff_left_sign = math.sign(mvector3.dot(slot11, diff_left_pos))
	slot11 = diff_left_pos
	local len_diff_left = diff_left_pos.length(mvector3.dot)
	local uv_diff_left = (diff_left_sign * len_diff_left) / self._track_length
	slot14 = ids_uv_offset
	local uv_left = self._left_track_mat.get_variable(diff_left_pos, self._left_track_mat).x + uv_diff_left
	slot15 = ids_uv_offset
	slot20 = 0

	self._left_track_mat.set_variable(self._left_track_mat, self._left_track_mat, Vector3(slot17, uv_left, 0))

	slot14 = self._wheels_left

	for _, wheel in ipairs(self._left_track_mat) do
		local c = wheel[2] * math.pi
		local angle = -diff_left_sign * len_diff_left / c * 360
		slot24 = 0
		local rot = wheel[1].local_rotation(slot20) * Rotation(wheel[1], 0, angle)
		slot23 = rot

		wheel[1].set_local_rotation(wheel[1], wheel[1])
	end

	slot14 = self._right_ref_object
	local curr_right_pos = self._right_ref_object.position(slot13)
	local diff_right_pos = curr_right_pos - self._prev_right_pos
	slot19 = forward_dir
	local diff_right_sign = math.sign(mvector3.dot(slot17, diff_right_pos))
	slot17 = diff_right_pos
	local len_diff_right = diff_right_pos.length(mvector3.dot)
	local uv_diff_right = (diff_right_sign * len_diff_right) / self._track_length
	slot20 = ids_uv_offset
	local uv_right = self._right_track_mat.get_variable(diff_right_pos, self._right_track_mat).x + uv_diff_right
	slot21 = ids_uv_offset
	slot26 = 0

	self._right_track_mat.set_variable(self._right_track_mat, self._right_track_mat, Vector3(slot23, uv_right, 0))

	slot20 = self._wheels_right

	for _, wheel in ipairs(self._right_track_mat) do
		local c = wheel[2] * math.pi
		local angle = -diff_right_sign * len_diff_left / c * 360
		slot30 = 0
		local rot = wheel[1].local_rotation(slot26) * Rotation(wheel[1], 0, angle)
		slot29 = rot

		wheel[1].set_local_rotation(wheel[1], wheel[1])
	end

	self._prev_left_pos = curr_left_pos
	self._prev_right_pos = curr_right_pos

	return 
end

return 
