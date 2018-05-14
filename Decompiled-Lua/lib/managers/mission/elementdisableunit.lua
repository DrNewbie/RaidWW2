slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementDisableUnit then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementDisableUnit = slot0
function ElementDisableUnit:init(...)
	slot3 = self

	ElementDisableUnit.super.init(slot2, ...)

	self._units = {}

	return 
end
function ElementDisableUnit:on_script_activated()
	local elementBroken = false
	slot4 = self._values.unit_ids

	for _, id in ipairs(slot3) do
		slot15 = "_load_unit"
		slot11 = callback(slot12, self, self)
		slot14 = self._mission_script
		local unit = managers.worldcollection.get_unit_with_id(slot8, managers.worldcollection, id, self._mission_script.sync_id(self))

		if unit then
			slot11 = unit

			table.insert(slot9, self._units)
		end
	end

	self._has_fetched_units = true
	slot5 = self._id

	self._mission_script.add_save_state_cb(slot3, self._mission_script)

	return 
end
function ElementDisableUnit:_load_unit(unit)
	slot5 = unit

	table.insert(slot3, self._units)

	return 
end
function ElementDisableUnit:client_on_executed(...)
	slot3 = self

	self.on_executed(slot2, ...)

	return 
end
function ElementDisableUnit:on_executed(instigator)
	self._has_executed = true

	if not self._values.enabled then
		return 
	end

	slot4 = self._units

	for _, unit in ipairs(slot3) do
		if self._values.destroy_units then
			slot9 = unit

			if alive(slot8) then
				slot10 = 0

				unit.set_slot(slot8, unit)
			end
		else
			slot10 = unit

			managers.game_play_central.mission_disable_unit(slot8, managers.game_play_central)
		end
	end

	slot5 = instigator

	ElementDisableUnit.super.on_executed(slot3, self)

	return 
end
function ElementDisableUnit:save(data)
	data.save_me = true
	data.enabled = self._values.enabled
	data.executed = self._has_executed

	return 
end
function ElementDisableUnit:load(data)
	if not self._has_fetched_units then
		slot4 = self

		self.on_script_activated(slot3)
	end

	slot5 = data.enabled

	self.set_enabled(slot3, self)

	if data.executed then
		self._has_executed = true
		slot4 = self._units

		for _, unit in ipairs(slot3) do
			if self._values.destroy_units then
				slot9 = unit

				if alive(slot8) then
					slot10 = 0

					unit.set_slot(slot8, unit)
				end
			end
		end
	end

	return 
end

return 
