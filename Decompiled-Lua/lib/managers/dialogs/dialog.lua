slot3 = "SystemMenuManager"

core.module(slot1, core)

slot2 = "lib/managers/dialogs/BaseDialog"

require(slot1)

if not Dialog then
	slot2 = BaseDialog
	slot0 = class(slot1)
end

Dialog = slot0
function Dialog:init(manager, data)
	slot7 = data

	BaseDialog.init(slot4, self, manager)

	self._button_text_list = {}
	slot5 = self

	self.init_button_text_list(slot4)

	return 
end
function Dialog:init_button_text_list()
	local button_list = self._data.button_list

	if button_list then
		slot4 = button_list

		for _, button in ipairs(slot3) do
			slot10 = button.text or "ERROR"

			table.insert(slot8, self._button_text_list)
		end
	end

	if #self._button_text_list == 0 and not self._data.no_buttons then
		slot5 = "[SystemMenuManager] Invalid dialog with no button texts. Adds an ok-button."

		Application.error(slot3, Application)

		self._data.button_list = self._data.button_list or {}
		self._data.button_list[1] = self._data.button_list[1] or {}
		self._data.button_list[1].text = "ERROR: OK"
		slot5 = self._data.button_list[1].text

		table.insert("ERROR: OK", self._button_text_list)
	end

	return 
end
function Dialog:is_identical(dialog)
	return self._data.title == dialog._data.title and self._data.text == dialog._data.text
end
function Dialog:title()
	return self._data.title
end
function Dialog:text()
	return self._data.text
end
function Dialog:focus_button()
	return self._data.focus_button
end
function Dialog:button_pressed(button_index)
	slot8 = button_index
	slot5 = "[SystemMenuManager] Button index pressed: " .. tostring(slot7)

	cat_print(slot3, "dialog_manager")

	local button_list = self._data.button_list
	slot5 = self

	self.fade_out_close("dialog_manager")

	if button_list then
		local button = button_list[button_index]

		if button and button.callback_func then
			slot7 = button

			button.callback_func(slot5, button_index)
		end
	end

	local callback_func = self._data.callback_func

	if callback_func then
		slot7 = self._data

		callback_func(slot5, button_index)
	end

	return 
end
function Dialog:button_text_list()
	return self._button_text_list
end
function Dialog:to_string()
	local buttons = ""

	if self._data.button_list then
		slot4 = self._data.button_list

		for _, button in ipairs(slot3) do
			slot11 = button.text
			buttons = buttons .. "[" .. tostring(slot10) .. "]"
		end
	end

	slot9 = self
	slot8 = self._data.title
	slot12 = self._data.text
	slot8 = buttons

	return string.format(slot3, "%s, Title: %s, Text: %s, Buttons: %s", tostring(BaseDialog.to_string(slot8)), tostring(BaseDialog.to_string), tostring(self._strip_to_string_text(slot10, self)))
end
function Dialog:_strip_to_string_text(text)
	slot6 = text
	slot6 = "\\n"

	return string.gsub(slot3, tostring(slot5), "\n")
end

return 
