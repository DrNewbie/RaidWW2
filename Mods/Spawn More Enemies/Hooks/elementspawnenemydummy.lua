core:import("CoreMissionScriptElement")
ElementSpawnEnemyDummy = ElementSpawnEnemyDummy or class(CoreMissionScriptElement.MissionScriptElement)

local SME_ElementSpawnEnemyDummy_ori_produce = ElementSpawnEnemyDummy.produce

function ElementSpawnEnemyDummy:produce(params)
	local cloner = math.round(SMEGKey.Options:GetValue("Cloner"))
	local unit = SME_ElementSpawnEnemyDummy_ori_produce(self, params)
	if not DB:has(Idstring("unit"), unit:name()) then
		return unit
	end
	if cloner <= 0 or not managers.groupai or not managers.groupai:state() then
		return unit
	end
	local gro = managers.groupai:state()
	if not gro:is_AI_enabled() or not gro:enemy_weapons_hot() or gro:whisper_mode() then
		return unit
	end
	if unit:character_damage()._invulnerable or unit:character_damage()._immortal or unit:character_damage()._dead then
		return unit
	end
	local _spawn_enemy = function (unit_name, pos, rot)
		local unit_done = safe_spawn_unit(unit_name, pos, rot)
		local team_id = tweak_data.levels:get_default_team_ID(unit_done:base():char_tweak().access)
		unit_done:movement():set_team(gro:team_data(team_id))
		gro:assign_enemy_to_group_ai(unit_done, team_id)
		return unit_done
	end
	local _pos_offset = function ()
		local ang = math.random() * 360 * math.pi
		local rad = math.random(30, 50)
		return Vector3(math.cos(ang) * rad, math.sin(ang) * rad, 0)
	end
	local pos, rot = self:get_orientation()
	for i = 1, cloner do
		_spawn_enemy(unit:name(), pos + _pos_offset(), rot)
	end
	return unit
end