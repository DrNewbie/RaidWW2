slot3 = "CoreMaterialconfigDn"

core.module(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

slot3 = "CoreDependencyNode"

core.import(slot1, core)

MATERIAL_CONFIG = CoreDependencyNode.MATERIAL_CONFIG
MATERIALS_FILE = CoreDependencyNode.MATERIALS_FILE
TEXTURE = CoreDependencyNode.TEXTURE

if not Material_configDependencyNode then
	slot2 = CoreDependencyNode.DependencyNodeBase
	slot0 = CoreClass.class(slot1)
end

Material_configDependencyNode = slot0
function Material_configDependencyNode:init(name, get_dn_cb, database)
	slot11 = database

	self.super.init(slot5, self, MATERIAL_CONFIG, "material_config", name, get_dn_cb)

	return 
end
function Material_configDependencyNode:_walkxml2dependencies(xmlnode, deps)
	local mf = self._get_dn(slot4)
	slot7 = mf

	deps.add({
		name = "Materialsfile",
		type_ = MATERIALS_FILE
	}, deps)

	slot6 = xmlnode
	local node_name = xmlnode.name()

	if node_name ~= "material" then
		slot8 = "file"
		local texture_name = xmlnode.parameter(slot6, xmlnode)

		if texture_name ~= nil then
			local dn = self._get_dn(slot7)
			slot10 = dn

			deps.add({
				name = texture_name,
				type_ = TEXTURE
			}, deps)

			if dn == nil then
				slot10 = "When parsing material: " .. self._name .. ", can not locate texture: " .. texture_name

				Application.error(slot8, Application)
			end
		end
	end

	return 
end

return 
