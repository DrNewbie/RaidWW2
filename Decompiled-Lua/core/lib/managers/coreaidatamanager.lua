slot3 = "CoreAiDataManager"

core.module(slot1, core)

slot3 = "CoreTable"

core.import(slot1, core)

AiDataManager = AiDataManager or class()
AiDataManager.init = function (self)
	slot3 = self

	self._setup(slot2)

	return 
end
AiDataManager._setup = function (self)
	self._data = {
		patrol_paths = {}
	}

	return 
end
AiDataManager.add_patrol_path = function (self, name)
	if self._data.patrol_paths[name] then
		slot5 = "Patrol path with name " .. name .. " already exists!"

		Application.error(slot3, Application)

		return false
	end

	self._data.patrol_paths[name] = {
		points = {}
	}

	return true
end
AiDataManager.remove_patrol_path = function (self, name)
	if not self._data.patrol_paths[name] then
		slot5 = "Patrol path with name " .. name .. " doesn't exist!"

		Application.error(slot3, Application)

		return false
	end

	self._data.patrol_paths[name] = nil

	return true
end
AiDataManager.add_patrol_point = function (self, name, unit)
	if not self._data.patrol_paths[name] then
		slot6 = "Patrol path with name " .. name .. " doesn't exist!"

		Application.error(slot4, Application)

		return 
	end

	local t = {}
	slot6 = unit
	t.position = unit.position(slot5)
	slot6 = unit
	t.rotation = unit.rotation(slot5)
	t.unit = unit
	slot6 = unit
	t.unit_id = unit.unit_data(slot5).unit_id
	slot7 = t

	table.insert(slot5, self._data.patrol_paths[name].points)

	return 
end
AiDataManager.delete_point_by_unit = function (self, unit)
	slot4 = self._data.patrol_paths

	for name, path in pairs(slot3) do
		slot9 = path.points

		for i, point in ipairs(slot8) do
			if point.unit == unit then
				slot15 = i

				table.remove(slot13, path.points)

				return 
			end
		end
	end

	return 
end
AiDataManager.patrol_path_by_unit = function (self, unit)
	slot4 = self._data.patrol_paths

	for name, path in pairs(slot3) do
		slot9 = path.points

		for i, point in ipairs(slot8) do
			if point.unit == unit then
				return name, path
			end
		end
	end

	return 
end
AiDataManager.patrol_point_index_by_unit = function (self, unit)
	slot4 = self._data.patrol_paths

	for name, path in pairs(slot3) do
		slot9 = path.points

		for i, point in ipairs(slot8) do
			if point.unit == unit then
				return i, point
			end
		end
	end

	return 
end
AiDataManager.patrol_path = function (self, name)
	return self._data.patrol_paths[name]
end
AiDataManager.all_patrol_paths = function (self)
	return self._data.patrol_paths
end
AiDataManager.patrol_path_names = function (self)
	local t = {}
	slot4 = self._data.patrol_paths

	for name, path in pairs(slot3) do
		slot10 = name

		table.insert(slot8, t)
	end

	slot4 = t

	table.sort(slot3)

	return t
end
AiDataManager.destination_path = function (self, position, rotation)
	return {
		points = {
			{
				position = position,
				rotation = rotation
			}
		}
	}
end
AiDataManager.clear = function (self)
	slot3 = self

	self._setup(slot2)

	return 
end
AiDataManager.save_data = function (self)
	local t = CoreTable.deep_clone(slot2)
	slot4 = t.patrol_paths

	for name, path in pairs(self._data) do
		slot9 = path.points

		for i, point in ipairs(slot8) do
			slot14 = point.unit
			point.position = point.unit.position(slot13)
			slot14 = point.unit
			point.rotation = point.unit.rotation(slot13)
			point.unit = nil
		end
	end

	return t
end
AiDataManager.load_data = function (self, data)
	if not data then
		return 
	end

	self._data = data

	return 
end
AiDataManager.load_units = function (self, units)
	slot4 = units

	for _, unit in ipairs(slot3) do
		slot9 = self._data.patrol_paths

		for name, path in pairs(slot8) do
			slot14 = path.points

			for i, point in ipairs(slot13) do
				slot20 = unit

				if point.unit_id == unit.unit_data(slot19).unit_id then
					point.unit = unit
				end
			end
		end
	end

	return 
end

return 
