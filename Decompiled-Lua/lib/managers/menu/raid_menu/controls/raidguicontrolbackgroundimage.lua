RaidGUIControlBackgroundImage = RaidGUIControlBackgroundImage or class()
function RaidGUIControlBackgroundImage:init()
	slot3 = managers.gui_data
	self._workspace = managers.gui_data.create_fullscreen_workspace(slot2)
	slot3 = self._workspace
	self._panel = self._workspace.panel(slot2)
	self._base_resolution = tweak_data.gui.base_resolution
	slot8 = "resolution_changed"
	self._resolution_changed_callback_id = managers.viewport.add_resolution_changed_func(slot2, callback(slot5, self, self))
	local video_params = {
		loop = true,
		video = "movies/vanilla/raid_anim_bg"
	}
	slot5 = video_params
	self._object = self._panel.video(managers.viewport, self._panel)
	slot5 = self._object

	managers.video.add_video(managers.viewport, managers.video)

	return 
end
function RaidGUIControlBackgroundImage:_real_aspect_ratio()
	slot4 = "WIN32"

	if SystemInfo.platform(slot2) == Idstring(SystemInfo) then
		return RenderSettings.aspect_ratio
	else
		slot3 = Application
		local screen_res = Application.screen_resolution(slot2)
		local screen_pixel_aspect = screen_res.x / screen_res.y

		return screen_pixel_aspect
	end

	return 
end
function RaidGUIControlBackgroundImage:set_visible(visible)
	if visible then
		slot4 = self._object

		self._object.play(slot3)
	else
		slot4 = self._object

		self._object.pause(slot3)
	end

	slot5 = visible

	self._object.set_visible(slot3, self._object)

	return 
end
function RaidGUIControlBackgroundImage:destroy()
	slot4 = "[RaidGUIControlBackgroundImage:destroy]"

	Application.debug(slot2, Application)

	if self._resolution_changed_callback_id then
		slot4 = self._resolution_changed_callback_id

		managers.viewport.remove_resolution_changed_func(slot2, managers.viewport)
	end

	slot4 = self._object

	managers.video.remove_video(slot2, managers.video)

	slot3 = self._panel

	self._panel.clear(slot2)

	slot4 = self._workspace

	managers.gui_data.destroy_workspace(slot2, managers.gui_data)

	return 
end
function RaidGUIControlBackgroundImage:resolution_changed()
	slot4 = self._workspace

	managers.gui_data.layout_fullscreen_workspace(slot2, managers.gui_data)

	local x = (self._panel.w(slot2) - self._base_resolution.x) / 2
	local y = (self._panel.h(self._panel) - self._base_resolution.y) / 2
	slot6 = x

	self._object.set_x(self._panel, self._object)

	slot6 = y

	self._object.set_y(self._panel, self._object)

	return 
end

return 
