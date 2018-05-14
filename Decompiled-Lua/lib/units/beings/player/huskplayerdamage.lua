-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
HuskPlayerDamage = HuskPlayerDamage or class()
function HuskPlayerDamage:init(unit)
	self._unit = unit
	slot4 = unit
	slot7 = "Spine2"
	self._spine2_obj = unit.get_object(slot3, Idstring(slot6))
	slot4 = EventListenerHolder
	self._listener_holder = EventListenerHolder.new(slot3)
	self._mission_damage_blockers = {}
	self._health_ratio = 1

	return 
end
function HuskPlayerDamage:set_health_ratio(value)
	self._health_ratio = value

	return 
end
function HuskPlayerDamage:health_ratio()
	return self._health_ratio
end
function HuskPlayerDamage:_call_listeners(damage_info)
	slot5 = damage_info

	CopDamage._call_listeners(slot3, self)

	return 
end
function HuskPlayerDamage:add_listener(...)
	slot3 = self

	CopDamage.add_listener(slot2, ...)

	return 
end
function HuskPlayerDamage:remove_listener(key)
	slot5 = key

	CopDamage.remove_listener(slot3, self)

	return 
end
function HuskPlayerDamage:sync_damage_bullet(attacker_unit, damage, i_body, height_offset)

	-- Decompilation error in this vicinity:
	local attack_data = {
		attacker_unit = attacker_unit,
		attack_dir = slot6
	}
	slot10 = self._unit
	slot10 = self._unit.movement(slot9)
	attack_data.pos = mvector3.copy(self._unit.movement(slot9).m_head_pos(slot9))
	attack_data.result = {
		variant = "bullet",
		type = "hurt"
	}
	slot9 = attack_data

	self._call_listeners(slot7, self)

	return 
end
function HuskPlayerDamage:shoot_pos_mid(m_pos)
	slot5 = m_pos

	self._spine2_obj.m_position(slot3, self._spine2_obj)

	return 
end
function HuskPlayerDamage:can_attach_projectiles()
	return false
end
function HuskPlayerDamage:set_last_down_time(down_time)
	self._last_down_time = down_time

	return 
end
function HuskPlayerDamage:down_time()
	return self._last_down_time
end
function HuskPlayerDamage:arrested()
	slot3 = self._unit
	slot3 = self._unit.movement(slot2)

	return self._unit.movement(slot2).current_state_name(slot2) == "arrested"
end
function HuskPlayerDamage:incapacitated()
	slot3 = self._unit
	slot3 = self._unit.movement(slot2)

	return self._unit.movement(slot2).current_state_name(slot2) == "incapacitated"
end
function HuskPlayerDamage:set_mission_damage_blockers(type, state)
	self._mission_damage_blockers[type] = state

	return 
end
function HuskPlayerDamage:get_mission_blocker(type)
	return self._mission_damage_blockers[type]
end
function HuskPlayerDamage:dead()
	return 
end

return 
