if not RaidGUIControlOperationProgress then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlOperationProgress = slot0
RaidGUIControlOperationProgress.HEADING_FONT = tweak_data.gui.fonts.din_compressed
RaidGUIControlOperationProgress.HEADING_FONT_SIZE = 22
RaidGUIControlOperationProgress.HEADING_COLOR = tweak_data.gui.colors.raid_light_red
RaidGUIControlOperationProgress.HEADING_PADDING_DOWN = 5
RaidGUIControlOperationProgress.PARAGRAPH_FONT = tweak_data.gui.fonts.lato
RaidGUIControlOperationProgress.PARAGRAPH_FONT_SIZE = 16
RaidGUIControlOperationProgress.PARAGRAPH_COLOR = tweak_data.gui.colors.raid_black
RaidGUIControlOperationProgress.PADDING_DOWN = 10
RaidGUIControlOperationProgress.SCROLL_ADVANCE = 20
function RaidGUIControlOperationProgress:init(parent, params)
	slot7 = params

	RaidGUIControlOperationProgress.super.init(slot4, self, parent)

	if not params then
		slot9 = self._name
		slot6 = "[RaidGUIControlOperationProgress:init] Parameters not specified for the peer details control " .. tostring(slot8)

		Application.error(slot4, Application)

		return 
	end

	self._pointer_type = "arrow"
	self._operation = params.operation
	slot5 = self

	self._create_panels(slot4)

	return 
end
function RaidGUIControlOperationProgress:_create_panels()
	local panel_params = clone(slot2)
	panel_params.name = panel_params.name .. "_panel"
	slot4 = self._panel
	panel_params.layer = self._panel.layer("_panel") + 1
	panel_params.x = self._params.x or 0
	panel_params.y = self._params.y or 0
	panel_params.w = self._params.w or RaidGUIControlOperationProgress.DEFAULT_W
	panel_params.h = self._params.h or RaidGUIControlOperationProgress.DEFAULT_H
	slot5 = panel_params
	self._object = self._panel.panel(self._params, self._panel)
	slot5 = panel_params
	self._inner_panel = self._object.panel(self._params, self._object)

	return 
end
function RaidGUIControlOperationProgress:_create_progress_report(current_operation_stage)
	slot4 = self._inner_panel

	self._inner_panel.clear(slot3)

	slot4 = self._inner_panel
	slot7 = self._object

	self._inner_panel.set_h(slot3, self._object.h(slot6))

	self._scrollable = false
	local y = 0
	self._progress_parts = {}
	local i = 1
	slot6 = self._event_index

	for _, event_id in pairs(self._object.h) do
		if current_operation_stage == i then
			local event = tweak_data.operations.missions[self._operation].events[event_id]
			slot16 = event.progress_text_id
			local current_part = self._create_part(slot11, self, i, y, event.progress_title_id)
			slot14 = current_part

			table.insert(self, self._progress_parts)

			slot13 = current_part
			y = y + current_part.h(self) + RaidGUIControlOperationProgress.PADDING_DOWN

			break
		end

		i = i + 1
	end

	slot7 = y - RaidGUIControlOperationProgress.PADDING_DOWN

	self._inner_panel.set_h(slot5, self._inner_panel)

	slot6 = self

	self._check_scrollability(slot5)

	return 
end
function RaidGUIControlOperationProgress:_create_part(i, y, header_id, paragraph_id)
	local panel_params = {
		x = 0
	}
	slot9 = i
	slot7 = tostring(slot8)
	panel_params.name = "part_" .. slot7
	panel_params.y = y
	slot8 = self._inner_panel
	panel_params.w = self._inner_panel.w(slot7)
	local part_panel = self._inner_panel.panel(slot7, self._inner_panel)
	local header_params = {
		name = "header",
		y = 0,
		x = 0,
		font = RaidGUIControlOperationProgress.HEADING_FONT,
		font_size = RaidGUIControlOperationProgress.HEADING_FONT_SIZE,
		color = RaidGUIControlOperationProgress.HEADING_COLOR
	}
	slot12 = true
	header_params.text = self.translate(panel_params, self, header_id)
	slot11 = header_params
	local part_header = part_panel.text(panel_params, part_panel)
	slot11 = part_header
	local _, _, w, h = part_header.text_rect(part_panel)
	slot16 = w

	part_header.set_w(slot14, part_header)

	slot16 = h

	part_header.set_h(slot14, part_header)

	slot16 = 16

	part_header.set_center_y(slot14, part_header)

	local paragraph_params = {
		name = "paragraph",
		wrap = true,
		y = 32,
		x = 0
	}
	slot16 = part_panel
	paragraph_params.w = part_panel.w(part_header)
	paragraph_params.font = RaidGUIControlOperationProgress.PARAGRAPH_FONT
	paragraph_params.font_size = RaidGUIControlOperationProgress.PARAGRAPH_FONT_SIZE
	paragraph_params.color = RaidGUIControlOperationProgress.PARAGRAPH_COLOR
	slot17 = paragraph_id
	paragraph_params.text = self.translate(part_header, self)
	slot17 = paragraph_params
	local part_paragraph = part_panel.text(part_header, part_panel)
	slot17 = part_paragraph
	local _, _, w, h = part_paragraph.text_rect(part_panel)
	slot22 = w

	part_paragraph.set_w(slot20, part_paragraph)

	slot22 = h

	part_paragraph.set_h(slot20, part_paragraph)

	slot25 = part_paragraph
	slot22 = part_paragraph.y(slot23) + part_paragraph.h(part_paragraph)

	part_panel.set_h(slot20, part_panel)

	return part_panel
end
function RaidGUIControlOperationProgress:set_operation(operation)
	self._operation = operation

	return 
end
function RaidGUIControlOperationProgress:set_number_drawn(number)
	slot5 = number

	self._create_progress_report(slot3, self)

	return 
end
function RaidGUIControlOperationProgress:set_event_index(event_index)
	self._event_index = event_index

	return 
end
function RaidGUIControlOperationProgress:_check_scrollability()
	slot4 = self._object

	if self._inner_panel.h(slot2) <= self._object.h(self._inner_panel) then
		return 
	end

	self._scrollable = true

	return 
end
function RaidGUIControlOperationProgress:on_mouse_scroll_up()
	if not self._scrollable then
		return false
	end

	slot6 = self._inner_panel
	slot4 = self._inner_panel.y(slot5) + RaidGUIControlOperationProgress.SCROLL_ADVANCE

	self._inner_panel.set_y(slot2, self._inner_panel)

	slot3 = self._inner_panel

	if 0 < self._inner_panel.y(slot2) then
		slot4 = 0

		self._inner_panel.set_y(slot2, self._inner_panel)
	end

	return true
end
function RaidGUIControlOperationProgress:on_mouse_scroll_down()
	if not self._scrollable then
		return false
	end

	slot6 = self._inner_panel
	slot4 = self._inner_panel.y(slot5) - RaidGUIControlOperationProgress.SCROLL_ADVANCE

	self._inner_panel.set_y(slot2, self._inner_panel)

	slot5 = self._inner_panel

	if self._inner_panel.y(slot2) < self._object.h(self._inner_panel) - self._inner_panel.h(self._object) then
		slot7 = self._inner_panel
		slot4 = self._object.h(slot5) - self._inner_panel.h(self._object)

		self._inner_panel.set_y(slot2, self._inner_panel)
	end

	return true
end
function RaidGUIControlOperationProgress:close()
	return 
end

return 
