-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreMenuNodeGui"

core.module(slot1, core)

slot3 = "CoreUnit"

core.import(slot1, core)

NodeGui = NodeGui or class()
function NodeGui:init(node, layer, parameters)
	self.node = node
	slot6 = node
	self.name = node.parameters(slot5).name
	self.font = "core/fonts/diesel"
	self.font_size = 28
	self.topic_font_size = 48
	self.spacing = 2
	self.height_padding = 0
	local safe_rect_pixels = managers.viewport.get_safe_rect_pixels(slot5)
	slot7 = managers.gui_data
	self.ws = managers.gui_data.create_saferect_workspace(managers.viewport)
	slot7 = self.ws
	slot8 = {
		name = "item_panel_parent"
	}
	self._item_panel_parent = self.ws.panel(managers.viewport).panel(managers.viewport, self.ws.panel(managers.viewport))
	slot8 = {
		name = "item_panel"
	}
	self.item_panel = self._item_panel_parent.panel(managers.viewport, self._item_panel_parent)
	slot7 = self.ws
	slot8 = {
		name = "safe_rect_panel"
	}
	self.safe_rect_panel = self.ws.panel(managers.viewport).panel(managers.viewport, self.ws.panel(managers.viewport))
	slot7 = self.ws

	self.ws.show(managers.viewport)

	self.layers = {
		first = layer,
		background = layer,
		marker = layer + 1,
		items = layer + 2
	}
	self.layers.last = self.layers.items
	self.localize_strings = true

	if not self.row_item_color then
		slot10 = 0.8274509803921568
		slot5 = Color(slot6, 1, 0.5529411764705883, 0.6901960784313725)
	end

	self.row_item_color = slot5

	if not self.row_item_hightlight_color then
		slot10 = 0.8274509803921568
		slot5 = Color(slot6, 1, 0.5529411764705883, 0.6901960784313725)
	end

	self.row_item_hightlight_color = slot5

	if not self.row_item_disabled_text_color then
		slot10 = 0.5
		slot5 = Color(slot6, 1, 0.5, 0.5)
	end

	self.row_item_disabled_text_color = slot5

	if parameters then
		slot7 = parameters

		for param_name, param_value in pairs(slot6) do
			self[param_name] = param_value
		end
	end

	if self.texture then
		self.texture.layer = self.layers.background
		slot7 = self.ws
		slot8 = self.texture
		self.texture = self.ws.panel(self.layers.background).bitmap(self.layers.background, self.ws.panel(self.layers.background))
		slot8 = true

		self.texture.set_visible(self.layers.background, self.texture)
	end

	slot8 = node

	self._setup_panels(slot6, self)

	self.row_items = {}
	slot8 = node

	self._setup_item_rows(slot6, self)

	return 
end
function NodeGui:item_panel_parent()
	return self._item_panel_parent
end
function NodeGui:_setup_panels(node)
	return 
end
function NodeGui:_setup_item_rows(node)
	slot4 = node
	local items = node.items(slot3)
	local items_count = #items
	local i = 0
	slot7 = items

	for _, item in pairs(slot6) do
		slot12 = item

		if item.visible(slot11) then
			slot12 = item
			item.parameters(slot11).gui_node = self
			slot12 = item
			local item_name = item.parameters(slot11).name
			local item_text = "menu item missing 'text_id'"
			slot14 = item

			if item.parameters(slot13).no_text then
				item_text = nil
			end

			local help_text = nil
			slot15 = item
			local params = item.parameters(slot14)

			if params.text_id then
				if self.localize_strings and params.localize ~= false and params.localize ~= "false" then
					slot17 = params.text_id
					item_text = managers.localization.text(slot15, managers.localization)
				else
					item_text = params.text_id
				end
			end

			if params.help_id then
				if self.localize_strings and params.localize_help ~= false and params.localize_help ~= "false" then
					slot17 = params.help_id
					help_text = managers.localization.text(slot15, managers.localization)
				else
					help_text = params.help_id
				end
			end

			local row_item = {}
			slot18 = row_item

			table.insert(slot16, self.row_items)

			row_item.item = item
			row_item.node = node
			row_item.node_gui = self
			row_item.type = item._type
			row_item.name = item_name
			slot18 = self.safe_rect_panel
			row_item.position = {
				x = 0,
				y = self.safe_rect_panel.h(self.row_items) - (self.font_size * (i + 1) + self.spacing * (i + 1))
			}
			row_item.color = params.color or self.row_item_color
			row_item.row_item_color = params.row_item_color
			row_item.hightlight_color = params.hightlight_color
			row_item.disabled_color = params.disabled_color or self.row_item_disabled_text_color
			row_item.marker_color = params.marker_color or self.marker_color
			row_item.marker_disabled_color = params.marker_disabled_color or self.marker_disabled_color
			row_item.font = params.font or self.font
			row_item.font_size = params.font_size or self.font_size
			row_item.text = item_text
			row_item.help_text = help_text
			row_item.align = params.align or self.align or "left"
			row_item.halign = params.halign or self.halign or "left"
			row_item.vertical = params.vertical or self.vertical or "center"
			row_item.to_upper = (params.to_upper == nil and self.to_upper) or params.to_upper or false
			row_item.color_ranges = params.color_ranges or self.color_ranges or nil
			slot18 = row_item

			self._create_menu_item(slot16, self)

			slot18 = item

			self.reload_item(slot16, self)

			i = i + 1
		end
	end

	slot7 = self

	self._setup_size(slot6)

	slot7 = self

	self.scroll_setup(slot6)

	slot7 = self

	self._set_item_positions(slot6)

	self._highlighted_item = nil

	return 
end
function NodeGui:_insert_row_item(item, node, i)
	slot6 = item

	if item.visible(slot5) then
		slot6 = item
		item.parameters(slot5).gui_node = self
		slot6 = item
		local item_name = item.parameters(slot5).name
		local item_text = "menu item missing 'text_id'"
		local help_text = nil
		slot9 = item
		local params = item.parameters(slot8)

		if params.text_id then
			if self.localize_strings and params.localize ~= false and params.localize ~= "false" then
				slot11 = params.text_id
				item_text = managers.localization.text(slot9, managers.localization)
			else
				item_text = params.text_id
			end
		end

		if params.help_id then
			if self.localize_strings and params.localize_help ~= false and params.localize_help ~= "false" then
				slot11 = params.help_id
				help_text = managers.localization.text(slot9, managers.localization)
			else
				help_text = params.help_id
			end
		end

		local row_item = {}
		slot13 = row_item

		table.insert(slot10, self.row_items, i)

		row_item.item = item
		row_item.node = node
		row_item.type = item._type
		row_item.name = item_name
		row_item.position = {
			x = 0,
			y = self.font_size * i + self.spacing * (i - 1)
		}
		row_item.color = params.color or self.row_item_color
		row_item.row_item_color = params.row_item_color
		row_item.hightlight_color = params.hightlight_color
		row_item.disabled_color = params.disabled_color or self.row_item_disabled_text_color
		row_item.font = self.font
		row_item.text = item_text
		row_item.help_text = help_text
		row_item.align = params.align or self.align or "left"
		row_item.halign = params.halign or self.halign or "left"
		row_item.vertical = params.vertical or self.vertical or "center"
		row_item.to_upper = params.to_upper or false
		row_item.color_ranges = params.color_ranges or self.color_ranges or nil
		slot12 = row_item

		self._create_menu_item(slot10, self)

		slot12 = item

		self.reload_item(slot10, self)
	end

	return 
end
function NodeGui:_delete_row_item(item)
	slot4 = self.row_items

	for i, row_item in ipairs(slot3) do
		if row_item.item == item then
			slot10 = i
			local delete_row_item = table.remove(slot8, self.row_items)
			slot10 = row_item.gui_panel

			if alive(self.row_items) then
				slot11 = row_item

				item.on_delete_row_item(slot9, item)

				slot11 = row_item.gui_panel

				self.item_panel.remove(slot9, self.item_panel)
			end

			return 
		end
	end

	return 
end
function NodeGui:refresh_gui(node)
	slot4 = self

	self._clear_gui(slot3)

	slot5 = node

	self._setup_item_rows(slot3, self)

	return 
end
function NodeGui:_clear_gui()
	local to = #self.row_items

	for i = 1, to, 1 do
		local row_item = self.row_items[i]
		slot9 = row_item.gui_panel

		if alive(slot8) then
			slot9 = row_item.gui_panel
			slot10 = row_item.gui_panel

			row_item.gui_panel.parent(slot8).remove(slot8, row_item.gui_panel.parent(slot8))

			row_item.gui_panel = nil
		end

		slot9 = row_item.gui_info_panel

		if alive(slot8) then
			slot10 = row_item.gui_info_panel

			self.safe_rect_panel.remove(slot8, self.safe_rect_panel)
		end

		slot9 = row_item.icon

		if alive(slot8) then
			slot9 = row_item.icon
			slot10 = row_item.icon

			row_item.icon.parent(slot8).remove(slot8, row_item.icon.parent(slot8))
		end

		self.row_items[i] = nil
	end

	self.row_items = {}

	return 
end
function NodeGui:close()
	slot3 = Overlay
	slot4 = self.ws

	Overlay.gui(slot2).destroy_workspace(slot2, Overlay.gui(slot2))

	self.ws = nil

	return 
end
function NodeGui:layer()
	return self.layers.last
end
function NodeGui:set_visible(visible)
	if visible then
		slot4 = self.ws

		self.ws.show(slot3)
	else
		slot4 = self.ws

		self.ws.hide(slot3)
	end

	return 
end
function NodeGui:reload_item(item)
	slot4 = item
	local type = item.type(slot3)

	if type == "" then
		slot6 = item

		self._reload_item(slot4, self)
	end

	if type == "toggle" then
	end

	if type == "slider" then
	end

	return 
end
function NodeGui:_reload_item(item)
	slot5 = item
	local row_item = self.row_item(slot3, self)
	slot5 = item
	local params = item.parameters(self)

	if params.text_id then
		if self.localize_strings and params.localize ~= false and params.localize ~= "false" then
			slot7 = params.text_id
			item_text = managers.localization.text(slot5, managers.localization)
		else
			item_text = params.text_id
		end
	end

	if row_item then
		row_item.text = item_text

		if row_item.gui_panel.set_text then
			slot6 = row_item.gui_panel
			slot4 = row_item.gui_panel.set_text
		end
	end

	return 
end
function NodeGui:_create_menu_item(row_item)
	return 
end
function NodeGui:_reposition_items(highlighted_row_item)
	slot4 = managers.viewport
	local safe_rect = managers.viewport.get_safe_rect_pixels(slot3)
	local dy = 0

	if highlighted_row_item then

		-- Decompilation error in this vicinity:
		slot6 = highlighted_row_item.item
		local prev_item, first_item = nil
		local num_dividers_top = 0

		for i = 1, #self.row_items, 1 do
			first_item = self.row_items[i]

			if first_item.type ~= "divider" then
				slot13 = first_item.item
			elseif first_item.type == "divider" then
				num_dividers_top = num_dividers_top + 1
			end
		end

		local first = first_item.gui_panel == highlighted_row_item.gui_panel
		local last_item = nil
		local num_dividers_bottom = 0

		for i = #self.row_items, 1, -1 do
			last_item = self.row_items[i]

			if last_item.type ~= "divider" then
				slot16 = last_item.item
			elseif last_item.type == "divider" then
				num_dividers_bottom = num_dividers_bottom + 1
			end
		end

		local last = last_item.gui_panel == highlighted_row_item.gui_panel
		local prev_item, next_item = nil
		slot15 = self.row_items

		for i, row_item in ipairs(slot14) do
			if row_item.gui_panel == highlighted_row_item.gui_panel then
				if not first then
					for index = i - 1, 1, -1 do
						row_item = self.row_items[index]

						if row_item.type ~= "divider" then
							slot24 = row_item.item

							if not row_item.item.parameters(slot23).back then
								slot24 = row_item.item

								if not row_item.item.parameters(slot23).pd2_corner then
									prev_item = row_item

									break
								end
							end
						end
					end
				end

				if not last then
					for index = i + 1, #self.row_items, 1 do
						row_item = self.row_items[index]

						if row_item.type ~= "divider" then
							slot24 = row_item.item

							if not row_item.item.parameters(slot23).back then
								slot24 = row_item.item

								if not row_item.item.parameters(slot23).pd2_corner then
									next_item = row_item

									break
								end
							end
						end
					end
				end

				break
			end
		end

		slot17 = self

		if not highlighted_row_item.item.get_h(slot14, highlighted_row_item.item, highlighted_row_item) then
			slot15 = highlighted_row_item.gui_panel
			local h = highlighted_row_item.gui_panel.h(slot14)
		end

		local offset = (first and h * num_dividers_top) or (last and h * num_dividers_bottom) or h
		offset = offset + self.height_padding
		slot15 = self._item_panel_parent.world_y(slot16)
		slot18 = highlighted_row_item.gui_panel
		slot16 = highlighted_row_item.gui_panel.world_y(self._item_panel_parent)
		slot22 = highlighted_row_item.gui_panel
		slot19 = prev_item.gui_panel.y(slot20) - highlighted_row_item.gui_panel.y(prev_item.gui_panel)
		slot17 = math.abs(slot18) - h or 0

		if prev_item then
			slot20 = highlighted_row_item.gui_panel
			slot17 = prev_item.gui_panel.y(slot18) - highlighted_row_item.gui_panel.y(prev_item.gui_panel)
			offset = (offset + math.abs(slot16)) - h
		end

		slot18 = self._item_panel_parent
		dy = -(highlighted_row_item.gui_panel.world_y(slot16) - self._item_panel_parent.world_y(highlighted_row_item.gui_panel) - offset)
		slot18 = self._item_panel_parent
		slot15 = self._item_panel_parent.world_y(slot16) + self._item_panel_parent.h(self._item_panel_parent)
		slot19 = highlighted_row_item.gui_panel
		slot16 = highlighted_row_item.gui_panel.world_y(self._item_panel_parent) + highlighted_row_item.gui_panel.h(highlighted_row_item.gui_panel)
		slot22 = highlighted_row_item.gui_panel
		slot19 = next_item.gui_panel.y(slot20) - highlighted_row_item.gui_panel.y(next_item.gui_panel)
		slot17 = math.abs(slot18) - h or 0

		if slot15 < slot16 + offset + slot17 then
			if next_item then
				slot20 = highlighted_row_item.gui_panel
				slot17 = next_item.gui_panel.y(slot18) - highlighted_row_item.gui_panel.y(next_item.gui_panel)
				offset = (offset + math.abs(slot16)) - h
			end

			slot18 = highlighted_row_item.gui_panel
			slot19 = self._item_panel_parent
			dy = -((highlighted_row_item.gui_panel.world_y(slot16) + highlighted_row_item.gui_panel.h(highlighted_row_item.gui_panel)) - (self._item_panel_parent.world_y(highlighted_row_item.gui_panel) + self._item_panel_parent.h(self._item_panel_parent)) + offset)
		end

		local old_dy = self._scroll_data.dy_left
		slot18 = old_dy
		slot19 = old_dy
		local is_same_dir = math.sign(slot17) == math.sign(dy) or dy == 0

		if is_same_dir then
			slot24 = self._item_panel_parent
			slot21 = self._item_panel_parent.world_y(self._item_panel_parent) + self._item_panel_parent.h(self._item_panel_parent)
			local within_view = math.within(slot18, highlighted_row_item.gui_panel.world_y(slot20), self._item_panel_parent.world_y(highlighted_row_item.gui_panel))

			if within_view then
				slot23 = dy
				dy = math.max(slot19, math.abs(old_dy)) * math.sign(math.abs(old_dy))
			end
		end
	end

	slot7 = dy

	self.scroll_start(slot5, self)

	return 
end
function NodeGui:scroll_setup()
	self._scroll_data = {
		max_scroll_duration = 0.5,
		scroll_speed = (self.font_size + self.spacing * 2) / 0.1,
		dy_total = 0,
		dy_left = 0
	}

	return 
end
function NodeGui:scroll_start(dy)
	local speed = self._scroll_data.scroll_speed

	if 0 < speed then
		slot5 = dy / speed

		if self._scroll_data.max_scroll_duration < math.abs(slot4) then
			slot5 = dy
			speed = math.abs(slot4) / self._scroll_data.max_scroll_duration
		end
	end

	self._scroll_data.speed = speed
	self._scroll_data.dy_total = dy
	self._scroll_data.dy_left = dy
	slot5 = self
	slot8 = TimerManager
	slot8 = TimerManager.main(slot7)

	self.scroll_update(slot4, TimerManager.main(slot7).delta_time(slot7))

	return 
end
function NodeGui:scroll_update(dt)
	local dy_left = self._scroll_data.dy_left

	if dy_left ~= 0 then
		local speed = self._scroll_data.speed
		local dy = nil

		if speed <= 0 then
			dy = dy_left
		else
			slot8 = dy_left
			slot13 = dy_left
			slot13 = 1
			dy = math.lerp(slot6, 0, math.clamp(slot10, (math.sign(slot12) * speed * dt) / dy_left, 0))
		end

		self._scroll_data.dy_left = self._scroll_data.dy_left - dy

		if self._item_panel_y and self._item_panel_y.target then
			self._item_panel_y.target = self._item_panel_y.target + dy
			slot9 = dy

			self.item_panel.move(self._item_panel_y.target + dy, self.item_panel, 0)
		else
			slot9 = dy

			self.item_panel.move(slot6, self.item_panel, 0)
		end

		return true
	end

	return 
end
function NodeGui:wheel_scroll_start(dy)
	local speed = 30

	if 0 < dy then
		slot6 = self._item_panel_parent
		local dist = self.item_panel.world_y(slot4) - self._item_panel_parent.world_y(self.item_panel)
		slot8 = self.item_panel

		if math.round(self.item_panel.world_y(self._item_panel_parent)) - self._item_panel_parent.world_y(self.item_panel.world_y) >= 0 then
			slot7 = self._item_panel_parent

			return self._item_panel_parent.h(self.item_panel) < self.item_panel.h(slot5)
		end

		slot6 = speed
		slot9 = dist
		speed = math.min(slot5, math.abs(slot8))
	else
		slot6 = self._item_panel_parent
		local dist = self.item_panel.world_bottom(slot4) - self._item_panel_parent.world_bottom(self.item_panel)
		slot8 = self.item_panel

		if math.round(self.item_panel.world_bottom(self._item_panel_parent)) - self._item_panel_parent.world_bottom(self.item_panel.world_bottom) < 4 then
			slot7 = self._item_panel_parent

			return self._item_panel_parent.h(self.item_panel) < self.item_panel.h(slot5)
		end

		slot6 = speed
		slot9 = dist
		speed = math.min(slot5, math.abs(slot8))
	end

	slot6 = speed * dy

	self.scroll_start(slot4, self)

	return true
end
function NodeGui:highlight_item(item, mouse_over)
	if not item then
		return 
	end

	local item_name = item.parameters(slot4).name
	slot7 = item
	local row_item = self.row_item(item, self)
	slot9 = mouse_over

	self._highlight_row_item(self, self, row_item)

	slot8 = row_item

	self._reposition_items(self, self)

	self._highlighted_item = item

	return 
end
function NodeGui:_highlight_row_item(row_item, mouse_over)
	if row_item then
		row_item.highlighted = true
		slot5 = row_item.item
		row_item.color = (row_item.item.enabled(slot4) and (row_item.hightlight_color or self.row_item_hightlight_color)) or row_item.disabled_color
		slot6 = row_item.color

		row_item.gui_panel.set_color(slot4, row_item.gui_panel)
	end

	return 
end
function NodeGui:fade_item(item)
	local item_name = item.parameters(slot3).name
	slot6 = item
	local row_item = self.row_item(item, self)
	slot7 = row_item

	self._fade_row_item(self, self)

	return 
end
function NodeGui:_fade_row_item(row_item)
	if row_item then
		row_item.highlighted = false
		slot4 = row_item.item
		row_item.color = (row_item.item.enabled(slot3) and (row_item.row_item_color or self.row_item_color)) or row_item.disabled_color
		slot5 = row_item.color

		row_item.gui_panel.set_color(slot3, row_item.gui_panel)
	end

	return 
end
function NodeGui:row_item(item)
	local item_name = item.parameters(slot3).name
	slot5 = self.row_items

	for _, row_item in ipairs(item) do
		if row_item.name == item_name then
			return row_item
		end
	end

	return nil
end
function NodeGui:row_item_by_name(item_name)
	slot4 = self.row_items

	for _, row_item in ipairs(slot3) do
		if row_item.name == item_name then
			return row_item
		end
	end

	return nil
end
function NodeGui:update(t, dt)
	slot6 = dt
	local scrolled = self.scroll_update(slot4, self)

	if self._item_panel_y and not scrolled then
		if self._item_panel_y.target then
			slot6 = self.item_panel

			if self.item_panel.center_y(slot5) ~= self._item_panel_y.target then
				slot9 = self.item_panel
				slot9 = dt * 10
				slot5 = math.lerp(slot6, self.item_panel.center_y(slot8), self._item_panel_y.target)
				self._item_panel_y.current = slot5
				slot7 = self._item_panel_y.current

				self.item_panel.set_center_y(slot5, self.item_panel)

				slot6 = self

				self._set_topic_position(slot5)
			end
		end
	elseif scrolled then
		if self._item_panel_y and self._item_panel_y.target then
			slot6 = self.item_panel

			if self.item_panel.center_y(slot5) ~= self._item_panel_y.target then
				slot9 = self.item_panel
				slot9 = dt * 10
				self._item_panel_y.current = math.lerp(slot6, self.item_panel.center_y(slot8), self._item_panel_y.target)
			end
		end

		slot6 = self

		self._set_topic_position(slot5)
	end

	return 
end
function NodeGui:_get_node_padding()
	local menu_node_padding = 0
	menu_node_padding = 30

	return menu_node_padding
end
function NodeGui:_get_node_background_width()
	slot3 = self.item_panel
	local bg_width = self.item_panel.w(slot2)
	bg_width = bg_width * 0.4

	return bg_width
end
function NodeGui:_set_icon_position(row_item)
	slot4 = row_item.icon

	if alive(slot3) and row_item.icon then
		slot8 = row_item.icon
		slot5 = self._get_node_background_width(slot6) - row_item.icon.w(self) * 1.5

		row_item.icon.set_left(slot3, row_item.icon)

		slot4 = row_item.icon
		slot7 = row_item.gui_panel

		row_item.icon.set_center_y(slot3, row_item.gui_panel.center_y(row_item.icon.w(self) * 1.5))

		slot4 = row_item.icon
		slot7 = row_item.gui_panel

		row_item.icon.set_color(slot3, row_item.gui_panel.color(row_item.icon.w(self) * 1.5))
	end

	return 
end
function NodeGui:_set_topic_position()
	return 
end
function NodeGui:_item_panel_height()
	local height = self.height_padding * 2
	slot4 = self.row_items

	for _, row_item in pairs(slot3) do
		slot9 = row_item.item

		if not row_item.item.parameters(slot8).back then
			slot9 = row_item.item

			if not row_item.item.parameters(slot8).pd2_corner then
				slot9 = row_item.gui_panel
				local x, y, w, h = row_item.gui_panel.shape(slot8)
				height = height + h + self.spacing
			end
		end
	end

	slot4 = self
	local node_padding = self._get_node_padding(slot3)
	height = height + 2 * node_padding

	return height
end
function NodeGui:_set_item_positions()
	slot3 = self
	local total_height = self._item_panel_height(slot2)
	local current_y = self.height_padding
	local current_item_height = 0
	local scaled_size = managers.gui_data.scaled_size(slot5)
	local node_padding = self._get_node_padding(managers.gui_data)
	slot8 = self.row_items

	for _, row_item in pairs(self) do
		slot13 = row_item.item

		if not row_item.item.parameters(slot12).back then
			local shift_right = 650
			row_item.position.x = shift_right + 20
			slot15 = row_item.position.x

			row_item.gui_panel.set_x(shift_right + 20, row_item.gui_panel)

			row_item.position.y = current_y
			slot15 = row_item.position.y + node_padding

			row_item.gui_panel.set_y(shift_right + 20, row_item.gui_panel)

			if row_item.background_image then
				slot15 = shift_right

				row_item.background_image.set_x(slot13, row_item.background_image)

				slot15 = row_item.position.y + node_padding

				row_item.background_image.set_y(slot13, row_item.background_image)
			end

			if row_item.current_of_total then
				slot15 = 200

				row_item.current_of_total.set_w(slot13, row_item.current_of_total)

				slot14 = row_item.current_of_total
				slot17 = row_item.gui_panel

				row_item.current_of_total.set_center_y(slot13, row_item.gui_panel.center_y(slot16))

				slot17 = row_item.gui_panel
				slot15 = row_item.gui_panel.right(slot16) - self._align_line_padding

				row_item.current_of_total.set_right(slot13, row_item.current_of_total)
			end

			slot16 = self

			row_item.item.on_item_position(slot13, row_item.item, row_item)

			slot15 = row_item

			self._set_icon_position(slot13, self)

			slot14 = row_item.gui_panel
			local x, y, w, h = row_item.gui_panel.shape(slot13)
			current_item_height = h + self.spacing
			current_y = current_y + current_item_height
			slot18 = row_item.item

			if row_item.item.parameters(slot17) then
				slot18 = row_item.item

				if row_item.item.parameters(slot17).force_x then
					slot18 = row_item.gui_panel
					slot23 = row_item.item
					slot21 = row_item.item.parameters(slot22).force_x

					row_item.gui_panel.set_x(slot17, tonumber(slot20))
				end
			end

			slot18 = row_item.item

			if row_item.item.parameters(slot17) then
				slot18 = row_item.item

				if row_item.item.parameters(slot17).force_y then
					slot18 = row_item.gui_panel
					slot23 = row_item.item
					slot21 = row_item.item.parameters(slot22).force_y

					row_item.gui_panel.set_y(slot17, tonumber(slot20))
				end
			end
		end
	end

	slot8 = self.row_items

	for _, row_item in pairs(slot7) do
		slot13 = row_item.item

		if not row_item.item.parameters(slot12).back then
			slot13 = row_item.item

			if not row_item.item.parameters(slot12).pd2_corner then
				slot15 = self

				row_item.item.on_item_positions_done(slot12, row_item.item, row_item)
			end
		end
	end

	return 
end
function NodeGui:resolution_changed()
	slot3 = self

	self._setup_size(slot2)

	slot3 = self

	self._set_item_positions(slot2)

	slot4 = self._highlighted_item

	self.highlight_item(slot2, self)

	return 
end
function NodeGui:_setup_item_panel_parent(safe_rect)
	slot8 = safe_rect.height

	self._item_panel_parent.set_shape(slot3, self._item_panel_parent, safe_rect.x, safe_rect.y, safe_rect.width)

	return 
end
function NodeGui:_set_width_and_height(safe_rect)
	self.width = safe_rect.width
	self.height = safe_rect.height

	return 
end
function NodeGui:_setup_item_panel(safe_rect, res)
	local item_panel_offset = safe_rect.height * 0.5 - #self.row_items * 0.5 * (self.font_size + self.spacing)

	if item_panel_offset < 0 then
		item_panel_offset = 0
	end

	slot7 = safe_rect.width

	self.item_panel.set_w(slot5, self.item_panel)

	return 
end
function NodeGui:_scaled_size()
	slot3 = managers.gui_data

	return managers.gui_data.scaled_size(slot2)
end
function NodeGui:_setup_size()
	local safe_rect = managers.viewport.get_safe_rect_pixels(slot2)
	slot4 = managers.gui_data
	local scaled_size = managers.gui_data.scaled_size(managers.viewport)
	local res = RenderSettings.resolution
	slot7 = self.ws

	managers.gui_data.layout_workspace(slot5, managers.gui_data)

	slot7 = scaled_size

	self._setup_item_panel_parent(slot5, self)

	slot7 = scaled_size

	self._set_width_and_height(slot5, self)

	slot8 = res

	self._setup_item_panel(slot5, self, scaled_size)

	if self.texture then
		slot7 = res.x

		self.texture.set_width(slot5, self.texture)

		slot7 = res.x / 2

		self.texture.set_height(slot5, self.texture)

		slot7 = safe_rect.x + safe_rect.width / 2

		self.texture.set_center_x(slot5, self.texture)

		slot7 = safe_rect.y + safe_rect.height / 2

		self.texture.set_center_y(slot5, self.texture)
	end

	slot10 = scaled_size.height

	self.safe_rect_panel.set_shape(slot5, self.safe_rect_panel, scaled_size.x, scaled_size.y, scaled_size.width)

	slot6 = self.row_items

	for _, row_item in pairs(slot5) do
		slot11 = row_item.item

		if row_item.item.parameters(slot10).back then
			slot12 = 24

			row_item.gui_panel.set_w(slot10, row_item.gui_panel)

			slot12 = 24

			row_item.gui_panel.set_h(slot10, row_item.gui_panel)

			slot11 = row_item.gui_panel
			slot14 = self

			row_item.gui_panel.set_right(slot10, self._mid_align(slot13))

			slot14 = row_item.gui_panel
			slot12 = (64 * row_item.gui_panel.h(slot13)) / 32

			row_item.unselected.set_h(slot10, row_item.unselected)

			slot14 = row_item.gui_panel
			slot12 = row_item.gui_panel.h(slot13) / 2

			row_item.unselected.set_center_y(slot10, row_item.unselected)

			slot11 = row_item.selected
			slot14 = row_item.unselected

			row_item.selected.set_shape(slot10, row_item.unselected.shape(slot13))

			slot12 = row_item.gui_panel.w(slot13)
			slot15 = row_item.gui_panel

			row_item.arrow_selected.set_size(slot10, row_item.arrow_selected, row_item.gui_panel.h(row_item.gui_panel))

			slot12 = row_item.gui_panel.w(row_item.gui_panel.h)
			slot15 = row_item.gui_panel

			row_item.arrow_unselected.set_size(slot10, row_item.arrow_unselected, row_item.gui_panel.h(row_item.gui_panel))

			break
		end

		slot12 = row_item

		self._setup_item_size(slot10, self)
	end

	return 
end
function NodeGui:_setup_item_size(row_item)
	return 
end
function NodeGui:mouse_pressed(button, x, y)
	slot8 = y

	if self.item_panel.inside(slot5, self.item_panel, x) then
		slot8 = y

		if self._item_panel_parent.inside(slot5, self._item_panel_parent, x) then
			slot6 = self

			if self._mid_align(slot5) < x then
				slot6 = "mouse wheel down"

				if button == Idstring(slot5) then
					slot7 = -1

					return self.wheel_scroll_start(slot5, self)
				else
					slot6 = "mouse wheel up"

					if button == Idstring(slot5) then
						slot7 = 1

						return self.wheel_scroll_start(slot5, self)
					end
				end
			end
		end
	end

	return 
end

return 
