GreedCacheItem = GreedCacheItem or class()
function GreedCacheItem:init(unit)
	self._unit = unit
	self._reserve = 0
	self._unlocked = false

	return 
end
function GreedCacheItem:set_reserve(value)
	self._reserve = value
	self._current_amount = value

	return 
end
function GreedCacheItem:reserve()
	return self._reserve
end
function GreedCacheItem:reserve_left()
	return self._current_amount
end
function GreedCacheItem:pickup_amount()
	return tweak_data.greed.cache_items[self._tweak_table].single_interaction_value
end
function GreedCacheItem:on_interacted(amount)
	if not amount then
		slot4 = self
		local pickup_amount = self.pickup_amount(slot3)
	end

	slot6 = 0
	slot9 = self
	pickup_amount = math.clamp(slot4, pickup_amount, self.reserve_left(slot8))
	self._current_amount = self._current_amount - pickup_amount
	slot5 = self

	self._check_current_sequence(slot4)

	return pickup_amount
end
function GreedCacheItem:_check_current_sequence()
	local fill_sequences = tweak_data.greed.cache_items[self._tweak_table].sequences

	if fill_sequences then
		local current_percentage = self._current_amount / self._reserve
		slot5 = fill_sequences

		for sequence_index, sequence_data in pairs(slot4) do
			if current_percentage <= sequence_data.max_value then
				slot10 = self._unit
				slot11 = sequence_data.sequence

				self._unit.damage(slot9).run_sequence_simple(slot9, self._unit.damage(slot9))

				break
			end
		end
	end

	return 
end
function GreedCacheItem:get_lockpick_parameters()
	slot3 = tweak_data.greed.cache_items[self._tweak_table].lockpick
	local parameters = deep_clone(slot2)
	parameters.circle_radius = {
		tweak_data.interaction.MINIGAME_CIRCLE_RADIUS_SMALL,
		tweak_data.interaction.MINIGAME_CIRCLE_RADIUS_MEDIUM,
		tweak_data.interaction.MINIGAME_CIRCLE_RADIUS_BIG
	}

	return parameters
end
function GreedCacheItem:unlock()
	self._unlocked = true
	slot3 = self

	self._check_current_sequence(slot2)

	return 
end
function GreedCacheItem:locked()
	return not self._unlocked
end
function GreedCacheItem:interaction_timer_value()
	return tweak_data.greed.cache_items[self._tweak_table].interaction_timer
end
function GreedCacheItem:on_load_complete()
	slot6 = self._unit
	slot4 = self._unit.unit_data(slot5).unit_id
	local world_id = managers.worldcollection.get_worlddefinition_by_unit_id(slot2, managers.worldcollection).world_id(slot2)
	slot6 = world_id

	managers.greed.register_greed_cache_item(managers.worldcollection.get_worlddefinition_by_unit_id(slot2, managers.worldcollection), managers.greed, self._unit)

	if not self._reserve or not self._current_amount then
		slot5 = tweak_data.greed.cache_items[self._tweak_table].value

		self.set_reserve(slot3, self)
	end

	return 
end
function GreedCacheItem:save(data)
	data.reserve = self._reserve
	data.current_amount = self._current_amount
	data.unlocked = self._unlocked

	return 
end
function GreedCacheItem:load(data)
	self._reserve = data.reserve
	self._current_amount = data.current_amount
	self._unlocked = data.unlocked

	if self._unlocked then
		slot4 = self

		self._check_current_sequence(slot3)
	end

	return 
end

return 
