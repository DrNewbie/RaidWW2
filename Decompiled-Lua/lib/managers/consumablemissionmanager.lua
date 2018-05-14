-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
ConsumableMissionManager = ConsumableMissionManager or class()
ConsumableMissionManager.VERSION = 1
function ConsumableMissionManager:init()
	if not Global.consumable_missions_manager then
		Global.consumable_missions_manager = {
			inventory = {},
			intel_spawn_modifier = 0
		}
	end

	self._registered_intel_documents = {}
	self._peer_document_spawn_chances = {}

	return 
end
function ConsumableMissionManager:reset()
	Global.consumable_missions_manager = {
		inventory = {},
		intel_spawn_modifier = 0
	}
	self._registered_intel_documents = {}
	self._peer_document_spawn_chances = {}

	return 
end
function ConsumableMissionManager:system_start_raid()
	slot3 = managers.raid_job
	local current_job = managers.raid_job.current_job(slot2)

	if not current_job or not current_job.consumable then
		return 
	end

	slot5 = current_job.job_id

	if not self.is_mission_unlocked(slot3, self) then
		slot6 = current_job.job_id

		Application.error(slot3, Application, "[ConsumableMissionManager][system_start_raid] Attempting to start a consumable a mission that is not unlocked: ")

		return 
	end

	slot4 = Network

	if Network.is_server(slot3) then
		slot5 = current_job.job_id

		self.consume_mission(slot3, self)

		slot5 = SavefileManager.SETTING_SLOT

		managers.savefile.save_game(slot3, managers.savefile)
	end

	return 
end
function ConsumableMissionManager:register_document(unit, world_id)
	self._registered_intel_documents[world_id] = self._registered_intel_documents[world_id] or {}
	local loot_data = {
		unit = unit,
		world_id = world_id
	}
	slot7 = loot_data

	table.insert(slot5, self._registered_intel_documents[world_id])

	return 
end
function ConsumableMissionManager:plant_document_on_level(world_id)

	-- Decompilation error in this vicinity:
	slot5 = "[ConsumableMissionManager][plant_document_on_level]"

	Application.trace(slot3, Application)

	slot4 = Network
	local difficulty = (Global.game_settings and Global.game_settings.difficulty) or Global.DEFAULT_DIFFICULTY
	local difficulty_index = tweak_data.difficulty_to_index(slot4, tweak_data)
	local document_spawn_chance = -0.1
	slot7 = self

	if not self.is_any_mission_unlocked(difficulty) then
		document_spawn_chance = tweak_data.operations.consumable_missions.base_document_spawn_chance[difficulty_index]
		document_spawn_chance = document_spawn_chance + Global.consumable_missions_manager.intel_spawn_modifier
	end

	slot7 = self._peer_document_spawn_chances

	for index, chance_data in pairs(slot6) do
		if document_spawn_chance < chance_data.chance then
			document_spawn_chance = chance_data.chance
		end
	end

	local chosen_document_unit = nil
	slot11 = 1

	if math.random() <= math.clamp(slot8, document_spawn_chance, -1) then
		slot8 = self._registered_intel_documents[world_id]

		math.shuffle(slot7)

		chosen_document_unit = self._registered_intel_documents[world_id][1].unit
		slot8 = self

		self.reset_document_spawn_modifier(slot7)

		slot8 = managers.network
		slot9 = "reset_document_spawn_chance_modifier"

		managers.network.session(slot7).send_to_peers(slot7, managers.network.session(slot7))
	end

	slot8 = self._registered_intel_documents[world_id]

	for index, document in pairs(slot7) do
		slot13 = document.unit

		if alive(slot12) and document.unit ~= chosen_document_unit then
			slot14 = 0

			document.unit.set_slot(slot12, document.unit)
		end
	end

	self._registered_intel_documents[world_id] = nil

	return 
end
function ConsumableMissionManager:sync_document_spawn_chance()
	local document_spawn_chance = 0
	slot4 = self

	if not self.is_any_mission_unlocked(slot3) then
		local difficulty = (Global.game_settings and Global.game_settings.difficulty) or Global.DEFAULT_DIFFICULTY
		slot6 = difficulty
		local difficulty_index = tweak_data.difficulty_to_index(slot4, tweak_data)
		document_spawn_chance = tweak_data.operations.consumable_missions.base_document_spawn_chance[difficulty_index]
		document_spawn_chance = document_spawn_chance + Global.consumable_missions_manager.intel_spawn_modifier
	end

	slot4 = managers.network
	slot6 = document_spawn_chance

	managers.network.session(slot3).send_to_host(slot3, managers.network.session(slot3), "sync_document_spawn_chance")

	return 
end
function ConsumableMissionManager:on_document_spawn_chance_received(chance, peer_id)
	slot6 = {
		chance = chance,
		peer_id = peer_id
	}

	table.insert(slot4, self._peer_document_spawn_chances)

	return 
end
function ConsumableMissionManager:is_any_mission_unlocked()
	local any_mission_unlocked = false
	slot4 = Global.consumable_missions_manager.inventory

	for index, mission in pairs(slot3) do
		any_mission_unlocked = true

		break
	end

	return any_mission_unlocked
end
function ConsumableMissionManager:is_mission_unlocked(mission_name)
	return Global.consumable_missions_manager.inventory[mission_name] ~= nil
end
function ConsumableMissionManager:pickup_mission(mission_name)
	self._picked_up_missions = self._picked_up_missions or {}
	slot5 = mission_name

	table.insert(slot3, self._picked_up_missions)

	return 
end
function ConsumableMissionManager:reset_document_spawn_modifier()
	Global.consumable_missions_manager.intel_spawn_modifier = 0
	self._reset_spawn_modifier = true

	return 
end
function ConsumableMissionManager:on_level_exited(success)
	if self._level_exit_handled then
		return 
	end

	if success and self._picked_up_missions then
		if 0 < #self._picked_up_missions then
			slot4 = self._picked_up_missions

			for _, mission_name in ipairs(slot3) do
				slot10 = mission_name

				self._unlock_mission(slot8, self)

				Global.consumable_missions_manager.intel_spawn_modifier = 0
			end
		else
			slot7 = 1
			Global.consumable_missions_manager.intel_spawn_modifier = math.clamp(slot4, Global.consumable_missions_manager.intel_spawn_modifier + tweak_data.operations.consumable_missions.spawn_chance_modifier_increase, 0)
		end
	end

	if self._reset_spawn_modifier then
		Global.consumable_missions_manager.intel_spawn_modifier = 0
		self._reset_spawn_modifier = false
	end

	self._picked_up_missions = {}
	self._registered_intel_documents = {}
	self._peer_document_spawn_chances = {}
	self._level_exit_handled = true

	return 
end
function ConsumableMissionManager:on_mission_started()
	self._level_exit_handled = false
	slot3 = self

	self.system_start_raid(slot2)

	return 
end
function ConsumableMissionManager:on_mission_completed(success)
	self._level_exit_handled = false

	return 
end
function ConsumableMissionManager:_unlock_mission(mission_name)
	slot6 = mission_name

	Application.trace(slot3, Application, "[ConsumableMissionManager][_unlock_mission] Unlocking the mission: ")

	slot5 = mission_name

	if self.is_mission_unlocked(slot3, self) then
		slot6 = mission_name

		Application.error(slot3, Application, "[ConsumableMissionManager][_unlock_mission] Attempting to unlock a mission that is already unlocked: ")

		return 
	end

	slot5 = mission_name
	local mission_data = tweak_data.operations.mission_data(slot3, tweak_data.operations)

	if not mission_data.consumable then
		slot7 = mission_name

		Application.error(slot4, Application, "[ConsumableMissionManager][_unlock_mission] Attempting to unlock a mission that is not consumable: ")

		return 
	end

	Global.consumable_missions_manager.inventory[mission_name] = true
	slot7 = {
		mission_name
	}

	managers.breadcrumb.add_breadcrumb(true, managers.breadcrumb, BreadcrumbManager.CATEGORY_CONSUMABLE_MISSION)

	return 
end
function ConsumableMissionManager:consume_mission(mission_name)
	slot6 = mission_name

	Application.trace(slot3, Application, "[ConsumableMissionManager:consume_mission] Consuming the mission: ")

	Global.consumable_missions_manager.inventory[mission_name] = nil

	return 
end
function ConsumableMissionManager:save(data)
	local state = {
		version = ConsumableMissionManager.VERSION,
		inventory = {},
		intel_spawn_modifier = Global.consumable_missions_manager.intel_spawn_modifier
	}
	slot5 = Global.consumable_missions_manager.inventory

	for mission_name, _ in pairs(slot4) do
		slot11 = mission_name

		table.insert(slot9, state.inventory)
	end

	data.ConsumableMissionManager = state

	return 
end
function ConsumableMissionManager:load(data, version)
	Global.consumable_missions_manager.inventory = {}
	Global.consumable_missions_manager.intel_spawn_modifier = 0
	local state = data.ConsumableMissionManager

	if not state then
		return 
	end

	if state.version and state.version ~= ConsumableMissionManager.VERSION then
		slot11 = ". Resetting the inventory."

		Application.error(slot5, Application, "[ConsumableMissionManager:load] Saved consumable missions version: ", state.version, ", current version: ", ConsumableMissionManager.VERSION)

		return 
	end

	Global.consumable_missions_manager.intel_spawn_modifier = state.intel_spawn_modifier or 0
	slot6 = state.inventory

	for _, mission_name in ipairs(slot5) do
		slot12 = mission_name
		local mission_data = tweak_data.operations.mission_data(slot10, tweak_data.operations)

		if not mission_data or not mission_data.consumable then
			slot14 = mission_name

			Application.error(slot11, Application, "[ConsumableMissionManager:load] Mission no longer exists or is not consumable: ")
		else
			Global.consumable_missions_manager.inventory[mission_name] = true
		end
	end

	return 
end

return 
