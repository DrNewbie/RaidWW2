-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
CharacterCustomization = CharacterCustomization or class()
CharacterCustomization.BONES = {
	"Hips",
	"Spine",
	"Spine1",
	"Spine2",
	"Neck",
	"Head",
	"LeftShoulder",
	"LeftArm",
	"LeftForeArm",
	"LeftForeArmRoll",
	"LeftHand",
	"LeftHandThumb1",
	"LeftHandThumb2",
	"LeftHandThumb3",
	"LeftHandIndex1",
	"LeftHandIndex2",
	"LeftHandIndex3",
	"LeftHandMiddle1",
	"LeftHandMiddle2",
	"LeftHandMiddle3",
	"LeftHandRing1",
	"LeftHandRing2",
	"LeftHandRing3",
	"LeftHandPinky1",
	"LeftHandPinky2",
	"LeftHandPinky3",
	"RightShoulder",
	"RightArm",
	"RightForeArm",
	"RightForeArmRoll",
	"RightHand",
	"RightHandThumb1",
	"RightHandThumb2",
	"RightHandThumb3",
	"RightHandIndex1",
	"RightHandIndex2",
	"RightHandIndex3",
	"RightHandMiddle1",
	"RightHandMiddle2",
	"RightHandMiddle3",
	"RightHandRing1",
	"RightHandRing2",
	"RightHandRing3",
	"RightHandPinky1",
	"RightHandPinky2",
	"RightHandPinky3",
	"LeftUpLeg",
	"LeftLeg",
	"LeftFoot",
	"RightUpLeg",
	"RightLeg",
	"RightFoot"
}
function CharacterCustomization:init(unit)
	self._unit = unit
	self._visible = true
	self._loading_units = {}

	return 
end
function CharacterCustomization:set_visible(visible)
	self._visible = visible

	if not self._attached_units then
		return 
	end

	slot4 = self._attached_units

	for _, attached_unit in pairs(slot3) do
		slot10 = visible

		attached_unit.set_visible(slot8, attached_unit)
	end

	return 
end
function CharacterCustomization:visible()
	return self._visible
end
function CharacterCustomization:set_unit(slot, name)
	if self._attached_units[slot] then
		slot5 = self._attached_units[slot]

		if alive(slot4) then
			slot7 = name

			self._attach_unit(slot4, self, slot)
		end
	end

	return 
end
function CharacterCustomization:_attach_unit(slot, name, current_version, loading_entire_outfit)
	self._loading_units[name] = true
	slot11 = name
	slot10 = DynamicResourceManager.DYN_RESOURCES_PACKAGE
	slot16 = {
		name = name,
		slot = slot,
		loading_entire_outfit = loading_entire_outfit,
		name = name,
		current_version = current_version or 1
	}

	managers.dyn_resource.load(slot6, managers.dyn_resource, Idstring(slot9), Idstring("unit"), callback(slot12, self, self, "_part_loaded_callback"))

	return 
end
function CharacterCustomization:_part_loaded_callback(params)

	-- Decompilation error in this vicinity:
	self._loading_units[params.name] = nil
	slot2 = params.current_version
	slot5 = managers.character_customization
	slot3 = managers.character_customization.get_current_version_to_attach(nil) or 0

	if slot2 < slot3 then
		return false
	end

	slot4 = Idstring(slot5)
	slot7 = self._unit
	local attached_unit = safe_spawn_unit(slot3, self._unit.position(params.name))

	if params.loading_entire_outfit then
		slot6 = false

		attached_unit.set_visible(slot4, attached_unit)
	end

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
	slot10 = attached_unit
	slot10 = attached_unit.orientation_object(slot9)

	self._unit.link(slot4, self._unit, Idstring(attached_unit), attached_unit.orientation_object(slot9).name(slot9))

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

	local head_unit = self._attached_units[CharacterCustomizationTweakData.PART_TYPE_HEAD]
	local upper_unit = self._attached_units[CharacterCustomizationTweakData.PART_TYPE_UPPER]
	local lower_unit = self._attached_units[CharacterCustomizationTweakData.PART_TYPE_LOWER]

	if head_unit and upper_unit and lower_unit and params.loading_entire_outfit then
		slot9 = self._visible

		head_unit.set_visible(slot7, head_unit)

		slot9 = self._visible

		upper_unit.set_visible(slot7, upper_unit)

		slot9 = self._visible

		lower_unit.set_visible(slot7, lower_unit)
	end

	return 
end
function CharacterCustomization:attach_all_parts_to_character(slot_index, current_version)
	local slot_cache_data = Global.savefile_manager.meta_data_list[slot_index].cache

	if slot_cache_data then
		slot6 = self

		self.destroy_all_parts_on_character(slot5)

		local player_manager_data = slot_cache_data.PlayerManager
		local character_nationality_name = player_manager_data.character_profile_nation
		slot10 = character_nationality_name
		local owned_heads = managers.character_customization.get_owned_customizations_indexed(slot7, managers.character_customization, CharacterCustomizationTweakData.PART_TYPE_HEAD)
		slot11 = CharacterCustomizationTweakData.PART_TYPE_HEAD
		local equiped_head_name = managers.character_customization.get_equiped_part_from_character_save_slot(managers.character_customization, managers.character_customization, slot_index)
		slot13 = equiped_head_name
		local equiped_head_object = owned_heads[managers.character_customization.get_equiped_part_index(managers.character_customization, managers.character_customization, character_nationality_name, CharacterCustomizationTweakData.PART_TYPE_HEAD)]
		slot13 = character_nationality_name
		local owned_uppers = managers.character_customization.get_owned_customizations_indexed(managers.character_customization, managers.character_customization, CharacterCustomizationTweakData.PART_TYPE_UPPER)
		slot14 = CharacterCustomizationTweakData.PART_TYPE_UPPER
		local equiped_upper_name = managers.character_customization.get_equiped_part_from_character_save_slot(managers.character_customization, managers.character_customization, slot_index)
		slot16 = equiped_upper_name
		local equiped_upper_object = owned_uppers[managers.character_customization.get_equiped_part_index(managers.character_customization, managers.character_customization, character_nationality_name, CharacterCustomizationTweakData.PART_TYPE_UPPER)]
		slot16 = character_nationality_name
		local owned_lowers = managers.character_customization.get_owned_customizations_indexed(managers.character_customization, managers.character_customization, CharacterCustomizationTweakData.PART_TYPE_LOWER)
		slot17 = CharacterCustomizationTweakData.PART_TYPE_LOWER
		local equiped_lower_name = managers.character_customization.get_equiped_part_from_character_save_slot(managers.character_customization, managers.character_customization, slot_index)
		slot19 = equiped_lower_name
		local equiped_lower_object = owned_lowers[managers.character_customization.get_equiped_part_index(managers.character_customization, managers.character_customization, character_nationality_name, CharacterCustomizationTweakData.PART_TYPE_LOWER)]
		slot21 = current_version

		self._attach_unit_parts(managers.character_customization, self, equiped_head_object, equiped_upper_object, equiped_lower_object)
	end

	return 
end
function CharacterCustomization:attach_all_parts_to_character_by_parts(character_nationality_name, equiped_head_name, equiped_upper_name, equiped_lower_name)
	slot9 = character_nationality_name
	local owned_heads = managers.character_customization.get_owned_customizations_indexed(slot6, managers.character_customization, CharacterCustomizationTweakData.PART_TYPE_HEAD)
	slot11 = equiped_head_name
	local equiped_head_object = owned_heads[managers.character_customization.get_equiped_part_index(managers.character_customization, managers.character_customization, character_nationality_name, CharacterCustomizationTweakData.PART_TYPE_HEAD)]
	slot11 = character_nationality_name
	local owned_uppers = managers.character_customization.get_owned_customizations_indexed(managers.character_customization, managers.character_customization, CharacterCustomizationTweakData.PART_TYPE_UPPER)
	slot13 = equiped_upper_name
	local equiped_upper_object = owned_uppers[managers.character_customization.get_equiped_part_index(managers.character_customization, managers.character_customization, character_nationality_name, CharacterCustomizationTweakData.PART_TYPE_UPPER)]
	slot13 = character_nationality_name
	local owned_lowers = managers.character_customization.get_owned_customizations_indexed(managers.character_customization, managers.character_customization, CharacterCustomizationTweakData.PART_TYPE_LOWER)
	slot15 = equiped_lower_name
	local equiped_lower_object = owned_lowers[managers.character_customization.get_equiped_part_index(managers.character_customization, managers.character_customization, character_nationality_name, CharacterCustomizationTweakData.PART_TYPE_LOWER)]
	slot16 = equiped_lower_object
	slot19 = managers.character_customization

	self._attach_unit_parts(managers.character_customization, self, equiped_head_object, equiped_upper_object, managers.character_customization.get_current_version_to_attach(slot18))

	return 
end
function CharacterCustomization:attach_all_parts_to_character_by_parts_for_husk(character_nationality_name, equiped_head_name, equiped_upper_name, equiped_lower_name, peer)
	slot11 = peer
	local head_name = managers.character_customization.get_default_part_key_name(slot7, managers.character_customization, peer.character(CharacterCustomizationTweakData.PART_TYPE_HEAD))
	slot11 = head_name
	slot14 = peer
	local equiped_head_name = managers.character_customization.check_part_key_name(managers.character_customization, managers.character_customization, CharacterCustomizationTweakData.PART_TYPE_HEAD, peer.character(slot13))
	local all_heads = managers.character_customization.get_all_parts(managers.character_customization, managers.character_customization)
	local equiped_head_object = all_heads[equiped_head_name]
	slot15 = character_nationality_name
	local equiped_upper_name = managers.character_customization.check_part_key_name(CharacterCustomizationTweakData.PART_TYPE_HEAD, managers.character_customization, CharacterCustomizationTweakData.PART_TYPE_UPPER, equiped_upper_name)
	local all_uppers = managers.character_customization.get_all_parts(managers.character_customization, managers.character_customization)
	local equiped_upper_object = all_uppers[equiped_upper_name]
	slot18 = character_nationality_name
	local equiped_lower_name = managers.character_customization.check_part_key_name(CharacterCustomizationTweakData.PART_TYPE_UPPER, managers.character_customization, CharacterCustomizationTweakData.PART_TYPE_LOWER, equiped_lower_name)
	local all_lowers = managers.character_customization.get_all_parts(managers.character_customization, managers.character_customization)
	local equiped_lower_object = all_lowers[equiped_lower_name]
	slot18 = self

	self.destroy_all_parts_on_character(CharacterCustomizationTweakData.PART_TYPE_LOWER)

	slot21 = equiped_lower_object
	slot24 = managers.character_customization

	self._attach_unit_parts(CharacterCustomizationTweakData.PART_TYPE_LOWER, self, equiped_head_object, equiped_upper_object, managers.character_customization.get_current_version_to_attach(slot23))

	return 
end
function CharacterCustomization:_attach_unit_parts(equiped_head_object, equiped_upper_object, equiped_lower_object, current_version)
	local lower_path = (equiped_upper_object.length == CharacterCustomizationTweakData.PART_LENGTH_SHORT and equiped_lower_object.path_long) or equiped_lower_object.path_short
	self._attached_units = {}
	slot12 = true

	self._attach_unit(slot7, self, CharacterCustomizationTweakData.PART_TYPE_HEAD, equiped_head_object.path, current_version)

	slot12 = true

	self._attach_unit(slot7, self, CharacterCustomizationTweakData.PART_TYPE_UPPER, equiped_upper_object.path, current_version)

	slot12 = true

	self._attach_unit(slot7, self, CharacterCustomizationTweakData.PART_TYPE_LOWER, lower_path, current_version)

	slot8 = self._unit

	if self._unit.contour(slot7) then
		slot8 = self._unit
		slot8 = self._unit.contour(slot7)

		self._unit.contour(slot7).update_materials(slot7)
	end

	return 
end
function CharacterCustomization:attach_head_for_husk(head_path)
	local head_unit = self._attached_units[CharacterCustomizationTweakData.PART_TYPE_HEAD]

	if head_unit then
		slot6 = 0

		head_unit.set_slot(slot4, head_unit)

		head_unit = nil
	end

	slot7 = head_path
	slot10 = managers.character_customization

	self._attach_unit(slot4, self, CharacterCustomizationTweakData.PART_TYPE_HEAD, managers.character_customization.get_current_version_to_attach(slot9))

	slot5 = self._unit

	if self._unit.contour(slot4) then
		slot5 = self._unit
		slot5 = self._unit.contour(slot4)

		self._unit.contour(slot4).update_materials(slot4)
	end

	return 
end
function CharacterCustomization:destroy_all_parts_on_character()
	if self._loading_units then
		slot3 = self._loading_units

		for unit_name, _ in pairs(slot2) do
			Application.trace(slot7, Application, "[CharacterCustomization][destroy_all_parts_on_character] unloading unit ")

			slot12 = unit_name
			slot12 = false

			managers.dyn_resource.unload(slot7, managers.dyn_resource, Idstring(unit_name), Idstring("unit"), DynamicResourceManager.DYN_RESOURCES_PACKAGE)
		end
	end

	self._loading_units = {}

	if self._attached_units then
		slot3 = self._attached_units

		for _, part in pairs(slot2) do
			if part then
				slot8 = part

				if alive(slot7) then
					slot9 = 0

					part.set_slot(slot7, part)
				end
			end

			part = nil
		end
	end

	return 
end
function CharacterCustomization:destroy()
	slot4 = "[CharacterCustomization][destroy]"

	Application.trace(slot2, Application)

	slot3 = self

	self.destroy_all_parts_on_character(slot2)

	return 
end

return 
