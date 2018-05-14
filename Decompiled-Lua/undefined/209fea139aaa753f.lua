if not ExecLuaOperatorElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

ExecLuaOperatorElement = slot0
function ExecLuaOperatorElement:init(unit)
	slot5 = unit

	ExecLuaOperatorElement.super.init(slot3, self)

	self._hed.lua_string = ""
	self._hed.local_only = false
	slot5 = "lua_string"

	table.insert(false, self._save_values)

	slot5 = "local_only"

	table.insert(false, self._save_values)

	self._syntax_colors = {}
	slot7 = 0
	self._syntax_colors.NONE = Vector3(self._save_values, 0, 0)
	slot7 = 50
	self._syntax_colors.OK = Vector3(self._save_values, 50, 210)
	slot7 = 50
	self._syntax_colors.ERROR = Vector3(self._save_values, 220, 50)

	return 
end
function ExecLuaOperatorElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	slot8 = "Adittional options"
	local additional_sizer = EWS.StaticBoxSizer(slot4, EWS, panel, "VERTICAL")
	slot7 = "HORIZONTAL"
	local additional_element_sizer = EWS.BoxSizer(EWS, EWS)
	slot11 = "EXPAND,LEFT"

	additional_sizer.add(EWS, additional_sizer, additional_element_sizer, 0, 1)

	slot11 = "Local Only"

	self._build_value_checkbox(EWS, self, panel, additional_sizer, "local_only")

	slot11 = "EXPAND,LEFT"

	panel_sizer.add(EWS, panel_sizer, additional_sizer, 0, 0)

	slot10 = "LUA goes here"
	local text_sizer = EWS.StaticBoxSizer(EWS, EWS, panel, "VERTICAL")
	local text = EWS.TextCtrl(EWS, EWS, panel, self._hed.lua_string, "")
	slot15 = "set_element_data"

	text.connect(EWS, text, "EVT_COMMAND_TEXT_ENTER", callback("TE_MULTILINE,TE_DONTWRAP,VSCROLL,ALWAYS_SHOW_SB,TE_PROCESS_ENTER", self, self))

	slot15 = "set_element_data"

	text.connect(EWS, text, "EVT_KILL_FOCUS", callback({
		value = "lua_string",
		ctrlr = text
	}, self, self))

	slot10 = "EVT_COMMAND_TEXT_ENTER"
	slot15 = "_lua_syntax_check"

	text.connect(EWS, text, callback({
		value = "lua_string",
		ctrlr = text
	}, self, self))

	slot10 = "EVT_KILL_FOCUS"
	slot15 = "_lua_syntax_check"

	text.connect(EWS, text, callback(, self, self))

	slot13 = "EXPAND"

	text_sizer.add(EWS, text_sizer, text, 1, 0)

	slot13 = "EXPAND"

	panel_sizer.add(EWS, panel_sizer, text_sizer, 1, 0)

	local button = EWS.Button(EWS, EWS, panel, "Check syntax", "")
	slot16 = "_lua_syntax_check"
	slot13 = button

	button.connect(EWS, button, "EVT_COMMAND_BUTTON_CLICKED", callback("", self, self))

	slot14 = "LEFT"

	panel_sizer.add(EWS, panel_sizer, button, 0, 0)

	slot13 = "TB_FLAT,TB_NODIVIDER"
	local toolbar = EWS.ToolBar(EWS, EWS, panel, "")
	slot11 = toolbar

	toolbar.realize(EWS)

	slot15 = "EXPAND,LEFT"

	panel_sizer.add(EWS, panel_sizer, toolbar, 0, 1)

	slot15 = "TE_RICH2,TE_MULTILINE,TE_READONLY,TE_WORDWRAP,TE_CENTRE"
	self._syntax_check_ctrl = EWS.TextCtrl(EWS, EWS, panel, "Syntax not checked", 0)
	slot15 = "EXPAND,TOP,BOTTOM"

	panel_sizer.add(EWS, panel_sizer, self._syntax_check_ctrl, 0, 0)

	slot12 = "!!EXPERIMENTAL!! Executes arbitrary LUA code"

	self._add_help_text(EWS, self)

	slot11 = self

	self._lua_syntax_check(EWS)

	return 
end
function ExecLuaOperatorElement:_lua_syntax_check()
	slot4 = ""

	self._syntax_check_ctrl.set_value(slot2, self._syntax_check_ctrl)

	if self._hed.lua_string then
		slot3 = self._hed.lua_string
		local func, res = loadstring(slot2)

		if func then
			res = "Syntax OK!"
			slot6 = self._syntax_colors.OK

			self._syntax_check_ctrl.set_default_style_colour(slot4, self._syntax_check_ctrl)
		else
			slot6 = self._syntax_colors.ERROR

			self._syntax_check_ctrl.set_default_style_colour(slot4, self._syntax_check_ctrl)
		end

		slot6 = res

		self._syntax_check_ctrl.append(slot4, self._syntax_check_ctrl)
	else
		slot4 = self._syntax_colors.NONE

		self._syntax_check_ctrl.set_default_style_colour(slot2, self._syntax_check_ctrl)

		slot4 = "LUA string is empty!"

		self._syntax_check_ctrl.append(slot2, self._syntax_check_ctrl)
	end

	return 
end

return 
