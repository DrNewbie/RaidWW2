-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not WeaponFlashLight then
	slot2 = WeaponGadgetBase
	slot0 = class(slot1)
end

WeaponFlashLight = slot0
WeaponFlashLight.GADGET_TYPE = "flashlight"
function WeaponFlashLight:init(unit)
	slot5 = unit

	WeaponFlashLight.super.init(slot3, self)

	self._on_event = "gadget_flashlight_on"
	self._off_event = "gadget_flashlight_off"
	slot4 = self._unit
	slot7 = "a_flashlight"
	self._a_flashlight_obj = self._unit.get_object(slot3, Idstring(slot6))
	slot7 = "g_light"
	self._g_light = self._unit.get_object(slot3, Idstring(slot6))
	local texture = "units/lights/spot_light_projection_textures/spotprojection_11_flashlight_df"
	self._light = World.create_light(self._unit, World, "spot|specular|plane_projection")
	self._light_multiplier = 2
	self._current_light_multiplier = self._light_multiplier
	slot6 = 60

	self._light.set_spot_angle_end(self._unit, self._light)

	slot6 = 1000

	self._light.set_far_range(self._unit, self._light)

	slot6 = self._current_light_multiplier

	self._light.set_multiplier(self._unit, self._light)

	slot6 = self._a_flashlight_obj

	self._light.link(self._unit, self._light)

	slot5 = self._light
	slot10 = self._a_flashlight_obj
	slot11 = self._a_flashlight_obj
	slot12 = self._a_flashlight_obj
	slot12 = self._a_flashlight_obj.rotation(self._a_flashlight_obj.rotation(self._a_flashlight_obj.rotation(slot9)))
	slot10 = -self._a_flashlight_obj.rotation(self._a_flashlight_obj.rotation(self._a_flashlight_obj.rotation(slot9))).y(self._a_flashlight_obj.rotation(self._a_flashlight_obj.rotation(slot9)))

	self._light.set_rotation(self._unit, Rotation(texture, self._a_flashlight_obj.rotation(slot9).z(slot9), -self._a_flashlight_obj.rotation(self._a_flashlight_obj.rotation(slot9)).x(self._a_flashlight_obj.rotation(slot9))))

	slot6 = false

	self._light.set_enable(self._unit, self._light)

	local effect_path = "effects/vanilla/weapons/flashlight/fp_flashlight"
	slot6 = World
	slot7 = {
		force_synch = true,
		effect = Idstring(-self._a_flashlight_obj.rotation(self._a_flashlight_obj.rotation(slot9)).x(self._a_flashlight_obj.rotation(slot9))),
		parent = self._a_flashlight_obj
	}
	slot10 = effect_path
	self._light_effect = World.effect_manager(self._light).spawn(self._light, World.effect_manager(self._light))
	slot6 = World
	slot8 = true

	World.effect_manager(self._light).set_hidden(self._light, World.effect_manager(self._light), self._light_effect)

	return 
end
function WeaponFlashLight:set_npc()
	if self._light_effect then
		slot3 = World
		slot4 = self._light_effect

		World.effect_manager(slot2).kill(slot2, World.effect_manager(slot2))
	end

	slot3 = self._unit
	slot6 = "a_flashlight"
	local obj = self._unit.get_object(slot2, Idstring(slot5))
	local effect_path = "effects/vanilla/weapons/flashlight/flashlight"
	slot5 = World
	slot6 = {
		effect = Idstring(slot8),
		parent = obj
	}
	slot9 = effect_path
	self._light_effect = World.effect_manager(Idstring).spawn(Idstring, World.effect_manager(Idstring))
	slot5 = World
	slot7 = true

	World.effect_manager(Idstring).set_hidden(Idstring, World.effect_manager(Idstring), self._light_effect)

	self._is_npc = true

	return 
end
function WeaponFlashLight:_check_state()
	slot3 = self

	WeaponFlashLight.super._check_state(slot2)

	slot4 = self._on

	self._light.set_enable(slot2, self._light)

	slot4 = self._on

	self._g_light.set_visibility(slot2, self._g_light)

	slot3 = World
	slot5 = not self._on

	World.effect_manager(slot2).set_hidden(slot2, World.effect_manager(slot2), self._light_effect)

	if managers.raid_job then
		slot3 = managers.raid_job
		self._is_haunted = managers.raid_job.current_job_id(slot2) == "haunted"
		slot6 = "base"

		self._unit.set_extension_update_enabled(slot2, self._unit, Idstring(self._on))

		return 
	end
end
function WeaponFlashLight:destroy(unit)
	slot5 = unit

	WeaponFlashLight.super.destroy(slot3, self)

	slot4 = self._light

	if alive(slot3) then
		slot5 = self._light

		World.delete_light(slot3, World)
	end

	if self._light_effect then
		slot4 = World
		slot5 = self._light_effect

		World.effect_manager(slot3).kill(slot3, World.effect_manager(slot3))

		self._light_effect = nil
	end

	return 
end
local mvec1 = Vector3()
WeaponFlashLight.HALLOWEEN_FLICKER = 1
WeaponFlashLight.HALLOWEEN_LAUGHTER = 2
WeaponFlashLight.HALLOWEEN_FROZEN = 3
WeaponFlashLight.HALLOWEEN_SPOOC = 4
WeaponFlashLight.HALLOWEEN_WARP = 5
function WeaponFlashLight:sync_net_event(event_id)

	-- Decompilation error in this vicinity:
	slot4 = Application
	local t = Application.time(slot3)

	if event_id == self.HALLOWEEN_FLICKER then
		slot6 = 1
		self._flicker_t = math.random(slot4) + math.rand(3)
	elseif event_id == self.HALLOWEEN_LAUGHTER then
		self._laughter_t = 2
	elseif event_id == self.HALLOWEEN_FROZEN then
		slot5 = World

		World.effect_manager(slot4).set_frozen(slot4, World.effect_manager(slot4), self._light_effect)

		slot5 = self._light
		self._frozen_rotation = self._light.local_rotation(slot4)
		self._frozen_t = t + 4
		slot5 = self._light
		slot8 = self._light

		self._light.set_local_rotation(slot4, self._light.rotation(true))

		slot5 = self._light
		slot8 = self._light

		self._light.set_local_position(slot4, self._light.position(true))

		slot5 = self._light

		self._light.unlink(slot4)
	end

	return 
end
function WeaponFlashLight:update(unit, t, dt)
	slot7 = self._a_flashlight_obj

	self._light.link(slot5, self._light)

	slot6 = self._light
	slot11 = self._a_flashlight_obj
	slot12 = self._a_flashlight_obj
	slot13 = self._a_flashlight_obj
	slot13 = self._a_flashlight_obj.rotation(self._a_flashlight_obj.rotation(self._a_flashlight_obj.rotation(slot10)))
	slot11 = -self._a_flashlight_obj.rotation(self._a_flashlight_obj.rotation(self._a_flashlight_obj.rotation(slot10))).y(self._a_flashlight_obj.rotation(self._a_flashlight_obj.rotation(slot10)))

	self._light.set_rotation(slot5, Rotation(slot8, self._a_flashlight_obj.rotation(slot10).z(slot10), -self._a_flashlight_obj.rotation(self._a_flashlight_obj.rotation(slot10)).x(self._a_flashlight_obj.rotation(slot10))))

	if not self._is_haunted then
		return 
	end

	slot6 = Application
	t = Application.time(slot5)
	self._light_speed = self._light_speed or 1
	slot10 = 4
	self._light_speed = math.step(slot5, self._light_speed, 1)
	slot11 = 0
	slot7 = self._light.rotation(dt * (math.random(slot9) + 2)) * Rotation(self._light, dt * -50 * self._light_speed)

	self._light.set_rotation(slot5, self._light)

	slot8 = dt

	self.update_flicker(slot5, self, t)

	slot8 = dt

	self.update_laughter(slot5, self, t)

	if not self._kittens_timer then
		self._kittens_timer = t + 25
	end

	if self._kittens_timer < t then
		slot6 = 1

		if math.rand(slot5) < 0.75 then
			slot7 = self.HALLOWEEN_FLICKER

			self.run_net_event(slot5, self)

			slot6 = 10
			self._kittens_timer = t + math.random(slot5) + 5
		else
			slot6 = 1

			if math.rand(slot5) < 0.35 then
				slot7 = self.HALLOWEEN_WARP

				self.run_net_event(slot5, self)

				slot6 = 12
				self._kittens_timer = t + math.random(slot5) + 3
			else
				slot6 = 1

				if math.rand(slot5) < 0.25 then
					slot7 = self.HALLOWEEN_LAUGHTER

					self.run_net_event(slot5, self)

					slot6 = 5
					self._kittens_timer = t + math.random(slot5) + 8
				else
					slot6 = 5
					self._kittens_timer = t + math.random(slot5) + 3
				end
			end
		end
	end

	return 
end
function WeaponFlashLight:run_net_event(event_id)
	slot5 = event_id

	self.sync_net_event(slot3, self)

	return 
end
function WeaponFlashLight:update_flicker(t, dt)
	if self._flicker_t then
		slot6 = self._flicker_t - dt
		self._flicker_t = math.max(slot4, 0)

		if 0.15 < self._flicker_t then
			slot8 = 40
			slot7 = 5
			self._current_light_multiplier = math.clamp(slot4, self._current_light_multiplier + (math.rand(slot7) - 20) * dt, 0)
		else
			slot7 = 1 - self._flicker_t * 4
			self._current_light_multiplier = math.lerp(slot4, self._current_light_multiplier, self._light_multiplier)
		end

		slot6 = self._current_light_multiplier

		self._light.set_multiplier(slot4, self._light)

		if self._flicker_t == 0 then
			self._flicker_t = nil
		end
	end

	return 
end
function WeaponFlashLight:update_laughter(t, dt)
	if self._laughter_t then
		slot6 = self._laughter_t - dt
		self._laughter_t = math.max(slot4, 0)
		local math_sin = math.sin(slot4)
		slot9 = 0.7 + math_sin * 0.3

		mvector3.set_static(self._laughter_t * 720, mvec1, 1, 0.6 + math_sin * 0.4)

		slot7 = mvec1

		self._light.set_color(self._laughter_t * 720, self._light)

		slot7 = self._laughter_t * 90
		local math_sin = math.sin(self._laughter_t * 720) * math.sin(self._laughter_t * 720)
		slot8 = self._laughter_t * 90
		local math_cos = math.cos(self._laughter_t * 720) * math.sin(self._laughter_t * 720)
		slot11 = math_sin * 25

		mvector3.set_static(self._laughter_t * 720, mvec1, -math_cos * 25, 0)

		slot9 = mvec1

		self._light.set_local_position(self._laughter_t * 720, self._light)

		if self._laughter_t == 0 then
			self._laughter_t = nil
		end
	end

	return 
end
function WeaponFlashLight:update_frozen(t, dt)
	if self._frozen_t and self._frozen_t <= t then
		slot8 = "a_flashlight"
		local obj = self._unit.get_object(slot4, Idstring(slot7))
		slot6 = World

		World.effect_manager(self._unit).set_frozen(self._unit, World.effect_manager(self._unit), self._light_effect)

		slot7 = self._frozen_rotation

		self._light.set_local_rotation(self._unit, self._light)

		slot6 = self._light
		slot11 = 0

		self._light.set_local_position(self._unit, Vector3(false, 0, 0))

		slot7 = obj

		self._light.link(self._unit, self._light)

		self._frozen_rotation = nil
		self._frozen_t = nil
	end

	return 
end

return 
