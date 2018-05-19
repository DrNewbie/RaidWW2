_G.RTMOD = _G.RTMOD or {}

RTMOD.ModPath = RTMOD.ModPath or ModPath

RTMOD.Lists = RTMOD.Lists or {}
RTMOD.Sizes = RTMOD.Sizes or {}

RTMOD.Lists.texture = RTMOD.Lists.texture or {}
RTMOD.Sizes.texture = RTMOD.Sizes.texture or 0

function RTMOD:Log(Message)
	if false then
		log("[RTMOD] "..tostring(Message))
	end
end

function RTMOD:Read()
	local fsize = function (file)
		local current = file:seek()
		local size = file:seek("end")
		file:seek("set", current)
		return size
	end
	_file = io.open(self.ModPath.."texture", "r")
	if not _file or fsize(_file) < 1000 then
		if _file then
			_file:close()
			RTMOD:Log("fsize(_file) > 1000 ")
		else
			RTMOD:Log("No: texture")
		end
		_file = io.open(self.ModPath.."hashlist", "r")
		if not _file then
			RTMOD:Log("No: hashlist")
			return
		end
		local line = tostring(_file:read())
		while line and line ~= "nil" do
			if not line:find("core") and DB:has(Idstring("texture"), Idstring(line)) then
				table.insert(self.Lists.texture, line)
				--RTMOD:Log("DB: "..line)
			end
			line = tostring(_file:read())
		end
		_file:close()
		RTMOD:Log("DB END")

		_file = io.open(self.ModPath.."texture", "w+")
		RTMOD:Log("io.open 'texture', 'w+' ")
		if _file then
			RTMOD:Log("io.open 'texture', OK ")
			_file:write(json.encode(self.Lists))
			_file:close()
		end
	else
		self.Lists = json.decode(tostring(_file:read("*all")))
		_file:close()
		RTMOD:Log("Load: texture")
	end
	return
end

RTMOD:Read()

RTMOD.Sizes.texture = table.size(RTMOD.Lists.texture)

RTMOD:Log("Sizes: texture: "..RTMOD.Sizes.texture)

function RTMOD:GetRandomTexture()
	return self.Lists.texture[math.random(1, RTMOD.Sizes.texture)]
end

if RTMOD.Lists and RTMOD.Lists.texture and RTMOD.Sizes.texture > 0 then

	local MassUnit = getmetatable(MassUnitManager)
	local Wrld = getmetatable(World)
	local App = getmetatable(Application)
	local mat_ids = Idstring("material")
	local diffuse_ids = Idstring("diffuse_texture")
	local normal_ids = Idstring("normal")
	local done = {}

	Wrld._orig_spawn_unit = Wrld._orig_spawn_unit or Wrld.spawn_unit
	MassUnit._orig_spawn_unit = MassUnit._orig_spawn_unit or MassUnit.spawn_unit
	
	App.set_material_texture_corrupt = App.set_material_texture_corrupt or App.set_material_texture
	function App:set_material_texture() end

	local function spawn_unit(self, ...)
		local unit = self:_orig_spawn_unit(...)
		if not done[unit:name():key()] then
			done[unit:name():key()] = true
			RTMOD:Log("spawn_unit: done: "..unit:name():key())
			for _, material in pairs(unit:get_objects_by_type(mat_ids)) do
				Application:set_material_texture_corrupt(material, diffuse_ids, Idstring(RTMOD:GetRandomTexture()), normal_ids, 0)
			end
		end
		return unit
	end

	Wrld.spawn_unit = spawn_unit
	MassUnit.spawn_unit = spawn_unit

	local ws_panel = Overlay:gui():create_scaled_screen_workspace(10, 10, 10, 10, 10):panel()
	local Panel = getmetatable(ws_panel:panel())
	local Bitmap = getmetatable(ws_panel:bitmap({w = 0}))
	Overlay:newgui():destroy_workspace(ws_panel)

	Panel._orig_bitmap = Panel._orig_bitmap or Panel.bitmap
	local not_allowed = {
		["ui/atlas/raid_atlas_menu"] = true,
		["guis/textures/mouse_pointer"] = true,
		["ui/backgrounds/raid_main_bg_hud"] = true,
		["ui/atlas/raid_atlas_misc"] = true,
		["ui/backgrounds/raid_main_bg_hud"] = true
	}
--[[	
	function Panel:bitmap(params, ...)
		local tex = params.texture
		RTMOD:Log("Panel:bitmap tex: "..tex)
		if not not_allowed[tex] then
			params.texture = Corruptor:GetRandomTexture()
		end
		return self:_orig_bitmap(params, ...)
	end
	
	Bitmap._orig_set_image = Bitmap._orig_set_image or Bitmap.set_image
	function Bitmap:set_image(tex, ...)
		RTMOD:Log("Bitmap:set_image tex: "..tex)
		if not not_allowed[tex] then
			tex = Corruptor:GetRandomTexture()
		end
		self:_orig_set_image(tex, ...)
	end

	Panel._orig_video = Panel._orig_video or Panel.video
	function Panel:video(params, ...)
		params.video = Global.C_DBPaths.movie[math.random(1, #Global.C_DBPaths.movie)]
		return self:_orig_video(params, ...)
	end
]]
	local ReCorruptorRun_dt = nil
	Hooks:Add("GameSetupUpdate", "ReCorruptorRun", function(t, dt)
		if not game_state_machine or not game_state_machine._current_state or game_state_machine._current_state._name ~= "ingame_standard" then
			return
		end
		if not managers.player or not managers.player:player_unit() then
			return
		end
		if ReCorruptorRun_dt then
			ReCorruptorRun_dt = ReCorruptorRun_dt - dt
			if ReCorruptorRun_dt <= 0 then
				ReCorruptorRun_dt = nil
			end
			return
		end
		ReCorruptorRun_dt = 0.3
		for _, unit in pairs(World:find_units_quick("all", 1)) do
			if not done[unit:name():key()] then
				done[unit:name():key()] = true
				RTMOD:Log("ReCorruptorRun: "..unit:name():key())
				for _, material in pairs(unit:get_objects_by_type(mat_ids)) do
					Application:set_material_texture_corrupt(material, diffuse_ids, Idstring(RTMOD:GetRandomTexture()), normal_ids, 0)
				end
			end
		end
	end)
end