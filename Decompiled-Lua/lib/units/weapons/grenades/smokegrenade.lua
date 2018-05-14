if not SmokeGrenade then
	slot2 = GrenadeBase
	slot0 = class(slot1)
end

SmokeGrenade = slot0
function SmokeGrenade:init(unit)
	self._init_timer = 1.5
	slot5 = unit

	SmokeGrenade.super.init(slot3, self)

	return 
end
function SmokeGrenade:update(unit, t, dt)
	slot9 = dt

	SmokeGrenade.super.update(slot5, self, unit, t)

	if self._smoke_timer then
		self._smoke_timer = self._smoke_timer - dt

		if self._smoke_timer <= 0 then
			self._smoke_timer = nil
			slot6 = World
			slot7 = self._smoke_effect

			World.effect_manager(slot5).fade_kill(slot5, World.effect_manager(slot5))
		end
	end

	return 
end
function SmokeGrenade:_detonate()
	slot7 = self._unit
	slot7 = self._slotmask
	local units = World.find_units(slot2, World, "sphere", self._unit.position(slot6), 400)
	slot4 = units

	for _, unit in ipairs(World) do
		local col_ray = {}
		slot11 = self._unit
		slot9 = self._unit.position(unit)
		slot10 = unit.position(slot9) - slot9
		col_ray.ray = unit.position(slot9) - slot9.normalized(slot9)
		slot10 = self._unit
		col_ray.position = self._unit.position(slot9)
		slot13 = 10

		self._give_smoke_damage(slot9, self, col_ray, unit)
	end

	return 
end
function SmokeGrenade:_play_sound_and_effects()
	slot3 = World
	slot4 = {
		effect = Idstring(slot6),
		position = self._unit.position(slot6),
		normal = self._unit.rotation(slot6).y(slot6)
	}
	slot7 = "effects/vanilla/explosions/exp_smoke_grenade_001"
	slot7 = self._unit
	slot7 = self._unit

	World.effect_manager(slot2).spawn(slot2, World.effect_manager(slot2))

	slot3 = self._unit
	slot4 = "trip_mine_explode"

	self._unit.sound_source(slot2).post_event(slot2, self._unit.sound_source(slot2))

	local parent = self._unit.orientation_object(slot2)
	slot4 = World
	slot5 = {
		effect = Idstring(self._unit.rotation(slot6)),
		parent = parent
	}
	slot8 = "effects/vanilla/weapons/smoke_grenade_smoke"
	self._smoke_effect = World.effect_manager(self._unit).spawn(self._unit, World.effect_manager(self._unit))
	self._smoke_timer = 10

	return 
end
function SmokeGrenade:_give_smoke_damage(col_ray, unit, damage)
	return 
end
function SmokeGrenade:destroy()
	if self._smoke_effect then
		slot3 = World
		slot4 = self._smoke_effect

		World.effect_manager(slot2).kill(slot2, World.effect_manager(slot2))
	end

	slot3 = self

	SmokeGrenade.super.destroy(slot2)

	return 
end

return 
