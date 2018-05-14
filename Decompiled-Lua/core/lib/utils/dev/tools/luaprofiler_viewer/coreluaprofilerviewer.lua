slot3 = "CoreLuaProfilerViewer"

core.module(slot1, core)

slot3 = "CoreLuaProfilerTreeBox"

core.import(slot1, core)

slot3 = "CoreLuaProfilerGridBox"

core.import(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

slot3 = "CoreEvent"

core.import(slot1, core)

slot3 = "CoreDebug"

core.import(slot1, core)

slot3 = "CoreKeywordArguments"

core.import(slot1, core)

TOOLHUB_NAME = "Lua Profiler II"
local PERCENT = 0
local SECONDS = 1
local CUSTOM = 2
local DEFAULT_FORMAT = PERCENT
local DEFAULT_INFOKEY = "total_time"
LuaProfilerViewer = LuaProfilerViewer or CoreClass.class()
function LuaProfilerViewer:init()
	slot3 = EWS
	self._lpd = EWS.LuaProfilerDataStore(slot2)
	slot3 = self

	self._create_main_frame(slot2)

	return 
end
function LuaProfilerViewer:_create_main_frame()
	slot9 = 0
	slot10 = 0
	slot8 = Global.frame
	self._frame = EWS.Frame(slot2, EWS, TOOLHUB_NAME, Vector3(slot6, 100, 400), Vector3(100, 1500, 800), "FRAME_FLOAT_ON_PARENT,DEFAULT_FRAME_STYLE")
	slot4 = "VERTICAL"
	local frame_sizer = EWS.BoxSizer(slot2, EWS)
	slot7 = ""
	local splitter1 = EWS.SplitterWindow(EWS, EWS, self._frame, "")
	slot6 = self._frame

	self._create_menu(EWS, self)

	slot6 = {
		parent = splitter1
	}
	self._treeview = CoreLuaProfilerTreeBox.LuaProfilerTreeBox.new(EWS, CoreLuaProfilerTreeBox.LuaProfilerTreeBox)
	slot6 = {
		parent = splitter1
	}
	self._gridview = CoreLuaProfilerGridBox.LuaProfilerGridBox.new(EWS, CoreLuaProfilerGridBox.LuaProfilerGridBox)
	slot6 = {
		gridview = self._gridview
	}

	self._treeview.set_gridview(EWS, self._treeview)

	slot6 = {
		treeview = self._treeview
	}

	self._gridview.set_treeview(EWS, self._gridview)

	self._displayformat = DEFAULT_FORMAT
	self._capturecounter = 0
	slot7 = "_on_percent"
	self._on_percent_cb = CoreEvent.callback(EWS, self, self)
	slot7 = "_on_seconds"
	self._on_seconds_cb = CoreEvent.callback(EWS, self, self)
	slot7 = "_on_custom"
	self._on_custom_cb = CoreEvent.callback(EWS, self, self)
	slot7 = "_on_acc_calls"
	self._on_acc_calls_cb = CoreEvent.callback(EWS, self, self)
	slot7 = "_on_no_acc_calls"
	self._on_no_acc_calls_cb = CoreEvent.callback(EWS, self, self)
	slot8 = ""

	splitter1.split_vertically(EWS, splitter1, self._treeview.panel, self._gridview.panel)

	slot6 = 50

	splitter1.set_minimum_pane_size(EWS, splitter1)

	slot6 = 1

	splitter1.set_sash_gravity(EWS, splitter1)

	slot7 = true

	splitter1.set_sash_position(EWS, splitter1, 500)

	slot9 = "EXPAND"

	frame_sizer.add(EWS, frame_sizer, splitter1, 1, 0)

	slot6 = frame_sizer

	self._frame.set_sizer(EWS, self._frame)

	slot6 = true

	self._frame.set_visible(EWS, self._frame)

	slot5 = self

	self._redraw_menu(EWS)

	return 
end
function LuaProfilerViewer:_create_menu()
	slot4 = ""
	local file_menu = EWS.Menu(slot2, EWS)
	slot7 = ""

	file_menu.append_item(EWS, file_menu, "OPEN", "Open\tCtrl+O")

	slot7 = ""

	file_menu.append_item(EWS, file_menu, "EXIT", "Exit")

	slot5 = ""
	local view_menu = EWS.Menu(EWS, EWS)
	self._view_menu = view_menu
	self._view_menu_filled = false
	self._view_menu_connects = {}
	slot6 = ""
	local capt_menu = EWS.Menu(EWS, EWS)
	slot9 = ""

	capt_menu.append_item(EWS, capt_menu, "CAPTURE", "Capture Frame\tCtrl+F")

	local menu_bar = EWS.MenuBar(EWS)
	slot9 = "File"

	menu_bar.append(EWS, menu_bar, file_menu)

	slot9 = "View"

	menu_bar.append(EWS, menu_bar, view_menu)

	slot9 = "Capture"

	menu_bar.append(EWS, menu_bar, capt_menu)

	slot8 = menu_bar

	self._frame.set_menu_bar(EWS, self._frame)

	slot14 = "_on_open"

	self._frame.connect(EWS, self._frame, "OPEN", "EVT_COMMAND_MENU_SELECTED", CoreEvent.callback(slot11, self, self))

	slot14 = "_on_close"

	self._frame.connect(EWS, self._frame, "EXIT", "EVT_COMMAND_MENU_SELECTED", CoreEvent.callback("", self, self))

	slot14 = "_on_close"

	self._frame.connect(EWS, self._frame, "", "EVT_CLOSE_WINDOW", CoreEvent.callback("", self, self))

	slot14 = "_on_capture"
	slot11 = ""

	self._frame.connect(EWS, self._frame, "CAPTURE", "EVT_COMMAND_MENU_SELECTED", CoreEvent.callback("", self, self))

	return 
end
function LuaProfilerViewer:_redraw_menu()
	local lpd = self._lpd
	self._displayformat = PERCENT

	if self._view_menu_filled then
		slot7 = self._on_percent_cb

		self._frame.disconnect(slot3, self._frame, "PERCENT", "EVT_COMMAND_MENU_SELECTED")

		slot7 = self._on_seconds_cb

		self._frame.disconnect(slot3, self._frame, "SECONDS", "EVT_COMMAND_MENU_SELECTED")

		slot7 = self._on_acc_calls_cb

		self._frame.disconnect(slot3, self._frame, "ACC", "EVT_COMMAND_MENU_SELECTED")

		slot7 = self._on_no_acc_calls_cb

		self._frame.disconnect(slot3, self._frame, "NO_ACC", "EVT_COMMAND_MENU_SELECTED")

		slot4 = self._view_menu_connects

		for _, diffpeak in ipairs(slot3) do
			slot12 = self._on_custom_cb

			self._frame.disconnect(slot8, self._frame, diffpeak, "EVT_COMMAND_MENU_SELECTED")
		end

		self._view_menu_filled = false
		self._view_menu_connects = {}
		slot4 = self._view_menu

		self._view_menu.clear(slot3)
	end

	slot4 = self._view_menu

	self._view_menu.append_separator(slot3)

	slot7 = ""

	self._view_menu.append_radio_item(slot3, self._view_menu, "PERCENT", "Time in %\tCtrl+P")

	slot8 = ""

	self._frame.connect(slot3, self._frame, "PERCENT", "EVT_COMMAND_MENU_SELECTED", self._on_percent_cb)

	slot7 = ""

	self._view_menu.append_radio_item(slot3, self._view_menu, "SECONDS", "Time in ms\tCtrl+M")

	slot8 = ""

	self._frame.connect(slot3, self._frame, "SECONDS", "EVT_COMMAND_MENU_SELECTED", self._on_seconds_cb)

	slot5 = lpd

	for i = 0, lpd.numheaders(self._frame) - 1, 1 do
		slot11 = i
		local name = string.capitalize(lpd.headername(slot9, lpd))
		slot10 = i
		local diffpeak = string.format(lpd.headername, "%s:-1")
		slot13 = ""

		self._view_menu.append_radio_item("%s:-1", self._view_menu, diffpeak, "Diff " .. name)

		slot14 = diffpeak

		self._frame.connect("%s:-1", self._frame, diffpeak, "EVT_COMMAND_MENU_SELECTED", self._on_custom_cb)

		slot11 = diffpeak

		table.insert("%s:-1", self._view_menu_connects)

		slot11 = i
		local diffpeak = string.format("%s:-1", "-1:%s")
		slot14 = ""

		self._view_menu.append_radio_item("-1:%s", self._view_menu, diffpeak, "Peak " .. name)

		slot15 = diffpeak

		self._frame.connect("-1:%s", self._frame, diffpeak, "EVT_COMMAND_MENU_SELECTED", self._on_custom_cb)

		slot12 = diffpeak

		table.insert("-1:%s", self._view_menu_connects)
	end

	slot4 = self._view_menu

	self._view_menu.append_separator(slot3)

	slot7 = ""

	self._view_menu.append_radio_item(slot3, self._view_menu, "ACC", "Acc. and sort Calls")

	slot8 = ""

	self._frame.connect(slot3, self._frame, "ACC", "EVT_COMMAND_MENU_SELECTED", self._on_acc_calls_cb)

	slot7 = ""

	self._view_menu.append_radio_item(slot3, self._view_menu, "NO_ACC", "Keep Call order")

	slot8 = ""

	self._frame.connect(slot3, self._frame, "NO_ACC", "EVT_COMMAND_MENU_SELECTED", self._on_no_acc_calls_cb)

	self._view_menu_filled = true

	return 
end
function LuaProfilerViewer:close()
	if self._frame then
		slot3 = self._frame

		self._frame.destroy(slot2)
	end

	slot3 = self._treeview

	self._treeview.destroy(slot2)

	slot3 = self._gridview

	self._gridview.destroy(slot2)

	self._treeview = nil
	self._gridview = nil
	self._lpd = nil

	return 
end
function LuaProfilerViewer:set_position(newpos)
	if self._frame then
		slot5 = newpos

		self._frame.set_position(slot3, self._frame)
	end

	return 
end
function LuaProfilerViewer:update(t, dt)
	if self._capturecounter == 4 then
		slot6 = "luaprofiler dump"

		Application.console_command(slot4, Application)
	end

	if self._capturecounter == 1 then
		slot5 = self

		self._on_open(slot4)
	end

	if 0 < self._capturecounter then
		self._capturecounter = self._capturecounter - 1
	end

	return 
end
function LuaProfilerViewer:_on_close()
	slot4 = TOOLHUB_NAME

	managers.toolhub.close(slot2, managers.toolhub)

	return 
end
function LuaProfilerViewer:_on_open()
	slot8 = managers.database
	slot9 = ""
	local filedialog = EWS.FileDialog(slot2, EWS, self._frame, "Open 'luaprofiler dump_stat' File", managers.database.base_path(slot7), "", "*.pf")
	slot4 = filedialog

	filedialog.show_modal(EWS)

	local name = filedialog.get_filename(EWS)
	local path = filedialog.get_directory(filedialog)
	slot8 = name
	local filepath = string.format(filedialog, "%s\\%s", path)

	if name ~= "" then
		local lpd = EWS.LuaProfilerDataStore(slot6)
		slot9 = filepath
		local cause = lpd.parsefile(EWS, lpd)

		if cause == "" then
			self._lpd = lpd
			slot9 = self

			self._redraw_menu(slot8)

			slot10 = true

			self._lpd.buildstructure(slot8, self._lpd)

			slot10 = {
				lpd = self._lpd,
				displayformat = self._displayformat
			}

			self._treeview.set_profilerdata(slot8, self._treeview)

			slot10 = {
				lpd = self._lpd,
				displayformat = self._displayformat
			}

			self._gridview.set_profilerdata(slot8, self._gridview)
		else
			slot13 = ""
			slot9 = EWS.MessageDialog(slot8, EWS, self._frame, cause, "Loading Error")

			EWS.MessageDialog(slot8, EWS, self._frame, cause, "Loading Error").show_modal(slot8)
		end
	end

	return 
end
function LuaProfilerViewer:_on_percent()
	self._displayformat = PERCENT

	if self._lpd then
		slot5 = -1
		local calltree_modified = self._lpd.set_cn_key(slot2, self._lpd, -1)

		if calltree_modified then
			slot5 = {
				lpd = self._lpd,
				displayformat = self._displayformat
			}

			self._treeview.set_profilerdata(slot3, self._treeview)

			slot5 = {
				displayformat = self._displayformat
			}

			self._gridview.set_displayformat(slot3, self._gridview)
		else
			slot5 = {
				displayformat = self._displayformat
			}

			self._treeview.set_displayformat(slot3, self._treeview)

			slot5 = {
				displayformat = self._displayformat
			}

			self._gridview.set_displayformat(slot3, self._gridview)
		end
	end

	return 
end
function LuaProfilerViewer:_on_seconds()
	self._displayformat = SECONDS

	if self._lpd then
		slot5 = -1
		local calltree_modified = self._lpd.set_cn_key(slot2, self._lpd, -1)

		if calltree_modified then
			slot5 = {
				lpd = self._lpd,
				displayformat = self._displayformat
			}

			self._treeview.set_profilerdata(slot3, self._treeview)

			slot5 = {
				displayformat = self._displayformat
			}

			self._gridview.set_displayformat(slot3, self._gridview)
		else
			slot5 = {
				displayformat = self._displayformat
			}

			self._treeview.set_displayformat(slot3, self._treeview)

			slot5 = {
				displayformat = self._displayformat
			}

			self._gridview.set_displayformat(slot3, self._gridview)
		end
	end

	return 
end
function LuaProfilerViewer:_on_custom(diffpeak)
	self._displayformat = CUSTOM
	slot7 = ":"
	local diff = tonumber(slot3)
	slot8 = ":"
	local peak = tonumber(string.split(string.split(diffpeak, diffpeak)[2], diffpeak)[1])

	if self._lpd then
		slot8 = peak
		local calltree_modified = self._lpd.set_cn_key(slot5, self._lpd, diff)

		if calltree_modified then
			slot8 = {
				lpd = self._lpd,
				displayformat = self._displayformat
			}

			self._treeview.set_profilerdata(slot6, self._treeview)
		else
			slot8 = {
				displayformat = self._displayformat
			}

			self._treeview.set_displayformat(slot6, self._treeview)
		end
	end

	return 
end
function LuaProfilerViewer:_on_acc_calls()
	if self._lpd then
		slot4 = true

		self._lpd.buildstructure(slot2, self._lpd)

		slot4 = {
			lpd = self._lpd,
			displayformat = self._displayformat
		}

		self._treeview.set_profilerdata(slot2, self._treeview)

		slot4 = {
			lpd = self._lpd,
			displayformat = self._displayformat
		}

		self._gridview.set_profilerdata(slot2, self._gridview)
	end

	return 
end
function LuaProfilerViewer:_on_no_acc_calls()
	if self._lpd then
		slot4 = false

		self._lpd.buildstructure(slot2, self._lpd)

		slot4 = {
			lpd = self._lpd,
			displayformat = self._displayformat
		}

		self._treeview.set_profilerdata(slot2, self._treeview)

		slot4 = {
			lpd = self._lpd,
			displayformat = self._displayformat
		}

		self._gridview.set_profilerdata(slot2, self._gridview)
	end

	return 
end
function LuaProfilerViewer:_on_capture()
	self._capturecounter = 6

	return 
end

return 
