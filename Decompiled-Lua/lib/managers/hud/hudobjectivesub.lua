if not HUDObjectiveSub then
	slot2 = HUDObjectiveBase
	slot0 = class(slot1)
end

HUDObjectiveSub = slot0
HUDObjectiveSub.H = 48
HUDObjectiveSub.PERCENTAGE_AMOUNT_THRESHOLD = 50
HUDObjectiveSub.OBJECTIVE_TEXT_FONT = tweak_data.gui.fonts.din_compressed_outlined_22
HUDObjectiveSub.OBJECTIVE_TEXT_FONT_SIZE = tweak_data.gui.font_sizes.extra_small
HUDObjectiveSub.OBJECTIVE_TEXT_PADDING_RIGHT = 15
HUDObjectiveSub.AMOUNT_BACKGROUND_ICON = "objective_progress_bg"
HUDObjectiveSub.AMOUNT_FILL_ICON = "objective_progress_fill"
HUDObjectiveSub.AMOUNT_TEXT_FONT = tweak_data.gui.fonts.din_compressed_outlined_20
HUDObjectiveSub.AMOUNT_TEXT_FONT_SIZE = tweak_data.gui.font_sizes.size_20
HUDObjectiveSub.CHECKBOX_UNCHECKED_ICON = "objective_unchecked"
HUDObjectiveSub.CHECKBOX_CHECKED_ICON = "objective_checked"
function HUDObjectiveSub:init(objectives_panel, active_objective)
	self._objective = active_objective
	self._id = active_objective.id
	slot6 = objectives_panel

	self._create_panel(slot4, self)

	slot5 = self

	self._create_objective_text(slot4)

	slot5 = self

	self._create_checkbox(slot4)

	if active_objective.amount then
		slot5 = self

		self._create_amount(slot4)

		slot6 = active_objective.amount

		self.set_total_amount(slot4, self)

		slot6 = active_objective.current_amount

		self.set_current_amount(slot4, self)

		if self._checkbox_panel then
			slot6 = false

			self._checkbox_panel.set_visible(slot4, self._checkbox_panel)
		end
	end

	slot5 = self

	self.set_hidden(slot4)

	return 
end
function HUDObjectiveSub:_create_panel(objectives_panel)
	local panel_params = {
		name = "sub_objective",
		halign = "scale",
		valign = "top"
	}
	slot5 = objectives_panel
	panel_params.w = objectives_panel.w(slot4)
	panel_params.h = HUDObjectiveSub.H
	slot6 = panel_params
	self._object = objectives_panel.panel(slot4, objectives_panel)

	return 
end
function HUDObjectiveSub:_create_objective_text()
	local objective_text_params = {
		name = "objective_text",
		vertical = "center",
		halign = "right",
		align = "right",
		y = 0,
		x = 0,
		valign = "center",
		font = HUDObjectiveSub.OBJECTIVE_TEXT_FONT,
		font_size = HUDObjectiveSub.OBJECTIVE_TEXT_FONT_SIZE
	}
	slot4 = self._objective.text
	objective_text_params.text = utf8.to_upper(slot3)
	slot5 = objective_text_params
	self._objective_text = self._object.text(slot3, self._object)
	slot7 = self._object
	slot5 = self._object.h(slot6) / 2 - 1

	self._objective_text.set_center_y(slot3, self._objective_text)

	return 
end
function HUDObjectiveSub:_create_amount()
	local amount_panel_params = {
		name = "amount_panel",
		halign = "right",
		valign = "center"
	}
	slot4 = self._object
	amount_panel_params.w = self._object.h(slot3)
	slot4 = self._object
	amount_panel_params.h = self._object.h(slot3)
	slot5 = amount_panel_params
	self._amount_panel = self._object.panel(slot3, self._object)
	slot4 = self._amount_panel
	slot7 = self._object

	self._amount_panel.set_right(slot3, self._object.w(slot6))

	slot7 = self._object
	slot5 = self._object.h(slot6) / 2

	self._amount_panel.set_center_y(slot3, self._amount_panel)

	local amount_progress_background_params = {
		name = "amount_progress_background",
		texture = tweak_data.gui.icons[HUDObjectiveSub.AMOUNT_BACKGROUND_ICON].texture,
		texture_rect = tweak_data.gui.icons[HUDObjectiveSub.AMOUNT_BACKGROUND_ICON].texture_rect
	}
	slot6 = amount_progress_background_params
	local amount_progress_background = self._amount_panel.bitmap(HUDObjectiveSub.AMOUNT_BACKGROUND_ICON, self._amount_panel)
	slot9 = self._amount_panel
	slot7 = self._amount_panel.w(slot8) / 2

	amount_progress_background.set_center_x(self._amount_panel, amount_progress_background)

	slot9 = self._amount_panel

	amount_progress_background.set_center_y(self._amount_panel, amount_progress_background)

	local amount_progress_fill_params = {
		name = "amount_progress_fill",
		render_template = "VertexColorTexturedRadial",
		texture = tweak_data.gui.icons[HUDObjectiveSub.AMOUNT_FILL_ICON].texture
	}
	slot9 = HUDObjectiveSub.AMOUNT_FILL_ICON
	slot9 = HUDObjectiveSub.AMOUNT_FILL_ICON
	amount_progress_fill_params.texture_rect = {
		tweak_data.gui.icon_w(self._amount_panel.h(slot8) / 2, tweak_data.gui),
		0,
		-tweak_data.gui.icon_w(self._amount_panel.h(slot8) / 2, tweak_data.gui),
		tweak_data.gui.icon_h(self._amount_panel.h(slot8) / 2, tweak_data.gui)
	}
	slot8 = HUDObjectiveSub.AMOUNT_FILL_ICON
	amount_progress_fill_params.w = tweak_data.gui.icon_w(tweak_data.gui.icon_h, tweak_data.gui)
	slot8 = HUDObjectiveSub.AMOUNT_FILL_ICON
	amount_progress_fill_params.h = tweak_data.gui.icon_h(tweak_data.gui.icon_h, tweak_data.gui)
	slot7 = amount_progress_background
	amount_progress_fill_params.layer = amount_progress_background.layer(tweak_data.gui.icon_h) + 1
	slot8 = amount_progress_fill_params
	self._amount_progress_fill = self._amount_panel.bitmap(tweak_data.gui.icon_h, self._amount_panel)
	slot10 = self._amount_panel
	slot8 = self._amount_panel.w(HUDObjectiveSub.AMOUNT_FILL_ICON) / 2

	self._amount_progress_fill.set_center_x(tweak_data.gui.icon_h, self._amount_progress_fill)

	slot10 = self._amount_panel
	slot8 = self._amount_panel.h(HUDObjectiveSub.AMOUNT_FILL_ICON) / 2

	self._amount_progress_fill.set_center_y(tweak_data.gui.icon_h, self._amount_progress_fill)

	local current_amount_text_params = {
		text = "00",
		vertical = "center",
		name = "current_amount_text",
		align = "center",
		font = HUDObjectiveSub.AMOUNT_TEXT_FONT,
		font_size = HUDObjectiveSub.AMOUNT_TEXT_FONT_SIZE
	}
	slot9 = current_amount_text_params
	self._current_amount_text = self._amount_panel.text(self._amount_progress_fill, self._amount_panel)
	slot8 = self._current_amount_text
	local _, _, w, h = self._current_amount_text.text_rect(self._amount_progress_fill)
	slot13 = w

	self._current_amount_text.set_w(slot11, self._current_amount_text)

	slot13 = h

	self._current_amount_text.set_h(slot11, self._current_amount_text)

	slot13 = 5

	self._current_amount_text.set_x(slot11, self._current_amount_text)

	slot15 = self._amount_panel
	slot13 = self._amount_panel.h(slot14) / 2

	self._current_amount_text.set_center_y(slot11, self._current_amount_text)

	local slash_params = {
		text = "/",
		vertical = "center",
		name = "slash",
		align = "center",
		font = HUDObjectiveSub.AMOUNT_TEXT_FONT,
		font_size = HUDObjectiveSub.AMOUNT_TEXT_FONT_SIZE
	}
	slot14 = slash_params
	local slash = self._amount_panel.text(self._current_amount_text, self._amount_panel)
	slot14 = slash
	local _, _, w, h = slash.text_rect(self._amount_panel)
	slot19 = 2 * w

	slash.set_w(slot17, slash)

	slot19 = h

	slash.set_h(slot17, slash)

	slot21 = self._amount_panel
	slot19 = self._amount_panel.w(slot20) / 2

	slash.set_center_x(slot17, slash)

	slot21 = self._amount_panel
	slot19 = self._amount_panel.h(slot20) / 2

	slash.set_center_y(slot17, slash)

	local total_amount_text_params = {
		text = "00",
		vertical = "center",
		name = "total_amount_text",
		align = "center",
		font = HUDObjectiveSub.AMOUNT_TEXT_FONT,
		font_size = HUDObjectiveSub.AMOUNT_TEXT_FONT_SIZE
	}
	slot20 = total_amount_text_params
	self._total_amount_text = self._amount_panel.text(slash, self._amount_panel)
	slot19 = self._total_amount_text
	local _, _, w, h = self._total_amount_text.text_rect(slash)
	slot24 = w

	self._total_amount_text.set_w(slot22, self._total_amount_text)

	slot24 = h

	self._total_amount_text.set_h(slot22, self._total_amount_text)

	slot26 = self._amount_panel
	slot24 = self._amount_panel.w(slot25) - 7

	self._total_amount_text.set_right(slot22, self._total_amount_text)

	slot26 = self._amount_panel
	slot24 = self._amount_panel.h(slot25) / 2

	self._total_amount_text.set_center_y(slot22, self._total_amount_text)

	local percentage_amount_text_params = {
		text = "00%",
		align = "center",
		vertical = "center",
		name = "percentage_amount_text"
	}
	slot24 = self._amount_panel
	percentage_amount_text_params.w = self._amount_panel.w(self._total_amount_text)
	slot24 = self._amount_panel
	percentage_amount_text_params.h = self._amount_panel.h(self._total_amount_text)
	percentage_amount_text_params.font = HUDObjectiveSub.AMOUNT_TEXT_FONT
	percentage_amount_text_params.font_size = HUDObjectiveSub.AMOUNT_TEXT_FONT_SIZE
	slot25 = percentage_amount_text_params
	self._percentage_amount_text = self._amount_panel.text(self._total_amount_text, self._amount_panel)

	return 
end
function HUDObjectiveSub:_create_checkbox()
	local checkbox_panel_params = {
		name = "checkbox_panel",
		halign = "right",
		valign = "center"
	}
	slot4 = self._object
	checkbox_panel_params.w = self._object.h(slot3)
	slot4 = self._object
	checkbox_panel_params.h = self._object.h(slot3)
	slot5 = checkbox_panel_params
	self._checkbox_panel = self._object.panel(slot3, self._object)
	slot4 = self._checkbox_panel
	slot7 = self._object

	self._checkbox_panel.set_right(slot3, self._object.w(slot6))

	slot7 = self._object
	slot5 = self._object.h(slot6) / 2

	self._checkbox_panel.set_center_y(slot3, self._checkbox_panel)

	local checkbox_unchecked_params = {
		name = "checkbox_unchecked",
		texture = tweak_data.gui.icons[HUDObjectiveSub.CHECKBOX_UNCHECKED_ICON].texture,
		texture_rect = tweak_data.gui.icons[HUDObjectiveSub.CHECKBOX_UNCHECKED_ICON].texture_rect
	}
	slot6 = checkbox_unchecked_params
	local checkbox_unchecked = self._checkbox_panel.bitmap(HUDObjectiveSub.CHECKBOX_UNCHECKED_ICON, self._checkbox_panel)
	slot9 = self._checkbox_panel
	slot7 = self._checkbox_panel.w(slot8) / 2

	checkbox_unchecked.set_center_x(self._checkbox_panel, checkbox_unchecked)

	slot9 = self._checkbox_panel
	slot7 = self._checkbox_panel.h(slot8) / 2

	checkbox_unchecked.set_center_y(self._checkbox_panel, checkbox_unchecked)

	local checkbox_checked_params = {
		name = "checkbox_checked",
		visible = false,
		texture = tweak_data.gui.icons[HUDObjectiveSub.CHECKBOX_CHECKED_ICON].texture,
		texture_rect = tweak_data.gui.icons[HUDObjectiveSub.CHECKBOX_CHECKED_ICON].texture_rect
	}
	slot8 = checkbox_checked_params
	local checkbox_checked = self._checkbox_panel.bitmap(HUDObjectiveSub.CHECKBOX_CHECKED_ICON, self._checkbox_panel)
	slot11 = self._checkbox_panel
	slot9 = self._checkbox_panel.w(slot10) / 2

	checkbox_checked.set_center_x(self._checkbox_panel, checkbox_checked)

	slot11 = self._checkbox_panel
	slot9 = self._checkbox_panel.h(slot10) / 2

	checkbox_checked.set_center_y(self._checkbox_panel, checkbox_checked)

	slot12 = self._checkbox_panel
	slot9 = self._object.w(slot10) - self._checkbox_panel.w(self._object) - HUDObjectiveSub.OBJECTIVE_TEXT_PADDING_RIGHT

	self._objective_text.set_right(self._checkbox_panel, self._objective_text)

	return 
end
function HUDObjectiveSub:set_current_amount(current_amount)
	self._current_amount = current_amount
	slot4 = current_amount
	local amount_string = tostring(slot3)

	if 10 <= self._total_amount then
		slot6 = current_amount
		amount_string = string.format(slot4, "%02d")
	elseif self._total_amount == 0 then
		slot6 = "[HUDObjectiveSub:set_current_amount] Divison by zero! self._total_amount=0"

		Application.error(slot4, Application)

		return 
	end

	local amount_percentage = self._current_amount / self._total_amount * 100
	slot6 = self._percentage_amount_text
	slot10 = amount_percentage

	self._percentage_amount_text.set_text(slot5, string.format(slot8, "%.0f%%"))

	slot7 = amount_string

	self._current_amount_text.set_text(slot5, self._current_amount_text)

	slot7 = self._current_amount / self._total_amount

	self._amount_progress_fill.set_position_z(slot5, self._amount_progress_fill)

	return 
end
function HUDObjectiveSub:set_total_amount(total_amount)
	self._total_amount = total_amount

	if HUDObjectiveSub.PERCENTAGE_AMOUNT_THRESHOLD <= self._total_amount then
		slot5 = false

		self._current_amount_text.set_visible(slot3, self._current_amount_text)

		slot5 = "slash"
		slot5 = false

		self._amount_panel.child(slot3, self._amount_panel).set_visible(slot3, self._amount_panel.child(slot3, self._amount_panel))

		slot5 = false

		self._total_amount_text.set_visible(slot3, self._total_amount_text)

		slot5 = true

		self._percentage_amount_text.set_visible(slot3, self._percentage_amount_text)
	else
		slot5 = true

		self._current_amount_text.set_visible(slot3, self._current_amount_text)

		slot5 = "slash"
		slot5 = true

		self._amount_panel.child(slot3, self._amount_panel).set_visible(slot3, self._amount_panel.child(slot3, self._amount_panel))

		slot5 = true

		self._total_amount_text.set_visible(slot3, self._total_amount_text)

		slot5 = false

		self._percentage_amount_text.set_visible(slot3, self._percentage_amount_text)
	end

	slot4 = self._total_amount_text
	slot7 = total_amount

	self._total_amount_text.set_text(slot3, tostring(slot6))

	slot5 = self._current_amount or 0

	self.set_current_amount(slot3, self)

	return 
end
function HUDObjectiveSub:set_objective_text(text)
	slot4 = self._objective_text
	slot7 = text

	self._objective_text.set_text(slot3, utf8.to_upper(slot6))

	return 
end
function HUDObjectiveSub:complete()
	slot7 = self._checkbox_panel
	slot4 = self._object.w(slot5) - self._checkbox_panel.w(self._object) - HUDObjectiveSub.OBJECTIVE_TEXT_PADDING_RIGHT

	self._objective_text.set_right(slot2, self._objective_text)

	slot4 = "checkbox_unchecked"
	slot4 = false

	self._checkbox_panel.child(slot2, self._checkbox_panel).set_visible(slot2, self._checkbox_panel.child(slot2, self._checkbox_panel))

	slot4 = "checkbox_checked"
	slot4 = true

	self._checkbox_panel.child(slot2, self._checkbox_panel).set_visible(slot2, self._checkbox_panel.child(slot2, self._checkbox_panel))

	slot4 = true

	self._checkbox_panel.set_visible(slot2, self._checkbox_panel)

	if self._amount_panel then
		slot4 = false

		self._amount_panel.set_visible(slot2, self._amount_panel)
	end

	return 
end

return 
