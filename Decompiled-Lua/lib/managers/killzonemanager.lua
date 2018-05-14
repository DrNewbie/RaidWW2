-- Decompilation Error: _run_step(_unwarp_expressions, node)

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
KillzoneManager = KillzoneManager or class()
function KillzoneManager:init()
	self._units = {}

	return 
end
function KillzoneManager:update(t, dt)
	slot5 = self._units

	for _, data in pairs(slot4) do
		slot10 = data.unit

		if alive(slot9) then
			if data.type == "sniper" then
				data.timer = data.timer + dt

				if data.next_shot < data.timer then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 20-26, warpins: 1 ---
					local warning_time = 4
					slot9 = data.timer
					slot10 = math.rand
					slot12 = (warning_time < data.timer and 0.5) or 1
					data.next_shot = data.timer + math.rand(slot11)
					slot12 = 1
					local warning_shot = math.max(math.rand(slot11), warning_time - data.timer)
					slot12 = warning_shot
					warning_shot = 0.75 < math.rand(warning_time - data.timer)
					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #2



					-- Decompilation error in this vicinity:
					--- BLOCK #1 27-28, warpins: 1 ---
					slot12 = 0.5

					if 0.5 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 29-29, warpins: 1 ---
						slot12 = 1
						--- END OF BLOCK #0 ---



					end

					--- END OF BLOCK #1 ---

					FLOW; TARGET BLOCK #2



					-- Decompilation error in this vicinity:
					--- BLOCK #2 30-45, warpins: 2 ---
					--- END OF BLOCK #2 ---

					FLOW; TARGET BLOCK #4



					-- Decompilation error in this vicinity:
					--- BLOCK #3 46-47, warpins: 1 ---
					warning_shot = false

					if false then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 48-48, warpins: 1 ---
						warning_shot = true
						--- END OF BLOCK #0 ---



					end

					--- END OF BLOCK #3 ---

					FLOW; TARGET BLOCK #4



					-- Decompilation error in this vicinity:
					--- BLOCK #4 49-50, warpins: 2 ---
					if warning_shot then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 51-55, warpins: 1 ---
						slot13 = data.unit

						self._warning_shot(slot11, self)
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 56-60, warpins: 1 ---
						slot13 = data.unit

						self._deal_damage(slot11, self)
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #4 ---



				end
			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 61-63, warpins: 1 ---
				if data.type == "gas" then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 64-70, warpins: 1 ---
					data.timer = data.timer + dt

					if data.next_gas < data.timer then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 71-82, warpins: 1 ---
						data.next_gas = data.timer + 0.25
						slot12 = "immune_to_gas"

						if not managers.player.has_category_upgrade(slot9, managers.player, "player") then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 83-87, warpins: 1 ---
							slot11 = data.unit

							self._deal_gas_damage(slot9, self)
							--- END OF BLOCK #0 ---



						end
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 88-90, warpins: 1 ---
					if data.type == "fire" then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 91-97, warpins: 1 ---
						data.timer = data.timer + dt

						if data.next_fire < data.timer then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 98-104, warpins: 1 ---
							data.next_fire = data.timer + 0.25
							slot11 = data.unit

							self._deal_fire_damage(slot9, self)
							--- END OF BLOCK #0 ---



						end
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
		end
	end

	return 
end
function KillzoneManager:set_unit(unit, type)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot6 = unit

	if self._units[unit.key(slot5)] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-12, warpins: 1 ---
		slot6 = unit

		self._remove_unit(slot4, self)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 13-17, warpins: 1 ---
		slot7 = type

		self._add_unit(slot4, self, unit)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 18-18, warpins: 2 ---
	return 
	--- END OF BLOCK #1 ---



end
function KillzoneManager:_warning_shot(unit)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-68, warpins: 1 ---
	slot4 = unit
	local rot = unit.camera(slot3).rotation(slot3)
	slot7 = rot
	slot7 = 0
	rot = Rotation(unit.camera(slot3), rot.yaw(slot6), 0)
	local pos = unit.position(unit.camera(slot3)) + rot.y(unit) * (100 + math.random(rot))
	slot8 = 360
	slot8 = 0
	local dir = Rotation(100 + math.random(rot), math.rand(200), 0).y(100 + math.random(rot))
	slot7 = dir.with_z(Rotation(100 + math.random(rot), math.rand(200), 0), dir)
	dir = dir.with_z(Rotation(100 + math.random(rot), math.rand(200), 0), dir).normalized(Rotation(100 + math.random(rot), math.rand(200), 0))
	local from_pos = pos + dir * -100
	local to_pos = pos + dir * 100
	slot17 = "bullet_impact_targets"
	slot16 = unit
	local col_ray = World.raycast(-0.4, World, "ray", from_pos, to_pos, "slot_mask", managers.slot.get_mask(slot15, managers.slot), "ignore_unit")

	if col_ray and col_ray.unit then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 72-78, warpins: 1 ---
		slot11 = {
			col_ray = col_ray
		}

		managers.game_play_central.play_impact_sound_and_effects(slot9, managers.game_play_central)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 79-79, warpins: 3 ---
	return 
	--- END OF BLOCK #1 ---



end
function KillzoneManager:_deal_damage(unit)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	slot4 = unit
	slot4 = unit.character_damage(slot3)

	if unit.character_damage(slot3).need_revive(slot3) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-9, warpins: 1 ---
		return 
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 10-40, warpins: 2 ---
	local col_ray = {}
	slot7 = 360
	slot7 = 0
	local ray = Rotation(slot4, math.rand(slot6), 0).y(slot4)
	slot7 = -0.4
	ray = ray.with_z(Rotation(slot4, math.rand(slot6), 0), ray).normalized(Rotation(slot4, math.rand(slot6), 0))
	col_ray.ray = ray
	local attack_data = {
		damage = 1
	}
	attack_data.col_ray = col_ray
	slot7 = unit
	slot8 = attack_data

	unit.character_damage(ray.with_z(Rotation(slot4, math.rand(slot6), 0), ray)).damage_killzone(ray.with_z(Rotation(slot4, math.rand(slot6), 0), ray), unit.character_damage(ray.with_z(Rotation(slot4, math.rand(slot6), 0), ray)))

	return 
	--- END OF BLOCK #1 ---



end
function KillzoneManager:_deal_gas_damage(unit)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-14, warpins: 1 ---
	local attack_data = {
		damage = 0.75
	}
	attack_data.col_ray = {
		ray = math.UP
	}
	slot5 = unit
	slot6 = attack_data

	unit.character_damage(math.UP).damage_killzone(math.UP, unit.character_damage(math.UP))

	return 
	--- END OF BLOCK #0 ---



end
function KillzoneManager:_deal_fire_damage(unit)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-14, warpins: 1 ---
	local attack_data = {
		damage = 0.5
	}
	attack_data.col_ray = {
		ray = math.UP
	}
	slot5 = unit
	slot6 = attack_data

	unit.character_damage(math.UP).damage_killzone(math.UP, unit.character_damage(math.UP))

	return 
	--- END OF BLOCK #0 ---



end
function KillzoneManager:_add_unit(unit, type)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	if type == "sniper" then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 3-16, warpins: 1 ---
		slot5 = 1
		local next_shot = math.rand(slot4)
		slot7 = unit
		self._units[unit.key(slot6)] = {
			timer = 0,
			type = type,
			next_shot = next_shot,
			unit = unit
		}
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 17-18, warpins: 1 ---
		if type == "gas" then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 19-32, warpins: 1 ---
			slot5 = 1
			local next_gas = math.rand(slot4)
			slot7 = unit
			self._units[unit.key(slot6)] = {
				timer = 0,
				type = type,
				next_gas = next_gas,
				unit = unit
			}
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 33-34, warpins: 1 ---
			if type == "fire" then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 35-47, warpins: 1 ---
				slot5 = 1
				local next_fire = math.rand(slot4)
				slot7 = unit
				self._units[unit.key(slot6)] = {
					timer = 0,
					type = type,
					next_fire = next_fire,
					unit = unit
				}
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 48-48, warpins: 4 ---
	return 
	--- END OF BLOCK #1 ---



end
function KillzoneManager:_remove_unit(unit)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot5 = unit
	self._units[unit.key(slot4)] = nil

	return 
	--- END OF BLOCK #0 ---



end

return 
