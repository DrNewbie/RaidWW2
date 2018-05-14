if not ImageBoxGui then
	slot2 = TextBoxGui
	slot0 = class(slot1)
end

ImageBoxGui = slot0
function ImageBoxGui:init(...)
	slot3 = self

	ImageBoxGui.super.init(slot2, ...)

	return 
end
function ImageBoxGui:update(t, dt)
	return 
end
function ImageBoxGui:_create_text_box(ws, title, text, content_data, text_config, image_config)
	slot14 = text_config

	ImageBoxGui.super._create_text_box(slot8, self, ws, title, text, content_data)

	slot10 = image_config

	self._create_image_box(slot8, self)

	return 
end
function ImageBoxGui:_create_image_box(image_config)
	image_config = image_config or {}
	local image_shapes = image_config.shapes or {}
	local image_textures = image_config.textures or (image_config.texture and {
		image_config.texture
	}) or {}
	local image_video = image_config.video or nil
	local video_loop = image_config.video_loop or false
	local keep_texure_ratio = image_config.keep_ratio or false
	local image_render_template = image_config.render_template
	local image_blend_mode = image_config.blend_mode
	local image_width = image_config.w or image_config.width or 0
	local image_height = image_config.h or image_config.height or 0
	local image_padding = image_config.padding or 0
	local image_halign = Idstring(slot13)
	slot15 = image_config.valign or image_config.vertical or "center"
	local image_valign = Idstring(image_config.halign or image_config.align or "left")
	local image_layer = image_config.layer or 0
	local main = self._panel
	slot19 = "title"
	local title = main.child(slot17, main)
	slot20 = "info_area"
	local info_area = main.child(main, main)
	slot21 = "buttons_panel"
	local buttons_panel = info_area.child(main, info_area)
	slot22 = "scroll_panel"
	local scroll_panel = info_area.child(info_area, info_area)
	slot22 = "center"
	local halign_not_center = image_halign ~= Idstring(info_area)
	slot23 = "center"
	local valign_not_center = image_valign ~= Idstring(slot22)
	local grow_w = 0
	local grow_h = 0

	if halign_not_center then
		grow_w = image_width + image_padding * 2
	end

	if valign_not_center and not halign_not_center then
		grow_h = image_height + image_padding * 2
	end

	main.grow(slot25, main, grow_w)

	slot26 = info_area
	slot29 = main

	info_area.set_size(slot25, main.size(grow_h))

	local move_x = 0
	local move_y = 0
	slot28 = "left"

	if image_halign == Idstring(main.size) then
		move_x = grow_w
	end

	slot28 = "bottom"

	if image_valign ~= Idstring(slot27) then
		move_y = grow_h
	end

	slot30 = move_y

	title.move(slot27, title, move_x)

	slot30 = move_y

	buttons_panel.move(slot27, buttons_panel, move_x)

	slot30 = move_y

	scroll_panel.move(slot27, scroll_panel, move_x)

	slot28 = main
	self._panel_w = main.w(slot27)
	slot28 = main
	self._panel_h = main.h(slot27)
	slot29 = "top_line"
	local top_line = self._panel.child(slot27, self._panel)
	slot30 = "bottom_line"
	local bottom_line = self._panel.child(self._panel, self._panel)
	slot31 = "scroll_up_indicator_shade"
	local scroll_up_indicator_shade = self._panel.child(self._panel, self._panel)
	slot32 = "scroll_down_indicator_shade"
	local scroll_down_indicator_shade = self._panel.child(self._panel, self._panel)
	slot33 = "scroll_up_indicator_arrow"
	local scroll_up_indicator_arrow = self._panel.child(self._panel, self._panel)
	slot34 = "scroll_down_indicator_arrow"
	local scroll_down_indicator_arrow = self._panel.child(self._panel, self._panel)
	slot34 = top_line
	slot37 = scroll_panel

	top_line.set_world_bottom(self._panel, scroll_panel.world_top(slot36))

	slot34 = bottom_line
	slot37 = scroll_panel

	bottom_line.set_world_top(self._panel, scroll_panel.world_bottom(slot36))

	slot34 = scroll_up_indicator_shade
	slot37 = top_line

	scroll_up_indicator_shade.set_top(self._panel, top_line.bottom(slot36))

	slot34 = scroll_down_indicator_shade
	slot37 = bottom_line

	scroll_down_indicator_shade.set_bottom(self._panel, bottom_line.top(slot36))

	slot38 = scroll_up_indicator_shade

	scroll_up_indicator_arrow.set_lefttop(self._panel, scroll_up_indicator_arrow, scroll_panel.right(slot36) + 2)

	slot38 = scroll_down_indicator_shade
	slot36 = scroll_down_indicator_shade.bottom(scroll_panel) - 8

	scroll_down_indicator_arrow.set_leftbottom(self._panel, scroll_down_indicator_arrow, scroll_panel.right(scroll_up_indicator_shade.top(scroll_panel) + 8) + 2)

	slot35 = {
		name = "image_panel",
		w = image_width,
		h = image_height,
		layer = image_layer
	}
	local image_panel = main.panel(self._panel, main)
	slot35 = "center"

	if image_halign == Idstring(main) then
		slot36 = self._panel_w / 2

		image_panel.set_center_x(slot34, image_panel)
	else
		slot35 = "right"

		if image_halign == Idstring(slot34) then
			slot36 = self._panel_w - 10

			image_panel.set_right(slot34, image_panel)
		else
			slot36 = 10

			image_panel.set_left(slot34, image_panel)
		end
	end

	slot35 = "center"

	if image_valign == Idstring(slot34) then
		slot36 = self._panel_h / 2

		image_panel.set_center_y(slot34, image_panel)
	else
		slot35 = "bottom"

		if image_valign == Idstring(slot34) then
			slot36 = self._panel_h - 10

			image_panel.set_bottom(slot34, image_panel)
		else
			slot36 = 10

			image_panel.set_top(slot34, image_panel)
		end
	end

	self._requested_textures = {}
	slot35 = image_textures

	for i, image_texture in ipairs(slot34) do
		if image_texture then
			slot43 = "texture"
			slot42 = image_texture

			if DB.has(slot39, DB, Idstring(slot42)) then
				slot46 = image_render_template

				self.request_texture(slot39, self, image_texture, image_panel, keep_texure_ratio, image_blend_mode, i)
			end
		end
	end

	if image_video then
		slot36 = {
			video = image_video,
			w = image_width,
			h = image_height,
			loop = video_loop,
			blend_mode = image_blend_mode
		}
		local image = image_panel.video(slot34, image_panel)

		if image_render_template then
			slot37 = image_render_template

			image.set_render_template(slot35, image)
		end

		if keep_texure_ratio then
			local texture_width = image.video_width(slot35)
			local texture_height = image.video_height(image)
			slot39 = 1
			slot40 = 1
			local image_aspect = math.max(image, image_width) / math.max(image_width, image_height)
			slot40 = 1
			slot41 = 1
			local texture_aspect = math.max(image_width, texture_width) / math.max(texture_width, texture_height)
			local aspect = texture_aspect / image_aspect
			slot42 = image_width * aspect
			local sw = math.min(texture_height, image_width)
			slot43 = image_height / aspect
			local sh = math.min(image_width, image_height)

			image.set_size(image_height, image, sw)

			slot47 = image_panel
			slot45 = image_panel.h(image_panel) / 2

			image.set_center(image_height, image, image_panel.w(sh) / 2)
		end
	end

	if image_shapes then
		slot35 = image_shapes

		for _, shape in pairs(slot34) do
			local type = shape.type or rect
			local new_shape = nil

			if type == "rect" then
				slot43 = {
					color = shape.color or Color.white,
					w = shape.width or shape.w or 0,
					h = shape.height or shape.h or 0,
					layer = shape.layer or 0,
					blend_mode = image_blend_mode
				}
				new_shape = image_panel.rect(slot41, image_panel)
			elseif type == "bitmap" then
				slot43 = {
					texture = shape.texture,
					color = shape.color or Color.white,
					w = shape.width or shape.w or 0,
					h = shape.height or shape.h or 0,
					layer = shape.layer or 0,
					blend_mode = image_blend_mode
				}
				new_shape = image_panel.bitmap(slot41, image_panel)
			end

			slot47 = image_panel
			slot44 = shape.y * image_panel.h(image_panel)

			new_shape.set_center(slot41, new_shape, shape.x * image_panel.w(slot45))

			slot43 = math.round(new_shape.x(image_panel))
			slot48 = new_shape

			new_shape.set_position(slot41, new_shape, math.round(new_shape.y(new_shape)))
		end
	end

	self._info_box.create_sides(slot34, self._info_box, info_area)

	slot35 = self

	self._set_scroll_indicator(slot34)

	slot38 = main
	slot39 = main
	slot39 = main.parent(main.parent({
		sides = {
			1,
			1,
			1,
			1
		}
	}))
	slot37 = main.parent(main.parent()).h(main.parent()) / 2

	main.set_center(slot34, main, main.parent().w() / 2)

	return 
end
function ImageBoxGui:request_texture(texture_path, panel, keep_aspect_ratio, blend_mode, layer, render_template)
	if not managers.menu_component then
		return 
	end

	slot10 = texture_path
	slot16 = {
		panel = panel,
		blend_mode = blend_mode,
		layer = layer,
		render_template = render_template,
		keep_aspect_ratio = keep_aspect_ratio
	}
	local texture_count = managers.menu_component.request_texture(slot8, managers.menu_component, callback(slot12, self, self, "texture_done_clbk"))
	slot11 = {
		texture_count = texture_count,
		texture = texture_path
	}

	table.insert(managers.menu_component, self._requested_textures)

	return 
end
function ImageBoxGui:unretrieve_textures()
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
function ImageBoxGui:texture_done_clbk(params, texture_ids)
	params = params or {}
	local panel = params.panel or params[1]
	local keep_aspect_ratio = params.keep_aspect_ratio
	local blend_mode = params.blend_mode
	local layer = params.layer
	local render_template = params.render_template

	if not params.name then
		slot13 = panel
		local name = "streamed_texture_" .. tostring(panel.num_children(slot12))
	end

	slot11 = panel

	if not alive(slot10) then
		slot15 = "params"
		slot18 = params

		Application.error(slot10, Application, "[MenuNodeBaseGui:texture_done_clbk] Missing GUI panel", "texture_ids", texture_ids, inspect(slot17))

		return 
	end

	slot12 = {
		name = name,
		texture = texture_ids,
		blend_mode = blend_mode,
		render_template = render_template,
		layer = layer
	}
	local image = panel.bitmap(slot10, panel)

	if keep_aspect_ratio then
		local texture_width = image.texture_width(slot11)
		local texture_height = image.texture_height(image)
		local panel_width = panel.w(image)
		slot15 = panel
		local panel_height = panel.h(panel)
		local tw = texture_width
		local th = texture_height
		local pw = panel_width
		local ph = panel_height

		if tw == 0 or th == 0 then
			slot25 = th

			Application.error(slot19, Application, "[MenuNodeBaseGui:texture_done_clbk] Texture size error!:", "width", tw, "height")

			tw = 1
			th = 1
		end

		slot21 = ph * tw / th
		local sw = math.min(slot19, pw)
		slot22 = pw / tw / th
		local sh = math.min(pw, ph)
		slot23 = math.round(slot24)
		slot26 = sh

		image.set_size(ph, image, math.round(sw))

		slot26 = panel
		slot24 = panel.h(panel) * 0.5

		image.set_center(ph, image, panel.w(math.round) * 0.5)
	else
		slot12 = image
		slot15 = panel

		image.set_size(slot11, panel.size(slot14))
	end

	return 
end
function ImageBoxGui:close()
	slot3 = self

	self.unretrieve_textures(slot2)

	slot3 = self

	ImageBoxGui.super.close(slot2)

	return 
end

return 
