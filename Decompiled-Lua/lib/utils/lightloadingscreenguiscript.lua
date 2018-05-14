LightLoadingScreenGuiScript = LightLoadingScreenGuiScript or class()
LightLoadingScreenGuiScript.init = function (self, scene_gui, res, progress, base_layer, is_win32)
	self._base_layer = base_layer
	self._is_win32 = is_win32
	self._scene_gui = scene_gui
	self._res = res
	slot8 = scene_gui
	self._ws = scene_gui.create_screen_workspace(slot7)
	slot9 = res
	self._safe_rect_pixels = self.get_safe_rect_pixels(slot7, self)
	slot8 = self._scene_gui
	self._saferect = self._scene_gui.create_screen_workspace(slot7)
	slot8 = self

	self.layout_saferect(slot7)

	local panel = self._ws.panel(slot7)
	self._panel = panel
	self._bg_gui = panel.rect(self._ws, panel)
	slot9 = self._saferect
	self._saferect_panel = self._saferect.panel(self._ws)
	self._gui_tweak_data = {
		upper_saferect_border = 64,
		border_pad = 8
	}
	slot12 = "debug_loading_level"
	local text = string.upper(managers.localization.text({
		visible = false,
		color = Color.black,
		layer = base_layer
	}, managers.localization))
	slot11 = {
		visible = false,
		vertical = "bottom",
		h = 24,
		y = 0,
		font_size = 32,
		align = "left",
		font = "ui/fonts/pf_din_text_comp_pro_medium_32",
		halign = "left",
		text = text,
		color = Color.white,
		layer = self._base_layer + 1
	}
	self._title_text = self._saferect_panel.text(managers.localization.text, self._saferect_panel)
	slot11 = {
		texture = "guis/textures/game_small_logo",
		name = "stonecold_small_logo",
		h = 56,
		visible = false,
		texture_rect = {
			0,
			0,
			256,
			56
		},
		layer = self._base_layer + 1
	}
	self._stonecold_small_logo = self._saferect_panel.bitmap(managers.localization.text, self._saferect_panel)
	slot12 = 56

	self._stonecold_small_logo.set_size(managers.localization.text, self._stonecold_small_logo, 256)

	self._dot_count = 0
	self._max_dot_count = 4
	self._init_progress = 0
	self._fake_progress = 0
	self._max_bar_width = 0
	slot12 = progress

	self.setup(managers.localization.text, self, res)

	return 
end
LightLoadingScreenGuiScript.layout_saferect = function (self)
	local scaled_size = {
		x = 0,
		height = 674,
		width = 1198,
		y = 0
	}
	local w = scaled_size.width
	local h = scaled_size.height
	slot7 = self._safe_rect_pixels.width / w / h
	local sh = math.min(slot5, self._safe_rect_pixels.height)
	slot8 = self._safe_rect_pixels.height * w / h
	local sw = math.min(self._safe_rect_pixels.height, self._safe_rect_pixels.width)
	local x = math.round(self._safe_rect_pixels.width)
	local y = math.round(self._res.x / 2 - (sh * w / h) / 2)
	slot15 = sw

	self._saferect.set_screen(self._res.y / 2 - sw / w / h / 2, self._saferect, w, h, x, y)

	return 
end
LightLoadingScreenGuiScript.get_safe_rect = function (self)
	local a = (self._is_win32 and 0.032) or 0.075
	local b = 1 - a * 2

	return {
		x = a,
		y = a,
		width = b,
		height = b
	}
end
LightLoadingScreenGuiScript.get_safe_rect_pixels = function (self, res)
	slot4 = self
	local safe_rect_scale = self.get_safe_rect(slot3)
	local safe_rect_pixels = {
		x = safe_rect_scale.x * res.x,
		y = safe_rect_scale.y * res.y,
		width = safe_rect_scale.width * res.x,
		height = safe_rect_scale.height * res.y
	}

	return safe_rect_pixels
end
LightLoadingScreenGuiScript.setup = function (self, res, progress)
	self._gui_tweak_data = {
		upper_saferect_border = 64,
		border_pad = 8
	}
	slot6 = 32

	self._title_text.set_font_size(8, self._title_text)

	slot7 = 56

	self._stonecold_small_logo.set_size(8, self._stonecold_small_logo, 256)

	slot9 = self._gui_tweak_data.upper_saferect_border - self._gui_tweak_data.border_pad

	self._title_text.set_shape(8, self._title_text, 0, 0, self._safe_rect_pixels.width)

	slot5 = self._title_text
	local _, _, w, _ = self._title_text.text_rect(8)
	slot10 = w

	self._title_text.set_w(self._safe_rect_pixels.width, self._title_text)

	slot9 = self._stonecold_small_logo
	slot12 = self._stonecold_small_logo
	slot12 = self._stonecold_small_logo.parent(slot11)

	self._stonecold_small_logo.set_right(self._safe_rect_pixels.width, self._stonecold_small_logo.parent(slot11).w(slot11))

	slot10 = self._gui_tweak_data.upper_saferect_border - self._gui_tweak_data.border_pad

	self._stonecold_small_logo.set_bottom(self._safe_rect_pixels.width, self._stonecold_small_logo)

	slot11 = res.y

	self._bg_gui.set_size(self._safe_rect_pixels.width, self._bg_gui, res.x)

	if 0 < progress then
		self._init_progress = progress
	end

	return 
end
LightLoadingScreenGuiScript.update = function (self, progress, dt)
	if self._init_progress < 100 and progress == -1 then
		self._fake_progress = self._fake_progress + 20 * dt

		if 100 < self._fake_progress then
			self._fake_progress = 100
		end

		progress = self._fake_progress
	end

	return 
end
LightLoadingScreenGuiScript.set_text = function (self, text)
	return 
end
LightLoadingScreenGuiScript.destroy = function (self)
	slot3 = self._ws

	if alive(slot2) then
		slot4 = self._ws

		self._scene_gui.destroy_workspace(slot2, self._scene_gui)

		slot4 = self._saferect

		self._scene_gui.destroy_workspace(slot2, self._scene_gui)

		self._ws = nil
		self._saferect = nil
	end

	return 
end
LightLoadingScreenGuiScript.visible = function (self)
	slot3 = self._ws

	return self._ws.visible(slot2)
end
LightLoadingScreenGuiScript.set_visible = function (self, visible, res)
	if res then
		self._res = res
		slot6 = res
		self._safe_rect_pixels = self.get_safe_rect_pixels(slot4, self)
		slot5 = self

		self.layout_saferect(slot4)

		slot7 = -1

		self.setup(slot4, self, res)
	end

	if visible then
		slot5 = self._ws

		self._ws.show(slot4)

		slot5 = self._saferect

		self._saferect.show(slot4)
	else
		slot5 = self._ws

		self._ws.hide(slot4)

		slot5 = self._saferect

		self._saferect.hide(slot4)
	end

	return 
end

return 
