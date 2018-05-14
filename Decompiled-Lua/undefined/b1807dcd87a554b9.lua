if not BlackscreenElement then
	slot2 = MissionElement
	slot0 = class(slot1)
end

BlackscreenElement = slot0
function BlackscreenElement:init(unit)
	slot5 = unit

	BlackscreenElement.super.init(slot3, self)

	self._hed.action = "fade_in"
	self._hed.level = "generic"
	self._hed.skip_delete_brushes = false
	slot5 = "action"

	table.insert(false, self._save_values)

	slot5 = "level"

	table.insert(false, self._save_values)

	slot5 = "skip_delete_brushes"

	table.insert(false, self._save_values)

	return 
end
function BlackscreenElement:set_element_data(params, ...)
	slot5 = params

	BlackscreenElement.super.set_element_data(slot3, self, ...)

	slot4 = Application
	slot7 = self._hed.level

	Application.trace(slot3, inspect(slot6))

	if params.value == "action" then
		slot4 = self

		self._set_action(slot3)
	end

	return 
end
function BlackscreenElement:_set_action()
	local action = self._hed.action
	slot5 = action == "fade_in"

	self._level.set_enabled(slot3, self._level)

	return 
end
function BlackscreenElement:_build_panel(panel, panel_sizer)
	slot5 = self

	self._create_panel(slot4)

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	local loading_screens = {}
	local all_screens = tweak_data.operations.get_all_loading_screens(slot5)
	slot7 = all_screens

	for level, data in pairs(tweak_data.operations) do
		slot13 = level

		table.insert(slot11, loading_screens)
	end

	slot11 = {
		"fade_in",
		"fade_out",
		"fade_to_black"
	}
	self._action = self._build_value_combobox(slot6, self, panel, panel_sizer, "action")
	slot11 = loading_screens
	self._level = self._build_value_combobox(slot6, self, panel, panel_sizer, "level")

	return 
end

return 
