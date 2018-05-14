ObjectivesManager = ObjectivesManager or class()
ObjectivesManager.PATH = "gamedata/objectives"
ObjectivesManager.FILE_EXTENSION = "objective"
ObjectivesManager.FULL_PATH = ObjectivesManager.PATH .. "." .. ObjectivesManager.FILE_EXTENSION
ObjectivesManager.REMINDER_INTERVAL = 240
function ObjectivesManager:init()
	self._objectives = {}
	self._active_objectives = {}
	self._remind_objectives = {}
	self._completed_objectives = {}
	self._completed_objectives_ordered = {}
	self._read_objectives = {}
	self._objectives_level_id = {}
	slot3 = self

	self._parse_objectives(slot2)

	return 
end
function ObjectivesManager:_parse_objectives()
	slot4 = self.FILE_EXTENSION.id(slot5)
	slot7 = self.PATH
	local list = PackageManager.script_data(slot2, PackageManager, self.PATH.id(self.FILE_EXTENSION))
	slot4 = list

	for _, data in ipairs(PackageManager) do
		if data._meta == "objective" then
			slot10 = data

			self._parse_objective(slot8, self)
		else
			slot13 = data._meta
			slot10 = "Unknown node \"" .. tostring(slot12) .. "\" in \"" .. self.FULL_PATH .. "\". Expected \"objective\" node."

			Application.error(slot8, Application)
		end
	end

	slot4 = self._objectives
	self._parsed_objectives = deep_clone(slot3)

	return 
end
function ObjectivesManager:on_level_transition()
	slot3 = self._parsed_objectives
	self._objectives = deep_clone(slot2)

	return 
end
function ObjectivesManager:table_invert(t)
	local s = {}
	slot5 = t

	for k, v in pairs(slot4) do
		s[v] = k
	end

	return s
end
function ObjectivesManager:_get_difficulty_amount_from_objective_subobjective(data)
	local current_difficulty_name = Global.game_settings.difficulty
	local difficulty_amount = data.difficulty_amount
	local difficulty_amount_total = 0

	if current_difficulty_name and difficulty_amount then
		slot8 = ","
		local difficulty_amount_table = string.split(slot6, difficulty_amount)
		slot9 = tweak_data.difficulties
		local current_difficulty_id = self.table_invert(difficulty_amount, self)[current_difficulty_name]
		slot9 = difficulty_amount_table[current_difficulty_id]
		difficulty_amount_total = tonumber(self)
	end

	return difficulty_amount_total
end
function ObjectivesManager:_parse_objective(data)
	local id = data.id
	slot6 = data.text
	local text = managers.localization.text(slot4, managers.localization)
	slot7 = data.description
	local description = managers.localization.text(managers.localization, managers.localization)
	local prio = data.prio
	local amount = data.amount

	if data.amount_text then
		slot10 = data.amount_text
		local amount_text = managers.localization.text(slot8, managers.localization)
	end

	local level_id = data.level_id
	local xp_weight = data.xp_weight
	local sub_objectives = {}

	if data.difficulty_amount then
		slot14 = data
		amount = self._get_difficulty_amount_from_objective_subobjective(slot12, self)
	end

	self._objectives[id] = {
		text = text,
		description = description,
		prio = prio,
		id = id,
		amount = amount,
		current_amount = (amount and 0) or nil,
		amount_text = amount_text,
		sub_objectives = {},
		level_id = level_id,
		xp_weight = xp_weight
	}
	slot13 = data

	for _, sub in ipairs(slot12) do
		slot19 = sub.text
		local sub_text = managers.localization.text(slot17, managers.localization)
		local sub_description = nil

		if sub.description then
			slot21 = sub.description
			sub_description = managers.localization.text(slot19, managers.localization)
		end

		self._objectives[id].sub_objectives[sub.id] = {
			id = sub.id,
			text = sub_text,
			description = sub_description
		}

		if sub.difficulty_amount then
			slot22 = sub
			self._objectives[id].sub_objectives[sub.id].amount = self._get_difficulty_amount_from_objective_subobjective(slot20, self)
			self._objectives[id].sub_objectives[sub.id].current_amount = 0
		end
	end

	if level_id then
		self._objectives_level_id[level_id] = self._objectives_level_id[level_id] or {}
		self._objectives_level_id[level_id][id] = {
			xp_weight = xp_weight or 0
		}
	end

	return 
end
function ObjectivesManager:update(t, dt)
	slot5 = self._remind_objectives

	for id, data in pairs(slot4) do
		if data.next_t < t then
			slot11 = id

			self._remind_objetive(slot9, self)
		end
	end

	if self._delayed_presentation then
		self._delayed_presentation.t = self._delayed_presentation.t - dt

		if self._delayed_presentation.t <= 0 then
			slot6 = self._delayed_presentation.activate_params

			managers.hud.activate_objective(slot4, managers.hud)

			if self._delayed_presentation.mid_text_params then
				slot6 = self._delayed_presentation.mid_text_params

				managers.hud.present_mid_text(slot4, managers.hud)
			end

			self._delayed_presentation = nil
		end
	end

	return 
end
function ObjectivesManager:_remind_objetive(id, title_id)
	slot5 = Application

	if not Application.editor(slot4) then
		slot5 = managers.platform

		if managers.platform.presence(slot4) ~= "Playing" then
			return 
		end
	end

	if self._remind_objectives[id] then
		slot6 = Application
		self._remind_objectives[id].next_t = Application.time(slot5) + self.REMINDER_INTERVAL
	end

	slot6 = "objective_reminder"

	if managers.user.get_setting(slot4, managers.user) then
		title_id = title_id or "hud_objective_reminder"
		local objective = self._objectives[id]
		local title_message = managers.localization.text(slot5, managers.localization)
		local text = objective.text
		slot9 = {
			time = 4,
			text = text,
			title = title_message
		}

		managers.hud.present_mid_text(title_id, managers.hud)
	end

	slot6 = id

	managers.hud.remind_objective(slot4, managers.hud)

	return 
end
function ObjectivesManager:_remind_sub_objective(id, title_id)
	slot6 = id

	managers.hud.remind_sub_objective(slot4, managers.hud)

	return 
end
function ObjectivesManager:update_objective(id, load_data)
	slot8 = {
		title_message = managers.localization.text(slot10, managers.localization)
	}
	slot12 = "mission_objective_updated"

	self.activate_objective(slot4, self, id, load_data)

	return 
end
function ObjectivesManager:complete_and_activate_objective(id, load_data, data, world_id)
	slot7 = self._active_objectives
	local delay_presentation = (next(slot6) and true) or nil
	slot10 = self._active_objectives

	for name, data in pairs(clone(slot9)) do
		slot14 = name

		self.complete_objective(slot12, self)
	end

	data = data or {}
	data.delay_presentation = delay_presentation or nil
	slot12 = world_id

	self.activate_objective(slot7, self, id, nil, data)

	return 
end
function ObjectivesManager:remove_and_activate_objective(id, load_data, data, world_id)
	slot7 = self._active_objectives
	local delay_presentation = (next(slot6) and true) or nil
	slot10 = self._active_objectives

	for name, data in pairs(clone(slot9)) do
		slot14 = name

		self.remove_objective(slot12, self)
	end

	data = data or {}
	data.delay_presentation = delay_presentation or nil
	slot12 = world_id

	self.activate_objective(slot7, self, id, nil, data)

	return 
end
function ObjectivesManager:activate_objective(id, load_data, data, world_id, skip_toast)
	if not id or not self._objectives[id] then
		slot12 = id
		slot9 = "Bad id to activate objective, " .. tostring(slot11) .. "."

		Application.stack_dump_error(slot7, Application)

		return 
	end

	local objective = self._objectives[id]
	slot9 = objective.sub_objectives

	for _, sub_objective in pairs(slot8) do
		sub_objective.completed = false

		if sub_objective.amount and sub_objective.amount == sub_objective.current_amount then
			slot16 = sub_objective

			self.check_and_set_subobjective_finished(slot13, self, objective)
		end
	end

	objective.completed = false
	objective.current_amount = objective.current_amount or (load_data and load_data.current_amount) or (data and data.amount and 0) or 0
	objective.amount = (load_data and load_data.amount) or (data and data.amount) or objective.amount
	objective.world_id = world_id
	local activate_params = {
		id = id,
		text = objective.text,
		sub_objectives = objective.sub_objectives,
		amount = objective.amount,
		current_amount = objective.current_amount,
		amount_text = objective.amount_text
	}
	self._delayed_presentation = nil

	if data and data.delay_presentation then
		self._delayed_presentation = {
			t = 1.6,
			activate_params = activate_params
		}
	else
		slot11 = activate_params

		managers.hud.activate_objective(slot9, managers.hud)
	end

	if not data or not data.title_message then
		slot11 = "mission_objective_activated"
		local title_message = managers.localization.text(slot9, managers.localization)
	end

	local text = objective.text

	if not skip_toast then
		if self._delayed_presentation then
			self._delayed_presentation.mid_text_params = {
				time = 4,
				text = text,
				title = title_message
			}
		else
			slot13 = {
				time = 4,
				text = text,
				title = title_message
			}

			managers.hud.present_mid_text(slot11, managers.hud)
		end
	end

	self._active_objectives[id] = objective
	slot14 = Application
	self._remind_objectives[id] = {
		next_t = Application.time(slot13) + self.REMINDER_INTERVAL,
		objective = objective
	}

	return 
end
function ObjectivesManager:remove_objective(id, load_data)
	if not load_data then
		if not id or not self._objectives[id] then
			slot9 = id
			slot6 = "Bad id to remove objective, " .. tostring(slot8) .. "."

			Application.stack_dump_error(slot4, Application)

			return 
		end

		if not self._active_objectives[id] then
			return 
		end
	end

	local objective = self._objectives[id]
	slot7 = {
		remove = true,
		id = id,
		text = objective.text
	}

	managers.hud.complete_objective(slot5, managers.hud)

	self._active_objectives[id] = nil
	self._remind_objectives[id] = nil

	if self._delayed_presentation and self._delayed_presentation.activate_params.id == id then
		self._delayed_presentation = nil
	end

	return 
end
function ObjectivesManager:remove_objective_for_world(world_id)
	slot4 = self._active_objectives

	for id, objective in pairs(slot3) do
		if objective.world_id == world_id then
			slot10 = {
				remove = true,
				id = id,
				text = objective.text
			}

			managers.hud.complete_objective(slot8, managers.hud)

			self._active_objectives[id] = nil

			if self._delayed_presentation and self._delayed_presentation.activate_params.id == id then
				self._delayed_presentation = nil
			end
		end
	end

	slot4 = self._remind_objectives

	for id, data in pairs(slot3) do
		if data.objective.world_id == world_id then
			self._remind_objectives[id] = nil
		end
	end

	slot4 = managers.hud

	managers.hud.clear_objectives(slot3)

	return 
end
function ObjectivesManager:complete_objective(id, load_data)
	if not load_data then
		if not id or not self._objectives[id] then
			slot9 = id
			slot6 = "Bad id to complete objective, " .. tostring(slot8) .. "."

			Application.stack_dump_error(slot4, Application)

			return 
		end

		if not self._active_objectives[id] then
			if not self._completed_objectives[id] then
				self._completed_objectives[id] = self._objectives[id]
				slot7 = id

				table.insert(self._objectives[id], self._completed_objectives_ordered, 1)
			end

			slot8 = id
			slot5 = "Tried to complete objective " .. tostring(slot7) .. ". This objective has never been given to the player."

			print(slot4)

			return 
		end
	end

	local objective = self._objectives[id]

	if objective.amount then
		objective.current_amount = objective.current_amount + 1
		slot7 = {
			id = id,
			text = objective.text,
			amount_text = objective.amount_text,
			amount = objective.amount,
			current_amount = objective.current_amount
		}

		managers.hud.update_amount_objective(slot5, managers.hud)

		if objective.current_amount < objective.amount then
			return 
		end

		objective.current_amount = 0
	end

	slot7 = {
		id = id,
		text = objective.text
	}

	managers.hud.complete_objective(slot5, managers.hud)

	slot6 = managers.statistics

	managers.statistics.objective_completed(slot5)

	self._completed_objectives[id] = objective
	slot8 = id

	table.insert(slot5, self._completed_objectives_ordered, 1)

	self._active_objectives[id] = nil
	self._remind_objectives[id] = nil

	if self._delayed_presentation and self._delayed_presentation.activate_params.id == id then
		self._delayed_presentation = nil
	end

	return 
end
function ObjectivesManager:complete_sub_objective(id, sub_id, load_data)
	local objective = self._objectives[id]
	local sub_objective = objective.sub_objectives[sub_id]

	if not sub_objective then
		slot12 = sub_id
		slot14 = id
		slot9 = "No sub objective " .. tostring(slot11) .. ". For objective " .. tostring(slot13) .. ""

		Application.error(slot7, Application)

		return 
	end

	if sub_objective.completed then
		slot12 = sub_id
		slot14 = sub_objective.text
		slot9 = "Sub objective " .. tostring(slot11) .. " " .. tostring(slot13) .. " " .. " already completed v1 "

		Application.error(slot7, Application)

		return 
	end

	if sub_objective.amount then
		if sub_objective.amount <= sub_objective.current_amount then
			slot12 = sub_id
			slot14 = sub_objective.text
			slot9 = "Sub objective " .. tostring(slot11) .. " " .. tostring(slot13) .. " " .. " already completed v2 "

			Application.error(slot7, Application)

			return 
		end

		sub_objective.current_amount = sub_objective.current_amount + 1
		slot9 = {
			id = id,
			sub_id = sub_id,
			text = sub_objective.text,
			amount_text = sub_objective.amount_text,
			amount = sub_objective.amount,
			current_amount = sub_objective.current_amount
		}

		managers.hud.update_amount_sub_objective(slot7, managers.hud)

		if sub_objective.current_amount < sub_objective.amount then
			slot10 = "mission_sub_objective_updated"

			self._remind_sub_objective(slot7, self, id)

			return 
		end
	end

	slot10 = sub_objective

	self.check_and_set_subobjective_finished(slot7, self, objective)

	return 
end
function ObjectivesManager:check_and_set_subobjective_finished(objective, sub_objective)
	sub_objective.completed = true
	slot6 = {
		text = sub_objective.text,
		sub_id = sub_objective.id
	}

	managers.hud.complete_sub_objective(slot4, managers.hud)

	local completed = true
	slot6 = objective.sub_objectives

	for _, sub_objective in pairs(managers.hud) do
		if not sub_objective.completed then
			completed = false

			break
		end
	end

	if completed then
		slot12 = nil

		managers.queued_tasks.queue(slot5, managers.queued_tasks, "complete_objective", self.complete_objective, self, objective.id, 2)
	end

	return 
end
function ObjectivesManager:set_objective_current_amount(objective_id, current_amount)
	local objective = self._objectives[objective_id]

	if objective.amount then
		objective.current_amount = current_amount
	end

	return 
end
function ObjectivesManager:set_sub_objective_amount(objective_id, sub_id, amount)
	local objective = self._objectives[objective_id]
	local sub_objective = objective.sub_objectives[sub_id]

	if not sub_objective then
		slot12 = sub_id
		slot14 = objective_id
		slot9 = "No sub objective " .. tostring(slot11) .. ". For objective " .. tostring(slot13) .. ""

		Application.error(slot7, Application)

		return 
	end

	sub_objective.amount = amount or 0

	if not sub_objective.current_amount then
		sub_objective.current_amount = 0
	end

	slot8 = managers.hud

	managers.hud.render_objective(slot7)

	return 
end
function ObjectivesManager:set_sub_objective_current_amount(objective_id, sub_id, current_amount)
	local objective = self._objectives[objective_id]
	local sub_objective = objective.sub_objectives[sub_id]

	if not sub_objective then
		slot12 = sub_id
		slot14 = objective_id
		slot9 = "No sub objective " .. tostring(slot11) .. ". For objective " .. tostring(slot13) .. ""

		Application.error(slot7, Application)

		return 
	end

	if not sub_objective.amount then
		sub_objective.amount = 0
	end

	sub_objective.current_amount = current_amount or 0

	if sub_objective.amount and sub_objective.amount == sub_objective.current_amount then
		slot10 = sub_objective

		self.check_and_set_subobjective_finished(slot7, self, objective)
	end

	slot8 = managers.hud

	managers.hud.render_objective(slot7)

	return 
end
function ObjectivesManager:objective_is_active(id)
	return self._active_objectives[id]
end
function ObjectivesManager:objective_is_completed(id)
	return self._completed_objectives[id]
end
function ObjectivesManager:get_objective(id)
	return self._objectives[id]
end
function ObjectivesManager:get_all_objectives()
	local res = {}
	slot6 = self._completed_objectives

	mix(slot3, res, self._active_objectives)

	return res
end
function ObjectivesManager:get_active_objectives()
	return self._active_objectives
end
function ObjectivesManager:get_completed_objectives()
	return self._completed_objectives
end
function ObjectivesManager:get_completed_objectives_ordered()
	return self._completed_objectives_ordered
end
function ObjectivesManager:objectives_by_name()
	local t = {}
	slot4 = self._objectives

	for name, _ in pairs(slot3) do
		slot10 = name

		table.insert(slot8, t)
	end

	slot4 = t

	table.sort(slot3)

	return t
end
function ObjectivesManager:sub_objectives_by_name(id)
	local t = {}
	local objective = self._objectives[id]

	if objective then
		slot6 = objective.sub_objectives

		for name, _ in pairs(slot5) do
			slot12 = name

			table.insert(slot10, t)
		end
	end

	slot6 = t

	table.sort(slot5)

	return t
end
function ObjectivesManager:_get_xp(level_id, id)
	if not self._objectives_level_id[level_id] then
		slot7 = level_id

		Application.error(slot4, Application, "Had no xp for level")

		return 0
	end

	if not self._objectives_level_id[level_id][id] then
		slot7 = id

		Application.error(slot4, Application, "Had no xp for objective")

		return 0
	end

	local xp_weight = self._get_real_xp_weight(slot4, self, level_id)
	slot10 = "total_level_objectives"
	slot6 = xp_weight * tweak_data.get_value(self._objectives_level_id[level_id][id].xp_weight, tweak_data, "experience_manager")

	return math.round(self)
end
function ObjectivesManager:_get_real_xp_weight(level_id, xp_weight)
	slot6 = level_id
	local total_xp_weight = self._total_xp_weight(slot4, self)

	return xp_weight / total_xp_weight
end
function ObjectivesManager:_total_xp_weight(level_id)
	if not self._objectives_level_id[level_id] then
		return 0
	end

	local xp_weight = 0
	slot5 = self._objectives_level_id[level_id]

	for obj, data in pairs(slot4) do
		xp_weight = xp_weight + data.xp_weight
	end

	return xp_weight
end
function ObjectivesManager:_check_xp_weight(level_id)
	local total_xp = 0
	slot6 = level_id
	local total_xp_weight = self._total_xp_weight(slot4, self)
	slot6 = self._objectives_level_id[level_id]

	for obj, data in pairs(self) do
		slot16 = "total_level_objectives"
		local xp = math.round(slot10)
		total_xp = total_xp + xp

		print(data.xp_weight / total_xp_weight * tweak_data.get_value(xp, tweak_data, "experience_manager"), obj)
	end

	slot7 = total_xp

	print(slot5, "total")

	return 
end
function ObjectivesManager:total_objectives(level_id)
	if not self._objectives_level_id[level_id] then
		return 0
	end

	local i = 0
	slot5 = self._objectives_level_id[level_id]

	for _, _ in pairs(slot4) do
		i = i + 1
	end

	return i
end
function ObjectivesManager:save(data)
	local state = {}
	local objective_map = {}
	state.completed_objectives_ordered = self._completed_objectives_ordered
	slot6 = self._objectives

	for name, objective in pairs(slot5) do
		local save_data = {}
		local sub_objectives = objective.sub_objectives
		slot13 = objective.sub_objectives

		if (next(slot12) or (objective.current_amount and 0 < objective.current_amount)) and not self._active_objectives[name] then
			save_data.active = false
			save_data.world_id = self.world_id
			save_data.current_amount = objective.current_amount
			save_data.amount = objective.amount
			save_data.sub_objective = {}
			slot13 = objective.sub_objectives

			for sub_id, sub_objective in pairs(slot12) do
				save_data.sub_objective[sub_id] = sub_objective
			end
		elseif self._active_objectives[name] then
			save_data.active = true
			save_data.world_id = self.world_id
			save_data.current_amount = self._active_objectives[name].current_amount
			save_data.amount = self._active_objectives[name].amount
			save_data.sub_objective = {}
			slot13 = self._active_objectives[name].sub_objectives

			for sub_id, sub_objective in pairs(slot12) do
				save_data.sub_objective[sub_id] = sub_objective
			end
		end

		if self._completed_objectives[name] then
			save_data.complete = true
		end

		if self._read_objectives[name] then
			save_data.read = true
		end

		slot13 = save_data

		if next(slot12) then
			objective_map[name] = save_data
		end
	end

	state.objective_map = objective_map
	data.ObjectivesManager = state

	return true
end
function ObjectivesManager:load(data)
	local state = data.ObjectivesManager

	if state then
		self._completed_objectives_ordered = state.completed_objectives_ordered
		slot5 = state.objective_map

		for name, save_data in pairs(slot4) do
			local objective_data = self._objectives[name]
			objective_data.world_id = save_data.world_id
			objective_data.current_amount = save_data.current_amount
			objective_data.amount = save_data.amount
			save_data.sub_objective = save_data.sub_objective or {}
			slot11 = save_data.sub_objective

			for sub_id, sub_objective in pairs(slot10) do
				if sub_objective.amount then
					slot19 = sub_objective.amount

					self.set_sub_objective_amount(slot15, self, objective_data.id, sub_id)
				end

				if sub_objective.current_amount then
					slot19 = sub_objective.current_amount

					self.set_sub_objective_current_amount(slot15, self, objective_data.id, sub_id)
				end
			end

			if save_data.active then
				slot16 = true

				self.activate_objective(slot10, self, name, {
					current_amount = save_data.current_amount,
					amount = save_data.amount
				}, nil, objective_data.world_id)

				slot11 = managers.hud

				managers.hud.show_objectives(slot10)

				slot11 = save_data.sub_objective

				for sub_id, sub_objective in pairs(slot10) do
					if sub_objective.completed then
						objective_data.sub_objectives[sub_id].completed = true
						slot17 = {
							text = sub_objective.text,
							sub_id = sub_id
						}

						managers.hud.complete_sub_objective(true, managers.hud)
					end
				end
			end

			if save_data.complete then
				self._completed_objectives[name] = objective_data
			end

			if save_data.read then
				self._read_objectives[name] = true
			end
		end
	end

	return 
end
function ObjectivesManager:reset()
	self._active_objectives = {}
	self._completed_objectives = {}
	self._completed_objectives_ordered = {}
	self._read_objectives = {}
	self._remind_objectives = {}
	slot3 = self

	self._parse_objectives(slot2)

	return 
end
function ObjectivesManager:on_mission_start_callback()
	slot3 = self

	self.reset(slot2)

	slot3 = Network

	if Network.is_server(slot2) then
		slot3 = managers.network
		slot4 = "sync_objectives_manager_mission_start"

		managers.network.session(slot2).send_to_peers_synched(slot2, managers.network.session(slot2))
	end

	return 
end
function ObjectivesManager:set_read(id, is_read)
	self._read_objectives[id] = is_read

	return 
end
function ObjectivesManager:is_read(id)
	return self._read_objectives[id]
end

return 
