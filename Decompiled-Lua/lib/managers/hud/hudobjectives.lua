HUDObjectives = HUDObjectives or class()
HUDObjectives.W = 672
HUDObjectives.H = 366
HUDObjectives.OBJECTIVES_PADDING = 16
HUDObjectives.OBJECTIVE_DESCRIPTION_PADDING = 10
function HUDObjectives:init(panel)
	slot5 = panel

	self._create_panel(slot3, self)

	slot4 = self

	self._clear_objectives(slot3)

	return 
end
function HUDObjectives:_create_panel(panel)
	local panel_params = {
		name = "objectives",
		halign = "right",
		valign = "top",
		w = HUDObjectives.W,
		h = HUDObjectives.H
	}
	slot6 = panel_params
	self._object = panel.panel(slot4, panel)

	return 
end
function HUDObjectives:set_x(x)
	slot5 = x

	self._object.set_x(slot3, self._object)

	return 
end
function HUDObjectives:set_y(y)
	slot5 = y

	self._object.set_y(slot3, self._object)

	return 
end
function HUDObjectives:w()
	slot3 = self._object

	return self._object.w(slot2)
end
function HUDObjectives:h()
	slot3 = self._object

	return self._object.h(slot2)
end
function HUDObjectives:show()
	slot3 = self

	self._animate_show(slot2)

	return 
end
function HUDObjectives:hide()
	return 
end
function HUDObjectives:render_objective()
	slot4 = self._active_objective_id
	local active_objective = managers.objectives.get_objective(slot2, managers.objectives)

	if not active_objective then
		slot5 = "No active objective"

		Application.error(slot3, Application)

		return 
	end

	slot4 = self

	self._clear_objectives(slot3)

	slot6 = active_objective
	self._main_objective = HUDObjectiveMain.new(slot3, HUDObjectiveMain, self._object)
	slot5 = self._main_objective
	local y = self._main_objective.y(slot3) + self._main_objective.h(self._main_objective)

	if self._show_objective_descriptions and active_objective.description then
		y = y + HUDObjectives.OBJECTIVE_DESCRIPTION_PADDING
		self._main_objective_description = HUDObjectiveDescription.new(slot4, HUDObjectiveDescription, self._object)
		slot9 = self._main_objective_description
		slot6 = self._object.w(active_objective) - self._main_objective_description.w(self._object)

		self._main_objective_description.set_x(slot4, self._main_objective_description)

		slot6 = y

		self._main_objective_description.set_y(slot4, self._main_objective_description)

		slot5 = self._main_objective_description
		y = y + self._main_objective_description.h(slot4) + HUDObjectives.OBJECTIVE_DESCRIPTION_PADDING
	end

	if active_objective.sub_objectives then
		local y = y + HUDObjectives.OBJECTIVES_PADDING
		slot6 = active_objective.sub_objectives

		for index, sub_objective in pairs(slot5) do
			slot13 = sub_objective
			local single_sub_objective = HUDObjectiveSub.new(slot10, HUDObjectiveSub, self._object)
			slot13 = y

			single_sub_objective.set_y(HUDObjectiveSub, single_sub_objective)

			slot13 = single_sub_objective

			table.insert(HUDObjectiveSub, self._sub_objectives)

			slot12 = single_sub_objective
			y = y + single_sub_objective.h(HUDObjectiveSub)

			if self._show_objective_descriptions and sub_objective.description then
				y = y + HUDObjectives.OBJECTIVE_DESCRIPTION_PADDING
				slot14 = sub_objective
				local sub_objective_description = HUDObjectiveDescription.new(slot11, HUDObjectiveDescription, self._object)
				slot17 = sub_objective_description
				slot14 = self._object.w(slot15) - sub_objective_description.w(self._object)

				sub_objective_description.set_x(HUDObjectiveDescription, sub_objective_description)

				slot14 = y

				sub_objective_description.set_y(HUDObjectiveDescription, sub_objective_description)

				slot14 = sub_objective_description

				table.insert(HUDObjectiveDescription, self._objective_descriptions)

				slot13 = sub_objective_description
				y = y + sub_objective_description.h(HUDObjectiveDescription) + HUDObjectives.OBJECTIVE_DESCRIPTION_PADDING
			end

			y = y + HUDObjectives.OBJECTIVES_PADDING
		end
	end

	return 
end
function HUDObjectives:update_objectives()
	return 
end
function HUDObjectives:activate_objective(data)
	self._active_objective_id = data.id
	slot4 = self

	self.render_objective(slot3)

	return 
end
function HUDObjectives:remind_objective(id)
	slot4 = self

	self._animate_hide(slot3)

	return 
end
function HUDObjectives:remind_sub_objective(id)
	return 
end
function HUDObjectives:complete_objective(data)
	slot4 = self

	self._animate_hide(slot3)

	return 
end
function HUDObjectives:complete_sub_objective(data)
	for i = 1, #self._sub_objectives, 1 do
		slot8 = self._sub_objectives[i]

		if self._sub_objectives[i].id(slot7) == data.sub_id then
			slot8 = self._sub_objectives[i]

			self._sub_objectives[i].complete(slot7)
		end
	end

	return 
end
function HUDObjectives:update_amount_objective(data)
	slot4 = self._main_objective

	if self._main_objective.id(slot3) == data.id then
		slot5 = data.current_amount

		self._main_objective.set_current_amount(slot3, self._main_objective)
	end

	return 
end
function HUDObjectives:update_amount_sub_objective(data)
	for i = 1, #self._sub_objectives, 1 do
		slot8 = self._sub_objectives[i]

		if self._sub_objectives[i].id(slot7) == data.sub_id then
			slot9 = data.current_amount

			self._sub_objectives[i].set_current_amount(slot7, self._sub_objectives[i])
		end
	end

	return 
end
function HUDObjectives:open_right_done(uses_amount)
	return 
end
function HUDObjectives:show_timer()
	slot3 = self._main_objective

	self._main_objective.show_timer(slot2)

	return 
end
function HUDObjectives:hide_timer()
	slot3 = self._main_objective

	self._main_objective.hide_timer(slot2)

	return 
end
function HUDObjectives:set_timer_value(current, total)
	slot7 = total

	self._main_objective.set_timer_value(slot4, self._main_objective, current)

	return 
end
function HUDObjectives:_clear_objectives()
	slot3 = self._object

	self._object.clear(slot2)

	self._main_objective = nil
	self._main_objective_description = nil
	self._sub_objectives = {}
	self._objective_descriptions = {}

	return 
end
function HUDObjectives:clean_up()
	self._active_objective_id = nil
	slot4 = "[HUDObjectives:render_objective]"

	if managers.queued_tasks.has_task(slot2, managers.queued_tasks) then
		slot4 = "[HUDObjectives:render_objective]"

		managers.queued_tasks.unqueue(slot2, managers.queued_tasks)
	end

	return 
end
function HUDObjectives:_animate_show()
	local delay = 0
	local delay_step = 0.1

	if self._main_objective then
		slot6 = delay

		self._main_objective.animate_show(slot4, self._main_objective)

		if self._main_objective_description then
			slot6 = delay

			self._main_objective_description.animate_show(slot4, self._main_objective_description)
		end

		delay = delay + delay_step
	end

	slot5 = self._sub_objectives

	for index, sub_objective in pairs(slot4) do
		slot11 = delay

		sub_objective.animate_show(slot9, sub_objective)

		if self._objective_descriptions[index] then
			slot11 = delay

			self._objective_descriptions[index].animate_show(slot9, self._objective_descriptions[index])
		end

		delay = delay + delay_step
	end

	return 
end
function HUDObjectives:_animate_hide()
	local delay = 0
	local delay_step = 0.1

	for i = #self._sub_objectives, 1, -1 do
		slot10 = delay

		self._sub_objectives[i].animate_hide(slot8, self._sub_objectives[i])

		if self._objective_descriptions[i] then
			slot10 = delay

			self._objective_descriptions[i].animate_hide(slot8, self._objective_descriptions[i])
		end

		delay = delay + delay_step
	end

	if self._main_objective then
		slot6 = delay

		self._main_objective.animate_hide(slot4, self._main_objective)
	end

	if self._main_objective_description then
		slot6 = delay

		self._main_objective_description.animate_hide(slot4, self._main_objective_description)
	end

	return 
end

return 
