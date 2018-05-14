-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not GrenadeBase then
	slot2 = ProjectileBase
	slot0 = class(slot1)
end

GrenadeBase = slot0
GrenadeBase.EVENT_IDS = {
	detonate = 1
}
local mvec1 = Vector3()
local mvec2 = Vector3()
function GrenadeBase:_setup_server_data()
	slot4 = "trip_mine_targets"
	self._slot_mask = managers.slot.get_mask(slot2, managers.slot)

	if self._init_timer then
		self._timer = self._init_timer
	end

	return 
end
function GrenadeBase:setup(unit, t, dt)
	return 
end
function GrenadeBase:update(unit, t, dt)
	if self._hand_held then
		return 
	end

	if self._timer then
		self._timer = self._timer - dt

		if self._timer <= 0 then
			self._timer = nil
			slot6 = self

			self._detonate(slot5)

			return 
		end
	end

	slot9 = dt

	GrenadeBase.super.update(slot5, self, unit, t)

	return 
end
function GrenadeBase:clbk_impact(...)
	slot3 = self

	self._detonate(slot2)

	return 
end
function GrenadeBase:_on_collision(col_ray)
	slot4 = self

	self._detonate(slot3)

	return 
end
function GrenadeBase:_detonate()
	slot3 = "no _detonate function for grenade base"

	print(slot2)

	return 
end
function GrenadeBase:_detonate_on_client()
	slot3 = "no _detonate_on_client function for grenade base"

	print(slot2)

	return 
end
function GrenadeBase:sync_net_event(event_id)
	if event_id == GrenadeBase.EVENT_IDS.detonate then
		slot4 = self

		self._detonate_on_client(slot3)
	end

	return 
end
function GrenadeBase:throw(...)
	GrenadeBase.super.throw(slot2, ...)

	slot4 = self
	local weapon_id = tweak_data.projectiles[self.projectile_entry(self)].weapon_id

	if weapon_id then
		slot5 = {
			hit = false,
			name_id = weapon_id
		}

		managers.statistics.shot_fired(slot3, managers.statistics)
	end

	return 
end
function GrenadeBase:add_damage_result(unit, is_dead, damage_percent)

	-- Decompilation error in this vicinity:
	slot6 = self._thrower_unit
	local unit_type = unit.base(slot5)._tweak_table
	slot7 = unit
	local is_civlian = unit.character_damage(unit).is_civilian(unit)
	slot8 = unit
	local is_gangster = unit.character_damage(unit_type).is_gangster(unit_type)
	slot9 = unit
	slot9 = unit_type
	local is_cop = unit.character_damage(unit_type).is_cop(unit_type)

	if is_civlian then
		return 
	end

	slot11 = self
	local weapon_id = tweak_data.projectiles[self.projectile_entry(slot10)].weapon_id

	if weapon_id and not self._recorded_hit then
		slot12 = {
			skip_bullet_count = true,
			hit = true,
			name_id = weapon_id
		}

		managers.statistics.shot_fired(slot10, managers.statistics)

		self._recorded_hit = true
	end

	table.insert(slot10, self._damage_results)

	local hit_count = #self._damage_results
	local kill_count = 0
	slot13 = self._damage_results

	for i, death in ipairs(is_dead) do
		kill_count = kill_count + ((death and 1) or 0)
	end

	return 
end
function GrenadeBase:get_use_data(character_setup)
	local use_data = {
		equip = {
			align_place = "right_hand"
		},
		selection_index = 3,
		unequip = {
			align_place = "back"
		}
	}

	return use_data
end
function GrenadeBase:tweak_data_anim_play(anim, ...)
	slot4 = self
	local animations = self.weapon_tweak_data(slot3).animations

	if animations and animations[anim] then
		slot6 = animations[anim]

		self.anim_play(slot4, self, ...)

		return true
	end

	return false
end
function GrenadeBase:anim_play(anim, speed_multiplier)
	if anim then
		slot5 = self._unit
		slot8 = anim
		local length = self._unit.anim_length(slot4, Idstring(slot7))
		speed_multiplier = speed_multiplier or 1
		slot6 = self._unit
		slot9 = anim

		self._unit.anim_stop(slot5, Idstring(slot8))

		slot9 = anim
		slot9 = speed_multiplier

		self._unit.anim_play_to(slot5, self._unit, Idstring(slot8), length)
	end

	return 
end
function GrenadeBase:tweak_data_anim_stop(anim, ...)
	slot4 = self
	local animations = self.weapon_tweak_data(slot3).animations

	if animations and animations[anim] then
		slot8 = self
		slot6 = self.weapon_tweak_data(slot7).animations[anim]

		self.anim_stop(slot4, self, ...)

		return true
	end

	return false
end
function GrenadeBase:anim_stop(anim)
	slot4 = self._unit
	slot7 = anim

	self._unit.anim_stop(slot3, Idstring(slot6))

	return 
end
function GrenadeBase:melee_damage_info()
	slot3 = self
	local my_tweak_data = self.weapon_tweak_data(slot2)

	return my_tweak_data.damage_melee, my_tweak_data.damage_melee_effect_mul
end
function GrenadeBase:ammo_info()
	return 
end
function GrenadeBase:add_ammo(ratio, add_amount_override, add_amount_multiplier)
	return false, 0
end
function GrenadeBase:add_ammo_from_bag(available)
	return 0
end
function GrenadeBase:set_hand_held(value)
	self._hand_held = value

	return 
end
function GrenadeBase:on_equip()
	return 
end
function GrenadeBase:on_unequip()
	return 
end
function GrenadeBase:on_enabled()
	self._enabled = true

	return 
end
function GrenadeBase:on_disabled()
	self._enabled = false

	return 
end
function GrenadeBase:enabled()
	return self._enabled
end
function GrenadeBase:get_stance_id()
	slot3 = self

	return self.weapon_tweak_data(slot2).stance
end
function GrenadeBase:transition_duration()
	slot3 = self

	return self.weapon_tweak_data(slot2).transition_duration
end
function GrenadeBase:enter_steelsight_speed_multiplier()
	return 1
end
function GrenadeBase:exit_run_speed_multiplier()
	slot3 = self

	return self.weapon_tweak_data(slot2).exit_run_speed_multiplier
end
function GrenadeBase:weapon_tweak_data()
	return tweak_data.projectiles[self.name_id]
end
function GrenadeBase:weapon_hold()
	slot3 = self

	return self.weapon_tweak_data(slot2).weapon_hold
end
function GrenadeBase:selection_index()
	return PlayerInventory.SLOT_3
end
function GrenadeBase:has_range_distance_scope()
	return false
end
function GrenadeBase:set_visibility_state(state)
	slot5 = state

	self._unit.set_visible(slot3, self._unit)

	return 
end
function GrenadeBase:movement_penalty()
	slot3 = self

	return self.weapon_tweak_data(slot2).weapon_movement_penalty or 1
end
function GrenadeBase:clbk_impact(tag, unit, body, other_unit, other_body, position, normal, collision_velocity, velocity, other_velocity, new_velocity, direction, damage, ...)
	slot29 = damage

	self._detonate(slot15, self, tag, unit, body, other_unit, other_body, position, normal, collision_velocity, velocity, other_velocity, new_velocity, direction, ...)

	return 
end
function GrenadeBase:start_shooting_allowed()
	return true
end
function GrenadeBase:save(data)
	local state = {
		timer = self._timer
	}
	data.GrenadeBase = state

	return 
end
function GrenadeBase:load(data)
	local state = data.GrenadeBase
	self._timer = state.timer

	return 
end
function GrenadeBase:uses_ammo()
	return false
end
function GrenadeBase:replenish()
	slot3 = managers.blackmarket
	local name, amount = managers.blackmarket.equipped_grenade(slot2)
	slot6 = amount

	managers.player.add_grenade_amount(slot4, managers.player)

	return 
end

return 
