PlayerTweakData = PlayerTweakData or class()
function PlayerTweakData:_set_difficulty_1()
	self.damage.automatic_respawn_time = 30

	return 
end
function PlayerTweakData:_set_difficulty_2()
	self.damage.automatic_respawn_time = 60
	self.damage.DOWNED_TIME_DEC = 7
	self.damage.DOWNED_TIME_MIN = 5

	return 
end
function PlayerTweakData:_set_difficulty_3()
	self.damage.automatic_respawn_time = 90
	self.damage.DOWNED_TIME_DEC = 10
	self.damage.DOWNED_TIME_MIN = 5

	return 
end
function PlayerTweakData:_set_difficulty_4()
	self.damage.automatic_respawn_time = 220
	self.damage.DOWNED_TIME_DEC = 15
	self.damage.DOWNED_TIME_MIN = 1

	return 
end
function PlayerTweakData:_set_singleplayer()
	self.damage.REGENERATE_TIME = 1.75

	return 
end
function PlayerTweakData:_set_multiplayer()
	return 
end
function PlayerTweakData:init()
	slot4 = "WIN32"
	local is_console = SystemInfo.platform(slot2) ~= Idstring(SystemInfo)
	self.run_move_dir_treshold = 0.7
	self.arrest = {
		aggression_timeout = 60,
		arrest_timeout = 240
	}
	self.put_on_mask_time = 2
	self.damage = {
		DODGE_INIT = 0,
		HEALTH_REGEN = 0,
		ARMOR_STEPS = 1,
		ARMOR_DAMAGE_REDUCTION = 1,
		ARMOR_DAMAGE_REDUCTION_STEPS = {
			1,
			0.6,
			0.7,
			0.8,
			0.9,
			0.95,
			0.96,
			0.97,
			0.98,
			0.99
		}
	}

	if is_console then
		self.damage.REGENERATE_TIME = 2.35
	else
		self.damage.REGENERATE_TIME = 3
	end

	self.damage.REVIVE_HEALTH_STEPS = {
		1
	}
	self.damage.TASED_TIME = 10
	self.damage.TASED_RECOVER_TIME = 1
	self.damage.BLEED_OUT_HEALTH_INIT = 10
	self.damage.DOWNED_TIME = 30
	self.damage.DOWNED_TIME_DEC = 5
	self.damage.DOWNED_TIME_MIN = 10
	self.damage.ARRESTED_TIME = 60
	self.damage.INCAPACITATED_TIME = 30
	self.damage.MIN_DAMAGE_INTERVAL = 0.45
	self.damage.respawn_time_penalty = 30
	self.damage.base_respawn_time_penalty = 5
	self.damage.automatic_assault_ai_trade_time = 120
	self.damage.automatic_assault_ai_trade_time_max = 180
	self.fall_health_damage = 4
	self.fall_damage_alert_size = 250
	self.SUSPICION_OFFSET_LERP = 0.75
	self.long_dis_interaction = {
		intimidate_range_enemies = 1000,
		highlight_range = 3000,
		intimidate_range_civilians = 1000,
		intimidate_strength = 0.5
	}
	self.suppression = {
		receive_mul = 10,
		decay_start_delay = 1,
		spread_mul = 1,
		tolerance = 1,
		max_value = 20,
		autohit_chance_mul = 1
	}
	self.suspicion = {
		range_mul = 1,
		max_value = 8,
		buildup_mul = 1
	}
	self.alarm_pager = {
		first_call_delay = {
			2,
			4
		},
		call_duration = {
			{
				6,
				6
			},
			{
				6,
				6
			}
		},
		nr_of_calls = {
			2,
			2
		},
		bluff_success_chance = {
			1,
			1,
			1,
			1,
			0
		},
		bluff_success_chance_w_skill = {
			1,
			1,
			1,
			1,
			0
		}
	}
	self.max_nr_following_hostages = 1
	self.TRANSITION_DURATION = 0.23
	self.PLAYER_EYE_HEIGHT = 145
	self.PLAYER_EYE_HEIGHT_CROUCH = 75
	self.stances = {
		default = {
			standard = {
				head = {},
				shoulders = {},
				vel_overshot = {}
			},
			crouched = {
				head = {},
				shoulders = {},
				vel_overshot = {}
			},
			steelsight = {
				shoulders = {},
				vel_overshot = {}
			}
		}
	}
	slot7 = self.PLAYER_EYE_HEIGHT
	self.stances.default.standard.head.translation = Vector3(, 0, 0)
	self.stances.default.standard.head.rotation = Rotation()
	self.stances.default.standard.shakers = {
		breathing = {}
	}
	self.stances.default.standard.shakers.breathing.amplitude = 0.3
	self.stances.default.crouched.shakers = {
		breathing = {}
	}
	self.stances.default.crouched.shakers.breathing.amplitude = 0.25
	self.stances.default.steelsight.shakers = {
		breathing = {}
	}
	self.stances.default.steelsight.shakers.breathing.amplitude = 0.025
	slot5 = self.stances.default.standard
	self.stances.default.mask_off = deep_clone()
	slot7 = self.PLAYER_EYE_HEIGHT
	self.stances.default.mask_off.head.translation = Vector3(, 0, 0)
	slot5 = self.stances.default.mask_off
	self.stances.default.clean = deep_clone()
	slot5 = self.stances.default.mask_off
	self.stances.default.civilian = deep_clone()
	local pivot_head_translation = Vector3()
	local pivot_head_rotation = Rotation()
	local pivot_shoulder_translation = Vector3()
	local pivot_shoulder_rotation = Rotation()
	slot9 = pivot_shoulder_translation
	slot12 = pivot_shoulder_rotation
	slot10 = pivot_head_rotation
	self.stances.default.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation.rotate_with(slot8, pivot_shoulder_rotation.inverse(slot11)).rotate_with(slot8, pivot_shoulder_translation.rotate_with(slot8, pivot_shoulder_rotation.inverse(slot11)))
	slot9 = pivot_shoulder_rotation
	self.stances.default.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation.inverse(slot8)
	self.stances.default.standard.vel_overshot.yaw_neg = 6
	self.stances.default.standard.vel_overshot.yaw_pos = -6
	self.stances.default.standard.vel_overshot.pitch_neg = -10
	self.stances.default.standard.vel_overshot.pitch_pos = 10
	slot11 = 0
	self.stances.default.standard.vel_overshot.pivot = Vector3(slot8, 0, 0)
	self.stances.default.standard.FOV = 60
	slot11 = self.PLAYER_EYE_HEIGHT_CROUCH
	self.stances.default.crouched.head.translation = Vector3(slot8, 0, 0)
	self.stances.default.crouched.head.rotation = Rotation()
	local pivot_head_translation = Vector3()
	local pivot_head_rotation = Rotation()
	slot11 = pivot_shoulder_translation
	slot14 = pivot_shoulder_rotation
	slot12 = pivot_head_rotation
	self.stances.default.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot13)).rotate_with(0, pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot13)))
	slot11 = pivot_shoulder_rotation
	self.stances.default.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation.inverse(0)
	self.stances.default.crouched.vel_overshot.yaw_neg = 6
	self.stances.default.crouched.vel_overshot.yaw_pos = -6
	self.stances.default.crouched.vel_overshot.pitch_neg = -10
	self.stances.default.crouched.vel_overshot.pitch_pos = 10
	slot13 = 0
	self.stances.default.crouched.vel_overshot.pivot = Vector3(0, 0, 0)
	self.stances.default.crouched.FOV = self.stances.default.standard.FOV
	slot12 = 0
	local pivot_head_translation = Vector3(self.stances.default.standard.FOV, 0, 0)
	slot13 = 0
	local pivot_head_rotation = Rotation(0, 0, 0)
	slot13 = pivot_shoulder_translation
	slot16 = pivot_shoulder_rotation
	slot14 = pivot_head_rotation
	self.stances.default.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot15)).rotate_with(0, pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot15)))
	slot13 = pivot_shoulder_rotation
	self.stances.default.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation.inverse(0)
	self.stances.default.steelsight.vel_overshot.yaw_neg = 4
	self.stances.default.steelsight.vel_overshot.yaw_pos = -4
	self.stances.default.steelsight.vel_overshot.pitch_neg = -2
	self.stances.default.steelsight.vel_overshot.pitch_pos = 2
	self.stances.default.steelsight.vel_overshot.pivot = pivot_shoulder_translation
	self.stances.default.steelsight.zoom_fov = true
	self.stances.default.steelsight.FOV = self.stances.default.standard.FOV
	slot12 = self

	self._init_new_stances(self.stances.default.standard.FOV)

	slot12 = self

	self._init_pistol_stances(self.stances.default.standard.FOV)

	slot12 = self

	self._init_smg_stances(self.stances.default.standard.FOV)

	slot12 = self

	self._init_shotgun_stances(self.stances.default.standard.FOV)

	self.movement_state = {
		interaction_delay = 1.5
	}
	self.camera = {
		MIN_SENSITIVITY = 0.1,
		MAX_SENSITIVITY = 1.7
	}
	self.fov_multiplier = {
		MIN = 1,
		MAX = 1.83333
	}
	self.omniscience = {
		start_t = 3.5,
		interval_t = 1,
		sense_radius = 1000,
		target_resense_t = 15
	}
	self.damage_indicator_duration = 1
	slot12 = self

	self._init_parachute(15)

	slot12 = self

	self._init_class_specific_tweak_data(15)

	slot12 = self

	self._init_team_ai_tweak_data(15)

	return 
end
function PlayerTweakData:get_tweak_data_for_class(class)
	if not class or not self.class_defaults[class] then
		slot6 = class

		Application.error(slot3, Application, "[PlayerTweakData] get_tweak_data_for_class(): trying to get tweak data for non-existent class: ")

		slot4 = Application

		Application.error(slot3, debug.traceback())

		return self.class_defaults.default
	end

	return self.class_defaults[class]
end
function PlayerTweakData:_init_class_specific_tweak_data()
	self.class_defaults = {}
	slot3 = self

	self._init_default_class_tweak_data(slot2)

	slot3 = self

	self._init_recon_tweak_data(slot2)

	slot3 = self

	self._init_assault_tweak_data(slot2)

	slot3 = self

	self._init_insurgent_tweak_data(slot2)

	slot3 = self

	self._init_demolitions_tweak_data(slot2)

	return 
end
function PlayerTweakData:_init_team_ai_tweak_data()
	self.team_ai = {
		movement = {}
	}
	self.team_ai.movement.speed = {
		WALKING_SPEED = 350
	}

	return 
end
function PlayerTweakData:_init_default_class_tweak_data()
	self.class_defaults.default = {
		damage = {}
	}
	self.class_defaults.default.damage.BASE_HEALTH = 90
	self.class_defaults.default.damage.BASE_LIVES = 4
	self.class_defaults.default.damage.BASE_ARMOR = 2
	self.class_defaults.default.damage.DODGE_INIT = 0
	self.class_defaults.default.damage.HEALTH_REGEN = 0
	self.class_defaults.default.damage.FALL_DAMAGE_MIN_HEIGHT = 300
	self.class_defaults.default.damage.FALL_DAMAGE_FATAL_HEIGHT = 1000
	self.class_defaults.default.damage.FALL_DAMAGE_MIN = 4
	self.class_defaults.default.damage.FALL_DAMAGE_MAX = 75
	self.class_defaults.default.stealth = {
		FALL_ALERT_MIN_HEIGHT = 250,
		FALL_ALERT_MAX_HEIGHT = 600,
		FALL_ALERT_MIN_RADIUS = 200,
		FALL_ALERT_MAX_RADIUS = 600
	}
	self.class_defaults.default.movement = {
		speed = {}
	}
	self.class_defaults.default.movement.speed.WALKING_SPEED = 350
	self.class_defaults.default.movement.speed.RUNNING_SPEED = 575
	self.class_defaults.default.movement.speed.CROUCHING_SPEED = 225
	self.class_defaults.default.movement.speed.STEELSIGHT_SPEED = 185
	self.class_defaults.default.movement.speed.AIR_SPEED = 185
	self.class_defaults.default.movement.speed.CLIMBING_SPEED = 200
	self.class_defaults.default.movement.jump_velocity = {
		xy = {},
		z = 500
	}
	self.class_defaults.default.movement.jump_velocity.xy.run = self.class_defaults.default.movement.speed.RUNNING_SPEED
	self.class_defaults.default.movement.jump_velocity.xy.walk = self.class_defaults.default.movement.speed.WALKING_SPEED * 1.2
	self.class_defaults.default.movement.stamina = {
		BASE_STAMINA = 20,
		BASE_STAMINA_REGENERATION_RATE = 3,
		BASE_STAMINA_DRAIN_RATE = 2,
		STAMINA_REGENERATION_DELAY = 2,
		MIN_STAMINA_THRESHOLD = 4,
		JUMP_STAMINA_DRAIN = 2
	}

	return 
end
function PlayerTweakData:_init_recon_tweak_data()
	local recon = SkillTreeTweakData.CLASS_RECON
	slot5 = self.class_defaults.default
	self.class_defaults[recon] = deep_clone(slot4)
	self.class_defaults[recon].damage.BASE_HEALTH = 80
	self.class_defaults[recon].movement.stamina.BASE_STAMINA = 22
	self.class_defaults[recon].movement.stamina.STAMINA_REGENERATION_DELAY = 3
	self.class_defaults[recon].movement.speed.CROUCHING_SPEED = 247.5
	self.class_defaults[recon].movement.speed.STEELSIGHT_SPEED = 203.5

	return 
end
function PlayerTweakData:_init_assault_tweak_data()
	local assault = SkillTreeTweakData.CLASS_ASSAULT
	slot5 = self.class_defaults.default
	self.class_defaults[assault] = deep_clone(slot4)
	self.class_defaults[assault].damage.BASE_HEALTH = 100
	self.class_defaults[assault].movement.stamina.STAMINA_REGENERATION_DELAY = 2.2
	self.class_defaults[assault].movement.speed.WALKING_SPEED = 315
	self.class_defaults[assault].movement.speed.RUNNING_SPEED = 517.5

	return 
end
function PlayerTweakData:_init_insurgent_tweak_data()
	local insurgent = SkillTreeTweakData.CLASS_INFILTRATOR
	slot5 = self.class_defaults.default
	self.class_defaults[insurgent] = deep_clone(slot4)
	self.class_defaults[insurgent].damage.BASE_HEALTH = 85
	self.class_defaults[insurgent].movement.stamina.BASE_STAMINA = 18
	self.class_defaults[insurgent].movement.stamina.STAMINA_REGENERATION_DELAY = 1
	self.class_defaults[insurgent].movement.speed.WALKING_SPEED = 367.5
	self.class_defaults[insurgent].movement.speed.RUNNING_SPEED = 603.75

	return 
end
function PlayerTweakData:_init_demolitions_tweak_data()
	local demolitions = SkillTreeTweakData.CLASS_DEMOLITIONS
	slot5 = self.class_defaults.default
	self.class_defaults[demolitions] = deep_clone(slot4)

	return 
end
function PlayerTweakData:_init_parachute()
	self.freefall = {
		gravity = 982,
		terminal_velocity = 7000,
		movement = {}
	}
	self.freefall.movement.forward_speed = 150
	self.freefall.movement.rotation_speed = 15
	self.freefall.camera = {
		target_pitch = -45,
		limits = {}
	}
	self.freefall.camera.limits.spin = 30
	self.freefall.camera.limits.pitch = 10
	self.freefall.camera.tilt = {
		max = 5,
		speed = 2
	}
	self.freefall.camera.shake = {
		min = 0,
		max = 0.2
	}
	self.parachute = {
		gravity = self.freefall.gravity,
		terminal_velocity = 600,
		movement = {}
	}
	self.parachute.movement.forward_speed = 250
	self.parachute.movement.rotation_speed = 30
	self.parachute.camera = {
		target_pitch = -5,
		limits = {}
	}
	self.parachute.camera.limits.spin = 90
	self.parachute.camera.limits.pitch = 60
	self.parachute.camera.tilt = {
		max = self.freefall.camera.tilt.max,
		speed = self.freefall.camera.shake.max
	}

	return 
end
function PlayerTweakData:_init_pistol_stances()
	slot4 = self.stances.default
	self.stances.m1911 = deep_clone(slot3)
	slot5 = 1.86738
	local pivot_shoulder_translation = Vector3(deep_clone(slot3), 8.1257, 29.4187)
	slot6 = 0
	local pivot_shoulder_rotation = Rotation(8.1257, 0, 0)
	slot7 = -4
	local pivot_head_translation = Vector3(0, 7.25, 28)
	slot8 = -1
	local pivot_head_rotation = Rotation(7.25, 0, 0)
	slot8 = pivot_shoulder_translation
	slot11 = pivot_shoulder_rotation
	slot9 = pivot_head_rotation
	self.stances.m1911.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot10)).rotate_with(0, pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot10)))
	slot8 = pivot_shoulder_rotation
	self.stances.m1911.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation.inverse(0)
	slot10 = 0
	self.stances.m1911.standard.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, 0, -35)
	self.stances.m1911.standard.vel_overshot.yaw_neg = 10
	self.stances.m1911.standard.vel_overshot.yaw_pos = -10
	self.stances.m1911.standard.vel_overshot.pitch_neg = -13
	self.stances.m1911.standard.vel_overshot.pitch_pos = 13
	slot9 = 0
	local pivot_head_translation = Vector3(13, 0, 28)
	slot10 = 0
	local pivot_head_rotation = Rotation(0, 0, 0)
	slot10 = pivot_shoulder_translation
	slot13 = pivot_shoulder_rotation
	slot11 = pivot_head_rotation
	self.stances.m1911.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot12)).rotate_with(0, pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot12)))
	slot10 = pivot_shoulder_rotation
	self.stances.m1911.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation.inverse(0)
	self.stances.m1911.steelsight.FOV = self.stances.m1911.standard.FOV
	self.stances.m1911.steelsight.zoom_fov = false
	slot12 = 0
	self.stances.m1911.steelsight.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, 0, -35)
	self.stances.m1911.steelsight.vel_overshot.yaw_neg = 8
	self.stances.m1911.steelsight.vel_overshot.yaw_pos = -8
	self.stances.m1911.steelsight.vel_overshot.pitch_neg = -8
	self.stances.m1911.steelsight.vel_overshot.pitch_pos = 8
	slot11 = -3.25
	local pivot_head_translation = Vector3(8, 6.25, 25)
	slot12 = -6
	local pivot_head_rotation = Rotation(6.25, 0, 0)
	slot12 = pivot_shoulder_translation
	slot15 = pivot_shoulder_rotation
	slot13 = pivot_head_rotation
	self.stances.m1911.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot14)).rotate_with(0, pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot14)))
	slot12 = pivot_shoulder_rotation
	self.stances.m1911.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation.inverse(0)
	slot14 = 0
	self.stances.m1911.crouched.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, 0, -35)
	slot12 = self.stances.default
	self.stances.tt33 = deep_clone(0)
	slot13 = 1.84151
	local pivot_shoulder_translation = Vector3(deep_clone(0), 3.90636, 28.7622)
	slot14 = -0.000147309
	local pivot_shoulder_rotation = Rotation(3.90636, -6.93792e-06, 0.000789135)
	slot15 = -4
	local pivot_head_translation = Vector3(-6.93792e-06, 3.05, 28)
	slot16 = -1
	local pivot_head_rotation = Rotation(3.05, 0, 0)
	slot16 = pivot_shoulder_translation
	slot19 = pivot_shoulder_rotation
	slot17 = pivot_head_rotation
	self.stances.tt33.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot18)).rotate_with(0, pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot18)))
	slot16 = pivot_shoulder_rotation
	self.stances.tt33.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation.inverse(0)
	slot18 = 0
	self.stances.tt33.standard.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, 0, -35)
	self.stances.tt33.standard.vel_overshot.yaw_neg = 10
	self.stances.tt33.standard.vel_overshot.yaw_pos = -10
	self.stances.tt33.standard.vel_overshot.pitch_neg = -13
	self.stances.tt33.standard.vel_overshot.pitch_pos = 13
	slot17 = 0
	local pivot_head_translation = Vector3(13, 0, 28)
	slot18 = 0
	local pivot_head_rotation = Rotation(0, 0, 0)
	slot18 = pivot_shoulder_translation
	slot21 = pivot_shoulder_rotation
	slot19 = pivot_head_rotation
	self.stances.tt33.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot20)).rotate_with(0, pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot20)))
	slot18 = pivot_shoulder_rotation
	self.stances.tt33.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation.inverse(0)
	self.stances.tt33.steelsight.FOV = self.stances.tt33.standard.FOV
	self.stances.tt33.steelsight.zoom_fov = false
	slot20 = 0
	self.stances.tt33.steelsight.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, 0, -35)
	self.stances.tt33.steelsight.vel_overshot.yaw_neg = 8
	self.stances.tt33.steelsight.vel_overshot.yaw_pos = -8
	self.stances.tt33.steelsight.vel_overshot.pitch_neg = -8
	self.stances.tt33.steelsight.vel_overshot.pitch_pos = 8
	slot19 = -3.25
	local pivot_head_translation = Vector3(8, 2.05, 25)
	slot20 = -6
	local pivot_head_rotation = Rotation(2.05, 0, 0)
	slot20 = pivot_shoulder_translation
	slot23 = pivot_shoulder_rotation
	slot21 = pivot_head_rotation
	self.stances.tt33.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot22)).rotate_with(0, pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot22)))
	slot20 = pivot_shoulder_rotation
	self.stances.tt33.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation.inverse(0)
	slot22 = 0
	self.stances.tt33.crouched.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, 0, -35)
	slot20 = self.stances.default
	self.stances.c96 = deep_clone(0)
	slot21 = 1.92305
	local pivot_shoulder_translation = Vector3(deep_clone(0), 8.78944, 22.8361)
	slot22 = -0.000288361
	local pivot_shoulder_rotation = Rotation(8.78944, -0.00015875, 0.000630032)
	slot23 = -4.5
	local pivot_head_translation = Vector3(-0.00015875, 9, 28)
	slot24 = -1.5
	local pivot_head_rotation = Rotation(9, 0, 0)
	slot24 = pivot_shoulder_translation
	slot27 = pivot_shoulder_rotation
	slot25 = pivot_head_rotation
	self.stances.c96.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot26)).rotate_with(0, pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot26)))
	slot24 = pivot_shoulder_rotation
	self.stances.c96.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation.inverse(0)
	slot26 = 0
	self.stances.c96.standard.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, 0, -50)
	self.stances.c96.standard.vel_overshot.yaw_neg = 10
	self.stances.c96.standard.vel_overshot.yaw_pos = -10
	self.stances.c96.standard.vel_overshot.pitch_neg = -10
	self.stances.c96.standard.vel_overshot.pitch_pos = 10
	slot25 = 0
	local pivot_head_translation = Vector3(10, 0, 28)
	slot26 = 0
	local pivot_head_rotation = Rotation(0, 0, 0)
	slot26 = pivot_shoulder_translation
	slot29 = pivot_shoulder_rotation
	slot27 = pivot_head_rotation
	self.stances.c96.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot28)).rotate_with(0, pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot28)))
	slot26 = pivot_shoulder_rotation
	self.stances.c96.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation.inverse(0)
	slot28 = 0
	self.stances.c96.steelsight.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, 0, -58)
	self.stances.c96.steelsight.vel_overshot.yaw_neg = 10
	self.stances.c96.steelsight.vel_overshot.yaw_pos = -10
	self.stances.c96.steelsight.vel_overshot.pitch_neg = -10
	self.stances.c96.steelsight.vel_overshot.pitch_pos = 10
	slot27 = -5.5
	local pivot_head_translation = Vector3(10, 8, 27)
	slot28 = -6
	local pivot_head_rotation = Rotation(8, 0, 0)
	slot28 = pivot_shoulder_translation
	slot31 = pivot_shoulder_rotation
	slot29 = pivot_head_rotation
	self.stances.c96.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot30)).rotate_with(0, pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot30)))
	slot28 = pivot_shoulder_rotation
	self.stances.c96.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation.inverse(0)
	slot30 = 0
	self.stances.c96.crouched.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, 0, -55)
	slot28 = self.stances.default
	self.stances.shotty = deep_clone(0)
	slot29 = -5.20036
	local pivot_shoulder_translation = Vector3(deep_clone(0), 11.4127, 15.7764)
	slot30 = 0.000184415
	local pivot_shoulder_rotation = Rotation(11.4127, -0.000176678, 0.000172462)
	slot31 = -3
	local pivot_head_translation = Vector3(-0.000176678, 7, 18)
	slot32 = -1
	local pivot_head_rotation = Rotation(7, 0, 0)
	slot32 = pivot_shoulder_translation
	slot35 = pivot_shoulder_rotation
	slot33 = pivot_head_rotation
	self.stances.shotty.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot34)).rotate_with(0, pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot34)))
	slot32 = pivot_shoulder_rotation
	self.stances.shotty.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation.inverse(0)
	slot34 = 0
	self.stances.shotty.standard.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, 0, -30)
	self.stances.shotty.standard.vel_overshot.yaw_neg = 10
	self.stances.shotty.standard.vel_overshot.yaw_pos = -10
	self.stances.shotty.standard.vel_overshot.pitch_neg = -10
	self.stances.shotty.standard.vel_overshot.pitch_pos = 10
	slot33 = -1
	local pivot_head_translation = Vector3(10, 0, 16)
	slot34 = 0
	local pivot_head_rotation = Rotation(0, 0, 0)
	slot34 = pivot_shoulder_translation
	slot37 = pivot_shoulder_rotation
	slot35 = pivot_head_rotation
	self.stances.shotty.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot36)).rotate_with(0, pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot36)))
	slot34 = pivot_shoulder_rotation
	self.stances.shotty.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation.inverse(0)
	slot36 = 0
	self.stances.shotty.steelsight.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, 0, -18)
	self.stances.shotty.steelsight.vel_overshot.yaw_neg = 10
	self.stances.shotty.steelsight.vel_overshot.yaw_pos = -10
	self.stances.shotty.steelsight.vel_overshot.pitch_neg = -10
	self.stances.shotty.steelsight.vel_overshot.pitch_pos = 10
	slot35 = -4
	local pivot_head_translation = Vector3(10, 6, 17)
	slot36 = -6
	local pivot_head_rotation = Rotation(6, 0, 0)
	slot36 = pivot_shoulder_translation
	slot39 = pivot_shoulder_rotation
	slot37 = pivot_head_rotation
	self.stances.shotty.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot38)).rotate_with(0, pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot38)))
	slot36 = pivot_shoulder_rotation
	self.stances.shotty.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation.inverse(0)
	slot38 = 0
	self.stances.shotty.crouched.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, 0, -25)
	slot36 = self.stances.default
	self.stances.webley = deep_clone(0)
	slot37 = 4.45431
	local pivot_shoulder_translation = Vector3(deep_clone(0), 7.19268, 24.4376)
	slot38 = -0.00120361
	local pivot_shoulder_rotation = Rotation(7.19268, 0.000270585, 8.74022e-05)
	slot39 = -2
	local pivot_head_translation = Vector3(0.000270585, 7, 23)
	slot40 = -1.5
	local pivot_head_rotation = Rotation(7, 0, 0)
	slot40 = pivot_shoulder_translation
	slot43 = pivot_shoulder_rotation
	slot41 = pivot_head_rotation
	self.stances.webley.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot42)).rotate_with(0, pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot42)))
	slot40 = pivot_shoulder_rotation
	self.stances.webley.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation.inverse(0)
	slot42 = 0
	self.stances.webley.standard.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, 0, -50)
	self.stances.webley.standard.vel_overshot.yaw_neg = 10
	self.stances.webley.standard.vel_overshot.yaw_pos = -10
	self.stances.webley.standard.vel_overshot.pitch_neg = -10
	self.stances.webley.standard.vel_overshot.pitch_pos = 10
	slot41 = 0
	local pivot_head_translation = Vector3(10, 0, 25)
	slot42 = 0
	local pivot_head_rotation = Rotation(0, 0, 0)
	slot42 = pivot_shoulder_translation
	slot45 = pivot_shoulder_rotation
	slot43 = pivot_head_rotation
	self.stances.webley.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot44)).rotate_with(0, pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot44)))
	slot42 = pivot_shoulder_rotation
	self.stances.webley.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation.inverse(0)
	slot44 = 0
	self.stances.webley.steelsight.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, 0, -58)
	self.stances.webley.steelsight.vel_overshot.yaw_neg = 10
	self.stances.webley.steelsight.vel_overshot.yaw_pos = -10
	self.stances.webley.steelsight.vel_overshot.pitch_neg = -10
	self.stances.webley.steelsight.vel_overshot.pitch_pos = 10
	slot43 = -4
	local pivot_head_translation = Vector3(10, 7, 21)
	slot44 = -6
	local pivot_head_rotation = Rotation(7, 0, 0)
	slot44 = pivot_shoulder_translation
	slot47 = pivot_shoulder_rotation
	slot45 = pivot_head_rotation
	self.stances.webley.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot46)).rotate_with(0, pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot46)))
	slot44 = pivot_shoulder_rotation
	self.stances.webley.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation.inverse(0)
	slot46 = 0
	self.stances.webley.crouched.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, 0, -55)

	return 
end
function PlayerTweakData:_init_smg_stances()
	slot4 = self.stances.default
	self.stances.sterling = deep_clone(slot3)
	slot5 = -5.10392
	local pivot_shoulder_translation = Vector3(deep_clone(slot3), 7.98744, 8.04285)
	slot6 = -4.99999
	local pivot_shoulder_rotation = Rotation(7.98744, -1.64325e-05, 0.000797193)
	slot7 = -5
	local pivot_head_translation = Vector3(-1.64325e-05, 6, 11)
	slot8 = -15
	local pivot_head_rotation = Rotation(6, 0, 0)
	slot8 = pivot_shoulder_translation
	slot11 = pivot_shoulder_rotation
	slot9 = pivot_head_rotation
	self.stances.sterling.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot10)).rotate_with(0, pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot10)))
	slot8 = pivot_shoulder_rotation
	self.stances.sterling.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation.inverse(0)
	slot10 = 0
	self.stances.sterling.standard.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, 0, -30)
	self.stances.sterling.standard.vel_overshot.yaw_neg = 10
	self.stances.sterling.standard.vel_overshot.yaw_pos = -10
	self.stances.sterling.standard.vel_overshot.pitch_neg = -10
	self.stances.sterling.standard.vel_overshot.pitch_pos = 10
	slot9 = 0
	local pivot_head_translation = Vector3(10, 0, 16)
	slot10 = 0
	local pivot_head_rotation = Rotation(0, 0, 0)
	slot10 = pivot_shoulder_translation
	slot13 = pivot_shoulder_rotation
	slot11 = pivot_head_rotation
	self.stances.sterling.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot12)).rotate_with(0, pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot12)))
	slot10 = pivot_shoulder_rotation
	self.stances.sterling.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation.inverse(0)
	slot12 = 0
	self.stances.sterling.steelsight.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, 0, -38)
	self.stances.sterling.steelsight.vel_overshot.yaw_neg = 10
	self.stances.sterling.steelsight.vel_overshot.yaw_pos = -10
	self.stances.sterling.steelsight.vel_overshot.pitch_neg = -10
	self.stances.sterling.steelsight.vel_overshot.pitch_pos = 10
	slot11 = -6
	local pivot_head_translation = Vector3(10, 5, 10)
	slot12 = -18
	local pivot_head_rotation = Rotation(5, 0, 0)
	slot12 = pivot_shoulder_translation
	slot15 = pivot_shoulder_rotation
	slot13 = pivot_head_rotation
	self.stances.sterling.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot14)).rotate_with(0, pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot14)))
	slot12 = pivot_shoulder_rotation
	self.stances.sterling.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation.inverse(0)
	slot14 = 0
	self.stances.sterling.crouched.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, 0, -35)
	slot12 = self.stances.default
	self.stances.thompson = deep_clone(0)
	slot13 = 2.84058
	local pivot_shoulder_translation = Vector3(deep_clone(0), 7.80842, -1.25716)
	slot14 = -7.74339e-06
	local pivot_shoulder_rotation = Rotation(7.80842, -7.585e-05, 0.000911442)
	slot15 = -5.5
	local pivot_head_translation = Vector3(-7.585e-05, 9, 8)
	slot16 = -1.5
	local pivot_head_rotation = Rotation(9, 0, 0)
	slot16 = pivot_shoulder_translation
	slot19 = pivot_shoulder_rotation
	slot17 = pivot_head_rotation
	self.stances.thompson.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot18)).rotate_with(0, pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot18)))
	slot16 = pivot_shoulder_rotation
	self.stances.thompson.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation.inverse(0)
	slot18 = 0
	self.stances.thompson.standard.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, 0, -20)
	self.stances.thompson.standard.vel_overshot.yaw_neg = -6
	self.stances.thompson.standard.vel_overshot.yaw_pos = 6
	self.stances.thompson.standard.vel_overshot.pitch_neg = 5
	self.stances.thompson.standard.vel_overshot.pitch_pos = -5
	slot17 = 0
	local pivot_head_translation = Vector3(-5, 0, 12)
	slot18 = 0
	local pivot_head_rotation = Rotation(0, 0, 0)
	slot18 = pivot_shoulder_translation
	slot21 = pivot_shoulder_rotation
	slot19 = pivot_head_rotation
	self.stances.thompson.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot20)).rotate_with(0, pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot20)))
	slot18 = pivot_shoulder_rotation
	self.stances.thompson.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation.inverse(0)
	self.stances.thompson.steelsight.FOV = self.stances.thompson.standard.FOV
	slot20 = 0
	self.stances.thompson.steelsight.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, 0, -7)
	self.stances.thompson.steelsight.vel_overshot.yaw_neg = -2
	self.stances.thompson.steelsight.vel_overshot.yaw_pos = 4
	self.stances.thompson.steelsight.vel_overshot.pitch_neg = 5
	self.stances.thompson.steelsight.vel_overshot.pitch_pos = -5
	slot19 = -4.5
	local pivot_head_translation = Vector3(-5, 6, 6)
	slot20 = -6
	local pivot_head_rotation = Rotation(6, 0, 0)
	slot20 = pivot_shoulder_translation
	slot23 = pivot_shoulder_rotation
	slot21 = pivot_head_rotation
	self.stances.thompson.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot22)).rotate_with(0, pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot22)))
	slot20 = pivot_shoulder_rotation
	self.stances.thompson.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation.inverse(0)
	slot22 = 0
	self.stances.thompson.crouched.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, 0, -20)
	self.stances.thompson.crouched.vel_overshot.yaw_neg = -6
	self.stances.thompson.crouched.vel_overshot.yaw_pos = 6
	self.stances.thompson.crouched.vel_overshot.pitch_neg = 5
	self.stances.thompson.crouched.vel_overshot.pitch_pos = -5
	slot20 = self.stances.default
	self.stances.sten = deep_clone(0)
	slot21 = -0.499107
	local pivot_shoulder_translation = Vector3(deep_clone(0), 7.77455, 11.5544)
	slot22 = -0.000178439
	local pivot_shoulder_rotation = Rotation(7.77455, -4.74979e-06, 0.00043329)
	slot23 = -5.5
	local pivot_head_translation = Vector3(-4.74979e-06, 9, 15)
	slot24 = -12
	local pivot_head_rotation = Rotation(9, 0, 0)
	slot24 = pivot_shoulder_translation
	slot27 = pivot_shoulder_rotation
	slot25 = pivot_head_rotation
	self.stances.sten.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot26)).rotate_with(0, pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot26)))
	slot24 = pivot_shoulder_rotation
	self.stances.sten.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation.inverse(0)
	slot26 = 0
	self.stances.sten.standard.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, 0, -20)
	self.stances.sten.standard.vel_overshot.yaw_neg = -6
	self.stances.sten.standard.vel_overshot.yaw_pos = 6
	self.stances.sten.standard.vel_overshot.pitch_neg = 5
	self.stances.sten.standard.vel_overshot.pitch_pos = -5
	slot25 = 0
	local pivot_head_translation = Vector3(-5, 0, 15)
	slot26 = 0
	local pivot_head_rotation = Rotation(0, 0, 0)
	slot26 = pivot_shoulder_translation
	slot29 = pivot_shoulder_rotation
	slot27 = pivot_head_rotation
	self.stances.sten.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot28)).rotate_with(0, pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot28)))
	slot26 = pivot_shoulder_rotation
	self.stances.sten.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation.inverse(0)
	self.stances.sten.steelsight.FOV = self.stances.sten.standard.FOV
	slot28 = 0
	self.stances.sten.steelsight.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, 0, -7)
	self.stances.sten.steelsight.vel_overshot.yaw_neg = -2
	self.stances.sten.steelsight.vel_overshot.yaw_pos = 4
	self.stances.sten.steelsight.vel_overshot.pitch_neg = 5
	self.stances.sten.steelsight.vel_overshot.pitch_pos = -5
	slot27 = -4.5
	local pivot_head_translation = Vector3(-5, 6, 10)
	slot28 = -16
	local pivot_head_rotation = Rotation(6, 0, 0)
	slot28 = pivot_shoulder_translation
	slot31 = pivot_shoulder_rotation
	slot29 = pivot_head_rotation
	self.stances.sten.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot30)).rotate_with(0, pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot30)))
	slot28 = pivot_shoulder_rotation
	self.stances.sten.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation.inverse(0)
	slot30 = 0
	self.stances.sten.crouched.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, 0, -20)
	self.stances.sten.crouched.vel_overshot.yaw_neg = -6
	self.stances.sten.crouched.vel_overshot.yaw_pos = 6
	self.stances.sten.crouched.vel_overshot.pitch_neg = 5
	self.stances.sten.crouched.vel_overshot.pitch_pos = -5
	slot28 = self.stances.default
	self.stances.mp38 = deep_clone(0)
	slot29 = -3.64956
	local pivot_shoulder_translation = Vector3(deep_clone(0), 8.48655, 26.5318)
	slot30 = 5.61359e-05
	local pivot_shoulder_rotation = Rotation(8.48655, -0.000111978, 0.000329983)
	slot31 = -4.5
	local pivot_head_translation = Vector3(-0.000111978, 8, 23)
	slot32 = -1.5
	local pivot_head_rotation = Rotation(8, 0, 0)
	slot32 = pivot_shoulder_translation
	slot35 = pivot_shoulder_rotation
	slot33 = pivot_head_rotation
	self.stances.mp38.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot34)).rotate_with(0, pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot34)))
	slot32 = pivot_shoulder_rotation
	self.stances.mp38.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation.inverse(0)
	slot34 = 0
	self.stances.mp38.standard.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, 0, -20)
	self.stances.mp38.standard.vel_overshot.yaw_neg = -6
	self.stances.mp38.standard.vel_overshot.yaw_pos = 6
	self.stances.mp38.standard.vel_overshot.pitch_neg = 5
	self.stances.mp38.standard.vel_overshot.pitch_pos = -5
	slot33 = 0
	local pivot_head_translation = Vector3(-5, 0, 24)
	slot34 = 0
	local pivot_head_rotation = Rotation(0, 0, 0)
	slot34 = pivot_shoulder_translation
	slot37 = pivot_shoulder_rotation
	slot35 = pivot_head_rotation
	self.stances.mp38.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot36)).rotate_with(0, pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot36)))
	slot34 = pivot_shoulder_rotation
	self.stances.mp38.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation.inverse(0)
	self.stances.mp38.steelsight.FOV = self.stances.mp38.standard.FOV
	slot36 = 0
	self.stances.mp38.steelsight.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, 0, -7)
	self.stances.mp38.steelsight.vel_overshot.yaw_neg = -2
	self.stances.mp38.steelsight.vel_overshot.yaw_pos = 4
	self.stances.mp38.steelsight.vel_overshot.pitch_neg = 5
	self.stances.mp38.steelsight.vel_overshot.pitch_pos = -5
	slot35 = -5.5
	local pivot_head_translation = Vector3(-5, 7, 22)
	slot36 = -6
	local pivot_head_rotation = Rotation(7, 0, 0)
	slot36 = pivot_shoulder_translation
	slot39 = pivot_shoulder_rotation
	slot37 = pivot_head_rotation
	self.stances.mp38.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot38)).rotate_with(0, pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot38)))
	slot36 = pivot_shoulder_rotation
	self.stances.mp38.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation.inverse(0)
	slot38 = 0
	self.stances.mp38.crouched.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, 0, -20)
	self.stances.mp38.crouched.vel_overshot.yaw_neg = -6
	self.stances.mp38.crouched.vel_overshot.yaw_pos = 6
	self.stances.mp38.crouched.vel_overshot.pitch_neg = 5
	self.stances.mp38.crouched.vel_overshot.pitch_pos = -5

	return 
end
function PlayerTweakData:_init_shotgun_stances()
	slot4 = self.stances.default
	self.stances.geco = deep_clone(slot3)
	slot5 = -5.20036
	local pivot_shoulder_translation = Vector3(deep_clone(slot3), 11.4127, 15.7764)
	slot6 = 0.000184415
	local pivot_shoulder_rotation = Rotation(11.4127, -0.000176678, 0.000172462)
	slot7 = -3
	local pivot_head_translation = Vector3(-0.000176678, 7, 18)
	slot8 = -1
	local pivot_head_rotation = Rotation(7, 0, 0)
	slot8 = pivot_shoulder_translation
	slot11 = pivot_shoulder_rotation
	slot9 = pivot_head_rotation
	self.stances.geco.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot10)).rotate_with(0, pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot10)))
	slot8 = pivot_shoulder_rotation
	self.stances.geco.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation.inverse(0)
	slot10 = 0
	self.stances.geco.standard.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, 0, -30)
	self.stances.geco.standard.vel_overshot.yaw_neg = 10
	self.stances.geco.standard.vel_overshot.yaw_pos = -10
	self.stances.geco.standard.vel_overshot.pitch_neg = -10
	self.stances.geco.standard.vel_overshot.pitch_pos = 10
	slot9 = -1
	local pivot_head_translation = Vector3(10, 0, 16)
	slot10 = 0
	local pivot_head_rotation = Rotation(0, 0, 0)
	slot10 = pivot_shoulder_translation
	slot13 = pivot_shoulder_rotation
	slot11 = pivot_head_rotation
	self.stances.geco.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot12)).rotate_with(0, pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot12)))
	slot10 = pivot_shoulder_rotation
	self.stances.geco.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation.inverse(0)
	slot12 = 0
	self.stances.geco.steelsight.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, 0, -18)
	self.stances.geco.steelsight.vel_overshot.yaw_neg = 10
	self.stances.geco.steelsight.vel_overshot.yaw_pos = -10
	self.stances.geco.steelsight.vel_overshot.pitch_neg = -10
	self.stances.geco.steelsight.vel_overshot.pitch_pos = 10
	slot11 = -4
	local pivot_head_translation = Vector3(10, 6, 17)
	slot12 = -6
	local pivot_head_rotation = Rotation(6, 0, 0)
	slot12 = pivot_shoulder_translation
	slot15 = pivot_shoulder_rotation
	slot13 = pivot_head_rotation
	self.stances.geco.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot14)).rotate_with(0, pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot14)))
	slot12 = pivot_shoulder_rotation
	self.stances.geco.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation.inverse(0)
	slot14 = 0
	self.stances.geco.crouched.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, 0, -25)
	slot12 = self.stances.default
	self.stances.m1912 = deep_clone(0)
	slot13 = 2.75509
	local pivot_shoulder_translation = Vector3(deep_clone(0), 11.2001, 15.3999)
	slot14 = -0.000322727
	local pivot_shoulder_rotation = Rotation(11.2001, 5.25055e-05, 0.00056349)
	slot15 = -3
	local pivot_head_translation = Vector3(5.25055e-05, 7, 18)
	slot16 = -1
	local pivot_head_rotation = Rotation(7, 0, 0)
	slot16 = pivot_shoulder_translation
	slot19 = pivot_shoulder_rotation
	slot17 = pivot_head_rotation
	self.stances.m1912.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot18)).rotate_with(0, pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot18)))
	slot16 = pivot_shoulder_rotation
	self.stances.m1912.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation.inverse(0)
	slot18 = 0
	self.stances.m1912.standard.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, 0, -30)
	self.stances.m1912.standard.vel_overshot.yaw_neg = 10
	self.stances.m1912.standard.vel_overshot.yaw_pos = -10
	self.stances.m1912.standard.vel_overshot.pitch_neg = -10
	self.stances.m1912.standard.vel_overshot.pitch_pos = 10
	slot17 = -1
	local pivot_head_translation = Vector3(10, 0, 11)
	slot18 = 0
	local pivot_head_rotation = Rotation(0, 0, 0)
	slot18 = pivot_shoulder_translation
	slot21 = pivot_shoulder_rotation
	slot19 = pivot_head_rotation
	self.stances.m1912.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot20)).rotate_with(0, pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot20)))
	slot18 = pivot_shoulder_rotation
	self.stances.m1912.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation.inverse(0)
	slot20 = 0
	self.stances.m1912.steelsight.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, 0, -18)
	self.stances.m1912.steelsight.vel_overshot.yaw_neg = 10
	self.stances.m1912.steelsight.vel_overshot.yaw_pos = -10
	self.stances.m1912.steelsight.vel_overshot.pitch_neg = -10
	self.stances.m1912.steelsight.vel_overshot.pitch_pos = 10
	slot19 = -4
	local pivot_head_translation = Vector3(10, 6, 17)
	slot20 = -6
	local pivot_head_rotation = Rotation(6, 0, 0)
	slot20 = pivot_shoulder_translation
	slot23 = pivot_shoulder_rotation
	slot21 = pivot_head_rotation
	self.stances.m1912.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot22)).rotate_with(0, pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot22)))
	slot20 = pivot_shoulder_rotation
	self.stances.m1912.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation.inverse(0)
	slot22 = 0
	self.stances.m1912.crouched.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, 0, -25)
	slot20 = self.stances.default
	self.stances.ithaca = deep_clone(0)
	slot21 = 2.99868
	local pivot_shoulder_translation = Vector3(deep_clone(0), 11.2001, 10.9188)
	slot22 = -0.00140905
	local pivot_shoulder_rotation = Rotation(11.2001, 0.000153332, 0.000313466)
	slot23 = -4
	local pivot_head_translation = Vector3(0.000153332, 7, 18)
	slot24 = -1
	local pivot_head_rotation = Rotation(7, 0, 0)
	slot24 = pivot_shoulder_translation
	slot27 = pivot_shoulder_rotation
	slot25 = pivot_head_rotation
	self.stances.ithaca.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot26)).rotate_with(0, pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot26)))
	slot24 = pivot_shoulder_rotation
	self.stances.ithaca.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation.inverse(0)
	slot26 = 0
	self.stances.ithaca.standard.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, 0, -30)
	self.stances.ithaca.standard.vel_overshot.yaw_neg = 10
	self.stances.ithaca.standard.vel_overshot.yaw_pos = -10
	self.stances.ithaca.standard.vel_overshot.pitch_neg = -10
	self.stances.ithaca.standard.vel_overshot.pitch_pos = 10
	slot25 = -1
	local pivot_head_translation = Vector3(10, 0, 15)
	slot26 = 0
	local pivot_head_rotation = Rotation(0, 0, 0)
	slot26 = pivot_shoulder_translation
	slot29 = pivot_shoulder_rotation
	slot27 = pivot_head_rotation
	self.stances.ithaca.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot28)).rotate_with(0, pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot28)))
	slot26 = pivot_shoulder_rotation
	self.stances.ithaca.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation.inverse(0)
	slot28 = 0
	self.stances.ithaca.steelsight.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, 0, -18)
	self.stances.ithaca.steelsight.vel_overshot.yaw_neg = 10
	self.stances.ithaca.steelsight.vel_overshot.yaw_pos = -10
	self.stances.ithaca.steelsight.vel_overshot.pitch_neg = -10
	self.stances.ithaca.steelsight.vel_overshot.pitch_pos = 10
	slot27 = -6
	local pivot_head_translation = Vector3(10, 6, 17)
	slot28 = -6
	local pivot_head_rotation = Rotation(6, 0, 0)
	slot28 = pivot_shoulder_translation
	slot31 = pivot_shoulder_rotation
	slot29 = pivot_head_rotation
	self.stances.ithaca.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot30)).rotate_with(0, pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot30)))
	slot28 = pivot_shoulder_rotation
	self.stances.ithaca.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation.inverse(0)
	slot30 = 0
	self.stances.ithaca.crouched.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, 0, -25)
	slot28 = self.stances.default
	self.stances.browning = deep_clone(0)
	slot29 = 3.24215
	local pivot_shoulder_translation = Vector3(deep_clone(0), 11.2002, 5.61833)
	slot30 = -0.000579741
	local pivot_shoulder_rotation = Rotation(11.2002, 0.000383849, 0.000530845)
	slot31 = -4
	local pivot_head_translation = Vector3(0.000383849, 7, 18)
	slot32 = -1
	local pivot_head_rotation = Rotation(7, 0, 0)
	slot32 = pivot_shoulder_translation
	slot35 = pivot_shoulder_rotation
	slot33 = pivot_head_rotation
	self.stances.browning.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot34)).rotate_with(0, pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot34)))
	slot32 = pivot_shoulder_rotation
	self.stances.browning.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation.inverse(0)
	slot34 = 0
	self.stances.browning.standard.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, 0, -30)
	self.stances.browning.standard.vel_overshot.yaw_neg = 10
	self.stances.browning.standard.vel_overshot.yaw_pos = -10
	self.stances.browning.standard.vel_overshot.pitch_neg = -10
	self.stances.browning.standard.vel_overshot.pitch_pos = 10
	slot33 = -1
	local pivot_head_translation = Vector3(10, 0, 15)
	slot34 = 0
	local pivot_head_rotation = Rotation(0, 0, 0)
	slot34 = pivot_shoulder_translation
	slot37 = pivot_shoulder_rotation
	slot35 = pivot_head_rotation
	self.stances.browning.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot36)).rotate_with(0, pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot36)))
	slot34 = pivot_shoulder_rotation
	self.stances.browning.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation.inverse(0)
	slot36 = 0
	self.stances.browning.steelsight.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, 0, -18)
	self.stances.browning.steelsight.vel_overshot.yaw_neg = 10
	self.stances.browning.steelsight.vel_overshot.yaw_pos = -10
	self.stances.browning.steelsight.vel_overshot.pitch_neg = -10
	self.stances.browning.steelsight.vel_overshot.pitch_pos = 10
	slot35 = -6
	local pivot_head_translation = Vector3(10, 6, 17)
	slot36 = -6
	local pivot_head_rotation = Rotation(6, 0, 0)
	slot36 = pivot_shoulder_translation
	slot39 = pivot_shoulder_rotation
	slot37 = pivot_head_rotation
	self.stances.browning.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot38)).rotate_with(0, pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot38)))
	slot36 = pivot_shoulder_rotation
	self.stances.browning.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation.inverse(0)
	slot38 = 0
	self.stances.browning.crouched.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, 0, -25)

	return 
end
function PlayerTweakData:_init_new_stances()
	slot4 = self.stances.default
	self.stances.dp28 = deep_clone(slot3)
	slot5 = -6.68822
	local pivot_shoulder_translation = Vector3(deep_clone(slot3), 12.6977, 8.57658)
	slot6 = -0.00256367
	local pivot_shoulder_rotation = Rotation(12.6977, -0.0120528, 0.00306297)
	slot7 = -6
	local pivot_head_translation = Vector3(-0.0120528, 8, 18)
	slot8 = -1
	local pivot_head_rotation = Rotation(8, 0, 0)
	slot8 = pivot_shoulder_translation
	slot11 = pivot_shoulder_rotation
	slot9 = pivot_head_rotation
	self.stances.dp28.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot10)).rotate_with(0, pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot10)))
	slot8 = pivot_shoulder_rotation
	self.stances.dp28.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation.inverse(0)
	slot10 = 0
	self.stances.dp28.standard.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, 0, -20)
	self.stances.dp28.standard.vel_overshot.yaw_neg = -6
	self.stances.dp28.standard.vel_overshot.yaw_pos = 6
	self.stances.dp28.standard.vel_overshot.pitch_neg = 5
	self.stances.dp28.standard.vel_overshot.pitch_pos = -5
	slot9 = 0
	local pivot_head_translation = Vector3(-5, 0, 18)
	slot10 = 0
	local pivot_head_rotation = Rotation(0, 0, 0)
	slot10 = pivot_shoulder_translation
	slot13 = pivot_shoulder_rotation
	slot11 = pivot_head_rotation
	self.stances.dp28.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot12)).rotate_with(0, pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot12)))
	slot10 = pivot_shoulder_rotation
	self.stances.dp28.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation.inverse(0)
	self.stances.dp28.steelsight.FOV = self.stances.dp28.standard.FOV
	slot12 = 0
	self.stances.dp28.steelsight.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, 0, -20)
	self.stances.dp28.steelsight.vel_overshot.yaw_neg = -6
	self.stances.dp28.steelsight.vel_overshot.yaw_pos = 6
	self.stances.dp28.steelsight.vel_overshot.pitch_neg = 5
	self.stances.dp28.steelsight.vel_overshot.pitch_pos = -5
	slot11 = -8
	local pivot_head_translation = Vector3(-5, 8, 16)
	slot12 = -6
	local pivot_head_rotation = Rotation(8, 0, 0)
	slot12 = pivot_shoulder_translation
	slot15 = pivot_shoulder_rotation
	slot13 = pivot_head_rotation
	self.stances.dp28.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot14)).rotate_with(0, pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot14)))
	slot12 = pivot_shoulder_rotation
	self.stances.dp28.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation.inverse(0)
	slot14 = 0
	self.stances.dp28.crouched.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, 0, -20)
	self.stances.dp28.crouched.vel_overshot.yaw_neg = -6
	self.stances.dp28.crouched.vel_overshot.yaw_pos = 6
	self.stances.dp28.crouched.vel_overshot.pitch_neg = 5
	self.stances.dp28.crouched.vel_overshot.pitch_pos = -5
	slot12 = self.stances.default
	self.stances.bren = deep_clone(0)
	slot13 = 3.76742
	local pivot_shoulder_translation = Vector3(deep_clone(0), 8.51187, 6.07049)
	slot14 = -8.82758e-05
	local pivot_shoulder_rotation = Rotation(8.51187, 7.29639e-05, 0.000497004)
	slot15 = -6
	local pivot_head_translation = Vector3(7.29639e-05, 6, 18)
	slot16 = -1
	local pivot_head_rotation = Rotation(6, 0, 0)
	slot16 = pivot_shoulder_translation
	slot19 = pivot_shoulder_rotation
	slot17 = pivot_head_rotation
	self.stances.bren.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot18)).rotate_with(0, pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot18)))
	slot16 = pivot_shoulder_rotation
	self.stances.bren.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation.inverse(0)
	slot18 = 0
	self.stances.bren.standard.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, 0, -20)
	self.stances.bren.standard.vel_overshot.yaw_neg = -6
	self.stances.bren.standard.vel_overshot.yaw_pos = 6
	self.stances.bren.standard.vel_overshot.pitch_neg = 5
	self.stances.bren.standard.vel_overshot.pitch_pos = -5
	slot17 = 0
	local pivot_head_translation = Vector3(-5, 0, 14)
	slot18 = 0
	local pivot_head_rotation = Rotation(0, 0, 0)
	slot18 = pivot_shoulder_translation
	slot21 = pivot_shoulder_rotation
	slot19 = pivot_head_rotation
	self.stances.bren.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot20)).rotate_with(0, pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot20)))
	slot18 = pivot_shoulder_rotation
	self.stances.bren.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation.inverse(0)
	self.stances.bren.steelsight.FOV = self.stances.bren.standard.FOV
	slot20 = 0
	self.stances.bren.steelsight.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, 0, -20)
	self.stances.bren.steelsight.vel_overshot.yaw_neg = -6
	self.stances.bren.steelsight.vel_overshot.yaw_pos = 6
	self.stances.bren.steelsight.vel_overshot.pitch_neg = 5
	self.stances.bren.steelsight.vel_overshot.pitch_pos = -5
	slot19 = -8
	local pivot_head_translation = Vector3(-5, 5, 16)
	slot20 = -6
	local pivot_head_rotation = Rotation(5, 0, 0)
	slot20 = pivot_shoulder_translation
	slot23 = pivot_shoulder_rotation
	slot21 = pivot_head_rotation
	self.stances.bren.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot22)).rotate_with(0, pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot22)))
	slot20 = pivot_shoulder_rotation
	self.stances.bren.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation.inverse(0)
	slot22 = 0
	self.stances.bren.crouched.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, 0, -20)
	self.stances.bren.crouched.vel_overshot.yaw_neg = -6
	self.stances.bren.crouched.vel_overshot.yaw_pos = 6
	self.stances.bren.crouched.vel_overshot.pitch_neg = 5
	self.stances.bren.crouched.vel_overshot.pitch_pos = -5
	slot20 = self.stances.default
	self.stances.garand = deep_clone(0)
	slot21 = 3.42763
	local pivot_shoulder_translation = Vector3(deep_clone(0), 10.895, 12.5645)
	slot22 = -0.000803142
	local pivot_shoulder_rotation = Rotation(10.895, 0.000152489, 0.000367234)
	slot23 = -3.25
	local pivot_head_translation = Vector3(0.000152489, 11, 18)
	slot24 = -1
	local pivot_head_rotation = Rotation(11, 0, 0)
	slot24 = pivot_shoulder_translation
	slot27 = pivot_shoulder_rotation
	slot25 = pivot_head_rotation
	self.stances.garand.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot26)).rotate_with(0, pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot26)))
	slot24 = pivot_shoulder_rotation
	self.stances.garand.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation.inverse(0)
	slot26 = 0
	self.stances.garand.standard.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, 0, -20)
	self.stances.garand.standard.vel_overshot.yaw_neg = -6
	self.stances.garand.standard.vel_overshot.yaw_pos = 6
	self.stances.garand.standard.vel_overshot.pitch_neg = 5
	self.stances.garand.standard.vel_overshot.pitch_pos = -5
	slot25 = 0
	local pivot_head_translation = Vector3(-5, 0, 15)
	slot26 = 0
	local pivot_head_rotation = Rotation(0, 0, 0)
	slot26 = pivot_shoulder_translation
	slot29 = pivot_shoulder_rotation
	slot27 = pivot_head_rotation
	self.stances.garand.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot28)).rotate_with(0, pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot28)))
	slot26 = pivot_shoulder_rotation
	self.stances.garand.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation.inverse(0)
	self.stances.garand.steelsight.FOV = self.stances.garand.standard.FOV
	slot28 = 0
	self.stances.garand.steelsight.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, 0, -7)
	self.stances.garand.steelsight.vel_overshot.yaw_neg = -2
	self.stances.garand.steelsight.vel_overshot.yaw_pos = 4
	self.stances.garand.steelsight.vel_overshot.pitch_neg = 5
	self.stances.garand.steelsight.vel_overshot.pitch_pos = -5
	slot27 = -2.5
	local pivot_head_translation = Vector3(-5, 9, 16)
	slot28 = -4
	local pivot_head_rotation = Rotation(9, 0, 0)
	slot28 = pivot_shoulder_translation
	slot31 = pivot_shoulder_rotation
	slot29 = pivot_head_rotation
	self.stances.garand.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot30)).rotate_with(0, pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot30)))
	slot28 = pivot_shoulder_rotation
	self.stances.garand.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation.inverse(0)
	slot30 = 0
	self.stances.garand.crouched.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, 0, -20)
	self.stances.garand.crouched.vel_overshot.yaw_neg = -6
	self.stances.garand.crouched.vel_overshot.yaw_pos = 6
	self.stances.garand.crouched.vel_overshot.pitch_neg = 5
	self.stances.garand.crouched.vel_overshot.pitch_pos = -5
	slot28 = self.stances.garand
	self.stances.garand_golden = deep_clone(0)
	slot28 = self.stances.default
	self.stances.m1918 = deep_clone(0)
	slot29 = 2.23107
	local pivot_shoulder_translation = Vector3(deep_clone(0), 11.4138, 7.88427)
	slot30 = -0.000591075
	local pivot_shoulder_rotation = Rotation(11.4138, -4.82672e-05, 0.000440811)
	slot31 = -3
	local pivot_head_translation = Vector3(-4.82672e-05, 9.5, 13)
	slot32 = -1
	local pivot_head_rotation = Rotation(9.5, 0, 0)
	slot32 = pivot_shoulder_translation
	slot35 = pivot_shoulder_rotation
	slot33 = pivot_head_rotation
	self.stances.m1918.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot34)).rotate_with(0, pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot34)))
	slot32 = pivot_shoulder_rotation
	self.stances.m1918.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation.inverse(0)
	slot34 = 0
	self.stances.m1918.standard.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, 0, -20)
	self.stances.m1918.standard.vel_overshot.yaw_neg = -6
	self.stances.m1918.standard.vel_overshot.yaw_pos = 6
	self.stances.m1918.standard.vel_overshot.pitch_neg = 5
	self.stances.m1918.standard.vel_overshot.pitch_pos = -5
	slot33 = 0
	local pivot_head_translation = Vector3(-5, 0, 10)
	slot34 = 0
	local pivot_head_rotation = Rotation(0, 0, 0)
	slot34 = pivot_shoulder_translation
	slot37 = pivot_shoulder_rotation
	slot35 = pivot_head_rotation
	self.stances.m1918.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot36)).rotate_with(0, pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot36)))
	slot34 = pivot_shoulder_rotation
	self.stances.m1918.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation.inverse(0)
	self.stances.m1918.steelsight.FOV = self.stances.m1918.standard.FOV
	slot36 = 0
	self.stances.m1918.steelsight.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, 0, -20)
	self.stances.m1918.steelsight.vel_overshot.yaw_neg = -6
	self.stances.m1918.steelsight.vel_overshot.yaw_pos = 6
	self.stances.m1918.steelsight.vel_overshot.pitch_neg = 5
	self.stances.m1918.steelsight.vel_overshot.pitch_pos = -5
	slot35 = -2
	local pivot_head_translation = Vector3(-5, 8.5, 12)
	slot36 = -6
	local pivot_head_rotation = Rotation(8.5, 0, 0)
	slot36 = pivot_shoulder_translation
	slot39 = pivot_shoulder_rotation
	slot37 = pivot_head_rotation
	self.stances.m1918.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot38)).rotate_with(0, pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot38)))
	slot36 = pivot_shoulder_rotation
	self.stances.m1918.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation.inverse(0)
	slot38 = 0
	self.stances.m1918.crouched.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, 0, -20)
	self.stances.m1918.crouched.vel_overshot.yaw_neg = -6
	self.stances.m1918.crouched.vel_overshot.yaw_pos = 6
	self.stances.m1918.crouched.vel_overshot.pitch_neg = 5
	self.stances.m1918.crouched.vel_overshot.pitch_pos = -5
	slot36 = self.stances.default
	self.stances.m1903 = deep_clone(0)
	slot37 = 3.03469
	local pivot_shoulder_translation = Vector3(deep_clone(0), 11.408, 15.8596)
	slot38 = 0.000851212
	local pivot_shoulder_rotation = Rotation(11.408, 0.000389178, 2.90312e-05)
	slot39 = -4
	local pivot_head_translation = Vector3(0.000389178, 10.5, 20)
	slot40 = -1
	local pivot_head_rotation = Rotation(10.5, 0, 0)
	slot40 = pivot_shoulder_translation
	slot43 = pivot_shoulder_rotation
	slot41 = pivot_head_rotation
	self.stances.m1903.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot42)).rotate_with(0, pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot42)))
	slot40 = pivot_shoulder_rotation
	self.stances.m1903.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation.inverse(0)
	slot42 = 0
	self.stances.m1903.standard.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, 0, -20)
	self.stances.m1903.standard.vel_overshot.yaw_neg = -6
	self.stances.m1903.standard.vel_overshot.yaw_pos = 6
	self.stances.m1903.standard.vel_overshot.pitch_neg = 5
	self.stances.m1903.standard.vel_overshot.pitch_pos = -5
	slot41 = 0
	local pivot_head_translation = Vector3(-5, 0, 24)
	slot42 = 0
	local pivot_head_rotation = Rotation(0, 0, 0)
	slot42 = pivot_shoulder_translation
	slot45 = pivot_shoulder_rotation
	slot43 = pivot_head_rotation
	self.stances.m1903.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot44)).rotate_with(0, pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot44)))
	slot42 = pivot_shoulder_rotation
	self.stances.m1903.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation.inverse(0)
	self.stances.m1903.steelsight.FOV = self.stances.m1903.standard.FOV
	slot44 = 0
	self.stances.m1903.steelsight.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, 0, -10)
	self.stances.m1903.steelsight.vel_overshot.yaw_neg = -0.4
	self.stances.m1903.steelsight.vel_overshot.yaw_pos = 0.4
	self.stances.m1903.steelsight.vel_overshot.pitch_neg = 0.3
	self.stances.m1903.steelsight.vel_overshot.pitch_pos = -0.3
	self.stances.m1903.steelsight.camera_sensitivity_multiplier = 0.35
	slot43 = -3
	local pivot_head_translation = Vector3(0.35, 9.5, 17)
	slot44 = -6
	local pivot_head_rotation = Rotation(9.5, 0, 0)
	slot44 = pivot_shoulder_translation
	slot47 = pivot_shoulder_rotation
	slot45 = pivot_head_rotation
	self.stances.m1903.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot46)).rotate_with(0, pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot46)))
	slot44 = pivot_shoulder_rotation
	self.stances.m1903.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation.inverse(0)
	slot46 = 0
	self.stances.m1903.crouched.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, 0, -20)
	self.stances.m1903.crouched.vel_overshot.yaw_neg = -6
	self.stances.m1903.crouched.vel_overshot.yaw_pos = 6
	self.stances.m1903.crouched.vel_overshot.pitch_neg = 5
	self.stances.m1903.crouched.vel_overshot.pitch_pos = -5
	slot44 = self.stances.default
	self.stances.kar_98k = deep_clone(0)
	slot45 = -5.3333
	local pivot_shoulder_translation = Vector3(deep_clone(0), 8.60602, 42.8494)
	slot46 = -0.000360721
	local pivot_shoulder_rotation = Rotation(8.60602, 0.000198704, 0.00070511)
	slot47 = -4
	local pivot_head_translation = Vector3(0.000198704, 8, 40)
	slot48 = -1
	local pivot_head_rotation = Rotation(8, 0, 0)
	slot48 = pivot_shoulder_translation
	slot51 = pivot_shoulder_rotation
	slot49 = pivot_head_rotation
	self.stances.kar_98k.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot50)).rotate_with(0, pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot50)))
	slot48 = pivot_shoulder_rotation
	self.stances.kar_98k.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation.inverse(0)
	slot50 = 0
	self.stances.kar_98k.standard.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, 0, -20)
	self.stances.kar_98k.standard.vel_overshot.yaw_neg = 6
	self.stances.kar_98k.standard.vel_overshot.yaw_pos = -6
	self.stances.kar_98k.standard.vel_overshot.pitch_neg = -5
	self.stances.kar_98k.standard.vel_overshot.pitch_pos = 5
	slot49 = 0
	local pivot_head_translation = Vector3(5, 0, 46)
	slot50 = 0
	local pivot_head_rotation = Rotation(0, 0, 0)
	slot50 = pivot_shoulder_translation
	slot53 = pivot_shoulder_rotation
	slot51 = pivot_head_rotation
	self.stances.kar_98k.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot52)).rotate_with(0, pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot52)))
	slot50 = pivot_shoulder_rotation
	self.stances.kar_98k.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation.inverse(0)
	self.stances.kar_98k.steelsight.FOV = self.stances.kar_98k.standard.FOV
	slot52 = 0
	self.stances.kar_98k.steelsight.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, 0, -10)
	self.stances.kar_98k.steelsight.vel_overshot.yaw_neg = 0.4
	self.stances.kar_98k.steelsight.vel_overshot.yaw_pos = -0.4
	self.stances.kar_98k.steelsight.vel_overshot.pitch_neg = -0.3
	self.stances.kar_98k.steelsight.vel_overshot.pitch_pos = 0.3
	self.stances.kar_98k.steelsight.camera_sensitivity_multiplier = 0.35
	slot51 = -3
	local pivot_head_translation = Vector3(0.35, 6, 38)
	slot52 = -6
	local pivot_head_rotation = Rotation(6, 0, 0)
	slot52 = pivot_shoulder_translation
	slot55 = pivot_shoulder_rotation
	slot53 = pivot_head_rotation
	self.stances.kar_98k.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot54)).rotate_with(0, pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot54)))
	slot52 = pivot_shoulder_rotation
	self.stances.kar_98k.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation.inverse(0)
	slot54 = 0
	self.stances.kar_98k.crouched.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, 0, -20)
	self.stances.kar_98k.crouched.vel_overshot.yaw_neg = 6
	self.stances.kar_98k.crouched.vel_overshot.yaw_pos = -6
	self.stances.kar_98k.crouched.vel_overshot.pitch_neg = -5
	self.stances.kar_98k.crouched.vel_overshot.pitch_pos = 5
	slot52 = self.stances.default
	self.stances.lee_enfield = deep_clone(0)
	slot53 = -6.65286
	local pivot_shoulder_translation = Vector3(deep_clone(0), 8.60614, 16.0214)
	slot54 = -0.000366323
	local pivot_shoulder_rotation = Rotation(8.60614, 6.09262e-05, 0.000580366)
	slot55 = -3
	local pivot_head_translation = Vector3(6.09262e-05, 6, 16)
	slot56 = -1
	local pivot_head_rotation = Rotation(6, 0, 0)
	slot56 = pivot_shoulder_translation
	slot59 = pivot_shoulder_rotation
	slot57 = pivot_head_rotation
	self.stances.lee_enfield.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot58)).rotate_with(0, pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot58)))
	slot56 = pivot_shoulder_rotation
	self.stances.lee_enfield.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation.inverse(0)
	slot58 = 0
	self.stances.lee_enfield.standard.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, 0, -20)
	self.stances.lee_enfield.standard.vel_overshot.yaw_neg = -6
	self.stances.lee_enfield.standard.vel_overshot.yaw_pos = 6
	self.stances.lee_enfield.standard.vel_overshot.pitch_neg = 5
	self.stances.lee_enfield.standard.vel_overshot.pitch_pos = -5
	slot57 = 0
	local pivot_head_translation = Vector3(-5, 0, 10)
	slot58 = 0
	local pivot_head_rotation = Rotation(0, 0, 0)
	slot58 = pivot_shoulder_translation
	slot61 = pivot_shoulder_rotation
	slot59 = pivot_head_rotation
	self.stances.lee_enfield.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot60)).rotate_with(0, pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot60)))
	slot58 = pivot_shoulder_rotation
	self.stances.lee_enfield.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation.inverse(0)
	self.stances.lee_enfield.steelsight.FOV = self.stances.lee_enfield.standard.FOV
	slot60 = 0
	self.stances.lee_enfield.steelsight.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, 0, -10)
	self.stances.lee_enfield.steelsight.vel_overshot.yaw_neg = -0.4
	self.stances.lee_enfield.steelsight.vel_overshot.yaw_pos = 0.4
	self.stances.lee_enfield.steelsight.vel_overshot.pitch_neg = 0.3
	self.stances.lee_enfield.steelsight.vel_overshot.pitch_pos = -0.3
	self.stances.lee_enfield.steelsight.camera_sensitivity_multiplier = 0.35
	slot59 = -4
	local pivot_head_translation = Vector3(0.35, 4, 14)
	slot60 = -5
	local pivot_head_rotation = Rotation(4, 0, 0)
	slot60 = pivot_shoulder_translation
	slot63 = pivot_shoulder_rotation
	slot61 = pivot_head_rotation
	self.stances.lee_enfield.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot62)).rotate_with(0, pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot62)))
	slot60 = pivot_shoulder_rotation
	self.stances.lee_enfield.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation.inverse(0)
	slot62 = 0
	self.stances.lee_enfield.crouched.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, 0, -20)
	self.stances.lee_enfield.crouched.vel_overshot.yaw_neg = -6
	self.stances.lee_enfield.crouched.vel_overshot.yaw_pos = 6
	self.stances.lee_enfield.crouched.vel_overshot.pitch_neg = 5
	self.stances.lee_enfield.crouched.vel_overshot.pitch_pos = -5
	slot60 = self.stances.default
	self.stances.mp44 = deep_clone(0)
	slot61 = 4.17833
	local pivot_shoulder_translation = Vector3(deep_clone(0), 9.24702, 24.6789)
	slot62 = -0.000318031
	local pivot_shoulder_rotation = Rotation(9.24702, 7.08942e-05, 0.000256452)
	slot63 = -4
	local pivot_head_translation = Vector3(7.08942e-05, 9, 35)
	slot64 = -1.5
	local pivot_head_rotation = Rotation(9, 0, 0)
	slot64 = pivot_shoulder_translation
	slot67 = pivot_shoulder_rotation
	slot65 = pivot_head_rotation
	self.stances.mp44.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot66)).rotate_with(0, pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot66)))
	slot64 = pivot_shoulder_rotation
	self.stances.mp44.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation.inverse(0)
	slot66 = 0
	self.stances.mp44.standard.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, 0, -20)
	self.stances.mp44.standard.vel_overshot.yaw_neg = -6
	self.stances.mp44.standard.vel_overshot.yaw_pos = 6
	self.stances.mp44.standard.vel_overshot.pitch_neg = 5
	self.stances.mp44.standard.vel_overshot.pitch_pos = -5
	slot65 = 0
	local pivot_head_translation = Vector3(-5, 0, 24)
	slot66 = 0
	local pivot_head_rotation = Rotation(0, 0, 0)
	slot66 = pivot_shoulder_translation
	slot69 = pivot_shoulder_rotation
	slot67 = pivot_head_rotation
	self.stances.mp44.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot68)).rotate_with(0, pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot68)))
	slot66 = pivot_shoulder_rotation
	self.stances.mp44.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation.inverse(0)
	self.stances.mp44.steelsight.FOV = self.stances.mp44.standard.FOV
	slot68 = 0
	self.stances.mp44.steelsight.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, 0, -7)
	self.stances.mp44.steelsight.vel_overshot.yaw_neg = -2
	self.stances.mp44.steelsight.vel_overshot.yaw_pos = 4
	self.stances.mp44.steelsight.vel_overshot.pitch_neg = 5
	self.stances.mp44.steelsight.vel_overshot.pitch_pos = -5
	slot67 = -5
	local pivot_head_translation = Vector3(-5, 8, 34)
	slot68 = -6
	local pivot_head_rotation = Rotation(8, 0, 0)
	slot68 = pivot_shoulder_translation
	slot71 = pivot_shoulder_rotation
	slot69 = pivot_head_rotation
	self.stances.mp44.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot70)).rotate_with(0, pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot70)))
	slot68 = pivot_shoulder_rotation
	self.stances.mp44.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation.inverse(0)
	slot70 = 0
	self.stances.mp44.crouched.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, 0, -20)
	self.stances.mp44.crouched.vel_overshot.yaw_neg = -6
	self.stances.mp44.crouched.vel_overshot.yaw_pos = 6
	self.stances.mp44.crouched.vel_overshot.pitch_neg = 5
	self.stances.mp44.crouched.vel_overshot.pitch_pos = -5
	slot68 = self.stances.default
	self.stances.carbine = deep_clone(0)
	slot69 = -1.89422
	local pivot_shoulder_translation = Vector3(deep_clone(0), 11.6025, 13.9854)
	slot70 = 1.56912
	local pivot_shoulder_rotation = Rotation(11.6025, 0.575351, 0.652872)
	slot71 = -4
	local pivot_head_translation = Vector3(0.575351, 6, 21)
	slot72 = -1
	local pivot_head_rotation = Rotation(6, 0, 0)
	slot72 = pivot_shoulder_translation
	slot75 = pivot_shoulder_rotation
	slot73 = pivot_head_rotation
	self.stances.carbine.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot74)).rotate_with(0, pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot74)))
	slot72 = pivot_shoulder_rotation
	self.stances.carbine.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation.inverse(0)
	slot74 = 0
	self.stances.carbine.standard.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, 0, -20)
	self.stances.carbine.standard.vel_overshot.yaw_neg = -6
	self.stances.carbine.standard.vel_overshot.yaw_pos = 6
	self.stances.carbine.standard.vel_overshot.pitch_neg = 5
	self.stances.carbine.standard.vel_overshot.pitch_pos = -5
	slot73 = 0
	local pivot_head_translation = Vector3(-5, 0, 8)
	slot74 = 0
	local pivot_head_rotation = Rotation(0, 0, 0)
	slot74 = pivot_shoulder_translation
	slot77 = pivot_shoulder_rotation
	slot75 = pivot_head_rotation
	self.stances.carbine.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot76)).rotate_with(0, pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot76)))
	slot74 = pivot_shoulder_rotation
	self.stances.carbine.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation.inverse(0)
	self.stances.carbine.steelsight.FOV = self.stances.carbine.standard.FOV
	slot76 = 0
	self.stances.carbine.steelsight.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, 0, -7)
	self.stances.carbine.steelsight.vel_overshot.yaw_neg = -2
	self.stances.carbine.steelsight.vel_overshot.yaw_pos = 4
	self.stances.carbine.steelsight.vel_overshot.pitch_neg = 5
	self.stances.carbine.steelsight.vel_overshot.pitch_pos = -5
	slot75 = -5
	local pivot_head_translation = Vector3(-5, 5, 20)
	slot76 = -6
	local pivot_head_rotation = Rotation(5, 0, 0)
	slot76 = pivot_shoulder_translation
	slot79 = pivot_shoulder_rotation
	slot77 = pivot_head_rotation
	self.stances.carbine.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot78)).rotate_with(0, pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot78)))
	slot76 = pivot_shoulder_rotation
	self.stances.carbine.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation.inverse(0)
	slot78 = 0
	self.stances.carbine.crouched.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, 0, -20)
	self.stances.carbine.crouched.vel_overshot.yaw_neg = -6
	self.stances.carbine.crouched.vel_overshot.yaw_pos = 6
	self.stances.carbine.crouched.vel_overshot.pitch_neg = 5
	self.stances.carbine.crouched.vel_overshot.pitch_pos = -5
	slot76 = self.stances.default
	self.stances.mg42 = deep_clone(0)
	slot77 = -4.0325
	local pivot_shoulder_translation = Vector3(deep_clone(0), 12.6956, 27.455)
	slot78 = -0.000360292
	local pivot_shoulder_rotation = Rotation(12.6956, 9.77319e-06, 0.00058889)
	slot79 = -4
	local pivot_head_translation = Vector3(9.77319e-06, 8, 32)
	slot80 = -1.5
	local pivot_head_rotation = Rotation(8, 0, 0)
	slot80 = pivot_shoulder_translation
	slot83 = pivot_shoulder_rotation
	slot81 = pivot_head_rotation
	self.stances.mg42.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot82)).rotate_with(0, pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot82)))
	slot80 = pivot_shoulder_rotation
	self.stances.mg42.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation.inverse(0)
	slot82 = 0
	self.stances.mg42.standard.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, 0, -50)
	self.stances.mg42.standard.vel_overshot.yaw_neg = 10
	self.stances.mg42.standard.vel_overshot.yaw_pos = -10
	self.stances.mg42.standard.vel_overshot.pitch_neg = -10
	self.stances.mg42.standard.vel_overshot.pitch_pos = 10
	slot81 = 0
	local pivot_head_translation = Vector3(10, 0, 28)
	slot82 = 0
	local pivot_head_rotation = Rotation(0, 0, 0)
	slot82 = pivot_shoulder_translation
	slot85 = pivot_shoulder_rotation
	slot83 = pivot_head_rotation
	self.stances.mg42.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot84)).rotate_with(0, pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot84)))
	slot82 = pivot_shoulder_rotation
	self.stances.mg42.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation.inverse(0)
	slot84 = 0
	self.stances.mg42.steelsight.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, 0, -58)
	self.stances.mg42.steelsight.vel_overshot.yaw_neg = 10
	self.stances.mg42.steelsight.vel_overshot.yaw_pos = -10
	self.stances.mg42.steelsight.vel_overshot.pitch_neg = -10
	self.stances.mg42.steelsight.vel_overshot.pitch_pos = 10
	slot83 = -5
	local pivot_head_translation = Vector3(10, 7, 31)
	slot84 = -6
	local pivot_head_rotation = Rotation(7, 0, 0)
	slot84 = pivot_shoulder_translation
	slot87 = pivot_shoulder_rotation
	slot85 = pivot_head_rotation
	self.stances.mg42.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot86)).rotate_with(0, pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot86)))
	slot84 = pivot_shoulder_rotation
	self.stances.mg42.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation.inverse(0)
	slot86 = 0
	self.stances.mg42.crouched.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, 0, -55)
	self.stances.mg42.bipod = {
		shoulders = {},
		vel_overshot = {}
	}
	slot85 = 0
	local pivot_head_translation = Vector3(, 0, 0)
	slot86 = 0
	local pivot_head_rotation = Rotation(0, 0, 0)
	slot86 = pivot_shoulder_translation
	slot89 = pivot_shoulder_rotation
	slot87 = pivot_head_rotation
	self.stances.mg42.bipod.shoulders.translation = pivot_head_translation - pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot88)).rotate_with(0, pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot88)))
	slot86 = pivot_shoulder_rotation
	self.stances.mg42.bipod.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation.inverse(0)
	slot88 = 0
	self.stances.mg42.bipod.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, 0, -0)
	self.stances.mg42.bipod.vel_overshot.yaw_neg = 0
	self.stances.mg42.bipod.vel_overshot.yaw_pos = 0
	self.stances.mg42.bipod.vel_overshot.pitch_neg = 0
	self.stances.mg42.bipod.vel_overshot.pitch_pos = 0
	self.stances.mg42.bipod.FOV = 50
	slot86 = self.stances.default
	self.stances.mosin = deep_clone(0)
	slot87 = -4.03669
	local pivot_shoulder_translation = Vector3(deep_clone(0), 8.60685, 34.9764)
	slot88 = -0.000241724
	local pivot_shoulder_rotation = Rotation(8.60685, -6.75058e-05, 0.000460611)
	slot89 = -4
	local pivot_head_translation = Vector3(-6.75058e-05, 8, 32)
	slot90 = -1.5
	local pivot_head_rotation = Rotation(8, 0, 0)
	slot90 = pivot_shoulder_translation
	slot93 = pivot_shoulder_rotation
	slot91 = pivot_head_rotation
	self.stances.mosin.standard.shoulders.translation = pivot_head_translation - pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot92)).rotate_with(0, pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot92)))
	slot90 = pivot_shoulder_rotation
	self.stances.mosin.standard.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation.inverse(0)
	slot92 = 0
	self.stances.mosin.standard.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, 0, -50)
	self.stances.mosin.standard.vel_overshot.yaw_neg = 15
	self.stances.mosin.standard.vel_overshot.yaw_pos = -15
	self.stances.mosin.standard.vel_overshot.pitch_neg = -15
	self.stances.mosin.standard.vel_overshot.pitch_pos = 15
	slot91 = 0
	local pivot_head_translation = Vector3(15, 0, 35)
	slot92 = 0
	local pivot_head_rotation = Rotation(0, 0, 0)
	slot92 = pivot_shoulder_translation
	slot95 = pivot_shoulder_rotation
	slot93 = pivot_head_rotation
	self.stances.mosin.steelsight.shoulders.translation = pivot_head_translation - pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot94)).rotate_with(0, pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot94)))
	slot92 = pivot_shoulder_rotation
	self.stances.mosin.steelsight.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation.inverse(0)
	slot94 = 0
	self.stances.mosin.steelsight.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, 0, -10)
	self.stances.mosin.steelsight.vel_overshot.yaw_neg = 1
	self.stances.mosin.steelsight.vel_overshot.yaw_pos = -1
	self.stances.mosin.steelsight.vel_overshot.pitch_neg = -0.9
	self.stances.mosin.steelsight.vel_overshot.pitch_pos = 0.9
	self.stances.mosin.steelsight.camera_sensitivity_multiplier = 0.45
	slot93 = -5
	local pivot_head_translation = Vector3(0.45, 7, 31)
	slot94 = -6
	local pivot_head_rotation = Rotation(7, 0, 0)
	slot94 = pivot_shoulder_translation
	slot97 = pivot_shoulder_rotation
	slot95 = pivot_head_rotation
	self.stances.mosin.crouched.shoulders.translation = pivot_head_translation - pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot96)).rotate_with(0, pivot_shoulder_translation.rotate_with(0, pivot_shoulder_rotation.inverse(slot96)))
	slot94 = pivot_shoulder_rotation
	self.stances.mosin.crouched.shoulders.rotation = pivot_head_rotation * pivot_shoulder_rotation.inverse(0)
	slot96 = 0
	self.stances.mosin.crouched.vel_overshot.pivot = pivot_shoulder_translation + Vector3(0, 0, -30)
	slot94 = self.stances.default
	self.stances.m24 = deep_clone(0)
	slot94 = self.stances.default
	self.stances.m3 = deep_clone(0)

	return 
end

return 
