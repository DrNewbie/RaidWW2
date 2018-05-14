-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not CharacterCustomizationFps then
	slot2 = CharacterCustomization
	slot0 = class(slot1)
end

CharacterCustomizationFps = slot0
function CharacterCustomizationFps:init(unit)
	self._unit = unit

	return 
end
function CharacterCustomizationFps:attach_fps_hands(character_nationality_name, equiped_upper_name, customization_version)
	slot10 = customization_version

	Application.trace(slot5, Application, "[CharacterCustomizationFps:attach_fps_hands] character_nationality_name, equiped_upper_name, customization_version ", character_nationality_name, equiped_upper_name)

	slot9 = character_nationality_name
	local upper_name = managers.character_customization.check_part_key_name(slot5, managers.character_customization, CharacterCustomizationTweakData.PART_TYPE_UPPER, equiped_upper_name)
	slot8 = CharacterCustomizationTweakData.PART_TYPE_UPPER
	local upper_data = managers.character_customization.get_all_parts(managers.character_customization, managers.character_customization)[upper_name]
	slot8 = self

	self.destroy_all_parts_on_character(managers.character_customization)

	self._attached_units = {}
	slot10 = upper_data.path_fps_hands

	self._attach_unit(managers.character_customization, self, "fps_hands")

	return 
end
function CharacterCustomizationFps:_attach_unit(slot, name)
	slot9 = name
	slot8 = DynamicResourceManager.DYN_RESOURCES_PACKAGE
	slot14 = {
		name = name,
		slot = slot
	}

	managers.dyn_resource.load(slot4, managers.dyn_resource, Idstring(slot7), Idstring("unit"), callback(slot10, self, self, "_part_loaded_callback"))

	return 
end
function CharacterCustomizationFps:_part_loaded_callback(params)

	-- Decompilation error in this vicinity:
	slot4 = Idstring(slot5)
	slot7 = self._unit
	local attached_unit = safe_spawn_unit(slot3, self._unit.position(params.name))

	if attached_unit then
		slot5 = attached_unit

		if alive(slot4) then
			slot5 = self._attached_units[params.slot]

			if alive(slot4) and self._attached_units[params.slot] then
				slot6 = 0

				self._attached_units[params.slot].set_slot(params.slot, self._attached_units[params.slot])

				self._attached_units[params.slot] = nil
			end
		end
	end

	slot8 = "Hips"
	slot7 = attached_unit
	slot10 = attached_unit
	slot10 = attached_unit.orientation_object(slot9)

	self._unit.link(slot4, self._unit, Idstring(slot7), attached_unit.orientation_object(slot9).name(slot9))

	self._attached_units[params.slot] = attached_unit
	slot5 = CharacterCustomization.BONES

	for _, bone_name in ipairs(params.slot) do
		local skin_object = attached_unit.get_object(slot9, Idstring(slot12))
		local char_object = self._unit.get_object(attached_unit, Idstring(bone_name))
		slot13 = char_object

		skin_object.link(self._unit, skin_object)

		slot12 = skin_object
		slot15 = char_object

		skin_object.set_position(self._unit, char_object.position(bone_name))

		slot12 = skin_object
		slot15 = char_object

		skin_object.set_rotation(self._unit, char_object.rotation(bone_name))
	end

	return 
end

return 
