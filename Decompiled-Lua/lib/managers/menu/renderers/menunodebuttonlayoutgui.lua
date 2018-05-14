-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not MenuNodeButtonLayoutGui then
	slot2 = MenuNodeGui
	slot0 = class(slot1)
end

MenuNodeButtonLayoutGui = slot0
function MenuNodeButtonLayoutGui:init(node, layer, parameters)
	slot9 = parameters

	MenuNodeButtonLayoutGui.super.init(slot5, self, node, layer)

	slot7 = node

	self._setup(slot5, self)

	return 
end
function MenuNodeButtonLayoutGui:_setup_panels(node)
	slot5 = node

	MenuNodeButtonLayoutGui.super._setup_panels(slot3, self)

	slot4 = managers.viewport
	local safe_rect_pixels = managers.viewport.get_safe_rect_pixels(slot3)

	return 
end
function MenuNodeButtonLayoutGui:_setup()
	slot3 = tweak_data
	self._coords = tweak_data.get_controller_help_coords(slot2) or {}
	self._categories = {}
	slot3 = self._coords

	for category, _ in pairs(slot2) do
		slot9 = category

		table.insert(slot7, self._categories)
	end

	self._current_category = "normal"
	slot3 = self._coords

	for category, coords in pairs(slot2) do
		slot8 = coords

		for button, data in pairs(slot7) do
		end
	end

	slot3 = managers.menu_component._fullscreen_ws
	slot3 = managers.menu_component._fullscreen_ws.panel(slot2)
	self._blur = managers.menu_component._fullscreen_ws.panel(slot2).panel(slot2)
	slot4 = {
		texture = "guis/textures/test_blur_df",
		render_template = "VertexColorTexturedBlur3D",
		w = managers.menu_component._fullscreen_ws.panel(slot6).w(slot6),
		h = managers.menu_component._fullscreen_ws.panel(slot6).h(slot6),
		layer = self.layers.background
	}
	slot7 = managers.menu_component._fullscreen_ws
	slot7 = managers.menu_component._fullscreen_ws.panel(slot6)
	slot7 = managers.menu_component._fullscreen_ws

	self._blur.bitmap(slot2, self._blur)

	slot4 = {
		alpha = 0.6,
		color = Color.black
	}

	self._blur.rect(slot2, self._blur)

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

	slot5 = func

	self._blur.animate(self._blur, self._blur)

	slot4 = self.ws
	slot5 = {
		visible = false,
		color = Color(managers.menu_component._fullscreen_ws.panel(slot6), 1, 0.4, 0.4),
		layer = self.layers.background
	}
	slot11 = 0.4
	self._bg = self.ws.panel(self._blur).rect(self._blur, self.ws.panel(self._blur))
	slot4 = self.ws
	slot5 = {
		texture = "guis/textures/controller",
		w = 512,
		h = 256,
		layer = self.layers.items
	}
	self._controller = self.ws.panel(self._blur).bitmap(self._blur, self.ws.panel(self._blur))
	slot4 = self

	self._layout(self._blur)

	return 
end
function MenuNodeButtonLayoutGui:_layout()

	-- Decompilation error in this vicinity:
	slot3 = managers.viewport
	local safe_rect_pixels = managers.viewport.get_safe_rect_pixels(slot2)
	local res = RenderSettings.resolution
	local scale = tweak_data.scale.button_layout_multiplier
	slot7 = res.y - (tweak_data.menu.upper_saferect_border + safe_rect_pixels.y) * 2 + 2

	self._bg.set_h(slot5, self._bg)

	slot7 = res.y / 2

	self._bg.set_center_y(slot5, self._bg)

	slot9 = managers.menu_component._fullscreen_ws
	slot7 = managers.menu_component._fullscreen_ws.panel((tweak_data.menu.upper_saferect_border + safe_rect_pixels.y) * 2).w((tweak_data.menu.upper_saferect_border + safe_rect_pixels.y) * 2)
	slot10 = managers.menu_component._fullscreen_ws
	slot10 = managers.menu_component._fullscreen_ws.panel(managers.menu_component._fullscreen_ws.panel((tweak_data.menu.upper_saferect_border + safe_rect_pixels.y) * 2))

	self._blur.set_size(slot5, self._blur, managers.menu_component._fullscreen_ws.panel(managers.menu_component._fullscreen_ws.panel((tweak_data.menu.upper_saferect_border + safe_rect_pixels.y) * 2)).h(managers.menu_component._fullscreen_ws.panel((tweak_data.menu.upper_saferect_border + safe_rect_pixels.y) * 2)))

	slot10 = self._controller

	self._controller.set_size(slot5, self._controller, self._controller.w(managers.menu_component._fullscreen_ws.panel(managers.menu_component._fullscreen_ws.panel((tweak_data.menu.upper_saferect_border + safe_rect_pixels.y) * 2)).h) * scale)

	slot9 = self.ws
	slot10 = self.ws
	slot10 = self.ws.panel(self.ws.panel(self._controller.h(self._controller) * scale))
	slot8 = self.ws.panel(self.ws.panel(self._controller.h(self._controller) * scale)).h(self.ws.panel(self._controller.h(self._controller) * scale)) / 2

	self._controller.set_center(slot5, self._controller, self.ws.panel(self._controller.h(self._controller) * scale).w(self._controller.h(self._controller) * scale) / 2)

	slot6 = self._coords

	for category, coords in pairs(slot5) do
		slot11 = coords

		for id, data in pairs(slot10) do
			slot16 = data.text
			local _, _, w, h = data.text.text_rect(slot15)
			slot22 = h

			data.text.set_size(slot19, data.text, w)

			slot21 = category == self._current_category

			data.text.set_visible(slot19, data.text)

			if data.x then
				local x = self._controller.x(slot19) + data.x * scale
				slot21 = self._controller
				local y = self._controller.y(self._controller) + data.y * scale

				if data.align == "left" then
					slot23 = x

					data.text.set_left(slot21, data.text)
				elseif data.align == "right" then
					slot23 = x

					data.text.set_right(slot21, data.text)
				elseif data.align == "center" then
					slot23 = x

					data.text.set_center_x(slot21, data.text)
				end

				if data.vertical == "top" then
					slot23 = y

					data.text.set_top(slot21, data.text)
				elseif data.vertical == "bottom" then
					slot23 = y

					data.text.set_bottom(slot21, data.text)
				else
					slot23 = y

					data.text.set_center_y(slot21, data.text)
				end
			end

			slot21 = math.round(data.text.x(slot24))
			slot26 = data.text

			data.text.set_position(slot19, data.text, math.round(data.text.y(data.text)))
		end
	end

	return 
end
function MenuNodeButtonLayoutGui:_create_menu_item(row_item)
	slot5 = row_item

	MenuNodeButtonLayoutGui.super._create_menu_item(slot3, self)

	return 
end
function MenuNodeButtonLayoutGui:_setup_item_panel_parent(safe_rect)
	slot5 = safe_rect

	MenuNodeButtonLayoutGui.super._setup_item_panel_parent(slot3, self)

	return 
end
function MenuNodeButtonLayoutGui:_setup_item_panel(safe_rect, res)
	slot7 = res

	MenuNodeButtonLayoutGui.super._setup_item_panel(slot4, self, safe_rect)

	return 
end
function MenuNodeButtonLayoutGui:set_current_category(category)
	self._current_category = category
	slot4 = self

	self._layout(slot3)

	return 
end
function MenuNodeButtonLayoutGui:resolution_changed()
	slot3 = self

	MenuNodeButtonLayoutGui.super.resolution_changed(slot2)

	slot3 = self

	self._layout(slot2)

	return 
end
function MenuNodeButtonLayoutGui:close(...)
	slot3 = self._bg
	slot4 = self._bg

	self._bg.parent(slot2).remove(slot2, self._bg.parent(slot2))

	slot3 = self._blur
	slot4 = self._blur

	self._blur.parent(slot2).remove(slot2, self._blur.parent(slot2))

	slot3 = self

	MenuNodeButtonLayoutGui.super.close(slot2, ...)

	return 
end

return 
