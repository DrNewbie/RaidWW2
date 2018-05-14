-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreSlaveManager"

core.module(slot1, core)

slot3 = "CoreCode"

core.import(slot1, core)

slot3 = "CoreSlaveUpdators"

core.import(slot1, core)

SlaveManager = SlaveManager or class()
function SlaveManager:init()
	self._updator = nil
	self._status = false

	return 
end
function SlaveManager:update(t, dt)
	if self._status then
		slot7 = dt

		self._updator.update(slot4, self._updator, t)
	end

	return 
end
function SlaveManager:paused_update(t, dt)
	slot7 = dt

	self.update(slot4, self, t)

	return 
end
function SlaveManager:start(vp, port)
	slot6 = "[SlaveManager] Already started!"

	assert(slot4, not self._status)

	slot7 = port
	self._updator, self._status = CoreSlaveUpdators.SlaveUpdator.new(slot4, CoreSlaveUpdators.SlaveUpdator, vp)

	return self._status
end
function SlaveManager:act_master(host, port, lsport, manual_pumping)
	slot12 = managers.viewport
	slot12 = manual_pumping
	self._updator, self._status = CoreSlaveUpdators.MasterUpdator.new(slot6, CoreSlaveUpdators.MasterUpdator, assert(managers.viewport.first_active_viewport(slot11)), host, port, lsport)

	return self._status
end
function SlaveManager:set_batch_count(count)
	slot5 = "[SlaveManager] Batch count must be more then 0!"

	assert(slot3, not count or 0 < count)

	slot5 = count

	self._updator.set_batch_count(slot3, self._updator)

	return 
end
function SlaveManager:connected()
	return self._status
end
function SlaveManager:type()
end
function SlaveManager:peer()
end

return 
