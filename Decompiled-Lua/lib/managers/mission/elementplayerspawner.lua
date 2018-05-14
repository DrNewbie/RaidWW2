-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementPlayerSpawner then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementPlayerSpawner = slot0
slot3 = "PS4"

if SystemInfo.platform(slot1) == Idstring(SystemInfo) then
	ElementPlayerSpawner.HIDE_LOADING_SCREEN_DELAY = 3.5
else
	slot3 = "XB1"

	if SystemInfo.platform(slot1) == Idstring(SystemInfo) then
		ElementPlayerSpawner.HIDE_LOADING_SCREEN_DELAY = 3.5
	else
		ElementPlayerSpawner.HIDE_LOADING_SCREEN_DELAY = 3.5
	end
end

ElementPlayerSpawner.BASE_DELAY = 2
function ElementPlayerSpawner:init(...)
	slot3 = self

	ElementPlayerSpawner.super.init(slot2, ...)

	slot3 = managers.player

	managers.player.preload(slot2)

	return 
end
function ElementPlayerSpawner:get_spawn_position()
	slot3 = managers.network
	slot3 = managers.network.session(slot2)
	slot3 = managers.network.session(slot2).local_peer(slot2)
	local peer_id = managers.network.session(slot2).local_peer(slot2).id(slot2)
	local position = self._values.position
	slot5 = self._values.rotation
	local x = self._values.rotation.x(slot4)
	position = position + ElementTeleportPlayer.PEER_OFFSETS[peer_id] * x * 100

	return position
end
function ElementPlayerSpawner:value(name)
	return self._values[name]
end
function ElementPlayerSpawner:client_on_executed(...)

	-- Decompilation error in this vicinity:
	if not self._values.enabled then
		return 
	end

	slot3 = managers.player
	slot1 = managers.player.set_player_state

	if not self._values.state then
		slot6 = managers.player
		slot4 = managers.player.default_player_state(slot5)
	end

	slot1(slot2, slot3)

	slot4 = true

	self._end_transition(slot2, self)

	return 
end
function ElementPlayerSpawner:on_executed(instigator)

	-- Decompilation error in this vicinity:
	if not self._values.enabled then
		return 
	end

	slot4 = managers.player
	slot2 = managers.player.set_player_state

	if not self._values.state then
		slot7 = managers.player
		slot5 = managers.player.default_player_state(slot6)
	end

	slot2(slot3, slot4)

	slot4 = managers.groupai
	slot4 = managers.groupai.state(slot3)
	slot2 = managers.groupai.state(slot3).on_player_spawn_state_set

	if not self._values.state then
		slot7 = managers.player
		slot5 = managers.player.default_player_state(slot6)
	end

	slot2(slot3, slot4)

	slot7 = self

	managers.network.register_spawn_point(slot3, managers.network, self._unique_string_id({
		position = self._values.position,
		rotation = self._values.rotation
	}))

	slot5 = self._unit or instigator

	ElementPlayerSpawner.super.on_executed(slot3, self)

	slot4 = self

	self._end_transition(slot3)

	return 
end
function ElementPlayerSpawner:_end_transition(client)
	local cnt = managers.worldcollection.world_counter or 0
	local player_spawned = true

	if client then
		slot6 = managers.player

		if not managers.player.player_unit(slot5) then
			player_spawned = false
		end
	end

	slot7 = CoreWorldCollection.STAGE_LOAD_FINISHED

	if not managers.worldcollection.check_all_peers_synced_last_world(slot5, managers.worldcollection) or 0 < cnt or not player_spawned then
		slot9 = player_spawned

		Application.debug(slot5, Application, "[ElementPlayerSpawner:_end_transition()] Waiting...", client)

		slot11 = 0.5

		managers.queued_tasks.queue(slot5, managers.queued_tasks, nil, self._end_transition, self, client)

		return 
	end

	if managers.worldcollection.level_transition_in_progress and not managers.player._players_spawned then
		managers.player._players_spawned = true
		slot11 = ElementPlayerSpawner.BASE_DELAY

		managers.queued_tasks.queue(true, managers.queued_tasks, nil, managers.worldcollection.level_transition_ended, managers.worldcollection, nil)

		slot11 = ElementPlayerSpawner.BASE_DELAY + ElementPlayerSpawner.HIDE_LOADING_SCREEN_DELAY

		managers.queued_tasks.queue(true, managers.queued_tasks, nil, self._do_hide_loading_screen, self, nil)
	end

	return 
end
function ElementPlayerSpawner:_do_hide_loading_screen()
	slot3 = managers.raid_job

	if not managers.raid_job.is_camp_loaded(slot2) then
		slot3 = managers.player
	else
		slot3 = managers.player
		slot6 = managers.player
		slot6 = managers.player.player_timer(slot5)
		slot5 = {
			selection_wanted = PlayerInventory.SLOT_2
		}

		managers.player.get_current_state(slot2)._start_action_unequip_weapon(slot2, managers.player.get_current_state(slot2), managers.player.player_timer(slot5).time(slot5))
	end

	slot3 = managers.menu

	managers.menu.hide_loading_screen(slot2)

	slot8 = 0.2

	managers.queued_tasks.queue(slot2, managers.queued_tasks, nil, self._first_login_check, self, nil)

	return 
end
function ElementPlayerSpawner:_first_login_check()
	if managers.worldcollection.first_login_check then
		managers.worldcollection.first_login_check = false
		slot3 = managers.raid_menu

		managers.raid_menu.first_login_check(false)

		slot3 = managers.raid_menu

		if not managers.raid_menu.is_offline_mode(false) then
			slot3 = managers.event_system

			managers.event_system.on_camp_entered(slot2)
		end
	end

	return 
end
function ElementPlayerSpawner:destroy()
	slot3 = self

	ElementPlayerSpawner.super.destroy(slot2)

	slot5 = self

	managers.queued_tasks.unqueue_all(slot2, managers.queued_tasks, nil)

	return 
end

return 
