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
local mvec3_set = mvector3.set
local mvec3_set_z = mvector3.set_z
local mvec3_set_l = mvector3.set_length
local mvec3_sub = mvector3.subtract
local mvec3_add = mvector3.add
local mvec3_mul = mvector3.multiply
local mvec3_dot = mvector3.dot
local mvec3_cross = mvector3.cross
local mvec3_norm = mvector3.normalize
local mvec3_dir = mvector3.direction
local mvec3_rand_orth = mvector3.random_orthogonal
local mvec3_dis = mvector3.distance
local tmp_vec1 = Vector3()
local tmp_vec2 = Vector3()
local tmp_vec3 = Vector3()
CopActionHurt = CopActionHurt or class()
CopActionHurt.running_death_anim_variants = {
	male = 26,
	female = 5
}
CopActionHurt.death_anim_variants = {
	normal = {
		crouching = {
			fwd = {
				high = 14,
				low = 5
			},
			bwd = {
				high = 3,
				low = 1
			},
			l = {
				high = 3,
				low = 1
			},
			r = {
				high = 3,
				low = 1
			}
		},
		not_crouching = {
			fwd = {
				high = 14,
				low = 5
			},
			bwd = {
				high = 3,
				low = 2
			},
			l = {
				high = 3,
				low = 1
			},
			r = {
				high = 3,
				low = 1
			}
		}
	},
	heavy = {
		crouching = {
			fwd = {
				high = 7,
				low = 2
			},
			bwd = {
				high = 3,
				low = 1
			},
			l = {
				high = 3,
				low = 1
			},
			r = {
				high = 3,
				low = 1
			}
		},
		not_crouching = {
			fwd = {
				high = 6,
				low = 2
			},
			bwd = {
				high = 1,
				low = 1
			},
			l = {
				high = 1,
				low = 1
			},
			r = {
				high = 1,
				low = 1
			}
		}
	}
}
CopActionHurt.death_anim_fe_variants = {
	normal = {
		crouching = {
			fwd = {
				high = 5,
				low = 2
			},
			bwd = {
				high = 2,
				low = 0
			},
			l = {
				high = 2,
				low = 0
			},
			r = {
				high = 2,
				low = 0
			}
		},
		not_crouching = {
			fwd = {
				high = 6,
				low = 2
			},
			bwd = {
				high = 3,
				low = 0
			},
			l = {
				high = 2,
				low = 0
			},
			r = {
				high = 2,
				low = 0
			}
		}
	},
	heavy = {
		crouching = {
			fwd = {
				high = 0,
				low = 0
			},
			bwd = {
				high = 0,
				low = 0
			},
			l = {
				high = 0,
				low = 0
			},
			r = {
				high = 0,
				low = 0
			}
		},
		not_crouching = {
			fwd = {
				high = 0,
				low = 0
			},
			bwd = {
				high = 0,
				low = 0
			},
			l = {
				high = 0,
				low = 0
			},
			r = {
				high = 0,
				low = 0
			}
		}
	}
}
CopActionHurt.hurt_anim_variants_highest_num = 18
CopActionHurt.hurt_anim_variants = {
	hurt = {
		not_crouching = {
			fwd = {
				high = 13,
				low = 5
			},
			bwd = {
				high = 2,
				low = 1
			},
			l = {
				high = 3,
				low = 1
			},
			r = {
				high = 3,
				low = 1
			}
		}
	},
	heavy_hurt = {
		not_crouching = {
			fwd = {
				high = 18,
				low = 7
			},
			bwd = {
				high = 3,
				low = 2
			},
			l = {
				high = 4,
				low = 2
			},
			r = {
				high = 4,
				low = 2
			}
		}
	},
	expl_hurt = {
		bwd = 8,
		l = 7,
		fwd = 8,
		r = 7
	},
	fire_hurt = {
		bwd = 8,
		l = 7,
		fwd = 8,
		r = 7
	}
}
CopActionHurt.running_hurt_anim_variants = {
	fwd = 14
}

if not ShieldActionHurt then
	slot17 = CopActionHurt
	slot15 = class(slot16)
end

ShieldActionHurt = slot15
slot18 = CopActionHurt.hurt_anim_variants
ShieldActionHurt.hurt_anim_variants = deep_clone(slot17)
ShieldActionHurt.hurt_anim_variants.expl_hurt = {
	bwd = 2,
	l = 2,
	fwd = 2,
	r = 2
}
ShieldActionHurt.hurt_anim_variants.fire_hurt = {
	bwd = 2,
	l = 2,
	fwd = 2,
	r = 2
}
CopActionHurt.fire_death_anim_variants_length = {
	9,
	5,
	5,
	7,
	4
}
function CopActionHurt:init(action_desc, common_data)
	self._common_data = common_data
	self._ext_movement = common_data.ext_movement
	self._ext_inventory = common_data.ext_inventory
	self._ext_anim = common_data.ext_anim
	self._body_part = action_desc.body_part
	self._unit = common_data.unit
	self._machine = common_data.machine
	self._attention = common_data.attention
	self._action_desc = action_desc
	slot5 = TimerManager
	local t = TimerManager.game(slot4).time(slot4)
	local tweak_table = self._unit.base(TimerManager.game(slot4))._tweak_table
	local is_civilian = CopDamage.is_civilian(self._unit)
	slot9 = "female"
	local is_female = (self._machine.get_global(tweak_table, self._machine) or 0) == 1
	slot9 = self._unit

	if not self._unit.anim_data(slot8).crouch then
		slot9 = self._unit

		if self._unit.anim_data(slot8).hurt then
			slot12 = self._machine
			slot15 = "base"
			local crouching = 0 < self._machine.get_parameter(slot8, self._machine, self._machine.segment_state("crh", Idstring(slot14)))
		end
	end

	local redir_res = nil
	local action_type = action_desc.hurt_type
	local ignite_character = action_desc.ignite_character
	local start_dot_dance_antimation = action_desc.fire_dot_data and action_desc.fire_dot_data.start_dot_dance_antimation

	if action_type == "fatal" then
		slot15 = "fatal"
		redir_res = self._ext_movement.play_redirect(slot13, self._ext_movement)

		if not redir_res then
			slot14 = "[CopActionHurt:init] fatal redirect failed in"
			slot17 = self._machine
			slot20 = "base"

			debug_pause(slot13, self._machine.segment_state(slot16, Idstring(slot19)))

			return 
		end

		slot18 = self._unit
		slot16 = self._unit.unit_data(self._unit).name_label_id

		managers.hud.on_teammate_downed(slot13, managers.hud, self._unit.unit_data(slot16).teammate_panel_id)
	elseif action_desc.variant == "tase" then
		slot15 = "tased"
		redir_res = self._ext_movement.play_redirect(slot13, self._ext_movement)

		if not redir_res then
			slot14 = "[CopActionHurt:init] tased redirect failed in"
			slot17 = self._machine
			slot20 = "base"

			debug_pause(slot13, self._machine.segment_state(slot16, Idstring(slot19)))

			return 
		end
	elseif action_type == "fire_hurt" or (action_type == "light_hurt" and action_desc.variant == "fire") then
		slot15 = self._unit
		local char_tweak = tweak_data.character[self._unit.base(slot14)._tweak_table]
		local use_animation_on_fire_damage = nil

		if char_tweak.use_animation_on_fire_damage == nil then
			use_animation_on_fire_damage = true
		else
			use_animation_on_fire_damage = char_tweak.use_animation_on_fire_damage
		end

		if start_dot_dance_antimation then
			if ignite_character == "dragonsbreath" then
				slot16 = self

				self._dragons_breath_sparks(slot15)
			end

			slot16 = self._unit

			if self._unit.character_damage(slot15) ~= nil then
				slot16 = self._unit

				if self._unit.character_damage(slot15).get_last_time_unit_got_fire_damage ~= nil then
					slot16 = self._unit
					slot16 = self._unit.character_damage(slot15)
					local last_fire_recieved = self._unit.character_damage(slot15).get_last_time_unit_got_fire_damage(slot15)

					if last_fire_recieved == nil or 1 < t - last_fire_recieved then
						if use_animation_on_fire_damage then
							slot18 = "fire_hurt"
							redir_res = self._ext_movement.play_redirect(slot16, self._ext_movement)
							local dir_str = nil
							slot19 = common_data.fwd
							local fwd_dot = action_desc.direction_vec.dot(self._ext_movement, action_desc.direction_vec)

							if fwd_dot < 0 then
								local hit_pos = action_desc.hit_pos
								slot21 = 0
								local hit_vec = hit_pos - common_data.pos.with_z(slot19, hit_pos - common_data.pos).normalized(slot19)
								slot22 = common_data.right

								if 0 < mvector3.dot(hit_pos - common_data.pos.with_z(slot19, hit_pos - common_data.pos), hit_vec) then
									dir_str = "r"
								else
									dir_str = "l"
								end
							else
								dir_str = "bwd"
							end

							slot22 = 1

							self._machine.set_parameter(slot18, self._machine, redir_res, dir_str)
						end

						slot17 = self._unit
						slot18 = t

						self._unit.character_damage(slot16).set_last_time_unit_got_fire_damage(slot16, self._unit.character_damage(slot16))
					end
				end
			end
		end
	elseif action_type == "taser_tased" then
		slot15 = self._unit
		local char_tweak = tweak_data.character[self._unit.base(slot14)._tweak_table]

		if char_tweak.can_be_tased == nil or char_tweak.can_be_tased then
			slot15 = self._unit

			if self._unit.brain(slot14) then
				slot15 = self._unit

				if self._unit.brain(slot14)._current_logic_name ~= "intimidated" then
					slot16 = "taser"
					redir_res = self._ext_movement.play_redirect(slot14, self._ext_movement)
					slot15 = 4
					local variant = math.random(slot14)
					local dir_str = nil

					if variant == 1 then
						dir_str = "var1"
					elseif variant == 2 then
						dir_str = "var2"
					elseif variant == 3 then
						dir_str = "var3"
					elseif variant == 4 then
						dir_str = "var4"
					else
						dir_str = "fwd"
					end

					slot20 = 1

					self._machine.set_parameter(slot16, self._machine, redir_res, dir_str)
				end
			end
		end
	elseif action_type == "light_hurt" then
		if not self._ext_anim.upper_body_active or self._ext_anim.upper_body_empty or self._ext_anim.recoil then
			slot15 = action_type
			redir_res = self._ext_movement.play_redirect(slot13, self._ext_movement)

			if not redir_res then
				slot14 = "[CopActionHurt:init] light_hurt redirect failed in"
				slot17 = self._machine
				slot20 = "upper_body"

				debug_pause(slot13, self._machine.segment_state(slot16, Idstring(slot19)))

				return 
			end

			local dir_str = nil
			slot16 = common_data.fwd
			local fwd_dot = action_desc.direction_vec.dot(slot14, action_desc.direction_vec)

			if fwd_dot < 0 then
				local hit_pos = action_desc.hit_pos
				slot18 = 0
				local hit_vec = hit_pos - common_data.pos.with_z(slot16, hit_pos - common_data.pos).normalized(slot16)
				slot19 = common_data.right

				if 0 < mvector3.dot(hit_pos - common_data.pos.with_z(slot16, hit_pos - common_data.pos), hit_vec) then
					dir_str = "r"
				else
					dir_str = "l"
				end
			else
				dir_str = "bwd"
			end

			slot19 = 1

			self._machine.set_parameter(slot15, self._machine, redir_res, dir_str)

			slot17 = self._ext_movement
			local height_str = (self._ext_movement.m_com(self._machine).z < action_desc.hit_pos.z and "high") or "low"
			slot20 = 1

			self._machine.set_parameter(slot16, self._machine, redir_res, height_str)
		end

		self._expired = true

		return true
	elseif action_type == "hurt_sick" then
		local ecm_hurts_table = self._common_data.char_tweak.ecm_hurts

		if not ecm_hurts_table then
			slot17 = self._unit

			debug_pause_unit(slot14, self._unit, "[CopActionHurt:init] Unit missing ecm_hurts in Character Tweak Data")

			return 
		end

		slot16 = "hurt_sick"
		redir_res = self._ext_movement.play_redirect(slot14, self._ext_movement)

		if not redir_res then
			slot15 = "[CopActionHurt:init] hurt_sick redirect failed in"
			slot18 = self._machine
			slot21 = "base"

			debug_pause(slot14, self._machine.segment_state(slot17, Idstring(slot20)))

			return 
		end

		local is_cop = true

		if is_civilian then
			is_cop = false
		end

		local sick_variants = {}
		slot17 = ecm_hurts_table

		for i, d in pairs(slot16) do
			slot23 = i

			table.insert(slot21, sick_variants)
		end

		local variant = sick_variants[math.random(slot16)]
		slot19 = ecm_hurts_table[variant].max_duration
		local duration = math.random(#sick_variants, ecm_hurts_table[variant].min_duration)
		slot19 = sick_variants

		for _, hurt_sick in ipairs(ecm_hurts_table[variant].min_duration) do
			slot26 = (hurt_sick == variant and 1) or 0

			self._machine.set_global(slot23, self._machine, hurt_sick)
		end

		self._sick_time = t + duration
	elseif action_type == "poison_hurt" then
		slot15 = "hurt_poison"
		redir_res = self._ext_movement.play_redirect(slot13, self._ext_movement)

		if not redir_res then
			slot14 = "[CopActionHurt:init] hurt_sick redirect failed in"
			slot17 = self._machine
			slot20 = "base"

			debug_pause(slot13, self._machine.segment_state(slot16, Idstring(slot19)))

			return 
		end

		self._sick_time = t + 2
	elseif action_type == "bleedout" then
		slot15 = "bleedout"
		redir_res = self._ext_movement.play_redirect(slot13, self._ext_movement)

		if not redir_res then
			slot14 = "[CopActionHurt:init] bleedout redirect failed in"
			slot17 = self._machine
			slot20 = "base"

			debug_pause(slot13, self._machine.segment_state(slot16, Idstring(slot19)))

			return 
		end
	elseif action_type == "death" and action_desc.variant == "fire" then
		slot15 = "death_fire"
		redir_res = self._ext_movement.play_redirect(slot13, self._ext_movement)

		if not redir_res then
			slot14 = "[CopActionHurt:init] death_fire redirect failed in"
			slot17 = self._machine
			slot20 = "base"

			debug_pause(slot13, self._machine.segment_state(slot16, Idstring(slot19)))

			return 
		end

		local variant_count = #CopActionHurt.fire_death_anim_variants_length or 5
		local variant = 1

		if 1 < variant_count then
			slot16 = variant_count
			variant = math.random(slot15)
		end

		for i = 1, variant_count, 1 do
			local state_value = 0

			if i == variant then
				state_value = 1
			end

			slot26 = i
			slot24 = state_value

			self._machine.set_parameter(slot20, self._machine, redir_res, "var" .. tostring(slot25))
		end

		slot17 = variant

		self._start_enemy_fire_effect_on_death(slot15, self)

		slot18 = t

		managers.fire.check_achievemnts(slot15, managers.fire, self._unit)
	elseif action_type == "death" and action_desc.variant == "poison" then
		slot14 = self

		self.force_ragdoll(slot13)
	elseif action_type == "death" and ((self._ext_anim.run and self._ext_anim.move_fwd) or self._ext_anim.sprint) and not common_data.char_tweak.no_run_death_anim then
		slot15 = "death_run"
		redir_res = self._ext_movement.play_redirect(slot13, self._ext_movement)

		if not redir_res then
			slot14 = "[CopActionHurt:init] death_run redirect failed in"
			slot17 = self._machine
			slot20 = "base"

			debug_pause(slot13, self._machine.segment_state(slot16, Idstring(slot19)))

			return 
		end

		local variant = self.running_death_anim_variants[(is_female and "female") or "male"] or 1

		if 1 < variant then
			slot15 = variant
			variant = math.random(slot14)
		end

		slot20 = variant
		slot18 = 1

		self._machine.set_parameter(slot14, self._machine, redir_res, "var" .. tostring(slot19))
	elseif action_type == "death" and (self._ext_anim.run or self._ext_anim.ragdoll) then
		slot14 = self
	elseif action_type == "heavy_hurt" and (self._ext_anim.run or self._ext_anim.sprint) and not common_data.is_suppressed and not crouching then
		slot15 = "heavy_run"
		redir_res = self._ext_movement.play_redirect(slot13, self._ext_movement)

		if not redir_res then
			slot14 = "[CopActionHurt:init] heavy_run redirect failed in"
			slot17 = self._machine
			slot20 = "base"

			debug_pause(slot13, self._machine.segment_state(slot16, Idstring(slot19)))

			return 
		end

		local variant = self.running_hurt_anim_variants.fwd or 1

		if 1 < variant then
			slot15 = variant
			variant = math.random(slot14)
		end

		slot20 = variant
		slot18 = 1

		self._machine.set_parameter(slot14, self._machine, redir_res, "var" .. tostring(slot19))
	else
		local variant, height, old_variant, old_info = nil

		if (action_type == "hurt" or action_type == "heavy_hurt") and self._ext_anim.hurt then
			for i = 1, self.hurt_anim_variants_highest_num, 1 do
				slot25 = self._machine
				slot28 = "base"
				slot24 = "var" .. i

				if self._machine.get_parameter(slot21, self._machine, self._machine.segment_state(slot24, Idstring(slot27))) then
					old_variant = i

					break
				end
			end

			if old_variant ~= nil then
				slot22 = self._machine
				slot25 = "base"
				slot22 = self._machine
				slot25 = "base"
				slot22 = self._machine
				slot25 = "base"
				slot22 = self._machine
				slot25 = "base"
				slot22 = self._machine
				slot25 = "base"
				slot22 = self._machine
				slot25 = "base"
				slot22 = self._machine
				slot25 = "base"
				slot22 = self._machine
				slot25 = "base"
				slot22 = self._machine
				slot25 = "base"
				slot21 = "hvy"
				old_info = {
					fwd = self._machine.get_parameter(slot18, self._machine, self._machine.segment_state(slot21, Idstring(slot24))),
					bwd = self._machine.get_parameter(slot18, self._machine, self._machine.segment_state("fwd", Idstring(slot24))),
					l = self._machine.get_parameter(slot18, self._machine, self._machine.segment_state("bwd", Idstring(slot24))),
					r = self._machine.get_parameter(slot18, self._machine, self._machine.segment_state("l", Idstring(slot24))),
					high = self._machine.get_parameter(slot18, self._machine, self._machine.segment_state("r", Idstring(slot24))),
					low = self._machine.get_parameter(slot18, self._machine, self._machine.segment_state("high", Idstring(slot24))),
					crh = self._machine.get_parameter(slot18, self._machine, self._machine.segment_state("low", Idstring(slot24))),
					mod = self._machine.get_parameter(slot18, self._machine, self._machine.segment_state("crh", Idstring(slot24))),
					hvy = self._machine.get_parameter(slot18, self._machine, self._machine.segment_state("mod", Idstring(slot24)))
				}
			end
		end

		slot19 = action_type
		redir_res = self._ext_movement.play_redirect(slot17, self._ext_movement)

		if not redir_res then
			slot24 = self._machine
			slot27 = "base"
			slot23 = self._unit

			debug_pause_unit(slot17, self._unit, "[CopActionHurt:init]", action_type, "redirect failed in", self._machine.segment_state(slot23, Idstring(slot26)))

			return 
		end

		if action_desc.variant == "bleeding" then
		else
			local nr_variants = self._ext_anim.base_nr_variants

			if nr_variants then
				slot19 = nr_variants
				variant = math.random(slot18)
			else
				slot20 = common_data.fwd
				local fwd_dot = action_desc.direction_vec.dot(slot18, action_desc.direction_vec)
				local right_dot = action_desc.direction_vec.dot(action_desc.direction_vec, action_desc.direction_vec)
				local dir_str = nil
				slot23 = right_dot

				if math.abs(fwd_dot) < math.abs(common_data.right) then
					if fwd_dot < 0 then
						dir_str = "fwd"
					else
						dir_str = "bwd"
					end
				elseif 0 < right_dot then
					dir_str = "l"
				else
					dir_str = "r"
				end

				slot25 = 1

				self._machine.set_parameter(slot21, self._machine, redir_res, dir_str)

				local hit_z = action_desc.hit_pos.z
				slot23 = self._ext_movement

				if self._ext_movement.m_com(self._machine).z < hit_z then
					height = "high"
				else
					height = "low"
				end

				if action_type == "death" then
					local death_type = (is_civilian and "normal") or action_desc.death_type

					if is_female then
						variant = self.death_anim_fe_variants[death_type][(crouching and "crouching") or "not_crouching"][dir_str][height]
					else
						variant = self.death_anim_variants[death_type][(crouching and "crouching") or "not_crouching"][dir_str][height]
					end

					if 1 < variant then
						slot24 = variant
						variant = math.random(slot23)
					end
				elseif action_type ~= "shield_knock" and action_type ~= "counter_tased" and action_type ~= "taser_tased" then
					if old_variant and ((old_info[dir_str] == 1 and old_info[height] == 1 and old_info.mod == 1 and action_type == "hurt") or (old_info.hvy == 1 and action_type == "heavy_hurt")) then
						variant = old_variant
					end

					if not variant then
						if action_type == "expl_hurt" then
							variant = self.hurt_anim_variants[action_type][dir_str]
						else
							variant = self.hurt_anim_variants[action_type].not_crouching[dir_str][height]
						end

						if 1 < variant then
							slot23 = variant
							variant = math.random(slot22)
						end
					end
				end
			end

			variant = variant or 1

			if variant then
				slot24 = variant
				slot22 = 1

				self._machine.set_parameter(slot18, self._machine, redir_res, "var" .. tostring(slot23))
			end

			if height then
				slot22 = 1

				self._machine.set_parameter(slot18, self._machine, redir_res, height)
			end

			if crouching then
				slot22 = 1

				self._machine.set_parameter(slot18, self._machine, redir_res, "crh")
			end

			if action_type == "hurt" then
				slot22 = 1

				self._machine.set_parameter(slot18, self._machine, redir_res, "mod")
			elseif action_type == "heavy_hurt" then
				slot22 = 1

				self._machine.set_parameter(slot18, self._machine, redir_res, "hvy")
			elseif action_type == "death" and action_desc.death_type == "heavy" and not is_civilian then
				slot22 = 1

				self._machine.set_parameter(slot18, self._machine, redir_res, "heavy")
			elseif action_type == "expl_hurt" then
				slot22 = 1

				self._machine.set_parameter(slot18, self._machine, redir_res, "expl")
			end
		end
	end

	if self._ext_anim.upper_body_active and not self._ragdolled then
		slot15 = "up_idle"

		self._ext_movement.play_redirect(slot13, self._ext_movement)
	end

	self._last_vel_z = 0
	self._hurt_type = action_type
	self._variant = action_desc.variant
	self._body_part = action_desc.body_part

	if action_type == "bleedout" then
		self.update = self._upd_bleedout
		self._shoot_t = t + 1
		slot14 = Network

		if Network.is_server(slot13) then
			slot16 = true

			self._ext_inventory.equip_selection(slot13, self._ext_inventory, 1)
		end

		local weapon_unit = self._ext_inventory.equipped_unit(slot13)
		slot15 = weapon_unit
		self._weapon_base = weapon_unit.base(self._ext_inventory)
		slot15 = weapon_unit
		slot15 = weapon_unit.base(self._ext_inventory)
		local weap_tweak = weapon_unit.base(self._ext_inventory).weapon_tweak_data(self._ext_inventory)
		local weapon_usage_tweak = common_data.char_tweak.weapon[weap_tweak.usage]
		self._weapon_unit = weapon_unit
		self._weap_tweak = weap_tweak
		self._w_usage_tweak = weapon_usage_tweak
		self._reload_speed = weapon_usage_tweak.RELOAD_SPEED
		self._spread = weapon_usage_tweak.spread
		self._falloff = weapon_usage_tweak.FALLOFF
		slot17 = "look_head"
		self._head_modifier_name = Idstring(slot16)
		slot17 = "aim_r_arm"
		self._arm_modifier_name = Idstring(slot16)
		slot18 = self._head_modifier_name
		self._head_modifier = self._machine.get_modifier(slot16, self._machine)
		slot18 = self._arm_modifier_name
		self._arm_modifier = self._machine.get_modifier(slot16, self._machine)
		slot17 = common_data.fwd
		self._aim_vec = mvector3.copy(slot16)
		self._anim = redir_res

		if not self._shoot_history then
			slot18 = 360
			self._shoot_history = {
				focus_error_roll = math.random(slot17),
				focus_start_t = t,
				focus_delay = weapon_usage_tweak.focus_delay,
				m_last_pos = common_data.pos + common_data.fwd * 500
			}
		end
	elseif action_type == "hurt_sick" or action_type == "poison_hurt" then
		self.update = self._upd_sick
	elseif action_desc.variant == "tase" then
	elseif self._ragdolled then
	else
		slot14 = self._unit

		if self._unit.anim_data(slot13).skip_force_to_graph then
			self.update = self._upd_empty
		else
			self.update = self._upd_hurt
		end
	end

	local shoot_chance = nil

	if self._ext_inventory and not self._weapon_dropped and common_data.char_tweak.shooting_death then
		slot15 = self._ext_movement

		if not self._ext_movement.cool(slot14) then
			slot15 = self._ext_movement

			if 3 < t - self._ext_movement.not_cool_t(slot14) then
				slot15 = self._ext_inventory
				local weapon_unit = self._ext_inventory.equipped_unit(slot14)

				if weapon_unit then
					if action_type == "counter_tased" or action_type == "taser_tased" then
						slot16 = weapon_unit
						slot16 = weapon_unit.base(slot15)

						weapon_unit.base(slot15).on_reload(slot15)

						shoot_chance = 1
					elseif action_type == "death" or action_type == "hurt" or action_type == "heavy_hurt" then
						shoot_chance = 0.1
					end
				end
			end
		end
	end

	if shoot_chance then
		slot15 = self._ext_inventory
		local equipped_weapon = self._ext_inventory.equipped_unit(slot14)

		if equipped_weapon then
			slot16 = equipped_weapon
		end
	end

	slot15 = self._unit

	if not self._unit.base(slot14).nick_name then
		if action_desc.variant == "fire" then
			if tweak_table ~= "tank" and tweak_table ~= "tank_hw" and tweak_table ~= "shield" then
				if action_desc.hurt_type == "fire_hurt" then
					slot15 = self._unit
					slot18 = true

					self._unit.sound(slot14).say(slot14, self._unit.sound(slot14), "burnhurt", true)
				elseif action_desc.hurt_type == "death" then
					slot15 = self._unit
					slot18 = true

					self._unit.sound(slot14).say(slot14, self._unit.sound(slot14), "burndeath", true)
				end
			end
		elseif action_type == "death" then
			slot15 = managers.groupai
			slot15 = managers.groupai.state(slot14)

			if not managers.groupai.state(slot14).is_police_called(slot14) then
				slot15 = self._unit
				slot16 = "death_stealth"
				slot13 = self._unit.sound(slot14).say(slot14, self._unit.sound(slot14))
			else
				slot15 = self._unit
				slot16 = "death"

				self._unit.sound(slot14).say(slot14, self._unit.sound(slot14))
			end
		elseif action_type == "counter_tased" or action_type == "taser_tased" then
			slot15 = self._unit
			slot16 = "tasered"

			self._unit.sound(slot14).say(slot14, self._unit.sound(slot14))
		else
			slot15 = self._unit
			slot16 = "hurt"

			self._unit.sound(slot14).say(slot14, self._unit.sound(slot14))
		end

		if (tweak_table == "tank" or tweak_table == "tank_hw") and action_type == "death" then
			local unit_id = self._unit.id(slot14)
			slot17 = unit_id

			managers.fire.remove_dead_dozer_from_overgrill(self._unit, managers.fire)
		end

		slot15 = Network

		if Network.is_server(slot14) then
			local radius, filter_name = nil
			slot17 = managers.groupai
			slot17 = managers.groupai.state(slot16)
			local default_radius = (managers.groupai.state(slot16).whisper_mode(slot16) and tweak_data.upgrades.cop_hurt_alert_radius_whisper) or tweak_data.upgrades.cop_hurt_alert_radius

			if action_desc.attacker_unit then
				slot18 = action_desc.attacker_unit
			elseif action_desc.attacker_unit then
				slot18 = action_desc.attacker_unit

				if action_desc.attacker_unit.base(slot17).is_local_player then
					slot21 = default_radius
					radius = managers.player.upgrade_value(slot17, managers.player, "player", "silent_kill")
				end
			end

			local radius = 25
			local new_alert = {
				"vo_distress"
			}
			slot20 = common_data.ext_movement
			new_alert[2] = common_data.ext_movement.m_head_pos(slot19)
			new_alert[3] = radius or default_radius
			slot20 = self._unit
			slot20 = self._unit.brain(slot19)
			new_alert[4] = self._unit.brain(slot19).SO_access(slot19)
			new_alert[5] = self._unit
			slot20 = managers.groupai
			slot21 = new_alert

			managers.groupai.state(slot19).propagate_alert(slot19, managers.groupai.state(slot19))
		end
	end

	if action_type == "death" or action_type == "bleedout" or action_desc.variant == "tased" or action_type == "fatal" then
		slot18 = common_data.right
		self._floor_normal = self._get_floor_normal(slot14, self, common_data.pos, common_data.fwd)
	end

	slot16 = action_desc.blocks

	CopActionAct._create_blocks_table("_create_blocks_table", self)

	slot15 = self._ext_movement

	self._ext_movement.enable_update("_create_blocks_table")

	if self._body_part == 1 or self._body_part == 2 then
		slot15 = Network

		if Network.is_server(slot14) then
			slot15 = self._unit
			slot16 = "stand"
			local stand_rsrv = self._unit.brain(slot14).get_pos_rsrv(slot14, self._unit.brain(slot14))
		end
	end

	return true
end
function CopActionHurt:_start_fire_animation(redir_res, action_type, t, action_desc, common_data)
	return 
end
function CopActionHurt:_start_enemy_fire_animation(action_type, t, use_animation_on_fire_damage, action_desc, common_data)
	return 
end
function CopActionHurt:_start_enemy_fire_effect_on_death(death_variant)
	local enemy_effect_name = ""
	local anim_duration = 3

	if death_variant == 1 then
		slot6 = "effects/vanilla/fire/fire_character_burning_001_9s"
		enemy_effect_name = Idstring(slot5)
		anim_duration = 9
	elseif death_variant == 2 then
		slot6 = "effects/vanilla/fire/fire_character_burning_001_5s"
		enemy_effect_name = Idstring(slot5)
		anim_duration = 5
	elseif death_variant == 3 then
		slot6 = "effects/vanilla/fire/fire_character_burning_001_5s"
		enemy_effect_name = Idstring(slot5)
		anim_duration = 5
	elseif death_variant == 4 then
		slot6 = "effects/vanilla/fire/fire_character_burning_001_7s"
		enemy_effect_name = Idstring(slot5)
		anim_duration = 7
	elseif death_variant == 5 then
		slot6 = "effects/vanilla/fire/fire_character_burning_001"
		enemy_effect_name = Idstring(slot5)
	else
		slot6 = "effects/vanilla/fire/fire_character_burning_001"
		enemy_effect_name = Idstring(slot5)
	end

	managers.fire.start_burn_body_sound(slot5, managers.fire, {
		enemy_unit = self._unit
	})

	local bone_spine = self._unit.get_object(slot5, Idstring(anim_duration))
	local bone_left_arm = self._unit.get_object(self._unit, Idstring("Spine"))
	local bone_right_arm = self._unit.get_object(self._unit, Idstring("LeftArm"))
	local bone_left_leg = self._unit.get_object(self._unit, Idstring("RightArm"))
	slot10 = self._unit
	slot13 = "RightLeg"
	local bone_right_leg = self._unit.get_object(self._unit, Idstring("LeftLeg"))

	if bone_spine then
		slot11 = World
		slot12 = {
			effect = enemy_effect_name,
			parent = bone_spine
		}

		World.effect_manager(slot10).spawn(slot10, World.effect_manager(slot10))
	end

	if bone_left_arm then
		slot11 = World
		slot12 = {
			effect = enemy_effect_name,
			parent = bone_left_arm
		}

		World.effect_manager(slot10).spawn(slot10, World.effect_manager(slot10))
	end

	if bone_right_arm then
		slot11 = World
		slot12 = {
			effect = enemy_effect_name,
			parent = bone_right_arm
		}

		World.effect_manager(slot10).spawn(slot10, World.effect_manager(slot10))
	end

	if bone_left_leg then
		slot11 = World
		slot12 = {
			effect = enemy_effect_name,
			parent = bone_left_leg
		}

		World.effect_manager(slot10).spawn(slot10, World.effect_manager(slot10))
	end

	if bone_right_leg then
		slot11 = World
		slot12 = {
			effect = enemy_effect_name,
			parent = bone_right_leg
		}

		World.effect_manager(slot10).spawn(slot10, World.effect_manager(slot10))
	end

	return 
end
function CopActionHurt:_dragons_breath_sparks()
	local enemy_effect_name = Idstring(slot2)
	slot4 = self._unit
	slot7 = "Spine"
	local bone_spine = self._unit.get_object("removed during cleanup", Idstring(slot6))

	if bone_spine then
		slot5 = World
		slot6 = {
			effect = enemy_effect_name,
			parent = bone_spine
		}

		World.effect_manager(slot4).spawn(slot4, World.effect_manager(slot4))
	end

	return 
end
function CopActionHurt:_get_floor_normal(at_pos, fwd, right)
	local padding_height = 150
	local center_pos = at_pos + math.UP
	slot9 = center_pos.z + padding_height

	mvec3_set_z(slot7, center_pos)

	local fall = 100
	slot11 = -fall - padding_height
	local down_vec = Vector3(center_pos, 0, 0)
	local dis = 50
	local fwd_pos, bwd_pos, r_pos, l_pos = nil
	local from_pos = fwd * dis
	slot17 = center_pos

	mvec3_add(slot15, from_pos)

	local to_pos = from_pos + down_vec
	slot22 = 1
	local down_ray = World.raycast(from_pos, World, "ray", from_pos, to_pos, "slot_mask")

	if down_ray then
		fwd_pos = down_ray.position
	else
		slot19 = at_pos.z
		fwd_pos = to_pos.with_z(slot17, to_pos)
	end

	slot19 = fwd

	mvec3_set(slot17, from_pos)

	slot19 = -dis

	mvec3_mul(slot17, from_pos)

	slot19 = center_pos

	mvec3_add(slot17, from_pos)

	slot19 = from_pos

	mvec3_set(slot17, to_pos)

	slot19 = down_vec

	mvec3_add(slot17, to_pos)

	slot23 = 1
	down_ray = World.raycast(slot17, World, "ray", from_pos, to_pos, "slot_mask")

	if down_ray then
		bwd_pos = down_ray.position
	else
		slot19 = at_pos.z
		bwd_pos = to_pos.with_z(slot17, to_pos)
	end

	slot19 = right

	mvec3_set(slot17, from_pos)

	slot19 = dis

	mvec3_mul(slot17, from_pos)

	slot19 = center_pos

	mvec3_add(slot17, from_pos)

	slot19 = from_pos

	mvec3_set(slot17, to_pos)

	slot19 = down_vec

	mvec3_add(slot17, to_pos)

	slot23 = 1
	down_ray = World.raycast(slot17, World, "ray", from_pos, to_pos, "slot_mask")

	if down_ray then
		r_pos = down_ray.position
	else
		slot19 = at_pos.z
		r_pos = to_pos.with_z(slot17, to_pos)
	end

	slot19 = right

	mvec3_set(slot17, from_pos)

	slot19 = -dis

	mvec3_mul(slot17, from_pos)

	slot19 = center_pos

	mvec3_add(slot17, from_pos)

	slot19 = from_pos

	mvec3_set(slot17, to_pos)

	slot19 = down_vec

	mvec3_add(slot17, to_pos)

	slot23 = 1
	down_ray = World.raycast(slot17, World, "ray", from_pos, to_pos, "slot_mask")

	if down_ray then
		l_pos = down_ray.position
	else
		l_pos = to_pos
		slot19 = at_pos.z

		mvec3_set_z(slot17, l_pos)
	end

	local pose_fwd = fwd_pos
	slot20 = bwd_pos

	mvec3_sub(slot18, pose_fwd)

	local pose_l = l_pos
	slot21 = r_pos

	mvec3_sub(pose_fwd, pose_l)

	slot21 = pose_l
	local ground_normal = pose_fwd.cross(pose_fwd, pose_fwd)
	slot21 = ground_normal

	mvec3_norm(pose_fwd)

	return ground_normal
end
function CopActionHurt:on_exit()
	if self._shooting_hurt then
		self._shooting_hurt = false
		slot3 = self._weapon_unit
		slot3 = self._weapon_unit.base(slot2)

		self._weapon_unit.base(slot2).stop_autofire(slot2)
	end

	if self._delayed_shooting_hurt_clbk_id then
		slot4 = self._delayed_shooting_hurt_clbk_id

		managers.enemy.remove_delayed_clbk(slot2, managers.enemy)

		self._delayed_shooting_hurt_clbk_id = nil
	end

	if self._friendly_fire then
		slot3 = self._unit
		slot4 = false

		self._unit.movement(slot2).set_friendly_fire(slot2, self._unit.movement(slot2))

		self._friendly_fire = nil
	end

	if self._modifier_on then
		slot4 = self._head_modifier_name

		self._machine.allow_modifier(slot2, self._machine)

		slot4 = self._arm_modifier_name

		self._machine.allow_modifier(slot2, self._machine)
	end

	if self._expired then
		slot3 = self

		CopActionWalk._chk_correct_pose(slot2)
	end

	if not self._expired then
		slot3 = Network

		if Network.is_server(slot2) then
			if self._hurt_type == "bleedout" or self._hurt_type == "fatal" or self._variant == "tase" then
				slot3 = self._unit
				slot4 = "action_hurt_end"

				self._unit.network(slot2).send(slot2, self._unit.network(slot2))
			end

			if self._hurt_type == "bleedout" or self._hurt_type == "fatal" then
				slot5 = true

				self._ext_inventory.equip_selection(slot2, self._ext_inventory, 2)
			end
		end
	end

	if self._hurt_type ~= "fatal" and self._variant == "tase" then
	end

	return 
end
function CopActionHurt:_get_pos_clamped_to_graph(test_head)
	local tracker = self._ext_movement.nav_tracker(slot3)
	slot5 = tracker
	local r = tracker.field_position(self._ext_movement)
	local new_pos = tmp_vec1
	slot7 = new_pos
	slot10 = self._unit

	mvec3_set(slot6, self._unit.get_animation_delta_position(slot9))

	slot8 = 0

	mvec3_set_z(slot6, new_pos)

	slot8 = r

	mvec3_add(slot6, new_pos)

	local ray_params = nil

	if test_head then
		local h = tmp_vec2
		slot9 = h
		slot12 = self._common_data.ext_movement._obj_head

		mvec3_set(slot8, self._common_data.ext_movement._obj_head.position(slot11))

		slot10 = new_pos.z

		mvec3_set_z(slot8, h)

		ray_params = {
			trace = true,
			tracker_from = tracker,
			pos_to = h
		}
		slot10 = ray_params
		local hit = managers.navigation.raycast(slot8, managers.navigation)
		local nh = ray_params.trace[1]
		local collision_side = ray_params.trace[2]

		if hit and collision_side then
			slot13 = managers.navigation._dir_str_to_vec[collision_side]

			mvec3_set(slot11, tmp_vec3)

			slot13 = nh

			mvec3_sub(slot11, h)

			slot13 = 0

			mvec3_set_z(slot11, h)

			slot13 = h
			local error_amount = -mvec3_dot(slot11, tmp_vec3)
			slot14 = error_amount

			mvec3_mul(tmp_vec3, tmp_vec3)

			slot14 = tmp_vec3

			mvector3.add(tmp_vec3, new_pos)
		end
	else
		ray_params = {
			tracker_from = tracker
		}
	end

	ray_params.pos_to = new_pos
	ray_params.trace = true
	slot9 = ray_params

	managers.navigation.raycast(slot7, managers.navigation)

	slot9 = ray_params.trace[1]

	mvector3.set(slot7, new_pos)

	return new_pos
end
function CopActionHurt:_upd_empty(t)
	return 
end
function CopActionHurt:_upd_sick(t)
	if not self._sick_time or self._sick_time < t then
		self._expired = true
	end

	return 
end
function CopActionHurt:_upd_tased(t)
	if not self._tased_time or self._tased_time < t then
		if self._tased_down_time and t < self._tased_down_time then
			slot5 = "fatal"
			local redir_res = self._ext_movement.play_redirect(slot3, self._ext_movement)

			if not redir_res then
				slot5 = "[CopActionHurt:init] fatal redirect failed in"
				slot8 = self._machine
				slot11 = "base"

				debug_pause(slot4, self._machine.segment_state(slot7, Idstring(slot10)))
			end

			self.update = self._upd_tased_down
		else
			self._expired = true
		end
	end

	return 
end
function CopActionHurt:_upd_tased_down(t)
	if not self._tased_down_time or self._tased_down_time < t then
		self._expired = true
	end

	return 
end
function CopActionHurt:_upd_hurt(t)
	slot4 = TimerManager
	slot4 = TimerManager.game(slot3)
	local dt = TimerManager.game(slot3).delta_time(slot3)

	if self._ext_anim.hurt or self._ext_anim.death then
		if self._shooting_hurt then
			local weap_unit = self._weapon_unit
			local weap_unit_base = weap_unit.base(slot5)
			local shoot_from_pos = weap_unit.position(weap_unit)
			slot8 = weap_unit
			local shoot_fwd = weap_unit.rotation(weap_unit).y(weap_unit)
			slot12 = 3

			weap_unit_base.trigger_held(weap_unit.rotation(weap_unit), weap_unit_base, shoot_from_pos, shoot_fwd)

			if weap_unit_base.clip_empty then
				slot9 = weap_unit_base

				if weap_unit_base.clip_empty(slot8) then
					self._shooting_hurt = false
					slot9 = weap_unit_base

					weap_unit_base.stop_autofire(slot8)
				end
			end
		end

		slot6 = true
		self._last_pos = self._get_pos_clamped_to_graph(slot4, self)
		slot6 = dt

		CopActionWalk._set_new_pos(slot4, self)

		local new_rot = self._unit.get_animation_delta_rotation(slot4)
		new_rot = self._common_data.rot * new_rot
		slot9 = new_rot
		slot9 = 0

		mrotation.set_yaw_pitch_roll(self._unit, new_rot, new_rot.yaw(slot8), 0)

		if self._ext_anim.death then
			slot8 = self._machine
			slot11 = "base"
			slot8 = 1
			local rel_prog = math.clamp(slot5, self._machine.segment_relative_time(slot7, Idstring(slot10)), 0)

			if self._floor_normal == nil then
				slot9 = 1
				self._floor_normal = Vector3(slot6, 0, 0)
			end

			slot9 = rel_prog
			local normal = math.lerp(slot6, math.UP, self._floor_normal)
			local fwd = new_rot.y(math.UP)
			slot11 = normal

			mvec3_cross(new_rot, tmp_vec1, fwd)

			slot11 = tmp_vec1

			mvec3_cross(new_rot, fwd, normal)

			slot10 = normal
			new_rot = Rotation(new_rot, fwd)
		end

		slot7 = new_rot

		self._ext_movement.set_rotation(slot5, self._ext_movement)
	else
		if self._shooting_hurt then
			self._shooting_hurt = false
			slot5 = self._weapon_unit
			slot5 = self._weapon_unit.base(slot4)

			self._weapon_unit.base(slot4).stop_autofire(slot4)
		end

		if self._hurt_type == "death" then
			self._died = true
		else
			self._expired = true
		end
	end

	return 
end
function CopActionHurt:_upd_bleedout(t)
	if self._floor_normal then
		local normal = nil

		if self._ext_anim.bleedout_enter then
			slot8 = "base"
			local rel_t = self._machine.segment_relative_time(slot4, Idstring(slot7))
			slot7 = rel_t + 0.5
			rel_t = math.min(self._machine, 1)
			slot8 = 1
			local rel_prog = math.clamp(self._machine, rel_t, 0)
			slot9 = rel_prog
			normal = math.lerp(rel_t, math.UP, self._floor_normal)
			slot8 = self._common_data.pos

			self._ext_movement.set_m_pos(rel_t, self._ext_movement)
		else
			normal = self._floor_normal
			self._floor_normal = nil
		end

		slot7 = normal

		mvec3_cross(slot4, tmp_vec1, self._common_data.fwd)

		slot7 = tmp_vec1

		mvec3_cross(slot4, tmp_vec2, normal)

		slot6 = normal
		local new_rot = Rotation(slot4, tmp_vec2)
		slot7 = new_rot

		self._ext_movement.set_rotation(tmp_vec2, self._ext_movement)
	end

	if not self._ext_anim.bleedout_enter and self._weapon_unit then
		if self._attention and not self._ext_anim.reload and not self._ext_anim.equip then
			local autotarget, target_pos = nil

			if self._attention.handler then
				slot6 = self._attention.handler
				target_pos = self._attention.handler.get_attention_m_pos(slot5)
			elseif self._attention.unit then
				target_pos = tmp_vec1
				slot6 = self._attention.unit
				slot7 = target_pos

				self._attention.unit.character_damage(slot5).shoot_pos_mid(slot5, self._attention.unit.character_damage(slot5))
			else
				target_pos = self._attention.pos
			end

			slot6 = self._ext_movement
			local shoot_from_pos = self._ext_movement.m_head_pos(slot5)
			local target_vec = target_pos - shoot_from_pos
			slot8 = target_vec
			local target_dis = mvec3_norm(slot7)

			if not self._modifier_on then
				self._modifier_on = true
				slot10 = self._head_modifier_name

				self._machine.force_modifier(slot8, self._machine)

				slot10 = self._arm_modifier_name

				self._machine.force_modifier(slot8, self._machine)
			end

			if self._look_dir then
				slot10 = target_vec
				local angle_diff = self._look_dir.angle(slot8, self._look_dir)
				slot13 = 1
				slot11 = 0.5
				local rot_speed_rel = math.pow(self._look_dir, math.min(slot11, angle_diff / 90))
				slot13 = rot_speed_rel
				local rot_speed = math.lerp(math.min(slot11, angle_diff / 90), 40, 360)
				local dt = t - self._bleedout_look_t
				slot14 = angle_diff
				local rot_amount = math.min(360, rot_speed * dt)
				slot15 = target_vec
				local diff_axis = self._look_dir.cross(rot_speed * dt, self._look_dir)
				slot16 = rot_amount
				local rot = Rotation(self._look_dir, diff_axis)
				slot17 = rot
				self._look_dir = self._look_dir.rotate_with(diff_axis, self._look_dir)
				slot16 = self._look_dir

				mvector3.normalize(diff_axis)
			else
				self._look_dir = target_vec
			end

			self._bleedout_look_t = t
			slot10 = self._look_dir

			self._head_modifier.set_target_z(slot8, self._head_modifier)

			slot10 = self._look_dir

			self._arm_modifier.set_target_y(slot8, self._arm_modifier)

			slot11 = math.UP
			local aim_polar = self._look_dir.to_polar_with_reference(slot8, self._look_dir, self._common_data.fwd)
			local aim_spin_d90 = aim_polar.spin / 90
			slot14 = "base"
			local anim = self._machine.segment_state(self._common_data.fwd, Idstring(slot13))
			slot14 = aim_spin_d90
			slot12 = math.abs(slot13)
			slot14 = 1
			local fwd = 1 - math.clamp(self._machine, slot12, 0)
			slot16 = fwd

			self._machine.set_parameter(slot12, self._machine, anim, "angle0")

			slot15 = aim_spin_d90
			slot13 = math.abs(anim)
			slot15 = 2
			local bwd = math.clamp(slot12, slot13, 1) - 1
			slot17 = bwd

			self._machine.set_parameter(slot13, self._machine, anim, "angle180")

			slot16 = aim_spin_d90 - 1
			slot14 = math.abs(anim)
			slot16 = 1
			local l = 1 - math.clamp(slot13, slot14, 0)
			slot18 = l

			self._machine.set_parameter(slot14, self._machine, anim, "angle90neg")

			slot17 = aim_spin_d90 + 1
			slot17 = 1
			local r = 1 - math.clamp(slot14, math.abs(anim), 0)
			slot19 = r

			self._machine.set_parameter(math.abs(anim), self._machine, anim, "angle90")

			if self._shoot_t < t then
				slot16 = self._weapon_unit
				slot16 = self._weapon_unit.base(slot15)

				if self._weapon_unit.base(slot15).clip_empty(slot15) then
					slot16 = self
					local res = CopActionReload._play_reload(slot15)

					if res then
						slot19 = self._reload_speed

						self._machine.set_speed(slot16, self._machine, res)
					end
				elseif self._common_data.allow_fire then
					slot18 = self._falloff
					local falloff, i_range = CopActionShoot._get_shoot_falloff(slot15, self, target_dis)
					local spread = self._spread

					if autotarget then
						if new_target_pos then
							target_pos = new_target_pos
						else
							slot21 = spread
							spread = math.min(slot19, 20)
						end
					end

					local spread_pos = tmp_vec2
					slot21 = target_vec

					mvec3_rand_orth(slot19, spread_pos)

					slot21 = spread

					mvec3_set_l(slot19, spread_pos)

					slot21 = target_pos

					mvec3_add(slot19, spread_pos)

					slot22 = spread_pos
					target_dis = mvec3_dir(slot19, target_vec, shoot_from_pos)
					slot23 = i_range
					local damage_multiplier = CopActionShoot._get_shoot_falloff_damage(slot19, self, self._falloff, target_dis)
					slot24 = damage_multiplier

					self._weapon_base.singleshot(self, self._weapon_base, shoot_from_pos, target_vec)

					local rand = math.random()
					slot24 = rand
					self._shoot_t = t + math.lerp(self._weapon_base, falloff.recoil[1], falloff.recoil[2])
				end
			end
		elseif self._modifier_on then
			self._modifier_on = false
			slot5 = self._head_modifier_name

			self._machine.allow_modifier(slot3, self._machine)

			slot5 = self._arm_modifier_name

			self._machine.allow_modifier(slot3, self._machine)
		end
	end

	return 
end
function CopActionHurt:_upd_ragdolled(t)

	-- Decompilation error in this vicinity:
	slot4 = TimerManager
	slot4 = TimerManager.game(slot3)
	local dt = TimerManager.game(slot3).delta_time(slot3)

	if self._shooting_hurt then
		local weap_unit = self._weapon_unit
		local weap_unit_base = weap_unit.base(slot5)
		local shoot_from_pos = weap_unit.position(weap_unit)
		slot8 = weap_unit
		local shoot_fwd = weap_unit.rotation(weap_unit).y(weap_unit)
		slot12 = 3

		weap_unit_base.trigger_held(weap_unit.rotation(weap_unit), weap_unit_base, shoot_from_pos, shoot_fwd)

		if weap_unit_base.clip_empty then
			slot9 = weap_unit_base

			if weap_unit_base.clip_empty(slot8) then
				self._shooting_hurt = false
				slot9 = weap_unit_base

				weap_unit_base.stop_autofire(slot8)
			end
		end
	end

	if self._ragdoll_active then
		slot6 = tmp_vec1

		self._hips_obj.m_position(slot4, self._hips_obj)

		slot6 = tmp_vec1

		self._ext_movement.set_position(slot4, self._ext_movement)
	end

	if not self._ragdoll_freeze_clbk_id and not self._shooting_hurt then
		self._died = true
	end

	return 
end
function CopActionHurt:type()
	return "hurt"
end
function CopActionHurt:hurt_type()
	return self._hurt_type
end
function CopActionHurt:expired()
	return self._expired
end
function CopActionHurt:chk_block(action_type, t)
	slot7 = t

	if CopActionAct.chk_block(slot4, self, action_type) then
		return true
	elseif action_type == "death" then
	elseif (action_type == "hurt" or action_type == "heavy_hurt" or action_type == "hurt_sick" or action_type == "poison_hurt") and not self._ext_anim.hurt_exit then
		return true
	end

	return 
end
function CopActionHurt:on_attention(attention)
	self._attention = attention

	return 
end
function CopActionHurt:on_death_exit()
	if self._shooting_hurt then
		self._shooting_hurt = false
		slot3 = self._weapon_unit
		slot3 = self._weapon_unit.base(slot2)

		self._weapon_unit.base(slot2).stop_autofire(slot2)
	end

	if not self._ragdolled then
		slot4 = false

		self._unit.set_animations_enabled(slot2, self._unit)
	end

	return 
end
function CopActionHurt:on_death_drop(unit, stage)
	if self._weapon_dropped then
		return 
	end

	if self._delayed_shooting_hurt_clbk_id then
		slot6 = self._delayed_shooting_hurt_clbk_id

		managers.enemy.remove_delayed_clbk(slot4, managers.enemy)

		self._delayed_shooting_hurt_clbk_id = nil
	end

	if self._shooting_hurt then
		if stage == 2 then
			slot5 = self._weapon_unit
			slot5 = self._weapon_unit.base(slot4)

			self._weapon_unit.base(slot4).stop_autofire(slot4)

			slot5 = self._ext_inventory

			self._ext_inventory.drop_weapon(slot4)

			self._weapon_dropped = true
			self._shooting_hurt = false
		end
	elseif self._ext_inventory then
		slot5 = self._ext_inventory

		self._ext_inventory.drop_weapon(slot4)

		self._weapon_dropped = true
	end

	return 
end
function CopActionHurt:body_part()
	return self._body_part
end
function CopActionHurt:need_upd()
	if self._died then
		return false
	else
		return true
	end

	return 
end
function CopActionHurt:on_inventory_event(event)
	slot4 = self._ext_inventory
	local weapon_unit = self._ext_inventory.equipped_unit(slot3)

	if weapon_unit then
		slot5 = weapon_unit
		slot5 = weapon_unit.base(slot4)
		local weap_tweak = weapon_unit.base(slot4).weapon_tweak_data(slot4)
		local weapon_usage_tweak = self._common_data.char_tweak.weapon[weap_tweak.usage]
		self._weapon_unit = weapon_unit
		slot7 = weapon_unit
		self._weapon_base = weapon_unit.base(slot6)
		self._weap_tweak = weap_tweak
		self._w_usage_tweak = weapon_usage_tweak
		self._reload_speed = weapon_usage_tweak.RELOAD_SPEED
		self._spread = weapon_usage_tweak.spread
		self._falloff = weapon_usage_tweak.FALLOFF
		self._automatic_weap = weap_tweak.auto and true
	else
		self._weapon_unit = false
		self._shooting_hurt = false
	end

	return 
end
function CopActionHurt:save(save_data)
	slot4 = self._action_desc

	for i, k in pairs(slot3) do

		-- Decompilation error in this vicinity:
		slot9 = k
	end

	return 
end
function CopActionHurt:_start_ragdoll()
	if self._ragdolled then
		return true
	end

	slot3 = self._unit

	if self._unit.damage(slot2) then
		slot3 = self._unit
		slot4 = "switch_to_ragdoll"

		if self._unit.damage(slot2).has_sequence(slot2, self._unit.damage(slot2)) then
			slot5 = 2

			self.on_death_drop(slot2, self, self._unit)

			self._ragdolled = true
			slot3 = self._unit
			slot4 = 1

			self._unit.base(slot2).set_visibility_state(slot2, self._unit.base(slot2))

			slot4 = "orientation_object"

			self._unit.set_driving(slot2, self._unit)

			slot3 = self._unit
			slot4 = false

			self._unit.anim_state_machine(slot2).set_enabled(slot2, self._unit.anim_state_machine(slot2))

			slot4 = false

			self._unit.set_animations_enabled(slot2, self._unit)

			slot3 = self._unit
			slot4 = "switch_to_ragdoll"
			local res = self._unit.damage(slot2).run_sequence_simple(slot2, self._unit.damage(slot2))
			slot4 = self._unit
			slot9 = "clbk_body_active_state"

			self._unit.add_body_activation_callback(self._unit.damage(slot2), callback(slot6, self, self))

			self._root_act_tags = {}
			slot5 = "rag_Hips"
			local hips_body = self._unit.body(self._unit.damage(slot2), self._unit)
			local tag = hips_body.activate_tag(self._unit)
			slot6 = ""

			if tag == Idstring(hips_body) then
				slot6 = "root_follow"
				tag = Idstring(slot5)
				slot7 = tag

				hips_body.set_activate_tag(slot5, hips_body)
			end

			slot7 = tag
			slot5 = tag.key(slot6)
			self._root_act_tags[slot5] = true
			slot6 = hips_body
			tag = hips_body.deactivate_tag(slot5)
			slot6 = ""

			if tag == Idstring(slot5) then
				slot6 = "root_follow"
				tag = Idstring(slot5)
				slot7 = tag

				hips_body.set_deactivate_tag(slot5, hips_body)
			end

			slot7 = tag
			slot5 = tag.key(slot6)
			self._root_act_tags[slot5] = true
			slot6 = self._unit
			self._hips_obj = self._unit.get_object(slot5, Idstring(slot8))
			self._ragdoll_active = true
			slot6 = self._ext_movement

			self._ext_movement.enable_update(slot5)

			slot6 = self._hips_obj
			local hips_pos = self._hips_obj.position(slot5)
			self._rag_pos = hips_pos
			slot6 = tostring(self._unit.key("Hips"))
			self._ragdoll_freeze_clbk_id = "freeze_rag" .. slot6
			slot13 = "clbk_chk_freeze_ragdoll"
			slot12 = TimerManager
			slot12 = TimerManager.game(self)
			slot10 = TimerManager.game(self).time(self) + 3

			managers.enemy.add_delayed_clbk(slot6, managers.enemy, self._ragdoll_freeze_clbk_id, callback(self._unit, self, self))

			slot7 = self._unit

			if self._unit.anim_data(slot6).repel_loop then
				slot7 = self._unit
				slot9 = "repel_end"

				self._unit.sound(slot6).anim_clbk_play_sound(slot6, self._unit.sound(slot6), self._unit)
			end

			return true
		end
	end

	return 
end
function CopActionHurt:force_ragdoll()
	slot3 = self

	if self._start_ragdoll(slot2) then
		self.update = self._upd_ragdolled
		slot3 = self._ext_movement

		self._ext_movement.enable_update(slot2)
	end

	return 
end
function CopActionHurt:clbk_body_active_state(tag, unit, body, activated)
	slot8 = tag

	if self._root_act_tags[tag.key(slot7)] then
		if activated then
			self._died = false
			self._ragdoll_active = true
			slot7 = self._ext_movement

			self._ext_movement.enable_update(slot6)
		else
			self._ragdoll_active = false

			if not self._shooting_hurt then
				self._died = true
			end
		end
	end

	return 
end
CopActionHurt._apply_freefall = CopActionWalk._apply_freefall
function CopActionHurt:_freeze_ragdoll()
	self._root_act_tags = {}
	slot3 = self._unit

	if self._unit.damage(slot2) then
		slot3 = self._unit
		slot4 = "freeze_ragdoll"

		if self._unit.damage(slot2).has_sequence(slot2, self._unit.damage(slot2)) then
			slot3 = self._unit
			slot4 = "freeze_ragdoll"

			self._unit.damage(slot2).run_sequence_simple(slot2, self._unit.damage(slot2))
		end
	end

	return 
end
function CopActionHurt:clbk_chk_freeze_ragdoll()
	slot3 = self._unit

	if not alive(slot2) then
		self._ragdoll_freeze_clbk_id = nil

		return 
	end

	slot3 = TimerManager
	local t = TimerManager.game(slot2).time(slot2)
	slot5 = tmp_vec1

	self._hips_obj.m_position(TimerManager.game(slot2), self._hips_obj)

	slot5 = tmp_vec1
	local cur_dis = mvec3_dis(TimerManager.game(slot2), self._rag_pos)

	if cur_dis < 30 then
		slot5 = self

		self._freeze_ragdoll(slot4)

		self._ragdoll_freeze_clbk_id = nil
	else
		slot6 = tmp_vec1

		mvec3_set(slot4, self._rag_pos)

		slot11 = "clbk_chk_freeze_ragdoll"
		slot8 = t + 1.5

		managers.enemy.add_delayed_clbk(slot4, managers.enemy, self._ragdoll_freeze_clbk_id, callback(slot8, self, self))
	end

	return 
end
function CopActionHurt:clbk_shooting_hurt()
	self._delayed_shooting_hurt_clbk_id = nil
	slot3 = self._weapon_unit

	if not alive(slot2) then
		return 
	end

	slot3 = self._weapon_unit
	slot6 = "fire"
	local fire_obj = self._weapon_unit.get_object(slot2, Idstring(slot5))

	if fire_obj then
		slot4 = self._weapon_unit
		slot8 = fire_obj

		self._weapon_unit.base(slot3).singleshot(slot3, self._weapon_unit.base(slot3), fire_obj.position(slot6), fire_obj.rotation(fire_obj), 1, false, nil, nil, nil)
	end

	return 
end
function CopActionHurt:on_destroy()
	if self._shooting_hurt then
		self._shooting_hurt = false
		slot3 = self._weapon_unit

		if alive(slot2) then
			slot3 = self._weapon_unit
			slot3 = self._weapon_unit.base(slot2)

			self._weapon_unit.base(slot2).stop_autofire(slot2)
		end
	end

	if self._delayed_shooting_hurt_clbk_id then
		slot4 = self._delayed_shooting_hurt_clbk_id

		managers.enemy.remove_delayed_clbk(slot2, managers.enemy)

		self._delayed_shooting_hurt_clbk_id = nil
	end

	return 
end

return 
