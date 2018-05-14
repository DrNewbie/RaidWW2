if not SmokeGrenadeElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

SmokeGrenadeElement = slot0
function SmokeGrenadeElement:init(unit)
	slot5 = unit

	SmokeGrenadeElement.super.init(slot3, self)

	self._hed.duration = 15
	self._hed.immediate = false
	self._hed.ignore_control = false
	self._hed.effect_type = "smoke"
	slot5 = "duration"

	table.insert("smoke", self._save_values)

	slot5 = "immediate"

	table.insert("smoke", self._save_values)

	slot5 = "ignore_control"

	table.insert("smoke", self._save_values)

	slot5 = "effect_type"

	table.insert("smoke", self._save_values)

	return 
end
function SmokeGrenadeElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot10 = "Set the duration of the smoke grenade"
	local _, params = self._build_value_number(slot4, self, panel, panel_sizer, "duration", {
		floats = 0,
		min = 1
	})
	slot8 = "Duration (sec):"

	params.name_ctrlr.set_label(panel, params.name_ctrlr)

	slot12 = "Explode immediately"

	self._build_value_checkbox(panel, self, panel, panel_sizer, "immediate", "Explode immediately")

	slot12 = "Ignore control/assault mode"

	self._build_value_checkbox(panel, self, panel, panel_sizer, "ignore_control", "Ignore control/assault mode")

	slot12 = "Select what type of effect will be spawned."

	self._build_value_combobox(panel, self, panel, panel_sizer, "effect_type", {
		"smoke",
		"flash"
	})

	slot8 = "Spawns a smoke grenade."

	self._add_help_text(panel, self)

	return 
end

return 
