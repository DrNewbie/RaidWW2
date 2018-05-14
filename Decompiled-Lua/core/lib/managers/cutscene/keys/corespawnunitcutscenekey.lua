-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreEngineAccess"

core.import(slot1, core)

slot2 = "core/lib/managers/cutscene/keys/CoreSetupCutsceneKeyBase"

require(slot1)

if not CoreSpawnUnitCutsceneKey then
	slot2 = CoreSetupCutsceneKeyBase
	slot0 = class(slot1)
end

CoreSpawnUnitCutsceneKey = slot0
CoreSpawnUnitCutsceneKey.ELEMENT_NAME = "spawn_unit"
CoreSpawnUnitCutsceneKey.NAME = "Spawn Unit"
slot4 = ""

CoreSpawnUnitCutsceneKey.register_serialized_attribute("Spawn Unit", CoreSpawnUnitCutsceneKey, "name")

slot4 = ""

CoreSpawnUnitCutsceneKey.register_serialized_attribute("Spawn Unit", CoreSpawnUnitCutsceneKey, "unit_category")

slot4 = ""

CoreSpawnUnitCutsceneKey.register_serialized_attribute("Spawn Unit", CoreSpawnUnitCutsceneKey, "unit_type")

slot3 = "database_browser_button"

CoreSpawnUnitCutsceneKey.register_control("Spawn Unit", CoreSpawnUnitCutsceneKey)

slot3 = "divider"

CoreSpawnUnitCutsceneKey.register_control("Spawn Unit", CoreSpawnUnitCutsceneKey)

slot4 = ""

CoreSpawnUnitCutsceneKey.register_serialized_attribute("Spawn Unit", CoreSpawnUnitCutsceneKey, "parent_unit_name")

slot4 = ""

CoreSpawnUnitCutsceneKey.register_serialized_attribute("Spawn Unit", CoreSpawnUnitCutsceneKey, "parent_object_name")

slot8 = 0
slot5 = CoreCutsceneKeyBase.string_to_vector

CoreSpawnUnitCutsceneKey.register_serialized_attribute("Spawn Unit", CoreSpawnUnitCutsceneKey, "offset", Vector3(slot5, 0, 0))

slot5 = CoreCutsceneKeyBase.string_to_rotation

CoreSpawnUnitCutsceneKey.register_serialized_attribute("Spawn Unit", CoreSpawnUnitCutsceneKey, "rotation", Rotation())

slot4 = "unit_type"

CoreSpawnUnitCutsceneKey.attribute_affects("Spawn Unit", CoreSpawnUnitCutsceneKey, "unit_category")

slot4 = "parent_object_name"

CoreSpawnUnitCutsceneKey.attribute_affects("Spawn Unit", CoreSpawnUnitCutsceneKey, "parent_unit_name")

CoreSpawnUnitCutsceneKey.control_for_unit_category = CoreSetupCutsceneKeyBase.standard_combo_box_control
CoreSpawnUnitCutsceneKey.control_for_unit_type = CoreSetupCutsceneKeyBase.standard_combo_box_control
CoreSpawnUnitCutsceneKey.control_for_divider = CoreSetupCutsceneKeyBase.standard_divider_control
CoreSpawnUnitCutsceneKey.control_for_parent_unit_name = CoreSetupCutsceneKeyBase.standard_combo_box_control
CoreSpawnUnitCutsceneKey.control_for_parent_object_name = CoreSetupCutsceneKeyBase.standard_combo_box_control
function CoreSpawnUnitCutsceneKey:__tostring()
	slot4 = self.unit_type(slot5)
	slot7 = self

	return string.format(slot2, "Spawn %s named \"%s\".", self.name(self))
end
function CoreSpawnUnitCutsceneKey:prime(player)
	slot4 = self

	self._spawn_unit(slot3)

	return 
end
function CoreSpawnUnitCutsceneKey:unload(player)
	if self._cast then
		slot4 = self

		self._delete_unit(slot3)
	end

	return 
end
function CoreSpawnUnitCutsceneKey:play(player, undo, fast_forward)
	slot6 = self

	self._reparent_unit(slot5)

	return 
end
function CoreSpawnUnitCutsceneKey:is_valid_unit_category(unit_category)
	slot4 = Application

	if not Application.ews_enabled(slot3) then
		return true
	else
		if unit_category ~= nil then
			slot6 = managers.database
			slot5 = unit_category
			slot2 = table.contains(slot3, managers.database.list_unit_types(slot5))
		else
			slot2 = false

			if false then
				slot2 = true
			end
		end

		return slot2
	end

	return 
end
function CoreSpawnUnitCutsceneKey:is_valid_unit_type(unit_type)
	if unit_type ~= nil then
		slot6 = unit_type
		slot2 = DB.has(slot3, DB, "unit")
	else
		slot2 = false

		if false then
			slot2 = true
		end
	end

	return slot2
end
function CoreSpawnUnitCutsceneKey:is_valid_name(name)

	-- Decompilation error in this vicinity:
	slot6 = true
	local existing_unit = self._unit(slot3, self, name)

	return existing_unit == nil or existing_unit == self._spawned_unit
end
function CoreSpawnUnitCutsceneKey:control_for_database_browser_button(parent_frame)
	local button = EWS.Button(slot3, EWS, parent_frame, "Pick From Database Browser", "")
	slot11 = "_on_database_browser_button_clicked"
	slot8 = button

	button.connect(EWS, button, "EVT_COMMAND_BUTTON_CLICKED", callback("", self, self))

	return button
end
function CoreSpawnUnitCutsceneKey:refresh_control_for_unit_category(control)
	slot4 = control

	control.freeze(slot3)

	slot4 = control

	control.clear(slot3)

	slot4 = self
	local value = self.unit_category(slot3)
	slot7 = managers.database

	for _, unit_category in ipairs(managers.database.list_unit_types(slot6)) do
		slot11 = unit_category

		control.append(slot9, control)

		if unit_category == value then
			slot11 = value

			control.set_value(slot9, control)
		end
	end

	slot5 = control

	control.thaw(slot4)

	return 
end
function CoreSpawnUnitCutsceneKey:refresh_control_for_unit_type(control)
	slot4 = control

	control.freeze(slot3)

	slot4 = control

	control.clear(slot3)

	slot4 = self
	local value = self.unit_type(slot3)
	slot7 = managers.database
	slot10 = self

	for _, unit_type in ipairs(managers.database.list_units_of_type(slot6, self.unit_category(slot9))) do
		slot11 = unit_type

		control.append(slot9, control)

		if unit_type == value then
			slot11 = value

			control.set_value(slot9, control)
		end
	end

	slot5 = control

	control.thaw(slot4)

	return 
end
function CoreSpawnUnitCutsceneKey:refresh_control_for_parent_unit_name(control)
	slot4 = control

	control.freeze(slot3)

	slot4 = control

	control.clear(slot3)

	slot7 = self
	local unit_names = table.exclude(slot3, self.name(self))
	slot5 = unit_names

	if table.empty(self._unit_names(slot5)) then
		slot6 = false

		control.set_enabled(slot4, control)
	else
		slot6 = true

		control.set_enabled(slot4, control)

		local value = self.parent_unit_name(slot4)
		slot6 = unit_names

		for _, unit_name in pairs(self) do
			slot12 = unit_name

			control.append(slot10, control)

			if unit_name == value then
				slot12 = value

				control.set_value(slot10, control)
			end
		end
	end

	slot5 = control

	control.thaw(slot4)

	return 
end
function CoreSpawnUnitCutsceneKey:refresh_control_for_parent_object_name(control)
	slot4 = control

	control.freeze(slot3)

	slot4 = control

	control.clear(slot3)

	slot4 = self
	slot7 = self
	local object_names = self._unit_object_names(slot3, self.parent_unit_name(slot6))

	if #object_names == 0 then
		slot6 = false

		control.set_enabled(slot4, control)
	else
		slot6 = true

		control.set_enabled(slot4, control)

		local value = self.parent_object_name(slot4)
		slot6 = object_names

		for _, object_name in ipairs(self) do
			slot12 = object_name

			control.append(slot10, control)

			if object_name == value then
				slot12 = value

				control.set_value(slot10, control)
			end
		end
	end

	slot5 = control

	control.thaw(slot4)

	return 
end
function CoreSpawnUnitCutsceneKey:on_attribute_changed(attribute_name, value, previous_value)
	slot6 = self._cast

	assert(slot5)

	if self._spawned_unit == nil then
		slot6 = self

		self._spawn_unit(slot5)
	elseif attribute_name == "unit_type" then
		slot6 = self._cast
		slot9 = self

		self._cast.delete_unit(slot5, self.name(slot8))

		slot6 = self

		self._spawn_unit(slot5)
	elseif attribute_name == "name" then
		slot8 = true
		local existing_unit = self._unit(slot5, self, value)
		slot7 = existing_unit == nil or existing_unit == self._spawned_unit

		assert(slot6)

		slot9 = value

		self._cast.rename_unit(slot6, self._cast, previous_value)
	elseif attribute_name == "parent_object_name" or attribute_name == "offset" or attribute_name == "rotation" then
		slot6 = self

		self._reparent_unit(slot5)
	end

	return 
end
function CoreSpawnUnitCutsceneKey:_spawn_unit()
	slot3 = self

	if self.is_valid(slot2) and self._cast then
		slot3 = self._cast
		slot6 = self

		if self._cast.unit(slot2, self.name(slot5)) == nil then
			slot4 = self.name(slot5)
			slot7 = self
			self._spawned_unit = self._cast.spawn_unit(slot2, self._cast, self.unit_type(self))
			slot3 = self

			self._reparent_unit(slot2)
		end
	end

	return 
end
function CoreSpawnUnitCutsceneKey:_delete_unit()
	slot3 = self

	if self.is_valid(slot2) and self._cast then
		slot3 = self._cast
		slot6 = self

		self._cast.delete_unit(slot2, self.name(slot5))
	end

	return 
end
function CoreSpawnUnitCutsceneKey:_reparent_unit()
	if self._spawned_unit then
		slot3 = self._spawned_unit

		self._spawned_unit.unlink(slot2)

		slot7 = self
		slot6 = true
		local parent_object = self._unit_object(slot2, self, self.parent_unit_name(slot5), self.parent_object_name(self))

		if parent_object then
			local parent_unit = self._unit(slot3, self.parent_unit_name(slot6))
			slot8 = parent_object

			parent_unit.link(self, parent_unit, parent_object.name(self))

			slot5 = self._spawned_unit
			slot8 = self

			self._spawned_unit.set_local_position(self, self.offset(self._spawned_unit))

			slot5 = self._spawned_unit

			self._spawned_unit.set_local_rotation(self, self.rotation(self._spawned_unit))

			slot5 = self._cast
			slot3 = self._cast._set_unit_and_children_visible
			slot6 = self._spawned_unit
			slot9 = self._cast
			slot12 = self

			if self._cast.unit_visible(self, self.name(slot11)) then
				slot9 = parent_unit
				slot7 = parent_unit.visible(slot8)
			end

			slot3(slot4, slot5, slot6)
		end
	end

	return 
end
function CoreSpawnUnitCutsceneKey:update_gui(time, delta_time)
	if self._database_browser then
		slot7 = delta_time

		if self._database_browser.update(slot4, self._database_browser, time) then
			slot5 = self._cutscene_editor_window

			if alive(slot4) then
				slot6 = true

				self._cutscene_editor_window.set_enabled(slot4, self._cutscene_editor_window)

				slot5 = self._cutscene_editor_window

				self._cutscene_editor_window.set_focus(slot4)
			end

			self._cutscene_editor_window = nil
			self._database_browser = nil
		end
	end

	return 
end
function CoreSpawnUnitCutsceneKey:_on_database_browser_button_clicked(button)
	slot4 = button
	self._cutscene_editor_window = button.parent(slot3)

	while self._cutscene_editor_window and type_name(slot3) ~= "EWSFrame" do
		slot4 = self._cutscene_editor_window
		self._cutscene_editor_window = self._cutscene_editor_window.parent(slot3)
	end

	slot5 = "Button is not inside a top-level window."

	assert(slot3, self._cutscene_editor_window)

	slot5 = false

	self._cutscene_editor_window.set_enabled(slot3, self._cutscene_editor_window)

	slot8 = ProjectDatabase
	self._database_browser = CoreDBDialog.new(slot3, CoreDBDialog, "unit", self, self._on_database_browser_entry_selected)

	return 
end
function CoreSpawnUnitCutsceneKey:_on_database_browser_entry_selected()
	if self._database_browser then
		slot3 = self._database_browser
		local selected_entry = self._database_browser.get_value(slot2)
	end

	assert(slot3, selected_entry)

	slot6 = selected_entry
	slot6 = selected_entry.name("Callback should only be called if an entry was selected.")
	local unit_data = CoreEngineAccess._editor_unit_data(selected_entry.name("Callback should only be called if an entry was selected.").id("Callback should only be called if an entry was selected."))

	if unit_data then
		slot5 = self
		slot8 = unit_data
		slot8 = unit_data.type(slot7)

		self.set_unit_category(slot4, unit_data.type(slot7).s(slot7))

		slot5 = self
		slot8 = unit_data
		slot8 = unit_data.name(slot7)

		self.set_unit_type(slot4, unit_data.name(slot7).s(slot7))

		slot6 = "unit_category"

		self.refresh_control_for_attribute(slot4, self)

		slot6 = "unit_type"

		self.refresh_control_for_attribute(slot4, self)
	end

	return 
end

return 
