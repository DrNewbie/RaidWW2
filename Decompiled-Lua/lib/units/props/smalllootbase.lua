if not SmallLootBase then
	slot2 = UnitBase
	slot0 = class(slot1)
end

SmallLootBase = slot0
function SmallLootBase:init(unit)
	slot6 = false

	UnitBase.init(slot3, self, unit)

	self._unit = unit
	slot4 = self

	self._setup(slot3)

	return 
end
function SmallLootBase:_setup()
	return 
end
function SmallLootBase:take(unit)
	if self._empty then
		return 
	end

	slot4 = self

	self.taken(slot3)

	slot4 = Network

	if Network.is_client(slot3) then
		slot4 = managers.network
		slot6 = self._unit

		managers.network.session(slot3).send_to_host(slot3, managers.network.session(slot3), "sync_small_loot_taken")
	end

	slot10 = self._unit
	slot6 = {
		skip_idle_check = true,
		instigator = managers.player.local_player(self._unit.loot_drop(slot9)._loot_size)
	}
	slot9 = managers.player

	managers.dialog.queue_dialog(slot3, managers.dialog, "player_gen_loot_" .. tostring(slot7))

	slot9 = managers.lootdrop
	slot6 = (100 * managers.lootdrop.picked_up_current_leg(managers.player.local_player(self._unit.loot_drop(slot9)._loot_size))) / managers.lootdrop.loot_spawned_current_leg(managers.lootdrop)
	slot6 = 100
	local percentage_picked_up = math.clamp(slot3, math.ceil("player_gen_loot_" .. tostring(slot7)), 0)
	slot6 = {
		id = "hud_hint_grabbed_nazi_gold",
		duration = 2,
		shelf_life = 5,
		notification_type = HUDNotification.DOG_TAG,
		acquired = managers.lootdrop.picked_up_current_leg(managers.lootdrop),
		total = managers.lootdrop.loot_spawned_current_leg(managers.lootdrop)
	}
	slot9 = managers.lootdrop
	slot9 = managers.lootdrop

	managers.notification.add_notification(math.ceil("player_gen_loot_" .. tostring(slot7)), managers.notification)

	return 
end
function SmallLootBase:taken(skip_sync)
	slot7 = self._unit
	slot7 = self._unit.loot_drop(slot6)
	slot6 = self._unit

	managers.lootdrop.pickup_loot(slot3, managers.lootdrop, self._unit.loot_drop(slot6).value(slot6))

	slot4 = Network

	if Network.is_server(slot3) then
		slot5 = {
			id = "hud_hint_grabbed_nazi_gold",
			duration = 2,
			shelf_life = 5,
			notification_type = HUDNotification.DOG_TAG,
			acquired = managers.lootdrop.picked_up_current_leg(slot7),
			total = managers.lootdrop.loot_spawned_current_leg(slot7)
		}
		slot8 = managers.lootdrop
		slot8 = managers.lootdrop

		managers.notification.add_notification(slot3, managers.notification)

		slot4 = self

		self._set_empty(slot3)

		slot4 = managers.network
		slot6 = managers.lootdrop.picked_up_current_leg(slot7)
		slot9 = managers.lootdrop

		managers.network.session(slot3).send_to_peers_synched(slot3, managers.network.session(slot3), "sync_picked_up_loot_values", managers.lootdrop.loot_spawned_current_leg(managers.lootdrop))
	end

	return 
end
function SmallLootBase:_set_empty()
	self._empty = true

	if not self.skip_remove_unit then
		slot4 = 0

		self._unit.set_slot(slot2, self._unit)
	end

	return 
end
function SmallLootBase:save(data)
	slot4 = self._unit
	slot4 = self._unit.loot_drop(slot3)
	data.loot_value = self._unit.loot_drop(slot3).value(slot3)

	return 
end
function SmallLootBase:load(data)
	slot4 = self._unit
	slot5 = data.loot_value

	self._unit.loot_drop(slot3).set_value(slot3, self._unit.loot_drop(slot3))

	return 
end
function SmallLootBase:destroy()
	return 
end

return 
