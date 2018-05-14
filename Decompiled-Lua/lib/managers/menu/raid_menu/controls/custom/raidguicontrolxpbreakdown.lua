if not RaidGUIControlXPBreakdown then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlXPBreakdown = slot0
RaidGUIControlXPBreakdown.DEFAULT_W = 320
RaidGUIControlXPBreakdown.DEFAULT_H = 448
RaidGUIControlXPBreakdown.FONT = tweak_data.gui.fonts.din_compressed
RaidGUIControlXPBreakdown.EXPERIENCE_LABEL_X = 0
RaidGUIControlXPBreakdown.EXPERIENCE_LABEL_Y = 0
RaidGUIControlXPBreakdown.EXPERIENCE_LABEL_H = 64
RaidGUIControlXPBreakdown.LABEL_FONT_SIZE = tweak_data.gui.font_sizes.large
RaidGUIControlXPBreakdown.LABEL_COLOR = tweak_data.gui.colors.raid_white
RaidGUIControlXPBreakdown.LABEL_PADDING_DOWN = 0
RaidGUIControlXPBreakdown.TABLE_X = 0
RaidGUIControlXPBreakdown.TABLE_FONT_SIZE = tweak_data.gui.font_sizes.small
RaidGUIControlXPBreakdown.TABLE_COLOR = tweak_data.gui.colors.raid_grey
RaidGUIControlXPBreakdown.TABLE_ROW_HEIGHT = 32
RaidGUIControlXPBreakdown.TABLE_COLUMN_HEIGHT = 32
RaidGUIControlXPBreakdown.TABLE_DESCRIPTION_W_PERCENT = 80
RaidGUIControlXPBreakdown.TABLE_VALUE_W_PERCENT = 20
function RaidGUIControlXPBreakdown:init(parent, params)
	slot7 = params

	RaidGUIControlXPBreakdown.super.init(slot4, self, parent)

	if not params then
		slot6 = "[RaidGUIControlXPBreakdown:init] Parameters not specified for the customization details"

		Application.error(slot4, Application)

		return 
	end

	self._pointer_type = "arrow"
	slot5 = self

	self._create_control_panel(slot4)

	slot5 = self

	self._create_experience_label(slot4)

	slot6 = params

	self._create_breakdown_table(slot4, self)

	slot5 = self

	self._create_total(slot4)

	if not self._params.h then
		slot5 = self

		self._fit_panel(slot4)
	end

	return 
end
function RaidGUIControlXPBreakdown:close()
	return 
end
function RaidGUIControlXPBreakdown:_create_control_panel()
	local control_params = clone(slot2)
	control_params.name = control_params.name .. "_customization_panel"
	slot4 = self._panel
	control_params.layer = self._panel.layer("_customization_panel") + 1
	control_params.w = self._params.w or RaidGUIControlXPBreakdown.DEFAULT_W
	control_params.h = self._params.h or RaidGUIControlXPBreakdown.DEFAULT_H
	slot5 = control_params
	self._control_panel = self._panel.panel(self._params, self._panel)
	self._object = self._control_panel

	return 
end
function RaidGUIControlXPBreakdown:_create_experience_label()
	local experience_label_params = {
		name = "experience_label",
		vertical = "center",
		x = RaidGUIControlStatsBreakdown.EXPERIENCE_LABEL_X,
		y = RaidGUIControlStatsBreakdown.EXPERIENCE_LABEL_Y,
		w = RaidGUIControlStatsBreakdown.DEFAULT_W,
		h = RaidGUIControlXPBreakdown.EXPERIENCE_LABEL_H,
		font = RaidGUIControlStatsBreakdown.FONT,
		font_size = RaidGUIControlStatsBreakdown.LABEL_FONT_SIZE,
		color = RaidGUIControlStatsBreakdown.LABEL_COLOR
	}
	slot6 = true
	experience_label_params.text = self.translate(slot3, self, "xp_label")
	slot5 = experience_label_params
	self._experience_label = self._object.text(slot3, self._object)

	return 
end
function RaidGUIControlXPBreakdown:_create_breakdown_table(params)
	local breakdown_table_params = {
		name = "breakdown_table",
		x = 0
	}
	slot6 = self._experience_label
	breakdown_table_params.y = self._experience_label.y(slot4) + self._experience_label.h(self._experience_label) + RaidGUIControlXPBreakdown.LABEL_PADDING_DOWN
	breakdown_table_params.w = RaidGUIControlXPBreakdown.DEFAULT_W
	slot8 = self._object
	slot8 = self._object
	breakdown_table_params.table_params = {
		row_params = {
			height = RaidGUIControlXPBreakdown.TABLE_ROW_HEIGHT,
			font_size = RaidGUIControlXPBreakdown.TABLE_FONT_SIZE
		},
		data_source_callback = params.data_source_callback,
		columns = {
			{
				vertical = "center",
				align = "left",
				w = (self._object.w(slot7) * RaidGUIControlXPBreakdown.TABLE_DESCRIPTION_W_PERCENT) / 100,
				h = RaidGUIControlXPBreakdown.TABLE_COLUMN_HEIGHT,
				cell_class = RaidGUIControlXPCell,
				color = RaidGUIControlXPBreakdown.TABLE_COLOR
			},
			{
				vertical = "center",
				align = "right",
				w = (self._object.w(RaidGUIControlXPBreakdown.TABLE_DESCRIPTION_W_PERCENT) * RaidGUIControlXPBreakdown.TABLE_VALUE_W_PERCENT) / 100,
				h = RaidGUIControlXPBreakdown.TABLE_COLUMN_HEIGHT,
				cell_class = RaidGUIControlXPCell,
				color = RaidGUIControlXPBreakdown.TABLE_COLOR
			}
		}
	}
	slot6 = breakdown_table_params
	self._breakdown_table = self._control_panel.table(, self._control_panel)

	return 
end
function RaidGUIControlXPBreakdown:_create_total()
	return 
end
function RaidGUIControlXPBreakdown:_fit_panel()
	slot7 = self._breakdown_table
	slot4 = self._breakdown_table.y(slot5) + self._breakdown_table.h(self._breakdown_table)

	self._object.set_h(slot2, self._object)

	return 
end
function RaidGUIControlXPBreakdown:fade_in_total(duration)
	return 
end
function RaidGUIControlXPBreakdown:animate_fade_in_total(label, duration)
	local t = 0
	local anim_duration = duration or 0.15

	while t < anim_duration do
		local dt = coroutine.yield()
		t = t + dt
		slot11 = anim_duration
		local current_alpha = Easing.quartic_out(slot7, t, 0, 1)
		slot10 = current_alpha

		label.set_alpha(t, label)
	end

	slot8 = 1

	label.set_alpha(slot6, label)

	return 
end
function RaidGUIControlXPBreakdown:set_total(total, animate)
	return 
end
function RaidGUIControlXPBreakdown:hide()
	slot4 = 0

	self._breakdown_table._table_panel.set_alpha(slot2, self._breakdown_table._table_panel)

	slot4 = 0

	self._experience_label.set_alpha(slot2, self._experience_label)

	return 
end
function RaidGUIControlXPBreakdown:fade_in()
	slot3 = self._experience_label
	slot8 = "_animate_table_fade_in"

	self._experience_label.animate(slot2, callback(slot5, self, self))

	return 
end
function RaidGUIControlXPBreakdown:_animate_table_fade_in()
	local t = 0
	local label_duration = 0.4
	local table_duration = 0.2
	local initial_offset = 15
	local label_y = self._experience_label.y(slot6)
	slot9 = label_y + initial_offset

	self._experience_label.set_y(self._experience_label, self._experience_label)

	while t < label_duration do
		local dt = coroutine.yield()
		t = t + dt
		slot12 = label_duration
		local current_offset = Easing.quintic_out(slot8, t, initial_offset, -initial_offset)
		slot11 = label_y + current_offset

		self._experience_label.set_y(t, self._experience_label)

		slot13 = label_duration
		local current_alpha = Easing.quintic_out(t, t, 0, 1)
		slot12 = current_alpha

		self._experience_label.set_alpha(t, self._experience_label)
	end

	slot9 = label_y

	self._experience_label.set_y(slot7, self._experience_label)

	slot9 = 1

	self._experience_label.set_alpha(slot7, self._experience_label)

	t = 0

	while t < table_duration do
		local dt = coroutine.yield()
		t = t + dt
		slot12 = table_duration
		local current_alpha = Easing.quintic_out(slot8, t, 0, 1)
		slot11 = current_alpha

		self._breakdown_table._table_panel.set_alpha(t, self._breakdown_table._table_panel)
	end

	slot9 = 1

	self._breakdown_table._table_panel.set_alpha(slot7, self._breakdown_table._table_panel)

	return 
end
function RaidGUIControlXPBreakdown:set_debug(value)
	slot5 = value

	self._control_border.set_debug(slot3, self._control_border)

	return 
end

return 
