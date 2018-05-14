if not SpawnCivilianGroupUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

SpawnCivilianGroupUnitElement = slot0
function SpawnCivilianGroupUnitElement:init(unit)
	slot5 = unit

	SpawnCivilianGroupUnitElement.super.init(slot3, self)

	self._hed.random = false
	self._hed.ignore_disabled = false
	self._hed.amount = 1
	self._hed.elements = {}
	self._hed.team = "default"
	slot5 = "elements"

	table.insert("default", self._save_values)

	slot5 = "random"

	table.insert("default", self._save_values)

	slot5 = "ignore_disabled"

	table.insert("default", self._save_values)

	slot5 = "amount"

	table.insert("default", self._save_values)

	slot5 = "team"

	table.insert("default", self._save_values)

	return 
end
function SpawnCivilianGroupUnitElement:draw_links(t, dt, selected_unit, all_units)
	slot11 = all_units

	SpawnCivilianGroupUnitElement.super.draw_links(slot6, self, t, dt, selected_unit)

	return 
end
function SpawnCivilianGroupUnitElement:update_editing()
	return 
end
function SpawnCivilianGroupUnitElement:update_selected(t, dt, selected_unit, all_units)
	slot7 = self._hed.elements

	for _, id in ipairs(slot6) do
		local unit = all_units[id]
		local draw = not selected_unit or unit == selected_unit or self._unit == selected_unit

		if draw then
			slot15 = {
				g = 0.75,
				b = 0,
				r = 0,
				from_unit = self._unit,
				to_unit = unit
			}

			self._draw_link(slot13, self)
		end
	end

	return 
end
function SpawnCivilianGroupUnitElement:add_element()
	slot4 = {
		ray_type = "editor",
		mask = 10
	}
	local ray = managers.editor.unit_by_raycast(slot2, managers.editor)

	if ray and ray.unit then
		slot6 = ray.unit
		slot6 = ray.unit.name(slot5)
		slot7 = true

		if string.find(slot3, ray.unit.name(slot5).s(slot5), "ai_spawn_civilian", 1) then
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
	end

	return 
end
function SpawnCivilianGroupUnitElement:remove_links(unit)
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
function SpawnCivilianGroupUnitElement:get_links_to_unit(...)
	slot3 = self

	SpawnCivilianGroupUnitElement.super.get_links_to_unit(slot2, ...)

	slot5 = "spawn_point"

	self._get_links_of_type_from_elements(slot2, self, self._hed.elements, ...)

	return 
end
function SpawnCivilianGroupUnitElement:add_triggers(vc)
	slot5 = Idstring(slot6)
	slot10 = "add_element"

	vc.add_trigger(slot3, vc, callback("lmb", self, self))

	return 
end
function SpawnCivilianGroupUnitElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	local names = {
		"ai_spawn_civilian"
	}
	slot10 = names

	self._build_add_remove_unit_from_list(slot5, self, panel, panel_sizer, self._hed.elements)

	slot10 = "Select spawn points randomly"

	self._build_value_checkbox(slot5, self, panel, panel_sizer, "random")

	slot10 = "Select if disabled spawn points should be ignored or not"

	self._build_value_checkbox(slot5, self, panel, panel_sizer, "ignore_disabled")
	self._build_value_number(slot5, self, panel, panel_sizer, "amount", {
		floats = 0,
		min = 0
	})

	slot12 = {
		"default"
	}
	slot15 = tweak_data.levels
	slot11 = "Select the group's team (overrides character team)."

	self._build_value_combobox(slot5, self, panel, panel_sizer, "team", table.list_add("Specify amount of civilians to spawn from group", tweak_data.levels.get_team_names_indexed(slot14)))

	return 
end

return 
