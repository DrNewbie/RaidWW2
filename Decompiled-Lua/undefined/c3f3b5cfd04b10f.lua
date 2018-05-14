if not EnvironmentEffectElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

EnvironmentEffectElement = slot0
EnvironmentEffectElement.ACTIONS = {
	"set",
	"remove"
}
function EnvironmentEffectElement:init(unit)
	slot5 = unit

	EnvironmentEffectElement.super.init(slot3, self)

	self._hed.action = "set"
	self._hed.effect = ""
	self._hed.local_only = false
	self._hed.elements = {}
	slot5 = "effect"

	table.insert(, self._save_values)

	slot5 = "action"

	table.insert(, self._save_values)

	slot5 = "local_only"

	table.insert(, self._save_values)

	self._actions = EnvironmentEffectElement.ACTIONS

	return 
end
function EnvironmentEffectElement:clear(...)
	return 
end
function EnvironmentEffectElement:add_to_mission_package()
	return 
end
function EnvironmentEffectElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer

	self._build_value_combobox(slot4, self, panel, panel_sizer, "action", self._actions)

	slot11 = managers.environment_effects
	slot10 = "Select an effect to use"

	self._build_value_combobox(slot4, self, panel, panel_sizer, "effect", managers.environment_effects.effects_names("Select an action for the selected elements"))

	slot9 = "Local Only"

	self._build_value_checkbox(slot4, self, panel, panel_sizer, "local_only")

	return 
end

return 
