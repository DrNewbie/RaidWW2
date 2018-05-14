slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementEnemyPreferedAdd then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementEnemyPreferedAdd = slot0
function ElementEnemyPreferedAdd:init(...)
	slot3 = self

	ElementEnemyPreferedAdd.super.init(slot2, ...)

	return 
end
function ElementEnemyPreferedAdd:on_script_activated()
	self._values.spawn_points = self._values.spawn_points or self._values.elements

	if not self._values.spawn_points and not self._values.spawn_groups then
		return 
	end

	self._group_data = {}

	if self._values.spawn_points then
		self._group_data.spawn_points = {}
		slot3 = self._values.spawn_points

		for _, id in ipairs() do
			slot9 = id
			local element = self.get_mission_element(slot7, self)
			slot10 = element

			table.insert(self, self._group_data.spawn_points)
		end
	end

	if self._values.spawn_groups then
		self._group_data.spawn_groups = {}
		slot3 = self._values.spawn_groups

		for _, id in ipairs() do
			slot9 = id
			local element = self.get_mission_element(slot7, self)
			slot10 = element

			table.insert(self, self._group_data.spawn_groups)
		end
	end

	return 
end
function ElementEnemyPreferedAdd:add()
	if not self._group_data then
		return 
	end

	if self._group_data.spawn_points then
		slot3 = managers.groupai
		slot6 = self
		slot5 = self._group_data.spawn_points

		managers.groupai.state(slot2).add_preferred_spawn_points(slot2, managers.groupai.state(slot2), self._unique_string_id(slot5))
	end

	if self._group_data.spawn_groups then
		slot3 = managers.groupai
		slot6 = self
		slot5 = self._group_data.spawn_groups

		managers.groupai.state(slot2).add_preferred_spawn_groups(slot2, managers.groupai.state(slot2), self._unique_string_id(slot5))
	end

	return 
end
function ElementEnemyPreferedAdd:remove()
	slot3 = managers.groupai
	slot3 = managers.groupai.state(slot2)
	slot6 = self

	managers.groupai.state(slot2).remove_preferred_spawn_points(slot2, self._unique_string_id(slot5))

	return 
end
function ElementEnemyPreferedAdd:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	slot4 = self

	self.add(slot3)

	slot5 = instigator

	ElementEnemyPreferedAdd.super.on_executed(slot3, self)

	return 
end

if not ElementEnemyPreferedRemove then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementEnemyPreferedRemove = slot0
function ElementEnemyPreferedRemove:init(...)
	slot3 = self

	ElementEnemyPreferedRemove.super.init(slot2, ...)

	return 
end
function ElementEnemyPreferedRemove:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	slot4 = self._values.elements

	for _, id in ipairs(slot3) do
		slot10 = id
		local element = self.get_mission_element(slot8, self)

		if element then
			slot10 = element

			element.remove(slot9)
		end
	end

	slot5 = instigator

	ElementEnemyPreferedRemove.super.on_executed(slot3, self)

	return 
end

return 
