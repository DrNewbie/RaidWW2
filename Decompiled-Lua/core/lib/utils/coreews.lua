-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreEws"

core.module(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

slot3 = "CoreApp"

core.import(slot1, core)

function verify_number(ctrlr, event)

	-- Decompilation error in this vicinity:
	slot5 = "K_BACK"
	slot5 = event

	return 
end

function image_path(file_name)

	-- Decompilation error in this vicinity:
	file_name = file_name or ""
	local path = base_path .. "lib\\utils\\dev\\ews\\images\\"

	if file_name ~= "" and EWS then
		slot6 = path .. file_name

		if not EWS.system_file_exists(slot4, EWS) then
			path = base_path .. "core\\lib\\utils\\dev\\ews\\images\\"
		end
	end

	return path .. file_name
end

EWSConfirmDialog = EWSConfirmDialog or CoreClass.class()
function EWSConfirmDialog:init(label, message)
	self._yes = false
	self._no = false
	self._cancel = false
	slot13 = 0
	slot14 = 0
	slot11 = "DEFAULT_DIALOG_STYLE"
	self._dialog = EWS.Dialog(slot4, EWS, nil, label, "", Vector3(slot10, 525, 400), Vector3(525, 250, 110))
	slot6 = "HORIZONTAL"
	local dialog_sizer = EWS.BoxSizer(slot4, EWS)
	slot7 = dialog_sizer

	self._dialog.set_sizer(EWS, self._dialog)

	slot9 = ""
	local panel = EWS.Panel(EWS, EWS, self._dialog, "")
	slot8 = "VERTICAL"
	local panel_sizer = EWS.BoxSizer(EWS, EWS)
	slot9 = panel_sizer

	panel.set_sizer(EWS, panel)

	slot12 = "ALIGN_CENTRE"
	local msg = EWS.StaticText(EWS, EWS, panel, message, "")
	slot13 = "EXPAND,TOP,BOTTOM"

	panel_sizer.add(EWS, panel_sizer, msg, 0, 20)

	slot10 = "HORIZONTAL"
	local button_sizer = EWS.BoxSizer(EWS, EWS)
	slot14 = "BU_BOTTOM"
	local yes_btn = EWS.Button(EWS, EWS, panel, "Yes", "")
	slot15 = "RIGHT,LEFT"

	button_sizer.add(EWS, button_sizer, yes_btn, 0, 2)

	slot17 = "set_value"
	slot14 = "_yes"

	yes_btn.connect(EWS, yes_btn, "EVT_COMMAND_BUTTON_CLICKED", callback(2, self, self))

	slot15 = ""
	local no_btn = EWS.Button(EWS, EWS, panel, "No", "")
	slot16 = "RIGHT,LEFT"

	button_sizer.add(EWS, button_sizer, no_btn, 0, 2)

	slot18 = "set_value"
	slot15 = "_no"

	no_btn.connect(EWS, no_btn, "EVT_COMMAND_BUTTON_CLICKED", callback(2, self, self))

	slot16 = ""
	local cancel_btn = EWS.Button(EWS, EWS, panel, "Cancel", "")
	slot17 = "RIGHT,LEFT"

	button_sizer.add(EWS, button_sizer, cancel_btn, 0, 2)

	slot19 = "set_value"
	slot16 = "_cancel"

	cancel_btn.connect(EWS, cancel_btn, "EVT_COMMAND_BUTTON_CLICKED", callback(2, self, self))

	slot17 = "EXPAND"

	panel_sizer.add(EWS, panel_sizer, button_sizer, 1, 0)

	slot17 = "EXPAND"

	dialog_sizer.add(EWS, dialog_sizer, panel_sizer, 1, 0)

	slot13 = panel

	panel.fit(EWS)

	return 
end
function EWSConfirmDialog:show_modal()
	slot3 = self._dialog

	self._dialog.show_modal(slot2)

	return true
end
function EWSConfirmDialog:set_value(value)
	self[value] = true
	slot4 = self._dialog

	self._dialog.end_modal(slot3)

	return 
end
function EWSConfirmDialog:yes()
	return self._yes
end
function EWSConfirmDialog:no()
	return self._no
end
function EWSConfirmDialog:cancel()
	return self._cancel
end
LocalizerTextCtrl = LocalizerTextCtrl or CoreClass.class()
function LocalizerTextCtrl:init(panel, sizer, text)
	slot11 = text
	slot10 = "TE_CENTRE,TE_READONLY"
	self._text_ctrlr = EWS.TextCtrl(slot5, EWS, panel, Localizer.lookup(slot9, Localizer), "")
	slot10 = "EXPAND"

	sizer.add(slot5, sizer, self._text_ctrlr, 1, 0)

	return 
end
function LocalizerTextCtrl:get()
	return self._text_ctrlr
end
function LocalizerTextCtrl:get_value()
	slot3 = self._text_ctrlr

	return self._text_ctrlr.get_value(slot2)
end
function LocalizerTextCtrl:set_value(value)
	slot4 = self._text_ctrlr
	slot8 = value

	return self._text_ctrlr.set_value(slot3, Localizer.lookup(slot6, Localizer))
end
EWSRadioBitmapButton = EWSRadioBitmapButton or CoreClass.class()
function EWSRadioBitmapButton:init(panel, bmp, id, style)
	self._on_bmp = bmp
	self._off_bmp = bmp
	slot11 = ""
	self._button = EWS.BitmapButton(slot6, EWS, panel, bmp, "")
	self._value = true

	return 
end
function EWSRadioBitmapButton:button()
	return self._button
end
function EWSRadioBitmapButton:set_on_bmp(bmp)
	self._on_bmp = bmp

	return 
end
function EWSRadioBitmapButton:set_off_bmp(bmp)
	self._off_bmp = bmp

	return 
end
function EWSRadioBitmapButton:set_value(value)
	self._value = value

	if value then
		slot5 = self._on_bmp

		self._button.set_label_bitmap(slot3, self._button)
	else
		slot5 = self._off_bmp

		self._button.set_label_bitmap(slot3, self._button)
	end

	return 
end
function EWSRadioBitmapButton:value()
	return self._value
end
EwsTextDialog = EwsTextDialog or CoreClass.class()
function EwsTextDialog:init(name, init_text)
	init_text = init_text or "new"
	slot13 = 0
	slot14 = 0
	slot11 = "CAPTION,CLOSE_BOX"
	self._dialog = EWS.Dialog(slot4, EWS, nil, name, "", Vector3(slot10, 525, 400), Vector3(525, 230, 150))
	slot6 = "LIGHT GREY"

	self._dialog.set_background_colour(slot4, self._dialog)

	slot7 = "VERTICAL"
	local dialog_main_sizer = EWS.StaticBoxSizer(slot4, EWS, self._dialog)
	slot7 = dialog_main_sizer

	self._dialog.set_sizer(EWS, self._dialog)

	slot10 = "TE_CENTRE"
	self._text = EWS.TextCtrl(EWS, EWS, self._dialog, init_text, "")
	slot10 = "EXPAND"

	dialog_main_sizer.add(EWS, dialog_main_sizer, self._text, 0, 0)

	slot7 = "HORIZONTAL"
	local button_sizer = EWS.BoxSizer(EWS, EWS)
	slot11 = "BU_EXACTFIT,NO_BORDER"
	local ok_btn = EWS.Button(EWS, EWS, self._dialog, "Ok", "")
	slot12 = "EXPAND"

	button_sizer.add(EWS, button_sizer, ok_btn, 0, 0)

	slot14 = "close"
	slot11 = {
		cancel = false,
		dialog = self._dialog
	}

	ok_btn.connect(EWS, ok_btn, "EVT_COMMAND_BUTTON_CLICKED", callback(0, self, self))

	slot12 = "BU_EXACTFIT,NO_BORDER"
	local cancel_btn = EWS.Button(EWS, EWS, self._dialog, "Cancel", "")
	slot13 = "EXPAND"

	button_sizer.add(EWS, button_sizer, cancel_btn, 0, 0)

	slot15 = "close"
	slot12 = {
		cancel = true,
		dialog = self._dialog
	}

	cancel_btn.connect(EWS, cancel_btn, "EVT_COMMAND_BUTTON_CLICKED", callback(0, self, self))

	slot13 = "ALIGN_RIGHT"

	dialog_main_sizer.add(EWS, dialog_main_sizer, button_sizer, 0, 0)

	return 
end
function EwsTextDialog:close(data)
	slot4 = data.dialog

	data.dialog.end_modal(slot3)

	self._cancel_dialog = data.cancel

	return 
end
function EwsTextDialog:cancel_dialog()
	return self._cancel_dialog
end
function EwsTextDialog:dialog()
	return self._dialog
end
function EwsTextDialog:text()
	return self._text
end

function number_controller(params)
	params.value = params.value or 0
	params.name_proportions = params.name_proportions or 1
	params.ctrlr_proportions = params.ctrlr_proportions or 1
	params.sizer_proportions = params.sizer_proportions or 0
	params.floats = params.floats or 0
	slot4 = "HORIZONTAL"
	params.ctrl_sizer = EWS.BoxSizer(slot2, EWS)
	slot3 = params

	_ctrlr_tooltip(slot2)

	slot3 = params

	_name_ctrlr(slot2)

	slot3 = params

	_number_ctrlr(slot2)

	slot7 = "EXPAND"

	params.ctrl_sizer.add(slot2, params.ctrl_sizer, params.number_ctrlr, params.ctrlr_proportions, 0)

	slot7 = "EXPAND"

	params.sizer.add(slot2, params.sizer, params.ctrl_sizer, params.sizer_proportions, 0)

	slot3 = params

	_connect_events(slot2)

	return params.number_ctrlr, params.name_ctrlr, params
end

function verify_entered_number(params)
	slot5 = params.number_ctrlr
	local value = tonumber(params.number_ctrlr.get_value(slot4)) or 0

	if params.min and value < params.min and not params.min then
	end

	if params.max and params.max < value and not params.max then
	end

	params.value = value
	local floats = params.floats or 0
	slot5 = params.number_ctrlr
	slot9 = value

	params.number_ctrlr.change_value(slot4, string.format(slot7, "%." .. floats .. "f"))

	slot7 = -1

	params.number_ctrlr.set_selection(slot4, params.number_ctrlr, -1)

	return 
end

function change_entered_number(params, value)
	local floats = params.floats or 0
	params.value = value
	slot5 = params.number_ctrlr
	slot9 = params.value

	params.number_ctrlr.change_value(slot4, string.format(slot7, "%." .. floats .. "f"))

	return 
end

function change_slider_and_number_value(params, value)
	params.value = value
	slot5 = value * params.slider_multiplier

	params.slider_ctrlr.set_value(slot3, params.slider_ctrlr)

	slot5 = value

	change_entered_number(slot3, params)

	return 
end

function _connect_events(params)
	if not params.events then
		return 
	end

	slot3 = params.events

	for _, data in ipairs(slot2) do
		slot11 = params

		params.number_ctrlr.connect(slot7, params.number_ctrlr, data.event, data.callback)
	end

	return 
end

function combobox(params)
	local name = params.name
	local panel = params.panel
	local sizer = params.sizer
	local default = params.default
	local options = params.options or {}
	local value = params.value or options[1]
	local name_proportions = params.name_proportions or 1
	local ctrlr_proportions = params.ctrlr_proportions or 2
	params.sizer_proportions = params.sizer_proportions or 0
	local tooltip = params.tooltip
	local styles = params.styles or "CB_DROPDOWN,CB_READONLY"
	local sorted = params.sorted
	slot15 = "HORIZONTAL"
	local ctrl_sizer = EWS.BoxSizer(slot13, EWS)
	local name_ctrlr = nil

	if name then
		slot20 = ""
		name_ctrlr = EWS.StaticText(slot15, EWS, panel, name, 0)
		slot20 = "ALIGN_CENTER_VERTICAL"

		ctrl_sizer.add(slot15, ctrl_sizer, name_ctrlr, name_proportions, 0)
	end

	if sorted then
		slot16 = options

		table.sort(slot15)
	end

	slot20 = styles
	local ctrlr = EWS.ComboBox(slot15, EWS, panel, "", "")

	if params.value then
		slot18 = params.tooltip .. "\n" .. params.value

		ctrlr.set_tool_tip(slot16, ctrlr)
	else
		slot18 = tooltip

		ctrlr.set_tool_tip(slot16, ctrlr)
	end

	slot17 = ctrlr

	ctrlr.freeze(slot16)

	if default then
		slot18 = default

		ctrlr.append(slot16, ctrlr)
	end

	slot17 = options

	for _, option in ipairs(slot16) do
		slot23 = option

		ctrlr.append(slot21, ctrlr)
	end

	slot18 = value

	ctrlr.set_value(slot16, ctrlr)

	slot17 = ctrlr

	ctrlr.thaw(slot16)

	params.name_ctrlr = name_ctrlr
	params.ctrlr = ctrlr
	slot21 = "EXPAND"

	ctrl_sizer.add(slot16, ctrl_sizer, ctrlr, ctrlr_proportions, 0)

	slot21 = "EXPAND"

	sizer.add(slot16, sizer, ctrl_sizer, params.sizer_proportions, 0)

	slot23 = "_set_combobox_value"
	slot20 = params

	params.ctrlr.connect(slot16, params.ctrlr, "EVT_COMMAND_COMBOBOX_SELECTED", callback(0, nil, _M))

	slot17 = params

	_connect_events(slot16)

	return ctrlr, name_ctrlr, params
end

function _set_combobox_value(params)

	-- Decompilation error in this vicinity:
	slot3 = params.ctrlr
	params.value = params.ctrlr.get_value(slot2)

	if params.value then
		slot4 = params.tooltip .. "\n" .. params.value

		params.ctrlr.set_tool_tip(slot2, params.ctrlr)
	end

	return 
end

function update_combobox_options(params, options)
	slot4 = params.ctrlr

	params.ctrlr.freeze(slot3)

	slot4 = params.ctrlr

	params.ctrlr.clear(slot3)

	if params.sorted then
		slot4 = options

		table.sort(slot3)
	end

	if params.default then
		slot5 = params.default

		params.ctrlr.append(slot3, params.ctrlr)
	end

	slot4 = options

	for _, option in ipairs(slot3) do
		slot10 = option

		params.ctrlr.append(slot8, params.ctrlr)
	end

	params.options = options
	slot4 = params.ctrlr

	params.ctrlr.thaw(slot3)

	return 
end

function change_combobox_value(params, value)

	-- Decompilation error in this vicinity:
	params.value = value

	if params.value then
		slot5 = params.tooltip .. "\n" .. params.value

		params.ctrlr.set_tool_tip(slot3, params.ctrlr)
	end

	return 
end

function slider_and_number_controller(params)
	params.value = params.value or 0
	params.name_proportions = params.name_proportions or 1
	params.ctrlr_proportions = params.ctrlr_proportions or 1
	params.slider_ctrlr_proportions = params.slider_ctrlr_proportions or 2
	params.number_ctrlr_proportions = params.number_ctrlr_proportions or 1
	params.floats = params.floats or 0
	slot4 = params.floats
	params.slider_multiplier = math.pow(slot2, 10)
	params.min = params.min or 0
	params.max = params.max or 10
	slot4 = "HORIZONTAL"
	params.ctrl_sizer = EWS.BoxSizer(slot2, EWS)
	slot3 = params

	_ctrlr_tooltip(slot2)

	slot3 = params

	_name_ctrlr(slot2)

	slot3 = params

	_number_ctrlr(slot2)
	_slider_ctrlr(slot2)

	slot9 = "update_slider_from_number"

	params.number_ctrlr.connect(slot2, params.number_ctrlr, "EVT_COMMAND_TEXT_ENTER", callback(slot6, nil, _M))

	slot9 = "update_slider_from_number"

	params.number_ctrlr.connect(slot2, params.number_ctrlr, "EVT_KILL_FOCUS", callback(params, nil, _M))

	slot9 = "update_number_from_slider"

	params.slider_ctrlr.connect(slot2, params.slider_ctrlr, "EVT_SCROLL_CHANGED", callback(params, nil, _M))

	slot9 = "update_number_from_slider"
	slot6 = params

	params.slider_ctrlr.connect(slot2, params.slider_ctrlr, "EVT_SCROLL_THUMBTRACK", callback(params, nil, _M))

	slot4 = "HORIZONTAL"
	local ctrl_sizer2 = EWS.BoxSizer(slot2, EWS)
	slot8 = "ALIGN_CENTER_VERTICAL"

	ctrl_sizer2.add(EWS, ctrl_sizer2, params.slider_ctrlr, params.slider_ctrlr_proportions, 0)

	slot8 = "EXPAND"

	ctrl_sizer2.add(EWS, ctrl_sizer2, params.number_ctrlr, params.number_ctrlr_proportions, 0)

	slot8 = "EXPAND"

	params.ctrl_sizer.add(EWS, params.ctrl_sizer, ctrl_sizer2, params.ctrlr_proportions, 0)

	slot8 = "EXPAND"

	params.sizer.add(params, params.sizer, params.ctrl_sizer, params.sizer_proportions or 0, 0)

	return params
end

function _ctrlr_tooltip(params)
	local max = params.max
	local min = params.min

	if min and max then
		slot10 = max
		params.tooltip = (params.tooltip or "") .. " (Between " .. string.format(slot6, "%." .. params.floats .. "f") .. " and " .. string.format(min, "%." .. params.floats .. "f") .. ")"
	elseif min then
		slot8 = min
		params.tooltip = (params.tooltip or "") .. " (Above " .. string.format(slot6, "%." .. params.floats .. "f") .. ")"
	elseif max then
		slot8 = max
		params.tooltip = (params.tooltip or "") .. " (Below " .. string.format(slot6, "%." .. params.floats .. "f") .. ")"
	end

	return 
end

function _slider_ctrlr(params)
	slot9 = ""
	params.slider_ctrlr = EWS.Slider(slot2, EWS, params.panel, params.value * params.slider_multiplier, params.min * params.slider_multiplier, params.max * params.slider_multiplier, "")
	slot4 = params.tooltip

	params.slider_ctrlr.set_tool_tip(slot2, params.slider_ctrlr)

	return 
end

function _number_ctrlr(params)
	slot3 = params.value

	if CoreClass.type_name(slot2) ~= "number" then
		params.value = params.min or 0
	end

	slot8 = params.value
	slot7 = "TE_PROCESS_ENTER"
	params.number_ctrlr = EWS.TextCtrl(slot2, EWS, params.panel, string.format(slot6, "%." .. params.floats .. "f"), "")
	slot4 = params.tooltip

	params.number_ctrlr.set_tool_tip(slot2, params.number_ctrlr)

	slot9 = "verify_number"

	params.number_ctrlr.connect(slot2, params.number_ctrlr, "EVT_CHAR", callback("", nil, _G))

	slot9 = "verify_entered_number"

	params.number_ctrlr.connect(slot2, params.number_ctrlr, "EVT_COMMAND_TEXT_ENTER", callback(params.number_ctrlr, nil, _M))

	slot9 = "verify_entered_number"
	slot6 = params

	params.number_ctrlr.connect(slot2, params.number_ctrlr, "EVT_KILL_FOCUS", callback(params, nil, _M))

	return 
end

function _name_ctrlr(params)
	if params.name then
		slot7 = ""
		params.name_ctrlr = EWS.StaticText(slot2, EWS, params.panel, params.name, 0)
		slot7 = "ALIGN_CENTER_VERTICAL"

		params.ctrl_sizer.add(slot2, params.ctrl_sizer, params.name_ctrlr, params.name_proportions, 0)
	end

	return 
end

function verify_entered_number(params)
	local ctrlr = params.ctrlr or params.number_ctrlr
	slot6 = ctrlr
	local value = tonumber(ctrlr.get_value(slot5)) or 0

	if params.min and value < params.min and not params.min then
	end

	if params.max and params.max < value and not params.max then
	end

	params.value = value
	local floats = params.floats or 0
	slot6 = ctrlr
	slot10 = value

	ctrlr.change_value(slot5, string.format(slot8, "%." .. floats .. "f"))

	slot8 = -1

	ctrlr.set_selection(slot5, ctrlr, -1)

	return 
end

function update_slider_from_number(params)
	slot4 = params.value * params.slider_multiplier

	params.slider_ctrlr.set_value(slot2, params.slider_ctrlr)

	return 
end

function update_number_from_slider(params)
	slot3 = params.slider_ctrlr
	params.value = params.slider_ctrlr.get_value(slot2) / params.slider_multiplier
	slot4 = params.value

	change_entered_number(params.slider_multiplier, params)

	return 
end

function update_slider_and_number_controller_value(params, value)
	params.value = value
	slot5 = params.value

	change_entered_number(slot3, params)

	slot4 = params

	update_slider_from_number(slot3)

	return 
end

function change_slider_and_number_controller_range(params, min, max)
	slot7 = max * params.slider_multiplier

	params.slider_ctrlr.set_range(slot4, params.slider_ctrlr, min * params.slider_multiplier)

	return 
end

function list_selector(params)
	params.title = params.title or ""
	params.options = params.options or {}
	params.value = params.value or {}
	params.height = params.height or 100
	slot4 = "VERTICAL"
	params.ctrl_sizer = EWS.BoxSizer(slot2, EWS)
	slot9 = ""
	slot7 = "EXPAND,TOP,BOTTOM"

	params.ctrl_sizer.add(slot2, params.ctrl_sizer, EWS.StaticLine(slot5, EWS, params.panel, ""), 0, 4)

	slot3 = params

	_name_ctrlr(slot2)

	slot4 = "HORIZONTAL"
	local toolbar_sizer = EWS.BoxSizer(slot2, EWS)
	slot7 = "TB_FLAT,TB_NODIVIDER"
	params.left_toolbar = EWS.ToolBar(EWS, EWS, params.panel, "")
	slot9 = "world_editor\\unit_by_name_list.png"

	params.left_toolbar.add_tool(EWS, params.left_toolbar, "ADD_LIST", "Add from list", image_path(""))

	slot11 = "_list_selector_add_from_list"
	slot8 = params

	params.left_toolbar.connect(EWS, params.left_toolbar, "ADD_LIST", "EVT_COMMAND_MENU_SELECTED", callback(nil, nil, _G))

	slot4 = params.left_toolbar

	params.left_toolbar.realize(EWS)
	toolbar_sizer.add(EWS, toolbar_sizer, params.left_toolbar, 1, 1)

	slot7 = "TB_FLAT,TB_NODIVIDER"
	params.right_toolbar = EWS.ToolBar(EWS, EWS, params.panel, "")
	slot9 = "toolbar\\delete_16x16.png"

	params.right_toolbar.add_tool(EWS, params.right_toolbar, "REMOVE_LIST", "Remove from list", image_path("EXPAND,LEFT"))

	slot11 = "_list_selector_remove_from_list"
	slot8 = params

	params.right_toolbar.connect(EWS, params.right_toolbar, "REMOVE_LIST", "EVT_COMMAND_MENU_SELECTED", callback(nil, nil, _G))
	params.right_toolbar.realize(EWS)

	slot8 = "EXPAND,LEFT"

	toolbar_sizer.add(EWS, toolbar_sizer, params.right_toolbar, 1, 1)

	slot8 = "EXPAND,LEFT"

	params.ctrl_sizer.add(EWS, params.ctrl_sizer, toolbar_sizer, 0, 1)

	slot5 = "HORIZONTAL"
	local lb_box = EWS.BoxSizer(EWS, EWS)
	slot8 = "LB_SORT,LB_EXTENDED"
	params.left_list_box = EWS.ListBox(EWS, EWS, params.panel, "list_selector_left")
	slot12 = "_list_selector_on_left_box"
	slot9 = params

	params.left_list_box.connect(EWS, params.left_list_box, "", "EVT_COMMAND_LISTBOX_DOUBLECLICKED", callback(nil, nil, _G))

	slot5 = params.left_list_box
	slot10 = 0

	params.left_list_box.set_min_size(EWS, Vector3("EVT_COMMAND_LISTBOX_DOUBLECLICKED", -1, params.height))
	lb_box.add(EWS, lb_box, params.left_list_box, 1, 4)

	slot8 = "LB_SORT,LB_EXTENDED"
	params.right_list_box = EWS.ListBox(EWS, EWS, params.panel, "list_selector_right")
	slot12 = "_list_selector_on_right_box"
	slot9 = params

	params.right_list_box.connect(EWS, params.right_list_box, "", "EVT_COMMAND_LISTBOX_DOUBLECLICKED", callback("ALL,EXPAND", nil, _G))

	slot5 = params.right_list_box
	slot10 = 0

	params.right_list_box.set_min_size(EWS, Vector3("EVT_COMMAND_LISTBOX_DOUBLECLICKED", -1, params.height))

	slot9 = "ALL,EXPAND"

	lb_box.add(EWS, lb_box, params.right_list_box, 1, 4)

	slot9 = "EXPAND"

	params.ctrl_sizer.add(EWS, params.ctrl_sizer, lb_box, 1, 0)

	slot9 = "EXPAND"

	params.sizer.add(params.right_toolbar, params.sizer, params.ctrl_sizer, params.sizer_proportions or 0, 0)

	slot5 = params.options

	for _, option in ipairs(slot4) do
		slot11 = option

		if table.contains(slot9, params.value) then
			slot11 = option

			params.right_list_box.append(slot9, params.right_list_box)
		else
			slot11 = option

			params.left_list_box.append(slot9, params.left_list_box)
		end
	end

	return params
end

function _list_selector_add_from_list(params)
	slot7 = params
	local dialog = _G.SelectNameModal.new(slot2, _G.SelectNameModal, "Add", _list_selector_get_left_box_value({
		list_style = "LC_REPORT,LC_NO_HEADER,LC_SORT_ASCENDING"
	}))
	slot4 = dialog

	if dialog.cancelled(_G.SelectNameModal) then
		return 
	end

	slot5 = params.left_list_box

	for i = 0, params.left_list_box.nr_items(slot4) - 1, 1 do
		params.left_list_box.deselect_index(slot7, params.left_list_box)

		slot10 = dialog

		for _, selected in ipairs(dialog._selected_item_assets(i)) do
			slot14 = i

			if selected == params.left_list_box.get_string(slot12, params.left_list_box) then
				slot14 = i

				params.left_list_box.select_index(slot12, params.left_list_box)

				break
			end
		end
	end

	slot4 = params

	_list_selector_on_left_box(slot3)

	return 
end

function _list_selector_remove_from_list(params)
	slot7 = params
	local dialog = _G.SelectNameModal.new(slot2, _G.SelectNameModal, "Remove", _list_selector_get_value({
		list_style = "LC_REPORT,LC_NO_HEADER,LC_SORT_ASCENDING"
	}))
	slot4 = dialog

	if dialog.cancelled(_G.SelectNameModal) then
		return 
	end

	slot5 = params.right_list_box

	for i = 0, params.right_list_box.nr_items(slot4) - 1, 1 do
		params.right_list_box.deselect_index(slot7, params.right_list_box)

		slot10 = dialog

		for _, selected in ipairs(dialog._selected_item_assets(i)) do
			slot14 = i

			if selected == params.right_list_box.get_string(slot12, params.right_list_box) then
				slot14 = i

				params.right_list_box.select_index(slot12, params.right_list_box)

				break
			end
		end
	end

	slot4 = params

	_list_selector_on_right_box(slot3)

	return 
end

function _list_selector_on_left_box(params)
	local selected_indices = params.left_list_box.selected_indices(slot2)
	slot4 = selected_indices

	for _, index in ipairs(params.left_list_box) do
		slot10 = index
		local selected = params.left_list_box.get_string(slot8, params.left_list_box)
		slot11 = selected

		params.right_list_box.append(params.left_list_box, params.right_list_box)

		slot11 = index

		params.left_list_box.deselect_index(params.left_list_box, params.left_list_box)
	end

	slot4 = selected_indices

	for i, index in ipairs(slot3) do
		slot10 = index - i - 1

		params.left_list_box.remove(slot8, params.left_list_box)
	end

	slot4 = params

	_list_selector_updated_callback(slot3)

	return 
end

function _list_selector_on_right_box(params)
	local selected_indices = params.right_list_box.selected_indices(slot2)
	slot4 = selected_indices

	for _, index in ipairs(params.right_list_box) do
		slot10 = index
		local selected = params.right_list_box.get_string(slot8, params.right_list_box)
		slot11 = selected

		params.left_list_box.append(params.right_list_box, params.left_list_box)

		slot11 = index

		params.right_list_box.deselect_index(params.right_list_box, params.right_list_box)
	end

	slot4 = selected_indices

	for i, index in ipairs(slot3) do
		slot10 = index - i - 1

		params.right_list_box.remove(slot8, params.right_list_box)
	end

	slot4 = params

	_list_selector_updated_callback(slot3)

	return 
end

function _list_selector_get_left_box_value(params)
	local value = {}
	slot5 = params.left_list_box

	for i = 0, params.left_list_box.nr_items(slot4) - 1, 1 do
		slot8 = value
		slot12 = i

		table.insert(slot7, params.left_list_box.get_string(slot10, params.left_list_box))
	end

	return value
end

function _list_selector_get_value(params)
	local value = {}
	slot5 = params.right_list_box

	for i = 0, params.right_list_box.nr_items(slot4) - 1, 1 do
		slot8 = value
		slot12 = i

		table.insert(slot7, params.right_list_box.get_string(slot10, params.right_list_box))
	end

	return value
end

function _list_selector_updated_callback(params)
	if params.updated_callback then
		slot5 = params

		params.updated_callback(_list_selector_get_value(slot4))
	end

	return 
end

function combobox_and_list(params)
	slot4 = "HORIZONTAL"
	local horizontal_sizer = EWS.BoxSizer(slot2, EWS)
	slot8 = "EXPAND,LEFT"

	params.sizer.add(EWS, params.sizer, horizontal_sizer, 0, 1)

	params.sizer = horizontal_sizer
	params.sizer_proportions = params.sizer_proportions or 1
	params.tooltip = params.tooltip or "Select an option from the combobox"
	local ctrlr = combobox(slot3)
	slot8 = "TB_FLAT,TB_NODIVIDER"
	local toolbar = EWS.ToolBar(params, EWS, params.panel, "")
	slot11 = "world_editor\\unit_by_name_list.png"

	toolbar.add_tool(EWS, toolbar, "SELECT_NAME_LIST", "Select from list", image_path(slot10))

	slot13 = "_on_gui_value_combobox_toolbar_select_dialog"
	slot10 = {
		combobox_params = params
	}

	toolbar.connect(EWS, toolbar, "SELECT_NAME_LIST", "EVT_COMMAND_MENU_SELECTED", callback(nil, nil, _G))

	slot6 = toolbar

	toolbar.realize(EWS)

	slot10 = "EXPAND,LEFT"

	horizontal_sizer.add(EWS, horizontal_sizer, toolbar, 0, 1)

	params.toolbar = toolbar

	return ctrlr, params
end

function _on_gui_value_combobox_toolbar_select_dialog(params)
	slot5 = params.combobox_params.options
	local dialog = _G.SelectNameModal.new(slot2, _G.SelectNameModal, "Select name")
	slot4 = dialog

	if dialog.cancelled(_G.SelectNameModal) then
		return 
	end

	slot6 = dialog

	for _, name in ipairs(dialog._selected_item_assets(slot5)) do
		slot10 = name

		change_combobox_value(slot8, params.combobox_params)
	end

	return 
end

function set_combobox_and_list_enabled(params, enabled)
	slot5 = enabled

	params.ctrlr.set_enabled(slot3, params.ctrlr)

	slot5 = enabled

	params.toolbar.set_enabled(slot3, params.toolbar)

	return 
end

function get_notebook_current_page_index(notebook)
	slot3 = notebook
	local page = notebook.get_current_page(slot2)
	slot5 = notebook

	for i = 0, notebook.get_page_count(slot4) - 1, 1 do
		slot9 = i

		if page == notebook.get_page(slot7, notebook) then
			return i
		end
	end

	return nil
end

return 
