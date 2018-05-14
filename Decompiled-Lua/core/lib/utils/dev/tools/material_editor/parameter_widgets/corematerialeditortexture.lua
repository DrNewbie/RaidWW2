slot2 = "core/lib/utils/dev/tools/material_editor/CoreSmartNode"

require(slot1)

slot2 = "core/lib/utils/dev/tools/material_editor/parameter_widgets/CoreMaterialEditorParameter"
local CoreMaterialEditorParameter = require(slot1)

if not CoreMaterialEditorTexture then
	slot3 = CoreMaterialEditorParameter
	local CoreMaterialEditorTexture = class(slot2)
end

function CoreMaterialEditorTexture:init(parent, editor, parameter_info, parameter_node)
	slot11 = parameter_node

	CoreMaterialEditorParameter.init(slot6, self, parent, editor, parameter_info)

	local text = self._value .. ((self._global_texture and " (Global)") or "")
	slot12 = "TE_READONLY"
	self._text = EWS.TextCtrl(slot7, EWS, self._right_panel, text, "")
	slot8 = self._text
	slot12 = "3DFACE"
	slot11 = EWS.get_system_colour(text, EWS) * 255

	self._text.set_background_colour(slot7, EWS.get_system_colour(text, EWS) * 255.unpack(text))

	slot9 = "FONTFAMILY_TELETYPE"

	self._text.set_font_family(slot7, self._text)

	slot9 = "FONTWEIGHT_BOLD"

	self._text.set_font_weight(slot7, self._text)

	slot12 = "ALL,EXPAND"

	self._right_box.add(slot7, self._right_box, self._text, 1, 4)

	slot12 = "NO_BORDER"
	self._button = EWS.Button(slot7, EWS, self._right_panel, "Browse", "")
	slot12 = self

	self._button.connect(slot7, self._button, "", "EVT_COMMAND_BUTTON_CLICKED", self._on_browse)

	slot12 = "ALL"

	self._right_box.add(slot7, self._right_box, self._button, 0, 4)

	return 
end
function CoreMaterialEditorTexture:update(t, dt)
	return 
end
function CoreMaterialEditorTexture:destroy()
	slot3 = self

	CoreMaterialEditorParameter.destroy(slot2)

	return 
end
function CoreMaterialEditorTexture:on_toggle_customize()
	self._customize = not self._customize
	slot3 = self

	self._load_value(slot2)

	slot3 = self._editor

	self._editor._update_output(slot2)

	slot4 = self._customize

	self._right_panel.set_enabled(slot2, self._right_panel)

	slot4 = self._value

	self._text.set_value(slot2, self._text)

	if self._customize then
		slot3 = self

		self._on_browse(slot2)
	end

	return 
end
function CoreMaterialEditorTexture:on_open_texture()
	local str = os.getenv(slot2)
	slot5 = "$FILE"
	local s, e = string.find("MATEDOPEN", str)

	if s and e then
		slot8 = s - 1
		local first_part = string.sub(slot5, str, 1)
		slot8 = e + 1
		local last_part = string.sub(str, str)
		slot10 = self._value

		if DB.has(str, DB, "texture") then
			slot14 = managers.database
			slot13 = false
			str = "start " .. first_part .. "\"" .. Application.nice_path(slot10, Application, managers.database.base_path(slot13) .. self._value .. ".dds\"") .. last_part
			slot8 = str

			os.execute(first_part)
		else
			slot12 = "OK,ICON_ERROR"
			slot8 = EWS.MessageDialog(slot7, EWS, self._editor._main_frame, "Could not find texture entry: " .. self._value, "Open Texture")

			EWS.MessageDialog(slot7, EWS, self._editor._main_frame, "Could not find texture entry: " .. self._value, "Open Texture").show_modal(slot7)
		end
	end

	return 
end
function CoreMaterialEditorTexture:on_pick_global_texture()
	local texture_list = {}
	slot6 = GlobalTextureManager

	for _, texture_id in ipairs(GlobalTextureManager.list_textures(slot5)) do
		slot9 = texture_list
		slot12 = texture_id

		table.insert(slot8, texture_id.t(slot11))
	end

	slot9 = ""
	local dialog = EWS.SingleChoiceDialog(slot3, EWS, self._editor._main_frame, "Pick a global texture.", "Global Textures", texture_list)
	slot5 = dialog

	dialog.show_modal(EWS)

	slot5 = dialog
	local str = dialog.get_string_selection(EWS)

	if str ~= "" then
		self._value = str
		self._global_texture = true
		self._global_texture_type = (str == "current_global_texture" and "cube") or "texture"
		slot7 = "file"

		self._node.clear_parameter(slot5, self._node)

		slot8 = self._value

		self._node.set_parameter(slot5, self._node, "global_texture")

		slot8 = self._global_texture_type

		self._node.set_parameter(slot5, self._node, "type")

		slot7 = self._value .. " (Global)"

		self._text.set_value(slot5, self._text)

		slot6 = self._editor

		self._editor._update_output(slot5)

		slot6 = self

		self.update_live(slot5)
	end

	return 
end
function CoreMaterialEditorTexture:_on_browse()
	local current_path = nil

	if self._value then
		slot5 = ".*/"
		current_path = string.match(slot3, self._value)

		if current_path then
			slot6 = "\\"
			current_path = string.gsub(slot3, current_path, "/")
			slot4 = managers.database
			current_path = managers.database.base_path(slot3) .. current_path
		end
	end

	slot7 = current_path
	local node, path = managers.database.load_node_dialog(slot3, managers.database, self._right_panel, "Textures (*.dds)|*.dds")

	if path then
		self._global_texture = false
		slot7 = path
		self._value = managers.database.entry_path(slot5, managers.database)
		slot7 = "global_texture"

		self._node.clear_parameter(slot5, self._node)

		slot7 = "type"

		self._node.clear_parameter(slot5, self._node)

		slot8 = self._value

		self._node.set_parameter(slot5, self._node, "file")

		slot6 = self._parameter_info.name

		if self._parameter_info.name.s(slot5) == "reflection_texture" then
			slot8 = "cubemap"

			self._node.set_parameter(slot5, self._node, "type")
		end

		slot7 = self._value

		self._text.set_value(slot5, self._text)

		slot6 = self._editor

		self._editor._update_output(slot5)

		slot6 = self

		self.update_live(slot5)
	end

	return 
end

return CoreMaterialEditorTexture
