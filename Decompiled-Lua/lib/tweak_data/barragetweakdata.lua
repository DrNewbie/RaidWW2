BarrageTweakData = BarrageTweakData or class()
BarrageType = {
	ARTILLERY = 1,
	AIRPLANE = 2,
	RANDOM = 3
}
function BarrageTweakData:init(tweak_data)
	local difficulty = (Global.game_settings and Global.game_settings.difficulty) or Global.DEFAULT_DIFFICULTY
	local difficulty_index = tweak_data.difficulty_to_index(slot4, tweak_data)
	self.default = {
		type = BarrageType.ARTILLERY
	}
	slot9 = -1
	self.default.direction = Vector3(difficulty, -1, 0)
	self.default.distance = 8500
	self.default.projectile_id = "mortar_shell"
	self.default.lauch_power = 20
	self.default.cooldown = {
		120,
		90,
		60
	}
	self.default.initial_delay = 3
	self.default.barrage_launch_sound_delay = 7.5
	self.default.barrage_launch_sound_event = "grenade_launcher"

	if difficulty_index <= TweakData.DIFFICULTY_1 then
		self.default.projectiles_per_minute = {
			40,
			45,
			50
		}
		self.flare_timer = 15
		self.default.area_radius = {
			750,
			900,
			1100
		}
		self.default.duration = {
			20,
			25,
			35
		}
	elseif difficulty_index == TweakData.DIFFICULTY_2 then
		self.default.projectiles_per_minute = {
			45,
			50,
			80
		}
		self.flare_timer = 12
		self.default.area_radius = {
			850,
			1000,
			1250
		}
		self.default.duration = {
			20,
			25,
			35
		}
	elseif difficulty_index == TweakData.DIFFICULTY_3 then
		self.default.projectiles_per_minute = {
			70,
			90,
			120
		}
		self.flare_timer = 10
		self.default.area_radius = {
			950,
			1100,
			1500
		}
		self.default.duration = {
			20,
			25,
			35
		}
	elseif difficulty_index == TweakData.DIFFICULTY_4 then
		self.default.projectiles_per_minute = {
			90,
			140,
			200
		}
		self.flare_timer = 7
		self.default.area_radius = {
			1100,
			1500,
			2500
		}
		self.default.duration = {
			20,
			25,
			35
		}
	end

	self.spotted_arty = clone(slot5)
	slot9 = -1
	self.spotted_arty.direction = Vector3(self.default, 0, 0)
	self.spotted_arty.spotting_rounds = 0
	self.spotted_arty.area_radius = {
		900,
		700,
		800
	}
	self.spotted_arty.spotting_rounds_delay = 5
	self.spotted_arty.spotting_rounds_min_distance = 1000
	self.spotted_arty.initial_delay = 0
	self.spotted_arty.cooldown = {
		60,
		40,
		20
	}
	self.spotted_arty.barrage_launch_sound_delay = 7.5
	self.spotted_arty.barrage_launch_sound_event = "grenade_launcher"
	self.stuka_strafe = {
		type = BarrageType.AIRPLANE
	}
	slot7 = "units/vanilla/vehicles/vhc_junkers_attack/vhc_junkers_attack"
	self.stuka_strafe.airplane_unit = Idstring(self.default)
	self.stuka_strafe.sequence_name = "anim_machinegun_attack"
	self.stuka_strafe.cooldown = {
		5,
		4,
		3
	}
	self.stuka_bomb = {
		type = BarrageType.AIRPLANE
	}
	slot7 = "units/vanilla/vehicles/vhc_junkers_ju87_anim/vhc_junkers_ju87_anim"
	self.stuka_bomb.airplane_unit = Idstring(self.default)
	self.stuka_bomb.sequence_name = "anim_drop_bomb"
	self.stuka_bomb.cooldown = {
		30,
		20,
		10
	}
	self.napalm = {
		type = BarrageType.ARTILLERY
	}
	slot9 = -1
	self.napalm.direction = Vector3(self.default, 0, 0)
	self.napalm.area_radius = {
		1500,
		1200,
		1000
	}
	self.napalm.projectile_id = "molotov"
	self.napalm.lauch_power = 20
	self.napalm.duration = {
		10,
		12,
		15
	}
	self.napalm.projectiles_per_minute = {
		90,
		100,
		120
	}
	self.napalm.cooldown = {
		15,
		12.5,
		10
	}
	self.napalm.initial_delay = 8
	self.napalm.barrage_launch_sound_delay = 7.5
	self.napalm.barrage_launch_sound_event = "grenade_launcher"
	self.cluster = {
		type = BarrageType.ARTILLERY
	}
	slot9 = -1
	self.cluster.direction = Vector3(self.default, 0, 0)
	self.cluster.area_radius = {
		900,
		700,
		800
	}
	self.cluster.projectile_id = "mortar_shell"
	self.cluster.lauch_power = 15
	self.cluster.duration = {
		20,
		25,
		30
	}
	self.cluster.projectiles_per_minute = {
		70,
		70,
		75
	}
	self.cluster.cooldown = {
		45,
		30,
		20
	}
	self.cluster.initial_delay = 8
	self.cluster.barrage_launch_sound_delay = 7.5
	self.cluster.barrage_launch_sound_event = "grenade_launcher"
	self.random = {
		type = BarrageType.RANDOM,
		type_table = {
			cluster = {
				4,
				5,
				8
			},
			stuka_bomb = {
				8,
				4,
				2
			}
		}
	}

	return 
end
function BarrageTweakData:get_barrage_ids()
	local t = {}
	slot4 = tweak_data.barrage

	for id, _ in pairs(slot3) do
		slot9 = tweak_data.barrage[id]

		if type(slot8) == "table" then
			slot10 = id

			table.insert(slot8, t)
		end
	end

	slot4 = t

	table.sort(slot3)

	return t
end

return 
