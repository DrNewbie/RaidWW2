-- Decompilation Error: _glue_flows(node)

slot3 = "DebugManager"

core.module(slot1, core)

slot3 = "CoreDebugManager"

core.import(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

if not DebugManager then
	slot2 = CoreDebugManager.DebugManager
	slot0 = class(slot1)
end

DebugManager = slot0
function DebugManager:qa_debug(username)
	slot6 = true

	self.set_qa_debug_enabled(slot3, self, username)

	return 
end
function DebugManager:get_qa_debug_enabled()
	return self._qa_debug_enabled
end
function DebugManager:set_qa_debug_enabled(username, enabled)
	enabled = not not enabled
	local cat_print_list = {
		"qa"
	}
	slot6 = cat_print_list

	for _, cat in ipairs(slot5) do
		Global.category_print[cat] = enabled
	end

	self._qa_debug_enabled = enabled

	return 
end
slot3 = DebugManager

CoreClass.override_class(function (self, username, enabled)
	enabled = not not enabled
	local cat_print_list = 
	slot6 = cat_print_list

	for _, cat in ipairs(slot5) do
		Global.category_print[cat] = enabled
	end

	self._qa_debug_enabled = enabled

	return 
end, CoreDebugManager.DebugManager)

return 
