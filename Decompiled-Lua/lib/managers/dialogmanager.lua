-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
DialogManager = DialogManager or class()
DialogManager.MRS_WHITE = {
	sound_switch = "mrs_white",
	char = "MRS_WHITE"
}
DialogManager.NIGHT_WITCH = {
	sound_switch = "night_whitch",
	char = "NIGHT_WITCH"
}
DialogManager.FRANZ = {
	sound_switch = "franz",
	char = "FRANZ"
}
DialogManager.BOAT_DRIVER_BRIDGE = {
	sound_switch = "boat_driver_bridge",
	char = "BOAT_DRIVER_BRIDGE"
}
DialogManager.TRUCK_DRIVER_BRIDGE = {
	sound_switch = "truck_driver_bridge",
	char = "TRUCK_DRIVER_BRIDGE"
}
DialogManager.RESIST_PILOT_BANK = {
	sound_switch = "resist_pilot_bank",
	char = "RESIST_PILOT_BANK"
}
DialogManager.TRAIN_ENGINEER = {
	sound_switch = "train_engineer",
	char = "TRAIN_ENGINEER"
}
DialogManager.CASTLE_TRUCK_DRIVER = {
	sound_switch = "castle_truck_driver",
	char = "CASTLE_TRUCK_DRIVER"
}
DialogManager.MINIRAID2_TRUCK_DRIVER = {
	sound_switch = "miniraid2_truck_driver",
	char = "MINIRAID2_TRUCK_DRIVER"
}
DialogManager.BANK_TRUCK_DRIVER = {
	sound_switch = "bank_truck_driver",
	char = "BANK_TRUCK_DRIVER"
}
DialogManager.DR_REINHARDT = {
	sound_switch = "dr_reinhardt",
	char = "DR_REINHARDT"
}
DialogManager.TANK_GENERAL = {
	sound_switch = "tank_general",
	char = "TANK_GENERAL"
}
DialogManager.RUSSIAN_GENERAL = {
	sound_switch = "russian_general",
	char = "RUSSIAN_GENERAL"
}
DialogManager.RUSSIAN_GENERAL2 = {
	sound_switch = "russian_general2",
	char = "RUSSIAN_GENERAL2"
}
DialogManager.MALE_SPY = {
	sound_switch = "male_spy",
	char = "MALE_SPY"
}
DialogManager.FEMALE_SPY = {
	sound_switch = "female_spy",
	char = "FEMALE_SPY"
}
DialogManager.CHARS = {
	DialogManager.MRS_WHITE,
	DialogManager.NIGHT_WITCH,
	DialogManager.FRANZ,
	DialogManager.BOAT_DRIVER_BRIDGE,
	DialogManager.TRUCK_DRIVER_BRIDGE,
	DialogManager.RESIST_PILOT_BANK,
	DialogManager.TRAIN_ENGINEER,
	DialogManager.CASTLE_TRUCK_DRIVER,
	DialogManager.MINIRAID2_TRUCK_DRIVER,
	DialogManager.BANK_TRUCK_DRIVER,
	DialogManager.DR_REINHARDT,
	DialogManager.TANK_GENERAL,
	DialogManager.RUSSIAN_GENERAL,
	DialogManager.RUSSIAN_GENERAL2,
	DialogManager.MALE_SPY,
	DialogManager.FEMALE_SPY
}
function DialogManager:init()
	self._dialog_list = {}
	self._random_list = {}
	self._current_dialog = nil
	self._next_dialog = nil
	self._show_subtitles = true
	slot6 = "units/vanilla/characters/players/fps_mover/mrs_white"
	self._ventrilo_unit = World.spawn_unit(slot2, World, Idstring(Vector3()), Rotation())

	return 
end
function DialogManager:init_finalize()
	slot3 = self

	self._load_dialogs(slot2)

	return 
end
function DialogManager:_create_dialogue_instance(id, instigator, test)
	local dialogue = deep_clone(slot5)
	local nr_criminals = managers.criminals.nr_taken_criminals(self._dialog_list[id])
	slot8 = managers.criminals
	local char_names = managers.criminals.taken_criminal_names(managers.criminals)
	local default_char = nil

	if test then
		nr_criminals = 4
		slot10 = managers.criminals
		char_names = managers.criminals.character_names(slot9)
		default_char = "british"
	end

	if dialogue.cases then
		slot10 = dialogue.cases

		for _, case in ipairs(slot9) do
			slot18 = true

			if string.find(slot14, case.players_no, nr_criminals, 1) then
				dialogue.lines = case.lines

				break
			end
		end
	end

	local charA = nil

	if instigator then
		charA = instigator
	else
		slot12 = nr_criminals
		charA = char_names[self._random_criminal(slot10, self)]
	end

	local charB = charA

	if 1 < nr_criminals then
		slot13 = nr_criminals
		charB = char_names[self._random_criminal(slot11, self)]

		while charA == charB do
			slot13 = nr_criminals
			charB = char_names[self._random_criminal(slot11, self)]
		end
	end

	local charC = charA

	if 2 < nr_criminals then
		slot14 = nr_criminals
		charC = char_names[self._random_criminal(slot12, self)]

		while charC == charA or charC == charB do
			slot14 = nr_criminals
			charC = char_names[self._random_criminal(slot12, self)]
		end
	end

	if dialogue.lines then
		slot13 = dialogue.lines

		for _, line in ipairs(slot12) do
			slot26 = default_char
			line.character = self._parse_dialog_character(slot17, self, line.character, charA, charB, charC, dialogue, line, instigator)
		end
	else
		slot21 = default_char
		dialogue.character = self._parse_dialog_character(slot12, self, dialogue.character, charA, charB, charC, dialogue, nil, instigator)
	end

	return dialogue
end
function DialogManager:_parse_dialog_character(char, charA, charB, charC, dialogue, line, instigator, default_char)
	local result = nil
	slot12 = DialogManager.CHARS

	for _, v in ipairs(slot11) do
		if v.char == char then
			result = v.sound_switch

			if line then
				line.third_person = v
			else
				dialogue.third_person = v
			end

			return result
		end
	end

	if not char then
		if not instigator then
			slot12 = managers.criminals
			slot15 = managers.player
			result = managers.criminals.character_name_by_unit(slot11, managers.player.local_player(slot14)) or default_char
		end
	elseif char == "A" then
		result = charA
	elseif char == "B" then
		result = charB
	elseif char == "C" then
		result = charC
	end

	return result
end
function DialogManager:_random_criminal(nr_criminals)
	slot4 = (math.random() * 100) % nr_criminals + 1

	return math.floor(slot3)
end
function DialogManager:queue_random(id, params)
	local r = self._random_list[id]

	if not r then
		slot7 = id

		debug_pause(slot5, "[DialogManager:_random_criminal] Tried to queue random dialoge that does not exist:")

		return 
	end

	local n = #r.dialogs

	if n == 0 then
		slot9 = id

		Application.error(slot6, Application, "[DialogManager:_random_criminal] Empty random dialog container!")

		return 
	elseif n == 1 then
		slot9 = params

		self.queue_dialog(slot6, self, r.dialogs[1].id)
	else
		slot7 = n
		local rand = math.random(slot6)

		if r.last then
			while r.last == rand do
				slot8 = n
				rand = math.random(slot7)
			end
		end

		slot10 = params

		self.queue_dialog(slot7, self, r.dialogs[rand].id)

		r.last = rand
	end

	return 
end
function DialogManager:sync_queue_dialog(id, instigator)
	if self._paused then
		return 
	end

	slot7 = {
		instigator = instigator
	}

	self.do_queue_dialog(slot4, self, id)

	return 
end
function DialogManager:queue_dialog(id, params, test)
	if not self._dialog_list[id] then
		slot10 = id
		slot7 = "[DialogManager:queue_dialog] The dialog script tries to queue a dialog with id '" .. tostring(slot9) .. "' which doesn't seem to exist!"

		Application.error(slot5, Application)

		return false
	end

	if self._paused then
		return 
	end

	if self._current_dialog and self._current_dialog.id == id then
		return 
	end

	local chance = self._dialog_list[id].chance

	if chance < 1 then
		slot7 = 1
		local rand = math.rand(slot6)

		if chance < rand then
			return 
		end
	end

	slot7 = Network

	if Network.is_server(slot6) then
		slot10 = test

		self.do_queue_dialog(slot6, self, id, params)
	else
		slot8 = params
		local instigator = self._calc_instigator_string(slot6, self)
		slot8 = managers.network
		slot11 = instigator or "nil"

		managers.network.session(self).send_to_host(slot7, managers.network.session(self), "sync_queue_dialog", id)
	end

	return 
end
function DialogManager:_calc_instigator_string(params)
	local instigator = nil

	if params.instigator then
		slot5 = params.instigator

		if type(slot4) == "string" then
			if params.instigator ~= "nil" then
				instigator = params.instigator
			end
		else
			slot6 = params.instigator
			instigator = managers.criminals.character_name_by_unit(slot4, managers.criminals)
		end
	end

	return instigator
end
function DialogManager:set_paused(value)
	self._paused = value

	if value then
		slot5 = false

		self.quit_dialog(slot3, self)
	end

	return 
end
function DialogManager:paused()
	return self._paused
end
function DialogManager:do_queue_dialog(id, params, test)
	slot7 = params
	local instigator = self._calc_instigator_string(slot5, self)
	slot7 = Network

	if Network.is_server(self) then
		local send = instigator or "nil"
		slot8 = managers.network
		slot11 = send

		managers.network.session(slot7).send_to_peers_synched(slot7, managers.network.session(slot7), "sync_queue_dialog", id)
	end

	if not params.skip_idle_check then
		slot7 = managers.platform

		if managers.platform.presence(slot6) == "Idle" then
			return 
		end
	end

	slot7 = managers.criminals
	local nr_criminals = managers.criminals.nr_taken_criminals(slot6)

	if nr_criminals == 0 and not test then
		return 
	end

	if not self._current_dialog then
		slot11 = test
		self._current_dialog = self._create_dialogue_instance(slot7, self, id, instigator)
		self._current_dialog.params = params
		slot9 = {
			dialog = self._current_dialog
		}

		self._play_dialog(slot7, self)
	else
		slot11 = test
		local dialog = self._create_dialogue_instance(slot7, self, id, instigator)
		dialog.params = params

		if (self._current_dialog.priority == dialog.priority and dialog.priority < 4) or dialog.priority < self._current_dialog.priority then
			slot13 = dialog.id

			Application.debug(slot8, Application, "[DialogManager:queue_dialog] Terminate current dialogue:", self._current_dialog.id, "Higher priority dialogue queued:")

			slot9 = self

			self._stop_dialog(slot8)

			self._current_dialog = dialog
			self._next_dialog = nil
			slot10 = {
				dialog = self._current_dialog
			}

			self._play_dialog(slot8, self)
		else
			slot13 = self._current_dialog.id

			Application.debug(slot8, Application, "[DialogManager:queue_dialog] Skip playing dialoge:", id, "Higher priority is already playing:")

			slot11 = "skipped"

			self._call_done_callback(slot8, self, params and params.done_cbk)

			return false
		end
	end

	return true
end
function DialogManager:finished()
	slot3 = self

	self._stop_dialog(slot2)

	if self._current_dialog then
		if self._next_dialog then
			slot4 = "Skip current dialog, play new!"

			Application.debug(slot2, Application)

			slot3 = self

			self.on_dialog_completed(slot2)

			self._current_dialog = self._next_dialog
			self._next_dialog = nil
			slot9 = nil

			managers.queued_tasks.queue(slot2, managers.queued_tasks, nil, self._play_dialog, self, {
				dialog = self._current_dialog
			}, 1.5)
		elseif self._current_dialog.line then
			local line = self._current_dialog.line + 1

			if line <= #self._current_dialog.lines then
				local delay = self._current_dialog.lines[self._current_dialog.line].delay or 0.5
				slot11 = nil

				managers.queued_tasks.queue(slot4, managers.queued_tasks, nil, self._play_dialog, self, {
					dialog = self._current_dialog,
					line = line
				}, delay)
			else
				slot4 = self

				self.on_dialog_completed(slot3)

				self._current_dialog = nil
			end
		else
			slot3 = self

			self.on_dialog_completed(slot2)

			self._current_dialog = nil
		end
	end

	return 
end
function DialogManager:on_dialog_completed()
	if self._current_dialog.params and self._current_dialog.params.done_cbk then
		slot5 = "done"

		self._call_done_callback(slot2, self, self._current_dialog.params.done_cbk)
	end

	return 
end
function DialogManager:quit_dialog(no_done_cbk)
	slot6 = self

	managers.queued_tasks.unqueue_all(slot3, managers.queued_tasks, nil)

	slot4 = managers.subtitle

	managers.subtitle.clear_subtitle(slot3)

	slot5 = false

	managers.subtitle.set_visible(slot3, managers.subtitle)

	slot5 = false

	managers.subtitle.set_enabled(slot3, managers.subtitle)

	slot4 = self

	self._stop_dialog(slot3)

	if not no_done_cbk and self._current_dialog and self._current_dialog.params then
		slot6 = "done"

		self._call_done_callback(slot3, self, self._current_dialog.params.done_cbk)
	end

	self._current_dialog = nil
	self._next_dialog = nil

	return 
end
function DialogManager:conversation_names()
	local t = {}
	slot4 = self._dialog_list

	for name, _ in pairs(slot3) do
		slot10 = name

		table.insert(slot8, t)
	end

	slot4 = t

	table.sort(slot3)

	return t
end
function DialogManager:random_names()
	local t = {}
	slot4 = self._random_list

	for name, _ in pairs(slot3) do
		slot10 = name

		table.insert(slot8, t)
	end

	slot4 = t

	table.sort(slot3)

	return t
end
function DialogManager:on_simulation_ended()
	slot4 = true

	self.quit_dialog(slot2, self)

	return 
end
function DialogManager:_setup_position(dialog, char_data)
	slot6 = "[DialogManager:_setup_position]"
	slot9 = char_data

	Application.debug(slot4, Application, inspect(slot8))

	local unit = managers.dialog._ventrilo_unit
	slot6 = unit

	if not alive(Application) then
		return 
	end

	if dialog.params.position then
		slot7 = dialog.params.position

		unit.set_position(slot5, unit)
	elseif char_data.unit then
		slot6 = char_data.unit

		if alive(slot5) then
			slot6 = unit
			slot9 = char_data.unit

			unit.set_position(slot5, char_data.unit.position(slot8))

			slot6 = unit
			slot9 = char_data.unit

			unit.set_rotation(slot5, char_data.unit.rotation(slot8))
		end
	else
		slot6 = managers.player

		if managers.player.local_player(slot5) then
			slot6 = unit
			slot9 = managers.player
			slot9 = managers.player.local_player(slot8)

			unit.set_position(slot5, managers.player.local_player(slot8).position(slot8))

			slot6 = unit
			slot9 = managers.player
			slot9 = managers.player.local_player(slot8)

			unit.set_rotation(slot5, managers.player.local_player(slot8).rotation(slot8))
		end
	end

	return unit
end
function DialogManager:_play_dialog(data)
	local dialog = data.dialog

	if not dialog.params.on_unit and dialog.params.override_characters then
		slot5 = managers.player
		local unit = managers.player.player_unit(slot4)
	end

	local line = data.line or 1
	local third_person_data = dialog.third_person or (dialog.lines and dialog.lines[line] and dialog.lines[line].third_person)

	if dialog.lines and 0 < #dialog.lines then
		dialog.line = line
	end

	local char = dialog.character or (dialog.lines and dialog.lines[dialog.line].character)

	if not char then
		slot9 = managers.criminals
		slot12 = managers.player
		char = managers.criminals.character_name_by_unit(slot8, managers.player.player_unit(slot11))
	end

	local nationality_icon = nil

	if char == "british" then
		nationality_icon = tweak_data.gui.icons.nationality_small_british
	elseif char == "german" then
		nationality_icon = tweak_data.gui.icons.nationality_small_german
	elseif char == "russian" then
		nationality_icon = tweak_data.gui.icons.nationality_small_russian
	elseif char == "american" then
		nationality_icon = tweak_data.gui.icons.nationality_small_american
	end

	slot10 = unit

	if not alive(slot9) then
		if third_person_data then
			slot12 = third_person_data
			unit = self._setup_position(slot9, self, dialog)
		else
			slot11 = char
			unit = managers.criminals.character_unit_by_name(slot9, managers.criminals)
		end
	end

	slot10 = unit

	if not alive(slot9) then
		slot14 = dialog.character
		slot11 = "The dialog script tries to access a unit named '" .. tostring(slot13) .. "', which doesn't seem to exist. Line will be skipped."

		Application.error(slot9, Application)

		slot10 = managers.dialog

		managers.dialog.finished(slot9)

		return 
	end

	local char_voice = nil

	if third_person_data then
		slot11 = unit
		slot12 = char

		unit.drama(slot10).set_voice(slot10, unit.drama(slot10))
	elseif char then
		char_voice = tweak_data.character[char].speech_prefix
		slot11 = unit
		slot12 = char_voice

		unit.drama(slot10).set_voice(slot10, unit.drama(slot10))
	end

	if not nationality_icon then
		slot14 = data.line

		Application.debug(slot10, Application, "[DialogManager:_play_dialog] and nationality_icon is nil!!!!!!", data.dialog)
	end

	dialog.unit = unit
	slot12 = unit
	local color_id = managers.criminals.character_color_id_by_unit(slot10, managers.criminals)
	local crim_color = tweak_data.chat_colors[color_id]

	if dialog.lines and 0 < #dialog.lines then
		local line_data = dialog.lines[line]

		if line_data.string_id then
			local s = line_data.string_id

			if char_voice then
				s = s .. "_" .. char_voice
			end

			if self._show_subtitles then
				slot15 = unit
				slot19 = nationality_icon

				unit.drama(slot14).play_subtitle(slot14, unit.drama(slot14), s, nil, crim_color)
			end
		end

		if line_data.sound then
			slot14 = managers.player

			if unit == managers.player.local_player(slot13) then
				slot14 = managers.player

				managers.player.stop_all_speaking_except_dialog(slot13)
			end

			slot14 = unit
			slot16 = dialog.sound_source

			unit.drama(slot13).play_sound(slot13, unit.drama(slot13), line_data.sound)
		end
	else
		if dialog.string_id then
			local s = dialog.string_id

			if char_voice then
				s = s .. "_" .. char_voice
			end

			if self._show_subtitles then
				slot14 = unit
				slot18 = nationality_icon

				unit.drama(slot13).play_subtitle(slot13, unit.drama(slot13), s, nil, crim_color)
			end
		end

		if dialog.sound then
			slot13 = managers.player

			if unit == managers.player.local_player(slot12) then
				slot13 = managers.player

				managers.player.stop_all_speaking_except_dialog(slot12)
			end

			slot13 = unit
			slot15 = dialog.sound_source

			unit.drama(slot12).play_sound(slot12, unit.drama(slot12), dialog.sound)

			slot17 = dialog.string_id

			Application.debug(slot12, Application, "[DialogManager:_play_dialog] Playing dialogue on unit:", char, unit)
		end
	end

	return 
end
function DialogManager:_stop_dialog()
	if self._current_dialog then
		slot3 = self._current_dialog.unit

		if alive(slot2) then
			slot3 = self._current_dialog.unit
			slot3 = self._current_dialog.unit.drama(slot2)

			self._current_dialog.unit.drama(slot2).stop_cue(slot2)
		end
	end

	return 
end
function DialogManager:_call_done_callback(done_cbk, reason)
	if done_cbk then
		slot5 = reason

		done_cbk(slot4)

		slot6 = "DialogManager:_call_done_callback"

		Application.debug(slot4, Application)
	end

	return 
end
function DialogManager:_load_dialogs()
	local file_name = "gamedata/dialogs/index"
	slot5 = Idstring(slot6)
	slot8 = file_name
	local data = PackageManager.script_data(slot3, PackageManager, file_name.id("dialog_index"))
	slot5 = data

	for _, c in ipairs(PackageManager) do
		if c.name then
			slot11 = c.name

			self._load_dialog_data(slot9, self)
		end
	end

	return 
end
function DialogManager:_load_dialog_data(name)
	local file_name = "gamedata/dialogs/" .. name
	slot6 = Idstring(slot7)
	slot9 = file_name
	local data = PackageManager.script_data(slot4, PackageManager, file_name.id("dialog"))
	slot6 = data

	for _, node in ipairs(PackageManager) do
		if node._meta == "dialog" then
			if not node.id then
				slot12 = "Error in '" .. file_name .. "'! A node definition must have an id parameter!"

				Application.throw_exception(slot10, Application)

				break
			end

			slot9 = self._dialog_list
			slot10 = node.id
			slot11 = {
				id = node.id,
				character = node.character,
				sound = node.sound,
				string_id = node.string_id
			}
		elseif node._meta == "random" then
			if not node.id then
				slot12 = "Error in '" .. file_name .. "'! A node definition must have an id parameter!"

				Application.throw_exception(slot10, Application)

				break
			end

			self._random_list[node.id] = {
				id = node.id,
				dialogs = {}
			}
			slot11 = node

			for _, child_node in ipairs(node.id) do
				if child_node._meta == "dialog" then
					local d = {
						id = child_node.id
					}
					slot18 = d

					table.insert(slot16, self._random_list[node.id].dialogs)
				end
			end
		end
	end

	return 
end
function DialogManager:_parse_line_node(node)
	local censored = node.censored
	local sound = node.sound

	if not sound then
		slot7 = "[DialogManager][_parse_line_node] Dialog line has no sound:  "
		slot10 = node

		Application.error(slot5, Application, inspect(slot9))
	end

	return {
		sound = sound,
		character = node.character,
		string_id = node.string_id,
		delay = node.delay
	}
end
function DialogManager:_parse_case_node(parent_id, node)
	self._dialog_list[parent_id].cases = self._dialog_list[parent_id].cases or {}
	local case_node = {
		lines = {},
		id = node.id,
		players_no = node.players
	}
	slot6 = node

	for _, child_node in ipairs(slot5) do
		if child_node._meta == "line" then
			case_node.lines = case_node.lines or {}
			slot12 = child_node
			local line = self._parse_line_node(slot10, self)
			case_node.lines[#case_node.lines + 1] = line
		end
	end

	slot7 = case_node

	table.insert(slot5, self._dialog_list[parent_id].cases)

	return 
end
function DialogManager:is_dialogue_playing_for_local_player()
	local res = false

	if self._current_dialog then
		slot4 = managers.criminals
		local local_crim = managers.criminals.local_character_name(slot3)
		local current_sound = nil

		if self._current_dialog.character then
			current_sound = self._current_dialog.character
		elseif self._current_dialog.lines and self._current_dialog.line and self._current_dialog.lines[self._current_dialog.line] then
			current_sound = self._current_dialog.lines[self._current_dialog.line].character
		else
			slot8 = self._current_dialog.line
			slot11 = self._current_dialog.lines

			Application.debug(slot5, Application, "[DialogManager:is_dialogue_playing_for_local_player()] current dialog without line!?", inspect(slot10))
		end

		if local_crim == current_sound then
			res = true
		end
	end

	return res
end
function DialogManager:register_character(char, unit)
	local found = nil
	slot6 = DialogManager.CHARS

	for _, v in ipairs(slot5) do
		if v.char == char then
			v.unit = unit
			found = true
		end
	end

	if not found then
		slot8 = unit

		debug_pause(slot5, "[DialogManager:register_character] Trying to run register unknown dialogue character: ", char)
	end

	return 
end
function DialogManager:update(t, dt)
	return 
end
function DialogManager:debug_print_missiong_strings()
	slot3 = managers.dialog._dialog_list

	for dialog_id, data in pairs(slot2) do
		if data.cases then
			slot8 = data.cases

			for _, case in pairs(slot7) do
				slot13 = case.lines

				for _, line in pairs(slot12) do
					if line.string_id then
						slot21 = line.string_id

						if string.find(slot17, managers.localization.text("ERROR:", managers.localization)) then
							slot21 = line.string_id .. "_brit"

							if string.find(slot17, managers.localization.text("ERROR:", managers.localization)) then
								slot21 = line.string_id .. "_amer"

								if string.find(slot17, managers.localization.text("ERROR:", managers.localization)) then
									slot21 = line.string_id .. "_ger"

									if string.find(slot17, managers.localization.text("ERROR:", managers.localization)) then
										slot21 = line.string_id .. "_russ"

										if string.find(slot17, managers.localization.text("ERROR:", managers.localization)) then
											slot22 = dialog_id

											Application.debug(slot17, Application, "MISSING:", line.string_id, " DIALOG:")
										end
									end
								end
							end
						end
					end
				end
			end
		elseif data.lines then
			slot8 = data.lines

			for _, line in pairs(slot7) do
				if line.string_id then
					slot16 = line.string_id

					if string.find(slot12, managers.localization.text("ERROR:", managers.localization)) then
						slot16 = line.string_id .. "_brit"

						if string.find(slot12, managers.localization.text("ERROR:", managers.localization)) then
							slot16 = line.string_id .. "_amer"

							if string.find(slot12, managers.localization.text("ERROR:", managers.localization)) then
								slot16 = line.string_id .. "_ger"

								if string.find(slot12, managers.localization.text("ERROR:", managers.localization)) then
									slot16 = line.string_id .. "_russ"

									if string.find(slot12, managers.localization.text("ERROR:", managers.localization)) then
										slot17 = dialog_id

										Application.debug(slot12, Application, "MISSING:", line.string_id, " DIALOG:")
									end
								end
							end
						end
					end
				end
			end
		elseif data.string_id then
			slot11 = data.string_id

			if string.find(slot7, managers.localization.text("ERROR:", managers.localization)) then
				slot11 = data.string_id .. "_brit"

				if string.find(slot7, managers.localization.text("ERROR:", managers.localization)) then
					slot11 = data.string_id .. "_amer"

					if string.find(slot7, managers.localization.text("ERROR:", managers.localization)) then
						slot11 = data.string_id .. "_ger"

						if string.find(slot7, managers.localization.text("ERROR:", managers.localization)) then
							slot11 = data.string_id .. "_russ"

							if string.find(slot7, managers.localization.text("ERROR:", managers.localization)) then
								slot12 = dialog_id

								Application.debug(slot7, Application, "MISSING:", data.string_id, " DIALOG:")
							end
						end
					end
				end
			end
		end
	end

	return 
end
function DialogManager:set_subtitles_shown(show_subtitles)
	self._show_subtitles = not not show_subtitles

	return 
end
function DialogManager:is_showing_subtitles()
	return self._show_subtitles
end

return 
