if core then
	slot3 = "CoreGuiDataManager"

	core.module(slot1, core)
end

GuiDataManager = GuiDataManager or class()
function GuiDataManager:init(scene_gui, res, safe_rect_pixels, safe_rect, static_aspect_ratio)
	self._scene_gui = scene_gui
	self._static_resolution = res
	self._safe_rect_pixels = safe_rect_pixels
	self._safe_rect = safe_rect
	self._static_aspect_ratio = static_aspect_ratio
	slot8 = self

	self._setup_workspace_data(slot7)

	return 
end
function GuiDataManager:destroy()
	return 
end
function GuiDataManager:create_saferect_workspace()
	if not self._scene_gui then
		slot3 = Overlay
		slot1 = Overlay.gui(slot2)
	end

	slot8 = 10
	local ws = slot1.create_scaled_screen_workspace(slot2, slot1, 10, 10, 10, 10)
	slot5 = ws

	self.layout_workspace(slot1, self)

	return ws
end
function GuiDataManager:create_fullscreen_workspace()
	if not self._scene_gui then
		slot3 = Overlay
		slot1 = Overlay.gui(slot2)
	end

	slot8 = 10
	local ws = slot1.create_scaled_screen_workspace(slot2, slot1, 10, 10, 10, 10)
	slot5 = ws

	self.layout_fullscreen_workspace(slot1, self)

	return ws
end
function GuiDataManager:create_fullscreen_16_9_workspace()
	if not self._scene_gui then
		slot3 = Overlay
		slot1 = Overlay.gui(slot2)
	end

	slot8 = 10
	local ws = slot1.create_scaled_screen_workspace(slot2, slot1, 10, 10, 10, 10)
	slot5 = ws

	self.layout_fullscreen_16_9_workspace(slot1, self)

	return ws
end
function GuiDataManager:create_corner_saferect_workspace()
	if not self._scene_gui then
		slot3 = Overlay
		slot1 = Overlay.gui(slot2)
	end

	slot8 = 10
	local ws = slot1.create_scaled_screen_workspace(slot2, slot1, 10, 10, 10, 10)
	slot5 = ws

	self.layout_corner_saferect_workspace(slot1, self)

	return ws
end
function GuiDataManager:create_1280_workspace()
	if not self._scene_gui then
		slot3 = Overlay
		slot1 = Overlay.gui(slot2)
	end

	slot8 = 10
	local ws = slot1.create_scaled_screen_workspace(slot2, slot1, 10, 10, 10, 10)
	slot5 = ws

	self.layout_1280_workspace(slot1, self)

	return ws
end
function GuiDataManager:create_corner_saferect_1280_workspace()
	if not self._scene_gui then
		slot3 = Overlay
		slot1 = Overlay.gui(slot2)
	end

	slot8 = 10
	local ws = slot1.create_scaled_screen_workspace(slot2, slot1, 10, 10, 10, 10)
	slot5 = ws

	self.layout_corner_saferect_1280_workspace(slot1, self)

	return ws
end
function GuiDataManager:destroy_workspace(ws)
	if not self._scene_gui then
		slot4 = Overlay
		slot2 = Overlay.gui(slot3)
	end

	slot5 = ws

	slot2.destroy_workspace(slot3, slot2)

	return 
end
function GuiDataManager:get_scene_gui()
	if not self._scene_gui then
		slot3 = Overlay
		slot1 = Overlay.gui(slot2)
	end

	return slot1
end
function GuiDataManager:_get_safe_rect_pixels()
	if self._safe_rect_pixels then
		return self._safe_rect_pixels
	end

	slot3 = managers.viewport

	return managers.viewport.get_safe_rect_pixels(slot2)
end
function GuiDataManager:_get_safe_rect()
	if self._safe_rect then
		return self._safe_rect
	end

	slot3 = managers.viewport

	return managers.viewport.get_safe_rect(slot2)
end
function GuiDataManager:_aspect_ratio()
	if self._static_aspect_ratio then
		return self._static_aspect_ratio
	end

	slot3 = managers.viewport

	return managers.viewport.aspect_ratio(slot2)
end
local base_res = {
	x = 1920,
	y = 1080
}
function GuiDataManager:_setup_workspace_data()
	slot3 = "[GuiDataManager:_setup_workspace_data]"

	print(slot2)

	self._saferect_data = {}
	self._corner_saferect_data = {}
	self._fullrect_data = {}
	self._fullrect_16_9_data = {}
	self._fullrect_1280_data = {}
	self._corner_saferect_1280_data = {}
	local safe_rect = self._get_safe_rect_pixels(slot2)
	slot4 = self
	local scaled_size = self.scaled_size(self)
	local res = self._static_resolution or RenderSettings.resolution
	local scaled_w = scaled_size.width
	local scaled_h = scaled_size.height
	local scaled_aspect = scaled_w / scaled_h
	slot10 = safe_rect.width / scaled_aspect
	local safe_h = math.min(slot8, safe_rect.height)
	slot11 = safe_rect.height * scaled_aspect
	local safe_w = math.min(safe_rect.height, safe_rect.width)
	local safe_x = (res.x - safe_h * scaled_aspect) / 2
	local safe_y = (res.y - safe_w / scaled_aspect) / 2
	self._safe_x = safe_x
	self._safe_y = safe_y
	self._saferect_data.w = scaled_w
	self._saferect_data.h = scaled_h
	self._saferect_data.width = scaled_w
	self._saferect_data.height = scaled_h
	self._saferect_data.x = safe_x
	self._saferect_data.y = safe_y
	self._saferect_data.on_screen_width = safe_w
	local h_c = scaled_w / safe_rect.width / safe_rect.height
	slot15 = h_c
	scaled_h = math.max(slot13, scaled_h)
	local w_c = h_c / scaled_h
	slot16 = scaled_w / w_c
	scaled_w = math.max(scaled_h, scaled_w)
	self._corner_saferect_data.w = scaled_w
	self._corner_saferect_data.h = scaled_h
	self._corner_saferect_data.width = scaled_w
	self._corner_saferect_data.height = scaled_h
	self._corner_saferect_data.x = safe_rect.x
	self._corner_saferect_data.y = safe_rect.y
	self._corner_saferect_data.on_screen_width = safe_rect.width
	slot16 = self
	slot14 = self._aspect_ratio(scaled_w)
	safe_h = base_res.x / slot14
	slot16 = safe_h
	scaled_h = math.max(slot14, base_res.y)
	safe_w = safe_h / scaled_h
	slot16 = base_res.x / safe_w
	scaled_w = math.max(slot14, base_res.x)
	self._fullrect_data.w = scaled_w
	self._fullrect_data.h = scaled_h
	self._fullrect_data.width = scaled_w
	self._fullrect_data.height = scaled_h
	self._fullrect_data.x = 0
	self._fullrect_data.y = 0
	self._fullrect_data.on_screen_width = res.x
	slot16 = (scaled_w - self._saferect_data.w) / 2
	self._fullrect_data.convert_x = math.floor(base_res.x)
	self._fullrect_data.convert_y = (scaled_h - scaled_size.height) / 2
	slot16 = (self._fullrect_data.width - self._corner_saferect_data.width) / 2
	self._fullrect_data.corner_convert_x = math.floor(base_res.x)
	slot16 = (self._fullrect_data.height - self._corner_saferect_data.height) / 2
	slot14 = math.floor(base_res.x)
	self._fullrect_data.corner_convert_y = slot14
	scaled_w = base_res.x
	scaled_h = base_res.y
	slot16 = res.x / scaled_aspect
	safe_h = math.min(slot14, res.y)
	slot16 = res.y * scaled_aspect
	safe_w = math.min(slot14, res.x)
	local safe_x = (res.x - safe_h * scaled_aspect) / 2
	local safe_y = (res.y - safe_w / scaled_aspect) / 2
	self._fullrect_16_9_data.w = scaled_w
	self._fullrect_16_9_data.h = scaled_h
	self._fullrect_16_9_data.width = scaled_w
	self._fullrect_16_9_data.height = scaled_h
	self._fullrect_16_9_data.x = safe_x
	self._fullrect_16_9_data.y = safe_y
	self._fullrect_16_9_data.on_screen_width = safe_w
	slot18 = (self._fullrect_16_9_data.w - self._saferect_data.w) / 2
	self._fullrect_16_9_data.convert_x = math.floor(self._corner_saferect_data.height)
	self._fullrect_16_9_data.convert_y = (self._fullrect_16_9_data.h - self._saferect_data.h) / 2
	slot19 = 1.7777777777777777
	local aspect = math.clamp((self._fullrect_16_9_data.h - self._saferect_data.h) / 2, res.x / res.y, 1)
	scaled_w = base_res.x
	scaled_h = base_res.x / aspect
	slot19 = res.y * aspect
	safe_w = math.min(res.x / res.y, res.x)
	safe_h = safe_w / scaled_w * scaled_h
	safe_x = (res.x - safe_w) / 2
	safe_y = (res.y - safe_h) / 2
	self._fullrect_1280_data.w = scaled_w
	self._fullrect_1280_data.h = scaled_h
	self._fullrect_1280_data.width = scaled_w
	self._fullrect_1280_data.height = scaled_h
	self._fullrect_1280_data.x = safe_x
	self._fullrect_1280_data.y = safe_y
	self._fullrect_1280_data.on_screen_width = safe_w
	self._fullrect_1280_data.safe_w = safe_w
	self._fullrect_1280_data.safe_h = safe_h
	self._fullrect_1280_data.aspect = aspect
	slot19 = (self._fullrect_data.w - self._fullrect_1280_data.w) / 2
	self._fullrect_1280_data.convert_x = math.floor(res.x)
	slot19 = (self._fullrect_data.h - self._fullrect_1280_data.h) / 2
	self._fullrect_1280_data.convert_y = math.floor(res.x)
	scaled_w = scaled_size.width
	scaled_h = scaled_size.width / aspect
	slot19 = safe_rect.height * aspect
	safe_w = math.min(math.floor(res.x), safe_rect.width)
	safe_h = safe_w / scaled_w * scaled_h
	safe_x = (res.x - safe_w) / 2
	safe_y = (res.y - safe_h) / 2
	self._corner_saferect_1280_data.w = scaled_w
	self._corner_saferect_1280_data.h = scaled_h
	self._corner_saferect_1280_data.width = scaled_w
	self._corner_saferect_1280_data.height = scaled_h
	self._corner_saferect_1280_data.x = safe_x
	self._corner_saferect_1280_data.y = safe_y
	self._corner_saferect_1280_data.on_screen_width = safe_w

	return 
end
function GuiDataManager:layout_workspace(ws)
	slot9 = self._saferect_data.on_screen_width

	ws.set_screen(slot3, ws, self._saferect_data.w, self._saferect_data.h, self._saferect_data.x, self._saferect_data.y)

	return 
end
function GuiDataManager:layout_fullscreen_workspace(ws)
	slot9 = self._fullrect_data.on_screen_width

	ws.set_screen(slot3, ws, self._fullrect_data.w, self._fullrect_data.h, self._fullrect_data.x, self._fullrect_data.y)

	return 
end
function GuiDataManager:layout_fullscreen_16_9_workspace(ws)
	slot9 = self._fullrect_16_9_data.on_screen_width

	ws.set_screen(slot3, ws, self._fullrect_16_9_data.w, self._fullrect_16_9_data.h, self._fullrect_16_9_data.x, self._fullrect_16_9_data.y)

	return 
end
function GuiDataManager:layout_corner_saferect_workspace(ws)
	slot9 = self._corner_saferect_data.on_screen_width

	ws.set_screen(slot3, ws, self._corner_saferect_data.w, self._corner_saferect_data.h, self._corner_saferect_data.x, self._corner_saferect_data.y)

	return 
end
function GuiDataManager:layout_1280_workspace(ws)
	slot9 = self._fullrect_1280_data.on_screen_width

	ws.set_screen(slot3, ws, self._fullrect_1280_data.w, self._fullrect_1280_data.h, self._fullrect_1280_data.x, self._fullrect_1280_data.y)

	return 
end
function GuiDataManager:layout_corner_saferect_1280_workspace(ws)
	slot9 = self._corner_saferect_1280_data.on_screen_width

	ws.set_screen(slot3, ws, self._corner_saferect_1280_data.w, self._corner_saferect_1280_data.h, self._corner_saferect_1280_data.x, self._corner_saferect_1280_data.y)

	return 
end
function GuiDataManager:scaled_size()
	local w = math.round(slot2)
	slot6 = self
	local h = math.round(self._get_safe_rect(self._get_safe_rect(self).height * base_res.y).width * base_res.x)

	return {
		x = 0,
		y = 0,
		width = w,
		height = h
	}
end
function GuiDataManager:safe_scaled_size()
	return self._saferect_data
end
function GuiDataManager:corner_scaled_size()
	return self._corner_saferect_data
end
function GuiDataManager:full_scaled_size()
	return self._fullrect_data
end
function GuiDataManager:full_16_9_size()
	return self._fullrect_16_9_data
end
function GuiDataManager:full_1280_size()
	return self._fullrect_1280_data
end
function GuiDataManager:full_to_full_16_9(in_x, in_y)
	slot5 = self
	slot10 = in_y

	return self.safe_to_full_16_9(slot4, self.full_to_safe(slot7, self, in_x))
end
function GuiDataManager:safe_to_full_16_9(in_x, in_y)
	return self._fullrect_16_9_data.convert_x + in_x, self._fullrect_16_9_data.convert_y + in_y
end
function GuiDataManager:full_16_9_to_safe(in_x, in_y)
	return in_x - self._fullrect_16_9_data.convert_x, in_y - self._fullrect_16_9_data.convert_y
end
function GuiDataManager:safe_to_full(in_x, in_y)
	return self._fullrect_data.convert_x + in_x, self._fullrect_data.convert_y + in_y
end
function GuiDataManager:full_to_safe(in_x, in_y)
	return in_x - self._fullrect_data.convert_x, in_y - self._fullrect_data.convert_y
end
function GuiDataManager:corner_safe_to_full(in_x, in_y)
	return self._fullrect_data.corner_convert_x + in_x, self._fullrect_data.corner_convert_y + in_y
end
function GuiDataManager:y_safe_to_full(in_y)
	return self._fullrect_data.convert_y + in_y
end
function GuiDataManager:resolution_changed()
	slot3 = self

	self._setup_workspace_data(slot2)

	return 
end

return 
