-- Decompilation Error: self.ljd.ast.slotworks.eliminate_temporary(self.ast)

slot0 = core
slot2 = slot0
slot0 = slot0.module
slot3 = "CoreLuaProfilerTreeBox"

slot0(slot1, slot2)

slot0 = core
slot2 = slot0
slot0 = slot0.import
slot3 = "CoreClass"

slot0(slot1, slot2)

slot0 = core
slot2 = slot0
slot0 = slot0.import
slot3 = "CoreEvent"

slot0(slot1, slot2)

slot0 = core
slot2 = slot0
slot0 = slot0.import
slot3 = "CoreKeywordArguments"

slot0(slot1, slot2)

slot0 = CoreKeywordArguments
local parse_kwargs = slot0.parse_kwargs
slot1 = Vector3
slot3 = 1
slot4 = 1
slot5 = 1
local DEFAULT = slot1(slot2, slot3, slot4)
slot2 = Vector3
slot4 = 0.8
slot5 = 0.8
slot6 = 1
local HIGHLIGHTED = slot2(slot3, slot4, slot5)
local PERCENT = 0
local SECONDS = 1
local PLAIN = 2
local DEFAULT_FORMAT = PERCENT
local DEFAULT_INFOKEY = "total_time"
slot8 = LuaProfilerTreeBox

if not slot8 then
	slot8 = CoreClass
	slot8 = slot8.class
	slot8 = slot8()
end

LuaProfilerTreeBox = slot8
slot8 = LuaProfilerTreeBox

function slot9(self, ...)
	slot1 = CoreKeywordArguments
	slot1 = slot1.KeywordArguments
	slot3 = slot1
	slot1 = slot1.new
	local args = slot1(slot2, ...)
	slot4 = args
	slot2 = args.mandatory_object
	slot5 = "parent"
	slot2 = slot2(slot3, slot4)
	self._ews_parent = slot2
	slot4 = args
	slot2 = args.assert_all_consumed

	slot2(slot3)

	slot2 = nil
	self._lpd = slot2
	slot2 = EWS
	slot4 = slot2
	slot2 = slot2.Panel
	slot5 = self._ews_parent
	slot6 = ""
	slot7 = ""
	slot2 = slot2(slot3, slot4, slot5, slot6)
	self.panel = slot2
	slot2 = EWS
	slot4 = slot2
	slot2 = slot2.TreeCtrl
	slot5 = self.panel
	slot6 = ""
	slot7 = "TR_HAS_BUTTONS"
	slot2 = slot2(slot3, slot4, slot5, slot6)
	self._treectrl = slot2
	slot2 = DEFAULT_FORMAT
	self._displayformat = slot2
	slot2 = CoreEvent
	slot2 = slot2.callback
	slot4 = self
	slot5 = self
	slot6 = "_on_item_expanded"
	slot2 = slot2(slot3, slot4, slot5)
	self.__on_item_expanded_cb = slot2
	slot2 = self._treectrl
	slot4 = slot2
	slot2 = slot2.connect
	slot5 = "EVT_COMMAND_TREE_SEL_CHANGED"
	slot6 = CoreEvent
	slot6 = slot6.callback
	slot8 = self
	slot9 = self
	slot10 = "_on_select"

	slot2(slot3, slot4, slot6(slot7, slot8, slot9))

	slot2 = self._treectrl
	slot4 = slot2
	slot2 = slot2.connect
	slot5 = "EVT_COMMAND_TREE_ITEM_EXPANDED"
	slot6 = self.__on_item_expanded_cb

	slot2(slot3, slot4, slot5)

	slot2 = EWS
	slot4 = slot2
	slot2 = slot2.BoxSizer
	slot5 = "HORIZONTAL"
	slot2 = slot2(slot3, slot4)
	self.box_sizer = slot2
	slot2 = self.box_sizer
	slot4 = slot2
	slot2 = slot2.add
	slot5 = self._treectrl
	slot6 = 1
	slot7 = 1
	slot8 = "EXPAND"

	slot2(slot3, slot4, slot5, slot6, slot7)

	slot2 = self.panel
	slot4 = slot2
	slot2 = slot2.set_sizer
	slot5 = self.box_sizer

	slot2(slot3, slot4)

	return 
end

slot8.init = slot9
slot8 = LuaProfilerTreeBox

function slot9(self, ...)
	slot1 = parse_kwargs
	slot3 = {
		...
	}
	slot4 = "table:gridview"
	slot1 = slot1(slot2, slot3)
	self._gridview = slot1

	return 
end

slot8.set_gridview = slot9
slot8 = LuaProfilerTreeBox

function slot9(self)
	slot1 = nil
	self._lpd = slot1
	slot1 = self._treectrl
	slot3 = slot1
	slot1 = slot1.clear

	slot1(slot2)

	slot1 = self._treectrl
	slot3 = slot1
	slot1 = slot1.destroy

	slot1(slot2)

	slot1 = nil
	self._treectrl = slot1
	slot1 = nil
	self._gridview = slot1

	return 
end

slot8.destroy = slot9
slot8 = LuaProfilerTreeBox

function slot9(self, ...)
	slot1 = parse_kwargs
	slot3 = {
		...
	}
	slot4 = "userdata:lpd"
	slot5 = "number:displayformat"
	slot1, slot2 = slot1(slot2, slot3, slot4)
	self._displayformat = slot2
	self._lpd = slot1
	slot3 = self
	slot1 = self._redraw

	slot1(slot2)

	return 
end

slot8.set_profilerdata = slot9
slot8 = LuaProfilerTreeBox

function slot9(self, ...)
	slot1 = parse_kwargs
	slot3 = {
		...
	}
	slot4 = "number:displayformat"
	slot1 = slot1(slot2, slot3)
	self._displayformat = slot1
	slot1 = self._lpd

	if slot1 then
		function slot1(cnid)
			slot1 = self
			slot1 = slot1._lpd
			slot3 = slot1
			slot1 = slot1.cn_treenodeid
			slot4 = cnid
			slot1 = slot1(slot2, slot3)

			if slot1 ~= -1 then
				slot1 = self
				slot3 = slot1
				slot1 = slot1._makelabel
				slot4 = cnid
				local label = slot1(slot2, slot3)
				slot2 = self
				slot2 = slot2._lpd
				slot4 = slot2
				slot2 = slot2.cn_treenodeid
				slot5 = cnid
				local tnid = slot2(slot3, slot4)
				slot3 = self
				slot3 = slot3._treectrl
				slot5 = slot3
				slot3 = slot3.set_item_text
				slot6 = tnid
				slot7 = label

				slot3(slot4, slot5, slot6)

				slot3 = self
				slot3 = slot3._treectrl
				slot5 = slot3
				slot3 = slot3.set_item_text_colour
				slot6 = tnid
				slot7 = Vector3
				slot9 = 0
				slot10 = 0
				slot11 = 0

				slot3(slot4, slot5, slot7(slot8, slot9, slot10))

				slot3 = 0
				slot4 = self
				slot4 = slot4._lpd
				slot6 = slot4
				slot4 = slot4.cn_numchildren
				slot7 = cnid
				slot4 = slot4(slot5, slot6)
				slot4 = slot4 - 1
				slot5 = 1

				for i = slot3, slot4, slot5 do
					slot7 = relabel
					slot9 = self
					slot9 = slot9._lpd
					slot11 = slot9
					slot9 = slot9.cn_child
					slot12 = cnid
					slot13 = i

					slot7(slot9(slot10, slot11, slot12))
				end

				slot3 = 0
				slot4 = self
				slot4 = slot4._lpd
				slot6 = slot4
				slot4 = slot4.cn_numexpensivechildren
				slot7 = cnid
				slot4 = slot4(slot5, slot6)
				slot4 = slot4 - 1
				slot5 = 1

				for i = slot3, slot4, slot5 do
					slot7 = self
					slot7 = slot7._lpd
					slot9 = slot7
					slot7 = slot7.cn_expensivechild
					slot10 = cnid
					slot11 = i
					local echild = slot7(slot8, slot9, slot10)
					slot8 = self
					slot8 = slot8._lpd
					slot10 = slot8
					slot8 = slot8.cn_treenodeid
					slot11 = echild
					local tnid = slot8(slot9, slot10)

					if tnid ~= -1 then
						slot9 = self
						slot9 = slot9._treectrl
						slot11 = slot9
						slot9 = slot9.set_item_text_colour
						slot12 = tnid
						slot13 = Vector3
						slot15 = 1
						slot16 = 0
						slot17 = 0

						slot9(slot10, slot11, slot13(slot14, slot15, slot16))
					end
				end
			end

			return 
		end

		relabel = slot1
		slot1 = relabel
		slot3 = self._lpd
		slot5 = slot3
		slot3 = slot3.rootcallnode

		slot1(slot3(slot4))
	end

	return 
end

slot8.set_displayformat = slot9
slot8 = LuaProfilerTreeBox

function slot9(self)
	slot1 = self._lpd

	if slot1 then
		slot3 = self
		slot1 = self._clear

		slot1(slot2)

		slot3 = self
		slot1 = self._populate_rootnode

		slot1(slot2)

		slot3 = self
		slot1 = self._populate_plus2
		slot4 = self._lpd
		slot6 = slot4
		slot4 = slot4.rootcallnode

		slot1(slot2, slot4(slot5))

		slot1 = self._lpd
		slot3 = slot1
		slot1 = slot1.cn_treenodeid
		slot4 = self._lpd
		slot6 = slot4
		slot4 = slot4.rootcallnode
		local treenodeid = slot1(slot2, slot4(slot5))
		slot2 = self._treectrl
		slot4 = slot2
		slot2 = slot2.expand
		slot5 = treenodeid

		slot2(slot3, slot4)
	end

	return 
end

slot8._redraw = slot9
slot8 = LuaProfilerTreeBox

function slot9(self)
	local function clear_treenodeid(cnid)
		slot1 = self
		slot1 = slot1._lpd
		slot3 = slot1
		slot1 = slot1.cn_treenodeid
		slot4 = cnid
		slot1 = slot1(slot2, slot3)

		if slot1 ~= -1 then
			slot1 = self
			slot1 = slot1._lpd
			slot3 = slot1
			slot1 = slot1.cn_settreenodeid
			slot4 = cnid
			slot5 = -1

			slot1(slot2, slot3, slot4)

			slot1 = 0
			slot2 = self
			slot2 = slot2._lpd
			slot4 = slot2
			slot2 = slot2.cn_numchildren
			slot5 = cnid
			slot2 = slot2(slot3, slot4)
			slot2 = slot2 - 1
			slot3 = 1

			for i = slot1, slot2, slot3 do
				slot5 = clear_treenodeid
				slot7 = self
				slot7 = slot7._lpd
				slot9 = slot7
				slot7 = slot7.cn_child
				slot10 = cnid
				slot11 = i

				slot5(slot7(slot8, slot9, slot10))
			end
		end

		return 
	end

	slot2 = clear_treenodeid
	slot4 = self._lpd
	slot6 = slot4
	slot4 = slot4.rootcallnode

	slot2(slot4(slot5))

	slot2 = self._treectrl
	slot4 = slot2
	slot2 = slot2.clear

	slot2(slot3)

	return 
end

slot8._clear = slot9
slot8 = LuaProfilerTreeBox

function slot9(self)
	slot1 = self._lpd
	slot3 = slot1
	slot1 = slot1.rootcallnode
	local rnid = slot1(slot2)
	slot4 = self
	slot2 = self._makelabel
	slot5 = rnid
	local label = slot2(slot3, slot4)
	slot3 = self._treectrl
	slot5 = slot3
	slot3 = slot3.append_root
	slot6 = label
	local treerootid = slot3(slot4, slot5)
	slot4 = self._lpd
	slot6 = slot4
	slot4 = slot4.cn_settreenodeid
	slot7 = rnid
	slot8 = treerootid

	slot4(slot5, slot6, slot7)

	return 
end

slot8._populate_rootnode = slot9
slot8 = LuaProfilerTreeBox

function slot9(self, cnid, plus1)
	local populated_children = false
	slot4 = 0
	slot5 = self._lpd
	slot7 = slot5
	slot5 = slot5.cn_numchildren
	slot8 = cnid
	slot5 = slot5(slot6, slot7)
	slot5 = slot5 - 1
	slot6 = 1

	for i = slot4, slot5, slot6 do
		slot8 = self._lpd
		slot10 = slot8
		slot8 = slot8.cn_child
		slot11 = cnid
		slot12 = i
		local child_id = slot8(slot9, slot10, slot11)
		slot9 = self._lpd
		slot11 = slot9
		slot9 = slot9.cn_treenodeid
		slot12 = child_id
		slot9 = slot9(slot10, slot11)

		if slot9 == -1 then
			populated_children = true
			slot11 = self
			slot9 = self._makelabel
			slot12 = child_id
			local label = slot9(slot10, slot11)
			slot10 = self._treectrl
			slot12 = slot10
			slot10 = slot10.append
			slot13 = self._lpd
			slot15 = slot13
			slot13 = slot13.cn_treenodeid
			slot16 = cnid
			slot13 = slot13(slot14, slot15)
			slot14 = label
			local tnid = slot10(slot11, slot12, slot13)
			slot11 = self._lpd
			slot13 = slot11
			slot11 = slot11.cn_settreenodeid
			slot14 = child_id
			slot15 = tnid

			slot11(slot12, slot13, slot14)
		end

		if not plus1 then
			slot11 = self
			slot9 = self._populate_plus2
			slot12 = child_id
			slot13 = true

			slot9(slot10, slot11, slot12)
		end
	end

	if populated_children then
		slot4 = 0
		slot5 = self._lpd
		slot7 = slot5
		slot5 = slot5.cn_numexpensivechildren
		slot8 = cnid
		slot5 = slot5(slot6, slot7)
		slot5 = slot5 - 1
		slot6 = 1

		for i = slot4, slot5, slot6 do
			slot8 = self._lpd
			slot10 = slot8
			slot8 = slot8.cn_expensivechild
			slot11 = cnid
			slot12 = i
			local echild = slot8(slot9, slot10, slot11)
			slot9 = self._lpd
			slot11 = slot9
			slot9 = slot9.cn_treenodeid
			slot12 = echild
			local tnid = slot9(slot10, slot11)
			slot10 = self._treectrl
			slot12 = slot10
			slot10 = slot10.set_item_text_colour
			slot13 = tnid
			slot14 = Vector3
			slot16 = 1
			slot17 = 0
			slot18 = 0

			slot10(slot11, slot12, slot14(slot15, slot16, slot17))
		end
	end

	return 
end

slot8._populate_plus2 = slot9
slot8 = LuaProfilerTreeBox

function slot9(self, cnid)
	local nodes2expand = {}
	slot3 = self._lpd
	slot5 = slot3
	slot3 = slot3.rootcallnode
	slot3 = slot3(slot4)

	while cnid ~= slot3 do
		slot3 = self._lpd
		slot5 = slot3
		slot3 = slot3.cn_parent
		slot6 = cnid
		slot3 = slot3(slot4, slot5)
		cnid = slot3
		slot3 = table
		slot3 = slot3.insert
		slot5 = nodes2expand
		slot6 = cnid

		slot3(slot4, slot5)
	end

	slot3 = #nodes2expand
	slot4 = 1
	slot5 = -1

	for i = slot3, slot4, slot5 do
		slot9 = self
		slot7 = self._populate_plus2
		slot10 = nodes2expand[i]

		slot7(slot8, slot9)
	end

	return 
end

slot8._populate_path = slot9
slot8 = LuaProfilerTreeBox

function slot9(self, _, tree_event)
	slot5 = tree_event
	slot3 = tree_event.get_item
	local tnid = slot3(slot4)
	slot4 = self._lpd
	slot6 = slot4
	slot4 = slot4.find_callnode
	slot7 = tnid
	local cnid = slot4(slot5, slot6)
	slot7 = self
	slot5 = self._populate_plus2
	slot8 = cnid

	slot5(slot6, slot7)

	return 
end

slot8._on_item_expanded = slot9
slot8 = LuaProfilerTreeBox

function slot9(self, cnid)
	slot2 = self._lpd
	slot4 = slot2
	slot2 = slot2.frametime
	local frametime = slot2(slot3)
	local label = ""
	slot4 = self._lpd
	slot6 = slot4
	slot4 = slot4.rootcallnode
	slot4 = slot4(slot5)

	if cnid == slot4 then
		slot4 = self._displayformat
		slot5 = PERCENT

		if slot4 == slot5 then
			slot4 = label
			slot5 = string
			slot5 = slot5.format
			slot7 = "%6.2f%% LUA"
			slot8 = self._lpd
			slot10 = slot8
			slot8 = slot8.cn_value
			slot11 = cnid
			slot8 = slot8(slot9, slot10)
			slot8 = 100 * slot8
			slot8 = slot8 / frametime
			slot5 = slot5(slot6, slot7)
			label = slot4 .. slot5
		else
			slot4 = self._displayformat
			slot5 = SECONDS

			if slot4 == slot5 then
				slot4 = label
				slot5 = string
				slot5 = slot5.format
				slot7 = "%6.2fms LUA"
				slot8 = self._lpd
				slot10 = slot8
				slot8 = slot8.cn_value
				slot11 = cnid
				slot8 = slot8(slot9, slot10)
				slot8 = 1000 * slot8
				slot5 = slot5(slot6, slot7)
				label = slot4 .. slot5
			else
				slot4 = self._displayformat
				slot5 = PLAIN

				if slot4 == slot5 then
					slot4 = label
					slot5 = string
					slot5 = slot5.format
					slot7 = "LUA"
					slot5 = slot5(slot6)
					label = slot4 .. slot5
				end
			end
		end
	else
		slot4 = self._displayformat
		slot5 = PERCENT

		if slot4 == slot5 then
			slot4 = label
			slot5 = string
			slot5 = slot5.format
			slot7 = "%6.3f%%  "
			slot8 = self._lpd
			slot10 = slot8
			slot8 = slot8.cn_value
			slot11 = cnid
			slot8 = slot8(slot9, slot10)
			slot8 = 100 * slot8
			slot8 = slot8 / frametime
			slot5 = slot5(slot6, slot7)
			label = slot4 .. slot5
		else
			slot4 = self._displayformat
			slot5 = SECONDS

			if slot4 == slot5 then
				slot4 = label
				slot5 = string
				slot5 = slot5.format
				slot7 = "%6.3fms  "
				slot8 = self._lpd
				slot10 = slot8
				slot8 = slot8.cn_value
				slot11 = cnid
				slot8 = slot8(slot9, slot10)
				slot8 = 1000 * slot8
				slot5 = slot5(slot6, slot7)
				label = slot4 .. slot5
			else
				slot4 = self._displayformat
				slot5 = PLAIN

				if slot4 == slot5 then
					slot4 = label
					slot5 = string
					slot5 = slot5.format
					slot7 = "%s    "
					slot8 = self._lpd
					slot10 = slot8
					slot8 = slot8.cn_value
					slot11 = cnid
					slot5 = slot5(slot6, slot8(slot9, slot10))
					label = slot4 .. slot5
				end
			end
		end

		slot4 = self._lpd
		slot6 = slot4
		slot4 = slot4.cn_funcnode
		slot7 = cnid
		local fnid = slot4(slot5, slot6)
		slot5 = label
		slot6 = string
		slot6 = slot6.format
		slot8 = "%s (%s/%s)"
		slot9 = self._lpd
		slot11 = slot9
		slot9 = slot9.fn_func
		slot12 = fnid
		slot9 = slot9(slot10, slot11)
		slot10 = self._lpd
		slot12 = slot10
		slot10 = slot10.fn_file
		slot13 = fnid
		slot10 = slot10(slot11, slot12)
		slot11 = self._lpd
		slot13 = slot11
		slot11 = slot11.fn_line
		slot14 = fnid
		slot6 = slot6(slot7, slot8, slot9, slot11(slot12, slot13))
		label = slot5 .. slot6
		slot5 = self._lpd
		slot7 = slot5
		slot5 = slot5.cn_num_acc_nodes
		slot8 = cnid
		slot5 = slot5(slot6, slot7)
		slot6 = 1

		if slot6 < slot5 then
			slot5 = label
			slot6 = string
			slot6 = slot6.format
			slot8 = " x%d"
			slot9 = self._lpd
			slot11 = slot9
			slot9 = slot9.cn_num_acc_nodes
			slot12 = cnid
			slot6 = slot6(slot7, slot9(slot10, slot11))
			label = slot5 .. slot6
		end
	end

	return label
end

slot8._makelabel = slot9
slot8 = LuaProfilerTreeBox

function slot9(self, ...)
	slot1 = parse_kwargs
	slot3 = {
		...
	}
	slot4 = "number:fnid"
	local fnid = slot1(slot2, slot3)
	slot2 = self._treectrl
	slot4 = slot2
	slot2 = slot2.disconnect
	slot5 = "EVT_COMMAND_TREE_ITEM_EXPANDED"
	slot6 = self.__on_item_expanded_cb

	slot2(slot3, slot4, slot5)

	slot4 = self
	slot2 = self._collapse_all

	slot2(slot3)

	slot4 = self
	slot2 = self._clear_highlights

	slot2(slot3)

	slot2 = self._treectrl
	slot4 = slot2
	slot2 = slot2.unselect_all_items

	slot2(slot3)

	slot2 = 0
	slot3 = self._lpd
	slot5 = slot3
	slot3 = slot3.fn_numcallnodes
	slot6 = fnid
	slot3 = slot3(slot4, slot5)
	slot3 = slot3 - 1
	slot4 = 1

	for i = slot2, slot3, slot4 do
		slot8 = self
		slot6 = self._populate_path
		slot9 = self._lpd
		slot11 = slot9
		slot9 = slot9.fn_callnode
		slot12 = fnid
		slot13 = i

		slot6(slot7, slot9(slot10, slot11, slot12))
	end

	slot2 = 0
	slot3 = self._lpd
	slot5 = slot3
	slot3 = slot3.fn_numcallnodes
	slot6 = fnid
	slot3 = slot3(slot4, slot5)
	slot3 = slot3 - 1
	slot4 = 1

	for i = slot2, slot3, slot4 do
		slot8 = self
		slot6 = self._expand_path
		slot9 = self._lpd
		slot11 = slot9
		slot9 = slot9.fn_callnode
		slot12 = fnid
		slot13 = i

		slot6(slot7, slot9(slot10, slot11, slot12))

		slot8 = self
		slot6 = self._highlight_callnode
		slot9 = self._lpd
		slot11 = slot9
		slot9 = slot9.fn_callnode
		slot12 = fnid
		slot13 = i

		slot6(slot7, slot9(slot10, slot11, slot12))
	end

	slot2 = self._treectrl
	slot4 = slot2
	slot2 = slot2.connect
	slot5 = "EVT_COMMAND_TREE_ITEM_EXPANDED"
	slot6 = self.__on_item_expanded_cb

	slot2(slot3, slot4, slot5)

	return 
end

slot8.deselect_and_expand = slot9
slot8 = LuaProfilerTreeBox

function slot9(self)
	function slot1(cnid)
		slot1 = self
		slot1 = slot1._lpd
		slot3 = slot1
		slot1 = slot1.cn_treenodeid
		slot4 = cnid
		slot1 = slot1(slot2, slot3)
		tnid = slot1
		slot1 = tnid

		if slot1 ~= -1 then
			slot1 = self
			slot1 = slot1._treectrl
			slot3 = slot1
			slot1 = slot1.collapse
			slot4 = tnid

			slot1(slot2, slot3)

			slot1 = 0
			slot2 = self
			slot2 = slot2._lpd
			slot4 = slot2
			slot2 = slot2.cn_numchildren
			slot5 = cnid
			slot2 = slot2(slot3, slot4)
			slot2 = slot2 - 1
			slot3 = 1

			for i = slot1, slot2, slot3 do
				slot5 = self
				slot5 = slot5._lpd
				slot7 = slot5
				slot5 = slot5.cn_child
				slot8 = cnid
				slot9 = i
				local child_id = slot5(slot6, slot7, slot8)
				slot6 = collapse
				slot8 = child_id

				slot6(slot7)
			end
		end

		return 
	end

	collapse = slot1
	slot1 = collapse
	slot3 = self._lpd
	slot5 = slot3
	slot3 = slot3.rootcallnode

	slot1(slot3(slot4))

	return 
end

slot8._collapse_all = slot9
slot8 = LuaProfilerTreeBox

function slot9(self, cnid)
	slot2 = self._lpd
	slot4 = slot2
	slot2 = slot2.rootcallnode
	slot2 = slot2(slot3)

	while cnid ~= slot2 do
		slot2 = self._lpd
		slot4 = slot2
		slot2 = slot2.cn_parent
		slot5 = cnid
		slot2 = slot2(slot3, slot4)
		cnid = slot2
		slot2 = self._treectrl
		slot4 = slot2
		slot2 = slot2.expand
		slot5 = self._lpd
		slot7 = slot5
		slot5 = slot5.cn_treenodeid
		slot8 = cnid

		slot2(slot3, slot5(slot6, slot7))
	end

	return 
end

slot8._expand_path = slot9
slot8 = LuaProfilerTreeBox

function slot9(self, ...)
	slot1 = parse_kwargs
	slot3 = {
		...
	}
	slot4 = "number:fnid"
	local fnid = slot1(slot2, slot3)
	slot2 = self._treectrl
	slot4 = slot2
	slot2 = slot2.unselect_all_items

	slot2(slot3)

	slot4 = self
	slot2 = self._highlight_funcnode
	slot5 = fnid

	slot2(slot3, slot4)

	return 
end

slot8.deselect_and_highlight = slot9
slot8 = LuaProfilerTreeBox

function slot9(self)
	function slot1(cnid)
		slot1 = self
		slot1 = slot1._lpd
		slot3 = slot1
		slot1 = slot1.cn_treenodeid
		slot4 = cnid
		local tnid = slot1(slot2, slot3)

		if tnid ~= -1 then
			slot2 = self
			slot2 = slot2._treectrl
			slot4 = slot2
			slot2 = slot2.set_item_background_colour
			slot5 = tnid
			slot6 = Vector3
			slot8 = 1
			slot9 = 1
			slot10 = 1

			slot2(slot3, slot4, slot6(slot7, slot8, slot9))

			slot2 = 0
			slot3 = self
			slot3 = slot3._lpd
			slot5 = slot3
			slot3 = slot3.cn_numchildren
			slot6 = cnid
			slot3 = slot3(slot4, slot5)
			slot3 = slot3 - 1
			slot4 = 1

			for i = slot2, slot3, slot4 do
				slot6 = self
				slot6 = slot6._lpd
				slot8 = slot6
				slot6 = slot6.cn_child
				slot9 = cnid
				slot10 = i
				local child_id = slot6(slot7, slot8, slot9)
				slot7 = clear_highlight
				slot9 = child_id

				slot7(slot8)
			end
		end

		return 
	end

	clear_highlight = slot1
	slot1 = clear_highlight
	slot3 = self._lpd
	slot5 = slot3
	slot3 = slot3.rootcallnode

	slot1(slot3(slot4))

	return 
end

slot8._clear_highlights = slot9
slot8 = LuaProfilerTreeBox

function slot9(self, fnid)
	slot4 = self
	slot2 = self._clear_highlights

	slot2(slot3)

	slot2 = 0
	slot3 = self._lpd
	slot5 = slot3
	slot3 = slot3.fn_numcallnodes
	slot6 = fnid
	slot3 = slot3(slot4, slot5)
	slot3 = slot3 - 1
	slot4 = 1

	for i = slot2, slot3, slot4 do
		slot6 = self._lpd
		slot8 = slot6
		slot6 = slot6.fn_callnode
		slot9 = fnid
		slot10 = i
		local cnid = slot6(slot7, slot8, slot9)
		slot9 = self
		slot7 = self._highlight_callnode
		slot10 = cnid

		slot7(slot8, slot9)
	end

	return 
end

slot8._highlight_funcnode = slot9
slot8 = LuaProfilerTreeBox

function slot9(self, cnid)
	slot2 = self._lpd
	slot4 = slot2
	slot2 = slot2.cn_treenodeid
	slot5 = cnid
	local tnid = slot2(slot3, slot4)

	if tnid ~= -1 then
		slot3 = self._treectrl
		slot5 = slot3
		slot3 = slot3.set_item_background_colour
		slot6 = tnid
		slot7 = HIGHLIGHTED

		slot3(slot4, slot5, slot6)
	end

	return 
end

slot8._highlight_callnode = slot9
slot8 = LuaProfilerTreeBox

function slot9(self)
	slot1 = self._treectrl
	slot3 = slot1
	slot1 = slot1.selected_item
	local tnid = slot1(slot2)

	if tnid ~= -1 then
		slot2 = self._lpd
		slot4 = slot2
		slot2 = slot2.find_callnode
		slot5 = tnid
		local cnid = slot2(slot3, slot4)
		slot3 = self._lpd
		slot5 = slot3
		slot3 = slot3.cn_funcnode
		slot6 = cnid
		local fnid = slot3(slot4, slot5)
		slot6 = self
		slot4 = self._highlight_funcnode
		slot7 = fnid

		slot4(slot5, slot6)

		slot4 = self._gridview
		slot6 = slot4
		slot4 = slot4.deselect_and_highlight
		slot7 = {
			fnid = fnid
		}

		slot4(slot5, slot6)
	end

	return 
end

slot8._on_select = slot9

return 
