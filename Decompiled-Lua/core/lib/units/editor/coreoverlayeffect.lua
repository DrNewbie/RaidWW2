if not CoreOverlayEffectHubElement then
	slot2 = HubElement
	slot0 = class(slot1)
end

CoreOverlayEffectHubElement = slot0

if not OverlayEffectHubElement then
	slot2 = CoreOverlayEffectHubElement
	slot0 = class(slot1)
end

OverlayEffectHubElement = slot0
function OverlayEffectHubElement:init(...)
	slot3 = self

	CoreOverlayEffectHubElement.init(slot2, ...)

	return 
end
function CoreOverlayEffectHubElement:init(unit)
	slot5 = unit

	HubElement.init(slot3, self)

	self._hed.overlay_effect = "none"
	slot5 = "overlay_effect"

	table.insert("none", self._save_values)

	slot5 = "overlay_effect_sustain"

	table.insert("none", self._save_values)

	slot5 = "overlay_effect_fade_in"

	table.insert("none", self._save_values)

	slot5 = "overlay_effect_fade_out"

	table.insert("none", self._save_values)

	return 
end
function CoreOverlayEffectHubElement:test_element()
	if self._hed.overlay_effect ~= "none" then
		slot5 = managers.overlay_effect
		local effect = clone(slot2)
		effect.sustain = self._hed.overlay_effect_sustain or effect.sustain
		effect.fade_in = self._hed.overlay_effect_fade_in or effect.fade_in
		effect.fade_out = self._hed.overlay_effect_fade_out or effect.fade_out
		slot5 = effect

		managers.overlay_effect.play_effect(managers.overlay_effect.presets(slot4)[self._hed.overlay_effect], managers.overlay_effect)
	end

	return 
end
function CoreOverlayEffectHubElement:stop_test_element()
	slot3 = managers.overlay_effect

	managers.overlay_effect.stop_effect(slot2)

	return 
end
function CoreOverlayEffectHubElement:changed_effect()
	if self._hed.overlay_effect == "none" then
		slot4 = "-"

		self._fade_in_default.set_value(slot2, self._fade_in_default)

		slot4 = "-"

		self._sustain_default.set_value(slot2, self._sustain_default)

		slot4 = "-"

		self._fade_out_default.set_value(slot2, self._fade_out_default)
	else
		local effect = managers.overlay_effect.presets(slot2)[self._hed.overlay_effect]
		slot4 = self._fade_in_default
		slot8 = effect.fade_in

		self._fade_in_default.set_value(managers.overlay_effect, string.format(slot6, "%.2f"))

		slot4 = self._sustain_default
		slot8 = effect.sustain

		self._sustain_default.set_value(managers.overlay_effect, string.format(slot6, "%.2f"))

		slot4 = self._fade_out_default
		slot8 = effect.fade_out

		self._fade_out_default.set_value(managers.overlay_effect, string.format(slot6, "%.2f"))
	end

	return 
end
function CoreOverlayEffectHubElement:set_option_time(data)
	local c = data.ctrlr
	local value = c.get_value(slot4)
	slot6 = c

	if c.get_value(c) == "" then
		value = nil
	else
		slot6 = value
		value = tonumber(slot5)
	end

	self._hed[data.value] = value

	return 
end
function CoreOverlayEffectHubElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot6 = "HORIZONTAL"
	local effects_sizer = EWS.BoxSizer(slot4, EWS)
	slot13 = ""
	slot10 = "ALIGN_CENTER_VERTICAL"

	effects_sizer.add(EWS, effects_sizer, EWS.StaticText(slot8, EWS, panel, "Effect:", 0), 1, 0)

	slot10 = "CB_DROPDOWN,CB_READONLY"
	local effects = EWS.ComboBox(EWS, EWS, panel, "", "")
	slot8 = "none"

	effects.append(EWS, effects)

	local t = {}
	slot10 = managers.overlay_effect

	for name, _ in pairs(managers.overlay_effect.presets("")) do
		slot14 = name

		table.insert(slot12, t)
	end

	slot8 = t

	table.sort(slot7)

	slot8 = t

	for _, name in ipairs(slot7) do
		slot14 = name

		effects.append(slot12, effects)
	end

	slot9 = self._hed.overlay_effect

	effects.set_value(slot7, effects)

	slot12 = "EXPAND"

	effects_sizer.add(slot7, effects_sizer, effects, 2, 0)

	slot14 = "set_element_data"

	effects.connect(slot7, effects, "EVT_COMMAND_COMBOBOX_SELECTED", callback(0, self, self))

	slot14 = "changed_effect"
	slot11 = nil

	effects.connect(slot7, effects, "EVT_COMMAND_COMBOBOX_SELECTED", callback({
		value = "overlay_effect",
		ctrlr = effects
	}, self, self))

	slot12 = "EXPAND"

	panel_sizer.add(slot7, panel_sizer, effects_sizer, 0, 0)

	slot9 = "HORIZONTAL"
	local fade_in_sizer = EWS.BoxSizer(slot7, EWS)
	slot16 = ""
	slot13 = "ALIGN_CENTER_VERTICAL"

	fade_in_sizer.add(EWS, fade_in_sizer, EWS.StaticText(0, EWS, panel, "Fade in:", 0), 2, 0)

	local fade_in = EWS.TextCtrl(EWS, EWS, self._panel, self._hed.overlay_effect_fade_in, "")
	slot16 = "verify_number"

	fade_in.connect(EWS, fade_in, "EVT_CHAR", callback("TE_PROCESS_ENTER", nil, _G))

	slot16 = "set_option_time"

	fade_in.connect(EWS, fade_in, "EVT_COMMAND_TEXT_ENTER", callback(fade_in, self, self))

	slot16 = "set_option_time"
	slot13 = {
		value = "overlay_effect_fade_in",
		ctrlr = fade_in
	}

	fade_in.connect(EWS, fade_in, "EVT_KILL_FOCUS", callback({
		value = "overlay_effect_fade_in",
		ctrlr = fade_in
	}, self, self))

	slot14 = "EXPAND"

	fade_in_sizer.add(EWS, fade_in_sizer, fade_in, 3, 0)

	slot14 = "ALIGN_CENTER"
	self._fade_in_default = EWS.StaticText(EWS, EWS, panel, "-", 0)
	slot11 = "Default value for selected effect"

	self._fade_in_default.set_tool_tip(EWS, self._fade_in_default)

	slot14 = "ALIGN_CENTER_VERTICAL,LEFT"

	fade_in_sizer.add(EWS, fade_in_sizer, self._fade_in_default, 1, 5)

	slot14 = "EXPAND"

	panel_sizer.add(EWS, panel_sizer, fade_in_sizer, 0, 0)

	slot11 = "HORIZONTAL"
	local sustain_sizer = EWS.BoxSizer(EWS, EWS)
	slot18 = ""
	slot15 = "ALIGN_CENTER_VERTICAL"

	sustain_sizer.add(EWS, sustain_sizer, EWS.StaticText(0, EWS, panel, "Sustain:", 0), 2, 0)

	local sustain = EWS.TextCtrl(EWS, EWS, self._panel, self._hed.overlay_effect_sustain, "")
	slot18 = "verify_number"

	sustain.connect(EWS, sustain, "EVT_CHAR", callback("TE_PROCESS_ENTER", nil, _G))

	slot18 = "set_option_time"

	sustain.connect(EWS, sustain, "EVT_COMMAND_TEXT_ENTER", callback(sustain, self, self))

	slot18 = "set_option_time"
	slot15 = {
		value = "overlay_effect_sustain",
		ctrlr = sustain
	}

	sustain.connect(EWS, sustain, "EVT_KILL_FOCUS", callback({
		value = "overlay_effect_sustain",
		ctrlr = sustain
	}, self, self))

	slot16 = "EXPAND"

	sustain_sizer.add(EWS, sustain_sizer, sustain, 3, 0)

	slot16 = "ALIGN_CENTER"
	self._sustain_default = EWS.StaticText(EWS, EWS, panel, "-", 0)
	slot13 = "Default value for selected effect"

	self._sustain_default.set_tool_tip(EWS, self._sustain_default)

	slot16 = "ALIGN_CENTER_VERTICAL,LEFT"

	sustain_sizer.add(EWS, sustain_sizer, self._sustain_default, 1, 5)

	slot16 = "EXPAND"

	panel_sizer.add(EWS, panel_sizer, sustain_sizer, 0, 0)

	slot13 = "HORIZONTAL"
	local fade_out_sizer = EWS.BoxSizer(EWS, EWS)
	slot20 = ""
	slot17 = "ALIGN_CENTER_VERTICAL"

	fade_out_sizer.add(EWS, fade_out_sizer, EWS.StaticText(0, EWS, panel, "Fade out:", 0), 2, 0)

	local fade_out = EWS.TextCtrl(EWS, EWS, self._panel, self._hed.overlay_effect_fade_out, "")
	slot20 = "verify_number"

	fade_out.connect(EWS, fade_out, "EVT_CHAR", callback("TE_PROCESS_ENTER", nil, _G))

	slot20 = "set_option_time"

	fade_out.connect(EWS, fade_out, "EVT_COMMAND_TEXT_ENTER", callback(fade_out, self, self))

	slot20 = "set_option_time"
	slot17 = {
		value = "overlay_effect_fade_out",
		ctrlr = fade_out
	}

	fade_out.connect(EWS, fade_out, "EVT_KILL_FOCUS", callback({
		value = "overlay_effect_fade_out",
		ctrlr = fade_out
	}, self, self))

	slot18 = "EXPAND"

	fade_out_sizer.add(EWS, fade_out_sizer, fade_out, 3, 0)

	slot18 = "ALIGN_CENTER"
	self._fade_out_default = EWS.StaticText(EWS, EWS, panel, "-", 0)
	slot15 = "Default value for selected effect"

	self._fade_out_default.set_tool_tip(EWS, self._fade_out_default)

	slot18 = "ALIGN_CENTER_VERTICAL,LEFT"

	fade_out_sizer.add(EWS, fade_out_sizer, self._fade_out_default, 1, 5)

	slot18 = "EXPAND"

	panel_sizer.add(EWS, panel_sizer, fade_out_sizer, 0, 0)

	slot14 = self

	self.changed_effect(EWS)

	return 
end

return 
