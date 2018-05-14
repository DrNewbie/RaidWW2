if not ElementEnvironmentEffect then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementEnvironmentEffect = slot0
function ElementEnvironmentEffect:init(...)
	self._has_executed = false
	slot3 = self

	ElementEnvironmentEffect.super.init(slot2, ...)

	return 
end
function ElementEnvironmentEffect:stop_simulation(...)
	slot4 = self._values.effect

	managers.environment_effects.stop(slot2, managers.environment_effects)

	slot3 = self

	ElementEnvironmentEffect.super.destroy(slot2, ...)

	return 
end
function ElementEnvironmentEffect:pre_destroy()
	slot4 = self._values.effect

	managers.environment_effects.stop(slot2, managers.environment_effects)

	return 
end
function ElementEnvironmentEffect:client_on_executed(...)
	slot3 = self

	self.on_executed(slot2, ...)

	return 
end
function ElementEnvironmentEffect:save(data)
	data.has_executed = self._has_executed

	return 
end
function ElementEnvironmentEffect:load(data)
	self._has_executed = data.has_executed

	if self._has_executed == true then
		slot5 = self._values.effect

		managers.environment_effects.use(slot3, managers.environment_effects)
	end

	return 
end
function ElementEnvironmentEffect:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	self._has_executed = true

	if self._values.local_only then
		slot4 = managers.player

		if instigator == managers.player.local_player(slot3) then
			local action = self._values.action

			if action == "set" then
				slot6 = self._values.effect

				managers.environment_effects.use(slot4, managers.environment_effects)
			elseif action == "remove" then
				slot6 = self._values.effect

				managers.environment_effects.stop(slot4, managers.environment_effects)
			end
		end
	end

	slot5 = instigator

	ElementEnvironmentEffect.super.on_executed(slot3, self)

	return 
end

return 
