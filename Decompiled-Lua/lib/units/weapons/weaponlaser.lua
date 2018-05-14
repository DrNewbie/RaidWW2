-- Decompilation Error: _run_step(_unwarp_expressions, node)

-- Decompilation Error: _glue_flows(node)

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
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not WeaponLaser then
	slot2 = WeaponGadgetBase
	slot0 = class(slot1)
end

WeaponLaser = slot0
WeaponLaser.GADGET_TYPE = "laser"
function WeaponLaser:init(unit)
	slot5 = unit

	WeaponLaser.super.init(slot3, self)

	self._on_event = "gadget_laser_aim_on"
	self._off_event = "gadget_laser_aim_off"
	local obj = self._unit.get_object(slot3, Idstring(slot6))
	self._laser_obj = obj
	self._max_distance = 3000
	self._scale_distance = 1000
	slot5 = self._unit
	slot8 = "g_laser"
	self._g_laser = self._unit.get_object(self._unit, Idstring("a_laser"))
	slot5 = self._unit
	slot8 = "g_indicator"
	self._g_indicator = self._unit.get_object(self._unit, Idstring("a_laser"))
	self._spot_angle_end = 0
	slot6 = "spot|specular"
	self._light = World.create_light(self._unit, World)
	slot6 = 3

	self._light.set_spot_angle_end(self._unit, self._light)

	slot6 = 75

	self._light.set_far_range(self._unit, self._light)

	slot6 = 40

	self._light.set_near_range(self._unit, self._light)

	slot6 = obj

	self._light.link(self._unit, self._light)

	slot5 = self._light
	slot10 = obj
	slot11 = obj
	slot12 = obj
	slot12 = obj.rotation(obj.rotation(obj.rotation(slot9)))
	slot10 = -obj.rotation(obj.rotation(obj.rotation(slot9))).y(obj.rotation(obj.rotation(slot9)))

	self._light.set_rotation(self._unit, Rotation("a_laser", obj.rotation(slot9).z(slot9), -obj.rotation(obj.rotation(slot9)).x(obj.rotation(slot9))))

	slot9 = 0
	slot9 = 0
	slot10 = 0
	slot9 = 0
	slot9 = 0
	slot10 = 0
	slot9 = 0
	slot9 = 0
	slot10 = 0
	slot9 = 0
	slot9 = 0
	slot10 = 0
	slot9 = 0
	slot9 = 0
	slot10 = 0
	self._themes = {
		default = {
			light = Vector3(Rotation, 0, 10),
			glow = Vector3(Rotation, 0, 0.2),
			brush = Color(Rotation, 0.05, 0, 1)
		},
		cop_sniper = {
			light = Vector3(Rotation, 10, 0),
			glow = Vector3(Rotation, 0.2, 0),
			brush = Color(Rotation, 0.15, 1, 0)
		},
		turret_module_active = {
			light = Vector3(Rotation, 10, 0),
			glow = Vector3(Rotation, 0.2, 0),
			brush = Color(Rotation, 0.15, 1, 0)
		},
		turret_module_rearming = {
			light = Vector3(Rotation, 10, 0),
			glow = Vector3(Rotation, 0.2, 0.2),
			brush = Color(Rotation, 0.11, 1, 1)
		},
		turret_module_mad = {
			light = Vector3(Rotation, 10, 0),
			glow = Vector3(Rotation, 0, 0.2),
			brush = Color(Rotation, 0.15, 0, 1)
		}
	}
	self._theme_type = "default"
	self._light_color = Vector3()
	slot6 = self._themes[self._theme_type].light

	mvector3.set(, self._light_color)

	slot6 = self._light_color

	self._light.set_color(, self._light)

	slot6 = false

	self._light.set_enable(, self._light)

	slot6 = "spot|specular"
	self._light_glow = World.create_light(, World)
	slot6 = 20

	self._light_glow.set_spot_angle_end(, self._light_glow)

	slot6 = 75

	self._light_glow.set_far_range(, self._light_glow)

	slot6 = 40

	self._light_glow.set_near_range(, self._light_glow)

	self._light_glow_color = Vector3()
	slot6 = self._themes[self._theme_type].glow

	mvector3.set(, self._light_color)

	slot6 = self._light_glow_color

	self._light_glow.set_color(, self._light_glow)

	slot6 = false

	self._light_glow.set_enable(, self._light_glow)

	slot6 = obj

	self._light_glow.link(, self._light_glow)

	slot5 = self._light_glow
	slot10 = obj
	slot11 = obj
	slot12 = obj
	slot12 = obj.rotation(obj.rotation(obj.rotation(1)))
	slot10 = -obj.rotation(obj.rotation(obj.rotation(1))).y(obj.rotation(obj.rotation(1)))

	self._light_glow.set_rotation(, Rotation(self._theme_type, obj.rotation(1).z(1), -obj.rotation(obj.rotation(1)).x(obj.rotation(1))))

	slot6 = "bullet_impact_targets"
	self._slotmask = managers.slot.get_mask(, managers.slot)
	slot6 = self._themes[self._theme_type].brush
	self._brush = Draw.brush(, Draw)
	slot6 = "opacity_add"

	self._brush.set_blend_mode(, self._brush)

	return 
end
local mvec1 = Vector3()
local mvec2 = Vector3()
local mvec_l_dir = Vector3()
function WeaponLaser:update(unit, t, dt)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-44, warpins: 1 ---
	slot8 = self._laser_obj
	slot7 = mvec_l_dir

	mrotation.y(slot5, self._laser_obj.rotation(mvec_l_dir))

	local from = mvec1
	slot10 = self._laser_obj

	mvector3.set(self._laser_obj.rotation(mvec_l_dir), self._laser_obj.position(slot9))

	local to = mvec2
	slot9 = mvec_l_dir

	mvector3.set(from, to)

	slot9 = self._max_distance

	mvector3.multiply(from, to)

	slot9 = from

	mvector3.add(from, to)

	slot8 = self._unit
	slot6 = self._unit.raycast
	slot9 = "ray"
	slot10 = from
	slot11 = to
	slot12 = "slot_mask"
	slot13 = self._slotmask
	slot14 = (self._ray_ignore_units and "ignore_unit") or nil
	slot15 = self._ray_ignore_units
	local ray = slot6(slot7, slot8, slot9, slot10, slot11, slot12, slot13, slot14)
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #1 45-46, warpins: 1 ---
	slot14 = "ignore_unit"

	if "ignore_unit" then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 47-47, warpins: 1 ---
		slot14 = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 48-51, warpins: 2 ---
	if ray then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 52-54, warpins: 1 ---
		if not self._is_npc then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 55-105, warpins: 1 ---
			slot10 = self._spot_angle_end

			self._light.set_spot_angle_end(slot8, self._light)

			self._spot_angle_end = math.lerp(slot8, 1, 18)
			slot9 = self._light_glow
			slot14 = ray.distance / self._max_distance

			self._light_glow.set_spot_angle_end(slot8, math.lerp(ray.distance / self._max_distance, 8, 80))

			slot11 = self._max_distance
			local scale = (math.clamp(slot8, ray.distance, self._max_distance - self._scale_distance) - self._max_distance - self._scale_distance) / self._scale_distance
			scale = 1 - scale
			slot11 = scale

			self._light.set_multiplier(self._scale_distance, self._light)

			slot11 = scale * 0.1

			self._light_glow.set_multiplier(self._scale_distance, self._light_glow)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 106-113, warpins: 2 ---
		slot12 = (self._is_npc and 0.5) or 0.25

		self._brush.cylinder(slot8, self._brush, ray.position, from)

		local pos = mvec1
		slot11 = mvec_l_dir

		mvector3.set(self._brush, pos)

		slot11 = 50

		mvector3.multiply(self._brush, pos)

		slot10 = pos

		mvector3.negate(self._brush)

		slot11 = ray.position

		mvector3.add(self._brush, pos)

		slot11 = pos

		self._light.set_final_position(self._brush, self._light)

		slot11 = pos

		self._light_glow.set_final_position(self._brush, self._light_glow)

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #2 114-115, warpins: 1 ---
		slot12 = 0.5

		if 0.5 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 116-116, warpins: 1 ---
			slot12 = 0.25
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 117-148, warpins: 2 ---
		--- END OF BLOCK #3 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 149-166, warpins: 1 ---
		slot10 = to

		self._light.set_final_position(slot8, self._light)

		slot10 = to

		self._light_glow.set_final_position(slot8, self._light_glow)

		slot12 = (self._is_npc and 0.5) or 0.25

		self._brush.cylinder(slot8, self._brush, from, to)

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #1 167-168, warpins: 1 ---
		slot12 = 0.5

		if 0.5 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 169-169, warpins: 1 ---
			slot12 = 0.25
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 170-170, warpins: 2 ---
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 171-171, warpins: 2 ---
	return 
	--- END OF BLOCK #3 ---



end
function WeaponLaser:_check_state()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-34, warpins: 1 ---
	slot3 = self

	WeaponLaser.super._check_state(slot2)

	slot4 = self._on

	self._light.set_enable(slot2, self._light)

	slot4 = self._on

	self._light_glow.set_enable(slot2, self._light_glow)

	slot4 = self._on

	self._g_laser.set_visibility(slot2, self._g_laser)

	slot4 = self._on

	self._g_indicator.set_visibility(slot2, self._g_indicator)

	slot6 = "base"
	slot5 = self._on

	self._unit.set_extension_update_enabled(slot2, self._unit, Idstring(slot5))

	return 
	--- END OF BLOCK #0 ---



end
function WeaponLaser:set_npc()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	self._is_npc = true

	return 
	--- END OF BLOCK #0 ---



end
function WeaponLaser:destroy(unit)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-11, warpins: 1 ---
	slot5 = unit

	WeaponLaser.super.destroy(slot3, self)

	slot4 = self._light

	if alive(slot3) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 12-16, warpins: 1 ---
		slot5 = self._light

		World.delete_light(slot3, World)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 17-21, warpins: 2 ---
	slot4 = self._light_glow

	if alive(slot3) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 22-26, warpins: 1 ---
		slot5 = self._light_glow

		World.delete_light(slot3, World)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 27-27, warpins: 2 ---
	return 
	--- END OF BLOCK #2 ---



end
function WeaponLaser:set_color_by_theme(type)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	self._theme_type = type

	if not self._themes[type] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-7, warpins: 1 ---
		local theme = self._themes.default
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-33, warpins: 2 ---
	slot6 = theme.light

	mvector3.set(slot4, self._light_color)

	slot6 = self._light_color

	self._light.set_color(slot4, self._light)

	slot6 = theme.glow

	mvector3.set(slot4, self._light_glow_color)

	slot6 = self._light_glow_color

	self._light_glow.set_color(slot4, self._light_glow)

	slot6 = theme.brush

	self._brush.set_color(slot4, self._brush)

	return 
	--- END OF BLOCK #1 ---



end
function WeaponLaser:theme_type()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	return self._theme_type
	--- END OF BLOCK #0 ---



end
function WeaponLaser:set_color(color)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-34, warpins: 1 ---
	slot6 = color.b * 10
	self._light_color = Vector3(slot3, color.r * 10, color.g * 10)
	slot5 = self._light_color

	self._light.set_color(slot3, self._light)

	slot6 = color.b * 0.2
	self._light_glow_color = Vector3(slot3, color.r * 0.2, color.g * 0.2)
	slot5 = self._light_glow_color

	self._light_glow.set_color(slot3, self._light_glow)

	slot5 = color

	self._brush.set_color(slot3, self._brush)

	return 
	--- END OF BLOCK #0 ---



end
function WeaponLaser:set_max_distace(dis)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	self._max_distance = dis

	return 
	--- END OF BLOCK #0 ---



end
function WeaponLaser:add_ray_ignore_unit(unit)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if not self._ray_ignore_units then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-4, warpins: 1 ---
		slot2 = {}
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-11, warpins: 2 ---
	self._ray_ignore_units = slot2
	slot5 = unit

	table.insert(slot3, self._ray_ignore_units)

	return 
	--- END OF BLOCK #1 ---



end

return 
