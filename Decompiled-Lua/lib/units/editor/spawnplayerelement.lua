if not SpawnPlayerElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

SpawnPlayerElement = slot0
function SpawnPlayerElement:init(unit)
	slot5 = unit

	MissionElement.init(slot3, self)

	slot5 = managers.player
	self._hed.state = managers.player.default_player_state(self)
	self._hed.use_for_teleport = true
	slot5 = "state"

	table.insert(true, self._save_values)

	slot5 = "use_for_teleport"

	table.insert(true, self._save_values)

	return 
end
function SpawnPlayerElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot11 = managers.player
	slot10 = "Select a state from the combobox"

	self._build_value_combobox(slot4, self, panel, panel_sizer, "state", managers.player.player_states(slot10))

	slot9 = "Use for teleport"

	self._build_value_checkbox(slot4, self, panel, panel_sizer, "use_for_teleport")

	slot6 = "The state defines how the player will be spawned/teleported"

	self._add_help_text(slot4, self)

	return 
end
function SpawnPlayerElement:add_to_mission_package()
	return 
end

return 
