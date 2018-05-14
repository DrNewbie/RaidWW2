CoreUnitReloader = CoreUnitReloader or class()
function CoreUnitReloader:init()
	self._unit_msg = {}
	self._no_skipping = true
	slot3 = self

	self.create_main_frame(slot2)

	return 
end
function CoreUnitReloader:destroy()
	slot3 = self._unitreloader_frame

	if alive(slot2) then
		slot3 = self._unitreloader_frame

		self._unitreloader_frame.destroy(slot2)

		self._unitreloader_frame = nil
	end

	return 
end
function CoreUnitReloader:create_main_frame()
	slot9 = 0
	slot10 = 0
	slot8 = Global.frame
	self._unitreloader_frame = EWS.Frame(slot2, EWS, "Unit Reloader", Vector3(slot6, 100, 400), Vector3(100, 250, 350), "FRAME_FLOAT_ON_PARENT,DEFAULT_FRAME_STYLE")
	local menu_bar = EWS.MenuBar(slot2)
	slot5 = ""
	local file_menu = EWS.Menu(EWS, EWS)
	slot8 = ""

	file_menu.append_item(EWS, file_menu, "RELOAD", "Reload Units")

	slot8 = ""

	file_menu.append_item(EWS, file_menu, "RELOAD_ALL", "Reload All Units")

	slot5 = file_menu

	file_menu.append_separator(EWS)

	slot8 = ""

	file_menu.append_item(EWS, file_menu, "RELOAD_LIST", "Reload List")

	slot5 = file_menu

	file_menu.append_separator(EWS)

	slot8 = ""

	file_menu.append_item(EWS, file_menu, "EXIT", "Exit")

	slot7 = "File"

	menu_bar.append(EWS, menu_bar, file_menu)

	slot6 = menu_bar

	self._unitreloader_frame.set_menu_bar(EWS, self._unitreloader_frame)

	slot12 = "on_reload"

	self._unitreloader_frame.connect(EWS, self._unitreloader_frame, "RELOAD", "EVT_COMMAND_MENU_SELECTED", callback(350, self, self))

	slot12 = "on_reload_all"

	self._unitreloader_frame.connect(EWS, self._unitreloader_frame, "RELOAD_ALL", "EVT_COMMAND_MENU_SELECTED", callback("", self, self))

	slot12 = "on_reload_list"

	self._unitreloader_frame.connect(EWS, self._unitreloader_frame, "RELOAD_LIST", "EVT_COMMAND_MENU_SELECTED", callback("", self, self))

	slot12 = "on_close"

	self._unitreloader_frame.connect(EWS, self._unitreloader_frame, "EXIT", "EVT_COMMAND_MENU_SELECTED", callback("", self, self))

	slot12 = "on_close"
	slot9 = ""

	self._unitreloader_frame.connect(EWS, self._unitreloader_frame, "", "EVT_CLOSE_WINDOW", callback("", self, self))

	slot6 = "VERTICAL"
	local main_box = EWS.BoxSizer(EWS, EWS)
	slot13 = ""
	slot10 = "EXPAND"

	main_box.add(EWS, main_box, EWS.BitmapButton(callback("", self, self), EWS, self._unitreloader_frame, "dock.bmp", ""), 0, 0)

	self._main_box = {}
	slot11 = "CB_SORT"
	slot5 = EWS.ComboBox(main_box, EWS, self._unitreloader_frame, "", "")
	self._main_box.unit_combo_box = slot5
	slot13 = "on_reload"
	slot10 = ""

	self._main_box.unit_combo_box.connect(slot5, self._main_box.unit_combo_box, "", "EVT_COMMAND_TEXT_ENTER", callback("", self, self))

	slot10 = "EXPAND"

	main_box.add(slot5, main_box, self._main_box.unit_combo_box, 0, 0)

	slot11 = ""
	slot5 = EWS.Button(main_box, EWS, self._unitreloader_frame, "Reload", "")
	self._main_box.reload_btn = slot5
	slot13 = "on_reload"
	slot10 = ""

	self._main_box.reload_btn.connect(slot5, self._main_box.reload_btn, "", "EVT_COMMAND_BUTTON_CLICKED", callback("", self, self))

	slot10 = "EXPAND"

	main_box.add(slot5, main_box, self._main_box.reload_btn, 0, 0)

	slot10 = ""
	slot5 = EWS.ListBox(main_box, EWS, self._unitreloader_frame, "unit_reloader_main")
	self._main_box.listbox = slot5
	slot10 = "EXPAND"

	main_box.add(slot5, main_box, self._main_box.listbox, 1, 0)

	slot10 = ""
	self._warning_dialog = EWS.MessageDialog(slot5, EWS, self._unitreloader_frame, "This unit has a script extension. Continue anyway?", "Warning")
	slot10 = ""
	self._warning_unit_test_dialog = EWS.MessageDialog(slot5, EWS, self._unitreloader_frame, "This will test spawn all units in the database. Continue?", "Warning")
	slot10 = ""
	self._warning_reload_all_dialog = EWS.MessageDialog(slot5, EWS, self._unitreloader_frame, "This will reload all units. Continue?", "Warning")
	slot7 = main_box

	self._unitreloader_frame.set_sizer(slot5, self._unitreloader_frame)

	slot7 = true

	self._unitreloader_frame.set_visible(slot5, self._unitreloader_frame)

	return 
end
function CoreUnitReloader:set_position(newpos)
	slot5 = newpos

	self._unitreloader_frame.set_position(slot3, self._unitreloader_frame)

	return 
end
function CoreUnitReloader:update(t, dt)
	if not self._initialized then
		self._initialized = true
		slot6 = "all"
		local units_in_world = World.find_units_quick(slot4, World)
		slot6 = self._main_box.unit_combo_box

		self._main_box.unit_combo_box.clear(World)

		slot6 = units_in_world

		for _, unit_in_world in ipairs(World) do
			slot11 = self._main_box.unit_combo_box
			slot14 = unit_in_world

			self._main_box.unit_combo_box.append(slot10, unit_in_world.name(slot13))

			slot11 = self._main_box.unit_combo_box
			slot14 = unit_in_world

			self._main_box.unit_combo_box.set_value(slot10, unit_in_world.name(slot13))
		end
	end

	return 
end
function CoreUnitReloader:close()
	slot3 = self._unitreloader_frame

	self._unitreloader_frame.destroy(slot2)

	return 
end
function CoreUnitReloader:check_extensions()
	slot4 = "all"
	local units = World.find_units_quick(slot2, World)
	slot4 = units

	for _, unit in ipairs(World) do
		slot10 = self._main_box.unit_combo_box

		if unit.name(slot8) == self._main_box.unit_combo_box.get_value(unit) then
			slot11 = unit

			for _, extension in ipairs(unit.extensions(slot10)) do
				if extension ~= "unit_data" and extension ~= "damage" then
					slot14 = self._warning_dialog

					return self._warning_dialog.show_modal(slot13) == "ID_OK"
				end
			end
		end
	end

	return true
end
function CoreUnitReloader:on_reload()
	slot3 = self
	slot6 = self._main_box.unit_combo_box

	if self.check_extensions(slot2, self._main_box.unit_combo_box.get_value(slot5)) then
		slot3 = self
		slot6 = self._main_box.unit_combo_box

		self.reload_units(slot2, self._main_box.unit_combo_box.get_value(slot5))
	end

	return 
end
function CoreUnitReloader:on_reload_all()
	slot3 = self._warning_reload_all_dialog

	if self._warning_reload_all_dialog.show_modal(slot2) == "ID_OK" then
		self._initialized = false
		slot4 = "all"
		local units_in_world = World.find_units_quick(slot2, World)
		slot4 = self._main_box.unit_combo_box

		self._main_box.unit_combo_box.clear(World)

		slot4 = units_in_world

		for _, unit_in_world in ipairs(World) do
			slot9 = self
			slot12 = unit_in_world

			self.reload_units(slot8, unit_in_world.name(slot11))
		end
	end

	return 
end
function CoreUnitReloader:on_reload_list()
	self._initialized = false

	return 
end
function CoreUnitReloader:on_close()
	slot4 = "Unit Reloader"

	managers.toolhub.close(slot2, managers.toolhub)

	return 
end
function CoreUnitReloader:log(string)
	slot5 = string

	self._main_box.listbox.append(slot3, self._main_box.listbox)

	slot7 = self._main_box.listbox
	slot5 = self._main_box.listbox.nr_items(slot6) - 1

	self._main_box.listbox.select_index(slot3, self._main_box.listbox)

	return 
end
function CoreUnitReloader:reload_units(unit_name)
	local num_reloads = reload_units(slot3)
	slot6 = num_reloads .. " " .. unit_name .. " reloaded."

	self.log(unit_name, self)

	return 
end

return 
