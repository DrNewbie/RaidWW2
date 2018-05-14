-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot2 = "core/lib/compilers/CoreCutsceneExporter"

require(slot1)

slot2 = "core/lib/managers/cutscene/CoreCutscene"

require(slot1)

if not CoreCutsceneOptimizer then
	slot2 = CoreCutsceneExporter
	slot0 = class(slot1)
end

CoreCutsceneOptimizer = slot0
CoreCutsceneOptimizer.ANIMATION_BLOB_PART_DURATION = 5
CoreCutsceneOptimizer.init = function (self)
	slot3 = self

	self.super.init(slot2)

	self.__compression_enabled = {
		ps3 = true,
		win32 = true,
		x360 = true
	}

	return 
end
CoreCutsceneOptimizer.export_to_compile_destination = function (self, dest, optimized_cutscene_path)

	-- Decompilation error in this vicinity:
	slot5 = self

	self._assert_is_valid(slot4)

	slot6 = optimized_cutscene_path
	local cutscene_name = managers.database.entry_name(slot4, managers.database)
	slot10 = cutscene_name .. "_%03i."
	slot8 = ".animation_blob"
	local part_path_pattern = string.gsub(managers.database, string.gsub(slot7, optimized_cutscene_path, cutscene_name .. "."), "%.cutscene$")
	slot7 = self
	local merged_animation = self._create_merged_animation(string.gsub(slot7, optimized_cutscene_path, cutscene_name .. "."))

	self._write_cutscene_xml(slot8, self, optimized_cutscene_path)

	slot9 = self
	slot14 = ".unit"

	self._write_cutscene_unit_xml(slot8, string.gsub(new_animation_blobs, optimized_cutscene_path, "%.cutscene$"))

	slot9 = managers.database

	managers.database.recompile(slot8)

	return 
end
CoreCutsceneOptimizer.compression_enabled = function (self, platform)
	slot8 = platform
	slot5 = "Unsupported platform \"" .. tostring(slot7) .. "\""

	assert(slot3, self.__compression_enabled[platform] ~= nil)

	return self.__compression_enabled[platform]
end
CoreCutsceneOptimizer.set_compression_enabled = function (self, platform, should_compress)
	slot9 = platform

	assert(slot4, self.__compression_enabled[platform] ~= nil)

	slot7 = should_compress
	slot6 = "Expected boolean"

	assert(slot4, type("Unsupported platform \"" .. tostring(slot8) .. "\"") == "boolean")

	self.__compression_enabled[platform] = should_compress

	return 
end
CoreCutsceneOptimizer._write_cutscene_xml = function (self, path, animation_blobs)
	local cutscene_node = Node(slot4)
	slot7 = "unit"

	cutscene_node.set_parameter("cutscene", cutscene_node, managers.database.entry_path(slot9, managers.database))

	slot7 = "frames"
	slot12 = self

	cutscene_node.set_parameter("cutscene", cutscene_node, tostring(self.frame_count(path)))

	slot6 = animation_blobs

	if not table.empty("cutscene") then
		slot7 = "animation_blobs"
		local animation_blobs_node = cutscene_node.make_child(slot5, cutscene_node)
		slot7 = animation_blobs

		for _, animation_blob in ipairs(cutscene_node) do
			slot13 = "part"
			local part_node = animation_blobs_node.make_child(slot11, animation_blobs_node)
			slot15 = animation_blob

			part_node.set_parameter(animation_blobs_node, part_node, "animation_blob")
		end
	end

	slot9 = true

	if not table.empty(self._all_controlled_unit_names(slot7, self)) then
		local controlled_units_node = cutscene_node.make_child(slot5, cutscene_node)

		local function add_controlled_unit(unit_type, unit_name)
			slot5 = "unit"
			local unit_node = controlled_units_node.make_child(slot3, controlled_units_node)
			slot7 = unit_type

			unit_node.set_parameter(controlled_units_node, unit_node, "type")

			slot7 = unit_name

			unit_node.set_parameter(controlled_units_node, unit_node, "name")

			local unit_is_patched = self.__animation_patches and self.__animation_patches[unit_name]

			if unit_is_patched then
				slot8 = "patched"

				unit_node.set_parameter(slot5, unit_node, "blend_set")
			end

			return 
		end

		slot8 = self

		if self._has_cameras("controlled_units") then
			slot9 = "camera"

			add_controlled_unit(slot7, "locator")
		end

		slot10 = self

		for _, unit_name in ipairs(self._all_controlled_unit_names(slot9)) do
			local unit_type = self._all_controlled_unit_types(slot12)[unit_name]
			slot15 = unit_name

			add_controlled_unit(self, unit_type)
		end
	end

	slot7 = "keys"
	local keys_node = cutscene_node.make_child(slot5, cutscene_node)
	slot7 = self

	if self._has_cameras(cutscene_node) then
		slot8 = CoreChangeCameraCutsceneKey.ELEMENT_NAME
		slot8 = keys_node

		CoreCutsceneKey.create(slot6, CoreCutsceneKey)._save_under(slot6, CoreCutsceneKey.create(slot6, CoreCutsceneKey))
	end

	slot7 = self.__cutscene_keys

	for _, cutscene_key in ipairs(slot6) do
		slot13 = keys_node

		cutscene_key._save_under(slot11, cutscene_key)
	end

	slot8 = keys_node

	self._add_unit_visibility_keys(slot6, self)

	slot8 = keys_node

	self._add_discontinuity_keys(slot6, self)

	slot9 = path

	managers.database.save_node(slot6, managers.database, cutscene_node)

	return 
end
CoreCutsceneOptimizer._add_unit_visibility_keys = function (self, keys_node)
	slot4 = self
	local unit_names = self._all_controlled_unit_names(slot3)
	local was_visible = {}
	slot6 = unit_names

	for _, unit_name in ipairs(slot5) do
		was_visible[unit_name] = true
	end

	slot6 = self.__clips

	for _, clip in ipairs(slot5) do
		slot11 = clip
		local cutscene = clip.metadata(slot10).footage(slot10)._cutscene
		slot12 = unit_names

		for _, unit_name in ipairs(clip.metadata(slot10)) do
			function slot18(key)

				-- Decompilation error in this vicinity:
				slot4 = clip
			end

			local existing_visibility_key = table.find_value(slot16, self.__cutscene_keys)

			if existing_visibility_key then
				slot18 = existing_visibility_key
				was_visible[unit_name] = existing_visibility_key.visible(slot17)
			else
				slot19 = unit_name
				local visible = cutscene.animation_for_unit(slot17, cutscene) ~= nil

				if visible ~= was_visible[unit_name] then
					slot20 = CoreUnitVisibleCutsceneKey.ELEMENT_NAME
					local visibility_key = CoreCutsceneKey.create(slot18, CoreCutsceneKey)
					visibility_key.is_valid_unit_name = function ()
						return true
					end
					slot20 = visibility_key
					slot23 = clip

					visibility_key.set_frame(CoreCutsceneKey, clip.start_time(slot22))

					slot21 = unit_name

					visibility_key.set_unit_name(CoreCutsceneKey, visibility_key)

					slot21 = visible

					visibility_key.set_visible(CoreCutsceneKey, visibility_key)

					slot21 = keys_node

					visibility_key._save_under(CoreCutsceneKey, visibility_key)

					was_visible[unit_name] = visible
				end
			end
		end
	end

	return 
end
CoreCutsceneOptimizer._add_discontinuity_keys = function (self, keys_node)
	local previous_clip = nil
	slot5 = self.__clips

	for _, clip in ipairs(slot4) do

		-- Decompilation error in this vicinity:
		previous_clip = clip
	end

	return 
end
CoreCutsceneOptimizer._write_cutscene_unit_xml = function (self, path)
	local unit_node = Node(slot3)
	slot7 = "cutscene"

	unit_node.set_parameter("unit", unit_node, "type")

	slot7 = 20

	unit_node.set_parameter("unit", unit_node, "slot")

	slot6 = "model"
	local model_node = unit_node.make_child("unit", unit_node)
	slot8 = "locator"

	model_node.set_parameter(unit_node, model_node, "file")

	local function add_extension_node(name, class)
		slot5 = "extension"
		local extension_node = unit_node.make_child(slot3, unit_node)
		slot7 = name

		extension_node.set_parameter(unit_node, extension_node, "name")

		slot7 = class

		extension_node.set_parameter(unit_node, extension_node, "class")

		return 
	end

	slot8 = "ScriptUnitData"

	add_extension_node(model_node, "unit_data")

	slot8 = "CutsceneData"

	add_extension_node(model_node, "cutscene_data")

	slot9 = path

	managers.database.save_node(model_node, managers.database, unit_node)

	return 
end
CoreCutsceneOptimizer._create_merged_animation = function (self)
	local unit_animation_map = {}
	slot6 = self

	for _, unit_name in ipairs(self._all_controlled_unit_names(slot5)) do
		slot10 = unit_name
		unit_animation_map[unit_name] = self._get_final_animation(slot8, self)
	end

	slot4 = self

	if self._has_cameras(slot3) then
		slot4 = self
		unit_animation_map.camera = self._get_joined_camera_animation(slot3)
	end

	local merged_animation = nil
	slot5 = unit_animation_map

	for unit_name, animation in pairs(slot4) do

		-- Decompilation error in this vicinity:
		slot12 = unit_name
		local prefixed_animation = AnimationCutter.add_prefix(slot9, AnimationCutter, animation)
	end

	return merged_animation
end
CoreCutsceneOptimizer._write_animation_blobs = function (self, full_animation, dest, part_path_pattern)
	local animation_blob_names = {}
	local default_settings = {
		rotation_tolerance = 0.0025,
		position_tolerance = 0.1,
		pack_rotations = false,
		pack_positions = false
	}
	local per_bone_settings = {}
	slot9 = full_animation
	local duration = full_animation.length(slot8)
	local start_time = 0
	local index = 0

	while start_time <= duration do
		slot13 = duration
		local end_time = math.min(slot11, start_time + self.ANIMATION_BLOB_PART_DURATION)
		slot16 = end_time
		local part = AnimationCutter.cut(start_time + self.ANIMATION_BLOB_PART_DURATION, AnimationCutter, full_animation, start_time)
		slot17 = per_bone_settings
		local compressed_part = AnimationCutter.compress(AnimationCutter, AnimationCutter, part, default_settings)
		slot16 = index
		local part_path = string.format(AnimationCutter, part_path_pattern)
		slot20 = compressed_part

		self._write_animation_part(part_path_pattern, self, dest, part_path, part)

		slot16 = animation_blob_names
		slot20 = part_path

		table.insert(part_path_pattern, managers.database.entry_path(part_path, managers.database))

		slot16 = compressed_part

		compressed_part.free(part_path_pattern)

		slot16 = part

		part.free(part_path_pattern)

		start_time = start_time + self.ANIMATION_BLOB_PART_DURATION
		index = index + 1
	end

	return animation_blob_names
end
CoreCutsceneOptimizer._write_animation_part = function (self, dest, path, animation, compressed_animation)
	local platforms_to_export = {}
	local base_path = path
	slot9 = self.__compression_enabled

	for platform, _ in pairs(slot8) do
		slot15 = "%." .. platform .. "%."

		if string.find(slot13, base_path) then
			slot15 = platform

			table.insert(slot13, platforms_to_export)

			slot16 = "."
			base_path = string.gsub(slot13, base_path, "%." .. platform .. "%.")
		end
	end

	if #platforms_to_export == 0 then
		slot9 = self.__compression_enabled
		platforms_to_export = table.map_keys(slot8)
	end

	slot9 = platforms_to_export

	for _, platform in ipairs(slot8) do
		local use_compressed = self.__compression_enabled[platform]
		local save_func = (platform == "win32" and AnimationCutter.save) or AnimationCutter.save_cross_compiled
		slot18 = path

		save_func(slot15, AnimationCutter, (use_compressed and compressed_animation) or animation)
	end

	return 
end
CoreCutsceneOptimizer._problem_map = function (self)
	slot3 = self
	local problem_map = self.super._problem_map(slot2)

	local function add_problem(problem)
		problem_map[problem] = true

		return 
	end

	slot5 = self

	if self.contains_optimized_footage(slot4) then
		slot5 = "Projects with optimized clips are not currently supported."

		add_problem(slot4)
	end

	return problem_map
end

return 
