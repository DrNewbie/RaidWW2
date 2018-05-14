slot3 = "CoreSmoketestManager"

core.module(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

slot3 = "CoreEngineAccess"

core.import(slot1, core)

slot3 = "CoreSmoketestReporter"

core.import(slot1, core)

slot3 = "CoreSmoketestLoadLevelSuite"

core.import(slot1, core)

slot3 = "CoreSmoketestEditorSuite"

core.import(slot1, core)

Manager = Manager or CoreClass.class()
function Manager:init(session_state)
	self._session_state = session_state
	self._smoketestsuites = {}
	slot4 = CoreSmoketestReporter.Reporter
	self._reporter = CoreSmoketestReporter.Reporter.new(slot3)
	slot5 = "editor"
	slot8 = CoreSmoketestEditorSuite.EditorSuite

	self.register(slot3, self, CoreSmoketestEditorSuite.EditorSuite.new(slot7))

	slot5 = "load_level"
	slot8 = CoreSmoketestLoadLevelSuite.LoadLevelSuite

	self.register(slot3, self, CoreSmoketestLoadLevelSuite.LoadLevelSuite.new(slot7))

	return 
end
function Manager:destroy()
	return 
end
function Manager:register(name, smoketestsuite)
	self._smoketestsuites[name] = smoketestsuite

	return 
end
function Manager:post_init()
	slot3 = self
	slot6 = Application

	self._parse_arguments(slot2, Application.argv(slot5))

	return 
end
function Manager:_parse_arguments(args)
	local suite_arguments = {}
	slot5 = args

	for i, arg in ipairs(slot4) do
		slot11 = "-smoketest:"

		if arg.find(slot9, arg) then
			slot12 = -1
			local smoketest_class = arg.sub(slot9, arg, 12)
			slot12 = "Only one smoketest suite can be run at a time"

			assert(arg, not self._suite)

			slot12 = "Smoketest '" .. smoketest_class .. "' does't exist"

			assert(arg, self._smoketestsuites[smoketest_class])

			self._suite = self._smoketestsuites[smoketest_class]
		else
			slot11 = "-smoketestarg:"

			if arg.find(slot9, arg) then
				slot12 = -1
				local subarg = arg.sub(slot9, arg, 15)
				slot12 = "="
				local separator_index = subarg.find(arg, subarg)
				slot13 = "smoketestargs must be on the form name=value! found this " .. subarg

				assert(subarg, separator_index)

				slot14 = separator_index - 1
				local name = subarg.sub(subarg, subarg, 1)
				slot15 = -1
				local value = subarg.sub(subarg, subarg, separator_index + 1)
				suite_arguments[name] = value
			end
		end
	end

	if self._suite then
		slot8 = suite_arguments

		self._suite.start(slot4, self._suite, self._session_state, self._reporter)
	end

	return 
end
function Manager:update(t, dt)
	if self._suite then
		slot7 = dt

		self._suite.update(slot4, self._suite, t)

		slot5 = self._suite

		if self._suite.is_done(slot4) then
			slot6 = "WIN32"

			if SystemInfo.platform(slot4) == Idstring(SystemInfo) then
				slot6 = "shutdown"

				self._reporter.begin_substep(slot4, self._reporter)
				CoreEngineAccess._quit()
			else
				slot5 = self._reporter

				self._reporter.tests_done(slot4)
			end

			self._suite = nil
		end
	end

	return 
end

return 
