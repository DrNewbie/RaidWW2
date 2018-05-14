slot3 = "CoreStaticsLayer"

core.module(slot1, core)

slot3 = "CoreStaticLayer"

core.import(slot1, core)

slot3 = "CoreEditorUtils"

core.import(slot1, core)

slot3 = "CoreEws"

core.import(slot1, core)

if not StaticsLayer then
	slot2 = CoreStaticLayer.StaticLayer
	slot0 = class(slot1)
end

StaticsLayer = slot0
function StaticsLayer:init(owner)
	local types = CoreEditorUtils.layer_type(slot3)
	slot9 = "statics_layer"

	StaticsLayer.super.init("statics", self, owner, "statics", types)

	self._uses_continents = true

	return 
end
function StaticsLayer:build_panel(notebook)
	slot5 = notebook

	StaticsLayer.super.build_panel(slot3, self)

	return self._ews_panel, true
end
function StaticsLayer:add_btns_to_toolbar(...)
	slot3 = self

	StaticsLayer.super.add_btns_to_toolbar(slot2, ...)

	slot8 = "toolbar\\copy_folder_16x16.png"

	self._btn_toolbar.add_tool(slot2, self._btn_toolbar, "MOVE_TO_CONTINENT", "Move to continent", CoreEws.image_path(slot7))

	slot10 = "_on_gui_move_to_continent"
	slot7 = nil

	self._btn_toolbar.connect(slot2, self._btn_toolbar, "MOVE_TO_CONTINENT", "EVT_COMMAND_MENU_SELECTED", callback("Move to continent", self, self))

	return 
end
function StaticsLayer:_on_gui_move_to_continent()
	if #self._selected_units == 0 then
		return 
	end

	local continent = nil
	slot6 = managers.editor
	local continents = table.map_keys(managers.editor.continents(slot5))
	slot5 = continents
	slot8 = managers.editor

	table.delete(managers.editor.continents, managers.editor.current_continent_name(slot7))

	if 1 < #continents then
		slot10 = ""
		local dialog = EWS.SingleChoiceDialog(slot4, EWS, Global.frame_panel, "Select which continent to move units:", "Continents", continents)
		slot6 = dialog

		dialog.show_modal(EWS)

		slot6 = dialog
		continent = dialog.get_string_selection(EWS)

		if not continent or continent == "" then
			return nil
		end
	else
		continent = continents[1]
	end

	slot6 = continent

	self.move_to_continent(slot4, self)

	return 
end
function StaticsLayer:set_enabled(enabled)
	if not enabled then
		slot5 = "Don't want to disable Statics layer since it would cause all dynamics to fall."

		managers.editor.output_warning(slot3, managers.editor)
	end

	return false
end

return 
