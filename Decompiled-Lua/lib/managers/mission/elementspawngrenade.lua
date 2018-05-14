slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementSpawnGrenade then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementSpawnGrenade = slot0
function ElementSpawnGrenade:init(...)
	slot3 = self

	ElementSpawnGrenade.super.init(slot2, ...)

	return 
end
function ElementSpawnGrenade:client_on_executed(...)
	return 
end
function ElementSpawnGrenade:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	slot5 = self._values.grenade_type
	local index = tweak_data.blackmarket.get_index_from_projectile_id(slot3, tweak_data.blackmarket)

	if not index then
		slot7 = self._values.grenade_type

		Application.error(slot4, Application, "Trying to spawn an unknown projectile type: ")

		return 
	end

	slot7 = self._values.spawn_dir * self._values.strength

	ProjectileBase.throw_projectile(slot4, index, self._values.position)

	slot6 = instigator

	ElementSpawnGrenade.super.on_executed(slot4, self)

	return 
end

return 
