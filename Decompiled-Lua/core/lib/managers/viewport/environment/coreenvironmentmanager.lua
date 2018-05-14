slot3 = "CoreEnvironmentManager"

core.module(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

slot3 = "CoreEnvironmentHandler"

core.import(slot1, core)

slot3 = "CoreEnvironmentFeeder"

core.import(slot1, core)

EnvironmentManager = EnvironmentManager or CoreClass.class()
local extension = "environment"
slot3 = extension
local ids_extension = Idstring(slot2)
function EnvironmentManager:init()
	self._env_data_map = {}
	self._feeder_class_map = {}
	self._global_feeder_map = {}
	self._predefined_environment_filter_map = {}
	self._global_environment_modifier_map = {}
	self._game_default_environment_path = "core/environments/default"
	self._default_environment_path = self._game_default_environment_path
	local feeder_class_list = {
		CoreEnvironmentFeeder.ColorgradeFeeder,
		CoreEnvironmentFeeder.UnderlayPathFeeder,
		CoreEnvironmentFeeder.GlobalLightColorFeeder,
		CoreEnvironmentFeeder.GlobalLightColorScaleFeeder,
		CoreEnvironmentFeeder.CubeMapTextureFeeder,
		CoreEnvironmentFeeder.WorldOverlayTextureFeeder,
		CoreEnvironmentFeeder.WorldOverlayMaskTextureFeeder,
		CoreEnvironmentFeeder.SkyRotationFeeder,
		CoreEnvironmentFeeder.UnderlaySkyTopColorFeeder,
		CoreEnvironmentFeeder.UnderlaySkyTopColorScaleFeeder,
		CoreEnvironmentFeeder.UnderlaySkyBottomColorFeeder,
		CoreEnvironmentFeeder.UnderlaySkyBottomColorScaleFeeder,
		CoreEnvironmentFeeder.PostSpecFactorFeeder,
		CoreEnvironmentFeeder.PostGlossFactorFeeder,
		CoreEnvironmentFeeder.PostAmbientFalloffScaleFeeder,
		CoreEnvironmentFeeder.PostAmbientColorFeeder,
		CoreEnvironmentFeeder.PostAmbientColorScaleFeeder,
		CoreEnvironmentFeeder.PostSkyTopColorFeeder,
		CoreEnvironmentFeeder.PostSkyTopColorFeeder,
		CoreEnvironmentFeeder.PostSkyTopColorScaleFeeder,
		CoreEnvironmentFeeder.PostSkyBottomColorFeeder,
		CoreEnvironmentFeeder.PostSkyBottomColorScaleFeeder,
		CoreEnvironmentFeeder.PostFogStartColorFeeder,
		CoreEnvironmentFeeder.PostFogFarLowColorFeeder,
		CoreEnvironmentFeeder.PostFogMinRangeFeeder,
		CoreEnvironmentFeeder.PostFogMaxRangeFeeder,
		CoreEnvironmentFeeder.PostFogMaxDensityFeeder,
		CoreEnvironmentFeeder.PostEffectLightScaleFeeder,
		CoreEnvironmentFeeder.SSAORadiusFeeder,
		CoreEnvironmentFeeder.SSAOIntensityFeeder,
		CoreEnvironmentFeeder.PostBloomIntensityFeeder,
		CoreEnvironmentFeeder.PostLFGhostDispersalFeeder,
		CoreEnvironmentFeeder.PostLFHaloWidthFeeder,
		CoreEnvironmentFeeder.PostLFChromaticDistortionFeeder,
		CoreEnvironmentFeeder.PostLFWeightExponentFeeder,
		CoreEnvironmentFeeder.PostLFDownsampleScaleFeeder,
		CoreEnvironmentFeeder.PostLFDownsampleBiasFeeder,
		CoreEnvironmentFeeder.PostVLSDensityFeeder,
		CoreEnvironmentFeeder.PostVLSWeightFeeder,
		CoreEnvironmentFeeder.PostVLSDecayFeeder,
		CoreEnvironmentFeeder.PostVLSExposureFeeder,
		CoreEnvironmentFeeder.PostShadowSlice0Feeder,
		CoreEnvironmentFeeder.PostShadowSlice1Feeder,
		CoreEnvironmentFeeder.PostShadowSlice2Feeder,
		CoreEnvironmentFeeder.PostShadowSlice3Feeder,
		CoreEnvironmentFeeder.PostShadowSliceDepthsFeeder,
		CoreEnvironmentFeeder.PostShadowSliceOverlapFeeder
	}
	slot4 = feeder_class_list

	for _, feeder_class in ipairs(slot3) do
		self._feeder_class_map[feeder_class.DATA_PATH_KEY] = feeder_class

		if feeder_class.FILTER_CATEGORY then
			local filter_list = self._predefined_environment_filter_map[feeder_class.FILTER_CATEGORY]

			if not filter_list then
				filter_list = {}
				self._predefined_environment_filter_map[feeder_class.FILTER_CATEGORY] = filter_list
			end

			slot11 = feeder_class.DATA_PATH_KEY

			table.insert(slot9, filter_list)
		end
	end

	slot5 = self._game_default_environment_path

	self.preload_environment(slot3, self)

	return 
end
function EnvironmentManager:destroy()
	self._env_data_map = nil
	self._feeder_class_map = nil
	self._global_feeder_map = nil
	self._predefined_environment_filter_map = nil
	self._global_environment_modifier_map = nil

	return 
end
function EnvironmentManager:preload_environment(path)
	if not self._env_data_map[path] then
		slot6 = path
		self._env_data_map[path] = self._load(slot4, self)
	end

	return 
end
function EnvironmentManager:has_data_path_key(data_path_key)
	return self._feeder_class_map[data_path_key] ~= nil
end
function EnvironmentManager:get_predefined_environment_filter_map()
	return self._predefined_environment_filter_map
end
function EnvironmentManager:get_value(path, data_path_key)
	slot6 = path
	local env_data = self._get_data(slot4, self)

	if not env_data then
		slot7 = "[EnvironmentManager] Invalid environment path: " .. path

		Application.stack_dump_error(slot5, Application)

		return nil
	end

	local value = env_data[data_path_key]

	if not value then
		slot8 = "[EnvironmentManager] Invalid data path."

		Application.stack_dump_error(slot6, Application)
	end

	return value
end
function EnvironmentManager:set_global_environment_modifier(data_path_key, is_override, modifier_func)
	local global_modifier_data = nil

	if modifier_func then
		global_modifier_data = {
			is_override = is_override,
			modifier_func = modifier_func
		}
	end

	self._global_environment_modifier_map[data_path_key] = global_modifier_data

	return 
end
function EnvironmentManager:set_default_environment(default_environment_path)
	self._default_environment_path = default_environment_path

	return 
end
function EnvironmentManager:default_environment()
	return self._default_environment_path
end
function EnvironmentManager:game_default_environment()
	return self._game_default_environment_path
end
function EnvironmentManager:_set_global_feeder(feeder)
	local old_feeder = self._global_feeder_map[feeder.DATA_PATH_KEY]
	self._global_feeder_map[feeder.DATA_PATH_KEY] = feeder

	return old_feeder
end
function EnvironmentManager:editor_add_created_callback(func)
	self._created_callback_list = self._created_callback_list or {}
	slot5 = func

	table.insert(slot3, self._created_callback_list)

	return 
end
function EnvironmentManager:editor_reload(path)
	slot5 = path .. "." .. extension
	local entry_path = managers.database.entry_relative_path(slot3, managers.database)
	slot6 = entry_path
	local is_new = not managers.database.has(managers.database, managers.database)
	local source_files = {
		entry_path
	}
	slot10 = "environment"

	for _, old_path in ipairs(managers.database.list_entries_of_type(slot8, managers.database)) do
		slot13 = old_path .. "." .. extension

		table.insert(slot11, source_files)
	end

	local compile_settings = {
		target_db_name = "all",
		send_idstrings = false,
		preprocessor_definitions = "preprocessor_definitions",
		verbose = false
	}
	slot10 = SystemInfo
	slot10 = SystemInfo.platform(slot9)
	compile_settings.platform = string.lower(SystemInfo.platform(slot9).s(slot9))
	slot8 = managers.database
	compile_settings.source_root = managers.database.base_path(slot7)
	slot8 = Application
	compile_settings.target_db_root = Application.base_path(slot7) .. "assets"
	compile_settings.source_files = source_files
	slot9 = compile_settings

	Application.data_compile("assets", Application)

	slot8 = DB

	DB.reload("assets")

	slot8 = managers.database

	managers.database.clear_all_cached_indices("assets")

	slot9 = ids_extension
	slot12 = path

	PackageManager.reload("assets", PackageManager, path.id(slot11))

	if self._env_data_map[path] then
		slot10 = path
		self._env_data_map[path] = self._load(slot8, self)
	end

	if is_new and self._created_callback_list then
		slot8 = self._created_callback_list

		for _, func in ipairs(slot7) do
			slot13 = path

			func(slot12)
		end
	end

	return 
end
function EnvironmentManager:_get_data(path)
	local env_data = self._env_data_map[path]

	if not env_data then
		slot5 = Application

		if not Application.editor(slot4) then
			slot9 = path
			slot6 = "[EnvironmentManager] Environment was not preloaded: " .. tostring(slot8)

			Application.stack_dump_error(slot4, Application)
		end

		slot6 = path
		env_data = self._load(slot4, self)
		self._env_data_map[path] = env_data
	end

	return env_data
end
function EnvironmentManager:_create_feeder(data_path_key, value)
	slot6 = value
	local feeder = self._feeder_class_map[data_path_key].new(slot4, self._feeder_class_map[data_path_key])
	local global_modifier_data = self._global_environment_modifier_map[data_path_key]

	if global_modifier_data then
		slot9 = global_modifier_data.is_override

		feeder.set_modifier(slot6, feeder, global_modifier_data.modifier_func)
	end

	return feeder
end
function EnvironmentManager:_load(path)
	local raw_data = nil
	slot5 = Application

	if Application.editor(slot4) then
		slot6 = ids_extension
		slot9 = path
		raw_data = PackageManager.editor_load_script_data(slot4, PackageManager, path.id(slot8))
	else
		slot6 = ids_extension
		slot9 = path
		raw_data = PackageManager.script_data(slot4, PackageManager, path.id(slot8))
	end

	local env_data = {}
	slot10 = path

	self._load_env_data(slot5, self, nil, env_data, raw_data.data)

	return env_data
end
function EnvironmentManager:_load_env_data(data_path, env_data, raw_data, path)
	slot7 = raw_data

	for _, sub_raw_data in ipairs(slot6) do
		if sub_raw_data._meta == "param" then
			local next_data_path = (data_path and data_path .. "/" .. sub_raw_data.key) or sub_raw_data.key
			slot13 = next_data_path
			slot13 = Idstring(slot12)
			local next_data_path_key = Idstring(slot12).key(slot12)

			if self._feeder_class_map[next_data_path_key] then
				env_data[next_data_path_key] = sub_raw_data.value
			else
				slot15 = "[EnvironmentManager] Invalid data path: " .. next_data_path .. " in " .. path

				Application.error(slot13, Application)
			end
		else
			next_data_path = (data_path and data_path .. "/" .. sub_raw_data._meta) or sub_raw_data._meta
			slot17 = path

			self._load_env_data(slot12, self, next_data_path, env_data, sub_raw_data)
		end
	end

	return 
end

return 
