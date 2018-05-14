slot3 = "CoreExtendLua"

core.module(slot1, core)

slot3 = "CoreDebug"

core.import(slot1, core)

slot4 = CoreDebug.reload_and_compile

core._add_to_pristine_and_global(slot1, core, "reload_and_compile")

slot4 = CoreDebug.out

core._add_to_pristine_and_global(slot1, core, "out")

slot4 = CoreDebug.watch

core._add_to_pristine_and_global(slot1, core, "watch")

slot4 = CoreDebug.cat_print

core._add_to_pristine_and_global(slot1, core, "cat_print")

slot4 = CoreDebug.cat_debug

core._add_to_pristine_and_global(slot1, core, "cat_debug")

slot4 = CoreDebug.cat_error

core._add_to_pristine_and_global(slot1, core, "cat_error")

slot4 = CoreDebug.cat_stack_dump

core._add_to_pristine_and_global(slot1, core, "cat_stack_dump")

slot4 = CoreDebug.cat_print_inspect

core._add_to_pristine_and_global(slot1, core, "cat_print_inspect")

slot4 = CoreDebug.cat_debug_inspect

core._add_to_pristine_and_global(slot1, core, "cat_debug_inspect")

slot3 = "CoreClass"

core.import(slot1, core)

slot4 = CoreClass.class

core._add_to_pristine_and_global(slot1, core, "class")

slot3 = "CoreEvent"

core.import(slot1, core)

slot4 = CoreEvent.callback

core._add_to_pristine_and_global(slot1, core, "callback")

slot3 = "CoreCode"

core.import(slot1, core)

slot4 = CoreCode.alive

core._add_to_pristine_and_global(slot1, core, "alive")

slot4 = CoreCode.deprecation_warning

core._add_to_pristine_and_global(slot1, core, "deprecation_warning")

slot4 = CoreCode.inspect

core._add_to_pristine_and_global(slot1, core, "inspect")

slot4 = CoreCode.help

core._add_to_pristine_and_global(slot1, core, "help")

slot4 = CoreCode.properties

core._add_to_pristine_and_global(slot1, core, "properties")

slot3 = "CoreLogic"

core.import(slot1, core)

slot4 = CoreLogic.iff

core._add_to_pristine_and_global(slot1, core, "iff")

slot4 = CoreLogic.toboolean

core._add_to_pristine_and_global(slot1, core, "toboolean")

return 
