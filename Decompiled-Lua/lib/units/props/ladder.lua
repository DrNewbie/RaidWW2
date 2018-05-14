Ladder = Ladder or class()
Ladder.ladders = Ladder.ladders or {}
Ladder.active_ladders = Ladder.active_ladders or {}
Ladder.ladder_index = 1
Ladder.LADDERS_PER_FRAME = 100
Ladder.DEBUG = false
Ladder.EVENT_IDS = {}
Ladder.current_ladder = function ()
	return Ladder.active_ladders[Ladder.ladder_index]
end
Ladder.next_ladder = function ()
	Ladder.ladder_index = Ladder.ladder_index + 1

	if #Ladder.active_ladders < Ladder.ladder_index then
		Ladder.ladder_index = 1
	end

	return Ladder.current_ladder()
end
Ladder.init = function (self, unit)
	self._unit = unit
	self.normal_axis = self.normal_axis or "y"
	self.up_axis = self.up_axis or "z"
	self._offset = self._offset or 0
	slot5 = true

	self.set_enabled(slot3, self)

	self._climb_on_top_offset = 30
	self._exit_on_top_offset = 20
	self._normal_target_offset = self._normal_target_offset or 40
	slot4 = self

	self.set_config(slot3)

	slot5 = self._unit

	table.insert(slot3, Ladder.ladders)

	return 
end
Ladder.set_config = function (self)
	slot3 = self._unit
	slot6 = self._ladder_orientation_obj_name
	self._ladder_orientation_obj = self._unit.get_object(slot2, Idstring(slot5))
	local rotation = self._ladder_orientation_obj.rotation(slot2)
	local position = self._ladder_orientation_obj.position(self._ladder_orientation_obj)
	slot5 = rotation
	self._normal = rotation[self.normal_axis](self._ladder_orientation_obj)

	if self.invert_normal_axis then
		slot6 = -1

		mvector3.multiply(slot4, self._normal)
	end

	slot5 = rotation
	self._up = rotation[self.up_axis](slot4)
	slot6 = self._normal
	self._w_dir = math.cross(slot4, self._up)
	position = position + self._up * self._offset
	local top = position + self._up * self._height
	self._bottom = position
	self._top = top
	slot8 = self._normal
	self._rotation = Rotation(self._up, self._w_dir, self._up)
	self._corners = {
		position - (self._w_dir * self._width) / 2,
		position + (self._w_dir * self._width) / 2,
		top + (self._w_dir * self._width) / 2,
		top - (self._w_dir * self._width) / 2
	}

	return 
end
Ladder.update = function (self, t, dt)
	if Ladder.DEBUG then
		slot5 = self

		self.debug_draw(slot4)
	end

	return 
end
local mvec1 = Vector3()
Ladder.can_access = function (self, pos, move_dir)
	if not self._enabled then
		return 
	end

	if Ladder.DEBUG then
		slot6 = Color.red
		local brush = Draw.brush(slot4, Draw)
		slot9 = 5

		brush.cylinder(Draw, brush, self._bottom, self._top)
	end

	slot6 = pos

	mvector3.set(slot4, mvec1)

	slot6 = self._corners[1]

	mvector3.subtract(slot4, mvec1)

	slot6 = mvec1
	local n_dot = mvector3.dot(slot4, self._normal)

	if n_dot < 0 or 50 < n_dot then
		return false
	end

	slot7 = mvec1
	local w_dot = mvector3.dot(slot5, self._w_dir)

	if w_dot < 0 or self._width < w_dot then
		return false
	end

	slot8 = mvec1
	local h_dot = mvector3.dot(slot6, self._up)

	if h_dot < 0 or self._height < h_dot then
		return false
	end

	slot9 = self._normal
	local towards_dot = mvector3.dot(slot7, move_dir)

	if self._height - self._climb_on_top_offset < h_dot then
		return 0.5 < towards_dot
	end

	if towards_dot < -0.5 then
		return true
	end

	return 
end
Ladder.check_end_climbing = function (self, pos, move_dir, gnd_ray)
	if not self._enabled then
		return true
	end

	slot7 = pos

	mvector3.set(slot5, mvec1)

	slot7 = self._corners[1]

	mvector3.subtract(slot5, mvec1)

	slot7 = mvec1
	local w_dot = mvector3.dot(slot5, self._w_dir)
	slot8 = mvec1
	local h_dot = mvector3.dot(self._w_dir, self._up)

	if w_dot < 0 or self._width < w_dot then
		return true
	elseif h_dot < 0 or self._height + self._exit_on_top_offset < h_dot then
		return true
	elseif gnd_ray and move_dir then
		slot9 = self._normal
		local towards_dot = mvector3.dot(slot7, move_dir)

		if 0 < towards_dot then
			if self._height - self._climb_on_top_offset < h_dot then
				return false
			end

			return true
		end
	end

	return 
end
Ladder.get_normal_move_offset = function (self, pos)
	slot5 = pos

	mvector3.set(slot3, mvec1)

	slot5 = self._corners[1]

	mvector3.subtract(slot3, mvec1)

	slot5 = mvec1
	local normal_move_offset = math.dot(slot3, self._normal)
	slot6 = mvec1
	local h_dot = mvector3.dot(self._normal, self._up)

	if self._height < h_dot and h_dot < self._height + self._exit_on_top_offset then
		normal_move_offset = -1
	else
		slot8 = 0.1
		normal_move_offset = math.lerp(slot5, 0, self._normal_target_offset - normal_move_offset)
	end

	return normal_move_offset
end
Ladder.rotation = function (self)
	return self._rotation
end
Ladder.up = function (self)
	return self._up
end
Ladder.normal = function (self)
	return self._normal
end
Ladder.w_dir = function (self)
	return self._w_dir
end
Ladder.bottom = function (self)
	return self._bottom
end
Ladder.top = function (self)
	return self._top
end
Ladder.set_width = function (self, width)
	self._width = width
	slot4 = self

	self.set_config(slot3)

	return 
end
Ladder.width = function (self)
	return self._width
end
Ladder.set_height = function (self, height)
	self._height = height
	slot4 = self

	self.set_config(slot3)

	return 
end
Ladder.height = function (self)
	return self._height
end
Ladder.corners = function (self)
	return self._corners
end
Ladder.set_enabled = function (self, enabled)
	self._enabled = enabled

	if self._enabled then
		slot5 = self._unit

		if not table.contains(slot3, Ladder.active_ladders) then
			slot5 = self._unit

			table.insert(slot3, Ladder.active_ladders)
		end
	else
		slot5 = self._unit

		table.delete(slot3, Ladder.active_ladders)
	end

	return 
end
Ladder.destroy = function (self, unit)
	slot5 = self._unit

	table.delete(slot3, Ladder.ladders)

	slot5 = self._unit

	table.delete(slot3, Ladder.active_ladders)

	return 
end
Ladder.debug_draw = function (self)
	slot7 = 0.5
	local brush = Draw.brush(slot2, Color.white.with_alpha(slot5, Color.white))
	slot8 = self._corners[4]

	brush.quad(Draw, brush, self._corners[1], self._corners[2], self._corners[3])

	for i = 1, 4, 1 do
		slot10 = self._corners[i] + self._normal * (50 + i * 25)

		brush.line(slot7, brush, self._corners[i])
	end

	slot5 = Color.red
	local brush = Draw.brush(slot3, Draw)
	slot7 = 5

	brush.sphere(Draw, brush, self._corners[1])

	return 
end
Ladder.save = function (self, data)
	local state = {
		enabled = self._enabled,
		height = self._height,
		width = self._width
	}
	data.Ladder = state

	return 
end
Ladder.load = function (self, data)
	local state = data.Ladder

	if state.enabled ~= self._enabled then
		slot6 = state.enabled

		self.set_enabled(slot4, self)
	end

	self._width = state.width
	self._height = state.height
	slot5 = self

	self.set_config(slot4)

	return 
end

return 
