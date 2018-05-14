-- Decompilation Error: _run_step(_unwarp_expressions, node)

-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
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

-- Decompilation error in this vicinity:
--- BLOCK #0 1-3, warpins: 1 ---
slot0 = CoreCutsceneClipMetadata or class()
CoreCutsceneClipMetadata = slot0
function CoreCutsceneClipMetadata:init(footage, camera)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	self._footage = footage
	self._camera = camera

	return 
	--- END OF BLOCK #0 ---



end
function CoreCutsceneClipMetadata:is_valid()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot3 = self

	if self.camera_index(slot2) == nil then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-7, warpins: 1 ---
		slot1 = false
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-8, warpins: 1 ---
		slot1 = true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 9-9, warpins: 2 ---
	return slot1
	--- END OF BLOCK #1 ---



end
function CoreCutsceneClipMetadata:footage()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	return self._footage
	--- END OF BLOCK #0 ---



end
function CoreCutsceneClipMetadata:camera()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	return self._camera
	--- END OF BLOCK #0 ---



end
function CoreCutsceneClipMetadata:set_camera(camera)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	self._camera = camera

	return 
	--- END OF BLOCK #0 ---



end
function CoreCutsceneClipMetadata:camera_index()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot3 = self

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 21-21, warpins: 2 ---
	return slot1
	--- END OF BLOCK #1 ---



end
function CoreCutsceneClipMetadata:camera_icon_image()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	local icon_index = 0
	slot4 = self

	if self.footage(slot3) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-11, warpins: 1 ---
		slot4 = self

		if self.camera(slot3) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 12-21, warpins: 1 ---
			slot4 = self
			slot4 = self.footage(slot3)
			slot7 = self
			icon_index = self.footage(slot3).camera_icon_index(slot3, self.camera(slot6))
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 22-29, warpins: 3 ---
	slot7 = icon_index

	return CoreEWS.image_path(string.format(slot5, "sequencer\\clip_icon_camera_%02i.bmp"))
	--- END OF BLOCK #1 ---



end
function CoreCutsceneClipMetadata:camera_watermark()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot3 = self

	if self.footage(slot2) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-10, warpins: 1 ---
		slot3 = self

		if self.camera(slot2) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 11-22, warpins: 1 ---
			slot5 = self
			slot4 = "camera_(.+)"
			local name_without_prefix = string.match(slot2, self.camera("camera_(.+)"))
			slot4 = name_without_prefix
			local as_number = tonumber(self.camera("camera_(.+)"))
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 34-40, warpins: 2 ---
			slot9 = -2

			return slot3, 12, "ALIGN_CENTER_HORIZONTAL,ALIGN_CENTER_VERTICAL", Vector3(slot7, 0)
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 41-42, warpins: 3 ---
	return nil
	--- END OF BLOCK #1 ---



end
function CoreCutsceneClipMetadata:prime_cast(cast)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	slot4 = self
	slot5 = cast

	self.footage(slot3).prime_cast(slot3, self.footage(slot3))

	return 
	--- END OF BLOCK #0 ---



end

return 

--- END OF BLOCK #0 ---

FLOW; TARGET BLOCK #2



-- Decompilation error in this vicinity:
--- BLOCK #1 4-5, warpins: 1 ---
slot0 = class()
--- END OF BLOCK #1 ---

FLOW; TARGET BLOCK #2



-- Decompilation error in this vicinity:
--- BLOCK #2 6-34, warpins: 2 ---
--- END OF BLOCK #2 ---



