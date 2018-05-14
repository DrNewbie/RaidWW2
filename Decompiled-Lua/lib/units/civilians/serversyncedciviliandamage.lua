if not ServerSyncedCivilianDamage then
	slot2 = CivilianDamage
	slot0 = class(slot1)
end

ServerSyncedCivilianDamage = slot0
ServerSyncedCivilianDamage._RESULT_INDEX_TABLE = {
	light_hurt = 2,
	hurt = 1,
	heavy_hurt = 3,
	death = 4
}
function ServerSyncedCivilianDamage:_send_bullet_attack_result(attack_data, attacker, damage_percent, body_index, hit_offset_height)
	slot10 = hit_offset_height

	self._send_sync_bullet_attack_result(slot7, self, attack_data)

	return 
end
function ServerSyncedCivilianDamage:_send_explosion_attack_result(attack_data, attacker, damage_percent)
	slot7 = attack_data

	self._send_sync_explosion_attack_result(slot5, self)

	return 
end
function ServerSyncedCivilianDamage:_send_fire_attack_result(attack_data, attacker, damage_percent)
	slot7 = attack_data

	self._send_sync_fire_attack_result(slot5, self)

	return 
end
function ServerSyncedCivilianDamage:_send_melee_attack_result(attack_data, damage_percent, hit_offset_height)
	slot9 = 0

	self._send_sync_melee_attack_result(slot5, self, attack_data, hit_offset_height)

	return 
end
function ServerSyncedCivilianDamage:_send_sync_bullet_attack_result(attack_data, hit_offset_height)
	slot7 = hit_offset_height

	TeamAIDamage._send_bullet_attack_result(slot4, self, attack_data)

	return 
end
function ServerSyncedCivilianDamage:_send_sync_explosion_attack_result(attack_data)
	slot5 = attack_data

	TeamAIDamage._send_explosion_attack_result(slot3, self)

	return 
end
function ServerSyncedCivilianDamage:_send_sync_fire_attack_result(attack_data)
	slot5 = attack_data

	TeamAIDamage._send_fire_attack_result(slot3, self)

	return 
end
function ServerSyncedCivilianDamage:_send_sync_melee_attack_result(attack_data, hit_offset_height, variant)
	slot9 = variant

	TeamAIDamage._send_melee_attack_result(slot5, self, attack_data, hit_offset_height)

	return 
end

return 
