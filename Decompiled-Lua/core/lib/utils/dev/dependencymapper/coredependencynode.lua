slot3 = "CoreDependencyNode"

core.module(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

GAME = 0
LEVEL = 1
UNIT = 2
OBJECT = 3
MATERIAL_CONFIG = 4
TEXTURE = 6
CUTSCENE = 7
EFFECT = 8
MATERIALS_FILE = 9
MODEL = 10
DependencyNodeBase = DependencyNodeBase or CoreClass.class()
function DependencyNodeBase:init(type_, db_type, name, get_dn_cb, database)
	slot10 = type_
	slot8 = type(slot9) == "number"

	assert(slot7)

	slot10 = name
	slot8 = type(slot9) == "string"

	assert(slot7)

	slot10 = get_dn_cb
	slot8 = type(slot9) == "function"

	assert(slot7)

	slot10 = database
	slot8 = type(slot9) == "userdata"

	assert(slot7)

	self._type = type_
	self._db_type = db_type
	self._name = name
	self._get_dn = get_dn_cb
	self._database = database
	self._parsed = false
	self._depends_on = {}

	return 
end
function DependencyNodeBase:isdependencynode()
	return true
end
function DependencyNodeBase:type_()
	return self._type
end
function DependencyNodeBase:name()
	return self._name
end
function DependencyNodeBase:match(pattern)
	if pattern == nil then
		return true
	else
		slot5 = GAME

		if type(slot3) == type(pattern) then
			slot4 = self

			return pattern == self.type_(slot3)
		else
			slot4 = pattern

			if type(slot3) == "string" then
				slot4 = self.name(slot5)
				slot8 = pattern

				return string.match(slot3, string.format(self, "^%s$")) ~= nil
			elseif pattern.isdependencynode then
				return pattern == self
			else
				slot4 = pattern

				if type(slot3) == "table" then
					slot4 = pattern

					for _, f in ipairs(slot3) do
						if f == self then
							return true
						end
					end

					return false
				else
					slot7 = pattern

					error(string.format(slot5, "Filter '%s' not supported"))
				end
			end
		end
	end

	return 
end
function DependencyNodeBase:get_dependencies()
	if not self._parsed then
		slot5 = self

		for _, xmlnode in ipairs(self._parse(slot4)) do
			slot9 = xmlnode

			self._walkxml(slot7, self)
		end

		self._parsed = true
	end

	local dn_list = {}
	slot4 = self._depends_on

	for dn, _ in pairs(slot3) do
		slot10 = dn

		table.insert(slot8, dn_list)
	end

	return dn_list
end
function DependencyNodeBase:reached(pattern)
	local found = {}
	slot8 = found

	self._reached(slot4, self, pattern, {})

	return found
end
function DependencyNodeBase:_reached(pattern, traversed, found)
	if traversed[self] then
		return 
	else
		traversed[self] = true
		slot7 = pattern

		if self.match(slot5, self) then
			slot7 = self

			table.insert(slot5, found)
		end

		slot8 = self

		for _, dn in ipairs(self.get_dependencies(slot7)) do
			slot14 = found

			dn._reached(slot10, dn, pattern, traversed)
		end
	end

	return 
end
function DependencyNodeBase:_parse()
	local entry = self._database.lookup(slot2, self._database, self._db_type)
	slot6 = entry

	assert(entry.valid(self._name))

	slot5 = entry
	local xmlnode = self._database.load_node(self._database, self._database)

	return {
		xmlnode
	}
end
function DependencyNodeBase:_walkxml(xmlnode)
	local deps = _Deps.new(slot3)
	slot7 = deps

	self._walkxml2dependencies(_Deps, self, xmlnode)

	slot5 = deps

	for _, dn in deps.get_pairs(_Deps) do
		self._depends_on[dn] = true
	end

	slot5 = xmlnode

	for child in xmlnode.children(slot4) do
		slot10 = child

		self._walkxml(slot8, self)
	end

	return 
end
function DependencyNodeBase:_walkxml2dependencies(xmlnode, deps)
	slot5 = "Not Implemented"

	error(slot4)

	return 
end
_Deps = _Deps or CoreClass.class()
function _Deps:init()
	self._dnlist = {}

	return 
end
function _Deps:add(dn)
	slot5 = dn

	table.insert(slot3, self._dnlist)

	return 
end
function _Deps:get_pairs()
	slot3 = self._dnlist

	return ipairs(slot2)
end

return 
