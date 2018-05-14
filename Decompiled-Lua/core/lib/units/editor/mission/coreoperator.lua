if not CoreOperatorUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

CoreOperatorUnitElement = slot0
CoreOperatorUnitElement.SAVE_UNIT_POSITION = false
CoreOperatorUnitElement.SAVE_UNIT_ROTATION = false

if not OperatorUnitElement then
	slot2 = CoreOperatorUnitElement
	slot0 = class(slot1)
end

OperatorUnitElement = slot0
function OperatorUnitElement:init(...)
	slot3 = self

	OperatorUnitElement.super.init(slot2, ...)

	return 
end
function CoreOperatorUnitElement:init(unit)
	slot5 = unit

	CoreOperatorUnitElement.super.init(slot3, self)

	self._hed.operation = "none"
	self._hed.elements = {}
	slot5 = "operation"

	table.insert(, self._save_values)

	slot5 = "elements"

	table.insert(, self._save_values)

	return 
end
function CoreOperatorUnitElement:draw_links(t, dt, selected_unit, all_units)
	slot10 = selected_unit

	CoreOperatorUnitElement.super.draw_links(slot6, self, t, dt)

	slot7 = self._hed.elements

	for _, id in ipairs(slot6) do
		local unit = all_units[id]
		slot13 = unit

		if not alive(slot12) then
			slot14 = id

			table.delete(slot12, self._hed.elements)
		else
			local draw = not selected_unit or unit == selected_unit or self._unit == selected_unit

			if draw then
				slot15 = {
					g = 0.75,
					b = 0.25,
					r = 0.75,
					from_unit = self._unit,
					to_unit = unit
				}

				self._draw_link(slot13, self)
			end
		end
	end

	return 
end
function CoreOperatorUnitElement:get_links_to_unit(...)
	slot3 = self

	CoreOperatorUnitElement.super.get_links_to_unit(slot2, ...)

	slot5 = "operator"

	self._get_links_of_type_from_elements(slot2, self, self._hed.elements, ...)

	return 
end
function CoreOperatorUnitElement:update_editing()
	return 
end
function CoreOperatorUnitElement:add_element()
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
function CoreOperatorUnitElement:remove_links(unit)
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
function CoreOperatorUnitElement:add_triggers(vc)
	slot5 = Idstring(slot6)
	slot10 = "add_element"

	vc.add_trigger(slot3, vc, callback("lmb", self, self))

	return 
end
function CoreOperatorUnitElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	local names = nil
	slot10 = names

	self._build_add_remove_unit_from_list(slot5, self, panel, panel_sizer, self._hed.elements)

	slot11 = "Select an operation for the selected elements"

	self._build_value_combobox(slot5, self, panel, panel_sizer, "operation", {
		"none",
		"add",
		"remove"
	})

	slot7 = "Choose an operation to perform on the selected elements. An element might not have the selected operation implemented and will then generate error when executed."

	self._add_help_text(slot5, self)

	return 
end

return 
