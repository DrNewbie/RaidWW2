if not TeleportPlayerElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

TeleportPlayerElement = slot0
function TeleportPlayerElement:init(unit)
	slot5 = unit

	MissionElement.init(slot3, self)

	slot5 = managers.player
	self._hed.state = managers.player.default_player_state(self)
	slot5 = "state"

	table.insert(managers.player.default_player_state(self), self._save_values)

	return 
end
function TeleportPlayerElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot11 = managers.player
	slot10 = "Select a state from the combobox"

	self._build_value_combobox(slot4, self, panel, panel_sizer, "state", managers.player.player_states(slot10))

	slot6 = "The state the player will change to after teleportation"

	self._add_help_text(slot4, self)

	return 
end
function TeleportPlayerElement:add_to_mission_package()
	return 
end

return 
