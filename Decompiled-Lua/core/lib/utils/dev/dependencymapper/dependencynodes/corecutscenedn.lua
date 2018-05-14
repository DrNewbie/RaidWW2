slot3 = "CoreCutsceneDn"

core.module(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

slot3 = "CoreDependencyNode"

core.import(slot1, core)

UNIT = CoreDependencyNode.UNIT
CUTSCENE = CoreDependencyNode.CUTSCENE

if not CutsceneDependencyNode then
	slot2 = CoreDependencyNode.DependencyNodeBase
	slot0 = CoreClass.class(slot1)
end

CutsceneDependencyNode = slot0
function CutsceneDependencyNode:init(name, get_dn_cb, database)
	slot11 = database

	self.super.init(slot5, self, CUTSCENE, "cutscene", name, get_dn_cb)

	return 
end
function CutsceneDependencyNode:_walkxml2dependencies(xmlnode, deps)
	slot5 = xmlnode
	local node_name = xmlnode.name(slot4)

	if node_name == "unit" then
		slot7 = "type"
		local unit_name = xmlnode.parameter(slot5, xmlnode)

		if unit_name ~= nil then
			local dn = self._get_dn(slot6)
			slot9 = dn

			deps.add({
				name = unit_name,
				type_ = UNIT
			}, deps)

			if dn == nil then
				slot9 = "When parsing cutscene: " .. self._name .. ", can not locate unit: " .. unit_name

				Application.error(slot7, Application)
			end
		end
	elseif node_name == "spawn_unit" then
		slot7 = "unit_type"
		local unit_name = xmlnode.parameter(slot5, xmlnode)

		if unit_name ~= nil then
			local dn = self._get_dn(slot6)
			slot9 = dn

			deps.add({
				name = unit_name,
				type_ = UNIT
			}, deps)

			if dn == nil then
				slot9 = "When parsing cutscene: " .. self._name .. ", can not locate unit: " .. unit_name

				Application.error(slot7, Application)
			end
		end
	end

	return 
end

return 
