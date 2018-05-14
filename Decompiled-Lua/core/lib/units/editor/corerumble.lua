if not CoreRumbleHubElement then
	slot2 = HubElement
	slot0 = class(slot1)
end

CoreRumbleHubElement = slot0

if not RumbleHubElement then
	slot2 = CoreRumbleHubElement
	slot0 = class(slot1)
end

RumbleHubElement = slot0
function RumbleHubElement:init(...)
	slot3 = self

	CoreRumbleHubElement.init(slot2, ...)

	return 
end
function CoreRumbleHubElement:init(unit)
	slot5 = unit

	HubElement.init(slot3, self)

	self._hed.rumble_engine = "both"
	self._hed.rumble_peak = 1
	self._hed.rumble_attack = 1
	self._hed.rumble_sustain = 2
	self._hed.rumble_release = 1
	slot5 = "rumble_engine"

	table.insert(1, self._save_values)

	slot5 = "rumble_peak"

	table.insert(1, self._save_values)

	slot5 = "rumble_attack"

	table.insert(1, self._save_values)

	slot5 = "rumble_sustain"

	table.insert(1, self._save_values)

	slot5 = "rumble_release"

	table.insert(1, self._save_values)

	return 
end
function CoreRumbleHubElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot6 = "HORIZONTAL"
	local rumble_sizer = EWS.BoxSizer(slot4, EWS)
	slot7 = "VERTICAL"
	local ctrlr_sizer = EWS.BoxSizer(EWS, EWS)
	slot8 = "HORIZONTAL"
	local engines_sizer = EWS.BoxSizer(EWS, EWS)
	slot15 = ""
	slot12 = "ALIGN_CENTER_VERTICAL,EXPAND"

	engines_sizer.add(EWS, engines_sizer, EWS.StaticText(slot10, EWS, panel, "Engine", 0), 1, 0)

	slot12 = "CB_DROPDOWN,CB_READONLY"
	local engines = EWS.ComboBox(EWS, EWS, panel, "", "")
	slot9 = {
		"both",
		"left",
		"right"
	}

	for _, engine in ipairs(EWS) do
		slot15 = engine

		engines.append(slot13, engines)
	end

	slot10 = self._hed.rumble_engine

	engines.set_value(slot8, engines)

	slot13 = "EXPAND"

	engines_sizer.add(slot8, engines_sizer, engines, 2, 0)

	slot15 = "set_element_data"
	slot12 = {
		value = "rumble_engine",
		ctrlr = engines
	}

	engines.connect(slot8, engines, "EVT_COMMAND_COMBOBOX_SELECTED", callback(0, self, self))

	slot13 = "EXPAND"

	ctrlr_sizer.add(slot8, ctrlr_sizer, engines_sizer, 0, 0)

	slot10 = "HORIZONTAL"
	local peak_sizer = EWS.BoxSizer(slot8, EWS)
	slot17 = ""
	slot14 = "ALIGN_CENTER_VERTICAL,EXPAND"

	peak_sizer.add(EWS, peak_sizer, EWS.StaticText(0, EWS, panel, "Peak", 0), 1, 0)

	slot17 = ""
	slot14 = "ALIGN_CENTER_VERTICAL"

	peak_sizer.add(EWS, peak_sizer, EWS.StaticText(1, EWS, panel, "[0-1]", 0), 0, 0)

	slot14 = "TE_CENTRE"
	local peak = EWS.TextCtrl(EWS, EWS, panel, "1.0", "pulla")
	slot12 = self._hed.rumble_peak

	peak.set_value(EWS, peak)

	slot15 = "EXPAND"

	peak_sizer.add(EWS, peak_sizer, peak, 2, 0)

	slot17 = "verify_number"

	peak.connect(EWS, peak, "EVT_CHAR", callback(0, nil, _G))

	slot17 = "set_element_data"
	slot14 = {
		value = "rumble_peak",
		ctrlr = peak
	}

	peak.connect(EWS, peak, "EVT_COMMAND_TEXT_UPDATED", callback(peak, self, self))

	slot15 = "EXPAND"

	ctrlr_sizer.add(EWS, ctrlr_sizer, peak_sizer, 0, 0)

	slot12 = "HORIZONTAL"
	local attack_sizer = EWS.BoxSizer(EWS, EWS)
	slot19 = ""
	slot16 = "ALIGN_CENTER_VERTICAL,EXPAND"

	attack_sizer.add(EWS, attack_sizer, EWS.StaticText(0, EWS, panel, "Attack", 0), 1, 0)

	slot19 = ""
	slot16 = "ALIGN_CENTER_VERTICAL"

	attack_sizer.add(EWS, attack_sizer, EWS.StaticText(1, EWS, panel, "[sec]", 0), 0, 0)

	slot16 = "TE_CENTRE"
	local attack = EWS.TextCtrl(EWS, EWS, panel, "1.0", "")
	slot14 = self._hed.rumble_attack

	attack.set_value(EWS, attack)

	slot17 = "EXPAND"

	attack_sizer.add(EWS, attack_sizer, attack, 2, 0)

	slot19 = "verify_number"

	attack.connect(EWS, attack, "EVT_CHAR", callback(0, nil, _G))

	slot19 = "set_element_data"
	slot16 = {
		value = "rumble_attack",
		ctrlr = attack
	}

	attack.connect(EWS, attack, "EVT_COMMAND_TEXT_UPDATED", callback(attack, self, self))

	slot17 = "EXPAND"

	ctrlr_sizer.add(EWS, ctrlr_sizer, attack_sizer, 0, 0)

	slot14 = "HORIZONTAL"
	local sustain_sizer = EWS.BoxSizer(EWS, EWS)
	slot21 = ""
	slot18 = "ALIGN_CENTER_VERTICAL,EXPAND"

	sustain_sizer.add(EWS, sustain_sizer, EWS.StaticText(0, EWS, panel, "Sustain", 0), 1, 0)

	slot21 = ""
	slot18 = "ALIGN_CENTER_VERTICAL"

	sustain_sizer.add(EWS, sustain_sizer, EWS.StaticText(1, EWS, panel, "[sec]", 0), 0, 0)

	slot18 = "TE_CENTRE"
	local sustain = EWS.TextCtrl(EWS, EWS, panel, "1.0", "")
	slot16 = self._hed.rumble_sustain

	sustain.set_value(EWS, sustain)

	slot19 = "EXPAND"

	sustain_sizer.add(EWS, sustain_sizer, sustain, 2, 0)

	slot21 = "verify_number"

	sustain.connect(EWS, sustain, "EVT_CHAR", callback(0, nil, _G))

	slot21 = "set_element_data"
	slot18 = {
		value = "rumble_sustain",
		ctrlr = sustain
	}

	sustain.connect(EWS, sustain, "EVT_COMMAND_TEXT_UPDATED", callback(sustain, self, self))

	slot19 = "EXPAND"

	ctrlr_sizer.add(EWS, ctrlr_sizer, sustain_sizer, 0, 0)

	slot16 = "HORIZONTAL"
	local release_sizer = EWS.BoxSizer(EWS, EWS)
	slot23 = ""
	slot20 = "ALIGN_CENTER_VERTICAL,EXPAND"

	release_sizer.add(EWS, release_sizer, EWS.StaticText(0, EWS, panel, "Release", 0), 1, 0)

	slot23 = ""
	slot20 = "ALIGN_CENTER_VERTICAL"

	release_sizer.add(EWS, release_sizer, EWS.StaticText(1, EWS, panel, "[sec]", 0), 0, 0)

	slot20 = "TE_CENTRE"
	local release = EWS.TextCtrl(EWS, EWS, panel, "1.0", "")
	slot18 = self._hed.rumble_release

	release.set_value(EWS, release)

	slot21 = "EXPAND"

	release_sizer.add(EWS, release_sizer, release, 2, 0)

	slot23 = "verify_number"

	release.connect(EWS, release, "EVT_CHAR", callback(0, nil, _G))

	slot23 = "set_element_data"
	slot20 = {
		value = "rumble_release",
		ctrlr = release
	}

	release.connect(EWS, release, "EVT_COMMAND_TEXT_UPDATED", callback(release, self, self))

	slot21 = "EXPAND"

	ctrlr_sizer.add(EWS, ctrlr_sizer, release_sizer, 0, 0)

	slot21 = "EXPAND"

	rumble_sizer.add(EWS, rumble_sizer, ctrlr_sizer, 2, 0)

	slot21 = "EXPAND"

	panel_sizer.add(EWS, panel_sizer, rumble_sizer, 0, 0)

	return 
end

return 
