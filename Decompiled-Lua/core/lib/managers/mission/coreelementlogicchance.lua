-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreElementLogicChance"

core.module(slot1, core)

slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementLogicChance then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementLogicChance = slot0
function ElementLogicChance:init(...)
	slot3 = self

	ElementLogicChance.super.init(slot2, ...)

	self._chance = self._values.chance
	self._triggers = {}

	return 
end
function ElementLogicChance:client_on_executed(...)
	return 
end
function ElementLogicChance:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	if not self.monitor_element and self._values.output_monitor_id then
	end

	slot4 = 100
	local roll = math.random(slot3)

	if self._chance < roll then
		slot6 = " roll: " .. roll .. " - fail"

		self.monitor_output_change(slot4, self)

		slot6 = "fail"

		self._trigger_outcome(slot4, self)

		return 
	end

	slot6 = " roll: " .. roll .. " - success"

	self.monitor_output_change(slot4, self)

	slot6 = "success"

	self._trigger_outcome(slot4, self)

	slot6 = instigator

	ElementLogicChance.super.on_executed(slot4, self)

	return 
end
function ElementLogicChance:chance_operation_add_chance(chance)
	self._chance = self._chance + chance
	slot4 = self

	self.monitor_output_change(slot3)

	return 
end
function ElementLogicChance:chance_operation_subtract_chance(chance)
	self._chance = self._chance - chance
	slot4 = self

	self.monitor_output_change(slot3)

	return 
end
function ElementLogicChance:chance_operation_reset()
	self._chance = self._values.chance
	slot3 = self

	self.monitor_output_change(slot2)

	return 
end
function ElementLogicChance:chance_operation_set_chance(chance)
	self._chance = chance
	slot4 = self

	self.monitor_output_change(slot3)

	return 
end
function ElementLogicChance:add_trigger(id, outcome, callback)
	self._triggers[id] = {
		outcome = outcome,
		callback = callback
	}

	return 
end
function ElementLogicChance:remove_trigger(id)
	self._triggers[id] = nil

	return 
end
function ElementLogicChance:_trigger_outcome(outcome)
	slot4 = self._triggers

	for _, data in pairs(slot3) do
		if data.outcome == outcome then
			data.callback()
		end
	end

	return 
end
function ElementLogicChance:monitor_output_change(result)
	if self.monitor_element then
		local output_string = "chance: " .. self._chance .. " " .. (result or "")
		slot7 = output_string

		self.monitor_element.on_monitored_element(" ", self.monitor_element, self._editor_name)
	end

	return 
end

if not ElementLogicChanceOperator then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementLogicChanceOperator = slot0
function ElementLogicChanceOperator:init(...)
	slot3 = self

	ElementLogicChanceOperator.super.init(slot2, ...)

	return 
end
function ElementLogicChanceOperator:client_on_executed(...)
	return 
end
function ElementLogicChanceOperator:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	slot4 = self._values.elements

	for _, id in ipairs(slot3) do
		slot10 = id
		local element = self.get_mission_element(slot8, self)

		if element then
			if self._values.operation == "add_chance" then
				slot11 = self._values.chance

				element.chance_operation_add_chance(slot9, element)
			elseif self._values.operation == "subtract_chance" then
				slot11 = self._values.chance

				element.chance_operation_subtract_chance(slot9, element)
			elseif self._values.operation == "reset" then
				slot10 = element

				element.chance_operation_reset(slot9)
			elseif self._values.operation == "set_chance" then
				slot11 = self._values.chance

				element.chance_operation_set_chance(slot9, element)
			end
		end
	end

	slot5 = instigator

	ElementLogicChanceOperator.super.on_executed(slot3, self)

	return 
end

if not ElementLogicChanceTrigger then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementLogicChanceTrigger = slot0
function ElementLogicChanceTrigger:init(...)
	slot3 = self

	ElementLogicChanceTrigger.super.init(slot2, ...)

	return 
end
function ElementLogicChanceTrigger:on_script_activated()
	slot3 = self._values.elements

	for _, id in ipairs(slot2) do
		slot9 = id
		local element = self.get_mission_element(slot7, self)

		if element then
			slot11 = self._values.outcome
			slot16 = "on_executed"

			element.add_trigger(slot8, element, self._id, callback(slot13, self, self))
		end
	end

	return 
end
function ElementLogicChanceTrigger:client_on_executed(...)
	return 
end
function ElementLogicChanceTrigger:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	slot5 = instigator

	ElementLogicChanceTrigger.super.on_executed(slot3, self)

	return 
end

return 
