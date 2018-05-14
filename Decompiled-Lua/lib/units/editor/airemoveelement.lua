-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not AIRemoveUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

AIRemoveUnitElement = slot0
function AIRemoveUnitElement:init(unit)
	slot5 = unit

	MissionElement.init(slot3, self)

	self._hed.elements = {}
	self._hed.use_instigator = false
	self._hed.true_death = false
	self._hed.force_ragdoll = false
	self._hed.drop_loot = true
	slot5 = "elements"

	table.insert(true, self._save_values)

	slot5 = "use_instigator"

	table.insert(true, self._save_values)

	slot5 = "true_death"

	table.insert(true, self._save_values)

	slot5 = "force_ragdoll"

	table.insert(true, self._save_values)

	slot5 = "drop_loot"

	table.insert(true, self._save_values)

	return 
end
function AIRemoveUnitElement:draw_links(t, dt, selected_unit, all_units)
	slot11 = all_units

	MissionElement.draw_links(slot6, self, t, dt, selected_unit)

	return 
end
function AIRemoveUnitElement:update_editing()
	return 
end
function AIRemoveUnitElement:update_selected(t, dt, selected_unit, all_units)
	slot7 = self._hed.elements

	for _, id in ipairs(slot6) do
		local unit = all_units[id]
		local draw = not selected_unit or unit == selected_unit or self._unit == selected_unit

		if draw then
			slot15 = {
				g = 0,
				b = 0,
				r = 0.75,
				from_unit = self._unit,
				to_unit = unit
			}

			self._draw_link(slot13, self)
		end
	end

	return 
end
function AIRemoveUnitElement:add_element()
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
function AIRemoveUnitElement:remove_links(unit)
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
function AIRemoveUnitElement:add_triggers(vc)
	slot5 = Idstring(slot6)
	slot10 = "add_element"

	vc.add_trigger(slot3, vc, callback("lmb", self, self))

	return 
end
function AIRemoveUnitElement:_build_panel(panel, panel_sizer)
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
	local use_instigator = EWS.CheckBox(slot5, EWS, panel, "Remove instigator")
	slot8 = self._hed.use_instigator

	use_instigator.set_value(EWS, use_instigator)

	slot13 = "set_element_data"
	slot10 = {
		value = "use_instigator",
		ctrlr = use_instigator
	}

	use_instigator.connect(EWS, use_instigator, "EVT_COMMAND_CHECKBOX_CLICKED", callback(names, self, self))
	panel_sizer.add(EWS, panel_sizer, use_instigator, 0, 0)

	slot10 = ""
	local true_death = EWS.CheckBox(EWS, EWS, panel, "True death")
	slot9 = self._hed.true_death

	true_death.set_value(EWS, true_death)

	slot14 = "set_element_data"
	slot11 = {
		value = "true_death",
		ctrlr = true_death
	}

	true_death.connect(EWS, true_death, "EVT_COMMAND_CHECKBOX_CLICKED", callback("EXPAND", self, self))
	panel_sizer.add(EWS, panel_sizer, true_death, 0, 0)

	slot11 = ""
	local force_ragdoll = EWS.CheckBox(EWS, EWS, panel, "Force Ragdoll")
	slot10 = self._hed.force_ragdoll

	force_ragdoll.set_value(EWS, force_ragdoll)

	slot15 = "set_element_data"
	slot12 = {
		value = "force_ragdoll",
		ctrlr = force_ragdoll
	}

	force_ragdoll.connect(EWS, force_ragdoll, "EVT_COMMAND_CHECKBOX_CLICKED", callback("EXPAND", self, self))
	panel_sizer.add(EWS, panel_sizer, force_ragdoll, 0, 0)

	slot12 = ""
	local drop_loot = EWS.CheckBox(EWS, EWS, panel, "Drop Loot")
	slot11 = self._hed.drop_loot

	drop_loot.set_value(EWS, drop_loot)

	slot16 = "set_element_data"
	slot13 = {
		value = "drop_loot",
		ctrlr = drop_loot
	}

	drop_loot.connect(EWS, drop_loot, "EVT_COMMAND_CHECKBOX_CLICKED", callback("EXPAND", self, self))

	slot14 = "EXPAND"

	panel_sizer.add(EWS, panel_sizer, drop_loot, 0, 0)

	return 
end

return 
