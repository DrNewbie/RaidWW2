slot3 = "CoreMaterialfileDn"

core.module(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

slot3 = "CoreDependencyNode"

core.import(slot1, core)

MATERIALS_FILE = CoreDependencyNode.MATERIALS_FILE
TEXTURE = CoreDependencyNode.TEXTURE
local _FILE = "./data/settings/materials.xml"

if not MaterialsfileDependencyNode then
	slot3 = CoreDependencyNode.DependencyNodeBase
	slot1 = CoreClass.class(slot2)
end

MaterialsfileDependencyNode = slot1
function MaterialsfileDependencyNode:init(name, get_dn_cb, database)
	slot11 = database

	self.super.init(slot5, self, MATERIALS_FILE, nil, name, get_dn_cb)

	return 
end
function MaterialsfileDependencyNode:_parse()
	local f = File.open(slot2, File, _FILE)
	slot6 = f
	local xmlnode = Node.from_xml(f.read("r"))
	slot5 = f

	f.close(f.read)

	return {
		xmlnode
	}
end
function MaterialsfileDependencyNode:_walkxml2dependencies(xmlnode, deps)
	slot5 = xmlnode
	local node_name = xmlnode.name(slot4)

	if node_name ~= "material" then
		slot7 = "file"
		local texture_name = xmlnode.parameter(slot5, xmlnode)

		if texture_name ~= nil then
			local dn = self._get_dn(slot6)
			slot9 = dn

			deps.add({
				name = texture_name,
				type_ = TEXTURE
			}, deps)

			if dn == nil then
				slot9 = "When parsing material: " .. self._name .. ", can not locate texture: " .. texture_name

				Application.error(slot7, Application)
			end
		end
	end

	return 
end

return 
