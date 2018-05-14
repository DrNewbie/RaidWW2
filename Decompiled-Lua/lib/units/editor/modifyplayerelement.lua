if not ModifyPlayerElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

ModifyPlayerElement = slot0
function ModifyPlayerElement:init(unit)
	slot5 = unit

	ModifyPlayerElement.super.init(slot3, self)

	self._hed.damage_fall_disabled = false
	self._hed.invulnerable = nil
	slot5 = "damage_fall_disabled"

	table.insert(nil, self._save_values)

	slot5 = "invulnerable"

	table.insert(nil, self._save_values)

	return 
end
function ModifyPlayerElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot10 = "Set player damage fall disabled"

	self._build_value_checkbox(slot4, self, panel, panel_sizer, "damage_fall_disabled", "Set player damage fall disabled")

	slot10 = "Invulnerable"

	self._build_value_checkbox(slot4, self, panel, panel_sizer, "invulnerable", "Player cannot be hurt")

	slot6 = "Modifies player properties. The changes are only applied to a player as instigator and cannot be used as a global state"

	self._add_help_text(slot4, self)

	return 
end

return 
