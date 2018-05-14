if not InstigatorUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

InstigatorUnitElement = slot0
InstigatorUnitElement.SAVE_UNIT_POSITION = false
InstigatorUnitElement.SAVE_UNIT_ROTATION = false
function InstigatorUnitElement:init(unit)
	slot5 = unit

	InstigatorUnitElement.super.init(slot3, self)

	return 
end
function InstigatorUnitElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot6 = "This element is a storage for an instigator. It can be used, set, etc from logic_instigator_operator."

	self._add_help_text(slot4, self)

	return 
end

if not InstigatorOperatorUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

InstigatorOperatorUnitElement = slot0
InstigatorOperatorUnitElement.SAVE_UNIT_POSITION = false
InstigatorOperatorUnitElement.SAVE_UNIT_ROTATION = false
function InstigatorOperatorUnitElement:init(unit)
	slot5 = unit

	InstigatorOperatorUnitElement.super.init(slot3, self)

	self._hed.elements = {}
	self._hed.operation = "none"
	self._hed.keep_on_use = false
	slot5 = "elements"

	table.insert(false, self._save_values)

	slot5 = "operation"

	table.insert(false, self._save_values)

	slot5 = "keep_on_use"

	table.insert(false, self._save_values)

	return 
end
function InstigatorOperatorUnitElement:draw_links(t, dt, selected_unit, all_units)
	slot10 = selected_unit

	InstigatorOperatorUnitElement.super.draw_links(slot6, self, t, dt)

	slot7 = self._hed.elements

	for _, id in ipairs(slot6) do
		local unit = all_units[id]
		local draw = not selected_unit or unit == selected_unit or self._unit == selected_unit

		if draw then
			slot15 = {
				g = 0.85,
				b = 0.25,
				r = 0.85,
				from_unit = self._unit,
				to_unit = unit
			}

			self._draw_link(slot13, self)
		end
	end

	return 
end
function InstigatorOperatorUnitElement:get_links_to_unit(...)
	slot3 = self

	InstigatorOperatorUnitElement.super.get_links_to_unit(slot2, ...)

	slot5 = "operator"

	self._get_links_of_type_from_elements(slot2, self, self._hed.elements, ...)

	return 
end
function InstigatorOperatorUnitElement:update_editing()
	return 
end
function InstigatorOperatorUnitElement:add_element()
	slot4 = {
		ray_type = "editor",
		mask = 10
	}
	local ray = managers.editor.unit_by_raycast(slot2, managers.editor)

	if ray and ray.unit then
		slot5 = "units/dev_tools/mission_elements/logic_instigator/logic_instigator"

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
function InstigatorOperatorUnitElement:remove_links(unit)
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
function InstigatorOperatorUnitElement:add_triggers(vc)
	slot5 = Idstring(slot6)
	slot10 = "add_element"

	vc.add_trigger(slot3, vc, callback("lmb", self, self))

	return 
end
function InstigatorOperatorUnitElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	local exact_names = {
		"units/dev_tools/mission_elements/logic_instigator/logic_instigator"
	}
	slot11 = exact_names

	self._build_add_remove_unit_from_list(slot5, self, panel, panel_sizer, self._hed.elements, nil)

	slot11 = "Select an operation for the selected elements"

	self._build_value_combobox(slot5, self, panel, panel_sizer, "operation", {
		"none",
		"set",
		"clear",
		"add_first",
		"add_last",
		"use_first",
		"use_last",
		"use_random",
		"use_all"
	})

	slot9 = "keep_on_use"

	self._build_value_checkbox(slot5, self, panel, panel_sizer)

	slot7 = "This element is an operator to logic_instigator element."

	self._add_help_text(slot5, self)

	return 
end

if not InstigatorTriggerUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

InstigatorTriggerUnitElement = slot0
InstigatorTriggerUnitElement.SAVE_UNIT_POSITION = false
InstigatorTriggerUnitElement.SAVE_UNIT_ROTATION = false
function InstigatorTriggerUnitElement:init(unit)
	slot5 = unit

	InstigatorTriggerUnitElement.super.init(slot3, self)

	self._hed.trigger_type = "set"
	self._hed.elements = {}
	slot5 = "trigger_type"

	table.insert(, self._save_values)

	slot5 = "elements"

	table.insert(, self._save_values)

	return 
end
function InstigatorTriggerUnitElement:draw_links(t, dt, selected_unit, all_units)
	slot10 = selected_unit

	InstigatorTriggerUnitElement.super.draw_links(slot6, self, t, dt)

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
function InstigatorTriggerUnitElement:get_links_to_unit(...)
	slot3 = self

	InstigatorTriggerUnitElement.super.get_links_to_unit(slot2, ...)

	slot5 = "trigger"

	self._get_links_of_type_from_elements(slot2, self, self._hed.elements, ...)

	return 
end
function InstigatorTriggerUnitElement:update_editing()
	return 
end
function InstigatorTriggerUnitElement:add_element()
	slot4 = {
		ray_type = "editor",
		mask = 10
	}
	local ray = managers.editor.unit_by_raycast(slot2, managers.editor)

	if ray and ray.unit then
		slot5 = "units/dev_tools/mission_elements/logic_instigator/logic_instigator"

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
function InstigatorTriggerUnitElement:remove_links(unit)
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
function InstigatorTriggerUnitElement:add_triggers(vc)
	slot5 = Idstring(slot6)
	slot10 = "add_element"

	vc.add_trigger(slot3, vc, callback("lmb", self, self))

	return 
end
function InstigatorTriggerUnitElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	local exact_names = {
		"units/dev_tools/mission_elements/logic_instigator/logic_instigator"
	}
	slot11 = exact_names

	self._build_add_remove_unit_from_list(slot5, self, panel, panel_sizer, self._hed.elements, nil)

	slot11 = "Select a trigger type for the selected elements"

	self._build_value_combobox(slot5, self, panel, panel_sizer, "trigger_type", {
		"death",
		"set",
		"changed",
		"cleared"
	})

	slot7 = "This element is a trigger to logic_instigator element."

	self._add_help_text(slot5, self)

	return 
end

return 
