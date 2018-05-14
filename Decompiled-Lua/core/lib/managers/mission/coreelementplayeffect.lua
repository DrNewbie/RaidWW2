slot3 = "CoreElementPlayEffect"

core.module(slot1, core)

slot3 = "CoreEngineAccess"

core.import(slot1, core)

slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementPlayEffect then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementPlayEffect = slot0
slot3 = "effect"
ElementPlayEffect.IDS_EFFECT = Idstring(slot2)
function ElementPlayEffect:init(...)
	slot3 = self

	ElementPlayEffect.super.init(slot2, ...)

	slot3 = Application

	if Application.editor(slot2) then
		if self._values.effect ~= "none" then
			slot3 = self.IDS_EFFECT
			slot6 = self._values.effect

			CoreEngineAccess._editor_load(slot2, self._values.effect.id(slot5))
		else
			slot4 = "Cant load effect named \"none\" [" .. self._editor_name .. "]"

			managers.editor.output_error(slot2, managers.editor)
		end
	end

	return 
end
function ElementPlayEffect:client_on_executed(...)
	slot3 = self

	self.on_executed(slot2, ...)

	return 
end
function ElementPlayEffect:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	slot4 = self

	self.play_effect(slot3)

	slot5 = instigator

	ElementPlayEffect.super.on_executed(slot3, self)

	return 
end
function ElementPlayEffect:play_effect()
	if self._values.effect ~= "none" then
		local params = {}
		slot4 = self._values.effect
		params.effect = Idstring(slot3)
		slot4 = self
		local pos, rot = self.get_orientation(slot3)
		params.position = (self._values.screen_space and Vector3()) or pos
		params.rotation = (self._values.screen_space and Rotation()) or rot
		params.base_time = self._values.base_time or 0
		params.random_time = self._values.random_time or 0
		params.max_amount = (self._values.max_amount ~= 0 and self._values.max_amount) or nil
		slot9 = self
		slot9 = self._sync_id

		managers.environment_effects.spawn_mission_effect(slot5, managers.environment_effects, self._unique_string_id(slot8), params)
	else
		slot3 = Application

		if Application.editor(slot2) then
			slot4 = "Cant spawn effect named \"none\" [" .. self._editor_name .. "]"

			managers.editor.output_error(slot2, managers.editor)
		end
	end

	return 
end
function ElementPlayEffect:kill()
	slot3 = managers.environment_effects
	slot6 = self

	managers.environment_effects.kill_mission_effect(slot2, self._unique_string_id(slot5))

	return 
end
function ElementPlayEffect:fade_kill()
	slot3 = managers.environment_effects
	slot6 = self

	managers.environment_effects.fade_kill_mission_effect(slot2, self._unique_string_id(slot5))

	return 
end

if not ElementStopEffect then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementStopEffect = slot0
function ElementStopEffect:init(...)
	slot3 = self

	ElementStopEffect.super.init(slot2, ...)

	return 
end
function ElementStopEffect:client_on_executed(...)
	slot3 = self

	self.on_executed(slot2, ...)

	return 
end
function ElementStopEffect:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	slot4 = self._values.elements

	for _, id in ipairs(slot3) do
		slot10 = id
		local element = self.get_mission_element(slot8, self)

		if element then
			if self._values.operation == "kill" then
				slot10 = element

				element.kill(slot9)
			elseif self._values.operation == "fade_kill" then
				slot10 = element

				element.fade_kill(slot9)
			end
		end
	end

	slot5 = instigator

	ElementStopEffect.super.on_executed(slot3, self)

	return 
end

return 
