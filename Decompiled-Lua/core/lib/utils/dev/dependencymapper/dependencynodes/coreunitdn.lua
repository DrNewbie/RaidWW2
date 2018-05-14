slot3 = "CoreUnitDn"

core.module(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

slot3 = "CoreDependencyNode"

core.import(slot1, core)

UNIT = CoreDependencyNode.UNIT
OBJECT = CoreDependencyNode.OBJECT
MATERIAL_CONFIG = CoreDependencyNode.MATERIAL_CONFIG
CUTSCENE = CoreDependencyNode.CUTSCENE

if not UnitDependencyNode then
	slot2 = CoreDependencyNode.DependencyNodeBase
	slot0 = CoreClass.class(slot1)
end

UnitDependencyNode = slot0
function UnitDependencyNode:init(name, get_dn_cb, database)
	slot11 = database

	self.super.init(slot5, self, UNIT, "unit", name, get_dn_cb)

	return 
end
function UnitDependencyNode:_walkxml2dependencies(xmlnode, deps)
	slot5 = xmlnode
	local node_name = xmlnode.name(slot4)

	if node_name == "depends_on" then
		slot7 = "unit"
		local depends_on_unit = xmlnode.parameter(slot5, xmlnode)

		if depends_on_unit ~= nil then
			local dn = self._get_dn(slot6)
			slot9 = dn

			deps.add({
				name = depends_on_unit,
				type_ = UNIT
			}, deps)

			if dn == nil then
				slot9 = "When parsing Unit: " .. self._name .. ", can not locate depends-on-unit: " .. depends_on_unit

				Application.error(slot7, Application)
			end
		end

		slot8 = "material_config"
		local depends_on_mc = xmlnode.parameter(slot6, xmlnode)

		if depends_on_mc ~= nil then
			local dn = self._get_dn(slot7)
			slot10 = dn

			deps.add({
				name = depends_on_mc,
				type_ = MATERIAL_CONFIG
			}, deps)

			if dn == nil then
				slot10 = "When parsing Unit: " .. self._name .. ", can not locate depends-on-material_config: " .. depends_on_mc

				Application.error(slot8, Application)
			end
		end
	elseif node_name == "model" then
		slot7 = "file"
		local object_name = xmlnode.parameter(slot5, xmlnode)

		if object_name ~= nil then
			local dn = self._get_dn(slot6)
			slot9 = dn

			deps.add({
				name = object_name,
				type_ = OBJECT
			}, deps)

			if dn == nil then
				slot9 = "When parsing Unit: " .. self._name .. ", can not locate object: " .. object_name

				Application.error(slot7, Application)
			end
		end
	elseif node_name == "extension" then
		slot7 = "name"

		if xmlnode.parameter(slot5, xmlnode) == "cutscene_data" then
			slot8 = self
			slot8 = ""
			local cutscene_name = string.gsub(slot5, self.name(slot7), "cutscene_")
			local dn = self._get_dn(self.name(slot7))
			slot9 = dn

			deps.add({
				name = cutscene_name,
				type_ = CUTSCENE
			}, deps)

			if dn == nil then
				slot9 = "When parsing Unit: " .. self._name .. ", can not locate cutscene: " .. cutscene_name

				Application.error(slot7, Application)
			end
		end
	end

	return 
end

return 
