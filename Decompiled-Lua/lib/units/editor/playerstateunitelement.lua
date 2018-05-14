if not PlayerStateUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

PlayerStateUnitElement = slot0
function PlayerStateUnitElement:init(unit)
	slot5 = unit

	MissionElement.init(slot3, self)

	slot5 = managers.player
	self._hed.state = managers.player.default_player_state(self)
	self._hed.use_instigator = false
	slot5 = "state"

	table.insert(false, self._save_values)

	slot5 = "use_instigator"

	table.insert(false, self._save_values)

	return 
end
function PlayerStateUnitElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot13 = managers.player
	slot12 = {
		"electrocution"
	}
	slot10 = "Select a state from the combobox"

	self._build_value_combobox(slot4, self, panel, panel_sizer, "state", mixin_add(slot10, managers.player.player_states(slot12)))

	slot9 = "On instigator"

	self._build_value_checkbox(slot4, self, panel, panel_sizer, "use_instigator")

	local help = {
		panel = panel,
		sizer = panel_sizer,
		text = "Set the state the players should change to."
	}
	slot7 = help

	self.add_help_text(self, self)

	return 
end

return 
