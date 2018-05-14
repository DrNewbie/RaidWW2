function CoreEditor:build_configuration()
	self._config = {}
	local frame_size_height = 200
	local frame_size_width = 300
	slot13 = 0
	slot13 = frame_size_height
	slot11 = ""
	self._configuration = EWS.Dialog(slot4, EWS, nil, "Configuration", "_configuration", Vector3(slot10, -1, -1), Vector3(-1, frame_size_width))
	slot6 = "VERTICAL"
	local main_sizer = EWS.BoxSizer(slot4, EWS)
	slot7 = main_sizer

	self._configuration.set_sizer(EWS, self._configuration)

	slot9 = "NB_TOP,NB_MULTILINE"
	local notebook = EWS.Notebook(EWS, EWS, self._configuration, "_notebook")
	slot10 = ""
	local page_general = EWS.Panel(EWS, EWS, notebook, "_general")
	slot11 = ""
	local general_sizer = EWS.StaticBoxSizer(EWS, EWS, page_general, "VERTICAL")
	slot10 = general_sizer

	page_general.set_sizer(EWS, page_general)

	slot12 = ""
	local timestamp = EWS.CheckBox(EWS, EWS, page_general, "Use Timestamp")
	slot11 = self._use_timestamp

	timestamp.set_value(EWS, timestamp)

	self._config._use_timestamp = timestamp
	slot14 = "EXPAND"

	general_sizer.add(EWS, general_sizer, timestamp, 0, 0)

	slot13 = ""
	local reset_camera_on_new = EWS.CheckBox(EWS, EWS, page_general, "Reset Camera on New/Load")
	slot12 = self._reset_camera_on_new

	reset_camera_on_new.set_value(EWS, reset_camera_on_new)

	self._config._reset_camera_on_new = reset_camera_on_new
	slot15 = "EXPAND"

	general_sizer.add(EWS, general_sizer, reset_camera_on_new, 0, 0)

	slot14 = ""
	local use_bet_undo = EWS.CheckBox(EWS, EWS, page_general, "Use Beta Undo")
	slot13 = self._use_beta_undo

	use_bet_undo.set_value(EWS, use_bet_undo)

	self._config._use_beta_undo = use_bet_undo
	slot16 = "EXPAND"

	general_sizer.add(EWS, general_sizer, use_bet_undo, 0, 0)

	slot15 = true

	notebook.add_page(EWS, notebook, page_general, "General")

	slot15 = ""
	local page_backup = EWS.Panel(EWS, EWS, notebook, "_backup")
	slot14 = "VERTICAL"
	local backup_sizer = EWS.BoxSizer(EWS, EWS)
	slot15 = backup_sizer

	page_backup.set_sizer(EWS, page_backup)

	slot17 = "Automatic Save:"
	local autosave_sizer = EWS.StaticBoxSizer(EWS, EWS, page_backup, "VERTICAL")
	slot18 = "Time( minutes ) between automatic save"
	local autosave_spin_sizer = EWS.StaticBoxSizer(EWS, EWS, page_backup, "VERTICAL")
	slot20 = ""
	local autosave_spin = EWS.SpinCtrl(EWS, EWS, page_backup, self._autosave_time, "_autosave_spin")
	slot19 = 60

	autosave_spin.set_range(EWS, autosave_spin, 0)

	self._config._autosave_time = autosave_spin
	slot21 = "ALIGN_RIGHT"

	autosave_spin_sizer.add(EWS, autosave_spin_sizer, autosave_spin, 0, 0)

	slot21 = "EXPAND"

	autosave_sizer.add(EWS, autosave_sizer, autosave_spin_sizer, 0, 0)

	slot21 = "EXPAND"

	backup_sizer.add(EWS, backup_sizer, autosave_sizer, 1, 0)

	slot20 = false

	notebook.add_page(EWS, notebook, page_backup, "Backup")

	slot20 = ""
	local page_edit = EWS.Panel(EWS, EWS, notebook, "_edit")
	slot21 = ""
	local edit_sizer = EWS.StaticBoxSizer(EWS, EWS, page_edit, "VERTICAL")
	slot20 = edit_sizer

	page_edit.set_sizer(EWS, page_edit)

	slot22 = ""
	local edit_invert_move_shift = EWS.CheckBox(EWS, EWS, page_edit, "Invert move shift")
	slot21 = self._invert_move_shift

	edit_invert_move_shift.set_value(EWS, edit_invert_move_shift)

	self._config._invert_move_shift = edit_invert_move_shift
	slot24 = "EXPAND"

	edit_sizer.add(EWS, edit_sizer, edit_invert_move_shift, 0, 0)

	slot23 = ""
	local edit_always_global_select_unit = EWS.CheckBox(EWS, EWS, page_edit, "Always global select unit")
	slot22 = self._always_global_select_unit

	edit_always_global_select_unit.set_value(EWS, edit_always_global_select_unit)

	self._config._always_global_select_unit = edit_always_global_select_unit
	slot25 = "EXPAND"

	edit_sizer.add(EWS, edit_sizer, edit_always_global_select_unit, 0, 0)

	slot24 = ""
	local edit_dialogs_stay_on_top = EWS.CheckBox(EWS, EWS, page_edit, "Dialogs stay on top")
	slot23 = self._dialogs_stay_on_top

	edit_dialogs_stay_on_top.set_value(EWS, edit_dialogs_stay_on_top)

	self._config._dialogs_stay_on_top = edit_dialogs_stay_on_top
	slot26 = "EXPAND"

	edit_sizer.add(EWS, edit_sizer, edit_dialogs_stay_on_top, 0, 0)

	slot25 = ""
	local save_edit_setting_values = EWS.CheckBox(EWS, EWS, page_edit, "Save edit setting values on quit")
	slot24 = self._save_edit_setting_values

	save_edit_setting_values.set_value(EWS, save_edit_setting_values)

	self._config._save_edit_setting_values = save_edit_setting_values
	slot27 = "EXPAND"

	edit_sizer.add(EWS, edit_sizer, save_edit_setting_values, 0, 0)

	slot26 = ""
	local save_dialog_states = EWS.CheckBox(EWS, EWS, page_edit, "Keep dialog states")
	slot25 = self._save_dialog_states

	save_dialog_states.set_value(EWS, save_dialog_states)

	self._config._save_dialog_states = save_dialog_states
	slot28 = "EXPAND"

	edit_sizer.add(EWS, edit_sizer, save_dialog_states, 0, 0)

	slot27 = false

	notebook.add_page(EWS, notebook, page_edit, "Edit")

	slot27 = ""
	local page_notes = EWS.Panel(EWS, EWS, notebook, "_notes")
	slot28 = ""
	local notes_sizer = EWS.StaticBoxSizer(EWS, EWS, page_notes, "VERTICAL")
	slot27 = notes_sizer

	page_notes.set_sizer(EWS, page_notes)

	slot30 = "TE_MULTILINE,TE_RICH2,TE_DONTWRAP,VSCROLL,ALWAYS_SHOW_SB"
	local note_text = EWS.TextCtrl(EWS, EWS, page_notes, self._notes, "")
	self._config._notes = note_text
	slot31 = "EXPAND"

	notes_sizer.add(EWS, notes_sizer, note_text, 1, 0)

	slot30 = false

	notebook.add_page(EWS, notebook, page_notes, "Notes")

	slot30 = ""
	local page_slave = EWS.Panel(EWS, EWS, notebook, "_slave")
	slot29 = "VERTICAL"
	local slave_page_sizer = EWS.BoxSizer(EWS, EWS)

	page_slave.set_sizer(EWS, page_slave)

	slot32 = ""
	local slave_sizer = EWS.StaticBoxSizer(EWS, EWS, page_slave, "VERTICAL")
	slot33 = "Host / Port / LSPort: (0 is default.)"
	local slave_host_name_sizer = EWS.StaticBoxSizer(EWS, EWS, page_slave, "HORIZONTAL")
	slot35 = ""
	local slave_host_name = EWS.TextCtrl(slave_page_sizer, EWS, page_slave, self._slave_host_name or "", "")
	self._config._slave_host_name = slave_host_name
	slot36 = "EXPAND"

	slave_host_name_sizer.add(EWS, slave_host_name_sizer, slave_host_name, 2, 0)

	slot36 = ""
	local slave_port = EWS.SpinCtrl(EWS, EWS, page_slave, self._slave_port or 0, "")
	slot35 = 65535

	slave_port.set_range(EWS, slave_port, 0)

	self._config._slave_port = slave_port
	slot37 = ""

	slave_host_name_sizer.add(EWS, slave_host_name_sizer, slave_port, 1, 0)

	slot37 = ""
	local slave_lsport = EWS.SpinCtrl(EWS, EWS, page_slave, self._slave_lsport or 0, "")
	slot36 = 65535

	slave_lsport.set_range(EWS, slave_lsport, 0)

	self._config._slave_lsport = slave_lsport
	slot38 = ""

	slave_host_name_sizer.add(EWS, slave_host_name_sizer, slave_lsport, 1, 0)

	slot38 = "EXPAND"

	slave_sizer.add(EWS, slave_sizer, slave_host_name_sizer, 0, 0)

	slot37 = "Number of batches per cycle:"
	local slave_batches_sizer = EWS.StaticBoxSizer(EWS, EWS, page_slave, "VERTICAL")
	slot39 = ""
	local slave_batches = EWS.SpinCtrl(page_slave, EWS, page_slave, self._slave_num_batches or 1, "")
	slot38 = 64

	slave_batches.set_range(EWS, slave_batches, 1)

	self._config._slave_num_batches = slave_batches
	slot40 = "ALIGN_RIGHT"

	slave_batches_sizer.add(EWS, slave_batches_sizer, slave_batches, 0, 0)

	slot40 = "EXPAND"

	slave_sizer.add(EWS, slave_sizer, slave_batches_sizer, 0, 0)

	slot40 = "EXPAND"

	slave_page_sizer.add(EWS, slave_page_sizer, slave_sizer, 1, 0)

	slot39 = false

	notebook.add_page(EWS, notebook, page_slave, "Slave System")

	slot40 = "EXPAND"

	main_sizer.add(EWS, main_sizer, notebook, 1, 0)

	slot37 = "HORIZONTAL"
	local buttons_sizer = EWS.BoxSizer(EWS, EWS)
	local ok_button = EWS.Button(EWS, EWS, self._configuration, "OK", "")
	slot44 = "on_configuration_ok"
	slot41 = self._configuration

	ok_button.connect(EWS, ok_button, "EVT_COMMAND_BUTTON_CLICKED", callback("", self, self))

	slot42 = "EXPAND"

	buttons_sizer.add(EWS, buttons_sizer, ok_button, 0, 0)

	local cancel_button = EWS.Button(EWS, EWS, self._configuration, "Cancel", "")
	slot45 = "on_configuration_cancel"
	slot42 = self._configuration

	cancel_button.connect(EWS, cancel_button, "EVT_COMMAND_BUTTON_CLICKED", callback("", self, self))

	slot43 = "EXPAND"

	buttons_sizer.add(EWS, buttons_sizer, cancel_button, 0, 0)

	local apply_button = EWS.Button(EWS, EWS, self._configuration, "Apply", "")
	slot46 = "on_configuration_apply"
	slot43 = self._configuration

	apply_button.connect(EWS, apply_button, "EVT_COMMAND_BUTTON_CLICKED", callback("", self, self))

	slot44 = "EXPAND"

	buttons_sizer.add(EWS, buttons_sizer, apply_button, 0, 0)

	slot44 = "ALIGN_RIGHT"

	main_sizer.add(EWS, main_sizer, buttons_sizer, 0, 0)

	slot40 = notebook

	notebook.fit(EWS)

	return 
end
function CoreEditor:on_configuration_ok()
	slot3 = self

	self.on_configuration_apply(slot2)

	slot3 = self._configuration

	self._configuration.end_modal(slot2)

	return 
end
function CoreEditor:on_configuration_cancel()
	slot3 = self._config

	for value, data in pairs(slot2) do
		local ctrlr = data.ctrlr or data
		slot10 = self[value]

		ctrlr.set_value(slot8, ctrlr)
	end

	slot3 = self._configuration

	self._configuration.end_modal(slot2)

	return 
end
function CoreEditor:on_configuration_apply()
	slot3 = self._config

	for value, data in pairs(slot2) do
		local ctrlr = data.ctrlr or data
		local changed = false
		slot10 = self[value]

		if type(slot9) == "number" then
			slot13 = ctrlr
			changed = self[value] ~= tonumber(ctrlr.get_value(slot12))
			slot12 = ctrlr
			self[value] = tonumber(ctrlr.get_value(slot11))
		else
			slot11 = ctrlr
			changed = self[value] ~= ctrlr.get_value(slot10)
			slot10 = ctrlr
			self[value] = ctrlr.get_value(slot9)
		end

		if data.callback then
			slot11 = self[value]

			data.callback(slot9, changed)
		end
	end

	slot3 = self

	self.save_configuration(slot2)

	slot3 = managers.slave

	if managers.slave.connected(slot2) then
		slot4 = self._slave_num_batches

		managers.slave.set_batch_count(slot2, managers.slave)
	end

	return 
end

return 
