slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementSpawnDeployable then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementSpawnDeployable = slot0
function ElementSpawnDeployable:init(...)
	slot3 = self

	ElementSpawnDeployable.super.init(slot2, ...)

	return 
end
function ElementSpawnDeployable:client_on_executed(...)
	return 
end
function ElementSpawnDeployable:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	if self._values.deployable_id ~= "none" then
		if self._values.deployable_id == "doctor_bag" then
			slot6 = 0

			DoctorBagBase.spawn(slot3, self._values.position, self._values.rotation)
		elseif self._values.deployable_id == "ammo_bag" then
			slot6 = 0

			AmmoBagBase.spawn(slot3, self._values.position, self._values.rotation)
		elseif self._values.deployable_id == "grenade_crate" then
			slot6 = 0

			GrenadeCrateBase.spawn(slot3, self._values.position, self._values.rotation)
		end
	end

	slot5 = instigator

	ElementSpawnDeployable.super.on_executed(slot3, self)

	return 
end

return 
