if not JobValueUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

JobValueUnitElement = slot0
JobValueUnitElement.SAVE_UNIT_POSITION = false
JobValueUnitElement.SAVE_UNIT_ROTATION = false
function JobValueUnitElement:init(unit)
	slot5 = unit

	JobValueUnitElement.super.init(slot3, self)

	self._hed.key = "none"
	self._hed.value = 0
	self._hed.save = nil
	slot5 = "key"

	table.insert(nil, self._save_values)

	slot5 = "value"

	table.insert(nil, self._save_values)

	slot5 = "save"

	table.insert(nil, self._save_values)

	return 
end
function JobValueUnitElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot6 = "HORIZONTAL"
	local key_sizer = EWS.BoxSizer(slot4, EWS)
	slot10 = "EXPAND"

	panel_sizer.add(EWS, panel_sizer, key_sizer, 0, 0)

	slot10 = ""
	local key_name = EWS.StaticText(EWS, EWS, panel, "Key:", 0)
	slot11 = "ALIGN_CENTER_VERTICAL"

	key_sizer.add(EWS, key_sizer, key_name, 1, 0)

	slot11 = "TE_PROCESS_ENTER"
	local key = EWS.TextCtrl(EWS, EWS, panel, self._hed.key, "")
	slot12 = "ALIGN_CENTER_VERTICAL"

	key_sizer.add(EWS, key_sizer, key, 2, 0)

	slot14 = "set_element_data"

	key.connect(EWS, key, "EVT_COMMAND_TEXT_ENTER", callback(0, self, self))

	slot14 = "set_element_data"
	slot11 = {
		value = "key",
		ctrlr = key
	}

	key.connect(EWS, key, "EVT_KILL_FOCUS", callback({
		value = "key",
		ctrlr = key
	}, self, self))

	slot9 = "HORIZONTAL"
	local value_sizer = EWS.BoxSizer(EWS, EWS)
	slot13 = "EXPAND"

	panel_sizer.add(EWS, panel_sizer, value_sizer, 0, 0)

	slot13 = ""
	local value_name = EWS.StaticText(EWS, EWS, panel, "Value:", 0)
	slot14 = "ALIGN_CENTER_VERTICAL"

	value_sizer.add(EWS, value_sizer, value_name, 1, 0)

	slot14 = "TE_PROCESS_ENTER"
	local value = EWS.TextCtrl(EWS, EWS, panel, self._hed.value, "")
	slot15 = "ALIGN_CENTER_VERTICAL"

	value_sizer.add(EWS, value_sizer, value, 2, 0)

	slot17 = "set_element_data"

	value.connect(EWS, value, "EVT_COMMAND_TEXT_ENTER", callback(0, self, self))

	slot17 = "set_element_data"
	slot14 = {
		value = "value",
		ctrlr = value
	}

	value.connect(EWS, value, "EVT_KILL_FOCUS", callback({
		value = "value",
		ctrlr = value
	}, self, self))

	slot14 = "save"

	self._build_value_checkbox(EWS, self, panel, panel_sizer)

	return 
end

if not JobValueFilterUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

JobValueFilterUnitElement = slot0
JobValueFilterUnitElement.SAVE_UNIT_POSITION = false
JobValueFilterUnitElement.SAVE_UNIT_ROTATION = false
function JobValueFilterUnitElement:init(unit)
	slot5 = unit

	JobValueFilterUnitElement.super.init(slot3, self)

	self._hed.key = "none"
	self._hed.value = 0
	self._hed.save = nil
	self._hed.check_type = "equal"
	slot5 = "key"

	table.insert("equal", self._save_values)

	slot5 = "value"

	table.insert("equal", self._save_values)

	slot5 = "save"

	table.insert("equal", self._save_values)

	slot5 = "check_type"

	table.insert("equal", self._save_values)

	return 
end
function JobValueFilterUnitElement:_build_panel(panel, panel_sizer)
	slot7 = panel_sizer

	JobValueUnitElement._build_panel(slot4, self, panel)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot10 = "Select which check operation to perform"

	self._build_value_combobox(slot4, self, panel, panel_sizer, "check_type", {
		"equal",
		"less_than",
		"greater_than",
		"less_or_equal",
		"greater_or_equal",
		"has_key",
		"not_has_key"
	})

	local help = {
		panel = panel,
		sizer = panel_sizer,
		text = "Key is what to check. Value is what it is supposed to be to pass the filter. Different check types can be used i the value is known to be a number, for example, greater_then checks if the stored value is greater then the input value."
	}
	slot7 = help

	self.add_help_text(self, self)

	return 
end

if not ApplyJobValueUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

ApplyJobValueUnitElement = slot0
ApplyJobValueUnitElement.SAVE_UNIT_POSITION = false
ApplyJobValueUnitElement.SAVE_UNIT_ROTATION = false
function ApplyJobValueUnitElement:init(unit)
	slot5 = unit

	ApplyJobValueUnitElement.super.init(slot3, self)

	self._hed.key = "none"
	self._hed.save = nil
	self._hed.elements = {}
	slot5 = "key"

	table.insert(, self._save_values)

	slot5 = "save"

	table.insert(, self._save_values)

	slot5 = "elements"

	table.insert(, self._save_values)

	return 
end
function ApplyJobValueUnitElement:update_editing()
	return 
end
function ApplyJobValueUnitElement:draw_links(t, dt, selected_unit, all_units)
	slot10 = selected_unit

	ApplyJobValueUnitElement.super.draw_links(slot6, self, t, dt)

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
function ApplyJobValueUnitElement:add_element()
	slot4 = {
		ray_type = "editor",
		mask = 10
	}
	local ray = managers.editor.unit_by_raycast(slot2, managers.editor)

	if ray and ray.unit then
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

	return 
end
function ApplyJobValueUnitElement:remove_links(unit)
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
function ApplyJobValueUnitElement:add_triggers(vc)
	slot5 = Idstring(slot6)
	slot10 = "add_element"

	vc.add_trigger(slot3, vc, callback("lmb", self, self))

	return 
end
function ApplyJobValueUnitElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	local names = nil
	slot10 = names

	self._build_add_remove_unit_from_list(slot5, self, panel, panel_sizer, self._hed.elements)

	slot7 = "HORIZONTAL"
	local key_sizer = EWS.BoxSizer(slot5, EWS)
	slot11 = "EXPAND"

	panel_sizer.add(EWS, panel_sizer, key_sizer, 0, 0)

	slot11 = ""
	local key_name = EWS.StaticText(EWS, EWS, panel, "Key:", 0)
	slot12 = "ALIGN_CENTER_VERTICAL"

	key_sizer.add(EWS, key_sizer, key_name, 1, 0)

	slot12 = "TE_PROCESS_ENTER"
	local key = EWS.TextCtrl(EWS, EWS, panel, self._hed.key, "")
	slot13 = "ALIGN_CENTER_VERTICAL"

	key_sizer.add(EWS, key_sizer, key, 2, 0)

	slot15 = "set_element_data"

	key.connect(EWS, key, "EVT_COMMAND_TEXT_ENTER", callback(0, self, self))

	slot15 = "set_element_data"
	slot12 = {
		value = "key",
		ctrlr = key
	}

	key.connect(EWS, key, "EVT_KILL_FOCUS", callback({
		value = "key",
		ctrlr = key
	}, self, self))

	slot12 = ""
	local save = EWS.CheckBox(EWS, EWS, panel, "Save")
	slot11 = self._hed.save

	save.set_value(EWS, save)

	slot16 = "set_element_data"
	slot13 = {
		value = "save",
		ctrlr = save
	}

	save.connect(EWS, save, "EVT_COMMAND_CHECKBOX_CLICKED", callback(self, self, self))

	slot14 = "EXPAND"

	panel_sizer.add(EWS, panel_sizer, save, 0, 0)

	return 
end

return 
