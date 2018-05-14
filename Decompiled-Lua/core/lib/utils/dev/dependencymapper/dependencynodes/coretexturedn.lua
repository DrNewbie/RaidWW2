slot3 = "CoreTextureDn"

core.module(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

slot3 = "CoreDependencyNode"

core.import(slot1, core)

TEXTURE = CoreDependencyNode.TEXTURE

if not TextureDependencyNode then
	slot2 = CoreDependencyNode.DependencyNodeBase
	slot0 = CoreClass.class(slot1)
end

TextureDependencyNode = slot0
function TextureDependencyNode:init(name, get_dn_cb, database)
	slot11 = database

	self.super.init(slot5, self, TEXTURE, "texture", name, get_dn_cb)

	return 
end
function TextureDependencyNode:_parse()
	return {}
end

return 
