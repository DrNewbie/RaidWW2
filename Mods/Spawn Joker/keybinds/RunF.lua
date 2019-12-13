local function SpawnEnemy()
	local gro = managers.groupai:state()
	if not gro then
		return
	end
	local ply_unit = managers.player:player_unit()
	if not ply_unit or not alive(ply_unit) then
		return
	end
	local PlyStandard = ply_unit:movement() and ply_unit:movement()._states.standard
	if not PlyStandard then
		return
	end
	local _spawn_enemy = function (unit_name, pos, rot)
		if true then
			local unit_done = safe_spawn_unit(unit_name, pos, rot)
			local team_id = tweak_data.levels:get_default_team_ID("player")
			unit_done:movement():set_team(gro:team_data(team_id))
			unit_done:brain():convert_to_criminal(ply_unit)
			unit_done:character_damage():set_invulnerable(true)
			return unit_done
		end
	end
	_spawn_enemy(Idstring("units/vanilla/characters/enemies/models/german_flamer/german_flamer"), ply_unit:position(), Vector3())
end

SpawnEnemy()