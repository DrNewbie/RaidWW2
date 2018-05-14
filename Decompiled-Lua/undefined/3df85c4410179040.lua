if not RaidGUIControlGrenadeWeaponStats then
	slot2 = RaidGUIControlWeaponStats
	slot0 = class(slot1)
end

RaidGUIControlGrenadeWeaponStats = slot0
function RaidGUIControlGrenadeWeaponStats:init(parent, params)
	slot7 = params

	RaidGUIControlGrenadeWeaponStats.super.init(slot4, self, parent)

	return 
end
function RaidGUIControlGrenadeWeaponStats:_set_default_values()
	slot7 = true
	slot7 = true
	slot7 = true
	self._values = {
		damage = {
			value = "00-000",
			text = self.translate(slot4, self, "menu_weapons_stats_damage")
		},
		range = {
			value = "000",
			text = self.translate(slot4, self, "menu_weapons_stats_grenade_diameter")
		},
		distance = {
			value = "000",
			text = self.translate(slot4, self, "menu_weapons_stats_grenade_throw")
		}
	}

	return 
end
function RaidGUIControlGrenadeWeaponStats:_get_tabs_params()
	local tabs_params = {
		{
			name = "damage",
			text = self._values.damage.text,
			value = self._values.damage.value
		},
		{
			name = "range",
			text = self._values.range.text,
			value = self._values.range.value
		},
		{
			name = "distance",
			text = self._values.distance.text,
			value = self._values.distance.value
		}
	}

	return tabs_params
end
function RaidGUIControlGrenadeWeaponStats:set_stats(damage, range, distance)
	self._values.damage.value = damage
	self._values.range.value = range
	self._values.distance.value = distance
	slot6 = self._items

	for _, item in ipairs(slot5) do
		slot11 = item
		local name = item.name(slot10)
		local value = self._values[name].value
		slot14 = value

		item.set_value(slot12, item)
	end

	return 
end
function RaidGUIControlGrenadeWeaponStats:refresh_data()
	slot4 = "[RaidGUIControlGrenadeWeaponStats:refresh_data]"

	Application.trace(slot2, Application)

	return 
end
function RaidGUIControlGrenadeWeaponStats:_create_bottom_line()
	return 
end
function RaidGUIControlGrenadeWeaponStats:_initial_tab_selected(tab_idx)
	return 
end
function RaidGUIControlGrenadeWeaponStats:_tab_selected(tab_idx, callback_param)
	return 
end
function RaidGUIControlGrenadeWeaponStats:_unselect_all()
	return 
end
function RaidGUIControlGrenadeWeaponStats:set_selected(value)
	slot5 = "[RaidGUIControlGrenadeWeaponStats:set_selected] weapon stats control can't be selected"

	Application.error(slot3, Application)

	self._selected = false

	return 
end
function RaidGUIControlGrenadeWeaponStats:move_up()
	return 
end
function RaidGUIControlGrenadeWeaponStats:move_down()
	return 
end
function RaidGUIControlGrenadeWeaponStats:move_left()
	return 
end
function RaidGUIControlGrenadeWeaponStats:move_right()
	return 
end
function RaidGUIControlGrenadeWeaponStats:highlight_on()
	return 
end
function RaidGUIControlGrenadeWeaponStats:highlight_off()
	return 
end
function RaidGUIControlGrenadeWeaponStats:mouse_released(o, button, x, y)
	return false
end

return 
