local HookAddBulletTrail = NewRaycastWeaponBase.fire
local idstr_trail = Idstring("trail")
local idstr_simulator_length = Idstring("simulator_length")
local idstr_size = Idstring("size")

function NewRaycastWeaponBase:fire(from_pos, direction, ...)
	local allow = {
		BulletTrailGKey.Options:GetValue("Secondary"),
		BulletTrailGKey.Options:GetValue("Primary")
	}
	if allow[tweak_data.weapon[self._name_id].use_data.selection_index] then
		self.TRAIL_EFFECT = Idstring("effects/vanilla/weapons/sniper_trail")
		self._trail_effect_table = {
			effect = self.TRAIL_EFFECT,
			position = Vector3(),
			normal = Vector3()
		}
		self._trail_length = World:effect_manager():get_initial_simulator_var_vector2(self.TRAIL_EFFECT, idstr_trail, idstr_simulator_length, idstr_size)
		local col_ray = {
			distance = 1000
		}
		local _spawn_trail_effect = function(them, direction, col_ray)
			them._obj_fire:m_position(them._trail_effect_table.position)
			mvector3.set(them._trail_effect_table.normal, direction)
			local trail = World:effect_manager():spawn(them._trail_effect_table)
			if col_ray then
				mvector3.set_y(them._trail_length, col_ray.distance)
				World:effect_manager():set_simulator_var_vector2(trail, idstr_trail, idstr_simulator_length, idstr_size, them._trail_length)
			end
		end
		_spawn_trail_effect(self, direction, col_ray)
	end
	return HookAddBulletTrail(self, from_pos, direction, ...)
end