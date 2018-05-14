-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not NPCRaycastWeaponBase then
	slot2 = RaycastWeaponBase
	slot0 = class(slot1)
end

NPCRaycastWeaponBase = slot0
NPCRaycastWeaponBase._VOICES = {
	"a",
	"b",
	"c"
}
NPCRaycastWeaponBase._next_i_voice = {}
function NPCRaycastWeaponBase:init(unit)
	slot6 = false

	RaycastWeaponBase.super.init(slot3, self, unit)

	self._unit = unit
	self._name_id = self.name_id or "thomspon_npc"
	self.name_id = nil
	slot5 = "bullet_impact_targets"
	self._bullet_slotmask = managers.slot.get_mask(slot3, managers.slot)
	slot5 = "bullet_blank_impact_targets"
	self._blank_slotmask = managers.slot.get_mask(slot3, managers.slot)
	slot4 = self

	self._create_use_setups(slot3)

	self._setup = {}
	self._digest_values = false
	slot5 = tweak_data.weapon[self._name_id].AMMO_MAX

	self.set_ammo_max(slot3, self)

	slot4 = self
	slot7 = self

	self.set_ammo_total(slot3, self.get_ammo_max(self._name_id))

	slot5 = tweak_data.weapon[self._name_id].CLIP_AMMO_MAX

	self.set_ammo_max_per_clip(slot3, self)

	slot4 = self
	slot7 = self

	self.set_ammo_remaining_in_clip(slot3, self.get_ammo_max_per_clip(self._name_id))

	self._damage = tweak_data.weapon[self._name_id].DAMAGE
	self._next_fire_allowed = -1000
	slot4 = self._unit
	slot7 = "fire"
	self._obj_fire = self._unit.get_object(self._name_id, Idstring(self._name_id))
	slot5 = "fire"
	self._sound_fire = SoundDevice.create_source(self._name_id, SoundDevice)
	slot4 = self._sound_fire
	slot7 = self._unit

	self._sound_fire.link(self._name_id, self._unit.orientation_object(self._name_id))

	slot6 = self
	slot4 = self.weapon_tweak_data(self._unit.orientation_object).muzzleflash or "effects/vanilla/weapons/muzzleflash_maingun"
	self._muzzle_effect = Idstring(slot3)
	self._muzzle_effect_table = {
		force_synch = false,
		effect = self._muzzle_effect,
		parent = self._obj_fire
	}
	slot4 = self

	if self.ejects_shells(self._obj_fire) then
		slot5 = "WIN32"
		self._use_shell_ejection_effect = SystemInfo.platform(slot3) == Idstring(SystemInfo)
	end

	if self._use_shell_ejection_effect then
		slot4 = self._unit
		slot7 = "a_shell"
		self._obj_shell_ejection = self._unit.get_object(slot3, Idstring(slot6))
		slot6 = self
		slot4 = self.weapon_tweak_data(Idstring).shell_ejection or "effects/vanilla/weapons/shells/shell_556"
		self._shell_ejection_effect = Idstring(slot3)
		self._shell_ejection_effect_table = {
			effect = self._shell_ejection_effect,
			parent = self._obj_shell_ejection
		}
	end

	self._trail_effect_table = {
		effect = self.TRAIL_EFFECT,
		position = Vector3(),
		normal = Vector3()
	}
	self._flashlight_light_lod_enabled = true

	if false and self._multivoice then
		if not NPCRaycastWeaponBase._next_i_voice[self._name_id] then
			NPCRaycastWeaponBase._next_i_voice[self._name_id] = 1
		end

		self._voice = NPCRaycastWeaponBase._VOICES[NPCRaycastWeaponBase._next_i_voice[self._name_id]]

		if NPCRaycastWeaponBase._next_i_voice[self._name_id] == #NPCRaycastWeaponBase._VOICES then
			NPCRaycastWeaponBase._next_i_voice[self._name_id] = 1
		else
			NPCRaycastWeaponBase._next_i_voice[self._name_id] = NPCRaycastWeaponBase._next_i_voice[self._name_id] + 1
		end
	else
		self._voice = "a"
	end

	slot4 = self._unit
	slot7 = "ls_flashlight"

	if self._unit.get_object(slot3, Idstring(slot6)) then
		self._flashlight_data = {}
		slot5 = self._unit
		slot8 = "ls_flashlight"
		self._flashlight_data.light = self._unit.get_object(slot4, Idstring(slot7))
		slot5 = self._unit
		slot8 = "flashlight"
		slot3 = self._unit.effect_spawner(slot4, Idstring(slot7))
		self._flashlight_data.effect = slot3
		slot5 = 400

		self._flashlight_data.light.set_far_range(slot3, self._flashlight_data.light)

		slot5 = 25

		self._flashlight_data.light.set_spot_angle_end(slot3, self._flashlight_data.light)

		slot5 = 2

		self._flashlight_data.light.set_multiplier(slot3, self._flashlight_data.light)
	end

	if tweak_data.weapon[self._name_id].has_suppressor then
		slot6 = tweak_data.weapon[self._name_id].has_suppressor

		self._sound_fire.set_switch(slot3, self._sound_fire, "suppressed")
	end

	return 
end
function NPCRaycastWeaponBase:setup(setup_data)
	self._autoaim = setup_data.autoaim
	self._alert_events = (setup_data.alert_AI and {}) or nil
	self._alert_size = tweak_data.weapon[self._name_id].alert_size
	self._alert_fires = {}
	self._suppression = tweak_data.weapon[self._name_id].suppression
	self._bullet_slotmask = setup_data.hit_slotmask or self._bullet_slotmask
	slot5 = "raycastable_characters"
	self._character_slotmask = managers.slot.get_mask(slot3, managers.slot)
	self._hit_player = (setup_data.hit_player and true) or false
	self._setup = setup_data
	self._setup.user_sound_variant = 1

	return 
end
function NPCRaycastWeaponBase:start_autofire(nr_shots)
	slot5 = nr_shots

	self._sound_autofire_start(slot3, self)

	slot4 = self._next_fire_allowed
	slot7 = Application
	self._next_fire_allowed = math.max(slot3, Application.time(slot6))
	self._shooting = true

	return 
end
function NPCRaycastWeaponBase:fire_mode()
	return (tweak_data.weapon[self._name_id].auto and "auto") or "single"
end
function NPCRaycastWeaponBase:recoil_wait()

	-- Decompilation error in this vicinity:
	slot3 = self
end
function NPCRaycastWeaponBase:stop_autofire()
	if not self._shooting then
		return 
	end

	slot3 = self

	self._sound_autofire_end(slot2)

	self._shooting = nil

	return 
end
function NPCRaycastWeaponBase:singleshot(...)
	slot3 = self
	local fired = self.fire(slot2, ...)

	if fired then
		slot4 = self

		self._sound_singleshot(slot3)
	end

	return fired
end
function NPCRaycastWeaponBase:trigger_held(...)
	local fired = nil
	slot5 = Application

	if self._next_fire_allowed <= Application.time(slot4) then
		slot4 = self
		fired = self.fire(slot3, ...)

		if fired then
			self._next_fire_allowed = self._next_fire_allowed + tweak_data.weapon[self._name_id].auto.fire_rate
		end
	end

	return fired
end
function NPCRaycastWeaponBase:add_damage_multiplier(damage_multiplier)
	self._damage = self._damage * damage_multiplier

	return 
end
local mto = Vector3()
local mfrom = Vector3()
local mspread = Vector3()
function NPCRaycastWeaponBase:fire_blank(direction, impact)
	local user_unit = self._setup.user_unit
	slot7 = mfrom

	self._unit.m_position(slot5, self._unit)

	local rays = {}

	if impact then
		slot8 = direction

		mvector3.set(slot6, mspread)

		slot8 = 5

		mvector3.spread(slot6, mspread)

		slot8 = mspread

		mvector3.set(slot6, mto)

		slot8 = 20000

		mvector3.multiply(slot6, mto)

		slot8 = mfrom

		mvector3.add(slot6, mto)

		slot14 = self._setup.ignore_units
		local col_ray = World.raycast(slot6, World, "ray", mfrom, mto, "slot_mask", self._blank_slotmask, "ignore_unit")
		slot9 = self._trail_effect_table.position

		self._obj_fire.m_position(World, self._obj_fire)

		slot9 = mspread

		mvector3.set(World, self._trail_effect_table.normal)
	end

	slot7 = World
	slot8 = self._muzzle_effect_table

	World.effect_manager(slot6).spawn(slot6, World.effect_manager(slot6))

	slot7 = self

	self._sound_singleshot(slot6)

	return 
end
function NPCRaycastWeaponBase:destroy(unit)
	slot5 = unit

	RaycastWeaponBase.super.pre_destroy(slot3, self)

	if self._shooting then
		slot4 = self

		self.stop_autofire(slot3)
	end

	return 
end
function NPCRaycastWeaponBase:_get_spread(user_unit)
	return 
end
function NPCRaycastWeaponBase:_sound_autofire_start(nr_shots)
	local tweak_sound = tweak_data.weapon[self._name_id].sounds

	if tweak_sound and tweak_sound.autofire_start then
		slot6 = tweak_sound.autofire_start

		self._sound_fire.post_event(slot4, self._sound_fire)
	else
		slot6 = "thompson_fire_npc"

		self._sound_fire.post_event(slot4, self._sound_fire)
	end

	return 
end
function NPCRaycastWeaponBase:_sound_autofire_end()
	local tweak_sound = tweak_data.weapon[self._name_id].sounds

	if tweak_sound and tweak_sound.autofire_stop then
		slot5 = tweak_sound.autofire_stop

		self._sound_fire.post_event(slot3, self._sound_fire)
	else
		slot5 = "thompson_fire_npc_stop"

		self._sound_fire.post_event(slot3, self._sound_fire)
	end

	return 
end
function NPCRaycastWeaponBase:_sound_singleshot()
	local tweak_sound = tweak_data.weapon[self._name_id].sounds
	local sound_name = tweak_sound.single

	if sound_name then
		slot6 = sound_name

		self._sound_fire.post_event(slot4, self._sound_fire)
	else
		slot7 = self._name_id

		Application.error(slot4, Application, "[NPCRaycastWeaponBase] The singleshot sound has not been set for weapon: ")
	end

	return 
end
local mvec_to = Vector3()
function NPCRaycastWeaponBase:_fire_raycast(user_unit, from_pos, direction, dmg_mul, shoot_player, target_unit)
	local enemy_type = ""

	if user_unit then
		slot10 = user_unit

		if user_unit.base(slot9) then
			slot10 = user_unit

			if user_unit.base(slot9)._tweak_table then
				slot11 = user_unit

				if tweak_data.character[user_unit.base(slot10)._tweak_table] then
					slot11 = user_unit
					enemy_type = tweak_data.character[user_unit.base(slot10)._tweak_table].type
				end
			end
		end
	end

	slot11 = user_unit
	local character_data = managers.criminals.character_data_by_unit(slot9, managers.criminals)
	local is_team_ai = character_data ~= nil

	if not is_team_ai then
		slot13 = BuffEffectManager.EFFECT_ENEMY_DOES_DAMAGE

		if managers.buff_effect.is_effect_active(slot11, managers.buff_effect) then
			slot13 = BuffEffectManager.EFFECT_ENEMY_DOES_DAMAGE
			local effect_value_enemy_damage_modifier = managers.buff_effect.get_effect_value(slot11, managers.buff_effect)
			dmg_mul = dmg_mul * effect_value_enemy_damage_modifier
		end
	end

	local result = {}
	local hit_unit = nil
	slot15 = direction

	mvector3.set(slot13, mvec_to)

	slot15 = 20000

	mvector3.multiply(slot13, mvec_to)

	slot15 = from_pos

	mvector3.add(slot13, mvec_to)

	local damage = self._damage * (dmg_mul or 1)
	slot22 = self._setup.ignore_units
	local col_ray = World.raycast(slot14, World, "ray", from_pos, mvec_to, "slot_mask", self._bullet_slotmask, "ignore_unit")
	local bullet_class = self._bullet_class or InstantBulletBase
	local player_hit, player_ray_data = nil

	if shoot_player and self._hit_player then
		slot22 = direction
		player_hit, player_ray_data = self.damage_player(slot18, self, col_ray, from_pos)

		if player_hit then
			slot23 = damage

			bullet_class.on_hit_player(slot18, bullet_class, col_ray or player_ray_data, self._unit, user_unit)
		end
	end

	local char_hit = nil

	if not player_hit and col_ray then
		slot24 = damage
		char_hit = bullet_class.on_collision(slot19, bullet_class, col_ray, self._unit, user_unit)
	end

	if (not col_ray or col_ray.unit ~= target_unit) and target_unit then
		slot20 = target_unit

		if target_unit.character_damage(slot19) then
			slot20 = target_unit

			if target_unit.character_damage(slot19).build_suppression then
				slot20 = target_unit
				slot21 = tweak_data.weapon[self._name_id].suppression

				target_unit.character_damage(slot19).build_suppression(slot19, target_unit.character_damage(slot19))
			end
		end
	end

	if not col_ray or 600 < col_ray.distance then
		slot22 = col_ray

		self._spawn_trail_effect(slot19, self, direction)
	end

	result.hit_enemy = char_hit

	if self._alert_events then
		result.rays = {
			col_ray
		}
	end

	return result
end
function NPCRaycastWeaponBase:_spawn_trail_effect(direction, col_ray)
	slot6 = self._trail_effect_table.position

	self._obj_fire.m_position(slot4, self._obj_fire)

	slot6 = direction

	mvector3.set(slot4, self._trail_effect_table.normal)

	slot5 = World
	slot6 = self._trail_effect_table
	local trail = World.effect_manager(slot4).spawn(slot4, World.effect_manager(slot4))

	if col_ray then
		slot6 = World
		slot7 = trail
		slot12 = col_ray.distance

		World.effect_manager(slot5).set_remaining_lifetime(slot5, World.effect_manager(slot5), math.clamp(slot9, (col_ray.distance - 600) / 10000, 0))
	end

	return 
end
function NPCRaycastWeaponBase:has_flashlight_on()
	return (self._flashlight_data and self._flashlight_data.on and true) or false
end
function NPCRaycastWeaponBase:flashlight_data()
	return self._flashlight_data
end
function NPCRaycastWeaponBase:flashlight_state_changed()
	if not self._flashlight_data then
		return 
	end

	if not self._flashlight_data.enabled or self._flashlight_data.dropped then
		return 
	end

	slot3 = managers.game_play_central

	if managers.game_play_central.flashlights_on(slot2) then
		slot4 = self._flashlight_light_lod_enabled

		self._flashlight_data.light.set_enable(slot2, self._flashlight_data.light)

		slot3 = self._flashlight_data.effect

		self._flashlight_data.effect.activate(slot2)

		self._flashlight_data.on = true
	else
		slot4 = false

		self._flashlight_data.light.set_enable(slot2, self._flashlight_data.light)

		slot3 = self._flashlight_data.effect

		self._flashlight_data.effect.kill_effect(slot2)

		self._flashlight_data.on = false
	end

	return 
end
function NPCRaycastWeaponBase:set_flashlight_enabled(enabled)
	if not self._flashlight_data then
		return 
	end

	self._flashlight_data.enabled = enabled
	slot4 = managers.game_play_central

	if managers.game_play_central.flashlights_on(slot3) and enabled then
		slot5 = self._flashlight_light_lod_enabled

		self._flashlight_data.light.set_enable(slot3, self._flashlight_data.light)

		slot4 = self._flashlight_data.effect

		self._flashlight_data.effect.activate(slot3)

		self._flashlight_data.on = true
	else
		slot5 = false

		self._flashlight_data.light.set_enable(slot3, self._flashlight_data.light)

		slot4 = self._flashlight_data.effect

		self._flashlight_data.effect.kill_effect(slot3)

		self._flashlight_data.on = false
	end

	return 
end
function NPCRaycastWeaponBase:set_flashlight_light_lod_enabled(enabled)
	if not self._flashlight_data then
		return 
	end

	self._flashlight_light_lod_enabled = enabled

	if self._flashlight_data.on and enabled then
		slot5 = true

		self._flashlight_data.light.set_enable(slot3, self._flashlight_data.light)
	else
		slot5 = false

		self._flashlight_data.light.set_enable(slot3, self._flashlight_data.light)
	end

	return 
end
function NPCRaycastWeaponBase:set_laser_enabled(state)
	return 
end

return 
