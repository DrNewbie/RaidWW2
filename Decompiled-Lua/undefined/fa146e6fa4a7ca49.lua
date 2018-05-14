-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not WorldOperatorUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

WorldOperatorUnitElement = slot0
WorldOperatorUnitElement.ACTIONS = {
	"spawn",
	"despawn",
	"enable_plant_loot"
}
function WorldOperatorUnitElement:init(unit)
	slot5 = unit

	WorldOperatorUnitElement.super.init(slot3, self)

	self._hed.operation = "spawn"
	self._hed.world = ""
	self._hed.elements = {}
	slot5 = "use_instigator"

	table.insert(, self._save_values)

	slot5 = "operation"

	table.insert(, self._save_values)

	slot5 = "elements"

	table.insert(, self._save_values)

	self._actions = WorldOperatorUnitElement.ACTIONS

	return 
end
function WorldOperatorUnitElement:add_element()
	slot4 = {
		ray_type = "editor",
		mask = 10
	}
	local ray = managers.editor.unit_by_raycast(slot2, managers.editor)

	if ray and ray.unit then
		local id = ray.unit.unit_data(slot3).unit_id
		slot6 = id

		if table.contains(ray.unit, self._hed.elements) then
			slot6 = id

			table.delete(slot4, self._hed.elements)
		else
			slot6 = id

			table.insert(slot4, self._hed.elements)
		end
	end

	return 
end
function WorldOperatorUnitElement:add_triggers(vc)
	slot5 = Idstring(slot6)
	slot10 = "add_element"

	vc.add_trigger(slot3, vc, callback("lmb", self, self))

	return 
end
function WorldOperatorUnitElement:update_editing()
	slot4 = {
		ray_type = "editor",
		mask = 10
	}
	local ray = managers.editor.unit_by_raycast(slot2, managers.editor)

	if ray and ray.unit then
		slot4 = managers.sequence
		slot7 = ray.unit
		local sequences = managers.sequence.get_sequence_list(slot3, ray.unit.name(slot6))

		if 0 < #sequences then
			slot9 = 0

			Application.draw(slot4, Application, ray.unit, 0, 1)
		end
	end

	return 
end
function WorldOperatorUnitElement:draw_links_unselected(...)
	slot3 = self

	WorldOperatorUnitElement.super.draw_links_unselected(slot2, ...)

	slot3 = self._hed.elements

	for _, id in ipairs(slot2) do
		slot9 = id
		local unit = managers.editor.unit_with_id(slot7, managers.editor)
		slot9 = unit

		if alive(managers.editor) then
			local params = {
				g = 0,
				b = 0.5,
				r = 0,
				from_unit = unit,
				to_unit = self._unit
			}
			slot11 = params

			self._draw_link(slot9, self)

			slot14 = 0.5

			Application.draw(slot9, Application, unit, 0, 0)
		end
	end

	return 
end
function WorldOperatorUnitElement:draw_links_selected(...)
	slot3 = self

	WorldOperatorUnitElement.super.draw_links_selected(slot2, ...)

	slot3 = self._hed.elements

	for _, id in ipairs(slot2) do
		local unit = managers.editor.unit_with_id(slot7, managers.editor)
		local params = {
			g = 0,
			b = 0.5,
			r = 0,
			from_unit = unit,
			to_unit = self._unit
		}
		slot11 = params

		self._draw_link(id, self)

		slot14 = 0.25

		Application.draw(id, Application, unit, 0.25, 1)
	end

	return 
end
function WorldOperatorUnitElement:add_unit_list_btn()
	slot3 = self._unit
	local script = self._unit.mission_element_data(slot2).script

	local function f(unit)

		-- Decompilation error in this vicinity:
		slot3 = unit
		local id = unit.unit_data(slot2).unit_id
		slot5 = id

		if table.contains(unit, self._hed.elements) then
			return false
		end

		slot5 = "Mission"
		slot5 = unit
		slot5 = unit.type(managers.editor.layer(slot3, managers.editor))

		return managers.editor.layer(slot3, managers.editor).category_map(slot3)[unit.type(managers.editor.layer(slot3, managers.editor)).s(managers.editor.layer(slot3, managers.editor))]
	end

	local dialog = SelectUnitByNameModal.new(slot4, SelectUnitByNameModal, "Add Unit")
	slot8 = dialog

	for _, unit in ipairs(dialog.selected_units(f)) do
		local id = unit.unit_data(slot10).unit_id
		slot13 = id

		table.insert(unit, self._hed.elements)
	end

	return 
end
function WorldOperatorUnitElement:remove_unit_list_btn()
	local function f(unit)
		slot6 = unit
		slot4 = unit.unit_data(slot5).unit_id

		return table.contains(slot2, self._hed.elements)
	end

	local dialog = SelectUnitByNameModal.new(slot3, SelectUnitByNameModal, "Remove Unit")
	slot7 = dialog

	for _, unit in ipairs(dialog.selected_units(f)) do
		local id = unit.unit_data(slot9).unit_id
		slot12 = id

		table.delete(unit, self._hed.elements)
	end

	return 
end
function WorldOperatorUnitElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer

	self._build_value_combobox(slot4, self, panel, panel_sizer, "operation", self._actions)

	slot8 = "TB_FLAT,TB_NODIVIDER"
	local toolbar = EWS.ToolBar(slot4, EWS, panel, "")
	slot11 = "world_editor\\unit_by_name_list.png"

	toolbar.add_tool(EWS, toolbar, "ADD_UNIT_LIST", "Add unit from unit list", CoreEws.image_path("Select an operation for the selected elements"))

	slot13 = "add_unit_list_btn"

	toolbar.connect(EWS, toolbar, "ADD_UNIT_LIST", "EVT_COMMAND_MENU_SELECTED", callback(nil, self, self))

	slot11 = "toolbar\\delete_16x16.png"

	toolbar.add_tool(EWS, toolbar, "REMOVE_UNIT_LIST", "Remove unit from unit list", CoreEws.image_path(nil))

	slot13 = "remove_unit_list_btn"
	slot10 = nil

	toolbar.connect(EWS, toolbar, "REMOVE_UNIT_LIST", "EVT_COMMAND_MENU_SELECTED", callback(nil, self, self))

	slot6 = toolbar

	toolbar.realize(EWS)

	slot10 = "EXPAND,LEFT"

	panel_sizer.add(EWS, panel_sizer, toolbar, 0, 1)

	slot7 = "Choose an operation to perform on the selected elements. An element might not have the selected operation implemented and will then generate error when executed."

	self._add_help_text(EWS, self)

	return 
end

return 
