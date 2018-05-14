-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot2 = "core/lib/managers/cutscene/keys/CoreCutsceneKeyBase"

require(slot1)

if not CoreSequenceCutsceneKey then
	slot2 = CoreCutsceneKeyBase
	slot0 = class(slot1)
end

CoreSequenceCutsceneKey = slot0
CoreSequenceCutsceneKey.ELEMENT_NAME = "sequence"
CoreSequenceCutsceneKey.NAME = "Sequence"
slot4 = ""

CoreSequenceCutsceneKey.register_serialized_attribute("Sequence", CoreSequenceCutsceneKey, "unit_name")

slot4 = ""

CoreSequenceCutsceneKey.register_serialized_attribute("Sequence", CoreSequenceCutsceneKey, "name")

slot4 = "name"

CoreSequenceCutsceneKey.attribute_affects("Sequence", CoreSequenceCutsceneKey, "unit_name")

CoreSequenceCutsceneKey.control_for_name = CoreCutsceneKeyBase.standard_combo_box_control
function CoreSequenceCutsceneKey:__tostring()
	slot4 = self
	slot6 = self

	return "Trigger sequence \"" .. self.name(slot3) .. "\" on \"" .. self.unit_name(slot5) .. "\"."
end
function CoreSequenceCutsceneKey:evaluate(player, fast_forward)
	slot8 = self
	slot5 = self._unit_extension(slot4, self, self.unit_name(slot7))
	slot8 = self

	self._unit_extension(slot4, self, self.unit_name(slot7)).run_sequence_simple(slot4, self.name("damage"))

	return 
end
function CoreSequenceCutsceneKey:revert(player)
	slot8 = self
	slot5 = "undo_" .. self.name(slot7)

	self._run_sequence_if_exists(slot3, self)

	return 
end
function CoreSequenceCutsceneKey:skip(player)
	slot8 = self
	slot5 = "skip_" .. self.name(slot7)

	self._run_sequence_if_exists(slot3, self)

	return 
end
function CoreSequenceCutsceneKey:is_valid_unit_name(unit_name)
	slot5 = unit_name

	if not self.super.is_valid_unit_name(slot3, self) then
		return false
	end

	slot6 = true
	local unit = self._unit(slot3, self, unit_name)

	if unit ~= nil then
		slot6 = unit_name
		slot3 = managers.sequence.has(slot4, managers.sequence)
	else
		slot3 = false

		if false then
			slot3 = true
		end
	end

	return slot3
end
function CoreSequenceCutsceneKey:is_valid_name(name)
	slot7 = self
	slot6 = true
	local unit = self._unit(slot3, self, self.unit_name(slot6))

	if unit ~= nil then
		slot6 = "undo_"
	else
		slot3 = false

		if false then
			slot3 = true
		end
	end

	return slot3
end
function CoreSequenceCutsceneKey:refresh_control_for_name(control)

	-- Decompilation error in this vicinity:
	slot4 = control

	control.freeze(slot3)

	slot4 = control

	control.clear(slot3)

	slot7 = self
	slot6 = true
	local unit = self._unit(slot3, self, self.unit_name(slot6))
	slot6 = control

	control.thaw(slot5)

	return 
end
function CoreSequenceCutsceneKey:_run_sequence_if_exists(sequence_name)
	local unit = self._unit(slot3, self.unit_name(slot6))
	slot8 = self
	slot7 = sequence_name

	if managers.sequence.has_sequence_name(self, managers.sequence, self.unit_name(self)) then
		slot8 = self
		slot7 = "damage"
		slot6 = sequence_name

		self._unit_extension(slot4, self, self.unit_name(slot7)).run_sequence_simple(slot4, self._unit_extension(slot4, self, self.unit_name(slot7)))
	end

	return 
end

return 
