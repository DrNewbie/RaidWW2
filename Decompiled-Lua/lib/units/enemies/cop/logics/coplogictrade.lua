-- Decompilation Error: _run_step(_unwarp_expressions, node)

-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- Decompilation Error: _glue_flows(node)

-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot2 = CopLogicBase
CopLogicTrade = class(slot1)
CopLogicTrade.butchers_traded = 0
function CopLogicTrade.enter(data, new_logic_name, enter_params)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-75, warpins: 1 ---
	local my_data = {}
	my_data.unit = data.unit
	slot9 = my_data

	CopLogicBase.enter(slot5, data, new_logic_name, enter_params)

	slot6 = data.unit

	data.unit.brain(slot5).cancel_all_pathing_searches(slot5)

	local old_internal_data = data.internal_data
	data.internal_data = my_data
	slot7 = data.unit
	slot8 = false

	data.unit.movement(data.unit.brain(slot5)).set_allow_fire(data.unit.brain(slot5), data.unit.movement(data.unit.brain(slot5)))

	slot7 = data

	CopLogicBase._reset_attention(data.unit.brain(slot5))

	my_data._trade_enabled = true
	slot7 = data.unit
	slot10 = false

	data.unit.network(data.unit.brain(slot5)).send(data.unit.brain(slot5), data.unit.network(data.unit.brain(slot5)), "hostage_trade", true)

	slot9 = false

	CopLogicTrade.hostage_trade(data.unit.brain(slot5), data.unit, true)

	slot7 = data.unit
	slot8 = true

	data.unit.brain(data.unit.brain(slot5)).set_update_enabled_state(data.unit.brain(slot5), data.unit.brain(data.unit.brain(slot5)))

	slot7 = managers.groupai
	slot7 = managers.groupai.state(data.unit.brain(slot5))
	slot5 = managers.groupai.state(data.unit.brain(slot5)).on_hostage_state
	slot8 = true
	slot9 = data.key
	slot12 = managers.enemy
	slot10 = (managers.enemy.all_enemies(slot11)[data.key] and true) or false

	slot5(data.unit, managers.groupai.state(data.unit.brain(slot5)), true, slot9)

	slot7 = data.unit
	slot8 = {
		peaceful = true
	}

	data.unit.brain(data.unit).set_attention_settings(data.unit, data.unit.brain(data.unit))

	return 

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #1 76-77, warpins: 1 ---
	slot10 = true

	if true then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 78-78, warpins: 1 ---
		slot10 = false
		--- END OF BLOCK #0 ---



	end
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 79-88, warpins: 2 ---
	--- END OF BLOCK #2 ---



end
function CopLogicTrade.hostage_trade(unit, enable, trade_success)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	local wp_id = "wp_hostage_trade"
	slot9 = trade_success

	print(slot5, "[CopLogicTrade.hostage_trade]", unit, enable)

	if enable then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-38, warpins: 1 ---
		slot7 = "debug_trade_hostage"
		local text = managers.localization.text(slot5, managers.localization)
		slot7 = managers.hud
		slot5 = managers.hud.add_waypoint
		slot8 = wp_id
		slot9 = {
			icon = "wp_trade",
			waypoint_type = "hostage_trade",
			text = text,
			position = unit.movement(slot11).m_pos(slot11)
		}
		slot12 = unit
		slot12 = unit.movement(slot11)
		slot13 = "WIN32"

		if SystemInfo.platform(slot11) ~= Idstring(SystemInfo) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 39-40, warpins: 1 ---
			slot10 = false
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 41-41, warpins: 1 ---
			slot10 = true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 42-50, warpins: 2 ---
		slot9.distance = slot10

		slot5(slot6, slot7, slot8)

		slot7 = managers.network

		if managers.network.session(slot6) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 51-68, warpins: 1 ---
			slot7 = managers.trade
			slot10 = managers.network
			slot10 = managers.network.session(slot9)
			slot10 = managers.network.session(slot9).local_peer(slot9)

			if not managers.trade.is_peer_in_custody(slot6, managers.network.session(slot9).local_peer(slot9).id(slot9)) then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 69-69, warpins: 1 ---
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 69-74, warpins: 3 ---
		slot7 = Network

		if Network.is_server(slot6) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 75-85, warpins: 1 ---
			slot8 = unit

			if managers.enemy.all_civilians(slot6)[unit.key(managers.enemy)] then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 86-91, warpins: 1 ---
				slot7 = unit

				if unit.anim_data(slot6).stand then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 92-99, warpins: 1 ---
					slot7 = unit
					slot7 = unit.brain(slot6)

					if unit.brain(slot6).is_tied(slot6) then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 100-107, warpins: 1 ---
						slot7 = unit
						slot9 = "stay"

						unit.brain(slot6).on_hostage_move_interaction(slot6, unit.brain(slot6), nil)
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 108-120, warpins: 5 ---
		slot7 = unit
		slot8 = true

		unit.character_damage(slot6).set_invulnerable(slot6, unit.character_damage(slot6))

		slot7 = Network

		if Network.is_server(slot6) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 121-135, warpins: 1 ---
			slot7 = unit
			slot8 = "hostage_trade"

			unit.interaction(slot6).set_tweak_data(slot6, unit.interaction(slot6))

			slot7 = unit
			slot9 = true

			unit.interaction(slot6).set_active(slot6, unit.interaction(slot6), true)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #3 ---

		FLOW; TARGET BLOCK #4



		-- Decompilation error in this vicinity:
		--- BLOCK #4 136-141, warpins: 2 ---
		slot7 = Network

		if Network.is_server(slot6) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 142-147, warpins: 1 ---
			slot7 = unit

			if not unit.anim_data(slot6).hands_tied then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 148-153, warpins: 1 ---
				slot7 = unit

				if not unit.anim_data(slot6).tied then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 154-165, warpins: 1 ---
					local action_data = nil
					slot9 = unit

					if managers.enemy.all_civilians(slot7)[unit.key(managers.enemy)] then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 166-173, warpins: 1 ---
						slot8 = unit
						slot8 = unit.brain(slot7)

						if not unit.brain(slot7).is_tied(slot7) then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 174-178, warpins: 1 ---
							action_data = {
								clamp_to_graph = true,
								type = "act",
								body_part = 1,
								variant = "tied",
								blocks = {
									light_hurt = -1,
									hurt = -1,
									heavy_hurt = -1,
									walk = -1
								}
							}
							--- END OF BLOCK #0 ---



						end
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 179-182, warpins: 1 ---
						action_data = {
							clamp_to_graph = true,
							type = "act",
							body_part = 1,
							variant = "tied_all_in_one",
							blocks = {
								light_hurt = -1,
								hurt = -1,
								heavy_hurt = -1,
								walk = -1
							}
						}
						--- END OF BLOCK #0 ---



					end

					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 183-184, warpins: 3 ---
					if action_data then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 185-192, warpins: 1 ---
						slot8 = unit
						slot9 = action_data

						unit.brain(slot7).action_request(slot7, unit.brain(slot7))
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #1 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #4 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 193-200, warpins: 1 ---
		slot7 = wp_id

		managers.hud.remove_waypoint(slot5, managers.hud)

		if trade_success then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 201-209, warpins: 1 ---
			slot6 = unit
			slot8 = false

			unit.interaction(slot5).set_active(slot5, unit.interaction(slot5), false)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 210-228, warpins: 1 ---
			slot6 = unit
			slot8 = false

			unit.interaction(slot5).set_active(slot5, unit.interaction(slot5), false)

			slot7 = unit

			if managers.enemy.all_civilians(slot5)[unit.key(managers.enemy)] then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 229-236, warpins: 1 ---
				slot6 = unit
				slot7 = "hostage_move"

				unit.interaction(slot5).set_tweak_data(slot5, unit.interaction(slot5))
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 237-243, warpins: 1 ---
				slot6 = unit
				slot7 = "intimidate"

				unit.interaction(slot5).set_tweak_data(slot5, unit.interaction(slot5))
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 244-251, warpins: 2 ---
			slot6 = unit
			slot8 = false

			unit.interaction(slot5).set_active(slot5, unit.interaction(slot5), false)
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 252-252, warpins: 7 ---
	return 
	--- END OF BLOCK #1 ---



end
function CopLogicTrade.exit(data, new_logic_name, enter_params)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-10, warpins: 1 ---
	slot7 = enter_params

	CopLogicBase.exit(slot4, data, new_logic_name)

	local my_data = data.internal_data

	if my_data._trade_enabled then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-38, warpins: 1 ---
		my_data._trade_enabled = false
		slot6 = data.unit
		slot9 = false

		data.unit.network(slot5).send(slot5, data.unit.network(slot5), "hostage_trade", false)

		slot8 = false

		CopLogicTrade.hostage_trade(slot5, data.unit, false)

		slot6 = managers.groupai
		slot8 = data.key

		managers.groupai.state(slot5).on_hostage_state(slot5, managers.groupai.state(slot5), false)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 39-56, warpins: 2 ---
	slot6 = data.unit
	slot7 = false

	data.unit.character_damage(slot5).set_invulnerable(slot5, data.unit.character_damage(slot5))

	slot6 = data.unit
	slot8 = false

	data.unit.network(slot5).send(slot5, data.unit.network(slot5), "set_unit_invulnerable")

	return 
	--- END OF BLOCK #1 ---



end
function CopLogicTrade.on_trade(data, trading_unit)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	if not data.internal_data._trade_enabled then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-5, warpins: 1 ---
		return 
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 6-48, warpins: 2 ---
	slot5 = trading_unit

	managers.trade.on_hostage_traded(slot3, managers.trade)

	data.internal_data._trade_enabled = false
	slot4 = data.unit
	slot7 = true

	data.unit.network(false).send(false, data.unit.network(false), "hostage_trade", false)

	slot6 = true

	CopLogicTrade.hostage_trade(false, data.unit, false)

	slot4 = managers.groupai
	slot4 = managers.groupai.state(false)
	slot2 = managers.groupai.state(false).on_hostage_state
	slot5 = false
	slot6 = data.key
	slot9 = managers.enemy

	if managers.enemy.all_enemies(slot8)[data.key] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 49-50, warpins: 1 ---
		slot7 = true
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 51-51, warpins: 1 ---
		slot7 = false
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 52-55, warpins: 2 ---
	slot2(slot3, slot4, slot5, slot6)

	if data.is_converted then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 56-65, warpins: 1 ---
		slot4 = managers.groupai
		slot6 = nil

		managers.groupai.state(slot3).remove_minion(slot3, managers.groupai.state(slot3), data.key)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 66-85, warpins: 2 ---
	slot4 = managers.groupai
	slot4 = managers.groupai.state(slot3)
	slot7 = data.unit
	slot7 = data.unit.movement(slot6)
	slot7 = data.unit.movement(slot6).nav_tracker(slot6)
	local flee_pos = managers.groupai.state(slot3).flee_point(slot3, data.unit.movement(slot6).nav_tracker(slot6).nav_segment(slot6))

	if flee_pos then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 86-97, warpins: 1 ---
		data.internal_data.fleeing = true
		data.internal_data.flee_pos = flee_pos
		slot5 = data.unit
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 137-147, warpins: 2 ---
		slot5 = data.unit
		slot8 = nil

		data.unit.contour(slot4).add(slot4, data.unit.contour(slot4), "hostage_trade", true)
		--- END OF BLOCK #1 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 148-152, warpins: 1 ---
		slot6 = 0

		data.unit.set_slot(slot4, data.unit)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 153-153, warpins: 2 ---
	return 
	--- END OF BLOCK #4 ---



end
function CopLogicTrade.update(data)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	local my_data = data.internal_data
	slot5 = my_data

	CopLogicTrade._process_pathing_results(slot3, data)

	if my_data.pathing_to_flee_pos then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-10, warpins: 1 ---
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-13, warpins: 1 ---
		if my_data.flee_path then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 14-23, warpins: 1 ---
			slot4 = data.unit
			slot5 = "walk"

			if not data.unit.movement(slot3).chk_action_forbidden(slot3, data.unit.movement(slot3)) then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 24-30, warpins: 1 ---
				slot4 = data.unit

				if data.unit.anim_data(slot3).idle_full_blend then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 31-40, warpins: 1 ---
					slot4 = data.unit
					slot5 = my_data

					data.unit.brain(slot3)._current_logic._chk_request_action_walk_to_flee_pos(slot3, data)
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 41-43, warpins: 1 ---
			if my_data.flee_pos then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 44-66, warpins: 1 ---
				local to_pos = my_data.flee_pos
				my_data.flee_pos = nil
				my_data.pathing_to_flee_pos = true
				slot7 = data.unit
				my_data.flee_path_search_id = tostring(data.unit.key(slot6)) .. "flee"
				slot5 = data.unit
				slot7 = to_pos

				data.unit.brain("flee").search_for_path("flee", data.unit.brain("flee"), my_data.flee_path_search_id)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 67-67, warpins: 6 ---
	return 
	--- END OF BLOCK #1 ---



end
function CopLogicTrade.on_intimidated(data, amount, aggressor_unit)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-1, warpins: 1 ---
	return 
	--- END OF BLOCK #0 ---



end
function CopLogicTrade._process_pathing_results(data, my_data)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if data.pathing_results then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-10, warpins: 1 ---
		local pathing_results = data.pathing_results
		data.pathing_results = nil
		local path = pathing_results[my_data.flee_path_search_id]

		if path then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 11-12, warpins: 1 ---
			if path ~= "failed" then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 13-14, warpins: 1 ---
				my_data.flee_path = path
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 15-19, warpins: 1 ---
				slot7 = 0

				data.unit.set_slot(slot5, data.unit)
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 20-23, warpins: 2 ---
			my_data.pathing_to_flee_pos = nil
			my_data.flee_path_search_id = nil
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 24-24, warpins: 3 ---
	return 
	--- END OF BLOCK #1 ---



end
function CopLogicTrade._chk_request_action_walk_to_flee_pos(data, my_data, end_rot)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-21, warpins: 1 ---
	local new_action_data = {}
	new_action_data.type = "walk"
	new_action_data.nav_path = my_data.flee_path
	new_action_data.variant = "run"
	new_action_data.body_part = 2
	my_data.flee_path = nil
	slot6 = data.unit
	slot7 = new_action_data
	my_data.walking_to_flee_pos = data.unit.brain(slot5).action_request(slot5, data.unit.brain(slot5))

	return 
	--- END OF BLOCK #0 ---



end
function CopLogicTrade.on_action_completed(data, action)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	local my_data = data.internal_data
	slot5 = action
	local action_type = action.type(slot4)

	if action_type == "walk" and my_data.walking_to_flee_pos then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-16, warpins: 1 ---
		my_data.walking_to_flee_pos = nil
		slot7 = 0

		data.unit.set_slot(slot5, data.unit)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 17-17, warpins: 3 ---
	return 
	--- END OF BLOCK #1 ---



end
function CopLogicTrade.can_activate()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	return false
	--- END OF BLOCK #0 ---



end
function CopLogicTrade.is_available_for_assignment(data)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	return false
	--- END OF BLOCK #0 ---



end
function CopLogicTrade.on_new_objective(data, old_objective)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot5 = old_objective

	CopLogicBase.update_follow_unit(slot3, data)

	return 
	--- END OF BLOCK #0 ---



end
function CopLogicTrade._get_all_paths(data)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	return {
		flee_path = data.internal_data.flee_path
	}
	--- END OF BLOCK #0 ---



end
function CopLogicTrade._set_verified_paths(data, verified_paths)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	data.internal_data.flee_path = verified_paths.flee_path

	return 
	--- END OF BLOCK #0 ---



end
function CopLogicTrade.pre_destroy(data)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot3 = managers.trade

	managers.trade.change_hostage(slot2)

	return 
	--- END OF BLOCK #0 ---



end

return 
