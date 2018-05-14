ProjectilesTweakData = ProjectilesTweakData or class()
function ProjectilesTweakData:init(tweak_data)
	self.m24 = {
		name_id = "bm_grenade_frag",
		weapon_id = "m24_grenade",
		unit = "units/vanilla/weapons/wpn_gre_m24/wpn_gre_m24",
		unit_hand = "units/vanilla/weapons/wpn_gre_m24/wpn_gre_m24_hand",
		unit_dummy = "units/vanilla/weapons/wpn_gre_m24/wpn_gre_m24_husk",
		icon = "frag_grenade",
		throwable = true,
		max_amount = 3,
		anim_global_param = "projectile_frag",
		throw_allowed_expire_t = 0.1,
		expire_t = 1.1,
		repeat_expire_t = 1.5,
		is_a_grenade = true,
		damage = 950,
		player_damage = 20,
		range = 500,
		killzone_range = 0.75,
		init_timer = 4.5,
		animations = {}
	}
	self.m24.animations.equip_id = "equip_welrod"
	self.m24.sound_event = "grenade_explode"
	self.m24.launch_speed = 350
	self.m24.gui = {
		rotation_offset = 3,
		distance_offset = -80,
		height_offset = -14,
		display_offset = 10,
		initial_rotation = {}
	}
	self.m24.gui.initial_rotation.yaw = -90
	self.m24.gui.initial_rotation.pitch = 60
	self.m24.gui.initial_rotation.roll = 0
	self.concrete = {
		name_id = "bm_grenade_concrete",
		unit = "units/upd_001/weapons/wpn_fps_gre_concrete/wpn_fps_gre_concrete",
		unit_hand = "units/upd_001/weapons/wpn_fps_gre_concrete/wpn_fps_gre_concrete_hand",
		unit_dummy = "units/upd_001/weapons/wpn_fps_gre_concrete/wpn_fps_gre_concrete_husk",
		icon = "frag_grenade",
		throwable = true,
		max_amount = 3,
		anim_global_param = "projectile_frag",
		throw_allowed_expire_t = 0.1,
		expire_t = 1.1,
		repeat_expire_t = 1.5,
		is_a_grenade = true,
		damage = 850,
		player_damage = 24,
		range = 750,
		killzone_range = 0.75,
		init_timer = 4.5,
		animations = {}
	}
	self.concrete.animations.equip_id = "equip_welrod"
	self.concrete.sound_event = "new_grenade_explode"
	self.concrete.launch_speed = 275
	self.concrete.gui = {
		rotation_offset = 3,
		distance_offset = -80,
		height_offset = -14,
		display_offset = 10,
		initial_rotation = {}
	}
	self.concrete.gui.initial_rotation.yaw = -90
	self.concrete.gui.initial_rotation.pitch = 60
	self.concrete.gui.initial_rotation.roll = 0
	self.d343 = {
		name_id = "bm_grenade_d343",
		unit = "units/upd_003/weapons/wpn_fps_gre_d343/wpn_fps_gre_d343",
		unit_hand = "units/upd_003/weapons/wpn_fps_gre_d343/wpn_fps_gre_d343_hand",
		unit_dummy = "units/upd_003/weapons/wpn_fps_gre_d343/wpn_fps_gre_d343_husk",
		icon = "frag_grenade",
		throwable = true,
		max_amount = 3,
		anim_global_param = "projectile_frag",
		throw_allowed_expire_t = 0.1,
		expire_t = 1.1,
		repeat_expire_t = 1.5,
		is_a_grenade = true,
		damage = 950,
		player_damage = 28,
		range = 500,
		killzone_range = 0.75,
		init_timer = 4.5,
		animations = {}
	}
	self.d343.animations.equip_id = "equip_welrod"
	self.d343.sound_event = "d43d_grenade_explode"
	self.d343.launch_speed = 200
	self.d343.gui = {
		rotation_offset = 0,
		distance_offset = -120,
		height_offset = -8,
		display_offset = 16,
		initial_rotation = {}
	}
	self.d343.gui.initial_rotation.yaw = 0
	self.d343.gui.initial_rotation.pitch = 90
	self.d343.gui.initial_rotation.roll = 30
	self.mills = {
		name_id = "bm_grenade_mills",
		unit = "units/upd_015/weapons/wpn_fps_gre_mills/wpn_fps_gre_mills",
		unit_hand = "units/upd_015/weapons/wpn_fps_gre_mills/wpn_fps_gre_mills_hand",
		unit_dummy = "units/upd_015/weapons/wpn_fps_gre_mills/wpn_fps_gre_mills_husk",
		icon = "frag_grenade",
		throwable = true,
		max_amount = 3,
		anim_global_param = "projectile_frag",
		throw_allowed_expire_t = 0.1,
		expire_t = 1.1,
		repeat_expire_t = 1.5,
		is_a_grenade = true,
		damage = 850,
		player_damage = 24,
		range = 1000,
		killzone_range = 0.75,
		init_timer = 4.5,
		animations = {}
	}
	self.mills.animations.equip_id = "equip_welrod"
	self.mills.sound_event = "mills_grenade_explode"
	self.mills.launch_speed = 200
	self.mills.gui = {
		rotation_offset = 0,
		distance_offset = -120,
		height_offset = -8,
		display_offset = 16,
		initial_rotation = {}
	}
	self.mills.gui.initial_rotation.yaw = -90
	self.mills.gui.initial_rotation.pitch = 60
	self.mills.gui.initial_rotation.roll = 0
	self.cluster = {
		name_id = "bm_grenade_frag",
		unit = "units/vanilla/dev/dev_shrapnel/dev_shrapnel",
		unit_dummy = "units/vanilla/dev/dev_shrapnel/dev_shrapnel_husk",
		throwable = false,
		impact_detonation = true,
		max_amount = 3,
		anim_global_param = "projectile_frag",
		killzone_range = 0.15,
		is_a_grenade = true,
		damage = 250,
		launch_speed = 20,
		adjust_z = 5,
		player_damage = 3,
		range = 350,
		animations = {}
	}
	self.cluster.animations.equip_id = "equip_welrod"
	self.ammo_bag = {
		name_id = "bm_grenade_frag",
		unit = "units/vanilla/weapons/wpn_gre_m24/wpn_gre_m24",
		unit_hand = "units/vanilla/weapons/wpn_gre_m24/wpn_gre_m24_hand",
		unit_dummy = "units/vanilla/weapons/wpn_gre_m24/wpn_gre_m24_husk",
		icon = "frag_grenade",
		throwable = true,
		max_amount = 3,
		anim_global_param = "projectile_frag",
		throw_allowed_expire_t = 0.1,
		expire_t = 1.1,
		repeat_expire_t = 1.5,
		is_a_grenade = false,
		damage = 0,
		player_damage = 0,
		range = 1000,
		init_timer = 4.5,
		animations = {}
	}
	self.ammo_bag.animations.equip_id = "equip_welrod"
	self.ammo_bag.push_at_body_index = 0
	self.molotov = {
		name_id = "bm_grenade_molotov",
		icon = "molotov_grenade",
		no_cheat_count = true,
		impact_detonation = true,
		time_cheat = 1,
		throwable = false,
		max_amount = 3,
		texture_bundle_folder = "bbq"
	}
	slot5 = "physic_effects/molotov_throw"
	self.molotov.physic_effect = Idstring(slot4)
	self.molotov.anim_global_param = "projectile_molotov"
	self.molotov.throw_allowed_expire_t = 0.1
	self.molotov.expire_t = 1.1
	self.molotov.repeat_expire_t = 1.5
	self.molotov.is_a_grenade = true
	self.molotov.init_timer = 10
	self.molotov.damage = 30
	self.molotov.player_damage = 2
	self.molotov.fire_dot_data = {
		dot_trigger_chance = 35,
		dot_damage = 10,
		dot_length = 3,
		dot_trigger_max_distance = 3000,
		dot_tick_period = 0.5
	}
	self.molotov.range = 75
	self.molotov.killzone_range = 0
	self.molotov.burn_duration = 20
	self.molotov.burn_tick_period = 0.5
	self.molotov.sound_event_impact_duration = 4
	self.molotov.alert_radius = 1500
	self.molotov.fire_alert_radius = 1500
	self.molotov.animations = {
		equip_id = "equip_welrod"
	}
	self.mortar_shell = {
		name_id = "bm_mortar_shell",
		unit = "units/vanilla/weapons/wpn_npc_proj_mortar_shell/wpn_npc_proj_mortar_shell",
		unit_dummy = "units/vanilla/weapons/wpn_npc_proj_mortar_shell/wpn_npc_proj_mortar_shell_husk",
		weapon_id = "mortar_shell",
		no_cheat_count = false,
		impact_detonation = true
	}
	slot5 = "physic_effects/anti_gravitate"
	self.mortar_shell.physic_effect = Idstring(slot4)
	self.mortar_shell.adjust_z = 0
	self.mortar_shell.push_at_body_index = 0
	self.mortar_shell.init_timer = 5
	self.mortar_shell.damage = 150
	self.mortar_shell.player_damage = 10
	self.mortar_shell.range = 1000
	self.mortar_shell.killzone_range = 0
	self.mortar_shell.init_timer = 15
	self.mortar_shell.effect_name = "effects/vanilla/explosions/exp_artillery_explosion_001"
	self.mortar_shell.sound_event = "grenade_launcher_explosion"
	self.mortar_shell.sound_event_impact_duration = 4
	slot4 = self.molotov
	self.flamer_death_fake = clone(4)
	self.flamer_death_fake.init_timer = 0.01
	self.flamer_death_fake.adjust_z = 0
	self.flamer_death_fake.throwable = false
	self.flamer_death_fake.unit = "units/vanilla/dev/flamer_death_fake/flamer_death_fake"
	self.flamer_death_fake.unit_dummy = "units/vanilla/dev/flamer_death_fake/flamer_death_fake_husk"
	self._projectiles_index = {
		"m24",
		"cluster",
		"molotov",
		"mortar_shell",
		"flamer_death_fake",
		"concrete",
		"d343",
		"mills"
	}
	slot5 = self

	self._add_desc_from_name_macro("units/vanilla/dev/flamer_death_fake/flamer_death_fake_husk", self)

	return 
end
function BlackMarketTweakData:get_projectiles_index()
	return tweak_data.projectiles._projectiles_index
end
function BlackMarketTweakData:get_index_from_projectile_id(projectile_id)
	slot4 = tweak_data.projectiles._projectiles_index

	for index, entry_name in ipairs(slot3) do
		if entry_name == projectile_id then
			return index
		end
	end

	return 0
end
function BlackMarketTweakData:get_projectile_name_from_index(index)
	return tweak_data.projectiles._projectiles_index[index]
end
function ProjectilesTweakData:_add_desc_from_name_macro(tweak_data)
	slot4 = tweak_data

	for id, data in pairs(slot3) do
		if data.name_id and not data.desc_id then
			slot9 = data.name_id
			data.desc_id = tostring(slot8) .. "_desc"
		end

		if not data.name_id then
		end
	end

	return 
end

return 
