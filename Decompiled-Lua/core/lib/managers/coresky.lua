CoreSky = CoreSky or class()
function CoreSky:init()
	self._params = {}
	self._name = "default"

	return 
end
function CoreSky:set_name(name)
	self._name = name

	return 
end
function CoreSky:set_value(key, value)
	self._params[key] = value

	return 
end
function CoreSky:value(key)
	return self._params[key]
end
function CoreSky:parse(xml_node)
	self._params = {}
	slot4 = xml_node

	for child in xml_node.children(slot3) do
		slot9 = "key"
		local key = child.parameter(slot7, child)
		slot10 = "value"
		local value = child.parameter(child, child)
		slot10 = child

		if child.name(child) == "param" and key and key ~= "" and value and value ~= "" then
			slot10 = value

			if math.string_is_good_vector(slot9) then
				slot11 = value
				self._params[key] = math.string_to_vector(slot10)
			else
				slot10 = value

				if tonumber(slot9) then
					slot11 = value
					self._params[key] = tonumber(slot10)
				else
					slot12 = 1

					if string.sub(slot9, value, 1) == "#" then
						slot11 = self
						slot15 = 2
						self._params[key] = self.database_lookup(slot10, string.sub(slot13, value))
					else
						slot11 = value
						self._params[key] = tostring(slot10)
					end
				end
			end
		end
	end

	return 
end
function CoreSky:copy(from)
	slot4 = from._params

	for key, value in pairs(slot3) do
		slot9 = value

		if type(slot8) == "string" then
			self._params[key] = value
		else
			slot9 = value

			if type(slot8) ~= "number" then
				slot12 = value.z
				self._params[key] = Vector3(slot9, value.x, value.y)
			else
				self._params[key] = value
			end
		end
	end

	self._name = from._name

	return 
end
function CoreSky:interpolate(target, with, scale)
	local invscale = 1 - scale
	slot7 = with._params

	for key, value in pairs(slot6) do
		if not target._params[key] then
			return 
		else
			slot12 = value

			if type(slot11) ~= "string" then
				self._params[key] = target._params[key] * invscale + value * scale
			else
				self._params[key] = value
			end
		end
	end

	self._name = with._name

	return 
end
function CoreSky:database_lookup(str)
	slot5 = "#"
	local i = string.find(slot3, str)
	slot7 = i - 1
	local db_key = string.sub(str, str, 1)
	slot7 = i + 1
	local value_key = string.sub(str, str)
	slot7 = db_key == "LightIntensityDB"

	assert(slot6)

	slot8 = value_key
	local value = LightIntensityDB.lookup(slot6, LightIntensityDB)
	slot8 = value

	assert(LightIntensityDB)

	return value
end

return 
