local ThisModPath = ModPath
local ThisModIds = Idstring(ThisModPath):key()
local __Name = function(__id)
	return "DAMH_"..Idstring(tostring(__id).."::"..ThisModIds):key()
end
local movie_ids = Idstring("movie")
local sound_path = ThisModPath.."Assets/DallasAhhh000000.movie"
local sound_path_ids = Idstring(sound_path)

Hooks:PostHook(CopDamage, "damage_melee", __Name("damage_melee"), function(self, attack_data)
	if attack_data.attacker_unit and attack_data.attacker_unit == managers.player:player_unit() then
		if DB:has(movie_ids, sound_path_ids) then
			local p = managers.menu_component._main_panel
			local name = __Name("sound_path")
			if alive(p:child(name)) then
				managers.menu_component._main_panel:remove(p:child(name))
			end
			local sfx_volume = math.clamp(managers.user:get_setting("sfx_volume"), 0, 100)
			managers.menu_component._main_panel:video({
				name = name,
				video = sound_path,
				visible = false,
				loop = false,
			}):set_volume_gain(volume/100)
		else
			if io.file_is_readable(sound_path) then
				DB:create_entry(movie_ids, sound_path_ids, sound_path)
			end
		end
	end
end)

if not DB:has(movie_ids, sound_path_ids) and io.file_is_readable(sound_path) then
	DB:create_entry(movie_ids, sound_path_ids, sound_path)
end