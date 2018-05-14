-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot2 = "core/lib/managers/cutscene/keys/CoreCutsceneKeyBase"

require(slot1)

if not CoreVolumeSetCutsceneKey then
	slot2 = CoreCutsceneKeyBase
	slot0 = class(slot1)
end

CoreVolumeSetCutsceneKey = slot0
CoreVolumeSetCutsceneKey.ELEMENT_NAME = "volume_set"
CoreVolumeSetCutsceneKey.NAME = "Volume Set"
CoreVolumeSetCutsceneKey.VALID_ACTIONS = {
	"activate",
	"deactivate"
}
slot4 = "activate"

CoreVolumeSetCutsceneKey.register_serialized_attribute(, CoreVolumeSetCutsceneKey, "action")

slot4 = ""

CoreVolumeSetCutsceneKey.register_serialized_attribute(, CoreVolumeSetCutsceneKey, "name")

CoreVolumeSetCutsceneKey.control_for_action = CoreCutsceneKeyBase.standard_combo_box_control
CoreVolumeSetCutsceneKey.control_for_name = CoreCutsceneKeyBase.standard_combo_box_control
slot5 = CoreVolumeSetCutsceneKey.VALID_ACTIONS
CoreVolumeSetCutsceneKey.refresh_control_for_action = CoreCutsceneKeyBase.standard_combo_box_control_refresh(CoreVolumeSetCutsceneKey, CoreCutsceneKeyBase, "action")
function CoreVolumeSetCutsceneKey:__tostring()
	slot5 = self
	slot5 = self

	return string.capitalize(self.action(slot4)) .. " volume set \"" .. self.name(slot4) .. "\"."
end
function CoreVolumeSetCutsceneKey:unload(player)
	slot6 = true

	self.play(slot3, self, player)

	return 
end
function CoreVolumeSetCutsceneKey:play(player, undo, fast_forward)
	if managers.volume == nil then
		return 
	end

	if undo then
		slot7 = {
			name = self.name(slot9)
		}
		slot10 = self
		local preceeding_key = self.preceeding_key(slot5, self)
	else
		slot6 = self
		slot9 = self

		self._perform_action(slot5, self.action(slot8))
	end

	return 
end
function CoreVolumeSetCutsceneKey:inverse_action()
	slot3 = self

	return (self.action(slot2) == "activate" and "deactivate") or "activate"
end
function CoreVolumeSetCutsceneKey:_perform_action(action)
	if action == "deactivate" then
		slot4 = managers.volume
		slot7 = self
	elseif action == "activate" then
		slot4 = managers.volume
		slot7 = self

		if not managers.volume.is_active(slot3, self.name(slot6)) then
			slot4 = managers.volume
			slot7 = self

			managers.volume.activate_set(slot3, self.name(slot6))
		end
	end

	return 
end
function CoreVolumeSetCutsceneKey:is_valid_action(action)
	slot5 = action

	return table.contains(slot3, self.VALID_ACTIONS)
end
function CoreVolumeSetCutsceneKey:is_valid_name(name)
end
function CoreVolumeSetCutsceneKey:refresh_control_for_name(control)

	-- Decompilation error in this vicinity:
	slot4 = control

	control.freeze(slot3)

	slot4 = control

	control.clear(slot3)

	if managers.volume then
		slot4 = self
		local value = self.name(slot3)
		slot7 = managers.volume

		for _, entry in ipairs(managers.volume.volume_set_names(slot6)) do
			slot11 = entry

			control.append(slot9, control)

			if entry == value then
				slot11 = value

				control.set_value(slot9, control)
			end
		end
	end

	slot4 = control

	control.thaw(slot3)

	return 
end

return 
