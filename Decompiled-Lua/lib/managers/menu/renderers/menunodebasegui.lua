-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot2 = "lib/managers/menu/BoxGuiObject"

require(slot1)

if not MenuNodeBaseGui then
	slot2 = MenuNodeGui
	slot0 = class(slot1)
end

MenuNodeBaseGui = slot0
MenuNodeBaseGui.massive_font = tweak_data.menu.pd2_massive_font
MenuNodeBaseGui.large_font = tweak_data.menu.pd2_large_font
MenuNodeBaseGui.medium_font = tweak_data.menu.pd2_medium_font
MenuNodeBaseGui.small_font = tweak_data.menu.pd2_small_font
MenuNodeBaseGui.massive_font_size = tweak_data.menu.pd2_massive_font_size
MenuNodeBaseGui.large_font_size = tweak_data.menu.pd2_large_font_size
MenuNodeBaseGui.medium_font_size = tweak_data.menu.pd2_medium_font_size
MenuNodeBaseGui.small_font_size = tweak_data.menu.pd2_small_font_size
MenuNodeBaseGui.text_color = tweak_data.screen_colors.text
MenuNodeBaseGui.button_default_color = tweak_data.screen_colors.button_stage_3
MenuNodeBaseGui.button_highlighted_color = tweak_data.screen_colors.button_stage_2
MenuNodeBaseGui.button_selected_color = tweak_data.screen_colors.button_stage_1
slot4 = "WIN32"
MenuNodeBaseGui.is_win32 = SystemInfo.platform(slot2) == Idstring(SystemInfo)
MenuNodeBaseGui.make_fine_text = function (text)
	slot3 = text
	local x, y, w, h = text.text_rect(slot2)
	slot9 = h

	text.set_size(slot6, text, w)

	slot8 = math.round(text.x(slot11))
	slot13 = text

	text.set_position(slot6, text, math.round(text.y(text)))

	slot8 = text

	return text.x(slot6), text.y(text), w, h
end
MenuNodeBaseGui.rec_round_object = function (object)
	if object.children then
		slot5 = object

		for i, d in ipairs(object.children(slot4)) do
			slot8 = d

			MenuNodeBaseGui.rec_round_object(slot7)
		end
	end

	slot3 = object
	local x, y = object.position(slot2)
	slot6 = math.round(slot7)
	slot9 = y

	object.set_position(slot4, object, math.round(x))

	return 
end
MenuNodeBaseGui.init = function (self, node, layer, parameters)
	slot9 = parameters

	MenuNodeBaseGui.super.init(slot5, self, node, layer)

	slot6 = self

	self.setup(slot5)

	return 
end
MenuNodeBaseGui.setup = function (self)
	self._requested_textures = {}
	self._gui_boxes = {}
	self._text_buttons = {}
	slot3 = managers.menu
	self.is_pc_controller = managers.menu.is_pc_controller(slot2)

	return 
end
MenuNodeBaseGui.create_text_button = function (self, params)

	-- Decompilation error in this vicinity:
	local left = params.left or params.x
	local right = params.right
	local top = params.top or params.y
	local bottom = params.bottom

	if bottom then
		slot19 = bottom

		button_panel.set_bottom(slot17, button_panel)
	end

	local left, right, top, bottom = nil
	slot22 = self._text_buttons

	for _, button in ipairs(slot21) do
		slot27 = button.text

		if alive(slot26) then
			slot28 = button.panel
			left = button_panel.left(slot26) < button.panel.right(button_panel)
			slot28 = button.panel
			right = button.panel.left(button_panel) < button_panel.right(slot26)
			slot28 = button.panel
			top = button_panel.top(slot26) < button.panel.bottom(button_panel)
			slot28 = button.panel
			bottom = button.panel.top(button_panel) < button_panel.bottom(slot26)

			if left and right and top and bottom then
				slot27 = button.panel

				if button.panel.visible(slot26) then
					slot27 = button_panel
				else
					slot34 = button.panel

					Application.debug(slot26, Application, "[MenuNodeBaseGui:create_text_button] Text button intersects with another text button", text, button_panel.visible(button.text.text(button_panel)), button.panel.visible(button.text))
				end
			end
		end
	end

	slot23 = {
		highlighted = false,
		panel = button_panel,
		text = gui_text,
		blur = gui_blur,
		clbk = clbk,
		params = params.params
	}

	table.insert(slot21, self._text_buttons)

	return button_panel
end
MenuNodeBaseGui.create_gui_box = function (self, panel, params)
	slot5 = panel

	if not alive(slot4) then
		return 
	end

	slot7 = params or {
		sides = {
			1,
			1,
			1,
			1
		}
	}
	local box = BoxGuiObject.new(slot4, BoxGuiObject, panel)

	if not params or not params.name then
		slot6 = panel
		local name = panel.name(slot5)
	end

	if name and name ~= "" then
		if self._gui_boxes[name] then
			slot9 = name

			Application.error(slot6, Application, "[MenuNodeBaseGui:create_gui_box] GUI Box with that name already exists")

			slot8 = box

			table.insert(slot6, self._gui_boxes)
		else
			self._gui_boxes[name] = box
		end
	else
		slot8 = box

		table.insert(slot6, self._gui_boxes)
	end

	return 
end
MenuNodeBaseGui.update_info = function (self, button)
	return 
end
MenuNodeBaseGui.mouse_moved = function (self, o, x, y)
	local used = false
	local icon = "arrow"
	slot8 = self._text_buttons

	for _, button in ipairs(slot7) do
		slot13 = button.panel

		if alive(slot12) then
			slot13 = button.panel

			if button.panel.visible(slot12) then
				slot15 = y

				if button.panel.inside(slot12, button.panel, x) then
					if not button.highlighted then
						button.highlighted = true
						slot14 = "highlight"

						managers.menu_component.post_event(slot12, managers.menu_component)

						slot13 = button.text

						if alive(slot12) then
							slot14 = button.highlighted_color or self.button_highlighted_color

							button.text.set_color(slot12, button.text)
						end

						slot13 = button.image

						if alive(slot12) then
							slot14 = button.highlighted_color or self.button_highlighted_color

							button.image.set_color(slot12, button.image)
						end
					end

					slot14 = button

					self.update_info(slot12, self)

					icon = "link"
					used = true
				elseif button.highlighted then
					button.highlighted = false
					slot13 = button.text

					if alive(slot12) then
						slot14 = button.default_color or self.button_default_color

						button.text.set_color(slot12, button.text)
					end

					slot13 = button.image

					if alive(slot12) then
						slot14 = button.default_color or self.button_default_color

						button.image.set_color(slot12, button.image)
					end
				end
			end
		end
	end

	if not used then
		slot8 = self

		self.update_info(slot7)
	end

	return used, icon
end
MenuNodeBaseGui.mouse_pressed = function (self, button, x, y)

	-- Decompilation error in this vicinity:
	slot6 = "0"
	slot9 = y

	return MenuNodeBaseGui.super.mouse_pressed(slot5, self, button, x)
end
MenuNodeBaseGui.mouse_released = function (self, button, x, y)
	return 
end
MenuNodeBaseGui.confirm_pressed = function (self)
	return 
end
MenuNodeBaseGui.previous_page = function (self)
	return 
end
MenuNodeBaseGui.next_page = function (self)
	return 
end
MenuNodeBaseGui.move_up = function (self)
	slot3 = "MenuNodeBaseGui:move_up"

	print(slot2)

	return 
end
MenuNodeBaseGui.move_down = function (self)
	slot3 = "MenuNodeBaseGui:move_down"

	print(slot2)

	return 
end
MenuNodeBaseGui.move_left = function (self)
	return 
end
MenuNodeBaseGui.move_right = function (self)
	return 
end
MenuNodeBaseGui.request_texture = function (self, texture_path, panel, keep_aspect_ratio, blend_mode)
	if not managers.menu_component then
		return 
	end

	slot8 = texture_path
	slot14 = {
		panel = panel,
		keep_aspect_ratio = keep_aspect_ratio,
		blend_mode = blend_mode
	}
	local texture_count = managers.menu_component.request_texture(slot6, managers.menu_component, callback(slot10, self, self, "texture_done_clbk"))
	slot9 = {
		texture_count = texture_count,
		texture = texture_path
	}

	table.insert(managers.menu_component, self._requested_textures)

	return 
end
MenuNodeBaseGui.unretrieve_textures = function (self)
	if self._requested_textures then
		slot3 = self._requested_textures

		for i, data in pairs(slot2) do
			slot10 = data.texture_count

			managers.menu_component.unretrieve_texture(slot7, managers.menu_component, data.texture)
		end
	end

	self._requested_textures = {}

	return 
end
MenuNodeBaseGui.texture_done_clbk = function (self, params, texture_ids)
	params = params or {}
	local panel = params.panel or params[1]
	local keep_aspect_ratio = params.keep_aspect_ratio
	local blend_mode = params.blend_mode
	local name = params.name or "streamed_texture"
	slot9 = panel

	if not alive(slot8) then
		slot13 = "params"
		slot16 = params

		Application.error(slot8, Application, "[MenuNodeBaseGui:texture_done_clbk] Missing GUI panel", "texture_ids", texture_ids, inspect(slot15))

		return 
	end

	slot10 = {
		name = name,
		texture = texture_ids,
		blend_mode = blend_mode
	}
	local image = panel.bitmap(slot8, panel)

	if keep_aspect_ratio then
		local texture_width = image.texture_width(slot9)
		local texture_height = image.texture_height(image)
		local panel_width = panel.w(image)
		slot13 = panel
		local panel_height = panel.h(panel)
		local tw = texture_width
		local th = texture_height
		local pw = panel_width
		local ph = panel_height

		if tw == 0 or th == 0 then
			slot23 = th

			Application.error(slot17, Application, "[MenuNodeBaseGui:texture_done_clbk] Texture size error!:", "width", tw, "height")

			tw = 1
			th = 1
		end

		slot19 = ph * tw / th
		local sw = math.min(slot17, pw)
		slot20 = pw / tw / th
		local sh = math.min(pw, ph)
		slot21 = math.round(slot22)
		slot24 = sh

		image.set_size(ph, image, math.round(sw))

		slot24 = panel
		slot22 = panel.h(panel) * 0.5

		image.set_center(ph, image, panel.w(math.round) * 0.5)
	else
		slot10 = image
		slot13 = panel

		image.set_size(slot9, panel.size(slot12))
	end

	return 
end
MenuNodeBaseGui.close = function (self)
	slot3 = self

	self.unretrieve_textures(slot2)

	slot3 = self

	MenuNodeBaseGui.super.close(slot2)

	return 
end

return 
