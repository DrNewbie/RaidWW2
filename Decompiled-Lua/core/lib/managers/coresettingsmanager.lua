-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreSettingsManager"

core.module(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

SettingsManager = SettingsManager or CoreClass.class()
function SettingsManager:init(settings_file_path)

	-- Decompilation error in this vicinity:
	slot6 = settings_file_path

	assert(slot3)

	self.__path = settings_file_path
	local script = nil
	slot7 = "r"
	local file = SystemFS.open(type(slot5) == "string", SystemFS, settings_file_path)
	slot6 = file

	if not file.at_end(SystemFS) then
		slot6 = file
		script = file.read(slot5)
	end

	slot7 = file

	SystemFS.close(slot5, SystemFS)
end
function SettingsManager:destroy()
	slot3 = self

	self.save(slot2)

	return 
end
function SettingsManager:save()
	slot5 = "w"
	local file = SystemFS.open(slot2, SystemFS, self.__path)
	slot5 = "return "

	file.write(SystemFS, file)

	slot6 = file

	self._serialize(SystemFS, self, self.__settings)

	slot5 = file

	SystemFS.close(SystemFS, SystemFS)

	slot5 = file

	managers.database.recompile(SystemFS, managers.database)

	return 
end
function SettingsManager:get(category)
	self.__settings[category] = self.__settings[category] or {}

	return self.__settings[category]
end
function SettingsManager:_serialize(value, file, indentation)
	indentation = indentation or 1
	slot6 = value
	local t = type(slot5)

	if t == "table" then
		slot8 = indentation
		local indent = string.rep(slot6, "\t")
		slot9 = "{\n"

		file.write("\t", file)

		slot8 = value

		for key, value in pairs("\t") do
			slot15 = key
			slot14 = "Using a table for a key is unsupported."

			assert(slot12, type(slot14) ~= "table")

			slot19 = key
			slot14 = indent .. "[" .. self._inspect(slot17, self) .. "] = "

			file.write(slot12, file)

			slot16 = indentation + 1

			self._serialize(slot12, self, value, file)

			slot14 = ";\n"

			file.write(slot12, file)
		end

		slot12 = indentation - 1
		slot9 = string.rep(slot10, "\t") .. "}"

		file.write(slot7, file)
	elseif t == "string" or t == "number" or t == "boolean" then
		slot11 = value
		slot10 = indentation

		file.write(slot6, file, self._inspect(slot9, self), file)
	else
		slot7 = "Unable to serialize type \"" .. t .. "\"."

		error(slot6)
	end

	return 
end
function SettingsManager:_inspect(value)
	slot4 = value
	local t = type(slot3)

	if t == "string" then
		slot6 = value

		return string.format(slot4, "%q")
	elseif t == "number" or t == "boolean" then
		slot5 = value

		return tostring(slot4)
	else
		slot5 = "Unable to inspect type \"" .. t .. "\"."

		error(slot4)
	end

	return 
end

return 
