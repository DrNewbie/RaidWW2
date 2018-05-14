slot2 = "lib/managers/hud/HUDNotification"

require(slot1)

NotificationManager = NotificationManager or class()
function NotificationManager:init()
	self._notification_queue = {}
	self._currently_displayed_notification = nil

	return 
end
function NotificationManager:add_notification(notification_data)
	local prompt = nil

	if notification_data.reaction then
		notification_data.reaction.spent = false

		if notification_data.reaction.duration then
			slot7 = {
				BTN_STATS_VIEW = managers.localization.btn_macro(slot9, managers.localization)
			}
			slot11 = "stats_screen"
			prompt = managers.localization.text(slot4, managers.localization, "hud_notification_hold_stats")
		else
			slot7 = {
				BTN_STATS_VIEW = managers.localization.btn_macro(slot9, managers.localization)
			}
			slot11 = "stats_screen"
			prompt = managers.localization.text(slot4, managers.localization, "hud_notification_use_stats")
		end
	end

	notification_data.prompt = prompt
	notification_data.notification_type = notification_data.notification_type or HUDNotification.GENERIC

	if not notification_data.priority then
		notification_data.priority = 1000
	end

	if notification_data.shelf_life then
		slot5 = TimerManager
		slot5 = TimerManager.game(slot4)
		notification_data.creation_time = TimerManager.game(slot4).time(slot4)
	end

	slot5 = self

	self._clear_outdated_notifications(slot4)

	if self._currently_displayed_notification and self._currently_displayed_notification.id and notification_data.id == self._currently_displayed_notification.id then
		slot6 = "notification_hide"

		if managers.queued_tasks.has_task(slot4, managers.queued_tasks) or notification_data.duration then
			slot6 = "notification_hide"

			managers.queued_tasks.unqueue(slot4, managers.queued_tasks)

			if notification_data.duration then
				slot12 = true

				managers.queued_tasks.queue(slot4, managers.queued_tasks, "notification_hide", self.hide_current_notification, self, nil, notification_data.duration, nil)
			end
		end

		slot6 = notification_data

		self._currently_displayed_notification.hud.update_data(slot4, self._currently_displayed_notification.hud)

		return 
	end

	for i = 1, #self._notification_queue, 1 do
		if self._notification_queue[i] and notification_data.id == self._notification_queue[i].id then
			slot10 = i

			table.remove(slot8, self._notification_queue)
		end
	end

	local table_index = #self._notification_queue + 1

	for i = 1, #self._notification_queue, 1 do
		if notification_data.priority < self._notification_queue[i].priority then
			table_index = i

			break
		end
	end

	slot8 = notification_data

	table.insert(slot5, self._notification_queue, table_index)

	if self._currently_displayed_notification == nil and 0 < #self._notification_queue then
		slot7 = 1

		self.show_notification(slot5, self)
	elseif self._currently_displayed_notification and (notification_data.priority < self._currently_displayed_notification.priority or notification_data.force) then
		slot7 = "notification_hide"

		if managers.queued_tasks.has_task(slot5, managers.queued_tasks) then
			slot6 = self

			self.hide_current_notification(slot5)
		end
	end

	return 
end
function NotificationManager:show_notification(index)
	local notification = self._notification_queue[index]
	local hud = HUDNotification.create(slot4)
	self._notification_queue[index].hud = hud
	self._currently_displayed_notification = self._notification_queue[index]
	slot7 = 1

	table.remove(notification, self._notification_queue)

	if notification.duration then
		slot13 = true

		managers.queued_tasks.queue(slot5, managers.queued_tasks, "notification_hide", self.hide_current_notification, self, nil, notification.duration, nil)
	end

	return 
end
function NotificationManager:hide_current_notification()
	if self._reaction_in_progress then
		self._delayed_hide = true

		return 
	end

	self._delayed_hide = false
	slot4 = "notification_hide"

	managers.queued_tasks.unqueue(slot2, managers.queued_tasks)

	if self._currently_displayed_notification and self._currently_displayed_notification.hud then
		slot3 = self._currently_displayed_notification.hud

		self._currently_displayed_notification.hud.hide(slot2)
	end

	return 
end
function NotificationManager:execute_current_notification()
	slot3 = self._currently_displayed_notification.hud

	self._currently_displayed_notification.hud.execute(slot2)

	slot4 = "notification_hide"

	managers.queued_tasks.unqueue(slot2, managers.queued_tasks)

	return 
end
function NotificationManager:react(t)
	if not self._currently_displayed_notification or not self._currently_displayed_notification.reaction then
		return false
	end

	if not self._currently_displayed_notification.reaction.duration then
		slot4 = self

		return self._execute_react(slot3)
	elseif self._reaction_in_progress then
		slot4 = self._currently_displayed_notification.hud
		self._release_hud_progress = self._currently_displayed_notification.hud.get_progress(slot3)

		return true
	else
		self._release_hud_progress = 0
		self._reaction_in_progress = true
		self._reaction_start_t = t

		return true
	end

	return false
end
function NotificationManager:react_hold(t, dt)
	if self._reaction_in_progress then
		local progress = (t - self._reaction_start_t + self._release_hud_progress) / self._currently_displayed_notification.reaction.duration

		if progress < 1 then
			slot7 = progress

			self._currently_displayed_notification.hud.set_progress(slot5, self._currently_displayed_notification.hud)
		elseif 1 <= progress and not self._waiting_for_release then
			self._waiting_for_release = true
			slot6 = self._currently_displayed_notification.hud

			self._currently_displayed_notification.hud.set_full_progress(slot5)
		end
	end

	return 
end
function NotificationManager:react_cancel()
	if self._waiting_for_release then
		slot3 = self

		self._execute_react(slot2)

		self._reaction_in_progress = false
		self._reaction_start_t = nil
	elseif self._reaction_in_progress then
		self._reaction_in_progress = false
		self._reaction_start_t = nil
		slot3 = self._currently_displayed_notification.hud

		self._currently_displayed_notification.hud.cancel_execution(slot2)
	end

	return 
end
function NotificationManager:_execute_react()
	local reaction = self._currently_displayed_notification.reaction

	if reaction and not reaction.spent then
		self._waiting_for_release = false
		self._release_hud_progress = 0
		slot5 = reaction.data

		reaction.callback(slot3, reaction.callback_self)

		reaction.spent = true
		slot4 = self

		self.execute_current_notification(slot3)

		return true
	end

	return false
end
function NotificationManager:notification_done()
	self._currently_displayed_notification = nil
	slot3 = self

	self._clear_outdated_notifications(slot2)

	if 0 < #self._notification_queue then
		slot4 = 1

		self.show_notification(slot2, self)
	end

	return 
end
function NotificationManager:on_simulation_ended()
	slot5 = self

	managers.queued_tasks.unqueue_all(slot2, managers.queued_tasks, nil)

	self._notification_queue = {}

	if self._currently_displayed_notification then
		slot3 = self._currently_displayed_notification.hud

		self._currently_displayed_notification.hud.destroy(slot2)
	end

	self._currently_displayed_notification = nil

	return 
end
function NotificationManager:_clear_outdated_notifications()
	slot3 = TimerManager
	slot3 = TimerManager.game(slot2)
	local t = TimerManager.game(slot2).time(slot2)

	for i = #self._notification_queue, 1, -1 do
		local notif = self._notification_queue[i]

		if notif.shelf_life and notif.shelf_life <= t - notif.creation_time then
			slot10 = i

			table.remove(slot8, self._notification_queue)
		end
	end

	return 
end

return 
