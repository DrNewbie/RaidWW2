slot3 = "CoreDependencyParser"

core.module(slot1, core)

slot3 = "CoreDependencyNode"

core.import(slot1, core)

slot3 = "CoreGameDn"

core.import(slot1, core)

slot3 = "CoreLevelDn"

core.import(slot1, core)

slot3 = "CoreUnitDn"

core.import(slot1, core)

slot3 = "CoreObjectDn"

core.import(slot1, core)

slot3 = "CoreModelDn"

core.import(slot1, core)

slot3 = "CoreMaterialfileDn"

core.import(slot1, core)

slot3 = "CoreMaterialconfigDn"

core.import(slot1, core)

slot3 = "CoreTextureDn"

core.import(slot1, core)

slot3 = "CoreCutsceneDn"

core.import(slot1, core)

slot3 = "CoreEffectDn"

core.import(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

slot3 = "CoreEvent"

core.import(slot1, core)

slot3 = "CoreKeywordArguments"

core.import(slot1, core)

slot3 = "CoreWorkbook"

core.import(slot1, core)

slot3 = "CoreWorksheet"

core.import(slot1, core)

slot3 = "CoreSsRow"

core.import(slot1, core)

slot3 = "CoreDebug"

core.import(slot1, core)

local parse_kwargs = CoreKeywordArguments.parse_kwargs
GAME = CoreDependencyNode.GAME
LEVEL = CoreDependencyNode.LEVEL
UNIT = CoreDependencyNode.UNIT
OBJECT = CoreDependencyNode.OBJECT
MODEL = CoreDependencyNode.MODEL
MATERIALS_FILE = CoreDependencyNode.MATERIALS_FILE
MATERIAL_CONFIG = CoreDependencyNode.MATERIAL_CONFIG
TEXTURE = CoreDependencyNode.TEXTURE
CUTSCENE = CoreDependencyNode.CUTSCENE
EFFECT = CoreDependencyNode.EFFECT
DependencyParser = DependencyParser or CoreClass.class()
function DependencyParser:init(db)
	self._database = db or Database
	slot6 = "_dn"
	self._dn_cb = CoreEvent.callback(slot3, self, self)
	self._key2node = {}
	slot4 = self

	self._make_game_node(slot3)

	slot4 = self

	self._make_level_nodes(slot3)

	slot4 = self

	self._make_materialfile_node(slot3)

	slot6 = "unit"

	self._make_nodes_from_db(slot3, self, CoreUnitDn.UnitDependencyNode)

	slot6 = "object"

	self._make_nodes_from_db(slot3, self, CoreObjectDn.ObjectDependencyNode)

	slot6 = "model"

	self._make_nodes_from_db(slot3, self, CoreModelDn.ModelDependencyNode)

	slot6 = "material_config"

	self._make_nodes_from_db(slot3, self, CoreMaterialconfigDn.Material_configDependencyNode)

	slot6 = "texture"

	self._make_nodes_from_db(slot3, self, CoreTextureDn.TextureDependencyNode)

	slot6 = "cutscene"

	self._make_nodes_from_db(slot3, self, CoreCutsceneDn.CutsceneDependencyNode)

	slot6 = "effect"

	self._make_nodes_from_db(slot3, self, CoreEffectDn.EffectDependencyNode)

	return 
end
function DependencyParser:_key(type_, name)
	slot7 = name

	return string.format(slot4, "%s:%s", type_)
end
function DependencyParser:_dn(...)
	slot5 = "number:type_"
	local name, type_ = parse_kwargs(slot2, {
		...
	}, "string:name")
	slot7 = name
	local key = self._key("string:name", self, type_)

	return self._key2node[key]
end
function DependencyParser:_make_game_node()
	slot5 = "Game"
	local key = self._key(slot2, self, GAME)
	slot8 = self._database
	self._key2node[key] = CoreGameDn.GameDependencyNode.new(GAME, CoreGameDn.GameDependencyNode, "Game", self._dn_cb)

	return 
end
function DependencyParser:_make_level_nodes()
	slot7 = true

	for _, dir in ipairs(File.list(slot4, File, CoreLevelDn.LEVEL_BASE)) do
		slot9 = dir
		local file = string.format(slot7, CoreLevelDn.LEVEL_FILE)
		slot10 = file

		if File.exists(CoreLevelDn.LEVEL_FILE, File) then
			slot11 = dir
			local key = self._key(slot8, self, LEVEL)
			slot14 = self._database
			self._key2node[key] = CoreLevelDn.LevelDependencyNode.new(LEVEL, CoreLevelDn.LevelDependencyNode, dir, self._dn_cb)
		end
	end

	return 
end
function DependencyParser:_make_materialfile_node()
	slot5 = "Materialsfile"
	local key = self._key(slot2, self, MATERIALS_FILE)
	slot8 = self._database
	self._key2node[key] = CoreMaterialfileDn.MaterialsfileDependencyNode.new(MATERIALS_FILE, CoreMaterialfileDn.MaterialsfileDependencyNode, "Materialsfile", self._dn_cb)

	return 
end
function DependencyParser:_make_nodes_from_db(dn_class, db_type)
	slot8 = db_type

	for _, name in ipairs(managers.database.list_entries_of_type(slot6, managers.database)) do
		local dn = dn_class.new(slot9, dn_class, name, self._dn_cb)
		slot14 = dn
		slot13 = name
		local key = self._key(dn_class, self, dn.type_(self._database))
		self._key2node[key] = dn
	end

	return 
end
function DependencyParser:nodes(pattern)
	local dn_list = {}
	slot5 = self._key2node

	for _, dn in pairs(slot4) do
		slot11 = pattern

		if dn.match(slot9, dn) then
			slot11 = dn

			table.insert(slot9, dn_list)
		end
	end

	return dn_list
end
function DependencyParser:complement(dn_list, pattern)
	local all_dn = self.nodes(slot4)
	slot7 = dn_list
	local list = set_difference(self, all_dn)
	slot8 = pattern

	return filter(all_dn, list)
end
function DependencyParser:reached(start_dn_list, pattern)
	local reached_dn = {}
	slot6 = start_dn_list

	for _, start_dn in ipairs(slot5) do
		slot11 = reached_dn
		slot14 = start_dn
		reached_dn = union(slot10, start_dn.reached(slot13))
	end

	slot7 = pattern

	return filter(slot5, reached_dn)
end
function DependencyParser:not_reached(start_dn_list, pattern)
	slot6 = start_dn_list
	local reached_dn = self.reached(slot4, self)
	slot7 = reached_dn
	local not_reached_dn = self.complement(self, self)
	slot8 = pattern

	return filter(self, not_reached_dn)
end

function _set2list(set)
	local list = {}
	slot4 = set

	for n, _ in pairs(slot3) do
		slot10 = n

		table.insert(slot8, list)
	end

	return list
end

function _list2set(list)
	local set = {}
	slot4 = list

	for _, n in ipairs(slot3) do
		set[n] = n
	end

	return set
end

function union(A_list, B_list)
	local set = {}
	slot5 = A_list

	for _, dn in ipairs(slot4) do
		set[dn] = dn
	end

	slot5 = B_list

	for _, dn in ipairs(slot4) do
		set[dn] = dn
	end

	slot5 = set

	return _set2list(slot4)
end

function intersect(A_list, B_list)
	slot4 = B_list
	local b_set = _list2set(slot3)
	local c_set = {}
	slot6 = A_list

	for _, dn in ipairs(slot5) do
		if b_set[dn] ~= nil then
			c_set[dn] = dn
		end
	end

	slot6 = c_set

	return _set2list(slot5)
end

function set_difference(A_list, B_list)
	local set = _list2set(slot3)
	slot5 = B_list

	for _, n in ipairs(A_list) do
		set[n] = nil
	end

	slot5 = set

	return _set2list(slot4)
end

function names(A_list)
	local names = {}
	slot4 = A_list

	for _, dn in ipairs(slot3) do
		slot9 = names
		slot12 = dn

		table.insert(slot8, dn.name(slot11))
	end

	slot4 = names

	table.sort(slot3)

	return names
end

function filter(dn_list, pattern)
	res_list = {}
	slot4 = dn_list

	for _, dn in ipairs(slot3) do
		slot10 = pattern

		if dn.match(slot8, dn) then
			slot10 = dn

			table.insert(slot8, res_list)
		end
	end

	return res_list
end

function generate_report(filepath, protected_list, dp)
	slot5 = CoreWorkbook.Workbook
	local workbook = CoreWorkbook.Workbook.new(slot4)

	if not dp then
		slot7 = ProjectDatabase
		local dp = DependencyParser.new(slot5, DependencyParser)
	end

	slot8 = GAME
	local game = dp.nodes(slot6, dp)[1]
	slot8 = game
	local reached = game.reached(dp)

	if protected_list ~= nil then
		slot9 = reached
		slot13 = protected_list
		reached = union(slot8, dp.reached(slot11, dp))
	end

	slot10 = reached
	local not_reached = dp.complement(slot8, dp)

	function make_first_worksheet()
		slot3 = "README"
		local ws = CoreWorksheet.Worksheet.new(slot1, CoreWorksheet.Worksheet)
		slot3 = ws
		slot7 = "Candidates for Removal Report"

		ws.add_row(CoreWorksheet.Worksheet, CoreSsRow.Header1Row.new(slot5, CoreSsRow.Header1Row))

		slot3 = ws
		slot7 = ""

		ws.add_row(CoreWorksheet.Worksheet, CoreSsRow.Row.new(slot5, CoreSsRow.Row))

		slot3 = ws
		slot7 = "About"

		ws.add_row(CoreWorksheet.Worksheet, CoreSsRow.Header2Row.new(slot5, CoreSsRow.Header2Row))

		slot3 = ws
		slot7 = "This is an automatically generated report suggesting different"

		ws.add_row(CoreWorksheet.Worksheet, CoreSsRow.Row.new(slot5, CoreSsRow.Row))

		slot3 = ws
		slot7 = "assets that (maybe) can be removed from the game because they"

		ws.add_row(CoreWorksheet.Worksheet, CoreSsRow.Row.new(slot5, CoreSsRow.Row))

		slot3 = ws
		slot7 = "are (probably) not used. Each worksheet contains a list of candidate"

		ws.add_row(CoreWorksheet.Worksheet, CoreSsRow.Row.new(slot5, CoreSsRow.Row))

		slot3 = ws
		slot7 = "assets of a given type. There is also a sheet with a list of assets"

		ws.add_row(CoreWorksheet.Worksheet, CoreSsRow.Row.new(slot5, CoreSsRow.Row))

		slot3 = ws
		slot7 = "that are consider protected."

		ws.add_row(CoreWorksheet.Worksheet, CoreSsRow.Row.new(slot5, CoreSsRow.Row))

		slot3 = ws
		slot7 = ""

		ws.add_row(CoreWorksheet.Worksheet, CoreSsRow.Row.new(slot5, CoreSsRow.Row))

		slot3 = ws
		slot7 = "Warning!"

		ws.add_row(CoreWorksheet.Worksheet, CoreSsRow.Header2Row.new(slot5, CoreSsRow.Header2Row))

		slot3 = ws
		slot7 = "Unfortunately, the report is not exact: there are many assets listed"

		ws.add_row(CoreWorksheet.Worksheet, CoreSsRow.Row.new(slot5, CoreSsRow.Row))

		slot3 = ws
		slot7 = "in this report that is actually still part of the game. One reason for"

		ws.add_row(CoreWorksheet.Worksheet, CoreSsRow.Row.new(slot5, CoreSsRow.Row))

		slot3 = ws
		slot7 = "this is that assets can be invoked through Lua script code, another is"

		ws.add_row(CoreWorksheet.Worksheet, CoreSsRow.Row.new(slot5, CoreSsRow.Row))

		slot3 = ws
		slot7 = "that the dependency chains between assets are not always easily tracable."

		ws.add_row(CoreWorksheet.Worksheet, CoreSsRow.Row.new(slot5, CoreSsRow.Row))

		slot3 = ws
		slot7 = "This means the report is only a starting point for the hard, tiresome,"

		ws.add_row(CoreWorksheet.Worksheet, CoreSsRow.Row.new(slot5, CoreSsRow.Row))

		slot3 = ws
		slot7 = "manual, and error prone labour of removing assets..."

		ws.add_row(CoreWorksheet.Worksheet, CoreSsRow.Row.new(slot5, CoreSsRow.Row))

		slot3 = ws
		slot7 = ""

		ws.add_row(CoreWorksheet.Worksheet, CoreSsRow.Row.new(slot5, CoreSsRow.Row))

		slot3 = ws
		slot7 = "Protected Assets"

		ws.add_row(CoreWorksheet.Worksheet, CoreSsRow.Header2Row.new(slot5, CoreSsRow.Header2Row))

		slot3 = ws
		slot7 = "Because of the issues listed above it is possible to add a list of"

		ws.add_row(CoreWorksheet.Worksheet, CoreSsRow.Row.new(slot5, CoreSsRow.Row))

		slot3 = ws
		slot7 = "protected assets. By listing a asset in the protected list it (including"

		ws.add_row(CoreWorksheet.Worksheet, CoreSsRow.Row.new(slot5, CoreSsRow.Row))

		slot3 = ws
		slot7 = "the assets it depends on) is removed from the list of candidates to"

		ws.add_row(CoreWorksheet.Worksheet, CoreSsRow.Row.new(slot5, CoreSsRow.Row))

		slot3 = ws
		slot7 = "be removed. The protected assets are listed in the last worksheet."

		ws.add_row(CoreWorksheet.Worksheet, CoreSsRow.Row.new(slot5, CoreSsRow.Row))

		return ws
	end

	function make_worksheet(type_, name)
		slot5 = name
		local ws = CoreWorksheet.Worksheet.new(slot3, CoreWorksheet.Worksheet)
		slot5 = ws
		slot8 = CoreSsRow.Header1Row
		slot12 = name

		ws.add_row(CoreWorksheet.Worksheet, CoreSsRow.Header1Row.new(slot7, string.format(slot10, "%s, Candidates to be Removed:")))

		slot8 = type_
		local node_names = names(filter(CoreSsRow.Header1Row.new, not_reached))
		slot8 = #node_names

		CoreDebug.cat_print(filter, "debug", name)

		slot6 = node_names

		for _, n in ipairs(filter) do
			slot11 = ws
			slot15 = n

			ws.add_row(slot10, CoreSsRow.Row.new(slot13, CoreSsRow.Row))
		end

		collectgarbage()

		return ws
	end

	function make_protected_worksheet()
		slot3 = "Protected Assets"
		local ws = CoreWorksheet.Worksheet.new(slot1, CoreWorksheet.Worksheet)
		slot3 = ws
		slot7 = "Proteted Assets (by type):"

		ws.add_row(CoreWorksheet.Worksheet, CoreSsRow.Header1Row.new(slot5, CoreSsRow.Header1Row))

		slot3 = ws
		slot14 = "Effects"

		ws.add_row(CoreWorksheet.Worksheet, CoreSsRow.Header2Row.new(slot5, CoreSsRow.Header2Row, "Levels", "Units", "Objects", "Model", "Material Configs", "Textures", "Cutscenes"))

		slot6 = LEVEL
		local levels = names(filter(CoreSsRow.Header2Row.new, protected_list))
		slot7 = UNIT
		local units = names(filter(protected_list, protected_list))
		slot8 = OBJECT
		local objects = names(filter(protected_list, protected_list))
		slot9 = MODEL
		local models = names(filter(protected_list, protected_list))
		slot10 = MATERIAL_CONFIG
		local mtrlcfgs = names(filter(protected_list, protected_list))
		slot11 = TEXTURE
		local textures = names(filter(protected_list, protected_list))
		slot12 = CUTSCENE
		local cutscenes = names(filter(protected_list, protected_list))
		slot13 = EFFECT
		local effects = names(filter(protected_list, protected_list))
		slot18 = #effects
		local size = math.max(filter, #levels, #units, #objects, #models, #mtrlcfgs, #textures, #cutscenes)

		for i = 1, size, 1 do
			slot16 = ws
			slot27 = effects[i] or ""

			ws.add_row(slot15, CoreSsRow.Row.new(slot18, CoreSsRow.Row, levels[i] or "", units[i] or "", objects[i] or "", models[i] or "", mtrlcfgs[i] or "", textures[i] or "", cutscenes[i] or ""))
		end

		collectgarbage()

		return ws
	end

	slot10 = workbook

	workbook.add_worksheet(dp, make_first_worksheet())

	slot10 = workbook
	slot14 = "Levels"

	workbook.add_worksheet(dp, make_worksheet(slot12, LEVEL))

	slot10 = workbook
	slot14 = "Units"

	workbook.add_worksheet(dp, make_worksheet(slot12, UNIT))

	slot10 = workbook
	slot14 = "Objects"

	workbook.add_worksheet(dp, make_worksheet(slot12, OBJECT))

	slot10 = workbook
	slot14 = "Models"

	workbook.add_worksheet(dp, make_worksheet(slot12, MODEL))

	slot10 = workbook
	slot14 = "Material Configs"

	workbook.add_worksheet(dp, make_worksheet(slot12, MATERIAL_CONFIG))

	slot10 = workbook
	slot14 = "Textures"

	workbook.add_worksheet(dp, make_worksheet(slot12, TEXTURE))

	slot10 = workbook
	slot14 = "Cutscenes"

	workbook.add_worksheet(dp, make_worksheet(slot12, CUTSCENE))

	slot10 = workbook
	slot14 = "Effects"

	workbook.add_worksheet(dp, make_worksheet(slot12, EFFECT))

	slot10 = workbook

	workbook.add_worksheet(dp, make_protected_worksheet())
	collectgarbage()

	slot11 = "w"
	f = io.open(dp, filepath)

	if f == nil then
		local cause = "Unable to open file " .. filepath .. " (open in other program?)"
		slot12 = cause

		Application.error(" (open in other program?)", Application)

		return cause
	else
		slot11 = f

		workbook.to_xml(slot9, workbook)

		slot10 = f

		f.close(slot9)
	end

	return 
end

function generate_BC_report(filepath)
	if not dp then
		slot4 = ProjectDatabase
		local dp = DependencyParser.new(slot2, DependencyParser)
	end

	slot5 = UNIT
	local units = dp.nodes(slot3, dp)
	slot6 = LEVEL
	local levels = dp.nodes(dp, dp)
	slot7 = TEXTURE
	local textures = dp.nodes(dp, dp)
	local effects = dp.nodes(dp, dp)
	local prot = {}
	slot9 = prot
	slot13 = "terracotta.*"
	prot = union(EFFECT, filter(slot11, units))
	slot9 = prot
	slot13 = "mp_.*"
	prot = union(EFFECT, filter(slot11, units))
	slot9 = prot
	slot13 = "multiplayer.*"
	prot = union(EFFECT, filter(slot11, units))
	slot9 = prot
	slot13 = "mp_.*"
	prot = union(EFFECT, filter(slot11, levels))
	slot9 = prot
	slot13 = "concept_.*"
	prot = union(EFFECT, filter(slot11, textures))
	slot9 = prot
	slot13 = "credits_.*"
	prot = union(EFFECT, filter(slot11, textures))
	slot9 = prot
	slot13 = "mp_.*"
	prot = union(EFFECT, filter(slot11, textures))
	slot9 = prot
	slot13 = "hud_.*"
	prot = union(EFFECT, filter(slot11, textures))
	slot9 = prot
	slot13 = "gui_.*"
	prot = union(EFFECT, filter(slot11, textures))
	slot9 = prot
	slot13 = "security_camera_.*"
	prot = union(EFFECT, filter(slot11, textures))
	slot10 = effects
	prot = union(EFFECT, prot)
	slot11 = dp

	generate_report(EFFECT, filepath, prot)

	return 
end

function generate_FAITH_report(filepath)
	if not dp then
		slot4 = ProjectDatabase
		local dp = DependencyParser.new(slot2, DependencyParser)
	end

	slot5 = LEVEL
	local levels = dp.nodes(slot3, dp)
	slot6 = UNIT
	local units = dp.nodes(dp, dp)
	slot7 = OBJECT
	local objects = dp.nodes(dp, dp)
	slot8 = MODEL
	local models = dp.nodes(dp, dp)
	slot9 = MATERIAL_CONFIG
	local mtrlcfgs = dp.nodes(dp, dp)
	slot10 = TEXTURE
	local textures = dp.nodes(dp, dp)
	slot11 = CUTSCENE
	local cutscenes = dp.nodes(dp, dp)
	local effects = dp.nodes(dp, dp)
	local prot = {}
	slot15 = dp

	generate_report(EFFECT, filepath, prot)

	return 
end

return 
