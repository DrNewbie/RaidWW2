-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreLocalizationManager"

core.module(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

slot3 = "CoreEvent"

core.import(slot1, core)

LocalizationManager = LocalizationManager or CoreClass.class()
function LocalizationManager:init()
	slot3 = Localizer
	slot8 = "_localizer_post_process"

	Localizer.set_post_processor(slot2, CoreEvent.callback(slot5, self, self))

	self._default_macros = {}
	slot5 = "\n"

	self.set_default_macro(slot2, self, "NL")

	slot5 = ""

	self.set_default_macro(slot2, self, "EMPTY")

	local platform_id = SystemInfo.platform(slot2)
	slot4 = "X360"

	if platform_id == Idstring(SystemInfo) then
		self._platform = "X360"
	else
		slot4 = "PS3"

		if platform_id == Idstring(slot3) then
			self._platform = "PS3"
		else
			slot4 = "XB1"

			if platform_id == Idstring(slot3) then
				self._platform = "X360"
			else
				slot4 = "PS4"

				if platform_id == Idstring(slot3) then
					self._platform = "PS3"
				else
					self._platform = "WIN32"
				end
			end
		end
	end

	return 
end
function LocalizationManager:add_default_macro(macro, value)
	slot7 = value

	self.set_default_macro(slot4, self, macro)

	return 
end
function LocalizationManager:set_default_macro(macro, value)
	if not self._default_macros then
		self._default_macros = {}
	end

	slot6 = value
	self._default_macros[macro] = tostring(slot5)

	return 
end
function LocalizationManager:get_default_macro(macro)
	return self._default_macros[macro]
end
function LocalizationManager:get_default_macros()
	return self._default_macros
end
function LocalizationManager:exists(string_id)
	slot4 = Localizer
	slot7 = string_id

	return Localizer.exists(slot3, Idstring(slot6))
end
function LocalizationManager:text(string_id_in, macros)
	local string_id = string_id_in or "STRING_ID IS NULL!"

	if not string_id_in then
		slot7 = "[LocalizationManager:text] Localization called with NULL value."

		Application.error(slot5, Application, debug.traceback())
	end

	local return_string = "ERROR: " .. string_id
	local str_id = nil

	if not string_id or string_id == "" then
		return_string = ""
	else
		slot9 = string_id .. "_" .. self._platform

		if self.exists(slot7, self) then
			str_id = string_id .. "_" .. self._platform
		else
			slot9 = string_id

			if self.exists(slot7, self) then
				str_id = string_id
			end
		end
	end

	if str_id then
		self._macro_context = macros
		slot8 = Localizer
		slot11 = str_id
		return_string = Localizer.lookup(slot7, Idstring(slot10))
		self._macro_context = nil
	end

	return return_string
end
function LocalizationManager:format_text(text_string)
	slot4 = self
	slot10 = ";"

	return self._localizer_post_process(slot3, self._text_localize(slot6, self, text_string, "@"))
end
function LocalizationManager:_localizer_post_process(string)
	local localized_string = string
	local macros = {}
	slot6 = self._macro_context

	if type(slot5) ~= "table" then
		self._macro_context = {}
	end

	slot6 = self._default_macros

	for k, v in pairs(slot5) do
		macros[k] = v
	end

	slot6 = self._macro_context

	for k, v in pairs(slot5) do
		slot11 = v
		macros[k] = tostring(slot10)
	end

	if self._pre_process_func then
		slot6 = macros

		self._pre_process_func(slot5)
	end

	slot8 = macros

	return self._text_macroize(slot5, self, localized_string)
end
function LocalizationManager:_text_localize(text)
	local function func(id)

		-- Decompilation error in this vicinity:
		slot4 = id
	end

	slot9 = func

	return self._text_format(slot4, self, text, "@", ";")
end
function LocalizationManager:_text_macroize(text, macros)
	local function func(word)
		return macros[word] or false
	end

	slot10 = func

	return self._text_format(slot5, self, text, "$", ";")
end
function LocalizationManager:_text_format(text, X, Y, func)
	local match_string = "%b" .. X .. Y

	function slot10(word)
		slot5 = -2
		local id = string.sub(slot2, word, 2)
		slot4 = id
		local value = func(word)

		if value then
			return value
		end

		slot10 = func

		return X .. self._text_format(slot5, self, id, X, Y) .. Y
	end

	return string.gsub(Y, text, match_string)
end

return 
