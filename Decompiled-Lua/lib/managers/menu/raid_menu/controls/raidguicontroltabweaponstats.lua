if not RaidGUIControlTabWeaponStats then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlTabWeaponStats = slot0
function RaidGUIControlTabWeaponStats:init(parent, params)
	slot7 = params

	RaidGUIControlTabWeaponStats.super.init(slot4, self, parent)

	slot6 = params
	self._object = parent.panel(slot4, parent)
	params.x = 0
	params.y = 0
	slot7 = params
	self._label = self._object.create_custom_control(slot4, self._object, params.label_class or RaidGUIControlLabelNamedValue)
	self._callback_param = nil
	self._tab_select_callback = nil
	self._selected = false

	return 
end
function RaidGUIControlTabWeaponStats:set_text(text)
	self._text = text
	slot5 = text

	self._label.set_text(slot3, self._label)

	return 
end
function RaidGUIControlTabWeaponStats:text()
	slot3 = self._label

	return self._label.text(slot2)
end
function RaidGUIControlTabWeaponStats:set_value(text)
	slot5 = text

	self._label.set_value(slot3, self._label)

	return 
end
function RaidGUIControlTabWeaponStats:value()
	slot3 = self._label

	return self._label.value(slot2)
end
function RaidGUIControlTabWeaponStats:set_value_delta(text)
	slot5 = text

	self._label.set_value_delta(slot3, self._label)

	return 
end
function RaidGUIControlTabWeaponStats:value_delta()
	slot3 = self._label

	return self._label.value_delta(slot2)
end
function RaidGUIControlTabWeaponStats:needs_divider()
	return false
end
function RaidGUIControlTabWeaponStats:needs_bottom_line()
	return false
end
function RaidGUIControlTabWeaponStats:get_callback_param()
	return nil
end
function RaidGUIControlTabWeaponStats:highlight_on()
	return 
end
function RaidGUIControlTabWeaponStats:highlight_off()
	return 
end
function RaidGUIControlTabWeaponStats:select()
	self._selected = false

	return 
end
function RaidGUIControlTabWeaponStats:unselect()
	self._selected = false

	return 
end
function RaidGUIControlTabWeaponStats:mouse_released(o, button, x, y)
	return false
end
function RaidGUIControlTabWeaponStats:on_mouse_released(button, x, y)
	return false
end
function RaidGUIControlTabWeaponStats:set_color(color)
	slot5 = color

	self._label.set_label_color(slot3, self._label)

	return 
end
function RaidGUIControlTabWeaponStats:set_label_default_color()
	slot3 = self._label

	self._label.set_label_default_color(slot2)

	return 
end

return 
