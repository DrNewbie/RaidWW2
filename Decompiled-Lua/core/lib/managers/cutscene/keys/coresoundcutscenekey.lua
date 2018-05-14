-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot2 = "core/lib/managers/cutscene/keys/CoreCutsceneKeyBase"

require(slot1)

if not CoreSoundCutsceneKey then
	slot2 = CoreCutsceneKeyBase
	slot0 = class(slot1)
end

CoreSoundCutsceneKey = slot0
CoreSoundCutsceneKey.ELEMENT_NAME = "sound"
CoreSoundCutsceneKey.NAME = "Sound"
slot4 = ""

CoreSoundCutsceneKey.register_serialized_attribute("Sound", CoreSoundCutsceneKey, "bank")

slot4 = ""

CoreSoundCutsceneKey.register_serialized_attribute("Sound", CoreSoundCutsceneKey, "cue")

slot4 = ""

CoreSoundCutsceneKey.register_serialized_attribute("Sound", CoreSoundCutsceneKey, "unit_name")

slot4 = ""

CoreSoundCutsceneKey.register_serialized_attribute("Sound", CoreSoundCutsceneKey, "object_name")

slot5 = toboolean

CoreSoundCutsceneKey.register_serialized_attribute("Sound", CoreSoundCutsceneKey, "sync_to_video", false)

slot4 = "cue"

CoreSoundCutsceneKey.attribute_affects("Sound", CoreSoundCutsceneKey, "bank")

CoreSoundCutsceneKey.control_for_unit_name = CoreCutsceneKeyBase.standard_combo_box_control
CoreSoundCutsceneKey.control_for_object_name = CoreCutsceneKeyBase.standard_combo_box_control
CoreSoundCutsceneKey.control_for_bank = CoreCutsceneKeyBase.standard_combo_box_control
CoreSoundCutsceneKey.__tostring = function (self)
	slot4 = self
	slot6 = self
	slot8 = self

	return "Trigger sound \"" .. self.bank(slot3) .. "/" .. self.cue(slot5) .. "\" on \"" .. self.unit_name(slot7) .. "\"."
end
CoreSoundCutsceneKey.prime = function (self, player)
	slot4 = self
	slot4 = self.sound(slot3)

	self.sound(slot3).prime(slot3)

	return 
end
CoreSoundCutsceneKey.skip = function (self, player)
	slot4 = self

	self.stop(slot3)

	return 
end
CoreSoundCutsceneKey.can_evaluate_with_player = function (self, player)
	return true
end
CoreSoundCutsceneKey.play = function (self, player, undo, fast_forward)
	if undo then
		slot6 = self

		self.stop(slot5)
	elseif not fast_forward then
		slot6 = self

		if self.unit_name(slot5) ~= "" then
			slot6 = self

			if self.object_name(slot5) ~= "" then
				slot6 = self
				slot6 = self.sound(slot5)
				slot10 = self.unit_name(slot11)
				slot13 = self

				self.sound(slot5).set_output(slot5, self._unit_object(slot8, self, self.object_name(self)))
			end
		end

		slot6 = self

		self._trigger_sound(slot5)
	end

	return 
end
CoreSoundCutsceneKey.update = function (self, player, time)
	if self.is_in_cutscene_editor then
		slot7 = time

		self.handle_cutscene_editor_scrubbing(slot4, self, player)
	end

	return 
end
CoreSoundCutsceneKey.handle_cutscene_editor_scrubbing = function (self, player, time)
	if self._last_evaluated_time then
		if time == self._last_evaluated_time then
			self._stopped_frame_count = (self._stopped_frame_count or 0) + 1

			if 10 < self._stopped_frame_count then
				self._stopped_frame_count = nil
				slot5 = self

				self.stop(slot4)
			end
		else
			self._stopped_frame_count = nil

			if self._sound_abort_func == nil or time < self._last_evaluated_time or 1 < time - self._last_evaluated_time then
				slot6 = time

				self._trigger_sound(slot4, self)
			end
		end
	end

	self._last_evaluated_time = time

	return 
end
CoreSoundCutsceneKey.is_valid_unit_name = function (self, unit_name)
	if unit_name ~= nil and unit_name ~= "" then
		slot5 = unit_name
		slot2 = CoreCutsceneKeyBase.is_valid_unit_name(slot3, self)

		if CoreCutsceneKeyBase.is_valid_unit_name(slot3, self) then
			slot2 = false
		end
	else
		slot2 = true
	end

	return slot2
end
CoreSoundCutsceneKey.is_valid_object_name = function (self, object_name)
	if object_name ~= nil and object_name ~= "" then
		slot5 = object_name
		slot2 = CoreCutsceneKeyBase.is_valid_object_name(slot3, self)

		if CoreCutsceneKeyBase.is_valid_object_name(slot3, self) then
			slot2 = false
		end
	else
		slot2 = true
	end

	return slot2
end
CoreSoundCutsceneKey.is_valid_bank = function (self, bank)
	if bank then
		if bank ~= "" then
			slot6 = Sound
			slot5 = bank
			slot2 = table.contains(slot3, Sound.soundbanks(slot5))
		else
			slot2 = false

			if false then
				slot2 = true
			end
		end
	end

	return slot2
end
CoreSoundCutsceneKey.is_valid_cue = function (self, cue)
	if cue then
		slot4 = self
		slot7 = self

		if self.is_valid_bank(slot3, self.bank(slot6)) then
			slot7 = self

			return Sound.make_bank(slot3, Sound, self.bank(cue)) ~= nil
		end
	end
end
CoreSoundCutsceneKey.refresh_control_for_bank = function (self, control)

	-- Decompilation error in this vicinity:
	slot4 = control

	control.freeze(slot3)

	slot4 = control

	control.clear(slot3)

	slot4 = self
	local value = self.bank(slot3)
	slot7 = Sound

	for _, bank_name in ipairs(Sound.soundbanks(slot6)) do
		slot11 = bank_name

		control.append(slot9, control)

		if bank_name == value then
			slot11 = value

			control.set_value(slot9, control)
		end
	end

	slot5 = control

	control.thaw(slot4)

	return 
end
CoreSoundCutsceneKey.refresh_control_for_unit_name = function (self, control)
	slot5 = control

	CoreCutsceneKeyBase.refresh_control_for_unit_name(slot3, self)

	slot5 = ""

	control.append(slot3, control)

	slot4 = self

	if self.unit_name(slot3) == "" then
		slot5 = ""

		control.set_value(slot3, control)
	end

	return 
end
CoreSoundCutsceneKey.refresh_control_for_object_name = function (self, control)
	slot5 = control

	CoreCutsceneKeyBase.refresh_control_for_object_name(slot3, self)

	slot5 = ""

	control.append(slot3, control)

	slot4 = self

	if self.object_name(slot3) == "" then
		slot5 = ""

		control.set_value(slot3, control)
	end

	return 
end
CoreSoundCutsceneKey.on_attribute_before_changed = function (self, attribute_name, value, previous_value)
	if attribute_name ~= "sync_to_video" then
		slot6 = self

		self.stop(slot5)
	end

	return 
end
CoreSoundCutsceneKey.on_attribute_changed = function (self, attribute_name, value, previous_value)
	if attribute_name == "bank" or attribute_name == "cue" then
		self._sound = nil
		slot6 = self

		if self.is_valid(slot5) then
			slot6 = self

			self.prime(slot5)
		end
	end

	return 
end
CoreSoundCutsceneKey.sound = function (self)
	if self._sound == nil then
		slot9 = self
		slot7 = self
		slot9 = self
		slot4 = "Sound \"" .. self.bank(self.bank(slot7)) .. "/" .. self.cue(self) .. "\" not found."
		self._sound = assert(slot2, Sound.make_bank(slot4, Sound, self.cue(self)))
	end

	return self._sound
end
CoreSoundCutsceneKey.stop = function (self)
	if self._sound_abort_func then
		self._sound_abort_func()

		self._sound_abort_func = nil
	end

	self._last_evaluated_time = nil

	return 
end
CoreSoundCutsceneKey._trigger_sound = function (self, offset)
	slot4 = self

	self.stop(slot3)

	slot4 = self
	slot7 = self
	slot6 = offset or 0
	local instance = self.sound(slot3).play(slot3, self.sound(slot3), (self.sync_to_video(slot6) and "running_offset") or "offset")
	slot5 = instance

	if alive(slot4) then
		self._sound_abort_func = function ()
			slot2 = instance

			if alive(slot1) then
				slot2 = instance

				if instance.is_playing(slot1) then
					slot2 = instance

					instance.stop(slot1)
				end
			end

			return 
		end
	end

	return 
end

return 
