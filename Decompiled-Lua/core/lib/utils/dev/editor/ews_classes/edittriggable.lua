-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreEditorUtils"

core.import(slot1, core)

slot3 = "CoreEws"

core.import(slot1, core)

if not EditUnitTriggable then
	slot2 = EditUnitBase
	slot0 = class(slot1)
end

EditUnitTriggable = slot0
function EditUnitTriggable:init(editor)
	local panel, sizer = editor or managers.editor.add_unit_edit_page(slot3, editor or managers.editor)
	self._panel = panel
	self._ctrls = {}
	self._element_guis = {}
	slot7 = "HORIZONTAL"
	local sequence_sizer = EWS.BoxSizer({
		name = "Sequences",
		class = self
	}, EWS)
	self._triggers_params = {
		name = "Triggers:",
		name_proportions = 1,
		tooltip = "Select a sequence that should trigger other unit sequences",
		sorted = true,
		sizer_proportions = 1,
		ctrlr_proportions = 2,
		panel = panel,
		sizer = sequence_sizer,
		options = {}
	}
	slot7 = self._triggers_params

	CoreEws.combobox()

	slot13 = "change_triggers"

	self._triggers_params.ctrlr.connect(, self._triggers_params.ctrlr, "EVT_COMMAND_COMBOBOX_SELECTED", callback(self._triggers_params.ctrlr, self, self))

	slot10 = "TB_FLAT,TB_NODIVIDER"
	self._btn_toolbar = EWS.ToolBar(, EWS, panel, "")
	slot12 = "world_editor\\add_unit.png"

	self._btn_toolbar.add_check_tool(, self._btn_toolbar, "ADD_UNIT", "Add unit by selecting in world", CoreEws.image_path(self))

	slot14 = "add_unit_btn"

	self._btn_toolbar.connect(, self._btn_toolbar, "ADD_UNIT", "EVT_COMMAND_MENU_SELECTED", callback(nil, self, self))

	slot12 = "world_editor\\unit_by_name_list.png"

	self._btn_toolbar.add_tool(, self._btn_toolbar, "ADD_UNIT_LIST", "Add unit from unit list", CoreEws.image_path(nil))

	slot14 = "add_unit_list_btn"
	slot11 = nil

	self._btn_toolbar.connect(, self._btn_toolbar, "ADD_UNIT_LIST", "EVT_COMMAND_MENU_SELECTED", callback(nil, self, self))

	slot7 = self._btn_toolbar

	self._btn_toolbar.realize()

	slot11 = "EXPAND,LEFT"

	sequence_sizer.add(, sequence_sizer, self._btn_toolbar, 0, 1)

	slot11 = "EXPAND"

	sizer.add(, sizer, sequence_sizer, 0, 0)

	slot10 = self
	slot11 = "EXPAND"

	sizer.add(, sizer, self._build_scrolled_window(0), 1, 0)

	slot7 = panel

	panel.layout()

	slot8 = false

	panel.set_enabled(, panel)

	return 
end
function EditUnitTriggable:_build_scrolled_window()
	slot6 = "VSCROLL"
	self._scrolled_window = EWS.ScrolledWindow(slot2, EWS, self._panel, "")
	slot3 = self._scrolled_window
	slot8 = 0

	self._scrolled_window.set_scroll_rate(slot2, Vector3("", 0, 1))

	slot8 = 0
	slot4 = Vector3("", 0, 0)
	slot9 = -1

	self._scrolled_window.set_virtual_size_hints(slot2, self._scrolled_window, Vector3(0, 1, -1))

	slot6 = "Trigger Sequences"
	self._scrolled_main_sizer = EWS.StaticBoxSizer(slot2, EWS, self._scrolled_window, "VERTICAL")
	slot4 = self._scrolled_main_sizer

	self._scrolled_window.set_sizer(slot2, self._scrolled_window)

	return self._scrolled_window
end
function EditUnitTriggable:build_element_gui(data)
	slot7 = "TAB_TRAVERSAL"
	local panel = EWS.Panel(slot3, EWS, self._scrolled_window, "")
	slot6 = "HORIZONTAL"
	local sizer = EWS.BoxSizer(EWS, EWS)
	local id = data.id or 0
	local trigger_name = data.trigger_name or "none"
	local name = Idstring(slot7)
	slot9 = "none"
	local unit_name = Idstring("none")

	if data.notify_unit then
		slot10 = data.notify_unit
		unit_name = data.notify_unit.name(slot9)
		slot10 = data.notify_unit
		name = data.notify_unit.unit_data(slot9).name_id
	end

	local sequences = {
		"none"
	}
	slot12 = unit_name

	if 0 < #managers.sequence.get_triggable_sequence_list(slot10, managers.sequence) then
		slot12 = unit_name
		sequences = managers.sequence.get_triggable_sequence_list(slot10, managers.sequence)
	end

	slot11 = sequences

	table.sort(slot10)

	local sequence = data.notify_unit_sequence or "none"
	local t = data.time or "-"
	slot14 = sizer

	panel.set_sizer(slot12, panel)

	slot17 = "BU_EXACTFIT,NO_BORDER"
	local remove_btn = EWS.Button(slot12, EWS, panel, "Remove", "")
	slot18 = "EXPAND"

	sizer.add(EWS, sizer, remove_btn, 0, 0)

	slot18 = name
	slot18 = "TE_CENTRE,TE_READONLY"
	local name = EWS.TextCtrl(EWS, EWS, panel, name.s(0), "")
	slot19 = "EXPAND"

	sizer.add(EWS, sizer, name, 3, 0)

	slot19 = "CB_DROPDOWN,CB_READONLY"
	local trigger = EWS.ComboBox(EWS, EWS, panel, "", "")
	slot16 = sequences

	for _, name in ipairs(EWS) do
		slot22 = name

		trigger.append(slot20, trigger)
	end

	slot17 = sequence

	trigger.set_value(slot15, trigger)

	slot20 = "EXPAND"

	sizer.add(slot15, sizer, trigger, 3, 0)

	slot20 = "TE_CENTRE"
	local time = EWS.TextCtrl(slot15, EWS, panel, t, "")

	sizer.add(EWS, sizer, time, 1, 0)

	local ctrls = {
		id = id,
		trigger_name = trigger_name,
		trigger = trigger,
		time = time
	}
	slot24 = "remove_element"

	remove_btn.connect(sizer, remove_btn, "EVT_COMMAND_BUTTON_CLICKED", callback("EXPAND", self, self))

	slot24 = "change_sequence"

	trigger.connect(sizer, trigger, "EVT_COMMAND_COMBOBOX_SELECTED", callback(ctrls, self, self))

	slot24 = "verify_number"

	time.connect(sizer, time, "EVT_CHAR", callback(ctrls, nil, _G))

	slot24 = "change_time"
	slot21 = ctrls

	time.connect(sizer, time, "EVT_COMMAND_TEXT_UPDATED", callback(time, self, self))

	slot22 = "EXPAND"

	self._scrolled_main_sizer.add(sizer, self._scrolled_main_sizer, panel, 0, 0)

	slot19 = panel

	table.insert(sizer, self._element_guis)

	return panel
end
function EditUnitTriggable:change_sequence(ctrls)
	slot4 = self._ctrls.unit
	slot6 = ctrls.trigger_name
	slot9 = ctrls.trigger

	self._ctrls.unit.damage(slot3).set_trigger_sequence_name(slot3, self._ctrls.unit.damage(slot3), ctrls.id, ctrls.trigger.get_value(slot8))

	return 
end
function EditUnitTriggable:change_time(ctrls)
	slot4 = self._ctrls.unit
	slot6 = ctrls.trigger_name
	slot9 = ctrls.time

	self._ctrls.unit.damage(slot3).set_trigger_sequence_time(slot3, self._ctrls.unit.damage(slot3), ctrls.id, ctrls.time.get_value(slot8))

	return 
end
function EditUnitTriggable:remove_element(ctrls)
	slot4 = self._ctrls.unit
	slot6 = ctrls.id

	self._ctrls.unit.damage(slot3).remove_trigger_data(slot3, self._ctrls.unit.damage(slot3), ctrls.trigger_name)

	slot4 = self

	self.update_element_gui(slot3)

	return 
end
function EditUnitTriggable:clear_element_gui()
	slot3 = self._scrolled_main_sizer

	self._scrolled_main_sizer.clear(slot2)

	slot3 = self._element_guis

	for _, gui in ipairs(slot2) do
		slot8 = gui

		gui.destroy(slot7)
	end

	self._element_guis = {}

	return 
end
function EditUnitTriggable:add_unit_btn()

	-- Decompilation error in this vicinity:
	if not managers.editor then
		return 
	end

	slot4 = "ADD_UNIT"
	slot5 = cb

	managers.editor.set_trigger_add_unit(slot3, managers.editor)

	return 
end
function EditUnitTriggable:add_unit_list_btn()
	local function f(unit)
		slot3 = managers.sequence
		slot6 = unit

		return 0 < #managers.sequence.get_triggable_sequence_list(slot2, unit.name(slot5))
	end

	local dialog = SelectUnitByNameModal.new(slot3, SelectUnitByNameModal, "Add Trigger Unit")
	slot7 = dialog

	for _, unit in ipairs(dialog.selected_units(f)) do
		slot11 = unit

		self.add_unit(slot9, self)
	end

	return 
end
function EditUnitTriggable:update_element_gui()
	slot3 = self

	self.clear_element_gui(slot2)

	slot3 = self._ctrls.unit
	slot3 = self._ctrls.unit.damage(slot2)
	local trigger_name_list = self._ctrls.unit.damage(slot2).get_trigger_name_list(slot2)

	if trigger_name_list then
		slot4 = trigger_name_list

		for _, trigger_name in ipairs(slot3) do
			slot9 = self._ctrls.unit
			slot10 = trigger_name
			local trigger_data = self._ctrls.unit.damage(slot8).get_trigger_data_list(slot8, self._ctrls.unit.damage(slot8))

			if trigger_data and 0 < #trigger_data then
				slot10 = trigger_data

				for _, data in ipairs(slot9) do
					slot16 = self._triggers_params.ctrlr

					if data.trigger_name == self._triggers_params.ctrlr.get_value(slot15) then
						slot16 = data

						self.build_element_gui(slot14, self)
					end
				end
			end
		end
	end

	if #self._element_guis == 0 then
		slot5 = {}
		local panel = self.build_element_gui(slot3, self)
		slot6 = false

		panel.set_enabled(self, panel)
	end

	slot4 = self._scrolled_window

	self._scrolled_window.fit_inside(slot3)

	slot4 = managers.editor

	managers.editor.layout_edit_panel(slot3)

	return 
end
function EditUnitTriggable:add_unit(unit)
	slot4 = managers.sequence
	slot7 = unit
	local triggable_sequences = managers.sequence.get_triggable_sequence_list(slot3, unit.name(slot6))

	if 0 < #triggable_sequences then
		slot5 = self._ctrls.unit
		slot8 = self._triggers_params.ctrlr
		slot12 = true

		self._ctrls.unit.damage(slot4).add_trigger_sequence(slot4, self._ctrls.unit.damage(slot4), self._triggers_params.ctrlr.get_value(slot7), triggable_sequences[1], unit, 0, nil, nil)

		slot5 = self

		self.update_element_gui(slot4)
	end

	return 
end
function EditUnitTriggable:change_triggers()
	slot3 = self._ctrls.unit

	if alive(slot2) then
		slot3 = self

		self.update_element_gui(slot2)
	end

	return 
end
function EditUnitTriggable:is_editable(unit)
	slot4 = unit

	if alive(slot3) then
		slot4 = unit

		if unit.damage(slot3) then
			slot4 = managers.sequence
			slot7 = unit
			local triggers = managers.sequence.get_trigger_list(slot3, unit.name(slot6))

			if 0 < #triggers then
				self._ctrls.unit = unit
				slot6 = triggers

				CoreEws.update_combobox_options(slot4, self._triggers_params)

				slot6 = triggers[1]

				CoreEws.change_combobox_value(slot4, self._triggers_params)

				slot5 = self

				self.update_element_gui(slot4)

				return true
			end
		end
	end

	slot6 = false

	self._btn_toolbar.set_tool_state(slot3, self._btn_toolbar, "ADD_UNIT")

	slot4 = self

	self.add_unit_btn(slot3)

	return false
end
function EditUnitTriggable:dialog_closed()
	slot5 = false

	self._btn_toolbar.set_tool_state(slot2, self._btn_toolbar, "ADD_UNIT")

	slot3 = self

	self.add_unit_btn(slot2)

	return 
end

return 
