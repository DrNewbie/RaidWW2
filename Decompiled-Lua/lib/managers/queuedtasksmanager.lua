-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
QueuedTasksManager = QueuedTasksManager or class()
function QueuedTasksManager:_set_iterating(val)
	return 
end
function QueuedTasksManager:init()
	setup._t = 0
	self._t = 0
	self._queued_tasks = {}

	return 
end
function QueuedTasksManager:update(t, dt)
	self._t = t
	local tasks = self._queued_tasks
	local i_task = #tasks
	slot8 = true

	self._set_iterating(slot6, self)

	while 0 < i_task do
		local task = tasks[i_task]

		if task.marked_for_removal then
			slot9 = i_task

			table.remove(slot7, tasks)
		elseif not task.execute_time or task.execute_time < t then
			slot9 = i_task

			table.remove(slot7, tasks)

			slot9 = task

			self._execute_queued_task(slot7, self)
		end

		i_task = i_task - 1
	end

	slot8 = false

	self._set_iterating(slot6, self)

	return 
end
function QueuedTasksManager:queue(id, callback, task_self, data, delay, verification_callback, persistant)
	local task = {
		id = id,
		callback = callback,
		task_self = task_self,
		data = data,
		execute_time = self._t + delay,
		verification_callback = verification_callback,
		persistant = persistant
	}
	slot12 = task

	table.insert(slot10, self._queued_tasks)

	return 
end
function QueuedTasksManager:unqueue(id)
	local tasks = self._queued_tasks
	local i_task = #tasks

	while 0 < i_task do
		if tasks[i_task].id == id then
			tasks[i_task].marked_for_removal = true

			return 
		end

		i_task = i_task - 1
	end

	return 
end
function QueuedTasksManager:unqueue_all(id, task_self, skip_persistant_tasks)
	local tasks = self._queued_tasks
	local i_task = #tasks

	while 0 < i_task do
		local task = tasks[i_task]
		local matching = true
		matching = matching and (not id or (id and task.id == id))
		matching = matching and (not task_self or (task_self and task.task_self == task_self))

		if skip_persistant_tasks and task.persistant then
			matching = false
		end

		if matching then
			task.marked_for_removal = true
		end

		i_task = i_task - 1
	end

	return 
end
function QueuedTasksManager:has_task(id)
	slot4 = self._queued_tasks

	for _, task in pairs(slot3) do
		if task.id == id then
			return true
		end
	end

	return false
end
function QueuedTasksManager:when(id)
	local time_remaining = nil
	local tasks = self._queued_tasks
	local i_task = #tasks

	while 0 < i_task do
		if tasks[i_task].id == id and (time_remaining == nil or tasks[i_task].execute_time - self._t < time_remaining) then
			time_remaining = tasks[i_task].execute_time - self._t
		end

		i_task = i_task - 1
	end

	return time_remaining
end
function QueuedTasksManager:_execute_queued_task(task)

	-- Decompilation error in this vicinity:
	if task.verification_callback then
		slot4 = task.id

		task.verification_callback(slot3)
	end

	return 
end
function QueuedTasksManager:on_simulation_ended()
	self._queued_tasks = {}

	return 
end

return 
