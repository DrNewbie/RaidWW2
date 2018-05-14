-- Decompilation Error: _glue_flows(node)

slot3 = "CoreElementArea"

core.import(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

if not ElementAreaTrigger then
	slot2 = CoreElementArea.ElementAreaTrigger
	slot0 = class(slot1)
end

ElementAreaTrigger = slot0
function ElementAreaTrigger:init(...)
	slot3 = self

	ElementAreaTrigger.super.init(slot2, ...)

	return 
end
function ElementAreaTrigger:project_instigators()
	local instigators = {}
	slot4 = Network

	if Network.is_client(slot3) then
		if self._values.instigator == "player" or self._values.instigator == "local_criminals" or self._values.instigator == "persons" then
			slot4 = instigators
			slot7 = managers.player

			table.insert(slot3, managers.player.player_unit(slot6))
		end

		return instigators
	end

	if self._values.instigator == "player" then
		slot4 = instigators
		slot7 = managers.player

		table.insert(slot3, managers.player.player_unit(slot6))
	elseif self._values.instigator == "player_not_in_vehicle" then
		slot4 = instigators
		slot7 = managers.player

		table.insert(slot3, managers.player.player_unit(slot6))
	elseif self._values.instigator == "vehicle" then
		local vehicles = managers.vehicle.get_all_vehicles(slot3)
		slot5 = vehicles

		for _, v in pairs(managers.vehicle) do
			slot10 = v

			if not v.npc_vehicle_driving(slot9) then
				slot11 = v

				table.insert(slot9, instigators)
			end
		end
	elseif self._values.instigator == "npc_vehicle" then
		local vehicles = managers.vehicle.get_all_vehicles(slot3)
		slot5 = vehicles

		for _, v in pairs(managers.vehicle) do
			slot10 = v

			if v.npc_vehicle_driving(slot9) then
				slot11 = v

				table.insert(slot9, instigators)
			end
		end
	elseif self._values.instigator == "vehicle_with_players" then
		local vehicles = managers.vehicle.get_all_vehicles(slot3)
		slot5 = vehicles

		for _, v in pairs(managers.vehicle) do
			slot11 = v

			table.insert(slot9, instigators)
		end
	elseif self._values.instigator == "enemies" then
		slot4 = managers.groupai
		slot4 = managers.groupai.state(slot3)

		if managers.groupai.state(slot3).police_hostage_count(slot3) <= 0 then
			slot6 = managers.enemy

			for _, data in pairs(managers.enemy.all_enemies(slot5)) do
				slot10 = data.unit

				table.insert(slot8, instigators)
			end
		else
			slot6 = managers.enemy

			for _, data in pairs(managers.enemy.all_enemies(slot5)) do
				slot9 = data.unit

				if not data.unit.anim_data(slot8).surrender then
					slot10 = data.unit

					table.insert(slot8, instigators)
				end
			end
		end
	elseif self._values.instigator == "civilians" then
		slot6 = managers.enemy

		for _, data in pairs(managers.enemy.all_civilians(slot5)) do
			slot10 = data.unit

			table.insert(slot8, instigators)
		end
	elseif self._values.instigator == "escorts" then
		slot6 = managers.enemy

		for _, data in pairs(managers.enemy.all_civilians(slot5)) do
			slot10 = data.unit

			if tweak_data.character[data.unit.base(slot9)._tweak_table].is_escort then
				slot10 = data.unit

				table.insert(slot8, instigators)
			end
		end
	elseif self._values.instigator == "criminals" then
		slot6 = managers.groupai
		slot6 = managers.groupai.state(slot5)

		for _, data in pairs(managers.groupai.state(slot5).all_char_criminals(slot5)) do
			slot10 = data.unit

			table.insert(slot8, instigators)
		end
	elseif self._values.instigator == "local_criminals" then
		slot4 = instigators
		slot7 = managers.player

		table.insert(slot3, managers.player.player_unit(slot6))

		slot6 = managers.groupai
		slot6 = managers.groupai.state(managers.player.player_unit)

		for _, data in pairs(managers.groupai.state(managers.player.player_unit).all_AI_criminals(managers.player.player_unit)) do
			slot10 = data.unit

			table.insert(slot8, instigators)
		end
	elseif self._values.instigator == "persons" then
		slot4 = instigators
		slot7 = managers.player

		table.insert(slot3, managers.player.player_unit(slot6))

		slot6 = managers.groupai
		slot6 = managers.groupai.state(managers.player.player_unit)

		for _, data in pairs(managers.groupai.state(managers.player.player_unit).all_char_criminals(managers.player.player_unit)) do
			slot10 = data.unit

			table.insert(slot8, instigators)
		end

		slot6 = managers.enemy

		for _, data in pairs(managers.enemy.all_civilians(slot5)) do
			slot10 = data.unit

			table.insert(slot8, instigators)
		end

		slot6 = managers.enemy

		for _, data in pairs(managers.enemy.all_enemies(slot5)) do
			slot10 = data.unit

			table.insert(slot8, instigators)
		end
	elseif self._values.instigator == "ai_teammates" then
		slot6 = managers.groupai
		slot6 = managers.groupai.state(slot5)

		for _, data in pairs(managers.groupai.state(slot5).all_AI_criminals(slot5)) do
			slot10 = data.unit

			table.insert(slot8, instigators)
		end
	elseif self._values.instigator == "loot" or self._values.instigator == "unique_loot" then
		slot6 = 14
		local all_found = World.find_units_quick(slot3, World, "all")
		slot5 = all_found

		for _, unit in ipairs(World) do
			slot10 = unit
			local carry_data = unit.carry_data(slot9)

			if carry_data then
				slot11 = carry_data
				local carry_id = carry_data.carry_id(slot10)

				if (self._values.instigator == "loot" and tweak_data.carry[carry_id] ~= nil) or (self._values.instigator == "unique_loot" and tweak_data.carry[carry_id].is_unique_loot) then
					slot13 = unit

					table.insert(slot11, instigators)
				end
			end
		end
	end

	return instigators
end
function ElementAreaTrigger:project_amount_all()
	if self._values.instigator == "criminals" or self._values.instigator == "local_criminals" then
		local i = 0
		slot6 = managers.groupai
		slot6 = managers.groupai.state(slot5)

		for _, data in pairs(managers.groupai.state(slot5).all_char_criminals(slot5)) do
			i = i + 1
		end

		return i
	elseif self._values.instigator == "ai_teammates" then
		local i = 0
		slot6 = managers.groupai
		slot6 = managers.groupai.state(slot5)

		for _, data in pairs(managers.groupai.state(slot5).all_AI_criminals(slot5)) do
			i = i + 1
		end

		return i
	end

	slot3 = managers.network
	slot3 = managers.network.session(slot2)

	return managers.network.session(slot2).amount_of_alive_players(slot2)
end
function ElementAreaTrigger:project_amount_inside()
	local counter = #self._inside

	if self._values.instigator == "vehicle_with_players" then
		slot4 = self._inside

		for _, instigator in pairs(slot3) do
			slot9 = instigator
			local vehicle = instigator.vehicle_driving(slot8)

			if vehicle then
				slot10 = vehicle
				counter = vehicle.num_players_inside(slot9)
			end
		end
	elseif self._values.instigator == "player_not_in_vehicle" then
		counter = 0
		local vehicles = managers.vehicle.get_all_vehicles(slot3)
		slot5 = self._inside

		for _, instigator in pairs(managers.vehicle) do
			local in_vehicle = false
			slot11 = vehicles

			for _, vehicle in pairs(slot10) do
				if not in_vehicle then
					slot16 = vehicle
					slot17 = instigator
					in_vehicle = vehicle.vehicle_driving(slot15).find_seat_for_player(slot15, vehicle.vehicle_driving(slot15))
				end
			end

			if not in_vehicle then
				counter = counter + 1
			end
		end
	end

	return counter
end
function ElementAreaTrigger:is_instigator_valid(unit)
	if self._values.instigator == "vehicle_with_players" and unit then
		local result = false

		if self._values.amount == "all" then
			slot5 = self
			slot3 = self.project_amount_all(slot4)
		else
			slot3 = false

			if false then
				local amount = true
			end
		end

		if not amount then
			slot6 = self._values.amount
			amount = tonumber(slot5)
		end

		slot6 = unit
		local inside_vehicle = unit.vehicle_driving(slot5).num_players_inside(slot5)
		slot7 = unit

		if unit.vehicle_driving(unit.vehicle_driving(slot5)) and 0 < inside_vehicle and amount <= inside_vehicle then
			result = true
		end

		return result
	elseif self._values.instigator == "player_not_in_vehicle" then
		local vehicles = managers.vehicle.get_all_vehicles(slot3)
		slot5 = self._inside

		for _, instigator in pairs(managers.vehicle) do
			slot10 = vehicles

			for _, vehicle in pairs(slot9) do
				slot15 = vehicle
				slot16 = instigator

				if vehicle.vehicle_driving(slot14).find_seat_for_player(slot14, vehicle.vehicle_driving(slot14)) then
					return false
				end
			end
		end
	end

	return true
end
slot3 = ElementAreaTrigger

CoreClass.override_class(function (self, unit)
	if self._values.instigator == "vehicle_with_players" and unit then
		local result = false

		if self._values.amount == "all" then
			slot5 = self
			slot3 = self.project_amount_all(slot4)
		else
			slot3 = false

			if false then
				local amount = true
			end
		end

		if not amount then
			slot6 = self._values.amount
			amount = tonumber(slot5)
		end

		slot6 = unit
		local inside_vehicle = unit.vehicle_driving(slot5).num_players_inside(slot5)
		slot7 = unit

		if unit.vehicle_driving(unit.vehicle_driving(slot5)) and 0 < inside_vehicle and amount <= inside_vehicle then
			result = true
		end

		return result
	elseif self._values.instigator == "player_not_in_vehicle" then
		local vehicles = managers.vehicle.get_all_vehicles(slot3)
		slot5 = self._inside

		for _, instigator in pairs(managers.vehicle) do
			slot10 = vehicles

			for _, vehicle in pairs(slot9) do
				slot15 = vehicle
				slot16 = instigator

				if vehicle.vehicle_driving(slot14).find_seat_for_player(slot14, vehicle.vehicle_driving(slot14)) then
					return false
				end
			end
		end
	end

	return true
end, CoreElementArea.ElementAreaTrigger)

return 
