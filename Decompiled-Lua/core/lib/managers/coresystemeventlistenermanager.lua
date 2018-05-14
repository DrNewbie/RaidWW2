slot3 = "CoreSystemEventListenerManager"

core.module(slot1, core)

slot3 = "CoreSystemEventListenerHolder"

core.import(slot1, core)

SystemEventListenerManager = SystemEventListenerManager or class()
SystemEventListenerManager.EVENT_DROP_IN = "BaseNetworkSession:add_peer"
SystemEventListenerManager.EVENT_DROP_OUT = "BaseNetworkSession:remove_peer"
SystemEventListenerManager.CHALLENGE_CARDS_SUGGESTED_CARDS_CHANGED = "ChallengeCardsManager:suggestions"
SystemEventListenerManager.CHALLENGE_CARDS_PLAYER_INVENTORY_CHANGED = "ChallengeCardsManager:player_inventory"
SystemEventListenerManager.TOP_STATS_READY = "StatisticsManager:calculate_top_stats"
SystemEventListenerManager.CAMP_PRESENCE_CHANGED = "PlayerManager:set_local_player_in_camp"
SystemEventListenerManager.PLAYER_KILLED_ENEMY = "CopDamage:die"
SystemEventListenerManager.PLAYER_PICKED_UP_AMMO = "RaycastWeaponBase:add_ammo"
SystemEventListenerManager.EVENT_STEAM_INVENTORY_LOADED = "ChallengeCardsManager:_clbk_inventory_load"
SystemEventListenerManager.EVENT_STEAM_INVENTORY_PROCESSED = "ChallengeCardsManager:_process_fresh_steam_inventory"
SystemEventListenerManager.EVENT_STEAM_LOOT_DROPPED = "ChallengeCardsManager:_clbk_inventory_reward"
SystemEventListenerManager.PLAYER_KICKED = "ReadyUpGui:_on_peer_kicked"
SystemEventListenerManager.PLAYER_LEFT = "ReadyUpGui:_on_peer_left"
SystemEventListenerManager.PEER_LEVEL_UP = "UnitNetworkHandler:sync_character_level"
SystemEventListenerManager.PUMPKIN_DESTROYED = "RevivePumpkinExt:destroy"
function SystemEventListenerManager:init()
	slot3 = CoreSystemEventListenerHolder.SystemEventListenerHolder
	self._listener_holder = CoreSystemEventListenerHolder.SystemEventListenerHolder.new(slot2)

	return 
end
function SystemEventListenerManager:call_listeners(event, params)
	slot7 = params

	self._listener_holder.call(slot4, self._listener_holder, event)

	return 
end
function SystemEventListenerManager:add_listener(key, events, clbk)
	slot9 = clbk

	self._listener_holder.add(slot5, self._listener_holder, key, events)

	return 
end
function SystemEventListenerManager:remove_listener(key)
	slot5 = key

	self._listener_holder.remove(slot3, self._listener_holder)

	return 
end

return 
