-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot2 = "core/lib/utils/dev/tools/cutscene_editor/CoreCutsceneBatchOptimizer"

require(slot1)
require(slot1)

CoreCutsceneBatchOptimizerDialog = CoreCutsceneBatchOptimizerDialog or class()
local JOB_LIST_FILE_SPEC = "Job List (*.boj)|*.boj"
local commands = CoreCommandRegistry.new("core/lib/utils/dev/tools/cutscene_editor/CoreCutsceneProjectMappingPanel")
slot5 = {
	id = "NEW_JOB_LIST",
	label = "&New Job List",
	key = "Ctrl+N",
	help = "Clears the job list so you can start with a blank slate"
}

commands.add(CoreCommandRegistry, commands)

slot5 = {
	id = "DEFAULT_JOB_LIST",
	label = "&Default Job List",
	key = "Ctrl+D",
	help = "Clears the job list and populates it with all cutscene projects in the database"
}

commands.add(CoreCommandRegistry, commands)

slot5 = {
	id = "OPEN_JOB_LIST",
	label = "&Open Job List...",
	key = "Ctrl+O",
	help = "Opens an existing job list"
}

commands.add(CoreCommandRegistry, commands)

slot5 = {
	id = "SAVE_JOB_LIST",
	label = "&Save Job List",
	key = "Ctrl+S",
	help = "Saves the current job list to disk"
}

commands.add(CoreCommandRegistry, commands)

slot5 = {
	id = "SAVE_JOB_LIST_AS",
	label = "&Save Job List As...",
	help = "Saves the current job list to disk under a new name"
}

commands.add(CoreCommandRegistry, commands)

slot5 = {
	id = "EXIT",
	label = "E&xit",
	help = "Closes this window"
}

commands.add(CoreCommandRegistry, commands)

function CoreCutsceneBatchOptimizerDialog:init(parent_window)
	slot10 = 0
	slot6 = Vector3(slot7, 100, 500)
	slot11 = 0
	slot9 = parent_window
	self.__window = EWS.Frame(slot3, EWS, "Batch Export to Game", slot6, Vector3(100, 400, 400), "DEFAULT_DIALOG_STYLE,RESIZE_BORDER,FRAME_FLOAT_ON_PARENT")
	slot4 = self.__window
	slot7 = "film_reel_16x16.png"

	self.__window.set_icon(slot3, CoreEWS.image_path(slot6))

	slot4 = self.__window
	slot9 = 0

	self.__window.set_min_size(slot3, Vector3(slot6, 400, 321))

	slot4 = self.__window
	slot8 = "3DFACE"

	self.__window.set_background_colour(slot3, EWS.get_system_colour(slot6, EWS) * 255.unpack(slot6))

	slot5 = "EVT_CLOSE_WINDOW"
	slot10 = "_on_exit"

	self.__window.connect(slot3, self.__window, callback(EWS.get_system_colour(slot6, EWS) * 255, self, self))

	local function connect_command(command_id, callback_name, callback_data)
		if not callback_name then
			slot6 = command_id
			callback_name = "_on_" .. string.lower(slot5)
		end

		callback_data = callback_data or ""
		slot12 = callback_name
		slot9 = callback_data

		self.__window.connect(slot4, self.__window, commands.id(slot7, commands), "EVT_COMMAND_MENU_SELECTED", callback(command_id, self, self))

		return 
	end

	slot5 = "NEW_JOB_LIST"

	connect_command(self.__window)

	slot5 = "DEFAULT_JOB_LIST"

	connect_command(self.__window)

	slot5 = "OPEN_JOB_LIST"

	connect_command(self.__window)

	slot5 = "SAVE_JOB_LIST"

	connect_command(self.__window)

	slot5 = "SAVE_JOB_LIST_AS"

	connect_command(self.__window)

	slot5 = "EXIT"

	connect_command(self.__window)

	slot6 = "VERTICAL"
	local sizer = EWS.BoxSizer(self.__window, EWS)
	slot7 = sizer

	self.__window.set_sizer(EWS, self.__window)

	slot9 = "Cutscene Projects to Export"
	local projects_sizer = EWS.StaticBoxSizer(EWS, EWS, self.__window, "VERTICAL")
	slot8 = self.__window
	self.__projects = core_or_local(EWS, "CutsceneProjectMappingPanel")
	slot11 = "EXPAND"

	self.__projects.add_to_sizer(EWS, self.__projects, projects_sizer, 1, 0)

	slot11 = "ALL,EXPAND"

	sizer.add(EWS, sizer, projects_sizer, 1, 5)

	slot8 = self.__window
	local buttons_panel = self._create_buttons_panel(EWS, self)
	slot12 = "ALL,EXPAND"

	sizer.add(self, sizer, buttons_panel, 0, 4)

	slot8 = self.__window
	slot11 = self

	self.__window.set_menu_bar(self, self._create_menu_bar(0))

	slot8 = self.__window
	slot12 = self.__window

	self.__window.set_status_bar(self, EWS.StatusBar(0, EWS))

	slot9 = 0

	self.__window.set_status_bar_pane(self, self.__window)

	slot9 = true

	self.__window.set_visible(self, self.__window)

	return 
end
function CoreCutsceneBatchOptimizerDialog:update(time, delta_time)
	if not self.__window then
		return true
	end

	if self.__progress_dialog then
		slot5 = self.__batch

		assert(slot4)

		local project_count = self.__batch.max_queue_size(slot4)
		local remaining_count = self.__batch.queue_size(self.__batch)
		slot8 = project_count - remaining_count
		slot11 = self
		slot14 = self.__batch
		local was_aborted = not self.__progress_dialog.update_bar(self.__batch, self.__progress_dialog, self._progress_message(slot10, self.__batch.next_project(slot13)))

		if remaining_count == 0 then
			slot8 = self

			self._destroy(slot7)
		else
			slot8 = self.__batch

			self.__batch.consume_project(slot7)
		end
	end

	return false
end
function CoreCutsceneBatchOptimizerDialog:_create_menu_bar()
	local file_menu = commands.wrap_menu(slot2, EWS.Menu(slot5, EWS))
	slot5 = "NEW_JOB_LIST"

	file_menu.append_command(commands, file_menu)

	slot5 = "DEFAULT_JOB_LIST"

	file_menu.append_command(commands, file_menu)

	slot5 = "OPEN_JOB_LIST"

	file_menu.append_command(commands, file_menu)

	slot5 = "SAVE_JOB_LIST"

	file_menu.append_command(commands, file_menu)

	slot5 = "SAVE_JOB_LIST_AS"

	file_menu.append_command(commands, file_menu)

	slot4 = file_menu

	file_menu.append_separator(commands)

	slot5 = "EXIT"

	file_menu.append_command(commands, file_menu)

	local menu_bar = EWS.MenuBar(commands)
	slot8 = file_menu
	slot7 = "&File"

	menu_bar.append(EWS, menu_bar, file_menu.wrapped_object(""))

	return menu_bar
end
function CoreCutsceneBatchOptimizerDialog:_create_buttons_panel(parent)
	slot5 = parent
	local panel = EWS.Panel(slot3, EWS)
	slot6 = "HORIZONTAL"
	local sizer = EWS.BoxSizer(EWS, EWS)
	slot7 = sizer

	panel.set_sizer(EWS, panel)

	slot8 = "Export"
	local export_button = EWS.Button(EWS, EWS, panel)
	slot13 = "_on_export_button_clicked"

	export_button.connect(EWS, export_button, "EVT_COMMAND_BUTTON_CLICKED", callback(export_button, self, self))

	slot9 = "Close"
	local close_button = EWS.Button(EWS, EWS, panel)
	slot14 = "_on_exit"
	slot11 = close_button

	close_button.connect(EWS, close_button, "EVT_COMMAND_BUTTON_CLICKED", callback(self, self, self))

	slot12 = "RIGHT,EXPAND"

	sizer.add(EWS, sizer, export_button, 1, 1)

	slot12 = "LEFT,EXPAND"

	sizer.add(EWS, sizer, close_button, 1, 2)

	return panel
end
function CoreCutsceneBatchOptimizerDialog:_destroy()
	slot3 = self.__progress_dialog

	if alive(slot2) then
		slot3 = self.__progress_dialog

		self.__progress_dialog.destroy(slot2)
	end

	self.__progress_dialog = nil

	if self.__projects then
		slot3 = self.__projects

		self.__projects.destroy(slot2)
	end

	self.__projects = nil
	slot3 = self.__window

	if alive(slot2) then
		slot3 = self.__window

		self.__window.destroy(slot2)
	end

	self.__window = nil
	self.__batch = nil

	return 
end
function CoreCutsceneBatchOptimizerDialog:_progress_message(project)
	if project == nil then
		slot2 = "Done!"
	else
		slot5 = project
		slot2 = string.format(slot3, "Exporting %s")
	end

	return slot2
end
function CoreCutsceneBatchOptimizerDialog:_open_job_list(input_path)
	local mappings = read_lua_representation_from_path(slot3)
	slot6 = mappings

	self.__projects.set_mappings(input_path, self.__projects)

	self.__current_job_list_path = input_path

	return 
end
function CoreCutsceneBatchOptimizerDialog:_save_job_list(output_path)
	local mappings = self.__projects.mappings(slot3)
	slot6 = output_path

	write_lua_representation_to_path(self.__projects, mappings)

	self.__current_job_list_path = output_path

	return 
end
function CoreCutsceneBatchOptimizerDialog:_default_mappings_for_all_projects()
	slot4 = "cutscene_project"
	local project_names = managers.database.list_entries_of_type(slot2, managers.database)

	function slot5(_, name)
		slot6 = name

		return name, self._default_optimized_cutscene_name(slot4, self)
	end

	local mappings = table.remap(managers.database, project_entries)

	return mappings
end
function CoreCutsceneBatchOptimizerDialog:_default_optimized_cutscene_name(project_name)
	slot9 = ""
	slot7 = ""

	return "optimized_" .. string.gsub(slot4, string.gsub(slot6, project_name, "^story_"), "^optimized_")
end
function CoreCutsceneBatchOptimizerDialog:_request_input_file_from_user(message, wildcard)

	-- Decompilation error in this vicinity:
	slot13 = "Must supply a wildcard spec. Check wxWidgets docs."
	local dialog = EWS.FileDialog(slot4, EWS, self.__window, message, "", "", assert("OPEN,FILE_MUST_EXIST", wildcard))
	slot6 = dialog
end
function CoreCutsceneBatchOptimizerDialog:_request_output_file_from_user(message, wildcard, default_file)

	-- Decompilation error in this vicinity:
	slot14 = "Must supply a wildcard spec. Check wxWidgets docs."
	local dialog = EWS.FileDialog(slot5, EWS, self.__window, message, "", default_file or "", assert("SAVE,OVERWRITE_PROMPT", wildcard))
	slot7 = dialog
end
function CoreCutsceneBatchOptimizerDialog:_on_export_button_clicked(sender)
	local projects_to_export = self.__projects.mappings(slot3)
	slot5 = projects_to_export

	if not table.empty(self.__projects) then
		slot5 = "CutsceneBatchOptimizer"
		self.__batch = core_or_local(slot4)
		slot5 = projects_to_export

		for project, output in pairs(slot4) do
			slot12 = output

			self.__batch.add_project(slot9, self.__batch, project)
		end

		slot11 = self.__batch
		self.__progress_dialog = EWS.ProgressDialog(slot4, EWS, self.__window, "Exporting Projects...", "Preparing export", self.__batch.queue_size("PD_AUTO_HIDE,PD_APP_MODAL,PD_CAN_ABORT,PD_REMAINING_TIME"))
		slot6 = true

		self.__progress_dialog.set_visible(slot4, self.__progress_dialog)
	end

	return 
end
function CoreCutsceneBatchOptimizerDialog:_on_new_job_list()
	slot4 = "clearing"
	local ok_to_proceed = self._verify_user_intent(slot2, self)

	if ok_to_proceed then
		slot4 = self.__projects

		self.__projects.clear(slot3)

		self.__current_job_list_path = nil
	end

	return ok_to_proceed
end
function CoreCutsceneBatchOptimizerDialog:_on_default_job_list()
	slot3 = self
	local ok_to_proceed = self._on_new_job_list(slot2)

	if ok_to_proceed then
		slot4 = self.__projects
		slot7 = self

		self.__projects.set_mappings(slot3, self._default_mappings_for_all_projects(slot6))
	end

	return 
end
function CoreCutsceneBatchOptimizerDialog:_on_open_job_list()
	slot4 = "opening"
	local ok_to_proceed = self._verify_user_intent(slot2, self)

	if ok_to_proceed then
		slot6 = JOB_LIST_FILE_SPEC
		local input_path = self._request_input_file_from_user(slot3, self, "Open Job List")

		if input_path then
			slot6 = input_path

			self._open_job_list(slot4, self)
		end
	end

	return 
end
function CoreCutsceneBatchOptimizerDialog:_on_save_job_list()
	if self.__current_job_list_path then
		slot4 = self.__current_job_list_path

		self._save_job_list(slot2, self)

		return true
	else
		slot3 = self

		return self._on_save_job_list_as(slot2)
	end

	return 
end
function CoreCutsceneBatchOptimizerDialog:_on_save_job_list_as()
	slot6 = "untitled.boj"
	local output_path = self._request_output_file_from_user(slot2, self, "Save Job List", JOB_LIST_FILE_SPEC)

	if output_path then
		slot5 = output_path

		self._save_job_list(slot3, self)
	end

	return output_path ~= nil
end
function CoreCutsceneBatchOptimizerDialog:_on_exit()
	slot4 = "closing"
	local ok_to_proceed = self._verify_user_intent(slot2, self)

	if ok_to_proceed then
		slot4 = self

		self._destroy(slot3)
	end

	return ok_to_proceed
end
function CoreCutsceneBatchOptimizerDialog:_verify_user_intent(operation)
	slot6 = self.__projects

	if table.empty(self.__projects.mappings(slot5)) then
		return true
	end

	slot8 = "YES_NO,CANCEL,YES_DEFAULT,ICON_EXCLAMATION"
	slot4 = EWS.MessageDialog(slot3, EWS, self.__window, "Do you want to save the current job list before " .. operation .. "?", "Save Changes?")
	local choice = EWS.MessageDialog(slot3, EWS, self.__window, "Do you want to save the current job list before " .. operation .. "?", "Save Changes?").show_modal(slot3)

	if choice == "ID_YES" then
		slot5 = self

		if not self._on_save_job_list(slot4) then
			return false
		end
	elseif choice == "ID_CANCEL" then
		return false
	end

	return true
end

return 
