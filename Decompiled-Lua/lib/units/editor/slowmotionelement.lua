if not SlowMotionElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

SlowMotionElement = slot0
SlowMotionElement.SAVE_UNIT_POSITION = false
SlowMotionElement.SAVE_UNIT_ROTATION = false
function SlowMotionElement:init(unit)
	slot5 = unit

	SlowMotionElement.super.init(slot3, self)

	self._hed.eff_name = ""
	slot5 = "eff_name"

	table.insert("", self._save_values)

	return 
end
function SlowMotionElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot11 = tweak_data.timespeed.mission_effects
	slot10 = "Choose effect. Descriptions in lib/TimeSpeedEffectTweakData.lua"

	self._build_value_combobox(slot4, self, panel, panel_sizer, "eff_name", table.map_keys(slot10))

	local help = {
		panel = panel,
		sizer = panel_sizer,
		text = "Choose effect. Descriptions in lib/TimeSpeedEffectTweakData.lua."
	}
	slot7 = help

	self.add_help_text(self, self)

	return 
end

return 
