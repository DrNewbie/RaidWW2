-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot2 = "core/lib/managers/cutscene/CoreCutsceneKeys"

require(slot1)

slot2 = "core/lib/managers/cutscene/CoreCutsceneKeyCollection"

require(slot1)

CoreCutscene = CoreCutscene or frozen_class()
slot3 = CoreCutsceneKeyCollection

mixin(slot1, CoreCutscene)

local CUTSCENE_FRAMES_PER_SECOND = 30
function CoreCutscene:_all_keys_sorted_by_time()
	return self._keys or {}
end
function CoreCutscene:init(cutscene_node, cutscene_manager)
	slot6 = "No cutscene XML node supplied."

	assert(slot4, cutscene_node)

	slot6 = "Must supply a reference to the CutsceneManager."

	assert(slot4, cutscene_manager)

	slot6 = "name"
	self._name = cutscene_node.parameter(slot4, cutscene_node)
	self._unit_name = cutscene_node.parameter(slot4, cutscene_node)
	slot8 = "frames"
	self._frame_count = tonumber(cutscene_node.parameter("unit", cutscene_node))
	self._keys = {}
	self._unit_types = {}
	self._unit_animations = {}
	self._unit_blend_sets = {}
	self._camera_names = {}
	slot6 = cutscene_node
	self._animation_blobs = self._parse_animation_blobs(slot4, self)
	slot5 = cutscene_node

	for collection_node in cutscene_node.children(slot4) do
		slot9 = collection_node

		if collection_node.name(slot8) == "controlled_units" then
			slot9 = collection_node

			for child_node in collection_node.children(slot8) do
				local unit_name = child_node.parameter(slot12, child_node)
				slot15 = cutscene_manager
				slot18 = self
				slot22 = "type"
				self._unit_types[unit_name] = cutscene_manager.cutscene_actor_unit_type("name", self._cutscene_specific_unit_type(slot17, child_node.parameter(slot20, child_node)))
				slot16 = "animation"
				self._unit_animations[unit_name] = child_node.parameter("name", child_node)
				slot16 = "blend_set"
				self._unit_blend_sets[unit_name] = child_node.parameter("name", child_node)
				slot15 = "camera"

				if string.begins(child_node.parameter("name", child_node), unit_name) then
					slot15 = unit_name

					table.insert(slot13, self._camera_names)
				end
			end
		else
			slot9 = collection_node

			if collection_node.name(slot8) == "keys" then
				slot9 = collection_node

				for child_node in collection_node.children(slot8) do
					local cutscene_key = CoreCutsceneKey.create(slot12, CoreCutsceneKey, child_node.name(self))
					slot15 = child_node

					cutscene_key.load(CoreCutsceneKey, cutscene_key)

					slot14 = self._keys
					slot17 = cutscene_key

					table.insert(CoreCutsceneKey, freeze(child_node))
				end
			end
		end
	end

	slot5 = self._camera_names

	table.sort(slot4)

	function slot6(a, b)
		slot5 = b

		return a.frame(slot3) < b.frame(a)
	end

	table.sort(slot4, self._keys)

	slot9 = self._camera_names

	freeze(slot4, self._keys, self._unit_types, self._unit_animations, self._unit_blend_sets)

	return 
end
function CoreCutscene:is_valid()
	slot3 = self._unit_types

	if not table.empty(slot2) then
		slot4 = "unit"
		slot7 = self
		slot1 = DB.has(slot2, DB, self.unit_name(slot6))
	end

	return slot1
end
function CoreCutscene:name()
	return self._name or ""
end
function CoreCutscene:unit_name()
	return self._unit_name or ""
end
function CoreCutscene:frames_per_second()
	return CUTSCENE_FRAMES_PER_SECOND
end
function CoreCutscene:frame_count()
	return self._frame_count or 1
end
function CoreCutscene:duration()
	slot4 = self

	return self.frame_count(slot2) / self.frames_per_second(self)
end
function CoreCutscene:is_optimized()
	slot3 = self._unit_animations

	return table.empty(slot2)
end
function CoreCutscene:has_cameras()
	slot3 = self._camera_names

	return not table.empty(slot2)
end
function CoreCutscene:has_unit(unit_name, include_units_spawned_through_keys)
	slot5 = self

	if self.controlled_unit_types(slot4)[unit_name] ~= nil then
		return true
	end

	if include_units_spawned_through_keys then
		slot6 = CoreSpawnUnitCutsceneKey.ELEMENT_NAME

		for spawn_key in self.keys(slot4, self) do
			slot9 = spawn_key

			if spawn_key.name(slot8) == unit_name then
				return true
			end
		end
	end

	return false
end
function CoreCutscene:controlled_unit_types()
	return self._unit_types
end
function CoreCutscene:camera_names()
	return self._camera_names
end
function CoreCutscene:default_camera()
	slot5 = self

	for _, name in ipairs(self.camera_names(slot4)) do
		return name
	end

	return 
end
function CoreCutscene:objects_in_unit(unit_name)
	slot5 = unit_name
	slot4 = self._actor_database_info(slot3, self)

	return self._actor_database_info(slot3, self).object_names(slot3)
end
function CoreCutscene:extensions_on_unit(unit_name)
	slot5 = unit_name
	slot4 = self._actor_database_info(slot3, self)

	return self._actor_database_info(slot3, self).extensions(slot3)
end
function CoreCutscene:animation_for_unit(unit_name)
	return self._unit_animations[unit_name]
end
function CoreCutscene:blend_set_for_unit(unit_name)
	return self._unit_blend_sets[unit_name] or "all"
end
function CoreCutscene:animation_blobs()
	return self._animation_blobs
end
function CoreCutscene:find_spawned_orientation_unit()
	slot3 = World
	slot7 = "cutscenes"
	local spawned_cutscene_units = World.unit_manager(slot2).get_units(slot2, managers.slot.get_mask(slot5, managers.slot))
	slot4 = spawned_cutscene_units

	for _, unit in ipairs(World.unit_manager(slot2)) do
		slot10 = self

		if unit.name(slot8) == self.unit_name(unit) then
			return unit
		end
	end

	return 
end
function CoreCutscene:_parse_animation_blobs(cutscene_node)
	slot5 = cutscene_node

	if not self._parse_animation_blob_list(slot3, self) then
		slot5 = cutscene_node
		slot2 = self._parse_single_animation_blob(slot3, self)
	end

	return slot2
end
function CoreCutscene:_parse_animation_blob_list(cutscene_node)
	slot4 = cutscene_node

	for collection_node in cutscene_node.children(slot3) do
		slot8 = collection_node

		if collection_node.name(slot7) == "animation_blobs" then
			local animation_blobs = {}
			slot9 = collection_node

			for animation_blob_node in collection_node.children(slot8) do

				-- Decompilation error in this vicinity:
				slot13 = animation_blob_node
			end

			return animation_blobs
		end
	end

	return nil
end
function CoreCutscene:_parse_single_animation_blob(cutscene_node)
	slot4 = cutscene_node

	for collection_node in cutscene_node.children(slot3) do
		slot8 = collection_node

		if collection_node.name(slot7) == "controlled_units" then
			slot9 = "animation_blob"
			local animation_blob = collection_node.parameter(slot7, collection_node)

			return animation_blob and {
				animation_blob
			}
		end
	end

	return nil
end
function CoreCutscene:_actor_database_info(unit_name)
	slot8 = unit_name
	local unit_type = assert(slot3, string.format(self, "Unit \"%s\" is not in cutscene \"%s\".", self.name(slot10)))
	slot7 = managers.cutscene
	slot8 = unit_type
	slot9 = unit_type
	slot12 = self
	local unit_info = assert(self.controlled_unit_types(managers.cutscene.actor_database(self).unit_type_info(self, managers.cutscene.actor_database(self)))[unit_name], string.format(managers.cutscene.actor_database(self), "Unit type \"%s\", used in cutscene \"%s\", is not registered in the actor database.", self.name(self)))

	return unit_info
end
function CoreCutscene:_cutscene_specific_unit_type(unit_type)
	if unit_type ~= "locator" then
		slot6 = unit_type .. "_cutscene"

		if DB.has(slot3, DB, "unit") then
			unit_type = unit_type .. "_cutscene"
		end
	end

	return unit_type
end
function CoreCutscene:_debug_persistent_keys()
	local persistent_keys = {}
	local unit_types = self.controlled_unit_types(slot3)
	slot6 = CoreSequenceCutsceneKey.ELEMENT_NAME

	for sequence_key in self.keys(self, self) do
		slot9 = sequence_key
		local unit_type = unit_types[sequence_key.unit_name(slot8)]
		slot8 = string.format
		slot10 = "Sequence %s.%s"

		if not unit_type then
			slot14 = sequence_key
			slot11 = "\"" .. sequence_key.unit_name(slot13) .. "\""
		end

		slot14 = sequence_key
		persistent_keys[slot8(slot9, slot10, sequence_key.name(slot13))] = true
	end

	slot6 = CoreUnitCallbackCutsceneKey.ELEMENT_NAME

	for callback_key in self.keys(slot4, self) do
		slot9 = callback_key
		local unit_type = unit_types[callback_key.unit_name(slot8)]
		slot8 = string.format
		slot10 = "Callback %s:%s():%s()"

		if not unit_type then
			slot14 = callback_key
			slot11 = "\"" .. callback_key.unit_name(slot13) .. "\""
		end

		slot12 = callback_key.extension(slot13)
		slot15 = callback_key
		persistent_keys[slot8(slot9, slot10, slot11, callback_key.method(callback_key))] = true
	end

	return persistent_keys
end

return 
