-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
CoreCutsceneKeyCollection = CoreCutsceneKeyCollection or class()
function CoreCutsceneKeyCollection:keys(element_name)
	slot7 = element_name

	return self.keys_between(slot3, self, -1, math.huge)
end
function CoreCutsceneKeyCollection:keys_between(start_time, end_time, element_name)
	if start_time == end_time then
		return function ()
			return 
		end
	end

	slot6 = self
	local keys = self._all_keys_sorted_by_time(slot5)

	if start_time < end_time then
		local index = 0
		slot8 = keys
		local count = table.getn(slot7)

		return function ()
			while index < count do
				index = index + 1
				local key = keys[index]

				if key then
					slot3 = key

					if start_time < key.time(slot2) then
						slot3 = key

						if key.time(slot2) <= end_time and (element_name == nil or element_name == key.ELEMENT_NAME) then

							-- Decompilation error in this vicinity:
							return key
						end
					end
				end
			end

			return 
		end
		return 
	end

	slot7 = keys
	local index = table.getn(slot6) + 1

	return function ()
		while 1 < index do
			index = index - 1
			local key = keys[index]

			if key then
				slot3 = key

				if key.time(slot2) <= start_time then
					slot3 = key

					if end_time < key.time(slot2) and (element_name == nil or element_name == key.ELEMENT_NAME) then

						-- Decompilation error in this vicinity:
						return key
					end
				end
			end
		end

		return 
	end
end
function CoreCutsceneKeyCollection:keys_to_update(time, element_name)
	slot5 = self
	local keys = self._all_keys_sorted_by_time(slot4)
	local index = 0
	slot7 = keys
	local count = table.getn(slot6)

	return function ()
		while index < count do

			-- Decompilation error in this vicinity:
			index = index + 1
			local key = keys[index]
			slot3 = key
		end

		return 
	end
end
function CoreCutsceneKeyCollection:first_key(time, element_name, properties)
	slot8 = self

	for index, key in ipairs(self._all_keys_sorted_by_time(slot7)) do
		slot11 = key

		if time <= key.time(slot10) and (element_name == nil or element_name == key.ELEMENT_NAME) then
		end
	end

	return 
end
function CoreCutsceneKeyCollection:last_key_before(time, element_name, properties)
	local last_key = nil
	slot9 = self

	for _, key in ipairs(self._all_keys_sorted_by_time(slot8)) do
		slot12 = key

		if time <= key.time(slot11) then
			return last_key
		end

		if element_name == nil or element_name == key.ELEMENT_NAME then
		end
	end
end

return 
