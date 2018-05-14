-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not ObjectiveUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

ObjectiveUnitElement = slot0
ObjectiveUnitElement.INSTANCE_VAR_NAMES = {
	{
		value = "objective",
		type = "objective"
	},
	{
		value = "amount",
		type = "number"
	}
}
function ObjectiveUnitElement:init(unit)
	slot5 = unit

	ObjectiveUnitElement.super.init(slot3, self)

	self._hed.state = "complete_and_activate"
	self._hed.objective = "none"
	self._hed.sub_objective = "none"
	self._hed.amount = 0
	self._hed.elements = {}
	slot5 = "state"

	table.insert(, self._save_values)

	slot5 = "objective"

	table.insert(, self._save_values)

	slot5 = "sub_objective"

	table.insert(, self._save_values)

	slot5 = "amount"

	table.insert(, self._save_values)

	slot5 = "elements"

	table.insert(, self._save_values)

	return 
end
function ObjectiveUnitElement:draw_links(t, dt, selected_unit, all_units)
	slot10 = selected_unit

	ObjectiveUnitElement.super.draw_links(slot6, self, t, dt)

	slot7 = self._hed.elements

	for _, id in ipairs(slot6) do
		local unit = all_units[id]
		local draw = not selected_unit or unit == selected_unit or self._unit == selected_unit

		if draw then
			slot15 = {
				g = 0.85,
				b = 0.25,
				r = 0.85,
				from_unit = unit,
				to_unit = self._unit
			}

			self._draw_link(slot13, self)
		end
	end

	return 
end
function ObjectiveUnitElement:get_links_to_unit(...)
	slot3 = self

	ObjectiveUnitElement.super.get_links_to_unit(slot2, ...)

	slot5 = "trigger"

	self._get_links_of_type_from_elements(slot2, self, self._hed.elements, ...)

	return 
end
function ObjectiveUnitElement:update_editing()
	return 
end
function ObjectiveUnitElement:add_element()
	slot4 = {
		ray_type = "editor",
		mask = 10
	}
	local ray = managers.editor.unit_by_raycast(slot2, managers.editor)

	if ray and ray.unit then
		slot5 = "core/units/mission_elements/logic_counter/logic_counter"

		if ray.unit.name(slot3) == Idstring(ray.unit) then
			local id = ray.unit.unit_data(slot3).unit_id
			slot6 = id

			if table.contains(ray.unit, self._hed.elements) then
				slot6 = id

				table.delete(slot4, self._hed.elements)
			else
				slot6 = id

				table.insert(slot4, self._hed.elements)
			end
		end
	end

	return 
end
function ObjectiveUnitElement:remove_links(unit)
	slot4 = self._hed.elements

	for _, id in ipairs(slot3) do
		slot9 = unit

		if id == unit.unit_data(slot8).unit_id then
			slot10 = id

			table.delete(slot8, self._hed.elements)
		end
	end

	return 
end
function ObjectiveUnitElement:add_triggers(vc)
	slot5 = Idstring(slot6)
	slot10 = "add_element"

	vc.add_trigger(slot3, vc, callback("lmb", self, self))

	return 
end
function ObjectiveUnitElement:update_sub_objectives()
	slot3 = {
		"none"
	}
	slot7 = self._hed.objective
	local sub_objectives = table.list_add(slot2, managers.objectives.sub_objectives_by_name(slot5, managers.objectives))
	self._hed.sub_objective = "none"
	slot5 = sub_objectives

	CoreEws.update_combobox_options("none", self._sub_objective_params)

	slot5 = self._hed.sub_objective

	CoreEws.change_combobox_value("none", self._sub_objective_params)

	return 
end
function ObjectiveUnitElement:set_element_data(params, ...)
	slot5 = params

	ObjectiveUnitElement.super.set_element_data(slot3, self, ...)

	if params.value == "objective" then
		slot4 = self

		self.update_sub_objectives(slot3)
	end

	return 
end
function ObjectiveUnitElement:_build_panel(panel, panel_sizer)

	-- Decompilation error in this vicinity:
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot9 = {
		"activate",
		"complete",
		"update",
		"remove",
		"complete_and_activate",
		"remove_and_activate",
		"set_objective_current_amount",
		"set_sub_objective_amount",
		"set_sub_objective_current_amount"
	}

	self._build_value_combobox(slot4, self, panel, panel_sizer, "state")

	slot8 = "objective"
	slot11 = {
		"none"
	}
	slot14 = managers.objectives

	self._build_value_combobox(slot4, self, panel, panel_sizer, table.list_add(slot10, managers.objectives.objectives_by_name(slot13)))

	slot13 = options
	slot11 = "Select a sub objective from the combobox (if availible)"
	local _, params = self._build_value_combobox(slot5, self, panel, panel_sizer, "sub_objective", table.list_add(slot11, {
		"none"
	}))
	self._sub_objective_params = params
	slot13 = "Overrides objective amount counter with this value."

	self._build_value_number(panel, self, panel, panel_sizer, "amount", {
		min = 0,
		floats = 0,
		max = 100
	})

	local help = {
		panel = panel,
		sizer = panel_sizer,
		text = "State complete_and_activate will complete any previous objective and activate the selected objective. Note that it might not function well with objectives using amount"
	}
	slot10 = help

	self.add_help_text(self, self)

	return 
end

return 
