slot3 = "CoreEditorUtils"

core.import(slot1, core)

if not EditUnitDialog then
	slot2 = CoreEditorEwsDialog
	slot0 = class(slot1)
end

EditUnitDialog = slot0
function EditUnitDialog:init(toolbar, btn)
	slot13 = 0
	slot14 = 0
	slot11 = "DEFAULT_DIALOG_STYLE,RESIZE_BORDER,MINIMIZE_BOX,MAXIMIZE_BOX"

	CoreEditorEwsDialog.init(slot4, self, nil, "Edit Unit", "", Vector3(slot10, 300, 150), Vector3(300, 360, 338))

	slot6 = "VERTICAL"

	self.create_panel(slot4, self)

	slot11 = "dialog_closed"

	self._dialog.connect(slot4, self._dialog, "EVT_CLOSE_WINDOW", callback("", self, self))

	slot11 = "key_cancel"
	slot8 = ""

	self._dialog.connect(slot4, self._dialog, "EVT_KEY_DOWN", callback("", self, self))

	self._pages = {}
	self._notebook = EWS.Notebook(slot4, EWS, self._panel, "")
	slot11 = "key_cancel"
	slot8 = ""

	self._notebook.connect(slot4, self._notebook, "EVT_KEY_DOWN", callback("NB_TOP,NB_MULTILINE", self, self))

	slot9 = "EXPAND"

	self._panel_sizer.add(slot4, self._panel_sizer, self._notebook, 1, 0)

	slot9 = "EXPAND"

	self._dialog_sizer.add(slot4, self._dialog_sizer, self._panel, 1, 0)

	return 
end
function EditUnitDialog:add_page(data)
	local name = data.name
	local start_page = data.start_page
	local class = data.class
	local panel = EWS.ScrolledWindow(slot6, EWS, self._notebook, "")
	slot8 = panel
	slot13 = 0

	panel.set_scroll_rate(EWS, Vector3("VSCROLL,TAB_TRAVERSAL", 0, 1))

	slot13 = 0
	slot9 = Vector3("VSCROLL,TAB_TRAVERSAL", 0, 0)
	slot14 = -1

	panel.set_virtual_size_hints(EWS, panel, Vector3(0, 1, -1))

	slot9 = "VERTICAL"
	local sizer = EWS.BoxSizer(EWS, EWS)
	slot10 = sizer

	panel.set_sizer(EWS, panel)

	slot12 = start_page
	local nr = self._notebook.add_page(EWS, self._notebook, panel, name)
	slot11 = {
		name = name,
		class = class,
		panel = panel,
		nr = nr
	}

	table.insert(self._notebook, self._pages)

	return panel, sizer
end
function EditUnitDialog:set_enabled(unit, units)
	slot5 = self._pages

	for _, page in ipairs(slot4) do
		if page.class then
			slot11 = true

			page.panel.set_enabled(slot9, page.panel)

			slot10 = page.panel
			slot15 = units

			page.panel.set_enabled(slot9, page.class.is_editable(slot12, page.class, unit))

			slot14 = page.panel
			slot12 = (page.panel.enabled(page.class) and page.name .. "*") or page.name

			self._notebook.set_page_text(slot9, self._notebook, page.nr)
		end
	end

	return 
end
function EditUnitDialog:update(t, dt)
	slot5 = self
	local current_page = self._current_page(slot4)

	if current_page then
		slot8 = dt

		current_page.class.update(slot5, current_page.class, t)
	end

	return 
end
function EditUnitDialog:_current_page()
	slot3 = self._dialog

	if not self._dialog.visible(slot2) then
		return nil
	end

	slot3 = self._pages

	for i, page in ipairs(slot2) do
		slot10 = page.nr

		if self._notebook.get_current_page(slot7) == self._notebook.get_page(self._notebook, self._notebook) then
			return page
		end
	end

	return 
end
function EditUnitDialog:dialog_closed(data, event)
	slot5 = self._pages

	for _, page in ipairs(slot4) do
		if page.class then
			slot10 = page.class

			page.class.dialog_closed(slot9)
		end
	end

	slot5 = event

	event.skip(slot4)

	return 
end
EditUnitBase = EditUnitBase or class()
function EditUnitBase:init()
	self._debug = false
	slot3 = Draw
	self._brush = Draw.brush(slot2)
	slot3 = Draw
	self._pen = Draw.pen(slot2)

	return 
end
function EditUnitBase:update()
	return 
end
function EditUnitBase:dialog_closed()
	return 
end
function EditUnitBase:update_debug(ctrlr)
	slot4 = ctrlr
	self._debug = ctrlr.get_value(slot3)

	return 
end

return 
