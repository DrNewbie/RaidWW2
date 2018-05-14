-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not HUDObjectiveMain then
	slot2 = HUDObjectiveSub
	slot0 = class(slot1)
end

HUDObjectiveMain = slot0
HUDObjectiveMain.H = 48
HUDObjectiveMain.OBJECTIVE_TEXT_FONT = tweak_data.gui.fonts.din_compressed_outlined_22
HUDObjectiveMain.OBJECTIVE_TEXT_FONT_SIZE = tweak_data.gui.font_sizes.extra_small
HUDObjectiveMain.OBJECTIVE_TEXT_PADDING_RIGHT = 15
HUDObjectiveMain.AMOUNT_BACKGROUND_ICON = "objective_progress_bg"
HUDObjectiveMain.AMOUNT_FILL_ICON = "objective_progress_fill"
HUDObjectiveMain.AMOUNT_TEXT_FONT = tweak_data.gui.fonts.din_compressed_outlined_20
HUDObjectiveMain.AMOUNT_TEXT_FONT_SIZE = tweak_data.gui.font_sizes.size_20
HUDObjectiveMain.TIMER_BACKGROUND_ICON = "player_panel_ai_downed_and_objective_countdown_bg"
HUDObjectiveMain.TIMER_FILL_ICON = "teammate_circle_fill_small"
HUDObjectiveMain.TIMER_SECONDS_FONT = tweak_data.gui.fonts.din_compressed_outlined_24
HUDObjectiveMain.TIMER_SECONDS_FONT_SIZE = tweak_data.gui.font_sizes.size_24
function HUDObjectiveMain:init(objectives_panel, active_objective)
	HUDObjectiveMain.super.init(slot4, self, objectives_panel)

	slot8 = self._object
	slot6 = self._object.h(active_objective) / 2 - 4

	self._objective_text.set_center_y(slot4, self._objective_text)

	slot5 = self

	self._create_timer(slot4)

	slot5 = self

	self.hide_timer(slot4)

	slot5 = self

	self.set_hidden(slot4)

	return 
end
function HUDObjectiveMain:_create_panel(objectives_panel)
	local panel_params = {
		name = "main_objective",
		halign = "scale",
		valign = "top"
	}
	slot5 = objectives_panel
	panel_params.w = objectives_panel.w(slot4)
	panel_params.h = HUDObjectiveMain.H
	slot6 = panel_params
	self._object = objectives_panel.panel(slot4, objectives_panel)

	return 
end
function HUDObjectiveMain:_create_timer()
	local timer_panel_params = {
		name = "timer_panel",
		halign = "right",
		valign = "center"
	}
	slot4 = self._object
	timer_panel_params.w = self._object.h(slot3)
	slot4 = self._object
	timer_panel_params.h = self._object.h(slot3)
	slot5 = timer_panel_params
	self._timer_panel = self._object.panel(slot3, self._object)
	slot7 = self._object
	slot5 = self._object.w(slot6) + HUDObjectiveSub.OBJECTIVE_TEXT_PADDING_RIGHT

	self._timer_panel.set_x(slot3, self._timer_panel)

	local timer_background_params = {
		name = "timer_background",
		texture = tweak_data.gui.icons[HUDObjectiveMain.TIMER_BACKGROUND_ICON].texture,
		texture_rect = tweak_data.gui.icons[HUDObjectiveMain.TIMER_BACKGROUND_ICON].texture_rect
	}
	slot6 = timer_background_params
	local timer_background = self._timer_panel.bitmap(HUDObjectiveMain.TIMER_BACKGROUND_ICON, self._timer_panel)
	slot9 = self._timer_panel
	slot7 = self._timer_panel.w(slot8) / 2

	timer_background.set_center_x(self._timer_panel, timer_background)

	slot7 = self._timer_panel.h(slot8) / 2

	timer_background.set_center_y(self._timer_panel, timer_background)

	local timer_static_fill_params = {
		name = "timer_static_fill",
		alpha = 0,
		texture = tweak_data.gui.icons[HUDObjectiveMain.TIMER_FILL_ICON].texture,
		texture_rect = tweak_data.gui.icons[HUDObjectiveMain.TIMER_FILL_ICON].texture_rect
	}
	slot7 = timer_background
	timer_static_fill_params.layer = timer_background.layer(HUDObjectiveMain.TIMER_FILL_ICON) + 1
	slot8 = timer_static_fill_params
	self._timer_static_fill = self._timer_panel.bitmap(HUDObjectiveMain.TIMER_FILL_ICON, self._timer_panel)
	slot10 = self._timer_panel
	slot8 = self._timer_panel.w(self._timer_panel) / 2

	self._timer_static_fill.set_center_x(HUDObjectiveMain.TIMER_FILL_ICON, self._timer_static_fill)

	slot10 = self._timer_panel

	self._timer_static_fill.set_center_y(HUDObjectiveMain.TIMER_FILL_ICON, self._timer_static_fill)

	local timer_fill_params = {
		name = "timer_fill",
		visible = false,
		render_template = "VertexColorTexturedRadial",
		texture = tweak_data.gui.icons[HUDObjectiveMain.TIMER_FILL_ICON].texture
	}
	slot10 = HUDObjectiveMain.TIMER_FILL_ICON
	slot10 = HUDObjectiveMain.TIMER_FILL_ICON
	timer_fill_params.texture_rect = {
		tweak_data.gui.icon_w(self._timer_panel.h(self._timer_panel) / 2, tweak_data.gui),
		0,
		-tweak_data.gui.icon_w(self._timer_panel.h(self._timer_panel) / 2, tweak_data.gui),
		tweak_data.gui.icon_h(self._timer_panel.h(self._timer_panel) / 2, tweak_data.gui)
	}
	slot9 = HUDObjectiveMain.TIMER_FILL_ICON
	timer_fill_params.w = tweak_data.gui.icon_w(tweak_data.gui.icon_h, tweak_data.gui)
	slot9 = HUDObjectiveMain.TIMER_FILL_ICON
	timer_fill_params.h = tweak_data.gui.icon_h(tweak_data.gui.icon_h, tweak_data.gui)
	slot8 = self._timer_static_fill
	timer_fill_params.layer = self._timer_static_fill.layer(tweak_data.gui.icon_h) + 1
	slot9 = timer_fill_params
	self._timer_fill = self._timer_panel.bitmap(tweak_data.gui.icon_h, self._timer_panel)
	slot11 = self._timer_panel
	slot9 = self._timer_panel.w(HUDObjectiveMain.TIMER_FILL_ICON) / 2

	self._timer_fill.set_center_x(tweak_data.gui.icon_h, self._timer_fill)

	slot11 = self._timer_panel
	slot9 = self._timer_panel.h(HUDObjectiveMain.TIMER_FILL_ICON) / 2

	self._timer_fill.set_center_y(tweak_data.gui.icon_h, self._timer_fill)

	local timer_minutes_text_params = {
		vertical = "center",
		name = "minute_text",
		visible = false,
		align = "center",
		text = "00:00",
		halign = "center",
		valign = "center",
		font = HUDObjectiveMain.AMOUNT_TEXT_FONT,
		font_size = HUDObjectiveMain.AMOUNT_TEXT_FONT_SIZE
	}
	slot9 = self._timer_fill
	timer_minutes_text_params.layer = self._timer_fill.layer(self._timer_fill) + 1
	slot10 = timer_minutes_text_params
	self._timer_text_minutes = self._timer_panel.text(self._timer_fill, self._timer_panel)
	slot9 = self._timer_text_minutes
	local _, _, w, h = self._timer_text_minutes.text_rect(self._timer_fill)
	slot14 = w + 10

	self._timer_text_minutes.set_w(slot12, self._timer_text_minutes)

	slot14 = h

	self._timer_text_minutes.set_h(slot12, self._timer_text_minutes)

	slot16 = self._timer_panel
	slot14 = self._timer_panel.w(slot15) / 2 - 1

	self._timer_text_minutes.set_center_x(slot12, self._timer_text_minutes)

	slot16 = self._timer_panel
	slot14 = self._timer_panel.h(slot15) / 2 - 2

	self._timer_text_minutes.set_center_y(slot12, self._timer_text_minutes)

	local timer_seconds_text_params = {
		vertical = "center",
		name = "seconds_text",
		visible = false,
		align = "center",
		text = "00",
		halign = "center",
		valign = "center",
		font = HUDObjectiveMain.TIMER_SECONDS_FONT,
		font_size = HUDObjectiveMain.TIMER_SECONDS_FONT_SIZE
	}
	slot14 = self._timer_fill
	timer_seconds_text_params.layer = self._timer_fill.layer(self._timer_text_minutes) + 1
	slot15 = timer_seconds_text_params
	self._timer_text_seconds = self._timer_panel.text(self._timer_text_minutes, self._timer_panel)
	slot14 = self._timer_text_seconds
	local _, _, w, h = self._timer_text_seconds.text_rect(self._timer_text_minutes)
	slot19 = w + 10

	self._timer_text_seconds.set_w(slot17, self._timer_text_seconds)

	slot19 = h

	self._timer_text_seconds.set_h(slot17, self._timer_text_seconds)

	slot21 = self._timer_panel
	slot19 = self._timer_panel.w(slot20) / 2 - 1

	self._timer_text_seconds.set_center_x(slot17, self._timer_text_seconds)

	slot21 = self._timer_panel
	slot19 = self._timer_panel.h(slot20) / 2 - 3

	self._timer_text_seconds.set_center_y(slot17, self._timer_text_seconds)

	return 
end
function HUDObjectiveMain:_create_checkbox()
	return 
end
function HUDObjectiveMain:show_timer()
	slot3 = self._timer_panel
	slot6 = self._object

	self._timer_panel.set_right(slot2, self._object.w(slot5))

	slot7 = self._timer_panel
	slot4 = self._object.w(slot5) - self._timer_panel.w(self._object) - HUDObjectiveSub.OBJECTIVE_TEXT_PADDING_RIGHT

	self._objective_text.set_right(slot2, self._objective_text)

	return 
end
function HUDObjectiveMain:hide_timer()
	slot6 = self._object
	slot4 = self._object.w(slot5) + HUDObjectiveSub.OBJECTIVE_TEXT_PADDING_RIGHT

	self._timer_panel.set_x(slot2, self._timer_panel)

	if not self._amount_panel then
		slot3 = self._objective_text
		slot6 = self._object

		self._objective_text.set_right(slot2, self._object.w(slot5))
	else
		slot7 = self._timer_panel
		slot4 = self._object.w(slot5) - self._timer_panel.w(self._object) - HUDObjectiveSub.OBJECTIVE_TEXT_PADDING_RIGHT

		self._objective_text.set_right(slot2, self._objective_text)
	end

	return 
end
function HUDObjectiveMain:set_timer_value(current, total)
	local remaining = total - current
	slot9 = remaining % 60
	slot6 = string.format(remaining / 60, "%02d")
	local minutes_text = string.format(slot5, "%02d") .. ":" .. slot6
	slot8 = minutes_text

	self._timer_text_minutes.set_text(slot6, self._timer_text_minutes)

	slot8 = remaining % 60
	local seconds_text = string.format(slot6, "%02d")
	slot9 = seconds_text

	self._timer_text_seconds.set_text("%02d", self._timer_text_seconds)

	local timer_current = current
	local timer_total = total

	if 60 < timer_total then
		timer_current = current - total - 60
		timer_total = 60
	end

	slot11 = 1 - timer_current / timer_total

	self._timer_fill.set_position_z(slot9, self._timer_fill)

	if remaining < 61 and 60 < remaining then
		slot13 = 1
		local current_alpha = Easing.quartic_out(slot9, 61 - remaining, 0, 1)

		if current_alpha < 0.05 then
			current_alpha = 0
		end

		slot12 = current_alpha

		self._timer_static_fill.set_alpha(slot10, self._timer_static_fill)
	end

	if 60 < remaining then
		slot10 = self._timer_text_minutes
	elseif remaining < 60 then
		slot10 = self._timer_text_seconds

		if not self._timer_text_seconds.visible(slot9) then
			slot11 = true

			self._timer_text_seconds.set_visible(slot9, self._timer_text_seconds)

			slot11 = true

			self._timer_fill.set_visible(slot9, self._timer_fill)

			slot11 = false

			self._timer_text_minutes.set_visible(slot9, self._timer_text_minutes)

			slot11 = 0

			self._timer_static_fill.set_alpha(slot9, self._timer_static_fill)
		end
	end

	return 
end

return 
