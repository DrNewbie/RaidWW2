slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementSpawnEnemyGroup then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementSpawnEnemyGroup = slot0
function ElementSpawnEnemyGroup:init(...)
	slot3 = self

	ElementSpawnEnemyGroup.super.init(slot2, ...)

	self._group_data = {
		amount = self._values.amount,
		spawn_type = self._values.spawn_type,
		ignore_disabled = self._values.ignore_disabled,
		spawn_points = {}
	}
	self._unused_randoms = {}
	slot3 = self

	self._finalize_values()

	return 
end
function ElementSpawnEnemyGroup:_finalize_values()
	local values = self._values

	if values.team == "default" then
		values.team = nil
	end

	return 
end
function ElementSpawnEnemyGroup:on_script_activated()
	slot3 = self._values.elements

	for i, id in ipairs(slot2) do
		slot9 = id
		local element = self.get_mission_element(slot7, self)
		slot10 = i

		table.insert(self, self._unused_randoms)

		slot10 = element

		table.insert(self, self._group_data.spawn_points)
	end

	return 
end
function ElementSpawnEnemyGroup:add_event_callback(name, callback)
	slot5 = self._values.elements

	for _, id in ipairs(slot4) do
		slot11 = id
		local element = self.get_mission_element(slot9, self)
		slot13 = callback

		element.add_event_callback(self, element, name)
	end

	return 
end
function ElementSpawnEnemyGroup:_check_spawn_points()
	self._spawn_points = {}

	if not self._group_data.ignore_disabled then
		self._spawn_points = self._group_data.spawn_points

		return 
	end

	self._unused_randoms = {}
	local i = 1
	slot4 = self._group_data.spawn_points

	for _, element in pairs(slot3) do
		slot9 = element

		if element.enabled(slot8) then
			slot10 = i

			table.insert(slot8, self._unused_randoms)

			slot10 = element

			table.insert(slot8, self._spawn_points)

			i = i + 1
		end
	end

	return 
end
function ElementSpawnEnemyGroup:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	slot4 = self

	self._check_spawn_points(slot3)

	if 0 < #self._spawn_points then
		if self._group_data.spawn_type == "group" then
			slot4 = managers.groupai
			slot7 = self._spawn_points
			local spawn_group_data = managers.groupai.state(slot3).create_spawn_group(slot3, managers.groupai.state(slot3), self._id, self)
			slot5 = managers.groupai
			slot8 = self._values.preferred_spawn_groups

			managers.groupai.state(managers.groupai.state(slot3)).force_spawn_group(managers.groupai.state(slot3), managers.groupai.state(managers.groupai.state(slot3)), spawn_group_data, self._values.nationality)
		else
			slot6 = self._group_data.amount

			for i = 1, self.get_random_table_value(slot4, self), 1 do
				slot10 = i
				local element = self._spawn_points[self._get_spawn_point(slot8, self)]
				slot10 = {
					team = self._values.team
				}

				element.produce(slot8, element)
			end
		end
	end

	slot5 = instigator

	ElementSpawnEnemyGroup.super.on_executed(slot3, self)

	return 
end
function ElementSpawnEnemyGroup:_get_spawn_point(i)
	if self._group_data.spawn_type == "ordered" then
		slot5 = #self._spawn_points

		return 1 + math.mod(slot3, i)
	end

	if #self._unused_randoms == 0 then
		for i = 1, #self._spawn_points, 1 do
			slot9 = i

			table.insert(slot7, self._unused_randoms)
		end
	end

	local rand = math.random(slot3)
	slot6 = rand

	return table.remove(#self._unused_randoms, self._unused_randoms)
end
function ElementSpawnEnemyGroup:units()
	local all_units = {}
	slot4 = self._group_data.spawn_points

	for _, element in ipairs(slot3) do
		local element_units = element.units(slot8)
		slot10 = element_units

		for _, unit in ipairs(element) do
			slot16 = unit

			table.insert(slot14, all_units)
		end
	end

	return all_units
end
function ElementSpawnEnemyGroup:unspawn_all_units()
	slot3 = self._group_data.spawn_points

	for _, element in ipairs(slot2) do
		slot8 = element

		element.unspawn_all_units(slot7)
	end

	return 
end
function ElementSpawnEnemyGroup:kill_all_units()
	slot3 = self._group_data.spawn_points

	for _, element in ipairs(slot2) do
		slot8 = element

		element.kill_all_units(slot7)
	end

	return 
end
function ElementSpawnEnemyGroup:execute_on_all_units(func)
	slot4 = self._group_data.spawn_points

	for _, element in ipairs(slot3) do
		slot10 = func

		element.execute_on_all_units(slot8, element)
	end

	return 
end
function ElementSpawnEnemyGroup:spawn_points()
	return self._group_data.spawn_points
end
function ElementSpawnEnemyGroup:spawn_groups()
	return self._values.preferred_spawn_groups
end
function ElementSpawnEnemyGroup:nationality()
	return self._values.nationality or "german"
end

return 
