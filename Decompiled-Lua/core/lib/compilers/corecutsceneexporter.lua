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
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreEngineAccess"

core.import(slot1, core)

slot2 = "core/lib/managers/cutscene/CoreCutsceneKeys"

require(slot1)

CoreCutsceneExporter = CoreCutsceneExporter or class()
function CoreCutsceneExporter:init()

	-- Decompilation error in this vicinity:
	self.__clips = {}
	self.__cutscene_keys = {}
	slot1 = assert
	slot5 = self.export_to_path
end
function CoreCutsceneExporter:free_cached_animations()
	self.__final_animation_cache = nil
	self.__joined_animation_cache = nil
	self.__footage_animation_cache = nil

	return 
end
function CoreCutsceneExporter:add_clip(clip)
	function slot6(a, b)
		slot5 = b

		return a.start_time(slot3) < b.start_time(a)
	end

	table.insert_sorted(slot3, self.__clips, clip)

	slot4 = self

	self._clear_cached_lists(slot3)

	return 
end
function CoreCutsceneExporter:add_key(cutscene_key)
	function slot6(a, b)
		slot5 = b

		return a.frame(slot3) < b.frame(a)
	end

	table.insert_sorted(slot3, self.__cutscene_keys, cutscene_key)

	slot4 = self

	self._clear_cached_lists(slot3)

	return 
end
function CoreCutsceneExporter:add_animation_patch(unit_name, blend_set, animation_name)
	if unit_name and blend_set and animation_name then
		self.__animation_patches = self.__animation_patches or {}
		self.__animation_patches[unit_name] = self.__animation_patches[unit_name] or {}
		self.__animation_patches[unit_name][blend_set] = animation_name
	end

	return 
end
function CoreCutsceneExporter:frame_count()
	slot6 = last_key_time

	return math.max(slot4, last_clip_end_time)
end
function CoreCutsceneExporter:contains_optimized_footage()

	-- Decompilation error in this vicinity:
	function slot4(clip)
		slot3 = clip
		slot3 = clip.metadata(slot2)
		slot3 = clip.metadata(slot2).footage(slot2)._cutscene

		return clip.metadata(slot2).footage(slot2)._cutscene.is_optimized(slot2)
	end

	return table.find_value(slot2, self.__clips) ~= nil
end
function CoreCutsceneExporter:contains_unoptimized_footage()
	function slot4(clip)
		slot3 = clip
		slot3 = clip.metadata(slot2)
		slot3 = clip.metadata(slot2).footage(slot2)._cutscene

		return not clip.metadata(slot2).footage(slot2)._cutscene.is_optimized(slot2)
	end

	return table.find_value(slot2, self.__clips) ~= nil
end
function CoreCutsceneExporter:is_valid()
	slot3 = self

	return #self.problems(slot2) == 0
end
function CoreCutsceneExporter:problems()
	if not self.__problems then
		slot5 = self
		slot1 = table.map_keys(self._problem_map(slot4))
	end

	self.__problems = slot1

	return self.__problems
end
function CoreCutsceneExporter:_problem_map()
	local problem_map = {}

	local function add_problem(problem)
		problem_map[problem] = true

		return 
	end

	if #self.__cutscene_keys == 0 then
		slot5 = self
	else
		slot8 = {
			is_valid = true
		}
		local previous_clip = responder_map(slot4)
		slot6 = self.__clips

		for _, clip in ipairs({
			end_time = 0,
			start_time = 0,
			metadata = responder_map(slot7)
		}) do
			slot12 = clip

			if clip.start_time(previous_clip) < previous_clip.end_time(slot10) then
				slot11 = "One or more clips overlap."

				add_problem(slot10)
			else
				slot12 = clip

				if previous_clip.end_time(slot10) ~= clip.start_time(previous_clip) then
					slot11 = "There are gaps between clips."

					add_problem(slot10)
				end
			end

			slot11 = clip

			if clip.metadata(slot10) == nil then
				slot11 = "One or more clips is missing cutscene footage data."

				add_problem(slot10)
			else
				slot11 = clip
				slot11 = clip.metadata(slot10)

				if not clip.metadata(slot10).is_valid(slot10) then
					slot11 = "One or more clips contain invalid cutscene footage data."

					add_problem(slot10)
				end
			end

			previous_clip = clip
		end

		slot6 = problem_map

		if table.empty(slot5) then
			slot6 = self

			if self.contains_optimized_footage(slot5) then
				slot6 = self

				if self.contains_unoptimized_footage(slot5) then
					slot6 = "The scene features both optimized and un-optimized clips."

					add_problem(slot5)
				end

				slot4 = table.empty
				slot6 = self.__animation_patches or {}

				if not slot4(slot5) then
					slot6 = "Cannot apply animation patches to optimized clips."

					add_problem(slot5)
				end
			end
		end
	end

	slot3 = pairs
	slot5 = self.__animation_patches or {}

	for unit_name, patches in slot3(slot4) do
		slot12 = self

		if not table.contains(slot9, self._all_controlled_unit_names(unit_name)) then
			slot10 = "Animation patch table contains a non-existing actor."

			add_problem(slot9)
		end

		slot8 = pairs
		slot10 = patches or {}

		for _, animation in slot8(slot9) do
			slot17 = animation

			if not DB.has(slot14, DB, "animation") then
				slot16 = animation

				if not SystemFS.exists(slot14, SystemFS) then
					slot15 = "Animation patch table contains invalid animations."

					add_problem(slot14)
				end
			end
		end
	end

	return problem_map
end
function CoreCutsceneExporter:_has_cameras()
	slot6 = true

	for unit_name, _ in pairs(self._all_controlled_unit_types(slot4, self)) do
		slot9 = "camera"

		if string.begins(slot7, unit_name) then
			return true
		end
	end

	return false
end
function CoreCutsceneExporter:_all_controlled_unit_types(include_cameras)
	if self.__all_controlled_unit_types == nil then
		self.__all_controlled_unit_types = {}
		slot4 = self.__clips

		for _, clip in ipairs(slot3) do
			slot11 = clip
			slot11 = clip.metadata(slot10)
			slot11 = clip.metadata(slot10).footage(slot10)._cutscene

			for unit_name, unit_type in pairs(clip.metadata(slot10).footage(slot10)._cutscene.controlled_unit_types(slot10)) do
				self.__all_controlled_unit_types[unit_name] = unit_type
			end
		end
	end

	if not include_cameras or not self.__all_controlled_unit_types then
		function slot5(unit_name, unit_type)
			slot6 = "camera"

			return unit_name, (not string.begins(slot4, unit_name) and unit_type) or nil
		end

		slot2 = table.remap(slot3, self.__all_controlled_unit_types)
	end

	return slot2
end
function CoreCutsceneExporter:_all_controlled_unit_names(include_cameras)
	slot7 = include_cameras

	return table.map_keys(self._all_controlled_unit_types(slot5, self))
end
function CoreCutsceneExporter:_get_final_animation(unit_name)
	if not self.__final_animation_cache then
		slot5 = {
			__mode = "v"
		}
		slot2 = setmetatable(slot3, {})
	end

	self.__final_animation_cache = slot2
	local final_animation = self.__final_animation_cache[unit_name]
	slot5 = final_animation

	if not alive(slot4) then
		slot6 = unit_name
		final_animation = self._get_joined_animation(slot4, self) or false
		slot5 = self
		local unit_type = self._all_controlled_unit_types(slot4)[unit_name]

		if final_animation and unit_type ~= nil and unit_type ~= "locator" then
			local patches = (self.__animation_patches and self.__animation_patches[unit_name]) or {}
			slot8 = unit_type
			local unit_animatable_set = self._get_animatable_set_name_for_unit_type(slot6, self)
			slot9 = unit_animatable_set
			local original_bones = AnimationManager.animatable_set_bones(self, AnimationManager)
			local replaced_blend_sets = table.map_keys(AnimationManager)

			function slot12(result, blend_set)
				slot6 = blend_set
				local blend_set_bones = AnimationManager.animatable_set_bones(slot3, AnimationManager, unit_animatable_set)

				function slot6(bone)
					slot4 = bone

					return not table.contains(slot2, blend_set_bones)
				end

				return table.find_all_values(AnimationManager, result)
			end

			local kept_bones = table.inject(patches, replaced_blend_sets, original_bones)
			slot14 = kept_bones
			final_animation = self._process_animation(replaced_blend_sets, self, "strip", final_animation)
			slot8 = patches

			for blend_set, animation_name in pairs(table.map_keys) do
				slot15 = blend_set
				local blend_set_bones = AnimationManager.animatable_set_bones(slot12, AnimationManager, unit_animatable_set)
				slot19 = unit_animatable_set

				assert(slot13, string.format(slot16, "Blend set \"%s\" in \"%s\" contains no bones.", blend_set))

				slot19 = animation_name
				slot17 = blend_set_bones
				local patch_animation = self._process_animation(slot13, self, "strip", AnimationCutter.load("Blend set \"%s\" in \"%s\" contains no bones.", AnimationCutter))
				slot15 = 0 < #patch_animation.bones(AnimationCutter.load("Blend set \"%s\" in \"%s\" contains no bones.", AnimationCutter))
				slot20 = blend_set

				assert(0 < #blend_set_bones, string.format(patch_animation, "Animation \"%s\" contains no animation for bones in blend set \"%s\".", animation_name))

				slot16 = final_animation

				if final_animation.length(patch_animation) < patch_animation.length(slot14) then
					slot18 = 0
					slot21 = final_animation
					patch_animation = self._process_animation(slot14, self, "cut", patch_animation, final_animation.length(slot20))
				else
					slot16 = final_animation

					if patch_animation.length(slot14) < final_animation.length(patch_animation) then
						slot19 = patch_animation
						slot16 = final_animation.length(slot17) - patch_animation.length(final_animation)
						local pause = AnimationCutter.pause(slot14, AnimationCutter)
						slot19 = pause
						patch_animation = self._process_animation(AnimationCutter, self, "join", patch_animation)
						slot16 = pause

						pause.free(AnimationCutter)
					end
				end

				slot18 = patch_animation
				final_animation = self._process_animation(slot14, self, "merge", final_animation)
			end
		end

		self.__final_animation_cache[unit_name] = final_animation
	end

	return final_animation or nil
end
function CoreCutsceneExporter:_get_joined_animation(unit_name_or_func)
	if not self.__joined_animation_cache then
		slot5 = {
			__mode = "v"
		}
		slot2 = setmetatable(slot3, {})
	end

	self.__joined_animation_cache = slot2
	slot4 = unit_name_or_func
	local unit_name_func = (type(slot3) ~= "function" and function ()
		slot2 = unit_name_or_func

		return tostring(slot1)
	end) or unit_name_or_func
	local unit_name = unit_name_func()
	local joined_animation = self.__joined_animation_cache[unit_name]
	slot7 = joined_animation

	if not alive(slot6) then
		slot8 = unit_name_func
		joined_animation = self._join_animations(slot6, self) or false

		if unit_name then
			self.__joined_animation_cache[unit_name] = joined_animation
		end
	end

	return joined_animation or nil
end
function CoreCutsceneExporter:_get_joined_camera_animation()
	function slot4(clip)
		if clip then
			slot3 = clip
			slot3 = clip.metadata(slot2)
			slot1 = clip.metadata(slot2).camera(slot2)
		end

		return slot1
	end

	return self._get_joined_animation(slot2, self)
end
function CoreCutsceneExporter:_get_footage_animation(cutscene, unit_name)
	if not self.__footage_animation_cache then
		slot6 = {
			__mode = "v"
		}
		slot3 = setmetatable(slot4, {})
	end

	self.__footage_animation_cache = slot3
	slot5 = cutscene
	local key = cutscene.name(slot4) .. ":" .. unit_name
	local footage_animation = self.__footage_animation_cache[key]
	slot7 = footage_animation

	if not alive(slot6) then

		-- Decompilation error in this vicinity:
		slot8 = unit_name
		local footage_animation_name = cutscene.animation_for_unit(slot6, cutscene)
		self.__footage_animation_cache[key] = footage_animation
	end

	return footage_animation or nil
end
function CoreCutsceneExporter:_get_animatable_set_name_for_unit_type(unit_type)
	slot6 = unit_type
	local unit_data = CoreEngineAccess._editor_unit_data(unit_type.id(slot5))
	local model_filename = unit_data.model(unit_type.id)
	slot8 = model_filename

	if self.__database.has(unit_data, self.__database, "object") then
		slot8 = model_filename
		local object_db_entry = self.__database.lookup(slot5, self.__database, "object")
	end

	if not object_db_entry then
		slot10 = unit_type
		slot13 = model_filename

		error(string.format(slot8, "Unit \"%s\" - Model XML \"%s\" not found.", model_filename.t(slot12)))
	end

	slot8 = object_db_entry
	local object_node = self.__database.load_node(slot6, self.__database)

	if object_node == nil then
		slot11 = unit_type

		error(string.format(slot9, "Unit \"%s\" - Model XML is invalid."))
	end

	slot8 = object_node

	for child in object_node.children(slot7) do
		slot12 = child

		if child.name(slot11) == "animation_set" then
			slot13 = "name"
			local animation_set_name = child.parameter(slot11, child)
			slot14 = animation_set_name
			local animation_set = AnimationManager.animation_set(child, AnimationManager)
			slot14 = animation_set

			return animation_set.animatable_set_name(AnimationManager)
		end
	end

	slot11 = unit_type

	error(string.format(slot9, "Unit \"%s\" - Model XML is missing animation_set name."))

	return 
end
function CoreCutsceneExporter:_join_animations(unit_name_func)
	local joined_animation = nil
	slot5 = self.__clips

	for _, clip in ipairs(slot4) do

		-- Decompilation error in this vicinity:
		slot10 = clip
		local cutscene = clip.metadata(slot9).footage(slot9)._cutscene
		local unit_name = unit_name_func(clip.metadata(slot9))
		slot14 = unit_name
		local footage_animation = self._get_footage_animation(clip, self, cutscene)

		if joined_animation ~= nil and footage_animation ~= nil then
			local first_set = table.sorted_copy(joined_animation.bones(slot14))
			slot16 = footage_animation
			local second_set = table.sorted_copy(footage_animation.bones(joined_animation))
			slot15 = first_set

			if not table.empty(footage_animation.bones) then
				slot15 = second_set

				if not table.empty(slot14) then
					slot16 = second_set

					if not table.equals(slot14, first_set) then
						slot16 = "Unit \"" .. unit_name .. "\", first set:"

						cat_print(slot14, "debug")

						slot15 = first_set

						for _, bone in ipairs(slot14) do
							slot21 = bone

							cat_print(slot19, "debug")
						end

						slot16 = ""

						cat_print(slot14, "debug")

						slot16 = "Unit \"" .. unit_name .. "\", second set:"

						cat_print(slot14, "debug")

						slot15 = second_set

						for _, bone in ipairs(slot14) do
							slot21 = bone

							cat_print(slot19, "debug")
						end

						slot18 = unit_name
						slot21 = cutscene

						error(string.format(slot16, "Unit \"%s\" - Bones differ in footage \"%s\".", cutscene.name(slot20)))
					end
				end
			end
		end

		slot14 = cutscene
		local range_start = clip.start_time_in_source(slot12) / cutscene.frames_per_second(clip)
		slot15 = cutscene
		local range_end = clip.end_time_in_source(clip) / cutscene.frames_per_second(clip)
		slot16 = cutscene
		local range_duration = clip.length(clip) / cutscene.frames_per_second(clip)
	end

	return joined_animation
end
function CoreCutsceneExporter:_clear_cached_lists()
	self.__problems = nil
	self.__all_controlled_unit_types = nil
	slot3 = self

	self.free_cached_animations(slot2)

	return 
end
function CoreCutsceneExporter:_process_animation(animation_cutter_method_name, animation, ...)
	slot6 = animation
	local result = AnimationCutter[animation_cutter_method_name](slot4, AnimationCutter, ...)
	slot6 = animation

	animation.free(AnimationCutter)

	return result
end
function CoreCutsceneExporter:_assert_is_valid()
	slot3 = self
	local problems = self.problems(slot2)

	if #problems ~= 0 then
		slot4 = "Cutscene project is invalid: "
		slot8 = problems

		error(slot3, string.join(slot6, " "))
	end

	return 
end

return 
