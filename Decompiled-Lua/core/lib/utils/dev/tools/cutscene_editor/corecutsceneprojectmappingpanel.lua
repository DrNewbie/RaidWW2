slot2 = "core/lib/utils/dev/ews/CoreTableEditorPanel"

require(slot1)

slot2 = "core/lib/utils/dev/tools/cutscene_editor/CoreCutsceneEditorProject"

require(slot1)

if not CoreCutsceneProjectMappingPanel then
	slot2 = CoreTableEditorPanel
	slot0 = class(slot1)
end

CoreCutsceneProjectMappingPanel = slot0
function CoreCutsceneProjectMappingPanel:init(parent)
	slot5 = parent

	self.super.init(slot3, self)

	slot4 = self

	self.freeze(slot3)

	slot5 = "Project"

	self.add_column(slot3, self)

	slot5 = "Output"

	self.add_column(slot3, self)

	slot4 = self

	self.thaw(slot3)

	return 
end
function CoreCutsceneProjectMappingPanel:projects()
	slot4 = "cutscene_project"

	return managers.database.list_entries_of_type(slot2, managers.database)
end
function CoreCutsceneProjectMappingPanel:mappings()
	local mappings = {}
	local list_ctrl = self.__list_ctrl
	slot5 = list_ctrl
	local row_count = list_ctrl.item_count(slot4)

	for row = 0, row_count - 1, 1 do
		slot12 = 0
		local project = list_ctrl.get_item(slot9, list_ctrl, row)
		slot13 = 1
		local output = list_ctrl.get_item(list_ctrl, list_ctrl, row)
		mappings[project] = output
	end

	return mappings
end
function CoreCutsceneProjectMappingPanel:set_mappings(mappings, project_sort_func)
	slot5 = self

	self.freeze(slot4)

	slot5 = self

	self.clear(slot4)

	if mappings then
		slot8 = project_sort_func

		for _, project in ipairs(table.map_keys(slot6, mappings)) do
			local output = mappings[project]
			slot13 = output

			self.add_item(slot10, self, project)
		end
	end

	slot6 = 0

	self.__list_ctrl.autosize_column(slot4, self.__list_ctrl)

	slot6 = 1

	self.__list_ctrl.autosize_column(slot4, self.__list_ctrl)

	slot5 = self

	self.thaw(slot4)

	return 
end
function CoreCutsceneProjectMappingPanel:_sizer_with_editable_fields(parent)
	slot5 = "VERTICAL"
	local sizer = EWS.BoxSizer(slot3, EWS)
	slot5 = self

	if self.selected_item(EWS) ~= nil then
		slot7 = self
		slot3 = not table.empty(self.projects(slot6))
	else
		slot3 = false

		if false then
			local project_enabled = true
		end
	end

	slot8 = "Project:"
	local project_label = EWS.StaticText(slot5, EWS, parent)
	slot8 = project_enabled

	project_label.set_enabled(EWS, project_label)

	slot11 = "TOP,LEFT,RIGHT"

	sizer.add(EWS, sizer, project_label, 0, 5)

	slot8 = parent
	local project_dropdown = self._create_project_dropdown(EWS, self)
	slot9 = project_enabled

	project_dropdown.set_enabled(self, project_dropdown)

	slot12 = "ALL,EXPAND"

	sizer.add(self, sizer, project_dropdown, 0, 5)

	slot11 = sizer

	self._create_labeled_text_field(self, self, "Output", parent)

	if project_enabled then
		slot8 = project_dropdown

		project_dropdown.set_focus(slot7)
	end

	return sizer
end
function CoreCutsceneProjectMappingPanel:_create_project_dropdown(parent)
	slot5 = "Project"
	local value = self.selected_item_value(slot3, self)
	slot9 = "CB_DROPDOWN,CB_READONLY,CB_SORT"
	local control = EWS.ComboBox(self, EWS, parent, "", "")
	slot6 = control

	control.freeze(EWS)

	local first_value = nil
	slot9 = self

	for _, project in pairs(self.projects("")) do
		first_value = first_value or project
		slot13 = project

		control.append(slot11, control)
	end

	if value then
		slot8 = value

		control.set_value(slot6, control)
	end

	slot7 = control
	slot10 = control
	slot11 = 0

	control.set_min_size(slot6, control.get_min_size(slot9).with_x(slot9, control.get_min_size(slot9)))

	slot8 = "EVT_COMMAND_COMBOBOX_SELECTED"
	slot13 = "Project"

	control.connect(slot6, control, self._make_control_edited_callback(control.get_min_size(slot9), self, control))

	slot7 = control

	control.thaw(slot6)

	return control
end
function CoreCutsceneProjectMappingPanel:_refresh_buttons_panel()
	slot3 = self

	self.super._refresh_buttons_panel(slot2)

	slot8 = self
	slot4 = not table.empty(self.projects(slot7))

	self.__add_button.set_enabled(slot2, self.__add_button)

	return 
end

return 
