if not FilterUnitElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

FilterUnitElement = slot0
function FilterUnitElement:init(unit)
	slot5 = unit

	FilterUnitElement.super.init(slot3, self)

	self._hed.difficulty_easy = true
	self._hed.difficulty_normal = true
	self._hed.difficulty_hard = true
	self._hed.difficulty_overkill = true
	self._hed.difficulty_overkill_145 = true
	self._hed.difficulty_overkill_290 = nil
	self._hed.player_1 = true
	self._hed.player_2 = true
	self._hed.player_3 = true
	self._hed.player_4 = true
	self._hed.platform_win32 = true
	self._hed.platform_ps3 = true
	self._hed.mode_assault = true
	self._hed.mode_control = true
	self._hed.alarm_on = true
	self._hed.alarm_off = true
	slot5 = "difficulty_normal"

	table.insert(true, self._save_values)

	slot5 = "difficulty_hard"

	table.insert(true, self._save_values)

	slot5 = "difficulty_overkill"

	table.insert(true, self._save_values)

	slot5 = "difficulty_overkill_145"

	table.insert(true, self._save_values)

	slot5 = "player_1"

	table.insert(true, self._save_values)

	slot5 = "player_2"

	table.insert(true, self._save_values)

	slot5 = "player_3"

	table.insert(true, self._save_values)

	slot5 = "player_4"

	table.insert(true, self._save_values)

	slot5 = "platform_win32"

	table.insert(true, self._save_values)

	slot5 = "platform_ps3"

	table.insert(true, self._save_values)

	slot5 = "mode_assault"

	table.insert(true, self._save_values)

	slot5 = "mode_control"

	table.insert(true, self._save_values)

	slot5 = "alarm_on"

	table.insert(true, self._save_values)

	slot5 = "alarm_off"

	table.insert(true, self._save_values)

	return 
end
function FilterUnitElement:post_init(...)
	slot3 = self

	FilterUnitElement.super.post_init(slot2, ...)

	slot3 = self

	self._check_convertion(slot2)

	return 
end
function FilterUnitElement:_check_convertion()
	if self._hed.difficulty_overkill_290 == nil then
		self._hed.difficulty_overkill_290 = self._hed.difficulty_overkill_145
	end

	return 
end
function FilterUnitElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._check_convertion(slot4)

	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot6 = "HORIZONTAL"
	local h_sizer = EWS.BoxSizer(slot4, EWS)
	slot10 = "EXPAND"

	panel_sizer.add(EWS, panel_sizer, h_sizer, 0, 0)

	slot7 = "HORIZONTAL"
	local h2_sizer = EWS.BoxSizer(EWS, EWS)
	slot11 = "EXPAND"

	panel_sizer.add(EWS, panel_sizer, h2_sizer, 0, 0)

	slot10 = "Difficulty"
	local difficulty_sizer = EWS.StaticBoxSizer(EWS, EWS, panel, "VERTICAL")

	h_sizer.add(EWS, h_sizer, difficulty_sizer, 1, 0)

	slot11 = ""
	local difficulty_normal = EWS.CheckBox(EWS, EWS, panel, "Normal")
	slot10 = self._hed.difficulty_normal

	difficulty_normal.set_value(EWS, difficulty_normal)

	slot15 = "set_element_data"
	slot12 = {
		value = "difficulty_normal",
		ctrlr = difficulty_normal
	}

	difficulty_normal.connect(EWS, difficulty_normal, "EVT_COMMAND_CHECKBOX_CLICKED", callback("EXPAND", self, self))
	difficulty_sizer.add(EWS, difficulty_sizer, difficulty_normal, 0, 0)

	slot12 = ""
	local difficulty_hard = EWS.CheckBox(EWS, EWS, panel, "Hard")
	slot11 = self._hed.difficulty_hard

	difficulty_hard.set_value(EWS, difficulty_hard)

	slot16 = "set_element_data"
	slot13 = {
		value = "difficulty_hard",
		ctrlr = difficulty_hard
	}

	difficulty_hard.connect(EWS, difficulty_hard, "EVT_COMMAND_CHECKBOX_CLICKED", callback("EXPAND", self, self))
	difficulty_sizer.add(EWS, difficulty_sizer, difficulty_hard, 0, 0)

	slot13 = ""
	local difficulty_overkill = EWS.CheckBox(EWS, EWS, panel, "Very Hard")
	slot12 = self._hed.difficulty_overkill

	difficulty_overkill.set_value(EWS, difficulty_overkill)

	slot17 = "set_element_data"
	slot14 = {
		value = "difficulty_overkill",
		ctrlr = difficulty_overkill
	}

	difficulty_overkill.connect(EWS, difficulty_overkill, "EVT_COMMAND_CHECKBOX_CLICKED", callback("EXPAND", self, self))
	difficulty_sizer.add(EWS, difficulty_sizer, difficulty_overkill, 0, 0)

	slot14 = ""
	local difficulty_overkill_145 = EWS.CheckBox(EWS, EWS, panel, "Overkill")
	slot13 = self._hed.difficulty_overkill_145

	difficulty_overkill_145.set_value(EWS, difficulty_overkill_145)

	slot18 = "set_element_data"
	slot15 = {
		value = "difficulty_overkill_145",
		ctrlr = difficulty_overkill_145
	}

	difficulty_overkill_145.connect(EWS, difficulty_overkill_145, "EVT_COMMAND_CHECKBOX_CLICKED", callback("EXPAND", self, self))

	slot16 = "EXPAND"

	difficulty_sizer.add(EWS, difficulty_sizer, difficulty_overkill_145, 0, 0)

	slot15 = "Players"
	local players_sizer = EWS.StaticBoxSizer(EWS, EWS, panel, "VERTICAL")

	h_sizer.add(EWS, h_sizer, players_sizer, 1, 0)

	slot16 = ""
	local player_1 = EWS.CheckBox(EWS, EWS, panel, "One Player")
	slot15 = self._hed.player_1

	player_1.set_value(EWS, player_1)

	slot20 = "set_element_data"
	slot17 = {
		value = "player_1",
		ctrlr = player_1
	}

	player_1.connect(EWS, player_1, "EVT_COMMAND_CHECKBOX_CLICKED", callback("EXPAND", self, self))
	players_sizer.add(EWS, players_sizer, player_1, 0, 0)

	slot17 = ""
	local player_2 = EWS.CheckBox(EWS, EWS, panel, "Two Players")
	slot16 = self._hed.player_2

	player_2.set_value(EWS, player_2)

	slot21 = "set_element_data"
	slot18 = {
		value = "player_2",
		ctrlr = player_2
	}

	player_2.connect(EWS, player_2, "EVT_COMMAND_CHECKBOX_CLICKED", callback("EXPAND", self, self))
	players_sizer.add(EWS, players_sizer, player_2, 0, 0)

	slot18 = ""
	local player_3 = EWS.CheckBox(EWS, EWS, panel, "Three Players")
	slot17 = self._hed.player_3

	player_3.set_value(EWS, player_3)

	slot22 = "set_element_data"
	slot19 = {
		value = "player_3",
		ctrlr = player_3
	}

	player_3.connect(EWS, player_3, "EVT_COMMAND_CHECKBOX_CLICKED", callback("EXPAND", self, self))
	players_sizer.add(EWS, players_sizer, player_3, 0, 0)

	slot19 = ""
	local player_4 = EWS.CheckBox(EWS, EWS, panel, "Four Players")
	slot18 = self._hed.player_4

	player_4.set_value(EWS, player_4)

	slot23 = "set_element_data"
	slot20 = {
		value = "player_4",
		ctrlr = player_4
	}

	player_4.connect(EWS, player_4, "EVT_COMMAND_CHECKBOX_CLICKED", callback("EXPAND", self, self))

	slot21 = "EXPAND"

	players_sizer.add(EWS, players_sizer, player_4, 0, 0)

	slot20 = "Platform"
	local platform_sizer = EWS.StaticBoxSizer(EWS, EWS, panel, "VERTICAL")

	h_sizer.add(EWS, h_sizer, platform_sizer, 1, 0)

	slot21 = ""
	local platform_win32 = EWS.CheckBox(EWS, EWS, panel, "Win32")
	slot20 = self._hed.platform_win32

	platform_win32.set_value(EWS, platform_win32)

	slot25 = "set_element_data"
	slot22 = {
		value = "platform_win32",
		ctrlr = platform_win32
	}

	platform_win32.connect(EWS, platform_win32, "EVT_COMMAND_CHECKBOX_CLICKED", callback("EXPAND", self, self))
	platform_sizer.add(EWS, platform_sizer, platform_win32, 0, 0)

	slot22 = ""
	local platform_ps3 = EWS.CheckBox(EWS, EWS, panel, "PS3")

	platform_ps3.set_value(EWS, platform_ps3)

	slot26 = "set_element_data"
	slot23 = {
		value = "platform_ps3",
		ctrlr = platform_ps3
	}

	platform_ps3.connect(EWS, platform_ps3, "EVT_COMMAND_CHECKBOX_CLICKED", callback("EXPAND", self, self))

	slot24 = "EXPAND"

	platform_sizer.add(EWS, platform_sizer, platform_ps3, 0, 0)

	slot23 = "Mode"
	local mode_sizer = EWS.StaticBoxSizer(EWS, EWS, panel, "VERTICAL")
	slot25 = "EXPAND"

	h_sizer.add(EWS, h_sizer, mode_sizer, 1, 0)

	slot24 = ""
	local mode_control = EWS.CheckBox(EWS, EWS, panel, "Control")
	slot23 = (self._hed.mode_control == nil and true) or self._hed.mode_control

	mode_control.set_value(self._hed.platform_ps3, mode_control)

	slot28 = "set_element_data"

	mode_control.connect(self._hed.platform_ps3, mode_control, "EVT_COMMAND_CHECKBOX_CLICKED", callback({
		value = "mode_control",
		ctrlr = mode_control
	}, self, self))

	slot26 = "EXPAND"

	mode_sizer.add(self._hed.platform_ps3, mode_sizer, mode_control, 0, 0)

	slot25 = ""
	local mode_assault = EWS.CheckBox(self._hed.platform_ps3, EWS, panel, "Assault")

	mode_assault.set_value(mode_control, mode_assault)

	slot29 = "set_element_data"

	mode_assault.connect(mode_control, mode_assault, "EVT_COMMAND_CHECKBOX_CLICKED", callback({
		value = "mode_assault",
		ctrlr = mode_assault
	}, self, self))

	slot27 = "EXPAND"

	mode_sizer.add(mode_control, mode_sizer, mode_assault, 0, 0)

	slot26 = "Alarm"
	local alarm_sizer = EWS.StaticBoxSizer(mode_control, EWS, panel, "VERTICAL")
	slot28 = "EXPAND"

	h2_sizer.add(EWS, h2_sizer, alarm_sizer, 1, 0)

	slot27 = ""
	local alarm_on = EWS.CheckBox(EWS, EWS, panel, "Alarm ON")
	slot26 = (self._hed.alarm_on == nil and true) or self._hed.alarm_on

	alarm_on.set_value((self._hed.mode_assault == nil and true) or self._hed.mode_assault, alarm_on)

	slot31 = "set_element_data"

	alarm_on.connect((self._hed.mode_assault == nil and true) or self._hed.mode_assault, alarm_on, "EVT_COMMAND_CHECKBOX_CLICKED", callback({
		value = "alarm_on",
		ctrlr = alarm_on
	}, self, self))

	slot29 = "EXPAND"

	alarm_sizer.add((self._hed.mode_assault == nil and true) or self._hed.mode_assault, alarm_sizer, alarm_on, 0, 0)

	slot28 = ""
	local alarm_off = EWS.CheckBox((self._hed.mode_assault == nil and true) or self._hed.mode_assault, EWS, panel, "Alarm OFF")
	slot27 = (self._hed.alarm_off == nil and true) or self._hed.alarm_off

	alarm_off.set_value(alarm_on, alarm_off)

	slot32 = "set_element_data"

	alarm_off.connect(alarm_on, alarm_off, "EVT_COMMAND_CHECKBOX_CLICKED", callback({
		value = "alarm_off",
		ctrlr = alarm_off
	}, self, self))

	slot30 = "EXPAND"

	alarm_sizer.add(alarm_on, alarm_sizer, alarm_off, 0, 0)

	return 
end

return 
