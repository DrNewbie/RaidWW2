Hooks:PostHook(NewShotgunBase, "init", "F_"..Idstring("Post.NewShotgunBase.init.BarrageBomb"):key(), function(self)
	if tostring(self._name_id) == 'shotty' then
		self._enable_barragebomb = true
	end
end)

local BarrageBomb = tweak_data.blackmarket:get_index_from_projectile_id(tweak_data.barrage.default.projectile_id)

local BarrageBombPostNewShotgunBase_fire_raycast = NewShotgunBase._fire_raycast

function NewShotgunBase:_fire_raycast(user_unit, from_pos, direction, ...)
	if self._enable_barragebomb then
		call_on_next_update(function ()
			if Network:is_client() then
				managers.network:session():send_to_host("request_throw_projectile", BarrageBomb, from_pos, direction, managers.network:session():local_peer():id() or 1)
			else
				ProjectileBase.throw_projectile(BarrageBomb, from_pos, direction, managers.network:session():local_peer():id() or 1)
			end
		end)
		return {}
	end
	return BarrageBombPostNewShotgunBase_fire_raycast(self, user_unit, from_pos, direction, ...)
end