RepelRopeBase = RepelRopeBase or class()
function RepelRopeBase:init(unit)
	self._tmp_vec3 = Vector3()
	slot5 = self._tmp_vec3

	unit.m_position(slot3, unit)

	self._unit = unit
	slot4 = unit
	slot7 = self._end_object_name
	self._end_object = unit.get_object(slot3, Idstring(slot6))
	slot7 = "base"

	unit.set_extension_update_enabled(slot3, unit, Idstring(false))

	return 
end
function RepelRopeBase:update(unit, t, dt)
	if self._retracting then
		local prog = (t - self._retract_start_t) / self._retract_duration

		if 1 < prog then
			slot8 = 0

			unit.set_slot(slot6, unit)
		else
			prog = prog^3
			local new_pos = self._tmp_vec3
			slot9 = new_pos

			self._unit.m_position(slot7, self._unit)

			slot11 = prog

			mvector3.lerp(slot7, new_pos, self._retract_pos, new_pos)

			slot9 = new_pos

			self._end_object.set_position(slot7, self._end_object)
		end
	else
		local new_pos = self._tmp_vec3
		slot8 = new_pos

		self._attach_obj.m_position(slot6, self._attach_obj)

		slot8 = new_pos

		self._end_object.set_position(slot6, self._end_object)
	end

	return 
end
function RepelRopeBase:setup(attach_object)
	self._attach_obj = attach_object
	slot7 = "base"

	self._unit.set_extension_update_enabled(slot3, self._unit, Idstring(true))

	return 
end
function RepelRopeBase:retract()
	if not self._retracting then
		self._retracting = true
		slot3 = TimerManager
		slot3 = TimerManager.game(slot2)
		self._retract_start_t = TimerManager.game(slot2).time(slot2)
		slot3 = self._attach_obj
		self._retract_pos = self._attach_obj.position(slot2)
		slot4 = self._tmp_vec3

		self._unit.m_position(slot2, self._unit)

		slot3 = 1
		slot7 = self._tmp_vec3
		self._retract_duration = math.max(slot2, mvector3.distance(slot5, self._retract_pos)) / 600
	end

	return 
end

return 
