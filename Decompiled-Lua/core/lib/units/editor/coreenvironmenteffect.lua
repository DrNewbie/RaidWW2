if not CoreEnvironmentEffectHubElement then
	slot2 = HubElement
	slot0 = class(slot1)
end

CoreEnvironmentEffectHubElement = slot0

if not EnvironmentEffectHubElement then
	slot2 = CoreEnvironmentEffectHubElement
	slot0 = class(slot1)
end

EnvironmentEffectHubElement = slot0
function EnvironmentEffectHubElement:init(...)
	slot3 = self

	CoreEnvironmentEffectHubElement.init(slot2, ...)

	return 
end
function CoreEnvironmentEffectHubElement:init(unit)
	slot5 = unit

	HubElement.init(slot3, self)

	self._hed.environment_effect = "none"
	slot5 = "environment_effect"

	table.insert("none", self._save_values)

	slot5 = "use"

	table.insert("none", self._hed.action_types)

	slot5 = "stop"

	table.insert("none", self._hed.action_types)

	return 
end
function CoreEnvironmentEffectHubElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot6 = "HORIZONTAL"
	local effect_sizer = EWS.BoxSizer(slot4, EWS)
	slot13 = ""
	slot10 = "ALIGN_CENTER_VERTICAL"

	effect_sizer.add(EWS, effect_sizer, EWS.StaticText(slot8, EWS, self._panel, "Effect:", 0), 1, 0)

	slot10 = "CB_DROPDOWN,CB_READONLY"
	local effects = EWS.ComboBox(EWS, EWS, self._panel, "", "")

	effects.append(EWS, effects)

	slot9 = managers.environment_effects

	for _, name in ipairs(managers.environment_effects.effects_names("none")) do
		slot13 = name

		effects.append(slot11, effects)
	end

	slot8 = self._hed.environment_effect

	effects.set_value(slot6, effects)

	slot13 = "set_element_data"
	slot10 = {
		value = "environment_effect",
		ctrlr = effects
	}

	effects.connect(slot6, effects, "EVT_COMMAND_COMBOBOX_SELECTED", callback(slot10, self, self))

	slot11 = "EXPAND"

	effect_sizer.add(slot6, effect_sizer, effects, 3, 0)

	slot11 = "EXPAND"

	self._panel_sizer.add(slot6, self._panel_sizer, effect_sizer, 0, 0)

	return 
end

return 
