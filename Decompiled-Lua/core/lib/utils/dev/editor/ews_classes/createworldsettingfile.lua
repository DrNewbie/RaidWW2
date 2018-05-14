if not CreateWorldSettingFile then
	slot2 = CoreEditorEwsDialog
	slot0 = class(slot1)
end

CreateWorldSettingFile = slot0
function CreateWorldSettingFile:init(params)
	slot12 = 0
	slot13 = 0
	slot10 = "DEFAULT_DIALOG_STYLE,RESIZE_BORDER,STAY_ON_TOP"

	CoreEditorEwsDialog.init(slot3, self, nil, "World Setting", "", Vector3(slot9, 300, 150), Vector3(300, 200, 400))

	slot5 = "VERTICAL"

	self.create_panel(slot3, self)

	slot8 = "EXPAND"

	self._dialog_sizer.add(slot3, self._dialog_sizer, self._panel, 1, 0)

	slot5 = "HORIZONTAL"
	local button_sizer = EWS.BoxSizer(slot3, EWS)

	if params.path then
		slot5 = self
		slot9 = params.path
		local t = self._parse_file(slot4, managers.database.entry_path(slot7, managers.database))

		if not t then
			return 
		end

		self._path = params.path
		slot7 = t

		self._add_continent_cbs(slot5, self)

		slot10 = ""
		local save_btn = EWS.Button(slot5, EWS, self._panel, "Save", "")
		slot11 = "RIGHT,LEFT"

		button_sizer.add(EWS, button_sizer, save_btn, 0, 2)

		slot13 = "on_save"
		slot10 = ""

		save_btn.connect(EWS, save_btn, "EVT_COMMAND_BUTTON_CLICKED", callback(2, self, self))
	else
		self._name = params.name
		self._dir = params.dir
		self._path = params.dir .. "/" .. params.name .. ".world_setting"
		slot5 = self

		self._add_continent_cbs("/")

		slot9 = ""
		local create_btn = EWS.Button("/", EWS, self._panel, "Create", "")
		slot10 = "RIGHT,LEFT"

		button_sizer.add(EWS, button_sizer, create_btn, 0, 2)

		slot12 = "on_create"
		slot9 = ""

		create_btn.connect(EWS, create_btn, "EVT_COMMAND_BUTTON_CLICKED", callback(2, self, self))
	end

	slot9 = ""
	local cancel_btn = EWS.Button(slot4, EWS, self._panel, "Cancel", "")
	slot10 = "RIGHT,LEFT"

	button_sizer.add(EWS, button_sizer, cancel_btn, 0, 2)

	slot12 = "on_cancel"

	cancel_btn.connect(EWS, cancel_btn, "EVT_COMMAND_BUTTON_CLICKED", callback(2, self, self))

	slot12 = "key_cancel"
	slot9 = ""

	cancel_btn.connect(EWS, cancel_btn, "EVT_KEY_DOWN", callback("", self, self))

	slot10 = "ALIGN_RIGHT"

	self._panel_sizer.add(EWS, self._panel_sizer, button_sizer, 0, 0)

	slot6 = self._dialog

	self._dialog.show_modal(EWS)

	return 
end
function CreateWorldSettingFile:_add_continent_cbs(params)
	self._cbs = {}
	slot7 = "Exclude continents"
	local sizer = EWS.StaticBoxSizer(slot3, EWS, self._panel, "VERTICAL")
	slot3 = pairs

	if not params then
		slot7 = managers.editor
		slot5 = managers.editor.continents(slot6)
	end

	for name, _ in slot3(slot4) do
		slot14 = "ALIGN_LEFT"
		local cb = EWS.CheckBox(slot9, EWS, self._panel, name, "")
		slot15 = "EXPAND"

		sizer.add(EWS, sizer, cb, 0, 0)

		slot12 = (params and params[name]) or false

		cb.set_value(slot10, cb)

		self._cbs[name] = cb
	end

	slot9 = "EXPAND"

	self._panel_sizer.add(slot4, self._panel_sizer, sizer, 1, 0)

	return 
end
function CreateWorldSettingFile:on_create()
	local t = {}
	slot4 = self._cbs

	for name, cb in pairs(slot3) do
		slot9 = cb
		t[name] = cb.get_value(slot8)
	end

	slot6 = "w"
	local settings = SystemFS.open(slot3, SystemFS, self._path)
	slot5 = settings
	slot9 = t

	settings.puts(SystemFS, ScriptSerializer.to_generic_xml(slot7, ScriptSerializer))

	slot6 = settings

	SystemFS.close(SystemFS, SystemFS)

	slot5 = self

	self.end_modal(SystemFS)

	slot6 = self._path

	self._compile(SystemFS, self)

	return 
end
function CreateWorldSettingFile:_compile(path)
	local t = {
		target_db_name = "all",
		send_idstrings = false,
		preprocessor_definitions = "preprocessor_definitions",
		verbose = false
	}
	slot7 = SystemInfo
	slot7 = SystemInfo.platform(slot6)
	t.platform = string.lower(SystemInfo.platform(slot6).s(slot6))
	slot5 = managers.database
	t.source_root = managers.database.root_path(slot4) .. "/assets"
	t.target_db_root = Application.base_path("/assets") .. "assets"
	slot7 = path
	t.source_files = {
		managers.database.entry_path_with_properties(Application, managers.database)
	}
	slot6 = t

	Application.data_compile(managers.database.entry_path_with_properties, Application)

	slot5 = DB

	DB.reload(managers.database.entry_path_with_properties)

	slot5 = managers.database

	managers.database.clear_all_cached_indices(managers.database.entry_path_with_properties)

	return 
end
function CreateWorldSettingFile:on_save()
	slot3 = self

	self.on_create(slot2)

	return 
end
function CreateWorldSettingFile:_serialize_to_script(type, name)
	slot6 = type.id(slot7)
	slot9 = name

	return PackageManager.editor_load_script_data(slot4, PackageManager, name.id(type))
end
function CreateWorldSettingFile:_parse_file(path)
	slot6 = path

	if not DB.has(slot3, DB, "world_setting") then
		return 
	end

	slot9 = path
	local settings = SystemFS.parse_xml(slot3, managers.database.entry_expanded_path(slot6, managers.database, "world_setting"))
	slot5 = settings

	if settings.name(SystemFS) == "settings" then
		local t = {}
		slot6 = settings

		for continent in settings.children(slot5) do
			slot11 = "name"
			slot14 = "exclude"
			t[continent.parameter(slot9, continent)] = toboolean(continent.parameter(slot12, continent))
		end

		return t
	else
		slot7 = path

		return self._serialize_to_script(slot4, self, "world_setting")
	end

	return 
end
function CreateWorldSettingFile:on_cancel()
	slot3 = self

	self.end_modal(slot2)

	return 
end

return 
