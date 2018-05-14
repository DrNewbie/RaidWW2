if not CharacterDamageTriggerUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

CharacterDamageTriggerUnitElement = slot0
function CharacterDamageTriggerUnitElement:init(unit)
	slot5 = unit

	CharacterDamageTriggerUnitElement.super.init(slot3, self)

	self._hed.elements = {}
	self._hed.damage_types = ""
	self._hed.percentage = false
	slot5 = "elements"

	table.insert(false, self._save_values)

	slot5 = "damage_types"

	table.insert(false, self._save_values)

	slot5 = "percentage"

	table.insert(false, self._save_values)

	return 
end
function CharacterDamageTriggerUnitElement:draw_links(t, dt, selected_unit, all_units)
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
function CharacterDamageTriggerUnitElement:get_links_to_unit(...)
	slot3 = self

	CharacterDamageTriggerUnitElement.super.get_links_to_unit(slot2, ...)

	slot5 = "trigger"

	self._get_links_of_type_from_elements(slot2, self, self._hed.elements, ...)

	return 
end
function CharacterDamageTriggerUnitElement:update_editing()
	return 
end
function CharacterDamageTriggerUnitElement:add_element()
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
function CharacterDamageTriggerUnitElement:_correct_unit(u_name)
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
function CharacterDamageTriggerUnitElement:add_triggers(vc)
	slot5 = Idstring(slot6)
	slot10 = "add_element"

	vc.add_trigger(slot3, vc, callback("lmb", self, self))

	return 
end
function CharacterDamageTriggerUnitElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot6 = "HORIZONTAL"
	local dmg_sizer = EWS.BoxSizer(slot4, EWS)
	slot13 = ""
	slot10 = "ALIGN_CENTER_VERTICAL"

	dmg_sizer.add(EWS, dmg_sizer, EWS.StaticText(slot8, EWS, panel, "Damage Types Filter:", 0), 1, 0)

	local dmg_types = EWS.TextCtrl(EWS, EWS, panel, self._hed.damage_types, "")
	slot13 = "set_element_data"

	dmg_types.connect(EWS, dmg_types, "EVT_COMMAND_TEXT_ENTER", callback("TE_PROCESS_ENTER", self, self))

	slot13 = "set_element_data"
	slot10 = {
		value = "damage_types",
		ctrlr = dmg_types
	}

	dmg_types.connect(EWS, dmg_types, "EVT_KILL_FOCUS", callback({
		value = "damage_types",
		ctrlr = dmg_types
	}, self, self))

	slot11 = "ALIGN_CENTER_VERTICAL"

	dmg_sizer.add(EWS, dmg_sizer, dmg_types, 2, 0)
	panel_sizer.add(EWS, panel_sizer, dmg_sizer, 0, 0)

	slot10 = ""
	local percentage = EWS.CheckBox(EWS, EWS, panel, "Percentage")
	slot9 = self._hed.percentage

	percentage.set_value(EWS, percentage)

	slot14 = "set_element_data"
	slot11 = {
		value = "percentage",
		ctrlr = percentage
	}

	percentage.connect(EWS, percentage, "EVT_COMMAND_CHECKBOX_CLICKED", callback("EXPAND", self, self))

	slot12 = "EXPAND"

	panel_sizer.add(EWS, panel_sizer, percentage, 0, 0)

	slot9 = {
		text = "logic_counter_operator elements will use the reported <damage> as the amount to add/subtract/set.\nDamage types can be filtered by specifying specific damage types separated by spaces.",
		panel = panel,
		sizer = panel_sizer
	}

	self.add_help_text(EWS, self)

	return 
end

return 
