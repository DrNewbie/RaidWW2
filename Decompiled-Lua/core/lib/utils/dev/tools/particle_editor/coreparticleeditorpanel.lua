-- Decompilation Error: self.ljd.ast.slotworks.eliminate_temporary(self.ast)

-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot0 = core
slot2 = slot0
slot0 = slot0.import
slot3 = "CoreEngineAccess"

slot0(slot1, slot2)

slot0 = CoreParticleEditorPanel

if not slot0 then
	slot0 = class
	slot0 = slot0()
end

CoreParticleEditorPanel = slot0
slot0 = CoreParticleEditorPanel

function slot1(self, editor, parent, effect)
	self._editor = editor
	self._effect = effect
	slot4 = Node
	slot6 = "effect"
	local n = slot4(slot5)
	slot5 = self._effect
	slot7 = slot5
	slot5 = slot5.save
	slot8 = n

	slot5(slot6, slot7)

	slot5 = ""
	self._box_status = slot5
	slot5 = ""
	self._box_help = slot5
	slot5 = ""
	self._box_help_header = slot5
	slot5 = CoreUndoStack
	slot7 = slot5
	slot5 = slot5.new
	slot8 = {}
	slot11 = effect
	slot9 = effect.name
	slot9 = slot9(slot10)
	slot8.name = slot9
	slot11 = n
	slot9 = n.to_xml
	slot9 = slot9(slot10)
	slot8.xml = slot9
	slot9 = 20
	slot5 = slot5(slot6, slot7, slot8)
	self._undo_stack = slot5
	slot5 = Node
	slot7 = "effect"
	local n = slot5(slot6)
	slot6 = self._effect
	slot8 = slot6
	slot6 = slot6.save
	slot9 = n

	slot6(slot7, slot8)

	slot8 = n
	slot6 = n.to_xml
	slot6 = slot6(slot7)
	self._last_saved_xml = slot6
	slot6 = 0
	self._frames_since_spawn = slot6
	slot8 = self
	slot6 = self.create_panel
	slot9 = parent

	slot6(slot7, slot8)

	return 
end

slot0.init = slot1
slot0 = CoreParticleEditorPanel

function slot1(self)
	slot1 = self._panel

	return slot1
end

slot0.panel = slot1
slot0 = CoreParticleEditorPanel

function slot1(self, h, t)
	self._box_help_header = h
	self._box_help = t
	slot5 = self
	slot3 = self.update_status_box

	slot3(slot4)

	return 
end

slot0.set_box_help = slot1
slot0 = CoreParticleEditorPanel

function slot1(self, parent)
	slot2 = {}
	self._stacklist_boxes = slot2
	slot2 = {}
	self._stack_member_combos = slot2
	slot2 = {}
	self._stack_panels = slot2
	slot2 = EWS
	slot4 = slot2
	slot2 = slot2.Panel
	slot5 = parent
	slot6 = ""
	slot7 = ""
	slot2 = slot2(slot3, slot4, slot5, slot6)
	self._panel = slot2
	slot2 = self._panel
	slot4 = slot2
	slot2 = slot2.set_visible
	slot5 = false

	slot2(slot3, slot4)

	slot2 = EWS
	slot4 = slot2
	slot2 = slot2.SplitterWindow
	slot5 = self._panel
	slot6 = ""
	slot7 = "SP_NOBORDER"
	local splitter = slot2(slot3, slot4, slot5, slot6)
	self._top_splitter = splitter
	slot3 = EWS
	slot5 = slot3
	slot3 = slot3.SplitterWindow
	slot6 = splitter
	slot7 = ""
	slot8 = "SP_NOBORDER"
	local gv_splitter = slot3(slot4, slot5, slot6, slot7)
	self._gv_splitter = gv_splitter
	slot6 = self
	slot4 = self.create_effect_panel
	slot7 = gv_splitter
	local effect_panel = slot4(slot5, slot6)
	slot7 = self
	slot5 = self.create_status_box
	slot8 = gv_splitter
	slot5 = slot5(slot6, slot7)
	self._status_box = slot5
	slot7 = self
	slot5 = self.create_atom_panel
	slot8 = splitter
	local atom_panel = slot5(slot6, slot7)
	slot6 = EWS
	slot8 = slot6
	slot6 = slot6.BoxSizer
	slot9 = "VERTICAL"
	local top_sizer = slot6(slot7, slot8)
	slot7 = self._panel
	slot9 = slot7
	slot7 = slot7.set_sizer
	slot10 = top_sizer

	slot7(slot8, slot9)

	slot9 = top_sizer
	slot7 = top_sizer.add
	slot10 = splitter
	slot11 = 1
	slot12 = 0
	slot13 = "EXPAND"

	slot7(slot8, slot9, slot10, slot11, slot12)

	slot9 = splitter
	slot7 = splitter.set_sash_gravity
	slot10 = 0

	slot7(slot8, slot9)

	slot9 = splitter
	slot7 = splitter.split_vertically
	slot10 = gv_splitter
	slot11 = atom_panel
	slot12 = 100

	slot7(slot8, slot9, slot10, slot11)

	slot9 = gv_splitter
	slot7 = gv_splitter.set_sash_gravity
	slot10 = 0

	slot7(slot8, slot9)

	slot9 = gv_splitter
	slot7 = gv_splitter.split_horizontally
	slot10 = effect_panel
	slot11 = self._status_box
	slot12 = 100

	slot7(slot8, slot9, slot10, slot11)

	slot9 = self
	slot7 = self.update_atom_combo

	slot7(slot8)

	slot7 = self._effect
	slot7 = slot7._atoms
	slot7 = #slot7
	slot8 = 0

	if slot8 < slot7 then
		slot7 = self._atom_combo
		slot9 = slot7
		slot7 = slot7.set_value
		slot10 = self._effect
		slot10 = slot10._atoms
		slot10 = slot10[1]
		slot12 = slot10
		slot10 = slot10.name

		slot7(slot8, slot10(slot11))

		slot9 = self
		slot7 = self.on_select_atom

		slot7(slot8)
	else
		slot7 = nil
		self._atom = slot7
	end

	slot7 = self._stack_notebook
	slot9 = slot7
	slot7 = slot7.connect
	slot10 = "EVT_COMMAND_NOTEBOOK_PAGE_CHANGED"
	slot11 = callback
	slot13 = self
	slot14 = self
	slot15 = "clear_box_help"
	slot11 = slot11(slot12, slot13, slot14)
	slot12 = ""

	slot7(slot8, slot9, slot10, slot11)

	slot9 = self
	slot7 = self.update_view
	slot10 = true

	slot7(slot8, slot9)

	slot7 = self._panel
	slot9 = slot7
	slot7 = slot7.set_visible
	slot10 = true

	slot7(slot8, slot9)

	return 
end

slot0.create_panel = slot1
slot0 = CoreParticleEditorPanel

function slot1(self)
	slot1 = self._top_splitter
	slot3 = slot1
	slot1 = slot1.set_sash_position
	slot4 = 250
	slot5 = true

	slot1(slot2, slot3, slot4)

	slot1 = self._gv_splitter
	slot3 = slot1
	slot1 = slot1.set_sash_position
	slot4 = 150
	slot5 = true

	slot1(slot2, slot3, slot4)

	slot1 = self._gv_splitter
	slot3 = slot1
	slot1 = slot1.update_size

	slot1(slot2)

	slot1 = self._top_splitter
	slot3 = slot1
	slot1 = slot1.update_size

	slot1(slot2)

	slot1 = self._panel
	slot3 = slot1
	slot1 = slot1.refresh

	slot1(slot2)

	return 
end

slot0.set_init_positions = slot1
slot0 = CoreParticleEditorPanel

function slot1(self, arg, event)
	slot5 = event
	slot3 = event.scale
	slot3 = slot3(slot4)

	if slot3 then
		slot3 = self._atom
		slot5 = slot3
		slot3 = slot3.scale_timeline
		slot8 = event
		slot6 = event.istart
		slot6 = slot6(slot7)
		slot9 = event
		slot7 = event.iend
		slot7 = slot7(slot8)
		slot10 = event
		slot8 = event.tstart
		slot8 = slot8(slot9)
		slot11 = event
		slot9 = event.tend

		slot3(slot4, slot5, slot6, slot7, slot9(slot10))
	else
		slot3 = self._atom
		slot5 = slot3
		slot3 = slot3.extend_timeline
		slot8 = event
		slot6 = event.istart
		slot6 = slot6(slot7)
		slot9 = event
		slot7 = event.iend
		slot7 = slot7(slot8)
		slot10 = event
		slot8 = event.tstart
		slot8 = slot8(slot9)
		slot11 = event
		slot9 = event.tend

		slot3(slot4, slot5, slot6, slot7, slot9(slot10))
	end

	slot5 = self
	slot3 = self.update_view
	slot6 = false

	slot3(slot4, slot5)

	return 
end

slot0.on_timeline_modify = slot1
slot0 = CoreParticleEditorPanel

function slot1(self)
	slot1 = self._timeline_edit
	slot3 = slot1
	slot1 = slot1.clear_timelines

	slot1(slot2)

	slot1 = self._timeline_edit
	slot3 = slot1
	slot1 = slot1.add_timeline
	slot4 = "atom"

	slot1(slot2, slot3)

	slot1 = self._atom
	slot3 = slot1
	slot1 = slot1.collect_time_events
	local events = slot1(slot2)
	slot2 = ipairs
	slot4 = events
	slot2, slot3, slot4 = slot2(slot3)

	for _, e in slot2, slot3, slot4 do
		local name = e[1]
		slot8 = tonumber
		slot10 = e[2]
		slot11 = e[3]
		slot10 = slot10[slot11]
		local t = slot8(slot9)
		slot9 = self._timeline_edit
		slot11 = slot9
		slot9 = slot9.add_event
		slot12 = "atom"
		slot13 = t
		slot14 = name

		slot9(slot10, slot11, slot12, slot13)
	end

	slot2 = self._timeline_edit
	slot4 = slot2
	slot2 = slot2.refresh

	slot2(slot3)

	return 
end

slot0.fill_timelines = slot1
slot0 = CoreParticleEditorPanel

function slot1(self, timeline)
	slot4 = timeline
	slot2 = timeline.connect
	slot5 = "EVT_TIMELINE_MODIFIED"
	slot6 = callback
	slot8 = self
	slot9 = self
	slot10 = "on_timeline_modify"
	slot6 = slot6(slot7, slot8, slot9)
	slot7 = ""

	slot2(slot3, slot4, slot5, slot6)

	self._timeline_edit = timeline
	slot4 = self
	slot2 = self.fill_timelines

	slot2(slot3)

	return 
end

slot0.timeline_init = slot1
slot0 = CoreParticleEditorPanel

function slot1(self)

	-- Decompilation error in this vicinity:
	slot1 = self._effect
	slot3 = slot1
	slot1 = slot1.find_atom
	slot4 = self._atom_textctrl
	slot6 = slot4
	slot4 = slot4.get_value
	slot1 = slot1(slot2, slot4(slot5))
	slot1 = self._atom
	slot3 = slot1
	slot1 = slot1.set_name
	slot4 = self._atom_textctrl
	slot6 = slot4
	slot4 = slot4.get_value

	slot1(slot2, slot4(slot5))

	slot3 = self
	slot1 = self.update_atom_combo

	slot1(slot2)

	slot1 = self._atom_combo
	slot3 = slot1
	slot1 = slot1.set_value
	slot4 = self._atom_textctrl
	slot6 = slot4
	slot4 = slot4.get_value

	slot1(slot2, slot4(slot5))

	slot3 = self
	slot1 = self.on_select_atom

	slot1(slot2)

	return 
end

slot0.on_rename_atom = slot1
slot0 = CoreParticleEditorPanel

function slot1(self)
	slot1 = self._effect
	slot3 = slot1
	slot1 = slot1.find_atom
	slot4 = self._atom_textctrl
	slot6 = slot4
	slot4 = slot4.get_value
	slot1 = slot1(slot2, slot4(slot5))

	if slot1 then
		return 
	end

	slot1 = self._effect
	slot3 = slot1
	slot1 = slot1.add_atom
	slot4 = CoreEffectAtom
	slot6 = slot4
	slot4 = slot4.new
	slot7 = self._atom_textctrl
	slot9 = slot7
	slot7 = slot7.get_value

	slot1(slot2, slot4(slot5, slot7(slot8)))

	slot3 = self
	slot1 = self.update_atom_combo

	slot1(slot2)

	slot1 = self._atom_combo
	slot3 = slot1
	slot1 = slot1.set_value
	slot4 = self._atom_textctrl
	slot6 = slot4
	slot4 = slot4.get_value

	slot1(slot2, slot4(slot5))

	slot3 = self
	slot1 = self.on_select_atom

	slot1(slot2)

	return 
end

slot0.on_add_atom = slot1
slot0 = CoreParticleEditorPanel

function slot1(self)
	slot1 = self._atom

	if not slot1 then
		return 
	end

	slot1 = self._effect
	slot3 = slot1
	slot1 = slot1.remove_atom
	slot4 = self._atom

	slot1(slot2, slot3)

	slot3 = self
	slot1 = self.update_atom_combo

	slot1(slot2)

	slot1 = self._effect
	slot1 = slot1._atoms
	slot1 = #slot1
	slot2 = 0

	if slot2 < slot1 then
		slot1 = self._atom_combo
		slot3 = slot1
		slot1 = slot1.set_value
		slot4 = self._effect
		slot4 = slot4._atoms
		slot4 = slot4[1]
		slot6 = slot4
		slot4 = slot4.name

		slot1(slot2, slot4(slot5))

		slot3 = self
		slot1 = self.on_select_atom

		slot1(slot2)
	end

	return 
end

slot0.on_remove_atom = slot1
slot0 = CoreParticleEditorPanel

function slot1(self)
	slot1 = self._effect
	slot3 = slot1
	slot1 = slot1.find_atom
	slot4 = self._atom_combo
	slot6 = slot4
	slot4 = slot4.get_value
	local atom = slot1(slot2, slot4(slot5))

	if atom then
		slot2 = self._editor
		slot3 = "atom"
		slot2._clipboard_type = slot3
		slot2 = self._editor
		slot3 = deep_clone
		slot5 = atom
		slot3 = slot3(slot4)
		slot2._clipboard_object = slot3
	end

	return 
end

slot0.on_copy_atom = slot1
slot0 = CoreParticleEditorPanel

function slot1(self)
	slot1 = self._editor
	slot1 = slot1._clipboard_type

	if slot1 == "atom" then
		slot1 = self._editor
		slot1 = slot1._clipboard_object

		if slot1 then
			slot1 = self._effect
			slot3 = slot1
			slot1 = slot1.find_atom
			slot4 = self._editor
			slot4 = slot4._clipboard_object
			slot6 = slot4
			slot4 = slot4.name
			local e = slot1(slot2, slot4(slot5))
			local i = 0
			slot3 = self._editor
			slot3 = slot3._clipboard_object
			slot5 = slot3
			slot3 = slot3.name
			slot3 = slot3(slot4)
			slot4 = ""
			local n = slot3 .. slot4

			while e do
				slot4 = self._editor
				slot4 = slot4._clipboard_object
				slot6 = slot4
				slot4 = slot4.set_name
				slot7 = n
				slot8 = i
				slot7 = slot7 .. slot8

				slot4(slot5, slot6)

				i = i + 1
				slot4 = self._effect
				slot6 = slot4
				slot4 = slot4.find_atom
				slot7 = self._editor
				slot7 = slot7._clipboard_object
				slot9 = slot7
				slot7 = slot7.name
				slot4 = slot4(slot5, slot7(slot8))
				e = slot4
			end

			slot4 = self._effect
			slot6 = slot4
			slot4 = slot4.add_atom
			slot7 = deep_clone
			slot9 = self._editor
			slot9 = slot9._clipboard_object

			slot4(slot5, slot7(slot8))

			slot6 = self
			slot4 = self.update_atom_combo

			slot4(slot5)

			slot4 = self._atom_combo
			slot6 = slot4
			slot4 = slot4.set_value
			slot7 = self._editor
			slot7 = slot7._clipboard_object
			slot9 = slot7
			slot7 = slot7.name

			slot4(slot5, slot7(slot8))

			slot6 = self
			slot4 = self.on_select_atom

			slot4(slot5)
		end
	end

	return 
end

slot0.on_paste_atom = slot1
slot0 = CoreParticleEditorPanel

function slot1(self)
	slot1 = self._valid_effect

	if slot1 then
		slot3 = self
		slot1 = self.update_effect_instance

		slot1(slot2)
	end

	return 
end

slot0.on_set_selected_only = slot1
slot0 = CoreParticleEditorPanel

function slot1(self, parent)
	slot2 = EWS
	slot4 = slot2
	slot2 = slot2.Panel
	slot5 = parent
	slot6 = ""
	slot7 = ""
	local panel = slot2(slot3, slot4, slot5, slot6)
	slot3 = EWS
	slot5 = slot3
	slot3 = slot3.ComboBox
	slot6 = panel
	slot7 = ""
	slot8 = ""
	slot9 = "CB_DROPDOWN,CB_READONLY"
	slot3 = slot3(slot4, slot5, slot6, slot7, slot8)
	self._atom_combo = slot3
	slot3 = self._atom_combo
	slot5 = slot3
	slot3 = slot3.connect
	slot6 = "EVT_COMMAND_TEXT_UPDATED"
	slot7 = callback
	slot9 = self
	slot10 = self
	slot11 = "on_select_atom"

	slot3(slot4, slot5, slot7(slot8, slot9, slot10))

	slot3 = EWS
	slot5 = slot3
	slot3 = slot3.Button
	slot6 = panel
	slot7 = "Remove"
	slot8 = ""
	slot9 = "BU_EXACTFIT"
	local remove_button = slot3(slot4, slot5, slot6, slot7, slot8)
	slot6 = remove_button
	slot4 = remove_button.connect
	slot7 = "EVT_COMMAND_BUTTON_CLICKED"
	slot8 = callback
	slot10 = self
	slot11 = self
	slot12 = "on_remove_atom"

	slot4(slot5, slot6, slot8(slot9, slot10, slot11))

	slot4 = EWS
	slot6 = slot4
	slot4 = slot4.Button
	slot7 = panel
	slot8 = "Copy"
	slot9 = ""
	slot10 = "BU_EXACTFIT"
	local copy_button = slot4(slot5, slot6, slot7, slot8, slot9)
	slot7 = copy_button
	slot5 = copy_button.connect
	slot8 = "EVT_COMMAND_BUTTON_CLICKED"
	slot9 = callback
	slot11 = self
	slot12 = self
	slot13 = "on_copy_atom"

	slot5(slot6, slot7, slot9(slot10, slot11, slot12))

	slot5 = EWS
	slot7 = slot5
	slot5 = slot5.Button
	slot8 = panel
	slot9 = "Paste"
	slot10 = ""
	slot11 = "BU_EXACTFIT"
	local paste_button = slot5(slot6, slot7, slot8, slot9, slot10)
	slot8 = paste_button
	slot6 = paste_button.connect
	slot9 = "EVT_COMMAND_BUTTON_CLICKED"
	slot10 = callback
	slot12 = self
	slot13 = self
	slot14 = "on_paste_atom"

	slot6(slot7, slot8, slot10(slot11, slot12, slot13))

	slot6 = EWS
	slot8 = slot6
	slot6 = slot6.TextCtrl
	slot9 = panel
	slot10 = ""
	slot11 = ""
	slot12 = "TE_PROCESS_ENTER"
	slot6 = slot6(slot7, slot8, slot9, slot10, slot11)
	self._atom_textctrl = slot6
	slot6 = self._atom_textctrl
	slot8 = slot6
	slot6 = slot6.connect
	slot9 = "EVT_COMMAND_TEXT_ENTER"
	slot10 = callback
	slot12 = self
	slot13 = self
	slot14 = "on_rename_atom"

	slot6(slot7, slot8, slot10(slot11, slot12, slot13))

	slot6 = EWS
	slot8 = slot6
	slot6 = slot6.Button
	slot9 = panel
	slot10 = "Add"
	slot11 = ""
	slot12 = "BU_EXACTFIT"
	local add_button = slot6(slot7, slot8, slot9, slot10, slot11)
	slot9 = add_button
	slot7 = add_button.connect
	slot10 = "EVT_COMMAND_BUTTON_CLICKED"
	slot11 = callback
	slot13 = self
	slot14 = self
	slot15 = "on_add_atom"

	slot7(slot8, slot9, slot11(slot12, slot13, slot14))

	slot7 = EWS
	slot9 = slot7
	slot7 = slot7.CheckBox
	slot10 = panel
	slot11 = "Render Selected Atom Only"
	slot12 = ""
	slot13 = ""
	slot7 = slot7(slot8, slot9, slot10, slot11, slot12)
	self._render_selected_only_check = slot7
	slot7 = self._render_selected_only_check
	slot9 = slot7
	slot7 = slot7.connect
	slot10 = "EVT_COMMAND_CHECKBOX_CLICKED"
	slot11 = callback
	slot13 = self
	slot14 = self
	slot15 = "on_set_selected_only"

	slot7(slot8, slot9, slot11(slot12, slot13, slot14))

	slot7 = EWS
	slot9 = slot7
	slot7 = slot7.BoxSizer
	slot10 = "VERTICAL"
	local top_sizer = slot7(slot8, slot9)
	slot8 = EWS
	slot10 = slot8
	slot8 = slot8.StaticBoxSizer
	slot11 = panel
	slot12 = "VERTICAL"
	slot13 = "Atoms"
	local atoms_sizer = slot8(slot9, slot10, slot11, slot12)
	slot9 = EWS
	slot11 = slot9
	slot9 = slot9.BoxSizer
	slot12 = "HORIZONTAL"
	local row_sizer = slot9(slot10, slot11)
	slot12 = row_sizer
	slot10 = row_sizer.add
	slot13 = EWS
	slot15 = slot13
	slot13 = slot13.StaticText
	slot16 = panel
	slot17 = "Atom:"
	slot18 = ""
	slot19 = ""
	slot13 = slot13(slot14, slot15, slot16, slot17, slot18)
	slot14 = 0
	slot15 = 0
	slot16 = "EXPAND"

	slot10(slot11, slot12, slot13, slot14, slot15)

	slot12 = row_sizer
	slot10 = row_sizer.add
	slot13 = self._atom_combo
	slot14 = 0
	slot15 = 0
	slot16 = "EXPAND"

	slot10(slot11, slot12, slot13, slot14, slot15)

	slot12 = row_sizer
	slot10 = row_sizer.add
	slot13 = remove_button
	slot14 = 0
	slot15 = 0
	slot16 = "EXPAND"

	slot10(slot11, slot12, slot13, slot14, slot15)

	slot12 = row_sizer
	slot10 = row_sizer.add
	slot13 = copy_button
	slot14 = 0
	slot15 = 0
	slot16 = "EXPAND"

	slot10(slot11, slot12, slot13, slot14, slot15)

	slot12 = row_sizer
	slot10 = row_sizer.add
	slot13 = paste_button
	slot14 = 0
	slot15 = 0
	slot16 = "EXPAND"

	slot10(slot11, slot12, slot13, slot14, slot15)

	slot12 = atoms_sizer
	slot10 = atoms_sizer.add
	slot13 = row_sizer
	slot14 = 0
	slot15 = 0
	slot16 = "EXPAND"

	slot10(slot11, slot12, slot13, slot14, slot15)

	slot10 = EWS
	slot12 = slot10
	slot10 = slot10.BoxSizer
	slot13 = "HORIZONTAL"
	slot10 = slot10(slot11, slot12)
	row_sizer = slot10
	slot12 = row_sizer
	slot10 = row_sizer.add
	slot13 = EWS
	slot15 = slot13
	slot13 = slot13.StaticText
	slot16 = panel
	slot17 = "Rename/add atom:"
	slot18 = ""
	slot19 = ""
	slot13 = slot13(slot14, slot15, slot16, slot17, slot18)
	slot14 = 0
	slot15 = 0
	slot16 = "LEFT,ALIGN_CENTER_VERTICAL"

	slot10(slot11, slot12, slot13, slot14, slot15)

	slot12 = row_sizer
	slot10 = row_sizer.add
	slot13 = self._atom_textctrl
	slot14 = 1
	slot15 = 2
	slot16 = "LEFT"

	slot10(slot11, slot12, slot13, slot14, slot15)

	slot12 = row_sizer
	slot10 = row_sizer.add
	slot13 = add_button
	slot14 = 0
	slot15 = 2
	slot16 = "RIGHT"

	slot10(slot11, slot12, slot13, slot14, slot15)

	slot12 = atoms_sizer
	slot10 = atoms_sizer.add
	slot13 = row_sizer
	slot14 = 0
	slot15 = 0
	slot16 = "EXPAND"

	slot10(slot11, slot12, slot13, slot14, slot15)

	slot12 = atoms_sizer
	slot10 = atoms_sizer.add
	slot13 = self._render_selected_only_check
	slot14 = 0
	slot15 = 0
	slot16 = "EXPAND"

	slot10(slot11, slot12, slot13, slot14, slot15)

	slot12 = top_sizer
	slot10 = top_sizer.add
	slot13 = atoms_sizer
	slot14 = 0
	slot15 = 0
	slot16 = "EXPAND"

	slot10(slot11, slot12, slot13, slot14, slot15)

	slot10 = EWS
	slot12 = slot10
	slot10 = slot10.Panel
	slot13 = panel
	slot14 = ""
	slot15 = ""
	slot10 = slot10(slot11, slot12, slot13, slot14)
	self._effect_properties_panel = slot10
	slot12 = self
	slot10 = self.create_graph_view
	slot13 = self._editor
	slot13 = slot13._main_frame

	slot10(slot11, slot12)

	slot12 = top_sizer
	slot10 = top_sizer.add
	slot13 = self._effect_properties_panel
	slot14 = 0
	slot15 = 0
	slot16 = "EXPAND"

	slot10(slot11, slot12, slot13, slot14, slot15)

	slot12 = panel
	slot10 = panel.set_sizer
	slot13 = top_sizer

	slot10(slot11, slot12)

	return panel
end

slot0.create_effect_panel = slot1
slot0 = CoreParticleEditorPanel

function slot1(self, b)
	slot2 = self._graph_view_dialog
	slot4 = slot2
	slot2 = slot2.show
	slot5 = b

	slot2(slot3, slot4)

	if b then
		slot4 = self
		slot2 = self.update_graph_view

		slot2(slot3)
	end

	return 
end

slot0.show_stack_overview = slot1
slot0 = CoreParticleEditorPanel

function slot1(self, parent)
	slot2 = EWS
	slot4 = slot2
	slot2 = slot2.Dialog
	slot5 = parent
	slot6 = "Stacks And Channels Overview"
	slot7 = ""
	slot8 = Vector3
	slot10 = -1
	slot11 = -1
	slot12 = 0
	slot8 = slot8(slot9, slot10, slot11)
	slot9 = Vector3
	slot11 = 500
	slot12 = 400
	slot13 = 0
	slot9 = slot9(slot10, slot11, slot12)
	slot10 = "CAPTION,RESIZE_BORDER"
	slot2 = slot2(slot3, slot4, slot5, slot6, slot7, slot8, slot9)
	self._graph_view_dialog = slot2
	slot2 = EWS
	slot4 = slot2
	slot2 = slot2.Graph
	slot2 = slot2(slot3)
	self._graph = slot2
	slot2 = EWS
	slot4 = slot2
	slot2 = slot2.GraphView
	slot5 = self._graph_view_dialog
	slot6 = ""
	slot7 = self._graph
	local gv = slot2(slot3, slot4, slot5, slot6)
	slot5 = gv
	slot3 = gv.set_clipping
	slot6 = false

	slot3(slot4, slot5)

	slot5 = gv
	slot3 = gv.toggle_style
	slot6 = "SUNKEN_BORDER"

	slot3(slot4, slot5)

	self._graph_view = gv
	slot3 = EWS
	slot5 = slot3
	slot3 = slot3.BoxSizer
	slot6 = "VERTICAL"
	local top_sizer = slot3(slot4, slot5)
	slot6 = top_sizer
	slot4 = top_sizer.add
	slot7 = gv
	slot8 = 1
	slot9 = 0
	slot10 = "EXPAND"

	slot4(slot5, slot6, slot7, slot8, slot9)

	slot4 = self._graph_view_dialog
	slot6 = slot4
	slot4 = slot4.set_sizer
	slot7 = top_sizer

	slot4(slot5, slot6)

	slot4 = self._editor
	slot4 = slot4._view_menu
	slot6 = slot4
	slot4 = slot4.is_checked
	slot7 = "SHOW_STACK_OVERVIEW"
	slot4 = slot4(slot5, slot6)

	if slot4 then
		slot6 = self
		slot4 = self.show_stack_overview
		slot7 = true

		slot4(slot5, slot6)
	end

	return 
end

slot0.create_graph_view = slot1
slot0 = CoreParticleEditorPanel

function slot1(self, parent)
	slot2 = EWS
	slot4 = slot2
	slot2 = slot2.TextCtrl
	slot5 = parent
	slot6 = ""
	slot7 = ""
	slot8 = "TE_MULTILINE,TE_READONLY,TE_RICH2,TE_NOHIDESEL"

	return slot2(slot3, slot4, slot5, slot6, slot7)
end

slot0.create_status_box = slot1
slot0 = CoreParticleEditorPanel

function slot1(self, stacktype)
	slot2 = self._stacklist_boxes
	local box = slot2[stacktype]
	slot5 = box
	slot3 = box.selected_index
	local selected = slot3(slot4)
	slot4 = 0

	if selected < slot4 then
		return 
	end

	slot4 = self._atom
	slot6 = slot4
	slot4 = slot4.stack
	slot7 = stacktype
	slot4 = slot4(slot5, slot6)
	slot6 = slot4
	slot4 = slot4.move_up
	slot7 = selected + 1

	slot4(slot5, slot6)

	slot6 = self
	slot4 = self.update_view
	slot7 = true

	slot4(slot5, slot6)

	return 
end

slot0.on_stack_up = slot1
slot0 = CoreParticleEditorPanel

function slot1(self, stacktype)
	slot2 = self._stacklist_boxes
	local box = slot2[stacktype]
	slot5 = box
	slot3 = box.selected_index
	local selected = slot3(slot4)
	slot4 = 0

	if selected < slot4 then
		return 
	end

	slot4 = self._atom
	slot6 = slot4
	slot4 = slot4.stack
	slot7 = stacktype
	slot4 = slot4(slot5, slot6)
	slot6 = slot4
	slot4 = slot4.move_down
	slot7 = selected + 1

	slot4(slot5, slot6)

	slot6 = self
	slot4 = self.update_view
	slot7 = true

	slot4(slot5, slot6)

	return 
end

slot0.on_stack_down = slot1
slot0 = CoreParticleEditorPanel

function slot1(self, stacktype)
	slot2 = self._stacklist_boxes
	local box = slot2[stacktype]
	slot5 = box
	slot3 = box.selected_index
	local selected = slot3(slot4)
	slot4 = 0

	if selected < slot4 then
		return 
	end

	slot4 = self._atom
	slot6 = slot4
	slot4 = slot4.stack
	slot7 = stacktype
	slot4 = slot4(slot5, slot6)
	slot6 = slot4
	slot4 = slot4.remove
	slot7 = selected + 1

	slot4(slot5, slot6)

	slot6 = self
	slot4 = self.update_view
	slot7 = true

	slot4(slot5, slot6)

	return 
end

slot0.on_stack_remove = slot1
slot0 = CoreParticleEditorPanel

function slot1(self, stacktype)
	slot2 = self._atom

	if not slot2 then
		return 
	end

	slot2 = stack_members
	local members = slot2[stacktype]
	slot3 = stack_member_names
	local member_names = slot3[stacktype]
	slot4 = self._stack_member_combos
	slot4 = slot4[stacktype]
	slot6 = slot4
	slot4 = slot4.get_selection
	local to_add_idx = slot4(slot5)
	slot5 = 0

	if to_add_idx < slot5 then
		return 
	end

	slot5 = self._atom
	slot7 = slot5
	slot5 = slot5.stack
	slot8 = stacktype
	slot5 = slot5(slot6, slot7)
	slot7 = slot5
	slot5 = slot5.add_member
	slot8 = to_add_idx + 1
	slot8 = member_names[slot8]
	slot8 = slot8.key
	slot8 = members[slot8]

	slot5(slot6, slot8())

	slot7 = self
	slot5 = self.update_view
	slot8 = true

	slot5(slot6, slot7)

	slot5 = self._stacklist_boxes
	slot5 = slot5[stacktype]
	slot7 = slot5
	slot5 = slot5.select_index
	slot8 = self._stacklist_boxes
	slot8 = slot8[stacktype]
	slot10 = slot8
	slot8 = slot8.nr_items
	slot8 = slot8(slot9)
	slot8 = slot8 - 1

	slot5(slot6, slot7)

	slot7 = self
	slot5 = self.on_select_stack_member
	slot8 = stacktype

	slot5(slot6, slot7)

	return 
end

slot0.on_stack_add = slot1
slot0 = CoreParticleEditorPanel

function slot1(self, stacktype)
	slot2 = self._stacklist_boxes
	local stacklist = slot2[stacktype]
	slot5 = stacklist
	slot3 = stacklist.selected_index
	local selected = slot3(slot4)
	slot4 = 0

	if selected < slot4 then
	else
		slot4 = self._atom
		slot6 = slot4
		slot4 = slot4.stack
		slot7 = stacktype
		slot4 = slot4(slot5, slot6)
		slot6 = slot4
		slot4 = slot4.stack
		slot4 = slot4(slot5)
		slot5 = selected + 1
		slot4 = slot4[slot5]
		slot6 = slot4
		slot4 = slot4.fill_property_container_sheet
		slot7 = self._stack_panels
		slot7 = slot7[stacktype]
		slot8 = self

		slot4(slot5, slot6, slot7)

		slot4 = self._stack_panels
		slot4 = slot4[stacktype]
		slot6 = slot4
		slot4 = slot4.fit_inside

		slot4(slot5)
	end

	return 
end

slot0.on_select_stack_member = slot1
slot0 = CoreParticleEditorPanel

function slot1(self, quality)
	slot2 = true
	self._dirty_effect = slot2
	self._quality = quality

	return 
end

slot0.update_effect_instance = slot1
slot0 = CoreParticleEditorPanel

function slot1(self)
	slot1 = Node
	slot3 = "effect"
	local n = slot1(slot2)
	slot2 = self._render_selected_only_check
	slot4 = slot2
	slot2 = slot2.get_value
	slot2 = slot2(slot3)

	if slot2 then
		slot2 = self._atom
	else
		slot2 = self._effect
		slot4 = slot2
		slot2 = slot2.save
		slot5 = n

		slot2(slot3, slot4)
	end

	slot2 = CoreEngineAccess
	slot2 = slot2._editor_reload_node
	slot4 = n
	slot5 = Idstring
	slot7 = "effect"
	slot5 = slot5(slot6)
	slot6 = Idstring
	slot8 = "unique_test_effect_name"

	slot2(slot3, slot4, slot6(slot7))

	slot2 = nil
	self._effect_id = slot2

	return 
end

slot0.reload_effect_definition = slot1
slot0 = CoreParticleEditorPanel

function slot1(self, t, dt)
	slot3 = self._valid_effect

	if slot3 then
		slot3 = self._dirty_effect

		if slot3 then
			slot5 = self
			slot3 = self.reload_effect_definition

			slot3(slot4)

			slot3 = false
			self._dirty_effect = slot3
		end

		slot3 = self._effect_id
	else
		slot3 = self._effect_id

		if slot3 then
			slot3 = World
			slot5 = slot3
			slot3 = slot3.effect_manager
			slot3 = slot3(slot4)
			slot5 = slot3
			slot3 = slot3.kill
			slot6 = self._effect_id

			slot3(slot4, slot5)

			slot3 = nil
			self._effect_id = slot3
		end
	end

	slot3 = self._editor
	slot3 = slot3._view_menu
	slot5 = slot3
	slot3 = slot3.is_checked
	slot6 = "SHOW_STACK_OVERVIEW"
	slot3 = slot3(slot4, slot5)

	if slot3 then
		slot3 = self._graph_view
		slot5 = slot3
		slot3 = slot3.update_graph
		slot6 = dt

		slot3(slot4, slot5)
	end

	return 
end

slot0.update = slot1
slot0 = CoreParticleEditorPanel

function slot1(self)
	slot1 = self._graph
	slot3 = slot1
	slot1 = slot1.clear

	slot1(slot2)

	slot1 = self._atom

	if not slot1 then
		return 
	end

	local stacks = {
		"initializer",
		"simulator",
		"visualizer"
	}
	local row = 0
	local channel_height = 20
	local row_height = 70
	local channels = {}
	local affector_x = 0
	local channel_x_count = 110

	local function channel_x(channel)
		slot1 = channels
		slot1 = slot1[channel]

		if not slot1 then
			slot1 = channels
			slot2 = channel_x_count
			slot1[channel] = slot2
			slot1 = channel_x_count
			slot1 = slot1 + 80
			channel_x_count = slot1
		end

		slot1 = channels
		slot1 = slot1[channel]

		return slot1
	end

	slot9 = ipairs
	slot11 = stacks
	slot9, slot10, slot11 = slot9(slot10)

	for _, stacktype in slot9, slot10, slot11 do
		slot14 = ipairs
		slot16 = self._atom
		slot18 = slot16
		slot16 = slot16.stack
		slot19 = stacktype
		slot16 = slot16(slot17, slot18)
		slot18 = slot16
		slot16 = slot16.stack
		slot14, slot15, slot16 = slot14(slot16(slot17))

		for _, m in slot14, slot15, slot16 do
			slot19 = m._valid_properties

			if slot19 then
				slot19 = EWS
				slot21 = slot19
				slot19 = slot19.Node
				slot24 = m
				slot22 = m.name
				slot22 = slot22(slot23)
				slot23 = affector_x
				slot24 = row * row_height
				local affector_node = slot19(slot20, slot21, slot22, slot23)
				slot20 = self._graph
				slot22 = slot20
				slot20 = slot20.add_node
				slot23 = affector_node

				slot20(slot21, slot22)

				local reads = {}
				local writes = {}
				slot24 = m
				slot22 = m.reads_writes
				slot22, slot23 = slot22(slot23)
				writes = slot23
				reads = slot22
				slot22 = pairs
				slot24 = reads
				slot22, slot23, slot24 = slot22(slot23)

				for channel, read_type in slot22, slot23, slot24 do
					slot27 = EWS
					slot29 = slot27
					slot27 = slot27.Node
					slot30 = channel
					slot31 = channel_x
					slot33 = channel
					slot31 = slot31(slot32)
					slot32 = row * row_height
					slot32 = slot32 - channel_height
					local read_node = slot27(slot28, slot29, slot30, slot31)
					slot28 = self._graph
					slot30 = slot28
					slot28 = slot28.add_node
					slot31 = read_node

					slot28(slot29, slot30)

					slot30 = read_node
					slot28 = read_node.free_slot
					local slot = slot28(slot29)
					slot31 = read_node
					slot29 = read_node.set_target
					slot32 = slot
					slot33 = affector_node
					slot34 = "read "
					slot35 = channel
					slot34 = slot34 .. slot35

					slot29(slot30, slot31, slot32, slot33)
				end

				slot22 = pairs
				slot24 = writes
				slot22, slot23, slot24 = slot22(slot23)

				for channel, read_type in slot22, slot23, slot24 do
					slot27 = EWS
					slot29 = slot27
					slot27 = slot27.Node
					slot30 = channel
					slot31 = channel_x
					slot33 = channel
					slot31 = slot31(slot32)
					slot32 = row * row_height
					slot32 = slot32 + channel_height
					local write_node = slot27(slot28, slot29, slot30, slot31)
					slot28 = self._graph
					slot30 = slot28
					slot28 = slot28.add_node
					slot31 = write_node

					slot28(slot29, slot30)

					slot30 = affector_node
					slot28 = affector_node.free_slot
					local slot = slot28(slot29)
					slot31 = affector_node
					slot29 = affector_node.set_target
					slot32 = slot
					slot33 = write_node
					slot34 = "write "
					slot35 = channel
					slot36 = " "
					slot37 = read_type
					slot34 = slot34 .. slot35 .. slot36 .. slot37

					slot29(slot30, slot31, slot32, slot33)
				end
			else
				slot19 = EWS
				slot21 = slot19
				slot19 = slot19.Node
				slot22 = "INVALID: "
				slot25 = m
				slot23 = m.name
				slot23 = slot23(slot24)
				slot22 = slot22 .. slot23
				slot23 = affector_x
				slot24 = row * row_height
				local affector_node = slot19(slot20, slot21, slot22, slot23)
				slot20 = self._graph
				slot22 = slot20
				slot20 = slot20.add_node
				slot23 = affector_node

				slot20(slot21, slot22)
			end

			row = row + 1
		end
	end

	slot9 = self._graph_view
	slot11 = slot9
	slot9 = slot9.refresh

	slot9(slot10)

	return 
end

slot0.update_graph_view = slot1
slot0 = CoreParticleEditorPanel

function slot1(self, clear, undoredo)
	slot3 = Node
	slot5 = "effect"
	local n = slot3(slot4)
	slot4 = self._effect
	slot6 = slot4
	slot4 = slot4.save
	slot7 = n

	slot4(slot5, slot6)

	slot6 = n
	slot4 = n.to_xml
	local new_xml = slot4(slot5)

	if not undoredo then
		slot5 = self._undo_stack
		slot7 = slot5
		slot5 = slot5.push
		slot8 = {}
		slot9 = self._effect
		slot11 = slot9
		slot9 = slot9.name
		slot9 = slot9(slot10)
		slot8.name = slot9
		slot8.xml = new_xml

		slot5(slot6, slot7)
	end

	slot5 = self._effect
	slot7 = slot5
	slot5 = slot5.name
	local name = slot5(slot6)

	if name == "" then
		name = "New Effect"
	end

	slot6 = self._last_saved_xml

	if new_xml ~= slot6 then
		slot6 = name
		slot7 = "*"
		name = slot6 .. slot7
	end

	slot6 = self._editor
	slot8 = slot6
	slot6 = slot6.set_page_name
	slot9 = self
	slot10 = base_path
	slot12 = name

	slot6(slot7, slot8, slot10(slot11))

	if clear then
		slot6 = self._atom_panel
		slot8 = slot6
		slot6 = slot6.destroy_children

		slot6(slot7)

		slot6 = self._atom

		if slot6 then
			slot6 = self._atom
			slot8 = slot6
			slot6 = slot6.fill_property_container_sheet
			slot9 = self._atom_panel
			slot10 = self

			slot6(slot7, slot8, slot9)
		else
			slot6 = self._atom_panel
			slot8 = slot6
			slot6 = slot6.set_sizer
			slot9 = EWS
			slot11 = slot9
			slot9 = slot9.BoxSizer
			slot12 = "VERTICAL"

			slot6(slot7, slot9(slot10, slot11))
		end
	else
		slot6 = self._atom

		if slot6 then
			slot8 = self
			slot6 = self.fill_timelines

			slot6(slot7)
		end
	end

	if clear then
		slot6 = self._effect_properties_panel
		slot8 = slot6
		slot6 = slot6.destroy_children

		slot6(slot7)

		slot6 = self._effect

		if slot6 then
			slot6 = self._effect
			slot8 = slot6
			slot6 = slot6.fill_property_container_sheet
			slot9 = self._effect_properties_panel
			slot10 = self

			slot6(slot7, slot8, slot9)
		else
			slot6 = self._effect_properties_panel
			slot8 = slot6
			slot6 = slot6.set_sizer
			slot9 = EWS
			slot11 = slot9
			slot9 = slot9.BoxSizer
			slot12 = "VERTICAL"

			slot6(slot7, slot9(slot10, slot11))
		end
	end

	if clear then
		slot6 = pairs
		slot8 = self._stacklist_boxes
		slot6, slot7, slot8 = slot6(slot7)

		for stacktype, c in slot6, slot7, slot8 do
			slot13 = c
			slot11 = c.clear

			slot11(slot12)

			slot11 = self._atom

			if slot11 then
				slot11 = ipairs
				slot13 = self._atom
				slot15 = slot13
				slot13 = slot13.stack
				slot16 = stacktype
				slot13 = slot13(slot14, slot15)
				slot15 = slot13
				slot13 = slot13.stack
				slot11, slot12, slot13 = slot11(slot13(slot14))

				for _, m in slot11, slot12, slot13 do
					slot18 = c
					slot16 = c.append
					slot21 = m
					slot19 = m.ui_name

					slot16(slot17, slot19(slot20))
				end
			end

			slot11 = self._stack_panels
			slot11 = slot11[stacktype]
			slot13 = slot11
			slot11 = slot11.destroy_children

			slot11(slot12)

			slot11 = self._stack_panels
			slot11 = slot11[stacktype]
			slot13 = slot11
			slot11 = slot11.set_sizer
			slot14 = EWS
			slot16 = slot14
			slot14 = slot14.BoxSizer
			slot17 = "VERTICAL"

			slot11(slot12, slot14(slot15, slot16))
		end
	end

	slot6 = pairs
	slot8 = self._stack_panels
	slot6, slot7, slot8 = slot6(slot7)

	for stacktype, panel in slot6, slot7, slot8 do
		slot13 = panel
		slot11 = panel.fit_inside

		slot11(slot12)
	end

	slot6 = self._effect
	slot8 = slot6
	slot6 = slot6.validate
	local valid = slot6(slot7)
	slot7 = valid.valid
	self._valid_effect = slot7
	slot7 = valid.valid

	if not slot7 then
		slot7 = valid.message
		self._box_status = slot7
	else
		slot7 = "Effect is valid"
		self._box_status = slot7
	end

	slot9 = self
	slot7 = self.update_status_box

	slot7(slot8)

	slot7 = self._editor
	slot7 = slot7._view_menu
	slot9 = slot7
	slot7 = slot7.is_checked
	slot10 = "SHOW_STACK_OVERVIEW"
	slot7 = slot7(slot8, slot9)

	if slot7 then
		slot9 = self
		slot7 = self.update_graph_view

		slot7(slot8)
	end

	slot9 = self
	slot7 = self.safety_backup

	slot7(slot8)

	slot7 = valid.valid

	if slot7 then
		slot9 = self
		slot7 = self.update_effect_instance

		slot7(slot8)
	end

	return 
end

slot0.update_view = slot1
slot0 = CoreParticleEditorPanel

function slot1(self)
	slot1 = self._status_box
	slot3 = slot1
	slot1 = slot1.set_value
	slot4 = ""

	slot1(slot2, slot3)

	slot1 = self._valid_effect

	if not slot1 then
		slot1 = self._status_box
		slot3 = slot1
		slot1 = slot1.set_default_style_colour
		slot4 = Vector3
		slot6 = 200
		slot7 = 0
		slot8 = 0

		slot1(slot2, slot4(slot5, slot6, slot7))
	else
		slot1 = self._status_box
		slot3 = slot1
		slot1 = slot1.set_default_style_colour
		slot4 = Vector3
		slot6 = 0
		slot7 = 190
		slot8 = 0

		slot1(slot2, slot4(slot5, slot6, slot7))
	end

	slot1 = self._status_box
	slot3 = slot1
	slot1 = slot1.append
	slot4 = self._box_status
	slot5 = "\n"
	slot4 = slot4 .. slot5

	slot1(slot2, slot3)

	slot1 = self._status_box
	slot3 = slot1
	slot1 = slot1.append
	slot4 = "\n"

	slot1(slot2, slot3)

	slot1 = self._status_box
	slot3 = slot1
	slot1 = slot1.set_default_style_colour
	slot4 = Vector3
	slot6 = 0
	slot7 = 0
	slot8 = 0

	slot1(slot2, slot4(slot5, slot6, slot7))

	slot1 = self._status_box
	slot3 = slot1
	slot1 = slot1.append
	slot4 = self._box_help_header
	slot5 = "\n"
	slot4 = slot4 .. slot5

	slot1(slot2, slot3)

	slot1 = self._status_box
	slot3 = slot1
	slot1 = slot1.set_default_style_colour
	slot4 = Vector3
	slot6 = 110
	slot7 = 110
	slot8 = 110

	slot1(slot2, slot4(slot5, slot6, slot7))

	slot1 = self._status_box
	slot3 = slot1
	slot1 = slot1.append
	slot4 = self._box_help
	slot5 = "\n"
	slot4 = slot4 .. slot5

	slot1(slot2, slot3)

	return 
end

slot0.update_status_box = slot1
slot0 = CoreParticleEditorPanel

function slot1(self)
	slot1 = Node
	slot3 = "effect"
	local n = slot1(slot2)
	slot2 = self._effect
	slot4 = slot2
	slot2 = slot2.save
	slot5 = n

	slot2(slot3, slot4)

	slot2 = managers
	slot2 = slot2.database
	slot4 = slot2
	slot2 = slot2.save_node
	slot5 = n
	slot6 = "last_played_effect.xml"

	slot2(slot3, slot4, slot5)

	return 
end

slot0.safety_backup = slot1
slot0 = CoreParticleEditorPanel

function slot1(self, stacktype)
	slot2 = self._stacklist_boxes
	local box = slot2[stacktype]
	slot5 = box
	slot3 = box.selected_index
	local selected = slot3(slot4)
	slot4 = 0

	if selected < slot4 then
		return 
	end

	slot4 = self._editor
	slot4._clipboard_type = stacktype
	slot4 = self._editor
	slot5 = deep_clone
	slot7 = self._atom
	slot9 = slot7
	slot7 = slot7.stack
	slot10 = stacktype
	slot7 = slot7(slot8, slot9)
	slot9 = slot7
	slot7 = slot7.member
	slot10 = selected + 1
	slot5 = slot5(slot7(slot8, slot9))
	slot4._clipboard_object = slot5

	return 
end

slot0.on_stack_copy = slot1
slot0 = CoreParticleEditorPanel

function slot1(self, stacktype)

	-- Decompilation error in this vicinity:
	slot2 = self._editor
	slot2 = slot2._clipboard_type
	slot2 = self._stacklist_boxes
	local box = slot2[stacktype]
	slot5 = box
	slot3 = box.selected_index
	local selected = slot3(slot4)
	slot4 = 0

	if selected < slot4 then
		selected = nil
	else
		selected = selected + 1
	end

	if not selected then
		slot4 = self._atom
		slot6 = slot4
		slot4 = slot4.stack
		slot7 = stacktype
		slot4 = slot4(slot5, slot6)
		slot6 = slot4
		slot4 = slot4.add_member
		slot7 = deep_clone
		slot9 = self._editor
		slot9 = slot9._clipboard_object

		slot4(slot5, slot7(slot8))
	else
		slot4 = self._atom
		slot6 = slot4
		slot4 = slot4.stack
		slot7 = stacktype
		slot4 = slot4(slot5, slot6)
		slot6 = slot4
		slot4 = slot4.insert_member
		slot7 = deep_clone
		slot9 = self._editor
		slot9 = slot9._clipboard_object
		slot7 = slot7(slot8)
		slot8 = selected

		slot4(slot5, slot6, slot7)
	end

	slot6 = self
	slot4 = self.update_view
	slot7 = true

	slot4(slot5, slot6)

	return 
end

slot0.on_stack_paste = slot1
slot0 = CoreParticleEditorPanel

function slot1(self)
	slot1 = self._effect_id

	if slot1 then
		slot1 = self._effect_id
		slot2 = 0

		if slot2 < slot1 then
			slot1 = World
			slot3 = slot1
			slot1 = slot1.effect_manager
			slot1 = slot1(slot2)
			slot3 = slot1
			slot1 = slot1.kill
			slot4 = self._effect_id

			slot1(slot2, slot3)
		end
	end

	slot3 = self
	slot1 = self.show_stack_overview
	slot4 = false

	slot1(slot2, slot3)

	return 
end

slot0.on_lose_focus = slot1
slot0 = CoreParticleEditorPanel

function slot1(self, stacktype, event)
	slot5 = event
	slot3 = event.control_down
	slot3 = slot3(slot4)

	if slot3 then
		slot5 = event
		slot3 = event.key_code
		slot3 = slot3(slot4)

		if slot3 == 67 then
			slot5 = self
			slot3 = self.on_stack_copy
			slot6 = stacktype

			slot3(slot4, slot5)
		else
			slot5 = event
			slot3 = event.key_code
			slot3 = slot3(slot4)

			if slot3 == 86 then
				slot5 = self
				slot3 = self.on_stack_paste
				slot6 = stacktype

				slot3(slot4, slot5)
			end
		end
	end

	return 
end

slot0.on_key_stack_member = slot1
slot0 = CoreParticleEditorPanel

function slot1(self, parent, stacktype)
	slot3 = EWS
	slot5 = slot3
	slot3 = slot3.Panel
	slot6 = parent
	slot7 = ""
	slot8 = ""
	local panel = slot3(slot4, slot5, slot6, slot7)
	slot4 = EWS
	slot6 = slot4
	slot4 = slot4.ListBox
	slot7 = panel
	slot8 = "particle_editor_stacklist"
	slot9 = "LB_SINGLE,LB_HSCROLL"
	local stacklist = slot4(slot5, slot6, slot7, slot8)
	slot5 = set_widget_help
	slot7 = stacklist
	slot8 = "Copy and paste using Ctrl-C/Ctrl-V"

	slot5(slot6, slot7)

	slot7 = stacklist
	slot5 = stacklist.connect
	slot8 = "EVT_COMMAND_LISTBOX_SELECTED"
	slot9 = callback
	slot11 = self
	slot12 = self
	slot13 = "on_select_stack_member"
	slot9 = slot9(slot10, slot11, slot12)
	slot10 = stacktype

	slot5(slot6, slot7, slot8, slot9)

	slot7 = stacklist
	slot5 = stacklist.connect
	slot8 = "EVT_KEY_DOWN"
	slot9 = callback
	slot11 = self
	slot12 = self
	slot13 = "on_key_stack_member"
	slot9 = slot9(slot10, slot11, slot12)
	slot10 = stacktype

	slot5(slot6, slot7, slot8, slot9)

	slot5 = self._stacklist_boxes
	slot5[stacktype] = stacklist
	slot5 = EWS
	slot7 = slot5
	slot5 = slot5.ComboBox
	slot8 = panel
	slot9 = ""
	slot10 = ""
	slot11 = "CB_DROPDOWN,CB_READONLY"
	local stack_member_combo = slot5(slot6, slot7, slot8, slot9, slot10)
	slot6 = stack_member_names
	local member_names = slot6[stacktype]
	local last = nil
	slot8 = ipairs
	slot10 = member_names
	slot8, slot9, slot10 = slot8(slot9)

	for _, mn in slot8, slot9, slot10 do
		slot15 = stack_member_combo
		slot13 = stack_member_combo.append
		slot16 = mn.ui_name

		slot13(slot14, slot15)

		last = mn.ui_name
	end

	slot10 = stack_member_combo
	slot8 = stack_member_combo.set_value
	slot11 = last

	slot8(slot9, slot10)

	slot8 = self._stack_member_combos
	slot8[stacktype] = stack_member_combo
	slot8 = EWS
	slot10 = slot8
	slot8 = slot8.Button
	slot11 = panel
	slot12 = "Up"
	slot13 = ""
	slot14 = ""
	local up_button = slot8(slot9, slot10, slot11, slot12, slot13)
	slot9 = EWS
	slot11 = slot9
	slot9 = slot9.Button
	slot12 = panel
	slot13 = "Down"
	slot14 = ""
	slot15 = ""
	local down_button = slot9(slot10, slot11, slot12, slot13, slot14)
	slot10 = EWS
	slot12 = slot10
	slot10 = slot10.Button
	slot13 = panel
	slot14 = "Remove"
	slot15 = ""
	slot16 = ""
	local remove_button = slot10(slot11, slot12, slot13, slot14, slot15)
	slot11 = EWS
	slot13 = slot11
	slot11 = slot11.Button
	slot14 = panel
	slot15 = "Add"
	slot16 = ""
	slot17 = ""
	local add_button = slot11(slot12, slot13, slot14, slot15, slot16)
	slot12 = EWS
	slot14 = slot12
	slot12 = slot12.Button
	slot15 = panel
	slot16 = "Copy"
	slot17 = ""
	slot18 = ""
	local copy_button = slot12(slot13, slot14, slot15, slot16, slot17)
	slot13 = EWS
	slot15 = slot13
	slot13 = slot13.Button
	slot16 = panel
	slot17 = "Paste"
	slot18 = ""
	slot19 = ""
	local paste_button = slot13(slot14, slot15, slot16, slot17, slot18)
	slot16 = up_button
	slot14 = up_button.connect
	slot17 = "EVT_COMMAND_BUTTON_CLICKED"
	slot18 = callback
	slot20 = self
	slot21 = self
	slot22 = "on_stack_up"
	slot23 = stacktype

	slot14(slot15, slot16, slot18(slot19, slot20, slot21, slot22))

	slot16 = down_button
	slot14 = down_button.connect
	slot17 = "EVT_COMMAND_BUTTON_CLICKED"
	slot18 = callback
	slot20 = self
	slot21 = self
	slot22 = "on_stack_down"
	slot23 = stacktype

	slot14(slot15, slot16, slot18(slot19, slot20, slot21, slot22))

	slot16 = remove_button
	slot14 = remove_button.connect
	slot17 = "EVT_COMMAND_BUTTON_CLICKED"
	slot18 = callback
	slot20 = self
	slot21 = self
	slot22 = "on_stack_remove"
	slot23 = stacktype

	slot14(slot15, slot16, slot18(slot19, slot20, slot21, slot22))

	slot16 = add_button
	slot14 = add_button.connect
	slot17 = "EVT_COMMAND_BUTTON_CLICKED"
	slot18 = callback
	slot20 = self
	slot21 = self
	slot22 = "on_stack_add"
	slot23 = stacktype

	slot14(slot15, slot16, slot18(slot19, slot20, slot21, slot22))

	slot16 = copy_button
	slot14 = copy_button.connect
	slot17 = "EVT_COMMAND_BUTTON_CLICKED"
	slot18 = callback
	slot20 = self
	slot21 = self
	slot22 = "on_stack_copy"
	slot23 = stacktype

	slot14(slot15, slot16, slot18(slot19, slot20, slot21, slot22))

	slot16 = paste_button
	slot14 = paste_button.connect
	slot17 = "EVT_COMMAND_BUTTON_CLICKED"
	slot18 = callback
	slot20 = self
	slot21 = self
	slot22 = "on_stack_paste"
	slot23 = stacktype

	slot14(slot15, slot16, slot18(slot19, slot20, slot21, slot22))

	slot14 = EWS
	slot16 = slot14
	slot14 = slot14.ScrolledWindow
	slot17 = panel
	slot18 = ""
	slot19 = "HSCROLL,VSCROLL"
	local affector_panel = slot14(slot15, slot16, slot17, slot18)
	slot17 = affector_panel
	slot15 = affector_panel.set_scrollbars
	slot18 = Vector3
	slot20 = 8
	slot21 = 8
	slot22 = 1
	slot18 = slot18(slot19, slot20, slot21)
	slot19 = Vector3
	slot21 = 1
	slot22 = 1
	slot23 = 1
	slot19 = slot19(slot20, slot21, slot22)
	slot20 = Vector3
	slot22 = 0
	slot23 = 0
	slot24 = 0
	slot20 = slot20(slot21, slot22, slot23)
	slot21 = false

	slot15(slot16, slot17, slot18, slot19, slot20)

	slot15 = self._stack_panels
	slot15[stacktype] = affector_panel
	slot15 = EWS
	slot17 = slot15
	slot15 = slot15.BoxSizer
	slot18 = "VERTICAL"
	local top_sizer = slot15(slot16, slot17)
	slot16 = EWS
	slot18 = slot16
	slot16 = slot16.BoxSizer
	slot19 = "VERTICAL"
	local top_stacklist_sizer = slot16(slot17, slot18)
	slot17 = EWS
	slot19 = slot17
	slot17 = slot17.BoxSizer
	slot20 = "HORIZONTAL"
	local add_member_sizer = slot17(slot18, slot19)
	slot18 = EWS
	slot20 = slot18
	slot18 = slot18.BoxSizer
	slot21 = "HORIZONTAL"
	local stacklist_sizer = slot18(slot19, slot20)
	slot19 = EWS
	slot21 = slot19
	slot19 = slot19.BoxSizer
	slot22 = "VERTICAL"
	local button_sizer = slot19(slot20, slot21)
	slot22 = button_sizer
	slot20 = button_sizer.add
	slot23 = up_button
	slot24 = 0
	slot25 = 2
	slot26 = "ALL"

	slot20(slot21, slot22, slot23, slot24, slot25)

	slot22 = button_sizer
	slot20 = button_sizer.add
	slot23 = down_button
	slot24 = 0
	slot25 = 2
	slot26 = "ALL"

	slot20(slot21, slot22, slot23, slot24, slot25)

	slot22 = button_sizer
	slot20 = button_sizer.add
	slot23 = remove_button
	slot24 = 0
	slot25 = 2
	slot26 = "ALL"

	slot20(slot21, slot22, slot23, slot24, slot25)

	slot22 = button_sizer
	slot20 = button_sizer.add
	slot23 = copy_button
	slot24 = 0
	slot25 = 2
	slot26 = "ALL"

	slot20(slot21, slot22, slot23, slot24, slot25)

	slot22 = button_sizer
	slot20 = button_sizer.add
	slot23 = paste_button
	slot24 = 0
	slot25 = 2
	slot26 = "ALL"

	slot20(slot21, slot22, slot23, slot24, slot25)

	slot22 = stacklist_sizer
	slot20 = stacklist_sizer.add
	slot23 = stacklist
	slot24 = 1
	slot25 = 0
	slot26 = "EXPAND"

	slot20(slot21, slot22, slot23, slot24, slot25)

	slot22 = stacklist_sizer
	slot20 = stacklist_sizer.add
	slot23 = button_sizer
	slot24 = 0
	slot25 = 0
	slot26 = "EXPAND"

	slot20(slot21, slot22, slot23, slot24, slot25)

	slot22 = add_member_sizer
	slot20 = add_member_sizer.add
	slot23 = add_button
	slot24 = 0
	slot25 = 2
	slot26 = "ALL"

	slot20(slot21, slot22, slot23, slot24, slot25)

	slot22 = add_member_sizer
	slot20 = add_member_sizer.add
	slot23 = stack_member_combo
	slot24 = 1
	slot25 = 0
	slot26 = "EXPAND"

	slot20(slot21, slot22, slot23, slot24, slot25)

	slot22 = top_stacklist_sizer
	slot20 = top_stacklist_sizer.add
	slot23 = stacklist_sizer
	slot24 = 0
	slot25 = 0
	slot26 = "EXPAND"

	slot20(slot21, slot22, slot23, slot24, slot25)

	slot22 = top_stacklist_sizer
	slot20 = top_stacklist_sizer.add
	slot23 = add_member_sizer
	slot24 = 0
	slot25 = 0
	slot26 = "EXPAND"

	slot20(slot21, slot22, slot23, slot24, slot25)

	slot22 = top_sizer
	slot20 = top_sizer.add
	slot23 = top_stacklist_sizer
	slot24 = 0
	slot25 = 0
	slot26 = "EXPAND"

	slot20(slot21, slot22, slot23, slot24, slot25)

	slot22 = top_sizer
	slot20 = top_sizer.add
	slot23 = affector_panel
	slot24 = 1
	slot25 = 0
	slot26 = "EXPAND"

	slot20(slot21, slot22, slot23, slot24, slot25)

	slot22 = panel
	slot20 = panel.set_sizer
	slot23 = top_sizer

	slot20(slot21, slot22)

	return panel
end

slot0.create_stack_panel = slot1
slot0 = CoreParticleEditorPanel

function slot1(self, arg, e)
	slot5 = self
	slot3 = self.set_box_help
	slot6 = ""
	slot7 = ""

	slot3(slot4, slot5, slot6)

	slot5 = e
	slot3 = e.skip

	slot3(slot4)

	return 
end

slot0.clear_box_help = slot1
slot0 = CoreParticleEditorPanel

function slot1(self, parent)
	slot2 = EWS
	slot4 = slot2
	slot2 = slot2.Panel
	slot5 = parent
	slot6 = ""
	slot7 = ""
	local panel = slot2(slot3, slot4, slot5, slot6)
	slot3 = EWS
	slot5 = slot3
	slot3 = slot3.Notebook
	slot6 = panel
	slot7 = ""
	slot8 = ""
	local notebook = slot3(slot4, slot5, slot6, slot7)
	slot4 = EWS
	slot6 = slot4
	slot4 = slot4.ScrolledWindow
	slot7 = notebook
	slot8 = ""
	slot9 = "HSCROLL,VSCROLL"
	slot4 = slot4(slot5, slot6, slot7, slot8)
	self._atom_panel = slot4
	slot4 = self._atom_panel
	slot6 = slot4
	slot4 = slot4.set_scrollbars
	slot7 = Vector3
	slot9 = 8
	slot10 = 8
	slot11 = 1
	slot7 = slot7(slot8, slot9, slot10)
	slot8 = Vector3
	slot10 = 1
	slot11 = 1
	slot12 = 1
	slot8 = slot8(slot9, slot10, slot11)
	slot9 = Vector3
	slot11 = 0
	slot12 = 0
	slot13 = 0
	slot9 = slot9(slot10, slot11, slot12)
	slot10 = false

	slot4(slot5, slot6, slot7, slot8, slot9)

	slot6 = self
	slot4 = self.create_stack_panel
	slot7 = notebook
	slot8 = "initializer"
	local initializer_page = slot4(slot5, slot6, slot7)
	slot7 = self
	slot5 = self.create_stack_panel
	slot8 = notebook
	slot9 = "simulator"
	local simulator_page = slot5(slot6, slot7, slot8)
	slot8 = self
	slot6 = self.create_stack_panel
	slot9 = notebook
	slot10 = "visualizer"
	local visualizer_page = slot6(slot7, slot8, slot9)
	slot9 = notebook
	slot7 = notebook.add_page
	slot10 = self._atom_panel
	slot11 = "Atom"
	slot12 = false

	slot7(slot8, slot9, slot10, slot11)

	slot9 = notebook
	slot7 = notebook.add_page
	slot10 = initializer_page
	slot11 = "Initializer Stack"
	slot12 = false

	slot7(slot8, slot9, slot10, slot11)

	slot9 = notebook
	slot7 = notebook.add_page
	slot10 = simulator_page
	slot11 = "Simulator Stack"
	slot12 = false

	slot7(slot8, slot9, slot10, slot11)

	slot9 = notebook
	slot7 = notebook.add_page
	slot10 = visualizer_page
	slot11 = "Visualizer Stack"
	slot12 = false

	slot7(slot8, slot9, slot10, slot11)

	slot9 = notebook
	slot7 = notebook.set_page
	slot10 = 0

	slot7(slot8, slot9)

	self._stack_notebook = notebook
	slot7 = EWS
	slot9 = slot7
	slot7 = slot7.BoxSizer
	slot10 = "HORIZONTAL"
	local top_sizer = slot7(slot8, slot9)
	slot10 = top_sizer
	slot8 = top_sizer.add
	slot11 = notebook
	slot12 = 1
	slot13 = 0
	slot14 = "EXPAND"

	slot8(slot9, slot10, slot11, slot12, slot13)

	slot10 = panel
	slot8 = panel.set_sizer
	slot11 = top_sizer

	slot8(slot9, slot10)

	return panel
end

slot0.create_atom_panel = slot1
slot0 = CoreParticleEditorPanel

function slot1(self)
	slot3 = self
	slot1 = self.undoredo
	slot4 = "undo"

	slot1(slot2, slot3)

	return 
end

slot0.undo = slot1
slot0 = CoreParticleEditorPanel

function slot1(self)
	slot3 = self
	slot1 = self.undoredo
	slot4 = "redo"

	slot1(slot2, slot3)

	return 
end

slot0.redo = slot1
slot0 = CoreParticleEditorPanel

function slot1(self, f)
	slot2 = self._undo_stack
	slot2 = slot2[f]
	slot4 = self._undo_stack
	local undo_state = slot2(slot3)

	if undo_state then
		slot3 = Node
		slot3 = slot3.from_xml
		slot5 = undo_state.xml
		local n = slot3(slot4)
		slot4 = CoreEffectDefinition
		slot6 = slot4
		slot4 = slot4.new
		slot4 = slot4(slot5)
		self._effect = slot4
		slot4 = self._effect
		slot6 = slot4
		slot4 = slot4.load
		slot7 = n

		slot4(slot5, slot6)

		slot4 = self._effect
		slot6 = slot4
		slot4 = slot4.set_name
		slot7 = undo_state.name

		slot4(slot5, slot6)

		slot4 = self._atom

		if slot4 then
			slot4 = self._atom
			slot6 = slot4
			slot4 = slot4.name
			local aname = slot4(slot5)
			slot5 = nil
			self._atom = slot5
			slot7 = self
			slot5 = self.update_atom_combo

			slot5(slot6)

			slot5 = self._atom_combo
			slot7 = slot5
			slot5 = slot5.set_value
			slot8 = aname

			slot5(slot6, slot7)

			slot7 = self
			slot5 = self.on_select_atom

			slot5(slot6)
		end

		slot6 = self
		slot4 = self.update_view
		slot7 = true
		slot8 = true

		slot4(slot5, slot6, slot7)
	end

	return 
end

slot0.undoredo = slot1
slot0 = CoreParticleEditorPanel

function slot1(self)
	slot1 = CoreEffectDefinition
	slot3 = slot1
	slot1 = slot1.new
	slot1 = slot1(slot2)
	self._effect = slot1
	slot1 = self._atom_textctrl
	slot3 = slot1
	slot1 = slot1.set_value
	slot4 = ""

	slot1(slot2, slot3)

	return 
end

slot0.clear = slot1
slot0 = CoreParticleEditorPanel

function slot1(self)
	slot1 = self._atom_combo
	slot3 = slot1
	slot1 = slot1.clear

	slot1(slot2)

	slot1 = ipairs
	slot3 = self._effect
	slot3 = slot3._atoms
	slot1, slot2, slot3 = slot1(slot2)

	for _, atom in slot1, slot2, slot3 do
		slot6 = self._atom_combo
		slot8 = slot6
		slot6 = slot6.append
		slot9 = atom._name

		slot6(slot7, slot8)
	end

	return 
end

slot0.update_atom_combo = slot1
slot0 = CoreParticleEditorPanel

function slot1(self)
	slot1 = self._effect
	slot3 = slot1
	slot1 = slot1.find_atom
	slot4 = self._atom_combo
	slot6 = slot4
	slot4 = slot4.get_value
	local atom = slot1(slot2, slot4(slot5))
	self._atom = atom

	if atom then
		slot2 = self._atom_textctrl
		slot4 = slot2
		slot2 = slot2.set_value
		slot7 = atom
		slot5 = atom.name

		slot2(slot3, slot5(slot6))
	end

	slot4 = self
	slot2 = self.update_view
	slot5 = true
	slot6 = true

	slot2(slot3, slot4, slot5)

	return 
end

slot0.on_select_atom = slot1
slot0 = CoreParticleEditorPanel

function slot1(self)
	slot1 = self._effect
	slot3 = slot1
	slot1 = slot1.name
	slot1 = slot1(slot2)

	if slot1 == "" then
		slot3 = self
		slot1 = self.on_save_as

		return slot1(slot2)
	else
		slot3 = self
		slot1 = self.do_save
		slot4 = false

		return slot1(slot2, slot3)
	end

	return 
end

slot0.on_save = slot1
slot0 = CoreParticleEditorPanel

function slot1(self)
	slot1 = managers
	slot1 = slot1.database
	slot3 = slot1
	slot1 = slot1.save_file_dialog
	slot4 = self._panel
	slot5 = nil
	slot6 = "*.effect"
	slot7 = self._editor
	slot7 = slot7._last_used_dir
	slot8 = false
	local f = slot1(slot2, slot3, slot4, slot5, slot6, slot7)

	if not f then
		slot2 = false

		return slot2
	end

	slot2 = self._effect
	slot4 = slot2
	slot2 = slot2.set_name
	slot5 = f

	slot2(slot3, slot4)

	slot2 = self._editor
	slot3 = dir_name
	slot5 = f
	slot3 = slot3(slot4)
	slot2._last_used_dir = slot3
	slot2 = Node
	slot4 = "effect"
	local node = slot2(slot3)
	slot3 = self._effect
	slot5 = slot3
	slot3 = slot3.save
	slot6 = node

	slot3(slot4, slot5)

	slot5 = node
	slot3 = node.to_xml
	local new_xml = slot3(slot4)
	slot4 = self._undo_stack
	slot6 = slot4
	slot4 = slot4.push
	slot7 = {}
	slot8 = self._effect
	slot10 = slot8
	slot8 = slot8.name
	slot8 = slot8(slot9)
	slot7.name = slot8
	slot7.xml = new_xml

	slot4(slot5, slot6)

	slot6 = self
	slot4 = self.do_save
	slot7 = true

	return slot4(slot5, slot6)
end

slot0.on_save_as = slot1
slot0 = CoreParticleEditorPanel

function slot1(self, warn_on_overwrite)
	if warn_on_overwrite then
		slot2 = managers
		slot2 = slot2.database
		slot4 = slot2
		slot2 = slot2.has
		slot5 = self._effect
		slot7 = slot5
		slot5 = slot5.name
		slot2 = slot2(slot3, slot5(slot6))

		if slot2 then
			slot2 = EWS
			slot4 = slot2
			slot2 = slot2.message_box
			slot5 = self._panel
			slot6 = "An effect named "
			slot7 = self._effect
			slot9 = slot7
			slot7 = slot7.name
			slot7 = slot7(slot8)
			slot8 = " already exists, overwrite?"
			slot6 = slot6 .. slot7 .. slot8
			slot7 = "Overwrite"
			slot8 = "YES_NO"
			slot9 = Vector3
			slot11 = -1
			slot12 = -1
			slot13 = 0
			local ret = slot2(slot3, slot4, slot5, slot6, slot7, slot9(slot10, slot11, slot12))

			if ret ~= "YES" then
				slot3 = false

				return slot3
			end
		end
	end

	slot2 = Node
	slot4 = "effect"
	local n = slot2(slot3)
	slot3 = self._effect
	slot5 = slot3
	slot3 = slot3.save
	slot6 = n

	slot3(slot4, slot5)

	slot3 = managers
	slot3 = slot3.database
	slot5 = slot3
	slot3 = slot3.save_node
	slot6 = n
	slot7 = self._effect
	slot9 = slot7
	slot7 = slot7.name

	slot3(slot4, slot5, slot7(slot8))

	slot5 = n
	slot3 = n.to_xml
	slot3 = slot3(slot4)
	self._last_saved_xml = slot3
	slot3 = self._valid_effect

	if slot3 then
		slot3 = Application
		slot5 = slot3
		slot3 = slot3.data_compile
		slot6 = {
			target_db_name = "all",
			send_idstrings = false,
			preprocessor_definitions = "preprocessor_definitions",
			verbose = false
		}
		slot7 = string
		slot7 = slot7.lower
		slot9 = SystemInfo
		slot11 = slot9
		slot9 = slot9.platform
		slot9 = slot9(slot10)
		slot11 = slot9
		slot9 = slot9.s
		slot7 = slot7(slot9(slot10))
		slot6.platform = slot7
		slot7 = managers
		slot7 = slot7.database
		slot9 = slot7
		slot7 = slot7.base_path
		slot7 = slot7(slot8)
		slot6.source_root = slot7
		slot7 = Application
		slot9 = slot7
		slot7 = slot7.base_path
		slot7 = slot7(slot8)
		slot8 = "/assets"
		slot7 = slot7 .. slot8
		slot6.target_db_root = slot7
		slot7 = {}
		slot8 = managers
		slot8 = slot8.database
		slot10 = slot8
		slot8 = slot8.entry_relative_path
		slot11 = self._effect
		slot13 = slot11
		slot11 = slot11.name
		slot7[MULTRES] = slot8(slot9, slot11(slot12))
		slot6.source_files = slot7

		slot3(slot4, slot5)

		slot3 = DB
		slot5 = slot3
		slot3 = slot3.reload

		slot3(slot4)

		slot3 = managers
		slot3 = slot3.database
		slot5 = slot3
		slot3 = slot3.clear_all_cached_indices

		slot3(slot4)
	end

	slot3 = self._editor
	slot5 = slot3
	slot3 = slot3.set_page_name
	slot6 = self
	slot7 = base_path
	slot9 = self._effect
	slot11 = slot9
	slot9 = slot9.name

	slot3(slot4, slot5, slot7(slot9(slot10)))

	slot3 = true

	return slot3
end

slot0.do_save = slot1
slot0 = CoreParticleEditorPanel

function slot1(self)
	slot1 = Node
	slot3 = "effect"
	local n = slot1(slot2)
	slot4 = self
	slot2 = self.on_lose_focus

	slot2(slot3)

	slot2 = self._effect
	slot4 = slot2
	slot2 = slot2.save
	slot5 = n

	slot2(slot3, slot4)

	slot4 = n
	slot2 = n.to_xml
	slot2 = slot2(slot3)
	slot3 = self._last_saved_xml

	if slot2 ~= slot3 then
		local continue_asking = true

		while continue_asking do

			-- Decompilation error in this vicinity:
			slot3 = self._effect
			slot5 = slot3
			slot3 = slot3.name
			local n = slot3(slot4)

			if n == "" then
				n = "New Effect"
			end

			slot4 = EWS
			slot6 = slot4
			slot4 = slot4.message_box
			slot7 = self._panel
			slot8 = "Effect "
			slot9 = n
			slot10 = " was modified since last saved, save before exiting?"
			slot8 = slot8 .. slot9 .. slot10
			slot9 = "Save?"
			slot10 = "YES,NO,CANCEL"
			slot11 = Vector3
			slot13 = -1
			slot14 = -1
			slot15 = 0
			local ret = slot4(slot5, slot6, slot7, slot8, slot9, slot11(slot12, slot13, slot14))
		end
	end

	slot2 = self._graph_view_dialog
	slot4 = slot2
	slot2 = slot2.destroy

	slot2(slot3)

	slot2 = true

	return slot2
end

slot0.close = slot1
slot0 = CoreUndoStack

if not slot0 then
	slot0 = class
	slot0 = slot0()
end

CoreUndoStack = slot0
slot0 = CoreUndoStack

function slot1(self, startstate, stacksize)
	self._stacksize = stacksize
	slot3 = {
		startstate
	}
	self._stack = slot3
	slot3 = 1
	self._ptr = slot3

	return 
end

slot0.init = slot1
slot0 = CoreUndoStack

function slot1(self, state)
	slot2 = self._stack
	slot3 = self._ptr
	slot2 = slot2[slot3]

	if slot2 == state then
		return 
	end

	slot2 = self._ptr
	slot3 = self._stack
	slot3 = #slot3

	while slot2 < slot3 do
		slot2 = table
		slot2 = slot2.remove
		slot4 = self._stack
		slot5 = self._ptr

		slot2(slot3, slot4)
	end

	slot2 = table
	slot2 = slot2.insert
	slot4 = self._stack
	slot5 = state

	slot2(slot3, slot4)

	slot2 = self._stack
	slot2 = #slot2
	slot3 = self._stacksize

	if slot3 < slot2 then
		slot2 = table
		slot2 = slot2.remove
		slot4 = self._stack
		slot5 = 1

		slot2(slot3, slot4)
	end

	slot2 = self._stack
	slot2 = #slot2
	self._ptr = slot2

	return 
end

slot0.push = slot1
slot0 = CoreUndoStack

function slot1(self)
	slot1 = self._ptr

	if slot1 == 1 then
		slot1 = nil

		return slot1
	end

	slot1 = self._ptr
	slot1 = slot1 - 1
	self._ptr = slot1
	slot1 = self._stack
	slot2 = self._ptr
	slot1 = slot1[slot2]

	return slot1
end

slot0.undo = slot1
slot0 = CoreUndoStack

function slot1(self)
	slot1 = self._ptr
	slot2 = self._stack
	slot2 = #slot2

	if slot1 == slot2 then
		slot1 = nil

		return slot1
	end

	slot1 = self._ptr
	slot1 = slot1 + 1
	self._ptr = slot1
	slot1 = self._stack
	slot2 = self._ptr
	slot1 = slot1[slot2]

	return slot1
end

slot0.redo = slot1

return 
