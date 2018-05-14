slot3 = "CoreInteractionEditor"

core.module(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

slot3 = "CoreCode"

core.import(slot1, core)

slot3 = "CoreInteractionEditorUI"

core.import(slot1, core)

slot3 = "CoreInteractionEditorUIEvents"

core.import(slot1, core)

slot3 = "CoreInteractionEditorSystem"

core.import(slot1, core)

if not InteractionEditor then
	slot2 = CoreInteractionEditorUIEvents.InteractionEditorUIEvents
	slot0 = CoreClass.class(slot1)
end

InteractionEditor = slot0
function InteractionEditor:init()
	slot4 = self
	self._ui = CoreInteractionEditorUI.InteractionEditorUI.new(slot2, CoreInteractionEditorUI.InteractionEditorUI)
	self._systems = {}

	return 
end
function InteractionEditor:set_position(pos)
	slot5 = pos

	self._ui.set_position(slot3, self._ui)

	return 
end
function InteractionEditor:update(t, dt)
	slot5 = self._systems

	for _, sys in pairs(slot4) do
		slot12 = dt

		sys.update(slot9, sys, t)
	end

	return 
end
function InteractionEditor:ui()
	return self._ui
end
function InteractionEditor:close()
	slot3 = self._systems

	for _, sys in pairs(slot2) do
		slot8 = sys

		sys.close(slot7)
	end

	self._system = nil
	slot3 = self._ui

	self._ui.destroy(slot2)

	return 
end
function InteractionEditor:open_system(path)
	slot4 = self._systems

	for _, sys in pairs(slot3) do
		slot9 = sys

		sys.deactivate(slot8)
	end

	slot6 = path
	local sys = CoreInteractionEditorSystem.InteractionEditorSystem.new(slot3, CoreInteractionEditorSystem.InteractionEditorSystem, self._ui)
	self._systems[sys] = sys

	return 
end
function InteractionEditor:save_system(sys, path)
	slot3 = assert

	if not sys then
		slot7 = self
		slot5 = self.active_system(slot6)
	end

	slot6 = path

	slot3(slot4).save(slot4, slot3(slot4))

	return 
end
function InteractionEditor:close_system(sys)
	if not sys then
		slot4 = self
		local system = self.active_system(slot3)
	end

	if system then
		slot5 = system

		if system.has_unsaved_changes(slot4) then
			slot5 = self._ui
			slot8 = system
			local res = self._ui.want_to_save(slot4, system.path(slot7))

			if res == "CANCEL" then
				return 
			elseif res == "YES" then
				slot7 = system

				self.do_save(slot5, self)
			end
		end

		slot5 = system

		system.close(slot4)

		slot5 = self._systems[system]

		assert(slot4)

		self._systems[system] = nil
	end

	return 
end
function InteractionEditor:active_system()
	slot3 = self._systems

	for _, sys in pairs(slot2) do
		slot8 = sys

		if sys.active(slot7) then
			return sys
		end
	end

	return 
end
function InteractionEditor:activate_system(panel)
	slot4 = self._systems

	for _, sys in pairs(slot3) do
		slot9 = sys

		sys.deactivate(slot8)
	end

	slot4 = self._systems

	for _, sys in pairs(slot3) do
		slot9 = sys

		if sys.panel(slot8) == panel then
			slot9 = sys

			sys.activate(slot8)

			return 
		end
	end

	return 
end
function InteractionEditor:do_save(sys)
	if not sys then
		slot4 = self
		local system = self.active_system(slot3)
	end

	if system then
		slot5 = system

		if system.is_new(slot4) then
			slot6 = system

			self.do_save_as(slot4, self)
		else
			slot6 = system
			slot9 = system

			self.save_system(slot4, self, system.path(slot8))
		end
	end

	return 
end
function InteractionEditor:do_save_as(sys)
	if not sys then
		slot4 = self
		local system = self.active_system(slot3)
	end

	if system then
		slot8 = self._ui
		slot8 = "*.interaction_project"
		slot14 = managers.database
		slot18 = system
		slot12 = managers.database.base_path(slot13) .. "/" .. string.lower(system.caption(slot17))
		local path, dir = managers.database.save_file_dialog(slot4, managers.database, self._ui.frame(slot7), true, managers.database.entry_name(slot10, managers.database))

		if path then
			slot9 = path

			self.save_system(slot6, self, system)
		end
	end

	return 
end
function InteractionEditor:do_save_all()
	slot3 = self._systems

	for _, system in pairs(slot2) do
		slot8 = system

		if system.is_new(slot7) then
			slot9 = system

			self.do_save_as(slot7, self)
		else
			slot9 = system
			slot12 = system

			self.save_system(slot7, self, system.path(slot11))
		end
	end

	return 
end
function InteractionEditor:undo(sys)
	if not sys then
		slot4 = self
		local system = self.active_system(slot3)
	end

	if system then
		slot5 = system

		system.undo(slot4)
	end

	return 
end
function InteractionEditor:redo(sys)
	if not sys then
		slot4 = self
		local system = self.active_system(slot3)
	end

	if system then
		slot5 = system

		system.redo(slot4)
	end

	return 
end

return 
