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
InventoryIconCreator = InventoryIconCreator or class()
InventoryIconCreator.OPTIONAL = "<optional>"
function InventoryIconCreator:init()
	slot3 = self

	self._set_job_settings(slot2)

	return 
end
function InventoryIconCreator:_set_job_settings()
	self._job_settings = {}
	slot7 = 0
	slot7 = 0
	slot7 = 0
	self._job_settings.weapon = {
		pos = Vector3(slot4, 4500, 0),
		rot = Rotation(slot4, 90, 0),
		res = Vector3(slot4, 3000, 1000)
	}
	slot7 = 0
	slot7 = 0
	slot7 = 0
	self._job_settings.mask = {
		pos = Vector3(slot4, 4500, 0),
		rot = Rotation(slot4, 90, 0),
		res = Vector3(slot4, 1000, 1000)
	}
	slot7 = 0
	slot7 = 0
	slot7 = 0
	self._job_settings.melee = {
		pos = Vector3(slot4, 5500, 0),
		rot = Rotation(slot4, 90, 0),
		res = Vector3(slot4, 2500, 1000)
	}
	slot7 = 0
	slot7 = 0
	slot7 = 0
	self._job_settings.throwable = {
		pos = Vector3(slot4, 4500, 0),
		rot = Rotation(slot4, 90, 0),
		res = Vector3(slot4, 2500, 1000)
	}

	return 
end
function InventoryIconCreator:_create_weapon(factory_id, blueprint, weapon_skin)
	slot6 = self

	self.destroy_items(slot5)

	self._current_texture_name = factory_id .. ((weapon_skin and " " .. weapon_skin) or "")
	local cosmetics = (weapon_skin and {
		id = weapon_skin
	}) or nil
	local unit_name = tweak_data.weapon.factory[factory_id].unit
	slot12 = unit_name
	slot12 = false

	managers.dyn_resource.load(slot7, managers.dyn_resource, Idstring(slot10), Idstring("unit"), DynamicResourceManager.DYN_RESOURCES_PACKAGE)

	slot10 = 0
	local rot = Rotation(slot7, 180, 0)
	slot12 = unit_name
	slot12 = rot
	self._weapon_unit = World.spawn_unit(180, World, Idstring(DynamicResourceManager.DYN_RESOURCES_PACKAGE), Vector3())
	slot9 = self._weapon_unit
	slot10 = factory_id

	self._weapon_unit.base(180).set_factory_data(180, self._weapon_unit.base(180))

	slot9 = self._weapon_unit
	slot10 = cosmetics

	self._weapon_unit.base(180).set_cosmetics_data(180, self._weapon_unit.base(180))

	slot9 = self._weapon_unit
	slot11 = blueprint
	slot16 = "_assemble_completed"

	self._weapon_unit.base(180).assemble_from_blueprint(180, self._weapon_unit.base(180), factory_id, callback(slot13, self, self))

	slot10 = true

	self._weapon_unit.set_moving(180, self._weapon_unit)

	slot9 = self._weapon_unit
	slot9 = self._weapon_unit.base(180)

	self._weapon_unit.base(180).on_enabled(180)

	return 
end
function InventoryIconCreator:_create_mask(mask_id, blueprint)
	slot5 = self

	self.destroy_items(slot4)

	self._current_texture_name = mask_id
	slot7 = 0
	local rot = Rotation(slot4, 90, 90)
	slot7 = mask_id
	local mask_unit_name = managers.blackmarket.mask_unit_name_by_mask_id(90, managers.blackmarket)
	slot11 = mask_unit_name
	slot11 = false

	managers.dyn_resource.load(managers.blackmarket, managers.dyn_resource, Idstring(slot9), Idstring("unit"), DynamicResourceManager.DYN_RESOURCES_PACKAGE)

	slot10 = mask_unit_name
	slot10 = rot
	self._mask_unit = World.spawn_unit(managers.blackmarket, World, Idstring(Idstring("unit")), Vector3())

	if blueprint then
		slot7 = self._mask_unit
		slot8 = blueprint

		self._mask_unit.base(slot6).apply_blueprint(slot6, self._mask_unit.base(slot6))
	end

	slot8 = true

	self._mask_unit.set_moving(slot6, self._mask_unit)

	return 
end
function InventoryIconCreator:_create_melee(melee_id)
	slot4 = self

	self.destroy_items(slot3)

	self._current_texture_name = melee_id
	local rot = Rotation()
	local melee_unit_name = tweak_data.blackmarket.melee_weapons[melee_id].unit
	slot10 = melee_unit_name
	slot10 = false

	managers.dyn_resource.load(slot5, managers.dyn_resource, Idstring(slot8), Idstring("unit"), DynamicResourceManager.DYN_RESOURCES_PACKAGE)

	slot9 = melee_unit_name
	slot9 = rot
	self._melee_unit = World.spawn_unit(slot5, World, Idstring(Idstring("unit")), Vector3())
	slot7 = true

	self._melee_unit.set_moving(slot5, self._melee_unit)

	return 
end
function InventoryIconCreator:_create_throwable(throwable_id)
	slot4 = self

	self.destroy_items(slot3)

	self._current_texture_name = throwable_id
	local rot = Rotation()
	local throwable_unit_name = tweak_data.projectiles[throwable_id].unit_dummy
	slot10 = throwable_unit_name

	managers.dyn_resource.load(slot5, managers.dyn_resource, Idstring(slot8), Idstring("unit"), DynamicResourceManager.DYN_RESOURCES_PACKAGE)

	slot9 = throwable_unit_name
	slot9 = rot
	self._throwable_unit = World.spawn_unit(slot5, World, Idstring(Idstring("unit")), Vector3())
	slot8 = self._throwable_unit
	slot11 = "effect_spawner"

	for _, effect_spawner in ipairs(self._throwable_unit.get_objects_by_type(Idstring(Idstring("unit")), Idstring(false))) do
		slot12 = false

		effect_spawner.set_enabled(slot10, effect_spawner)
	end

	slot7 = true

	self._throwable_unit.set_moving(slot5, self._throwable_unit)

	return 
end
function InventoryIconCreator:_assemble_completed(parts, blueprint)
	slot6 = true

	self._weapon_unit.set_moving(slot4, self._weapon_unit)

	return 
end
function InventoryIconCreator:start_jobs(jobs)
	self._current_job = 0
	self._jobs = jobs
	slot5 = "InventoryIconCreator"
	slot10 = "_update"

	managers.editor.add_tool_updator(slot3, managers.editor, callback(slot7, self, self))

	return 
end
function InventoryIconCreator:start_all_weapons(test)
	slot8 = "YES_NO,ICON_QUESTION"
	slot13 = 0
	local confirm = EWS.message_box(slot3, EWS, Global.frame_panel, "Really, all of them?", "Icon creator", Vector3(slot10, -1, -1))

	if confirm == "NO" then
		return 
	end

	local weapons = {}

	if test then
		weapons = {
			"wpn_fps_rpg7",
			"wpn_fps_snp_r93",
			"wpn_fps_pis_x_g17"
		}
	else
		slot6 = self
		weapons = self._get_all_weapons(slot5)
	end

	local jobs = {}
	slot7 = weapons

	for _, factory_id in ipairs(slot6) do
		slot13 = factory_id
		local blueprint = managers.weapon_factory.get_default_blueprint_by_factory_id(slot11, managers.weapon_factory)
		slot14 = {
			factory_id = factory_id,
			blueprint = blueprint
		}

		table.insert(managers.weapon_factory, jobs)
	end

	slot8 = jobs

	self.start_jobs(slot6, self)

	return 
end
function InventoryIconCreator:start_all_weapon_skins()
	local factory_id = self._ctrlrs.weapon.factory_id.get_value(slot2)
	slot5 = factory_id
	local blueprint = managers.weapon_factory.get_default_blueprint_by_factory_id(self._ctrlrs.weapon.factory_id, managers.weapon_factory)
	local jobs = {}
	slot8 = self

	for _, weapon_skin in ipairs(self._get_weapon_skins(slot7)) do
		if weapon_skin ~= "none" then
		else
			weapon_skin = false

			if false then
				weapon_skin = true
			end
		end

		if weapon_skin and not tweak_data.blackmarket.weapon_skins[weapon_skin].default_blueprint then
		end

		slot12 = {
			factory_id = factory_id,
			blueprint = blueprint,
			weapon_skin = weapon_skin
		}

		table.insert(slot10, jobs)
	end

	slot7 = jobs

	self.start_jobs(slot5, self)

	return 
end
function InventoryIconCreator:start_one_weapon()
	local factory_id = self._ctrlrs.weapon.factory_id.get_value(slot2)
	slot4 = self._ctrlrs.weapon.weapon_skin
	local weapon_skin = self._ctrlrs.weapon.weapon_skin.get_value(self._ctrlrs.weapon.factory_id)

	if weapon_skin ~= "none" then
	else
		weapon_skin = false

		if false then
			weapon_skin = true
		end
	end

	local blueprint = weapon_skin and tweak_data.blackmarket.weapon_skins[weapon_skin].default_blueprint

	if not blueprint then
		slot6 = self
		blueprint = self._get_blueprint_from_ui(slot5)
	end

	slot7 = {
		{
			factory_id = factory_id,
			blueprint = blueprint,
			weapon_skin = weapon_skin
		}
	}

	self.start_jobs(slot5, self)

	return 
end
function InventoryIconCreator:preview_one_weapon()
	local factory_id = self._ctrlrs.weapon.factory_id.get_value(slot2)
	slot4 = self._ctrlrs.weapon.weapon_skin
	local weapon_skin = self._ctrlrs.weapon.weapon_skin.get_value(self._ctrlrs.weapon.factory_id)

	if weapon_skin ~= "none" then
	else
		weapon_skin = false

		if false then
			weapon_skin = true
		end
	end

	local blueprint = weapon_skin and tweak_data.blackmarket.weapon_skins[weapon_skin].default_blueprint

	if not blueprint then
		slot6 = self
		blueprint = self._get_blueprint_from_ui(slot5)
	end

	slot9 = weapon_skin

	self._create_weapon(slot5, self, factory_id, blueprint)

	return 
end
function InventoryIconCreator:_get_blueprint_from_ui()
	local blueprint = {}
	slot4 = self._ctrlrs.weapon

	for type, ctrlr in pairs(slot3) do
		if type ~= "factory_id" and type ~= "weapon_skin" then
			slot9 = ctrlr
			local part_id = ctrlr.get_value(slot8)

			if part_id ~= self.OPTIONAL then
				slot11 = part_id

				table.insert(slot9, blueprint)
			end
		end
	end

	return blueprint
end
function InventoryIconCreator:_get_all_weapons()
	local weapons = {}
	slot4 = Global.blackmarket_manager.weapons

	for _, data in pairs(slot3) do
		slot10 = data.factory_id

		table.insert(slot8, weapons)
	end

	slot4 = weapons

	table.sort(slot3)

	return weapons
end
function InventoryIconCreator:_get_weapon_skins()
	local factory_id = self._ctrlrs.weapon.factory_id.get_value(slot2)
	local weapon_id = managers.weapon_factory.get_weapon_id_by_factory_id(self._ctrlrs.weapon.factory_id, managers.weapon_factory)
	local t = {
		"none"
	}
	slot6 = tweak_data.blackmarket.weapon_skins

	for name, item_data in pairs(factory_id) do
		local match_weapon_id = item_data.weapon_id or item_data.weapons[1]

		if match_weapon_id == weapon_id then
			slot13 = name

			table.insert(slot11, t)
		end
	end

	return t
end
function InventoryIconCreator:start_all_masks(with_blueprint)

	-- Decompilation error in this vicinity:
	slot8 = "YES_NO,ICON_QUESTION"
	slot13 = 0
	local confirm = EWS.message_box(slot3, EWS, Global.frame_panel, "Really, all of them?", "Icon creator", Vector3(slot10, -1, -1))

	if confirm == "NO" then
		return 
	end

	local masks = {}

	if false then
		masks = {
			"troll",
			"mr_sinister",
			"baby_cry",
			"pazuzu",
			"anubis",
			"infamy_lurker",
			"plague",
			"robo_santa"
		}
	else
		slot6 = self
		masks = self._get_all_masks(slot5)
	end

	slot9 = jobs

	self.start_jobs(slot7, self)

	return 
end
function InventoryIconCreator:start_one_mask(with_blueprint)

	-- Decompilation error in this vicinity:
	slot4 = self._ctrlrs.mask.mask_id
	local mask_id = self._ctrlrs.mask.mask_id.get_value(slot3)
	slot7 = {
		{
			mask_id = mask_id,
			blueprint = blueprint
		}
	}

	self.start_jobs(slot5, self)

	return 
end
function InventoryIconCreator:preview_one_mask(with_blueprint)

	-- Decompilation error in this vicinity:
	slot4 = self._ctrlrs.mask.mask_id
	local mask_id = self._ctrlrs.mask.mask_id.get_value(slot3)
	slot8 = blueprint

	self._create_mask(slot5, self, mask_id)

	return 
end
function InventoryIconCreator:_get_mask_blueprint_from_ui()
	local blueprint = {}
	slot4 = self._ctrlrs.mask

	for type, ctrlr in pairs(slot3) do
		if type ~= "mask_id" then
			slot9 = ctrlr
			local id = ctrlr.get_value(slot8)
			blueprint[type] = {
				id = id
			}
		end
	end

	return blueprint
end
function InventoryIconCreator:_get_all_masks()
	local t = {}
	slot4 = tweak_data.blackmarket.masks

	for mask_id, data in pairs(slot3) do
		if mask_id ~= "character_locked" then
			slot10 = mask_id

			table.insert(slot8, t)
		end
	end

	slot4 = t

	table.sort(slot3)

	return t
end
function InventoryIconCreator:start_all_melee()
	slot7 = "YES_NO,ICON_QUESTION"
	slot12 = 0
	local confirm = EWS.message_box(slot2, EWS, Global.frame_panel, "Really, all of them?", "Icon creator", Vector3(slot9, -1, -1))

	if confirm == "NO" then
		return 
	end

	local jobs = {}
	slot7 = self

	for _, melee_id in ipairs(self._get_all_melee(slot6)) do
		slot11 = {
			melee_id = melee_id
		}

		table.insert(slot9, jobs)
	end

	slot6 = jobs

	self.start_jobs(slot4, self)

	return 
end
function InventoryIconCreator:start_one_melee()
	local melee_id = self._ctrlrs.melee.melee_id.get_value(slot2)
	slot5 = {
		{
			melee_id = melee_id
		}
	}

	self.start_jobs(self._ctrlrs.melee.melee_id, self)

	return 
end
function InventoryIconCreator:preview_one_melee()
	local melee_id = self._ctrlrs.melee.melee_id.get_value(slot2)
	slot5 = melee_id

	self._create_melee(self._ctrlrs.melee.melee_id, self)

	return 
end
function InventoryIconCreator:_get_all_melee()
	local t = {}
	slot4 = tweak_data.blackmarket.melee_weapons

	for melee_id, data in pairs(slot3) do
		if data.unit then
			slot10 = melee_id

			table.insert(slot8, t)
		else
			slot10 = "No unit for " .. melee_id .. ". No icon created."

			Application.error(slot8, Application)
		end
	end

	slot4 = t

	table.sort(slot3)

	return t
end
function InventoryIconCreator:start_all_throwable()
	slot7 = "YES_NO,ICON_QUESTION"
	slot12 = 0
	local confirm = EWS.message_box(slot2, EWS, Global.frame_panel, "Really, all of them?", "Icon creator", Vector3(slot9, -1, -1))

	if confirm == "NO" then
		return 
	end

	local jobs = {}
	slot7 = self

	for _, throwable_id in ipairs(self._get_all_throwable(slot6)) do
		slot11 = {
			throwable_id = throwable_id
		}

		table.insert(slot9, jobs)
	end

	slot6 = jobs

	self.start_jobs(slot4, self)

	return 
end
function InventoryIconCreator:start_one_throwable()
	local throwable_id = self._ctrlrs.throwable.throwable_id.get_value(slot2)
	slot5 = {
		{
			throwable_id = throwable_id
		}
	}

	self.start_jobs(self._ctrlrs.throwable.throwable_id, self)

	return 
end
function InventoryIconCreator:preview_one_throwable()
	local throwable_id = self._ctrlrs.throwable.throwable_id.get_value(slot2)
	slot5 = throwable_id

	self._create_throwable(self._ctrlrs.throwable.throwable_id, self)

	return 
end
function InventoryIconCreator:_get_all_throwable()
	local t = {}
	slot4 = tweak_data.projectiles

	for throwable_id, data in pairs(slot3) do
		if data.throwable and data.unit_dummy then
			slot10 = throwable_id

			table.insert(slot8, t)
		end
	end

	slot4 = t

	table.sort(slot3)

	return t
end
function InventoryIconCreator:_start_job()
	self._has_job = true
	local job = self._jobs[self._current_job]

	if job.factory_id then
		slot7 = job.weapon_skin

		self._create_weapon(slot3, self, job.factory_id, job.blueprint)
	elseif job.mask_id then
		slot6 = job.blueprint

		self._create_mask(slot3, self, job.mask_id)
	elseif job.melee_id then
		slot5 = job.melee_id

		self._create_melee(slot3, self)
	elseif job.throwable_id then
		slot5 = job.throwable_id

		self._create_throwable(slot3, self)
	end

	slot4 = self

	self.start_create(slot3)

	return 
end
function InventoryIconCreator:check_next_job()
	if self._has_job then
		return 
	end

	self._current_job = self._current_job + 1

	if #self._jobs < self._current_job then
		slot4 = "InventoryIconCreator"

		managers.editor.remove_tool_updator(slot2, managers.editor)

		return 
	end

	slot3 = self

	self._start_job(slot2)

	return 
end
function InventoryIconCreator:_update()
	if self._steps then
		slot3 = self

		self._next_step(slot2)
	end

	slot3 = self

	self.check_next_job(slot2)

	return 
end
function InventoryIconCreator:start_create()
	self._old_data = {}
	slot4 = managers.editor
	self._old_data.camera_position = managers.editor.camera_position(slot3)
	slot4 = managers.editor
	self._old_data.camera_rotation = managers.editor.camera_rotation(slot3)
	slot4 = managers.editor
	self._old_data.camera_fov = managers.editor.camera_fov(slot3)
	self._old_data.layer_draw_grid = managers.editor._layer_draw_grid
	self._old_data.layer_draw_marker = managers.editor._layer_draw_marker
	slot4 = managers.environment_controller
	self._old_data.base_contrast = managers.environment_controller.base_contrast(slot3)
	slot4 = false

	managers.editor.set_show_camera_info(managers.environment_controller.base_contrast(slot3), managers.editor)

	managers.editor._show_center = false
	managers.editor._layer_draw_grid = false
	managers.editor._layer_draw_marker = false
	slot3 = self

	self._setup_camera(false)

	slot3 = self

	self._create_backdrop(false)

	slot4 = "default"

	managers.editor.on_post_processor_effect(false, managers.editor)

	slot4 = "none"

	managers.environment_controller.set_dof_setting(false, managers.environment_controller)

	slot4 = 0

	managers.environment_controller.set_base_contrast(false, managers.environment_controller)

	self._steps = {}
	self._current_step = 0
	slot3 = self._steps
	slot8 = "_take_screen_shot_1"

	table.insert(false, callback(slot5, self, self))

	slot3 = self._steps
	slot8 = "_pre_screen_shot_2"

	table.insert(false, callback(slot5, self, self))

	slot3 = self._steps
	slot8 = "_take_screen_shot_2"

	table.insert(false, callback(slot5, self, self))

	slot3 = self._steps
	slot8 = "end_create"

	table.insert(false, callback(slot5, self, self))

	return 
end
function InventoryIconCreator:end_create()
	slot5 = self._old_data.camera_rotation

	managers.editor.set_camera(slot2, managers.editor, self._old_data.camera_position)

	slot4 = self._old_data.camera_fov

	managers.editor.set_camera_fov(slot2, managers.editor)

	slot4 = true

	managers.editor.set_show_camera_info(slot2, managers.editor)

	managers.editor._show_center = true
	managers.editor._layer_draw_grid = self._old_data.layer_draw_grid
	managers.editor._layer_draw_marker = self._old_data.layer_draw_marker
	slot3 = self

	self._destroy_backdrop(self._old_data.layer_draw_marker)

	slot4 = "deferred_lighting"

	managers.editor.change_visualization(self._old_data.layer_draw_marker, managers.editor)

	slot4 = "standard"

	managers.environment_controller.set_dof_setting(self._old_data.layer_draw_marker, managers.environment_controller)

	slot4 = nil

	managers.editor._set_appwin_fixed_resolution(self._old_data.layer_draw_marker, managers.editor)

	slot4 = self._old_data.base_contrast

	managers.environment_controller.set_base_contrast(self._old_data.layer_draw_marker, managers.environment_controller)

	self._has_job = false

	return 
end
function InventoryIconCreator:_create_backdrop()
	slot3 = self

	self._destroy_backdrop(slot2)

	slot8 = 0
	slot9 = -90
	self._backdrop = safe_spawn_unit(slot2, Idstring(Vector3("units/test/jocke/oneplanetorulethemall", -500, 0)), Rotation(-500, 180, 0))

	return 
end
function InventoryIconCreator:_destroy_backdrop()
	slot3 = self._backdrop

	if alive(slot2) then
		slot4 = self._backdrop

		World.delete_unit(slot2, World)

		self._backdrop = nil
	end

	return 
end
function InventoryIconCreator:_setup_camera()
	local job_setting = nil

	if self._jobs[1].factory_id then
		job_setting = self._job_settings.weapon
	elseif self._jobs[1].mask_id then
		job_setting = self._job_settings.mask
	elseif self._jobs[1].melee_id then
		job_setting = self._job_settings.melee
	elseif self._jobs[1].throwable_id then
		job_setting = self._job_settings.throwable
	end

	slot4 = self._custom_ctrlrs.use_camera_setting

	if not self._custom_ctrlrs.use_camera_setting.get_value(slot3) then
		local oobb = self._weapon_unit or self._mask_unit or self._melee_unit or self._throwable_unit.oobb(slot3)
		local center = oobb.center(self._weapon_unit or self._mask_unit or self._melee_unit or self._throwable_unit)
		slot11 = center.z

		managers.editor.set_camera(oobb, managers.editor, Vector3(job_setting.rot, job_setting.pos.x, center.y))

		slot7 = 1

		managers.editor.set_camera_fov(oobb, managers.editor)
	end

	local w = job_setting.res.x
	local h = job_setting.res.y
	slot6 = self._custom_ctrlrs.resolution.use

	if self._custom_ctrlrs.resolution.use.get_value(slot5) then
		slot8 = self._custom_ctrlrs.resolution.width
		w = tonumber(self._custom_ctrlrs.resolution.width.get_value(slot7))
		slot8 = self._custom_ctrlrs.resolution.height
		h = tonumber(self._custom_ctrlrs.resolution.height.get_value(slot7))
	end

	slot6 = managers.editor
	slot11 = 0

	managers.editor._set_appwin_fixed_resolution(slot5, Vector3(slot8, w + 4, h + 4))

	return 
end
function InventoryIconCreator:_next_step()
	self._current_step = self._current_step + 1

	if #self._steps < self._current_step then
		return 
	end

	local func = self._steps[self._current_step]

	func()

	return 
end
function InventoryIconCreator:_take_screen_shot_1()
	local name = self._current_texture_name .. "_dif.tga"
	local path = managers.database.root_path(slot3)
	slot6 = path .. name

	Application.screenshot(managers.database, Application)

	return 
end
function InventoryIconCreator:_pre_screen_shot_2()
	slot4 = "empty"

	managers.editor.on_post_processor_effect(slot2, managers.editor)

	slot4 = "depth_visualization"

	managers.editor.change_visualization(slot2, managers.editor)

	slot4 = false

	self._backdrop.set_visible(slot2, self._backdrop)

	return 
end
function InventoryIconCreator:_take_screen_shot_2()
	local name = self._current_texture_name .. "_dph.tga"
	local path = managers.database.root_path(slot3)
	slot6 = path .. name

	Application.screenshot(managers.database, Application)

	return 
end
function InventoryIconCreator:destroy_items()
	slot3 = self

	self.destroy_weapon(slot2)

	slot3 = self

	self.destroy_mask(slot2)

	slot3 = self

	self.destroy_melee(slot2)

	slot3 = self

	self.destroy_throwable(slot2)

	return 
end
function InventoryIconCreator:destroy_weapon()
	slot3 = self._weapon_unit

	if not alive(slot2) then
		return 
	end

	slot4 = 0

	self._weapon_unit.set_slot(slot2, self._weapon_unit)

	self._weapon_unit = nil

	return 
end
function InventoryIconCreator:destroy_mask()
	slot3 = self._mask_unit

	if not alive(slot2) then
		return 
	end

	slot4 = 0

	self._mask_unit.set_slot(slot2, self._mask_unit)

	self._mask_unit = nil

	return 
end
function InventoryIconCreator:destroy_melee()
	slot3 = self._melee_unit

	if not alive(slot2) then
		return 
	end

	slot4 = 0

	self._melee_unit.set_slot(slot2, self._melee_unit)

	self._melee_unit = nil

	return 
end
function InventoryIconCreator:destroy_throwable()
	slot3 = self._throwable_unit

	if not alive(slot2) then
		return 
	end

	slot4 = 0

	self._throwable_unit.set_slot(slot2, self._throwable_unit)

	self._throwable_unit = nil

	return 
end
function InventoryIconCreator:show_ews()
	if not self._main_frame then
		slot3 = self

		self.create_ews(slot2)
	end

	return 
end
function InventoryIconCreator:create_ews()
	slot3 = self

	self.close_ews(slot2)

	slot9 = 0
	slot10 = 0
	slot8 = Global.frame
	self._main_frame = EWS.Frame(slot2, EWS, "Icon creator", Vector3("world_editor/icon_creator_16x16.png", 250, 0), Vector3(250, 420, 700), "FRAME_FLOAT_ON_PARENT,DEFAULT_FRAME_STYLE,FULL_REPAINT_ON_RESIZE")
	slot3 = self._main_frame

	self._main_frame.set_icon(slot2, CoreEws.image_path(Vector3("world_editor/icon_creator_16x16.png", 250, 0)))

	slot4 = "HORIZONTAL"
	local main_box = EWS.BoxSizer(slot2, EWS)
	slot7 = "FULL_REPAINT_ON_RESIZE"
	self._main_panel = EWS.Panel(EWS, EWS, self._main_frame, "")
	slot5 = "VERTICAL"
	local main_panel_sizer = EWS.BoxSizer(EWS, EWS)
	slot6 = main_panel_sizer

	self._main_panel.set_sizer(EWS, self._main_panel)
	main_box.add(EWS, main_box, self._main_panel, 1, 0)

	slot12 = "close_ews"
	slot9 = ""

	self._main_frame.connect(EWS, self._main_frame, "", "EVT_CLOSE_WINDOW", callback("EXPAND", self, self))

	slot8 = ""
	local common_sizer = EWS.StaticBoxSizer(EWS, EWS, self._main_panel, "VERTICAL")
	slot10 = "EXPAND"

	main_panel_sizer.add(EWS, main_panel_sizer, common_sizer, 0, 0)

	slot7 = "HORIZONTAL"
	local btn_sizer = EWS.BoxSizer(EWS, EWS)
	slot11 = "EXPAND"

	common_sizer.add(EWS, common_sizer, btn_sizer, 0, 0)

	slot11 = "BU_EXACTFIT,NO_BORDER"
	local _btn = EWS.Button(EWS, EWS, self._main_panel, "Delete item", "")
	slot12 = "RIGHT,TOP,BOTTOM"

	btn_sizer.add(EWS, btn_sizer, _btn, 0, 5)

	slot14 = "destroy_items"
	slot11 = false

	_btn.connect(EWS, _btn, "EVT_COMMAND_BUTTON_CLICKED", callback(5, self, self))

	slot10 = common_sizer

	self._create_custom_job(EWS, self, self._main_panel)

	slot11 = "NB_TOP,NB_MULTILINE"
	local notebook = EWS.Notebook(EWS, EWS, self._main_panel, "")
	slot13 = "EXPAND"

	main_panel_sizer.add(EWS, main_panel_sizer, notebook, 1, 0)

	self._ctrlrs = {
		weapon = {},
		mask = {},
		melee = {},
		throwable = {}
	}
	slot13 = notebook
	slot12 = true

	notebook.add_page(, notebook, self._create_weapons_page(1, self), "Weapons")

	slot13 = notebook
	slot12 = false

	notebook.add_page(, notebook, self._create_masks_page("Weapons", self), "Masks")

	slot13 = notebook
	slot12 = false

	notebook.add_page(, notebook, self._create_melee_page("Masks", self), "Melee")

	slot13 = notebook
	slot12 = false

	notebook.add_page(, notebook, self._create_throwable_page("Melee", self), "Throwable")

	slot10 = main_box

	self._main_frame.set_sizer(, self._main_frame)

	slot10 = true

	self._main_frame.set_visible(, self._main_frame)

	return 
end
function InventoryIconCreator:_create_custom_job(panel, sizer)
	self._custom_ctrlrs = {
		resolution = {}
	}
	slot8 = ""
	local checkbox = EWS.CheckBox(, EWS, panel, "Use current camera setting")
	slot7 = false

	checkbox.set_value(EWS, checkbox)

	slot10 = "EXPAND,RIGHT"

	sizer.add(EWS, sizer, checkbox, 0, 0)

	self._custom_ctrlrs.use_camera_setting = checkbox
	slot7 = "HORIZONTAL"
	local h_sizer = EWS.BoxSizer(EWS, EWS)
	slot11 = "EXPAND"

	sizer.add(EWS, sizer, h_sizer, 0, 0)

	slot10 = ""
	local checkbox = EWS.CheckBox(EWS, EWS, panel, "Use custom resolution")
	slot9 = false

	checkbox.set_value(EWS, checkbox)

	slot12 = "EXPAND,RIGHT"

	h_sizer.add(EWS, h_sizer, checkbox, 0, 4)

	self._custom_ctrlrs.resolution.use = checkbox
	local number_params = {
		value = 64,
		name = "Width:",
		ctrlr_proportions = 1,
		name_proportions = 1,
		tooltip = "Set a number value",
		min = 64,
		sizer_proportions = 1,
		max = 8192,
		panel = panel,
		sizer = h_sizer
	}
	slot9 = number_params
	local ctrlr = CoreEws.number_controller(h_sizer)
	self._custom_ctrlrs.resolution.width = ctrlr
	local number_params = {
		value = 64,
		name = "Height:",
		ctrlr_proportions = 1,
		name_proportions = 1,
		tooltip = "Set a number value",
		min = 64,
		sizer_proportions = 1,
		max = 8192,
		panel = panel,
		sizer = h_sizer
	}
	local ctrlr = CoreEws.number_controller(0)
	self._custom_ctrlrs.resolution.height = ctrlr
	slot16 = "HORIZONTAL"
	slot16 = "EXPAND"

	h_sizer.add(number_params, h_sizer, EWS.BoxSizer(slot14, EWS), 1, 0)

	return 
end
function InventoryIconCreator:_create_weapons_page(notebook)
	slot7 = "TAB_TRAVERSAL"
	local panel = EWS.Panel(slot3, EWS, notebook, "")
	slot6 = "VERTICAL"
	local panel_sizer = EWS.BoxSizer(EWS, EWS)
	slot7 = panel_sizer

	panel.set_sizer(EWS, panel)

	slot9 = ""
	local btn_sizer = EWS.StaticBoxSizer(EWS, EWS, panel, "HORIZONTAL")
	slot11 = "EXPAND"

	panel_sizer.add(EWS, panel_sizer, btn_sizer, 0, 0)

	slot11 = "BU_EXACTFIT,NO_BORDER"
	local all_weapons_btn = EWS.Button(EWS, EWS, panel, "All (vanilla)", "")
	slot12 = "RIGHT,TOP,BOTTOM"

	btn_sizer.add(EWS, btn_sizer, all_weapons_btn, 0, 5)

	slot14 = "start_all_weapons"
	slot11 = false

	all_weapons_btn.connect(EWS, all_weapons_btn, "EVT_COMMAND_BUTTON_CLICKED", callback(5, self, self))

	slot12 = "BU_EXACTFIT,NO_BORDER"
	local one_weapon_btn = EWS.Button(EWS, EWS, panel, "Selected", "")
	slot13 = "RIGHT,TOP,BOTTOM"

	btn_sizer.add(EWS, btn_sizer, one_weapon_btn, 0, 5)

	slot15 = "start_one_weapon"
	slot12 = true

	one_weapon_btn.connect(EWS, one_weapon_btn, "EVT_COMMAND_BUTTON_CLICKED", callback(5, self, self))

	slot13 = "BU_EXACTFIT,NO_BORDER"
	local _btn = EWS.Button(EWS, EWS, panel, "Preview", "")
	slot14 = "RIGHT,TOP,BOTTOM"

	btn_sizer.add(EWS, btn_sizer, _btn, 0, 5)

	slot16 = "preview_one_weapon"
	slot13 = true

	_btn.connect(EWS, _btn, "EVT_COMMAND_BUTTON_CLICKED", callback(5, self, self))

	slot14 = "BU_EXACTFIT,NO_BORDER"
	local _btn = EWS.Button(EWS, EWS, panel, "Selected (all skins)", "")
	slot15 = "RIGHT,TOP,BOTTOM"

	btn_sizer.add(EWS, btn_sizer, _btn, 0, 5)

	slot14 = true

	_btn.connect(EWS, _btn, "EVT_COMMAND_BUTTON_CLICKED", callback(5, self, self))

	slot14 = ""
	local comboboxes_sizer = EWS.StaticBoxSizer(EWS, EWS, panel, "VERTICAL")
	slot16 = "EXPAND"

	panel_sizer.add(EWS, panel_sizer, comboboxes_sizer, 0, 0)

	slot15 = "factory_id"
	slot18 = self
	local weapon_ctrlr = self._add_weapon_ctrlr(EWS, self, panel, comboboxes_sizer, self._get_all_weapons("start_all_weapon_skins"))
	slot19 = "_add_weapon_mods"

	weapon_ctrlr.connect(self, weapon_ctrlr, "EVT_COMMAND_COMBOBOX_SELECTED", callback(self._get_all_weapons, self, self))

	slot19 = "_update_weapon_skins"
	slot16 = nil

	weapon_ctrlr.connect(self, weapon_ctrlr, "EVT_COMMAND_COMBOBOX_SELECTED", callback({
		panel = panel,
		sizer = comboboxes_sizer
	}, self, self))

	slot16 = "weapon_skin"
	slot19 = self
	local weapon_skins_ctrlr = self._add_weapon_ctrlr(self, self, panel, comboboxes_sizer, self._get_weapon_skins(self))
	slot20 = "_set_weapon_skin"
	slot17 = {}

	weapon_skins_ctrlr.connect(self, weapon_skins_ctrlr, "EVT_COMMAND_COMBOBOX_SELECTED", callback(self._get_weapon_skins, self, self))

	slot15 = {
		panel = panel,
		sizer = comboboxes_sizer
	}

	self._add_weapon_mods(self, self)

	return panel
end
function InventoryIconCreator:_add_weapon_mods(params)
	local panel = params.panel
	local sizer = params.sizer
	slot6 = self._weapon_mods_panel

	if alive(slot5) then
		slot6 = self._weapon_mods_panel

		self._weapon_mods_panel.destroy(slot5)

		self._weapon_mods_panel = nil
	end

	slot9 = "FULL_REPAINT_ON_RESIZE"
	self._weapon_mods_panel = EWS.Panel(slot5, EWS, panel, "")
	slot7 = "VERTICAL"
	local panel_sizer = EWS.BoxSizer(slot5, EWS)
	slot8 = panel_sizer

	self._weapon_mods_panel.set_sizer(EWS, self._weapon_mods_panel)

	slot11 = "EXPAND"

	sizer.add(EWS, sizer, self._weapon_mods_panel, 0, 0)

	local factory_id = self._ctrlrs.weapon.factory_id.get_value(EWS)
	slot9 = factory_id
	local blueprint = managers.weapon_factory.get_default_blueprint_by_factory_id(self._ctrlrs.weapon.factory_id, managers.weapon_factory)
	self._ctrlrs.weapon = {
		factory_id = self._ctrlrs.weapon.factory_id,
		weapon_skin = self._ctrlrs.weapon.weapon_skin
	}
	slot10 = factory_id
	local parts = managers.weapon_factory.get_parts_from_factory_id(, managers.weapon_factory)
	local optional_types = tweak_data.weapon.factory[factory_id].optional_types or {}
	slot11 = parts

	for type, options in pairs(slot10) do
		local new_options = {}
		slot19 = blueprint
		local default_part_id = managers.weapon_factory.get_part_id_from_weapon_by_type(slot16, managers.weapon_factory, type)
		slot18 = options

		for _, part_id in ipairs(managers.weapon_factory) do
			local part_data = tweak_data.weapon.factory.parts[part_id]

			if part_data.pcs or part_data.pc then
				slot25 = part_id

				table.insert(slot23, new_options)
			end
		end

		if default_part_id then
			slot20 = default_part_id

			table.insert(slot17, new_options, 1)
		elseif 0 < #new_options then
			slot20 = self.OPTIONAL

			table.insert(slot17, new_options, 1)
		end

		if 0 < #new_options then
			slot23 = default_part_id or self.OPTIONAL

			self._add_weapon_ctrlr(slot17, self, self._weapon_mods_panel, panel_sizer, type, new_options)
		end
	end

	slot11 = self._weapon_mods_panel
	slot11 = self._weapon_mods_panel.parent(slot10)

	self._weapon_mods_panel.parent(slot10).layout(slot10)

	return 
end
function InventoryIconCreator:_add_weapon_ctrlr(panel, sizer, name, options, value)
	local combobox_params = {
		sizer_proportions = 1,
		name_proportions = 1,
		tooltip = "",
		sorted = false,
		ctrlr_proportions = 2
	}
	slot10 = true
	combobox_params.name = string.pretty(slot8, name) .. ":"
	combobox_params.panel = panel
	combobox_params.sizer = sizer
	combobox_params.options = options
	combobox_params.value = value or options[1]
	local ctrlr = CoreEws.combobox(slot8)
	self._ctrlrs.weapon[name] = ctrlr
	slot14 = "ALIGN_RIGHT"
	local text_ctrlr = EWS.StaticText(combobox_params, EWS, panel, "", 0)
	slot15 = "ALIGN_RIGHT"

	sizer.add(EWS, sizer, text_ctrlr, 0, 0)

	slot12 = {
		no_layout = true,
		name = name,
		ctrlr = ctrlr,
		text_ctrlr = text_ctrlr
	}

	self._update_weapon_combobox_text(EWS, self)

	slot17 = "_update_weapon_combobox_text"
	slot14 = {
		name = name,
		ctrlr = ctrlr,
		text_ctrlr = text_ctrlr
	}

	ctrlr.connect(EWS, ctrlr, "EVT_COMMAND_COMBOBOX_SELECTED", callback(0, self, self))

	return ctrlr
end
function InventoryIconCreator:_update_weapon_combobox_text(param)
	local name = param.name
	slot5 = param.ctrlr
	local value = param.ctrlr.get_value(slot4)
	local text = nil

	if name == "factory_id" then
		slot8 = value
		text = managers.weapon_factory.get_weapon_name_by_factory_id(slot6, managers.weapon_factory)
	elseif name == "weapon_skin" then
		local name_id = (tweak_data.blackmarket.weapon_skins[value] and tweak_data.blackmarket.weapon_skins[value].name_id) or "none"
		slot9 = name_id
		text = managers.localization.text(slot7, managers.localization)
	elseif value ~= self.OPTIONAL or not self.OPTIONAL then
		slot8 = value
		text = managers.weapon_factory.get_part_name_by_part_id(slot6, managers.weapon_factory)
	end

	slot8 = text

	param.text_ctrlr.set_value(slot6, param.text_ctrlr)

	if not param.no_layout then
		slot7 = param.text_ctrlr
		slot7 = param.text_ctrlr.parent(slot6)

		param.text_ctrlr.parent(slot6).layout(slot6)
	end

	return 
end
function InventoryIconCreator:_set_weapon_skin()
	local factory_id = self._ctrlrs.weapon.factory_id.get_value(slot2)
	slot4 = self._ctrlrs.weapon.weapon_skin
	local weapon_skin = self._ctrlrs.weapon.weapon_skin.get_value(self._ctrlrs.weapon.factory_id)

	return 
end
function InventoryIconCreator:_update_weapon_skins()
	local weapon_skin = self._ctrlrs.weapon.weapon_skin
	slot4 = weapon_skin

	weapon_skin.clear(slot3)

	slot6 = self

	for _, name in ipairs(self._get_weapon_skins(slot5)) do
		slot10 = name

		weapon_skin.append(slot8, weapon_skin)
	end

	slot5 = "none"

	weapon_skin.set_value(slot3, weapon_skin)

	return 
end
function InventoryIconCreator:_create_masks_page(notebook)
	slot7 = "TAB_TRAVERSAL"
	local panel = EWS.Panel(slot3, EWS, notebook, "")
	slot6 = "VERTICAL"
	local panel_sizer = EWS.BoxSizer(EWS, EWS)
	slot7 = panel_sizer

	panel.set_sizer(EWS, panel)

	slot7 = "HORIZONTAL"
	local btn_sizer = EWS.BoxSizer(EWS, EWS)
	slot11 = "EXPAND"

	panel_sizer.add(EWS, panel_sizer, btn_sizer, 0, 0)

	slot11 = "BU_EXACTFIT,NO_BORDER"
	local _btn = EWS.Button(EWS, EWS, panel, "All (vanilla)", "")
	slot12 = "RIGHT,TOP,BOTTOM"

	btn_sizer.add(EWS, btn_sizer, _btn, 0, 1)

	slot14 = "start_all_masks"
	slot11 = false

	_btn.connect(EWS, _btn, "EVT_COMMAND_BUTTON_CLICKED", callback(1, self, self))

	slot12 = "BU_EXACTFIT,NO_BORDER"
	local _btn = EWS.Button(EWS, EWS, panel, "All (blueprint)", "")
	slot13 = "RIGHT,TOP,BOTTOM"

	btn_sizer.add(EWS, btn_sizer, _btn, 0, 1)

	slot15 = "start_all_masks"
	slot12 = true

	_btn.connect(EWS, _btn, "EVT_COMMAND_BUTTON_CLICKED", callback(1, self, self))

	slot10 = "HORIZONTAL"
	local btn_sizer2 = EWS.BoxSizer(EWS, EWS)
	slot14 = "EXPAND"

	panel_sizer.add(EWS, panel_sizer, btn_sizer2, 0, 0)

	slot14 = "BU_EXACTFIT,NO_BORDER"
	local _btn = EWS.Button(EWS, EWS, panel, "Selected (vanilla)", "")
	slot15 = "RIGHT,TOP,BOTTOM"

	btn_sizer2.add(EWS, btn_sizer2, _btn, 0, 1)

	slot17 = "start_one_mask"
	slot14 = false

	_btn.connect(EWS, _btn, "EVT_COMMAND_BUTTON_CLICKED", callback(1, self, self))

	slot15 = "BU_EXACTFIT,NO_BORDER"
	local _btn = EWS.Button(EWS, EWS, panel, "Selected (blueprint)", "")
	slot16 = "RIGHT,TOP,BOTTOM"

	btn_sizer2.add(EWS, btn_sizer2, _btn, 0, 1)

	slot18 = "start_one_mask"
	slot15 = true

	_btn.connect(EWS, _btn, "EVT_COMMAND_BUTTON_CLICKED", callback(1, self, self))

	slot13 = "HORIZONTAL"
	local btn_sizer3 = EWS.BoxSizer(EWS, EWS)
	slot17 = "EXPAND"

	panel_sizer.add(EWS, panel_sizer, btn_sizer3, 0, 0)

	slot17 = "BU_EXACTFIT,NO_BORDER"
	local _btn = EWS.Button(EWS, EWS, panel, "Preview (vanilla)", "")
	slot18 = "RIGHT,TOP,BOTTOM"

	btn_sizer3.add(EWS, btn_sizer3, _btn, 0, 1)

	slot20 = "preview_one_mask"
	slot17 = false

	_btn.connect(EWS, _btn, "EVT_COMMAND_BUTTON_CLICKED", callback(1, self, self))

	slot18 = "BU_EXACTFIT,NO_BORDER"
	local _btn = EWS.Button(EWS, EWS, panel, "Preview (blueprint)", "")
	slot19 = "RIGHT,TOP,BOTTOM"

	btn_sizer3.add(EWS, btn_sizer3, _btn, 0, 1)

	slot18 = true

	_btn.connect(EWS, _btn, "EVT_COMMAND_BUTTON_CLICKED", callback(1, self, self))

	slot18 = ""
	local comboboxes_sizer = EWS.StaticBoxSizer(EWS, EWS, panel, "VERTICAL")
	slot20 = "EXPAND"

	panel_sizer.add(EWS, panel_sizer, comboboxes_sizer, 0, 0)

	slot19 = "mask_id"
	local mask_ctrlr = self._add_mask_ctrlr(EWS, self, panel, comboboxes_sizer, self._get_all_masks("preview_one_mask"))
	slot23 = tweak_data.blackmarket.colors

	self._add_mask_ctrlr(self, self, panel, comboboxes_sizer, "color", table.map_keys(self))

	slot23 = tweak_data.blackmarket.materials

	self._add_mask_ctrlr(self, self, panel, comboboxes_sizer, "material", table.map_keys("nothing"))

	slot23 = tweak_data.blackmarket.textures
	slot22 = "no_color_no_material"

	self._add_mask_ctrlr(self, self, panel, comboboxes_sizer, "pattern", table.map_keys("plastic"))

	return panel
end
function InventoryIconCreator:_add_mask_ctrlr(panel, sizer, name, options, value)
	local combobox_params = {
		sizer_proportions = 1,
		name_proportions = 1,
		tooltip = "",
		sorted = false,
		ctrlr_proportions = 2
	}
	slot10 = true
	combobox_params.name = string.pretty(slot8, name) .. ":"
	combobox_params.panel = panel
	combobox_params.sizer = sizer
	combobox_params.options = options
	combobox_params.value = value or options[1]
	local ctrlr = CoreEws.combobox(slot8)
	self._ctrlrs.mask[name] = ctrlr
	slot14 = "ALIGN_RIGHT"
	local text_ctrlr = EWS.StaticText(combobox_params, EWS, panel, "", 0)
	slot15 = "ALIGN_RIGHT"

	sizer.add(EWS, sizer, text_ctrlr, 0, 0)

	slot12 = {
		no_layout = true,
		name = name,
		ctrlr = ctrlr,
		text_ctrlr = text_ctrlr
	}

	self._update_mask_combobox_text(EWS, self)

	slot17 = "_update_mask_combobox_text"
	slot14 = {
		name = name,
		ctrlr = ctrlr,
		text_ctrlr = text_ctrlr
	}

	ctrlr.connect(EWS, ctrlr, "EVT_COMMAND_COMBOBOX_SELECTED", callback(0, self, self))

	return ctrlr
end
function InventoryIconCreator:_update_mask_combobox_text(params)
	local name = params.name
	slot5 = params.ctrlr
	local value = params.ctrlr.get_value(slot4)
	local text = nil

	if name == "mask_id" then
		slot8 = tweak_data.blackmarket.masks[value].name_id
		text = managers.localization.text(slot6, managers.localization)
	elseif name == "color" then
		slot8 = tweak_data.blackmarket.colors[value].name_id
		text = managers.localization.text(slot6, managers.localization)
	elseif name == "material" then
		slot8 = tweak_data.blackmarket.materials[value].name_id
		text = managers.localization.text(slot6, managers.localization)
	elseif name == "pattern" then
		slot8 = tweak_data.blackmarket.textures[value].name_id
		text = managers.localization.text(slot6, managers.localization)
	end

	slot8 = text

	params.text_ctrlr.set_value(slot6, params.text_ctrlr)

	if not params.no_layout then
		slot7 = params.text_ctrlr
		slot7 = params.text_ctrlr.parent(slot6)

		params.text_ctrlr.parent(slot6).layout(slot6)
	end

	return 
end
function InventoryIconCreator:_create_melee_page(notebook)
	slot7 = "TAB_TRAVERSAL"
	local panel = EWS.Panel(slot3, EWS, notebook, "")
	slot6 = "VERTICAL"
	local panel_sizer = EWS.BoxSizer(EWS, EWS)
	slot7 = panel_sizer

	panel.set_sizer(EWS, panel)

	slot9 = ""
	local btn_sizer = EWS.StaticBoxSizer(EWS, EWS, panel, "HORIZONTAL")
	slot11 = "EXPAND"

	panel_sizer.add(EWS, panel_sizer, btn_sizer, 0, 0)

	slot11 = "BU_EXACTFIT,NO_BORDER"
	local _btn = EWS.Button(EWS, EWS, panel, "All", "")
	slot12 = "RIGHT,TOP,BOTTOM"

	btn_sizer.add(EWS, btn_sizer, _btn, 0, 1)

	slot14 = "start_all_melee"
	slot11 = false

	_btn.connect(EWS, _btn, "EVT_COMMAND_BUTTON_CLICKED", callback(1, self, self))

	slot12 = "BU_EXACTFIT,NO_BORDER"
	local _btn = EWS.Button(EWS, EWS, panel, "Selected", "")
	slot13 = "RIGHT,TOP,BOTTOM"

	btn_sizer.add(EWS, btn_sizer, _btn, 0, 1)

	slot15 = "start_one_melee"
	slot12 = false

	_btn.connect(EWS, _btn, "EVT_COMMAND_BUTTON_CLICKED", callback(1, self, self))

	slot13 = "BU_EXACTFIT,NO_BORDER"
	local _btn = EWS.Button(EWS, EWS, panel, "Preview", "")
	slot14 = "RIGHT,TOP,BOTTOM"

	btn_sizer.add(EWS, btn_sizer, _btn, 0, 1)

	slot13 = false

	_btn.connect(EWS, _btn, "EVT_COMMAND_BUTTON_CLICKED", callback(1, self, self))

	slot13 = ""
	local comboboxes_sizer = EWS.StaticBoxSizer(EWS, EWS, panel, "VERTICAL")
	slot15 = "EXPAND"

	panel_sizer.add(EWS, panel_sizer, comboboxes_sizer, 0, 0)

	slot14 = "melee_id"
	slot17 = self
	local melee_ctrlr = self._add_melee_ctrlr(EWS, self, panel, comboboxes_sizer, self._get_all_melee("preview_one_melee"))

	return panel
end
function InventoryIconCreator:_add_melee_ctrlr(panel, sizer, name, options, value)
	local combobox_params = {
		sizer_proportions = 1,
		name_proportions = 1,
		tooltip = "",
		sorted = false,
		ctrlr_proportions = 2
	}
	slot10 = true
	combobox_params.name = string.pretty(slot8, name) .. ":"
	combobox_params.panel = panel
	combobox_params.sizer = sizer
	combobox_params.options = options
	combobox_params.value = value or options[1]
	local ctrlr = CoreEws.combobox(slot8)
	self._ctrlrs.melee[name] = ctrlr
	slot14 = "ALIGN_RIGHT"
	local text_ctrlr = EWS.StaticText(combobox_params, EWS, panel, "", 0)
	slot15 = "ALIGN_RIGHT"

	sizer.add(EWS, sizer, text_ctrlr, 0, 0)

	slot12 = {
		no_layout = true,
		name = name,
		ctrlr = ctrlr,
		text_ctrlr = text_ctrlr
	}

	self._update_melee_combobox_text(EWS, self)

	slot17 = "_update_melee_combobox_text"
	slot14 = {
		name = name,
		ctrlr = ctrlr,
		text_ctrlr = text_ctrlr
	}

	ctrlr.connect(EWS, ctrlr, "EVT_COMMAND_COMBOBOX_SELECTED", callback(0, self, self))

	return ctrlr
end
function InventoryIconCreator:_update_melee_combobox_text(params)
	local name = params.name
	slot5 = params.ctrlr
	local value = params.ctrlr.get_value(slot4)
	local text = nil

	if name == "melee_id" then
		slot8 = tweak_data.blackmarket.melee_weapons[value].name_id
		text = managers.localization.text(slot6, managers.localization)
	end

	slot8 = text

	params.text_ctrlr.set_value(slot6, params.text_ctrlr)

	if not params.no_layout then
		slot7 = params.text_ctrlr
		slot7 = params.text_ctrlr.parent(slot6)

		params.text_ctrlr.parent(slot6).layout(slot6)
	end

	return 
end
function InventoryIconCreator:_create_throwable_page(notebook)
	slot7 = "TAB_TRAVERSAL"
	local panel = EWS.Panel(slot3, EWS, notebook, "")
	slot6 = "VERTICAL"
	local panel_sizer = EWS.BoxSizer(EWS, EWS)
	slot7 = panel_sizer

	panel.set_sizer(EWS, panel)

	slot9 = ""
	local btn_sizer = EWS.StaticBoxSizer(EWS, EWS, panel, "HORIZONTAL")
	slot11 = "EXPAND"

	panel_sizer.add(EWS, panel_sizer, btn_sizer, 0, 0)

	slot11 = "BU_EXACTFIT,NO_BORDER"
	local _btn = EWS.Button(EWS, EWS, panel, "All", "")
	slot12 = "RIGHT,TOP,BOTTOM"

	btn_sizer.add(EWS, btn_sizer, _btn, 0, 1)

	slot14 = "start_all_throwable"
	slot11 = false

	_btn.connect(EWS, _btn, "EVT_COMMAND_BUTTON_CLICKED", callback(1, self, self))

	slot12 = "BU_EXACTFIT,NO_BORDER"
	local _btn = EWS.Button(EWS, EWS, panel, "Selected", "")
	slot13 = "RIGHT,TOP,BOTTOM"

	btn_sizer.add(EWS, btn_sizer, _btn, 0, 1)

	slot15 = "start_one_throwable"
	slot12 = false

	_btn.connect(EWS, _btn, "EVT_COMMAND_BUTTON_CLICKED", callback(1, self, self))

	slot13 = "BU_EXACTFIT,NO_BORDER"
	local _btn = EWS.Button(EWS, EWS, panel, "Preview", "")
	slot14 = "RIGHT,TOP,BOTTOM"

	btn_sizer.add(EWS, btn_sizer, _btn, 0, 1)

	slot13 = false

	_btn.connect(EWS, _btn, "EVT_COMMAND_BUTTON_CLICKED", callback(1, self, self))

	slot13 = ""
	local comboboxes_sizer = EWS.StaticBoxSizer(EWS, EWS, panel, "VERTICAL")
	slot15 = "EXPAND"

	panel_sizer.add(EWS, panel_sizer, comboboxes_sizer, 0, 0)

	slot14 = "throwable_id"
	slot17 = self
	local throwable_ctrlr = self._add_throwable_ctrlr(EWS, self, panel, comboboxes_sizer, self._get_all_throwable("preview_one_throwable"))

	return panel
end
function InventoryIconCreator:_add_throwable_ctrlr(panel, sizer, name, options, value)
	local combobox_params = {
		sizer_proportions = 1,
		name_proportions = 1,
		tooltip = "",
		sorted = false,
		ctrlr_proportions = 2
	}
	slot10 = true
	combobox_params.name = string.pretty(slot8, name) .. ":"
	combobox_params.panel = panel
	combobox_params.sizer = sizer
	combobox_params.options = options
	combobox_params.value = value or options[1]
	local ctrlr = CoreEws.combobox(slot8)
	self._ctrlrs.throwable[name] = ctrlr
	slot14 = "ALIGN_RIGHT"
	local text_ctrlr = EWS.StaticText(combobox_params, EWS, panel, "", 0)
	slot15 = "ALIGN_RIGHT"

	sizer.add(EWS, sizer, text_ctrlr, 0, 0)

	slot12 = {
		no_layout = true,
		name = name,
		ctrlr = ctrlr,
		text_ctrlr = text_ctrlr
	}

	self._update_throwable_combobox_text(EWS, self)

	slot17 = "_update_throwable_combobox_text"
	slot14 = {
		name = name,
		ctrlr = ctrlr,
		text_ctrlr = text_ctrlr
	}

	ctrlr.connect(EWS, ctrlr, "EVT_COMMAND_COMBOBOX_SELECTED", callback(0, self, self))

	return ctrlr
end
function InventoryIconCreator:_update_throwable_combobox_text(params)
	local name = params.name
	slot5 = params.ctrlr
	local value = params.ctrlr.get_value(slot4)
	local text = nil

	if name == "throwable_id" then
		slot8 = tweak_data.projectiles[value].name_id

		print(slot6, value)

		slot8 = tweak_data.projectiles[value].name_id or "N/A"
		text = managers.localization.text(slot6, managers.localization)
	end

	slot8 = text

	params.text_ctrlr.set_value(slot6, params.text_ctrlr)

	if not params.no_layout then
		slot7 = params.text_ctrlr
		slot7 = params.text_ctrlr.parent(slot6)

		params.text_ctrlr.parent(slot6).layout(slot6)
	end

	return 
end
function InventoryIconCreator:close_ews()
	slot3 = self._weapon_mods_panel

	if alive(slot2) then
		slot3 = self._weapon_mods_panel

		self._weapon_mods_panel.destroy(slot2)

		self._weapon_mods_panel = nil
	end

	if self._main_frame then
		slot3 = self._main_frame

		self._main_frame.destroy(slot2)

		self._main_frame = nil
	end

	return 
end

return 
