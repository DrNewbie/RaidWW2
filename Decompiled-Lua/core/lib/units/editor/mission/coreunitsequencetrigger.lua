if not CoreUnitSequenceTriggerUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

CoreUnitSequenceTriggerUnitElement = slot0
CoreUnitSequenceTriggerUnitElement.SAVE_UNIT_POSITION = false
CoreUnitSequenceTriggerUnitElement.SAVE_UNIT_ROTATION = false

if not UnitSequenceTriggerUnitElement then
	slot2 = CoreUnitSequenceTriggerUnitElement
	slot0 = class(slot1)
end

UnitSequenceTriggerUnitElement = slot0
function UnitSequenceTriggerUnitElement:init(...)
	slot3 = self

	CoreUnitSequenceTriggerUnitElement.init(slot2, ...)

	return 
end
function CoreUnitSequenceTriggerUnitElement:init(unit)
	slot5 = unit

	MissionElement.init(slot3, self)

	self._hed.trigger_times = 1
	self._hed.sequence_list = {}
	slot5 = "sequence_list"

	table.insert(, self._save_values)

	self._guis = {}
	self._sequences = {}
	self._sequence_units = {}

	return 
end
function CoreUnitSequenceTriggerUnitElement:layer_finished()
	slot3 = self

	MissionElement.layer_finished(slot2)

	if self._hed.unit_id then
		slot4 = {
			unit_id = self._hed.unit_id,
			sequence = self._hed.sequence
		}

		table.insert(slot2, self._hed.sequence_list)
	end

	slot3 = self._hed.sequence_list

	for _, data in pairs(slot2) do
		slot9 = data.unit_id
		slot14 = "load_unit"
		local unit = managers.worlddefinition.get_unit_on_load(slot7, managers.worlddefinition, callback(slot11, self, self))

		if unit then
			slot10 = unit
			self._sequence_units[unit.unit_data(slot9).unit_id] = unit
		end
	end

	return 
end
function CoreUnitSequenceTriggerUnitElement:load_unit(unit)
	if unit then
		slot5 = unit
		self._sequence_units[unit.unit_data(slot4).unit_id] = unit
	end

	return 
end
function CoreUnitSequenceTriggerUnitElement:update_selected()
	slot3 = self._sequence_units

	for id, unit in pairs(slot2) do
		slot8 = unit

		if not alive(slot7) then
			slot9 = id

			self._remove_by_unit_id(slot7, self)

			self._sequence_units[id] = nil
		else
			local params = {
				g = 0,
				b = 1,
				r = 0,
				from_unit = unit,
				to_unit = self._unit
			}
			slot10 = params

			self._draw_link(slot8, self)

			slot13 = 1

			Application.draw(slot8, Application, unit, 0, 0)
		end
	end

	return 
end
function CoreUnitSequenceTriggerUnitElement:update_unselected(t, dt, selected_unit, all_units)
	slot7 = self

	self._check_alive_units(slot6)

	return 
end
function CoreUnitSequenceTriggerUnitElement:_check_alive_units()
	slot3 = self._sequence_units

	for id, unit in pairs(slot2) do
		slot8 = unit

		if not alive(slot7) then
			slot9 = id

			self._remove_by_unit_id(slot7, self)

			self._sequence_units[id] = nil
		end
	end

	return 
end
function CoreUnitSequenceTriggerUnitElement:draw_links_unselected(...)
	slot3 = self

	CoreUnitSequenceTriggerUnitElement.super.draw_links_unselected(slot2, ...)

	slot3 = self._sequence_units

	for id, unit in pairs(slot2) do
		local params = {
			g = 0,
			b = 0.5,
			r = 0,
			from_unit = unit,
			to_unit = self._unit
		}
		slot10 = params

		self._draw_link(slot8, self)

		slot13 = 0.5

		Application.draw(slot8, Application, unit, 0, 0)
	end

	return 
end
function CoreUnitSequenceTriggerUnitElement:get_links_to_unit(to_unit, links, all_units)
	slot9 = all_units

	CoreUnitSequenceTriggerUnitElement.super.get_links_to_unit(slot5, self, to_unit, links)

	if to_unit == self._unit then
		slot6 = self._sequence_units

		for id, unit in pairs(slot5) do
			slot12 = {
				alternative = "unit",
				unit = unit
			}

			table.insert(slot10, links.executers)
		end
	end

	return 
end
function CoreUnitSequenceTriggerUnitElement:update_editing()
	slot4 = {
		ray_type = "body editor",
		sample = true,
		mask = managers.slot.get_mask(slot6, managers.slot)
	}
	slot8 = "all"
	local ray = managers.editor.unit_by_raycast(slot2, managers.editor)

	if ray and ray.unit then
		slot4 = managers.sequence
		slot7 = ray.unit
		local sequences = managers.sequence.get_sequence_list(slot3, ray.unit.name(slot6))

		if 0 < #sequences then
			slot9 = 0

			Application.draw(slot4, Application, ray.unit, 0, 1)
		end
	end

	return 
end
function CoreUnitSequenceTriggerUnitElement:select_unit()
	slot4 = {
		ray_type = "body editor",
		sample = true,
		mask = managers.slot.get_mask(slot6, managers.slot)
	}
	slot8 = "all"
	local ray = managers.editor.unit_by_raycast(slot2, managers.editor)

	if ray and ray.unit then
		slot5 = ray.unit

		self._check_add_unit(slot3, self)
	end

	return 
end
function CoreUnitSequenceTriggerUnitElement:_check_add_unit(unit)
	slot4 = managers.sequence
	slot7 = unit
	local sequences = managers.sequence.get_sequence_list(slot3, unit.name(slot6))

	if 0 < #sequences then
		slot6 = unit
		self._sequence_units[unit.unit_data(slot5).unit_id] = unit
		local sequence_list_data = {
			sequence = "none"
		}
		slot6 = unit
		sequence_list_data.unit_id = unit.unit_data(slot5).unit_id
		slot7 = sequence_list_data

		table.insert(slot5, self._hed.sequence_list)

		slot9 = sequence_list_data

		self._add_unit(slot5, self, unit, sequences)
	end

	return 
end
function CoreUnitSequenceTriggerUnitElement:add_triggers(vc)
	slot5 = Idstring(slot6)
	slot10 = "select_unit"

	vc.add_trigger(slot3, vc, callback("lmb", self, self))

	return 
end
function CoreUnitSequenceTriggerUnitElement:select_unit_list_btn()
	local function f(unit)
		slot4 = "Statics"
		slot4 = unit
		slot4 = unit.type(managers.editor.layer(slot2, managers.editor))

		if not managers.editor.layer(slot2, managers.editor).category_map(slot2)[unit.type(managers.editor.layer(slot2, managers.editor)).s(managers.editor.layer(slot2, managers.editor))] then
			return false
		end

		slot3 = managers.sequence
		slot6 = unit
		local sequences = managers.sequence.get_sequence_list(slot2, unit.name(slot5))

		return 0 < #sequences
	end

	local dialog = SelectUnitByNameModal.new(slot3, SelectUnitByNameModal, "Select Unit")
	slot7 = dialog

	for _, unit in ipairs(dialog.selected_units(f)) do
		slot11 = unit

		self._check_add_unit(slot9, self)
	end

	return 
end
function CoreUnitSequenceTriggerUnitElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._check_alive_units(slot4)

	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot8 = "TB_FLAT,TB_NODIVIDER"
	self._btn_toolbar = EWS.ToolBar(slot4, EWS, panel, "")
	slot10 = "world_editor\\unit_by_name_list.png"

	self._btn_toolbar.add_tool(slot4, self._btn_toolbar, "SELECT_UNIT_LIST", "Select unit from unit list", CoreEws.image_path(slot9))

	slot12 = "select_unit_list_btn"
	slot9 = nil

	self._btn_toolbar.connect(slot4, self._btn_toolbar, "SELECT_UNIT_LIST", "EVT_COMMAND_MENU_SELECTED", callback(nil, self, self))

	slot5 = self._btn_toolbar

	self._btn_toolbar.realize(slot4)

	slot9 = "EXPAND,LEFT"

	panel_sizer.add(slot4, panel_sizer, self._btn_toolbar, 0, 1)

	slot7 = self._hed.sequence_list

	for _, data in pairs(clone(self._btn_toolbar)) do
		local unit = self._sequence_units[data.unit_id]
		slot11 = unit

		if not alive(slot10) then
			slot12 = data.unit_id

			self._remove_by_unit_id(slot10, self)
		else
			slot14 = unit
			local sequences = managers.sequence.get_sequence_list(slot10, unit.name(slot13))
			slot15 = data

			self._add_unit(managers.sequence, self, unit, sequences)
		end
	end

	return 
end
function CoreUnitSequenceTriggerUnitElement:_remove_by_unit_id(unit_id)
	local remove_entries = {}
	slot5 = self._guis

	for id, entry in pairs(slot4) do
		if entry.unit_id == unit_id then
			slot11 = id

			table.insert(slot9, remove_entries)
		end
	end

	slot5 = remove_entries

	for _, id in ipairs(slot4) do
		slot11 = id

		self.remove_entry(slot9, self)
	end

	slot7 = self._hed.sequence_list

	for i, data in ipairs(clone(slot6)) do
		if data.unit_id == unit_id then
			slot11 = i

			table.remove(slot9, self._hed.sequence_list)
		end
	end

	slot6 = unit_id

	self._remove_from_sequence_list(slot4, self)

	return 
end
function CoreUnitSequenceTriggerUnitElement:remove_entry(id)
	local unit_id = self._guis[id].unit_id
	slot5 = self._guis[id].unit_id_ctrlr

	self._guis[id].unit_id_ctrlr.destroy(slot4)

	slot5 = self._guis[id].sequence

	self._guis[id].sequence.destroy(slot4)

	slot5 = self._guis[id].name_ctrlr

	self._guis[id].name_ctrlr.destroy(slot4)

	slot5 = self._guis[id].toolbar

	self._guis[id].toolbar.destroy(slot4)

	self._guis[id] = nil
	slot5 = self._panel

	self._panel.layout(nil)

	slot7 = self._hed.sequence_list

	for i, entry in pairs(clone(slot6)) do
		if entry.guis_id == id then
			slot11 = i

			table.remove(slot9, self._hed.sequence_list)
		end
	end

	slot5 = self._guis

	for _, guis in pairs(slot4) do
		if guis.unit_id == unit_id then
			return 
		end
	end

	self._sequence_units[unit_id] = nil

	return 
end
function CoreUnitSequenceTriggerUnitElement:_remove_from_sequence_list(unit_id)
	slot6 = self._hed.sequence_list

	for i, entry in pairs(clone(slot5)) do
		if entry.unit_id == unit_id then
			slot10 = i

			table.insert(slot8, self._hed.sequence_list)
		end
	end

	return 
end
function CoreUnitSequenceTriggerUnitElement:_add_unit(unit, sequences, sequence_list_data)
	local panel = self._panel
	local panel_sizer = self._panel_sizer
	slot13 = unit
	local unit_id = EWS.StaticText(slot7, EWS, panel, "" .. unit.unit_data("").name_id, 0)
	slot13 = "EXPAND"

	panel_sizer.add(EWS, panel_sizer, unit_id, 0, 0)

	slot10 = "HORIZONTAL"
	local h_sizer = EWS.BoxSizer(EWS, EWS)
	slot14 = "EXPAND,LEFT"

	panel_sizer.add(EWS, panel_sizer, h_sizer, 0, 1)

	local sequence_params = {
		default = "none",
		name = "Sequence:",
		ctrlr_proportions = 2,
		name_proportions = 1,
		sizer_proportions = 1,
		tooltip = "Select a sequence from the combobox",
		sorted = true,
		panel = panel,
		sizer = h_sizer,
		options = sequences,
		value = sequence_list_data.sequence
	}
	local sequence = CoreEws.combobox(panel_sizer)
	self._guis_id = self._guis_id or 0
	self._guis_id = self._guis_id + 1
	sequence_list_data.guis_id = self._guis_id
	slot15 = "TB_FLAT,TB_NODIVIDER"
	local toolbar = EWS.ToolBar(sequence_params, EWS, panel, "")
	slot18 = "toolbar\\delete_16x16.png"

	toolbar.add_tool(EWS, toolbar, "SELECT", "Remove", CoreEws.image_path(slot17))

	slot20 = "remove_entry"
	slot17 = self._guis_id

	toolbar.connect(EWS, toolbar, "SELECT", "EVT_COMMAND_MENU_SELECTED", callback(nil, self, self))

	slot13 = toolbar

	toolbar.realize(EWS)

	slot16 = unit
	self._guis[self._guis_id] = {
		unit_id_ctrlr = unit_id,
		unit = unit,
		unit_id = unit.unit_data("EVT_COMMAND_MENU_SELECTED").unit_id,
		sequence = sequence,
		name_ctrlr = sequence_params.name_ctrlr,
		toolbar = toolbar,
		guis_id = self._guis_id
	}
	slot17 = "EXPAND,LEFT"

	h_sizer.add(self._guis_id, h_sizer, toolbar, 0, 1)

	slot19 = "set_sequence_data"
	slot16 = self._guis_id

	sequence.connect(self._guis_id, sequence, "EVT_COMMAND_COMBOBOX_SELECTED", callback(1, self, self))

	slot13 = panel

	panel.layout(self._guis_id)

	return 
end
function CoreUnitSequenceTriggerUnitElement:set_sequence_data(guis_id)
	local sequence = self._guis[guis_id].sequence.get_value(slot3)
	slot5 = self._hed.sequence_list

	for i, entry in pairs(self._guis[guis_id].sequence) do
		if entry.guis_id == guis_id then
			entry.sequence = sequence

			break
		end
	end

	return 
end

return 
