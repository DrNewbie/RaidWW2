-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot2 = "core/lib/managers/cutscene/keys/CoreCutsceneKeyBase"

require(slot1)

slot3 = "CoreEngineAccess"

core.import(slot1, core)

if not CoreVisualFXCutsceneKey then
	slot2 = CoreCutsceneKeyBase
	slot0 = class(slot1)
end

CoreVisualFXCutsceneKey = slot0
CoreVisualFXCutsceneKey.ELEMENT_NAME = "visual_fx"
CoreVisualFXCutsceneKey.NAME = "Visual Effect"
slot4 = ""

CoreVisualFXCutsceneKey.register_serialized_attribute("Visual Effect", CoreVisualFXCutsceneKey, "unit_name")

slot4 = ""

CoreVisualFXCutsceneKey.register_serialized_attribute("Visual Effect", CoreVisualFXCutsceneKey, "object_name")

slot4 = ""

CoreVisualFXCutsceneKey.register_serialized_attribute("Visual Effect", CoreVisualFXCutsceneKey, "effect")
CoreVisualFXCutsceneKey.register_serialized_attribute("Visual Effect", CoreVisualFXCutsceneKey, "duration", nil)

slot8 = 0
slot5 = CoreCutsceneKeyBase.string_to_vector

CoreVisualFXCutsceneKey.register_serialized_attribute("Visual Effect", CoreVisualFXCutsceneKey, "offset", Vector3(tonumber, 0, 0))

slot5 = CoreCutsceneKeyBase.string_to_rotation

CoreVisualFXCutsceneKey.register_serialized_attribute("Visual Effect", CoreVisualFXCutsceneKey, "rotation", Rotation())

slot5 = toboolean

CoreVisualFXCutsceneKey.register_serialized_attribute("Visual Effect", CoreVisualFXCutsceneKey, "force_synch", false)

CoreVisualFXCutsceneKey.control_for_effect = CoreCutsceneKeyBase.standard_combo_box_control
CoreVisualFXCutsceneKey.__tostring = function (self)
	slot4 = self
	slot6 = self
	slot8 = self

	return "Trigger visual effect \"" .. self.effect(slot3) .. "\" on \"" .. self.object_name(slot5) .. " in " .. self.unit_name(slot7) .. "\"."
end
CoreVisualFXCutsceneKey.can_evaluate_with_player = function (self, player)
	return true
end
CoreVisualFXCutsceneKey.prime = function (self, player)
	return 
end
CoreVisualFXCutsceneKey.unload = function (self, player)
	slot4 = self

	self.stop(slot3)

	return 
end
CoreVisualFXCutsceneKey.play = function (self, player, undo, fast_forward)
	if undo then
		slot6 = self

		self.stop(slot5)
	elseif not fast_forward then
		slot6 = self

		self.stop(slot5)

		slot7 = player

		self.prime(slot5, self)

		local effect_manager = World.effect_manager(slot5)
		slot10 = true
		local parent_object = self._unit_object(World, self, self.unit_name(slot9), self.object_name(self))
		slot9 = {
			effect = self.effect(self),
			parent = parent_object,
			position = self.offset(self),
			rotation = self.rotation(self),
			force_synch = self.force_synch(self)
		}
		slot12 = self
		slot12 = self
		slot12 = self
		slot12 = self
		local effect_id = effect_manager.spawn(self, effect_manager)
		self._effect_abort_func = function ()
			slot3 = effect_id

			effect_manager.kill(slot1, effect_manager)

			return 
		end
	end

	return 
end
CoreVisualFXCutsceneKey.update = function (self, player, time)
	slot5 = self

	if self.duration(slot4) then
		slot5 = self

		if self.duration(slot4) < time then
			slot5 = self

			self.stop(slot4)
		end
	end

	return 
end
CoreVisualFXCutsceneKey.is_valid_unit_name = function (self, value)
	if value ~= nil and value ~= "" then
		slot5 = value
		slot2 = CoreCutsceneKeyBase.is_valid_unit_name(slot3, self)

		if CoreCutsceneKeyBase.is_valid_unit_name(slot3, self) then
			slot2 = false
		end
	else
		slot2 = true
	end

	return slot2
end
CoreVisualFXCutsceneKey.is_valid_object_name = function (self, value)
end
CoreVisualFXCutsceneKey.is_valid_effect = function (self, effect)
	slot6 = effect

	return DB.has(slot3, DB, "effect")
end
CoreVisualFXCutsceneKey.is_valid_duration = function (self, value)

	-- Decompilation error in this vicinity:
	return value == nil or 0 < value
end
CoreVisualFXCutsceneKey.is_valid_offset = function (self, value)
	return value ~= nil
end
CoreVisualFXCutsceneKey.is_valid_rotation = function (self, value)
	return value ~= nil
end
CoreVisualFXCutsceneKey.refresh_control_for_unit_name = function (self, control)
	slot5 = control
	slot8 = self

	self.super.refresh_control_for_unit_name(slot3, self, self.unit_name(slot7))

	slot5 = ""

	control.append(slot3, control)

	slot4 = self

	if self.unit_name(slot3) == "" then
		slot5 = ""

		control.set_value(slot3, control)
	end

	return 
end
CoreVisualFXCutsceneKey.refresh_control_for_object_name = function (self, control)

	-- Decompilation error in this vicinity:
	slot6 = self.unit_name(slot7)
	slot9 = self

	self.super.refresh_control_for_object_name(slot3, self, control, self.object_name(self))

	slot5 = ""

	control.append(slot3, control)

	slot4 = self
	slot7 = self
	slot5 = self.unit_name(slot6) ~= ""

	control.set_enabled(slot3, control)

	return 
end
CoreVisualFXCutsceneKey.refresh_control_for_effect = function (self, control)
	slot4 = control

	control.freeze(slot3)

	slot4 = control

	control.clear(slot3)

	slot4 = self
	local value = self.effect(slot3)
	slot8 = "effect"

	for _, name in ipairs(managers.database.list_entries_of_type(slot6, managers.database)) do
		slot11 = name

		control.append(slot9, control)

		if name == value then
			slot11 = value

			control.set_value(slot9, control)
		end
	end

	slot5 = control

	control.thaw(slot4)

	return 
end
CoreVisualFXCutsceneKey.on_attribute_before_changed = function (self, attribute_name, value, previous_value)
	slot6 = self

	self.stop(slot5)

	return 
end
CoreVisualFXCutsceneKey.stop = function (self)
	if self._effect_abort_func then
		self._effect_abort_func()

		self._effect_abort_func = nil
	end

	return 
end

return 
