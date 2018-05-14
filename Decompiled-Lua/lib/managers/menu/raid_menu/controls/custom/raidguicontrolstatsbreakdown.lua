if not RaidGUIControlStatsBreakdown then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlStatsBreakdown = slot0
RaidGUIControlStatsBreakdown.DEFAULT_W = 320
RaidGUIControlStatsBreakdown.DEFAULT_H = 250
RaidGUIControlStatsBreakdown.FONT = tweak_data.gui.fonts.din_compressed
RaidGUIControlStatsBreakdown.STATS_LABEL_X = 0
RaidGUIControlStatsBreakdown.STATS_LABEL_Y = 0
RaidGUIControlStatsBreakdown.STATS_LABEL_H = 64
RaidGUIControlStatsBreakdown.LABEL_FONT_SIZE = tweak_data.gui.font_sizes.large
RaidGUIControlStatsBreakdown.LABEL_COLOR = tweak_data.gui.colors.raid_white
RaidGUIControlStatsBreakdown.LABEL_PADDING_DOWN = 0
RaidGUIControlStatsBreakdown.TABLE_X = 0
RaidGUIControlStatsBreakdown.TABLE_FONT_SIZE = tweak_data.gui.font_sizes.small
RaidGUIControlStatsBreakdown.TABLE_COLOR = tweak_data.gui.colors.raid_grey
RaidGUIControlStatsBreakdown.TABLE_ROW_HEIGHT = 32
RaidGUIControlStatsBreakdown.TABLE_COLUMN_HEIGHT = 32
RaidGUIControlStatsBreakdown.TABLE_DESCRIPTION_W_PERCENT = 70
RaidGUIControlStatsBreakdown.TABLE_VALUE_W_PERCENT = 30
function RaidGUIControlStatsBreakdown:init(parent, params)
	slot7 = params

	RaidGUIControlStatsBreakdown.super.init(slot4, self, parent)

	if not params then
		slot6 = "[RaidGUIControlStatsBreakdown:init] Parameters not specified for the customization details"

		Application.error(slot4, Application)

		return 
	end

	self._pointer_type = "arrow"
	slot5 = self

	self.highlight_off(slot4)

	slot5 = self

	self._create_control_panel(slot4)

	slot5 = self

	self._create_stats_label(slot4)

	slot6 = params

	self._create_breakdown_table(slot4, self)

	if not params.h then
		slot5 = self

		self._fit_panel(slot4)
	end

	return 
end
function RaidGUIControlStatsBreakdown:close()
	return 
end
function RaidGUIControlStatsBreakdown:_create_control_panel()
	local control_params = clone(slot2)
	control_params.name = control_params.name .. "_customization_panel"
	slot4 = self._panel
	control_params.layer = self._panel.layer("_customization_panel") + 1
	control_params.w = self._params.w or RaidGUIControlStatsBreakdown.DEFAULT_W
	control_params.h = self._params.h or RaidGUIControlStatsBreakdown.DEFAULT_H
	slot5 = control_params
	self._control_panel = self._panel.panel(self._params, self._panel)
	self._object = self._control_panel

	return 
end
function RaidGUIControlStatsBreakdown:_create_stats_label()
	local stats_label_params = {
		name = "stats_label",
		vertical = "center",
		x = RaidGUIControlStatsBreakdown.STATS_LABEL_X,
		y = RaidGUIControlStatsBreakdown.STATS_LABEL_Y,
		w = RaidGUIControlStatsBreakdown.DEFAULT_W,
		h = RaidGUIControlStatsBreakdown.STATS_LABEL_H,
		font = RaidGUIControlStatsBreakdown.FONT,
		font_size = RaidGUIControlStatsBreakdown.LABEL_FONT_SIZE,
		color = RaidGUIControlStatsBreakdown.LABEL_COLOR
	}
	slot6 = true
	stats_label_params.text = self.translate(slot3, self, "stats_label")
	slot5 = stats_label_params
	self._stats_label = self._object.text(slot3, self._object)

	return 
end
function RaidGUIControlStatsBreakdown:_create_breakdown_table(params)
	local breakdown_table_params = {
		name = "breakdown_table",
		use_selector_mark = false,
		x = 0
	}
	slot6 = self._stats_label
	breakdown_table_params.y = self._stats_label.y(slot4) + self._stats_label.h(self._stats_label) + RaidGUIControlStatsBreakdown.LABEL_PADDING_DOWN
	breakdown_table_params.w = RaidGUIControlStatsBreakdown.DEFAULT_W
	slot8 = self._object
	slot8 = self._object
	breakdown_table_params.table_params = {
		row_params = {
			height = RaidGUIControlStatsBreakdown.TABLE_ROW_HEIGHT,
			font_size = RaidGUIControlStatsBreakdown.TABLE_FONT_SIZE
		},
		data_source_callback = params.data_source_callback,
		columns = {
			{
				vertical = "center",
				align = "left",
				w = (self._object.w(slot7) * RaidGUIControlStatsBreakdown.TABLE_DESCRIPTION_W_PERCENT) / 100,
				h = RaidGUIControlStatsBreakdown.TABLE_COLUMN_HEIGHT,
				cell_class = RaidGUIControlTableCell,
				color = RaidGUIControlStatsBreakdown.TABLE_COLOR
			},
			{
				vertical = "center",
				align = "right",
				w = (self._object.w(RaidGUIControlStatsBreakdown.TABLE_DESCRIPTION_W_PERCENT) * RaidGUIControlStatsBreakdown.TABLE_VALUE_W_PERCENT) / 100,
				h = RaidGUIControlStatsBreakdown.TABLE_COLUMN_HEIGHT,
				cell_class = RaidGUIControlTableCell,
				color = RaidGUIControlStatsBreakdown.TABLE_COLOR
			}
		}
	}
	slot6 = breakdown_table_params
	self._breakdown_table = self._control_panel.table(, self._control_panel)

	return 
end
function RaidGUIControlStatsBreakdown:_fit_panel()
	slot7 = self._breakdown_table
	slot4 = self._breakdown_table.y(slot5) + self._breakdown_table.h(self._breakdown_table)

	self._object.set_h(slot2, self._object)

	return 
end
function RaidGUIControlStatsBreakdown:hide()
	slot4 = 0

	self._stats_label.set_alpha(slot2, self._stats_label)

	slot4 = 0

	self._breakdown_table._table_panel.set_alpha(slot2, self._breakdown_table._table_panel)

	slot3 = self._breakdown_table
	local rows = self._breakdown_table.get_rows(slot2)

	for i = 1, #rows, 1 do
		slot8 = rows[i]
		local cells = rows[i].get_cells(slot7)

		for j = 1, #cells, 1 do
			slot14 = 0

			cells[j].set_alpha(slot12, cells[j])
		end
	end

	return 
end
function RaidGUIControlStatsBreakdown:fade_in()
	slot3 = self._stats_label
	slot8 = "_animate_table_fade_in"

	self._stats_label.animate(slot2, callback(slot5, self, self))

	return 
end
function RaidGUIControlStatsBreakdown:_animate_table_fade_in()
	local t = 0
	local label_duration = 0.4
	local table_duration = 0.2
	local table_stats_duration = 0.2
	local initial_offset = 15
	local label_y = self._stats_label.y(slot7)
	slot10 = label_y + initial_offset

	self._stats_label.set_y(self._stats_label, self._stats_label)

	while t < label_duration do
		local dt = coroutine.yield()
		t = t + dt
		slot13 = label_duration
		local current_offset = Easing.quintic_out(slot9, t, initial_offset, -initial_offset)
		slot12 = label_y + current_offset

		self._stats_label.set_y(t, self._stats_label)

		slot14 = label_duration
		local current_alpha = Easing.quintic_out(t, t, 0, 1)
		slot13 = current_alpha

		self._stats_label.set_alpha(t, self._stats_label)
	end

	slot10 = label_y

	self._stats_label.set_y(slot8, self._stats_label)

	slot10 = 1

	self._stats_label.set_alpha(slot8, self._stats_label)

	t = 0

	while t < table_duration do
		local dt = coroutine.yield()
		t = t + dt
		slot13 = table_duration
		local current_alpha = Easing.quintic_out(slot9, t, 0, 1)
		slot12 = current_alpha

		self._breakdown_table._table_panel.set_alpha(t, self._breakdown_table._table_panel)
	end

	slot10 = 1

	self._breakdown_table._table_panel.set_alpha(slot8, self._breakdown_table._table_panel)

	t = 0
	slot9 = self._breakdown_table
	local rows = self._breakdown_table.get_rows(slot8)

	for i = 1, #rows, 1 do
		slot19 = "_animate_table_row_fade_in"
		slot17 = (i - 1) * 0.1

		self._stats_label.animate(slot13, self._stats_label, callback(slot16, self, self), rows[i])
	end

	slot10 = #rows * 0.1 + 0.1

	wait(slot9)

	return 
end
function RaidGUIControlStatsBreakdown:_animate_table_row_fade_in(label, row, delay)
	local t = 0
	local duration = 0.2
	slot8 = row
	local cells = row.get_cells(slot7)

	if delay then
		slot9 = delay

		wait(slot8)
	end

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot13 = duration
		local current_alpha = Easing.quintic_out(slot9, t, 0, 1)

		for i = 1, #cells, 1 do
			slot16 = current_alpha

			cells[i].set_alpha(slot14, cells[i])
		end
	end

	return 
end

return 
