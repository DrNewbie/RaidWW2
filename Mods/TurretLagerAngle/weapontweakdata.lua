Hooks:Post(WeaponTweakData, "init", "Post.WeaponTweakData.init", function(self)
	self.turret_m2.MAX_VEL_SPIN = 179
	self.turret_m2.MIN_VEL_SPIN = -179
	
	self.turret_m2.MAX_VEL_PITCH = 179
	self.turret_m2.MIN_VEL_PITCH = -179
	
	self.turret_m2.MAX_TARGETING_PITCH = 179
	self.turret_m2.MIN_TARGETING_PITCH = -179
	
	self.turret_m2.MAX_TARGETING_SPIN = 179
	self.turret_m2.MIN_TARGETING_SPIN = -179
	
	self.turret_m2.MAX_PITCH_ANGLE = 179
	self.turret_m2.MIN_PITCH_ANGLE = -179
	
	self.turret_m2.MAX_SPIN_ANGLE = 179
	self.turret_m2.MIN_SPIN_ANGLE = -179
	
	self.turret_m2.ACC_PITCH = 179
	self.turret_m2.ACC_SPIN = 179
	
	self.turret_m2.camera_limit_vertical = 360
	self.turret_m2.camera_limit_horizontal = 360	
end)