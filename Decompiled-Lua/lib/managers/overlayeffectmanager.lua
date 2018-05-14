-- Decompilation Error: _glue_flows(node)

slot3 = "CoreOverlayEffectManager"

core.import(slot1, core)

if not OverlayEffectManager then
	slot2 = CoreOverlayEffectManager.OverlayEffectManager
	slot0 = class(slot1)
end

OverlayEffectManager = slot0
function OverlayEffectManager:init()
	slot3 = self

	OverlayEffectManager.super.init(slot2)

	slot3 = tweak_data.overlay_effects

	for name, setting in pairs(slot2) do
		slot10 = setting

		self.add_preset(slot7, self, name)
	end

	return 
end
slot3 = OverlayEffectManager

CoreClass.override_class(function (self)
	slot3 = self

	OverlayEffectManager.super.init(slot2)

	slot3 = tweak_data.overlay_effects

	for name, setting in pairs(slot2) do
		slot10 = setting

		self.add_preset(slot7, self, name)
	end

	return 
end, CoreOverlayEffectManager.OverlayEffectManager)

return 
