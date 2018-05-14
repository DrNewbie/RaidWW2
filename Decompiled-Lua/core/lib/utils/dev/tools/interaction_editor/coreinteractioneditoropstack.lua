slot3 = "CoreInteractionEditorOpStack"

core.module(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

slot3 = "CoreCode"

core.import(slot1, core)

InteractionEditorOpStack = InteractionEditorOpStack or CoreClass.class()
function InteractionEditorOpStack:init()
	self._stack = {}
	self._redo_stack = {}
	self._ops = {
		save = {
			name = "save"
		}
	}

	return 
end
function InteractionEditorOpStack:has_unsaved_changes()
	local size = #self._stack

	return 0 < size and self._stack[size].op.name ~= "save"
end
function InteractionEditorOpStack:new_op_type(name, undo_cb, redo_cb)
	self._ops[name] = {
		name = name,
		undo_cb = undo_cb,
		redo_cb = redo_cb
	}

	return 
end
function InteractionEditorOpStack:mark_save()
	slot4 = "save"

	self.new_op(slot2, self)

	return 
end
function InteractionEditorOpStack:new_op(name, ...)
	slot5 = {
		op = assert(slot7),
		params = {
			...
		}
	}
	slot8 = self._ops[name]

	table.insert(slot3, self._stack)

	self._redo_stack = {}

	return 
end
function InteractionEditorOpStack:undo()
	local size = #self._stack

	if 0 < size then
		local op_data = self._stack[size]
		slot6 = op_data

		table.insert(slot4, self._redo_stack)

		slot6 = size

		table.remove(slot4, self._stack)

		if op_data.op.name ~= "save" then
			slot5 = op.params

			op_data.op.undo_cb(slot4)
		else
			slot5 = self

			self.undo(slot4)
		end
	end

	return 
end
function InteractionEditorOpStack:redo()
	local size = #self._redo_stack

	if 0 < size then
		local op_data = self._redo_stack[size]
		slot6 = op_data

		table.insert(slot4, self._stack)

		slot6 = size

		table.remove(slot4, self._redo_stack)

		if op_data.op.name ~= "save" then
			slot5 = op.params

			op_data.op.redo_cb(slot4)
		else
			slot5 = self

			self.redo(slot4)
		end
	end

	return 
end

return 
