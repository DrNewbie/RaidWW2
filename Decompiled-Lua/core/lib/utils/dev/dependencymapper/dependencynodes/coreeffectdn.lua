slot3 = "CoreEffectDn"

core.module(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

slot3 = "CoreDependencyNode"

core.import(slot1, core)

TEXTURE = CoreDependencyNode.TEXTURE
EFFECT = CoreDependencyNode.EFFECT

if not EffectDependencyNode then
	slot2 = CoreDependencyNode.DependencyNodeBase
	slot0 = CoreClass.class(slot1)
end

EffectDependencyNode = slot0
function EffectDependencyNode:init(name, get_dn_cb, database)
	slot11 = database

	self.super.init(slot5, self, EFFECT, "effect", name, get_dn_cb)

	return 
end
function EffectDependencyNode:_walkxml2dependencies(xmlnode, deps)
	slot6 = "texture"
	local texture_name = xmlnode.parameter(slot4, xmlnode)

	if texture_name ~= nil then
		local dn = self._get_dn(slot5)
		slot8 = dn

		deps.add({
			name = texture_name,
			type_ = TEXTURE
		}, deps)

		if dn == nil then
			slot8 = "When parsing effect: " .. self._name .. ", can not locate texture: " .. texture_name

			Application.error(slot6, Application)
		end
	end

	return 
end

return 
