if not RaidGUIControlLabelNamedValueWithDelta then
	slot2 = RaidGUIControlLabelNamedValue
	slot0 = class(slot1)
end

RaidGUIControlLabelNamedValueWithDelta = slot0
function RaidGUIControlLabelNamedValueWithDelta:init(parent, params)
	slot7 = params

	RaidGUIControlLabelNamedValueWithDelta.super.init(slot4, self, parent)

	params.align = params.value_align or "center"
	local label_value_with_delta_params = clone(slot4)
	label_value_with_delta_params.font = tweak_data.gui.fonts.din_compressed
	label_value_with_delta_params.font_size = params.value_delta_font_size or tweak_data.gui.font_sizes.subtitle
	label_value_with_delta_params.h = label_value_with_delta_params.font_size
	label_value_with_delta_params.text = label_value_with_delta_params.value or label_value_with_delta_params.text
	label_value_with_delta_params.x = 0
	label_value_with_delta_params.y = 0
	label_value_with_delta_params.w = nil
	label_value_with_delta_params.text = params.delta_text or ""
	label_value_with_delta_params.color = params.value_delta_color or tweak_data.gui.colors.progress_green
	slot7 = label_value_with_delta_params
	self._label_value_with_delta = self._object.label(params, self._object)

	return 
end
function RaidGUIControlLabelNamedValueWithDelta:set_value_delta(number)
	local full_value = ""

	if not number or number == 0 then
		slot5 = self._label_value_with_delta

		self._label_value_with_delta.hide(slot4)

		full_value = ""
	elseif number < 0 then
		self._label_value_with_delta.show(slot4)

		slot6 = number
		full_value = "-" .. math.abs(self._label_value_with_delta)
	elseif 0 < number then
		slot5 = self._label_value_with_delta

		self._label_value_with_delta.show(slot4)

		full_value = "+" .. number
	end

	slot6 = full_value

	self._label_value_with_delta.set_text(slot4, self._label_value_with_delta)

	slot5 = self._label_value_with_delta
	local _, _, w, _ = self._label_value_with_delta.text_rect(slot4)
	slot10 = w

	self._label_value_with_delta.set_w(slot8, self._label_value_with_delta)

	slot9 = self._label_value_with_delta
	slot12 = self._label_value

	self._label_value_with_delta.set_x(slot8, self._label_value.right(slot11))

	return 
end
function RaidGUIControlLabelNamedValueWithDelta:value_delta()
	slot3 = self._label_value_with_delta

	return self._label_value_with_delta.text(slot2)
end
function RaidGUIControlLabelNamedValueWithDelta:set_label_color(color)
	slot5 = color

	RaidGUIControlLabelNamedValueWithDelta.super.set_label_color(slot3, self)

	slot5 = color

	self._label_value_with_delta.set_color(slot3, self._label_value_with_delta)

	return 
end
function RaidGUIControlLabelNamedValueWithDelta:set_label_default_color()
	slot3 = self

	RaidGUIControlLabelNamedValueWithDelta.super.set_label_default_color(slot2)

	slot4 = self._params.value_delta_color or tweak_data.gui.colors.progress_green

	self._label_value_with_delta.set_color(slot2, self._label_value_with_delta)

	return 
end

return 
