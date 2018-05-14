BlinkExt = BlinkExt or class()
function BlinkExt:init(unit)
	self._object_list = {}

	if self._objects then
		slot4 = self._objects

		for _, object in ipairs(slot3) do
			slot9 = self._object_list
			slot12 = unit
			slot15 = object

			table.insert(slot8, unit.get_object(slot11, Idstring(slot14)))
		end
	end

	self._effect_list = {}

	if self._effects then
		slot4 = self._effects

		for _, effect in ipairs(slot3) do
			slot9 = self._effect_list
			slot12 = unit
			slot15 = effect

			table.insert(slot8, unit.effect_spawner(slot11, Idstring(slot14)))
		end
	end

	if self._state then
		slot6 = self._delay or 1

		self.set_state(slot3, self, self._state)
	end

	return 
end
function BlinkExt:update(unit, t, dt)
	if self._delay_current and self._delay_current < t then
		if self._state == "cycle" then
			if self._current_object then
				slot7 = false

				self._object_list[self._current_object].set_visibility(self._current_object, self._object_list[self._current_object])

				self._current_object = (self._current_object == #self._object_list and 1) or self._current_object + 1
				slot7 = true

				self._object_list[self._current_object].set_visibility(self._current_object, self._object_list[self._current_object])
			end

			if self._current_effect then
				slot7 = false

				self._effect_list[self._current_effect].set_enabled(self._current_effect, self._effect_list[self._current_effect])

				self._current_effect = (self._current_effect == #self._effect_list and 1) or self._current_effect + 1
				slot7 = true

				self._effect_list[self._current_effect].set_enabled(self._current_effect, self._effect_list[self._current_effect])
			end
		elseif self._state == "rand_cycle" then
			if self._current_object then
				slot7 = false

				self._object_list[self._current_object].set_visibility(self._current_object, self._object_list[self._current_object])

				slot6 = #self._object_list
				self._current_object = math.random(self._current_object)
				slot7 = true

				self._object_list[self._current_object].set_visibility(self._current_object, self._object_list[self._current_object])
			end

			if self._current_effect then
				slot7 = false

				self._effect_list[self._current_effect].set_enabled(self._current_effect, self._effect_list[self._current_effect])

				slot6 = #self._effect_list
				self._current_effect = math.random(self._current_effect)
				slot7 = true

				self._effect_list[self._current_effect].set_enabled(self._current_effect, self._effect_list[self._current_effect])
			end
		else
			slot6 = self._object_list

			for _, object in ipairs(slot5) do
				slot14 = object
				slot12 = not object.visibility(slot13)

				object.set_visibility(slot10, object)
			end

			slot6 = self._effect_list

			for _, effect in ipairs(slot5) do
				slot14 = effect
				slot12 = not effect.enabled(slot13)

				effect.set_enabled(slot10, effect)
			end
		end

		slot6 = TimerManager
		slot6 = TimerManager.game(slot5)
		self._delay_current = TimerManager.game(slot5).time(slot5) + self._delay
	end

	return 
end
function BlinkExt:set_state(state, delay)
	self._state = state
	self._delay = delay

	if state == "twinkle" then
		local swap = true
		slot6 = self._object_list

		for _, object in ipairs(slot5) do
			slot12 = swap

			object.set_visibility(slot10, object)

			swap = not swap
		end

		swap = true
		slot6 = self._effect_list

		for _, effect in ipairs(slot5) do
			slot12 = swap

			effect.set_enabled(slot10, effect)

			swap = not swap
		end

		slot6 = TimerManager
		slot6 = TimerManager.game(slot5)
		self._delay_current = TimerManager.game(slot5).time(slot5) + delay
	elseif state == "cycle" then
		slot5 = self._object_list

		for _, object in ipairs(slot4) do
			slot11 = false

			object.set_visibility(slot9, object)
		end

		slot5 = self._effect_list

		for _, effect in ipairs(slot4) do
			slot11 = false

			effect.set_enabled(slot9, effect)
		end

		if 0 < #self._object_list then
			self._current_object = 1
			slot6 = true

			self._object_list[1].set_visibility(slot4, self._object_list[1])
		end

		if 0 < #self._effect_list then
			self._current_effect = 1
			slot6 = true

			self._effect_list[1].set_enabled(slot4, self._effect_list[1])
		end

		slot5 = TimerManager
		slot5 = TimerManager.game(slot4)
		self._delay_current = TimerManager.game(slot4).time(slot4) + delay
	elseif state == "rand_cycle" then
		slot5 = self._object_list

		for _, object in ipairs(slot4) do
			slot11 = false

			object.set_visibility(slot9, object)
		end

		slot5 = self._effect_list

		for _, effect in ipairs(slot4) do
			slot11 = false

			effect.set_enabled(slot9, effect)
		end

		if 0 < #self._object_list then
			slot5 = #self._object_list
			self._current_object = math.random(slot4)
			slot6 = true

			self._object_list[self._current_object].set_visibility(self._current_object, self._object_list[self._current_object])
		end

		if 0 < #self._effect_list then
			slot5 = #self._effect_list
			self._current_effect = math.random(slot4)
			slot6 = true

			self._effect_list[self._current_effect].set_enabled(self._current_effect, self._effect_list[self._current_effect])
		end

		slot5 = TimerManager
		slot5 = TimerManager.game(slot4)
		self._delay_current = TimerManager.game(slot4).time(slot4) + delay
	elseif state == "blink" then
		slot5 = self._object_list

		for _, object in ipairs(slot4) do
			slot11 = true

			object.set_visibility(slot9, object)
		end

		slot5 = self._effect_list

		for _, effect in ipairs(slot4) do
			slot11 = true

			effect.set_enabled(slot9, effect)
		end

		slot5 = TimerManager
		slot5 = TimerManager.game(slot4)
		self._delay_current = TimerManager.game(slot4).time(slot4) + delay
	elseif state == "disable" then
		slot5 = self._object_list

		for _, object in ipairs(slot4) do
			slot11 = false

			object.set_visibility(slot9, object)
		end

		slot5 = self._effect_list

		for _, effect in ipairs(slot4) do
			slot11 = false

			effect.set_enabled(slot9, effect)
		end

		self._delay_current = nil
	elseif state == "enable" then
		slot5 = self._object_list

		for _, object in ipairs(slot4) do
			slot11 = true

			object.set_visibility(slot9, object)
		end

		slot5 = self._effect_list

		for _, effect in ipairs(slot4) do
			slot11 = true

			effect.set_enabled(slot9, effect)
		end

		self._delay_current = nil
	end

	return 
end
function BlinkExt:save(data)
	data.BlinkExt = {
		state = self._state,
		delay = self._delay
	}

	return 
end
function BlinkExt:load(data)
	local state = data.BlinkExt
	self._state = data.BlinkExt.state
	self._delay = data.BlinkExt.delay
	slot7 = self._delay

	self.set_state(slot4, self, self._state)

	return 
end

return 
