slot2 = "core/lib/system/CorePatchLua"

require(slot1)

slot2 = "core/lib/system/CorePatchEngine"

require(slot1)

slot2 = "core/lib/system/CoreModule"

require(slot1)

slot2 = "core/lib/system/CoreModules"

require(slot1)

slot3 = "CoreExtendLua"

core.import(slot1, core)

slot3 = "CoreEngineAccess"

core.import(slot1, core)

managers = managers or {}
slot4 = managers

core._add_to_pristine_and_global(slot1, core, "managers")

slot3 = "CoreClass"

core._copy_module_to_global(slot1, core)

slot3 = "CoreCode"

core._copy_module_to_global(slot1, core)

slot3 = "CoreDebug"

core._copy_module_to_global(slot1, core)

slot3 = "CoreEvent"

core._copy_module_to_global(slot1, core)

slot3 = "CoreEws"

core._copy_module_to_global(slot1, core)

slot3 = "CoreInput"

core._copy_module_to_global(slot1, core)

slot3 = "CoreMath"

core._copy_module_to_global(slot1, core)

slot3 = "CoreOldModule"

core._copy_module_to_global(slot1, core)

slot3 = "CoreString"

core._copy_module_to_global(slot1, core)

slot3 = "CoreTable"

core._copy_module_to_global(slot1, core)

slot3 = "CoreUnit"

core._copy_module_to_global(slot1, core)

slot3 = "CoreXml"

core._copy_module_to_global(slot1, core)

slot3 = "CoreApp"

core._copy_module_to_global(slot1, core)

slot2 = core

core._close_pristine_namespace(slot1)

return 
