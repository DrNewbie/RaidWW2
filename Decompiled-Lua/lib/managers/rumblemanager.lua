-- Decompilation Error: _glue_flows(node)

slot3 = "RumbleManager"

core.module(slot1, core)

slot3 = "CoreRumbleManager"

core.import(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

if not RumbleManager then
	slot2 = CoreRumbleManager.RumbleManager
	slot0 = class(slot1)
end

RumbleManager = slot0
function RumbleManager:init()
	slot3 = self

	RumbleManager.super.init(slot2)

	slot4 = self
	slot9 = "setup_preset_rumbles"

	_G.tweak_data.add_reload_callback(slot2, _G.tweak_data, callback(slot6, self, self))

	slot3 = self

	self.setup_preset_rumbles(slot2)

	return 
end
function RumbleManager:setup_preset_rumbles()
	slot5 = {
		sustain = 0.1,
		peak = 0.5,
		release = 0.05,
		cumulative = false,
		engine = "both"
	}

	self.add_preset_rumbles(slot2, self, "weapon_fire")

	slot5 = {
		sustain = 0.1,
		peak = 0.5,
		release = 0.1,
		cumulative = false,
		engine = "both"
	}

	self.add_preset_rumbles(slot2, self, "land")

	slot5 = {
		sustain = 0.3,
		peak = 1,
		release = 0.1,
		cumulative = false,
		engine = "both"
	}

	self.add_preset_rumbles(slot2, self, "hard_land")

	slot5 = {
		peak = 0.5,
		engine = "both",
		release = 0.05,
		cumulative = false
	}

	self.add_preset_rumbles(slot2, self, "electrified")

	slot5 = {
		sustain = 0.2,
		peak = 1,
		release = 0.1,
		cumulative = true,
		engine = "both"
	}

	self.add_preset_rumbles(slot2, self, "electric_shock")

	slot5 = {
		sustain = 0.2,
		peak = 0.75,
		release = 0.1,
		cumulative = true,
		engine = "both"
	}

	self.add_preset_rumbles(slot2, self, "incapacitated_shock")

	slot5 = {
		sustain = 0.2,
		peak = 1,
		release = 0,
		cumulative = true,
		engine = "both"
	}

	self.add_preset_rumbles(slot2, self, "damage_bullet")

	slot5 = {
		sustain = 0.1,
		peak = 0.5,
		release = 0,
		cumulative = true,
		engine = "both"
	}

	self.add_preset_rumbles(slot2, self, "damage_bullet_turret")

	slot5 = {
		sustain = 0.075,
		peak = 1,
		release = 0,
		cumulative = true,
		engine = "both"
	}

	self.add_preset_rumbles(slot2, self, "bullet_whizby")

	slot5 = {
		sustain = 0.15,
		peak = 1,
		release = 0,
		cumulative = true,
		engine = "both"
	}

	self.add_preset_rumbles(slot2, self, "melee_hit")

	slot5 = {
		sustain = 0.3,
		engine = "both",
		release = 2.1,
		cumulative = true,
		attack = 0.1,
		peak = 1
	}

	self.add_preset_rumbles(slot2, self, "mission_triggered")

	return 
end
slot3 = RumbleManager

CoreClass.override_class(function (self)
	slot5 = 

	self.add_preset_rumbles(slot2, self, "weapon_fire")

	slot5 = 

	self.add_preset_rumbles(slot2, self, "land")

	slot5 = 

	self.add_preset_rumbles(slot2, self, "hard_land")

	slot5 = 

	self.add_preset_rumbles(slot2, self, "electrified")

	slot5 = 

	self.add_preset_rumbles(slot2, self, "electric_shock")

	slot5 = 

	self.add_preset_rumbles(slot2, self, "incapacitated_shock")

	slot5 = 

	self.add_preset_rumbles(slot2, self, "damage_bullet")

	slot5 = 

	self.add_preset_rumbles(slot2, self, "damage_bullet_turret")

	slot5 = 

	self.add_preset_rumbles(slot2, self, "bullet_whizby")

	slot5 = 

	self.add_preset_rumbles(slot2, self, "melee_hit")

	slot5 = 

	self.add_preset_rumbles(slot2, self, "mission_triggered")

	return 
end, CoreRumbleManager.RumbleManager)

return 
