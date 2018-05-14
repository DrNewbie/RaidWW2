-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot2 = "core/lib/utils/dev/ews/CoreExtendedMultichoiceDialog"

require(slot1)

slot2 = "core/lib/utils/dev/ews/CoreCollapseBox"

require(slot1)

slot2 = "core/lib/utils/dev/ews/CoreXMLTextCtrl"

require(slot1)

slot2 = "core/lib/utils/dev/ews/CoreCommandRegistry"

require(slot1)

CoreEWS = CoreEWS or class()
CoreEWS.TIP_MAX_LEN = 512
CoreEWS.image_path = function (file_name)

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
CoreEWS.check_news = function (parent, category, new_only, style)
	slot9 = "TEXT"
	local news = managers.news.check_news(slot5, managers.news, category, not new_only)

	if news then
		if style == "RICH" then
			slot15 = -1
			slot16 = 0
			slot13 = ""
			local dialog = EWS.Dialog(slot6, EWS, parent, "New Features!", "", Vector3(slot12, -1, -1), Vector3(-1, 400, 450))
			slot9 = "VERTICAL"
			local box = EWS.BoxSizer(EWS, EWS)
			slot16 = "TE_RICH2,TE_AUTO_URL,TE_MULTILINE,TE_READONLY,TE_DONTWRAP"
			slot13 = "EXPAND"

			box.add(EWS, box, EWS.TextCtrl(Vector3(slot12, -1, -1), EWS, dialog, news, ""), 1, 0)

			slot13 = ""
			local button = EWS.Button(EWS, EWS, dialog, "OK", "")
			slot17 = "end_modal"
			slot14 = ""

			button.connect(EWS, button, "", "EVT_COMMAND_BUTTON_CLICKED", callback(news, dialog, dialog))

			slot14 = "ALIGN_RIGHT"

			box.add(EWS, box, button, 0, 0)

			slot11 = box

			dialog.set_sizer(EWS, dialog)

			slot10 = dialog

			dialog.show_modal(EWS)
		elseif style == "TIP" then
			slot10 = CoreEWS.TIP_MAX_LEN

			EWS.tip_window(slot6, EWS, parent, news)
		else
			slot11 = "OK,ICON_INFORMATION"
			slot7 = EWS.MessageDialog(slot6, EWS, parent, news, "New Features!")

			EWS.MessageDialog(slot6, EWS, parent, news, "New Features!").show_modal(slot6)
		end
	end

	return news
end
CoreEWS.create_small_label = function (parent, text)
	slot8 = ""
	local text = EWS.StaticText(slot3, EWS, parent, text, 0)
	slot6 = 7

	text.set_font_size(EWS, text)

	return text
end
CoreEWS.topdown_layout = function (w)
	local q = w

	while q and q.type_name == "EWSPanel" do
		slot4 = q

		q.set_sizer_min_size(slot3)

		slot4 = q

		q.layout(slot3)

		slot4 = q

		q.refresh(slot3)

		slot4 = q
		q = q.parent(slot3)
	end

	return 
end
CoreEWS.show_log = function (parent, text, caption)
	slot13 = 0
	slot14 = 0
	slot11 = "CAPTION,SYSTEM_MENU,FRAME_FLOAT_ON_PARENT"
	local dialog = EWS.Dialog(slot4, EWS, parent, caption or "Log", "", Vector3(slot10, -1, -1), Vector3(-1, 500, 500))
	slot7 = "VERTICAL"
	local box = EWS.BoxSizer(EWS, EWS)
	slot11 = "TE_MULTILINE,TE_READONLY"
	local text_ctrl = EWS.TextCtrl(EWS, EWS, dialog, "", "")
	slot12 = "EXPAND"

	box.add(EWS, box, text_ctrl, 1, 0)

	slot12 = ""
	local ok_btn = EWS.Button(EWS, EWS, dialog, "OK", "")
	slot16 = "end_modal"
	slot13 = ""

	ok_btn.connect(EWS, ok_btn, "", "EVT_COMMAND_BUTTON_CLICKED", callback(500, dialog, dialog))

	slot13 = "ALL,ALIGN_RIGHT"

	box.add(EWS, box, ok_btn, 0, 4)

	slot10 = box

	dialog.set_sizer(EWS, dialog)

	slot10 = text

	text_ctrl.set_value(EWS, text_ctrl)

	slot9 = dialog

	dialog.show_modal(EWS)

	return 
end
CoreEWS.show_log_file = function (parent, file, caption)
	slot7 = "r"
	local f = File.open(slot4, File, file)

	if f then
		slot6 = f
		local str = f.read(slot5)

		if str ~= "" then
			slot9 = caption or file

			CoreEWS.show_log(slot6, parent, str)
		end
	end

	return 
end
CoreEWS.number_controller = function (params)
	params.value = params.value or 0
	params.name_proportions = params.name_proportions or 1
	params.ctrlr_proportions = params.ctrlr_proportions or 1
	params.floats = params.floats or 0
	slot4 = "HORIZONTAL"
	params.ctrl_sizer = EWS.BoxSizer(slot2, EWS)
	slot3 = params

	CoreEWS._ctrlr_tooltip(slot2)

	slot3 = params

	CoreEWS._name_ctrlr(slot2)

	slot3 = params

	CoreEWS._number_ctrlr(slot2)

	slot7 = "EXPAND"

	params.ctrl_sizer.add(slot2, params.ctrl_sizer, params.number_ctrlr, params.ctrlr_proportions, 0)

	slot7 = "EXPAND"

	params.sizer.add(slot2, params.sizer, params.ctrl_sizer, 0, 0)

	slot3 = params

	CoreEWS._connect_events(slot2)

	return params.number_ctrlr, params.name_ctrlr, params
end
CoreEWS.verify_entered_number = function (params)
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
CoreEWS.change_entered_number = function (params, value)
	local floats = params.floats or 0
	params.value = value
	slot5 = params.number_ctrlr
	slot9 = params.value

	params.number_ctrlr.change_value(slot4, string.format(slot7, "%." .. floats .. "f"))

	return 
end
CoreEWS.change_slider_and_number_value = function (params, value)
	params.value = value
	slot5 = value * params.slider_multiplier

	params.slider_ctrlr.set_value(slot3, params.slider_ctrlr)

	slot5 = value

	CoreEWS.change_entered_number(slot3, params)

	return 
end
CoreEWS._connect_events = function (params)
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
CoreEWS.combobox = function (params)
	local name = params.name
	local panel = params.panel
	local sizer = params.sizer
	local default = params.default
	local options = params.options or {}
	local value = params.value or options[1]
	local name_proportions = params.name_proportions or 1
	local ctrlr_proportions = params.ctrlr_proportions or 1
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
	slot18 = tooltip

	ctrlr.set_tool_tip(EWS, ctrlr)

	slot17 = ctrlr

	ctrlr.freeze(EWS)

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

	params.ctrlr.connect(slot16, params.ctrlr, "EVT_COMMAND_COMBOBOX_SELECTED", callback(0, nil, CoreEWS))

	slot17 = params

	CoreEWS._connect_events(slot16)

	return ctrlr, name_ctrlr, params
end
CoreEWS._set_combobox_value = function (params)
	slot3 = params.ctrlr
	params.value = params.ctrlr.get_value(slot2)

	return 
end
CoreEWS.update_combobox_options = function (params, options)
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

	return 
end
CoreEWS.change_combobox_value = function (params, value)
	params.value = value
	slot5 = value

	params.ctrlr.set_value(slot3, params.ctrlr)

	return 
end
CoreEWS.slider_and_number_controller = function (params)
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

	CoreEWS._ctrlr_tooltip(slot2)

	slot3 = params

	CoreEWS._name_ctrlr(slot2)

	slot3 = params

	CoreEWS._number_ctrlr(slot2)

	slot3 = params

	CoreEWS._slider_ctrlr(slot2)

	slot9 = "update_slider_from_number"

	params.number_ctrlr.connect(slot2, params.number_ctrlr, "EVT_COMMAND_TEXT_ENTER", callback(slot6, nil, CoreEWS))

	slot9 = "update_slider_from_number"

	params.number_ctrlr.connect(slot2, params.number_ctrlr, "EVT_KILL_FOCUS", callback(params, nil, CoreEWS))

	slot9 = "update_number_from_slider"

	params.slider_ctrlr.connect(slot2, params.slider_ctrlr, "EVT_SCROLL_CHANGED", callback(params, nil, CoreEWS))

	slot9 = "update_number_from_slider"
	slot6 = params

	params.slider_ctrlr.connect(slot2, params.slider_ctrlr, "EVT_SCROLL_THUMBTRACK", callback(params, nil, CoreEWS))

	slot4 = "HORIZONTAL"
	local ctrl_sizer2 = EWS.BoxSizer(slot2, EWS)
	slot8 = "ALIGN_CENTER_VERTICAL"

	ctrl_sizer2.add(EWS, ctrl_sizer2, params.slider_ctrlr, params.slider_ctrlr_proportions, 0)

	slot8 = "EXPAND"

	ctrl_sizer2.add(EWS, ctrl_sizer2, params.number_ctrlr, params.number_ctrlr_proportions, 0)

	slot8 = "EXPAND"

	params.ctrl_sizer.add(EWS, params.ctrl_sizer, ctrl_sizer2, params.ctrlr_proportions, 0)

	slot8 = "EXPAND"

	params.sizer.add(EWS, params.sizer, params.ctrl_sizer, 0, 0)

	return params
end
CoreEWS._ctrlr_tooltip = function (params)
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
CoreEWS._slider_ctrlr = function (params)
	slot9 = ""
	params.slider_ctrlr = EWS.Slider(slot2, EWS, params.panel, params.value * params.slider_multiplier, params.min * params.slider_multiplier, params.max * params.slider_multiplier, "")
	slot4 = params.tooltip

	params.slider_ctrlr.set_tool_tip(slot2, params.slider_ctrlr)

	return 
end
CoreEWS._number_ctrlr = function (params)
	slot8 = params.value
	slot7 = "TE_PROCESS_ENTER"
	params.number_ctrlr = EWS.TextCtrl(slot2, EWS, params.panel, string.format(slot6, "%." .. params.floats .. "f"), "")
	slot4 = params.tooltip

	params.number_ctrlr.set_tool_tip(slot2, params.number_ctrlr)

	slot9 = "verify_number"

	params.number_ctrlr.connect(slot2, params.number_ctrlr, "EVT_CHAR", callback("", nil, _G))

	slot9 = "verify_entered_number"

	params.number_ctrlr.connect(slot2, params.number_ctrlr, "EVT_COMMAND_TEXT_ENTER", callback(params.number_ctrlr, nil, CoreEWS))

	slot9 = "verify_entered_number"
	slot6 = params

	params.number_ctrlr.connect(slot2, params.number_ctrlr, "EVT_KILL_FOCUS", callback(params, nil, CoreEWS))

	return 
end
CoreEWS._name_ctrlr = function (params)
	if params.name then
		slot7 = ""
		params.name_ctrlr = EWS.StaticText(slot2, EWS, params.panel, params.name, 0)
		slot7 = "ALIGN_CENTER_VERTICAL"

		params.ctrl_sizer.add(slot2, params.ctrl_sizer, params.name_ctrlr, params.name_proportions, 0)
	end

	return 
end
CoreEWS.verify_entered_number = function (params)
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
CoreEWS.update_slider_from_number = function (params)
	slot4 = params.value * params.slider_multiplier

	params.slider_ctrlr.set_value(slot2, params.slider_ctrlr)

	return 
end
CoreEWS.update_number_from_slider = function (params)
	slot3 = params.slider_ctrlr
	params.value = params.slider_ctrlr.get_value(slot2) / params.slider_multiplier
	slot4 = params.value

	CoreEWS.change_entered_number(params.slider_multiplier, params)

	return 
end
CoreEWS.CollapseBox = function (self, ...)
	slot3 = "CoreCollapseBox"
	slot6 = self

	return core_or_local(slot2, self._remove_self(slot5, ...))
end
CoreEWS.XMLTextCtrl = function (self, ...)
	slot3 = "XMLTextCtrl"
	slot6 = self

	return core_or_local(slot2, self._remove_self(slot5, ...))
end
CoreEWS._remove_self = function (self, ...)
	local params = {
		...
	}

	if 0 < #params and params[1] == CoreEWS then
		slot5 = 2
		params = {
			select(slot4, ...)
		}
	end

	slot4 = params

	return unpack(slot3)
end

return 
