-- Decompilation Error: _glue_flows(node)

slot3 = "CoreWorldDefinition"

core.import(slot1, core)

if not WorldDefinition then
	slot2 = CoreWorldDefinition.WorldDefinition
	slot0 = class(slot1)
end

WorldDefinition = slot0
function WorldDefinition:init(...)
	slot3 = self

	WorldDefinition.super.init(slot2, ...)

	return 
end
slot3 = WorldDefinition

CoreClass.override_class(function (self, ...)
	slot3 = self

	WorldDefinition.super.init(slot2, ...)

	return 
end, CoreWorldDefinition.WorldDefinition)

return 
