slot3 = "SystemMenuManager"

core.module(slot1, core)

slot2 = "lib/managers/dialogs/BaseDialog"

require(slot1)

if not KeyboardInputDialog then
	slot2 = BaseDialog
	slot0 = class(slot1)
end

KeyboardInputDialog = slot0
function KeyboardInputDialog:title()
	return self._data.title or ""
end
function KeyboardInputDialog:text()
	return self._data.text or ""
end
function KeyboardInputDialog:input_text()
	return self._data.input_text
end
function KeyboardInputDialog:input_type()
	return self._data.input_type or "default"
end
function KeyboardInputDialog:max_count()
	return self._data.max_count
end
function KeyboardInputDialog:filter()
	return self._data.filter
end
function KeyboardInputDialog:done_callback(success, input_text)
	if self._data.callback_func then
		slot6 = input_text

		self._data.callback_func(slot4, success)
	end

	slot5 = self

	self.fade_out_close(slot4)

	return 
end
function KeyboardInputDialog:to_string()
	slot8 = self
	slot8 = tostring(self._data.input_text)
	slot11 = self._data.filter

	return string.format(slot2, "%s, Title: %s, Text: %s, Input text: %s, Max count: %s, Filter: %s", tostring(BaseDialog.to_string(slot7)), tostring(BaseDialog.to_string), tostring(self._data.title), tostring(self._data.text), tostring(self._data.max_count))
end

return 
