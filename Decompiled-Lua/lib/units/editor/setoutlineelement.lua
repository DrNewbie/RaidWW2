-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not SetOutlineElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

SetOutlineElement = slot0
function SetOutlineElement:init(unit)
	slot5 = unit

	SetOutlineElement.super.init(slot3, self)

	self._hed.elements = {}
	self._hed.set_outline = true
	slot5 = "elements"

	table.insert(true, self._save_values)

	slot5 = "set_outline"

	table.insert(true, self._save_values)

	return 
end
function SetOutlineElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	local names = {
		"ai_spawn_enemy",
		"ai_spawn_civilian"
	}

	self._build_add_remove_unit_from_list(slot5, self, panel, panel_sizer, self._hed.elements)

	slot9 = ""
	local set_outline = EWS.CheckBox(slot5, EWS, panel, "Enable outline")
	slot8 = self._hed.set_outline

	set_outline.set_value(EWS, set_outline)

	slot13 = "set_element_data"
	slot10 = {
		value = "set_outline",
		ctrlr = set_outline
	}

	set_outline.connect(EWS, set_outline, "EVT_COMMAND_CHECKBOX_CLICKED", callback(names, self, self))

	slot11 = "EXPAND"

	panel_sizer.add(EWS, panel_sizer, set_outline, 0, 0)

	return 
end
function SetOutlineElement:draw_links(t, dt, selected_unit, all_units)
	slot11 = all_units

	MissionElement.draw_links(slot6, self, t, dt, selected_unit)

	return 
end
function SetOutlineElement:update_editing()
	return 
end
function SetOutlineElement:update_selected(t, dt, selected_unit, all_units)
	slot7 = self._hed.elements

	for _, id in ipairs(slot6) do
		local unit = all_units[id]
		local draw = not selected_unit or unit == selected_unit or self._unit == selected_unit

		if draw then
			slot15 = {
				g = 0.5,
				b = 1,
				r = 0.9,
				from_unit = self._unit,
				to_unit = unit
			}

			self._draw_link(slot13, self)
		end
	end

	return 
end
function SetOutlineElement:add_element()
	slot4 = {
		ray_type = "editor",
		mask = 10
	}
	local ray = managers.editor.unit_by_raycast(slot2, managers.editor)

	if ray and ray.unit then
		slot6 = ray.unit
		slot6 = ray.unit.name(slot5)
		slot7 = true
	end

	return 
end
function SetOutlineElement:remove_links(unit)
	slot4 = self._hed.elements

	for _, id in ipairs(slot3) do
		slot9 = unit

		if id == unit.unit_data(slot8).unit_id then
			slot10 = id

			table.delete(slot8, self._hed.elements)
		end
	end

	return 
end
function SetOutlineElement:add_triggers(vc)
	slot5 = Idstring(slot6)
	slot10 = "add_element"

	vc.add_trigger(slot3, vc, callback("lmb", self, self))

	return 
end

return 
