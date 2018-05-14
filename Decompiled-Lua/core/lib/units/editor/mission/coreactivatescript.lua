if not CoreActivateScriptUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

CoreActivateScriptUnitElement = slot0

if not ActivateScriptUnitElement then
	slot2 = CoreActivateScriptUnitElement
	slot0 = class(slot1)
end

ActivateScriptUnitElement = slot0
function ActivateScriptUnitElement:init(...)
	slot3 = self

	CoreActivateScriptUnitElement.init(slot2, ...)

	return 
end
function CoreActivateScriptUnitElement:init(unit)
	slot5 = unit

	MissionElement.init(slot3, self)

	self._hed.activate_script = "none"
	slot5 = "activate_script"

	table.insert("none", self._save_values)

	return 
end
function CoreActivateScriptUnitElement:selected()
	slot3 = self

	MissionElement.selected(slot2)

	slot3 = self._script_params
	slot6 = self

	CoreEWS.update_combobox_options(slot2, self._scripts(slot5))

	if self._hed.activate_script ~= "none" then
		slot5 = self
		slot4 = self._hed.activate_script

		if not table.contains(slot2, self._scripts(slot4)) then
			self._hed.activate_script = "none"
		end
	end

	slot4 = self._hed.activate_script

	CoreEWS.change_combobox_value(slot2, self._script_params)

	return 
end
function CoreActivateScriptUnitElement:_scripts()
	slot4 = "Mission"
	slot3 = managers.editor.layer(slot2, managers.editor)

	return managers.editor.layer(slot2, managers.editor).script_names(slot2)
end
function CoreActivateScriptUnitElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot6 = self
	self._script_params = {
		default = "none",
		name = "Script:",
		ctrlr_proportions = 2,
		name_proportions = 1,
		tooltip = "Select a script from the combobox",
		sorted = true,
		panel = panel,
		sizer = panel_sizer,
		options = self._scripts(slot5),
		value = self._hed.activate_script
	}
	local scripts = CoreEWS.combobox(self._hed.activate_script)
	slot12 = "set_element_data"
	slot9 = {
		value = "activate_script",
		ctrlr = scripts
	}

	scripts.connect(self._script_params, scripts, "EVT_COMMAND_COMBOBOX_SELECTED", callback(slot9, self, self))

	return 
end

return 
