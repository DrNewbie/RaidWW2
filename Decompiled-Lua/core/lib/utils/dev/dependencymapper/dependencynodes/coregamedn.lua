slot3 = "CoreGameDn"

core.module(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

slot3 = "CoreDependencyNode"

core.import(slot1, core)

GAME = CoreDependencyNode.GAME
LEVEL = CoreDependencyNode.LEVEL
LEVELS_FILE = "./dev/build_info/levels.xml"

if not GameDependencyNode then
	slot2 = CoreDependencyNode.DependencyNodeBase
	slot0 = CoreClass.class(slot1)
end

GameDependencyNode = slot0
function GameDependencyNode:init(name, get_dn_cb, database)
	slot11 = database

	self.super.init(slot5, self, GAME, nil, name, get_dn_cb)

	return 
end
function GameDependencyNode:_parse()
	local f = File.open(slot2, File, LEVELS_FILE)
	slot6 = f
	local xmlnode = Node.from_xml(f.read("r"))
	slot5 = f

	f.close(f.read)

	return {
		xmlnode
	}
end
function GameDependencyNode:_walkxml2dependencies(xmlnode, deps)
	local node_name = xmlnode.name(slot4)
	slot7 = "name"
	local name = xmlnode.parameter(xmlnode, xmlnode)

	if node_name == "level" and name ~= nil then
		slot9 = ""
		local name = string.gsub(slot6, name, "_stage%d")
		local dn = self._get_dn(name)
		slot10 = dn

		deps.add({
			name = name,
			type_ = LEVEL
		}, deps)

		if dn == nil then
			slot10 = "When parsing levels.xml, can not find Level: " .. name

			Application.error(slot8, Application)
		end
	end

	return 
end

return 
