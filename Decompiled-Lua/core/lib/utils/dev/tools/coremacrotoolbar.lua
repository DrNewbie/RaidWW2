CoreMacroToolbar = CoreMacroToolbar or class()
function CoreMacroToolbar:init(toolbar_panel, toolbar_box, default_icon, macro_file, self_str)
	self._toolbar_panel = toolbar_panel
	self._toolbar_box = toolbar_box
	self._default_icon = default_icon
	self._macro_file = macro_file
	self._self_str = self_str
	slot8 = self

	self.reload_macros(slot7)

	return 
end
function CoreMacroToolbar:reload_macros()
	if self._macros then
		slot3 = self._macros

		for name, macro in pairs(slot2) do
			slot8 = macro._ews

			macro._ews.destroy(slot7)
		end
	end

	self._macros = {}
	slot4 = self._macro_file
	local node = File.parse_xml(slot2, File)

	if node then
		slot4 = node

		for macro in node.children(slot3) do
			slot9 = "icon"
			local icon_path = macro.parameter(slot7, macro)

			if icon_path == "DEFAULT" or icon_path == "" then
				icon_path = self._default_icon
			end

			local name = macro.parameter(slot8, macro)
			self._macros[name] = {
				_ews = EWS.BitmapButton("name", EWS, self._toolbar_panel, icon_path, "")
			}
			slot11 = name

			self._macros[name]._ews.set_tool_tip(EWS.BitmapButton("name", EWS, self._toolbar_panel, icon_path, ""), self._macros[name]._ews)

			slot17 = "code"
			slot11 = "local self = " .. self._self_str .. "; " .. macro.parameter("", macro)
			self._macros[name]._func = loadstring(self._macros[name]._ews)
			slot13 = ""

			self._macros[name]._ews.connect(loadstring(self._macros[name]._ews), self._macros[name]._ews, "EVT_COMMAND_BUTTON_CLICKED", self._macros[name]._func)

			slot12 = "event"
			self._macros[name]._event = macro.parameter(self._macros[name]._ews, macro)
			slot14 = "ALL"

			self._toolbar_box.add(macro.parameter(self._macros[name]._ews, macro), self._toolbar_box, self._macros[name]._ews, 0, 2)
		end

		slot4 = self._toolbar_panel

		self._toolbar_panel.layout(slot3)
	end

	return 
end
function CoreMacroToolbar:trigger_event(event_name)
	if self._macros then
		slot4 = self._macros

		for _, macro in pairs(slot3) do
			if macro._event == event_name then
				macro._func()
			end
		end
	end

	return 
end

return 
