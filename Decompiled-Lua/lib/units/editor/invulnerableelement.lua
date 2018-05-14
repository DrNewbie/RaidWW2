if not InvulnerableUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

InvulnerableUnitElement = slot0
InvulnerableUnitElement.LINK_ELEMENTS = {
	"elements"
}
function InvulnerableUnitElement:init(unit)
	slot5 = unit

	InvulnerableUnitElement.super.init(slot3, self)

	self._hed.invulnerable = true
	self._hed.immortal = false
	self._hed.elements = {}
	slot5 = "invulnerable"

	table.insert(, self._save_values)

	slot5 = "immortal"

	table.insert(, self._save_values)

	slot5 = "elements"

	table.insert(, self._save_values)

	return 
end
function InvulnerableUnitElement:draw_links(t, dt, selected_unit, all_units)
	slot10 = selected_unit

	MissionElement.draw_links(slot6, self, t, dt)

	slot7 = self._hed.elements

	for _, id in ipairs(slot6) do
		local unit = all_units[id]
		local draw = not selected_unit or unit == selected_unit or self._unit == selected_unit

		if draw then
			slot15 = {
				g = 0.85,
				b = 0,
				r = 0,
				from_unit = unit,
				to_unit = self._unit
			}

			self._draw_link(slot13, self)
		end
	end

	return 
end
function InvulnerableUnitElement:get_links_to_unit(...)
	slot3 = self

	InvulnerableUnitElement.super.get_links_to_unit(slot2, ...)

	slot5 = "trigger"

	self._get_links_of_type_from_elements(slot2, self, self._hed.elements, ...)

	return 
end
function InvulnerableUnitElement:update_editing()
	return 
end
function InvulnerableUnitElement:add_element()
	slot4 = {
		ray_type = "editor",
		mask = 10
	}
	local ray = managers.editor.unit_by_raycast(slot2, managers.editor)

	if ray and ray.unit then
		slot4 = self
		slot7 = ray.unit
		slot7 = ray.unit.name(slot6)

		if self._correct_unit(slot3, ray.unit.name(slot6).s(slot6)) then
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
function InvulnerableUnitElement:_correct_unit(u_name)
	local names = {
		"ai_spawn_enemy",
		"ai_enemy_group",
		"ai_spawn_civilian",
		"ai_civilian_group",
		"point_spawn_player"
	}
	slot5 = names

	for _, name in ipairs(slot4) do
		slot13 = true

		if string.find(slot9, u_name, name, 1) then
			return true
		end
	end

	return false
end
function InvulnerableUnitElement:add_triggers(vc)
	slot5 = Idstring(slot6)
	slot10 = "add_element"

	vc.add_trigger(slot3, vc, callback("lmb", self, self))

	return 
end
function InvulnerableUnitElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot8 = ""
	local invulnerable = EWS.CheckBox(slot4, EWS, panel, "Invulnerable")
	slot7 = self._hed.invulnerable

	invulnerable.set_value(EWS, invulnerable)

	slot12 = "set_element_data"
	slot9 = {
		value = "invulnerable",
		ctrlr = invulnerable
	}

	invulnerable.connect(EWS, invulnerable, "EVT_COMMAND_CHECKBOX_CLICKED", callback(slot9, self, self))
	panel_sizer.add(EWS, panel_sizer, invulnerable, 0, 0)

	slot9 = ""
	local immortal = EWS.CheckBox(EWS, EWS, panel, "Immortal")
	slot8 = self._hed.immortal

	immortal.set_value(EWS, immortal)

	slot13 = "set_element_data"
	slot10 = {
		value = "immortal",
		ctrlr = immortal
	}

	immortal.connect(EWS, immortal, "EVT_COMMAND_CHECKBOX_CLICKED", callback("EXPAND", self, self))

	slot11 = "EXPAND"

	panel_sizer.add(EWS, panel_sizer, immortal, 0, 0)

	local help = {
		text = "Makes a unit invulnerable or immortal.",
		panel = panel,
		sizer = panel_sizer
	}
	slot9 = help

	self.add_help_text(panel_sizer, self)

	return 
end

return 
