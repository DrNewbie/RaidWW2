CorePostEffectModifier = CorePostEffectModifier or class()
function CorePostEffectModifier:init()
	self._params = {}

	return 
end
function CorePostEffectModifier:add(from)
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
function CorePostEffectModifier:scale(scale)
	slot4 = self._params

	for key, value in pairs(slot3) do
		self._params[key] = self._params[key] * scale
	end

	return 
end
function CorePostEffectModifier:copy(from)
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
function CorePostEffectModifier:interpolate(postfx, with, scale)
	slot6 = postfx._params

	for key, value in pairs(slot5) do
		slot11 = value

		if type(slot10) ~= "string" then
			if not with._params[key] then
				self._params[key] = nil
			else
				local invscale = 1 - scale
				self._params[key] = postfx._params[key] * invscale + with._params[key] * scale
			end
		end
	end

	return 
end
function CorePostEffectModifier:interpolate_value(postfx, with, key, scale)
	if not with._params[key] or not postfx._params[key] then
		return 
	else
		local invscale = 1 - scale
		self._params[key] = postfx._params[key] * invscale + with._params[key] * scale
	end

	return 
end
function CorePostEffectModifier:parse(xml_node)
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
function CorePostEffectModifier:set_value(key, value)
	self._params[key] = value

	return 
end
function CorePostEffectModifier:value(key)
	return self._params[key]
end
function CorePostEffectModifier:database_lookup(str)
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
CorePostProcessor = CorePostProcessor or class()
function CorePostProcessor:init()
	self._modifiers = {}

	return 
end
function CorePostProcessor:add(from)
	slot4 = from._modifiers

	for name, modifier in pairs(slot3) do
		if not self._modifiers[name] then
			slot10 = CorePostEffectModifier
			self._modifiers[name] = CorePostEffectModifier.new(slot9)
		end

		slot10 = from._modifiers[name]

		modifier.add(slot8, modifier)
	end

	return 
end
function CorePostProcessor:scale(scale)
	slot4 = self._modifiers

	for name, modifier in pairs(slot3) do
		slot10 = scale

		modifier.scale(slot8, modifier)
	end

	return 
end
function CorePostProcessor:copy(from)
	slot4 = from._modifiers

	for name, modifier in pairs(slot3) do
		if not self._modifiers[name] then
			slot10 = CorePostEffectModifier
			self._modifiers[name] = CorePostEffectModifier.new(slot9)
		end

		slot10 = modifier

		self._modifiers[name].copy(slot8, self._modifiers[name])
	end

	return 
end
function CorePostProcessor:interpolate(postfx, with, scale)
	slot6 = postfx._modifiers

	for name, modifier in pairs(slot5) do
		if not with._modifiers[name] then
			slot12 = CorePostEffectModifier
			with._modifiers[name] = CorePostEffectModifier.new(slot11)
		end

		if not self._modifiers[name] then
			slot12 = CorePostEffectModifier
			self._modifiers[name] = CorePostEffectModifier.new(slot11)
		end
	end

	slot6 = with._modifiers

	for name, modifier in pairs(slot5) do
		if not postfx._modifiers[name] then
			slot12 = CorePostEffectModifier
			postfx._modifiers[name] = CorePostEffectModifier.new(slot11)
		end

		if not self._modifiers[name] then
			slot12 = CorePostEffectModifier
			self._modifiers[name] = CorePostEffectModifier.new(slot11)
		end
	end

	slot6 = self._modifiers

	for name, modifier in pairs(slot5) do
		slot14 = scale

		modifier.interpolate(slot10, modifier, postfx._modifiers[name], with._modifiers[name])
	end

	return 
end
function CorePostProcessor:interpolate_value(postfx, with, modifier, key, scale)
	if not with._modifiers[modifier] or not postfx._modifiers[modifier] then
		return 
	end

	if not self._modifiers[modifier] then
		slot9 = CorePostEffectModifier
		self._modifiers[modifier] = CorePostEffectModifier.new(slot8)
	end

	slot12 = scale

	self._modifiers[modifier].interpolate_value(slot7, self._modifiers[modifier], postfx._modifiers[modifier], with._modifiers[modifier], key)

	return 
end
function CorePostProcessor:parse(xml_node)
	slot4 = xml_node

	for child in xml_node.children(slot3) do
		slot9 = "name"
		local name = child.parameter(slot7, child)
		slot9 = child

		if child.name(child) == "modifier" and name and name ~= "" then
			if not self._modifiers[name] then
				slot10 = CorePostEffectModifier
				self._modifiers[name] = CorePostEffectModifier.new(slot9)
			end

			slot10 = child

			self._modifiers[name].parse(slot8, self._modifiers[name])
		end
	end

	return 
end
function CorePostProcessor:set_value(modifier, key, value)
	if not self._modifiers[modifier] then
		slot7 = CorePostEffectModifier
		self._modifiers[modifier] = CorePostEffectModifier.new(slot6)
	end

	slot8 = value

	self._modifiers[modifier].set_value(slot5, self._modifiers[modifier], key)

	return 
end
function CorePostProcessor:value(modifier, key)
	if self._modifiers[modifier] then
		slot6 = key

		return self._modifiers[modifier].value(slot4, self._modifiers[modifier])
	else
		return nil
	end

	return 
end
CorePostEffect = CorePostEffect or class()
function CorePostEffect:init()
	slot3 = self

	self.set_default(slot2)

	return 
end
function CorePostEffect:set_name(name)
	self._name = name

	return 
end
function CorePostEffect:set_default()
	self._post_processors = {}
	self._name = "default"

	return 
end
function CorePostEffect:add(from)
	slot4 = from._post_processors

	for name, processor in pairs(slot3) do
		if not self._post_processors[name] then
			slot10 = CorePostProcessor
			self._post_processors[name] = CorePostProcessor.new(slot9)
			self._post_processors[name]._effect = processor._effect
		end

		slot10 = from._post_processors[name]

		processor.add(slot8, processor)
	end

	return 
end
function CorePostEffect:scale(scale)
	slot4 = self._post_processors

	for name, processor in pairs(slot3) do
		slot10 = scale

		processor.scale(slot8, processor)
	end

	return 
end
function CorePostEffect:copy(from)
	slot4 = from._post_processors

	for name, processor in pairs(slot3) do
		if not self._post_processors[name] then
			slot10 = CorePostProcessor
			self._post_processors[name] = CorePostProcessor.new(slot9)
			self._post_processors[name]._effect = processor._effect
		end

		slot10 = processor

		self._post_processors[name].copy(slot8, self._post_processors[name])
	end

	self._name = from._name

	return 
end
function CorePostEffect:interpolate(postfx, with, scale)
	slot6 = postfx._post_processors

	for name, processor in pairs(slot5) do
		if not with._post_processors[name] then
			slot12 = CorePostProcessor
			with._post_processors[name] = CorePostProcessor.new(slot11)
			with._post_processors[name]._effect = processor._effect
		end

		if not self._post_processors[name] then
			slot12 = CorePostProcessor
			self._post_processors[name] = CorePostProcessor.new(slot11)
			self._post_processors[name]._effect = processor._effect
		end
	end

	slot6 = with._post_processors

	for name, processor in pairs(slot5) do
		if not postfx._post_processors[name] then
			slot12 = CorePostProcessor
			postfx._post_processors[name] = CorePostProcessor.new(slot11)
			postfx._post_processors[name]._effect = processor._effect
		end

		if not self._post_processors[name] then
			slot12 = CorePostProcessor
			self._post_processors[name] = CorePostProcessor.new(slot11)
			self._post_processors[name]._effect = processor._effect
		end
	end

	slot6 = self._post_processors

	for name, processor in pairs(slot5) do
		slot14 = scale

		processor.interpolate(slot10, processor, postfx._post_processors[name], with._post_processors[name])
	end

	self._name = postfx._name

	return 
end
function CorePostEffect:interpolate_value(postfx, with, processor, modifier, key, scale)
	if not with._post_processors[processor] or not postfx._post_processors[processor] then
		return 
	end

	if not self._post_processors[processor] then
		slot10 = CorePostProcessor
		self._post_processors[processor] = CorePostProcessor.new(slot9)
		self._post_processors[processor]._effect = processor._effect
	end

	self._name = postfx._name
	slot14 = scale

	self._post_processors[processor].interpolate_value(slot8, self._post_processors[processor], postfx._post_processors[processor], with._post_processors[processor], modifier, key)

	return 
end
function CorePostEffect:parse(xml_node)
	slot4 = xml_node

	for child in xml_node.children(slot3) do
		slot9 = "name"
		local name = child.parameter(slot7, child)
		slot10 = "effect"
		local effect = child.parameter(child, child)
		slot10 = child

		if child.name(child) == "post_processor" and name and name ~= "" and effect and effect ~= "" then
			if not self._post_processors[name] then
				slot11 = CorePostProcessor
				self._post_processors[name] = CorePostProcessor.new(slot10)
			end

			self._post_processors[name]._effect = effect
			slot11 = child

			self._post_processors[name].parse(slot9, self._post_processors[name])
		end
	end

	return 
end
function CorePostEffect:set_value(processor, modifier, key, value)
	if not self._post_processors[processor] then
		slot8 = CorePostProcessor
		self._post_processors[processor] = CorePostProcessor.new(slot7)
	end

	slot10 = value

	self._post_processors[processor].set_value(slot6, self._post_processors[processor], modifier, key)

	return 
end
function CorePostEffect:value(processor, modifier, key)
	if self._post_processors[processor] then
		slot8 = key

		return self._post_processors[processor].value(slot5, self._post_processors[processor], modifier)
	else
		return nil
	end

	return 
end

return 
