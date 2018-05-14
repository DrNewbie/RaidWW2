slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementEnableUnit then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementEnableUnit = slot0
function ElementEnableUnit:init(...)
	slot3 = self

	ElementEnableUnit.super.init(slot2, ...)

	self._units = {}

	return 
end
function ElementEnableUnit:on_script_activated()
	slot3 = self._values.unit_ids

	for _, id in ipairs(slot2) do
		slot14 = "_load_unit"
		slot10 = callback(slot11, self, self)
		slot13 = self._mission_script
		local unit = managers.worldcollection.get_unit_with_id(slot7, managers.worldcollection, id, self._mission_script.sync_id(self))

		if unit then
			slot10 = unit

			table.insert(slot8, self._units)
		end
	end

	self._has_fetched_units = true
	slot4 = self._id

	self._mission_script.add_save_state_cb(slot2, self._mission_script)

	return 
end
function ElementEnableUnit:_load_unit(unit)
	slot5 = unit

	table.insert(slot3, self._units)

	return 
end
function ElementEnableUnit:client_on_executed(...)
	slot3 = self

	self.on_executed(slot2, ...)

	return 
end
function ElementEnableUnit:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	slot4 = self._units

	for _, unit in ipairs(slot3) do
		slot10 = unit

		managers.game_play_central.mission_enable_unit(slot8, managers.game_play_central)
	end

	slot5 = instigator

	ElementEnableUnit.super.on_executed(slot3, self)

	return 
end
function ElementEnableUnit:save(data)
	data.save_me = true
	data.enabled = self._values.enabled

	return 
end
function ElementEnableUnit:load(data)
	if not self._has_fetched_units then
		slot4 = self

		self.on_script_activated(slot3)
	end

	slot5 = data.enabled

	self.set_enabled(slot3, self)

	return 
end

return 
