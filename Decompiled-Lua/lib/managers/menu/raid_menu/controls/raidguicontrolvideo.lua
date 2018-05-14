if not RaidGUIControlVideo then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlVideo = slot0
function RaidGUIControlVideo:init(parent, params)
	slot7 = params

	RaidGUIControlVideo.super.init(slot4, self, parent)

	slot5 = self._panel
	slot6 = self._params
	self._object = self._panel.get_engine_panel(slot4).video(slot4, self._panel.get_engine_panel(slot4))
	slot6 = self._object

	managers.video.add_video(slot4, managers.video)

	slot6 = self._params.video
	slot11 = "_update"

	managers.video.add_updator(slot4, managers.video, callback(slot8, self, self))

	slot5 = Overlay
	slot5 = Overlay.gui(slot4)
	self._safe_rect_workspace = Overlay.gui(slot4).create_screen_workspace(slot4)
	slot6 = self._safe_rect_workspace

	managers.gui_data.layout_workspace(slot4, managers.gui_data)

	local safe_panel = self._safe_rect_workspace.panel(slot4)
	slot9 = self._panel
	slot7 = self._panel.layer(slot8) + 10

	safe_panel.set_layer(self._safe_rect_workspace, safe_panel)

	local font_size = tweak_data.gui.font_sizes.size_24
	slot8 = {
		vertical = "center",
		h = 64,
		wrap = true,
		w = 736,
		align = "center",
		text = "",
		y = 778,
		x = 510,
		color = tweak_data.gui.colors.light_grey,
		font = tweak_data.gui.get_font_path(self, tweak_data.gui, tweak_data.gui.fonts.din_compressed_outlined_24),
		font_size = font_size,
		layer = safe_panel.layer(self) + 1
	}
	slot13 = font_size
	slot11 = safe_panel
	self._subtitle = safe_panel.text(safe_panel, safe_panel)

	return 
end
function RaidGUIControlVideo:_update(t, dt)
	slot5 = self._object

	if not alive(slot4) then
		slot5 = self

		self.destroy(slot4)

		return 
	end

	local video_t = self._object.time(slot4)
	slot8 = video_t
	local subtitle = tweak_data.subtitles.get_subtitle(self._object, tweak_data.subtitles, self._params.video)
	slot8 = subtitle

	self._subtitle.set_text(tweak_data.subtitles, self._subtitle)

	return 
end
function RaidGUIControlVideo:destroy()
	slot4 = self._object

	managers.video.remove_video(slot2, managers.video)

	slot4 = self._params.video

	managers.video.remove_updator(slot2, managers.video)

	slot3 = Overlay
	slot4 = self._safe_rect_workspace

	Overlay.gui(slot2).destroy_workspace(slot2, Overlay.gui(slot2))

	return 
end
function RaidGUIControlVideo:loop_count()
	slot3 = self._object

	return self._object.loop_count(slot2)
end
function RaidGUIControlVideo:video_height()
	slot3 = self._object

	return self._object.video_height(slot2)
end
function RaidGUIControlVideo:video_width()
	slot3 = self._object

	return self._object.video_width(slot2)
end
function RaidGUIControlVideo:alive()
	if self._object then
		slot3 = self._object
		slot1 = self._object.alive(slot2)
	end

	return slot1
end

return 
