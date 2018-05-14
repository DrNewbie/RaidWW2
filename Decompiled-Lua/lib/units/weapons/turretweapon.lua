-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
TurretWeapon = TurretWeapon or class()
local mvec_to = Vector3()
function TurretWeapon:init(unit)
	self._unit = unit
	self._name_id = self.name_id
	self._overheat_skill_id = self._name_id .. "_overheat_reduction"
	slot5 = true

	self.set_active("_overheat_reduction", self)

	slot4 = unit
	slot7 = "fire_1"
	self._locator_fire = unit.get_object("_overheat_reduction", Idstring(slot6))
	slot4 = unit
	slot7 = "shells"
	self._locator_shells = unit.get_object("_overheat_reduction", Idstring(slot6))
	slot4 = unit
	slot7 = "es_smoke"

	if not unit.get_object("_overheat_reduction", Idstring(slot6)) then
		slot4 = unit
		slot7 = "es_smoke_1"
		slot2 = unit.get_object(slot3, Idstring(slot6))
	end

	self._overheating_smoke_locator = slot2
	self._number_of_barrels = tweak_data.weapon[self.name_id].number_of_barrels or 1
	self._current_barrel = 1
	slot4 = self

	self._setup_fire_effects(slot3)

	slot4 = self

	self._setup_smoke_effects(slot3)

	if tweak_data.weapon[self.name_id].shell_ejection_effect then
		slot4 = tweak_data.weapon[self.name_id].shell_ejection_effect
		slot2 = Idstring(slot3)
	end

	self._shell_ejection_effect = slot2
	self._shell_ejection_effect_table = nil

	if self._shell_ejection_effect then
		self._shell_ejection_effect_table = {
			effect = self._shell_ejection_effect,
			parent = self._locator_shells
		}
	end

	self._trail_effect_table = {
		effect = RaycastWeaponBase.TRAIL_EFFECT,
		position = Vector3(),
		normal = Vector3()
	}
	slot5 = "turret_fire"
	self._sound_fire = SoundDevice.create_source(Vector3(), SoundDevice)

	if self._locator_fire then
		slot5 = self._locator_fire

		self._sound_fire.link(slot3, self._sound_fire)
	end

	self._bullet_class = InstantBulletBase
	slot4 = self._bullet_class
	self._bullet_slotmask = self._bullet_class.bullet_slotmask(slot3)
	self._next_fire_allowed = 0
	slot4 = unit
	slot7 = "first_person_view"
	self._locator_fpv = unit.get_object(slot3, Idstring(slot6))
	slot4 = unit
	slot7 = "third_person_placement"
	self._locator_tpp = unit.get_object(slot3, Idstring(slot6))
	slot4 = unit
	slot7 = "third_person_placement_orig"
	self._locator_tpp_orig = unit.get_object(slot3, Idstring(slot6)) or self._locator_tpp
	slot4 = unit
	slot7 = "third_person_placement_orig"
	self._SO_object = unit.get_object(slot3, Idstring(slot6)) or self._locator_tpp_orig
	slot4 = unit
	slot7 = "anim_heading"
	self._joint_heading = unit.get_object(slot3, Idstring(slot6))
	slot4 = unit
	slot7 = "anim_pitch"
	self._joint_pitch = unit.get_object(slot3, Idstring(slot6))
	slot8 = self._joint_pitch
	slot6 = self._joint_pitch.local_position(self._joint_pitch).z
	self._joint_pitch_original_pos = Vector3(slot3, self._joint_pitch.local_position(Idstring).x, self._joint_pitch.local_position(self._joint_pitch).y)
	slot8 = self._joint_heading
	slot6 = self._joint_heading.local_position(self._joint_heading).z
	self._joint_heading_original_pos = Vector3(slot3, self._joint_heading.local_position(self._joint_pitch.local_position(self._joint_pitch).y).x, self._joint_heading.local_position(self._joint_heading).y)
	self._joint_root_time_limit = 10
	self._joint_root_elapsed_time = 0
	slot5 = "turret_movement"
	self._sound_movement = SoundDevice.create_source(slot3, SoundDevice)

	if self._joint_pitch then
		slot5 = self._joint_pitch

		self._sound_movement.link(slot3, self._sound_movement)
	end

	self._sound_fire_start = tweak_data.weapon[self.name_id].sound_fire_start
	self._sound_fire_stop = tweak_data.weapon[self.name_id].sound_fire_stop
	self._sound_fire_start_fps = tweak_data.weapon[self.name_id].sound_fire_start_fps
	self._sound_fire_stop_fps = tweak_data.weapon[self.name_id].sound_fire_stop_fps
	self._sound_movement_start = tweak_data.weapon[self.name_id].sound_movement_start
	self._sound_movement_stop = tweak_data.weapon[self.name_id].sound_movement_stop
	self._fire_type = tweak_data.weapon[self.name_id].fire_type or "auto"
	self._bullet_type = tweak_data.weapon[self.name_id].bullet_type
	self._fire_range = tweak_data.weapon[self.name_id].fire_range
	self._mode = nil
	self._puppet_unit = nil
	self._puppet_stance = tweak_data.weapon[self.name_id].puppet_stance or "sitting"
	self._player_on = false
	self._turret_info = {}
	self._alert_events = {}
	self._alert_size = 100000
	self._alert_fires = {}
	self._damage = tweak_data.weapon[self.name_id].damage
	self._damage_npc = tweak_data.weapon[self.name_id].DAMAGE
	self._suppression = tweak_data.weapon[self.name_id].SUPPRESSION
	self._overheat_current = 0
	self._overheat_time = tweak_data.weapon[self.name_id].overheat_time or 1
	self._overheat_speed = tweak_data.weapon[self.name_id].overheat_speed or 0
	self._overheated = false
	slot5 = false

	self._enable_overheating_smoke(slot3, self)

	self._heat_material = tweak_data.weapon[self.name_id].heat_material
	self._heat_material_parameter = tweak_data.weapon[self.name_id].heat_material_parameter
	self._setup = {
		turret_weapon_initialized = false,
		ignore_units = {
			self._unit
		}
	}
	self._SO_id = nil
	local usable_by_npc = tweak_data.weapon[self.name_id].usable_by_npc or false
	self._automatic_SO = usable_by_npc
	self._lock_fire = false
	slot5 = managers.groupai
	slot6 = self

	managers.groupai.state(slot4).register_usable_turret(slot4, managers.groupai.state(slot4))

	return 
end
function TurretWeapon:_init()
	return 
end
function TurretWeapon:post_init()
	slot3 = self._unit
	slot3 = self._unit.base(slot2)

	self._unit.base(slot2).post_init(slot2)

	return 
end
function TurretWeapon:pre_destroy()
	return 
end
function TurretWeapon:set_visibility_state(visible)
	slot5 = "[TurretWeapon] TurretWeapon:set_visibility_state: Implement me."

	Application.error(slot3, Application)

	return 
end
function TurretWeapon:out_of_ammo()
	return false
end
function TurretWeapon:can_auto_reload()
	slot4 = "[TurretWeapon] TurretWeapon:out_of_ammo(): Implement me."

	Application.error(slot2, Application)

	return 
end
function TurretWeapon:set_laser_enabled()
	slot4 = "[TurretWeapon] TurretWeapon:set_laser_enabled(): Implement me."

	Application.error(slot2, Application)

	return 
end
function TurretWeapon:setup(setup_data, damage_multiplier)
	return 
end
function TurretWeapon:initialize_sentry(unit)
	slot4 = self._unit

	if not alive(slot3) then
		return 
	end

	if not unit then
		slot4 = managers.player
		local owner = managers.player.player_unit(slot3)
	end

	slot5 = self._unit.position(slot6)
	slot8 = self._unit
	local attached_data = SentryGunBase._attach(slot4, self._unit.rotation(self._unit))
	slot6 = self._unit
	slot14 = attached_data

	self._unit.base(slot5).setup(slot5, self._unit.base(slot5), owner, 1, 1, 1, 1, 1, false)

	slot6 = self._unit
	slot8 = self.name_id

	self._unit.base(slot5).activate_as_module(slot5, self._unit.base(slot5), "combatant")

	slot6 = managers.network
	slot8 = self._unit

	managers.network.session(slot5).send_to_peers_synched(slot5, managers.network.session(slot5), "sync_ground_turret_activate_as_module")

	self._overheat_time = tweak_data.weapon[self.name_id].overheat_time

	if not self._overheat_current then
		self._overheat_current = 0
	end

	slot6 = self._unit
	slot7 = true

	self._unit.brain(slot5).switch_off(slot5, self._unit.brain(slot5))

	slot6 = self._unit
	slot7 = false

	self._unit.movement(slot5).set_active(slot5, self._unit.movement(slot5))

	self._setup.turret_weapon_initialized = true

	return 
end
function TurretWeapon:_setup_fire_effects()
	if tweak_data.weapon[self.name_id].muzzle_effect then
		slot3 = tweak_data.weapon[self.name_id].muzzle_effect
		local muzzle_effect_tweak = Idstring(slot2)
	end

	self._muzzle_effect_table = {}
	self._muzzle_effect = muzzle_effect_tweak

	for barrel_id = 1, self._number_of_barrels, 1 do
		local fire_locator_property_name = "_locator_fire_" .. barrel_id
		local fire_locator_object_name = Idstring(slot8)
		slot11 = fire_locator_object_name
		self[fire_locator_property_name] = self._unit.get_object("fire_" .. barrel_id, self._unit)

		if muzzle_effect_tweak then
			slot11 = {
				force_synch = false,
				effect = self._muzzle_effect,
				parent = self[fire_locator_property_name]
			}

			table.insert(slot9, self._muzzle_effect_table)
		end
	end

	return 
end
function TurretWeapon:_setup_smoke_effects()
	self._overheating_smoke_effect_table = {}
	slot3 = "effects/vanilla/smoke/smoke_turret_heated_001"
	self._overheating_smoke_effect = Idstring(slot2)

	for barrel_id = 1, self._number_of_barrels, 1 do
		local smoke_locator_property_name = "_locator_smoke_" .. barrel_id
		local smoke_locator_object_name = Idstring(slot7)
		slot10 = smoke_locator_object_name
		self[smoke_locator_property_name] = self._unit.get_object("es_smoke_" .. barrel_id, self._unit)

		if self[smoke_locator_property_name] then
			slot10 = {
				force_synch = false,
				effect = self._overheating_smoke_effect,
				parent = self[smoke_locator_property_name]
			}

			table.insert(slot8, self._overheating_smoke_effect_table)
		end
	end

	return 
end
function TurretWeapon:activate_sentry()
	self._moving = false
	slot3 = self._unit
	slot3 = self._unit.brain(slot2)

	self._unit.brain(slot2).switch_on(slot2)

	slot3 = self._unit
	slot4 = true

	self._unit.movement(slot2).set_active(slot2, self._unit.movement(slot2))

	return 
end
function TurretWeapon:deactivate_sentry()
	self._moving = false
	slot3 = self._unit
	slot4 = true

	self._unit.brain(slot2).switch_off(slot2, self._unit.brain(slot2))

	slot3 = self._unit
	slot4 = false

	self._unit.movement(slot2).set_active(slot2, self._unit.movement(slot2))

	return 
end
function TurretWeapon:player_on()
	return self._player_on
end
function TurretWeapon:set_player_on(is_on)
	self._player_on = is_on

	return 
end
function TurretWeapon:set_mountable()
	if self._administered_unit_data then
		return 
	end

	slot3 = Network

	if not Network.is_server(slot2) then
		slot3 = managers.network
		slot5 = self._unit

		managers.network.session(slot2).send_to_host(slot2, managers.network.session(slot2), "sync_ground_turret_create_SO")
	else
		slot3 = self

		self._create_turret_SO(slot2)
	end

	return 
end
function TurretWeapon:debug_switch_on()
	slot3 = self._unit
	slot3 = self._unit.brain(slot2)

	self._unit.brain(slot2).switch_on(slot2)

	slot3 = self._unit
	slot4 = true

	self._unit.movement(slot2).set_active(slot2, self._unit.movement(slot2))

	return 
end
function TurretWeapon:debug_switch_off()
	slot3 = self._unit
	slot4 = true

	self._unit.brain(slot2).switch_off(slot2, self._unit.brain(slot2))

	slot3 = self._unit
	slot4 = false

	self._unit.movement(slot2).set_active(slot2, self._unit.movement(slot2))

	return 
end
function TurretWeapon:debug_deactivate()
	slot3 = self

	self.deactivate(slot2)

	return 
end
function TurretWeapon:update(unit, t, dt)
	slot8 = self._overheat_current * 100

	SoundDevice.set_rtpc(slot5, SoundDevice, "turret_heat_rtpc")

	if self._mode and self._mode == "enemy" then
		slot6 = self._puppet_unit

		if not alive(slot5) then
			slot7 = "TurretWeapon:update: ghost turret detected."

			Application.trace(slot5, Application)

			slot6 = self

			self.deactivate(slot5)
		end
	end

	slot7 = dt

	self._reduce_heat(slot5, self)

	if self._heat_material and self._heat_material_parameter then
		local ids_heat_material = Idstring(slot5)
		local ids_heat_material_param = Idstring(self._heat_material)
		local materials = self._unit.materials(self._heat_material_parameter)
		slot9 = materials

		for _, material in ipairs(self._unit) do
			slot14 = material

			if ids_heat_material == material.name(slot13) then
				local start_verheating_threshold = 0.5

				if start_verheating_threshold < self._overheat_current then
					slot17 = ((self._overheat_current - start_verheating_threshold) * 1) / start_verheating_threshold

					material.set_variable(slot14, material, ids_heat_material_param)
				else
					slot17 = 0

					material.set_variable(slot14, material, ids_heat_material_param)
				end
			end
		end
	end

	if not self._active then
		return 
	end

	if self._turret_shell then
		slot7 = dt

		self._update_shell_movement(slot5, self)
	end

	slot7 = dt

	self._update_turret_rot(slot5, self)

	slot6 = self._puppet_unit

	if alive(slot5) and self._puppet_stance == "standing" then
		slot6 = self

		self._upd_puppet_movement(slot5)
	end

	return 
end
function TurretWeapon:on_unit_set_enabled(enable)
	slot4 = self._unit
	slot6 = true

	self._unit.interaction(slot3).set_active(slot3, self._unit.interaction(slot3), enable)

	return 
end
function TurretWeapon:set_turret_rot(dt)
	slot4 = self._unit

	if not alive(slot3) or not self._turret_user or not self._joint_heading or not self._joint_pitch then
		return 
	end

	slot4 = managers.player
	local player_unit = managers.player.player_unit(slot3)

	if not player_unit then
		slot6 = "TurretWeapon:_set_turret_rot - missing player unit "

		Application.trace(slot4, Application)

		return 
	end

	slot5 = managers.player
	slot5 = managers.player.player_unit(slot4)
	slot5 = managers.player.player_unit(slot4).movement(slot4)
	local player_rotation = managers.player.player_unit(slot4).movement(slot4).m_head_rot(slot4)
	self._player_rotation = player_rotation

	return 
end
function TurretWeapon:deactivate()
	slot3 = self._unit
	slot4 = true

	self._unit.brain(slot2).switch_off(slot2, self._unit.brain(slot2))

	slot3 = self._unit
	slot4 = false

	self._unit.movement(slot2).set_active(slot2, self._unit.movement(slot2))

	slot4 = false

	self.set_active(slot2, self)

	slot3 = self

	self.stop_autofire(slot2)

	self._mode = nil
	slot3 = self._puppet_unit

	if alive(slot2) then
		slot3 = self._puppet_unit
		slot3 = self._puppet_unit.inventory(slot2)

		self._puppet_unit.inventory(slot2).show_equipped_unit(slot2)

		slot3 = self._puppet_unit
		slot3 = self._puppet_unit.character_damage(slot2)

		if not self._puppet_unit.character_damage(slot2).dead(slot2) then
			slot3 = self._puppet_unit
			slot4 = "e_so_mg34_exit"

			self._puppet_unit.movement(slot2).play_redirect(slot2, self._puppet_unit.movement(slot2))

			slot3 = self._puppet_unit
			self._puppet_unit.unit_data(slot2).turret_weapon = nil
			slot3 = self._puppet_unit

			self._puppet_unit.unlink(nil)

			slot3 = Network

			if Network.is_server(nil) then
				slot3 = self._puppet_unit
				slot4 = {
					is_default = true,
					type = "attack"
				}

				self._puppet_unit.brain(slot2).set_objective(slot2, self._puppet_unit.brain(slot2))
			end
		end
	end

	self._puppet_unit = nil
	self._puppet_walking = false
	self._administered_unit_data = nil
	slot3 = self._unit
	slot5 = true

	self._unit.interaction(slot2).set_active(slot2, self._unit.interaction(slot2), true)

	slot3 = self._unit

	if self._unit.damage(slot2) then
		slot3 = self._unit
		slot4 = "turret_is_available"

		if self._unit.damage(slot2).has_sequence(slot2, self._unit.damage(slot2)) then
			slot3 = self._unit
			slot4 = "turret_is_available"

			self._unit.damage(slot2).run_sequence_simple(slot2, self._unit.damage(slot2))
		end
	end

	slot3 = managers.groupai
	slot7 = "player"
	local team = managers.groupai.state(slot2).team_data(slot2, tweak_data.levels.get_default_team_ID(slot5, tweak_data.levels))
	slot4 = self._unit
	slot5 = team

	self._unit.movement(managers.groupai.state(slot2)).set_team(managers.groupai.state(slot2), self._unit.movement(managers.groupai.state(slot2)))

	self._player_rotation = nil
	slot4 = managers.network
	slot6 = self._unit

	managers.network.session(managers.groupai.state(slot2)).send_to_peers_synched(managers.groupai.state(slot2), managers.network.session(managers.groupai.state(slot2)), "sync_ground_turret_deactivate")

	return 
end
function TurretWeapon:get_current_heat()
	return self._overheat_current
end
function TurretWeapon:is_overheating()
	return self._overheated
end
function TurretWeapon:_reduce_heat(dt)
	if not self._shooting then
		self._overheat_time = tweak_data.weapon[self.name_id].overheat_time or 1
		slot6 = 1
		self._overheat_current = math.clamp(slot3, self._overheat_current - 1 / (self._overheat_time or 1) * dt, 0)
	end

	if 0 < self._overheat_current and self._overheat_current < 0.1 then
		slot5 = false

		self._enable_overheating_smoke(slot3, self)
	end

	if self._overheat_current == 0 then
		self._overheated = false
	end

	return 
end
function TurretWeapon:_increase_heat()
	slot3 = self._puppet_unit

	if alive(slot2) then
		return 
	end

	local warcry_multiplier = 1
	slot4 = managers.warcry

	if managers.warcry.active(slot3) then
		slot4 = managers.warcry

		if managers.warcry.get_active_warcry_name(slot3) == "berserk" then
			slot7 = 1
			warcry_multiplier = managers.player.upgrade_value(slot3, managers.player, "player", "warcry_overheat_multiplier")
		end
	end

	slot8 = 1
	local overheat_delta = self._overheat_speed * managers.player.upgrade_value(slot4, managers.player, "player", self._overheat_skill_id) * warcry_multiplier
	slot7 = 1
	self._overheat_current = math.clamp(slot4, self._overheat_current + overheat_delta, 0)

	if 1 <= self._overheat_current then
		self._overheated = true
		slot5 = self

		self.stop_autofire(slot4)

		slot6 = true

		self._enable_overheating_smoke(slot4, self)
	end

	return 
end
function TurretWeapon:_enable_overheating_smoke(enabled)
	if self._overheating_smoke_effect and enabled then
		for barrel_id = 1, self._number_of_barrels, 1 do
			if self._overheating_smoke_effect_table[barrel_id] then
				local smoke_spawn_name = "_overheating_smoke_spawn_" .. barrel_id
				slot9 = World
				slot10 = self._overheating_smoke_effect_table[barrel_id]
				self[smoke_spawn_name] = World.effect_manager(slot8).spawn(slot8, World.effect_manager(slot8))
			end
		end
	else
		for barrel_id = 1, self._number_of_barrels, 1 do
			local smoke_spawn_name = "_overheating_smoke_spawn_" .. barrel_id

			if self[smoke_spawn_name] then
				slot9 = World
				slot10 = self[smoke_spawn_name]

				World.effect_manager(slot8).fade_kill(slot8, World.effect_manager(slot8))

				self[smoke_spawn_name] = nil
			end
		end
	end

	return 
end
function TurretWeapon:_update_heading_rotation(dt, target_heading_rot)
	local anim_lerp = dt * 4
	slot6 = self._joint_heading
	slot8 = anim_lerp
	local smooth_heading_rot = self._joint_heading.rotation(slot5).slerp(slot5, self._joint_heading.rotation(slot5), target_heading_rot)
	slot8 = smooth_heading_rot

	self._joint_heading.set_rotation(self._joint_heading.rotation(slot5), self._joint_heading)

	local heading_diff = Rotation.rotation_difference(self._joint_heading.rotation(slot5), Rotation, smooth_heading_rot)
	slot10 = heading_diff

	return math.abs(heading_diff.yaw(target_heading_rot))
end
function TurretWeapon:_update_animation_pitch(anim_name, dt, target_pitch)
	slot6 = self._unit
	local anims = self._unit.anim_groups(slot5)
	local anim_exists = false
	local anim_id_name = Idstring(slot7)
	slot9 = anims

	for _, v in pairs(anim_name) do
		if v == anim_id_name then
			anim_exists = true

			break
		end
	end

	if not anim_exists then
		return 0
	end

	local MAX_ANGLE = tweak_data.weapon[self.name_id].MAX_PITCH_ANGLE
	local MIN_ANGLE = tweak_data.weapon[self.name_id].MIN_PITCH_ANGLE
	local pitch_percentage = ((target_pitch - MIN_ANGLE) * 100) / (MAX_ANGLE - MIN_ANGLE)
	slot13 = anim_id_name
	local MAX_TIME = self._unit.anim_length(slot11, self._unit)
	slot14 = anim_id_name
	local CUR_ANIM_TIME = self._unit.anim_time(self._unit, self._unit)
	local anim_pitch = (CUR_ANIM_TIME * (MAX_ANGLE - MIN_ANGLE)) / MAX_TIME
	local anim_t = (pitch_percentage * MAX_TIME) / 100
	local anim_dir = 1

	if target_pitch < anim_pitch then
		anim_dir = -1
	end

	slot20 = anim_dir

	self._unit.anim_play_to(slot16, self._unit, anim_id_name, anim_t)

	slot17 = target_pitch - anim_pitch

	return math.abs(slot16)
end
function TurretWeapon:_reset_pitch()
	local heading = self._joint_heading.rotation(slot2)
	slot5 = heading

	self._joint_pitch.set_rotation(self._joint_heading, self._joint_pitch)

	slot5 = "anim_arm"

	self._reset_animation(self._joint_heading, self)

	return 
end
function TurretWeapon:_update_rotation_pitch(dt, target_pitch_rot)
	local anim_lerp = 4 * dt
	local MAX_ANGLE = tweak_data.weapon[self.name_id].MAX_PITCH_ANGLE
	local MIN_ANGLE = tweak_data.weapon[self.name_id].MIN_PITCH_ANGLE
	slot8 = self._joint_pitch
	local current_pitch = self._joint_pitch.rotation(slot7).pitch(slot7)
	slot9 = target_pitch_rot
	local target_pitch = target_pitch_rot.pitch(self._joint_pitch.rotation(slot7))
	local new_pitch = (1 - anim_lerp) * current_pitch + anim_lerp * target_pitch
	slot13 = MAX_ANGLE
	new_pitch = math.clamp(slot10, new_pitch, MIN_ANGLE)
	local rot = self._joint_pitch.rotation(slot10)
	slot15 = rot
	slot17 = rot

	mrotation.set_yaw_pitch_roll(self._joint_pitch, rot, rot.yaw(new_pitch), rot.roll(slot16))

	slot13 = rot

	self._joint_pitch.set_rotation(self._joint_pitch, self._joint_pitch)

	slot12 = new_pitch - current_pitch

	return math.abs(self._joint_pitch)
end
function TurretWeapon:_reset_animation(name)
	local id_name = Idstring(slot3)
	slot5 = self._unit
	local anims = self._unit.anim_groups(name)
	local exists = false
	slot7 = anims

	for _, v in pairs(slot6) do
		if v == id_name then
			exists = true

			break
		end
	end

	if not exists then
		return 
	end

	local MAX_ANGLE = tweak_data.weapon[self.name_id].MAX_PITCH_ANGLE
	local MIN_ANGLE = tweak_data.weapon[self.name_id].MIN_PITCH_ANGLE
	local time = 0 - MIN_ANGLE
	slot12 = 0

	self._unit.anim_set_time(slot9, self._unit, id_name)

	return 
end
function TurretWeapon:_update_pitch(dt, target_pitch_rot)
	local delta_pitch = 0
	slot8 = target_pitch_rot
	delta_pitch = delta_pitch + self._update_rotation_pitch(slot5, self, dt)
	slot8 = dt
	slot11 = target_pitch_rot

	self._update_animation_pitch(slot5, self, "anim_arm", target_pitch_rot.pitch(slot10))

	return delta_pitch
end
function TurretWeapon:_update_turret_rot(dt)
	if not self._player_rotation then
		return 
	end

	if self._joint_root_time_limit < self._joint_root_elapsed_time then
		self._joint_root_elapsed_time = 0
		slot5 = self._joint_pitch_original_pos

		self._joint_pitch.set_local_position(slot3, self._joint_pitch)

		slot5 = self._joint_heading_original_pos

		self._joint_heading.set_local_position(slot3, self._joint_heading)
	end

	self._joint_root_elapsed_time = self._joint_root_elapsed_time + dt
	slot5 = 2

	self._unit.set_moving(slot3, self._unit)

	slot5 = self._player_rotation
	self._turret_info.target_rot_heading = self._player_rotation.yaw(self._unit)
	slot5 = self._player_rotation
	self._turret_info.target_rot_pitch = self._player_rotation.pitch(self._unit)
	slot7 = self._joint_heading
	slot7 = self._joint_heading.local_rotation(0)
	local target_heading_rot = Rotation(self._player_rotation.pitch(self._unit), self._turret_info.target_rot_heading, self._joint_heading.local_rotation(0).pitch(0))
	slot7 = 0
	local target_pitch_rot = Rotation(self._turret_info.target_rot_heading, self._turret_info.target_rot_heading, self._turret_info.target_rot_pitch)
	slot8 = target_heading_rot
	local delta_heading = self._update_heading_rotation(self._turret_info.target_rot_heading, self, dt)
	local delta_pitch = 0

	if self._turret_user or self._puppet_stance == "sitting" then
		slot10 = target_pitch_rot
		delta_pitch = self._update_pitch(slot7, self, dt)
	else
		slot8 = self

		self._reset_pitch(slot7)
	end

	local movement_diff = delta_pitch + delta_heading

	if 1 < movement_diff and not self._moving then
		self._moving = true

		if self._sound_movement_start then
			slot10 = self._sound_movement_start

			self._sound_movement.post_event(slot8, self._sound_movement)
		end
	end

	if movement_diff <= 1 and self._moving then
		self._moving = false
		slot9 = self

		self.stop_moving_sound(slot8)
	end

	return 
end
function TurretWeapon:stop_moving_sound()
	if self._sound_movement then
		slot3 = self._sound_movement

		self._sound_movement.stop(slot2)
	end

	return 
end
function TurretWeapon:sync_turret_rotation(player_rotation)
	self._player_rotation = player_rotation

	return 
end
function TurretWeapon:set_ammo(amount)
	return 
end
function TurretWeapon:start_autofire()
	if self._shooting or self._lock_fire then
		return 
	end

	slot3 = self

	self._sound_autofire_start(slot2)

	slot3 = self._next_fire_allowed
	slot6 = Application
	self._next_fire_allowed = math.max(slot2, Application.time(slot5))
	self._shooting = true
	self._rate_of_fire = 1 / tweak_data.weapon[self.name_id].rate_of_fire / 60
	self._overheat_speed = self._rate_of_fire / self._overheat_time
	slot3 = self

	self._play_recoil_animation(self._overheat_time)

	return 
end
function TurretWeapon:stop_autofire()
	if self._shooting then
		slot3 = self

		self._sound_autofire_end(slot2)

		self._shooting = nil
	end

	return 
end
function TurretWeapon:trigger_held(blanks, expend_ammo, shoot_player, target_unit, damage_multiplier)
	if not self._shooting then
		return false
	end

	local fired = nil

	if not self._lock_fire then
		slot10 = Application

		if self._next_fire_allowed <= Application.time(slot9) then
			slot14 = damage_multiplier
			fired = self.fire(slot8, self, blanks, expend_ammo, shoot_player, target_unit)

			if fired then
				slot9 = self._unit

				if self._unit.damage(slot8) then
					slot9 = self._unit
					slot10 = "fired"

					if self._unit.damage(slot8).has_sequence(slot8, self._unit.damage(slot8)) then
						slot9 = self._unit
						slot10 = "fired"

						self._unit.damage(slot8).run_sequence_simple(slot8, self._unit.damage(slot8))
					end
				end

				self._next_fire_allowed = self._next_fire_allowed + self._rate_of_fire
				slot9 = self

				self._increase_heat(self._rate_of_fire)
			end
		end
	end

	return fired
end
function TurretWeapon:_upd_puppet_movement()
	if self._puppet_stance == "sitting" then
		return 
	end

	local fire_locator = self._get_fire_locator(slot2)
	local current_position = fire_locator.position(self)
	slot5 = fire_locator
	local current_direction = fire_locator.rotation(fire_locator).y(fire_locator)
	slot6 = current_direction

	mvector3.negate(fire_locator.rotation(fire_locator))

	slot7 = 1000

	mvector3.multiply(fire_locator.rotation(fire_locator), current_direction)

	local original_position = self._unit.position(fire_locator.rotation(fire_locator))
	slot7 = self._unit
	local original_direction = self._unit.rotation(self._unit).y(self._unit)
	slot9 = 1000

	mvector3.multiply(self._unit.rotation(self._unit), original_direction)

	slot9 = current_direction
	local deflection = original_direction.angle(self._unit.rotation(self._unit), original_direction)
	slot13 = math.UP
	local deflection_direction = math.sign(original_direction)
	local spin_max = self._unit.movement(original_direction - current_direction.to_polar_with_reference(self._unit, original_direction - current_direction, current_direction).spin)._spin_max or deflection
	slot11 = spin_max
	local deflection_normalized = deflection / math.abs(slot10)
	local redirect_animation = "e_so_mg34_aim_right"
	slot13 = "std/stand/so/idle/e_so_mg34_aim_right"
	local redirect_state = Idstring(slot12)

	if deflection_direction < 0 then
		redirect_animation = "e_so_mg34_aim_left"
		slot14 = "std/stand/so/idle/e_so_mg34_aim_left"
		redirect_state = Idstring(slot13)
	end

	slot15 = self._SO_object
	slot14 = self._puppet_unit.position(slot13) - self._SO_object.position(self._puppet_unit)
	local position_difference = self._puppet_unit.position(slot13) - self._SO_object.position(self._puppet_unit).length(self._SO_object.position(self._puppet_unit))

	if 1 < position_difference then
		slot16 = self._SO_object.rotation(slot17)
		slot19 = self._SO_object

		self._puppet_unit.warp_to(slot14, self._puppet_unit, self._SO_object.position(self._SO_object))
	end

	slot15 = self._puppet_unit
	slot18 = deflection_normalized

	self._puppet_unit.anim_state_machine(slot14).set_parameter(slot14, self._puppet_unit.anim_state_machine(slot14), redirect_state, "t")

	slot15 = self._puppet_unit
	slot16 = redirect_animation
	local result = self._puppet_unit.movement(slot14).play_redirect(slot14, self._puppet_unit.movement(slot14))

	return 
end
function TurretWeapon:_play_recoil_animation()
	slot3 = self._puppet_unit

	if alive(slot2) then
		slot3 = self._puppet_unit
		slot4 = "recoil_turret_m2"

		self._puppet_unit.movement(slot2).play_redirect(slot2, self._puppet_unit.movement(slot2))
	end

	return 
end
function TurretWeapon:fire(blanks, expend_ammo, shoot_player, target_unit, damage_multiplier)
	if self._overheated or self._lock_fire then
		return 
	end

	damage_multiplier = damage_multiplier or 1
	local fire_locator = self._get_fire_locator(slot7)
	local from_pos = fire_locator.position(self)
	slot10 = fire_locator
	slot10 = fire_locator.rotation(fire_locator)
	local fire_direction_fp = fire_locator.rotation(fire_locator).y(fire_locator)

	if not self._puppet_unit then
		if self._joint_pitch then
			slot11 = self._joint_pitch
			slot11 = self._joint_pitch.rotation(slot10)
			slot9 = self._joint_pitch.rotation(slot10).y(slot10)
		end
	else
		slot9 = false

		if false then
			local fire_direction_tp = true
		end
	end

	if fire_direction_tp then
		slot12 = fire_direction_tp

		mvector3.negate(slot11)
	end

	local direction = fire_direction_fp

	if fire_direction_tp then
		direction = fire_direction_tp
	end

	slot13 = direction

	mvector3.negate(slot12)

	slot14 = 1

	mvector3.spread(slot12, direction)

	if self._muzzle_effect then
		slot13 = World
		slot14 = self._muzzle_effect_table[self._current_barrel]

		World.effect_manager(slot12).spawn(slot12, World.effect_manager(slot12))

		if self._shell_ejection_effect_table then
			slot13 = World
			slot14 = self._shell_ejection_effect_table

			World.effect_manager(slot12).spawn(slot12, World.effect_manager(slot12))
		end
	end

	local anim_groups = self._unit.anim_groups(slot12)
	slot14 = anim_groups

	for _, anim_name in ipairs(self._unit) do
		slot19 = "ag_barrel_fire_" .. self._current_barrel
		local current_barrel_name = Idstring(slot18)

		if anim_name == current_barrel_name then
			slot22 = 0

			self._unit.anim_set_time(slot19, self._unit, anim_name)

			slot22 = 1

			self._unit.anim_play(slot19, self._unit, anim_name)

			break
		end
	end

	local ray_res = nil

	if self._bullet_type == "shell" then
		if not self._turret_shell_sound_source then
			slot16 = "turret_shell_explode"
			self._turret_shell_sound_source = SoundDevice.create_source(slot14, SoundDevice)
		end

		slot17 = direction
		ray_res = self._fire_shell(slot14, self, from_pos)
	else
		slot20 = damage_multiplier
		ray_res = self._fire_raycast(slot14, self, from_pos, direction, shoot_player, target_unit)
	end

	slot15 = self

	self._sound_fire_single(slot14)

	self._current_barrel = self._current_barrel % self._number_of_barrels + 1
	slot15 = self

	self._alert(self._number_of_barrels)

	return true
end
function TurretWeapon:_update_shell_movement(dt)
	if not self._turret_shell then
		return 
	end

	if not self._shell_cumulative_gravity then
		self._shell_cumulative_gravity = 0
	end

	self._shell_cumulative_gravity = self._shell_cumulative_gravity + 9.81 * dt
	local shell_velocity = 60000
	local fire_position = self._locator_fire.position(slot4)
	local old_shell_position = Vector3(self._locator_fire, self._turret_shell.position.x, self._turret_shell.position.y)
	slot11 = -self._shell_cumulative_gravity
	self._turret_shell.position = self._turret_shell.position + self._turret_shell.direction * shell_velocity * dt + Vector3(self._turret_shell.position.z, 0, 0)
	slot8 = self._turret_shell.position
	local shell_distance = mvector3.distance(self._turret_shell.position + self._turret_shell.direction * shell_velocity * dt + Vector3(self._turret_shell.position.z, 0, 0), fire_position)

	if self._fire_range < shell_distance then
		slot9 = "TurretWeapon:_update_shell_movement: BOOM!"

		Application.debug(slot7, Application)

		slot11 = true

		self._turret_shell_explode(slot7, self, self._turret_shell.position, nil)

		self._turret_shell = nil
		self._shell_cumulative_gravity = 0
	else
		slot11 = false

		self._turret_shell_explode(slot7, self, old_shell_position, self._turret_shell.position)
	end

	return 
end
function TurretWeapon:_fire_shell(from_pos, direction)
	self._turret_shell = {
		position = from_pos,
		direction = direction
	}
	self._shell_cumulative_gravity = 0

	return 
end
function TurretWeapon:_turret_shell_explode(from_pos, to_pos, detonate_now)
	local shell_position = from_pos

	if not detonate_now then
		slot12 = self._setup.ignore_units
		local col_ray = World.raycast(slot6, World, "ray", from_pos, to_pos, "ignore_unit")

		if not col_ray then
			return 
		end

		shell_position = col_ray.hit_position
		self._turret_shell = nil
		self._shell_cumulative_gravity = 0
	end

	slot7 = World
	slot8 = {
		effect = Idstring(slot10),
		position = shell_position,
		normal = math.UP
	}
	slot11 = "effects/vanilla/explosions/vehicle_explosion"

	World.effect_manager(slot6).spawn(slot6, World.effect_manager(slot6))

	if self._turret_shell_sound_source then
		slot8 = shell_position

		self._turret_shell_sound_source.set_position(slot6, self._turret_shell_sound_source)

		slot8 = "dynamite_explosion"

		self._turret_shell_sound_source.post_event(slot6, self._turret_shell_sound_source)
	end

	local pos = shell_position
	slot9 = "explosion_targets"
	local slot_mask = managers.slot.get_mask(slot7, managers.slot)
	local damage = tweak_data.weapon[self.name_id].damage or 1000
	local damage_radius = tweak_data.weapon[self.name_id].damage_radius or 1000
	local player_damage = tweak_data.weapon[self.name_id].player_damage or 10
	local armor_piercing = tweak_data.weapon[self.name_id].armor_piercing
	local curve_pow = 3
	slot18 = managers.player
	slot18 = managers.player
	local hit_units, splinters = managers.explosion.detect_and_give_dmg(slot13, managers.explosion)
	slot16 = managers.network
	slot23 = curve_pow

	managers.network.session({
		alert_radius = 10000,
		hit_pos = pos,
		range = damage_radius,
		collision_slotmask = slot_mask,
		curve_pow = curve_pow,
		damage = damage,
		player_damage = player_damage,
		ignore_unit = managers.player.local_player(slot17),
		user = managers.player.local_player(slot17),
		armor_piercing = armor_piercing
	}).send_to_peers_synched(, managers.network.session(), "sync_ground_turret_shell_explosion", self._unit, pos, damage_radius, damage, player_damage)

	return 
end
function TurretWeapon:_get_fire_locator()
	local fire_locator = self["_locator_fire_" .. self._current_barrel] or self._locator_fire_1

	return fire_locator
end
function TurretWeapon:_get_puppet_locator()
	return self._locator_tpp
end
function TurretWeapon:_get_smoke_locator()
	local smoke_locator = self["_locator_smoke_" .. self._current_barrel] or self._locator_smoke_1

	return smoke_locator
end
function TurretWeapon:_alert()
	local weapon_stats = tweak_data.weapon.stats
	slot5 = self
	local stats = tweak_data.weapon[self.get_name_id(slot4)].stats
	local alert_size = weapon_stats.alert_size[stats.alert_size]
	local new_alert = {
		"bullet"
	}
	slot7 = self._locator_fire_1
	new_alert[2] = self._locator_fire_1.position(slot6)
	new_alert[3] = alert_size
	slot7 = managers.player
	new_alert[5] = managers.player.player_unit(slot6)
	slot7 = self._locator_fire_1
	new_alert[MULTRES] = self._locator_fire_1.position(slot6)
	slot7 = managers.groupai
	slot8 = new_alert

	managers.groupai.state(slot6).propagate_alert(slot6, managers.groupai.state(slot6))

	return 
end
local mvec_spread_direction = Vector3()
local mvec1 = Vector3()
function TurretWeapon:_fire_raycast(from_pos, direction, shoot_player, target_unit, damage_multiplier)
	local result = {}
	local hit_unit = nil
	slot11 = direction

	mvector3.set(slot9, mvec_to)

	slot11 = tweak_data.weapon[self._name_id].FIRE_RANGE

	mvector3.multiply(slot9, mvec_to)

	slot11 = from_pos

	mvector3.add(slot9, mvec_to)

	slot17 = self._setup.ignore_units
	local col_ray = World.raycast(slot9, World, "ray", from_pos, mvec_to, "slot_mask", self._bullet_slotmask, "ignore_unit")
	local player_hit, player_ray_data = nil

	if shoot_player then
		slot16 = direction
		player_hit, player_ray_data = RaycastWeaponBase.damage_player(slot12, self, col_ray, from_pos)

		if player_hit then
			slot16 = self
			slot16 = from_pos
			local damage = self._apply_dmg_mul(slot12, self, self.get_damage(slot15), col_ray or player_ray_data)
			slot18 = damage

			InstantBulletBase.on_hit_player(self, InstantBulletBase, col_ray or player_ray_data, self._unit, self._unit)
		end
	end

	local char_hit = nil

	if not player_hit and col_ray then
		slot17 = self
		slot17 = from_pos
		local damage = self._apply_dmg_mul(slot13, self, self.get_damage(slot16), col_ray)
		slot19 = damage
		char_hit = InstantBulletBase.on_collision(slot14, InstantBulletBase, col_ray, self._unit, self._turret_user or self._unit)
	end

	if (not col_ray or col_ray.unit ~= target_unit) and target_unit then
		slot14 = target_unit

		if target_unit.character_damage(slot13) then
			slot14 = target_unit

			if target_unit.character_damage(slot13).build_suppression then
				slot14 = target_unit
				slot15 = self._suppression

				target_unit.character_damage(slot13).build_suppression(slot13, target_unit.character_damage(slot13))
			end
		end
	end

	if not col_ray or 600 < col_ray.distance then
		slot16 = col_ray

		self._spawn_trail_effect(slot13, self, direction)
	end

	result.hit_enemy = hit_unit

	if self._alert_events then
		result.rays = {
			col_ray
		}
	end

	return result
end
function TurretWeapon:_spawn_trail_effect(direction, col_ray)
	local current_fire_object_name = "_locator_fire_" .. self._current_barrel
	slot7 = self._trail_effect_table.position

	self[current_fire_object_name].m_position(slot5, self[current_fire_object_name])

	slot7 = direction

	mvector3.set(slot5, self._trail_effect_table.normal)

	slot6 = World
	slot7 = self._trail_effect_table
	local trail = World.effect_manager(slot5).spawn(slot5, World.effect_manager(slot5))

	if col_ray then
		slot7 = World
		slot8 = trail
		slot13 = col_ray.distance

		World.effect_manager(slot6).set_remaining_lifetime(slot6, World.effect_manager(slot6), math.clamp(slot10, (col_ray.distance - 600) / 10000, 0))
	end

	return 
end
function TurretWeapon:_apply_dmg_mul(damage, col_ray, from_pos)
	local damage_out = damage

	if tweak_data.weapon[self._name_id].DAMAGE_MUL_RANGE then
		if not col_ray.distance then
			slot8 = col_ray.position
			local ray_dis = mvector3.distance(slot6, from_pos)
		end

		local ranges = tweak_data.weapon[self._name_id].DAMAGE_MUL_RANGE
		local i_range = nil
		slot10 = ranges

		for test_i_range, range_data in ipairs(slot9) do
			if ray_dis < range_data[1] or test_i_range == #ranges then
				i_range = test_i_range

				break
			end
		end

		if i_range == 1 or ranges[i_range][1] < ray_dis then
			damage_out = damage_out * ranges[i_range][2]
		else
			local dis_lerp = (ray_dis - ranges[i_range - 1][1]) / (ranges[i_range][1] - ranges[i_range - 1][1])
			slot13 = dis_lerp
			damage_out = damage_out * math.lerp(ranges[i_range - 1][1], ranges[i_range - 1][2], ranges[i_range][2])
		end
	end

	return damage_out
end
function TurretWeapon:_sound_autofire_start()
	if self._fire_type == "auto" and self._sound_fire_start then

		-- Decompilation error in this vicinity:
		slot3 = self._turret_user
		slot4 = managers.player
		local sound_event = (self._turret_user == managers.player.player_unit(slot3) and self._sound_fire_start_fps) or self._sound_fire_start
		slot5 = "turret_heat"

		self._sound_fire.post_event(slot3, self._sound_fire)

		slot5 = sound_event

		self._sound_fire.post_event(slot3, self._sound_fire)
	end

	return 
end
function TurretWeapon:_sound_autofire_end()
	if self._fire_type == "auto" and self._sound_fire and self._sound_fire_stop then
		slot3 = self._turret_user
	end

	return 
end
function TurretWeapon:_sound_fire_single()
	if self._fire_type == "single" then

		-- Decompilation error in this vicinity:
		slot3 = self._turret_user
		slot4 = managers.player
		local sound_event = (self._turret_user == managers.player.player_unit(slot3) and self._sound_fire_start_fps) or self._sound_fire_start
		slot5 = sound_event

		self._sound_fire.post_event(slot3, self._sound_fire)
	end

	return 
end
function TurretWeapon:_sound_autofire_end_empty()
	return 
end
function TurretWeapon:_sound_autofire_end_cooldown()
	return 
end
function TurretWeapon:ammo_total()
	return 
end
function TurretWeapon:ammo_max()
	return 
end
function TurretWeapon:on_team_set(team_data)
	self._foe_teams = team_data.foes

	return 
end
function TurretWeapon:get_name_id()
	return self.name_id
end
function TurretWeapon:weapon_tweak_data()
	return tweak_data.weapon[self.name_id]
end
function TurretWeapon:has_part()
	return 
end
function TurretWeapon:update_laser()
	return 
end
function TurretWeapon:on_death()
	return 
end
function TurretWeapon:has_shield()
	return false
end
function TurretWeapon:unregister()
	return 
end
function TurretWeapon:save(save_data)
	local my_save_data = {}
	save_data.weapon = my_save_data
	my_save_data.foe_teams = self._foe_teams
	my_save_data.alert = (self._alert_events and true) or nil
	my_save_data.player_on = self._player_on

	if self._puppet_unit then
		slot5 = managers.network
		local peer = managers.network.session(slot4).dropin_peer(slot4)
		slot12 = self._puppet_unit
		slot13 = peer
		slot11 = TimerManager

		managers.enemy.add_delayed_clbk(managers.network.session(slot4), managers.enemy, "delay_sync_turret_unit" .. tostring(self._puppet_unit.key(TimerManager.game(self))), callback(TimerManager.game(self).time(self) + 0.5, self, self, "_delay_sync_turret_unit"))
	end

	return 
end
function TurretWeapon:load(save_data)
	local my_save_data = save_data.weapon
	self._foe_teams = my_save_data.foe_teams
	self._auto_reload = my_save_data.auto_reload
	self._player_on = my_save_data.player_on
	self._setup = {
		ignore_units = {
			self._unit
		}
	}

	if not my_save_data.alert then
		self._alert_events = nil
	end

	return 
end
function TurretWeapon:_delay_sync_turret_unit(peer)
	slot4 = managers.network

	if not managers.network.session(slot3) then
		return 
	end

	if not peer then
		return 
	end

	slot4 = self._puppet_unit

	if not alive(slot3) then
		return 
	end

	slot7 = self._puppet_unit

	peer.send_queued_sync(slot3, peer, "sync_ground_turret_SO_completed", self._unit)

	return 
end
function TurretWeapon:destroy(unit)
	if self._sound_fire then
		slot4 = self._sound_fire

		self._sound_fire.stop(slot3)

		self._sound_fire = nil
	end

	if self._sound_movement then
		slot4 = self._sound_movement

		self._sound_movement.stop(slot3)

		self._sound_movement = nil
	end

	if self._turret_shell_sound_source then
		slot4 = self._turret_shell_sound_source

		self._turret_shell_sound_source.stop(slot3)

		self._turret_shell_sound_source = nil
	end

	return 
end
function TurretWeapon:_create_turret_SO()
	slot3 = self._unit

	if not alive(slot2) then
		return 
	end

	if not self._automatic_SO then
		return 
	end

	slot3 = self._unit
	slot6 = "third_person_placement_orig"
	self._SO_object = self._unit.get_object(slot2, Idstring(slot5)) or self._locator_tpp
	slot3 = self._SO_object

	if not alive(slot2) then
		return 
	end

	local variant = tweak_data.weapon[self._name_id].anim_enter
	slot7 = self._SO_object
	local tracker_align = managers.navigation.create_nav_tracker(slot3, managers.navigation, self._SO_object.position(false))
	local align_nav_seg = tracker_align.nav_segment(managers.navigation)
	local align_pos = self._SO_object.position(tracker_align)
	local align_rot = self._SO_object.rotation(self._SO_object)
	slot8 = managers.groupai
	slot9 = align_nav_seg
	local align_area = managers.groupai.state(self._SO_object).get_area_from_nav_seg_id(self._SO_object, managers.groupai.state(self._SO_object))
	slot10 = tracker_align

	managers.navigation.destroy_nav_tracker(managers.groupai.state(self._SO_object), managers.navigation)

	local turret_objective = {
		pose = "stand",
		destroy_clbk_key = false,
		type = "turret",
		haste = "run",
		nav_seg = align_nav_seg,
		area = align_area,
		pos = align_pos,
		rot = align_rot
	}
	slot12 = "on_turret_SO_failed"
	turret_objective.fail_clbk = callback(managers.navigation, self, self)
	slot12 = "on_turret_SO_completed"
	turret_objective.complete_clbk = callback(managers.navigation, self, self)
	turret_objective.action = {
		align_sync = true,
		needs_full_blend = true,
		type = "act",
		body_part = 1,
		variant = variant,
		blocks = {
			heavy_hurt = -1,
			hurt = -1,
			action = -1,
			walk = -1
		}
	}
	local SO_descriptor = {
		interval = -1,
		search_dis_sq = 4000000,
		AI_group = "enemies",
		base_chance = 1,
		chance_inc = 0,
		usage_amount = 1,
		objective = turret_objective,
		search_pos = turret_objective.pos
	}
	slot12 = {
		"gangster",
		"security",
		"security_patrol",
		"cop",
		"fbi",
		"swat",
		"murky"
	}
	SO_descriptor.access = managers.navigation.convert_access_filter_to_number(self, managers.navigation)
	SO_descriptor.admin_clbk = callback(self, self, self)
	slot14 = self._unit
	local SO_id = "turret_" .. tostring(self._unit.key("on_turret_SO_administered"))
	self._SO_data = {
		SO_registered = true,
		SO_id = SO_id,
		align_area = align_area
	}
	slot12 = managers.groupai
	slot14 = SO_descriptor

	managers.groupai.state(self).add_special_objective(self, managers.groupai.state(self), SO_id)

	return 
end
function TurretWeapon:active()
	return self._active
end
function TurretWeapon:sync_administered_unit(unit)
	self._administered_unit_data = {
		unit = unit
	}

	return 
end
function TurretWeapon:on_turret_SO_administered(unit, SO)
	slot5 = managers.network
	slot8 = unit

	managers.network.session(slot4).send_to_peers_synched(slot4, managers.network.session(slot4), "sync_ground_turret_SO_administered", self._unit)

	if not self._setup.turret_weapon_initialized then
		slot6 = unit

		self.initialize_sentry(slot4, self)
	end

	self._administered_unit_data = {
		unit = unit,
		SO = SO
	}

	return 
end
function TurretWeapon:on_turret_SO_failed(unit)
	self._administered_to_unit = nil
	self._mode = nil
	self._puppet_unit = nil

	return 
end
function TurretWeapon:on_turret_SO_completed(unit)
	slot4 = unit

	if not alive(slot3) then
		return 
	end

	slot4 = unit
	slot6 = nil

	unit.brain(slot3).set_logic(slot3, unit.brain(slot3), "turret")

	self._puppet_unit = unit
	slot4 = self._puppet_unit
	self._puppet_unit.unit_data(slot3).turret_weapon = self
	self._last_puppet_position = unit.position(slot3)
	self._puppet_walking = false
	local enter_turret_anim_name = tweak_data.weapon[self.name_id].anim_enter
	slot5 = self._puppet_unit
	slot6 = enter_turret_anim_name
	slot11 = "activate_turret"

	self._puppet_unit.movement(unit).enter_turret_animation(unit, self._puppet_unit.movement(unit), callback(slot8, self, self))

	slot5 = self._puppet_unit
	local team = self._puppet_unit.movement(unit).team(unit)
	slot6 = self._unit
	slot7 = team

	self._unit.movement(self._puppet_unit.movement(unit)).set_team(self._puppet_unit.movement(unit), self._unit.movement(self._puppet_unit.movement(unit)))

	slot6 = self._unit
	slot8 = true

	self._unit.interaction(self._puppet_unit.movement(unit)).set_active(self._puppet_unit.movement(unit), self._unit.interaction(self._puppet_unit.movement(unit)), false)

	slot6 = managers.network
	slot9 = unit

	managers.network.session(self._puppet_unit.movement(unit)).send_to_peers_synched(self._puppet_unit.movement(unit), managers.network.session(self._puppet_unit.movement(unit)), "sync_ground_turret_SO_completed", self._unit)

	return 
end
function TurretWeapon:sync_create_SO()
	slot4 = true

	self.enable_automatic_SO(slot2, self)

	return 
end
function TurretWeapon:sync_SO_completed(puppet_unit)
	slot4 = puppet_unit

	if not alive(slot3) then
		return 
	end

	slot5 = self._SO_object
	local position_difference = puppet_unit.position(slot3) - self._SO_object.position(puppet_unit).length(self._SO_object.position(puppet_unit))
	slot6 = self._SO_object
	slot4 = self._SO_object.position(puppet_unit)
	slot5 = puppet_unit.position(puppet_unit.position(slot3) - self._SO_object.position(puppet_unit)) - slot4
	position_difference = puppet_unit.position(puppet_unit.position(slot3) - self._SO_object.position(puppet_unit)) - slot4.length(slot4)
	self._puppet_unit = puppet_unit
	slot5 = self._puppet_unit
	self._puppet_unit.unit_data(slot4).turret_weapon = self
	self._last_puppet_position = puppet_unit.position(slot4)
	self._puppet_walking = false
	local enter_turret_anim_name = tweak_data.weapon[self.name_id].anim_enter
	slot6 = self._puppet_unit
	slot7 = enter_turret_anim_name
	slot12 = "activate_turret"

	self._puppet_unit.movement(puppet_unit).enter_turret_animation(puppet_unit, self._puppet_unit.movement(puppet_unit), callback(slot9, self, self))

	slot6 = self._puppet_unit
	slot6 = self._puppet_unit.inventory(puppet_unit)

	self._puppet_unit.inventory(puppet_unit).hide_equipped_unit(puppet_unit)

	slot6 = self._unit
	slot8 = true

	self._unit.interaction(puppet_unit).set_active(puppet_unit, self._unit.interaction(puppet_unit), false)

	return 
end
function TurretWeapon:sync_cancel_SO()
	slot4 = false

	self.enable_automatic_SO(slot2, self)

	return 
end
function TurretWeapon:remove_administered_SO()
	if self._SO_data then
		slot3 = managers.groupai
		slot4 = self._SO_data.SO_id
		slot1 = managers.groupai.state(slot2).remove_special_objective(slot2, managers.groupai.state(slot2))
	end

	return 
end
function TurretWeapon:is_available()
	return not self._mode and not self._administered_unit_data and self._active
end
function TurretWeapon:set_weapon_user(user)
	self._turret_user = user
	self._player_rotation = nil

	return 
end
function TurretWeapon:activate_turret()
	slot3 = self._puppet_unit

	if alive(slot2) and self._puppet_stance == "sitting" then
		slot6 = "third_person_placement"

		self._unit.link(slot2, self._unit, Idstring(self._puppet_unit))
	end

	slot3 = self

	self.activate_sentry(slot2)

	self._mode = "enemy"
	slot4 = true

	self.set_active(slot2, self)

	slot3 = Network

	if Network.is_server(slot2) then
		slot3 = self._unit

		if self._unit.damage(slot2) then
			slot3 = self._unit
			slot4 = "turret_is_occupied"

			if self._unit.damage(slot2).has_sequence(slot2, self._unit.damage(slot2)) then
				slot3 = self._unit
				slot4 = "turret_is_occupied"

				self._unit.damage(slot2).run_sequence_simple(slot2, self._unit.damage(slot2))
			end
		end
	end

	return 
end
function TurretWeapon:keep_ai_attached()
	slot3 = self._unit
	slot3 = self._unit.brain(slot2)

	self._unit.brain(slot2).keep_ai_attached(slot2)

	return 
end
function TurretWeapon:add_outline()
	slot3 = Network

	if Network.is_server(slot2) then
		slot3 = self._unit
		slot5 = true

		self._unit.contour(slot2).add(slot2, self._unit.contour(slot2), "highlight")
	end

	return 
end
function TurretWeapon:remove_outline()
	slot3 = Network

	if Network.is_server(slot2) then
		slot3 = self._unit
		slot5 = true

		self._unit.contour(slot2).remove(slot2, self._unit.contour(slot2), "highlight")
	end

	return 
end
function TurretWeapon:enable_automatic_SO(enabled)
	if not self._automatic_SO then
		return 
	end

	if enabled then
		slot4 = self

		self.set_mountable(slot3)
	else
		slot4 = self

		self._cancel_active_SO(slot3)
	end

	return 
end
function TurretWeapon:on_player_enter()
	self._player_on = true
	slot3 = Network

	if Network.is_server(slot2) then
		slot3 = self._unit

		if self._unit.damage(slot2) then
			slot3 = self._unit
			slot4 = "turret_is_occupied"

			if self._unit.damage(slot2).has_sequence(slot2, self._unit.damage(slot2)) then
				slot3 = self._unit
				slot4 = "turret_is_occupied"

				self._unit.damage(slot2).run_sequence_simple(slot2, self._unit.damage(slot2))
			end
		end

		slot3 = self._unit

		if self._unit.damage(slot2) then
			slot3 = self._unit
			slot4 = "interact"

			if self._unit.damage(slot2).has_sequence(slot2, self._unit.damage(slot2)) then
				slot3 = self._unit
				slot4 = "interact"

				self._unit.damage(slot2).run_sequence_simple(slot2, self._unit.damage(slot2))
			end
		end

		slot3 = managers.network
		slot6 = self._player_on

		managers.network.session(slot2).send_to_peers_synched(slot2, managers.network.session(slot2), "sync_player_on", self._unit)
	else
		slot3 = managers.network
		slot5 = self._unit

		managers.network.session(slot2).send_to_host(slot2, managers.network.session(slot2), "sync_ground_turret_activate_triggers")
	end

	slot3 = managers.groupai
	slot7 = "player"
	local team = managers.groupai.state(slot2).team_data(slot2, tweak_data.levels.get_default_team_ID(slot5, tweak_data.levels))
	slot4 = self._unit
	slot5 = team

	self._unit.movement(managers.groupai.state(slot2)).set_team(managers.groupai.state(slot2), self._unit.movement(managers.groupai.state(slot2)))

	if not self._lock_fire then
		slot4 = managers.player

		if managers.player.get_turret_unit(slot3) == self._unit then
			slot4 = managers.hud

			managers.hud.player_turret_flak_insert(slot3)
		end
	end

	slot5 = false

	self.enable_automatic_SO(slot3, self)

	return 
end
function TurretWeapon:on_player_exit()
	self._player_on = false

	if self._shooting then
		slot3 = self

		self._sound_autofire_end(slot2)
	end

	slot3 = Network

	if Network.is_server(slot2) then
		slot3 = self._unit

		if self._unit.damage(slot2) then
			slot3 = self._unit
			slot4 = "player_exit"

			if self._unit.damage(slot2).has_sequence(slot2, self._unit.damage(slot2)) then
				slot3 = self._unit
				slot4 = "player_exit"

				self._unit.damage(slot2).run_sequence_simple(slot2, self._unit.damage(slot2))
			end
		end

		slot3 = managers.network
		slot6 = self._player_on

		managers.network.session(slot2).send_to_peers_synched(slot2, managers.network.session(slot2), "sync_player_on", self._unit)
	else
		slot3 = managers.network
		slot5 = self._unit

		managers.network.session(slot2).send_to_host(slot2, managers.network.session(slot2), "sync_ground_turret_exit_triggers")
	end

	slot3 = self

	self.stop_moving_sound(slot2)

	return 
end
function TurretWeapon:sync_activate_triggers()
	slot3 = self._unit

	if self._unit.damage(slot2) then
		slot3 = self._unit
		slot4 = "turret_is_occupied"

		if self._unit.damage(slot2).has_sequence(slot2, self._unit.damage(slot2)) then
			slot3 = self._unit
			slot4 = "turret_is_occupied"

			self._unit.damage(slot2).run_sequence_simple(slot2, self._unit.damage(slot2))
		end
	end

	slot3 = self._unit

	if self._unit.damage(slot2) then
		slot3 = self._unit
		slot4 = "interact"

		if self._unit.damage(slot2).has_sequence(slot2, self._unit.damage(slot2)) then
			slot3 = self._unit
			slot4 = "interact"

			self._unit.damage(slot2).run_sequence_simple(slot2, self._unit.damage(slot2))
		end
	end

	self._player_on = true
	slot3 = managers.network
	slot6 = self._player_on

	managers.network.session(slot2).send_to_peers_synched(slot2, managers.network.session(slot2), "sync_player_on", self._unit)

	return 
end
function TurretWeapon:sync_exit_triggers()
	slot3 = self._unit

	if self._unit.damage(slot2) then
		slot3 = self._unit
		slot4 = "player_exit"

		if self._unit.damage(slot2).has_sequence(slot2, self._unit.damage(slot2)) then
			slot3 = self._unit
			slot4 = "player_exit"

			self._unit.damage(slot2).run_sequence_simple(slot2, self._unit.damage(slot2))
		end
	end

	self._player_on = false
	slot3 = managers.network
	slot6 = self._player_on

	managers.network.session(slot2).send_to_peers_synched(slot2, managers.network.session(slot2), "sync_player_on", self._unit)

	return 
end
function TurretWeapon:_cancel_active_SO()
	if self._administered_unit_data then
		slot3 = self._administered_unit_data.unit

		if alive(slot2) then
			slot3 = self._administered_unit_data.unit

			if self._administered_unit_data.unit.character_damage(slot2) then
				slot3 = self._administered_unit_data.unit

				if self._administered_unit_data.unit.character_damage(slot2).dead then
					slot3 = self._administered_unit_data.unit
					slot3 = self._administered_unit_data.unit.character_damage(slot2)

					if not self._administered_unit_data.unit.character_damage(slot2).dead(slot2) then
						slot3 = Network

						if Network.is_server(slot2) then
							slot3 = self._administered_unit_data.unit
							slot4 = nil

							self._administered_unit_data.unit.brain(slot2).set_objective(slot2, self._administered_unit_data.unit.brain(slot2))

							slot3 = self._administered_unit_data.unit
							slot5 = nil

							self._administered_unit_data.unit.brain(slot2).set_logic(slot2, self._administered_unit_data.unit.brain(slot2), "idle")

							slot3 = self._administered_unit_data.unit
							slot4 = {
								sync = true,
								body_part = 2,
								type = "idle"
							}

							self._administered_unit_data.unit.brain(slot2).action_request(slot2, self._administered_unit_data.unit.brain(slot2))

							slot4 = self._administered_unit_data.unit

							self.on_turret_SO_failed(slot2, self)

							self._administered_unit_data = nil
						else
							slot3 = managers.network
							slot5 = self._unit

							managers.network.session(slot2).send_to_host(slot2, managers.network.session(slot2), "sync_ground_turret_cancel_SO")
						end
					end
				end
			end
		end
	end

	slot3 = self

	self.remove_administered_SO(slot2)

	return 
end
function TurretWeapon:on_puppet_damaged(data, damage_info)
	slot5 = self._puppet_unit

	if not alive(slot4) then
		return 
	end

	slot5 = self._unit
	slot5 = self._unit.movement(slot4)
	local player_is_visible = self._unit.movement(slot4).is_target_visible(slot4)

	if not player_is_visible then
		slot8 = self

		managers.queued_tasks.unqueue_all(slot5, managers.queued_tasks, self._activate_turret_clbk_id)

		slot6 = self

		self.deactivate(slot5)

		return 
	end

	local attacker_unit = damage_info.attacker_unit
	slot7 = managers.network
	slot10 = attacker_unit

	managers.network.session(slot6).send_to_peers_synched(slot6, managers.network.session(slot6), "sync_ground_turret_puppet_damaged", self._unit)

	slot7 = attacker_unit
	slot7 = attacker_unit.movement(slot6)
	local damage_by_team = attacker_unit.movement(slot6).team(slot6)

	if damage_by_team.id == "criminal1" then
		slot8 = self._unit
		slot9 = attacker_unit
		local shot_from_behind = self._unit.movement(slot7).is_unit_behind(slot7, self._unit.movement(slot7))

		if shot_from_behind then
			slot11 = self

			managers.queued_tasks.unqueue_all(slot8, managers.queued_tasks, self._activate_turret_clbk_id)

			slot9 = self

			self.deactivate(slot8)

			return 
		end
	end

	slot11 = self._puppet_unit
	self._activate_turret_clbk_id = "activate_turret_" .. tostring(self._puppet_unit.key(slot10))
	local dazed_duration = tweak_data.weapon[self.name_id].dazed_duration or 3
	slot9 = self

	self.deactivate_sentry(slot8)

	slot11 = self

	managers.queued_tasks.unqueue_all(slot8, managers.queued_tasks, self._activate_turret_clbk_id)

	slot14 = dazed_duration

	managers.queued_tasks.queue(slot8, managers.queued_tasks, self._activate_turret_clbk_id, self.activate_turret, self, nil)

	return 
end
function TurretWeapon:on_puppet_death(data, damage_info)
	slot5 = managers.network
	slot7 = self._unit

	managers.network.session(slot4).send_to_peers_synched(slot4, managers.network.session(slot4), "sync_ground_turret_puppet_death")

	slot7 = self

	managers.queued_tasks.unqueue_all(slot4, managers.queued_tasks, self._activate_turret_clbk_id)

	slot5 = self

	self.deactivate(slot4)

	slot5 = self

	self._create_turret_SO(slot4)

	return 
end
function TurretWeapon:on_puppet_damaged_client(attacker_unit)
	slot4 = self._puppet_unit

	if not alive(slot3) then
		return 
	end

	slot4 = attacker_unit

	if not alive(slot3) then
		return 
	end

	slot4 = self._unit
	slot4 = self._unit.movement(slot3)
	local player_is_visible = self._unit.movement(slot3).is_target_visible(slot3)

	if not player_is_visible then
		slot7 = self

		managers.queued_tasks.unqueue_all(slot4, managers.queued_tasks, self._activate_turret_clbk_id)

		slot5 = self

		self.deactivate(slot4)

		return 
	end

	slot5 = attacker_unit
	slot5 = attacker_unit.movement(slot4)
	local damage_by_team = attacker_unit.movement(slot4).team(slot4)

	if damage_by_team.id == "criminal1" then
		slot6 = self._unit
		slot7 = attacker_unit
		local shot_from_behind = self._unit.movement(slot5).is_unit_behind(slot5, self._unit.movement(slot5))

		if shot_from_behind then
			slot9 = self

			managers.queued_tasks.unqueue_all(slot6, managers.queued_tasks, self._activate_turret_clbk_id)

			slot7 = self

			self.deactivate(slot6)

			return 
		end
	end

	slot9 = self._puppet_unit
	self._activate_turret_clbk_id = "activate_turret_" .. tostring(self._puppet_unit.key(slot8))
	local dazed_duration = tweak_data.weapon[self.name_id].dazed_duration or 3
	slot7 = self

	self.deactivate_sentry(slot6)

	slot9 = self

	managers.queued_tasks.unqueue_all(slot6, managers.queued_tasks, self._activate_turret_clbk_id)

	slot12 = dazed_duration

	managers.queued_tasks.queue(slot6, managers.queued_tasks, self._activate_turret_clbk_id, self.activate_turret, self, nil)

	return 
end
function TurretWeapon:on_puppet_death_client()
	slot5 = self

	managers.queued_tasks.unqueue_all(slot2, managers.queued_tasks, self._activate_turret_clbk_id)

	slot3 = self

	self.deactivate(slot2)

	return 
end
function TurretWeapon:set_active(state)
	self._active = state

	if state then
		slot7 = "weapon"

		self._unit.set_extension_update_enabled(slot3, self._unit, Idstring(true))
	else
		slot10 = nil

		managers.queued_tasks.queue(slot3, managers.queued_tasks, nil, self._disable_extension, self, nil, 5)
	end

	return 
end
function TurretWeapon:_disable_extension()
	slot3 = self._unit

	if alive(slot2) and not self._active then
		slot6 = "weapon"

		self._unit.set_extension_update_enabled(slot2, self._unit, Idstring(false))
	end

	return 
end
function TurretWeapon:deactivate_client()
	slot4 = "TurretWeapon:deactivate_client"

	Application.trace(slot2, Application)

	if self._player_rotation then
		slot4 = 2

		self._unit.set_moving(slot2, self._unit)

		slot4 = self._player_rotation
		self._turret_info.target_rot_heading = self._player_rotation.yaw(self._unit)
		slot4 = self._player_rotation
		self._turret_info.target_rot_pitch = self._player_rotation.pitch(self._unit)
		slot5 = 0
		local target_heading_rot = Rotation(self._player_rotation.pitch(self._unit), self._turret_info.target_rot_heading, 0)
		slot6 = 0
		local target_pitch_rot = Rotation(self._turret_info.target_rot_heading, self._turret_info.target_rot_heading, self._turret_info.target_rot_pitch)
		slot6 = target_heading_rot

		self._joint_heading.set_rotation(self._turret_info.target_rot_heading, self._joint_heading)

		if self._turret_user or self._puppet_stance == "sitting" then
			slot10 = target_pitch_rot

			Application.trace(slot4, Application, "TurretWeapon:deactivate_client: ", inspect(target_heading_rot))

			slot5 = self._joint_pitch
			slot10 = self._joint_pitch
			slot11 = target_pitch_rot
			slot10 = 0

			self._joint_pitch.set_rotation(slot4, Rotation(inspect(slot8), self._joint_pitch.rotation(target_heading_rot).yaw(target_heading_rot), target_pitch_rot.pitch(self._joint_pitch.rotation(target_heading_rot))))
		else
			local heading = self._joint_heading.rotation(slot4)
			slot7 = heading

			self._joint_pitch.set_rotation(self._joint_heading, self._joint_pitch)
		end
	end

	slot3 = self._unit
	slot4 = true

	self._unit.brain(slot2).switch_off(slot2, self._unit.brain(slot2))

	slot3 = self._unit
	slot4 = false

	self._unit.movement(slot2).set_active(slot2, self._unit.movement(slot2))

	slot4 = false

	self.set_active(slot2, self)

	slot3 = self

	self._sound_autofire_end(slot2)

	self._shooting = nil
	self._mode = nil
	slot3 = self._puppet_unit

	if alive(slot2) then
		slot3 = self._puppet_unit
		slot3 = self._puppet_unit.inventory(slot2)

		self._puppet_unit.inventory(slot2).show_equipped_unit(slot2)

		slot3 = self._puppet_unit
		slot3 = self._puppet_unit.character_damage(slot2)

		if not self._puppet_unit.character_damage(slot2).dead(slot2) then
			slot3 = self._puppet_unit
			slot4 = "e_so_mg34_exit"

			self._puppet_unit.movement(slot2).play_redirect(slot2, self._puppet_unit.movement(slot2))

			slot3 = self._puppet_unit
			self._puppet_unit.unit_data(slot2).turret_weapon = nil
			slot3 = self._puppet_unit

			self._puppet_unit.unlink(nil)
		end

		self._puppet_unit = nil
		self._puppet_walking = false
	end

	self._administered_unit_data = nil
	slot3 = self._unit
	slot5 = true

	self._unit.interaction(slot2).set_active(slot2, self._unit.interaction(slot2), true)

	slot3 = self._unit

	if self._unit.damage(slot2) then
		slot3 = self._unit
		slot4 = "turret_is_available"

		if self._unit.damage(slot2).has_sequence(slot2, self._unit.damage(slot2)) then
			slot3 = self._unit
			slot4 = "turret_is_available"

			self._unit.damage(slot2).run_sequence_simple(slot2, self._unit.damage(slot2))
		end
	end

	slot3 = managers.groupai
	slot7 = "player"
	local team = managers.groupai.state(slot2).team_data(slot2, tweak_data.levels.get_default_team_ID(slot5, tweak_data.levels))
	slot4 = self._unit
	slot5 = team

	self._unit.movement(managers.groupai.state(slot2)).set_team(managers.groupai.state(slot2), self._unit.movement(managers.groupai.state(slot2)))

	self._player_rotation = nil

	return 
end
function TurretWeapon:lock_fire(lock)
	self._lock_fire = lock

	if not self._lock_fire then
		slot4 = managers.player

		if managers.player.get_turret_unit(slot3) == self._unit then
			slot4 = managers.hud

			managers.hud.player_turret_flak_insert(slot3)
		end
	end

	return 
end
function TurretWeapon:locked_fire()
	return self._lock_fire
end
function TurretWeapon:weapon_unlocked()
	slot4 = "TurretWeapon:weapon_unlocked: "
	slot7 = not self._lock_fire

	Application.trace(slot2, Application, inspect(slot6))

	return not self._lock_fire
end
function TurretWeapon:_shell_explosion_on_client(position, radius, damage, player_damage, curve_pow)
	slot9 = "TurretWeapon:_shell_explosion_on_client"

	Application.trace(slot7, Application)

	local sound_event = "grenade_explode"
	local damage_radius = radius or tweak_data.weapon[self.name_id].damage_radius or 1000
	local custom_params = {
		camera_shake_max_mul = 4,
		sound_muffle_effect = true,
		effect = self._effect_name,
		sound_event = sound_event,
		feedback_range = damage_radius * 2
	}
	slot14 = player_damage

	managers.explosion.give_local_player_dmg(slot10, managers.explosion, position, damage_radius)

	slot18 = custom_params

	managers.explosion.explode_on_client(slot10, managers.explosion, position, math.UP, nil, damage, damage_radius, curve_pow)

	return 
end
function TurretWeapon:adjust_target_pos(target_pos)
	return target_pos
end
function TurretWeapon:get_damage()
	if self._puppet_unit then
		return self._damage_npc
	else
		return self._damage
	end

	return 
end
function TurretWeapon:mode()
	return self._mode
end

return 
