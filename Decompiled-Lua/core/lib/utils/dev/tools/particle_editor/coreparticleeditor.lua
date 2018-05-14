-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreEngineAccess"

core.import(slot1, core)

slot2 = "core/lib/utils/dev/tools/particle_editor/CoreParticleEditorUtil"

require(slot1)

slot2 = "core/lib/utils/dev/tools/particle_editor/CoreParticleEditorProperties"

require(slot1)

slot2 = "core/lib/utils/dev/tools/particle_editor/CoreParticleEditorEffect"

require(slot1)

slot2 = "core/lib/utils/dev/tools/particle_editor/CoreParticleEditorInitializers"

require(slot1)

slot2 = "core/lib/utils/dev/tools/particle_editor/CoreParticleEditorSimulators"

require(slot1)

slot2 = "core/lib/utils/dev/tools/particle_editor/CoreParticleEditorVisualizers"

require(slot1)

slot2 = "core/lib/utils/dev/tools/particle_editor/CoreParticleEditorPanel"

require(slot1)

function collect_members(cls, m)
	slot4 = cls

	for funcname, funcobj in pairs(slot3) do
		slot10 = "create_"

		if funcname.find(slot8, funcname) then
			slot11 = ""
			local fn = funcname.gsub(slot8, funcname, "create_")
			m[fn] = funcobj
		end
	end

	return 
end

function collect_member_names(members, member_names)
	slot4 = members

	for k, v in pairs(slot3) do
		local vi = v()
		slot11 = {
			ui_name = vi.ui_name(slot13),
			key = k
		}
		slot14 = vi

		table.insert(slot9, member_names)
	end

	function slot5(a, b)
		return a.ui_name < b.ui_name
	end

	table.sort(slot3, member_names)

	return 
end

stack_members = {
	initializer = {},
	simulator = {},
	visualizer = {}
}
stack_member_names = {
	initializer = {},
	simulator = {},
	visualizer = {}
}
slot3 = stack_members.initializer

collect_members(, CoreParticleEditorInitializers)

slot3 = stack_members.simulator

collect_members(, CoreParticleEditorSimulators)

slot3 = stack_members.visualizer

collect_members(, CoreParticleEditorVisualizers)

slot3 = stack_member_names.initializer

collect_member_names(, stack_members.initializer)

slot3 = stack_member_names.simulator

collect_member_names(, stack_members.simulator)

slot3 = stack_member_names.visualizer

collect_member_names(, stack_members.visualizer)

CoreParticleEditor = CoreParticleEditor or class()
function CoreParticleEditor:init()
	if managers.editor then
		slot4 = true

		managers.editor.set_listener_enabled(slot2, managers.editor)
	end

	self._gizmo_movement = "NO_MOVE"
	self._gizmo_accum = 0
	slot5 = 100
	self._gizmo_anchor = Vector3(slot2, 0, 300)
	self._effects = {}
	slot3 = self

	self.create_main_frame(slot2)

	slot3 = self._main_frame

	self._main_frame.update(slot2)

	slot3 = self

	self.start_dialog(slot2)

	slot5 = true

	CoreEWS.check_news(slot2, self._main_frame, "particle_editor")

	return 
end
function CoreParticleEditor:start_dialog()
	slot11 = 0
	slot12 = 0
	slot9 = "DEFAULT_DIALOG_STYLE"
	local dialog = EWS.Dialog(slot2, EWS, self._main_frame, "Tsar Bomba Particle Editor : Choose...", "", Vector3(slot8, -1, -1), Vector3(-1, 400, 400))

	local function on_new(dialog)
		slot4 = "NEW"

		dialog.end_modal(slot2, dialog)

		return 
	end

	local function on_empty_new(dialog)
		slot4 = "EMPTY_NEW"

		dialog.end_modal(slot2, dialog)

		return 
	end

	local function on_load(dialog)
		slot4 = "LOAD"

		dialog.end_modal(slot2, dialog)

		return 
	end

	slot11 = "BU_EXACTFIT"
	local new_empty_button = EWS.Button("", EWS, dialog, "New Empty Effect", "")
	slot11 = dialog

	new_empty_button.connect(EWS, new_empty_button, "EVT_COMMAND_BUTTON_CLICKED", on_empty_new)

	slot12 = "BU_EXACTFIT"
	local new_button = EWS.Button(EWS, EWS, dialog, "New Effect...", "")
	slot12 = dialog

	new_button.connect(EWS, new_button, "EVT_COMMAND_BUTTON_CLICKED", on_new)

	slot13 = "BU_EXACTFIT"
	local load_button = EWS.Button(EWS, EWS, dialog, "Open Effect...", "")
	slot13 = dialog

	load_button.connect(EWS, load_button, "EVT_COMMAND_BUTTON_CLICKED", on_load)

	slot11 = "VERTICAL"
	local top_sizer = EWS.BoxSizer(EWS, EWS)
	slot15 = "ALL,ALIGN_CENTER_HORIZONTAL"

	top_sizer.add(EWS, top_sizer, new_empty_button, 0, 4)

	slot15 = "ALL,ALIGN_CENTER_HORIZONTAL"

	top_sizer.add(EWS, top_sizer, new_button, 0, 4)

	slot15 = "ALL,ALIGN_CENTER_HORIZONTAL"

	top_sizer.add(EWS, top_sizer, load_button, 0, 4)

	slot12 = top_sizer

	dialog.set_sizer(EWS, dialog)

	slot11 = dialog

	dialog.fit(EWS)

	slot12 = "BOTH"

	dialog.center(EWS, dialog)

	slot11 = dialog
	local ret = dialog.show_modal(EWS)

	if ret == "ID_CANCEL" then
		slot13 = "Particle Editor"

		managers.toolhub.close(slot11, managers.toolhub)
	elseif ret == "NEW" then
		slot12 = self

		self.on_new(slot11)
	elseif ret == "EMPTY_NEW" then
		slot12 = self
		slot15 = CoreEffectDefinition

		self.add_effect(slot11, CoreEffectDefinition.new(slot14))
	elseif ret == "LOAD" then
		slot12 = self

		self.on_open(slot11)
	else
		slot13 = "Particle Editor"

		managers.toolhub.close(slot11, managers.toolhub)
	end

	return 
end
function CoreParticleEditor:new_dialog()
	slot11 = 0
	slot12 = 0
	slot9 = "DEFAULT_DIALOG_STYLE"
	local dialog = EWS.Dialog(slot2, EWS, self._main_frame, "Create New Effect", "", Vector3(slot8, -1, -1), Vector3(-1, 300, 400))

	local function on_new(dialog)
		slot4 = "NEW"

		dialog.end_modal(slot2, dialog)

		return 
	end

	local function on_create(dialog)
		slot4 = "CREATE"

		dialog.end_modal(slot2, dialog)

		return 
	end

	local function on_select_type(combo_desc)
		local combo = combo_desc.combo
		local desc_ctrl = combo_desc.desc
		local desc = ""
		slot7 = desc

		desc_ctrl.set_value(slot5, desc_ctrl)

		return 
	end

	slot11 = "CB_DROPDOWN,CB_READONLY"
	local type_combo = EWS.ComboBox("", EWS, dialog, "", "")
	slot12 = "ST_NO_AUTORESIZE"
	local description_text = EWS.StaticText(EWS, EWS, dialog, "", "")
	slot12 = {
		combo = type_combo,
		desc = description_text
	}

	type_combo.connect(EWS, type_combo, "EVT_COMMAND_TEXT_UPDATED", on_select_type)

	slot12 = "template_effect"

	for _, name in ipairs(managers.database.list_entries_of_type("EVT_COMMAND_TEXT_UPDATED", managers.database)) do
		slot15 = name

		type_combo.append(slot13, type_combo)

		slot15 = name

		type_combo.set_value(slot13, type_combo)
	end

	slot9 = {
		combo = type_combo,
		desc = description_text
	}

	on_select_type(slot8)

	slot13 = "BU_EXACTFIT"
	local create_button = EWS.Button(slot8, EWS, dialog, "Create", "")
	slot13 = dialog

	create_button.connect(EWS, create_button, "EVT_COMMAND_BUTTON_CLICKED", on_create)

	slot11 = "VERTICAL"
	local top_sizer = EWS.BoxSizer(EWS, EWS)
	slot15 = "ALL,EXPAND"

	top_sizer.add(EWS, top_sizer, type_combo, 0, 4)

	slot15 = "ALL,ALIGN_CENTER_HORIZONTAL,EXPAND"

	top_sizer.add(EWS, top_sizer, description_text, 1, 4)

	slot15 = "ALL,EXPAND"

	top_sizer.add(EWS, top_sizer, create_button, 0, 4)

	slot12 = top_sizer

	dialog.set_sizer(EWS, dialog)

	slot11 = dialog
	local ret = dialog.show_modal(EWS)

	if ret == "ID_CANCEL" then
	elseif ret == "CREATE" then
		local t = type_combo.get_value(slot11)
		slot14 = ""
		local effect = CoreEffectDefinition.new(type_combo, CoreEffectDefinition)
		slot14 = effect
		slot19 = t

		effect.load(CoreEffectDefinition, DB.load_node(slot16, DB, "template_effect"))

		slot15 = effect

		self.add_effect(CoreEffectDefinition, self)
	end

	return 
end
function CoreParticleEditor:create_main_frame()
	slot9 = -1
	slot10 = -1
	slot8 = Global.frame
	self._main_frame = EWS.Frame(slot2, EWS, "Tsar Bomba Particle Editor", Vector3(slot6, -1, -1), Vector3(-1, 1000, 800), "DEFAULT_FRAME_STYLE,FRAME_FLOAT_ON_PARENT")
	local menu_bar = EWS.MenuBar(slot2)
	slot5 = ""
	local file_menu = EWS.Menu(EWS, EWS)
	slot8 = ""

	file_menu.append_item(EWS, file_menu, "NEW", "New effect...")

	slot8 = ""

	file_menu.append_item(EWS, file_menu, "OPEN", "Open effect...")

	slot8 = ""

	file_menu.append_item(EWS, file_menu, "SAVE", "Save\tctrl-s")

	slot8 = ""

	file_menu.append_item(EWS, file_menu, "SAVE_AS", "Save As...")

	slot8 = ""

	file_menu.append_item(EWS, file_menu, "CLOSE_EFFECT", "Close\tctrl-w")

	slot8 = ""

	file_menu.append_item(EWS, file_menu, "EXIT", "Exit")

	slot7 = "File"

	menu_bar.append(EWS, menu_bar, file_menu)

	slot6 = ""
	local edit_menu = EWS.Menu(EWS, EWS)
	slot8 = "Undo\tCtrl-Z"

	edit_menu.append_item(EWS, edit_menu, "UNDO")

	slot8 = "Redo\tCtrl-Y"

	edit_menu.append_item(EWS, edit_menu, "REDO")

	slot8 = "Edit"

	menu_bar.append(EWS, menu_bar, edit_menu)

	slot7 = ""
	local effect_menu = EWS.Menu(EWS, EWS)
	slot10 = ""

	effect_menu.append_item(EWS, effect_menu, "PLAY", "Play\tF1")

	slot10 = ""

	effect_menu.append_item(EWS, effect_menu, "PLAY_LOW", "Play Lowest Quality Once\tF2")

	slot10 = ""

	effect_menu.append_item(EWS, effect_menu, "PLAY_HIGH", "Play Highest Quality Once\tF3")

	slot9 = "Effect"

	menu_bar.append(EWS, menu_bar, effect_menu)

	slot8 = ""
	local gizmo_menu = EWS.Menu(EWS, EWS)
	self._gizmo_menu = gizmo_menu
	slot10 = "Move Effect Gizmo To Origo"

	gizmo_menu.append_item(EWS, gizmo_menu, "MOVE_TO_ORIGO")

	slot10 = "Move Effect Gizmo In Front Of Camera"

	gizmo_menu.append_item(EWS, gizmo_menu, "MOVE_TO_CAMERA")

	slot10 = "Move Effect Gizmo To Player"

	gizmo_menu.append_item(EWS, gizmo_menu, "MOVE_TO_PLAYER")

	slot8 = gizmo_menu

	gizmo_menu.append_separator(EWS)

	slot10 = "Do Not Move Effect Gizmo"

	gizmo_menu.append_radio_item(EWS, gizmo_menu, "PARENT_NO_MOVE")

	slot10 = "Move Effect Gizmo In Jump Pattern"

	gizmo_menu.append_radio_item(EWS, gizmo_menu, "PARENT_JUMP")

	slot10 = "Move Effect Gizmo In Smooth Pattern"

	gizmo_menu.append_radio_item(EWS, gizmo_menu, "PARENT_SMOOTH")

	slot10 = "Move Effect Gizmo In Circle Pattern"

	gizmo_menu.append_radio_item(EWS, gizmo_menu, "PARENT_CIRCLE")

	slot10 = true

	gizmo_menu.set_checked(EWS, gizmo_menu, "PARENT_NO_MOVE")

	slot8 = gizmo_menu

	gizmo_menu.append_separator(EWS)

	slot10 = "Zero Effect Gizmo Rotation"

	gizmo_menu.append_item(EWS, gizmo_menu, "ZERO_ROTATION")

	slot10 = "Effect Gizmo Rotation Z To Positive Y"

	gizmo_menu.append_item(EWS, gizmo_menu, "SET_POSITIVE_Y")

	slot10 = "Effect Gizmo Rotation Z To Negative Y"

	gizmo_menu.append_item(EWS, gizmo_menu, "SET_NEGATIVE_Y")

	slot10 = "Effect Gizmo Rotation Z To Positive X"

	gizmo_menu.append_item(EWS, gizmo_menu, "SET_POSITIVE_X")

	slot10 = "Effect Gizmo Rotation Z To Negative X"

	gizmo_menu.append_item(EWS, gizmo_menu, "SET_NEGATIVE_X")

	slot10 = "Effect Gizmo"

	menu_bar.append(EWS, menu_bar, gizmo_menu)

	slot9 = ""
	self._view_menu = EWS.Menu(EWS, EWS)
	slot11 = ""

	self._view_menu.append_check_item(EWS, self._view_menu, "DEBUG_DRAWING", "Enable Debug Drawing (atom bounding volumes etc.)")

	slot11 = ""

	self._view_menu.append_check_item(EWS, self._view_menu, "EFFECT_STATS", "Performance And Analysis Stats")

	slot8 = self._view_menu

	self._view_menu.append_separator(EWS)

	slot11 = ""

	self._view_menu.append_check_item(EWS, self._view_menu, "SHOW_STACK_OVERVIEW", "Show a graph of all operation stacks and channel reads/writes")

	slot10 = "View"

	menu_bar.append(EWS, menu_bar, self._view_menu)

	slot9 = ""
	local batch_menu = EWS.Menu(EWS, EWS)
	slot11 = "Batch all effects, remove update_render policy for effects not screen aligned"

	batch_menu.append_item(EWS, batch_menu, "BATCH_ALL_REMOVE_UPDATE_RENDER")

	slot11 = "Load and unload all effects"

	batch_menu.append_item(EWS, batch_menu, "BATCH_ALL_LOAD_UNLOAD")

	slot11 = "Batch"

	menu_bar.append(EWS, menu_bar, batch_menu)

	slot10 = menu_bar

	self._main_frame.set_menu_bar(EWS, self._main_frame)

	slot16 = "on_new"

	self._main_frame.connect(EWS, self._main_frame, "NEW", "EVT_COMMAND_MENU_SELECTED", callback(slot13, self, self))

	slot16 = "on_open"

	self._main_frame.connect(EWS, self._main_frame, "OPEN", "EVT_COMMAND_MENU_SELECTED", callback("", self, self))

	slot16 = "on_save"

	self._main_frame.connect(EWS, self._main_frame, "SAVE", "EVT_COMMAND_MENU_SELECTED", callback("", self, self))

	slot16 = "on_save_as"

	self._main_frame.connect(EWS, self._main_frame, "SAVE_AS", "EVT_COMMAND_MENU_SELECTED", callback("", self, self))

	slot16 = "on_close_effect"

	self._main_frame.connect(EWS, self._main_frame, "CLOSE_EFFECT", "EVT_COMMAND_MENU_SELECTED", callback("", self, self))

	slot16 = "on_close"

	self._main_frame.connect(EWS, self._main_frame, "EXIT", "EVT_COMMAND_MENU_SELECTED", callback("", self, self))

	slot16 = "on_close"

	self._main_frame.connect(EWS, self._main_frame, "", "EVT_CLOSE_WINDOW", callback("", self, self))

	slot16 = "on_undo"

	self._main_frame.connect(EWS, self._main_frame, "UNDO", "EVT_COMMAND_MENU_SELECTED", callback("", self, self))

	slot16 = "on_redo"

	self._main_frame.connect(EWS, self._main_frame, "REDO", "EVT_COMMAND_MENU_SELECTED", callback("", self, self))

	slot16 = "on_play"

	self._main_frame.connect(EWS, self._main_frame, "PLAY", "EVT_COMMAND_MENU_SELECTED", callback("", self, self))

	slot16 = "on_play_lowest"

	self._main_frame.connect(EWS, self._main_frame, "PLAY_LOW", "EVT_COMMAND_MENU_SELECTED", callback("", self, self))

	slot16 = "on_play_highest"

	self._main_frame.connect(EWS, self._main_frame, "PLAY_HIGH", "EVT_COMMAND_MENU_SELECTED", callback("", self, self))

	slot16 = "on_move_gizmo_to_origo"

	self._main_frame.connect(EWS, self._main_frame, "MOVE_TO_ORIGO", "EVT_COMMAND_MENU_SELECTED", callback("", self, self))

	slot16 = "on_move_gizmo_to_camera"

	self._main_frame.connect(EWS, self._main_frame, "MOVE_TO_CAMERA", "EVT_COMMAND_MENU_SELECTED", callback("", self, self))

	slot16 = "on_move_gizmo_to_player"

	self._main_frame.connect(EWS, self._main_frame, "MOVE_TO_PLAYER", "EVT_COMMAND_MENU_SELECTED", callback("", self, self))

	slot16 = "on_reset_gizmo_rotation"

	self._main_frame.connect(EWS, self._main_frame, "ZERO_ROTATION", "EVT_COMMAND_MENU_SELECTED", callback("", self, self))

	slot12 = callback("", self, self)
	slot19 = 0
	slot16 = -90

	self._main_frame.connect(EWS, self._main_frame, "SET_POSITIVE_Y", "EVT_COMMAND_MENU_SELECTED", Rotation(self, Vector3("on_set_gizmo_rotation", 1, 0)))

	slot12 = callback(Rotation, self, self)
	slot19 = 0
	slot16 = 90

	self._main_frame.connect(EWS, self._main_frame, "SET_NEGATIVE_Y", "EVT_COMMAND_MENU_SELECTED", Rotation(self, Vector3("on_set_gizmo_rotation", 1, 0)))

	slot12 = callback(Rotation, self, self)
	slot19 = 0
	slot16 = 90

	self._main_frame.connect(EWS, self._main_frame, "SET_POSITIVE_X", "EVT_COMMAND_MENU_SELECTED", Rotation(self, Vector3("on_set_gizmo_rotation", 0, 1)))

	slot12 = callback(Rotation, self, self)
	slot19 = 0
	slot16 = -90

	self._main_frame.connect(EWS, self._main_frame, "SET_NEGATIVE_X", "EVT_COMMAND_MENU_SELECTED", Rotation(self, Vector3("on_set_gizmo_rotation", 0, 1)))

	slot16 = "on_automove_gizmo_no_move"

	self._main_frame.connect(EWS, self._main_frame, "PARENT_NO_MOVE", "EVT_COMMAND_MENU_SELECTED", callback(Rotation, self, self))

	slot16 = "on_automove_gizmo_jump"

	self._main_frame.connect(EWS, self._main_frame, "PARENT_JUMP", "EVT_COMMAND_MENU_SELECTED", callback("", self, self))

	slot16 = "on_automove_gizmo_smooth"

	self._main_frame.connect(EWS, self._main_frame, "PARENT_SMOOTH", "EVT_COMMAND_MENU_SELECTED", callback("", self, self))

	slot16 = "on_automove_gizmo_circle"

	self._main_frame.connect(EWS, self._main_frame, "PARENT_CIRCLE", "EVT_COMMAND_MENU_SELECTED", callback("", self, self))

	slot16 = "on_debug_draw"

	self._main_frame.connect(EWS, self._main_frame, "DEBUG_DRAWING", "EVT_COMMAND_MENU_SELECTED", callback("", self, self))

	slot16 = "on_effect_stats"

	self._main_frame.connect(EWS, self._main_frame, "EFFECT_STATS", "EVT_COMMAND_MENU_SELECTED", callback("", self, self))

	slot16 = "on_show_stack_overview"

	self._main_frame.connect(EWS, self._main_frame, "SHOW_STACK_OVERVIEW", "EVT_COMMAND_MENU_SELECTED", callback("", self, self))

	slot16 = "on_batch_all_remove_update_render"

	self._main_frame.connect(EWS, self._main_frame, "BATCH_ALL_REMOVE_UPDATE_RENDER", "EVT_COMMAND_MENU_SELECTED", callback("", self, self))

	slot16 = "on_batch_all_load_unload"
	slot13 = ""

	self._main_frame.connect(EWS, self._main_frame, "BATCH_ALL_LOAD_UNLOAD", "EVT_COMMAND_MENU_SELECTED", callback("", self, self))

	slot10 = self._main_frame
	local top_panel = self.create_top_bar(EWS, self)
	self._effects_notebook = EWS.Notebook(self, EWS, self._main_frame, "EFFECTS_NOTEBOOK")
	slot16 = "on_effect_changed"
	slot13 = ""

	self._effects_notebook.connect(self, self._effects_notebook, "EVT_COMMAND_NOTEBOOK_PAGE_CHANGED", callback("", self, self))

	slot11 = "VERTICAL"
	local top_sizer = EWS.BoxSizer(self, EWS)
	slot15 = "EXPAND"

	top_sizer.add(EWS, top_sizer, top_panel, 0, 0)

	slot15 = "EXPAND"

	top_sizer.add(EWS, top_sizer, self._effects_notebook, 1, 0)

	slot12 = top_sizer

	self._main_frame.set_sizer(EWS, self._main_frame)

	slot12 = "BOTH"

	self._main_frame.center(EWS, self._main_frame)

	slot12 = true

	self._main_frame.set_visible(EWS, self._main_frame)

	return 
end
function CoreParticleEditor:on_undo()
	slot3 = self
	local cur_effect = self.current_effect(slot2)

	if cur_effect then
		slot4 = cur_effect

		cur_effect.undo(slot3)
	end

	return 
end
function CoreParticleEditor:on_batch_all_remove_update_render()
	slot7 = "YES_NO"
	slot12 = 0
	local ret = EWS.message_box(slot2, EWS, self._main_frame, "You are about to batch all effects of project database and remove update_render\nfor atoms that do not have a visualizer with screen_aligned set.\nAre you sure you want to continue?", "Are you sure you wish to continue?", Vector3(slot9, -1, -1))

	if ret ~= "YES" then
		return false
	end

	local any_saved = false
	slot8 = "effect"

	for _, name in ipairs(managers.database.list_entries_of_type(slot6, managers.database)) do
		slot12 = name
		local n = DB.load_node(slot9, DB, "effect")
		local effect = CoreEffectDefinition.new(DB)
		slot13 = n

		effect.load(CoreEffectDefinition, effect)

		local should_save = false
		slot13 = effect._atoms

		for _, atom in ipairs(effect) do
			slot19 = "cull_policy"
			local cull_policy = atom.get_property(slot17, atom)

			if cull_policy._value == "update_render" then
				local had_screen_aligned = false
				slot20 = atom._stacks.visualizer._stack

				for _, visualizer in ipairs(slot19) do
					slot25 = visualizer

					if visualizer.name(slot24) == "billboard" then
						slot26 = "billboard_type"

						if visualizer.get_property(slot24, visualizer)._value == "screen_aligned" then
							had_screen_aligned = true
						end
					end
				end

				if not had_screen_aligned then
					cull_policy._value = "freeze"
					should_save = true
				end
			end
		end

		if should_save then
			slot14 = "FIXME: CoreParticleEditor:on_batch_all_remove_update_render(), (using Database:save_node())"

			Application.error(slot12, Application)
		end
	end

	if any_saved then
		slot6 = "Saved entries, saving database..."

		cat_debug(slot4, "debug")
	else
		slot6 = "Nothing modified, not saving database"

		cat_debug(slot4, "debug")
	end

	return 
end
function CoreParticleEditor:on_batch_all_load_unload()
	slot7 = "YES_NO"
	slot12 = 0
	local ret = EWS.message_box(slot2, EWS, self._main_frame, "You are about to batch all effects of project database and load and unload them.\nAre you sure you want to continue?", "Are you sure you wish to continue?", Vector3(slot9, -1, -1))

	if ret ~= "YES" then
		return false
	end

	cat_debug(slot3, "debug")

	slot7 = "effect"

	for _, name in ipairs(managers.database.list_entries_of_type("Loading all effects once...", managers.database)) do
		slot11 = name
		local n = DB.load_node(slot8, DB, "effect")
		local effect = CoreEffectDefinition.new(DB)
		slot12 = n

		effect.load(CoreEffectDefinition, effect)

		slot11 = effect
		local valid = effect.validate(CoreEffectDefinition)

		if not valid.valid then
			slot16 = valid.message

			cat_debug(slot11, "debug", "Skipping engine load of", name, " since validation failed:")
		else
			cat_debug(slot11, "debug", "Loading")

			slot13 = Idstring(name)
			slot16 = "unique_test_effect_name"

			CoreEngineAccess._editor_reload_node(slot11, n, Idstring("effect"))
		end
	end

	slot5 = "Done!"

	cat_debug(slot3, "debug")

	return 
end
function CoreParticleEditor:on_redo()
	slot3 = self
	local cur_effect = self.current_effect(slot2)

	if cur_effect then
		slot4 = cur_effect

		cur_effect.redo(slot3)
	end

	return 
end
function CoreParticleEditor:on_effect_changed(arg, event)
	slot5 = event

	if event.get_id(slot4) ~= "EFFECTS_NOTEBOOK" then
		return 
	end

	local old_page = event.get_old_selection(slot4)
	slot6 = event
	local new_page = event.get_selection(event)

	if 0 <= old_page and old_page < #self._effects then
		local old_effect = self._effects[old_page + 1]
		slot8 = old_effect

		old_effect.on_lose_focus(slot7)
	end

	if 0 <= new_page and new_page < #self._effects then
		local new_effect = self._effects[new_page + 1]
		slot9 = false

		new_effect.update_view(slot7, new_effect)

		slot9 = "SHOW_STACK_OVERVIEW"

		if self._view_menu.is_checked(slot7, self._view_menu) then
			slot9 = true

			new_effect.show_stack_overview(slot7, new_effect)
		end
	end

	slot7 = event

	event.skip(slot6)

	return 
end
function CoreParticleEditor:on_play()
	slot3 = self
	local cur_effect = self.current_effect(slot2)

	if cur_effect then
		slot4 = cur_effect

		cur_effect.update_effect_instance(slot3)
	end

	return 
end
function CoreParticleEditor:on_play_lowest()
	slot3 = self
	local cur_effect = self.current_effect(slot2)

	if cur_effect then
		slot5 = 0

		cur_effect.update_effect_instance(slot3, cur_effect)
	end

	return 
end
function CoreParticleEditor:on_play_highest()
	slot3 = self
	local cur_effect = self.current_effect(slot2)

	if cur_effect then
		slot5 = 1

		cur_effect.update_effect_instance(slot3, cur_effect)
	end

	return 
end
function CoreParticleEditor:on_debug_draw()
	local b = "true"
	slot5 = "DEBUG_DRAWING"

	if not self._view_menu.is_checked(slot3, self._view_menu) then
		b = "false"
	end

	slot5 = "set show_tngeffects " .. b

	Application.console_command(slot3, Application)

	return 
end
function CoreParticleEditor:on_effect_stats()
	slot4 = "stats tngeffects"

	Application.console_command(slot2, Application)

	return 
end
function CoreParticleEditor:on_show_stack_overview()
	slot3 = self
	local cur_effect = self.current_effect(slot2)

	if cur_effect then
		slot4 = cur_effect
		slot8 = "SHOW_STACK_OVERVIEW"

		cur_effect.show_stack_overview(slot3, self._view_menu.is_checked(slot6, self._view_menu))
	end

	return 
end
function CoreParticleEditor:on_automove_gizmo_no_move()
	slot5 = false

	self._gizmo_menu.set_checked(slot2, self._gizmo_menu, "PARENT_JUMP")

	slot5 = false

	self._gizmo_menu.set_checked(slot2, self._gizmo_menu, "PARENT_SMOOTH")

	slot5 = false

	self._gizmo_menu.set_checked(slot2, self._gizmo_menu, "PARENT_CIRCLE")

	self._gizmo_movement = "NO_MOVE"

	return 
end
function CoreParticleEditor:on_automove_gizmo_jump()
	slot5 = false

	self._gizmo_menu.set_checked(slot2, self._gizmo_menu, "PARENT_NO_MOVE")

	slot5 = false

	self._gizmo_menu.set_checked(slot2, self._gizmo_menu, "PARENT_SMOOTH")

	slot5 = false

	self._gizmo_menu.set_checked(slot2, self._gizmo_menu, "PARENT_CIRCLE")

	self._gizmo_movement = "JUMP"
	slot3 = self
	slot3 = self.effect_gizmo(slot2)
	self._gizmo_anchor = self.effect_gizmo(slot2).position(slot2)
	self._gizmo_accum = 0

	return 
end
function CoreParticleEditor:on_automove_gizmo_smooth()
	slot5 = false

	self._gizmo_menu.set_checked(slot2, self._gizmo_menu, "PARENT_NO_MOVE")

	slot5 = false

	self._gizmo_menu.set_checked(slot2, self._gizmo_menu, "PARENT_JUMP")

	slot5 = false

	self._gizmo_menu.set_checked(slot2, self._gizmo_menu, "PARENT_CIRCLE")

	self._gizmo_movement = "SMOOTH"
	slot3 = self
	slot3 = self.effect_gizmo(slot2)
	self._gizmo_anchor = self.effect_gizmo(slot2).position(slot2)
	self._gizmo_accum = 0

	return 
end
function CoreParticleEditor:on_automove_gizmo_circle()
	slot5 = false

	self._gizmo_menu.set_checked(slot2, self._gizmo_menu, "PARENT_NO_MOVE")

	slot5 = false

	self._gizmo_menu.set_checked(slot2, self._gizmo_menu, "PARENT_SMOOTH")

	slot5 = false

	self._gizmo_menu.set_checked(slot2, self._gizmo_menu, "PARENT_JUMP")

	self._gizmo_movement = "CIRCLE"
	slot3 = self
	slot3 = self.effect_gizmo(slot2)
	self._gizmo_anchor = self.effect_gizmo(slot2).position(slot2)
	self._gizmo_accum = 0

	return 
end
function CoreParticleEditor:on_move_gizmo_to_origo()
	local gizmo = self.effect_gizmo(slot2)
	slot4 = gizmo
	slot9 = 0

	gizmo.set_position(self, Vector3(slot6, 0, 0))

	slot4 = gizmo

	gizmo.set_rotation(self, Rotation())

	return 
end
function CoreParticleEditor:on_move_gizmo_to_camera()
	local gizmo = self.effect_gizmo(slot2)
	local camera_rot = Application.last_camera_rotation(self)
	local camera_pos = Application.last_camera_position(Application)
	slot9 = camera_rot
	slot7 = camera_pos + camera_rot.y(slot8) * 400

	gizmo.set_position(Application, gizmo)

	return 
end
function CoreParticleEditor:on_move_gizmo_to_player()
	local gizmo = self.effect_gizmo(slot2)
	local pos = gizmo.position(self)
	local rot = gizmo.rotation(gizmo)
	slot7 = pos

	gizmo.set_position(gizmo, gizmo)

	return 
end
function CoreParticleEditor:on_set_gizmo_rotation(rot)
	local gizmo = self.effect_gizmo(slot3)
	slot5 = self
	slot6 = rot

	self.effect_gizmo(self).set_rotation(self, self.effect_gizmo(self))

	return 
end
function CoreParticleEditor:on_reset_gizmo_rotation()
	slot3 = self
	slot3 = self.effect_gizmo(slot2)

	self.effect_gizmo(slot2).set_rotation(slot2, Rotation())

	return 
end
function CoreParticleEditor:create_top_bar(parent)
	slot7 = ""
	local panel = EWS.Panel(slot3, EWS, parent, "")
	local play_button = EWS.Button(EWS, EWS, panel, "Play", "")
	slot7 = "EVT_COMMAND_BUTTON_CLICKED"
	slot12 = "on_play"

	play_button.connect(EWS, play_button, callback("BU_EXACTFIT", self, self))

	local play_button_low = EWS.Button(EWS, EWS, panel, "Play Lowest Quality Once", "")
	slot8 = "EVT_COMMAND_BUTTON_CLICKED"
	slot13 = "on_play_lowest"

	play_button_low.connect(EWS, play_button_low, callback("BU_EXACTFIT", self, self))

	local play_button_high = EWS.Button(EWS, EWS, panel, "Play Highest Quality Once", "")
	slot9 = "EVT_COMMAND_BUTTON_CLICKED"
	slot14 = "on_play_highest"

	play_button_high.connect(EWS, play_button_high, callback("BU_EXACTFIT", self, self))

	slot9 = "VERTICAL"
	local top_sizer = EWS.BoxSizer(EWS, EWS)
	slot10 = "HORIZONTAL"
	local row_sizer = EWS.BoxSizer(EWS, EWS)
	slot14 = "EXPAND"

	row_sizer.add(EWS, row_sizer, play_button, 0, 0)

	slot14 = "EXPAND,LEFT"

	row_sizer.add(EWS, row_sizer, play_button_low, 0, 40)

	slot14 = "EXPAND,LEFT"

	row_sizer.add(EWS, row_sizer, play_button_high, 0, 4)

	slot14 = "EXPAND,TOP,BOTTOM"

	top_sizer.add(EWS, top_sizer, row_sizer, 0, 3)

	slot11 = "HORIZONTAL"
	row_sizer = EWS.BoxSizer(EWS, EWS)
	slot11 = 1

	row_sizer.add_stretch_spacer(EWS, row_sizer)

	slot17 = ""
	slot14 = "ALIGN_RIGHT"

	row_sizer.add(EWS, row_sizer, EWS.StaticText(0, EWS, panel, "Click on parameters and container names for usage hints.", ""), 0, 0)

	slot14 = "EXPAND"

	top_sizer.add(EWS, top_sizer, row_sizer, 0, 0)

	slot11 = top_sizer

	panel.set_sizer(EWS, panel)

	return panel
end
function CoreParticleEditor:effect_gizmo()
	return self._effect_gizmo
end
function CoreParticleEditor:update(t, dt)

	-- Decompilation error in this vicinity:
	slot5 = self
	local cur_effect = self.current_effect(slot4)

	if cur_effect then
		slot8 = dt

		cur_effect.update(slot5, cur_effect, t)
	end

	if self._gizmo_movement == "SMOOTH" then
		slot6 = self
		local gizmo = self.effect_gizmo(slot5)
		self._gizmo_accum = self._gizmo_accum + (dt * 360) / 4
		local a = self._gizmo_accum
		local r = 500
		slot15 = 0
		slot14 = a
		slot15 = 0
		slot14 = a
		slot15 = r / 5
		slot14 = 5 * a
		slot10 = self._gizmo_anchor + Vector3(slot12, r, 0) * math.cos(r) + Vector3(math.cos(r), 0, r) * math.sin(0) + Vector3(math.sin(0), 0, 0) * math.cos(0)

		gizmo.set_position(slot8, gizmo)

		slot16 = 1
		slot12 = Vector3(0, 0, 0)
		slot13 = a
		slot17 = 0
		slot16 = 5 * a
		slot17 = 0
		slot14 = -90
		slot10 = Rotation(Vector3(math.sin(0), 0, 0) * math.cos(0), slot12) * Rotation(slot12, Vector3(0, 1, 0)) + Rotation(slot12, Vector3(45 * math.cos(1), 1, 0))

		gizmo.set_rotation(slot8, gizmo)
	elseif self._gizmo_movement == "JUMP" then
		local gizmo = self.effect_gizmo(slot5)
		self._gizmo_accum = self._gizmo_accum + dt
		local s = math.round(self)
		slot9 = 15
		s = math.fmod(self._gizmo_accum, s)
		slot14 = 0
		slot9 = self._gizmo_anchor + Vector3(slot11, 100 * s, 0)

		gizmo.set_position(self._gizmo_accum, gizmo)
	elseif self._gizmo_movement == "CIRCLE" then
		slot6 = self
		local gizmo = self.effect_gizmo(slot5)
		self._gizmo_accum = self._gizmo_accum + (dt * 360) / 16
		local a = self._gizmo_accum
		local r = 500
		slot15 = 0
		slot14 = a
		slot15 = 0
		slot14 = a
		slot10 = self._gizmo_anchor + Vector3(slot12, r, 0) * math.cos(r) + Vector3(math.cos(r), 0, r) * math.sin(0)

		gizmo.set_position(slot8, gizmo)

		slot16 = 1
		slot13 = a
		slot17 = 0
		slot14 = -90
		slot10 = Rotation(Vector3(math.cos(r), 0, r) * math.sin(0), Vector3(0, 0, 0)) * Rotation(Vector3(0, 0, 0), Vector3(0, 1, 0))

		gizmo.set_rotation(slot8, gizmo)
	end

	return 
end
function CoreParticleEditor:set_position(pos)
	return 
end
function CoreParticleEditor:destroy()
	slot3 = self._main_frame

	if alive(slot2) then
		slot3 = self._main_frame

		self._main_frame.destroy(slot2)

		self._main_frame = nil
	end

	return 
end
function CoreParticleEditor:close()
	slot3 = self._main_frame

	self._main_frame.destroy(slot2)

	return 
end
function CoreParticleEditor:on_close_effect()
	slot3 = self
	local curi = self.current_effect_index(slot2)

	if 0 < curi then
		slot4 = self
		slot4 = self.current_effect(slot3)

		if not self.current_effect(slot3).close(slot3) then
			return 
		end

		slot5 = curi - 1

		self._effects_notebook.delete_page(slot3, self._effects_notebook)

		slot5 = curi

		table.remove(slot3, self._effects)
	end

	return 
end
function CoreParticleEditor:on_close()
	slot3 = self._effects

	for _, e in ipairs(slot2) do
		slot8 = e

		if not e.close(slot7) then
			return 
		end
	end

	slot4 = "Particle Editor"

	managers.toolhub.close(slot2, managers.toolhub)

	if managers.editor then
		slot4 = false

		managers.editor.set_listener_enabled(slot2, managers.editor)
	end

	return 
end
function CoreParticleEditor:add_effect(effect)
	slot4 = self._main_frame

	self._main_frame.freeze(slot3)

	slot7 = effect
	local effect_panel = CoreParticleEditorPanel.new(slot3, CoreParticleEditorPanel, self, self._effects_notebook)
	slot6 = effect_panel

	table.insert(CoreParticleEditorPanel, self._effects)

	slot5 = effect
	local n = effect.name(CoreParticleEditorPanel)

	if n == "" then
		n = "New Effect"
	end

	slot6 = n
	n = base_path(slot5)
	slot9 = effect_panel
	slot9 = true

	self._effects_notebook.add_page(slot5, self._effects_notebook, effect_panel.panel(slot8), n)

	slot6 = effect_panel

	effect_panel.set_init_positions(slot5)

	slot6 = self._main_frame

	self._main_frame.thaw(slot5)

	return 
end
function CoreParticleEditor:current_effect()
	slot3 = self
	local i = self.current_effect_index(slot2)

	if i < 0 then
		return nil
	end

	return self._effects[i]
end
function CoreParticleEditor:current_effect_index()
	local page = self._effects_notebook.get_current_page(slot2)
	slot4 = self._effects

	for i, e in ipairs(self._effects_notebook) do
		slot9 = e

		if e.panel(slot8) == page then
			return i
		end
	end

	return -1
end
function CoreParticleEditor:effect_for_page(page)
	slot4 = self._effects

	for _, e in ipairs(slot3) do
		slot9 = e

		if e.panel(slot8) == page then
			return e
		end
	end

	return nil
end
function CoreParticleEditor:set_page_name(page, name)
	local i = 0
	slot6 = self._effects_notebook

	while i < self._effects_notebook.get_page_count(slot5) do
		slot7 = i
		slot7 = page

		if self._effects_notebook.get_page(slot5, self._effects_notebook) == page.panel(self._effects_notebook) then
			slot7 = i

			if self._effects_notebook.get_page_text(slot5, self._effects_notebook) ~= name then
				slot8 = name

				self._effects_notebook.set_page_text(slot5, self._effects_notebook, i)
			end
		end

		i = i + 1
	end

	return 
end
function CoreParticleEditor:on_new()
	slot3 = self

	self.new_dialog(slot2)

	return 
end
function CoreParticleEditor:on_open()
	slot6 = self._last_used_dir
	local f = managers.database.open_file_dialog(slot2, managers.database, self._main_frame, "*.effect")

	if not f then
		return 
	end

	slot4 = f
	self._last_used_dir = dir_name(slot3)
	slot5 = f
	local n = managers.database.load_node(slot3, managers.database)
	local effect = CoreEffectDefinition.new(managers.database)
	slot7 = n

	effect.load(CoreEffectDefinition, effect)

	slot7 = f

	effect.set_name(CoreEffectDefinition, effect)

	slot7 = effect

	self.add_effect(CoreEffectDefinition, self)

	return 
end
function CoreParticleEditor:on_save()
	slot3 = self
	local cur = self.current_effect(slot2)

	if cur then
		slot4 = cur

		cur.on_save(slot3)
	end

	return 
end
function CoreParticleEditor:on_save_as()
	slot3 = self
	local cur = self.current_effect(slot2)

	if cur then
		slot4 = cur

		cur.on_save_as(slot3)
	end

	return 
end

return 
