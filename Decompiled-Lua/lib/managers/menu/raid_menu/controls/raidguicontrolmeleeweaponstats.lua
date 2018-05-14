if not RaidGUIControlMeleeWeaponStats then
	slot2 = RaidGUIControlWeaponStats
	slot0 = class(slot1)
end

RaidGUIControlMeleeWeaponStats = slot0
function RaidGUIControlMeleeWeaponStats:init(parent, params)
	slot7 = params

	RaidGUIControlMeleeWeaponStats.super.init(slot4, self, parent)

	return 
end
function RaidGUIControlMeleeWeaponStats:_set_default_values()
	slot7 = true
	slot7 = true
	slot7 = true
	slot7 = true
	self._values = {
		damage = {
			value = "00-000",
			text = self.translate(slot4, self, "menu_weapons_stats_damage")
		},
		knockback = {
			value = "00-000",
			text = self.translate(slot4, self, "menu_weapons_stats_knockback")
		},
		range = {
			value = "000",
			text = self.translate(slot4, self, "menu_weapons_stats_range")
		},
		charge_time = {
			value = "00",
			text = self.translate(slot4, self, "menu_weapons_stats_charge_time")
		}
	}

	return 
end
function RaidGUIControlMeleeWeaponStats:_get_tabs_params()
	local tabs_params = {
		{
			name = "damage",
			text = self._values.damage.text,
			value = self._values.damage.value
		},
		{
			name = "knockback",
			text = self._values.knockback.text,
			value = self._values.knockback.value
		},
		{
			name = "range",
			text = self._values.range.text,
			value = self._values.range.value
		},
		{
			name = "charge_time",
			text = self._values.charge_time.text,
			value = self._values.charge_time.value
		}
	}

	return tabs_params
end
function RaidGUIControlMeleeWeaponStats:set_stats(damage, knockback, range, charge_time)
	self._values.damage.value = damage
	self._values.knockback.value = knockback
	self._values.range.value = range
	self._values.charge_time.value = charge_time
	slot7 = self._items

	for _, item in ipairs(slot6) do
		slot12 = item
		local name = item.name(slot11)
		local value = self._values[name].value
		slot15 = value

		item.set_value(slot13, item)
	end

	return 
end
function RaidGUIControlMeleeWeaponStats:refresh_data()
	slot4 = "[RaidGUIControlMeleeWeaponStats:refresh_data]"

	Application.trace(slot2, Application)

	return 
end
function RaidGUIControlMeleeWeaponStats:_create_bottom_line()
	return 
end
function RaidGUIControlMeleeWeaponStats:_initial_tab_selected(tab_idx)
	return 
end
function RaidGUIControlMeleeWeaponStats:_tab_selected(tab_idx, callback_param)
	return 
end
function RaidGUIControlMeleeWeaponStats:_unselect_all()
	return 
end
function RaidGUIControlMeleeWeaponStats:set_selected(value)
	slot5 = "[RaidGUIControlMeleeWeaponStats:set_selected] weapon stats control can't be selected"

	Application.error(slot3, Application)

	self._selected = false

	return 
end
function RaidGUIControlMeleeWeaponStats:move_up()
	return 
end
function RaidGUIControlMeleeWeaponStats:move_down()
	return 
end
function RaidGUIControlMeleeWeaponStats:move_left()
	return 
end
function RaidGUIControlMeleeWeaponStats:move_right()
	return 
end
function RaidGUIControlMeleeWeaponStats:highlight_on()
	return 
end
function RaidGUIControlMeleeWeaponStats:highlight_off()
	return 
end
function RaidGUIControlMeleeWeaponStats:mouse_released(o, button, x, y)
	return false
end

return 
