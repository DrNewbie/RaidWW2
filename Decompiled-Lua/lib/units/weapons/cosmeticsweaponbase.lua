-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
local mvec1 = Vector3()
local mvec2 = Vector3()
local mvec3 = Vector3()
function NewRaycastWeaponBase:change_cosmetics(cosmetics, async_clbk)
	slot6 = cosmetics

	self.set_cosmetics_data(slot4, self)

	slot6 = async_clbk or function ()
		return 
	end

	self._apply_cosmetics(slot4, self)

	return 
end
function NewRaycastWeaponBase:set_cosmetics_data(cosmetics)
	slot6 = (cosmetics and cosmetics.id) or "NONE"

	print(slot3, "NewRaycastWeaponBase:set_cosmetics_data", "cosmetics_id")

	if not cosmetics then
		self._cosmetics_id = nil
		self._cosmetics_quality = nil
		self._cosmetics_bonus = nil
		self._cosmetics_data = nil

		return 
	end

	self._cosmetics_id = cosmetics and cosmetics.id
	self._cosmetics_quality = cosmetics and cosmetics.quality
	self._cosmetics_bonus = cosmetics and cosmetics.bonus
	self._cosmetics_data = self._cosmetics_id and tweak_data.blackmarket.weapon_skins[self._cosmetics_id]

	return 
end
function NewRaycastWeaponBase:get_cosmetics_bonus()
	return self._cosmetics_bonus
end
function NewRaycastWeaponBase:get_cosmetics_quality()
	return self._cosmetics_quality
end
function NewRaycastWeaponBase:get_cosmetics_id()
	return self._cosmetics_id
end
function NewRaycastWeaponBase:get_cosmetics_data()
	return self._cosmetics_data
end
function NewRaycastWeaponBase:_material_config_name(part_id, unit_name, use_cc_material_config)
	slot6 = self

	if self.is_npc(slot5) then
		if use_cc_material_config and tweak_data.weapon.factory.parts[part_id].cc_thq_material_config then
			return tweak_data.weapon.factory.parts[part_id].cc_thq_material_config
		end

		if tweak_data.weapon.factory.parts[part_id].thq_material_config then
			return tweak_data.weapon.factory.parts[part_id].thq_material_config
		end

		local cc_string = (use_cc_material_config and "_cc") or ""
		slot7 = self
		local thq_string = (self.use_thq(slot6) and "_thq") or ""
		slot8 = unit_name .. cc_string .. thq_string

		return Idstring(slot7)
	end

	if use_cc_material_config and tweak_data.weapon.factory.parts[part_id].cc_material_config then
		return tweak_data.weapon.factory.parts[part_id].cc_material_config
	end

	slot6 = unit_name .. "_cc"

	return Idstring(slot5)
end
function NewRaycastWeaponBase:_update_materials()
	if not self._parts then
		return 
	end

	slot3 = self

	if self.is_npc(slot2) then
		slot3 = self
		slot1 = self.use_thq(slot2)

		if self.use_thq(slot2) then
			slot1 = false
		end
	else
		local use = true
	end

	local use_cc_material_config = (use and self._cosmetics_data and true) or false
	slot5 = self

	if self.is_npc(slot4) then
		slot5 = self
		local is_thq = self.use_thq(slot4)
	end

	if is_thq or use_cc_material_config then
		if not self._materials then
			local material_config_ids = Idstring(slot5)
			slot7 = self._parts

			for part_id, part in pairs("material_config") do
				slot15 = self._blueprint
				local part_data = managers.weapon_factory.get_part_data_by_part_id_from_weapon(slot11, managers.weapon_factory, part_id, self._factory_id)

				if part_data then
					slot16 = use_cc_material_config
					local new_material_config_ids = self._material_config_name(slot12, self, part_id, part_data.unit)
					slot14 = part.unit

					if part.unit.material_config(self) ~= new_material_config_ids then
						slot16 = new_material_config_ids

						if DB.has(slot13, DB, material_config_ids) then
							slot16 = true

							part.unit.set_material_config(slot13, part.unit, new_material_config_ids)
						end
					end
				end
			end

			if use_cc_material_config then
				self._materials = {}
				self._materials_default = {}
				slot7 = self._parts

				for part_id, part in pairs(slot6) do
					slot15 = "material"
					local materials = part.unit.get_objects_by_type(slot11, Idstring(slot14))
					slot13 = materials

					for _, m in ipairs(part.unit) do
						slot18 = m
						slot21 = "wear_tear_value"

						if m.variable_exists(slot17, Idstring(slot20)) then
							self._materials[part_id] = self._materials[part_id] or {}
							slot19 = m
							self._materials[part_id][m.key(slot18)] = m
						end
					end
				end
			end
		end
	elseif self._materials then
		local material_config_ids = Idstring(slot5)
		slot7 = self._parts

		for part_id, part in pairs("material_config") do
			if tweak_data.weapon.factory.parts[part_id] then
				if not tweak_data.weapon.factory.parts[part_id].material_config then
					slot14 = self
					slot12 = (self.is_npc(slot13) and tweak_data.weapon.factory.parts[part_id].third_unit) or tweak_data.weapon.factory.parts[part_id].unit
					local new_material_config_ids = Idstring(slot11)
				end

				slot13 = part.unit

				if part.unit.material_config(slot12) ~= new_material_config_ids then
					slot15 = new_material_config_ids

					if DB.has(slot12, DB, material_config_ids) then
						slot15 = true

						part.unit.set_material_config(slot12, part.unit, new_material_config_ids)
					end
				end
			end
		end

		self._materials = nil
	end

	return 
end
local material_defaults = {}
slot6 = "texture_removed_in_cleanup"
material_defaults.diffuse_layer1_texture = Idstring(slot5)
slot6 = "texture_removed_in_cleanup"
material_defaults.diffuse_layer2_texture = Idstring(slot5)
slot6 = "texture_removed_in_cleanup"
material_defaults.diffuse_layer0_texture = Idstring(slot5)
slot6 = "texture_removed_in_cleanup"
material_defaults.diffuse_layer3_texture = Idstring(slot5)
local material_textures = {
	pattern = "diffuse_layer0_texture",
	sticker = "diffuse_layer3_texture",
	pattern_gradient = "diffuse_layer2_texture",
	base_gradient = "diffuse_layer1_texture"
}
local material_variables = {
	cubemap_pattern_control = "cubemap_pattern_control",
	pattern_pos = "pattern_pos",
	uv_scale = "uv_scale",
	uv_offset_rot = "uv_offset_rot",
	pattern_tweak = "pattern_tweak"
}
slot8 = Application
material_variables.wear_and_tear = (Application.production_build(slot7) and "wear_tear_value") or nil
function NewRaycastWeaponBase:_apply_cosmetics(async_clbk)

	-- Decompilation error in this vicinity:
	slot4 = self

	self._update_materials(slot3)

	slot4 = self
	local cosmetics_data = self.get_cosmetics_data(slot3)

	if async_clbk then
		slot8 = async_clbk
		local texture_load_result_clbk = callback(slot4, self, self, "clbk_texture_loaded")
	end

	local textures = {}
	local base_variable, base_texture, mat_variable, mat_texture, custom_variable, texture_key = nil
	local wear_tear_value = 1
	slot14 = self._materials

	for part_id, materials in pairs(slot13) do
		slot19 = materials

		for _, material in pairs(slot18) do
			slot27 = "wear_tear_value"

			material.set_variable(slot23, material, Idstring(wear_tear_value))

			slot24 = material_variables

			for key, variable in pairs(slot23) do
				if cosmetics_data.parts and cosmetics_data.parts[part_id] then
					slot30 = material
					slot30 = material.name(slot29)

					if cosmetics_data.parts[part_id][material.name(slot29).key(slot29)] then
						slot30 = material
						slot30 = material.name(slot29)
						mat_variable = cosmetics_data.parts[part_id][material.name(slot29).key(slot29)][key]
					end
				end

				base_variable = cosmetics_data[key]

				if mat_variable or base_variable then
					slot32 = variable
					slot31 = mat_variable or base_variable

					material.set_variable(slot28, material, Idstring(slot31))
				end
			end

			slot24 = material_textures

			for key, material_texture in pairs(slot23) do
				if cosmetics_data.parts and cosmetics_data.parts[part_id] then
					slot30 = material
					slot30 = material.name(slot29)

					if cosmetics_data.parts[part_id][material.name(slot29).key(slot29)] then
						slot30 = material
						slot30 = material.name(slot29)
						mat_texture = cosmetics_data.parts[part_id][material.name(slot29).key(slot29)][key]
					end
				end

				base_texture = cosmetics_data[key]

				if mat_texture or base_texture then

					-- Decompilation error in this vicinity:
					if not textures[texture_key] then
						slot27 = {
							applied = false,
							ready = false,
							name = mat_texture or base_texture
						}
					end

					textures[texture_key] = slot27
				end
			end
		end
	end

	slot14 = self._textures

	for key, old_texture in pairs(slot13) do
		if not textures[key] and not old_texture.applied then
			slot20 = old_texture.name

			TextureCache.unretrieve(slot18, TextureCache)
		end
	end

	self._textures = textures
	self._requesting = async_clbk and true
	slot14 = self._textures

	for tex_key, texture_data in pairs(slot13) do
		if async_clbk then
			if not texture_data.ready then
				slot22 = "texture"

				if DB.has(slot18, DB, Idstring(texture_data.name)) then
					slot23 = 90

					TextureCache.request(slot18, TextureCache, texture_data.name, "normal", texture_load_result_clbk)
				else
					slot22 = texture_data.name

					Application.error(slot18, Application, "[NewRaycastWeaponBase:_apply_cosmetics] Weapon cosmetics tried to use no-existing texture!", "texture")
				end
			end
		else
			texture_data.ready = true
		end
	end

	self._requesting = nil
	slot15 = async_clbk

	self._chk_load_complete(slot13, self)

	return 
end
function NewRaycastWeaponBase:clbk_texture_loaded(async_clbk, tex_name)
	slot5 = self._unit

	if not alive(slot4) then
		return 
	end

	slot6 = tex_name
	local texture_data = self._textures[tex_name.key(slot5)]

	if texture_data and not texture_data.ready then
		texture_data.ready = true
	end

	slot7 = async_clbk

	self._chk_load_complete(slot5, self)

	return 
end
function NewRaycastWeaponBase:_chk_load_complete(async_clbk)
	if self._requesting then
		return 
	end

	slot4 = self._textures

	for tex_id, texture_data in pairs(slot3) do
		if not texture_data.ready then
			return 
		end
	end

	slot4 = self

	self._set_material_textures(slot3)

	if async_clbk then
		async_clbk()
	end

	return 
end
function NewRaycastWeaponBase:_set_material_textures()

	-- Decompilation error in this vicinity:
	slot3 = self
	local cosmetics_data = self.get_cosmetics_data(slot2)
	local base_texture, mat_texture, new_texture = nil
	slot7 = self._materials

	for part_id, materials in pairs(slot6) do
		slot12 = materials

		for _, material in pairs(slot11) do
			slot17 = material_textures

			for key, material_texture in pairs(slot16) do
				if cosmetics_data.parts and cosmetics_data.parts[part_id] then
					slot23 = material
					slot23 = material.name(slot22)

					if cosmetics_data.parts[part_id][material.name(slot22).key(slot22)] then
						slot23 = material
						slot23 = material.name(slot22)
						mat_texture = cosmetics_data.parts[part_id][material.name(slot22).key(slot22)][key]
					end
				end

				base_texture = cosmetics_data[key]
				new_texture = mat_texture or base_texture or material_defaults[material_texture]

				if new_texture then
					slot26 = material_texture
					slot28 = "normal"

					Application.set_material_texture(slot21, Application, material, Idstring(new_texture), Idstring(slot27))
				end
			end
		end
	end

	slot7 = self._textures

	for tex_id, texture_data in pairs(slot6) do
		if not texture_data.applied then
			texture_data.applied = true
			slot13 = texture_data.name

			TextureCache.unretrieve(slot11, TextureCache)
		end
	end

	return 
end

return 
