-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not CoreTimerUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

CoreTimerUnitElement = slot0
CoreTimerUnitElement.SAVE_UNIT_POSITION = false
CoreTimerUnitElement.SAVE_UNIT_ROTATION = false
CoreTimerUnitElement.INSTANCE_VAR_NAMES = {
	{
		value = "timer",
		type = "number"
	}
}

if not TimerUnitElement then
	slot2 = CoreTimerUnitElement
	slot0 = class(slot1)
end

TimerUnitElement = slot0
function TimerUnitElement:init(...)
	slot3 = self

	TimerUnitElement.super.init(slot2, ...)

	return 
end
function CoreTimerUnitElement:init(unit)
	slot5 = unit

	CoreTimerUnitElement.super.init(slot3, self)

	self._digital_gui_units = {}
	self._hed.timer = 0
	self._hed.digital_gui_unit_ids = {}
	self._hed.output_monitor_id = nil
	slot5 = "output_monitor_id"

	table.insert(nil, self._save_values)

	slot5 = "timer"

	table.insert(nil, self._save_values)

	slot5 = "digital_gui_unit_ids"

	table.insert(nil, self._save_values)

	return 
end
function CoreTimerUnitElement:layer_finished()
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
function CoreTimerUnitElement:load_unit(unit)
	if unit then
		slot5 = unit
		self._digital_gui_units[unit.unit_data(slot4).unit_id] = unit
	end

	return 
end
function CoreTimerUnitElement:update_selected()
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
function CoreTimerUnitElement:update_unselected(t, dt, selected_unit, all_units)
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
function CoreTimerUnitElement:draw_links_unselected(...)
	slot3 = self

	CoreTimerUnitElement.super.draw_links_unselected(slot2, ...)

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
function CoreTimerUnitElement:update_editing()
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

			if ray.unit.digital_gui(slot3).is_timer(slot3) then
				slot8 = 0

				Application.draw(slot3, Application, ray.unit, 0, 1)
			end
		end
	end

	return 
end
function CoreTimerUnitElement:select_unit()
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

			if ray.unit.digital_gui(slot3).is_timer(slot3) then
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
function CoreTimerUnitElement:_remove_unit(unit)
	slot5 = unit
	self._digital_gui_units[unit.unit_data(slot4).unit_id] = nil
	slot7 = unit
	slot5 = unit.unit_data(slot6).unit_id

	table.delete(unit.unit_data(slot4).unit_id, self._hed.digital_gui_unit_ids)

	return 
end
function CoreTimerUnitElement:_add_unit(unit)
	slot5 = unit
	self._digital_gui_units[unit.unit_data(slot4).unit_id] = unit
	slot7 = unit
	slot5 = unit.unit_data(slot6).unit_id

	table.insert(unit.unit_data(slot4).unit_id, self._hed.digital_gui_unit_ids)

	return 
end
function CoreTimerUnitElement:add_triggers(vc)
	slot5 = Idstring(slot6)
	slot10 = "select_unit"

	vc.add_trigger(slot3, vc, callback("lmb", self, self))

	return 
end
function CoreTimerUnitElement:_add_unit_filter(unit)
	slot5 = unit

	if self._digital_gui_units[unit.unit_data(slot4).unit_id] then
		return false
	end

	slot4 = unit

	if unit.digital_gui(slot3) then
		slot4 = unit
		slot4 = unit.digital_gui(slot3)
		slot2 = unit.digital_gui(slot3).is_timer(slot3)
	end

	return slot2
end
function CoreTimerUnitElement:_remove_unit_filter(unit)
	slot5 = unit

	return self._digital_gui_units[unit.unit_data(slot4).unit_id]
end
function CoreTimerUnitElement:_build_panel(panel, panel_sizer)
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

	slot10 = "Specifies how long time (in seconds) to wait before execute"

	self._build_value_number(slot4, self, panel, panel_sizer, "timer", {
		floats = 1,
		min = 0
	})

	slot6 = "Creates a timer element. When the timer runs out, execute will be run. The timer element can be operated on using the logic_timer_operator"

	self._add_help_text(slot4, self)

	return 
end
function CoreTimerUnitElement:register_debug_output_unit(output_monitor_id)
	self._hed.output_monitor_id = output_monitor_id

	return 
end
function CoreTimerUnitElement:unregister_debug_output_unit()
	self._hed.output_monitor_id = nil

	return 
end

if not CoreTimerOperatorUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

CoreTimerOperatorUnitElement = slot0

if not TimerOperatorUnitElement then
	slot2 = CoreTimerOperatorUnitElement
	slot0 = class(slot1)
end

TimerOperatorUnitElement = slot0
function TimerOperatorUnitElement:init(...)
	slot3 = self

	TimerOperatorUnitElement.super.init(slot2, ...)

	return 
end
function CoreTimerOperatorUnitElement:init(unit)
	slot5 = unit

	CoreTimerOperatorUnitElement.super.init(slot3, self)

	self._hed.operation = "none"
	self._hed.time = 0
	self._hed.elements = {}
	slot5 = "operation"

	table.insert(, self._save_values)

	slot5 = "time"

	table.insert(, self._save_values)

	slot5 = "elements"

	table.insert(, self._save_values)

	return 
end
function CoreTimerOperatorUnitElement:draw_links(t, dt, selected_unit, all_units)
	slot10 = selected_unit

	CoreTimerOperatorUnitElement.super.draw_links(slot6, self, t, dt)

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
function CoreTimerOperatorUnitElement:get_links_to_unit(...)
	slot3 = self

	CoreTimerOperatorUnitElement.super.get_links_to_unit(slot2, ...)

	slot5 = "operator"

	self._get_links_of_type_from_elements(slot2, self, self._hed.elements, ...)

	return 
end
function CoreTimerOperatorUnitElement:update_editing()
	return 
end
function CoreTimerOperatorUnitElement:add_element()
	slot4 = {
		ray_type = "editor",
		mask = 10
	}
	local ray = managers.editor.unit_by_raycast(slot2, managers.editor)

	if ray and ray.unit then
		slot5 = "core/units/mission_elements/logic_timer/logic_timer"
	end

	return 
end
function CoreTimerOperatorUnitElement:remove_links(unit)
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
function CoreTimerOperatorUnitElement:add_triggers(vc)
	slot5 = Idstring(slot6)
	slot10 = "add_element"

	vc.add_trigger(slot3, vc, callback("lmb", self, self))

	return 
end
function CoreTimerOperatorUnitElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	local names = {
		"logic_timer/logic_timer"
	}
	slot10 = names

	self._build_add_remove_unit_from_list(slot5, self, panel, panel_sizer, self._hed.elements)

	slot11 = "Select an operation for the selected elements"

	self._build_value_combobox(slot5, self, panel, panel_sizer, "operation", {
		"none",
		"pause",
		"start",
		"add_time",
		"subtract_time",
		"reset",
		"set_time",
		"show_hud_timer",
		"hide_hud_timer"
	})

	slot11 = "Amount of time to add, subtract or set to the timers."

	self._build_value_number(slot5, self, panel, panel_sizer, "time", {
		floats = 1,
		min = 0
	})

	slot7 = "This element can modify logic_timer element. Select timers to modify using insert and clicking on the elements."

	self._add_help_text(slot5, self)

	return 
end

if not CoreTimerTriggerUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

CoreTimerTriggerUnitElement = slot0

if not TimerTriggerUnitElement then
	slot2 = CoreTimerTriggerUnitElement
	slot0 = class(slot1)
end

TimerTriggerUnitElement = slot0
function TimerTriggerUnitElement:init(...)
	slot3 = self

	TimerTriggerUnitElement.super.init(slot2, ...)

	return 
end
function CoreTimerTriggerUnitElement:init(unit)
	slot5 = unit

	CoreTimerTriggerUnitElement.super.init(slot3, self)

	self._hed.time = 0
	self._hed.elements = {}
	slot5 = "time"

	table.insert(, self._save_values)

	slot5 = "elements"

	table.insert(, self._save_values)

	return 
end
function CoreTimerTriggerUnitElement:draw_links(t, dt, selected_unit, all_units)
	slot10 = selected_unit

	CoreTimerTriggerUnitElement.super.draw_links(slot6, self, t, dt)

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
function CoreTimerTriggerUnitElement:get_links_to_unit(...)
	slot3 = self

	CoreTimerTriggerUnitElement.super.get_links_to_unit(slot2, ...)

	slot5 = "trigger"

	self._get_links_of_type_from_elements(slot2, self, self._hed.elements, ...)

	return 
end
function CoreTimerTriggerUnitElement:update_editing()
	return 
end
function CoreTimerTriggerUnitElement:add_element()
	slot4 = {
		ray_type = "editor",
		mask = 10
	}
	local ray = managers.editor.unit_by_raycast(slot2, managers.editor)

	if ray and ray.unit then
		slot5 = "core/units/mission_elements/logic_timer/logic_timer"
	end

	return 
end
function CoreTimerTriggerUnitElement:remove_links(unit)
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
function CoreTimerTriggerUnitElement:add_triggers(vc)
	slot5 = Idstring(slot6)
	slot10 = "add_element"

	vc.add_trigger(slot3, vc, callback("lmb", self, self))

	return 
end
function CoreTimerTriggerUnitElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	local names = {
		"logic_timer/logic_timer"
	}
	slot10 = names

	self._build_add_remove_unit_from_list(slot5, self, panel, panel_sizer, self._hed.elements)

	slot11 = "Specify how much time should be left on the timer to trigger."

	self._build_value_number(slot5, self, panel, panel_sizer, "time", {
		floats = 1,
		min = 0
	})

	slot7 = "This element is a trigger to logic_timer element."

	self._add_help_text(slot5, self)

	return 
end

return 
