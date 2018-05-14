-- Decompilation Error: self.ljd.ast.slotworks.eliminate_temporary(self.ast)

slot0 = core
slot2 = slot0
slot0 = slot0.module
slot3 = "CoreLocalUserStorage"

slot0(slot1, slot2)

slot0 = core
slot2 = slot0
slot0 = slot0.import
slot3 = "CoreRequester"

slot0(slot1, slot2)

slot0 = core
slot2 = slot0
slot0 = slot0.import
slot3 = "CoreFiniteStateMachine"

slot0(slot1, slot2)

slot0 = core
slot2 = slot0
slot0 = slot0.import
slot3 = "CoreLocalUserStorageStates"

slot0(slot1, slot2)

slot0 = core
slot2 = slot0
slot0 = slot0.import
slot3 = "CoreSessionGenericState"

slot0(slot1, slot2)

slot0 = Storage

if not slot0 then
	slot0 = class
	slot2 = CoreSessionGenericState
	slot2 = slot2.State
	slot0 = slot0(slot1)
end

Storage = slot0
slot0 = Storage

function slot1(self, local_user, settings_handler, progress_handler, profile_data_loaded_callback)
	slot5 = CoreRequester
	slot5 = slot5.Requester
	slot7 = slot5
	slot5 = slot5.new
	slot5 = slot5(slot6)
	self._load = slot5
	slot5 = CoreFiniteStateMachine
	slot5 = slot5.FiniteStateMachine
	slot7 = slot5
	slot5 = slot5.new
	slot8 = CoreLocalUserStorageStates
	slot8 = slot8.Init
	slot9 = "storage"
	slot10 = self
	slot5 = slot5(slot6, slot7, slot8, slot9)
	self._state = slot5
	self._local_user = local_user
	slot5 = self._local_user
	slot5 = slot5._user_index
	self._user_index = slot5
	self._settings_handler = settings_handler
	self._progress_handler = progress_handler
	self._profile_data_loaded_callback = profile_data_loaded_callback

	return 
end

slot0.init = slot1
slot0 = Storage

function slot1(self)
	slot1 = self._state
	slot3 = slot1
	slot1 = slot1.transition

	slot1(slot2)

	return 
end

slot0.transition = slot1
slot0 = Storage

function slot1(self)
	slot1 = self._load
	slot3 = slot1
	slot1 = slot1.request

	slot1(slot2)

	return 
end

slot0.request_load = slot1
slot0 = Storage

function slot1(self)
	return 
end

slot0.request_save = slot1
slot0 = Storage

function slot1(self)
	slot1 = {
		preview = false
	}
	slot2 = {
		1
	}
	slot1.save_slots = slot2
	slot2 = self._user_index
	slot1.user_index = slot2

	return slot1
end

slot0._common_save_params = slot1
slot0 = Storage

function slot1(self)
	slot3 = self
	slot1 = self._common_save_params
	local save_param = slot1(slot2)
	local callback = nil
	slot3 = NewSave
	slot5 = slot3
	slot3 = slot3.load
	slot6 = save_param
	slot7 = callback
	slot3 = slot3(slot4, slot5, slot6)
	self._load_task = slot3
	slot3 = self._load
	slot5 = slot3
	slot3 = slot3.task_started

	slot3(slot4)

	return 
end

slot0._start_load_task = slot1
slot0 = Storage

function slot1(self)
	slot1 = self._load_task
	slot3 = slot1
	slot1 = slot1.has_next
	slot1 = slot1(slot2)

	if not slot1 then
		return 
	end

	slot1 = self._load_task
	slot3 = slot1
	slot1 = slot1.next
	local profile_data = slot1(slot2)
	slot4 = profile_data
	slot2 = profile_data.status
	slot2 = slot2(slot3)
	slot3 = SaveData
	slot3 = slot3.OK

	if slot2 == slot3 then
		slot4 = self
		slot2 = self._profile_data_loaded
		slot7 = profile_data
		slot5 = profile_data.information

		slot2(slot3, slot5(slot6))
	end

	slot4 = profile_data
	slot2 = profile_data.status

	return slot2(slot3)
end

slot0._load_status = slot1
slot0 = Storage

function slot1(self)
	slot1 = nil
	self._load_task = slot1
	slot1 = self._load
	slot3 = slot1
	slot1 = slot1.task_completed

	slot1(slot2)

	return 
end

slot0._close_load_task = slot1
slot0 = Storage

function slot1(self, handler, profile_data, stored_version)
	local func = nil

	repeat
		slot5 = "convert_from_"
		slot6 = tostring
		slot8 = stored_version
		slot6 = slot6(slot7)
		slot7 = "_to_"
		slot8 = tostring
		slot10 = stored_version + 1
		slot8 = slot8(slot9)
		local function_name = slot5 .. slot6 .. slot7 .. slot8
		func = handler[function_name]

		if func ~= nil then
			slot6 = func
			slot8 = handler
			slot9 = profile_data
			slot6 = slot6(slot7, slot8)
			profile_data = slot6
			stored_version = stored_version + 1
		end
	until func == nil

	slot5 = profile_data
	slot6 = stored_version

	return slot5, slot6
end

slot0._fast_forward_profile_data = slot1
slot0 = Storage

function slot1(self, profile_data)
	slot2 = profile_data.settings
	slot5 = self
	slot3 = self._fast_forward_profile_data
	slot6 = self._settings_handler
	slot7 = profile_data.settings
	slot7 = slot7.title_data
	slot8 = profile_data.settings
	slot8 = slot8.version
	slot3, slot4 = slot3(slot4, slot5, slot6, slot7)
	slot2.version = slot4
	profile_data.settings = slot3
	slot2 = profile_data.progress
	slot5 = self
	slot3 = self._fast_forward_profile_data
	slot6 = self._progress_handler
	slot7 = profile_data.progress
	slot7 = slot7.title_data
	slot8 = profile_data.progress
	slot8 = slot8.version
	slot3, slot4 = slot3(slot4, slot5, slot6, slot7)
	slot2.version = slot4
	profile_data.progress = slot3
	self._profile_data = profile_data
	slot2 = self._local_user
	slot4 = slot2
	slot2 = slot2.local_user_handler
	slot2 = slot2(slot3)
	slot4 = slot2
	slot2 = slot2.profile_data_loaded

	slot2(slot3)

	return 
end

slot0._profile_data_loaded = slot1
slot0 = Storage

function slot1(self)
	return self._profile_data ~= nil
end

slot0.profile_data_is_loaded = slot1
slot0 = Storage

function slot1(self)
	local profile_data = {}
	slot2 = {}
	profile_data.settings = slot2
	slot2 = profile_data.settings
	slot3 = {}
	slot2.title_data = slot3
	slot2 = profile_data.settings
	slot3 = 0
	slot2.version = slot3
	slot2 = {}
	profile_data.progress = slot2
	slot2 = profile_data.progress
	slot3 = {}
	slot2.title_data = slot3
	slot2 = profile_data.progress
	slot3 = 0
	slot2.version = slot3
	slot4 = self
	slot2 = self._profile_data_loaded
	slot5 = profile_data

	slot2(slot3, slot4)

	return 
end

slot0._create_profile_data = slot1
slot0 = Storage

function slot1(self)
	slot1 = self._profile_data
	slot1 = slot1.settings
	slot1 = slot1.title_data

	return slot1
end

slot0.profile_settings = slot1
slot0 = Storage

function slot1(self)
	slot1 = self._profile_data
	slot1 = slot1.progress
	slot1 = slot1.title_data

	return slot1
end

slot0.profile_progress = slot1

return 
