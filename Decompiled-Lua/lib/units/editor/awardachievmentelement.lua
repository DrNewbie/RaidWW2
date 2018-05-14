if not AwardAchievmentElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

AwardAchievmentElement = slot0
function AwardAchievmentElement:init(unit)
	slot5 = unit

	AwardAchievmentElement.super.init(slot3, self)

	self._hed.achievment = nil
	self._hed.award_instigator = false
	self._hed.players_from_start = nil
	slot5 = "achievment"

	table.insert(nil, self._save_values)

	slot5 = "award_instigator"

	table.insert(nil, self._save_values)

	slot5 = "players_from_start"

	table.insert(nil, self._save_values)

	return 
end
function AwardAchievmentElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot8 = "achievment"
	slot11 = {
		"none"
	}
	slot14 = managers.achievment.achievments

	self._build_value_combobox(slot4, self, panel, panel_sizer, table.list_add(slot10, table.map_keys(slot13)))

	slot9 = "Award only the instigator (Player or driver in vehicle)?"

	self._build_value_checkbox(slot4, self, panel, panel_sizer, "award_instigator")

	slot9 = "Only award to players that joined from start."

	self._build_value_checkbox(slot4, self, panel, panel_sizer, "players_from_start")

	local help = {
		text = "Awards a PSN Trophy or Steam Achievment",
		panel = panel,
		sizer = panel_sizer
	}
	slot7 = help

	self.add_help_text(self, self)

	return 
end

return 
