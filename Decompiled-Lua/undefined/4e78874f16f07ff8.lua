if not CoreRopeOperatorUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

CoreRopeOperatorUnitElement = slot0

if not RopeOperatorUnitElement then
	slot2 = CoreRopeOperatorUnitElement
	slot0 = class(slot1)
end

RopeOperatorUnitElement = slot0
RopeOperatorUnitElement.OPERATIONS = {
	"attach",
	"detach"
}
function RopeOperatorUnitElement:init(...)
	slot3 = self

	RopeOperatorUnitElement.super.init(slot2, ...)

	return 
end
function CoreRopeOperatorUnitElement:init(unit)
	slot5 = unit

	CoreRopeOperatorUnitElement.super.init(slot3, self)

	self._hed.operation = RopeOperatorUnitElement.OPERATIONS[1]
	self._hed.rope_unit_id = nil
	slot5 = "operation"

	table.insert(nil, self._save_values)

	slot5 = "rope_unit_id"

	table.insert(nil, self._save_values)

	return 
end
function CoreRopeOperatorUnitElement:draw_links(t, dt, selected_unit, all_units)
	slot10 = selected_unit

	CoreRopeOperatorUnitElement.super.draw_links(slot6, self, t, dt)

	if self._hed.rope_unit_id then
		slot8 = self._hed.rope_unit_id
		local unit = self._get_unit(slot6, self)
		local draw = not selected_unit or unit == selected_unit or self._unit == selected_unit

		if draw then
			slot10 = {
				g = 0,
				b = 1,
				r = 0,
				from_unit = self._unit,
				to_unit = unit
			}

			self._draw_link(slot8, self)
		end
	end

	return 
end
function CoreRopeOperatorUnitElement:get_links_to_unit(...)
	slot3 = self

	CoreRopeOperatorUnitElement.super.get_links_to_unit(slot2, ...)

	slot5 = "operator"

	self._get_links_of_type_from_elements(slot2, self, self._hed.rope_units, ...)

	return 
end
function CoreRopeOperatorUnitElement:update_editing()
	slot4 = {
		ray_type = "body editor",
		sample = true,
		mask = managers.slot.get_mask(slot6, managers.slot)
	}
	slot8 = "all"
	local ray = managers.editor.unit_by_raycast(slot2, managers.editor)

	if ray and ray.unit then
		slot8 = 1

		Application.draw(slot3, Application, ray.unit, 0, 0)
	end

	return 
end
function CoreRopeOperatorUnitElement:update_selected()
	slot8 = self._unit
	slot8 = self._unit.rotation(self._unit)
	slot9 = 0.3

	Application.draw_arrow(slot2, Application, self._unit.position(slot5), self._unit.position(self._unit) + self._unit.rotation(self._unit).y(self._unit) * -100, 1, 1, 1)

	return 
end
function CoreRopeOperatorUnitElement:add_element()
	slot4 = {
		ray_type = "body editor",
		mask = managers.slot.get_mask(slot6, managers.slot)
	}
	slot8 = "all"
	local ray = managers.editor.unit_by_raycast(slot2, managers.editor)

	if ray and ray.unit then
		slot5 = "units/vanilla/props/props_rope/props_rope"

		if ray.unit.name(slot3) == Idstring(ray.unit) then
			slot4 = ray.unit
			local id = ray.unit.unit_data(slot3).unit_id

			if self._hed.rope_unit_id == id then
				self._hed.rope_unit_id = nil
			else
				self._hed.rope_unit_id = id
			end
		end
	end

	return 
end
function CoreRopeOperatorUnitElement:remove_links(unit)
	self._hed.rope_unit_id = nil

	return 
end
function CoreRopeOperatorUnitElement:add_triggers(vc)
	slot5 = Idstring(slot6)
	slot10 = "add_element"

	vc.add_trigger(slot3, vc, callback("lmb", self, self))

	return 
end
function CoreRopeOperatorUnitElement:add_unit_list_btn()
	local function f(unit)
		slot3 = unit
		slot4 = "props_rope"

		return unit.unit_data(slot2).name_id.find(slot2, unit.unit_data(slot2).name_id)
	end

	local dialog = SingleSelectUnitByNameModal.new(slot3, SingleSelectUnitByNameModal, "Add Unit")
	slot7 = dialog

	for _, unit in ipairs(dialog.selected_units(f)) do
		slot11 = unit
		self._hed.rope_unit_id = unit.unit_data(slot10).unit_id
	end

	return 
end
function CoreRopeOperatorUnitElement:remove_unit_list_btn()
	self._hed.rope_unit_id = nil

	return 
end
function CoreRopeOperatorUnitElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot10 = "Select an operation for the selected element."

	self._build_value_combobox(slot4, self, panel, panel_sizer, "operation", RopeOperatorUnitElement.OPERATIONS)

	slot6 = "This element can control rope units. Select rope unit by using insert and clicking on the element."

	self._add_help_text(slot4, self)

	slot8 = "TB_FLAT,TB_NODIVIDER"
	self._btn_toolbar = EWS.ToolBar(slot4, EWS, panel, "")
	slot10 = "world_editor\\unit_by_name_list.png"

	self._btn_toolbar.add_tool(slot4, self._btn_toolbar, "ADD_UNIT_LIST", "Add unit from unit list", CoreEws.image_path(RopeOperatorUnitElement.OPERATIONS))

	slot12 = "add_unit_list_btn"

	self._btn_toolbar.connect(slot4, self._btn_toolbar, "ADD_UNIT_LIST", "EVT_COMMAND_MENU_SELECTED", callback(nil, self, self))

	slot10 = "toolbar\\delete_16x16.png"

	self._btn_toolbar.add_tool(slot4, self._btn_toolbar, "REMOVE_UNIT_LIST", "Remove unit from unit list", CoreEws.image_path(nil))

	slot12 = "remove_unit_list_btn"
	slot9 = nil

	self._btn_toolbar.connect(slot4, self._btn_toolbar, "REMOVE_UNIT_LIST", "EVT_COMMAND_MENU_SELECTED", callback(nil, self, self))

	slot5 = self._btn_toolbar

	self._btn_toolbar.realize(slot4)

	slot9 = "EXPAND,LEFT"

	panel_sizer.add(slot4, panel_sizer, self._btn_toolbar, 0, 1)

	return 
end
function CoreRopeOperatorUnitElement:on_executed_marker_selected()
	return 
end
function CoreRopeOperatorUnitElement:_get_unit(unit_id)
	slot4 = Application

	if Application.editor(slot3) then
		slot5 = unit_id

		return managers.editor.unit_with_id(slot3, managers.editor)
	else
		slot5 = unit_id

		return managers.worlddefinition.get_unit(slot3, managers.worlddefinition)
	end

	return 
end

if not CoreRopeTriggerUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

CoreRopeTriggerUnitElement = slot0

if not RopeTriggerUnitElement then
	slot2 = CoreRopeTriggerUnitElement
	slot0 = class(slot1)
end

RopeTriggerUnitElement = slot0
function RopeTriggerUnitElement:init(...)
	slot3 = self

	RopeTriggerUnitElement.super.init(slot2, ...)

	return 
end
function CoreRopeTriggerUnitElement:init(unit)
	slot5 = unit

	CoreRopeTriggerUnitElement.super.init(slot3, self)

	self._hed.outcome = "marker_reached"
	self._hed.rope_units = {}
	slot5 = "outcome"

	table.insert(, self._save_values)

	slot5 = "elements"

	table.insert(, self._save_values)

	return 
end
function CoreRopeTriggerUnitElement:draw_links(t, dt, selected_unit, all_units)
	slot10 = selected_unit

	CoreRopeTriggerUnitElement.super.draw_links(slot6, self, t, dt)

	slot7 = self._hed.rope_units

	for _, id in ipairs(slot6) do
		local unit = all_units[id]
		local draw = not selected_unit or unit == selected_unit or self._unit == selected_unit

		if draw then
			slot15 = {
				g = 0.85,
				b = 0.25,
				r = 0.85,
				from_unit = unit,
				to_unit = self._unit
			}

			self._draw_link(slot13, self)
		end
	end

	return 
end
function CoreRopeTriggerUnitElement:get_links_to_unit(...)
	slot3 = self

	CoreRopeTriggerUnitElement.super.get_links_to_unit(slot2, ...)

	slot5 = "trigger"

	self._get_links_of_type_from_elements(slot2, self, self._hed.rope_units, ...)

	return 
end
function CoreRopeTriggerUnitElement:update_editing()
	slot4 = {
		ray_type = "body editor",
		sample = true,
		mask = managers.slot.get_mask(slot6, managers.slot)
	}
	slot8 = "all"
	local ray = managers.editor.unit_by_raycast(slot2, managers.editor)

	if ray and ray.unit then
		slot8 = 0

		Application.draw(slot3, Application, ray.unit, 0, 1)
	end

	return 
end
function CoreRopeTriggerUnitElement:add_element()
	slot4 = {
		ray_type = "body editor",
		mask = managers.slot.get_mask(slot6, managers.slot)
	}
	slot8 = "all"
	local ray = managers.editor.unit_by_raycast(slot2, managers.editor)

	if ray and ray.unit then
		slot5 = "units/dev_tools/mission_elements/motion_path_marker/motion_path_marker"

		if ray.unit.name(slot3) == Idstring(ray.unit) then
			local id = ray.unit.unit_data(slot3).unit_id
			slot6 = id

			if table.contains(ray.unit, self._hed.rope_units) then
				slot6 = id

				table.delete(slot4, self._hed.rope_units)
			else
				slot6 = id

				table.insert(slot4, self._hed.rope_units)
			end
		end
	end

	return 
end
function CoreRopeTriggerUnitElement:remove_links(unit)
	slot4 = self._hed.rope_units

	for _, id in ipairs(slot3) do
		slot9 = unit

		if id == unit.unit_data(slot8).unit_id then
			slot10 = id

			table.delete(slot8, self._hed.rope_units)
		end
	end

	return 
end
function CoreRopeTriggerUnitElement:add_triggers(vc)
	slot5 = Idstring(slot6)
	slot10 = "add_element"

	vc.add_trigger(slot3, vc, callback("lmb", self, self))

	return 
end
function CoreRopeTriggerUnitElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot10 = "Select an outcome to trigger on"

	self._build_value_combobox(slot4, self, panel, panel_sizer, "outcome", {
		"marker_reached"
	})

	slot6 = "This element is a trigger on motion path marker element."

	self._add_help_text(slot4, self)

	return 
end

return 
