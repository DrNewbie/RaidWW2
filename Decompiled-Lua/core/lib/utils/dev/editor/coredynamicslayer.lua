slot3 = "CoreDynamicsLayer"

core.module(slot1, core)

slot3 = "CoreDynamicLayer"

core.import(slot1, core)

slot3 = "CoreEditorUtils"

core.import(slot1, core)

if not DynamicsLayer then
	slot2 = CoreDynamicLayer.DynamicLayer
	slot0 = class(slot1)
end

DynamicsLayer = slot0
function DynamicsLayer:init(owner)
	local types = CoreEditorUtils.layer_type(slot3)
	slot9 = "dynamics_layer"

	DynamicsLayer.super.init("dynamics", self, owner, "dynamics", types)

	self._uses_continents = true

	return 
end

return 
