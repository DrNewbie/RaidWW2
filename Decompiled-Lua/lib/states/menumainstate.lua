-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot2 = "lib/states/GameState"

require(slot1)

if not MenuMainState then
	slot2 = GameState
	slot0 = class(slot1)
end

MenuMainState = slot0
function MenuMainState:init(game_state_machine)
	slot6 = game_state_machine

	GameState.init(slot3, self, "menu_main")

	return 
end
function MenuMainState:at_enter(old_state)

	-- Decompilation error in this vicinity:
	slot4 = managers.worldcollection

	managers.worldcollection.reset_global_ref_counter(slot3)

	slot5 = false

	managers.platform.set_playing(slot3, managers.platform)

	slot5 = "Idle"

	managers.platform.set_rich_presence(slot3, managers.platform)

	slot4 = old_state
	local has_invite = false
	slot6 = "PS3"

	if Global.open_trial_buy then
		Global.open_trial_buy = nil
		slot6 = "trial_info"

		managers.menu.open_node(nil, managers.menu)
	elseif not has_invite then
		slot5 = managers.network

		if not managers.network.session(slot4) then
			if false then
				local function yes_func()
					slot3 = {
						skip_question = true
					}

					MenuCallbackHandler.play_safehouse(slot1, MenuCallbackHandler)

					return 
				end

				slot7 = {
					yes_func = yes_func
				}

				managers.menu.show_question_start_tutorial(slot5, managers.menu)
			end
		end
	end

	if Global.savefile_manager.backup_save_enabled then
	end

	if Global.exe_argument_level then
		slot6 = {
			job_id = Global.exe_argument_level,
			difficulty = Global.exe_argument_difficulty
		}

		MenuCallbackHandler.start_job(slot4, MenuCallbackHandler)
	end

	return 
end
function MenuMainState:at_exit(new_state)
	slot4 = new_state

	if new_state.name(slot3) ~= "freeflight" then
		slot5 = "menu_main"

		managers.menu.close_menu(slot3, managers.menu)
	end

	if self._sound_listener then
		slot4 = self._sound_listener

		self._sound_listener.delete(slot3)

		self._sound_listener = nil
	end

	return 
end
function MenuMainState:server_left()
	slot3 = managers.network

	if managers.network.session(slot2) then
		slot3 = managers.network
		slot3 = managers.network.session(slot2)
	end

	slot4 = "dialog_server_left"

	managers.menu.show_host_left_dialog(slot2, managers.menu)

	return 
end
function MenuMainState:on_disconnected()
	return 
end
function MenuMainState:is_joinable()
	return false
end

return 
