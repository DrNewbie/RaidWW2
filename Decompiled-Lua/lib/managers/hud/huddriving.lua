HUDDriving = HUDDriving or class()
HUDDriving.W = 960
HUDDriving.H = 288
HUDDriving.BOTTOM_DISTANCE_WHILE_HIDDEN = 32
HUDDriving.SLOT_PANEL_W = 96
HUDDriving.SLOT_PANEL_H = 84
HUDDriving.EMPTY_SEAT_ICON = "car_slot_empty"
HUDDriving.SLOT_NATIONALITY_BASE = "player_panel_nationality_"
HUDDriving.SEATING_ARRANGEMENT = {
	"driver",
	"passenger_front",
	"passenger_back_left",
	"passenger_back_right"
}
HUDDriving.HEALTH_W = 64
HUDDriving.HEALTH_H = 10
HUDDriving.HEALTH_BG_ICON = "backgrounds_vehicle_damage_bg"
HUDDriving.HEALTH_METER_COLORS = tweak_data.gui.colors.vehicle_health_colors
HUDDriving.CARRY_PANEL_PADDING_LEFT = 16
HUDDriving.CARRY_PANEL_PADDING_RIGHT = 9
HUDDriving.CARRY_PANEL_W = 10
HUDDriving.CARRY_PANEL_BG_ICON = "backgrounds_vehicle_bags_weight"
HUDDriving.CARRY_PANEL_INDICATOR_ICON = "vehicle_bags_weight_indicator"
HUDDriving.CARRY_INDICATOR_COLORS = tweak_data.gui.colors.vehicle_carry_amount_colors
HUDDriving.CARRY_INFO_TEXT_FONT = tweak_data.gui.fonts.din_compressed_outlined_20
HUDDriving.CARRY_INFO_TEXT_FONT_SIZE = tweak_data.gui.font_sizes.size_20
HUDDriving.BUTTON_PROMPTS_H = 64
HUDDriving.BUTTON_PROMPT_DISTANCE = 30
HUDDriving.BUTTON_PROMPT_TEXT_FONT = tweak_data.gui.fonts.din_compressed_outlined_20
HUDDriving.BUTTON_PROMPT_TEXT_FONT_SIZE = tweak_data.gui.font_sizes.size_20
HUDDriving.BUTTON_PROMPT_LOOK_BEHIND = "hud_driving_prompt_look_behind"
HUDDriving.BUTTON_PROMPT_SWITCH_POSE = "hud_driving_prompt_switch_pose"
HUDDriving.BUTTON_PROMPT_EXIT_VEHICLE = "hud_driving_prompt_exit_vehicle"
HUDDriving.BUTTON_PROMPT_CHANGE_SEAT = "hud_driving_prompt_change_seat"
function HUDDriving:init(hud)
	slot5 = hud

	self._create_panel(slot3, self)

	slot4 = self

	self._create_slot_panel(slot3)

	slot4 = self

	self._create_carry_info(slot3)

	slot4 = self

	self._create_button_prompts(slot3)

	return 
end
function HUDDriving:_create_panel(hud)
	local panel_params = {
		visible = false,
		name = "driving_panel",
		halign = "center",
		valign = "bottom",
		w = HUDDriving.W,
		h = HUDDriving.H
	}
	slot6 = panel_params
	self._object = hud.panel.panel(slot4, hud.panel)
	slot8 = hud.panel
	slot6 = hud.panel.w(slot7) / 2

	self._object.set_center_x(slot4, self._object)

	slot5 = self._object
	slot8 = hud.panel

	self._object.set_bottom(slot4, hud.panel.h(slot7))

	return 
end
function HUDDriving:_create_slot_panel()
	local slot_panel_params = {
		name = "slot_panel",
		halign = "left",
		valign = "bottom",
		w = HUDDriving.SLOT_PANEL_W,
		h = HUDDriving.SLOT_PANEL_H
	}
	slot5 = slot_panel_params
	self._slot_panel = self._object.panel(slot3, self._object)
	slot7 = self._object
	slot5 = self._object.w(slot6) / 2

	self._slot_panel.set_center_x(slot3, self._slot_panel)

	slot4 = self._slot_panel
	slot7 = self._object

	self._slot_panel.set_bottom(slot3, self._object.h(slot6))

	self._slots = {}

	for i = 1, 4, 1 do
		local empty_slot_params = {}
		slot10 = i
		empty_slot_params.name = "empty_slot_" .. tostring(slot9)
		empty_slot_params.texture = tweak_data.gui.icons[HUDDriving.EMPTY_SEAT_ICON].texture
		empty_slot_params.texture_rect = tweak_data.gui.icons[HUDDriving.EMPTY_SEAT_ICON].texture_rect
		slot10 = empty_slot_params
		local empty_slot = self._slot_panel.bitmap(HUDDriving.EMPTY_SEAT_ICON, self._slot_panel)
		local placeholder_nationality_icon = HUDDriving.SLOT_NATIONALITY_BASE .. "german"
		local taken_slot_params = {
			layer = 2
		}
		slot13 = i
		taken_slot_params.name = "taken_slot_" .. tostring(slot12)
		taken_slot_params.texture = tweak_data.gui.icons[placeholder_nationality_icon].texture
		taken_slot_params.texture_rect = tweak_data.gui.icons[placeholder_nationality_icon].texture_rect
		slot13 = taken_slot_params
		local taken_slot = self._slot_panel.bitmap(tostring(slot12), self._slot_panel)

		if i % 2 == 0 then
			slot16 = self._slot_panel
			slot14 = 3 * self._slot_panel.w(slot15) / 4

			empty_slot.set_center_x(slot12, empty_slot)

			slot16 = self._slot_panel
			slot14 = 3 * self._slot_panel.w(slot15) / 4

			taken_slot.set_center_x(slot12, taken_slot)
		else
			slot16 = self._slot_panel
			slot14 = self._slot_panel.w(slot15) / 4

			empty_slot.set_center_x(slot12, empty_slot)

			slot16 = self._slot_panel
			slot14 = self._slot_panel.w(slot15) / 4

			taken_slot.set_center_x(slot12, taken_slot)
		end

		slot13 = i / 2 - 1

		if 1 <= math.ceil(slot12) then
			slot16 = self._slot_panel
			slot14 = 3 * self._slot_panel.h(slot15) / 4

			empty_slot.set_center_y(slot12, empty_slot)

			slot16 = self._slot_panel
			slot14 = 3 * self._slot_panel.h(slot15) / 4

			taken_slot.set_center_y(slot12, taken_slot)
		else
			slot16 = self._slot_panel
			slot14 = self._slot_panel.h(slot15) / 4

			empty_slot.set_center_y(slot12, empty_slot)

			slot16 = self._slot_panel
			slot14 = self._slot_panel.h(slot15) / 4

			taken_slot.set_center_y(slot12, taken_slot)
		end

		local slot = {
			free = true,
			empty = empty_slot,
			taken = taken_slot
		}
		slot15 = slot

		table.insert(slot13, self._slots)
	end

	return 
end
function HUDDriving:_create_carry_info()
	local carry_panel_x = self._slot_panel.x(slot2) + self._slot_panel.w(self._slot_panel) + HUDDriving.CARRY_PANEL_PADDING_LEFT
	local carry_info_panel_params = {
		halign = "right",
		name = "carry_info_panel",
		y = 0,
		valign = "scale",
		x = carry_panel_x
	}
	slot5 = self._object
	carry_info_panel_params.w = self._object.w(self._slot_panel) - carry_panel_x
	slot5 = self._slot_panel
	carry_info_panel_params.h = self._slot_panel.h(self._slot_panel) + 20
	slot6 = carry_info_panel_params
	local carry_info_panel = self._object.panel(self._slot_panel, self._object)
	slot6 = carry_info_panel
	slot9 = self._slot_panel

	carry_info_panel.set_bottom(self._object, self._slot_panel.bottom(slot8))

	local carry_panel_background_params = {
		name = "carry_background",
		texture = tweak_data.gui.icons[HUDDriving.CARRY_PANEL_BG_ICON].texture,
		texture_rect = tweak_data.gui.icons[HUDDriving.CARRY_PANEL_BG_ICON].texture_rect
	}
	slot8 = carry_panel_background_params
	local carry_panel_background = carry_info_panel.bitmap(HUDDriving.CARRY_PANEL_BG_ICON, carry_info_panel)
	slot8 = carry_panel_background

	carry_panel_background.set_bottom(carry_info_panel, carry_info_panel.h(slot10))

	local carry_indicator_params = {
		name = "carry_indicator",
		layer = 5,
		texture = tweak_data.gui.icons[HUDDriving.CARRY_PANEL_INDICATOR_ICON].texture,
		texture_rect = tweak_data.gui.icons[HUDDriving.CARRY_PANEL_INDICATOR_ICON].texture_rect
	}
	slot10 = carry_indicator_params
	self._carry_indicator = carry_info_panel.bitmap(HUDDriving.CARRY_PANEL_INDICATOR_ICON, carry_info_panel)
	slot10 = 0

	self._carry_indicator.set_y(HUDDriving.CARRY_PANEL_INDICATOR_ICON, self._carry_indicator)

	slot9 = self._carry_indicator
	slot12 = carry_panel_background

	self._carry_indicator.set_center_x(HUDDriving.CARRY_PANEL_INDICATOR_ICON, carry_panel_background.center_x(carry_info_panel))

	local carry_info_text_x = self._carry_indicator.x(HUDDriving.CARRY_PANEL_INDICATOR_ICON) + self._carry_indicator.w(self._carry_indicator) + HUDDriving.CARRY_PANEL_PADDING_RIGHT
	local carry_info_text_params = {
		vertical = "center",
		name = "carry_info_text",
		align = "left",
		text = "",
		halign = "center",
		valign = "left",
		x = carry_info_text_x
	}
	slot11 = carry_info_panel
	carry_info_text_params.w = carry_info_panel.w(self._carry_indicator) - carry_info_text_x
	carry_info_text_params.font = HUDDriving.CARRY_INFO_TEXT_FONT
	carry_info_text_params.font_size = HUDDriving.CARRY_INFO_TEXT_FONT_SIZE
	slot12 = carry_info_text_params
	self._carry_info_text = carry_info_panel.text(self._carry_indicator, carry_info_panel)
	slot11 = self._carry_info_text
	slot14 = self._carry_indicator

	self._carry_info_text.set_center_y(self._carry_indicator, self._carry_indicator.center_y(slot13))

	return 
end
function HUDDriving:_create_button_prompts()
	local button_prompts_panel_params = {
		alpha = 0,
		name = "button_prompts_panel",
		halign = "scale",
		valign = "top"
	}
	slot4 = self._object
	button_prompts_panel_params.w = self._object.w(slot3)
	button_prompts_panel_params.h = HUDDriving.BUTTON_PROMPTS_H
	slot5 = button_prompts_panel_params
	self._button_prompts_panel = self._object.panel(slot3, self._object)

	return 
end
function HUDDriving:show(vehicle)
	self._vehicle = vehicle
	slot4 = vehicle
	slot6 = {
		"hurt",
		"death"
	}
	slot11 = "on_vehicle_damaged"

	vehicle.character_damage(slot3).add_listener(slot3, vehicle.character_damage(slot3), "hud_driving_damage", callback(slot8, self, self))

	slot4 = vehicle
	local loot = vehicle.vehicle_driving(slot3).get_loot(slot3)
	slot5 = vehicle
	local current_loot_amount = vehicle.vehicle_driving(vehicle.vehicle_driving(slot3)).get_current_loot_amount(vehicle.vehicle_driving(slot3))
	slot6 = vehicle
	local max_loot = vehicle.vehicle_driving(vehicle.vehicle_driving(vehicle.vehicle_driving(slot3))).get_max_loot(vehicle.vehicle_driving(vehicle.vehicle_driving(slot3)))
	slot11 = max_loot

	self.set_vehicle_loot_info(vehicle.vehicle_driving(vehicle.vehicle_driving(vehicle.vehicle_driving(slot3))), self, self._vehicle, loot, current_loot_amount)

	slot8 = true

	self._object.set_visible(vehicle.vehicle_driving(vehicle.vehicle_driving(vehicle.vehicle_driving(slot3))), self._object)

	slot7 = self._object

	self._object.stop(vehicle.vehicle_driving(vehicle.vehicle_driving(vehicle.vehicle_driving(slot3))))

	slot7 = self._object
	slot12 = "_animate_show"

	self._object.animate(vehicle.vehicle_driving(vehicle.vehicle_driving(vehicle.vehicle_driving(slot3))), callback(loot, self, self))

	slot8 = "hud_driving"
	slot13 = "controller_mod_changed"

	managers.controller.add_hotswap_callback(vehicle.vehicle_driving(vehicle.vehicle_driving(vehicle.vehicle_driving(slot3))), managers.controller, callback(self, self, self))

	slot7 = self

	self.refresh_button_prompts(vehicle.vehicle_driving(vehicle.vehicle_driving(vehicle.vehicle_driving(slot3))))

	return 
end
function HUDDriving:controller_mod_changed()
	slot4 = true

	self.refresh_button_prompts(slot2, self)

	return 
end
function HUDDriving:refresh_button_prompts(force)
	slot4 = managers.player

	if not managers.player.current_state(slot3) == "driving" then
		return 
	end

	slot4 = self
	local seat_prompts = self._get_prompts_needed_for_current_seat(slot3)
	local have_new_prompts = false

	if self._current_seat_prompts and #seat_prompts == #self._current_seat_prompts then
		for i = 1, #seat_prompts, 1 do
			local found_match = false

			for j = 1, #self._current_seat_prompts, 1 do
				if seat_prompts[i].name == self._current_seat_prompts[j].name then
					found_match = true

					break
				end
			end

			if not found_match then
				have_new_prompts = true
			end
		end
	else
		have_new_prompts = true
	end

	if have_new_prompts or force then
		self._current_seat_prompts = seat_prompts
		slot6 = self._button_prompts_panel

		self._button_prompts_panel.stop(slot5)

		slot6 = self._button_prompts_panel
		slot11 = "_animate_refresh_seats"

		self._button_prompts_panel.animate(slot5, callback(slot8, self, self))
	end

	return 
end
function HUDDriving:_create_button_prompt(prompt_name, prompt, buttons)
	slot6 = managers.controller

	if managers.controller.is_xbox_controller_present(slot5) then
		slot6 = managers.menu

		if not managers.menu.is_pc_controller(slot5) then
			slot6 = managers.localization
			buttons = managers.localization.get_default_macros(slot5)
		end
	end

	local button_prompt_params = {
		vertical = "center",
		halign = "center",
		align = "center",
		valign = "center",
		name = "button_prompt_" .. tostring(slot7),
		font = HUDDriving.BUTTON_PROMPT_TEXT_FONT,
		font_size = HUDDriving.BUTTON_PROMPT_TEXT_FONT_SIZE,
		text = utf8.to_upper(managers.localization.text(prompt_name, managers.localization, prompt))
	}
	slot8 = button_prompt_params
	local button_prompt = self._button_prompts_panel.text(tostring(slot7), self._button_prompts_panel)
	slot8 = button_prompt
	local _, _, w, h = button_prompt.text_rect(self._button_prompts_panel)
	slot13 = w

	button_prompt.set_w(buttons, button_prompt)

	slot13 = h

	button_prompt.set_h(buttons, button_prompt)

	slot15 = self._button_prompts_panel
	slot13 = self._button_prompts_panel.h(slot14) / 2

	button_prompt.set_center_y(buttons, button_prompt)

	return 
end
function HUDDriving:_layout_button_prompts()
	slot3 = self._button_prompts_panel
	local button_prompts = self._button_prompts_panel.children(slot2)
	local total_width = 0
	slot5 = button_prompts

	for index, button_prompt in pairs(slot4) do
		slot10 = button_prompt
		total_width = total_width + button_prompt.w(slot9)
	end

	total_width = total_width + (#button_prompts - 1) * HUDDriving.BUTTON_PROMPT_DISTANCE
	slot7 = self._button_prompts_panel
	local x = math.floor(HUDDriving.BUTTON_PROMPT_DISTANCE)
	slot6 = button_prompts

	for index, button_prompt in pairs((self._button_prompts_panel.w(slot6) - total_width) / 2) do
		slot12 = x

		button_prompt.set_x(slot10, button_prompt)

		slot11 = button_prompt
		x = x + button_prompt.w(slot10) + HUDDriving.BUTTON_PROMPT_DISTANCE
	end

	return 
end
function HUDDriving:_create_current_seat_prompts()
	slot3 = self._button_prompts_panel

	self._button_prompts_panel.clear(slot2)

	slot3 = self._current_seat_prompts

	for index, prompt in pairs(slot2) do
		slot11 = prompt.buttons

		self._create_button_prompt(slot7, self, prompt.name, prompt.prompt)
	end

	slot3 = self

	self._layout_button_prompts(slot2)

	return 
end
function HUDDriving:_get_prompts_needed_for_current_seat()
	slot3 = self._vehicle
	slot3 = self._vehicle.vehicle_driving(slot2)
	slot6 = managers.player
	local player_seat = self._vehicle.vehicle_driving(slot2).find_seat_for_player(slot2, managers.player.local_player(slot5))
	local seat_prompts = {}

	if player_seat.driving then
		slot6 = {
			name = "look_behind",
			prompt = HUDDriving.BUTTON_PROMPT_LOOK_BEHIND,
			buttons = {
				STICK_R = managers.localization.btn_macro(slot9, managers.localization)
			}
		}
		slot11 = "vehicle_rear_camera"

		table.insert(slot4, seat_prompts)
	end

	if player_seat.has_shooting_mode then
		slot6 = {
			name = "switch_pose",
			prompt = HUDDriving.BUTTON_PROMPT_SWITCH_POSE,
			buttons = {
				BTN_B = managers.localization.btn_macro(slot9, managers.localization)
			}
		}
		slot11 = "vehicle_shooting_stance"

		table.insert(slot4, seat_prompts)
	end

	slot6 = {
		name = "exit_vehicle",
		prompt = HUDDriving.BUTTON_PROMPT_EXIT_VEHICLE,
		buttons = {
			BTN_TOP_R = managers.localization.btn_macro(slot9, managers.localization)
		}
	}
	slot11 = "vehicle_exit"

	table.insert(slot4, seat_prompts)

	slot6 = {
		name = "change_seat",
		prompt = HUDDriving.BUTTON_PROMPT_CHANGE_SEAT,
		buttons = {
			BTN_TOP_L = managers.localization.btn_macro(slot9, managers.localization)
		}
	}
	slot11 = "vehicle_change_seat"

	table.insert(slot4, seat_prompts)

	return seat_prompts
end
function HUDDriving:on_vehicle_damaged()
	return 
end
function HUDDriving:refresh_health()
	return 
end
function HUDDriving:refresh_seats(refresh_button_prompts)
	if not self._vehicle then
		return 
	end

	slot4 = self._vehicle
	local seats = self._vehicle.vehicle_driving(slot3).seats(slot3)
	slot5 = seats

	for index, seat in pairs(self._vehicle.vehicle_driving(slot3)) do
		local seat_index = nil
		slot11 = HUDDriving.SEATING_ARRANGEMENT

		for i, seat_name in pairs(slot10) do
			if seat.name == seat_name then
				seat_index = i
			end
		end

		if not seat.occupant then
			slot12 = seat_index

			self.free_seat(slot10, self)
		else
			slot13 = seat.occupant

			self.occupy_seat(slot10, self, seat_index)
		end
	end

	if refresh_button_prompts then
		slot5 = self

		self.refresh_button_prompts(slot4)
	end

	return 
end
function HUDDriving:free_seat(id)
	slot5 = false

	self._slots[id].taken.set_visible(slot3, self._slots[id].taken)

	slot5 = true

	self._slots[id].empty.set_visible(slot3, self._slots[id].empty)

	self._slots[id].free = true
	self._slots[id].occupant = nil

	return 
end
function HUDDriving:occupy_seat(id, unit)
	slot6 = unit
	local nationality = managers.criminals.character_name_by_unit(slot4, managers.criminals)

	if not nationality then
		return 
	end

	slot7 = tweak_data.gui.icons[HUDDriving.SLOT_NATIONALITY_BASE .. nationality].texture

	self._slots[id].taken.set_image(slot5, self._slots[id].taken)

	slot6 = self._slots[id].taken
	slot9 = tweak_data.gui.icons[HUDDriving.SLOT_NATIONALITY_BASE .. nationality].texture_rect

	self._slots[id].taken.set_texture_rect(slot5, unpack(HUDDriving.SLOT_NATIONALITY_BASE .. nationality))

	slot7 = true

	self._slots[id].taken.set_visible(slot5, self._slots[id].taken)

	slot7 = false

	self._slots[id].empty.set_visible(slot5, self._slots[id].empty)

	self._slots[id].free = false
	self._slots[id].occupant = unit

	return 
end
function HUDDriving:set_vehicle_loot_info(vehicle, current_loot, current_loot_amount, max_loot_amount)
	if vehicle ~= self._vehicle then
		return 
	end

	if current_loot and current_loot[1] and current_loot[1].carry_id == "german_spy" then
		return 
	end

	local loot_percentage = (max_loot_amount == 0 and 0) or current_loot_amount / max_loot_amount
	slot9 = "carry_info_panel"
	local carry_panel = self._object.child(slot7, self._object)
	slot14 = "carry_background"
	slot14 = self._carry_indicator
	slot10 = carry_panel.h(slot11) - loot_percentage * (carry_panel.child(carry_panel, carry_panel).h(carry_panel) - self._carry_indicator.h(carry_panel.child(carry_panel, carry_panel)))

	self._carry_indicator.set_bottom(self._object, self._carry_indicator)

	slot9 = self._carry_indicator
	slot14 = loot_percentage

	self._carry_indicator.set_color(self._object, self._get_color_for_percentage(loot_percentage * (carry_panel.child(carry_panel, carry_panel).h(carry_panel) - self._carry_indicator.h(carry_panel.child(carry_panel, carry_panel))), self, HUDDriving.CARRY_INDICATOR_COLORS))

	if current_loot and current_loot[1] and current_loot[1].carry_id and tweak_data.carry[current_loot[1].carry_id] then
		slot10 = tweak_data.carry[current_loot[1].carry_id].name_id
		local loot_name = managers.localization.text(slot8, managers.localization)
		slot12 = current_loot_amount
		slot10 = tostring(current_loot[1].carry_id)
		slot14 = max_loot_amount
		local carry_info_text = loot_name .. " " .. slot10 .. "/" .. tostring(slot13)
		slot11 = self._carry_info_text
		slot14 = carry_info_text

		self._carry_info_text.set_text(slot10, utf8.to_upper(slot13))

		slot11 = self._carry_info_text
		slot14 = self._carry_indicator

		self._carry_info_text.set_center_y(slot10, self._carry_indicator.center_y(slot13))

		if current_loot_amount == 0 then
			slot12 = 0

			self._carry_info_text.set_alpha(slot10, self._carry_info_text)
		else
			slot12 = 1

			self._carry_info_text.set_alpha(slot10, self._carry_info_text)
		end
	else
		slot10 = 0

		self._carry_info_text.set_alpha(slot8, self._carry_info_text)
	end

	return 
end
function HUDDriving:_get_color_for_percentage(color_table, percentage)
	for i = #color_table, 1, -1 do
		if color_table[i].start_percentage < percentage then
			return color_table[i].color
		end
	end

	return color_table[1].color
end
function HUDDriving:hide()
	if not self._vehicle then
		return 
	end

	slot3 = self._vehicle
	slot4 = "hud_driving_damage"

	self._vehicle.character_damage(slot2).remove_listener(slot2, self._vehicle.character_damage(slot2))

	self._vehicle = nil
	slot3 = self._object

	self._object.stop(slot2)

	slot3 = self._object
	slot8 = "_animate_hide"

	self._object.animate(slot2, callback(slot5, self, self))

	return 
end
function HUDDriving:_on_hidden()
	slot4 = "hud_driving"

	managers.controller.remove_hotswap_callback(slot2, managers.controller)

	self._current_seat_prompts = nil
	slot3 = self._button_prompts_panel

	self._button_prompts_panel.clear(slot2)

	slot4 = 0

	self._button_prompts_panel.set_alpha(slot2, self._button_prompts_panel)

	return 
end
function HUDDriving:_animate_show()
	local duration = 0.5
	slot4 = self._object
	local t = self._object.alpha(slot3) * duration

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot9 = duration
		local current_alpha = Easing.quartic_out(slot5, t, 0, 1)
		slot8 = current_alpha

		self._object.set_alpha(t, self._object)

		local current_bottom_distance = Easing.quartic_out(t, t, HUDDriving.BOTTOM_DISTANCE_WHILE_HIDDEN, -HUDDriving.BOTTOM_DISTANCE_WHILE_HIDDEN)
		slot11 = self._object
		slot11 = self._object.parent(duration)
		slot9 = self._object.parent(duration).h(duration) - current_bottom_distance

		self._object.set_bottom(t, self._object)
	end

	slot6 = 1

	self._object.set_alpha(slot4, self._object)

	slot5 = self._object
	slot8 = self._object
	slot8 = self._object.parent(slot7)

	self._object.set_bottom(slot4, self._object.parent(slot7).h(slot7))

	return 
end
function HUDDriving:_animate_hide()
	local duration = 0.25
	slot4 = self._object
	local t = (1 - self._object.alpha(slot3)) * duration

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot9 = duration
		local current_alpha = Easing.quartic_out(slot5, t, 1, -1)
		slot8 = current_alpha

		self._object.set_alpha(t, self._object)

		local current_bottom_distance = Easing.quartic_out(t, t, 0, HUDDriving.BOTTOM_DISTANCE_WHILE_HIDDEN)
		slot11 = self._object
		slot11 = self._object.parent(duration)
		slot9 = self._object.parent(duration).h(duration) - current_bottom_distance

		self._object.set_bottom(t, self._object)
	end

	slot6 = 0

	self._object.set_alpha(slot4, self._object)

	slot8 = self._object
	slot8 = self._object.parent(slot7)
	slot6 = self._object.parent(slot7).h(slot7) - HUDDriving.BOTTOM_DISTANCE_WHILE_HIDDEN

	self._object.set_bottom(slot4, self._object)

	slot6 = false

	self._object.set_visible(slot4, self._object)

	slot5 = self

	self._on_hidden(slot4)

	return 
end
function HUDDriving:_animate_refresh_seats()
	local fade_out_duration = 0.2
	slot4 = self._button_prompts_panel
	local t = (1 - self._button_prompts_panel.alpha(slot3)) * fade_out_duration

	while t < fade_out_duration do
		local dt = coroutine.yield()
		t = t + dt
		slot9 = fade_out_duration
		local current_alpha = Easing.quartic_in_out(slot5, t, 1, -1)
		slot8 = current_alpha

		self._button_prompts_panel.set_alpha(t, self._button_prompts_panel)
	end

	slot6 = 0

	self._button_prompts_panel.set_alpha(slot4, self._button_prompts_panel)

	slot5 = self

	self._create_current_seat_prompts(slot4)

	local fade_in_duration = 0.2
	local t = 0

	while t < fade_in_duration do
		local dt = coroutine.yield()
		t = t + dt
		slot11 = fade_in_duration
		local current_alpha = Easing.quartic_in_out(slot7, t, 0, 1)
		slot10 = current_alpha

		self._button_prompts_panel.set_alpha(t, self._button_prompts_panel)
	end

	slot8 = 1

	self._button_prompts_panel.set_alpha(slot6, self._button_prompts_panel)

	return 
end

return 
