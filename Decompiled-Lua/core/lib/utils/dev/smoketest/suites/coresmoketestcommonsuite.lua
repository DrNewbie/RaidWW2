slot3 = "CoreSmoketestCommonSuite"

core.module(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

slot3 = "CoreSmoketestSuite"

core.import(slot1, core)

Substep = Substep or CoreClass.class()
Substep.init = function (self, suite, step_arguments)
	self._suite = suite
	self._step_arguments = step_arguments
	slot5 = self

	self.start(slot4)

	return 
end
Substep.has_failed = function (self)
	return self._fail == true
end
Substep.is_done = function (self)
	return self._done
end
Substep._set_done = function (self)
	self._done = true
	self._fail = false

	return 
end
Substep._set_fail = function (self)
	self._fail = true

	return 
end
Substep.start = function (self)
	slot4 = "Not implemented"

	assert(slot2, false)

	return 
end
Substep.update = function (self, t, dt)
	return 
end

if not CallAndDoneSubstep then
	slot2 = Substep
	slot0 = CoreClass.class(slot1)
end

CallAndDoneSubstep = slot0
CallAndDoneSubstep.step_arguments = function (callback)
	local step_arguments = {
		callback = callback
	}

	return step_arguments
end
CallAndDoneSubstep.start = function (self)
	self._step_arguments.callback()

	slot3 = self

	self._set_done(slot2)

	return 
end

if not WaitEventSubstep then
	slot2 = Substep
	slot0 = CoreClass.class(slot1)
end

WaitEventSubstep = slot0
WaitEventSubstep.step_arguments = function (event_id)
	local step_arguments = {
		event_id = event_id
	}

	return step_arguments
end
WaitEventSubstep.start = function (self)
	slot6 = nil
	self._event_listener = EventManager.register_listener(slot2, EventManager, self._step_arguments.event_id, function ()
		slot2 = self

		self._set_done(slot1)

		return 
	end)

	return 
end
WaitEventSubstep.destroy = function (self)
	slot4 = self._event_listener

	EventManager.unregister_listener(slot2, EventManager)

	return 
end

if not CallAndWaitEventSubstep then
	slot2 = Substep
	slot0 = CoreClass.class(slot1)
end

CallAndWaitEventSubstep = slot0
CallAndWaitEventSubstep.step_arguments = function (callback, event_id)
	local step_arguments = {
		callback = callback,
		event_id = event_id
	}

	return step_arguments
end
CallAndWaitEventSubstep.start = function (self)
	slot6 = nil
	self._event_listener = EventManager.register_listener(slot2, EventManager, self._step_arguments.event_id, function ()
		slot2 = self

		self._set_done(slot1)

		return 
	end)

	self._step_arguments.callback()

	return 
end
CallAndWaitEventSubstep.destroy = function (self)
	slot4 = self._event_listener

	EventManager.unregister_listener(slot2, EventManager)

	return 
end

if not DelaySubstep then
	slot2 = Substep
	slot0 = CoreClass.class(slot1)
end

DelaySubstep = slot0
DelaySubstep.step_arguments = function (seconds)
	local step_arguments = {
		seconds = seconds
	}

	return step_arguments
end
DelaySubstep.start = function (self)
	self._seconds_left = self._step_arguments.seconds

	return 
end
DelaySubstep.update = function (self, t, dt)
	self._seconds_left = self._seconds_left - dt

	if self._seconds_left <= 0 then
		slot5 = self

		self._set_done(slot4)
	end

	return 
end

if not CommonSuite then
	slot2 = CoreSmoketestSuite.Suite
	slot0 = CoreClass.class(slot1)
end

CommonSuite = slot0
CommonSuite.init = function (self)
	self._step_list = {}

	return 
end
CommonSuite.add_step = function (self, name, class, params)
	local step_entry = {
		name = name,
		class = class,
		params = params
	}
	slot8 = step_entry

	table.insert(slot6, self._step_list)

	return 
end
CommonSuite.start = function (self, session_state, reporter, suite_arguments)
	self._suite_arguments = suite_arguments
	self._session_state = session_state
	self._reporter = reporter
	self._is_done = false
	self._current_step_id = 0
	slot6 = self

	self.next_step(slot5)

	return 
end
CommonSuite.is_done = function (self)
	return self._is_done
end
CommonSuite.update = function (self, t, dt)
	if self._current_step then
		slot7 = dt

		self._current_step.update(slot4, self._current_step, t)

		slot5 = self._current_step

		if self._current_step.is_done(slot4) then
			slot5 = self._current_step

			if self._current_step.has_failed(slot4) then
				slot6 = self._step_list[self._current_step_id].name

				self._reporter.fail_substep(slot4, self._reporter)
			else
				slot6 = self._step_list[self._current_step_id].name

				self._reporter.end_substep(slot4, self._reporter)
			end

			slot5 = self

			if not self.next_step(slot4) then
				self._is_done = true
			end
		end
	end

	return 
end
CommonSuite.next_step = function (self)
	if self._current_step then
		if self._current_step.destroy then
			slot3 = self._current_step

			self._current_step.destroy(slot2)
		end

		self._current_step = nil
	end

	self._current_step_id = self._current_step_id + 1

	if self._current_step_id <= #self._step_list then
		local step_entry = self._step_list[self._current_step_id]
		slot5 = step_entry.name

		self._reporter.begin_substep(slot3, self._reporter)

		slot6 = step_entry.params
		self._current_step = step_entry.class.new(slot3, step_entry.class, self)

		return true
	else
		return false
	end

	return 
end
CommonSuite.get_argument = function (self, name)
	slot5 = "Suite argument '" .. name .. "' was not defined"

	assert(slot3, self._suite_arguments[name])

	return self._suite_arguments[name]
end

return 
