-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not CharacterTeamElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

CharacterTeamElement = slot0
CharacterTeamElement.SAVE_UNIT_POSITION = false
CharacterTeamElement.SAVE_UNIT_ROTATION = false
function CharacterTeamElement:init(unit)
	slot5 = unit

	MissionElement.init(slot3, self)

	self._hed.elements = {}
	self._hed.ignore_disabled = nil
	self._hed.team = ""
	self._hed.use_instigator = nil
	slot5 = "elements"

	table.insert(nil, self._save_values)

	slot5 = "ignore_disabled"

	table.insert(nil, self._save_values)

	slot5 = "team"

	table.insert(nil, self._save_values)

	slot5 = "use_instigator"

	table.insert(nil, self._save_values)

	return 
end
function CharacterTeamElement:draw_links(t, dt, selected_unit, all_units)
	slot11 = all_units

	MissionElement.draw_links(slot6, self, t, dt, selected_unit)

	return 
end
function CharacterTeamElement:update_editing()
	return 
end
function CharacterTeamElement:update_selected(t, dt, selected_unit, all_units)
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
function CharacterTeamElement:add_element()
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
function CharacterTeamElement:remove_links(unit)
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
function CharacterTeamElement:add_triggers(vc)
	slot5 = Idstring(slot6)
	slot10 = "add_element"

	vc.add_trigger(slot3, vc, callback("lmb", self, self))

	return 
end
function CharacterTeamElement:_build_panel(panel, panel_sizer)
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
	local use_instigator = EWS.CheckBox(slot5, EWS, panel, "Use instigator")
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
	local ignore_disabled = EWS.CheckBox(EWS, EWS, panel, "Ignore disabled")
	slot9 = "Select if disabled spawn points should be ignored or not"

	ignore_disabled.set_tool_tip(EWS, ignore_disabled)

	slot9 = self._hed.ignore_disabled

	ignore_disabled.set_value(EWS, ignore_disabled)

	slot14 = "set_element_data"
	slot11 = {
		value = "ignore_disabled",
		ctrlr = ignore_disabled
	}

	ignore_disabled.connect(EWS, ignore_disabled, "EVT_COMMAND_CHECKBOX_CLICKED", callback("EXPAND", self, self))

	slot12 = "EXPAND"

	panel_sizer.add(EWS, panel_sizer, ignore_disabled, 0, 0)

	local team_params = {
		default = "",
		name = "Team:",
		ctrlr_proportions = 2,
		name_proportions = 1,
		tooltip = "Select wanted team for the character.",
		sorted = true,
		panel = panel,
		sizer = panel_sizer
	}
	slot9 = tweak_data.levels
	team_params.options = tweak_data.levels.get_team_names_indexed(panel_sizer)
	team_params.value = self._hed.team
	local team_combo_box = CoreEWS.combobox(panel_sizer)
	slot16 = "set_element_data"

	team_combo_box.connect(team_params, team_combo_box, "EVT_COMMAND_COMBOBOX_SELECTED", callback(self, self, self))

	slot16 = "set_element_data"
	slot13 = {
		value = "team",
		ctrlr = team_combo_box
	}

	team_combo_box.connect(team_params, team_combo_box, "EVT_KILL_FOCUS", callback({
		value = "team",
		ctrlr = team_combo_box
	}, self, self))

	return 
end

return 
