CoreUnderlayMaterial = CoreUnderlayMaterial or class()
function CoreUnderlayMaterial:init()
	self._params = {}

	return 
end
function CoreUnderlayMaterial:add(from)
	slot4 = from._params

	for key, value in pairs(slot3) do
		if self._params[key] then
			self._params[key] = self._params[key] + from._params[key]
		else
			slot9 = from._params[key]

			if type(slot8) ~= "number" then
				slot12 = from._params[key].z
				self._params[key] = Vector3(slot9, from._params[key].x, from._params[key].y)
			else
				self._params[key] = from._params[key]
			end
		end
	end

	return 
end
function CoreUnderlayMaterial:scale(scale)
	slot4 = self._params

	for key, value in pairs(slot3) do
		self._params[key] = self._params[key] * scale
	end

	return 
end
function CoreUnderlayMaterial:copy(from)
	slot4 = from._params

	for key, value in pairs(slot3) do
		slot9 = value

		if type(slot8) ~= "number" then
			slot12 = value.z
			self._params[key] = Vector3(slot9, value.x, value.y)
		else
			self._params[key] = value
		end
	end

	return 
end
function CoreUnderlayMaterial:interpolate(postfx, with, scale)
	slot6 = postfx._params

	for key, value in pairs(slot5) do
		if not with._params[key] then
			self._params[key] = nil
		else
			local invscale = 1 - scale
			self._params[key] = postfx._params[key] * invscale + with._params[key] * scale
		end
	end

	return 
end
function CoreUnderlayMaterial:interpolate_value(postfx, with, key, scale)
	if not with._params[key] or not postfx._params[key] then
		return 
	else
		local invscale = 1 - scale
		self._params[key] = postfx._params[key] * invscale + with._params[key] * scale
	end

	return 
end
function CoreUnderlayMaterial:parse(xml_node)
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
function CoreUnderlayMaterial:set_value(key, value)
	self._params[key] = value

	return 
end
function CoreUnderlayMaterial:value(key)
	return self._params[key]
end
function CoreUnderlayMaterial:database_lookup(str)
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
CoreUnderlayEffect = CoreUnderlayEffect or class()
function CoreUnderlayEffect:init()
	slot3 = self

	self.set_default(slot2)

	return 
end
function CoreUnderlayEffect:set_default()
	self._materials = {}
	self._name = "default"

	return 
end
function CoreUnderlayEffect:set_name(name)
	self._name = name

	return 
end
function CoreUnderlayEffect:add(from)
	slot4 = from._materials

	for name, material in pairs(slot3) do
		if not self._materials[name] then
			slot10 = CoreUnderlayMaterial
			self._materials[name] = CoreUnderlayMaterial.new(slot9)
		end

		slot10 = from._materials[name]

		material.add(slot8, material)
	end

	return 
end
function CoreUnderlayEffect:scale(scale)
	slot4 = self._materials

	for name, material in pairs(slot3) do
		slot10 = scale

		material.scale(slot8, material)
	end

	return 
end
function CoreUnderlayEffect:copy(from)
	slot4 = from._materials

	for name, material in pairs(slot3) do
		if not self._materials[name] then
			slot10 = CoreUnderlayMaterial
			self._materials[name] = CoreUnderlayMaterial.new(slot9)
		end

		slot10 = material

		self._materials[name].copy(slot8, self._materials[name])
	end

	self._name = from._name

	return 
end
function CoreUnderlayEffect:interpolate(postfx, with, scale)
	slot6 = postfx._materials

	for name, material in pairs(slot5) do
		if not with._materials[name] then
			slot12 = CoreUnderlayMaterial
			with._materials[name] = CoreUnderlayMaterial.new(slot11)
		end

		if not self._materials[name] then
			slot12 = CoreUnderlayMaterial
			self._materials[name] = CoreUnderlayMaterial.new(slot11)
		end
	end

	slot6 = with._materials

	for name, material in pairs(slot5) do
		if not postfx._materials[name] then
			slot12 = CoreUnderlayMaterial
			postfx._materials[name] = CoreUnderlayMaterial.new(slot11)
		end

		if not self._materials[name] then
			slot12 = CoreUnderlayMaterial
			self._materials[name] = CoreUnderlayMaterial.new(slot11)
		end
	end

	slot6 = self._materials

	for name, material in pairs(slot5) do
		slot14 = scale

		material.interpolate(slot10, material, postfx._materials[name], with._materials[name])
	end

	self._name = postfx._name

	return 
end
function CoreUnderlayEffect:interpolate_value(postfx, with, material, key, scale)
	if not with._materials[material] or not postfx._materials[material] then
		return 
	end

	if not self._materials[material] then
		slot9 = CoreUnderlayMaterial
		self._materials[material] = CoreUnderlayMaterial.new(slot8)
	end

	self._name = postfx._name
	slot12 = scale

	self._materials[material].interpolate_value(slot7, self._materials[material], postfx._materials[material], with._materials[material], key)

	return 
end
function CoreUnderlayEffect:parse(xml_node)
	slot4 = xml_node

	for child in xml_node.children(slot3) do
		slot9 = "name"
		local name = child.parameter(slot7, child)
		slot9 = child

		if child.name(child) == "material" and name and name ~= "" then
			if not self._materials[name] then
				slot10 = CoreUnderlayMaterial
				self._materials[name] = CoreUnderlayMaterial.new(slot9)
			end

			slot10 = child

			self._materials[name].parse(slot8, self._materials[name])
		end
	end

	return 
end
function CoreUnderlayEffect:set_value(material, key, value)
	if not self._materials[material] then
		slot7 = CoreUnderlayMaterial
		self._materials[material] = CoreUnderlayMaterial.new(slot6)
	end

	slot8 = value

	self._materials[material].set_value(slot5, self._materials[material], key)

	return 
end
function CoreUnderlayEffect:value(material, key)
	if self._materials[material] then
		slot6 = key

		return self._materials[material].value(slot4, self._materials[material])
	else
		return nil
	end

	return 
end

return 
