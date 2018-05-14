slot3 = "CoreObjectDn"

core.module(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

slot3 = "CoreDependencyNode"

core.import(slot1, core)

OBJECT = CoreDependencyNode.OBJECT
MODEL = CoreDependencyNode.MODEL
MATERIAL_CONFIG = CoreDependencyNode.MATERIAL_CONFIG

if not ObjectDependencyNode then
	slot2 = CoreDependencyNode.DependencyNodeBase
	slot0 = CoreClass.class(slot1)
end

ObjectDependencyNode = slot0
function ObjectDependencyNode:init(name, get_dn_cb, database)
	slot11 = database

	self.super.init(slot5, self, OBJECT, "object", name, get_dn_cb)

	return 
end
function ObjectDependencyNode:_walkxml2dependencies(xmlnode, deps)
	slot5 = xmlnode
	local node_name = xmlnode.name(slot4)

	if node_name == "diesel" then
		slot7 = "materials"
		local materials_name = xmlnode.parameter(slot5, xmlnode)

		if materials_name ~= nil then
			local dn = self._get_dn(slot6)
			slot9 = dn

			deps.add({
				name = materials_name,
				type_ = MATERIAL_CONFIG
			}, deps)

			if dn == nil then
				slot9 = "When parsing object: " .. self._name .. ", can not locate material_config: " .. materials_name

				Application.error(slot7, Application)
			end
		end

		slot8 = "file"
		local diesel_file = xmlnode.parameter(slot6, xmlnode)

		if diesel_file ~= nil then
			local dn = self._get_dn(slot7)
			slot10 = dn

			deps.add({
				name = diesel_file,
				type_ = MODEL
			}, deps)

			if dn == nil then
				slot10 = "When parsing object: " .. self._name .. ", can not locate model: " .. diesel_file

				Application.error(slot8, Application)
			end
		end
	end

	return 
end

return 
