-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot3 = "CoreElementTimer"

core.module(slot1, core)

slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementTimer then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementTimer = slot0
function ElementTimer:init(...)
	slot3 = self

	ElementTimer.super.init(slot2, ...)

	self._digital_gui_units = {}
	self._triggers = {}

	return 
end
function ElementTimer:on_script_activated()
	slot4 = "timer"
	self._timer = self.value(slot2, self)
	slot4 = "timer"
	self._monitor_timer = self.value(slot2, self)
	slot3 = Network

	if not Network.is_server(slot2) then
		return 
	end

	if self._values.digital_gui_unit_ids then
		slot3 = self._values.digital_gui_unit_ids

		for _, id in ipairs(slot2) do
			if false then
				slot9 = id
				local unit = managers.editor.unit_with_id(slot7, managers.editor)
				slot10 = unit

				table.insert(managers.editor, self._digital_gui_units)

				slot9 = unit
				slot10 = self._timer

				unit.digital_gui(managers.editor).timer_set(managers.editor, unit.digital_gui(managers.editor))
			else
				slot8 = self._mission_script
				slot9 = id
				slot14 = "_load_unit"
				local unit = self._mission_script.worlddefinition(slot7).get_unit_on_load(slot7, self._mission_script.worlddefinition(slot7), callback(slot11, self, self))

				if unit then
					slot10 = unit

					table.insert(slot8, self._digital_gui_units)

					slot9 = unit
					slot10 = self._timer

					unit.digital_gui(slot8).timer_set(slot8, unit.digital_gui(slot8))
				end
			end
		end
	end

	if not self.monitor_element and self._values.output_monitor_id then
	end

	slot3 = self

	self.monitor_output_change(slot2)

	return 
end
function ElementTimer:_load_unit(unit)
	slot5 = unit

	table.insert(slot3, self._digital_gui_units)

	slot4 = unit
	slot5 = self._timer

	unit.digital_gui(slot3).timer_set(slot3, unit.digital_gui(slot3))

	return 
end
function ElementTimer:set_enabled(enabled)
	slot5 = enabled

	ElementTimer.super.set_enabled(slot3, self)

	return 
end
function ElementTimer:add_updator()
	slot3 = Network

	if not Network.is_server(slot2) then
		return 
	end

	if not self._updator then
		self._updator = true
		slot4 = self._id
		slot9 = "update_timer"

		self._mission_script.add_updator(slot2, self._mission_script, callback(slot6, self, self))
	end

	return 
end
function ElementTimer:remove_updator()
	if self._updator then
		slot4 = self._id

		self._mission_script.remove_updator(slot2, self._mission_script)

		self._updator = nil
	end

	return 
end
function ElementTimer:update_timer(t, dt)
	self._timer = self._timer - dt

	if 1 < self._monitor_timer - self._timer then
		self._monitor_timer = self._timer
		slot5 = self

		self.monitor_output_change(slot4)
	end

	if self._timer <= 0 then
		slot5 = self

		self.remove_updator(slot4)

		slot5 = self

		self.on_executed(slot4)
	end

	slot5 = self._triggers

	for id, cb_data in pairs(slot4) do
		if self._timer <= cb_data.time then
			cb_data.callback()

			slot11 = id

			self.remove_trigger(slot9, self)
		end
	end

	return 
end
function ElementTimer:client_on_executed(...)
	return 
end
function ElementTimer:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	slot5 = instigator

	ElementTimer.super.on_executed(slot3, self)

	return 
end
function ElementTimer:timer_operation_pause()
	slot3 = self

	self.remove_updator(slot2)

	slot3 = self

	self._pause_digital_guis(slot2)

	slot4 = "... paused"

	self.monitor_output_change(slot2, self)

	return 
end
function ElementTimer:timer_operation_start()
	slot3 = self

	self.add_updator(slot2)

	slot3 = self

	self._start_digital_guis_count_down(slot2)

	slot4 = "... started"

	self.monitor_output_change(slot2, self)

	return 
end
function ElementTimer:timer_operation_add_time(time)
	self._timer = self._timer + time
	slot4 = self

	self._update_digital_guis_timer(slot3)

	slot5 = "... add (" .. time .. ")"

	self.monitor_output_change(slot3, self)

	return 
end
function ElementTimer:timer_operation_subtract_time(time)
	self._timer = self._timer - time
	slot4 = self

	self._update_digital_guis_timer(slot3)

	slot5 = "... subtract (" .. time .. ")"

	self.monitor_output_change(slot3, self)

	return 
end
function ElementTimer:timer_operation_reset()
	self._timer = self._values.timer
	slot3 = self

	self._update_digital_guis_timer(slot2)

	slot4 = "... reset"

	self.monitor_output_change(slot2, self)

	return 
end
function ElementTimer:timer_operation_set_time(time)
	self._timer = time
	slot4 = self

	self._update_digital_guis_timer(slot3)

	slot5 = "... set (" .. time .. ")"

	self.monitor_output_change(slot3, self)

	return 
end
function ElementTimer:_update_digital_guis_timer()
	slot3 = self._digital_gui_units

	for _, unit in ipairs(slot2) do
		slot8 = unit

		if alive(slot7) then
			slot8 = unit
			slot10 = true

			unit.digital_gui(slot7).timer_set(slot7, unit.digital_gui(slot7), self._timer)
		end
	end

	return 
end
function ElementTimer:_start_digital_guis_count_down()
	slot3 = self._digital_gui_units

	for _, unit in ipairs(slot2) do
		slot8 = unit

		if alive(slot7) then
			slot8 = unit
			slot9 = true

			unit.digital_gui(slot7).timer_start_count_down(slot7, unit.digital_gui(slot7))
		end
	end

	return 
end
function ElementTimer:_start_digital_guis_count_up()
	slot3 = self._digital_gui_units

	for _, unit in ipairs(slot2) do
		slot8 = unit

		if alive(slot7) then
			slot8 = unit
			slot9 = true

			unit.digital_gui(slot7).timer_start_count_up(slot7, unit.digital_gui(slot7))
		end
	end

	return 
end
function ElementTimer:_pause_digital_guis()
	slot3 = self._digital_gui_units

	for _, unit in ipairs(slot2) do
		slot8 = unit

		if alive(slot7) then
			slot8 = unit
			slot9 = true

			unit.digital_gui(slot7).timer_pause(slot7, unit.digital_gui(slot7))
		end
	end

	return 
end
function ElementTimer:add_trigger(id, time, callback)
	self._triggers[id] = {
		time = time,
		callback = callback
	}

	return 
end
function ElementTimer:remove_trigger(id)
	self._triggers[id] = nil

	return 
end
function ElementTimer:monitor_output_change(output)
	if self.monitor_element then
		slot5 = self._timer
		local output_string = "time: " .. math.round(slot4) .. " " .. (output or "")
		slot7 = output_string

		self.monitor_element.on_monitored_element(" ", self.monitor_element, self._editor_name)
	end

	return 
end

if not ElementTimerHud then
	slot2 = ElementTimer
	slot0 = class(slot1)
end

ElementTimerHud = slot0
function ElementTimerHud:init(...)
	slot3 = self

	ElementTimerHud.super.init(slot2, ...)

	self._show_hud_timer = false
	self._total_timer_value = self._values.timer
	slot3 = Application
	self._hud_timer_next_sync = Application.time(slot2) + 9

	return 
end
function ElementTimerHud:on_script_activated()
	slot4 = "timer"
	self._timer = self.value(slot2, self)
	slot3 = Network

	if not Network.is_server(slot2) then
		return 
	end

	self._on_script_activated_done = true
	slot4 = self._id

	self._mission_script.add_save_state_cb(slot2, self._mission_script)

	return 
end
function ElementTimerHud:save(data)
	if self._timer <= 0 then
		self._show_hud_timer = false
	end

	data.timer = self._timer
	data.show_hud_timer = self._show_hud_timer
	data.total_timer_value = self._total_timer_value
	data.enabled = self._values.enabled

	return 
end
function ElementTimerHud:load(data)
	if not self._on_script_activated_done then
		slot4 = self

		self.on_script_activated(slot3)
	end

	slot5 = data.enabled

	self.set_enabled(slot3, self)

	self._timer = data.timer
	self._show_hud_timer = data.show_hud_timer
	self._total_timer_value = data.total_timer_value

	if self._show_hud_timer then
		slot4 = self

		self._timer_start(slot3)

		slot4 = self

		self._timer_show_hud_timer(slot3)
	end

	return 
end
function ElementTimerHud:add_updator()
	if not self._updator then
		self._updator = true
		slot4 = self._id
		slot9 = "update_timer"

		self._mission_script.add_updator(slot2, self._mission_script, callback(slot6, self, self))
	end

	return 
end
function ElementTimerHud:update_timer(t, dt)
	self._timer = self._timer - dt

	if self._timer <= 0 then
		slot5 = self

		self.remove_updator(slot4)

		slot5 = self

		self.on_executed(slot4)

		if self._show_hud_timer then
			slot6 = true

			managers.hud.remove_objectives_timer_hud(slot4, managers.hud)

			self._hud_timer_start_time = nil
			self._show_hud_timer = false
		end
	end

	slot5 = self._triggers

	for id, cb_data in pairs(slot4) do
		if self._timer <= cb_data.time then
			cb_data.callback()

			slot11 = id

			self.remove_trigger(slot9, self)
		end
	end

	if self._show_hud_timer and 0 <= self._timer then
		slot8 = self._timer

		managers.hud.set_objectives_timer_hud_value(slot4, managers.hud, self._total_timer_value - self._timer, self._total_timer_value)

		slot5 = Network

		if Network.is_server(slot4) then
			slot6 = Application

			if self._hud_timer_next_sync < Application.time(slot5) then
				slot5 = Application
				self._hud_timer_next_sync = Application.time(slot4) + 9
				slot7 = managers.network
				slot7 = managers.network.session(slot6)

				for peer_id, peer in pairs(managers.network.session(slot6).peers(slot6)) do
					slot14 = Network
					slot17 = peer
					slot11 = self._timer + Network.qos(slot13, peer.rpc(slot16)).ping / 1000
					local sync_time = math.min(slot9, 100000)
					slot13 = sync_time

					self.execute_client_hud_timer_command(100000, self, "sync_time")
				end
			end
		end
	end

	return 
end
function ElementTimerHud:timer_operation_pause()
	slot3 = self

	self._timer_pause(slot2)

	slot5 = nil

	self.execute_client_hud_timer_command(slot2, self, "pause")

	return 
end
function ElementTimerHud:timer_operation_start()
	slot3 = self

	self._timer_start(slot2)

	slot5 = nil

	self.execute_client_hud_timer_command(slot2, self, "start")

	return 
end
function ElementTimerHud:timer_operation_add_time(time)
	slot5 = time

	self._timer_add_time(slot3, self)

	slot6 = time

	self.execute_client_hud_timer_command(slot3, self, "add_time")

	return 
end
function ElementTimerHud:timer_operation_subtract_time(time)
	slot5 = time

	self._timer_subtract_time(slot3, self)

	slot6 = time

	self.execute_client_hud_timer_command(slot3, self, "subtract_time")

	return 
end
function ElementTimerHud:timer_operation_reset()
	slot3 = self

	self._timer_reset(slot2)

	slot5 = nil

	self.execute_client_hud_timer_command(slot2, self, "reset")

	return 
end
function ElementTimerHud:timer_operation_set_time(time)
	slot5 = time

	self._timer_set_time(slot3, self)

	slot6 = time

	self.execute_client_hud_timer_command(slot3, self, "set_time")

	return 
end
function ElementTimerHud:timer_operation_show_hud_timer()
	slot3 = self

	self._timer_show_hud_timer(slot2)

	slot5 = nil

	self.execute_client_hud_timer_command(slot2, self, "show_hud_timer")

	return 
end
function ElementTimerHud:timer_operation_hide_hud_timer()
	slot3 = self

	self._timer_hide_hud_timer(slot2)

	slot5 = nil

	self.execute_client_hud_timer_command(slot2, self, "hide_hud_timer")

	return 
end
function ElementTimerHud:_timer_pause()
	slot3 = self

	self.remove_updator(slot2)

	return 
end
function ElementTimerHud:_timer_start()
	slot3 = self

	self.add_updator(slot2)

	return 
end
function ElementTimerHud:_timer_add_time(time)
	self._timer = self._timer + time
	self._total_timer_value = self._total_timer_value + time

	return 
end
function ElementTimerHud:_timer_subtract_time(time)
	self._timer = self._timer - time
	self._total_timer_value = self._total_timer_value - time

	return 
end
function ElementTimerHud:_timer_reset()
	self._timer = self._values.timer
	self._total_timer_value = self._values.timer

	return 
end
function ElementTimerHud:_timer_set_time(time)
	self._timer = time
	self._total_timer_value = time

	return 
end
function ElementTimerHud:_timer_sync_time(time)
	self._timer = time

	return 
end
function ElementTimerHud:_timer_show_hud_timer()
	slot5 = 100

	managers.hud.create_objectives_timer_hud(slot2, managers.hud, 0)

	self._show_hud_timer = true

	return 
end
function ElementTimerHud:_timer_hide_hud_timer()
	self._show_hud_timer = false
	slot4 = false

	managers.hud.remove_objectives_timer_hud(slot2, managers.hud)

	return 
end
function ElementTimerHud:execute_client_hud_timer_command(command, command_value)
	slot5 = Network

	if Network.is_server(slot4) then
		slot5 = managers.network
		slot11 = command_value

		managers.network.session(slot4).send_to_peers_synched(slot4, managers.network.session(slot4), "sync_client_hud_timer_command", self._sync_id, self._id, self._last_orientation_index or 0, command)
	end

	return 
end
function ElementTimerHud:sync_client_hud_timer_command(command, command_value)
	if command then
		if command == "pause" then
			slot5 = self

			self._timer_pause(slot4)
		elseif command == "start" then
			slot5 = self

			self._timer_start(slot4)
		elseif command == "add_time" then
			slot6 = command_value

			self._timer_add_time(slot4, self)
		elseif command == "subtract_time" then
			slot6 = command_value

			self._timer_subtract_time(slot4, self)
		elseif command == "reset" then
			slot5 = self

			self._timer_reset(slot4)
		elseif command == "set_time" then
			slot6 = command_value

			self._timer_set_time(slot4, self)
		elseif command == "show_hud_timer" then
			slot5 = self

			self._timer_show_hud_timer(slot4)
		elseif command == "hide_hud_timer" then
			slot5 = self

			self._timer_hide_hud_timer(slot4)
		elseif command == "sync_time" then
			slot6 = command_value

			self._timer_sync_time(slot4, self)
		end
	end

	return 
end

if not ElementTimerOperator then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementTimerOperator = slot0
function ElementTimerOperator:init(...)
	slot3 = self

	ElementTimerOperator.super.init(slot2, ...)

	return 
end
function ElementTimerOperator:client_on_executed(...)
	slot4 = "[ElementTimerOperator:client_on_executed]"

	Application.trace(slot2, Application)

	return 
end
function ElementTimerOperator:on_executed(instigator)
	slot5 = "[ElementTimerOperator:on_executed]"

	Application.trace(slot3, Application)

	if not self._values.enabled then
		return 
	end

	slot4 = self._values.elements

	for _, id in ipairs(slot3) do
		slot10 = id
		local element = self.get_mission_element(slot8, self)

		if element then
			if self._values.operation == "pause" then
				slot10 = element

				element.timer_operation_pause(slot9)
			elseif self._values.operation == "start" then
				slot10 = element

				element.timer_operation_start(slot9)
			elseif self._values.operation == "add_time" then
				slot11 = self._values.time

				element.timer_operation_add_time(slot9, element)
			elseif self._values.operation == "subtract_time" then
				slot11 = self._values.time

				element.timer_operation_subtract_time(slot9, element)
			elseif self._values.operation == "reset" then
				slot11 = self._values.time

				element.timer_operation_reset(slot9, element)
			elseif self._values.operation == "set_time" then
				slot11 = self._values.time

				element.timer_operation_set_time(slot9, element)
			elseif self._values.operation == "show_hud_timer" then
				slot10 = element

				element.timer_operation_show_hud_timer(slot9)
			elseif self._values.operation == "hide_hud_timer" then
				slot10 = element

				element.timer_operation_hide_hud_timer(slot9)
			end
		end
	end

	slot5 = instigator

	ElementTimerOperator.super.on_executed(slot3, self)

	return 
end

if not ElementTimerTrigger then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementTimerTrigger = slot0
function ElementTimerTrigger:init(...)
	slot3 = self

	ElementTimerTrigger.super.init(slot2, ...)

	return 
end
function ElementTimerTrigger:on_script_activated()
	slot3 = self

	self.activate_trigger(slot2)

	return 
end
function ElementTimerTrigger:client_on_executed(...)
	return 
end
function ElementTimerTrigger:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	slot5 = instigator

	ElementTimerTrigger.super.on_executed(slot3, self)

	return 
end
function ElementTimerTrigger:activate_trigger()
	slot3 = self._values.elements

	for _, id in ipairs(slot2) do
		slot9 = id
		local element = self.get_mission_element(slot7, self)
		slot11 = self._values.time
		slot16 = "on_executed"

		element.add_trigger(self, element, self._id, callback(slot13, self, self))
	end

	return 
end
function ElementTimerTrigger:operation_add()
	slot3 = self

	self.activate_trigger(slot2)

	return 
end

return 
