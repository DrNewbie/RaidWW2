-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not AkimboWeaponBase then
	slot2 = NewRaycastWeaponBase
	slot0 = class(slot1)
end

AkimboWeaponBase = slot0
AkimboWeaponBase.AKIMBO = true
function AkimboWeaponBase:init(...)
	slot3 = self

	AkimboWeaponBase.super.init(slot2, ...)

	slot3 = self
	self._manual_fire_second_gun = self.weapon_tweak_data(slot2).manual_fire_second_gun

	return 
end
function AkimboWeaponBase:_create_second_gun()
	local factory_weapon = tweak_data.weapon.factory[self._factory_id]
	local ids_unit_name = Idstring(slot3)
	slot7 = Vector3()
	local new_unit = World.spawn_unit(factory_weapon.unit, World, ids_unit_name, Rotation())
	slot6 = new_unit
	slot7 = self._factory_id

	new_unit.base(World).set_factory_data(World, new_unit.base(World))

	if self._cosmetics_id then
		slot6 = new_unit
		slot7 = {
			id = self._cosmetics_id,
			quality = self._cosmetics_quality,
			bonus = self._cosmetics_bonus
		}

		new_unit.base(slot5).set_cosmetics_data(slot5, new_unit.base(slot5))
	end

	if self._blueprint then
		slot6 = new_unit
		slot8 = self._blueprint

		new_unit.base(slot5).assemble_from_blueprint(slot5, new_unit.base(slot5), self._factory_id)
	else
		slot6 = new_unit
		slot7 = self._factory_id

		new_unit.base(slot5).assemble(slot5, new_unit.base(slot5))
	end

	self._second_gun = new_unit
	slot6 = self._second_gun
	self._second_gun.base(slot5).SKIP_AMMO = true
	slot6 = self._second_gun
	self._second_gun.base(true).parent_weapon = self._unit
	slot6 = new_unit
	slot7 = self._setup

	new_unit.base(self._unit).setup(self._unit, new_unit.base(self._unit))

	if self._enabled then
		slot6 = self._second_gun
		slot6 = self._second_gun.base(slot5)

		self._second_gun.base(slot5).on_enabled(slot5)
	else
		slot6 = self._second_gun
		slot6 = self._second_gun.base(slot5)

		self._second_gun.base(slot5).on_disabled(slot5)
	end

	return 
end
function AkimboWeaponBase:create_second_gun()
	slot3 = self

	self._create_second_gun(slot2)

	slot3 = self._setup.user_unit
	slot6 = "a_weapon_left"
	slot5 = self._second_gun
	slot8 = self._second_gun
	slot8 = self._second_gun.orientation_object(slot7)

	self._setup.user_unit.camera(slot2)._camera_unit.link(slot2, self._setup.user_unit.camera(slot2)._camera_unit, Idstring(slot5), self._second_gun.orientation_object(slot7).name(slot7))

	return 
end
function AkimboWeaponBase:fire(...)
	if not self._manual_fire_second_gun then
		local result = AkimboWeaponBase.super.fire(slot2, ...)
		slot4 = self._second_gun

		if alive(self) then
			slot11 = {
				...
			}
			slot9 = TimerManager
			slot10 = 0.075
			slot7 = TimerManager.game(self).time(self) + 0.025 + math.rand(TimerManager.game(self))

			managers.enemy.add_delayed_clbk(slot3, managers.enemy, "AkimboWeaponBase", callback(slot7, self, self, "_fire_second"))
		end

		return result
	else
		local result = nil

		if self._fire_second_gun_next then
			slot4 = self._second_gun

			if alive(slot3) then
				slot4 = self._second_gun
				slot6 = self._second_gun
				slot4 = self._second_gun.base(slot5)
				result = self._second_gun.base(slot3).super.fire(slot3, ...)

				if result then
					slot4 = self._second_gun
					slot4 = self._second_gun.base(slot3)

					self._second_gun.base(slot3)._fire_sound(slot3)

					slot5 = self.selection_index(slot6)
					slot8 = self

					managers.hud.set_ammo_amount(slot3, managers.hud, self.ammo_info(self))

					slot4 = self._second_gun
					slot5 = "fire"

					self._second_gun.base(slot3).tweak_data_anim_play(slot3, self._second_gun.base(slot3))
				end
			end

			self._fire_second_gun_next = false
		else
			slot4 = self
			result = AkimboWeaponBase.super.fire(slot3, ...)
			self._fire_second_gun_next = true
		end

		return result
	end

	return 
end
function AkimboWeaponBase:_fire_second(params)
	slot4 = self._second_gun

	if alive(slot3) and self._setup then
		slot4 = self._setup.user_unit

		if alive(slot3) then
			slot4 = self._second_gun
			slot4 = self._second_gun.base(slot5)
			slot7 = params
			local fired = self._second_gun.base(slot3).super.fire(slot3, unpack(self._second_gun))

			if fired then
				slot5 = self._second_gun
				slot5 = self._second_gun.base(slot4)

				self._second_gun.base(slot4)._fire_sound(slot4)

				slot6 = self.selection_index(slot7)
				slot9 = self

				managers.hud.set_ammo_amount(slot4, managers.hud, self.ammo_info(self))

				slot5 = self._second_gun
				slot6 = "fire"

				self._second_gun.base(slot4).tweak_data_anim_play(slot4, self._second_gun.base(slot4))
			end

			return fired
		end
	end

	return 
end
function AkimboWeaponBase:on_enabled(...)
	slot3 = self

	AkimboWeaponBase.super.on_enabled(slot2, ...)

	slot3 = self._second_gun

	if alive(slot2) then
		slot3 = self._second_gun
		slot3 = self._second_gun.base(slot2)

		self._second_gun.base(slot2).on_enabled(slot2, ...)
	end

	return 
end
function AkimboWeaponBase:on_disabled(...)
	slot3 = self

	AkimboWeaponBase.super.on_disabled(slot2, ...)

	slot3 = self._second_gun

	if alive(slot2) then
		slot3 = self._second_gun
		slot3 = self._second_gun.base(slot2)

		self._second_gun.base(slot2).on_disabled(slot2, ...)
	end

	return 
end
function AkimboWeaponBase:set_gadget_on(...)
	slot3 = self

	AkimboWeaponBase.super.set_gadget_on(slot2, ...)

	slot3 = self._second_gun

	if alive(slot2) then
		slot3 = self._second_gun
		slot3 = self._second_gun.base(slot2)

		self._second_gun.base(slot2).set_gadget_on(slot2, ...)
	end

	return 
end
function AkimboWeaponBase:_second_gun_tweak_data_anim_version(anim)
	slot4 = self

	if not self.weapon_tweak_data(slot3).animations.second_gun_versions then
		return anim
	end

	slot4 = self

	return self.weapon_tweak_data(slot3).animations.second_gun_versions[anim] or anim
end
function AkimboWeaponBase:tweak_data_anim_play(anim, ...)
	slot4 = self._second_gun

	if alive(slot3) and anim ~= "fire" then
		slot5 = anim
		local second_gun_anim = self._second_gun_tweak_data_anim_version(slot3, self)
		slot5 = self._second_gun
		slot6 = second_gun_anim

		self._second_gun.base(self).tweak_data_anim_play(self, self._second_gun.base(self), ...)
	end

	slot5 = anim

	return AkimboWeaponBase.super.tweak_data_anim_play(slot3, self, ...)
end
function AkimboWeaponBase:tweak_data_anim_stop(anim, ...)
	slot5 = anim

	AkimboWeaponBase.super.tweak_data_anim_stop(slot3, self, ...)

	slot4 = self._second_gun

	if alive(slot3) then
		slot5 = anim
		local second_gun_anim = self._second_gun_tweak_data_anim_version(slot3, self)
		slot5 = self._second_gun
		slot6 = second_gun_anim

		self._second_gun.base(self).tweak_data_anim_stop(self, self._second_gun.base(self), ...)
	end

	return 
end
function AkimboWeaponBase:destroy(...)
	slot3 = self

	AkimboWeaponBase.super.destroy(slot2, ...)

	slot3 = self._second_gun

	if alive(slot2) then
		slot4 = 0

		self._second_gun.set_slot(slot2, self._second_gun)
	end

	return 
end

if not NPCAkimboWeaponBase then
	slot2 = NewNPCRaycastWeaponBase
	slot0 = class(slot1)
end

NPCAkimboWeaponBase = slot0
NPCAkimboWeaponBase.AKIMBO = true
function NPCAkimboWeaponBase:init(...)
	slot3 = self

	NPCAkimboWeaponBase.super.init(slot2, ...)

	slot3 = self
	self._manual_fire_second_gun = self.weapon_tweak_data(slot2).manual_fire_second_gun

	return 
end
function NPCAkimboWeaponBase:create_second_gun()
	slot3 = self

	AkimboWeaponBase._create_second_gun(slot2)

	slot6 = "a_weapon_left_front"
	slot5 = self._second_gun
	slot8 = self._second_gun
	slot8 = self._second_gun.orientation_object(slot7)

	self._setup.user_unit.link(slot2, self._setup.user_unit, Idstring(slot5), self._second_gun.orientation_object(slot7).name(slot7))

	return 
end
function NPCAkimboWeaponBase:fire_blank(...)
	if not self._manual_fire_second_gun then
		slot3 = self

		NPCAkimboWeaponBase.super.fire_blank(slot2, ...)

		slot3 = self._second_gun

		if alive(slot2) then

			-- Decompilation error in this vicinity:
			slot3 = self._setup.user_unit
			slot3 = self._setup.user_unit.movement(slot2)
			slot10 = {
				...
			}
			slot8 = TimerManager
			slot9 = 0.075
			slot6 = TimerManager.game(self).time(self) + 0.025 + math.rand(TimerManager.game(self))

			managers.enemy.add_delayed_clbk(slot2, managers.enemy, "NPCAkimboWeaponBase", callback(slot6, self, self, "_fire_blank_second"))
		end
	elseif self._fire_second_gun_next then
		slot3 = self._second_gun

		if alive(slot2) then
			slot3 = self._setup.user_unit

			if alive(slot2) then
				slot3 = self._second_gun
				slot3 = self._second_gun.base(slot2)

				self._second_gun.base(slot2).fire_blank(slot2, ...)
			end
		end

		self._fire_second_gun_next = false
	else
		slot3 = self

		NPCAkimboWeaponBase.super.fire_blank(slot2, ...)

		self._fire_second_gun_next = true
	end

	return 
end
function NPCAkimboWeaponBase:_fire_blank_second(params)
	slot4 = self._second_gun

	if alive(slot3) then
		slot4 = self._setup.user_unit

		if alive(slot3) then
			slot4 = self._second_gun
			slot4 = self._second_gun.base(slot3)
			slot7 = params

			self._second_gun.base(slot3).fire_blank(slot3, unpack(slot6))
		end
	end

	return 
end
function NPCAkimboWeaponBase:on_enabled(...)
	slot3 = self

	NPCAkimboWeaponBase.super.on_enabled(slot2, ...)

	slot3 = self._second_gun

	if alive(slot2) then
		slot3 = self._second_gun
		slot3 = self._second_gun.base(slot2)

		self._second_gun.base(slot2).on_enabled(slot2, ...)
	end

	return 
end
function NPCAkimboWeaponBase:on_disabled(...)
	slot3 = self

	NPCAkimboWeaponBase.super.on_disabled(slot2, ...)

	slot3 = self._second_gun

	if alive(slot2) then
		slot3 = self._second_gun
		slot3 = self._second_gun.base(slot2)

		self._second_gun.base(slot2).on_disabled(slot2, ...)
	end

	return 
end
function NPCAkimboWeaponBase:on_melee_item_shown()
	slot3 = self._second_gun

	if alive(slot2) then
		slot3 = self._second_gun
		slot3 = self._second_gun.base(slot2)

		self._second_gun.base(slot2).on_disabled(slot2)
	end

	return 
end
function NPCAkimboWeaponBase:on_melee_item_hidden()
	slot3 = self._second_gun

	if alive(slot2) then
		slot3 = self._second_gun
		slot3 = self._second_gun.base(slot2)

		self._second_gun.base(slot2).on_enabled(slot2)

		slot3 = self._second_gun
		slot3 = self._second_gun.base(slot2)
		slot6 = self

		self._second_gun.base(slot2).set_gadget_on(slot2, self.is_gadget_on(slot5))
	end

	return 
end
function NPCAkimboWeaponBase:set_gadget_on(...)
	slot3 = self

	NPCAkimboWeaponBase.super.set_gadget_on(slot2, ...)

	slot3 = self._second_gun

	if alive(slot2) then
		slot3 = self._second_gun
		slot3 = self._second_gun.base(slot2)

		self._second_gun.base(slot2).set_gadget_on(slot2, ...)
	end

	return 
end
function NPCAkimboWeaponBase:destroy(...)
	slot3 = self

	NPCAkimboWeaponBase.super.destroy(slot2, ...)

	slot3 = self._second_gun

	if alive(slot2) then
		slot4 = 0

		self._second_gun.set_slot(slot2, self._second_gun)
	end

	return 
end

return 
