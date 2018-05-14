slot3 = "CoreVector3SpinCtrl"

core.module(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

slot3 = "CoreEvent"

core.import(slot1, core)

slot3 = "CoreFloatSpinCtrl"

core.import(slot1, core)

if not Vector3SpinCtrl then
	slot3 = CoreEvent.BasicEventHandling
	slot0 = CoreClass.mixin(slot1, CoreClass.class())
end

Vector3SpinCtrl = slot0
function Vector3SpinCtrl:init(parent, min, max, step, value, name, dec, style)
	slot11 = parent

	assert(slot10)

	if not min then
		slot13 = 0
		slot9 = Vector3(slot10, 0, 0)
	end

	self._min = slot9

	if not max then
		slot13 = 1
		slot9 = Vector3(slot10, 1, 1)
	end

	self._max = slot9
	self._step = step or 0.1
	self._dec = dec or 1
	self._value = value or self._min
	self._name = name or ""
	self._style = style or ""
	slot12 = "V3_VERTICAL"
	local s = string.find(slot10, self._style)
	local layout = (s and "VERTICAL") or "HORIZONTAL"
	slot14 = "VECTOR2TYPE"
	local vec_3_type = not string.find(slot12, self._style)
	slot15 = parent
	self._panel = EWS.Panel(self._style, EWS)
	slot17 = self._name
	local box = EWS.StaticBoxSizer(self._style, EWS, self._panel, layout)
	slot22 = self._style
	self._x = CoreFloatSpinCtrl.FloatSpinCtrl.new(EWS, CoreFloatSpinCtrl.FloatSpinCtrl, self._panel, self._min.x, self._max.x, self._step, self._value.x, self._dec)
	slot22 = "_updated"

	self._x.connect(EWS, self._x, "", "EVT_FLOAT_SPIN_CTRL_UPDATED", callback(self._step, self, self))

	slot22 = "_enter"
	slot19 = ""

	self._x.connect(EWS, self._x, "", "EVT_FLOAT_SPIN_CTRL_ENTER", callback("", self, self))

	slot18 = self._x
	slot19 = "EXPAND"

	box.add(EWS, box, self._x.window("EVT_FLOAT_SPIN_CTRL_ENTER"), 1, 0)

	slot22 = self._style
	self._y = CoreFloatSpinCtrl.FloatSpinCtrl.new(EWS, CoreFloatSpinCtrl.FloatSpinCtrl, self._panel, self._min.y, self._max.y, self._step, self._value.y, self._dec)
	slot22 = "_updated"

	self._y.connect(EWS, self._y, "", "EVT_FLOAT_SPIN_CTRL_UPDATED", callback(self._step, self, self))

	slot22 = "_enter"
	slot19 = ""

	self._y.connect(EWS, self._y, "", "EVT_FLOAT_SPIN_CTRL_ENTER", callback("", self, self))

	slot18 = self._y
	slot19 = "EXPAND"

	box.add(EWS, box, self._y.window("EVT_FLOAT_SPIN_CTRL_ENTER"), 1, 0)

	if vec_3_type then
		slot22 = self._style
		self._z = CoreFloatSpinCtrl.FloatSpinCtrl.new(slot14, CoreFloatSpinCtrl.FloatSpinCtrl, self._panel, self._min.z, self._max.z, self._step, self._value.z, self._dec)
		slot22 = "_updated"

		self._z.connect(slot14, self._z, "", "EVT_FLOAT_SPIN_CTRL_UPDATED", callback(self._step, self, self))

		slot22 = "_enter"
		slot19 = ""

		self._z.connect(slot14, self._z, "", "EVT_FLOAT_SPIN_CTRL_ENTER", callback("", self, self))

		slot18 = self._z
		slot19 = "EXPAND"

		box.add(slot14, box, self._z.window("EVT_FLOAT_SPIN_CTRL_ENTER"), 1, 0)
	end

	slot16 = box

	self._panel.set_sizer(slot14, self._panel)

	return 
end
function Vector3SpinCtrl:window()
	return self._panel
end
function Vector3SpinCtrl:get_value()
	slot4 = self._y.get_value(self._x)
	slot7 = self._z

	return Vector3(slot2, self._x.get_value(slot4), self._z.get_value(self._y))
end
function Vector3SpinCtrl:set_value(value)
	slot5 = value.x

	self._x.set_value(slot3, self._x)

	slot5 = value.y

	self._y.set_value(slot3, self._y)

	slot5 = value.z

	self._z.set_value(slot3, self._z)

	return 
end
function Vector3SpinCtrl:change_value(value)
	slot5 = value.x

	self._x.change_value(slot3, self._x)

	slot5 = value.y

	self._y.change_value(slot3, self._y)

	slot5 = value.z

	self._z.change_value(slot3, self._z)

	return 
end
function Vector3SpinCtrl:_updated()
	slot4 = "EVT_VECTOR3_SPIN_CTRL_UPDATED"
	slot7 = self

	self._send_event(slot2, self, self.get_value(slot6))

	return 
end
function Vector3SpinCtrl:_enter()
	slot4 = "EVT_VECTOR3_SPIN_CTRL_ENTER"
	slot7 = self

	self._send_event(slot2, self, self.get_value(slot6))

	return 
end

return 
