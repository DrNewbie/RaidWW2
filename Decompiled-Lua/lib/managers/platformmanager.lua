-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "PlatformManager"

core.module(slot1, core)

slot3 = "CoreEvent"

core.import(slot1, core)

local empty_vector = Vector3()
local tmp_vector = Vector3()
PlatformManager = PlatformManager or class()
PlatformManager.PLATFORM_CLASS_MAP = {}
function PlatformManager:new(...)
	local platform = SystemInfo.platform(slot2)
	slot5 = platform
	slot4 = self.PLATFORM_CLASS_MAP[platform.key(slot4)] or GenericPlatformManager

	return self.PLATFORM_CLASS_MAP[platform.key(slot4)] or GenericPlatformManager.new(SystemInfo, ...)
end
GenericPlatformManager = GenericPlatformManager or class()
function GenericPlatformManager:init()
	self._event_queue_list = {}
	self._event_callback_handler_map = {}
	self._current_presence = "Idle"
	self._current_rich_presence = "Idle"

	return 
end
function GenericPlatformManager:event(event_type, ...)
	slot5 = {
		event_type = event_type,
		param_list = {
			...
		}
	}

	table.insert(slot3, self._event_queue_list)

	return 
end
function GenericPlatformManager:destroy_context()
	return 
end
function GenericPlatformManager:add_event_callback(event_type, callback_func)
	slot3 = self._event_callback_handler_map

	if not self._event_callback_handler_map[event_type] then
		slot6 = CoreEvent.CallbackEventHandler
		slot4 = CoreEvent.CallbackEventHandler.new(slot5)
	end

	slot3[event_type] = slot4
	slot6 = callback_func

	self._event_callback_handler_map[event_type].add(slot4, self._event_callback_handler_map[event_type])

	return 
end
function GenericPlatformManager:remove_event_callback(event_type, callback_func)
	slot9 = event_type
	slot6 = "Tried to remove non-existing callback on event type \"" .. tostring(slot8) .. "\"."

	assert(slot4, event_type and self._event_callback_handler_map[event_type])

	slot6 = callback_func

	self._event_callback_handler_map[event_type].remove(slot4, self._event_callback_handler_map[event_type])

	slot5 = self._event_callback_handler_map[event_type]

	if not next(slot4) then
		self._event_callback_handler_map[event_type] = nil
	end

	return 
end
function GenericPlatformManager:update(t, dt)
	slot5 = self._event_queue_list

	if next(slot4) then
		slot5 = self._event_queue_list

		for _, event in ipairs(slot4) do
			local callback_handler = self._event_callback_handler_map[event.event_type]

			if callback_handler then
				slot11 = callback_handler
				slot14 = event.param_list

				callback_handler.dispatch(slot10, unpack(slot13))
			end
		end

		self._event_queue_list = {}
	end

	return 
end
function GenericPlatformManager:paused_update(t, dt)
	slot7 = dt

	self.update(slot4, self, t)

	return 
end
function GenericPlatformManager:set_presence(name)
	self._current_presence = name

	return 
end
function GenericPlatformManager:presence()
	return self._current_presence
end
function GenericPlatformManager:set_rich_presence(name)
	self._current_rich_presence = name

	return 
end
function GenericPlatformManager:rich_presence()
	return self._current_rich_presence
end
function GenericPlatformManager:translate_path(path)
	slot6 = "\\%1"

	return string.gsub(slot3, path, "/+([~/]*)")
end
function GenericPlatformManager:set_playing(is_playing)
	Global.game_settings.is_playing = is_playing

	return 
end
function GenericPlatformManager:set_progress(progress)
	return 
end
function GenericPlatformManager:set_feedback_color(color)
	return 
end

if not Xbox360PlatformManager then
	slot4 = GenericPlatformManager
	slot2 = class(slot3)
end

Xbox360PlatformManager = slot2
slot5 = "X360"
slot5 = _G.Idstring(slot4)
PlatformManager.PLATFORM_CLASS_MAP[_G.Idstring(slot4).key(slot4)] = Xbox360PlatformManager
function Xbox360PlatformManager:init()
	slot3 = self

	GenericPlatformManager.init(slot2)

	slot3 = XboxLive
	slot8 = "event"

	XboxLive.set_callback(slot2, callback(slot5, self, self))

	return 
end
function Xbox360PlatformManager:destroy_context()
	slot3 = self

	GenericPlatformManager.destroy_context(slot2)

	slot4 = nil

	XboxLive.set_callback(slot2, XboxLive)

	return 
end
function Xbox360PlatformManager:set_rich_presence(name, callback)
	slot6 = name

	print(slot4, "Xbox360PlatformManager:set_rich_presence")

	slot6 = name

	GenericPlatformManager.set_rich_presence(slot4, self)

	if callback then
		slot8 = callback

		XboxLive.set_context(slot4, XboxLive, "presence", name)
	else
		function slot8()
			return 
		end

		XboxLive.set_context(slot4, XboxLive, "presence", name)
	end

	return 
end
function Xbox360PlatformManager:set_presence(name, callback)
	slot6 = name

	GenericPlatformManager.set_presence(slot4, self)

	return 
end

if not XB1PlatformManager then
	slot4 = GenericPlatformManager
	slot2 = class(slot3)
end

XB1PlatformManager = slot2
slot5 = "XB1"
slot5 = _G.Idstring(slot4)
PlatformManager.PLATFORM_CLASS_MAP[_G.Idstring(slot4).key(slot4)] = XB1PlatformManager
function XB1PlatformManager:init()
	slot3 = self

	GenericPlatformManager.init(slot2)

	slot3 = XboxLive
	slot8 = "event"

	XboxLive.set_callback(slot2, callback(slot5, self, self))

	return 
end
function XB1PlatformManager:destroy_context()
	slot3 = self

	GenericPlatformManager.destroy_context(slot2)

	slot4 = nil

	XboxLive.set_callback(slot2, XboxLive)

	return 
end
function XB1PlatformManager:set_rich_presence(name, callback)
	slot6 = name

	print(slot4, "XB1PlatformManager:set_rich_presence")

	slot6 = name

	GenericPlatformManager.set_rich_presence(slot4, self)

	if callback then
		slot8 = callback

		XboxLive.set_context(slot4, XboxLive, "presence", name)
	else
		function slot8()
			return 
		end

		XboxLive.set_context(slot4, XboxLive, "presence", name)
	end

	return 
end
function XB1PlatformManager:set_presence(name, callback)
	slot6 = name

	GenericPlatformManager.set_presence(slot4, self)

	return 
end
function XB1PlatformManager:set_playing(is_playing)
	if not Global.game_settings.is_playing ~= not is_playing then
		if not Global.game_settings.single_player then
			if managers.network.matchmake._session and is_playing then
				slot5 = managers.network.matchmake._session

				XboxLive.set_mp_begin(slot3, XboxLive)
			end

			if not is_playing then
				slot4 = XboxLive

				XboxLive.set_mp_end(slot3)
			end
		end

		slot5 = is_playing

		XB1PlatformManager.super.set_playing(slot3, self)
	end

	return 
end
function XB1PlatformManager:set_progress(progress)
	slot5 = progress * 100

	XboxLive.write_game_progress(slot3, XboxLive)

	return 
end

if not PS3PlatformManager then
	slot4 = GenericPlatformManager
	slot2 = class(slot3)
end

PS3PlatformManager = slot2
slot5 = "PS3"
slot5 = _G.Idstring(slot4)
PlatformManager.PLATFORM_CLASS_MAP[_G.Idstring(slot4).key(slot4)] = PS3PlatformManager
function PS3PlatformManager:init(...)
	slot3 = self

	PS3PlatformManager.super.init(slot2, ...)

	self._current_psn_presence = ""
	self._psn_set_presence_time = 0

	return 
end
function PS3PlatformManager:translate_path(path)
	slot6 = "/%1"

	return string.gsub(slot3, path, "\\+([~\\]*)")
end
function PS3PlatformManager:update(t, dt)
	slot7 = dt

	PS3PlatformManager.super.update(slot4, self, t)

	slot6 = self

	if self._current_psn_presence ~= self.presence(self) and self._psn_set_presence_time <= t then
		self._psn_set_presence_time = t + 10
		slot5 = self
		self._current_psn_presence = self.presence(slot4)
		slot6 = self._current_psn_presence

		print(slot4, "SET PRESENCE")

		slot6 = self._current_psn_presence

		PSN.set_presence_info(slot4, PSN)
	end

	return 
end
function PS3PlatformManager:set_presence(name)
	slot5 = name

	GenericPlatformManager.set_presence(slot3, self)

	return 
end

if not PS4PlatformManager then
	slot4 = GenericPlatformManager
	slot2 = class(slot3)
end

PS4PlatformManager = slot2
slot5 = "PS4"
slot5 = _G.Idstring(slot4)
PlatformManager.PLATFORM_CLASS_MAP[_G.Idstring(slot4).key(slot4)] = PS4PlatformManager
function PS4PlatformManager:init(...)
	slot3 = self

	PS4PlatformManager.super.init(slot2, ...)

	self._current_psn_presence = ""
	self._psn_set_presence_time = 0

	return 
end
function PS4PlatformManager:destroy_context()
	slot3 = self

	GenericPlatformManager.destroy_context(slot2)

	slot4 = nil

	PSN.set_online_callback(slot2, PSN)

	slot4 = nil

	self.set_feedback_color(slot2, self)

	return 
end
function PS4PlatformManager:translate_path(path)
	slot6 = "/%1"

	return string.gsub(slot3, path, "\\+([~\\]*)")
end
function PS4PlatformManager:update(t, dt)
	slot7 = dt

	PS4PlatformManager.super.update(slot4, self, t)

	slot6 = self

	if self._current_psn_presence ~= self.presence(self) and self._psn_set_presence_time <= t then
		self._psn_set_presence_time = t + 10
		slot5 = self
		self._current_psn_presence = self.presence(slot4)
		slot6 = self._current_psn_presence

		print(slot4, "SET PRESENCE")
	end

	return 
end
function PS4PlatformManager:set_playing(is_playing)
	if not Global.game_settings.is_playing ~= not is_playing then
		if not Global.game_settings.single_player then
			slot5 = is_playing

			PSN.set_mp_round(slot3, PSN)
		end

		if not is_playing then
			slot5 = nil

			self.set_feedback_color(slot3, self)
		end

		slot5 = is_playing

		PS4PlatformManager.super.set_playing(slot3, self)
	end

	return 
end
function PS4PlatformManager:set_presence(name)
	slot5 = name

	GenericPlatformManager.set_presence(slot3, self)

	return 
end
function PS4PlatformManager:set_rich_presence(name)
	slot5 = name

	print(slot3, "PS4PlatformManager:set_rich_presence")

	slot5 = name

	GenericPlatformManager.set_rich_presence(slot3, self)

	slot4 = PSN
	slot8 = "ps4_presence_" .. name

	PSN.set_presence_info(slot3, managers.localization.text(slot6, managers.localization))

	return 
end
function PS4PlatformManager:set_feedback_color(color)
	slot4 = managers.controller
	local wrapper_index = managers.controller.get_default_wrapper_index(slot3)

	if not wrapper_index then
		return 
	end

	slot6 = wrapper_index
	local controller_index_list = managers.controller.get_controller_index_list(slot4, managers.controller)

	if not controller_index_list then
		return 
	end

	slot6 = controller_index_list

	for _, controller_index in ipairs(slot5) do
		slot12 = controller_index
		local controller = Input.controller(slot10, Input)

		if controller.type_name == "PS4Controller" then
			if Global.game_settings.is_playing and color then
				slot13 = "setup"
				slot12 = rawget(slot11, _G)
			else
				slot13 = empty_vector

				controller.set_color(slot11, controller)
			end
		end
	end

	return 
end

if not WinPlatformManager then
	slot4 = GenericPlatformManager
	slot2 = class(slot3)
end

WinPlatformManager = slot2
slot5 = "WIN32"
slot5 = _G.Idstring(slot4)
PlatformManager.PLATFORM_CLASS_MAP[_G.Idstring(slot4).key(slot4)] = WinPlatformManager

return 
