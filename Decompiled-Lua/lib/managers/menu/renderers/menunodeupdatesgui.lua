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
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not MenuNodeUpdatesGui then
	slot2 = MenuNodeGui
	slot0 = class(slot1)
end

MenuNodeUpdatesGui = slot0
MenuNodeUpdatesGui.PADDING = 10
function MenuNodeUpdatesGui:init(node, layer, parameters)

	-- Decompilation error in this vicinity:
	slot9 = parameters

	MenuNodeUpdatesGui.super.init(slot5, self, node, layer)

	slot4 = tweak_data.gui

	return 
end
function MenuNodeUpdatesGui:_db_result_recieved(success, page)
	if not self then
		return 
	end

	local item_list = self._tweak_data.item_list
	local num_items = self._tweak_data.num_items or 5
	local items_source = {}
	local items = {}
	local prefix = "##1##"
	slot11 = prefix
	local item_start = string.find(slot9, page)

	for index = 1, #item_list, 1 do
		local item = item_list[index]

		if item and item.use_db then
			if index == num_items then
				slot14 = "##end##"
			else
				slot17 = index + 1
				local suffix = "##" .. tonumber(slot16) .. "##"
			end

			local item_end = string.find(slot16, page)
			slot19 = index
			slot21 = item_end
			items_source["fav" .. tostring(suffix)] = string.sub(suffix, page, item_start)
			item_start = item_end
		end
	end

	slot11 = items_source

	for item_id, s in pairs(slot10) do
		slot19 = "</h2>"
		local title_text = self._get_text(slot15, self, s, "<h2>")
		local desc_text = self._get_text(self, self, s, "<p>")
		slot24 = "</iframe>"
		slot21 = "\" "
		local link_text = self._get_text(slot17, self, self._get_text("</p>", self, s, "<iframe") or "", "src=\"")
		slot20 = "http:"

		if not string.find(slot18, link_text) then
			link_text = "http:" .. link_text
		end

		items[item_id] = {
			title = title_text,
			desc = desc_text,
			link = link_text
		}
	end

	self._db_items = items
	slot11 = self._loading_bitmap

	if alive(slot10) then
		slot11 = self._loading_bitmap
		slot12 = self._loading_bitmap

		self._loading_bitmap.parent(slot10).remove(slot10, self._loading_bitmap.parent(slot10))
	end

	slot11 = self._loading_text

	if alive(slot10) then
		slot11 = self._loading_text
		slot12 = self._loading_text

		self._loading_text.parent(slot10).remove(slot10, self._loading_text.parent(slot10))
	end

	slot11 = self._previous_update_texts

	for i, text in pairs(slot10) do
		if self._db_items[i] then
			slot17 = self._db_items[i].title or " "

			text.set_text(slot15, text)

			slot17 = text

			self.make_fine_text(slot15, self)
		end
	end

	slot11 = self

	self.set_latest_text(slot10)

	return 
end
function MenuNodeUpdatesGui:_get_text(s, sp, ep)
	local result = {}
	slot7 = s
	local len = string.len(slot6)
	local i = 1
	slot12 = true
	local s1, e1 = string.find(slot8, s, sp, 1)

	if not e1 then
		return ""
	end

	slot14 = true
	local s2, e2 = string.find(slot10, s, ep, e1)
	slot15 = s2 - 1

	return string.sub(ep, s, e1 + 1) or ""
end
function MenuNodeUpdatesGui:_get_db_text(id, category)
	if not self._db_items then
		return 
	end

	if not self._db_items[id] then
		return 
	end

	return self._db_items[id][category]
end
function MenuNodeUpdatesGui:setup()

	-- Decompilation error in this vicinity:
	self.unretrieve_textures(slot2)

	self._next_page_highlighted = nil
	self._prev_page_highlighted = nil
	self._back_button_highlighted = nil
	local ws = self.ws
	slot4 = ws
	slot5 = "MenuNodeUpdatesGui"

	if not ws.panel(self).child(self, ws.panel(self)) then
		slot4 = ws
		slot5 = {
			name = "MenuNodeUpdatesGui"
		}
		local panel = ws.panel(slot3).panel(slot3, ws.panel(slot3))
	end

	self._panel = panel
	slot5 = panel

	panel.clear(slot4)

	slot6 = self._tweak_data.title_id or "menu_content_updates"
	local title_text = managers.localization.to_upper_text(slot4, managers.localization)
	slot7 = {
		vertical = "top",
		align = "left",
		text = title_text,
		font_size = tweak_data.menu.pd2_large_font_size,
		font = tweak_data.menu.pd2_large_font,
		color = tweak_data.screen_colors.text
	}

	panel.text(managers.localization, panel)

	slot7 = {
		vertical = "bottom",
		name = "back_button",
		align = "right",
		text = managers.localization.to_upper_text(slot9, managers.localization),
		font_size = tweak_data.menu.pd2_large_font_size,
		font = tweak_data.menu.pd2_large_font,
		color = tweak_data.screen_colors.button_stage_3
	}
	slot11 = "menu_back"
	local back_button = panel.text(managers.localization, panel)
	slot8 = back_button

	self.make_fine_text(panel, self)

	slot7 = back_button
	slot10 = panel

	back_button.set_right(panel, panel.w(slot9))

	slot7 = back_button
	slot10 = panel

	back_button.set_bottom(panel, panel.h(slot9))

	slot7 = back_button
	slot10 = managers.menu

	back_button.set_visible(panel, managers.menu.is_pc_controller(slot9))

	if MenuBackdropGUI then
		slot8 = {
			vertical = "top",
			alpha = 0.4,
			align = "left",
			rotation = 360,
			layer = -1,
			text = title_text,
			font_size = tweak_data.menu.pd2_massive_font_size,
			font = tweak_data.menu.pd2_massive_font,
			color = tweak_data.screen_colors.button_stage_3
		}
		local bg_text = panel.text(slot6, panel)
		slot9 = bg_text

		self.make_fine_text(panel, self)

		slot10 = -9

		bg_text.move(panel, bg_text, -13)

		slot9 = bg_text

		MenuBackdropGUI.animate_bg_text(panel, self)

		slot8 = managers.menu

		if managers.menu.is_pc_controller(panel) then
			slot9 = {
				vertical = "bottom",
				alpha = 0.4,
				align = "right",
				rotation = 360,
				layer = -1,
				text = managers.localization.to_upper_text(slot11, managers.localization),
				font_size = tweak_data.menu.pd2_massive_font_size,
				font = tweak_data.menu.pd2_massive_font,
				color = tweak_data.screen_colors.button_stage_3
			}
			slot13 = "menu_back"
			local bg_back = panel.text(slot7, panel)
			slot10 = bg_back

			self.make_fine_text(panel, self)

			slot11 = 9

			bg_back.move(panel, bg_back, 13)

			slot10 = bg_back

			MenuBackdropGUI.animate_bg_text(panel, self)
		end
	end

	self._requested_textures = {}
	local num_previous_updates = self._tweak_data.num_items or 5
	slot8 = self._node
	local current_page = self._node.parameters(slot7).current_page or 1
	local start_number = (current_page - 1) * num_previous_updates
	local content_updates = self._tweak_data.item_list or {}
	local previous_updates = {}
	local latest_update = content_updates[#content_updates - start_number]
	slot15 = 1

	for i = #content_updates - start_number, math.max(slot13, #content_updates - num_previous_updates - start_number + 1), -1 do
		slot18 = content_updates[i]

		table.insert(slot16, previous_updates)
	end

	self._lastest_content_update = latest_update
	self._previous_content_updates = previous_updates
	self._num_previous_updates = num_previous_updates
	slot14 = {
		name = "lastest_content_update",
		y = 70,
		x = 0,
		w = panel.w(slot16) / 2,
		h = panel.w(slot16) / 4
	}
	slot17 = panel
	slot17 = panel
	local latest_update_panel = panel.panel(slot12, panel)
	slot15 = "WIN32"

	if SystemInfo.platform(panel) ~= Idstring(SystemInfo) then
		slot17 = latest_update_panel
		slot15 = latest_update_panel.w(slot16) * 0.8

		latest_update_panel.set_w(slot13, latest_update_panel)

		slot17 = latest_update_panel
		slot15 = latest_update_panel.w(slot16) * 0.5

		latest_update_panel.set_h(slot13, latest_update_panel)
	end

	slot16 = {
		sides = {
			2,
			2,
			2,
			2
		}
	}
	local selected = BoxGuiObject.new(slot13, BoxGuiObject, latest_update_panel)
	slot17 = {
		sides = {
			1,
			1,
			1,
			1
		}
	}

	BoxGuiObject.new(BoxGuiObject, BoxGuiObject, latest_update_panel)

	self._selects = {
		[latest_update.id] = selected
	}
	self._select_x = 1
	local w = panel.w(latest_update.id)
	slot17 = "WIN32"
	local padding = (SystemInfo.platform(panel) == Idstring(SystemInfo) and 30) or 5
	slot18 = "WIN32"
	slot19 = {
		name = "latest_description",
		w = panel.w(slot21) - slot21 - padding,
		h = dech_panel_h,
		x = latest_update_panel.right(slot21) + padding,
		y = latest_update_panel.top(slot21)
	}
	slot23 = latest_update_panel
	slot21 = latest_update_panel.w(panel)
	slot22 = latest_update_panel
	slot22 = latest_update_panel
	local latest_desc_panel = panel.panel(slot17, panel)
	slot21 = {
		sides = {
			1,
			1,
			1,
			1
		}
	}

	BoxGuiObject.new(panel, BoxGuiObject, latest_desc_panel)

	slot23 = {
		name = "title_text",
		text = title_string,
		font = tweak_data.menu.pd2_large_font,
		font_size = tweak_data.menu.pd2_large_font_size,
		color = tweak_data.screen_colors.text,
		x = self.PADDING,
		y = self.PADDING
	}
	local title_text = latest_desc_panel.text(slot21, latest_desc_panel)
	slot24 = {
		name = "date_text",
		text = date_string,
		font = tweak_data.menu.pd2_medium_font,
		font_size = tweak_data.menu.pd2_medium_font_size,
		color = tweak_data.screen_colors.text,
		x = self.PADDING
	}
	local date_text = latest_desc_panel.text(latest_desc_panel, latest_desc_panel)
	slot25 = {
		name = "desc_text",
		wrap = true,
		word_wrap = true,
		text = desc_string,
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size,
		color = tweak_data.screen_colors.text,
		x = self.PADDING
	}
	local desc_text = latest_desc_panel.text(latest_desc_panel, latest_desc_panel)
	slot25 = title_text
	local x, y, w, h = title_text.text_rect(latest_desc_panel)
	slot31 = h

	title_text.set_size(slot28, title_text, w)

	slot25 = date_text
	local x, y, w, h = date_text.text_rect(latest_desc_panel)

	date_text.set_size(slot28, date_text, w)

	slot29 = date_text
	slot32 = title_text

	date_text.set_top(slot28, title_text.bottom(h))

	slot25 = desc_text
	slot28 = date_text

	desc_text.set_top(latest_desc_panel, date_text.bottom(date_text.set_top))

	slot30 = desc_text
	slot27 = latest_desc_panel.h(latest_desc_panel) - desc_text.top(latest_desc_panel) - self.PADDING

	desc_text.set_size(latest_desc_panel, desc_text, latest_desc_panel.w(date_text.set_top) - self.PADDING * 2)

	if self._tweak_data.button then
		slot26 = {
			w = 32,
			name = "top_button",
			h = 32
		}
		local top_button = panel.panel(slot24, panel)
		local w = 0
		local h = 0

		if self._tweak_data.button.text_id then
			slot29 = {
				vertical = "top",
				halign = "right",
				align = "right",
				valign = "top",
				text = managers.localization.to_upper_text(slot31, managers.localization),
				font_size = tweak_data.menu.pd2_medium_font_size,
				font = tweak_data.menu.pd2_medium_font,
				color = tweak_data.screen_colors.button_stage_3
			}
			slot33 = self._tweak_data.button.text_id
			local text = top_button.text(slot27, top_button)
			slot30 = text
			local _, _, tw, th = self.make_fine_text(top_button, self)
			slot34 = 0

			text.set_top(managers.localization, text)

			slot33 = text
			slot36 = top_button

			text.set_right(managers.localization, top_button.w(slot35))

			slot34 = tw
			w = math.max(managers.localization, w)
			slot34 = th
			h = math.max(managers.localization, h)
		end

		if self._tweak_data.button.image then
			slot29 = {
				valign = "top",
				halign = "right",
				texture = self._tweak_data.button.image,
				color = tweak_data.screen_colors.button_stage_3
			}
			local bitmap = top_button.bitmap(slot27, top_button)
			slot30 = 0

			bitmap.set_top(top_button, bitmap)

			slot29 = bitmap
			slot32 = top_button

			bitmap.set_right(top_button, top_button.w(slot31))

			slot29 = w
			slot32 = bitmap
			w = math.max(top_button, bitmap.w(slot31))
			slot29 = h
			slot32 = bitmap
			h = math.max(top_button, bitmap.h(slot31))
		end

		top_button.set_size(slot27, top_button, w)

		slot28 = top_button
		slot31 = latest_desc_panel

		top_button.set_bottom(slot27, latest_desc_panel.top(h))

		slot28 = top_button
		slot31 = panel

		top_button.set_right(slot27, panel.w(h))
	end

	local small_width = w / num_previous_updates - self.PADDING * 2
	slot27 = {
		name = "previous_content_updates",
		x = 0,
		w = w,
		h = small_width / 2 + self.PADDING * 2,
		y = math.max(self.PADDING * 2, latest_desc_panel.bottom(latest_update_panel)) + 30
	}
	slot30 = latest_update_panel.bottom(slot31)
	slot33 = latest_desc_panel
	local previous_updates_panel = panel.panel(slot25, panel)
	slot27 = panel
	slot25 = panel.text
	slot28 = {
		name = "previous_update_text"
	}

	return 
end
function MenuNodeUpdatesGui:make_fine_text(text)
	slot4 = text
	local x, y, w, h = text.text_rect(slot3)

	text.set_size(slot7, text, w)

	slot9 = math.round(h)
	slot12 = y

	text.set_position(slot7, text, math.round(x))

	return x, y, w, h
end
function MenuNodeUpdatesGui:texture_done_clbk(panel, texture_ids)
	slot6 = {
		name = "texture",
		texture = texture_ids,
		w = panel.w(slot8),
		h = panel.h(slot8)
	}
	slot9 = panel
	slot9 = panel

	panel.bitmap(slot4, panel)

	return 
end
function MenuNodeUpdatesGui:check_inside(x, y)
	local ws = self.ws
	slot6 = ws
	slot7 = "MenuNodeUpdatesGui"
	local panel = ws.panel(slot5).child(slot5, ws.panel(slot5))
	slot8 = "lastest_content_update"
	local latest_update_panel = panel.child(ws.panel(slot5), panel)
	slot9 = "previous_content_updates"
	local previous_updates_panel = panel.child(panel, panel)
	slot11 = y

	if latest_update_panel.inside(panel, latest_update_panel, x) then
		return self._lastest_content_update
	else
		slot11 = y

		if previous_updates_panel.inside(slot8, previous_updates_panel, x) then
			local child = nil
			slot10 = self._previous_content_updates

			for index, data in ipairs(slot9) do
				slot16 = data.id
				child = previous_updates_panel.child(slot14, previous_updates_panel)
				slot15 = child

				if alive(slot14) then
					slot17 = y

					if child.inside(slot14, child, x) then
						self._select_x = index

						return data
					end
				end
			end
		end
	end

	return nil
end
function MenuNodeUpdatesGui:mouse_moved(o, x, y)
	local moved = self._mouse_x ~= x or self._mouse_y ~= y
	self._mouse_x = x
	self._mouse_y = y
	slot7 = self._prev_page

	if alive(slot6) then
		slot8 = "text_obj"
		local text = self._prev_page.child(slot6, self._prev_page)

		if 1 < self._current_page then
			slot10 = y

			if self._prev_page.inside(slot7, self._prev_page, x) then
				if not self._prev_page_highlighted then
					self._prev_page_highlighted = true
					slot9 = "highlight"

					managers.menu_component.post_event(slot7, managers.menu_component)

					slot9 = tweak_data.screen_colors.button_stage_2

					text.set_color(slot7, text)
				end

				return true, "link"
			elseif self._prev_page_highlighted then
				self._prev_page_highlighted = false
				slot9 = tweak_data.screen_colors.button_stage_3

				text.set_color(slot7, text)
			end
		end
	end

	slot7 = self._next_page

	if alive(slot6) then
		slot8 = "text_obj"
		local text = self._next_page.child(slot6, self._next_page)
		local num_pages = self._num_pages

		if self._current_page < num_pages then
			slot11 = y

			if self._next_page.inside(slot8, self._next_page, x) then
				if not self._next_page_highlighted then
					self._next_page_highlighted = true
					slot10 = "highlight"

					managers.menu_component.post_event(slot8, managers.menu_component)

					slot10 = tweak_data.screen_colors.button_stage_2

					text.set_color(slot8, text)
				end

				return true, "link"
			elseif self._next_page_highlighted then
				self._next_page_highlighted = false
				slot10 = tweak_data.screen_colors.button_stage_3

				text.set_color(slot8, text)
			end
		end
	end

	local ws = self.ws
	slot8 = ws
	slot9 = "MenuNodeUpdatesGui"
	local panel = ws.panel(slot7).child(slot7, ws.panel(slot7))
	slot10 = "back_button"
	local back_button = panel.child(ws.panel(slot7), panel)
	slot12 = y
	local back_highlighted = back_button.inside(panel, back_button, x)

	if back_highlighted then
		if not self._back_button_highlighted then
			self._back_button_highlighted = true
			slot12 = tweak_data.screen_colors.button_stage_2

			back_button.set_color(slot10, back_button)

			slot12 = "highlight"

			managers.menu_component.post_event(slot10, managers.menu_component)
		end

		return true, (self._pressed and "arrow") or "link"
	elseif self._back_button_highlighted then
		self._back_button_highlighted = false
		slot12 = tweak_data.screen_colors.button_stage_3

		back_button.set_color(slot10, back_button)
	end

	slot12 = "top_button"
	local top_button = panel.child(slot10, panel)
	slot12 = top_button

	if alive(panel) then
		slot14 = y
		local top_highlighted = top_button.inside(slot11, top_button, x)

		if top_highlighted then
			if not self._top_button_highlighted then
				self._top_button_highlighted = true
				slot15 = top_button

				for _, child in ipairs(top_button.children(slot14)) do
					slot19 = tweak_data.screen_colors.button_stage_2

					child.set_color(slot17, child)
				end

				slot14 = "highlight"

				managers.menu_component.post_event(slot12, managers.menu_component)
			end

			return true, (self._pressed and "arrow") or "link"
		elseif self._top_button_highlighted then
			self._top_button_highlighted = false
			slot15 = top_button

			for _, child in ipairs(top_button.children(slot14)) do
				slot19 = tweak_data.screen_colors.button_stage_3

				child.set_color(slot17, child)
			end
		end
	end

	slot14 = y
	local content_highlighted = self.check_inside(slot11, self, x)
	slot15 = moved

	if self.set_latest_content(self, self, content_highlighted) then
		return true, (self._pressed and ((self._pressed == content_highlighted and "link") or "arrow")) or "link"
	end

	return false, "arrow"
end
function MenuNodeUpdatesGui:mouse_pressed(button, x, y)
	slot6 = self._prev_page

	if alive(slot5) and 1 < self._current_page then
		slot8 = y

		if self._prev_page.inside(slot5, self._prev_page, x) then
			slot6 = self._node
			self._node.parameters(slot5).current_page = self._current_page - 1
			slot6 = self

			self.setup(self._current_page - 1)

			return 
		end
	end

	slot6 = self._next_page

	if alive(slot5) then
		local num_pages = self._num_pages

		if self._current_page < num_pages then
			slot9 = y

			if self._next_page.inside(slot6, self._next_page, x) then
				slot7 = self._node
				self._node.parameters(slot6).current_page = self._current_page + 1
				slot7 = self

				self.setup(self._current_page + 1)

				return 
			end
		end
	end

	slot8 = y
	self._pressed = self.check_inside(slot5, self, x)
	local ws = self.ws
	slot7 = ws
	slot8 = "MenuNodeUpdatesGui"
	local panel = ws.panel(self).child(self, ws.panel(self))
	slot9 = "back_button"
	local back_button = panel.child(ws.panel(self), panel)
	slot11 = y

	if back_button.inside(panel, back_button, x) then
		slot10 = true

		managers.menu.back(slot8, managers.menu)

		return 
	end

	slot10 = "top_button"
	local top_button = panel.child(slot8, panel)
	slot10 = top_button

	if alive(panel) and self._tweak_data.button and self._tweak_data.button.url then
		slot12 = y

		if top_button.inside(slot9, top_button, x) then
			slot11 = self._tweak_data.button.url

			self.open_url(slot9, self)

			return 
		end
	end

	return 
end
function MenuNodeUpdatesGui:mouse_released(button, x, y)
	slot8 = y
	local released = self.check_inside(slot5, self, x)

	if released and released == self._pressed then
		slot8 = released

		self.open(slot6, self)
	end

	self._pressed = nil

	return 
end
function MenuNodeUpdatesGui:confirm_pressed()
	if self._content_highlighted then
		slot4 = self._content_highlighted

		self.open(slot2, self)
	end

	return 
end
function MenuNodeUpdatesGui:open(content_update)
	self._content_highlighted = content_update
	slot5 = content_update.id

	managers.player.set_content_update_viewed(slot3, managers.player)

	local play_sound = true
	slot6 = "WIN32"

	if SystemInfo.platform(managers.player) == Idstring(SystemInfo) then
		slot5 = MenuCallbackHandler

		if not MenuCallbackHandler.is_overlay_enabled(slot4) then
			slot5 = managers.menu

			managers.menu.show_enable_steam_overlay(slot4)

			play_sound = false
		elseif content_update.webpage then
			slot7 = content_update.webpage

			Steam.overlay_activate(slot4, Steam, "url")
		elseif content_update.store then
			slot7 = content_update.store

			Steam.overlay_activate(slot4, Steam, "store")
		elseif content_update.use_db then
			local webpage = self._db_items and self._db_items[content_update.id] and self._db_items[content_update.id].link

			if webpage then
				slot8 = webpage

				Steam.overlay_activate(slot5, Steam, "url")
			else
				play_sound = false
			end
		else
			play_sound = false
		end
	else
		slot6 = "PS3"

		if SystemInfo.platform(slot4) == Idstring(SystemInfo) then
		else
			play_sound = false
		end
	end

	if play_sound then
		slot6 = "menu_enter"

		managers.menu_component.post_event(slot4, managers.menu_component)
	end

	return 
end
function MenuNodeUpdatesGui:open_url(url)
	slot5 = "WIN32"

	if SystemInfo.platform(slot3) == Idstring(SystemInfo) then
		slot6 = url

		Steam.overlay_activate(slot3, Steam, "url")

		slot5 = "menu_enter"

		managers.menu_component.post_event(slot3, managers.menu_component)
	end

	return 
end
function MenuNodeUpdatesGui:input_focus()
	return 1
end
function MenuNodeUpdatesGui:set_latest_text()

	-- Decompilation error in this vicinity:
	if not self._content_highlighted then
		return 
	end

	local ws = self.ws
	slot4 = ws
	slot5 = "MenuNodeUpdatesGui"
	local panel = ws.panel(slot3).child(slot3, ws.panel(slot3))
	slot6 = "latest_description"
	local latest_desc_panel = panel.child(ws.panel(slot3), panel)
	slot10 = "title_text"
	local title_text = latest_desc_panel.child(slot8, latest_desc_panel)
	slot11 = "date_text"
	local date_text = latest_desc_panel.child(latest_desc_panel, latest_desc_panel)
	slot12 = "desc_text"
	local desc_text = latest_desc_panel.child(latest_desc_panel, latest_desc_panel)
	slot13 = title_string

	title_text.set_text(latest_desc_panel, title_text)

	slot12 = title_text
	local x, y, w, h = title_text.text_rect(latest_desc_panel)
	slot18 = h

	title_text.set_size(slot15, title_text, w)

	slot13 = date_string

	date_text.set_text(latest_desc_panel, date_text)

	slot12 = date_text
	local x, y, w, h = date_text.text_rect(latest_desc_panel)

	date_text.set_size(slot15, date_text, w)

	slot16 = date_text
	slot19 = title_text

	date_text.set_top(slot15, title_text.bottom(h))

	slot13 = desc_string

	desc_text.set_text(latest_desc_panel, desc_text)

	slot12 = desc_text
	slot15 = date_text

	desc_text.set_top(latest_desc_panel, date_text.bottom(date_text.set_top))

	slot17 = desc_text
	slot14 = latest_desc_panel.h(latest_desc_panel) - desc_text.top(latest_desc_panel) - self.PADDING

	desc_text.set_size(latest_desc_panel, desc_text, latest_desc_panel.w(date_text.set_top) - self.PADDING * 2)

	return 
end
function MenuNodeUpdatesGui:set_latest_content(content_highlighted, moved, refresh)
	local result = false

	if content_highlighted then
		if moved and self._content_highlighted ~= content_highlighted then
			self._content_highlighted = content_highlighted
			self._lastest_content_update = content_highlighted
			slot8 = "highlight"

			managers.menu_component.post_event(slot6, managers.menu_component)

			local ws = self.ws
			slot8 = ws
			slot9 = "MenuNodeUpdatesGui"
			local panel = ws.panel(managers.menu_component).child(managers.menu_component, ws.panel(managers.menu_component))
			slot10 = "lastest_content_update"
			local latest_update_panel = panel.child(ws.panel(managers.menu_component), panel)
			slot13 = "texture"

			if alive(latest_update_panel.child(slot11, latest_update_panel)) then
				slot10 = latest_update_panel
				slot14 = "texture"

				latest_update_panel.remove(slot9, latest_update_panel.child(slot12, latest_update_panel))
			end

			if self._lastest_texture_request then
				slot12 = self._lastest_texture_request.texture_count

				managers.menu_component.unretrieve_texture(slot9, managers.menu_component, self._lastest_texture_request.texture)
			end

			local texture = content_highlighted.image
			slot12 = texture
			slot18 = latest_update_panel
			local texture_count = managers.menu_component.request_texture(slot10, managers.menu_component, callback(slot14, self, self, "texture_done_clbk"))
			self._lastest_texture_request = {
				texture_count = texture_count,
				texture = texture
			}
			slot12 = self

			self.set_latest_text(managers.menu_component)
		end

		result = true
	elseif self._content_highlighted then
	end

	slot7 = self._selects

	for id, box in pairs(slot6) do
		slot13 = self._content_highlighted and self._content_highlighted.id == id

		box.set_visible(slot11, box)
	end

	return result
end
function MenuNodeUpdatesGui:move_highlight(x, y)
	local ws = self.ws
	slot6 = ws
	slot7 = "MenuNodeUpdatesGui"
	local panel = ws.panel(slot5).child(slot5, ws.panel(slot5))
	slot8 = "lastest_content_update"
	local latest_update_panel = panel.child(ws.panel(slot5), panel)
	slot9 = "previous_content_updates"
	local previous_updates_panel = panel.child(panel, panel)
	local content_highlighted = self._content_highlighted

	if not content_highlighted then
	else
		self._select_x = self._select_x + x
	end

	local old_x = self._select_x
	slot12 = 1
	slot16 = self._num_previous_updates
	self._select_x = math.clamp(slot10, self._select_x, math.min(slot14, #self._previous_content_updates))
	local diff_x = old_x - self._select_x

	if diff_x < 0 then
		slot12 = self

		if self.previous_page(slot11) then
			self._select_x = self._num_previous_updates
			content_highlighted = self._previous_content_updates[self._select_x]
			slot14 = true

			self.set_latest_content(self._select_x, self, content_highlighted)
		end
	elseif 0 < diff_x then
		slot12 = self

		if self.next_page(slot11) then
		end
	else
		content_highlighted = self._previous_content_updates[self._select_x]
		slot14 = true

		self.set_latest_content(self._select_x, self, content_highlighted)
	end

	return 
end
function MenuNodeUpdatesGui:previous_page()
	if 1 < self._current_page then
		slot3 = self._node
		self._node.parameters(slot2).current_page = self._current_page - 1
		slot3 = self

		self.setup(self._current_page - 1)

		return true
	end

	return 
end
function MenuNodeUpdatesGui:next_page()
	local num_pages = self._num_pages

	if self._current_page < num_pages then
		slot4 = self._node
		self._node.parameters(slot3).current_page = self._current_page + 1
		slot4 = self

		self.setup(self._current_page + 1)

		return true
	end

	return 
end
function MenuNodeUpdatesGui:move_up()
	return 
end
function MenuNodeUpdatesGui:move_down()
	return 
end
function MenuNodeUpdatesGui:move_left()
	slot5 = 0

	self.move_highlight(slot2, self, -1)

	return true
end
function MenuNodeUpdatesGui:move_right()
	slot5 = 0

	self.move_highlight(slot2, self, 1)

	return true
end
function MenuNodeUpdatesGui:unretrieve_textures()
	if self._requested_textures then
		slot3 = self._requested_textures

		for i, data in pairs(slot2) do
			slot10 = data.texture_count

			managers.menu_component.unretrieve_texture(slot7, managers.menu_component, data.texture)
		end
	end

	if self._lastest_texture_request then
		slot5 = self._lastest_texture_request.texture_count

		managers.menu_component.unretrieve_texture(slot2, managers.menu_component, self._lastest_texture_request.texture)
	end

	self._requested_textures = nil
	self._lastest_texture_request = nil

	return 
end
function MenuNodeUpdatesGui:close()
	slot3 = self

	self.unretrieve_textures(slot2)

	slot3 = self

	MenuNodeUpdatesGui.super.close(slot2)

	return 
end
function MenuNodeUpdatesGui:_setup_panels(node)
	slot5 = node

	MenuNodeUpdatesGui.super._setup_panels(slot3, self)

	return 
end

return 
