SimpleVehicle = SimpleVehicle or class()
function SimpleVehicle:init(unit)
	self._unit = unit
	slot4 = self.ANIM_GROUP_NAME

	print(slot3)

	slot4 = self.ANIM_GROUP_NAME or "drive"
	self.ANIM_GROUP = Idstring(slot3)
	slot4 = self.ANIM_GROUP_NAME

	print(slot3)

	self._acc_time = 2
	self._deacc_time = 1
	self._max_time_speed = 0.01
	self._target_anim_time = 0
	self._current_time_speed = 0
	self._target_time_speed = self._current_time_speed
	self._current_anim_speed = 0
	self._target_anim_speed = self._current_anim_speed

	return 
end
function SimpleVehicle:update(unit, t, dt)
	if not self._started then
		return 
	end

	if not self._state then
		return 
	end

	if not self._stopped and self._anim_time_speed_params then
		if self._state == "start" then
			slot8 = self._anim_time_speed_params.transition_time + dt / self._anim_time_speed_params.transition_total_time
			self._anim_time_speed_params.transition_time = math.min(slot6, 1)

			if self._anim_time_speed_params.transition_time == 1 then
			end

			slot9 = self._anim_time_speed_params.transition_time
			self._anim_time_speed_params.current = math.lerp(slot6, self._anim_time_speed_params.start, self._anim_time_speed_params.target)
			self._bezier_v = self._bezier_v + self._new_time_speed / (self._started_end_t - self._start_t) * dt
			slot7 = self._bezier_v
			local v = math.bezier(self._new_time_speed / (self._started_end_t - self._start_t) * dt, {
				0,
				0,
				0.66,
				1
			})
			slot9 = v
			local time = math.lerp(, self._start_t, self._started_end_t)
			slot11 = self
			slot9 = time - self.anim_time(slot10)

			print(self._start_t, "1 speed")

			slot9 = time

			self._set_anim_time(self._start_t, self)

			slot9 = self.ANIM_GROUP

			if self._started_end_t <= self._unit.anim_time(self._start_t, self._unit) then
				self._state = "run"
				self._bezier_v = self._bezier_v - 1
				slot8 = "started"

				print(slot7)

				slot8 = "max speed reached"
				slot12 = self.ANIM_GROUP

				print(slot7, self._unit.anim_time(slot10, self._unit))
			end
		elseif self._state == "run" then
			self._bezier_v = self._bezier_v + self._new_time_speed / (self._runned_end_t - self._started_end_t) * dt
			slot7 = self._bezier_v
			local v = math.bezier(self._new_time_speed / (self._runned_end_t - self._started_end_t) * dt, {
				0,
				0.33,
				0.66,
				1
			})
			slot9 = v
			local time = math.lerp(, self._started_end_t, self._runned_end_t)
			slot11 = self
			slot9 = time - self.anim_time(slot10)

			print(self._started_end_t, "2 speed")

			slot9 = time

			self._set_anim_time(self._started_end_t, self)

			slot9 = self.ANIM_GROUP

			if self._runned_end_t <= self._unit.anim_time(self._started_end_t, self._unit) then
				self._state = "stop"
				self._bezier_v = self._bezier_v - 1
				slot8 = "runned"

				print(slot7)
			end
		elseif self._state == "stop" then
			slot7 = 1
			self._bezier_v = math.min(slot5, self._bezier_v + self._new_time_speed / (self._stopped_end_t - self._runned_end_t) * dt)
			slot7 = self._bezier_v
			local v = math.bezier(slot5, {
				0,
				0.3,
				1,
				1
			})
			slot9 = v
			local time = math.lerp(, self._runned_end_t, self._stopped_end_t)
			slot11 = self
			slot9 = time - self.anim_time(slot10)

			print(self._runned_end_t, "3 speed")

			slot9 = time

			self._set_anim_time(self._runned_end_t, self)

			slot9 = self.ANIM_GROUP

			if self._stopped_end_t <= self._unit.anim_time(self._runned_end_t, self._unit) then
				self._state = nil
				slot8 = "stopped"

				print(slot7)
			end
		end
	end

	slot6 = self

	self._check_reached_target_anim_time(slot5)

	return 
end
function SimpleVehicle:_check_reached_target_anim_time()
	slot4 = self.ANIM_GROUP

	if self._target_anim_time <= self._unit.anim_time(slot2, self._unit) then
	end

	return 
end
function SimpleVehicle:anim_time()
	slot4 = self.ANIM_GROUP

	return self._unit.anim_time(slot2, self._unit)
end
function SimpleVehicle:stop()
	slot4 = self.ANIM_GROUP
	self._runned_end_t = self._unit.anim_time(slot2, self._unit)
	self._stopped_end_t = self._runned_end_t + 1
	self._state = "stop"
	self._bezier_v = 0

	return 
end
function SimpleVehicle:start()
	slot6 = self

	self.start_anim_from_to(slot2, self, self.anim_time(20))

	return 
end
function SimpleVehicle:start_anim_from_to(from, to, max_time_speed)
	self._max_time_speed = max_time_speed or self._max_time_speed
	self._state = "start"
	self._new_time_speed = 1
	self._start_t = from
	self._started_end_t = from + 3
	self._runned_end_t = to - 3
	self._stopped_end_t = to
	self._started = true
	self._stopping = false
	self._current_time_speed = 0
	self._bezier_v = 0
	slot7 = from

	self.anim_set_time(slot5, self)

	slot7 = to

	self.set_target_anim_time(slot5, self)

	slot7 = self._max_time_speed

	self.set_target_time_speed(slot5, self)

	local length = math.abs(slot5)
	slot8 = length

	print(to - from, "length")

	return 
end
function SimpleVehicle:anim_set_time(anim_time)
	slot6 = anim_time

	self._unit.anim_set_time(slot3, self._unit, self.ANIM_GROUP)

	return 
end
function SimpleVehicle:set_target_anim_time(anim_time)
	self._target_anim_time = anim_time

	return 
end
function SimpleVehicle:set_target_time_speed(time_speed)
	self._target_time_speed = time_speed
	slot4 = time_speed - 0
	self._acc = math.abs(slot3) / self._acc_time
	slot5 = self._acc

	print(self._acc_time, "self._acc")

	slot4 = self._acc_time / (0.5 * self._acc)
	self._acc_t = math.sqrt(self._acc_time)
	self._something = 0
	slot5 = self._acc_t

	print(self._acc_time, "self._acc_t")
	print(slot3, "set_target_time_speed")

	self._anim_time_speed_params = self._anim_time_speed_params or {}
	self._anim_time_speed_params.target = time_speed
	self._anim_time_speed_params.start = self._anim_time_speed_params.current or 0
	self._anim_time_speed_params.transition_time = 0
	self._anim_time_speed_params.transition_total_time = self._acc_time
	slot6 = self._anim_time_speed_params

	print(inspect(self._anim_time_speed_params and self._anim_time_speed_params.current))

	return 
end
function SimpleVehicle:accelerate_to(anim_speed)
	self._target_anim_speed = anim_speed
	self._stopped = false

	return 
end
function SimpleVehicle:deaccelerate_to(anim_speed)
	self._target_anim_speed = anim_speed
	self._stopped = false

	return 
end
function SimpleVehicle:_anim_stop()
	slot3 = "SimpleVehicle:_anim_stop()"

	print(slot2)

	self._stopped = true

	return 
end
function SimpleVehicle:_set_anim_time(anim_time)
	slot6 = anim_time

	self._unit.anim_set_time(slot3, self._unit, self.ANIM_GROUP)

	return 
end
function SimpleVehicle:_set_anim_speed(anim_speed)
	return 
end
function SimpleVehicle:save(data)
	local state = {}
	data.SimpleVehicle = state

	return 
end
function SimpleVehicle:load(data)
	local state = data.SimpleVehicle

	return 
end
function SimpleVehicle:destroy()
	return 
end

return 
