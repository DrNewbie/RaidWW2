slot2 = "core/lib/utils/dev/tools/cutscene_editor/CoreCutsceneClipMetadata"

require(slot1)

slot2 = "core/lib/managers/cutscene/CoreCutsceneKeys"

require(slot1)

local CAMERA_ICON_IMAGE_COUNT = 30
CoreCutsceneFootage = CoreCutsceneFootage or class()
function CoreCutsceneFootage:init(cutscene)
	self._cutscene = cutscene

	return 
end
function CoreCutsceneFootage:name()
	slot3 = self._cutscene

	return self._cutscene.name(slot2)
end
function CoreCutsceneFootage:controlled_unit_types()
	slot3 = self._cutscene

	return self._cutscene.controlled_unit_types(slot2)
end
function CoreCutsceneFootage:camera_names()
	slot3 = self._cutscene

	return self._cutscene.camera_names(slot2)
end
function CoreCutsceneFootage:keys()
	slot3 = self._cutscene

	return self._cutscene._all_keys_sorted_by_time(slot2)
end
function CoreCutsceneFootage:add_clips_to_track(track, time)
	time = time or 0
	slot5 = track

	track.freeze(slot4)

	slot5 = self

	for start_frame, end_frame, camera in self._camera_cuts(slot4) do
		slot11 = track
		slot17 = camera

		track.add_clip(slot10, self.create_clip(slot13, self, start_frame, end_frame))
	end

	slot5 = track

	track.thaw(slot4)

	return 
end
function CoreCutsceneFootage:add_cameras_to_list_ctrl(list_ctrl)
	slot4 = list_ctrl

	list_ctrl.freeze(slot3)

	slot4 = list_ctrl

	list_ctrl.delete_all_items(slot3)

	slot6 = self

	for _, camera_name in ipairs(self.camera_names(slot5)) do
		slot10 = camera_name
		local item = list_ctrl.append_item(slot8, list_ctrl)
		slot11 = camera_name
		slot14 = list_ctrl
		local icon_index = self.camera_icon_index(list_ctrl, self, list_ctrl.image_count(slot13))
		slot13 = icon_index

		list_ctrl.set_item_image(self, list_ctrl, item)
	end

	slot4 = list_ctrl

	list_ctrl.thaw(slot3)

	return 
end
function CoreCutsceneFootage:create_clip(start_frame, end_frame, camera)
	local clip = EWS.SequencerCroppedClip(slot5)
	slot9 = camera
	local metadata = core_or_local(EWS, "CutsceneClipMetadata", self)
	slot9 = metadata

	clip.set_metadata("CutsceneClipMetadata", clip)

	slot8 = clip
	slot11 = metadata

	clip.set_icon_bitmap("CutsceneClipMetadata", metadata.camera_icon_image(slot10))

	slot8 = clip

	clip.set_watermark("CutsceneClipMetadata", metadata.camera_watermark(slot10))

	slot10 = end_frame

	clip.set_range("CutsceneClipMetadata", clip, start_frame)

	slot9 = 0
	slot12 = self._cutscene

	clip.set_uncropped_range("CutsceneClipMetadata", clip, self._cutscene.frame_count(metadata))

	slot8 = clip
	slot11 = self
	slot11 = self.colour(self._cutscene.frame_count)

	clip.set_colour("CutsceneClipMetadata", self.colour(self._cutscene.frame_count).unpack(self._cutscene.frame_count))

	return clip
end
function CoreCutsceneFootage:frame_count()
	slot3 = self._cutscene

	return self._cutscene.frame_count(slot2)
end
function CoreCutsceneFootage:colour()
	if self._colour == nil then
		local precision = 255
		local r = 26
		local g = 52
		local b = 78
		local name = self._cutscene.name(slot6)
		slot8 = name
		local len = string.len(self._cutscene)

		for i = 1, len, 1 do
			slot14 = i
			local byte = string.byte(slot12, name)
			slot15 = precision + 1
			r = math.fmod(name, r * 33 + byte)
			slot15 = precision + 1
			g = math.fmod(name, g * 33 + byte)
			slot15 = precision + 1
			b = math.fmod(name, b * 33 + byte)
		end

		local black_value = 0.7
		local divisor = precision * 1 / (1 - black_value)
		slot13 = black_value + b / divisor
		self._colour = Color(slot10, black_value + r / divisor, black_value + g / divisor)
	end

	return self._colour
end
function CoreCutsceneFootage:camera_icon_index(camera_name, image_count)
	image_count = image_count or CAMERA_ICON_IMAGE_COUNT + 1
	slot6 = "camera_(.+)"
	local name_without_prefix = string.match(slot4, camera_name)
	slot6 = name_without_prefix

	if not tonumber(camera_name) then
		slot8 = self
		local icon_index = table.get_vector_index(slot5, self.camera_names(camera_name)) or 0
	end

	if image_count <= icon_index then
		icon_index = 0
	end

	return icon_index
end
function CoreCutsceneFootage:_camera_cuts()
	slot3 = self
	local cuts = self._camera_cut_list(slot2)
	local index = 0

	return function ()
		index = index + 1
		slot2 = cuts[index] or {}

		return unpack(slot1)
	end
end
function CoreCutsceneFootage:_camera_cut_list()
	if self._camera_cut_cache == nil then
		self._camera_cut_cache = {}
		slot3 = self._cutscene

		if self._cutscene.has_cameras(slot2) then
			local function add_camera_cut(start_frame, end_frame, camera)
				if start_frame < end_frame then
					slot6 = {
						start_frame,
						end_frame,
						camera
					}

					table.insert(slot4, self._camera_cut_cache)
				end

				return 
			end

			slot7 = self._cutscene
			local previous_key = responder_map(slot3)
			slot6 = CoreChangeCameraCutsceneKey.ELEMENT_NAME

			for key in self._cutscene.keys({
				frame = 0,
				camera = self._cutscene.default_camera(slot6)
			}, self._cutscene) do
				slot13 = previous_key

				add_camera_cut(slot8, previous_key.frame(key.frame(previous_key)), previous_key.camera(key))

				previous_key = key
			end

			slot9 = previous_key

			add_camera_cut(slot4, previous_key.frame(self._cutscene.frame_count(previous_key)), previous_key.camera(self._cutscene))
		end
	end

	return self._camera_cut_cache
end
function CoreCutsceneFootage:prime_cast(cast)
	slot5 = self._cutscene

	cast.prime(slot3, cast)

	return 
end

return 
