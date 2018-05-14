-- Decompilation Error: _run_step(_unwarp_expressions, node)

-- Decompilation Error: _glue_flows(node)

-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreEditorUtils"

core.import(slot1, core)

slot3 = "CoreEws"

core.import(slot1, core)

if not EditUnitSettings then
	slot2 = EditUnitBase
	slot0 = class(slot1)
end

EditUnitSettings = slot0
function EditUnitSettings:init(editor)
	local panel, sizer = editor or managers.editor.add_unit_edit_page(slot3, editor or managers.editor)
	slot7 = "HORIZONTAL"
	local horizontal_sizer = EWS.BoxSizer({
		name = "Settings",
		class = self
	}, EWS)
	slot10 = "Core"
	local settings_sizer = EWS.StaticBoxSizer(EWS, EWS, panel, "VERTICAL")
	slot9 = "HORIZONTAL"
	local cutscene_actor_sizer = EWS.BoxSizer(EWS, EWS)
	slot16 = ""
	slot13 = "ALIGN_CENTER_VERTICAL"

	cutscene_actor_sizer.add(EWS, cutscene_actor_sizer, EWS.StaticText(slot11, EWS, panel, "Cutscene Actor:", 0), 1, 0)

	slot13 = "ALIGN_CENTRE,ST_NO_AUTORESIZE"
	local cutscene_actor_name = EWS.StaticText(EWS, EWS, panel, "", 0)
	slot14 = "ALIGN_CENTER_VERTICAL"

	cutscene_actor_sizer.add(EWS, cutscene_actor_sizer, cutscene_actor_name, 2, 0)

	slot13 = "TB_FLAT,TB_NODIVIDER"
	local cutscene_toolbar = EWS.ToolBar(EWS, EWS, panel, "")
	slot16 = "plus_16x16.png"

	cutscene_toolbar.add_tool(EWS, cutscene_toolbar, "US_ADD_CUTSCENE_ACTOR", "Add this unit as an actor.", CoreEws.image_path(0))

	slot18 = "add_cutscene_actor"

	cutscene_toolbar.connect(EWS, cutscene_toolbar, "US_ADD_CUTSCENE_ACTOR", "EVT_COMMAND_MENU_SELECTED", callback("Add this unit as an actor.", self, self))

	slot16 = "toolbar\\delete_16x16.png"

	cutscene_toolbar.add_tool(EWS, cutscene_toolbar, "US_REMOVE_CUTSCENE_ACTOR", "Remove this unit as an actor.", CoreEws.image_path(nil))

	slot18 = "remove_cutscene_actor"
	slot15 = nil

	cutscene_toolbar.connect(EWS, cutscene_toolbar, "US_REMOVE_CUTSCENE_ACTOR", "EVT_COMMAND_MENU_SELECTED", callback("Add this unit as an actor.", self, self))

	slot11 = cutscene_toolbar

	cutscene_toolbar.realize(EWS)

	slot15 = "EXPAND"

	cutscene_actor_sizer.add(EWS, cutscene_actor_sizer, cutscene_toolbar, 0, 0)
	settings_sizer.add(EWS, settings_sizer, cutscene_actor_sizer, 0, 5)

	slot14 = ""
	local disable_shadows = EWS.CheckBox(EWS, EWS, panel, "Disable Shadows")
	slot18 = "set_disable_shadows"
	slot15 = nil

	disable_shadows.connect(EWS, disable_shadows, "EVT_COMMAND_CHECKBOX_CLICKED", callback("EXPAND,BOTTOM", self, self))
	settings_sizer.add(EWS, settings_sizer, disable_shadows, 1, 5)

	slot15 = ""
	local hide_on_projection_light = EWS.CheckBox(EWS, EWS, panel, "Hide On Projection Light")
	slot19 = "set_hide_on_projection_light"
	slot16 = nil

	hide_on_projection_light.connect(EWS, hide_on_projection_light, "EVT_COMMAND_CHECKBOX_CLICKED", callback("EXPAND,BOTTOM", self, self))
	settings_sizer.add(EWS, settings_sizer, hide_on_projection_light, 1, 5)

	slot16 = ""
	local disable_on_ai_graph = EWS.CheckBox(EWS, EWS, panel, "Disable On AI Graph")
	slot20 = "set_disable_on_ai_graph"
	slot17 = nil

	disable_on_ai_graph.connect(EWS, disable_on_ai_graph, "EVT_COMMAND_CHECKBOX_CLICKED", callback("EXPAND,BOTTOM", self, self))

	slot18 = "EXPAND,BOTTOM"

	settings_sizer.add(EWS, settings_sizer, disable_on_ai_graph, 1, 5)

	slot18 = "ALIGN_LEFT"

	horizontal_sizer.add(EWS, horizontal_sizer, settings_sizer, 0, 0)

	slot18 = "ALIGN_LEFT,EXPAND"

	sizer.add(EWS, sizer, horizontal_sizer, 1, 0)

	self._ctrls = {
		cutscene_actor_name = cutscene_actor_name,
		cutscene_actor_toolbar = cutscene_toolbar,
		disable_shadows = disable_shadows,
		hide_on_projection_light = hide_on_projection_light,
		disable_on_ai_graph = disable_on_ai_graph
	}
	slot14 = panel

	panel.layout(EWS)

	slot15 = false

	panel.set_enabled(EWS, panel)

	self._panel = panel

	return 
end
function EditUnitSettings:add_cutscene_actor()
	slot12 = 0
	slot9 = true
	local name = EWS.get_text_from_user(slot2, EWS, Global.frame_panel, "Enter name for cutscene actor:", "Add cutscene actor", "", Vector3(slot9, -1, -1))

	if name and name ~= "" then
		slot4 = self._ctrls.unit
		self._ctrls.unit.unit_data(slot3).cutscene_actor = name
		slot5 = self._ctrls.unit

		if managers.cutscene.register_cutscene_actor(slot3, managers.cutscene) then
			slot5 = name

			self._ctrls.cutscene_actor_name.set_value(slot3, self._ctrls.cutscene_actor_name)

			slot6 = true

			self._ctrls.cutscene_actor_toolbar.set_tool_enabled(slot3, self._ctrls.cutscene_actor_toolbar, "US_REMOVE_CUTSCENE_ACTOR")
		else
			slot4 = self._ctrls.unit
			self._ctrls.unit.unit_data(slot3).cutscene_actor = nil
			slot4 = self

			self.add_cutscene_actor(nil)
		end
	end

	return 
end
function EditUnitSettings:remove_cutscene_actor()
	slot4 = self._ctrls.unit

	managers.cutscene.unregister_cutscene_actor(slot2, managers.cutscene)

	slot3 = self._ctrls.unit
	self._ctrls.unit.unit_data(slot2).cutscene_actor = nil
	slot4 = ""

	self._ctrls.cutscene_actor_name.set_value(nil, self._ctrls.cutscene_actor_name)

	return 
end
function EditUnitSettings:set_disable_shadows()
	slot3 = self._ctrls.units

	for _, unit in ipairs(slot2) do
		slot8 = unit

		if alive(slot7) then
			slot9 = self._ctrls.disable_shadows
			unit.unit_data(slot7).disable_shadows = self._ctrls.disable_shadows.get_value(unit)
			slot11 = unit
			slot9 = unit.unit_data(slot10).disable_shadows

			unit.set_shadows_disabled(self._ctrls.disable_shadows.get_value(unit), unit)
		end
	end

	return 
end
function EditUnitSettings:set_hide_on_projection_light()
	slot3 = self._ctrls.units

	for _, unit in ipairs(slot2) do
		slot8 = unit

		if alive(slot7) then
			slot9 = self._ctrls.hide_on_projection_light
			unit.unit_data(slot7).hide_on_projection_light = self._ctrls.hide_on_projection_light.get_value(unit) or nil
		end
	end

	return 
end
function EditUnitSettings:set_disable_on_ai_graph()
	slot3 = self._ctrls.units

	for _, unit in ipairs(slot2) do
		slot8 = unit

		if alive(slot7) then
			slot9 = self._ctrls.disable_on_ai_graph
			unit.unit_data(slot7).disable_on_ai_graph = self._ctrls.disable_on_ai_graph.get_value(unit) or nil
		end
	end

	return 
end
function EditUnitSettings:is_editable(unit, units)
	slot5 = unit

	if alive(slot4) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-21, warpins: 1 ---
		self._ctrls.unit = unit
		self._ctrls.units = units
		slot5 = self._ctrls.cutscene_actor_name
		slot3 = self._ctrls.cutscene_actor_name.set_value
		slot8 = self._ctrls.unit
		slot6 = self._ctrls.unit.unit_data(slot7).cutscene_actor or ""

		slot3(slot4, slot5)

		slot9 = self._ctrls.unit

		self._ctrls.cutscene_actor_toolbar.set_tool_enabled(slot4, self._ctrls.cutscene_actor_toolbar, "US_REMOVE_CUTSCENE_ACTOR")

		slot8 = self._ctrls.unit
		slot6 = self._ctrls.unit.unit_data(self._ctrls.unit.unit_data(self._ctrls.unit).cutscene_actor).disable_shadows

		self._ctrls.disable_shadows.set_value(slot4, self._ctrls.disable_shadows)

		slot8 = self._ctrls.unit
		slot6 = self._ctrls.unit.unit_data(self._ctrls.unit.unit_data(self._ctrls.unit).cutscene_actor).hide_on_projection_light

		self._ctrls.hide_on_projection_light.set_value(slot4, self._ctrls.hide_on_projection_light)

		slot8 = self._ctrls.unit
		slot6 = self._ctrls.unit.unit_data(self._ctrls.unit.unit_data(self._ctrls.unit).cutscene_actor).disable_on_ai_graph

		self._ctrls.disable_on_ai_graph.set_value(slot4, self._ctrls.disable_on_ai_graph)

		return true

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #1 22-22, warpins: 1 ---
		slot6 = ""
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 23-70, warpins: 2 ---
		--- END OF BLOCK #2 ---



	end

	return false
end

return 
