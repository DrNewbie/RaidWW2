-- Decompilation Error: self.ljd.ast.slotworks.eliminate_temporary(self.ast)

-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreInteractionEditorSystem"

core.module(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

slot3 = "CoreCode"

core.import(slot1, core)

slot3 = "CoreScriptGraph"

core.import(slot1, core)

slot3 = "CoreInteractionEditorConfig"

core.import(slot1, core)

slot3 = "CoreInteractionEditorSystemEvents"

core.import(slot1, core)

new_counter = new_counter or 1
node_id = node_id or 1
slot0 = InteractionEditorSystem

if not slot0 then
	slot0 = CoreClass
	slot0 = slot0.class
	slot2 = CoreInteractionEditorSystemEvents
	slot2 = slot2.InteractionEditorSystemEvents
	slot0 = slot0(slot1)
end

InteractionEditorSystem = slot0
slot0 = InteractionEditorSystem

function slot1(self, ui, path)

	-- Decompilation error in this vicinity:
	self._ui = ui
	self._path = path
	self._node_id_map = {}
	self._pattern_data = {}
	self._is_new = path == nil
	self._caption = slot3
	slot3 = CoreInteractionEditorSystemEvents
	slot3 = slot3.InteractionEditorSystemEvents
	slot3 = slot3.setup_stack
	slot5 = self
	slot3 = slot3(slot4)
	self._op_stack = slot3
	slot5 = ui
	slot3 = ui.create_nb_page
	slot6 = self._caption
	slot7 = true
	slot3, slot4 = slot3(slot4, slot5, slot6)
	self._id = slot4
	self._panel = slot3
	slot3 = EWS
	slot5 = slot3
	slot3 = slot3.BoxSizer
	slot6 = "VERTICAL"
	local main_box = slot3(slot4, slot5)
	slot4 = CoreScriptGraph
	slot4 = slot4.ScriptGraph
	slot6 = slot4
	slot4 = slot4.new
	slot7 = self._panel
	slot8 = ""
	slot9 = "FLOW"
	slot4 = slot4(slot5, slot6, slot7, slot8)
	self._graph = slot4
	slot4 = self._graph
	slot6 = slot4
	slot4 = slot4.connect
	slot7 = ""
	slot8 = "EVT_NODE_DELETE"
	slot9 = callback
	slot11 = self
	slot12 = self
	slot13 = "on_delete_node"
	slot9 = slot9(slot10, slot11, slot12)
	slot10 = nil

	slot4(slot5, slot6, slot7, slot8, slot9)

	slot4 = self._graph
	slot6 = slot4
	slot4 = slot4.connect
	slot7 = ""
	slot8 = "EVT_NODE_SELECTED"
	slot9 = callback
	slot11 = self
	slot12 = self
	slot13 = "on_select_node"
	slot9 = slot9(slot10, slot11, slot12)
	slot10 = nil

	slot4(slot5, slot6, slot7, slot8, slot9)

	slot4 = self._graph
	slot6 = slot4
	slot4 = slot4.connect
	slot7 = ""
	slot8 = "EVT_NODE_CONNECT"
	slot9 = callback
	slot11 = self
	slot12 = self
	slot13 = "on_connect_node"
	slot9 = slot9(slot10, slot11, slot12)
	slot10 = nil

	slot4(slot5, slot6, slot7, slot8, slot9)

	slot4 = self._graph
	slot6 = slot4
	slot4 = slot4.connect
	slot7 = ""
	slot8 = "EVT_NODE_DISCONNECT"
	slot9 = callback
	slot11 = self
	slot12 = self
	slot13 = "on_disconnect_node"
	slot9 = slot9(slot10, slot11, slot12)
	slot10 = nil

	slot4(slot5, slot6, slot7, slot8, slot9)

	slot6 = ui
	slot4 = ui.create_graph_context_menu
	slot7 = self
	slot4 = slot4(slot5, slot6)
	self._context_menu = slot4
	slot6 = main_box
	slot4 = main_box.add
	slot7 = self._graph
	slot9 = slot7
	slot7 = slot7.window
	slot7 = slot7(slot8)
	slot8 = 1
	slot9 = 0
	slot10 = "EXPAND"

	slot4(slot5, slot6, slot7, slot8, slot9)

	slot4 = InteractionDescription
	slot4 = slot4()
	self._desc = slot4
	slot4 = self._panel
	slot6 = slot4
	slot4 = slot4.set_sizer
	slot7 = main_box

	slot4(slot5, slot6)

	slot4 = new_counter
	slot4 = slot4 + 1
	new_counter = slot4
	slot6 = self
	slot4 = self.activate

	slot4(slot5)

	return 
end

slot0.init = slot1
slot0 = InteractionEditorSystem

function slot1(self)
	slot1 = self._caption

	return slot1
end

slot0.caption = slot1
slot0 = InteractionEditorSystem

function slot1(self)
	slot1 = self._desc

	return slot1
end

slot0.desc = slot1
slot0 = InteractionEditorSystem

function slot1(self)
	slot1 = self._ui

	return slot1
end

slot0.ui = slot1
slot0 = InteractionEditorSystem

function slot1(self)
	slot1 = self._is_new

	return slot1
end

slot0.is_new = slot1
slot0 = InteractionEditorSystem

function slot1(self)
	slot1 = self._path

	return slot1
end

slot0.path = slot1
slot0 = InteractionEditorSystem

function slot1(self, t, dt)
	slot3 = self._active

	if slot3 then
		slot3 = self._graph

		if slot3 then
			slot3 = self._graph
			slot5 = slot3
			slot3 = slot3.update
			slot6 = t
			slot7 = dt

			slot3(slot4, slot5, slot6)
		end
	end

	return 
end

slot0.update = slot1
slot0 = InteractionEditorSystem

function slot1(self)
	slot1 = self._graph

	return slot1
end

slot0.graph = slot1
slot0 = InteractionEditorSystem

function slot1(self, id)
	slot2 = self._node_id_map
	slot2 = slot2[id]

	return slot2
end

slot0.graph_node = slot1
slot0 = InteractionEditorSystem

function slot1(self)
	slot1 = self._graph
	slot3 = slot1
	slot1 = slot1.selected_nodes

	return slot1(slot2)
end

slot0.selected_nodes = slot1
slot0 = InteractionEditorSystem

function slot1(self, node, pat, ptype, name, full_name)
	local nd = self._pattern_data[node] or {}
	slot7 = full_name
	slot8 = " - "
	slot9 = ptype
	local key = slot7 .. slot8 .. slot9
	slot8 = assert
	slot10 = nd[key]
	slot10 = not slot10

	slot8(slot9)

	slot8 = {
		node,
		pat,
		ptype,
		name,
		full_name
	}
	nd[key] = slot8
	slot8 = self._pattern_data
	slot8[node] = nd

	return 
end

slot0.add_pattern_data = slot1
slot0 = InteractionEditorSystem

function slot1(self, node, full_name_and_type)
	slot3 = unpack
	slot5 = assert
	slot7 = self._pattern_data
	slot7 = slot7[node]
	slot5 = slot5(slot6)
	slot5 = slot5[full_name_and_type]

	return slot3(slot4)
end

slot0.pattern_data = slot1
slot0 = InteractionEditorSystem

function slot1(self, node, full_name_and_type)
	slot3 = assert
	slot5 = self._pattern_data
	slot5 = slot5[node]
	slot3 = slot3(slot4)
	slot4 = nil
	slot3[full_name_and_type] = slot4

	return 
end

slot0.remove_pattern_data = slot1
slot0 = InteractionEditorSystem

function slot1(self, node_type, skip_stack)
	slot3 = node_type
	slot4 = tostring
	slot6 = node_id
	slot4 = slot4(slot5)
	local id = slot3 .. slot4
	slot4 = assert
	slot6 = self._desc
	slot8 = slot6
	slot6 = slot6.node_add
	slot9 = id
	slot10 = node_type

	slot4(slot6(slot7, slot8, slot9))

	slot4 = EWS
	slot6 = slot4
	slot4 = slot4.FlowNode
	slot7 = node_type
	slot8 = self._desc
	slot10 = slot8
	slot8 = slot8.node_inputs
	slot11 = id
	slot8 = slot8(slot9, slot10)
	slot9 = self._desc
	slot11 = slot9
	slot9 = slot9.node_outputs
	slot12 = id
	slot9 = slot9(slot10, slot11)
	slot10 = 0
	slot11 = 0
	local node = slot4(slot5, slot6, slot7, slot8, slot9, slot10)
	slot7 = node
	slot5 = node.set_metadata
	slot8 = id

	slot5(slot6, slot7)

	slot5 = self._graph
	slot7 = slot5
	slot5 = slot5.add_node
	slot8 = node

	slot5(slot6, slot7)

	slot5 = self._node_id_map
	slot5[id] = node
	slot5 = node_id
	slot5 = slot5 + 1
	node_id = slot5
	slot7 = self
	slot5 = self.set_node_colors
	slot8 = node
	slot9 = id

	slot5(slot6, slot7, slot8)

	if not skip_stack then
	end

	return 
end

slot0.add_node = slot1
slot0 = InteractionEditorSystem

function slot1(self, node, skip_stack)
	slot5 = node
	slot3 = node.metadata
	local id = slot3(slot4)
	slot4 = assert
	slot6 = self._desc
	slot8 = slot6
	slot6 = slot6.node_remove
	slot9 = id

	slot4(slot6(slot7, slot8))

	slot4 = self._node_id_map
	slot5 = nil
	slot4[id] = slot5

	if not skip_stack then
	end

	return 
end

slot0.remove_node = slot1
slot0 = InteractionEditorSystem

function slot1(self)
	slot1 = self._panel

	return slot1
end

slot0.panel = slot1
slot0 = InteractionEditorSystem

function slot1(self)
	slot1 = self._context_menu

	return slot1
end

slot0.context_menu = slot1
slot0 = InteractionEditorSystem

function slot1(self)
	slot3 = self
	slot1 = self.deactivate

	slot1(slot2)

	slot1 = self._panel
	slot3 = slot1
	slot1 = slot1.destroy_children

	slot1(slot2)

	slot1 = self._ui
	slot3 = slot1
	slot1 = slot1.destroy_nb_page
	slot4 = self._ui
	slot6 = slot4
	slot4 = slot4.get_nb_page_by_caption
	slot7 = self._caption

	slot1(slot2, slot4(slot5, slot6))

	slot1 = nil
	self._graph = slot1

	return 
end

slot0.close = slot1
slot0 = InteractionEditorSystem

function slot1(self)
	slot1 = self._active

	return slot1
end

slot0.active = slot1
slot0 = InteractionEditorSystem

function slot1(self)
	slot4 = not self._is_new and self._path

	self._ui.set_title(slot2, self._ui)

	slot3 = self._ui
	slot1 = self._ui.set_save_close_option_enabled
	slot4 = true

	slot1(slot2, slot3)

	slot1 = self._graph
	slot3 = slot1
	slot1 = slot1.selected_nodes
	local selected = slot1(slot2)
	slot2 = #selected

	if slot2 == 1 then
		slot2 = self._ui
		slot4 = slot2
		slot2 = slot2.rebuild_prop_panel
		slot5 = self._desc
		slot6 = selected[1]
		slot8 = slot6
		slot6 = slot6.metadata

		slot2(slot3, slot4, slot6(slot7))
	end

	slot2 = true
	self._active = slot2

	return 
end

slot0.activate = slot1
slot0 = InteractionEditorSystem

function slot1(self)
	slot1 = self._ui
	slot3 = slot1
	slot1 = slot1.set_title

	slot1(slot2)

	slot1 = self._ui
	slot3 = slot1
	slot1 = slot1.set_save_close_option_enabled
	slot4 = false

	slot1(slot2, slot3)

	slot1 = self._ui
	slot3 = slot1
	slot1 = slot1.clean_prop_panel

	slot1(slot2)

	slot1 = false
	self._active = slot1

	return 
end

slot0.deactivate = slot1
slot0 = InteractionEditorSystem

function slot1(self, path)
	slot2 = Node
	slot4 = "graph_metadata"
	local md_node = slot2(slot3)
	slot5 = md_node
	slot3 = md_node.add_child
	slot6 = self._desc
	slot8 = slot6
	slot6 = slot6.to_xml

	slot3(slot4, slot6(slot7))

	slot5 = md_node
	slot3 = md_node.make_child
	slot6 = "patterns"
	local pat_node = slot3(slot4, slot5)
	slot6 = self
	slot4 = self._save_patterns
	slot7 = self._pattern_data
	slot8 = pat_node

	slot4(slot5, slot6, slot7)

	slot4 = self._graph
	slot6 = slot4
	slot4 = slot4.set_graph_metadata
	slot7 = md_node

	slot4(slot5, slot6)

	slot4 = managers
	slot4 = slot4.database
	slot6 = slot4
	slot4 = slot4.save_node
	slot7 = assert
	slot9 = self._graph
	slot11 = slot9
	slot9 = slot9.save
	slot12 = self._node_id_map
	slot7 = slot7(slot9(slot10, slot11))
	slot8 = path

	slot4(slot5, slot6, slot7)

	slot4 = false
	self._is_new = slot4
	self._path = path
	slot4 = self._ui
	slot6 = slot4
	slot4 = slot4.get_nb_page_by_caption
	slot7 = self._caption
	local page_id = slot4(slot5, slot6)
	slot5 = managers
	slot5 = slot5.database
	slot7 = slot5
	slot5 = slot5.entry_name
	slot8 = path
	slot5 = slot5(slot6, slot7)
	self._caption = slot5
	slot5 = self._ui
	slot7 = slot5
	slot5 = slot5.set_title
	slot8 = self._path

	slot5(slot6, slot7)

	slot5 = self._ui
	slot7 = slot5
	slot5 = slot5.update_nb_page_caption
	slot8 = page_id
	slot9 = self._caption

	slot5(slot6, slot7, slot8)

	slot5 = self._op_stack
	slot7 = slot5
	slot5 = slot5.mark_save

	slot5(slot6)

	return 
end

slot0.save = slot1
slot0 = InteractionEditorSystem

function slot1(self)
	slot1 = self._op_stack
	slot3 = slot1
	slot1 = slot1.undo

	slot1(slot2)

	return 
end

slot0.undo = slot1
slot0 = InteractionEditorSystem

function slot1(self)
	slot1 = self._op_stack
	slot3 = slot1
	slot1 = slot1.redo

	slot1(slot2)

	return 
end

slot0.redo = slot1
slot0 = InteractionEditorSystem

function slot1(self)
	slot1 = self._op_stack
	slot3 = slot1
	slot1 = slot1.has_unsaved_changes

	return slot1(slot2)
end

slot0.has_unsaved_changes = slot1
slot0 = InteractionEditorSystem

function slot1(self, node, id)
	slot3 = ipairs
	slot5 = self._desc
	slot7 = slot5
	slot5 = slot5.node_inputs
	slot8 = id
	slot3, slot4, slot5 = slot3(slot5(slot6, slot7))

	for _, trans in slot3, slot4, slot5 do
		slot8 = assert
		slot12 = self
		slot10 = self._slot_color
		slot13 = self._desc
		slot15 = slot13
		slot13 = slot13.transput_type
		slot16 = id
		slot17 = trans
		local color = slot8(slot10(slot11, slot13(slot14, slot15, slot16)))
		slot11 = node
		slot9 = node.set_input_colour
		slot12 = trans
		slot13 = color.r
		slot14 = color.g
		slot15 = color.b

		slot9(slot10, slot11, slot12, slot13, slot14)
	end

	slot3 = ipairs
	slot5 = self._desc
	slot7 = slot5
	slot5 = slot5.node_outputs
	slot8 = id
	slot3, slot4, slot5 = slot3(slot5(slot6, slot7))

	for _, trans in slot3, slot4, slot5 do
		slot8 = assert
		slot12 = self
		slot10 = self._slot_color
		slot13 = self._desc
		slot15 = slot13
		slot13 = slot13.transput_type
		slot16 = id
		slot17 = trans
		local color = slot8(slot10(slot11, slot13(slot14, slot15, slot16)))
		slot11 = node
		slot9 = node.set_output_colour
		slot12 = trans
		slot13 = color.r
		slot14 = color.g
		slot15 = color.b

		slot9(slot10, slot11, slot12, slot13, slot14)
	end

	return 
end

slot0.set_node_colors = slot1
slot0 = InteractionEditorSystem

function slot1(self, t)
	slot2 = ipairs
	slot4 = CoreInteractionEditorConfig
	slot4 = slot4.NODE_TYPES
	slot2, slot3, slot4 = slot2(slot3)

	for i, v in slot2, slot3, slot4 do
		if v == t then
			slot7 = CoreInteractionEditorConfig
			slot7 = slot7.NODE_COLORS
			slot7 = slot7[i]

			return slot7
		end
	end

	return 
end

slot0._slot_color = slot1
slot0 = InteractionEditorSystem

function slot1(self, pattern_data, cfg_node)
	slot3 = pairs
	slot5 = pattern_data
	slot3, slot4, slot5 = slot3(slot4)

	for node, data in slot3, slot4, slot5 do
		slot8 = pairs
		slot10 = data
		slot8, slot9, slot10 = slot8(slot9)

		for _, params in slot8, slot9, slot10 do
			slot15 = cfg_node
			slot13 = cfg_node.make_child
			slot16 = "instance"
			local inst = slot13(slot14, slot15)
			slot16 = inst
			slot14 = inst.set_parameter
			slot17 = "node"
			slot18 = node

			slot14(slot15, slot16, slot17)

			slot16 = inst
			slot14 = inst.set_parameter
			slot17 = "pat"
			slot18 = params[2]

			slot14(slot15, slot16, slot17)

			slot16 = inst
			slot14 = inst.set_parameter
			slot17 = "ptype"
			slot18 = params[3]

			slot14(slot15, slot16, slot17)

			slot16 = inst
			slot14 = inst.set_parameter
			slot17 = "name"
			slot18 = params[4]

			slot14(slot15, slot16, slot17)

			slot16 = inst
			slot14 = inst.set_parameter
			slot17 = "full_name"
			slot18 = params[5]

			slot14(slot15, slot16, slot17)
		end
	end

	return 
end

slot0._save_patterns = slot1
slot0 = InteractionEditorSystem

function slot1(self, desc, pattern_data, cfg_node)
	slot6 = cfg_node
	slot4 = cfg_node.children
	slot4, slot5, slot6 = slot4(slot5)

	for inst in slot4, slot5, slot6 do
		slot10 = inst
		slot8 = inst.parameter
		slot11 = "node"
		local node = slot8(slot9, slot10)
		slot11 = inst
		slot9 = inst.parameter
		slot12 = "pat"
		local pat = slot9(slot10, slot11)
		slot12 = inst
		slot10 = inst.parameter
		slot13 = "ptype"
		local ptype = slot10(slot11, slot12)
		slot13 = inst
		slot11 = inst.parameter
		slot14 = "name"
		local name = slot11(slot12, slot13)
		slot14 = inst
		slot12 = inst.parameter
		slot15 = "full_name"
		local full_name = slot12(slot13, slot14)
		slot15 = self
		slot13 = self.add_pattern_data
		slot16 = node
		slot17 = pat
		slot18 = ptype
		slot19 = name
		slot20 = full_name

		slot13(slot14, slot15, slot16, slot17, slot18, slot19)
	end

	return 
end

slot0._load_patterns = slot1

return 
