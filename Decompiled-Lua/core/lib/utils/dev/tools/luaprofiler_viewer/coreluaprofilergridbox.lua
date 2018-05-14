slot3 = "CoreLuaProfilerGridBox"

core.module(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

slot3 = "CoreEvent"

core.import(slot1, core)

slot3 = "CoreKeywordArguments"

core.import(slot1, core)

local parse_kwargs = CoreKeywordArguments.parse_kwargs
slot5 = 1
local DEFAULT = Vector3(core, 1, 1)
slot6 = 1
local HIGHLIGHTED = Vector3(1, 0.8, 0.8)
local PERCENT = 0
local SECONDS = 1
local PLAIN = 2
local DEFAULT_FORMAT = PERCENT
LuaProfilerGridBox = LuaProfilerGridBox or CoreClass.class()
function LuaProfilerGridBox:init(...)
	local args = CoreKeywordArguments.KeywordArguments.new(slot2, ...)
	slot5 = "parent"
	self._ews_parent = args.mandatory_object(CoreKeywordArguments.KeywordArguments, args)
	slot4 = args

	args.assert_all_consumed(CoreKeywordArguments.KeywordArguments)

	self._lpd = nil
	slot7 = ""
	self.panel = EWS.Panel(CoreKeywordArguments.KeywordArguments, EWS, self._ews_parent, "")
	self._listctrl = EWS.ListCtrl(CoreKeywordArguments.KeywordArguments, EWS, self.panel, "")
	self._item2fnid = {}
	self._baseheader = {
		"Func",
		"File",
		"Line",
		"Total time",
		"Local time",
		"Children time",
		"No. Calls",
		"No. Sub Calls"
	}
	self._sortcolumn = 1
	self._sortreverse = false
	self._displayformat = DEFAULT_FORMAT
	slot5 = "EVT_COMMAND_LIST_ITEM_SELECTED"
	slot10 = "_on_select"

	self._listctrl.connect(CoreKeywordArguments.KeywordArguments, self._listctrl, CoreEvent.callback("LC_REPORT,LC_SINGLE_SEL", self, self))

	slot5 = "EVT_COMMAND_LIST_ITEM_ACTIVATED"
	slot10 = "_on_activate"

	self._listctrl.connect(CoreKeywordArguments.KeywordArguments, self._listctrl, CoreEvent.callback("LC_REPORT,LC_SINGLE_SEL", self, self))

	slot5 = "EVT_COMMAND_LIST_COL_CLICK"
	slot10 = "_on_column"

	self._listctrl.connect(CoreKeywordArguments.KeywordArguments, self._listctrl, CoreEvent.callback("LC_REPORT,LC_SINGLE_SEL", self, self))

	slot5 = "HORIZONTAL"
	self.box_sizer = EWS.BoxSizer(CoreKeywordArguments.KeywordArguments, EWS)
	slot8 = "EXPAND"

	self.box_sizer.add(CoreKeywordArguments.KeywordArguments, self.box_sizer, self._listctrl, 1, 0)

	slot5 = self.box_sizer

	self.panel.set_sizer(CoreKeywordArguments.KeywordArguments, self.panel)

	return 
end
function LuaProfilerGridBox:set_treeview(...)
	slot4 = "table:treeview"
	self._treeview = parse_kwargs(slot2, {
		...
	})

	return 
end
function LuaProfilerGridBox:destroy()
	self._lpd = nil
	self._item2fnid = {}
	slot3 = self._listctrl

	self._listctrl.clear_all(slot2)

	slot3 = self._listctrl

	self._listctrl.destroy(slot2)

	self._listctrl = nil
	self._treeview = nil

	return 
end
function LuaProfilerGridBox:set_profilerdata(...)
	slot5 = "number:displayformat"
	self._lpd, self._displayformat = parse_kwargs(slot2, {
		...
	}, "userdata:lpd")
	self._highlightedfuncnode = nil
	self._item2fnid = {}
	slot4 = self._lpd

	for fnid = 0, self._lpd.numfuncnodes() - 1, 1 do
		slot8 = fnid

		table.insert(slot6, self._item2fnid)
	end

	slot3 = self._listctrl

	self._listctrl.clear_all(slot2)

	slot3 = self._baseheader

	for _, n in ipairs(slot2) do
		slot10 = ""

		self._listctrl.append_column(slot7, self._listctrl, n)
	end

	slot4 = self._lpd

	for i = 0, self._lpd.numheaders(slot3) - 1, 1 do
		slot8 = i
		local name = self._lpd.headername(slot6, self._lpd)
		slot12 = name
		slot10 = ""

		self._listctrl.append_column(self._lpd, self._listctrl, "Diff " .. string.capitalize(slot11))

		slot12 = name
		slot10 = ""

		self._listctrl.append_column(self._lpd, self._listctrl, "Peak " .. string.capitalize(slot11))
	end

	slot3 = self

	self._redraw(slot2)

	return 
end
function LuaProfilerGridBox:set_displayformat(...)
	slot4 = "number:displayformat"
	self._displayformat = parse_kwargs(slot2, {
		...
	})

	if self._lpd ~= nil then
		local frametime = self._lpd.frametime(slot2)
		slot4 = self._item2fnid

		for i, fnid in ipairs(self._lpd) do
			if self._displayformat ~= SECONDS then
				slot11 = 3
				slot18 = fnid
				slot15 = (100 * self._lpd.fn_total_time(slot16, self._lpd)) / frametime

				self._listctrl.set_item(slot8, self._listctrl, i - 1, string.format(slot13, "%6.3f %%"))

				slot11 = 4
				slot18 = fnid
				slot15 = (100 * self._lpd.fn_local_time(slot16, self._lpd)) / frametime

				self._listctrl.set_item(slot8, self._listctrl, i - 1, string.format(slot13, "%6.3f %%"))

				slot11 = 5
				slot18 = fnid
				slot15 = (100 * self._lpd.fn_children_time(slot16, self._lpd)) / frametime

				self._listctrl.set_item(slot8, self._listctrl, i - 1, string.format(slot13, "%6.3f %%"))
			else
				slot11 = 3
				slot18 = fnid
				slot15 = 1000 * self._lpd.fn_total_time(slot16, self._lpd)

				self._listctrl.set_item(slot8, self._listctrl, i - 1, string.format(slot13, "%8.3f ms"))

				slot11 = 4
				slot18 = fnid
				slot15 = 1000 * self._lpd.fn_local_time(slot16, self._lpd)

				self._listctrl.set_item(slot8, self._listctrl, i - 1, string.format(slot13, "%8.3f ms"))

				slot11 = 5
				slot18 = fnid
				slot15 = 1000 * self._lpd.fn_children_time(slot16, self._lpd)

				self._listctrl.set_item(slot8, self._listctrl, i - 1, string.format(slot13, "%8.3f ms"))
			end
		end
	end

	return 
end
function LuaProfilerGridBox:_redraw()
	if self._lpd ~= nil then
		slot3 = self

		self._sort_funcnodes(slot2)

		slot3 = self._listctrl

		self._listctrl.delete_all_items(slot2)

		local frametime = self._lpd.frametime(slot2)
		slot4 = self._item2fnid

		for i, fnid in ipairs(self._lpd) do
			slot10 = i - 1
			slot14 = fnid

			self._listctrl.insert_item(slot8, self._listctrl, self._lpd.fn_func(slot12, self._lpd))

			slot11 = 1
			slot15 = fnid

			self._listctrl.set_item(slot8, self._listctrl, i - 1, self._lpd.fn_file(self._lpd, self._lpd))

			slot11 = 2
			slot15 = fnid

			self._listctrl.set_item(slot8, self._listctrl, i - 1, self._lpd.fn_line(self._lpd, self._lpd))

			if self._displayformat ~= SECONDS then
				slot11 = 3
				slot18 = fnid
				slot15 = (100 * self._lpd.fn_total_time(slot16, self._lpd)) / frametime

				self._listctrl.set_item(slot8, self._listctrl, i - 1, string.format(slot13, "%6.3f %%"))

				slot11 = 4
				slot18 = fnid
				slot15 = (100 * self._lpd.fn_local_time(slot16, self._lpd)) / frametime

				self._listctrl.set_item(slot8, self._listctrl, i - 1, string.format(slot13, "%6.3f %%"))

				slot11 = 5
				slot18 = fnid
				slot15 = (100 * self._lpd.fn_children_time(slot16, self._lpd)) / frametime

				self._listctrl.set_item(slot8, self._listctrl, i - 1, string.format(slot13, "%6.3f %%"))
			else
				slot11 = 3
				slot18 = fnid
				slot15 = 1000 * self._lpd.fn_total_time(slot16, self._lpd)

				self._listctrl.set_item(slot8, self._listctrl, i - 1, string.format(slot13, "%8.3f ms"))

				slot11 = 4
				slot18 = fnid
				slot15 = 1000 * self._lpd.fn_local_time(slot16, self._lpd)

				self._listctrl.set_item(slot8, self._listctrl, i - 1, string.format(slot13, "%8.3f ms"))

				slot11 = 5
				slot18 = fnid
				slot15 = 1000 * self._lpd.fn_children_time(slot16, self._lpd)

				self._listctrl.set_item(slot8, self._listctrl, i - 1, string.format(slot13, "%8.3f ms"))
			end

			slot11 = 6
			slot15 = fnid

			self._listctrl.set_item(slot8, self._listctrl, i - 1, self._lpd.fn_num_calls(slot13, self._lpd))

			slot11 = 7
			slot15 = fnid

			self._listctrl.set_item(slot8, self._listctrl, i - 1, self._lpd.fn_num_sub_calls(slot13, self._lpd))

			local j = 8
			slot11 = self._lpd

			for k = 0, self._lpd.numheaders(i - 1) - 1, 1 do
				slot16 = j
				slot19 = "%s"
				slot24 = k

				self._listctrl.set_item(slot13, self._listctrl, i - 1, string.format(slot18, self._lpd.fn_diff(slot21, self._lpd, fnid)))

				slot16 = j + 1
				slot19 = "%s"
				slot24 = k

				self._listctrl.set_item(slot13, self._listctrl, i - 1, string.format(slot18, self._lpd.fn_peak(slot21, self._lpd, fnid)))

				j = j + 2
			end
		end

		if self._highlightedfuncnode then
			slot5 = self._highlightedfuncnode

			self._highlight(slot3, self)
		end
	end

	return 
end
function LuaProfilerGridBox:_sort_funcnodes()
	local convert = nil

	if self._sortcolumn == 1 then
		function convert(fnid)
			slot6 = fnid

			return string.lower(self._lpd.fn_func(slot4, self._lpd))
		end
	elseif self._sortcolumn == 2 then
		function convert(fnid)
			slot6 = fnid

			return string.lower(self._lpd.fn_file(slot4, self._lpd))
		end
	elseif self._sortcolumn == 3 then
		function convert(fnid)
			slot6 = fnid

			return tonumber(self._lpd.fn_line(slot4, self._lpd))
		end
	elseif self._sortcolumn == 4 then
		function convert(fnid)
			slot4 = fnid

			return self._lpd.fn_total_time(slot2, self._lpd)
		end
	elseif self._sortcolumn == 5 then
		function convert(fnid)
			slot4 = fnid

			return self._lpd.fn_local_time(slot2, self._lpd)
		end
	elseif self._sortcolumn == 6 then
		function convert(fnid)
			slot4 = fnid

			return self._lpd.fn_children_time(slot2, self._lpd)
		end
	elseif self._sortcolumn == 7 then
		function convert(fnid)
			slot4 = fnid

			return self._lpd.fn_num_calls(slot2, self._lpd)
		end
	elseif self._sortcolumn == 8 then
		function convert(fnid)
			slot4 = fnid

			return self._lpd.fn_num_sub_calls(slot2, self._lpd)
		end
	else
		local i = self._sortcolumn - 9
		slot5 = i / 2
		local index = math.floor(slot4)

		if i % 2 == 0 then
			function convert(fnid)
				slot5 = index

				return self._lpd.fn_diff(slot2, self._lpd, fnid)
			end
		else
			function convert(fnid)
				slot5 = index

				return self._lpd.fn_peak(slot2, self._lpd, fnid)
			end
		end
	end

	function sort(fn1, fn2)
		if self._sortreverse then
			slot5 = fn2

			return convert(fn1) < convert(slot3)
		else
			slot5 = fn2

			return convert(slot3) < convert(fn1)
		end

		return 
	end

	slot5 = sort

	table.sort(slot3, self._item2fnid)

	return 
end
function LuaProfilerGridBox:deselect_and_highlight(...)
	slot4 = "number:fnid"
	local fnid = parse_kwargs(slot2, {
		...
	})
	slot7 = self._listctrl

	self._listctrl.set_item_selected(, self._listctrl, self._listctrl.selected_item(false))

	slot5 = fnid

	self._highlight(, self)

	return 
end
function LuaProfilerGridBox:_highlight(fnid)
	self._highlightedfuncnode = fnid
	slot4 = self._item2fnid

	for i, fnid_ in ipairs(slot3) do
		if fnid_ == fnid then
			slot11 = HIGHLIGHTED

			self._listctrl.set_item_background_colour(slot8, self._listctrl, i - 1)
		else
			slot11 = DEFAULT

			self._listctrl.set_item_background_colour(slot8, self._listctrl, i - 1)
		end
	end

	return 
end
function LuaProfilerGridBox:_on_select()
	local i = self._listctrl.selected_item(slot2)
	slot5 = {
		fnid = self._item2fnid[i + 1]
	}

	self._treeview.deselect_and_highlight(self._listctrl, self._treeview)

	slot5 = self._item2fnid[i + 1]

	self._highlight(self._listctrl, self)

	return 
end
function LuaProfilerGridBox:_on_activate()
	local i = self._listctrl.selected_item(slot2)
	slot5 = {
		fnid = self._item2fnid[i + 1]
	}

	self._treeview.deselect_and_expand(self._listctrl, self._treeview)

	return 
end
function LuaProfilerGridBox:_on_column(id, f)
	slot5 = f
	local column = f.get_column(slot4) + 1

	if column == self._sortcolumn then
		self._sortreverse = not self._sortreverse
	else
		self._sortcolumn = column
		self._sortreverse = false
	end

	slot6 = self

	self._redraw(slot5)

	return 
end

return 
