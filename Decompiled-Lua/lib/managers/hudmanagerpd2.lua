-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreEvent"

core.import(slot1, core)

slot2 = "lib/managers/hud/HUDTeammateBase"

require(slot1)

slot2 = "lib/managers/hud/HUDTeammatePlayer"

require(slot1)

slot2 = "lib/managers/hud/HUDTeammateAI"

require(slot1)

slot2 = "lib/managers/hud/HUDTeammatePeer"

require(slot1)

slot2 = "lib/managers/hud/HUDWeaponBase"

require(slot1)

slot2 = "lib/managers/hud/HUDWeaponGeneric"

require(slot1)

slot2 = "lib/managers/hud/HUDWeaponGrenade"

require(slot1)

slot2 = "lib/managers/hud/HUDEquipment"

require(slot1)

slot2 = "lib/managers/hud/HUDInteraction"

require(slot1)

slot2 = "lib/managers/hud/HUDCardDetails"

require(slot1)

slot2 = "lib/managers/hud/HUDMapWaypoint"

require(slot1)

slot2 = "lib/managers/hud/HUDMapPlayerPin"

require(slot1)

slot2 = "lib/managers/hud/HUDMapBase"

require(slot1)

slot2 = "lib/managers/hud/HUDMapTab"

require(slot1)

slot2 = "lib/managers/hud/HUDTabGreedBar"

require(slot1)

slot2 = "lib/managers/hud/HUDTabWeaponChallenge"

require(slot1)

slot2 = "lib/managers/hud/HUDTabScreen"

require(slot1)

slot2 = "lib/managers/hud/HUDNameLabel"

require(slot1)

slot2 = "lib/managers/hud/HUDNameVehicleLabel"

require(slot1)

slot2 = "lib/managers/hud/HUDObjectives"

require(slot1)

slot2 = "lib/managers/hud/HUDObjectivesTab"

require(slot1)

slot2 = "lib/managers/hud/HUDObjectiveBase"

require(slot1)

slot2 = "lib/managers/hud/HUDObjectiveSub"

require(slot1)

slot2 = "lib/managers/hud/HUDObjectiveMain"

require(slot1)

slot2 = "lib/managers/hud/HUDObjectiveDescription"

require(slot1)

slot2 = "lib/managers/hud/HUDToastNotification"

require(slot1)

slot2 = "lib/managers/hud/HUDCarry"

require(slot1)

slot2 = "lib/managers/hud/HUDChat"

require(slot1)

slot2 = "lib/managers/hud/HUDChatMessage"

require(slot1)

slot2 = "lib/managers/hud/HUDDriving"

require(slot1)

slot2 = "lib/managers/hud/HUDHitConfirm"

require(slot1)

slot2 = "lib/managers/hud/HUDHitDirection"

require(slot1)

slot2 = "lib/managers/hud/HUDSuspicion"

require(slot1)

slot2 = "lib/managers/hud/HUDSuspicionIndicator"

require(slot1)

slot2 = "lib/managers/hud/HUDSuspicionDirection"

require(slot1)

slot2 = "lib/managers/hud/HUDPlayerCustody"

require(slot1)

slot2 = "lib/managers/hud/HUDCenterPrompt"

require(slot1)

slot2 = "lib/managers/hud/HUDBigPrompt"

require(slot1)

slot2 = "lib/managers/hud/HUDSpecialInteraction"

require(slot1)

slot2 = "lib/managers/hud/HUDMultipleChoiceWheel"

require(slot1)
require(slot1)

HUDManager.disabled = {}
slot3 = "guis/player_hud"
slot3 = Idstring("lib/managers/hud/HUDTurret")
HUDManager.disabled[Idstring("lib/managers/hud/HUDTurret").key("lib/managers/hud/HUDTurret")] = true
slot3 = "guis/experience_hud"
slot3 = Idstring(true)
HUDManager.disabled[Idstring(true).key(true)] = true
HUDManager.PLAYER_PANEL = 4
HUDManager.TEAMMATE_PANEL_W = 384
HUDManager.TEAMMATE_PANEL_DISTANCE = 32
HUDManager.AI_TEAMMATE_PANEL_PADDING = 18
HUDManager.PEER_TEAMMATE_PANEL_PADDING = 10
HUDManager.WEAPONS_PANEL_W = 384
HUDManager.WEAPONS_PANEL_H = 84
HUDManager.CHAT_DISTANCE_FROM_BOTTOM = 128
function HUDManager:controller_mod_changed()
	slot5 = managers.interaction

	if alive(managers.interaction.active_unit(slot4)) then
		slot3 = managers.interaction
		slot3 = managers.interaction.active_unit(slot2)
		slot3 = managers.interaction.active_unit(slot2).interaction(slot2)

		managers.interaction.active_unit(slot2).interaction(slot2).selected(slot2)
	end

	return 
end
function HUDManager:add_weapon(data)
	self._hud.weapons[data.inventory_index] = {
		inventory_index = data.inventory_index,
		unit = data.unit
	}
	slot4 = data.unit
	slot4 = data.unit.base(data.inventory_index)
	local tweak_data = data.unit.base(data.inventory_index).weapon_tweak_data(data.inventory_index)

	if tweak_data.hud and self._weapon_panels[data.inventory_index] and self._weapon_panels[data.inventory_index] then
		slot5 = self._weapon_panels[data.inventory_index]

		if self._weapon_panels[data.inventory_index].name_id(data.inventory_index) ~= tweak_data.name_id then
			if self._weapon_panels[data.inventory_index] then
				slot5 = self._weapon_panels[data.inventory_index]

				self._weapon_panels[data.inventory_index].destroy(data.inventory_index)
			end

			self._weapon_panels[data.inventory_index] = nil
			slot6 = PlayerBase.INGAME_HUD_SAFERECT
			slot6 = "weapons_panel"
			local weapons_panel = managers.hud.script(data.inventory_index, managers.hud).panel.child(data.inventory_index, managers.hud.script(data.inventory_index, managers.hud).panel)
			local panel_class = (tweak_data.hud and tweak_data.hud.panel_class and self._weapon_panel_classes[tweak_data.hud.panel_class]) or HUDWeaponGeneric
			slot12 = tweak_data
			self._weapon_panels[data.inventory_index] = panel_class.new(slot8, panel_class, data.inventory_index, weapons_panel)
			slot7 = self

			self._layout_weapon_panels(data.inventory_index)
		end
	end

	if data.is_equip then
		slot6 = data.inventory_index

		self.set_weapon_selected_by_inventory_index(slot4, self)
	end

	if not data.is_equip and (data.inventory_index == 1 or data.inventory_index == 2) then
		slot7 = data.unit

		self._update_second_weapon_ammo_info(slot4, self, HUDManager.PLAYER_PANEL)
	end

	return 
end
function HUDManager:_layout_weapon_panels()
	slot4 = PlayerBase.INGAME_HUD_SAFERECT
	slot4 = "weapons_panel"
	local weapons_panel = managers.hud.script(slot2, managers.hud).panel.child(slot2, managers.hud.script(slot2, managers.hud).panel)
	local right = weapons_panel.w(managers.hud.script(slot2, managers.hud).panel)
	slot5 = weapons_panel
	local bottom = weapons_panel.h(weapons_panel)
	local w = 0

	for i = #self._weapon_panels, 1, -1 do
		if i ~= 2 then
			slot14 = self._weapon_panels[i]
			slot12 = right - self._weapon_panels[i].w(slot13)

			self._weapon_panels[i].set_x(slot10, self._weapon_panels[i])

			slot14 = self._weapon_panels[i]
			slot12 = bottom - self._weapon_panels[i].h(slot13)

			self._weapon_panels[i].set_y(slot10, self._weapon_panels[i])

			slot11 = self._weapon_panels[i]
			right = right - self._weapon_panels[i].w(slot10)
			slot11 = self._weapon_panels[i]
			w = w + self._weapon_panels[i].w(slot10)
		end
	end

	if self._weapon_panels[2] then
		slot10 = self._weapon_panels[2]
		slot8 = right - self._weapon_panels[2].w(slot9)

		self._weapon_panels[2].set_x(slot6, self._weapon_panels[2])

		slot10 = self._weapon_panels[2]
		slot8 = bottom - self._weapon_panels[2].h(slot9)

		self._weapon_panels[2].set_y(slot6, self._weapon_panels[2])

		slot7 = self._weapon_panels[2]
		right = right - self._weapon_panels[2].w(slot6)
		slot7 = self._weapon_panels[2]
		w = w + self._weapon_panels[2].w(slot6)
	end

	slot8 = w

	weapons_panel.set_w(slot6, weapons_panel)

	slot7 = weapons_panel
	slot10 = weapons_panel
	slot10 = weapons_panel.parent(slot9)

	weapons_panel.set_right(slot6, weapons_panel.parent(slot9).w(slot9))

	slot7 = weapons_panel
	slot10 = weapons_panel
	slot10 = weapons_panel.parent(slot9)

	weapons_panel.set_bottom(slot6, weapons_panel.parent(slot9).h(slot9))

	return 
end
function HUDManager:set_weapon_selected_by_inventory_index(inventory_index)
	slot5 = inventory_index

	self._set_weapon_selected(slot3, self)

	return 
end
function HUDManager:_set_weapon_selected(id)
	self._hud.selected_weapon = id
	slot4 = self._hud.weapons[self._hud.selected_weapon].unit
	slot4 = self._hud.weapons[self._hud.selected_weapon].unit.base(self._hud.selected_weapon)

	if self._hud.weapons[self._hud.selected_weapon].unit.base(self._hud.selected_weapon).weapon_tweak_data(self._hud.selected_weapon).hud then
		slot4 = self._hud.weapons[self._hud.selected_weapon].unit
		slot4 = self._hud.weapons[self._hud.selected_weapon].unit.base(self._hud.selected_weapon)
		local icon = self._hud.weapons[self._hud.selected_weapon].unit.base(self._hud.selected_weapon).weapon_tweak_data(self._hud.selected_weapon).hud.icon
	end

	slot8 = icon

	self._set_teammate_weapon_selected(slot4, self, HUDManager.PLAYER_PANEL, id)

	return 
end
function HUDManager:_set_teammate_weapon_selected(i, id, icon)
	if i ~= HUDManager.PLAYER_PANEL then
		return 
	end

	for j = 1, #self._weapon_panels, 1 do
		if j == id then
			slot11 = true

			self._weapon_panels[j].set_selected(slot9, self._weapon_panels[j])
		else
			slot11 = false

			self._weapon_panels[j].set_selected(slot9, self._weapon_panels[j])
		end
	end

	return 
end
function HUDManager:unselect_all_weapons()
	for i = 1, #self._weapon_panels, 1 do
		slot8 = false

		self._weapon_panels[i].set_selected(slot6, self._weapon_panels[i])
	end

	return 
end
function HUDManager:recreate_weapon_firemode(i)
	return 
end
function HUDManager:set_teammate_weapon_firemode(i, id, firemode)
	if i == HUDManager.PLAYER_PANEL then
		slot7 = firemode

		self._weapon_panels[id].set_firemode(slot5, self._weapon_panels[id])
	end

	return 
end
function HUDManager:set_firemode_for_weapon(weapon_name_id, firemode)
	for i = 1, #self._weapon_panels, 1 do
		slot9 = self._weapon_panels[i]
		local panel_name_id = self._weapon_panels[i].name_id(slot8)

		if panel_name_id and panel_name_id == weapon_name_id then
			slot11 = firemode

			self._weapon_panels[i].set_firemode(slot9, self._weapon_panels[i])

			return 
		end
	end

	return 
end
function HUDManager:set_ammo_amount(selection_index, max_clip, current_clip, current_left, max)
	if 2 < selection_index then
		return 
	end

	slot13 = max

	managers.player.update_synced_ammo_info_to_peers(slot7, managers.player, selection_index, max_clip, current_clip, current_left)

	slot14 = max

	self.set_teammate_ammo_amount(slot7, self, HUDManager.PLAYER_PANEL, selection_index, max_clip, current_clip, current_left)

	return 
end
function HUDManager:set_teammate_ammo_amount(id, selection_index, max_clip, current_clip, current_left, max)
	local type = (selection_index == 1 and "secondary") or "primary"
	slot11 = max_clip

	self._weapon_panels[selection_index].set_max_clip(slot9, self._weapon_panels[selection_index])

	slot11 = current_clip

	self._weapon_panels[selection_index].set_current_clip(slot9, self._weapon_panels[selection_index])

	slot11 = max

	self._weapon_panels[selection_index].set_max(slot9, self._weapon_panels[selection_index])

	local total_ammo_without_current_clip = current_left - current_clip

	if total_ammo_without_current_clip < 0 then
		total_ammo_without_current_clip = 0
	end

	slot12 = total_ammo_without_current_clip

	self._weapon_panels[selection_index].set_current_left(slot10, self._weapon_panels[selection_index])

	return 
end
function HUDManager:set_weapon_ammo_by_unit(unit)
	local second_weapon_index = (self._hud.selected_weapon == 1 and 2) or 1
	slot5 = unit
	slot5 = unit.base(slot4)

	if second_weapon_index == unit.base(slot4).weapon_tweak_data(slot4).use_data.selection_index then
		slot7 = unit

		self._update_second_weapon_ammo_info(slot4, self, HUDManager.PLAYER_PANEL)
	end

	return 
end
function HUDManager:_update_second_weapon_ammo_info(i, unit)
	return 
end
function HUDManager:set_player_panel_character_data(data)
	slot5 = data

	self._teammate_panels[HUDManager.PLAYER_PANEL].set_character_data(HUDManager.PLAYER_PANEL, self._teammate_panels[HUDManager.PLAYER_PANEL])

	return 
end
function HUDManager:refresh_player_panel()
	slot3 = self._teammate_panels[HUDManager.PLAYER_PANEL]

	self._teammate_panels[HUDManager.PLAYER_PANEL].refresh(HUDManager.PLAYER_PANEL)

	return 
end
function HUDManager:reset_player_state()
	slot4 = HUDManager.PLAYER_PANEL

	self.reset_teammate_state(slot2, self)

	return 
end
function HUDManager:reset_player_panel_states()
	for i = 1, #self._teammate_panels, 1 do
		slot8 = i

		self.reset_teammate_state(slot6, self)
	end

	return 
end
function HUDManager:reset_teammate_state(i)
	slot4 = self._teammate_panels[i]

	self._teammate_panels[i].reset_state(slot3)

	return 
end
function HUDManager:set_player_health(data)
	slot6 = data

	self.set_teammate_health(slot3, self, HUDManager.PLAYER_PANEL)

	return 
end
function HUDManager:set_teammate_health(i, data)
	if self._teammate_panels[i] then
		slot6 = data

		self._teammate_panels[i].set_health(slot4, self._teammate_panels[i])
	else
		slot5 = "[ HUDManager:set_teammate_health ] teammate panel " .. tostring(slot7) .. " doesn't exist!"

		debug_pause(slot4)

		slot6 = "data:"
		slot9 = data

		Application.error(slot4, Application, inspect(i))

		slot6 = "teammate panels:"
		slot9 = self._teammate_panels

		Application.error(slot4, Application, inspect(i))

		slot5 = Application

		Application.error(slot4, debug.traceback())
	end

	return 
end
function HUDManager:set_player_warcry_meter_fill(data)
	slot6 = data

	self.set_teammate_warcry_meter_fill(slot3, self, HUDManager.PLAYER_PANEL)

	return 
end
function HUDManager:set_teammate_warcry_meter_fill(i, data)
	slot6 = data

	self._teammate_panels[i].set_warcry_meter_fill(slot4, self._teammate_panels[i])

	return 
end
function HUDManager:set_player_warcry_meter_glow(value)
	slot6 = value

	self.set_warcry_meter_glow(slot3, self, HUDManager.PLAYER_PANEL)

	return 
end
function HUDManager:set_player_active_warcry(warcry)
	slot7 = warcry

	self.set_teammate_active_warcry(slot3, self, HUDManager.PLAYER_PANEL, nil)

	return 
end
function HUDManager:set_teammate_active_warcry(i, name_label_id, warcry)
	slot7 = warcry

	self._teammate_panels[i].set_active_warcry(slot5, self._teammate_panels[i])

	slot7 = name_label_id
	local name_label = self._get_name_label(slot5, self)

	if name_label then
		slot8 = warcry

		name_label.set_warcry(slot6, name_label)
	end

	return 
end
function HUDManager:set_warcry_meter_glow(i, value)
	slot6 = value

	self._teammate_panels[i].set_warcry_ready(slot4, self._teammate_panels[i])

	return 
end
function HUDManager:activate_teammate_warcry(i, name_label_id, duration)
	slot7 = duration

	self._teammate_panels[i].activate_warcry(slot5, self._teammate_panels[i])

	slot7 = name_label_id
	local name_label = self._get_name_label(slot5, self)

	if name_label then
		slot7 = name_label

		name_label.activate_warcry(slot6)
	end

	return 
end
function HUDManager:deactivate_player_warcry()
	slot4 = false

	self.set_player_warcry_meter_glow(slot2, self)

	slot4 = "warcry"

	self.remove_comm_wheel_option(slot2, self)

	slot4 = "warcry_active_stop"

	self._sound_source.post_event(slot2, self._sound_source)

	slot3 = self

	self.hide_big_prompt(slot2)

	slot5 = nil

	self.deactivate_teammate_warcry(slot2, self, HUDManager.PLAYER_PANEL)

	return 
end
function HUDManager:deactivate_teammate_warcry(i, name_label_id)
	slot5 = self._teammate_panels[i]

	self._teammate_panels[i].deactivate_warcry(slot4)

	slot6 = name_label_id
	local name_label = self._get_name_label(slot4, self)

	if name_label then
		slot6 = name_label

		name_label.deactivate_warcry(slot5)
	end

	return 
end
function HUDManager:set_player_level(level)
	slot6 = level

	self.set_teammate_level(slot3, self, HUDManager.PLAYER_PANEL)

	return 
end
function HUDManager:set_teammate_level(i, level)
	slot6 = level

	self._teammate_panels[i].set_level(slot4, self._teammate_panels[i])

	return 
end
function HUDManager:show_teammate_turret_icon(teammate_panel_id, name_label_id)
	local panel = self._teammate_panels[teammate_panel_id]

	if panel ~= nil then
		slot6 = panel

		panel.show_turret_icon(slot5)
	end

	slot7 = name_label_id
	local name_label = self._get_name_label(slot5, self)

	if name_label then
		slot7 = name_label

		name_label.show_turret_icon(slot6)
	end

	return 
end
function HUDManager:hide_teammate_turret_icon(teammate_panel_id, name_label_id)
	local panel = self._teammate_panels[teammate_panel_id]

	if panel ~= nil then
		slot6 = panel

		panel.hide_turret_icon(slot5)
	end

	slot7 = name_label_id
	local name_label = self._get_name_label(slot5, self)

	if name_label then
		slot7 = name_label

		name_label.hide_turret_icon(slot6)
	end

	return 
end
function HUDManager:set_player_armor(data)
	return 
end
function HUDManager:set_teammate_armor(i, data)
	return 
end
function HUDManager:set_teammate_name(i, teammate_name)
	local is_local_player = i == HUDManager.PLAYER_PANEL
	slot8 = is_local_player

	self._teammate_panels[i].set_name(slot5, self._teammate_panels[i], teammate_name)

	return 
end
function HUDManager:set_player_nationality(nationality)
	slot6 = nationality

	self.set_teammate_nationality(slot3, self, HUDManager.PLAYER_PANEL)

	return 
end
function HUDManager:set_teammate_nationality(i, nationality)
	slot6 = nationality

	self._teammate_panels[i].set_nationality(slot4, self._teammate_panels[i])

	return 
end
function HUDManager:add_special_equipment(data)
	slot6 = data

	self.add_teammate_special_equipment(slot3, self, HUDManager.PLAYER_PANEL)

	return 
end
function HUDManager:add_teammate_special_equipment(i, data)
	if not i then
		slot6 = "[HUDManager][add_teammate_special_equipment] - Didn't get a teammate panel number"

		Application.error(slot4, Application)

		slot5 = Application

		Application.stack_dump(slot4)

		return 
	end

	slot6 = data

	self._teammate_panels[i].add_special_equipment(slot4, self._teammate_panels[i])

	return 
end
function HUDManager:remove_special_equipment(equipment)
	slot6 = equipment

	self.remove_teammate_special_equipment(slot3, self, HUDManager.PLAYER_PANEL)

	return 
end
function HUDManager:remove_teammate_special_equipment(panel_id, equipment)
	slot6 = equipment

	self._teammate_panels[panel_id].remove_special_equipment(slot4, self._teammate_panels[panel_id])

	return 
end
function HUDManager:set_special_equipment_amount(equipment_id, amount)
	slot8 = amount

	self.set_teammate_special_equipment_amount(slot4, self, HUDManager.PLAYER_PANEL, equipment_id)

	return 
end
function HUDManager:set_teammate_special_equipment_amount(i, equipment_id, amount)
	slot8 = amount

	self._teammate_panels[i].set_special_equipment_amount(slot5, self._teammate_panels[i], equipment_id)

	return 
end
function HUDManager:clear_player_special_equipments()
	slot3 = self._teammate_panels[HUDManager.PLAYER_PANEL]

	self._teammate_panels[HUDManager.PLAYER_PANEL].clear_special_equipment(HUDManager.PLAYER_PANEL)

	return 
end
function HUDManager:set_stored_health(stored_health_ratio)
	return 
end
function HUDManager:set_stored_health_max(stored_health_ratio)
	return 
end
function HUDManager:add_item(data)
	return 
end
function HUDManager:set_deployable_equipment(i, data)
	return 
end
function HUDManager:set_item_amount(index, amount)
	return 
end
function HUDManager:set_teammate_deployable_equipment_amount(i, index, data)
	return 
end
function HUDManager:set_teammate_grenades(i, data)
	if i == HUDManager.PLAYER_PANEL then
		slot6 = data.amount

		self._weapon_panels[3].set_amount(slot4, self._weapon_panels[3])
	end

	return 
end
function HUDManager:set_teammate_grenades_amount(i, data)
	if i == HUDManager.PLAYER_PANEL then
		slot6 = data.amount

		self._weapon_panels[3].set_amount(slot4, self._weapon_panels[3])
	end

	return 
end
function HUDManager:set_player_condition(icon_data, text)
	slot8 = text

	self.set_teammate_condition(slot4, self, HUDManager.PLAYER_PANEL, icon_data)

	return 
end
function HUDManager:set_teammate_condition(i, icon_data, text)
	if not i then
		slot6 = "Didn't get a number"

		print(slot5)

		slot6 = Application

		Application.stack_dump(slot5)

		return 
	end

	slot8 = text

	self._teammate_panels[i].set_condition(slot5, self._teammate_panels[i], icon_data)

	return 
end
function HUDManager:on_teammate_downed(teammate_panel_id, name_label_id)
	local teammate_panel = self._teammate_panels[teammate_panel_id]

	if teammate_panel then
		slot6 = self._teammate_panels[teammate_panel_id]

		self._teammate_panels[teammate_panel_id].go_into_bleedout(slot5)
	end

	slot7 = name_label_id
	local name_label = self._get_name_label(slot5, self)

	if name_label then
		slot7 = name_label

		name_label.go_into_bleedout(slot6)
	end

	return 
end
function HUDManager:on_teammate_revived(teammate_panel_id, name_label_id)
	local teammate_panel = self._teammate_panels[teammate_panel_id]

	if teammate_panel then
		slot6 = self._teammate_panels[teammate_panel_id]

		self._teammate_panels[teammate_panel_id].on_revived(slot5)
	end

	slot7 = name_label_id
	local name_label = self._get_name_label(slot5, self)

	if name_label then
		slot7 = name_label

		name_label.on_revived(slot6)
	end

	return 
end
function HUDManager:on_teammate_died(teammate_panel_id, name_label_id)
	local teammate_panel = self._teammate_panels[teammate_panel_id]

	if teammate_panel then
		slot6 = self._teammate_panels[teammate_panel_id]

		self._teammate_panels[teammate_panel_id].on_died(slot5)
	end

	return 
end
function HUDManager:on_teammate_start_lockpicking(teammate_panel_id, name_label_id)
	local teammate_panel = self._teammate_panels[teammate_panel_id]

	if teammate_panel then
		slot6 = self._teammate_panels[teammate_panel_id]

		self._teammate_panels[teammate_panel_id].show_lockpick_icon(slot5)
	end

	slot7 = name_label_id
	local name_label = self._get_name_label(slot5, self)

	if name_label then
		slot7 = name_label

		name_label.show_lockpick_icon(slot6)
	end

	return 
end
function HUDManager:on_teammate_stop_lockpicking(teammate_panel_id, name_label_id)
	local teammate_panel = self._teammate_panels[teammate_panel_id]

	if teammate_panel then
		slot6 = self._teammate_panels[teammate_panel_id]

		self._teammate_panels[teammate_panel_id].hide_lockpick_icon(slot5)
	end

	slot7 = name_label_id
	local name_label = self._get_name_label(slot5, self)

	if name_label then
		slot7 = name_label

		name_label.hide_lockpick_icon(slot6)
	end

	return 
end
function HUDManager:set_teammate_carry_info(teammate_panel_id, name_label_id, carry_id)
	if teammate_panel_id and self._teammate_panels[teammate_panel_id] and teammate_panel_id ~= HUDManager.PLAYER_PANEL then
		slot7 = carry_id

		self._teammate_panels[teammate_panel_id].set_carry_info(slot5, self._teammate_panels[teammate_panel_id])
	end

	slot7 = name_label_id
	local name_label = self._get_name_label(slot5, self)

	if name_label then
		slot8 = carry_id

		name_label.set_carry_info(slot6, name_label)
	end

	return 
end
function HUDManager:remove_teammate_carry_info(teammate_panel_id, name_label_id)
	if teammate_panel_id and self._teammate_panels[teammate_panel_id] and teammate_panel_id ~= HUDManager.PLAYER_PANEL then
		slot5 = self._teammate_panels[teammate_panel_id]

		self._teammate_panels[teammate_panel_id].remove_carry_info(slot4)
	end

	slot6 = name_label_id
	local name_label = self._get_name_label(slot4, self)

	if name_label then
		slot6 = name_label

		name_label.remove_carry_info(slot5)
	end

	return 
end
function HUDManager:start_player_timer(time)
	slot7 = time

	self.start_teammate_timer(slot3, self, HUDManager.PLAYER_PANEL, nil)

	return 
end
function HUDManager:start_teammate_timer(i, name_label_id, time, current)
	slot9 = current

	self._teammate_panels[i].start_timer(slot6, self._teammate_panels[i], time)

	slot8 = name_label_id
	local name_label = self._get_name_label(slot6, self)

	if name_label then
		slot10 = current

		name_label.start_timer(slot7, name_label, time)
	end

	return 
end
function HUDManager:is_teammate_timer_running(i)
	slot4 = self._teammate_panels[i]

	return self._teammate_panels[i].is_timer_running(slot3)
end
function HUDManager:pause_player_timer(pause)
	slot7 = pause

	self.pause_teammate_timer(slot3, self, HUDManager.PLAYER_PANEL, nil)

	return 
end
function HUDManager:pause_teammate_timer(i, name_label_id, pause)
	slot7 = pause

	self._teammate_panels[i].set_pause_timer(slot5, self._teammate_panels[i])

	slot7 = name_label_id
	local name_label = self._get_name_label(slot5, self)

	if name_label then
		slot8 = pause

		name_label.set_pause_timer(slot6, name_label)
	end

	return 
end
function HUDManager:stop_player_timer()
	slot5 = nil

	self.stop_teammate_timer(slot2, self, HUDManager.PLAYER_PANEL)

	return 
end
function HUDManager:stop_teammate_timer(i, name_label_id)
	if self._teammate_panels[i] then
		slot5 = self._teammate_panels[i]

		self._teammate_panels[i].stop_timer(slot4)
	end

	slot6 = name_label_id
	local name_label = self._get_name_label(slot4, self)

	if name_label then
		slot6 = name_label

		name_label.stop_timer(slot5)
	end

	return 
end
function HUDManager:_setup_ingame_hud_saferect()
	slot4 = "[HUDManager]_setup_ingame_hud_saferect"

	Application.trace(slot2, Application)

	slot4 = PlayerBase.INGAME_HUD_SAFERECT

	if not self.alive(slot2, self) then
		return 
	end

	slot4 = PlayerBase.INGAME_HUD_SAFERECT
	local hud = managers.hud.script(slot2, managers.hud)
	slot5 = hud

	self._create_teammates_panel(managers.hud, self)

	slot5 = hud

	self._create_weapons_panel(managers.hud, self)

	slot5 = hud

	self._create_present_panel(managers.hud, self)

	slot5 = hud

	self._create_interaction(managers.hud, self)

	slot4 = self

	self._create_pd_progress(managers.hud)

	slot5 = hud

	self._create_progress_timer(managers.hud, self)

	slot5 = hud

	self._create_objectives(managers.hud, self)

	slot5 = hud

	self._create_suspicion(managers.hud, self)

	slot5 = hud

	self._create_hit_confirm(managers.hud, self)

	slot5 = hud

	self._create_hit_direction(managers.hud, self)

	slot5 = hud

	self._create_center_prompt(managers.hud, self)

	slot5 = hud

	self._create_big_prompt(managers.hud, self)

	slot5 = hud

	self._create_suspicion_direction(managers.hud, self)

	slot5 = hud

	self._create_turret_hud(managers.hud, self)

	slot5 = hud

	self._create_carry(managers.hud, self)

	slot4 = self

	self._setup_driving_hud(managers.hud)

	slot4 = self

	self._create_custody_hud(managers.hud)

	slot4 = self

	self._create_hud_chat(managers.hud)

	slot4 = self

	self._setup_tab_screen(managers.hud)

	slot4 = self

	self._get_tab_objectives(managers.hud)

	return 
end
function HUDManager:_create_ammo_test()
	slot4 = PlayerBase.INGAME_HUD_SAFERECT
	local hud = managers.hud.script(slot2, managers.hud)
	slot5 = "ammo_test"

	if hud.panel.child(managers.hud, hud.panel) then
		slot4 = hud.panel
		slot8 = "ammo_test"

		hud.panel.remove(slot3, hud.panel.child(slot6, hud.panel))
	end

	slot5 = {
		name = "ammo_test",
		h = 4,
		y = 200,
		w = 100,
		x = 550
	}
	local panel = hud.panel.panel(slot3, hud.panel)
	slot8 = hud.panel
	slot6 = hud.panel.h(slot7) / 2 - 40

	panel.set_center_y(hud.panel, panel)

	slot6 = hud.panel.w(slot7) / 2

	panel.set_center_x(hud.panel, panel)

	slot6 = {
		name = "ammo_test_bg_rect",
		color = Color.black.with_alpha(hud.panel, Color.black)
	}
	slot10 = 0.5

	panel.rect(hud.panel, panel)

	slot6 = {
		name = "ammo_test_rect",
		layer = 1,
		color = Color.white
	}

	panel.rect(hud.panel, panel)

	return 
end
function HUDManager:hud_chat()
	return self._hud_chat
end
function HUDManager:_create_hud_chat()
	slot4 = PlayerBase.INGAME_HUD_SAFERECT
	local hud_ingame = managers.hud.script(slot2, managers.hud)
	slot5 = IngameWaitingForRespawnState.GUI_SPECTATOR
	local hud_respawn = managers.hud.script(managers.hud, managers.hud)

	if self._hud_chat_ingame then
		slot5 = self._hud_chat_ingame

		self._hud_chat_ingame.remove(slot4)
	end

	slot8 = true
	self._hud_chat_ingame = HUDChat.new(slot4, HUDChat, self._saferect, hud_ingame.panel)
	slot8 = hud_ingame.panel
	slot6 = hud_ingame.panel.h(hud_ingame.panel) - HUDManager.CHAT_DISTANCE_FROM_BOTTOM

	self._hud_chat_ingame.set_bottom(slot4, self._hud_chat_ingame)

	slot5 = self._hud_chat_ingame

	self._hud_chat_ingame.hide(slot4)

	slot5 = self._hud_chat_ingame

	self._hud_chat_ingame.unregister(slot4)

	if self._hud_chat_respawn then
		slot5 = self._hud_chat_respawn

		self._hud_chat_respawn.remove(slot4)
	end

	slot8 = true
	self._hud_chat_respawn = HUDChat.new(slot4, HUDChat, self._saferect, hud_respawn.panel)
	slot8 = hud_respawn.panel
	slot6 = hud_respawn.panel.h(hud_respawn.panel) - HUDManager.CHAT_DISTANCE_FROM_BOTTOM

	self._hud_chat_respawn.set_bottom(slot4, self._hud_chat_respawn)

	slot5 = self._hud_chat_respawn

	self._hud_chat_respawn.hide(slot4)

	slot5 = self._hud_chat_respawn

	self._hud_chat_respawn.unregister(slot4)

	self._hud_chat = self._hud_chat_ingame

	return 
end
function HUDManager:mark_cheater(peer_id)
	if NetworkPeer.CHEAT_CHECKS_DISABLED == true then
		return 
	end

	slot4 = self._hud.teammate_panels_data

	for i, data in ipairs(slot3) do
		slot9 = self._teammate_panels[i]

		if self._teammate_panels[i].peer_id(slot8) == peer_id then
			slot10 = true

			self._teammate_panels[i].set_cheater(slot8, self._teammate_panels[i])

			break
		end
	end

	return 
end
function HUDManager:add_teammate_panel(character_name, player_name, ai, peer_id)
	slot7 = self._hud.teammate_panels_data

	for i, data in ipairs(slot6) do
		if not data.taken then
			if i ~= HUDManager.PLAYER_PANEL then
				slot12 = self._ai_teammate_panels[i]

				self._ai_teammate_panels[i].hide(slot11)

				slot12 = self._peer_teammate_panels[i]

				self._peer_teammate_panels[i].hide(slot11)

				self._teammate_panels[i] = (ai and self._ai_teammate_panels[i]) or self._peer_teammate_panels[i]
			end

			slot12 = self._teammate_panels[i]

			self._teammate_panels[i].reset_state(slot11)

			slot12 = self._teammate_panels[i]

			self._teammate_panels[i].show(slot11)

			slot13 = peer_id

			self._teammate_panels[i].set_peer_id(slot11, self._teammate_panels[i])

			slot14 = player_name

			self.set_teammate_name(slot11, self, i)

			slot14 = character_name

			self.set_teammate_nationality(slot11, self, i)

			if peer_id then
				slot13 = peer_id
				local peer_equipment = managers.player.get_synced_equipment_possession(slot11, managers.player) or {}
				slot13 = peer_equipment

				for equipment, amount in pairs(slot12) do
					slot20 = {
						id = equipment,
						icon = tweak_data.equipments.specials[equipment].icon,
						amount = amount
					}

					self.add_teammate_special_equipment(slot17, self, i)
				end

				slot14 = peer_id
				local peer_deployable_equipment = managers.player.get_synced_deployable_equipment(slot12, managers.player)

				if peer_deployable_equipment then
					local icon = tweak_data.equipments[peer_deployable_equipment.deployable].icon
					slot17 = {
						icon = icon,
						amount = peer_deployable_equipment.amount
					}

					self.set_deployable_equipment(slot14, self, i)
				end

				slot15 = peer_id
				local peer_grenades = managers.player.get_synced_grenades(slot13, managers.player)

				if peer_grenades then
					slot13 = tweak_data.projectiles[peer_grenades.grenade].icon
				end

				slot15 = managers.network
				slot16 = peer_id
				local peer = managers.network.session(slot14).peer(slot14, managers.network.session(slot14))
				slot16 = self._teammate_panels[i]
				slot19 = peer

				self._teammate_panels[i].set_level(managers.network.session(slot14), peer.level(slot18))

				slot16 = Network

				if Network.is_server(managers.network.session(slot14)) then
					slot16 = self._teammate_panels[HUDManager.PLAYER_PANEL]

					self._teammate_panels[HUDManager.PLAYER_PANEL].show_host_indicator(HUDManager.PLAYER_PANEL)
				else
					slot16 = peer

					if peer.is_host(slot15) then
						slot16 = self._teammate_panels[i]

						self._teammate_panels[i].show_host_indicator(slot15)
					end
				end
			end

			slot13 = character_name
			local unit = managers.criminals.character_unit_by_name(slot11, managers.criminals)
			slot13 = unit

			if alive(managers.criminals) then
				slot13 = unit
				local weapon = unit.inventory(slot12).equipped_unit(slot12)
				slot14 = weapon

				if alive(unit.inventory(slot12)) then
					slot14 = weapon
					local icon = weapon.base(slot13).weapon_tweak_data(slot13).hud_icon
					slot15 = unit
					local equipped_selection = unit.inventory(weapon.base(slot13)).equipped_selection(weapon.base(slot13))
					slot19 = icon

					self._set_teammate_weapon_selected(unit.inventory(weapon.base(slot13)), self, i, equipped_selection)
				end
			else
				slot14 = i

				self.on_teammate_died(slot12, self)
			end

			slot14 = peer_id
			local peer_carry_data = managers.player.get_synced_carry(slot12, managers.player)

			if peer_carry_data then
				slot14 = managers.network
				slot15 = peer_id
				slot14 = managers.network.session(slot13).peer(slot13, managers.network.session(slot13))
				slot14 = managers.network.session(slot13).peer(slot13, managers.network.session(slot13)).unit(slot13)
				local unit_data = managers.network.session(slot13).peer(slot13, managers.network.session(slot13)).unit(slot13).unit_data(slot13)
				local name_label_id = nil

				if unit_data.name_label_id then
					name_label_id = unit_data.name_label_id
				end

				slot19 = peer_carry_data.carry_id

				self.set_teammate_carry_info(slot15, self, i, name_label_id)
			end

			data.taken = true

			if ai then
				data.ai = true
			else
				data.ai = false
			end

			if unit then
				slot14 = unit
				unit.unit_data(slot13).teammate_panel_id = i
			end

			if peer_id then
				slot14 = managers.network
				slot15 = peer_id
				slot15 = i

				managers.network.session(slot13).peer(slot13, managers.network.session(slot13)).set_teammate_panel_id(slot13, managers.network.session(slot13).peer(slot13, managers.network.session(slot13)))
			end

			slot14 = self

			self._layout_teammate_panels(slot13)

			slot14 = self._tab_screen

			self._tab_screen.refresh_peers(slot13)

			if unit then
				slot14 = unit

				if unit.character_damage(slot13).run_queued_teammate_panel_update then
					slot14 = unit
					slot14 = unit.character_damage(slot13)

					unit.character_damage(slot13).run_queued_teammate_panel_update(slot13)
				end
			end

			return i
		end
	end

	slot11 = peer_id

	debug_pause(slot6, "[HUDManager:add_teammate_panel] Teammate panel is not added:", character_name, player_name, ai)

	return 
end
function HUDManager:remove_teammate_panel(id)
	slot4 = self._teammate_panels[id]

	self._teammate_panels[id].hide(slot3)

	slot4 = self._teammate_panels[id]

	if not self._teammate_panels[id].is_ai(slot3) then
		slot4 = self._teammate_panels[id]

		self._teammate_panels[id].hide_host_indicator(slot3)
	end

	self._hud.teammate_panels_data[id].taken = false
	slot4 = self

	self._layout_teammate_panels(false)

	slot4 = self._tab_screen

	self._tab_screen.refresh_peers(false)

	slot4 = Network

	if Network.is_server(false) then
		slot4 = managers.network
		slot4 = managers.network.session(slot3)

		if managers.network.session(slot3).count_all_peers(slot3) == 1 then
			slot4 = self._teammate_panels[HUDManager.PLAYER_PANEL]

			self._teammate_panels[HUDManager.PLAYER_PANEL].hide_host_indicator(HUDManager.PLAYER_PANEL)
		end
	end

	return 
end
function HUDManager:_layout_teammate_panels()
	local y = 0
	local human_teammates_exist = false

	for i = 1, #self._teammate_panels, 1 do
		if i ~= HUDManager.PLAYER_PANEL then
			slot9 = self._teammate_panels[i]

			if not self._teammate_panels[i].is_ai(slot8) then
				slot10 = y

				self._teammate_panels[i].set_y(slot8, self._teammate_panels[i])

				slot10 = self._teammate_panels[i]
				y = y + self._teammate_panels[i].h(slot8) + self._teammate_panels[i].padding_down(self._teammate_panels[i])
				human_teammates_exist = true
			end
		end
	end

	for i = 1, #self._teammate_panels, 1 do
		if i ~= HUDManager.PLAYER_PANEL then
			slot9 = self._teammate_panels[i]

			if self._teammate_panels[i].is_ai(slot8) then
				slot10 = y

				self._teammate_panels[i].set_y(slot8, self._teammate_panels[i])

				slot10 = self._teammate_panels[i]
				y = y + self._teammate_panels[i].h(slot8) + self._teammate_panels[i].padding_down(self._teammate_panels[i])

				if human_teammates_exist then
					slot10 = 16

					self._teammate_panels[i].set_x(slot8, self._teammate_panels[i])
				else
					slot10 = 0

					self._teammate_panels[i].set_x(slot8, self._teammate_panels[i])
				end
			end
		end
	end

	return 
end
function HUDManager:get_teammate_panel_by_id(peer_id)
	for i = 1, 4, 1 do
		slot8 = self._teammate_panels[i]

		if peer_id == self._teammate_panels[i].peer_id(slot7) then
			return self._teammate_panels[i]
		end
	end

	return nil
end
function HUDManager:teampanels_height()
	return 300
end
function HUDManager:_create_teammates_panel(hud)
	if not hud then
		slot5 = PlayerBase.INGAME_HUD_SAFERECT
		hud = managers.hud.script(slot3, managers.hud)
	end

	self._hud.teammate_panels_data = self._hud.teammate_panels_data or {}
	self._teammate_panels = {}
	self._ai_teammate_panels = {}
	self._peer_teammate_panels = {}
	slot5 = "teammates_panel"

	if hud.panel.child(slot3, hud.panel) then
		slot4 = hud.panel
		slot8 = "teammates_panel"

		hud.panel.remove(slot3, hud.panel.child(slot6, hud.panel))
	end

	local teammates_panel_params = {
		halign = "left",
		name = "teammates_panel",
		y = 0,
		x = 0,
		valign = "grow",
		w = HUDManager.TEAMMATE_PANEL_W
	}
	slot5 = hud.panel
	teammates_panel_params.h = hud.panel.h(slot4)
	slot6 = teammates_panel_params
	local teammates_panel = hud.panel.panel(slot4, hud.panel)

	for i = 1, 3, 1 do
		self._hud.teammate_panels_data[i] = {
			taken = false,
			special_equipments = {}
		}
		slot12 = teammates_panel
		local ai_teammate = HUDTeammateAI.new(, HUDTeammateAI, i)
		slot12 = (i - 1) * (HUDTeammateAI.DEFAULT_H + ai_teammate.padding_down(slot15))

		ai_teammate.set_y(HUDTeammateAI, ai_teammate)

		slot12 = ai_teammate

		table.insert(HUDTeammateAI, self._ai_teammate_panels)

		slot13 = teammates_panel
		local peer_teammate = HUDTeammatePeer.new(HUDTeammateAI, HUDTeammatePeer, i)
		slot17 = peer_teammate
		slot13 = (i - 1) * (HUDTeammatePeer.DEFAULT_H + peer_teammate.padding_down(ai_teammate))

		peer_teammate.set_y(HUDTeammatePeer, peer_teammate)

		slot12 = peer_teammate

		peer_teammate.hide(HUDTeammatePeer)

		slot13 = peer_teammate

		table.insert(HUDTeammatePeer, self._peer_teammate_panels)
	end

	for i = 1, #self._ai_teammate_panels, 1 do
		self._teammate_panels[i] = self._ai_teammate_panels[i]
	end

	slot8 = teammates_panel
	local teammate = HUDTeammatePlayer.new(slot5, HUDTeammatePlayer, HUDManager.PLAYER_PANEL)
	slot8 = teammate

	table.insert(HUDTeammatePlayer, self._teammate_panels)

	self._hud.teammate_panels_data[HUDManager.PLAYER_PANEL] = {
		taken = false,
		special_equipments = {}
	}

	return 
end
function HUDManager:_fix_peer_warcry_icons()
	for i = 1, #self._hud.name_labels, 1 do
		local peer_name_label = self._hud.name_labels[i]
		local peer_id = peer_name_label._peer_id
		local warcry = peer_name_label.warcry

		if peer_name_label and peer_id then
			for j = 1, #self._teammate_panels, 1 do
				local teammate_panel = self._teammate_panels[j]

				if teammate_panel._peer_id == peer_id then
					slot17 = teammate_panel

					print(inspect(slot16))

					slot16 = warcry

					teammate_panel.set_active_warcry(slot14, teammate_panel)
				end
			end
		end
	end

	return 
end
function HUDManager:_create_weapons_panel(hud)
	if not hud then
		slot5 = PlayerBase.INGAME_HUD_SAFERECT
		hud = managers.hud.script(slot3, managers.hud)
	end

	local weapons_panel_params = {
		name = "weapons_panel",
		halign = "right",
		valign = "bottom",
		w = HUDManager.WEAPONS_PANEL_W,
		h = HUDManager.WEAPONS_PANEL_H
	}
	slot6 = weapons_panel_params
	local weapons_panel = hud.panel.panel(slot4, hud.panel)
	slot6 = weapons_panel
	slot9 = hud.panel

	weapons_panel.set_right(hud.panel, hud.panel.w(slot8))

	slot6 = weapons_panel
	slot9 = hud.panel

	weapons_panel.set_bottom(hud.panel, hud.panel.h(slot8))

	self._weapon_panel_classes = {
		grenade = HUDWeaponGrenade
	}
	self._weapon_panels = {}

	return 
end
function HUDManager:_create_comm_wheel(hud, params)
	if not hud then
		slot6 = PlayerBase.INGAME_HUD_SAFERECT
		hud = managers.hud.script(slot4, managers.hud)
	end

	local params = tweak_data.interaction.com_wheel
	local pm = managers.player
	slot10 = "disable_view_movement"
	params.show_clbks = {
		callback(slot7, pm, pm)
	}
	slot10 = "enable_view_movement"
	params.hide_clbks = {
		callback(slot7, pm, pm)
	}
	slot10 = params or tweak_data.interaction.com_wheel
	self._hud_comm_wheel = HUDMultipleChoiceWheel.new(slot6, HUDMultipleChoiceWheel, self._saferect, hud)
	slot11 = self._hud_comm_wheel
	slot8 = hud.panel.w(hud) / 2 - self._hud_comm_wheel.w(hud.panel) / 2

	self._hud_comm_wheel.set_x(slot6, self._hud_comm_wheel)

	slot8 = 0

	self._hud_comm_wheel.set_y(slot6, self._hud_comm_wheel)

	slot7 = self._hud_comm_wheel

	self._hud_comm_wheel.hide(slot6)

	return 
end
function HUDManager:comm_wheel_exists()
	return self._hud_comm_wheel ~= nil
end
function HUDManager:show_comm_wheel()
	if not self._hud_comm_wheel then
		slot3 = self

		self._create_comm_wheel(slot2)
	end

	slot3 = self._hud_comm_wheel

	self._hud_comm_wheel.show(slot2)

	return 
end
function HUDManager:trigger_comm_wheel_option(option_id)
	if self._hud_comm_wheel then
		slot5 = option_id

		self._hud_comm_wheel.trigger_option(slot3, self._hud_comm_wheel)
	end

	return 
end
function HUDManager:hide_comm_wheel(quiet)
	if self._hud_comm_wheel then
		slot5 = quiet

		self._hud_comm_wheel.hide(slot3, self._hud_comm_wheel)
	end

	return 
end
function HUDManager:add_comm_wheel_option(option, index)
	if not self._hud_comm_wheel then
		slot5 = self

		self._create_comm_wheel(slot4)
	end

	slot7 = index

	self._hud_comm_wheel.add_option(slot4, self._hud_comm_wheel, option)

	return 
end
function HUDManager:remove_comm_wheel_option(option_id)
	if not self._hud_comm_wheel then
		slot4 = self

		self._create_comm_wheel(slot3)
	end

	slot5 = option_id

	self._hud_comm_wheel.remove_option(slot3, self._hud_comm_wheel)

	return 
end
function HUDManager:set_comm_wheel_options(options)
	if not self._hud_comm_wheel then
		slot4 = self

		self._create_comm_wheel(slot3)
	end

	slot5 = options

	self._hud_comm_wheel.set_options(slot3, self._hud_comm_wheel)

	return 
end
function HUDManager:is_comm_wheel_visible()
	if self._hud_comm_wheel ~= nil then
		slot3 = self._hud_comm_wheel

		return self._hud_comm_wheel.is_visible(slot2)
	end

	return false
end
function HUDManager:_destroy_comm_wheel()
	self._hud_comm_wheel = nil

	return 
end
function HUDManager:create_special_interaction(hud, params)
	if not hud then
		slot6 = PlayerBase.INGAME_HUD_SAFERECT
		hud = managers.hud.script(slot4, managers.hud)
	end

	if not self._hud_special_interaction then
		slot7 = params
		slot3 = HUDSpecialInteraction.new(slot4, HUDSpecialInteraction, hud)
	end

	self._hud_special_interaction = slot3
	slot6 = params

	self._hud_special_interaction.set_tweak_data(slot4, self._hud_special_interaction)

	slot5 = self._hud_special_interaction

	self._hud_special_interaction.hide(slot4)

	return self._hud_special_interaction
end
function HUDManager:special_interaction_exists()
	return self._hud_special_interaction ~= nil
end
function HUDManager:show_special_interaction()
	if self._hud_special_interaction then
		slot3 = self._hud_special_interaction

		self._hud_special_interaction.show(slot2)
	end

	return 
end
function HUDManager:hide_special_interaction(completed)
	if self._hud_special_interaction then
		slot5 = completed

		self._hud_special_interaction.hide(slot3, self._hud_special_interaction)
	end

	return 
end
function HUDManager:is_special_interaction_visible()
	if self._hud_special_interaction ~= nil then
		slot3 = self._hud_special_interaction

		return self._hud_special_interaction.is_visible(slot2)
	end

	return false
end
function HUDManager:_create_present_panel(hud)
	if not hud then
		slot5 = PlayerBase.INGAME_HUD_SAFERECT
		hud = managers.hud.script(slot3, managers.hud)
	end

	slot5 = hud
	self._toast_notification = HUDToastNotification.new(slot3, HUDToastNotification)
	slot8 = self._toast_notification
	slot5 = hud.panel.w(slot6) / 2 - self._toast_notification.w(hud.panel) / 2

	self._toast_notification.set_x(slot3, self._toast_notification)

	slot5 = 0

	self._toast_notification.set_y(slot3, self._toast_notification)

	return 
end
function HUDManager:present(params)
	if not self._toast_notification then
		slot5 = PlayerBase.INGAME_HUD_SAFERECT
		local hud = managers.hud.script(slot3, managers.hud)
		slot6 = hud

		self._create_present_panel(managers.hud, self)
	end

	if self._toast_notification then
		slot5 = params

		self._toast_notification.present(slot3, self._toast_notification)
	end

	return 
end
function HUDManager:present_done()
	return 
end
function HUDManager:_create_interaction(hud)
	if not hud then
		slot5 = PlayerBase.INGAME_HUD_SAFERECT
		hud = managers.hud.script(slot3, managers.hud)
	end

	slot5 = hud
	self._hud_interaction = HUDInteraction.new(slot3, HUDInteraction)

	return 
end
function HUDManager:show_interact(data)
	slot5 = data

	self._hud_interaction.show_interact(slot3, self._hud_interaction)

	return 
end
function HUDManager:remove_interact()
	if not self._hud_interaction then
		return 
	end

	slot3 = self._hud_interaction

	self._hud_interaction.remove_interact(slot2)

	return 
end
function HUDManager:show_interaction_bar(current, total)
	slot7 = total

	self._hud_interaction.show_interaction_bar(slot4, self._hud_interaction, current)

	return 
end
function HUDManager:set_interaction_bar_width(current, total)
	slot7 = total

	self._hud_interaction.set_interaction_bar_width(slot4, self._hud_interaction, current)

	return 
end
function HUDManager:hide_interaction_bar(complete, show_interact_at_finish)
	slot7 = show_interact_at_finish

	self._hud_interaction.hide_interaction_bar(slot4, self._hud_interaction, complete)

	return 
end
function HUDManager:_create_progress_timer(hud)
	if not hud then
		slot5 = PlayerBase.INGAME_HUD_SAFERECT
		hud = managers.hud.script(slot3, managers.hud)
	end

	slot6 = "progress_timer"
	self._progress_timer = HUDInteraction.new(slot3, HUDInteraction, hud)

	return 
end
function HUDManager:show_progress_timer(data)
	slot5 = data

	self._progress_timer.show_interact(slot3, self._progress_timer)

	return 
end
function HUDManager:remove_progress_timer()
	slot3 = self._progress_timer

	self._progress_timer.remove_interact(slot2)

	return 
end
function HUDManager:show_progress_timer_bar(current, total, description)
	local hud = managers.hud.script(slot5, managers.hud)
	local progress_bar_params = {
		name = "progress_timer_progress_bar",
		height = 8,
		width = 256
	}
	slot8 = hud.panel
	progress_bar_params.x = hud.panel.w(PlayerBase.INGAME_HUD_SAFERECT) / 2
	slot8 = hud.panel
	progress_bar_params.y = hud.panel.h(PlayerBase.INGAME_HUD_SAFERECT) / 2
	slot10 = 0
	slot9 = 0.8
	progress_bar_params.color = Color(PlayerBase.INGAME_HUD_SAFERECT, 1, 0.6666666666666666).with_alpha(PlayerBase.INGAME_HUD_SAFERECT, Color(PlayerBase.INGAME_HUD_SAFERECT, 1, 0.6666666666666666))
	progress_bar_params.description = description
	slot10 = progress_bar_params
	self._progress_timer_progress_bar = ProgressBarGuiObject.new(PlayerBase.INGAME_HUD_SAFERECT, ProgressBarGuiObject, hud.panel)
	slot8 = self._progress_timer_progress_bar

	self._progress_timer_progress_bar.show(PlayerBase.INGAME_HUD_SAFERECT)

	return 
end
function HUDManager:set_progress_timer_bar_width(current, total)
	slot7 = total

	self._progress_timer_progress_bar.set_progress(slot4, self._progress_timer_progress_bar, current)

	return 
end
function HUDManager:set_progress_timer_bar_valid(valid, text_id)
	slot7 = text_id

	self._progress_timer.set_bar_valid(slot4, self._progress_timer, valid)

	return 
end
function HUDManager:hide_progress_timer_bar(complete)
	slot5 = complete

	self._progress_timer_progress_bar.hide(slot3, self._progress_timer_progress_bar)

	return 
end
function HUDManager:create_objectives_timer_hud(current, total)
	slot5 = self._hud_objectives

	self._hud_objectives.show_timer(slot4)

	if self._tab_objectives then
		slot5 = self._tab_objectives

		self._tab_objectives.show_timer(slot4)
	end

	return 
end
function HUDManager:set_objectives_timer_hud_value(current, total, remaining)
	slot8 = total

	self._hud_objectives.set_timer_value(slot5, self._hud_objectives, current)

	if self._tab_objectives then
		slot8 = total

		self._tab_objectives.set_timer_value(slot5, self._tab_objectives, current)
	end

	return 
end
function HUDManager:remove_objectives_timer_hud(complete)
	slot4 = self._hud_objectives

	self._hud_objectives.hide_timer(slot3)

	if self._tab_objectives then
		slot4 = self._tab_objectives

		self._tab_objectives.hide_timer(slot3)
	end

	return 
end
function HUDManager:show_objectives_timer_hud()
	slot3 = self._hud_objectives

	self._hud_objectives.show_timer(slot2)

	if self._tab_objectives then
		slot3 = self._tab_objectives

		self._tab_objectives.show_timer(slot2)
	end

	return 
end
function HUDManager:hide_objectives_timer_hud()
	slot3 = self._hud_objectives

	self._hud_objectives.hide_timer(slot2)

	if self._tab_objectives then
		slot3 = self._tab_objectives

		self._tab_objectives.hide_timer(slot2)
	end

	return 
end
function HUDManager:set_control_info(data)
	return 
end
function HUDManager:sync_start_assault(data)
	slot4 = managers.groupai
	slot4 = managers.groupai.state(slot3)

	if not managers.groupai.state(slot3).get_hunt_mode(slot3) then
	end

	return 
end
function HUDManager:sync_end_assault(result)
	local result_diag = {
		"gen_ban_b12",
		"gen_ban_b11",
		"gen_ban_b10"
	}

	if result then
	end

	return 
end
function HUDManager:on_progression_cycle_completed()
	if self._tab_screen then
		slot3 = self._tab_screen

		self._tab_screen.on_progression_cycle_completed(slot2)
	end

	local notification_params = {
		id = "progression_cycle_completed",
		duration = 6,
		priority = 4,
		notification_type = HUDNotification.RAID_UNLOCKED
	}
	slot5 = notification_params

	managers.notification.add_notification(slot3, managers.notification)

	return 
end
function HUDManager:on_greed_loot_picked_up(old_progress, new_progress)
	if self._tab_screen then
		slot7 = new_progress

		self._tab_screen.on_greed_loot_picked_up(slot4, self._tab_screen, old_progress)
	end

	slot6 = {
		id = "greed_item_picked_up",
		shelf_life = 5,
		notification_type = HUDNotification.GREED_ITEM,
		initial_progress = old_progress,
		new_progress = new_progress
	}

	managers.notification.add_notification(slot4, managers.notification)

	return 
end
function HUDManager:set_current_greed_amount(amount)
	if self._tab_screen then
		slot5 = amount

		self._tab_screen.set_current_greed_amount(slot3, self._tab_screen)
	end

	return 
end
function HUDManager:reset_greed_indicators()
	if self._tab_screen then
		slot3 = self._tab_screen

		self._tab_screen.reset_greed_indicator(slot2)
	end

	return 
end
function HUDManager:_setup_tab_screen()
	slot4 = HUDManager.TAB_SCREEN_FULLSCREEN

	if not self.exists(slot2, self) then
		slot8 = {}

		self.load_hud(slot2, self, HUDManager.TAB_SCREEN_SAFERECT, true, true, true)

		slot8 = {}

		self.load_hud(slot2, self, HUDManager.TAB_SCREEN_FULLSCREEN, true, true, false)
	end

	slot4 = HUDManager.TAB_SCREEN_FULLSCREEN
	local hud_tab_fullscreen = managers.hud.script(slot2, managers.hud)
	slot5 = HUDManager.TAB_SCREEN_SAFERECT
	local hud_tab_safe = managers.hud.script(managers.hud, managers.hud)
	slot7 = hud_tab_safe
	self._tab_screen = HUDTabScreen.new(managers.hud, HUDTabScreen, hud_tab_fullscreen)
	slot5 = self._tab_screen

	self._tab_screen.hide(managers.hud)

	slot6 = "WIN32"

	if SystemInfo.platform(managers.hud) == Idstring(SystemInfo) then
		slot6 = "STEAM"

		if SystemInfo.distribution(slot4) == Idstring(SystemInfo) then
			slot7 = {
				"overlay_open"
			}
			slot12 = "hide_stats_screen"

			managers.network.account.add_overlay_listener(slot4, managers.network.account, "[HUDManager] hide_tab_screen", callback(slot9, self, self))
		end
	end

	return 
end
function HUDManager:show_stats_screen()
	slot3 = self._tab_screen

	self._tab_screen.show(slot2)

	self._showing_stats_screen = true
	slot4 = PlayerBase.INGAME_HUD_FULLSCREEN

	self.hide(slot2, self)

	slot4 = PlayerBase.INGAME_HUD_SAFERECT

	self.hide(slot2, self)

	slot4 = IngameWaitingForRespawnState.GUI_SPECTATOR

	self.hide(slot2, self)

	slot4 = HUDManager.TAB_SCREEN_FULLSCREEN

	self.show(slot2, self)

	slot4 = HUDManager.TAB_SCREEN_SAFERECT

	self.show(slot2, self)

	return 
end
function HUDManager:hide_stats_screen()
	slot3 = self._tab_screen

	self._tab_screen.hide(slot2)

	slot3 = game_state_machine

	if game_state_machine.current_state_name(slot2) == "ingame_waiting_for_respawn" then
		slot4 = IngameWaitingForRespawnState.GUI_SPECTATOR

		self.show(slot2, self)
	else
		slot4 = PlayerBase.INGAME_HUD_FULLSCREEN

		self.show(slot2, self)

		slot4 = PlayerBase.INGAME_HUD_SAFERECT

		self.show(slot2, self)
	end

	if self._showing_stats_screen then
		slot4 = HUDManager.TAB_SCREEN_FULLSCREEN

		self.hide(slot2, self)

		slot4 = HUDManager.TAB_SCREEN_SAFERECT

		self.hide(slot2, self)
	end

	self._showing_stats_screen = false

	return 
end
function HUDManager:showing_stats_screen()
	return self._showing_stats_screen
end
function HUDManager:set_loot_picked_up(amount)
	slot5 = amount

	self._tab_screen.set_loot_picked_up(slot3, self._tab_screen)

	return 
end
function HUDManager:set_loot_total(amount)
	slot5 = amount

	self._tab_screen.set_loot_total(slot3, self._tab_screen)

	return 
end
function HUDManager:feed_point_of_no_return_timer(time, is_inside)
	return 
end
function HUDManager:show_point_of_no_return_timer()
	return 
end
function HUDManager:hide_point_of_no_return_timer()
	return 
end
function HUDManager:flash_point_of_no_return_timer(beep)
	if beep then
		slot5 = "last_10_seconds_beep"

		self._sound_source.post_event(slot3, self._sound_source)
	end

	return 
end
function HUDManager:_create_objectives(hud)
	if not hud then
		slot5 = PlayerBase.INGAME_HUD_SAFERECT
		hud = managers.hud.script(slot3, managers.hud)
	end

	slot5 = hud.panel
	self._hud_objectives = HUDObjectives.new(slot3, HUDObjectives)
	slot8 = self._hud_objectives
	slot5 = hud.panel.w(slot6) - self._hud_objectives.w(hud.panel)

	self._hud_objectives.set_x(slot3, self._hud_objectives)

	slot5 = 0

	self._hud_objectives.set_y(slot3, self._hud_objectives)

	return 
end
function HUDManager:_get_tab_objectives()
	slot3 = self._tab_screen
	self._tab_objectives = self._tab_screen.get_objectives_control(slot2)

	return 
end
function HUDManager:show_objectives()
	if self._hud_objectives then
		slot3 = self._hud_objectives

		self._hud_objectives.show(slot2)
	end

	if self._tab_objectives then
		slot3 = self._tab_objectives

		self._tab_objectives.show(slot2)
	end

	return 
end
function HUDManager:hide_objectives()
	if self._hud_objectives then
		slot3 = self._hud_objectives

		self._hud_objectives.hide(slot2)
	end

	if self._tab_objectives then
		slot3 = self._tab_objectives

		self._tab_objectives.hide(slot2)
	end

	return 
end
function HUDManager:activate_objective(data)
	if self._hud_objectives then
		slot5 = data

		self._hud_objectives.activate_objective(slot3, self._hud_objectives)
	end

	if self._tab_objectives then
		slot5 = data

		self._tab_objectives.activate_objective(slot3, self._tab_objectives)
	end

	return 
end
function HUDManager:complete_sub_objective(data)
	if self._hud_objectives then
		slot5 = data

		self._hud_objectives.complete_sub_objective(slot3, self._hud_objectives)
	end

	if self._tab_objectives then
		slot5 = data

		self._tab_objectives.complete_sub_objective(slot3, self._tab_objectives)
	end

	return 
end
function HUDManager:update_amount_objective(data)
	if self._hud_objectives then
		slot5 = data

		self._hud_objectives.update_amount_objective(slot3, self._hud_objectives)
	end

	if self._tab_objectives then
		slot5 = data

		self._tab_objectives.update_amount_objective(slot3, self._tab_objectives)
	end

	return 
end
function HUDManager:update_amount_sub_objective(data)
	if self._hud_objectives then
		slot5 = data

		self._hud_objectives.update_amount_sub_objective(slot3, self._hud_objectives)
	end

	if self._tab_objectives then
		slot5 = data

		self._tab_objectives.update_amount_sub_objective(slot3, self._tab_objectives)
	end

	return 
end
function HUDManager:remind_objective(id)
	if self._hud_objectives then
		slot5 = id

		self._hud_objectives.remind_objective(slot3, self._hud_objectives)
	end

	if self._tab_objectives then
		slot5 = id

		self._tab_objectives.remind_objective(slot3, self._tab_objectives)
	end

	return 
end
function HUDManager:remind_sub_objective(id)
	if self._hud_objectives then
		slot5 = id

		self._hud_objectives.remind_sub_objective(slot3, self._hud_objectives)
	end

	if self._tab_objectives then
		slot5 = id

		self._tab_objectives.remind_sub_objective(slot3, self._tab_objectives)
	end

	return 
end
function HUDManager:complete_objective(data)
	if self._hud_objectives then
		slot5 = data

		self._hud_objectives.complete_objective(slot3, self._hud_objectives)
	end

	if self._tab_objectives then
		slot5 = data

		self._tab_objectives.complete_objective(slot3, self._tab_objectives)
	end

	return 
end
function HUDManager:render_objective()
	if self._hud_objectives then
		slot3 = self._hud_objectives

		self._hud_objectives.update_objectives(slot2)
	end

	if self._tab_objectives then
		slot3 = self._tab_objectives

		self._tab_objectives.update_objectives(slot2)
	end

	return 
end
function HUDManager:feed_session_time(time)
	slot5 = time

	self._tab_screen.set_time(slot3, self._tab_screen)

	return 
end
function HUDManager:set_stamina_value(value)
	slot5 = value

	self._teammate_panels[HUDManager.PLAYER_PANEL].set_stamina(HUDManager.PLAYER_PANEL, self._teammate_panels[HUDManager.PLAYER_PANEL])

	return 
end
function HUDManager:set_max_stamina(value)
	slot5 = value

	self._teammate_panels[HUDManager.PLAYER_PANEL].set_max_stamina(HUDManager.PLAYER_PANEL, self._teammate_panels[HUDManager.PLAYER_PANEL])

	return 
end
function HUDManager:_create_turret_hud(hud)
	slot5 = hud
	self._turret_hud = HUDTurret.new(slot3, HUDTurret)
	slot8 = self._turret_hud
	slot5 = hud.panel.w(slot6) / 2 - self._turret_hud.w(hud.panel) / 2

	self._turret_hud.set_x(slot3, self._turret_hud)

	slot8 = self._turret_hud
	slot5 = hud.panel.h(self._turret_hud.w(hud.panel) / 2) / 2 - self._turret_hud.h(hud.panel) / 2

	self._turret_hud.set_y(slot3, self._turret_hud)

	return 
end
function HUDManager:show_turret_hud(turret_unit, bullet_type)
	slot7 = bullet_type

	self._turret_hud.show(slot4, self._turret_hud, turret_unit)

	return 
end
function HUDManager:hide_turret_hud(turret_unit)
	slot5 = turret_unit

	self._turret_hud.hide(slot3, self._turret_hud)

	return 
end
function HUDManager:update_heat_indicator(current)
	slot5 = current

	self._turret_hud.update_heat_indicator(slot3, self._turret_hud)

	return 
end
function HUDManager:player_turret_overheat(turret_unit)
	slot5 = turret_unit

	self._turret_hud.overheat(slot3, self._turret_hud)

	return 
end
function HUDManager:player_turret_flak_insert()
	slot3 = self._turret_hud

	self._turret_hud.flak_insert(slot2)

	return 
end
function HUDManager:set_player_turret_overheating(overheating)
	slot5 = overheating

	self._turret_hud.set_overheating(slot3, self._turret_hud)

	return 
end
function HUDManager:player_turret_cooldown()
	slot3 = self._turret_hud

	self._turret_hud.cooldown(slot2)

	return 
end
function HUDManager:_create_carry(hud)
	slot5 = hud
	self._carry_hud = HUDCarry.new(slot3, HUDCarry)
	slot8 = self._carry_hud
	slot5 = hud.panel.w(slot6) / 2 - self._carry_hud.w(hud.panel) / 2

	self._carry_hud.set_x(slot3, self._carry_hud)

	slot8 = self._carry_hud
	slot5 = hud.panel.h(self._carry_hud.w(hud.panel) / 2) - self._carry_hud.h(hud.panel)

	self._carry_hud.set_y(slot3, self._carry_hud)

	return 
end
function HUDManager:show_carry_item(carry_id)
	slot5 = carry_id

	self._carry_hud.show_carry_item(slot3, self._carry_hud)

	return 
end
function HUDManager:hide_carry_item()
	slot3 = self._carry_hud

	self._carry_hud.hide_carry_item(slot2)

	return 
end
function HUDManager:_create_suspicion(hud)
	if not hud then
		slot5 = PlayerBase.INGAME_HUD_SAFERECT
		hud = managers.hud.script(slot3, managers.hud)
	end

	slot6 = self._sound_source
	self._hud_suspicion = HUDSuspicion.new(slot3, HUDSuspicion, hud)

	return 
end
function HUDManager:hide_suspicion()
	slot3 = self._hud_suspicion

	self._hud_suspicion.hide(slot2)

	return 
end
function HUDManager:show_suspicion()
	slot3 = self._hud_suspicion

	self._hud_suspicion.show(slot2)

	return 
end
function HUDManager:set_suspicion(status)
	slot4 = status

	if type(slot3) == "boolean" then
		if status then
			slot4 = self._hud_suspicion

			self._hud_suspicion.discovered(slot3)
		else
			slot4 = self._hud_suspicion

			self._hud_suspicion.back_to_stealth(slot3)
		end
	else
		slot4 = self._hud_suspicion

		self._hud_suspicion.show(slot3)
	end

	return 
end
function HUDManager:_create_hit_confirm(hud)
	if not hud then
		slot5 = PlayerBase.INGAME_HUD_SAFERECT
		hud = managers.hud.script(slot3, managers.hud)
	end

	slot5 = hud
	self._hud_hit_confirm = HUDHitConfirm.new(slot3, HUDHitConfirm)

	return 
end
function HUDManager:on_hit_confirmed()
	slot4 = "hit_indicator"

	if not managers.user.get_setting(slot2, managers.user) then
		return 
	end

	slot3 = self._hud_hit_confirm

	self._hud_hit_confirm.on_hit_confirmed(slot2)

	return 
end
function HUDManager:on_headshot_confirmed()
	slot4 = "hit_indicator"

	if not managers.user.get_setting(slot2, managers.user) then
		return 
	end

	slot3 = self._hud_hit_confirm

	self._hud_hit_confirm.on_headshot_confirmed(slot2)

	return 
end
function HUDManager:on_crit_confirmed()
	slot4 = "hit_indicator"

	if not managers.user.get_setting(slot2, managers.user) then
		return 
	end

	slot3 = self._hud_hit_confirm

	self._hud_hit_confirm.on_crit_confirmed(slot2)

	return 
end
function HUDManager:_create_hit_direction(hud)
	if not hud then
		slot5 = PlayerBase.INGAME_HUD_SAFERECT
		hud = managers.hud.script(slot3, managers.hud)
	end

	slot5 = hud
	self._hud_hit_direction = HUDHitDirection.new(slot3, HUDHitDirection)

	return 
end
function HUDManager:on_hit_direction(dir, unit_type_hit)
	slot7 = unit_type_hit

	self._hud_hit_direction.on_hit_direction(slot4, self._hud_hit_direction, dir)

	return 
end
function HUDManager:on_hit_unit(attack_data, unit_type_hit)
	slot7 = unit_type_hit

	self._hud_hit_direction.on_hit_unit(slot4, self._hud_hit_direction, attack_data)

	return 
end
function HUDManager:clear_hit_direction_indicators()
	slot3 = self._hud_hit_direction

	self._hud_hit_direction.clean_up(slot2)

	return 
end
function HUDManager:_create_center_prompt(hud)
	if not hud then
		slot5 = PlayerBase.INGAME_HUD_SAFERECT
		hud = managers.hud.script(slot3, managers.hud)
	end

	slot5 = hud
	self._center_prompt = HUDCenterPrompt.new(slot3, HUDCenterPrompt)
	slot8 = self._center_prompt
	slot5 = hud.panel.w(slot6) / 2 - self._center_prompt.w(hud.panel) / 2

	self._center_prompt.set_x(slot3, self._center_prompt)

	slot8 = self._center_prompt
	slot5 = (hud.panel.h(self._center_prompt.w(hud.panel) / 2) / 2 + 48) - self._center_prompt.h(hud.panel) / 2

	self._center_prompt.set_y(slot3, self._center_prompt)

	return 
end
function HUDManager:set_prompt(id, text, duration)
	slot9 = duration

	self._center_prompt.show_prompt(slot5, self._center_prompt, id, text)

	return 
end
function HUDManager:hide_prompt(id)
	slot5 = id

	self._center_prompt.hide_prompt(slot3, self._center_prompt)

	return 
end
function HUDManager:_create_big_prompt(hud)
	if not hud then
		slot5 = PlayerBase.INGAME_HUD_SAFERECT
		hud = managers.hud.script(slot3, managers.hud)
	end

	slot5 = hud
	self._big_prompt = HUDBigPrompt.new(slot3, HUDBigPrompt)
	slot8 = self._big_prompt
	slot5 = hud.panel.w(slot6) / 2 - self._big_prompt.w(hud.panel) / 2

	self._big_prompt.set_x(slot3, self._big_prompt)

	slot8 = self._big_prompt
	slot5 = (hud.panel.h(self._big_prompt.w(hud.panel) / 2) / 2 + 116) - self._big_prompt.h(hud.panel) / 2

	self._big_prompt.set_y(slot3, self._big_prompt)

	return 
end
function HUDManager:set_big_prompt(params)
	slot5 = params

	self._big_prompt.show_prompt(slot3, self._big_prompt)

	return 
end
function HUDManager:hide_big_prompt(id)
	slot5 = id

	self._big_prompt.hide_prompt(slot3, self._big_prompt)

	return 
end
function HUDManager:_create_suspicion_direction(hud)
	if not hud then
		slot5 = PlayerBase.INGAME_HUD_SAFERECT
		hud = managers.hud.script(slot3, managers.hud)
	end

	slot5 = hud
	self._hud_suspicion_direction = HUDSuspicionDirection.new(slot3, HUDSuspicionDirection)

	return 
end
function HUDManager:create_suspicion_indicator(observer_key, observer_position, initial_state, suspect)
	slot11 = suspect

	self._hud_suspicion_direction.create_suspicion_indicator(slot6, self._hud_suspicion_direction, observer_key, observer_position, initial_state)

	return 
end
function HUDManager:need_to_init_suspicion_indicator(observer_key)
	slot5 = observer_key

	return self._hud_suspicion_direction.need_to_init(slot3, self._hud_suspicion_direction)
end
function HUDManager:initialize_suspicion_indicator(observer_key, alpha)
	slot7 = alpha

	self._hud_suspicion_direction.initialize(slot4, self._hud_suspicion_direction, observer_key)

	return 
end
function HUDManager:show_suspicion_indicator(observer_key)
	slot5 = observer_key

	self._hud_suspicion_direction.show_suspicion_indicator(slot3, self._hud_suspicion_direction)

	return 
end
function HUDManager:hide_suspicion_indicator(observer_key)
	slot5 = observer_key

	self._hud_suspicion_direction.hide_suspicion_indicator(slot3, self._hud_suspicion_direction)

	return 
end
function HUDManager:set_suspicion_indicator_progress(observer_key, progress)
	slot7 = progress

	self._hud_suspicion_direction.set_suspicion_indicator_progress(slot4, self._hud_suspicion_direction, observer_key)

	return 
end
function HUDManager:clear_suspicion_direction_indicators()
	slot3 = self._hud_suspicion_direction

	self._hud_suspicion_direction.clean_up(slot2)

	return 
end
function HUDManager:_create_custody_hud(hud)
	if not hud then
		slot5 = PlayerBase.PLAYER_CUSTODY_HUD
		hud = managers.hud.script(slot3, managers.hud)
	end

	slot5 = hud
	self._hud_player_custody = HUDPlayerCustody.new(slot3, HUDPlayerCustody)

	return 
end
function HUDManager:set_custody_respawn_time(time)
	slot5 = time

	self._hud_player_custody.set_respawn_time(slot3, self._hud_player_custody)

	return 
end
function HUDManager:set_custody_timer_visibility(visible)
	slot5 = visible

	self._hud_player_custody.set_timer_visibility(slot3, self._hud_player_custody)

	return 
end
function HUDManager:set_custody_civilians_killed(amount)
	slot5 = amount

	self._hud_player_custody.set_civilians_killed(slot3, self._hud_player_custody)

	return 
end
function HUDManager:set_custody_trade_delay(time)
	slot5 = time

	self._hud_player_custody.set_trade_delay(slot3, self._hud_player_custody)

	return 
end
function HUDManager:set_custody_trade_delay_visible(visible)
	slot5 = visible

	self._hud_player_custody.set_trade_delay_visible(slot3, self._hud_player_custody)

	return 
end
function HUDManager:set_custody_negotiating_visible(visible)
	slot5 = visible

	self._hud_player_custody.set_negotiating_visible(slot3, self._hud_player_custody)

	return 
end
function HUDManager:set_custody_can_be_trade_visible(visible)
	slot5 = visible

	self._hud_player_custody.set_can_be_trade_visible(slot3, self._hud_player_custody)

	return 
end
function HUDManager:set_custody_pumpkin_challenge()
	slot3 = self._hud_player_custody

	self._hud_player_custody.set_pumpkin_challenge(slot2)

	return 
end
function HUDManager:align_teammate_name_label(panel, interact, double_radius)
	slot7 = "text"
	local text = panel.child(slot5, panel)
	slot8 = "action"
	local action = panel.child(panel, panel)
	slot9 = "bag"
	local bag = panel.child(panel, panel)
	slot10 = "bag_number"
	local bag_number = panel.child(panel, panel)
	slot11 = "cheater"
	local cheater = panel.child(panel, panel)
	slot11 = text
	local _, _, tw, th = text.text_rect(panel)
	slot15 = action
	local _, _, aw, ah = action.text_rect(slot14)
	slot19 = cheater
	local _, _, cw, ch = cheater.text_rect(slot18)
	slot27 = cw
	slot24 = math.max(slot25, tw) + 4 + double_radius
	slot28 = double_radius

	panel.set_size(slot22, panel, math.max(tw, th + ah + ch))

	slot26 = panel

	text.set_size(slot22, text, panel.w(math.max))

	slot26 = panel
	slot25 = ah

	action.set_size(slot22, action, panel.w(th))
	cheater.set_size(slot22, cheater, tw)

	slot24 = double_radius + 4

	action.set_x(slot22, action)

	slot24 = double_radius + 4

	cheater.set_x(slot22, cheater)

	slot23 = text
	slot26 = cheater

	text.set_top(slot22, cheater.bottom(ch))

	slot23 = action
	slot26 = text

	action.set_top(slot22, text.bottom(ch))

	slot26 = text
	slot24 = text.top(ch) + 4

	bag.set_top(slot22, bag)

	slot24 = "infamy"
	local infamy = panel.child(slot22, panel)

	if infamy then
		slot28 = infamy
		slot26 = infamy.w(panel)
		slot25 = panel.w(slot26) + slot26

		panel.set_w(slot23, panel)

		slot24 = text
		slot27 = panel

		text.set_size(slot23, panel.size(slot26))

		slot25 = double_radius + 4

		infamy.set_x(slot23, infamy)

		slot24 = infamy

		infamy.set_top(slot23, text.top(slot26))

		slot28 = infamy
		slot25 = double_radius + 4 + infamy.w(text)

		text.set_x(slot23, text)
	end

	if bag_number then
		slot27 = text
		slot25 = text.bottom(slot26) - 1

		bag_number.set_bottom(slot23, bag_number)

		slot28 = bag_number
		slot28 = bag
		slot25 = panel.w(slot26) + bag_number.w(panel) + bag.w(panel) + 8

		panel.set_w(slot23, panel)

		slot28 = bag_number
		slot25 = panel.w(bag.w(panel)) - bag_number.w(panel)

		bag.set_right(slot23, bag)

		slot27 = panel
		slot25 = panel.w(bag_number.w(panel)) + 2

		bag_number.set_right(slot23, bag_number)
	else
		slot28 = bag
		slot25 = panel.w(slot26) + bag.w(panel) + 4

		panel.set_w(slot23, panel)

		slot24 = bag
		slot27 = panel

		bag.set_right(slot23, panel.w(bag.w(panel)))
	end

	slot25 = 32

	bag.set_w(slot23, bag)

	slot25 = 16

	bag.set_h(slot23, bag)

	slot27 = bag
	slot27 = bag.parent(slot26)
	slot25 = bag.parent(slot26).w(slot26) / 2

	bag.set_center_x(slot23, bag)

	slot25 = 10

	bag.set_y(slot23, bag)

	slot27 = panel
	slot25 = panel.w(slot26) / 2

	text.set_center_x(slot23, text)

	slot29 = text
	slot26 = panel.h(panel) / 2 + text.h(panel) / 2 + 4

	interact.set_position(slot23, interact, panel.w(slot26) / 2)

	return 
end
function HUDManager:_add_name_label(data)

	-- Decompilation error in this vicinity:
	slot5 = PlayerBase.INGAME_HUD_FULLSCREEN
	local hud = managers.hud.script(slot3, managers.hud)
	local name_label_params = {
		id = id,
		name = data.name,
		nationality = data.nationality,
		peer_id = peer_id
	}
	slot10 = data.unit
	name_label_params.movement = data.unit.movement(slot9)
	slot12 = name_label_params
	local name_label = HUDNameLabel.new(slot9, HUDNameLabel, hud)
	slot12 = name_label

	table.insert(HUDNameLabel, self._hud.name_labels)

	return id
end
function HUDManager:add_vehicle_name_label(data)

	-- Decompilation error in this vicinity:
	slot5 = PlayerBase.INGAME_HUD_FULLSCREEN
	local hud = managers.hud.script(slot3, managers.hud)
	local id = last_id + 1
	local vehicle_name_label_params = {
		id = id
	}
	slot9 = data.name
	vehicle_name_label_params.vehicle_name = managers.localization.text(slot7, managers.localization)
	vehicle_name_label_params.vehicle_unit = data.unit
	slot10 = vehicle_name_label_params
	local name_label = HUDNameVehicleLabel.new(slot7, HUDNameVehicleLabel, hud)
	slot10 = name_label

	table.insert(HUDNameVehicleLabel, self._hud.vehicle_name_labels)

	return id
end
function HUDManager:_remove_name_label(id)
	slot5 = PlayerBase.INGAME_HUD_FULLSCREEN
	local hud = managers.hud.script(slot3, managers.hud)

	if not hud then
		return 
	end

	slot5 = self._hud.name_labels

	for i, name_label in ipairs(slot4) do
		slot10 = name_label

		if name_label.id(slot9) == id then
			slot10 = name_label

			name_label.destroy(slot9)

			slot11 = i

			table.remove(slot9, self._hud.name_labels)

			break
		end
	end

	return 
end
function HUDManager:remove_vehicle_name_label(id)
	slot5 = PlayerBase.INGAME_HUD_FULLSCREEN
	local hud = managers.hud.script(slot3, managers.hud)

	if not hud then
		return 
	end

	slot5 = self._hud.vehicle_name_labels

	for i, name_label in ipairs(slot4) do
		slot10 = name_label

		if name_label.id(slot9) == id then
			slot10 = name_label

			name_label.destroy(slot9)

			slot11 = i

			table.remove(slot9, self._hud.vehicle_name_labels)

			break
		end
	end

	return 
end
function HUDManager:clear_vehicle_name_labels()
	slot4 = PlayerBase.INGAME_HUD_FULLSCREEN
	local hud = managers.hud.script(slot2, managers.hud)

	if not hud then
		return 
	end

	slot4 = self._hud.vehicle_name_labels

	for i, name_label in ipairs(slot3) do
		slot9 = name_label

		name_label.destroy(slot8)
	end

	self._hud.vehicle_name_labels = {}

	return 
end
function HUDManager:_name_label_by_peer_id(peer_id)
	slot5 = PlayerBase.INGAME_HUD_FULLSCREEN
	local hud = managers.hud.script(slot3, managers.hud)

	if not hud then
		return 
	end

	slot5 = self._hud.name_labels

	for i, name_label in ipairs(slot4) do
		slot10 = name_label

		if name_label.peer_id(slot9) == peer_id then
			return name_label
		end
	end

	return 
end
function HUDManager:_get_name_label(id)
	slot5 = PlayerBase.INGAME_HUD_FULLSCREEN
	local hud = managers.hud.script(slot3, managers.hud)

	if not hud then
		return 
	end

	slot5 = self._hud.name_labels

	for i, name_label in ipairs(slot4) do
		slot10 = name_label

		if name_label.id(slot9) == id then
			return name_label
		end
	end

	return 
end
function HUDManager:set_name_label_carry_info(peer_id, carry_id)
	return 
end
function HUDManager:set_vehicle_label_carry_info(label_id, value, number)
	return 
end
function HUDManager:remove_name_label_carry_info(peer_id)
	return 
end
function HUDManager:teammate_start_progress(teammate_panel_id, name_label_id, timer)
	slot7 = name_label_id
	local name_label = self._get_name_label(slot5, self)
	local teammate_panel = self._teammate_panels[teammate_panel_id]

	if name_label and name_label.start_interact then
		slot9 = timer

		name_label.start_interact(slot7, name_label)
	end

	if teammate_panel and teammate_panel.start_interact then
		slot9 = timer

		teammate_panel.start_interact(slot7, teammate_panel)
	end

	return 
end
function HUDManager:teammate_cancel_progress(teammate_panel_id, name_label_id)
	slot6 = name_label_id
	local name_label = self._get_name_label(slot4, self)
	local teammate_panel = self._teammate_panels[teammate_panel_id]

	if name_label and name_label.cancel_interact then
		slot7 = name_label

		name_label.cancel_interact(slot6)
	end

	if teammate_panel and teammate_panel.cancel_interact then
		slot7 = teammate_panel

		teammate_panel.cancel_interact(slot6)
	end

	return 
end
function HUDManager:teammate_complete_progress(teammate_panel_id, name_label_id)
	slot6 = name_label_id
	local name_label = self._get_name_label(slot4, self)
	local teammate_panel = self._teammate_panels[teammate_panel_id]

	if name_label and name_label.complete_interact then
		slot7 = name_label

		name_label.complete_interact(slot6)
	end

	if teammate_panel and teammate_panel.complete_interact then
		slot7 = teammate_panel

		teammate_panel.complete_interact(slot6)
	end

	return 
end
function HUDManager:_animate_label_interact(panel, interact, timer)
	local t = 0

	while t <= timer do
		local dt = coroutine.yield()
		t = t + dt
		slot9 = t / timer

		interact.set_current(slot7, interact)
	end

	slot8 = 1

	interact.set_current(slot6, interact)

	return 
end
function HUDManager:toggle_chatinput()
	slot4 = true

	self.set_chat_focus(slot2, self)

	return 
end
function HUDManager:chat_focus()
	return self._chat_focus
end
function HUDManager:set_chat_skip_first(skip_first)
	if self._hud_chat then
		slot5 = skip_first

		self._hud_chat.set_skip_first(slot3, self._hud_chat)
	end

	return 
end
function HUDManager:set_chat_focus(focus)
	slot5 = PlayerBase.INGAME_HUD_FULLSCREEN

	if not self.alive(slot3, self) then
		slot5 = IngameWaitingForRespawnState.GUI_SPECTATOR

		if not self.alive(slot3, self) then
			return 
		end
	end

	if self._chat_focus == focus then
		return 
	end

	if self._hud_comm_wheel then
		slot5 = true

		self.hide_comm_wheel(slot3, self)
	end

	function slot5()
		self._chat_focus = focus

		return 
	end

	setup.add_end_frame_callback(slot3, setup)

	slot5 = focus

	self._chatinput_changed_callback_handler.dispatch(slot3, self._chatinput_changed_callback_handler)

	if focus then
		slot4 = self._hud_chat

		self._hud_chat._on_focus(slot3)
	else
		slot4 = self._hud_chat

		self._hud_chat._loose_focus(slot3)
	end

	return 
end
function HUDManager:_setup_driving_hud()
	slot4 = PlayerBase.INGAME_HUD_SAFERECT
	local hud = managers.hud.script(slot2, managers.hud)
	slot5 = hud
	self._hud_driving = HUDDriving.new(managers.hud, HUDDriving)

	return 
end
function HUDManager:start_driving()
	slot3 = self._hud_driving

	self._hud_driving.start(slot2)

	return 
end
function HUDManager:stop_driving()
	slot3 = self._hud_driving

	self._hud_driving.stop(slot2)

	return 
end
function HUDManager:set_driving_vehicle_state(speed, rpm, gear)
	slot9 = gear

	self._hud_driving.set_vehicle_state(slot5, self._hud_driving, speed, rpm)

	return 
end
function HUDManager:set_vehicle_loot_info(vehicle, current_loot, current_loot_amount, max_loot_amount)
	slot11 = max_loot_amount

	self._hud_driving.set_vehicle_loot_info(slot6, self._hud_driving, vehicle, current_loot, current_loot_amount)

	return 
end
function HUDManager:ai_entered_vehicle(ai_unit, vehicle)
	slot5 = self._hud_driving

	self._hud_driving.refresh_seats(slot4)

	return 
end
function HUDManager:peer_enter_vehicle(peer_id, vehicle)
	slot5 = managers.network
	slot5 = managers.network.session(slot4)
	slot5 = managers.network.session(slot4).local_peer(slot4)

	if peer_id == managers.network.session(slot4).local_peer(slot4).id(slot4) then
		slot6 = vehicle

		self._hud_driving.show(slot4, self._hud_driving)
	end

	slot5 = self._hud_driving

	self._hud_driving.refresh_seats(slot4)

	slot6 = peer_id

	self._tab_screen.peer_enter_vehicle(slot4, self._tab_screen)

	return 
end
function HUDManager:peer_exit_vehicle(peer_id)
	slot4 = managers.network
	slot4 = managers.network.session(slot3)
	slot4 = managers.network.session(slot3).local_peer(slot3)

	if peer_id == managers.network.session(slot3).local_peer(slot3).id(slot3) then
		slot4 = self._hud_driving

		self._hud_driving.hide(slot3)
	else
		slot4 = self._hud_driving

		self._hud_driving.refresh_seats(slot3)
	end

	slot5 = peer_id

	self._tab_screen.peer_exit_vehicle(slot3, self._tab_screen)

	return 
end
function HUDManager:player_changed_vehicle_seat()
	slot4 = true

	self._hud_driving.refresh_seats(slot2, self._hud_driving)

	return 
end
function HUDManager:refresh_vehicle_health()
	slot3 = self._hud_driving

	self._hud_driving.refresh_health(slot2)

	return 
end
function HUDManager:hide_vehicle_hud()
	slot3 = self._hud_driving

	self._hud_driving.hide(slot2)

	return 
end
function HUDManager:set_custody_respawn_type(is_ai_trade)
	slot5 = is_ai_trade

	self._hud_player_custody.set_respawn_type(slot3, self._hud_player_custody)

	return 
end

return 
