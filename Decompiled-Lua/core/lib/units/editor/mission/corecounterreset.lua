if not CoreCounterResetUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

CoreCounterResetUnitElement = slot0

if not CounterResetUnitElement then
	slot2 = CoreCounterResetUnitElement
	slot0 = class(slot1)
end

CounterResetUnitElement = slot0
function CounterResetUnitElement:init(...)
	slot3 = self

	CoreCounterResetUnitElement.init(slot2, ...)

	return 
end
function CoreCounterResetUnitElement:init(unit)
	slot5 = unit

	MissionElement.init(slot3, self)

	self._hed.counter_target = 1
	self._hed.elements = {}
	slot5 = "counter_target"

	table.insert(, self._save_values)

	slot5 = "elements"

	table.insert(, self._save_values)

	return 
end
function CoreCounterResetUnitElement:draw_links(t, dt, selected_unit, all_units)
	slot10 = selected_unit

	MissionElement.draw_links(slot6, self, t, dt)

	slot7 = self._hed.elements

	for _, id in ipairs(slot6) do
		local unit = all_units[id]
		local draw = not selected_unit or unit == selected_unit or self._unit == selected_unit

		if draw then
			slot15 = {
				g = 0,
				b = 0,
				r = 0.75,
				from_unit = self._unit,
				to_unit = unit
			}

			self._draw_link(slot13, self)
		end
	end

	return 
end
function CoreCounterResetUnitElement:update_editing()
	return 
end
function CoreCounterResetUnitElement:add_element()
	slot4 = {
		ray_type = "editor",
		mask = 10
	}
	local ray = managers.editor.unit_by_raycast(slot2, managers.editor)

	if ray and ray.unit then
		slot6 = ray.unit
		slot6 = ray.unit.name(slot5)
		slot7 = true

		if string.find(slot3, ray.unit.name(slot5).s(slot5), "logic_counter/logic_counter", 1) then
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
function CoreCounterResetUnitElement:remove_links(unit)
	slot5 = unit

	MissionElement.remove_links(slot3, self)

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
function CoreCounterResetUnitElement:add_triggers(vc)
	slot5 = Idstring(slot6)
	slot10 = "add_element"

	vc.add_trigger(slot3, vc, callback("lmb", self, self))

	return 
end
function CoreCounterResetUnitElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	local names = {
		"logic_counter/logic_counter"
	}
	slot10 = names

	self._build_add_remove_unit_from_list(slot5, self, panel, panel_sizer, self._hed.elements)

	local counter_target_params = {
		name = "Counter target:",
		ctrlr_proportions = 2,
		name_proportions = 1,
		tooltip = "Specifies what the selected counted should reset to",
		sorted = false,
		min = 0,
		floats = 0,
		panel = panel,
		sizer = panel_sizer,
		value = self._hed.counter_target
	}
	local counter_target = CoreEWS.number_controller(self)
	slot14 = "set_element_data"

	counter_target.connect(counter_target_params, counter_target, "EVT_COMMAND_TEXT_ENTER", callback(slot11, self, self))

	slot14 = "set_element_data"
	slot11 = {
		value = "counter_target",
		ctrlr = counter_target
	}

	counter_target.connect(counter_target_params, counter_target, "EVT_KILL_FOCUS", callback({
		value = "counter_target",
		ctrlr = counter_target
	}, self, self))

	return 
end

return 
