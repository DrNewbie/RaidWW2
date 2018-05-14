slot2 = "core/lib/utils/dev/tools/cutscene_editor/CoreCutsceneAnimationPatchesPanel"

require(slot1)

slot2 = "core/lib/utils/dev/tools/cutscene_editor/CoreCutsceneEditorProject"

require(slot1)

CoreCutsceneSettingsDialog = CoreCutsceneSettingsDialog or class()
function CoreCutsceneSettingsDialog:init(parent)
	slot12 = 0
	slot13 = 0
	slot10 = "DEFAULT_DIALOG_STYLE,RESIZE_BORDER"
	self.__window = EWS.Dialog(slot3, EWS, parent, "Project Settings", "", Vector3(slot9, 100, 500), Vector3(100, 400, 500))
	slot4 = self.__window
	slot7 = "film_reel_16x16.png"

	self.__window.set_icon(slot3, CoreEWS.image_path("Project Settings"))

	slot4 = self.__window
	slot9 = 0

	self.__window.set_min_size(slot3, Vector3("Project Settings", 400, 321))

	slot5 = "EVT_CLOSE_WINDOW"
	slot10 = "_on_close"

	self.__window.connect(slot3, self.__window, callback(400, self, self))

	slot5 = "VERTICAL"
	local sizer = EWS.BoxSizer(slot3, EWS)
	slot6 = sizer

	self.__window.set_sizer(EWS, self.__window)

	slot8 = "Properties"
	local project_settings_sizer = EWS.StaticBoxSizer(EWS, EWS, self.__window, "VERTICAL")
	slot10 = "CB_DROPDOWN,CB_READONLY"
	self.__export_type_dropdown = EWS.ComboBox(EWS, EWS, self.__window, "", "")
	slot8 = "CutsceneEditorProject"
	slot6 = get_core_or_local(self.__window).VALID_EXPORT_TYPES

	for _, export_type in ipairs(EWS) do
		slot12 = export_type

		self.__export_type_dropdown.append(slot10, self.__export_type_dropdown)
	end

	slot6 = self.__export_type_dropdown
	slot9 = self

	self.__export_type_dropdown.set_value(slot5, self.export_type(slot8))

	slot11 = "Export Type:"
	slot10 = "TOP,LEFT,RIGHT,EXPAND"

	project_settings_sizer.add(slot5, project_settings_sizer, EWS.StaticText(slot8, EWS, self.__window), 0, 5)

	slot10 = "ALL,EXPAND"

	project_settings_sizer.add(slot5, project_settings_sizer, self.__export_type_dropdown, 1, 5)

	slot10 = "ALL,EXPAND"

	sizer.add(slot5, sizer, project_settings_sizer, 0, 5)

	slot9 = "Animation Overrides when Optimizing"
	local animation_patches_sizer = EWS.StaticBoxSizer(slot5, EWS, self.__window, "VERTICAL")
	slot8 = self.__window
	self.__animation_patches = core_or_local(EWS, "CutsceneAnimationPatchesPanel")
	slot11 = "EXPAND"

	self.__animation_patches.add_to_sizer(EWS, self.__animation_patches, animation_patches_sizer, 1, 0)

	slot11 = "ALL,EXPAND"

	sizer.add(EWS, sizer, animation_patches_sizer, 1, 5)

	slot8 = self.__window
	local buttons_panel = self._create_buttons_panel(EWS, self)
	slot12 = "ALL,EXPAND"

	sizer.add(self, sizer, buttons_panel, 0, 4)

	return 
end
function CoreCutsceneSettingsDialog:destroy()
	slot3 = self.__animation_patches

	self.__animation_patches.destroy(slot2)

	slot3 = self.__window

	self.__window.destroy(slot2)

	self.__window = nil

	return 
end
function CoreCutsceneSettingsDialog:show()
	slot3 = self
	self.__revert_export_type = self.export_type(slot2)
	slot3 = self.__animation_patches
	self.__revert_animation_patches = self.__animation_patches.patches(slot2)
	slot3 = self.__window

	return self.__window.show_modal(slot2)
end
function CoreCutsceneSettingsDialog:set_unit_types(unit_types)
	slot5 = unit_types

	self.__animation_patches.set_unit_types(slot3, self.__animation_patches)

	return 
end
function CoreCutsceneSettingsDialog:populate_from_project(project)
	slot4 = self.__animation_patches
	slot7 = project

	self.__animation_patches.set_patches(slot3, project.animation_patches(slot6))

	slot4 = project
	self.__export_type = project.export_type(slot3)
	slot5 = self.__export_type

	self.__export_type_dropdown.set_value(slot3, self.__export_type_dropdown)

	return 
end
function CoreCutsceneSettingsDialog:unit_animation_patches()
	slot3 = self.__animation_patches

	return self.__animation_patches.patches(slot2)
end
function CoreCutsceneSettingsDialog:export_type()
	if not self.__export_type then
		slot3 = "CutsceneEditorProject"
		slot1 = get_core_or_local(slot2).DEFAULT_EXPORT_TYPE
	end

	return slot1
end
function CoreCutsceneSettingsDialog:_create_buttons_panel(parent)
	slot5 = parent
	local panel = EWS.Panel(slot3, EWS)
	slot6 = "HORIZONTAL"
	local sizer = EWS.BoxSizer(EWS, EWS)
	slot7 = sizer

	panel.set_sizer(EWS, panel)

	slot8 = "OK"
	local ok_button = EWS.Button(EWS, EWS, panel)
	slot13 = "_on_ok_button_clicked"

	ok_button.connect(EWS, ok_button, "EVT_COMMAND_BUTTON_CLICKED", callback(ok_button, self, self))

	slot9 = "Cancel"
	local cancel_button = EWS.Button(EWS, EWS, panel)
	slot14 = "_on_close"
	slot11 = ok_button

	cancel_button.connect(EWS, cancel_button, "EVT_COMMAND_BUTTON_CLICKED", callback(self, self, self))

	slot12 = "RIGHT,EXPAND"

	sizer.add(EWS, sizer, ok_button, 1, 1)

	slot12 = "LEFT,EXPAND"

	sizer.add(EWS, sizer, cancel_button, 1, 2)

	return panel
end
function CoreCutsceneSettingsDialog:_on_ok_button_clicked(sender)
	slot4 = self.__export_type_dropdown
	self.__export_type = self.__export_type_dropdown.get_value(slot3)
	self.__revert_export_type = nil
	self.__revert_animation_patches = nil
	slot5 = "OK"

	self.__window.end_modal(slot3, self.__window)

	return 
end
function CoreCutsceneSettingsDialog:_on_close()
	slot4 = false

	self.__window.set_visible(slot2, self.__window)

	slot4 = self.__revert_export_type

	self.__export_type_dropdown.set_value(slot2, self.__export_type_dropdown)

	slot4 = self.__revert_animation_patches

	self.__animation_patches.set_patches(slot2, self.__animation_patches)

	self.__revert_export_type = nil
	self.__revert_animation_patches = nil
	slot4 = "CANCEL"

	self.__window.end_modal(slot2, self.__window)

	return 
end

return 
