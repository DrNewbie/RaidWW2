slot2 = "core/lib/utils/dev/ews/CoreTableEditorPanel"

require(slot1)

slot2 = "core/lib/utils/dev/tools/cutscene_editor/CoreCutsceneEditorProject"

require(slot1)

if not CoreCutsceneAnimationPatchesPanel then
	slot2 = CoreTableEditorPanel
	slot0 = class(slot1)
end

CoreCutsceneAnimationPatchesPanel = slot0
function CoreCutsceneAnimationPatchesPanel:init(parent)
	slot5 = parent

	self.super.init(slot3, self)

	self.__unit_types = {}
	slot4 = self

	self.freeze(slot3)

	slot5 = "Unit Name"

	self.add_column(slot3, self)

	slot5 = "Blend Set"

	self.add_column(slot3, self)

	slot5 = "Animation"

	self.add_column(slot3, self)

	slot4 = self

	self.thaw(slot3)

	return 
end
function CoreCutsceneAnimationPatchesPanel:unit_types()
	return self.__unit_types or {}
end
function CoreCutsceneAnimationPatchesPanel:set_unit_types(unit_types)
	slot2 = assert
	slot6 = unit_types

	if type(slot5) == "table" then
		slot8 = unit_types

		function slot7(v)
			slot4 = "unit"
			slot7 = v
			slot7 = tostring(slot6)

			return DB.has(slot2, DB, tostring(slot6).id(slot6))
		end

		slot4 = table.true_for_all(slot5, table.map_values(slot7))
	else
		slot4 = false

		if false then
			slot4 = true
		end
	end

	slot5 = "Expected unit_types to be a table mapping actor names to Unit type names."

	slot2(slot3, slot4)

	self.__unit_types = unit_types
	slot4 = self

	self._refresh_fields_panel(slot3)

	slot4 = self

	self._refresh_buttons_panel(slot3)

	return 
end
function CoreCutsceneAnimationPatchesPanel:patches()
	local patches = {}
	local list_ctrl = self.__list_ctrl
	slot5 = list_ctrl
	local row_count = list_ctrl.item_count(slot4)

	for row = 0, row_count - 1, 1 do
		slot12 = 0
		local unit_name = list_ctrl.get_item(slot9, list_ctrl, row)
		slot13 = 1
		local blend_set = list_ctrl.get_item(list_ctrl, list_ctrl, row)
		slot14 = 2
		local animation = list_ctrl.get_item(list_ctrl, list_ctrl, row)
		patches[unit_name] = patches[unit_name] or {}
		patches[unit_name][blend_set] = animation
	end

	return patches
end
function CoreCutsceneAnimationPatchesPanel:set_patches(patches)
	slot4 = self

	self.freeze(slot3)

	slot4 = self

	self.clear(slot3)

	slot2 = pairs
	slot4 = patches or {}

	for unit_name, overrides in slot2(slot3) do
		slot9 = overrides

		for blend_set, animation in pairs(slot8) do
			slot17 = animation

			self.add_item(slot13, self, unit_name, blend_set)
		end
	end

	slot4 = self

	self.thaw(slot3)

	return 
end
function CoreCutsceneAnimationPatchesPanel:_sizer_with_editable_fields(parent)
	slot5 = "VERTICAL"
	local sizer = EWS.BoxSizer(slot3, EWS)
	slot5 = self

	if self.selected_item(EWS) ~= nil then
		slot7 = self
		slot3 = not table.empty(self.unit_types(slot6))
	else
		slot3 = false

		if false then
			local unit_name_enabled = true
		end
	end

	slot8 = "Unit Name:"
	local unit_name_label = EWS.StaticText(slot5, EWS, parent)
	slot8 = unit_name_enabled

	unit_name_label.set_enabled(EWS, unit_name_label)

	slot11 = "TOP,LEFT,RIGHT"

	sizer.add(EWS, sizer, unit_name_label, 0, 5)

	slot8 = parent
	local unit_name_dropdown = self._create_unit_name_dropdown(EWS, self)
	slot9 = unit_name_enabled

	unit_name_dropdown.set_enabled(self, unit_name_dropdown)

	slot12 = "ALL,EXPAND"

	sizer.add(self, sizer, unit_name_dropdown, 0, 5)

	slot11 = sizer

	self._create_labeled_text_field(self, self, "Blend Set", parent)

	slot9 = parent
	local animation_text_field = self._create_animation_text_field(self, self)
	slot13 = "EXPAND"

	sizer.add(self, sizer, animation_text_field, 0, 0)

	if unit_name_enabled then
		slot9 = unit_name_dropdown

		unit_name_dropdown.set_focus(slot8)
	end

	return sizer
end
function CoreCutsceneAnimationPatchesPanel:_create_unit_name_dropdown(parent)
	slot5 = "Unit Name"
	local value = self.selected_item_value(slot3, self)
	slot9 = "CB_DROPDOWN,CB_READONLY,CB_SORT"
	local control = EWS.ComboBox(self, EWS, parent, "", "")
	slot6 = control

	control.freeze(EWS)

	local first_value = nil
	slot9 = self

	for unit_name, _ in pairs(self.unit_types("")) do
		first_value = first_value or unit_name
		slot13 = unit_name

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
	slot13 = "Unit Name"

	control.connect(slot6, control, self._make_control_edited_callback(control.get_min_size(slot9), self, control))

	slot7 = control

	control.thaw(slot6)

	return control
end
function CoreCutsceneAnimationPatchesPanel:_create_animation_text_field(parent)
	slot5 = "HORIZONTAL"
	local sizer = EWS.BoxSizer(slot3, EWS)
	slot6 = "VERTICAL"
	local labeled_text_field_sizer = EWS.BoxSizer(EWS, EWS)
	slot9 = labeled_text_field_sizer
	local text_ctrl = self._create_labeled_text_field(EWS, self, "Animation", parent)
	slot9 = "Browse..."
	local button = EWS.Button(self, EWS, parent)
	slot11 = self
	slot9 = self.selected_item(slot10) ~= nil

	button.set_enabled(slot7, button)

	slot14 = "_on_browse_for_animation"

	button.connect(slot7, button, "EVT_COMMAND_BUTTON_CLICKED", callback(text_ctrl, self, self))

	slot12 = "EXPAND"

	sizer.add(slot7, sizer, labeled_text_field_sizer, 1, 0)

	slot12 = "BOTTOM,RIGHT,ALIGN_BOTTOM"

	sizer.add(slot7, sizer, button, 0, 4)

	return sizer
end
function CoreCutsceneAnimationPatchesPanel:_refresh_buttons_panel()
	slot3 = self

	self.super._refresh_buttons_panel(slot2)

	slot8 = self
	slot4 = not table.empty(self.unit_types(slot7))

	self.__add_button.set_enabled(slot2, self.__add_button)

	return 
end
function CoreCutsceneAnimationPatchesPanel:_on_browse_for_animation(text_ctrl)
	slot4 = self
	slot7 = text_ctrl
	local dir, path = self._absolute_dir_and_path(slot3, text_ctrl.get_value(slot6))

	if not dir and not self.__default_dir then
		slot6 = managers.database
		dir = managers.database.base_path(slot5) .. "data"
	end

	path = path or ""
	slot9 = self
	slot12 = "OPEN,FILE_MUST_EXIST"
	local dialog = EWS.FileDialog(slot5, EWS, self._top_level_window(slot8), "Select an Animation File", dir, path, "Diesel Animation (*.diesel)|*.diesel")
	slot7 = dialog

	if dialog.show_modal(EWS) then
		slot7 = dialog
		self.__default_dir = dialog.get_directory(slot6)
		slot9 = dialog
		slot11 = managers.database
		slot8 = "^" .. managers.database.base_path(slot10) .. "(.*)"
		local relative_path = string.match(slot6, dialog.get_path(slot8))
		slot9 = relative_path

		text_ctrl.set_value(dialog.get_path(slot8), text_ctrl)
	end

	return 
end
function CoreCutsceneAnimationPatchesPanel:_absolute_dir_and_path(relative_path)
	slot6 = false
	relative_path = Application.nice_path(slot3, Application, relative_path or "")
	slot5 = "data\\"

	if string.begins(slot3, relative_path) then
		local absolute_path = managers.database.base_path(slot3) .. relative_path
		slot6 = "^(.+)\\"
		local absolute_dir = string.match(managers.database, absolute_path)

		return absolute_dir, absolute_path
	else
		return nil, nil
	end

	return 
end

return 
