if not PlayerStateTriggerUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

PlayerStateTriggerUnitElement = slot0
function PlayerStateTriggerUnitElement:init(unit)
	slot5 = unit

	PlayerStateTriggerUnitElement.super.init(slot3, self)

	self._hed.trigger_times = 1
	slot5 = managers.player
	self._hed.state = managers.player.default_player_state(self)
	slot5 = "state"

	table.insert(managers.player.default_player_state(self), self._save_values)

	return 
end
function PlayerStateTriggerUnitElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot11 = managers.player
	slot10 = "Select a state from the combobox"

	self._build_value_combobox(slot4, self, panel, panel_sizer, "state", managers.player.player_states(slot10))

	slot6 = "Set the player state the element should trigger on."

	self._add_help_text(slot4, self)

	return 
end

return 
