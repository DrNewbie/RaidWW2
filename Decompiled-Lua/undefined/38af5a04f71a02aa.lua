if not SoundSwitchElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

SoundSwitchElement = slot0
function SoundSwitchElement:init(unit)
	slot5 = unit

	SoundSwitchElement.super.init(slot3, self)

	self._hed.switch = "daytime_set_day"
	slot5 = "switch"

	table.insert("daytime_set_day", self._save_values)

	return 
end
function SoundSwitchElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot10 = "Select switch to apply"

	self._build_value_combobox(slot4, self, panel, panel_sizer, "Switch", ElementSoundSwitch.SWITCHES)

	return 
end

return 
