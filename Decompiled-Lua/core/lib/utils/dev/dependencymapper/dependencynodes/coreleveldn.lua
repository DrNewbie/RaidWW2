slot3 = "CoreLevelDn"

core.module(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

slot3 = "CoreDependencyNode"

core.import(slot1, core)

LEVEL = CoreDependencyNode.LEVEL
UNIT = CoreDependencyNode.UNIT
LEVEL_BASE = "./data/levels/"
LEVEL_FILE = "./data/levels/%s/world.xml"
MISSION_FILE = "./data/levels/%s/mission.xml"
LEVEL_CONVERT = {
	player_start = "player"
}
LEVEL_SKIP = {
	unit_sequence = true,
	hub = true,
	environment_effect = true,
	worldcamera_trigger = true,
	cubemap_gizmo = true,
	music = true,
	music_mode = true,
	he_rumble = true,
	play_effect = true,
	physicspush = true,
	worldcamera = true,
	unit_sequence_trigger = true,
	area = true
}

if not LevelDependencyNode then
	slot2 = CoreDependencyNode.DependencyNodeBase
	slot0 = CoreClass.class(slot1)
end

LevelDependencyNode = slot0
function LevelDependencyNode:init(name, get_dn_cb, database)
	slot11 = database

	self.super.init(slot5, self, LEVEL, nil, name, get_dn_cb)

	return 
end
function LevelDependencyNode:_parse()
	slot4 = self._name
	local file = string.format(slot2, LEVEL_FILE)
	local f = File.open(LEVEL_FILE, File, file)
	slot7 = f
	local level_node = Node.from_xml(f.read("r"))
	slot6 = f

	f.close(f.read)

	slot7 = self._name
	local file = string.format(f.read, MISSION_FILE)
	local f = File.open(MISSION_FILE, File, file)
	slot10 = f
	local mission_node = Node.from_xml(f.read("r"))
	slot9 = f

	f.close(f.read)

	return {
		level_node,
		mission_node
	}
end
function LevelDependencyNode:_walkxml2dependencies(xmlnode, deps)
	slot5 = xmlnode
	local node_name = xmlnode.name(slot4)

	if node_name == "unit" then
		slot7 = "name"
		local unit_name = xmlnode.parameter(slot5, xmlnode)

		if unit_name ~= nil and not LEVEL_SKIP[unit_name] then
			if not LEVEL_CONVERT[unit_name] then
			end

			local dn = self._get_dn(slot6)
			slot9 = dn

			deps.add({
				name = unit_name,
				type_ = UNIT
			}, deps)

			if dn == nil then
				slot9 = "When parsing Level: " .. self._name .. ", can not locate Unit: " .. unit_name

				Application.error(slot7, Application)
			end
		end
	elseif node_name == "enemy" then
		slot7 = "name"
		local unit_name = xmlnode.parameter(slot5, xmlnode)

		if unit_name ~= nil then
			local dn = self._get_dn(slot6)
			slot9 = dn

			deps.add({
				name = unit_name,
				type_ = UNIT
			}, deps)

			if dn == nil then
				slot9 = "When parsing Level: " .. self._name .. ", can not locate enemy-unit: " .. unit_name

				Application.error(slot7, Application)
			end
		end
	end

	return 
end

return 
