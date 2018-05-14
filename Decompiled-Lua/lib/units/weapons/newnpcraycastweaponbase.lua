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
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not NewNPCRaycastWeaponBase then
	slot2 = NewRaycastWeaponBase
	slot0 = class(slot1)
end

NewNPCRaycastWeaponBase = slot0
NewNPCRaycastWeaponBase._VOICES = {
	"a",
	"b",
	"c"
}
NewNPCRaycastWeaponBase._next_i_voice = {}
function NewNPCRaycastWeaponBase:init(unit)
	slot6 = false

	NewRaycastWeaponBase.super.super.init(slot3, self, unit)

	self._unit = unit
	self._name_id = self.name_id or "thompson_npc"
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
	slot5 = "WIN32"
	self._use_shell_ejection_effect = SystemInfo.platform(self._obj_fire) == Idstring(SystemInfo)

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

	if self._multivoice then
		if not NewNPCRaycastWeaponBase._next_i_voice[self._name_id] then
			NewNPCRaycastWeaponBase._next_i_voice[self._name_id] = 1
		end

		self._voice = NewNPCRaycastWeaponBase._VOICES[NewNPCRaycastWeaponBase._next_i_voice[self._name_id]]

		if NewNPCRaycastWeaponBase._next_i_voice[self._name_id] == #NewNPCRaycastWeaponBase._VOICES then
			NewNPCRaycastWeaponBase._next_i_voice[self._name_id] = 1
		else
			NewNPCRaycastWeaponBase._next_i_voice[self._name_id] = NewNPCRaycastWeaponBase._next_i_voice[self._name_id] + 1
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

	self._textures = {}
	self._cosmetics_data = nil
	self._materials = nil
	slot9 = self._unit
	slot6 = {
		"on_peer_removed"
	}
	slot11 = "_on_peer_removed"

	managers.mission.add_global_event_listener(slot3, managers.mission, tostring(self._unit.key(slot8)), callback(slot8, self, self))

	return 
end
function NewNPCRaycastWeaponBase:_on_peer_removed(peer_id)
	if self._shooting then
		local user_unit = self._setup.user_unit
		slot6 = user_unit
		local user_peer_id = managers.criminals.character_peer_id_by_unit(slot4, managers.criminals)

		if peer_id == user_peer_id then
			slot6 = self

			self.stop_autofire(slot5)
		end
	end

	return 
end
function NewNPCRaycastWeaponBase:setup(setup_data)
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

	return 
end
function NewNPCRaycastWeaponBase:assemble(factory_id)
	slot5 = factory_id

	NewNPCRaycastWeaponBase.super.assemble(slot3, NewNPCRaycastWeaponBase.super)

	slot6 = self._blueprint
	self._ammo_data = managers.weapon_factory.get_ammo_data_from_weapon(slot3, managers.weapon_factory, self._factory_id) or {}
	local ammo_muzzle_effect = self._ammo_data and self._ammo_data.muzzleflash

	if ammo_muzzle_effect then
		self._muzzle_effect = ammo_muzzle_effect
		self._muzzle_effect_table = {
			force_synch = false,
			effect = self._muzzle_effect,
			parent = self._obj_fire
		}
	end

	return 
end
function NewNPCRaycastWeaponBase:is_npc()
	return true
end
function NewNPCRaycastWeaponBase:skip_queue()
	return true
end
function NewNPCRaycastWeaponBase:use_thq()
	slot3 = managers.weapon_factory

	return managers.weapon_factory.use_thq_weapon_parts(slot2)
end
function NewNPCRaycastWeaponBase:check_npc()
	if not self._assembly_complete then
		return 
	end

	slot6 = self._blueprint
	local gadgets = managers.weapon_factory.get_parts_from_weapon_by_type_or_perk(slot2, managers.weapon_factory, "gadget", self._factory_id)

	if gadgets then
		local gadget = nil
		slot5 = gadgets

		for _, i in ipairs(slot4) do
			gadget = self._parts[i]

			if gadget then
				slot10 = gadget.unit
				slot10 = gadget.unit.base(slot9)

				gadget.unit.base(slot9).set_npc(slot9)
			end
		end
	end

	return 
end
function NewNPCRaycastWeaponBase:start_autofire(nr_shots)
	slot5 = nr_shots

	self._sound_autofire_start(slot3, self)

	slot4 = self._next_fire_allowed
	slot7 = Application
	self._next_fire_allowed = math.max(slot3, Application.time(slot6))
	self._shooting = true

	return 
end
function NewNPCRaycastWeaponBase:stop_autofire()
	slot3 = self

	self._sound_autofire_end(slot2)

	self._shooting = nil

	return 
end
function NewNPCRaycastWeaponBase:singleshot(...)
	slot3 = self
	local fired = self.fire(slot2, ...)

	if fired then
		slot4 = self

		self._sound_singleshot(slot3)
	end

	return fired
end
function NewNPCRaycastWeaponBase:trigger_held(...)
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
function NewNPCRaycastWeaponBase:auto_trigger_held(direction, impact)
	local fired = false
	slot7 = Application

	if self._next_fire_allowed <= Application.time(slot6) then
		slot8 = impact
		fired = self.auto_fire_blank(slot5, self, direction)

		if fired then
			self._next_fire_allowed = self._next_fire_allowed + ((tweak_data.weapon[self._name_id].auto and tweak_data.weapon[self._name_id].auto.fire_rate) or 0.1)
		end
	end

	return fired
end
local mto = Vector3()
local mfrom = Vector3()
local mspread = Vector3()
function NewNPCRaycastWeaponBase:auto_fire_blank(direction, impact)
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

		if self._use_trails == nil or self._use_trails == true then
			slot8 = self._obj_fire

			if alive(slot7) then
				slot9 = self._trail_effect_table.position

				self._obj_fire.m_position(slot7, self._obj_fire)

				slot9 = mspread

				mvector3.set(slot7, self._trail_effect_table.normal)
			end

			local trail = nil
			slot9 = self

			if not self.weapon_tweak_data(slot8).no_trail then

				-- Decompilation error in this vicinity:
				slot9 = self._obj_fire
				slot9 = World
				slot10 = self._trail_effect_table
				trail = World.effect_manager(slot8).spawn(slot8, World.effect_manager(slot8)) or nil
			end

			if col_ray then
				slot14 = true

				InstantBulletBase.on_collision(slot8, InstantBulletBase, col_ray, self._unit, user_unit, self._damage)

				if trail then
					slot9 = World
					slot10 = trail
					slot15 = col_ray.distance

					World.effect_manager(slot8).set_remaining_lifetime(slot8, World.effect_manager(slot8), math.clamp(slot12, (col_ray.distance - 600) / 10000, 0))
				end

				slot10 = col_ray

				table.insert(slot8, rays)
			end
		end
	end

	slot7 = self._obj_fire

	if alive(slot6) then
		slot9 = direction

		self._spawn_muzzle_effect(slot6, self, mfrom)
	end

	if self._use_shell_ejection_effect then
		slot7 = World
		slot8 = self._shell_ejection_effect_table

		World.effect_manager(slot6).spawn(slot6, World.effect_manager(slot6))
	end

	slot7 = self

	if self.weapon_tweak_data(slot6).has_fire_animation then
		slot8 = "fire"

		self.tweak_data_anim_play(slot6, self)
	end

	return true
end
function NewNPCRaycastWeaponBase:fire_blank(direction, impact)
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

		if self._use_trails == nil or self._use_trails == true then
			slot8 = self._obj_fire

			if alive(slot7) then
				slot9 = self._trail_effect_table.position

				self._obj_fire.m_position(slot7, self._obj_fire)

				slot9 = mspread

				mvector3.set(slot7, self._trail_effect_table.normal)
			end

			local trail = nil
			slot9 = self

			if not self.weapon_tweak_data(slot8).no_trail then

				-- Decompilation error in this vicinity:
				slot9 = self._obj_fire
				slot9 = World
				slot10 = self._trail_effect_table
				trail = World.effect_manager(slot8).spawn(slot8, World.effect_manager(slot8)) or nil
			end

			if col_ray then
				local bullet_class = self._bullet_class or InstantBulletBase
				slot15 = true

				bullet_class.on_collision(slot9, bullet_class, col_ray, self._unit, user_unit, self._damage)

				if trail then
					slot10 = World
					slot11 = trail
					slot16 = col_ray.distance

					World.effect_manager(slot9).set_remaining_lifetime(slot9, World.effect_manager(slot9), math.clamp(slot13, (col_ray.distance - 600) / 10000, 0))
				end

				slot11 = col_ray

				table.insert(slot9, rays)
			end
		end
	end

	slot7 = self._obj_fire

	if alive(slot6) then
		slot9 = direction

		self._spawn_muzzle_effect(slot6, self, mfrom)
	end

	if self._use_shell_ejection_effect then
		slot7 = World
		slot8 = self._shell_ejection_effect_table

		World.effect_manager(slot6).spawn(slot6, World.effect_manager(slot6))
	end

	slot7 = self

	if self.weapon_tweak_data(slot6).has_fire_animation then
		slot8 = "fire"

		self.tweak_data_anim_play(slot6, self)
	end

	slot7 = self

	self._sound_singleshot(slot6)

	return 
end
function NewNPCRaycastWeaponBase:_spawn_muzzle_effect(from_pos, direction)
	slot5 = World
	slot6 = self._muzzle_effect_table

	World.effect_manager(slot4).spawn(slot4, World.effect_manager(slot4))

	return 
end
function NewNPCRaycastWeaponBase:destroy(unit)
	slot5 = unit

	RaycastWeaponBase.super.pre_destroy(slot3, self)

	slot5 = self._parts

	managers.weapon_factory.disassemble(slot3, managers.weapon_factory)

	if self._shooting then
		slot4 = self

		self.stop_autofire(slot3)
	end

	slot4 = managers.mission
	slot9 = self._unit

	managers.mission.remove_global_event_listener(slot3, tostring(self._unit.key(slot8)))

	return 
end
function NewNPCRaycastWeaponBase:_get_spread(user_unit)
	return 
end
function NewNPCRaycastWeaponBase:_sound_autofire_start(nr_shots)
	local tweak_sound = tweak_data.weapon[self._name_id].sounds
	local sound_name = tweak_sound.autofire_start
	slot6 = self._sound_fire

	self._sound_fire.stop(slot5)

	slot12 = "_on_auto_fire_stop"
	slot10 = "end_of_event"
	local sound = self._sound_fire.post_event(slot5, self._sound_fire, sound_name, callback(slot9, self, self), nil)

	return 
end
function NewNPCRaycastWeaponBase:_on_auto_fire_stop()
	if self._shooting then
		slot3 = self

		self._sound_autofire_start(slot2)
	end

	return 
end
function NewNPCRaycastWeaponBase:_sound_autofire_end()
	local tweak_sound = tweak_data.weapon[self._name_id].sounds
	local sound_name = tweak_sound.autofire_stop
	slot6 = sound_name
	local sound = self._sound_fire.post_event(slot4, self._sound_fire)

	return 
end
function NewNPCRaycastWeaponBase:_sound_singleshot()
	local tweak_sound = tweak_data.weapon[self._name_id].sounds
	local sound_name = tweak_sound.single
	slot6 = sound_name
	local sound = self._sound_fire.post_event(slot4, self._sound_fire)

	return 
end
local mvec_to = Vector3()
function NewNPCRaycastWeaponBase:_fire_raycast(user_unit, from_pos, direction, dmg_mul, shoot_player)
	local result = {}
	local hit_unit = nil
	slot13 = self._unit

	debug_pause_unit(slot9, user_unit, "[NewNPCRaycastWeaponBase:_fire_raycast]", user_unit)

	slot11 = direction

	mvector3.set(slot9, mvec_to)

	slot11 = 20000

	mvector3.multiply(slot9, mvec_to)

	slot11 = from_pos

	mvector3.add(slot9, mvec_to)

	local damage = self._damage * (dmg_mul or 1)
	slot18 = self._setup.ignore_units
	local col_ray = World.raycast(slot10, World, "ray", from_pos, mvec_to, "slot_mask", self._bullet_slotmask, "ignore_unit")
	local bullet_class = self._bullet_class or InstantBulletBase

	if col_ray then
		slot14 = self._character_slotmask

		if col_ray.unit.in_slot(slot12, col_ray.unit) then
			slot17 = damage
			hit_unit = bullet_class.on_collision(slot12, bullet_class, col_ray, self._unit, user_unit)
		elseif shoot_player and self._hit_player then
			slot16 = direction
		else
			slot17 = damage
			hit_unit = bullet_class.on_collision(slot12, bullet_class, col_ray, self._unit, user_unit)
		end
	elseif shoot_player and self._hit_player then
		slot16 = direction
		local hit, ray_data = self.damage_player(slot12, self, col_ray, from_pos)

		if hit then
			slot19 = damage

			bullet_class.on_hit_player(slot14, bullet_class, ray_data, self._unit, user_unit)
		end
	end

	if not col_ray or 600 < col_ray.distance then
		slot15 = col_ray

		self._spawn_trail_effect(slot12, self, direction)
	end

	result.hit_enemy = hit_unit

	if self._alert_events then
		result.rays = {
			col_ray
		}
	end

	return result
end
function NewNPCRaycastWeaponBase:_spawn_trail_effect(direction, col_ray)
	slot5 = not self._obj_fire

	if alive(slot4) then
		return 
	end

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
function NewNPCRaycastWeaponBase:has_flashlight_on()
	return (self._flashlight_data and self._flashlight_data.on and true) or false
end
function NewNPCRaycastWeaponBase:flashlight_data()
	return self._flashlight_data
end
function NewNPCRaycastWeaponBase:flashlight_state_changed()
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
function NewNPCRaycastWeaponBase:set_flashlight_enabled(enabled)
	if not self._flashlight_data then
		return 
	end

	if not self._assembly_complete then
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
function NewNPCRaycastWeaponBase:set_flashlight_light_lod_enabled(enabled)
	if not self._flashlight_data then
		return 
	end

	if not self._assembly_complete then
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

return 
