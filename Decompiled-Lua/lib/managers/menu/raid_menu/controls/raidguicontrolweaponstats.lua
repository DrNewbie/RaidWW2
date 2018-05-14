-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not RaidGUIControlWeaponStats then
	slot2 = RaidGUIControlTabs
	slot0 = class(slot1)
end

RaidGUIControlWeaponStats = slot0
RaidGUIControlWeaponStats.TAB_HEIGHT = 96
function RaidGUIControlWeaponStats:init(parent, params)
	params.item_class = RaidGUIControlTabWeaponStats
	slot5 = self

	self._set_default_values(slot4)

	slot5 = self
	params.tabs_params = self._get_tabs_params(slot4)
	params.tab_height = RaidGUIControlWeaponStats.TAB_HEIGHT
	slot7 = params

	RaidGUIControlWeaponStats.super.init(slot4, self, parent)

	return 
end
function RaidGUIControlWeaponStats:_create_items()
	if self._params.tabs_params then
		slot3 = self._params.tabs_params

		for index, tabs_params in ipairs(slot2) do

			-- Decompilation error in this vicinity:
			slot6 = (index - 1) * self._tab_width
			slot10 = item

			table.insert(slot8, self._items)
		end
	end

	return 
end
function RaidGUIControlWeaponStats:_set_default_values()
	slot7 = true
	slot7 = true
	slot7 = true
	slot7 = true
	slot7 = true
	slot7 = true
	self._values = {
		damage = {
			value = "00",
			delta_value = "00",
			text = self.translate(slot4, self, "menu_weapons_stats_damage")
		},
		magazine = {
			value = "000",
			delta_value = "00",
			text = self.translate(slot4, self, "menu_weapons_stats_magazine")
		},
		total_ammo = {
			value = "000",
			delta_value = "00",
			text = self.translate(slot4, self, "menu_weapons_stats_total_ammo")
		},
		rate_of_fire = {
			value = "00",
			delta_value = "00",
			text = self.translate(slot4, self, "menu_weapons_stats_rate_of_fire")
		},
		accuracy = {
			value = "00",
			delta_value = "00",
			text = self.translate(slot4, self, "menu_weapons_stats_accuracy")
		},
		stability = {
			value = "00",
			delta_value = "00",
			text = self.translate(slot4, self, "menu_weapons_stats_stability")
		}
	}

	return 
end
function RaidGUIControlWeaponStats:_get_tabs_params()
	local tabs_params = {
		{
			name = "damage",
			text = self._values.damage.text,
			modified_value = self._values.damage.modified_value or 0,
			applied_value = self._values.damage.applied_value or 0
		},
		{
			name = "magazine",
			text = self._values.magazine.text,
			modified_value = self._values.magazine.modified_value or 0,
			applied_value = self._values.magazine.applied_value or 0
		},
		{
			name = "total_ammo",
			text = self._values.total_ammo.text,
			modified_value = self._values.total_ammo.modified_value or 0,
			applied_value = self._values.total_ammo.applied_value or 0
		},
		{
			name = "rate_of_fire",
			text = self._values.rate_of_fire.text,
			modified_value = self._values.rate_of_fire.modified_value or 0,
			applied_value = self._values.rate_of_fire.applied_value or 0
		},
		{
			name = "accuracy",
			text = self._values.accuracy.text,
			modified_value = self._values.accuracy.modified_value or 0,
			applied_value = self._values.accuracy.applied_value or 0
		},
		{
			name = "stability",
			text = self._values.stability.text,
			modified_value = self._values.stability.modified_value or 0,
			applied_value = self._values.stability.applied_value or 0
		}
	}

	return tabs_params
end
function RaidGUIControlWeaponStats:set_modified_stats(params)
	self._values.damage.modified_value = params.damage_modified_value
	self._values.magazine.modified_value = params.magazine_modified_value
	self._values.total_ammo.modified_value = params.total_ammo_modified_value
	self._values.rate_of_fire.modified_value = params.rate_of_fire_modified_value
	self._values.accuracy.modified_value = params.accuracy_modified_value
	self._values.stability.modified_value = params.stability_modified_value
	slot4 = self._items

	for _, item in ipairs(params.stability_modified_value) do
		slot9 = item
		local name = item.name(slot8)
		local item_data = self._values[name]
		local sign = ""
		slot13 = item_data.applied_value or 0
		local delta_value = tonumber(slot11) - tonumber(item_data.modified_value or 0)
		slot14 = item_data.applied_value .. ""

		item.set_value(item_data.modified_value or 0, item)

		slot14 = delta_value

		item.set_value_delta(item_data.modified_value or 0, item)

		if delta_value < 0 then
			slot14 = tweak_data.gui.colors.progress_green

			item.set_color(slot12, item)
		elseif 0 < delta_value then
			slot14 = tweak_data.gui.colors.progress_green

			item.set_color(slot12, item)
		else
			slot13 = item

			item.set_label_default_color(slot12)
		end
	end

	return 
end
function RaidGUIControlWeaponStats:set_applied_stats(params)
	self._values.damage.applied_value = params.damage_applied_value
	self._values.magazine.applied_value = params.magazine_applied_value
	self._values.total_ammo.applied_value = params.total_ammo_applied_value
	self._values.rate_of_fire.applied_value = params.rate_of_fire_applied_value
	self._values.accuracy.applied_value = params.accuracy_applied_value
	self._values.stability.applied_value = params.stability_applied_value

	return 
end
function RaidGUIControlWeaponStats:refresh_data()
	slot4 = "[RaidGUIControlWeaponStats:refresh_data]"

	Application.trace(slot2, Application)

	return 
end
function RaidGUIControlWeaponStats:_create_bottom_line()
	return 
end
function RaidGUIControlWeaponStats:_initial_tab_selected(tab_idx)
	return 
end
function RaidGUIControlWeaponStats:_tab_selected(tab_idx, callback_param)
	return 
end
function RaidGUIControlWeaponStats:_unselect_all()
	return 
end
function RaidGUIControlWeaponStats:set_selected(value)
	slot5 = "[RaidGUIControlWeaponStats:set_selected] weapon stats control can't be selected"

	Application.error(slot3, Application)

	self._selected = false

	return 
end
function RaidGUIControlWeaponStats:move_up()
	return 
end
function RaidGUIControlWeaponStats:move_down()
	return 
end
function RaidGUIControlWeaponStats:move_left()
	return 
end
function RaidGUIControlWeaponStats:move_right()
	return 
end
function RaidGUIControlWeaponStats:highlight_on()
	return 
end
function RaidGUIControlWeaponStats:highlight_off()
	return 
end
function RaidGUIControlWeaponStats:mouse_released(o, button, x, y)
	return false
end

return 
