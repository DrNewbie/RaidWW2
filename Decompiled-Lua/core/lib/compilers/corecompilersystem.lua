if Application == nil then
	slot3 = {}
	Application = setmetatable(slot1, {})
	function Application:ews_enabled()
		return false
	end
end

if Global == nil then
	slot3 = {}
	Global = setmetatable(slot1, {})
end

Global.category_print = Global.category_print or {}
Global.category_print_initialized = Global.category_print_initialized or {}
slot2 = "core/lib/system/CorePatchLua"

require(Global.category_print_initialized or )

slot2 = "core/lib/system/CorePatchEngine"

require(Global.category_print_initialized or )

slot2 = "core/lib/system/CoreModule"

require(Global.category_print_initialized or )

slot2 = "core/lib/system/CoreModules"

require(Global.category_print_initialized or )

slot3 = "CoreExtendLua"

core.import(Global.category_print_initialized or , core)

managers = managers or {}
slot4 = managers

core._add_to_pristine_and_global(Global.category_print_initialized or , core, "managers")

slot3 = "CoreClass"

core._copy_module_to_global(Global.category_print_initialized or , core)

slot3 = "CoreCode"

core._copy_module_to_global(Global.category_print_initialized or , core)

slot3 = "CoreDebug"

core._copy_module_to_global(Global.category_print_initialized or , core)

slot3 = "CoreEvent"

core._copy_module_to_global(Global.category_print_initialized or , core)

slot3 = "CoreEws"

core._copy_module_to_global(Global.category_print_initialized or , core)

slot3 = "CoreInput"

core._copy_module_to_global(Global.category_print_initialized or , core)

slot3 = "CoreMath"

core._copy_module_to_global(Global.category_print_initialized or , core)

slot3 = "CoreOldModule"

core._copy_module_to_global(Global.category_print_initialized or , core)

slot3 = "CoreString"

core._copy_module_to_global(Global.category_print_initialized or , core)

slot3 = "CoreTable"

core._copy_module_to_global(Global.category_print_initialized or , core)

slot3 = "CoreUnit"

core._copy_module_to_global(Global.category_print_initialized or , core)

slot3 = "CoreXml"

core._copy_module_to_global(Global.category_print_initialized or , core)

slot3 = "CoreApp"

core._copy_module_to_global(Global.category_print_initialized or , core)

slot2 = core

core._close_pristine_namespace(Global.category_print_initialized or )

slot3 = "CoreDatabaseManager"

core.import(Global.category_print_initialized or , core)

slot0 = managers

if not managers.database then
	slot3 = CoreDatabaseManager.DatabaseManager
	slot1 = CoreDatabaseManager.DatabaseManager.new(slot2)
end

slot0.database = slot1

return 
