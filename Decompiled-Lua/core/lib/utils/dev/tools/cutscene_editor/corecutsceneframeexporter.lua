slot2 = "core/lib/utils/dev/tools/cutscene_editor/CoreCutsceneFrameVisitor"

require(slot1)

if not CoreCutsceneFrameExporter then
	slot2 = CoreCutsceneFrameVisitor
	slot0 = class(slot1)
end

CoreCutsceneFrameExporter = slot0
function CoreCutsceneFrameExporter:init(parent_window, cutscene_editor, start_frame, end_frame, collection_name)
	slot12 = end_frame

	self.super.init(slot7, self, parent_window, cutscene_editor, start_frame)

	slot10 = collection_name
	self.__collection_name = assert(tostring(parent_window))

	return 
end
function CoreCutsceneFrameExporter:begin()
	slot3 = self

	self.super.begin(slot2)

	slot4 = "/frames"

	if not SystemFS.is_dir(slot2, SystemFS) then
		slot6 = "/frames"
		slot4 = "A root-level file named \"frames\" exists. Unable to create \"frames\" folder."

		assert(slot2, SystemFS.exists(slot4, SystemFS) == false)

		slot4 = "/frames"

		SystemFS.make_dir(slot2, SystemFS)
	end

	local output_dir = "/frames/" .. self.__collection_name
	slot5 = output_dir

	if SystemFS.exists(slot3, SystemFS) then
		slot5 = output_dir

		SystemFS.delete_file(slot3, SystemFS)
	end

	slot5 = output_dir

	SystemFS.make_dir(slot3, SystemFS)

	slot4 = self

	self._disable_visual_aids(slot3)

	return 
end
function CoreCutsceneFrameExporter:_progress_message(frame)
	slot6 = frame

	return "Writing image " .. self._image_file_name(slot4, self)
end
function CoreCutsceneFrameExporter:_visit_frame(frame)
	slot5 = self.__collection_name
	slot9 = frame
	local file_path = string.format(slot3, "/frames/%s/%s", self._image_file_name(slot7, self))
	slot6 = file_path

	Application.screenshot("/frames/%s/%s", Application)

	return 
end
function CoreCutsceneFrameExporter:_cleanup()
	slot3 = self

	self._enable_visual_aids(slot2)

	slot3 = self

	self.super._cleanup(slot2)

	return 
end
function CoreCutsceneFrameExporter:_image_file_name(frame)
	slot5 = frame

	return string.format(slot3, "%08i.tga")
end
function CoreCutsceneFrameExporter:_enable_visual_aids()
	if self.__cutscene_editor_camera_was_enabled ~= nil then
		slot4 = self.__cutscene_editor_camera_was_enabled

		self.__cutscene_editor.set_cutscene_camera_enabled(slot2, self.__cutscene_editor)
	end

	if managers.editor then
		if self.__editor_show_camera_info_was_enabled ~= nil then
			slot4 = self.__editor_show_camera_info_was_enabled

			managers.editor.set_show_camera_info(slot2, managers.editor)
		end

		if self.__editor_draw_grid_was_enabled ~= nil then
			managers.editor._layer_draw_grid = self.__editor_draw_grid_was_enabled
		end

		if self.__editor_show_marker_was_enabled ~= nil then
			managers.editor._layer_draw_marker = self.__editor_show_marker_was_enabled
		end

		if self.__editor_show_center_was_enabled ~= nil then
			managers.editor._show_center = self.__editor_show_center_was_enabled
		end
	end

	return 
end
function CoreCutsceneFrameExporter:_disable_visual_aids()
	slot3 = self.__cutscene_editor
	self.__cutscene_editor_camera_was_enabled = self.__cutscene_editor.cutscene_camera_enabled(slot2)
	slot4 = true

	self.__cutscene_editor.set_cutscene_camera_enabled(slot2, self.__cutscene_editor)

	if managers.editor then
		self.__editor_show_camera_info_was_enabled = managers.editor._show_camera_position == true
		self.__editor_draw_grid_was_enabled = managers.editor._layer_draw_grid == true
		self.__editor_show_marker_was_enabled = managers.editor._layer_draw_marker == true
		self.__editor_show_center_was_enabled = managers.editor._show_center == true
		slot4 = false

		managers.editor.set_show_camera_info(slot2, managers.editor)

		managers.editor._layer_draw_grid = false
		managers.editor._layer_draw_marker = false
		managers.editor._show_center = false
	end

	return 
end

return 
