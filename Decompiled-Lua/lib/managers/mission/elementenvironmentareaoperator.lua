if not ElementEnvironmentAreaOperator then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementEnvironmentAreaOperator = slot0
function ElementEnvironmentAreaOperator:init(...)
	self._has_executed = false
	slot3 = self

	ElementEnvironmentAreaOperator.super.init(slot2, ...)

	return 
end
function ElementEnvironmentAreaOperator:stop_simulation(...)
	slot3 = self

	ElementEnvironmentAreaOperator.super.destroy(slot2, ...)

	return 
end
function ElementEnvironmentAreaOperator:save(data)
	data.has_executed = self._has_executed

	return 
end
function ElementEnvironmentAreaOperator:load(data)
	self._has_executed = data.has_executed

	if self._has_executed == true then
		slot5 = self._values.environment_area
		local environment_area = managers.environment_area.get_area_by_name(slot3, managers.environment_area)
		slot6 = self._values.environment

		environment_area.set_environment(managers.environment_area, environment_area)
	end

	return 
end
function ElementEnvironmentAreaOperator:client_on_executed(...)
	slot3 = self

	self.on_executed(slot2, ...)

	return 
end
function ElementEnvironmentAreaOperator:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	self._has_executed = true
	slot5 = self._values.environment_area
	local environment_area = managers.environment_area.get_area_by_name(slot3, managers.environment_area)
	slot6 = self._values.environment

	environment_area.set_environment(managers.environment_area, environment_area)

	slot6 = instigator

	ElementEnvironmentAreaOperator.super.on_executed(managers.environment_area, self)

	return 
end

return 
