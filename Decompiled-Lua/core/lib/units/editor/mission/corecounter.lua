if not CoreCounterUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

CoreCounterUnitElement = slot0
CoreCounterUnitElement.SAVE_UNIT_POSITION = false
CoreCounterUnitElement.SAVE_UNIT_ROTATION = false
CoreCounterUnitElement.INSTANCE_VAR_NAMES = {
	{
		value = "counter_target",
		type = "number"
	}
}

if not CounterUnitElement then
	slot2 = CoreCounterUnitElement
	slot0 = class(slot1)
end

CounterUnitElement = slot0
function CounterUnitElement:init(...)
	slot3 = self

	CoreCounterUnitElement.init(slot2, ...)

	return 
end
function CoreCounterUnitElement:init(unit)
	slot5 = unit

	MissionElement.init(slot3, self)

	self._digital_gui_units = {}
	self._hed.counter_target = 0
	self._hed.digital_gui_unit_ids = {}
	self._hed.output_monitor_id = nil
	slot5 = "output_monitor_id"

	table.insert(nil, self._save_values)

	slot5 = "counter_target"

	table.insert(nil, self._save_values)

	slot5 = "digital_gui_unit_ids"

	table.insert(nil, self._save_values)

	return 
end
function CoreCounterUnitElement:layer_finished()
	slot3 = self

	MissionElement.layer_finished(slot2)

	slot3 = self._hed.digital_gui_unit_ids

	for _, id in pairs(slot2) do
		slot9 = id
		slot14 = "load_unit"
		local unit = managers.worlddefinition.get_unit_on_load(slot7, managers.worlddefinition, callback(slot11, self, self))

		if unit then
			slot10 = unit
			self._digital_gui_units[unit.unit_data(slot9).unit_id] = unit
		end
	end

	return 
end
function CoreCounterUnitElement:load_unit(unit)
	if unit then
		slot5 = unit
		self._digital_gui_units[unit.unit_data(slot4).unit_id] = unit
	end

	return 
end
function CoreCounterUnitElement:update_selected()
	slot3 = self._hed.digital_gui_unit_ids

	for _, id in pairs(slot2) do
		slot8 = self._digital_gui_units[id]

		if not alive(slot7) then
			slot9 = id

			table.delete(slot7, self._hed.digital_gui_unit_ids)

			self._digital_gui_units[id] = nil
		end
	end

	slot3 = self._digital_gui_units

	for id, unit in pairs(slot2) do
		slot8 = unit

		if not alive(slot7) then
			slot9 = id

			table.delete(slot7, self._hed.digital_gui_unit_ids)

			self._digital_gui_units[id] = nil
		else
			local params = {
				g = 1,
				b = 0,
				r = 0,
				from_unit = self._unit,
				to_unit = unit
			}
			slot10 = params

			self._draw_link(slot8, self)

			slot13 = 0

			Application.draw(slot8, Application, unit, 0, 1)
		end
	end

	return 
end
function CoreCounterUnitElement:update_unselected(t, dt, selected_unit, all_units)
	slot7 = self._hed.digital_gui_unit_ids

	for _, id in pairs(slot6) do
		slot12 = self._digital_gui_units[id]

		if not alive(slot11) then
			slot13 = id

			table.delete(slot11, self._hed.digital_gui_unit_ids)

			self._digital_gui_units[id] = nil
		end
	end

	slot7 = self._digital_gui_units

	for id, unit in pairs(slot6) do
		slot12 = unit

		if not alive(slot11) then
			slot13 = id

			table.delete(slot11, self._hed.digital_gui_unit_ids)

			self._digital_gui_units[id] = nil
		end
	end

	return 
end
function CoreCounterUnitElement:draw_links_unselected(...)
	slot3 = self

	CoreCounterUnitElement.super.draw_links_unselected(slot2, ...)

	slot3 = self._digital_gui_units

	for id, unit in pairs(slot2) do
		local params = {
			g = 0.5,
			b = 0,
			r = 0,
			from_unit = self._unit,
			to_unit = unit
		}
		slot10 = params

		self._draw_link(slot8, self)

		slot13 = 0

		Application.draw(slot8, Application, unit, 0, 0.5)
	end

	return 
end
function CoreCounterUnitElement:update_editing()
	slot4 = {
		ray_type = "body editor",
		sample = true,
		mask = managers.slot.get_mask(slot6, managers.slot)
	}
	slot8 = "all"
	local ray = managers.editor.unit_by_raycast(slot2, managers.editor)

	if ray and ray.unit then
		slot4 = ray.unit

		if ray.unit.digital_gui(slot3) then
			slot4 = ray.unit
			slot4 = ray.unit.digital_gui(slot3)

			if ray.unit.digital_gui(slot3).is_number(slot3) then
				slot8 = 0

				Application.draw(slot3, Application, ray.unit, 0, 1)
			end
		end
	end

	return 
end
function CoreCounterUnitElement:select_unit()
	slot4 = {
		ray_type = "body editor",
		sample = true,
		mask = managers.slot.get_mask(slot6, managers.slot)
	}
	slot8 = "all"
	local ray = managers.editor.unit_by_raycast(slot2, managers.editor)

	if ray and ray.unit then
		slot4 = ray.unit

		if ray.unit.digital_gui(slot3) then
			slot4 = ray.unit
			slot4 = ray.unit.digital_gui(slot3)

			if ray.unit.digital_gui(slot3).is_number(slot3) then
				local unit = ray.unit
				slot6 = unit

				if self._digital_gui_units[unit.unit_data(slot5).unit_id] then
					slot6 = unit

					self._remove_unit(slot4, self)
				else
					slot6 = unit

					self._add_unit(slot4, self)
				end
			end
		end
	end

	return 
end
function CoreCounterUnitElement:_remove_unit(unit)
	slot5 = unit
	self._digital_gui_units[unit.unit_data(slot4).unit_id] = nil
	slot7 = unit
	slot5 = unit.unit_data(slot6).unit_id

	table.delete(unit.unit_data(slot4).unit_id, self._hed.digital_gui_unit_ids)

	return 
end
function CoreCounterUnitElement:_add_unit(unit)
	slot5 = unit
	self._digital_gui_units[unit.unit_data(slot4).unit_id] = unit
	slot7 = unit
	slot5 = unit.unit_data(slot6).unit_id

	table.insert(unit.unit_data(slot4).unit_id, self._hed.digital_gui_unit_ids)

	return 
end
function CoreCounterUnitElement:add_triggers(vc)
	slot5 = Idstring(slot6)
	slot10 = "select_unit"

	vc.add_trigger(slot3, vc, callback("lmb", self, self))

	return 
end
function CoreCounterUnitElement:_add_unit_filter(unit)
	slot5 = unit

	if self._digital_gui_units[unit.unit_data(slot4).unit_id] then
		return false
	end

	slot4 = unit

	if unit.digital_gui(slot3) then
		slot4 = unit
		slot4 = unit.digital_gui(slot3)
		slot2 = unit.digital_gui(slot3).is_number(slot3)
	end

	return slot2
end
function CoreCounterUnitElement:_remove_unit_filter(unit)
	slot5 = unit

	return self._digital_gui_units[unit.unit_data(slot4).unit_id]
end
function CoreCounterUnitElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot8 = {
		add_filter = callback(slot10, self, self),
		add_result = callback(slot10, self, self),
		remove_filter = callback(slot10, self, self),
		remove_result = callback(slot10, self, self)
	}
	slot13 = "_add_unit_filter"
	slot13 = "_add_unit"
	slot13 = "_remove_unit_filter"
	slot13 = "_remove_unit"

	self._build_add_remove_static_unit_from_list(slot4, self, panel, panel_sizer)

	slot10 = "Specifies how many times the counter should be executed before running its on executed"

	self._build_value_number(slot4, self, panel, panel_sizer, "counter_target", {
		floats = 0,
		min = 0
	})

	slot6 = "Units with number gui extension can have their value updated from a counter."

	self._add_help_text(slot4, self)

	return 
end
function CoreCounterUnitElement:register_debug_output_unit(output_monitor_id)
	self._hed.output_monitor_id = output_monitor_id

	return 
end
function CoreCounterUnitElement:unregister_debug_output_unit()
	self._hed.output_monitor_id = nil

	return 
end

if not CoreCounterOperatorUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

CoreCounterOperatorUnitElement = slot0
CoreCounterOperatorUnitElement.SAVE_UNIT_POSITION = false
CoreCounterOperatorUnitElement.SAVE_UNIT_ROTATION = false
CoreCounterOperatorUnitElement.INSTANCE_VAR_NAMES = {
	{
		value = "amount",
		type = "number"
	}
}

if not CounterOperatorUnitElement then
	slot2 = CoreCounterOperatorUnitElement
	slot0 = class(slot1)
end

CounterOperatorUnitElement = slot0
function CounterOperatorUnitElement:init(...)
	slot3 = self

	CounterOperatorUnitElement.super.init(slot2, ...)

	return 
end
function CoreCounterOperatorUnitElement:init(unit)
	slot5 = unit

	CoreCounterOperatorUnitElement.super.init(slot3, self)

	self._hed.operation = "none"
	self._hed.amount = 0
	self._hed.elements = {}
	slot5 = "operation"

	table.insert(, self._save_values)

	slot5 = "amount"

	table.insert(, self._save_values)

	slot5 = "elements"

	table.insert(, self._save_values)

	return 
end
function CoreCounterOperatorUnitElement:draw_links(t, dt, selected_unit, all_units)
	slot10 = selected_unit

	CoreCounterOperatorUnitElement.super.draw_links(slot6, self, t, dt)

	slot7 = self._hed.elements

	for _, id in ipairs(slot6) do
		local unit = all_units[id]
		local draw = not selected_unit or unit == selected_unit or self._unit == selected_unit

		if draw then
			slot15 = {
				g = 0.75,
				b = 0.25,
				r = 0.75,
				from_unit = self._unit,
				to_unit = unit
			}

			self._draw_link(slot13, self)
		end
	end

	return 
end
function CoreCounterOperatorUnitElement:get_links_to_unit(...)
	slot3 = self

	CoreCounterOperatorUnitElement.super.get_links_to_unit(slot2, ...)

	slot5 = "operator"

	self._get_links_of_type_from_elements(slot2, self, self._hed.elements, ...)

	return 
end
function CoreCounterOperatorUnitElement:update_editing()
	return 
end
function CoreCounterOperatorUnitElement:add_element()
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
function CoreCounterOperatorUnitElement:remove_links(unit)
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
function CoreCounterOperatorUnitElement:add_triggers(vc)
	slot5 = Idstring(slot6)
	slot10 = "add_element"

	vc.add_trigger(slot3, vc, callback("lmb", self, self))

	return 
end
function CoreCounterOperatorUnitElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	local names = {
		"logic_counter/logic_counter"
	}
	slot10 = names

	self._build_add_remove_unit_from_list(slot5, self, panel, panel_sizer, self._hed.elements)

	slot11 = "Select an operation for the selected elements"

	self._build_value_combobox(slot5, self, panel, panel_sizer, "operation", {
		"none",
		"add",
		"subtract",
		"reset",
		"set"
	})

	slot11 = "Amount to add, subtract or set to the counters."

	self._build_value_number(slot5, self, panel, panel_sizer, "amount", {
		floats = 0,
		min = 0
	})

	slot7 = "This element can modify logic_counter element. Select counters to modify using insert and clicking on the elements."

	self._add_help_text(slot5, self)

	return 
end

if not CoreCounterTriggerUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

CoreCounterTriggerUnitElement = slot0
CoreCounterTriggerUnitElement.SAVE_UNIT_POSITION = false
CoreCounterTriggerUnitElement.SAVE_UNIT_ROTATION = false

if not CounterTriggerUnitElement then
	slot2 = CoreCounterTriggerUnitElement
	slot0 = class(slot1)
end

CounterTriggerUnitElement = slot0
function CounterTriggerUnitElement:init(...)
	slot3 = self

	CounterTriggerUnitElement.super.init(slot2, ...)

	return 
end
function CoreCounterTriggerUnitElement:init(unit)
	slot5 = unit

	CoreCounterTriggerUnitElement.super.init(slot3, self)

	self._hed.trigger_type = "value"
	self._hed.amount = 0
	self._hed.elements = {}
	slot5 = "trigger_type"

	table.insert(, self._save_values)

	slot5 = "amount"

	table.insert(, self._save_values)

	slot5 = "elements"

	table.insert(, self._save_values)

	return 
end
function CoreCounterTriggerUnitElement:draw_links(t, dt, selected_unit, all_units)
	slot10 = selected_unit

	CoreCounterTriggerUnitElement.super.draw_links(slot6, self, t, dt)

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
function CoreCounterTriggerUnitElement:get_links_to_unit(...)
	slot3 = self

	CoreCounterTriggerUnitElement.super.get_links_to_unit(slot2, ...)

	slot5 = "trigger"

	self._get_links_of_type_from_elements(slot2, self, self._hed.elements, ...)

	return 
end
function CoreCounterTriggerUnitElement:update_editing()
	return 
end
function CoreCounterTriggerUnitElement:add_element()
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
function CoreCounterTriggerUnitElement:remove_links(unit)
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
function CoreCounterTriggerUnitElement:add_triggers(vc)
	slot5 = Idstring(slot6)
	slot10 = "add_element"

	vc.add_trigger(slot3, vc, callback("lmb", self, self))

	return 
end
function CoreCounterTriggerUnitElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	local names = {
		"logic_counter/logic_counter"
	}
	slot10 = names

	self._build_add_remove_unit_from_list(slot5, self, panel, panel_sizer, self._hed.elements)

	slot11 = "Select a trigger type for the selected elements"

	self._build_value_combobox(slot5, self, panel, panel_sizer, "trigger_type", {
		"none",
		"value",
		"add",
		"subtract",
		"reset",
		"set"
	})

	slot11 = "Specify value to trigger on."

	self._build_value_number(slot5, self, panel, panel_sizer, "amount", {
		floats = 0
	})

	slot7 = "This element is a trigger to logic_counter element."

	self._add_help_text(slot5, self)

	return 
end

if not CoreCounterFilterUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

CoreCounterFilterUnitElement = slot0
CoreCounterFilterUnitElement.SAVE_UNIT_POSITION = false
CoreCounterFilterUnitElement.SAVE_UNIT_ROTATION = false

if not CounterFilterUnitElement then
	slot2 = CoreCounterFilterUnitElement
	slot0 = class(slot1)
end

CounterFilterUnitElement = slot0
function CounterFilterUnitElement:init(...)
	slot3 = self

	CounterFilterUnitElement.super.init(slot2, ...)

	return 
end
function CoreCounterFilterUnitElement:init(unit)
	slot5 = unit

	CoreCounterFilterUnitElement.super.init(slot3, self)

	self._hed.needed_to_execute = "all"
	self._hed.value = 0
	self._hed.elements = {}
	self._hed.check_type = "equal"
	slot5 = "needed_to_execute"

	table.insert("equal", self._save_values)

	slot5 = "value"

	table.insert("equal", self._save_values)

	slot5 = "elements"

	table.insert("equal", self._save_values)

	slot5 = "check_type"

	table.insert("equal", self._save_values)

	return 
end
function CoreCounterFilterUnitElement:draw_links(t, dt, selected_unit, all_units)
	slot10 = selected_unit

	CoreCounterFilterUnitElement.super.draw_links(slot6, self, t, dt)

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
function CoreCounterFilterUnitElement:get_links_to_unit(...)
	slot3 = self

	CoreCounterFilterUnitElement.super.get_links_to_unit(slot2, ...)

	slot5 = "filter"

	self._get_links_of_type_from_elements(slot2, self, self._hed.elements, ...)

	return 
end
function CoreCounterFilterUnitElement:update_editing()
	return 
end
function CoreCounterFilterUnitElement:add_element()
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
function CoreCounterFilterUnitElement:remove_links(unit)
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
function CoreCounterFilterUnitElement:add_triggers(vc)
	slot5 = Idstring(slot6)
	slot10 = "add_element"

	vc.add_trigger(slot3, vc, callback("lmb", self, self))

	return 
end
function CoreCounterFilterUnitElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	local names = {
		"logic_counter/logic_counter"
	}
	slot10 = names

	self._build_add_remove_unit_from_list(slot5, self, panel, panel_sizer, self._hed.elements)

	slot11 = "Select how many elements are needed to execute"

	self._build_value_combobox(slot5, self, panel, panel_sizer, "needed_to_execute", {
		"all",
		"any"
	})

	slot11 = "Specify value to trigger on."

	self._build_value_number(slot5, self, panel, panel_sizer, "value", {
		floats = 0
	})

	slot11 = "Select which check operation to perform"

	self._build_value_combobox(slot5, self, panel, panel_sizer, "check_type", {
		"equal",
		"less_than",
		"greater_than",
		"less_or_equal",
		"greater_or_equal",
		"counters_equal",
		"counters_not_equal"
	})

	slot7 = "This element is a filter to logic_counter element."

	self._add_help_text(slot5, self)

	return 
end

return 
