if not MenuNodeStatsGui then
	slot2 = MenuNodeGui
	slot0 = class(slot1)
end

MenuNodeStatsGui = slot0
function MenuNodeStatsGui:init(node, layer, parameters)
	slot9 = parameters

	MenuNodeStatsGui.super.init(slot5, self, node, layer)

	self._stats_items = {}
	slot7 = node

	self._setup_stats(slot5, self)

	return 
end
function MenuNodeStatsGui:_setup_panels(node)
	slot5 = node

	MenuNodeStatsGui.super._setup_panels(slot3, self)

	slot4 = managers.viewport
	local safe_rect_pixels = managers.viewport.get_safe_rect_pixels(slot3)

	return 
end
function MenuNodeStatsGui:_setup_stats(node)
	slot5 = {
		type = "text",
		topic = managers.localization.text(slot7, managers.localization),
		data = managers.experience.total_cash_string(slot7)
	}
	slot9 = "menu_stats_money"
	slot8 = managers.experience

	self._add_stats(slot3, self)

	slot5 = {
		type = "progress",
		topic = managers.localization.text(slot7, managers.localization),
		data = managers.experience.current_level(slot7) / managers.experience.level_cap(managers.experience),
		text = "" .. slot7 .. "/" .. managers.experience.level_cap(slot10)
	}
	slot9 = "menu_stats_level_progress"
	slot9 = managers.experience
	slot9 = managers.experience
	slot7 = managers.experience.current_level(managers.experience)
	slot11 = managers.experience

	self._add_stats(slot3, self)

	slot5 = {
		type = "text",
		topic = managers.localization.text(slot7, managers.localization),
		data = managers.statistics.time_played(slot7) .. " " .. managers.localization.text("menu_stats_time_played", managers.localization)
	}
	slot8 = managers.statistics
	slot11 = "menu_stats_time"

	self._add_stats(slot3, self)

	slot5 = {
		type = "text",
		topic = managers.localization.text(" ", managers.localization),
		data = string.upper(managers.statistics.favourite_level("menu_stats_favourite_campaign"))
	}

	self._add_stats(slot3, self)

	slot5 = {
		type = "text",
		topic = managers.localization.text(" ", managers.localization),
		data = "" .. managers.statistics.total_completed_campaigns(managers.localization)
	}
	slot9 = "menu_stats_total_completed_campaigns"
	slot9 = managers.statistics

	self._add_stats(slot3, self)

	slot5 = {
		type = "text",
		topic = managers.localization.text(managers.statistics.total_completed_campaigns(managers.localization), managers.localization),
		data = "" .. managers.statistics.total_completed_objectives(managers.localization)
	}
	slot9 = "menu_stats_total_completed_objectives"
	slot9 = managers.statistics

	self._add_stats(slot3, self)

	slot5 = {
		type = "text",
		topic = managers.localization.text(managers.statistics.total_completed_objectives(managers.localization), managers.localization),
		data = "" .. string.upper(managers.statistics.favourite_weapon(managers.statistics))
	}
	slot9 = "menu_stats_favourite_weapon"
	slot11 = managers.statistics

	self._add_stats(slot3, self)

	slot5 = {
		type = "text",
		topic = managers.localization.text(string.upper(managers.statistics.favourite_weapon(managers.statistics)), managers.localization),
		data = "" .. managers.statistics.hit_accuracy(managers.localization) .. "%"
	}
	slot9 = "menu_stats_hit_accuracy"
	slot9 = managers.statistics

	self._add_stats(slot3, self)

	slot5 = {
		type = "text",
		topic = managers.localization.text(managers.statistics.hit_accuracy(managers.localization), managers.localization),
		data = "" .. managers.statistics.total_kills(managers.localization)
	}
	slot9 = "menu_stats_total_kills"
	slot9 = managers.statistics

	self._add_stats(slot3, self)

	slot5 = {
		type = "text",
		topic = managers.localization.text(managers.statistics.total_kills(managers.localization), managers.localization),
		data = "" .. managers.statistics.total_head_shots(managers.localization)
	}
	slot9 = "menu_stats_total_head_shots"
	slot9 = managers.statistics

	self._add_stats(slot3, self)

	slot5 = "WIN32"

	if SystemInfo.platform(slot3) == Idstring(SystemInfo) then
		local y = 30
		slot5 = self._stats_items

		for _, panel in ipairs(slot4) do
			slot10 = panel
			y = y + panel.h(slot9) + self.spacing
		end

		local safe_rect = managers.viewport.get_safe_rect_pixels(slot4)
		slot7 = {
			y = y
		}
		local panel = self._item_panel_parent.panel(managers.viewport, self._item_panel_parent)
		slot8 = {
			halign = "center",
			vertical = "center",
			align = "center",
			y = 0,
			font_size = tweak_data.menu.stats_font_size,
			x = safe_rect.x,
			w = safe_rect.width,
			font = self.font,
			color = self.row_item_color,
			layer = self.layers.items,
			text = managers.localization.text(slot10, managers.localization),
			render_template = Idstring(slot10)
		}
		slot12 = "menu_visit_more_stats"
		local text = panel.text(self._item_panel_parent, panel)
		slot8 = text
		local _, _, _, h = text.text_rect(panel)
		slot13 = h

		text.set_h("VertexColorTextured", text)

		slot13 = h

		panel.set_h("VertexColorTextured", panel)
	end

	return 
end
function MenuNodeStatsGui:_add_stats(params)
	local y = 0
	slot5 = self._stats_items

	for _, panel in ipairs(slot4) do
		slot10 = panel
		y = y + panel.h(slot9) + self.spacing
	end

	slot6 = {
		y = y
	}
	local panel = self._item_panel_parent.panel(slot4, self._item_panel_parent)
	slot7 = {
		halign = "right",
		vertical = "center",
		align = "right",
		y = 0,
		x = 0,
		font_size = tweak_data.menu.stats_font_size,
		w = self._left_align(slot9),
		font = self.font,
		color = self.row_item_color,
		layer = self.layers.items,
		text = params.topic,
		render_template = Idstring(slot9)
	}
	slot10 = self
	local topic = panel.text(self._item_panel_parent, panel)
	slot7 = topic
	local x, y, w, h = topic.text_rect(panel)
	slot12 = h

	topic.set_h("VertexColorTextured", topic)

	slot12 = h

	panel.set_h("VertexColorTextured", panel)

	if params.type == "text" then
		slot12 = {
			halign = "left",
			vertical = "center",
			align = "left",
			y = 0,
			font_size = tweak_data.menu.stats_font_size,
			x = self._right_align(slot14),
			h = h,
			font = self.font,
			color = self.color,
			layer = self.layers.items,
			text = params.data,
			render_template = Idstring(slot14)
		}
		slot15 = self
		slot15 = "VertexColorTextured"
		slot9 = panel.text(slot10, panel)
	end

	if params.type == "progress" then
		slot12 = {
			halign = "center",
			vertical = "center",
			h = 22,
			w = 256,
			align = "center",
			x = self._right_align(slot14),
			y = h / 2 - 11,
			color = Color.black.with_alpha(slot14, Color.black),
			layer = self.layers.items - 1
		}
		slot15 = self
		local bg = panel.rect(slot10, panel)
		slot13 = {
			vertical = "center",
			align = "center",
			halign = "center",
			orientation = "vertical",
			gradient_points = {
				0,
				Color(0.5, 1, 1, 0.6588235294117647),
				1,
				Color(0.5, 1, 0.6039215686274509, 0.4)
			},
			x = self._right_align(Color) + 2,
			y = bg.y(Color) + 2,
			w = (bg.w(Color) - 4) * params.data,
			h = bg.h(params.data) - 4,
			layer = self.layers.items
		}
		slot20 = 0
		slot20 = 0
		slot16 = self
		slot16 = bg
		slot16 = bg
		local bar = panel.gradient(panel, panel)
		slot13 = panel
		slot11 = panel.text
		slot14 = {
			y = 0,
			vertical = "center",
			align = "center",
			halign = "center",
			valign = "center",
			font_size = tweak_data.menu.stats_font_size,
			x = self._right_align(bg),
			h = h,
			w = bg.w(bg),
			font = self.font,
			color = self.color,
			layer = self.layers.items + 1
		}
		slot17 = self
		slot17 = bg

		if not params.text then
			slot18 = params.data * 100
			slot15 = "" .. math.floor(slot17) .. "%"
		end

		slot14.text = slot15
		slot17 = "VertexColorTextured"
		slot14.render_template = Idstring(slot16)
		slot11 = slot11(slot12, slot13)
	end

	slot12 = panel

	table.insert(slot10, self._stats_items)

	return 
end
function MenuNodeStatsGui:_create_menu_item(row_item)
	slot5 = row_item

	MenuNodeStatsGui.super._create_menu_item(slot3, self)

	return 
end
function MenuNodeStatsGui:_setup_item_panel_parent(safe_rect)
	slot5 = safe_rect

	MenuNodeStatsGui.super._setup_item_panel_parent(slot3, self)

	return 
end
function MenuNodeStatsGui:_setup_item_panel(safe_rect, res)
	slot7 = res

	MenuNodeStatsGui.super._setup_item_panel(slot4, self, safe_rect)

	return 
end
function MenuNodeStatsGui:resolution_changed()
	slot3 = self

	MenuNodeStatsGui.super.resolution_changed(slot2)

	return 
end

return 
