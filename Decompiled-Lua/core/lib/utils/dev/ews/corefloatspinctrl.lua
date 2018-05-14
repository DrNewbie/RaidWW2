slot3 = "CoreFloatSpinCtrl"

core.module(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

slot3 = "CoreEvent"

core.import(slot1, core)

INVALID_COLOR = {
	255,
	128,
	128
}

if not FloatSpinCtrl then
	slot3 = CoreEvent.BasicEventHandling
	slot0 = CoreClass.mixin(slot1, CoreClass.class())
end

FloatSpinCtrl = slot0
function FloatSpinCtrl:init(parent, min, max, step, value, dec, style)
	slot10 = parent

	assert(slot9)

	self._min = min or 0
	self._max = max or 1
	self._step = step or 0.1
	self._dec = dec or 1
	self._value = value or self._min
	self._style = style or ""
	slot11 = "TC_NO_COLOR"
	self._use_colors = not string.find(slot9, self._style)
	slot14 = "SP_HORIZONTAL"
	slot11 = (string.find(slot12, self._style) and "SP_HORIZONTAL") or "SP_VERTICAL"

	self._add_style(slot9, self)

	slot11 = parent
	self._panel = EWS.Panel(slot9, EWS)
	slot11 = "HORIZONTAL"
	local box = EWS.BoxSizer(slot9, EWS)
	self._text = EWS.TextCtrl(EWS, EWS, self._panel, "", str)
	slot18 = "_text_update_cb"

	self._text.connect(EWS, self._text, "", "EVT_COMMAND_TEXT_UPDATED", callback("TE_PROCESS_ENTER", self, self))

	slot18 = "_text_enter_cb"
	slot15 = ""

	self._text.connect(EWS, self._text, "", "EVT_COMMAND_TEXT_ENTER", callback("", self, self))

	slot15 = "EXPAND"

	box.add(EWS, box, self._text, 1, 0)

	slot14 = self._sp_style
	self._btn = EWS.SpinButton(EWS, EWS, self._panel, "")
	slot11 = self._btn
	slot16 = 1

	self._btn.set_min_size(EWS, Vector3("", 16, 1))

	slot18 = "_btn_up_cb"

	self._btn.connect(EWS, self._btn, "", "EVT_SCROLL_LINEUP", callback(1, self, self))

	slot18 = "_btn_down_cb"
	slot15 = ""

	self._btn.connect(EWS, self._btn, "", "EVT_SCROLL_LINEDOWN", callback("", self, self))

	slot15 = "EXPAND"

	box.add(EWS, box, self._btn, 0, 0)

	slot12 = box

	self._panel.set_sizer(EWS, self._panel)

	slot11 = self._text
	self._bg_color = self._text.background_colour(EWS)
	slot11 = self

	self._update_text(EWS)

	return 
end
function FloatSpinCtrl:window()
	return self._panel
end
function FloatSpinCtrl:get_value()
	return self._value
end
function FloatSpinCtrl:set_value(value)
	slot6 = self._max
	self._value = math.clamp(slot3, value, self._min)
	slot5 = true

	self._update_text(slot3, self)

	return 
end
function FloatSpinCtrl:change_value(value)
	slot6 = self._max
	self._value = math.clamp(slot3, value, self._min)
	slot4 = self

	self._update_text(slot3)

	return 
end
function FloatSpinCtrl:_btn_up_cb()
	slot5 = self._max
	self._value = math.clamp(slot2, self._value + self._step, self._min)
	slot4 = true

	self._set_valid(slot2, self)

	slot3 = self

	self._update_text(slot2)

	slot4 = "EVT_FLOAT_SPIN_CTRL_SCROLL_UP"
	slot7 = self

	self._send_event(slot2, self, self.get_value(slot6))

	slot4 = "EVT_FLOAT_SPIN_CTRL_UPDATED"
	slot7 = self

	self._send_event(slot2, self, self.get_value(slot6))

	return 
end
function FloatSpinCtrl:_btn_down_cb()
	slot5 = self._max
	self._value = math.clamp(slot2, self._value - self._step, self._min)
	slot4 = true

	self._set_valid(slot2, self)

	slot3 = self

	self._update_text(slot2)

	slot4 = "EVT_FLOAT_SPIN_CTRL_SCROLL_DOWN"
	slot7 = self

	self._send_event(slot2, self, self.get_value(slot6))

	slot4 = "EVT_FLOAT_SPIN_CTRL_UPDATED"
	slot7 = self

	self._send_event(slot2, self, self.get_value(slot6))

	return 
end
function FloatSpinCtrl:_text_update_cb(data, event)
	slot7 = event
	local value = tonumber(event.get_string(slot6))

	if value and self._min <= value and value <= self._max then
		slot7 = true

		self._set_valid(slot5, self)

		self._value = value
		slot7 = "EVT_FLOAT_SPIN_CTRL_TEXT"
		slot10 = self

		self._send_event(slot5, self, self.get_value(slot9))

		slot7 = "EVT_FLOAT_SPIN_CTRL_UPDATED"
		slot10 = self

		self._send_event(slot5, self, self.get_value(slot9))
	else
		slot7 = false

		self._set_valid(slot5, self)
	end

	return 
end
function FloatSpinCtrl:_text_enter_cb(data, event)
	slot9 = event
	slot7 = self._max
	self._value = math.clamp(slot4, tonumber(event.get_string(slot8)) or 0, self._min)
	slot6 = true

	self._set_valid(slot4, self)

	slot5 = self

	self._update_text(slot4)

	slot6 = "EVT_FLOAT_SPIN_CTRL_ENTER"
	slot9 = self

	self._send_event(slot4, self, self.get_value(slot8))

	slot6 = "EVT_FLOAT_SPIN_CTRL_UPDATED"
	slot9 = self

	self._send_event(slot4, self, self.get_value(slot8))

	return 
end
function FloatSpinCtrl:_update_text(send_event)
	slot7 = self._dec
	slot5 = self._value
	local str = string.format(slot3, "%0." .. tostring(slot6) .. "f")

	if send_event then
		slot6 = str

		self._text.set_value(slot4, self._text)
	else
		slot6 = str

		self._text.change_value(slot4, self._text)
	end

	return 
end
function FloatSpinCtrl:_set_valid(valid)
	if self._use_colors then
		if valid then
			slot7 = self._bg_color.z

			self._text.set_background_colour(slot3, self._text, self._bg_color.x, self._bg_color.y)
		else
			slot4 = self._text
			slot7 = INVALID_COLOR

			self._text.set_background_colour(slot3, unpack(slot6))
		end

		slot4 = self._text

		self._text.refresh(slot3)
	end

	return 
end
function FloatSpinCtrl:_add_style(style)
	self._sp_style = (self._sp_style and self._sp_style .. "," .. style) or style

	return 
end

return 
