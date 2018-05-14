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
--- BLOCK #0 1-12, warpins: 1 ---
slot2 = "core/lib/utils/dev/tools/cutscene_editor/CoreCutsceneOptimizer"

require(slot1)

slot2 = "core/lib/utils/dev/tools/cutscene_editor/CoreCutsceneEditorProject"

require(slot1)

slot2 = "core/lib/utils/dev/tools/cutscene_editor/CoreCutsceneFootage"

require(slot1)

slot0 = CoreCutsceneBatchOptimizer or class()
CoreCutsceneBatchOptimizer = slot0
function CoreCutsceneBatchOptimizer:init()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	self.__prioritized_queue = {}
	self.__queue = {}

	return 
	--- END OF BLOCK #0 ---



end
function CoreCutsceneBatchOptimizer:add_project(project_name, optimized_cutscene_name)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-20, warpins: 1 ---
	slot8 = project_name
	slot9 = project_name
	local project = assert(slot4, string.format(self, "Cutscene Project \"%s\" not found in database."))
	slot7 = project
	local optimizer = self._create_optimizer_for_project(self._load_project(slot6, self), self)
	slot7 = optimizer

	if optimizer.is_valid(self) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 21-25, warpins: 1 ---
		slot7 = project

		if project.export_type(slot6) ~= "footage_use" or not self.__prioritized_queue then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 29-29, warpins: 2 ---
			local queue = self.__queue
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 30-38, warpins: 2 ---
		slot9 = {
			project_name = project_name,
			optimizer = optimizer,
			optimized_cutscene_name = optimized_cutscene_name
		}

		table.insert(slot7, queue)
		--- END OF BLOCK #1 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 39-52, warpins: 1 ---
		slot7 = "debug"
		slot11 = project_name

		cat_print(slot6, string.format(slot9, "Cutscene Project \"%s\" is invalid:"))

		slot9 = optimizer

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 53-60, warpins: 0 ---
		for _, problem in ipairs(optimizer.problems(string.format)) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 53-58, warpins: 1 ---
			slot13 = "\t" .. problem

			cat_print(slot11, "debug")
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 59-60, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 61-65, warpins: 2 ---
	slot5 = math.max

	if not self.__max_queue_size then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 66-66, warpins: 1 ---
		slot7 = 0
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 67-72, warpins: 2 ---
	slot10 = self
	self.__max_queue_size = slot5(slot6, self.queue_size(slot9))

	return 
	--- END OF BLOCK #2 ---



end
function CoreCutsceneBatchOptimizer:next_project()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	if not self.__prioritized_queue[1] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-6, warpins: 1 ---
		local front = self.__queue[1]
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 7-8, warpins: 2 ---
	if front then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-9, warpins: 1 ---
		slot2 = front.project_name
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 10-10, warpins: 2 ---
	return slot2
	--- END OF BLOCK #2 ---



end
function CoreCutsceneBatchOptimizer:consume_project()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot4 = 1

	if not table.remove(slot2, self.__prioritized_queue) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-12, warpins: 1 ---
		slot4 = 1
		local front = table.remove(slot2, self.__queue)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 13-14, warpins: 2 ---
	if front then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 15-23, warpins: 1 ---
		slot5 = front.optimized_cutscene_name

		front.optimizer.export_to_database(slot3, front.optimizer)

		slot4 = front.optimizer

		front.optimizer.free_cached_animations(slot3)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 24-26, warpins: 2 ---
	slot4 = self

	return self.queue_size(slot3)
	--- END OF BLOCK #2 ---



end
function CoreCutsceneBatchOptimizer:queue_size()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	return #self.__queue + #self.__prioritized_queue
	--- END OF BLOCK #0 ---



end
function CoreCutsceneBatchOptimizer:max_queue_size()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if not self.__max_queue_size then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-4, warpins: 1 ---
		slot1 = 0
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-5, warpins: 2 ---
	return slot1
	--- END OF BLOCK #1 ---



end
function CoreCutsceneBatchOptimizer:_load_project(project_name)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	slot6 = project_name

	if self.__database.has(slot3, self.__database, "cutscene_project") then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-14, warpins: 1 ---
		slot6 = project_name
		local database_entry = self.__database.lookup(slot3, self.__database, "cutscene_project")
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 15-16, warpins: 2 ---
	if database_entry then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 17-25, warpins: 1 ---
		local project = core_or_local(slot4)
		slot8 = database_entry

		project.set_database_entry("CutsceneEditorProject", project, self.__database)

		return project
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 26-27, warpins: 2 ---
	return nil
	--- END OF BLOCK #2 ---



end
function CoreCutsceneBatchOptimizer:_create_optimizer_for_project(project)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-11, warpins: 1 ---
	slot4 = "CutsceneOptimizer"
	local optimizer = core_or_local(slot3)
	slot5 = optimizer
	slot3 = optimizer.set_compression_enabled
	slot6 = "win32"
	slot9 = project

	if project.export_type(slot8) ~= "in_game_use" then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 12-13, warpins: 1 ---
		slot7 = false
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 14-14, warpins: 1 ---
		slot7 = true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 15-26, warpins: 2 ---
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
	--- BLOCK #2 27-36, warpins: 0 ---
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
		--- BLOCK #0 27-34, warpins: 1 ---
		slot12 = clip_descriptor
		local clip = self._create_clip(slot10, self)
		slot13 = clip

		optimizer.add_clip(self, optimizer)
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 35-36, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 37-42, warpins: 1 ---
	slot8 = project

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 43-48, warpins: 0 ---
	for _, key in ipairs(project.cutscene_keys(slot7)) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 43-46, warpins: 1 ---
		slot12 = key

		optimizer.add_key(slot10, optimizer)
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 47-48, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 49-54, warpins: 1 ---
	slot8 = project

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 55-70, warpins: 0 ---
	for unit_name, patches in pairs(project.animation_patches(slot7)) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 55-57, warpins: 1 ---
		slot9 = pairs

		if not patches then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 58-58, warpins: 1 ---
			slot11 = {}
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 59-60, warpins: 2 ---
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 61-68, warpins: 0 ---
		for blend_set, animation in slot9(slot10) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 61-66, warpins: 1 ---
			slot19 = animation

			optimizer.add_animation_patch(slot15, optimizer, unit_name, blend_set)
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 67-68, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 69-70, warpins: 2 ---
		--- END OF BLOCK #3 ---



	end

	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #7 71-72, warpins: 1 ---
	return optimizer
	--- END OF BLOCK #7 ---



end
function CoreCutsceneBatchOptimizer:_create_clip(clip_descriptor)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-28, warpins: 1 ---
	slot6 = "CutsceneFootage"
	slot10 = clip_descriptor.cutscene
	slot5 = "Cutscene \"" .. clip_descriptor.cutscene .. "\" does not exist."
	local footage = assert(slot3, core_or_local("Cutscene \"" .. clip_descriptor.cutscene .. "\" does not exist.", managers.cutscene.get_cutscene(slot8, managers.cutscene)))
	slot8 = clip_descriptor.camera
	local clip = footage.create_clip(core_or_local("Cutscene \"" .. clip_descriptor.cutscene .. "\" does not exist.", managers.cutscene.get_cutscene(slot8, managers.cutscene)), footage, clip_descriptor.from, clip_descriptor.to)
	slot7 = clip_descriptor.offset - clip_descriptor.from

	clip.offset_by(footage, clip)

	return clip
	--- END OF BLOCK #0 ---



end

return 

--- END OF BLOCK #0 ---

FLOW; TARGET BLOCK #2



-- Decompilation error in this vicinity:
--- BLOCK #1 13-14, warpins: 1 ---
slot0 = class()
--- END OF BLOCK #1 ---

FLOW; TARGET BLOCK #2



-- Decompilation error in this vicinity:
--- BLOCK #2 15-43, warpins: 2 ---
--- END OF BLOCK #2 ---



