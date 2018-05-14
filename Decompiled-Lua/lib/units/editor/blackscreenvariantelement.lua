if not BlackscreenVariantElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

BlackscreenVariantElement = slot0
function BlackscreenVariantElement:init(unit)
	slot5 = unit

	BlackscreenVariantElement.super.init(slot3, self)

	self._hed.variant = "0"
	slot5 = "variant"

	table.insert("0", self._save_values)

	return 
end
function BlackscreenVariantElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot7 = panel_sizer
	local bscreen_params = self._get_params(slot4, self, panel)
	local bscreen = CoreEWS.combobox(self)
	slot13 = "set_element_data"
	slot10 = {
		value = "variant",
		ctrlr = bscreen
	}

	bscreen.connect(bscreen_params, bscreen, "EVT_COMMAND_COMBOBOX_SELECTED", callback(slot10, self, self))

	local help = {
		text = "Set blackscreen variant.",
		panel = panel,
		sizer = panel_sizer
	}
	slot9 = help

	self.add_help_text(bscreen, self)

	return 
end
function BlackscreenVariantElement:_get_params(panel, panel_sizer)
	local bscreen_params = {
		default = "0",
		name = "Blackscreen variant:",
		ctrlr_proportions = 2,
		name_proportions = 1,
		tooltip = "Select variant, from level_tweak_data.level.intro_event",
		sorted = false,
		panel = panel,
		sizer = panel_sizer,
		options = {
			"1",
			"2",
			"3",
			"4",
			"5",
			"6",
			"7",
			"8",
			"9",
			"10",
			"11",
			"12",
			"13",
			"14",
			"15",
			"16",
			"17",
			"18",
			"19",
			"20",
			"21",
			"22",
			"23",
			"24",
			"25",
			"26",
			"27",
			"28",
			"29",
			"30"
		},
		value = self._hed.variant
	}

	return bscreen_params
end

if not EndscreenVariantElement then
	slot2 = BlackscreenVariantElement
	slot0 = class(slot1)
end

EndscreenVariantElement = slot0
function EndscreenVariantElement:init(unit)
	slot5 = unit

	EndscreenVariantElement.super.init(slot3, self)

	return 
end
function EndscreenVariantElement:_get_params(panel, panel_sizer)
	local bscreen_params = {
		default = "0",
		name = "Endscreen variant:",
		ctrlr_proportions = 2,
		name_proportions = 1,
		tooltip = "Select variant, from level_tweak_data.level.outro_event",
		sorted = false,
		panel = panel,
		sizer = panel_sizer,
		options = {
			"1",
			"2",
			"3",
			"4",
			"5",
			"6",
			"7",
			"8",
			"9",
			"10",
			"11",
			"12",
			"13",
			"14",
			"15",
			"16",
			"17",
			"18",
			"19",
			"20",
			"21",
			"22",
			"23",
			"24",
			"25",
			"26",
			"27",
			"28",
			"29",
			"30"
		},
		value = self._hed.variant
	}

	return bscreen_params
end

return 
