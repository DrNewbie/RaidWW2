-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
CoreCutsceneActorDatabase = CoreCutsceneActorDatabase or class()
CoreCutsceneActorDatabaseUnitTypeInfo = CoreCutsceneActorDatabaseUnitTypeInfo or class()
function CoreCutsceneActorDatabase:unit_type_info(unit_type)
	return unit_type and self._registered_unit_types and self._registered_unit_types[unit_type]
end
function CoreCutsceneActorDatabase:append_unit_info(unit)
	self._registered_unit_types = self._registered_unit_types or {}
	slot2 = self._registered_unit_types
	slot5 = unit
	slot3 = unit.name(slot4)
	slot7 = unit

	if not self._registered_unit_types[unit.name(slot6)] then
		slot6 = "CutsceneActorDatabaseUnitTypeInfo"
		slot9 = unit
		slot4 = core_or_local(slot5, unit.name(slot8))
	end

	slot2[slot3] = slot4
	slot5 = unit
	slot5 = unit

	self._registered_unit_types[unit.name(slot4)]._append_unit_info(unit.name(slot4), self._registered_unit_types[unit.name(slot4)])

	return 
end
function CoreCutsceneActorDatabaseUnitTypeInfo:init(unit_type)
	self._unit_type = unit_type

	return 
end
function CoreCutsceneActorDatabaseUnitTypeInfo:unit_type()
	return self._unit_type
end
function CoreCutsceneActorDatabaseUnitTypeInfo:object_names()
	return self._object_names or {}
end
function CoreCutsceneActorDatabaseUnitTypeInfo:initial_object_visibility(object_name)
	return (self._object_visibilities and self._object_visibilities[object_name]) or false
end
function CoreCutsceneActorDatabaseUnitTypeInfo:extensions()
	return self._extensions or {}
end
function CoreCutsceneActorDatabaseUnitTypeInfo:animation_groups()
	return self._animation_groups or {}
end
function CoreCutsceneActorDatabaseUnitTypeInfo:_append_unit_info(unit)
	slot7 = unit
	slot4 = self.unit_type(slot5) == unit.name(self)

	assert(slot3)

	if self._object_names == nil then
		slot7 = "*"
		self._object_names = table.collect(slot3, unit.get_objects(function (object)
			slot3 = object

			return object.name(slot2)
		end, unit))
		slot5 = string.case_insensitive_compare

		table.sort(slot3, self._object_names)

		slot4 = self._object_names

		freeze(slot3)
	end

	if self._object_visibilities == nil then
		slot7 = "*"
		self._object_visibilities = table.remap(slot3, unit.get_objects(function (_, object)

			-- Decompilation error in this vicinity:
			slot4 = object
			slot2 = object.name(slot3)
		end, unit))
	end

	if self._extensions == nil then
		self._extensions = {}
		slot6 = unit

		for _, extension_name in ipairs(unit.extensions(slot5)) do
			if unit[extension_name] then
				slot9 = unit
				local extension = unit[extension_name](slot8)
			end

			if extension then
				local methods = {}
				slot13 = extension

				for key, value in pairs(getmetatable(slot12)) do
					slot16 = value

					if type(slot15) == "function" then
						slot17 = "_"

						if not string.begins(slot15, key) and key ~= "new" and key ~= "init" then
							slot17 = value
							methods[key] = self._argument_names_for_function(slot15, self)
						end
					end
				end

				self._extensions[extension_name] = methods
			end
		end

		slot4 = self._extensions

		freeze(slot3)
	end

	if self._animation_groups == nil then
		slot4 = unit
		self._animation_groups = unit.anim_groups(slot3)
	end

	slot4 = self

	freeze(slot3)

	return 
end
function CoreCutsceneActorDatabaseUnitTypeInfo:_argument_names_for_function(func)

	-- Decompilation error in this vicinity:
	slot4 = Application

	if not Application.ews_enabled(slot3) then
		return {}
	end

	local argument_names = {}
	local info = debug.getinfo(slot4)
	local source_path = managers.database.base_path(func) .. info.source
	slot9 = "r"
	local file = SystemFS.open(managers.database, SystemFS, source_path)
	local func_definition = self._file_line(SystemFS, self, file)
	slot9 = file

	file.close(self)

	slot12 = "%b()"
	slot10 = "%((.+)%)"
	local arg_list = string.match(slot8, string.match(info.linedefined, func_definition) or "")
end
function CoreCutsceneActorDatabaseUnitTypeInfo:_file_line(file, line)
	slot5 = file

	while not file.at_end(slot4) do
		slot5 = file
		local text = file.gets(slot4)
		line = line - 1

		if line == 0 then
			return text
		end
	end

	return 
end

return 
