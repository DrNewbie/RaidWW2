-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot2 = "lib/units/props/AIAttentionObject"

require(slot1)

if not CharacterAttentionObject then
	slot2 = AIAttentionObject
	slot0 = class(slot1)
end

CharacterAttentionObject = slot0
function CharacterAttentionObject:init(unit)
	slot6 = true

	CharacterAttentionObject.super.init(slot3, self, unit)

	return 
end
function CharacterAttentionObject:setup_attention_positions(m_head_pos, m_pos)
	if not m_head_pos then
		slot5 = self._unit
		slot5 = self._unit.movement(slot4)
		slot3 = self._unit.movement(slot4).m_head_pos(slot4)
	end

	self._m_head_pos = slot3

	if not m_pos then
		slot5 = self._unit
		slot5 = self._unit.movement(slot4)
		slot3 = self._unit.movement(slot4).m_pos(slot4)
	end

	self._m_pos = slot3

	return 
end
function CharacterAttentionObject:chk_settings_diff(settings_set)
	local attention_data = self._attention_data
	local changes = nil

	if settings_set then
		slot6 = settings_set

		for _, id in ipairs(slot5) do
			if not attention_data or not attention_data[id] then
				changes = changes or {}
				changes.added = changes.added or {}
				slot12 = id

				table.insert(slot10, changes.added)
			elseif attention_data then
				changes = changes or {}
				changes.maintained = changes.maintained or {}
				slot12 = id

				table.insert(slot10, changes.maintained)
			end
		end
	end

	if attention_data then
		slot6 = attention_data

		for old_id, setting in pairs(slot5) do
			local found = nil

			if settings_set then
				slot12 = settings_set

				for _, new_id in ipairs(slot11) do
					if old_id == new_id then
						found = true

						break
					end
				end
			end

			if not found then
				changes = changes or {}
				changes.removed = changes.removed or {}
				slot13 = old_id

				table.insert(slot11, changes.removed)
			end
		end
	end

	return changes
end
function CharacterAttentionObject:set_settings_set(settings_set)
	local attention_data = self._attention_data
	local changed, register, unregister = nil

	if attention_data then
	elseif settings_set then
		slot8 = settings_set

		if next(slot7) then
			register = true
		end
	end

	if self._overrides then
		if settings_set then
			slot8 = self._overrides

			for id, overrride_setting in pairs(slot7) do
				if settings_set[id] then
					self._override_restore = self._override_restore or {}
					self._override_restore[id] = settings_set[id]
					settings_set[id] = overrride_setting
				end
			end

			if attention_data and self._override_restore then
				slot8 = attention_data

				for id, setting in pairs(slot7) do
					if not settings_set[id] then
						self._override_restore[id] = nil
					end
				end

				slot8 = self._override_restore

				if not next(slot7) then
					self._override_restore = nil
				end
			end
		else
			self._override_restore = nil
		end
	end

	self._attention_data = settings_set

	if register then
		slot8 = self

		self._register(slot7)
	elseif unregister then
		slot8 = managers.groupai
		slot8 = managers.groupai.state(slot7)
		slot11 = self._parent_unit or self._unit

		managers.groupai.state(slot7).unregister_AI_attention_object(slot7, self._parent_unit or self._unit.key(slot10))
	end

	if changed or unregister then
		slot8 = self

		self._call_listeners(slot7)
	end

	return 
end
function CharacterAttentionObject:get_attention_m_pos(settings)
	return self._m_head_pos
end
function CharacterAttentionObject:get_detection_m_pos()
	return self._m_head_pos
end
function CharacterAttentionObject:get_ground_m_pos()
	return self._m_pos
end
function CharacterAttentionObject:_register()
	slot3 = managers.groupai
	slot3 = managers.groupai.state(slot2)
	slot1 = managers.groupai.state(slot2).register_AI_attention_object
	slot4 = self._parent_unit or self._unit
	slot5 = self
	slot8 = self._unit

	if self._unit.movement(slot7) then
		slot8 = self._unit
		slot8 = self._unit.movement(slot7)
		slot6 = self._unit.movement(slot7).nav_tracker(slot7)
	end

	slot1(slot2, slot3, slot4, slot5)

	return 
end

return 
