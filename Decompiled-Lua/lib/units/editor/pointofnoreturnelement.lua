if not PointOfNoReturnElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

PointOfNoReturnElement = slot0
function PointOfNoReturnElement:init(unit)
	slot5 = unit

	PointOfNoReturnElement.super.init(slot3, self)

	self._hed.elements = {}
	self._hed.time_normal = 240
	self._hed.time_hard = 120
	self._hed.time_overkill = 60
	self._hed.time_overkill_145 = 30
	slot5 = "elements"

	table.insert(30, self._save_values)

	slot5 = "time_easy"

	table.insert(30, self._save_values)

	slot5 = "time_normal"

	table.insert(30, self._save_values)

	slot5 = "time_hard"

	table.insert(30, self._save_values)

	slot5 = "time_overkill"

	table.insert(30, self._save_values)

	slot5 = "time_overkill_145"

	table.insert(30, self._save_values)

	slot5 = "time_overkill_290"

	table.insert(30, self._save_values)

	return 
end
function PointOfNoReturnElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	local exact_names = {
		"core/units/mission_elements/trigger_area/trigger_area"
	}

	self._build_add_remove_unit_from_list(slot5, self, panel, panel_sizer, self._hed.elements, nil)

	local time_params_easy = {
		name = "Time left on easy:",
		ctrlr_proportions = 2,
		name_proportions = 1,
		tooltip = "Set the time left",
		min = 1,
		floats = 0,
		panel = panel,
		sizer = panel_sizer,
		value = self._hed.time_easy
	}
	local time_easy = CoreEWS.number_controller(self)
	slot14 = "set_element_data"

	time_easy.connect(time_params_easy, time_easy, "EVT_COMMAND_TEXT_ENTER", callback(exact_names, self, self))

	slot14 = "set_element_data"
	slot11 = {
		value = "time_easy",
		ctrlr = time_easy
	}

	time_easy.connect(time_params_easy, time_easy, "EVT_KILL_FOCUS", callback({
		value = "time_easy",
		ctrlr = time_easy
	}, self, self))

	local time_params_normal = {
		name = "Time left on normal:",
		ctrlr_proportions = 2,
		name_proportions = 1,
		tooltip = "Set the time left",
		min = 1,
		floats = 0,
		panel = panel,
		sizer = panel_sizer,
		value = self._hed.time_normal
	}
	local time_normal = CoreEWS.number_controller(time_easy)
	slot16 = "set_element_data"

	time_normal.connect(time_params_normal, time_normal, "EVT_COMMAND_TEXT_ENTER", callback(self, self, self))

	slot16 = "set_element_data"
	slot13 = {
		value = "time_normal",
		ctrlr = time_normal
	}

	time_normal.connect(time_params_normal, time_normal, "EVT_KILL_FOCUS", callback({
		value = "time_normal",
		ctrlr = time_normal
	}, self, self))

	local time_params_hard = {
		name = "Time left on hard:",
		ctrlr_proportions = 2,
		name_proportions = 1,
		tooltip = "Set the time left",
		min = 1,
		floats = 0,
		panel = panel,
		sizer = panel_sizer,
		value = self._hed.time_hard
	}
	local time_hard = CoreEWS.number_controller(time_normal)
	slot18 = "set_element_data"

	time_hard.connect(time_params_hard, time_hard, "EVT_COMMAND_TEXT_ENTER", callback(self, self, self))

	slot18 = "set_element_data"
	slot15 = {
		value = "time_hard",
		ctrlr = time_hard
	}

	time_hard.connect(time_params_hard, time_hard, "EVT_KILL_FOCUS", callback({
		value = "time_hard",
		ctrlr = time_hard
	}, self, self))

	local time_params_overkill = {
		name = "Time left on overkill:",
		ctrlr_proportions = 2,
		name_proportions = 1,
		tooltip = "Set the time left",
		min = 1,
		floats = 0,
		panel = panel,
		sizer = panel_sizer,
		value = self._hed.time_overkill
	}
	local time_overkill = CoreEWS.number_controller(time_hard)
	slot20 = "set_element_data"

	time_overkill.connect(time_params_overkill, time_overkill, "EVT_COMMAND_TEXT_ENTER", callback(self, self, self))

	slot20 = "set_element_data"
	slot17 = {
		value = "time_overkill",
		ctrlr = time_overkill
	}

	time_overkill.connect(time_params_overkill, time_overkill, "EVT_KILL_FOCUS", callback({
		value = "time_overkill",
		ctrlr = time_overkill
	}, self, self))

	local time_params_overkill_145 = {
		name = "Time left on overkill 145:",
		ctrlr_proportions = 2,
		name_proportions = 1,
		tooltip = "Set the time left",
		min = 1,
		floats = 0,
		panel = panel,
		sizer = panel_sizer,
		value = self._hed.time_overkill_145
	}
	local time_overkill_145 = CoreEWS.number_controller(time_overkill)
	slot22 = "set_element_data"

	time_overkill_145.connect(time_params_overkill_145, time_overkill_145, "EVT_COMMAND_TEXT_ENTER", callback(self, self, self))

	slot22 = "set_element_data"
	slot19 = {
		value = "time_overkill_145",
		ctrlr = time_overkill_145
	}

	time_overkill_145.connect(time_params_overkill_145, time_overkill_145, "EVT_KILL_FOCUS", callback({
		value = "time_overkill_145",
		ctrlr = time_overkill_145
	}, self, self))

	local time_params_overkill_290 = {
		name = "Time left on overkill 290:",
		ctrlr_proportions = 2,
		name_proportions = 1,
		tooltip = "Set the time left",
		min = 1,
		floats = 0,
		panel = panel,
		sizer = panel_sizer,
		value = self._hed.time_overkill_290
	}
	local time_overkill_290 = CoreEWS.number_controller(time_overkill_145)
	slot24 = "set_element_data"

	time_overkill_290.connect(time_params_overkill_290, time_overkill_290, "EVT_COMMAND_TEXT_ENTER", callback(self, self, self))

	slot24 = "set_element_data"
	slot21 = {
		value = "time_overkill_290",
		ctrlr = time_overkill_290
	}

	time_overkill_290.connect(time_params_overkill_290, time_overkill_290, "EVT_KILL_FOCUS", callback({
		value = "time_overkill_290",
		ctrlr = time_overkill_290
	}, self, self))

	return 
end
function PointOfNoReturnElement:draw_links(t, dt, selected_unit, all_units)
	slot11 = all_units

	MissionElement.draw_links(slot6, self, t, dt, selected_unit)

	return 
end
function PointOfNoReturnElement:update_editing()
	return 
end
function PointOfNoReturnElement:update_selected(t, dt, selected_unit, all_units)
	slot7 = self._hed.elements

	for _, id in ipairs(slot6) do
		local unit = all_units[id]
		local draw = not selected_unit or unit == selected_unit or self._unit == selected_unit

		if draw then
			slot15 = {
				g = 0,
				b = 0.75,
				r = 0.75,
				from_unit = self._unit,
				to_unit = unit
			}

			self._draw_link(slot13, self)
		end
	end

	return 
end
function PointOfNoReturnElement:add_element()
	slot4 = {
		ray_type = "editor",
		mask = 10
	}
	local ray = managers.editor.unit_by_raycast(slot2, managers.editor)

	if ray and ray.unit then
		slot4 = ray.unit
		slot4 = ray.unit.name(slot3)

		if ray.unit.name(slot3).s(slot3) == "core/units/mission_elements/trigger_area/trigger_area" then
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
function PointOfNoReturnElement:remove_links(unit)
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
function PointOfNoReturnElement:add_triggers(vc)
	slot5 = Idstring(slot6)
	slot10 = "add_element"

	vc.add_trigger(slot3, vc, callback("lmb", self, self))

	return 
end

return 
