-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
local ids_lod = Idstring(slot1)
local ids_lod1 = Idstring("lod")
slot4 = "ik_aim"
local ids_ik_aim = Idstring("lod1")

if not CopBase then
	slot5 = UnitBase
	slot3 = class(slot4)
end

CopBase = slot3
CopBase._anim_lods = {
	{
		2,
		500,
		100,
		5000
	},
	{
		2,
		0,
		100,
		1
	},
	{
		3,
		0,
		100,
		1
	}
}
CopBase._material_translation_map = {}
local character_path = ""
local char_map = tweak_data.character.character_map()
slot7 = char_map

for _, data in pairs(slot6) do
	slot12 = data.list

	for _, character in ipairs(slot11) do
		character_path = data.path .. character .. "/" .. character
		slot20 = character_path
		slot20 = Idstring(slot19)
		CopBase._material_translation_map[tostring(Idstring(slot19).key(slot19))] = Idstring(Idstring(slot19).key)
		slot20 = character_path .. "_contour"
		slot20 = Idstring(character_path .. "_contour")
		slot19 = character_path
		CopBase._material_translation_map[tostring(Idstring(character_path .. "_contour").key(character_path .. "_contour"))] = Idstring(Idstring(character_path .. "_contour").key)
	end
end

function CopBase:init(unit)
	slot6 = false

	UnitBase.init(slot3, self, unit)

	self._char_tweak = tweak_data.character[self._tweak_table]
	self._unit = unit
	self._visibility_state = true
	self._foot_obj_map = {}
	slot5 = self._unit
	slot8 = "RightToeBase"
	self._foot_obj_map.right = self._unit.get_object(self, Idstring(slot7))
	slot5 = self._unit
	slot8 = "LeftToeBase"
	self._foot_obj_map.left = self._unit.get_object(self, Idstring(slot7))
	self._is_in_original_material = true

	return 
end
function CopBase:post_init()
	slot3 = self._unit
	self._ext_movement = self._unit.movement(slot2)
	slot3 = self._unit
	self._ext_anim = self._unit.anim_data(slot2)
	slot4 = 1

	self.set_anim_lod(slot2, self)

	self._lod_stage = 1
	slot4 = true

	self._ext_movement.post_init(slot2, self._ext_movement)

	slot3 = self._unit
	slot3 = self._unit.brain(slot2)

	self._unit.brain(slot2).post_init(slot2)

	slot4 = self._unit

	managers.enemy.register_enemy(slot2, managers.enemy)

	self._allow_invisible = true
	slot3 = self

	self._chk_spawn_gear(slot2)

	return 
end
function CopBase:_chk_spawn_gear()
	return 
end
function CopBase:default_weapon_name()
	local default_weapon_id = self._default_weapon_id
	local weap_ids = tweak_data.character.weap_ids
	slot5 = weap_ids

	for i_weap_id, weap_id in ipairs(slot4) do
		if default_weapon_id == weap_id then
			return tweak_data.character.weap_unit_names[i_weap_id]
		end
	end

	return 
end
function CopBase:is_special()
	if self._char_tweak.is_special == true then
		return true
	end

	return false
end
function CopBase:visibility_state()
	return self._visibility_state
end
function CopBase:lod_stage()
	return self._lod_stage
end
function CopBase:set_allow_invisible(allow)
	self._allow_invisible = allow

	return 
end
function CopBase:set_visibility_state(stage)
	local state = stage and true

	if not state and not self._allow_invisible then
		state = true
		stage = 1
	end

	if self._lod_stage == stage then
		return 
	end

	slot5 = self._unit
	local inventory = self._unit.inventory(slot4)

	if inventory and inventory.get_weapon then
		slot6 = inventory
		local weapon = inventory.get_weapon(slot5)
	end

	if weapon then
		slot7 = weapon
		slot8 = stage ~= 2 and not not stage

		weapon.base(slot6).set_flashlight_light_lod_enabled(slot6, weapon.base(slot6))
	end

	if self._visibility_state ~= state then
		local unit = self._unit

		if inventory then
			slot9 = state

			inventory.set_visibility_state(slot7, inventory)
		end

		slot9 = state

		unit.set_visible(slot7, unit)

		if self._headwear_unit then
			slot9 = state

			self._headwear_unit.set_visible(slot7, self._headwear_unit)
		end

		if state or (self._ext_anim.can_freeze and self._ext_anim.upper_body_empty) then
			slot10 = state

			unit.set_animatable_enabled(slot7, unit, ids_lod)

			slot10 = state

			unit.set_animatable_enabled(slot7, unit, ids_ik_aim)
		end

		self._visibility_state = state
	end

	if state then
		slot8 = stage

		self.set_anim_lod(slot6, self)

		slot7 = self._unit
		slot8 = true

		self._unit.movement(slot6).enable_update(slot6, self._unit.movement(slot6))

		if stage == 1 then
			slot9 = true

			self._unit.set_animatable_enabled(slot6, self._unit, ids_lod1)
		elseif self._lod_stage == 1 then
			slot9 = false

			self._unit.set_animatable_enabled(slot6, self._unit, ids_lod1)
		end
	end

	self._lod_stage = stage
	slot7 = self

	self.chk_freeze_anims(slot6)

	return 
end
function CopBase:set_anim_lod(stage)
	slot4 = self._unit
	slot7 = self._anim_lods[stage]

	self._unit.set_animation_lod(slot3, unpack(slot6))

	return 
end
function CopBase:on_death_exit()
	slot4 = false

	self._unit.set_animations_enabled(slot2, self._unit)

	return 
end
function CopBase:chk_freeze_anims()
	if (not self._lod_stage or 1 < self._lod_stage) and self._ext_anim.can_freeze and self._ext_anim.upper_body_empty then
		if not self._anims_frozen then
			self._anims_frozen = true
			slot4 = false

			self._unit.set_animations_enabled(slot2, self._unit)

			slot4 = true

			self._ext_movement.on_anim_freeze(slot2, self._ext_movement)
		end
	elseif self._anims_frozen then
		self._anims_frozen = nil
		slot4 = true

		self._unit.set_animations_enabled(slot2, self._unit)

		slot4 = false

		self._ext_movement.on_anim_freeze(slot2, self._ext_movement)
	end

	return 
end
function CopBase:anim_act_clbk(unit, anim_act, send_to_action)
	if send_to_action then
		slot6 = unit
		slot7 = anim_act

		unit.movement(slot5).on_anim_act_clbk(slot5, unit.movement(slot5))
	else
		slot6 = unit

		if unit.unit_data(slot5).mission_element then
			slot6 = unit
			slot8 = unit

			unit.unit_data(slot5).mission_element.event(slot5, unit.unit_data(slot5).mission_element, anim_act)
		end
	end

	return 
end
function CopBase:save(data)
	slot4 = self._unit

	if self._unit.interaction(slot3) then
		slot4 = self._unit
	else
		slot4 = self._unit

		if self._unit.interaction(slot3) then
			slot4 = self._unit

			if self._unit.interaction(slot3).tweak_data == "hostage_convert" then
				data.is_hostage_convert = true
			end
		end
	end

	return 
end
function CopBase:load(data)
	if data.is_hostage_trade then
		slot6 = false

		CopLogicTrade.hostage_trade(slot3, self._unit, true)
	elseif data.is_hostage_convert then
		slot4 = self._unit
		slot5 = "hostage_convert"

		self._unit.interaction(slot3).set_tweak_data(slot3, self._unit.interaction(slot3))
	end

	return 
end
function CopBase:swap_material_config(material_applied_clbk)
	slot2 = self._material_translation_map

	if not self._loading_material_key then
		slot7 = self._unit
		slot7 = self._unit.material_config(slot6)
		slot3 = tostring(self._unit.material_config(slot6).key(slot6))
	end

	local new_material = slot2[slot3]

	if new_material then
		slot5 = new_material
		self._loading_material_key = new_material.key(slot4)
		self._is_in_original_material = not self._is_in_original_material
		slot5 = self._unit
		slot3 = self._unit.set_material_config
		slot6 = new_material
		slot7 = true

		if material_applied_clbk then
			slot13 = material_applied_clbk
			slot8 = callback(slot9, self, self, "on_material_applied")
		end

		slot9 = 100

		slot3(slot4, slot5, slot6, slot7, slot8)

		if not material_applied_clbk then
			slot5 = self

			self.on_material_applied(slot4)
		end
	else
		slot8 = self._unit
		slot7 = self._unit

		print(slot4, "[CopBase:swap_material_config] fail", self._unit.material_config(slot7))

		slot5 = Application

		Application.stack_dump(slot4)
	end

	return 
end
function CopBase:on_material_applied(material_applied_clbk)
	slot4 = self._unit

	if not alive(slot3) then
		return 
	end

	self._loading_material_key = nil
	slot4 = self._unit

	if self._unit.interaction(slot3) then
		slot4 = self._unit
		slot4 = self._unit.interaction(slot3)

		self._unit.interaction(slot3).refresh_material(slot3)
	end

	if material_applied_clbk then
		material_applied_clbk()
	end

	return 
end
function CopBase:is_in_original_material()
	return self._is_in_original_material
end
function CopBase:set_material_state(original)
	if (original and not self._is_in_original_material) or (not original and self._is_in_original_material) then
		slot4 = self

		self.swap_material_config(slot3)
	end

	return 
end
function CopBase:char_tweak()
	return self._char_tweak
end
function CopBase:melee_weapon()
	return self._melee_weapon_table or self._char_tweak.melee_weapon or "weapon"
end
function CopBase:pre_destroy(unit)
	slot4 = self._unit

	if self._unit.movement(slot3) then
		slot4 = self._unit
		slot4 = self._unit.movement(slot3)

		self._unit.movement(slot3).anim_clbk_close_parachute(slot3)
	end

	slot4 = self._headwear_unit

	if alive(slot3) then
		slot5 = 0

		self._headwear_unit.set_slot(slot3, self._headwear_unit)
	end

	slot5 = unit

	UnitBase.pre_destroy(slot3, self)

	return 
end

return 
