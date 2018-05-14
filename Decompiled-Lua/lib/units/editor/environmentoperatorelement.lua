if not EnvironmentOperatorElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

EnvironmentOperatorElement = slot0
EnvironmentOperatorElement.ACTIONS = {
	"set"
}
function EnvironmentOperatorElement:init(unit)
	slot5 = unit

	EnvironmentOperatorElement.super.init(slot3, self)

	self._hed.operation = "set"
	self._hed.environment = ""
	self._hed.elements = {}
	slot5 = "environment"

	table.insert(, self._save_values)

	slot5 = "operation"

	table.insert(, self._save_values)

	self._actions = EnvironmentOperatorElement.ACTIONS

	return 
end
function EnvironmentOperatorElement:clear(...)
	return 
end
function EnvironmentOperatorElement:add_to_mission_package()
	slot4 = {
		category = "script_data",
		name = self._hed.environment .. ".environment"
	}

	managers.editor.add_to_world_package(slot2, managers.editor)

	slot4 = {
		category = "scenes",
		name = self._hed.environment
	}

	managers.editor.add_to_world_package(slot2, managers.editor)

	return 
end
function EnvironmentOperatorElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer

	self._build_value_combobox(slot4, self, panel, panel_sizer, "operation", self._actions)

	slot12 = "environment"
	slot10 = "Select an environment to use"

	self._build_value_combobox(slot4, self, panel, panel_sizer, "environment", managers.database.list_entries_of_type("Select an operation for the selected elements", managers.database))

	return 
end

return 
