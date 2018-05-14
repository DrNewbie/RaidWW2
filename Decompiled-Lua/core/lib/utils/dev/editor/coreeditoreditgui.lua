slot3 = "CoreEngineAccess"

core.import(slot1, core)

slot3 = "CoreEditorUtils"

core.import(slot1, core)

EditGui = EditGui or class()
function EditGui:init(parent, toolbar, btn, name)
	slot10 = "TAB_TRAVERSAL"
	self._panel = EWS.Panel(slot6, EWS, parent, "")
	slot10 = name
	self._main_sizer = EWS.StaticBoxSizer(slot6, EWS, self._panel, "HORIZONTAL")
	slot8 = self._main_sizer

	self._panel.set_sizer(slot6, self._panel)

	self._toolbar = toolbar
	self._btn = btn
	self._ctrls = {
		unit = nil
	}
	slot8 = false

	self.set_visible(nil, self)

	return 
end
function EditGui:has(unit)
	slot4 = unit

	if alive(slot3) then
	else
		slot4 = self

		self.disable(slot3)

		return false
	end

	return 
end
function EditGui:disable()
	self._ctrls.unit = nil
	slot5 = false

	self._toolbar.set_tool_enabled(nil, self._toolbar, self._btn)

	slot5 = false

	self._toolbar.set_tool_state(nil, self._toolbar, self._btn)

	slot4 = false

	self.set_visible(nil, self)

	return 
end
function EditGui:set_visible(vis)
	self._visible = vis
	slot5 = vis

	self._panel.set_visible(slot3, self._panel)

	slot4 = self._panel

	self._panel.layout(slot3)

	return 
end
function EditGui:visible()
	return self._visible
end
function EditGui:get_panel()
	return self._panel
end

return 
