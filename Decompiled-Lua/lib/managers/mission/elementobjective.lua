slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementObjective then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementObjective = slot0
function ElementObjective:init(...)
	slot3 = self

	ElementObjective.super.init(slot2, ...)

	return 
end
function ElementObjective:on_script_activated()
	slot4 = self._id

	self._mission_script.add_save_state_cb(slot2, self._mission_script)

	return 
end
function ElementObjective:client_on_executed(...)
	slot3 = self

	self.on_executed(slot2, ...)

	return 
end
function ElementObjective:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	slot5 = "objective"
	local objective = self.value(slot3, self)
	slot6 = "amount"
	local amount = self.value(self, self)
	amount = (amount and 0 < amount and amount) or nil

	if self._values.elements and 0 < #self._values.elements then
		slot7 = self._values.elements[1]
		local element = self.get_mission_element(slot5, self)
		slot7 = element._values.counter_target
		local counter_amount = tonumber(self)

		if 0 < counter_amount then
			amount = counter_amount
		end
	end

	slot6 = self._mission_script
	local worlddef = self._mission_script.worlddefinition(slot5)

	if objective ~= "none" then
		if self._values.state == "activate" then
			slot11 = worlddef._world_id

			managers.objectives.activate_objective(slot6, managers.objectives, objective, nil, {
				amount = amount
			})
		elseif self._values.state == "complete_and_activate" then
			slot11 = worlddef._world_id

			managers.objectives.complete_and_activate_objective(slot6, managers.objectives, objective, nil, {
				amount = amount
			})
		elseif self._values.state == "complete" then
			if self._values.sub_objective and self._values.sub_objective ~= "none" then
				slot9 = self._values.sub_objective

				managers.objectives.complete_sub_objective(slot6, managers.objectives, objective)
			else
				slot8 = objective

				managers.objectives.complete_objective(slot6, managers.objectives)
			end
		elseif self._values.state == "update" then
			slot8 = objective

			managers.objectives.update_objective(slot6, managers.objectives)
		elseif self._values.state == "remove" then
			slot8 = objective

			managers.objectives.remove_objective(slot6, managers.objectives)
		elseif self._values.state == "remove_and_activate" then
			slot11 = worlddef._world_id

			managers.objectives.remove_and_activate_objective(slot6, managers.objectives, objective, nil, {
				amount = amount
			})
		elseif self._values.state == "set_objective_current_amount" then
			slot9 = amount

			managers.objectives.set_objective_current_amount(slot6, managers.objectives, objective)
		elseif self._values.state == "set_sub_objective_amount" then
			slot10 = amount

			managers.objectives.set_sub_objective_amount(slot6, managers.objectives, objective, self._values.sub_objective)
		elseif self._values.state == "set_sub_objective_current_amount" then
			slot10 = amount

			managers.objectives.set_sub_objective_current_amount(slot6, managers.objectives, objective, self._values.sub_objective)
		end
	else
		slot7 = Application

		if Application.editor(slot6) then
			slot8 = "Cant operate on objective " .. objective .. " in element " .. self._editor_name .. "."

			managers.editor.output_error(slot6, managers.editor)
		end
	end

	slot8 = instigator

	ElementObjective.super.on_executed(slot6, self)

	return 
end
function ElementObjective:apply_job_value(amount)
	slot4 = amount
	local type = CoreClass.type_name(slot3)

	if type ~= "number" then
		slot6 = "[ElementObjective:apply_job_value] " .. self._id .. "(" .. self._editor_name .. ") Can't apply job value of type " .. type

		Application.error(slot4, Application)

		return 
	end

	self._values.amount = amount

	return 
end
function ElementObjective:save(data)
	data.enabled = self._values.enabled
	data.amount = self._values.amount

	return 
end
function ElementObjective:load(data)
	self._values.enabled = data.enabled
	self._values.amount = data.amount

	return 
end

return 
