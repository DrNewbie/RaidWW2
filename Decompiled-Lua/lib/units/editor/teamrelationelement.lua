if not TeamRelationElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

TeamRelationElement = slot0
TeamRelationElement.SAVE_UNIT_POSITION = false
TeamRelationElement.SAVE_UNIT_ROTATION = false
function TeamRelationElement:init(unit)
	slot5 = unit

	MissionElement.init(slot3, self)

	self._hed.team1 = ""
	self._hed.team2 = ""
	self._hed.relation = "friend"
	self._hed.mutual = true
	slot5 = "team1"

	table.insert(true, self._save_values)

	slot5 = "team2"

	table.insert(true, self._save_values)

	slot5 = "relation"

	table.insert(true, self._save_values)

	slot5 = "mutual"

	table.insert(true, self._save_values)

	return 
end
function TeamRelationElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot8 = "mutual"

	self._build_value_checkbox(slot4, self, panel, panel_sizer)

	slot11 = {
		""
	}
	slot14 = tweak_data.levels

	self._build_value_combobox(slot4, self, panel, panel_sizer, "team1", table.list_add(slot10, tweak_data.levels.get_team_names_indexed(slot13)))

	slot11 = {
		""
	}
	slot14 = tweak_data.levels
	slot10 = "Select the team that will change attitude."

	self._build_value_combobox(slot4, self, panel, panel_sizer, "team2", table.list_add("Select the team that will change attitude.", tweak_data.levels.get_team_names_indexed(slot13)))

	slot10 = "Select the new relation."

	self._build_value_combobox(slot4, self, panel, panel_sizer, "relation", {
		"friend",
		"foe",
		"neutral"
	})

	return 
end

return 
