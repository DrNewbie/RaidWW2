slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementLootBag then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementLootBag = slot0
function ElementLootBag:init(...)
	slot3 = self

	ElementLootBag.super.init(slot2, ...)

	self._triggers = {}

	return 
end
function ElementLootBag:client_on_executed(...)
	return 
end
function ElementLootBag:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	local unit = nil
	slot5 = self
	local pos, rot = self.get_orientation(slot4)

	if self._values.carry_id ~= "none" then
		if not self._values.push_multiplier or not (self._values.spawn_dir * self._values.push_multiplier) then
			slot9 = 0
			local dir = Vector3(slot6, 0, 0)
		end

		unit = managers.player.server_drop_carry(slot7, managers.player, self._values.carry_id, 1, true, false, 1, pos, rot, dir, 0, nil)
	elseif self._values.from_respawn then
		slot7 = managers.loot
		local loot = managers.loot.get_respawn(slot6)

		if loot then
			if not self._values.push_multiplier or not (self._values.spawn_dir * self._values.push_multiplier) then
				slot10 = 0
				local dir = Vector3(slot7, 0, 0)
			end

			unit = managers.player.server_drop_carry(slot8, managers.player, loot.carry_id, loot.multiplier, true, false, 1, pos, rot, dir, 0, nil)
		else
			slot8 = "NO MORE LOOT TO RESPAWN"

			print(slot7)
		end
	else
		slot7 = managers.loot
		local loot = managers.loot.get_distribute(slot6)

		if loot then
			if not self._values.push_multiplier or not (self._values.spawn_dir * self._values.push_multiplier) then
				slot10 = 0
				local dir = Vector3(slot7, 0, 0)
			end

			unit = managers.player.server_drop_carry(slot8, managers.player, loot.carry_id, loot.multiplier, true, false, 1, pos, rot, dir, 0, nil)
		else
			slot8 = "NO MORE LOOT TO DISTRIBUTE"

			print(slot7)
		end
	end

	slot7 = unit

	if alive(slot6) then
		slot9 = unit

		self._check_triggers(slot6, self, "spawn")

		slot7 = unit
		slot8 = self

		unit.carry_data(slot6).set_mission_element(slot6, unit.carry_data(slot6))
	end

	slot8 = instigator

	ElementLootBag.super.on_executed(slot6, self)

	return 
end
function ElementLootBag:add_trigger(id, type, callback)
	self._triggers[type] = self._triggers[type] or {}
	self._triggers[type][id] = {
		callback = callback
	}

	return 
end
function ElementLootBag:_check_triggers(type, instigator)
	if not self._triggers[type] then
		return 
	end

	slot5 = self._triggers[type]

	for id, cb_data in pairs(slot4) do
		slot10 = instigator

		cb_data.callback(slot9)
	end

	return 
end
function ElementLootBag:trigger(type, instigator)
	slot7 = instigator

	self._check_triggers(slot4, self, type)

	return 
end

if not ElementLootBagTrigger then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementLootBagTrigger = slot0
function ElementLootBagTrigger:init(...)
	slot3 = self

	ElementLootBagTrigger.super.init(slot2, ...)

	return 
end
function ElementLootBagTrigger:on_script_activated()
	slot3 = self._values.elements

	for _, id in ipairs(slot2) do
		slot9 = id
		local element = self.get_mission_element(slot7, self)
		slot11 = self._values.trigger_type
		slot16 = "on_executed"

		element.add_trigger(self, element, self._id, callback(slot13, self, self))
	end

	return 
end
function ElementLootBagTrigger:client_on_executed(...)
	return 
end
function ElementLootBagTrigger:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	slot5 = instigator

	ElementLootBagTrigger.super.on_executed(slot3, self)

	return 
end

return 
