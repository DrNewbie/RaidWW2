if not FlashGrenade then
	slot2 = GrenadeBase
	slot0 = class(slot1)
end

FlashGrenade = slot0
function FlashGrenade:init(unit)
	self._init_timer = 1
	slot5 = unit

	FlashGrenade.super.init(slot3, self)

	return 
end
function FlashGrenade:_detonate()
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

		self._give_flash_damage(slot9, self, col_ray, unit)
	end

	slot5 = 0

	self._unit.set_slot(slot3, self._unit)

	return 
end
function FlashGrenade:_play_sound_and_effects()
	slot3 = World
	slot4 = {
		effect = Idstring(slot6),
		position = self._unit.position(slot6),
		normal = self._unit.rotation(slot6).y(slot6)
	}
	slot7 = "effects/particles/explosions/explosion_flash_grenade"
	slot7 = self._unit
	slot7 = self._unit
	slot7 = self._unit.rotation(slot6)

	World.effect_manager(slot2).spawn(slot2, World.effect_manager(slot2))

	slot3 = self._unit
	slot4 = "trip_mine_explode"

	self._unit.sound_source(slot2).post_event(slot2, self._unit.sound_source(slot2))

	return 
end
function FlashGrenade:_give_flash_damage(col_ray, unit, damage)
	return 
end

return 
