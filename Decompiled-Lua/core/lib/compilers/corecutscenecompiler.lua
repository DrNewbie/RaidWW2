-- Decompilation Error: _run_step(_unwarp_expressions, node)

-- Decompilation Error: _glue_flows(node)

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

-- Decompilation error in this vicinity:
--- BLOCK #0 1-15, warpins: 1 ---
slot2 = "core/lib/compilers/CoreCompilerSystem"

require(slot1)

slot2 = "core/lib/compilers/CoreCutsceneOptimizer"

require(slot1)

slot2 = "core/lib/utils/dev/tools/cutscene_editor/CoreCutsceneEditorProject"

require(slot1)

slot2 = "core/lib/utils/dev/tools/cutscene_editor/CoreCutsceneFootage"

require(slot1)

slot0 = CoreCutsceneCompiler or class()
CoreCutsceneCompiler = slot0
function CoreCutsceneCompiler:compile(file, dest, force_recompile)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if file.type ~= "cutscene" then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-5, warpins: 1 ---
		return false
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 6-7, warpins: 2 ---
	if not force_recompile then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-16, warpins: 1 ---
		slot10 = file.properties

		if dest.up_to_date(slot5, dest, file.path, "cutscene", file.name) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 17-24, warpins: 1 ---
			slot9 = file.properties

			dest.skip_update(slot5, dest, "cutscene", file.name)

			return true
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 25-50, warpins: 3 ---
	cat_print(slot5, "spam")

	slot9 = file.path
	slot10 = file.path
	local project = assert(slot5, string.format(self, "Failed to load cutscene \"%s\"."))
	slot8 = project
	local optimizer = self._create_optimizer_for_project(self._load_project("Compiling " .. file.path, self), self)
	slot8 = optimizer

	if optimizer.is_valid(self) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 51-63, warpins: 1 ---
		slot10 = file.name

		front.optimizer.export_to_compile_destination(slot7, front.optimizer, dest)

		slot8 = front.optimizer

		front.optimizer.free_cached_animations(slot7)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 64-74, warpins: 1 ---
		slot9 = file.path
		local error_msg = string.format(slot7, "Cutscene \"%s\" is invalid:")
		slot11 = optimizer

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 75-80, warpins: 0 ---
		for _, problem in ipairs(optimizer.problems(slot10)) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 75-78, warpins: 1 ---
			error_msg = error_msg .. "\t" .. problem
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 79-80, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 81-85, warpins: 1 ---
		slot10 = error_msg

		Application.error(slot8, Application)
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 86-87, warpins: 2 ---
	return true
	--- END OF BLOCK #3 ---



end
function CoreCutsceneCompiler:_load_project(path)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	slot5 = path

	if managers.database.has(slot3, managers.database) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-17, warpins: 1 ---
		local project = CoreCutsceneEditorProject.new(slot3)
		slot6 = path

		project.set_path(CoreCutsceneEditorProject, project)

		return project
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 18-19, warpins: 2 ---
	return nil
	--- END OF BLOCK #1 ---



end
function CoreCutsceneCompiler:_create_optimizer_for_project(project)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-12, warpins: 1 ---
	slot4 = CoreCutsceneOptimizer
	local optimizer = CoreCutsceneOptimizer.new(slot3)
	slot5 = optimizer
	slot3 = optimizer.set_compression_enabled
	slot6 = "win32"
	slot9 = project

	if project.export_type(slot8) ~= "in_game_use" then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 13-14, warpins: 1 ---
		slot7 = false
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 15-15, warpins: 1 ---
		slot7 = true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 16-27, warpins: 2 ---
	slot3(slot4, slot5, slot6)

	slot7 = project

	function slot6(clip)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		if clip.track_index ~= 1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 4-5, warpins: 1 ---
			slot1 = false
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 6-6, warpins: 1 ---
			slot1 = true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 7-7, warpins: 2 ---
		return slot1
		--- END OF BLOCK #1 ---



	end

	local exported_clip_descriptors = table.find_all_values(slot4, project.film_clips(function (clip)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		if clip.track_index ~= 1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 4-5, warpins: 1 ---
			slot1 = false
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 6-6, warpins: 1 ---
			slot1 = true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 7-7, warpins: 2 ---
		return slot1
		--- END OF BLOCK #1 ---



	end))
	slot6 = exported_clip_descriptors

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 28-37, warpins: 0 ---
	for _, clip_descriptor in ipairs(project.film_clips(function (clip)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		if clip.track_index ~= 1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 4-5, warpins: 1 ---
			slot1 = false
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 6-6, warpins: 1 ---
			slot1 = true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 7-7, warpins: 2 ---
		return slot1
		--- END OF BLOCK #1 ---



	end)) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 28-35, warpins: 1 ---
		slot12 = clip_descriptor
		local clip = self._create_clip(slot10, self)
		slot13 = clip

		optimizer.add_clip(self, optimizer)
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 36-37, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 38-43, warpins: 1 ---
	slot8 = project

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 44-49, warpins: 0 ---
	for _, key in ipairs(project.cutscene_keys(slot7)) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 44-47, warpins: 1 ---
		slot12 = key

		optimizer.add_key(slot10, optimizer)
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 48-49, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 50-55, warpins: 1 ---
	slot8 = project

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 56-71, warpins: 0 ---
	for unit_name, patches in pairs(project.animation_patches(slot7)) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 56-58, warpins: 1 ---
		slot9 = pairs

		if not patches then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 59-59, warpins: 1 ---
			slot11 = {}
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 60-61, warpins: 2 ---
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 62-69, warpins: 0 ---
		for blend_set, animation in slot9(slot10) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 62-67, warpins: 1 ---
			slot19 = animation

			optimizer.add_animation_patch(slot15, optimizer, unit_name, blend_set)
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 68-69, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 70-71, warpins: 2 ---
		--- END OF BLOCK #3 ---



	end

	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #7 72-73, warpins: 1 ---
	return optimizer
	--- END OF BLOCK #7 ---



end
function CoreCutsceneCompiler:_create_clip(clip_descriptor)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-30, warpins: 1 ---
	slot5 = clip_descriptor.cutscene
	local cutscene = managers.cutscene.get_cutscene(slot3, managers.cutscene)
	slot8 = cutscene
	slot6 = "Cutscene \"" .. clip_descriptor.cutscene .. "\" does not exist."
	local footage = assert(managers.cutscene, CoreCutsceneFootage.new("Cutscene \"" .. clip_descriptor.cutscene .. "\" does not exist.", CoreCutsceneFootage))
	slot9 = clip_descriptor.camera
	local clip = footage.create_clip(CoreCutsceneFootage.new("Cutscene \"" .. clip_descriptor.cutscene .. "\" does not exist.", CoreCutsceneFootage), footage, clip_descriptor.from, clip_descriptor.to)
	slot8 = clip_descriptor.offset - clip_descriptor.from

	clip.offset_by(footage, clip)

	return clip
	--- END OF BLOCK #0 ---



end

return 

--- END OF BLOCK #0 ---

FLOW; TARGET BLOCK #2



-- Decompilation error in this vicinity:
--- BLOCK #1 16-17, warpins: 1 ---
slot0 = class()
--- END OF BLOCK #1 ---

FLOW; TARGET BLOCK #2



-- Decompilation error in this vicinity:
--- BLOCK #2 18-31, warpins: 2 ---
--- END OF BLOCK #2 ---



