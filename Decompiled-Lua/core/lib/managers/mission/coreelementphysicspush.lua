slot3 = "CoreElementPhysicsPush"

core.module(slot1, core)

slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementPhysicsPush then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementPhysicsPush = slot0
slot3 = "core/physic_effects/hubelement_push"
ElementPhysicsPush.IDS_EFFECT = Idstring(slot2)
function ElementPhysicsPush:client_on_executed(...)
	slot3 = self

	self.on_executed(slot2, ...)

	return 
end
function ElementPhysicsPush:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	slot9 = self._values.physicspush_mass

	World.play_physic_effect(slot3, World, self.IDS_EFFECT, self._values.position, self._values.physicspush_range, self._values.physicspush_velocity)

	slot5 = instigator

	ElementPhysicsPush.super.on_executed(slot3, self)

	return 
end

return 
