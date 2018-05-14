-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementInstigator then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementInstigator = slot0
function ElementInstigator:init(...)
	slot3 = self

	ElementInstigator.super.init(slot2, ...)

	self._instigators = {}
	self._triggers = {}

	return 
end
function ElementInstigator:client_on_executed(...)
	return 
end
function ElementInstigator:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	slot5 = instigator

	self.instigator_operation_set(slot3, self)

	slot5 = instigator

	ElementInstigator.super.on_executed(slot3, self)

	return 
end
function ElementInstigator:instigator_operation_set(instigator)
	slot5 = instigator

	if not self._is_valid_instigator(slot3, self) then
		return 
	end

	slot5 = instigator

	if not table.contains(slot3, self._instigators) then
		slot5 = "changed"

		self._check_triggers(slot3, self)
	end

	slot4 = instigator

	if alive(slot3) then
		slot4 = instigator
		slot4 = instigator.character_damage(slot3)

		if not instigator.character_damage(slot3).dead(slot3) then
			self._instigators = {
				instigator
			}
			slot4 = instigator

			if instigator.unit_data(slot3).mission_element then
				slot4 = instigator
				slot5 = "death"
				slot10 = "on_instigator_death"

				instigator.unit_data(slot3).mission_element.add_event_callback(slot3, instigator.unit_data(slot3).mission_element, callback(slot7, self, self))
			end

			slot5 = "set"

			self._check_triggers(slot3, self)
		end
	end

	return 
end
function ElementInstigator:instigator_operation_add_first(instigator)
	slot5 = instigator

	if not self._is_valid_instigator(slot3, self) then
		return 
	end

	slot5 = instigator

	if table.contains(slot3, self._instigators) then
		return 
	end

	slot4 = instigator

	if alive(slot3) then
		slot4 = instigator
		slot4 = instigator.character_damage(slot3)

		if not instigator.character_damage(slot3).dead(slot3) then
			slot6 = instigator

			table.insert(slot3, self._instigators, 1)

			slot4 = instigator

			if instigator.unit_data(slot3).mission_element then
				slot4 = instigator
				slot5 = "death"
				slot10 = "on_instigator_death"

				instigator.unit_data(slot3).mission_element.add_event_callback(slot3, instigator.unit_data(slot3).mission_element, callback(slot7, self, self))
			end

			slot5 = "add_first"

			self._check_triggers(slot3, self)
		end
	end

	return 
end
function ElementInstigator:instigator_operation_add_last(instigator)
	slot5 = instigator

	if not self._is_valid_instigator(slot3, self) then
		return 
	end

	slot5 = instigator

	if table.contains(slot3, self._instigators) then
		return 
	end

	slot4 = instigator

	if alive(slot3) then
		slot4 = instigator
		slot4 = instigator.character_damage(slot3)

		if not instigator.character_damage(slot3).dead(slot3) then
			slot5 = instigator

			table.insert(slot3, self._instigators)

			slot4 = instigator

			if instigator.unit_data(slot3).mission_element then
				slot4 = instigator
				slot5 = "death"
				slot10 = "on_instigator_death"

				instigator.unit_data(slot3).mission_element.add_event_callback(slot3, instigator.unit_data(slot3).mission_element, callback(slot7, self, self))
			end

			slot5 = "add_last"

			self._check_triggers(slot3, self)
		end
	end

	return 
end
function ElementInstigator:_is_valid_instigator(instigator)

	-- Decompilation error in this vicinity:
	slot4 = instigator

	if type_name(slot3) ~= "Unit" then
		slot5 = instigator
		local msg = "[ElementInstigator:_is_valid_instigator] Element can only store units as instigators. Tried to use type " .. type_name(slot4) .. "."
		slot5 = Application

		if Application.editor(".") then
			slot6 = msg

			managers.editor.output_error(slot4, managers.editor)
		else
			slot6 = msg

			Application.error(slot4, Application)
		end

		return false
	end

	slot4 = instigator

	return true
end
function ElementInstigator:on_instigator_death(unit)
	slot5 = unit

	if not table.contains(slot3, self._instigators) then
		return 
	end

	slot5 = "death"

	self._check_triggers(slot3, self)

	return 
end
function ElementInstigator:instigator_operation_clear(instigator)
	self._instigators = {}
	slot5 = "cleared"

	self._check_triggers(slot3, self)

	return 
end
function ElementInstigator:instigator_operation_use_first(keep_on_use)
	if not keep_on_use or not self._instigators[1] then
		slot5 = 1
		slot2 = table.remove(slot3, self._instigators)
	end

	return slot2
end
function ElementInstigator:instigator_operation_use_last(keep_on_use)
	if not keep_on_use or not self._instigators[#self._instigators] then
		slot4 = self._instigators
		slot2 = table.remove(slot3)
	end

	return slot2
end
function ElementInstigator:instigator_operation_use_random(keep_on_use)
	slot4 = #self._instigators
	local index = math.random(slot3)

	if not keep_on_use or not self._instigators[index] then
		slot6 = index
		slot3 = table.remove(slot4, self._instigators)
	end

	return slot3
end
function ElementInstigator:instigator_operation_use_all(keep_on_use)
	if keep_on_use then
		return self._instigators
	end

	slot4 = self._instigators
	local instigators = clone(slot3)
	self._instigators = {}

	return instigators
end
function ElementInstigator:add_trigger(id, type, callback)
	self._triggers[type] = self._triggers[type] or {}
	self._triggers[type][id] = {
		callback = callback
	}

	return 
end
function ElementInstigator:_check_triggers(type)
	if not self._triggers[type] then
		return 
	end

	slot4 = self._triggers[type]

	for id, cb_data in pairs(slot3) do
		cb_data.callback()
	end

	return 
end

if not ElementInstigatorOperator then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementInstigatorOperator = slot0
function ElementInstigatorOperator:init(...)
	slot3 = self

	ElementInstigatorOperator.super.init(slot2, ...)

	return 
end
function ElementInstigatorOperator:client_on_executed(...)
	return 
end
function ElementInstigatorOperator:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	if self._values.operation ~= "none" then
		slot4 = self._values.elements

		for _, id in ipairs(slot3) do
			slot10 = id
			local element = self.get_mission_element(slot8, self)

			if element then
				if self._values.operation == "set" then
					slot11 = instigator

					element.instigator_operation_set(slot9, element)
				elseif self._values.operation == "add_first" then
					slot11 = instigator

					element.instigator_operation_add_first(slot9, element)
				elseif self._values.operation == "add_last" then
					slot11 = instigator

					element.instigator_operation_add_last(slot9, element)
				elseif self._values.operation == "clear" then
					slot10 = element

					element.instigator_operation_clear(slot9)
				elseif self._values.operation == "use_first" then
					slot10 = self
					slot14 = self._values.keep_on_use

					self._check_and_execute(slot9, element.instigator_operation_use_first(slot12, element))
				elseif self._values.operation == "use_last" then
					slot10 = self
					slot14 = self._values.keep_on_use

					self._check_and_execute(slot9, element.instigator_operation_use_last(slot12, element))
				elseif self._values.operation == "use_random" then
					slot10 = self
					slot14 = self._values.keep_on_use

					self._check_and_execute(slot9, element.instigator_operation_use_random(slot12, element))
				elseif self._values.operation == "use_all" then
					slot13 = self._values.keep_on_use

					for _, use_instigator in ipairs(element.instigator_operation_use_all(slot11, element)) do
						slot16 = use_instigator

						self._check_and_execute(slot14, self)
					end
				end
			end
		end
	else
		slot4 = Application

		if Application.editor(slot3) then
			slot5 = "Cant use operation " .. self._values.operation .. " in element " .. self._editor_name .. "."

			managers.editor.output_error(slot3, managers.editor)
		end
	end

	if self._values.operation == "set" or self._values.operation == "add_first" or self._values.operation == "add_last" or self._values.operation == "clear" then
		slot5 = instigator

		ElementInstigatorOperator.super.on_executed(slot3, self)
	end

	return 
end
function ElementInstigatorOperator:_check_and_execute(use_instigator)
	slot4 = use_instigator

	if alive(slot3) then
		slot4 = use_instigator
		slot4 = use_instigator.character_damage(slot3)
	else
		slot4 = Application

		if Application.editor(slot3) then
			slot4 = managers.editor
			slot2 = managers.editor.output_warning
			slot5 = "Cant use instigator. Reason: "
			slot8 = use_instigator

			if not alive(slot7) then
				slot6 = " Dont exist"
			else
				slot8 = use_instigator
				slot8 = use_instigator.character_damage(slot7)
				slot5 = slot5 .. (use_instigator.character_damage(slot7).dead(slot7) and "Dead") .. ". In element " .. self._editor_name .. "."

				slot2(slot3, slot4)
			end
		end
	end

	return 
end

if not ElementInstigatorTrigger then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementInstigatorTrigger = slot0
function ElementInstigatorTrigger:init(...)
	slot3 = self

	ElementInstigatorTrigger.super.init(slot2, ...)

	return 
end
function ElementInstigatorTrigger:on_script_activated()
	slot3 = self._values.elements

	for _, id in ipairs(slot2) do
		slot9 = id
		local element = self.get_mission_element(slot7, self)
		slot11 = self._values.trigger_type
		slot16 = "on_executed"

		element.add_trigger(self, element, self._id, callback(slot13, self, self))
	end

	return 
end
function ElementInstigatorTrigger:client_on_executed(...)
	return 
end
function ElementInstigatorTrigger:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	slot5 = instigator

	ElementInstigatorTrigger.super.on_executed(slot3, self)

	return 
end

return 
