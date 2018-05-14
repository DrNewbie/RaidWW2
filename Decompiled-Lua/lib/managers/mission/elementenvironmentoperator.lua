if not ElementEnvironmentOperator then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementEnvironmentOperator = slot0
function ElementEnvironmentOperator:init(...)
	self._has_executed = false
	slot3 = self

	ElementEnvironmentOperator.super.init(slot2, ...)

	return 
end
function ElementEnvironmentOperator:stop_simulation(...)
	if self._old_default_environment then
		managers.viewport.set_default_environment(slot2, managers.viewport, self._old_default_environment, nil)
	end

	slot3 = self

	ElementEnvironmentOperator.super.destroy(slot2, ...)

	return 
end
function ElementEnvironmentOperator:client_on_executed(...)
	slot3 = self

	self.on_executed(slot2, ...)

	return 
end
function ElementEnvironmentOperator:save(data)
	data.has_executed = self._has_executed

	return 
end
function ElementEnvironmentOperator:load(data)
	self._has_executed = data.has_executed

	if self._has_executed == true then
		slot4 = managers.viewport
		self._old_default_environment = managers.viewport.default_environment(slot3)

		managers.viewport.set_default_environment(slot3, managers.viewport, self._values.environment, nil)
	end

	return 
end
function ElementEnvironmentOperator:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	self._has_executed = true
	slot4 = managers.viewport
	self._old_default_environment = managers.viewport.default_environment(slot3)

	managers.viewport.set_default_environment(slot3, managers.viewport, self._values.environment, nil)

	slot5 = instigator

	ElementEnvironmentOperator.super.on_executed(slot3, self)

	return 
end

return 
