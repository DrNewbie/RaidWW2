-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not MenuNodeCreditsGui then
	slot2 = MenuNodeGui
	slot0 = class(slot1)
end

MenuNodeCreditsGui = slot0
MenuNodeCreditsGui.PATH = "gamedata/"
MenuNodeCreditsGui.FILE_EXTENSION = "credits"
function MenuNodeCreditsGui:init(node, layer, parameters)
	MenuNodeCreditsGui.super.init(slot5, self, node, layer)

	slot7 = "layer      "
	slot10 = layer

	Application.trace(slot5, Application, inspect(parameters))

	slot7 = node._parameters.credits_file

	self._build_credits_panel(slot5, self)

	slot7 = MusicManager.CREDITS_MUSIC

	managers.music.post_event(slot5, managers.music)

	return 
end
function MenuNodeCreditsGui:_build_credits_panel(file)
	slot4 = SystemInfo
	slot4 = SystemInfo.language(slot3)
	local lang_key = SystemInfo.language(slot3).key(slot3)
	local files = {}
	slot6 = "german"
	slot6 = Idstring(slot5)
	files[Idstring(slot5).key(slot5)] = "_german"
	slot6 = "french"
	slot6 = Idstring("_german")
	files[Idstring("_german").key("_german")] = "_french"
	slot6 = "spanish"
	slot6 = Idstring("_french")
	files[Idstring("_french").key("_french")] = "_spanish"
	slot6 = "italian"
	slot6 = Idstring("_spanish")
	files[Idstring("_spanish").key("_spanish")] = "_italian"
	slot7 = "eu"

	if Application.region("_italian") == Idstring(Application) and file == "eula" then
		slot6 = "english"
		slot6 = Idstring(slot5)
		files[Idstring(slot5).key(slot5)] = "_uk"
	end

	if (file == "eula" or file == "trial") and files[lang_key] and not (file .. files[lang_key]) then
	end

	slot9 = self.FILE_EXTENSION
	slot10 = self.PATH .. file
	local list = PackageManager.script_data(slot5, PackageManager, self.PATH .. file.id(file))
	local ypos = 0
	slot8 = managers.gui_data
	local safe_rect_pixels = managers.gui_data.scaled_size(self.FILE_EXTENSION.id(slot8))
	local res = RenderSettings.resolution
	local global_scale = 1
	local side_padding = 200
	slot12 = managers.gui_data
	self._fullscreen_ws = managers.gui_data.create_fullscreen_16_9_workspace(slot11)
	slot12 = self._fullscreen_ws
	slot13 = {
		layer = self.layers.background
	}
	self._clipping_panel = self._fullscreen_ws.panel(slot11).panel(slot11, self._fullscreen_ws.panel(slot11))
	slot13 = {
		visible = true,
		color = Color.black / 2,
		layer = self.layers.background
	}
	local bg = self._clipping_panel.rect(slot11, self._clipping_panel)
	slot14 = 0

	bg.set_top(self._clipping_panel, bg)

	slot14 = 0

	bg.set_left(self._clipping_panel, bg)

	slot13 = bg
	slot16 = self._clipping_panel

	bg.set_height(self._clipping_panel, self._clipping_panel.height(slot15))

	slot13 = bg
	slot16 = self._clipping_panel

	bg.set_width(self._clipping_panel, self._clipping_panel.width(slot15))

	local text_offset = self._clipping_panel.height(self._clipping_panel) - 50
	slot15 = {
		x = safe_rect_pixels.x + side_padding,
		y = text_offset,
		w = safe_rect_pixels.width - side_padding * 2,
		h = slot16
	}
	slot18 = self._fullscreen_ws
	slot18 = self._fullscreen_ws.panel(side_padding * 2)
	slot16 = self._fullscreen_ws.panel(side_padding * 2).h(side_padding * 2)
	self._credits_panel = self._clipping_panel.panel(self._clipping_panel, self._clipping_panel)
	slot17 = self._credits_panel
	slot15 = self._credits_panel.parent(slot16).w(slot16) / 2

	self._credits_panel.set_center_x(self._clipping_panel, self._credits_panel)

	local text_width = self._credits_panel.width(self._clipping_panel)
	slot16 = text_width

	bg.set_width(self._credits_panel, bg)

	slot15 = bg

	bg.set_size(self._credits_panel, self._clipping_panel.size(self._credits_panel.parent(slot16)))

	slot16 = {
		y = 0,
		visible = false,
		orientation = "vertical",
		x = 0,
		w = self._clipping_panel.width(self._clipping_panel),
		h = 75 * global_scale,
		layer = self.layers.items + 1,
		gradient_points = {
			0,
			Color(self._clipping_panel, 1, 0, 0),
			1,
			Color(self._clipping_panel, 0, 0, 0)
		}
	}
	slot23 = 0
	slot23 = 0

	self._clipping_panel.gradient(self._credits_panel, self._clipping_panel)

	slot16 = {
		visible = false,
		orientation = "vertical",
		x = 0,
		y = self._clipping_panel.height(Color) - 75 * global_scale,
		w = self._clipping_panel.width(75 * global_scale),
		h = 75 * global_scale,
		layer = self.layers.items + 1,
		gradient_points = {
			0,
			Color(self._clipping_panel, 0, 0, 0),
			1,
			Color(self._clipping_panel, 1, 0, 0)
		}
	}
	slot19 = self._clipping_panel
	slot23 = 0
	slot23 = 0

	self._clipping_panel.gradient(self._credits_panel, self._clipping_panel)

	local function animate_fade_in(o)
		function slot4(p)
			slot4 = p

			o.set_alpha(slot2, o)

			return 
		end

		over(slot2, 1)

		return 
	end

	slot17 = animate_fade_in

	bg.animate(self._clipping_panel, bg)

	slot16 = self._fullscreen_ws
	slot20 = self._fullscreen_ws
	slot20 = self._fullscreen_ws.panel(self._clipping_panel)
	slot20 = self._fullscreen_ws
	slot20 = self._fullscreen_ws.panel(self._clipping_panel)
	local blur = self._fullscreen_ws.panel(self._clipping_panel).bitmap(self._clipping_panel, self._fullscreen_ws.panel(self._clipping_panel))

	local function func(o)
		local start_blur = 0

		function slot5(p)
			slot3 = o
			slot8 = p

			o.set_alpha(slot2, math.lerp(slot5, start_blur, 1))

			return 
		end

		over(slot3, 0.6)

		return 
	end

	slot19 = func

	blur.animate({
		texture = "guis/textures/test_blur_df",
		render_template = "VertexColorTexturedBlur3D",
		w = self._fullscreen_ws.panel(self._clipping_panel).w(self._clipping_panel),
		h = self._fullscreen_ws.panel(self._clipping_panel).h(self._clipping_panel),
		layer = self.layers.background - 1
	}, blur)

	local commands = {}
	slot19 = list

	for _, data in ipairs(blur) do
		if data._meta == "text" then
			local height = 50
			slot28 = 0
			local color = Color(slot24, 1, 1, 0)

			if data.type == "title" then
				height = 24
				slot29 = 255
				color = Color(slot25, 255, 0, 161) / 255
			elseif data.type == "name" then
				height = 24
				slot29 = 0.9
				color = Color(slot25, 1, 0.9, 0.9)
			elseif data.type == "fill" then
				height = 26
				slot29 = 1
				color = Color(slot25, 1, 1, 1)
			elseif data.type == "song" then
				height = 24
				slot29 = 0.8
				color = Color(slot25, 1, 0.8, 0.8)
			elseif data.type == "song-credit" then
				height = 24
				slot29 = 0.5
				color = Color(slot25, 1, 0.5, 0.5)
			elseif data.type == "image-text" then
				height = 24
				slot29 = 0.5
				color = Color(slot25, 1, 0.5, 0.5)
			elseif data.type == "eula" then
				height = 22
				slot29 = 0.7
				color = Color(slot25, 1, 0.7, 0.7)
			end

			height = height * global_scale
			slot27 = {
				vertical = "bottom",
				h = 0,
				wrap = true,
				align = "center",
				word_wrap = true,
				halign = "left",
				x = 0,
				text = data.text,
				y = ypos,
				w = text_width,
				font_size = height,
				font = tweak_data.gui.get_font_path(slot29, tweak_data.gui, tweak_data.gui.fonts.din_compressed),
				color = color,
				layer = self.layers.items
			}
			slot32 = 24
			local text_field = self._credits_panel.text(slot25, self._credits_panel)
			slot27 = text_field
			local _, _, _, h = text_field.text_rect(self._credits_panel)
			slot32 = h

			text_field.set_height(tweak_data.gui, text_field)

			ypos = ypos + h
		elseif data._meta == "image" then
			local scale = (data.scale or 1) * global_scale
			slot26 = {
				x = 0,
				layer = self.layers.items,
				y = ypos,
				texture = data.src
			}
			local bitmap = self._credits_panel.bitmap(slot24, self._credits_panel)
			slot29 = bitmap
			slot27 = bitmap.width(slot28) * scale

			print(self._credits_panel, res.x)

			slot29 = bitmap
			slot27 = bitmap.width(slot28) * scale

			bitmap.set_width(self._credits_panel, bitmap)

			slot29 = bitmap
			slot27 = bitmap.height(slot28) * scale

			bitmap.set_height(self._credits_panel, bitmap)

			slot29 = self._credits_panel
			slot27 = self._credits_panel.width(slot28) / 2

			bitmap.set_center_x(self._credits_panel, bitmap)

			slot26 = bitmap
			ypos = ypos + bitmap.height(self._credits_panel)
		elseif data._meta == "br" then
			ypos = ypos + 28 * global_scale
		elseif data._meta == "command" then
			slot25 = {
				pos = ypos - text_offset + (data.offset or 0) * global_scale + self._clipping_panel.height(slot28) / 2,
				cmd = data.cmd,
				param = data.param
			}
			slot29 = self._clipping_panel

			table.insert(slot23, commands)
		end
	end

	slot20 = ypos + 50

	self._credits_panel.set_height(slot18, self._credits_panel)

	local function scroll_func(o)
		slot3 = o
		local y = o.top(slot2)
		local speed = 50 * global_scale

		while true do
			y = y - coroutine.yield() * speed
			slot5 = o
			slot8 = y

			o.set_top(slot4, math.round(slot7))

			if commands[1] and y < -commands[1].pos then

				-- Decompilation error in this vicinity:
				slot6 = 1
				local cmd = table.remove(slot4, commands)

				return 
			end
		end

		return 
	end

	slot21 = scroll_func
	self._credits_panel_thread = self._credits_panel.animate(self._credits_panel, self._credits_panel)

	return 
end
function MenuNodeCreditsGui:_setup_panels(node)
	slot5 = node

	MenuNodeCreditsGui.super._setup_panels(slot3, self)

	return 
end
function MenuNodeCreditsGui:_create_menu_item(row_item)
	slot5 = row_item

	MenuNodeCreditsGui.super._create_menu_item(slot3, self)

	return 
end
function MenuNodeCreditsGui:_setup_item_panel_parent(safe_rect)
	slot5 = safe_rect

	MenuNodeCreditsGui.super._setup_item_panel_parent(slot3, self)

	return 
end
function MenuNodeCreditsGui:_setup_item_panel(safe_rect, res)
	slot7 = res

	MenuNodeCreditsGui.super._setup_item_panel(slot4, self, safe_rect)

	return 
end
function MenuNodeCreditsGui:resolution_changed()
	slot3 = self

	MenuNodeCreditsGui.super.resolution_changed(slot2)

	return 
end
function MenuNodeCreditsGui:set_visible(visible)
	slot5 = visible

	MenuNodeCreditsGui.super.set_visible(slot3, self)

	if visible then
		slot4 = self._fullscreen_ws

		self._fullscreen_ws.show(slot3)
	else
		slot4 = self._fullscreen_ws

		self._fullscreen_ws.hide(slot3)
	end

	return 
end
function MenuNodeCreditsGui:close(...)
	slot4 = self._credits_panel_thread

	self._credits_panel.stop(slot2, self._credits_panel)

	slot3 = Overlay
	slot4 = self._fullscreen_ws

	Overlay.gui(slot2).destroy_workspace(slot2, Overlay.gui(slot2))

	slot3 = self

	MenuNodeCreditsGui.super.close(slot2, ...)

	slot4 = MusicManager.MENU_MUSIC

	managers.music.post_event(slot2, managers.music)

	return 
end
function MenuNodeCreditsGui:mouse_moved(o, x, y)
	return true
end
function MenuNodeCreditsGui:mouse_released(o, button, x, y)
	return true
end
function MenuNodeCreditsGui:mouse_pressed(button, x, y)
	return true
end
function MenuNodeCreditsGui:mouse_clicked(button, x, y)
	return true
end
function MenuNodeCreditsGui:mouse_double_click(o, button, x, y)
	return true
end
function MenuNodeCreditsGui:confirm_pressed()
	return true
end
function MenuNodeCreditsGui:back_pressed()
	slot3 = managers.raid_menu

	managers.raid_menu.on_escape(slot2)

	return true
end
function MenuNodeCreditsGui:move_up()
	return true
end
function MenuNodeCreditsGui:move_down()
	return true
end
function MenuNodeCreditsGui:move_left()
	return true
end
function MenuNodeCreditsGui:move_right()
	return true
end

return 
