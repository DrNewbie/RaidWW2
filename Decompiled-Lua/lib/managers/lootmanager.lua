LootManager = LootManager or class()
function LootManager:init()
	slot3 = self

	self._setup(slot2)

	return 
end
function LootManager:_setup()
	local distribute = {}
	local saved_secured = {}

	if Global.loot_manager and Global.loot_manager.secured then
		slot5 = Global.loot_manager.secured
		saved_secured = deep_clone(slot4)
		slot5 = Global.loot_manager.secured

		for _, data in ipairs(slot4) do
			slot11 = data

			table.insert(slot9, distribute)
		end
	end

	Global.loot_manager = {
		secured = {},
		distribute = distribute,
		saved_secured = saved_secured
	}
	self._global = Global.loot_manager
	self._triggers = {}
	self._respawns = {}

	return 
end
function LootManager:clear()
	Global.loot_manager = nil

	return 
end
function LootManager:reset()
	Global.loot_manager = nil
	slot3 = self

	self._setup(nil)

	return 
end
function LootManager:on_simulation_ended()
	self._respawns = {}

	return 
end
function LootManager:add_trigger(id, type, amount, callback)
	self._triggers[type] = self._triggers[type] or {}
	self._triggers[type][id] = {
		amount = amount,
		callback = callback
	}

	return 
end
function LootManager:_check_triggers(type)
	slot5 = type

	print(slot3, "LootManager:_check_triggers")

	if not self._triggers[type] then
		return 
	end

	if type == "report_only" then
		slot4 = self._triggers[type]

		for id, cb_data in pairs(slot3) do
			cb_data.callback()
		end
	else
		slot5 = type

		debug_pause(slot3, "[LootManager:_check_triggers] Unsupported trigger type!")
	end

	return 
end
function LootManager:on_restart_to_camp()
	slot3 = self

	self.clear(slot2)

	return 
end
function LootManager:get_secured()
	slot4 = 1

	return table.remove(slot2, self._global.secured)
end
function LootManager:get_secured_random()
	local entry = math.random(slot2)
	slot5 = entry

	return table.remove(#self._global.secured, self._global.secured)
end
function LootManager:get_distribute()
	slot4 = 1

	return table.remove(slot2, self._global.distribute)
end
function LootManager:get_respawn()
	slot4 = 1

	return table.remove(slot2, self._respawns)
end
function LootManager:add_to_respawn(carry_id, multiplier)
	slot6 = {
		carry_id = carry_id,
		multiplier = multiplier
	}

	table.insert(slot4, self._respawns)

	return 
end
function LootManager:on_job_deactivated()
	slot3 = self

	self.clear(slot2)

	return 
end
function LootManager:secure(carry_id, multiplier_level, silent)
	slot6 = Network

	if Network.is_server(slot5) then
		slot9 = silent

		self.server_secure_loot(slot5, self, carry_id, multiplier_level)
	else
		slot6 = managers.network
		slot9 = multiplier_level

		managers.network.session(slot5).send_to_host(slot5, managers.network.session(slot5), "server_secure_loot", carry_id)
	end

	return 
end
function LootManager:server_secure_loot(carry_id, multiplier_level, silent)
	slot6 = managers.network
	slot10 = silent

	managers.network.session(slot5).send_to_peers_synched(slot5, managers.network.session(slot5), "sync_secure_loot", carry_id, multiplier_level)

	slot9 = silent

	self.sync_secure_loot(slot5, self, carry_id, multiplier_level)

	return 
end
function LootManager:sync_secure_loot(carry_id, multiplier_level, silent)
	local multiplier = 1
	slot8 = {
		carry_id = carry_id,
		multiplier = multiplier
	}

	table.insert(slot6, self._global.secured)

	slot8 = "report_only"

	self._check_triggers(slot6, self)

	if not silent then
		slot9 = multiplier

		self._present(slot6, self, carry_id)
	end

	return 
end
function LootManager:_present(carry_id, multiplier)
	local real_value = 0
	local carry_data = tweak_data.carry[carry_id]
	slot8 = "hud_loot_secured_title"
	local title = managers.localization.text(slot6, managers.localization)

	if carry_data.name_id then
		slot9 = carry_data.name_id
		local type_text = managers.localization.text(slot7, managers.localization)
	end

	slot11 = {
		AMOUNT = "",
		CARRY_TYPE = type_text
	}
	local text = managers.localization.text(slot8, managers.localization, "hud_loot_secured")
	local icon = nil
	slot12 = {
		time = 4,
		text = text,
		title = title,
		icon = icon
	}

	managers.hud.present_mid_text("hud_loot_secured", managers.hud)

	return 
end
function LootManager:sync_save(data)
	data.LootManager = self._global

	return 
end
function LootManager:sync_load(data)
	self._global = data.LootManager
	slot4 = self._global.secured

	for _, data in ipairs(slot3) do
		if data.multiplier and 2 < data.multiplier then
			data.multiplier = 2
		end
	end

	return 
end

return 
