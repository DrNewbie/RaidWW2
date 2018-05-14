slot3 = "CoreInteractionEditorSystemEvents"

core.module(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

slot3 = "CoreCode"

core.import(slot1, core)

slot3 = "CoreInteractionEditorOpStack"

core.import(slot1, core)

InteractionEditorSystemEvents = InteractionEditorSystemEvents or CoreClass.class()
function InteractionEditorSystemEvents:setup_stack()
	slot3 = CoreInteractionEditorOpStack.InteractionEditorOpStack
	local stack = CoreInteractionEditorOpStack.InteractionEditorOpStack.new(slot2)

	return stack
end
function InteractionEditorSystemEvents:undo_add_node(node_id, node_type)
	return 
end
function InteractionEditorSystemEvents:redo_add_node(node_id, node_type)
	return 
end
function InteractionEditorSystemEvents:undo_remove_node(node_id)
	return 
end
function InteractionEditorSystemEvents:redo_remove_node(node_id)
	return 
end
function InteractionEditorSystemEvents:on_delete_node(data, event)
	slot5 = self
	slot8 = event

	self.remove_node(slot4, event.node(slot7))

	slot5 = event

	event.skip(slot4)

	return 
end
function InteractionEditorSystemEvents:on_select_node(data, event)
	slot5 = self
	slot5 = self.ui(slot4)

	self.ui(slot4).clean_prop_panel(slot4)

	slot5 = event
	local nodes = event.selected_nodes(slot4)

	if #nodes == 1 then
		slot6 = self
		slot7 = self.desc(slot8)
		slot10 = nodes[1]

		self.ui(slot5).rebuild_prop_panel(slot5, self.ui(slot5), nodes[1].metadata(self))
	end

	slot6 = event

	event.skip(slot5)

	return 
end
function InteractionEditorSystemEvents:on_connect_node(data, event)
	slot5 = event
	local md_src = event.source(slot4).metadata(slot4)
	local output = event.outslot(event.source(slot4))
	slot7 = event
	local md_dest = event.dest(event).metadata(event)
	local input = event.inslot(event.dest(event))
	slot10 = input ~= ""

	assert(event, md_src ~= "" and output ~= "" and md_dest ~= "")

	slot11 = output
	local src_type = self._desc.transput_type(event, self._desc, md_src)
	slot12 = input
	local dest_type = self._desc.transput_type(self._desc, self._desc, md_dest)

	if src_type == "undefined" or dest_type == "undefined" or src_type == dest_type then
		slot15 = input

		self._desc.transition_add(slot10, self._desc, md_src, output, md_dest)

		slot11 = event

		event.skip(slot10)
	end

	return 
end
function InteractionEditorSystemEvents:on_disconnect_node(data, event)
	slot5 = event
	local md_src = event.source(slot4).metadata(slot4)
	local output = event.outslot(event.source(slot4))
	slot7 = event
	local md_dest = event.dest(event).metadata(event)
	local input = event.inslot(event.dest(event))
	slot10 = input ~= ""

	assert(event, md_src ~= "" and output ~= "" and md_dest ~= "")

	slot13 = input

	self._desc.transition_remove(event, self._desc, md_src, output, md_dest)

	slot9 = event

	event.skip(event)

	return 
end

return 
