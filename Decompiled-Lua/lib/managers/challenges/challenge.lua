Challenge = Challenge or class()
Challenge.STATE_INACTIVE = "inactive"
Challenge.STATE_ACTIVE = "active"
Challenge.STATE_COMPLETED = "completed"
Challenge.STATE_FAILED = "failed"
Challenge.create = function ()
	return 
end
Challenge.init = function (self, challenge_category, challenge_id, tasks, completion_callback, challenge_data)
	self._category = challenge_category
	self._id = challenge_id
	self._state = Challenge.STATE_INACTIVE
	self._completion_callback = completion_callback
	self._data = challenge_data
	self._tasks = {}
	slot8 = tasks

	for index, task in pairs(slot7) do
		slot16 = task
		local task = ChallengeTask.create(slot12, task.type, challenge_category, challenge_id)
		slot15 = task

		table.insert(task.type, self._tasks)
	end

	return 
end
Challenge.setup = function (self)
	slot3 = self._tasks

	for index, task in pairs(slot2) do
		slot8 = task
		slot11 = task._type

		setmetatable(slot7, ChallengeTask.get_metatable(slot10))

		slot8 = task

		task.setup(slot7)
	end

	slot3 = self

	self.deactivate(slot2)

	return 
end
Challenge.category = function (self)
	return self._category
end
Challenge.id = function (self)
	return self._id
end
Challenge.activate = function (self)
	if self._state ~= Challenge.STATE_INACTIVE then
		return 
	end

	self._state = Challenge.STATE_ACTIVE
	slot3 = self._tasks

	for id, task in pairs(slot2) do
		slot8 = task

		task.activate(slot7)
	end

	return 
end
Challenge.deactivate = function (self)
	if self._state ~= Challenge.STATE_ACTIVE then
		return 
	end

	self._state = Challenge.STATE_INACTIVE
	slot3 = self._tasks

	for id, task in pairs(slot2) do
		slot8 = task

		task.deactivate(slot7)
	end

	return 
end
Challenge.reset = function (self)
	if self._state == Challenge.STATE_COMPLETED or self._state == Challenge.STATE_FAILED then
		self._state = Challenge.STATE_INACTIVE
	end

	slot3 = self._tasks

	for id, task in pairs(slot2) do
		slot8 = task

		task.reset(slot7)
	end

	return 
end
Challenge.tasks = function (self)
	return self._tasks
end
Challenge.data = function (self)
	return self._data
end
Challenge.completed = function (self)
	return (self._state == Challenge.STATE_COMPLETED and true) or false
end
Challenge.on_task_completed = function (self)
	local challenge_completed = true
	slot4 = self._tasks

	for id, task in pairs(slot3) do
		slot9 = task

		if not task.completed(slot8) then
			challenge_completed = false

			return 
		end
	end

	slot4 = self

	self._on_completed(slot3)

	return 
end
Challenge._on_completed = function (self)
	self._state = Challenge.STATE_COMPLETED

	if self._completion_callback then
		local target_string = self._completion_callback.target
		local method = self._completion_callback.method
		local params = self._completion_callback.params
		local target = nil
		slot8 = "[.]"
		local target_parts = string.split(slot6, target_string)

		for i = 1, #target_parts, 1 do
			if target == nil then
				target = _G[target_parts[i]]
			else
				target = target[target_parts[i]]
			end
		end

		if params then
			slot8 = target
			slot11 = params

			target[method](slot7, unpack(slot10))
		else
			slot8 = target

			target[method](slot7)
		end
	end

	return 
end
Challenge.force_complete = function (self)
	slot3 = self

	if self.completed(slot2) then
		return 
	end

	self._state = Challenge.STATE_COMPLETED
	slot3 = self._tasks

	for id, task in pairs(slot2) do
		slot8 = task

		task.force_complete(slot7)
	end

	return 
end

return 
