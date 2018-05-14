-- Decompilation Error: _run_step(_unwarp_expressions, node)

-- Decompilation Error: _glue_flows(node)

-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.

-- Decompilation error in this vicinity:
--- BLOCK #0 1-3, warpins: 1 ---
slot0 = CoreMaterialEditor or class()
CoreMaterialEditor = slot0
function CoreMaterialEditor:_on_material_popup()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-130, warpins: 1 ---
	slot4 = ""
	local popup = EWS.Menu(slot2, EWS)
	slot7 = ""

	popup.append_item(EWS, popup, "POPUP_ADD_MATERIAL", "Add")

	slot11 = "_on_add_material"

	popup.connect(EWS, popup, "POPUP_ADD_MATERIAL", "EVT_COMMAND_MENU_SELECTED", callback(slot8, self, self))

	slot4 = popup

	popup.append_separator(EWS)

	slot7 = ""

	popup.append_item(EWS, popup, "POPUP_COPY_MATERIAL", "Copy")

	slot6 = self._current_material_node

	popup.set_enabled(EWS, popup, "POPUP_COPY_MATERIAL")

	slot11 = "_on_copy_material"

	popup.connect(EWS, popup, "POPUP_COPY_MATERIAL", "EVT_COMMAND_MENU_SELECTED", callback("", self, self))

	slot7 = ""

	popup.append_item(EWS, popup, "POPUP_PASTE_AS_MATERIAL", "Paste As")

	slot6 = self._material_clipboard

	popup.set_enabled(EWS, popup, "POPUP_PASTE_AS_MATERIAL")

	slot11 = "_on_paste_as_material"

	popup.connect(EWS, popup, "POPUP_PASTE_AS_MATERIAL", "EVT_COMMAND_MENU_SELECTED", callback("", self, self))

	slot4 = popup

	popup.append_separator(EWS)

	slot7 = ""

	popup.append_item(EWS, popup, "POPUP_RENAME_MATERIAL", "Rename")

	slot6 = self._current_material_node

	popup.set_enabled(EWS, popup, "POPUP_RENAME_MATERIAL")

	slot11 = "_on_rename_material"

	popup.connect(EWS, popup, "POPUP_RENAME_MATERIAL", "EVT_COMMAND_MENU_SELECTED", callback("", self, self))

	slot4 = popup

	popup.append_separator(EWS)

	slot7 = ""

	popup.append_item(EWS, popup, "POPUP_REMOVE_MATERIAL", "Remove")

	slot6 = self._current_material_node

	popup.set_enabled(EWS, popup, "POPUP_REMOVE_MATERIAL")

	slot11 = "_on_remove_material"
	slot8 = ""

	popup.connect(EWS, popup, "POPUP_REMOVE_MATERIAL", "EVT_COMMAND_MENU_SELECTED", callback("", self, self))

	slot5 = popup
	slot10 = 0

	self._material_list_box.popup_menu(EWS, self._material_list_box, Vector3(callback("", self, self), -1, -1))

	return 
	--- END OF BLOCK #0 ---



end
function CoreMaterialEditor:_on_parameter_popup()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-22, warpins: 1 ---
	slot4 = ""
	local popup = EWS.Menu(slot2, EWS)
	slot7 = ""

	popup.append_check_item(EWS, popup, "POPUP_CUSTOMIZE", "Customize")

	slot6 = self._customize

	popup.set_checked(EWS, popup, "POPUP_CUSTOMIZE")

	slot4 = popup
	slot2 = popup.set_enabled
	slot5 = "POPUP_CUSTOMIZE"

	if self._parent_node == nil then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 23-24, warpins: 1 ---
		slot6 = false
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 25-25, warpins: 1 ---
		slot6 = true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 26-49, warpins: 2 ---
	slot2(slot3, slot4, slot5)

	slot11 = "on_toggle_customize"
	slot8 = ""

	popup.connect(slot3, popup, "POPUP_CUSTOMIZE", "EVT_COMMAND_MENU_SELECTED", callback("", self, self))

	slot4 = popup

	popup.append_separator(slot3)

	slot7 = ""

	popup.append_item(slot3, popup, "POPUP_OPEN_TEXTURE", "Open Texture")

	if self.on_open_texture and self._value then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 53-55, warpins: 1 ---
		if self._value ~= "[NONE]" then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 56-60, warpins: 1 ---
			slot4 = "MATEDOPEN"
			slot2 = os.getenv(slot3)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 61-62, warpins: 1 ---
			slot2 = false

			if false then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 63-63, warpins: 0 ---
				local b = true
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 64-70, warpins: 5 ---
	slot7 = b

	popup.set_enabled(slot4, popup, "POPUP_OPEN_TEXTURE")

	if b then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 71-81, warpins: 1 ---
		slot12 = "on_open_texture"
		slot9 = ""

		popup.connect(slot4, popup, "POPUP_OPEN_TEXTURE", "EVT_COMMAND_MENU_SELECTED", callback("", self, self))
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 82-90, warpins: 2 ---
	slot8 = ""

	popup.append_item(slot4, popup, "POPUP_GLOBAL_TEXTURE", "Browse Global Textures")

	if self._parameter_info then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 91-94, warpins: 1 ---
		if self._parameter_info.type ~= "texture" then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 95-96, warpins: 1 ---
			b = false
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 97-97, warpins: 1 ---
			b = true
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 98-104, warpins: 3 ---
	slot7 = b

	popup.set_enabled(slot4, popup, "POPUP_GLOBAL_TEXTURE")

	if b then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 105-115, warpins: 1 ---
		slot12 = "on_pick_global_texture"
		slot9 = ""

		popup.connect(slot4, popup, "POPUP_GLOBAL_TEXTURE", "EVT_COMMAND_MENU_SELECTED", callback("", self, self))
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 116-151, warpins: 2 ---
	slot5 = popup

	popup.append_separator(slot4)

	slot8 = ""

	popup.append_item(slot4, popup, "POPUP_COPY_TO_PARENT", "Copy to Parent")

	slot7 = self._customize

	popup.set_enabled(slot4, popup, "POPUP_COPY_TO_PARENT")

	slot12 = "on_copy_to_parent"
	slot9 = ""

	popup.connect(slot4, popup, "POPUP_COPY_TO_PARENT", "EVT_COMMAND_MENU_SELECTED", callback("", self, self))

	slot6 = popup
	slot11 = 0

	self._parent_btn.popup_menu(slot4, self._parent_btn, Vector3(callback("", self, self), -1, -1))

	return 
	--- END OF BLOCK #5 ---



end
function CoreMaterialEditor:_on_edit_global_popup(event)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-33, warpins: 1 ---
	slot5 = ""
	local popup = EWS.Menu(slot3, EWS)
	slot8 = ""

	popup.append_item(EWS, popup, "POPUP_GLOBAL_REMOVE", "Remove")

	slot12 = "on_remove"
	slot9 = event

	popup.connect(EWS, popup, "POPUP_GLOBAL_REMOVE", "EVT_COMMAND_MENU_SELECTED", callback(slot9, self, self))

	slot6 = popup
	slot11 = 0

	self._tree_ctrl.popup_menu(EWS, self._tree_ctrl, Vector3(callback(slot9, self, self), -1, -1))

	return 
	--- END OF BLOCK #0 ---



end

return 

--- END OF BLOCK #0 ---

FLOW; TARGET BLOCK #2



-- Decompilation error in this vicinity:
--- BLOCK #1 4-5, warpins: 1 ---
slot0 = class()
--- END OF BLOCK #1 ---

FLOW; TARGET BLOCK #2



-- Decompilation error in this vicinity:
--- BLOCK #2 6-16, warpins: 2 ---
--- END OF BLOCK #2 ---



