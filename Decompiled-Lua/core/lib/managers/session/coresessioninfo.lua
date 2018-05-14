slot3 = "CoreSessionInfo"

core.module(slot1, core)

Info = Info or class()
function Info:init()
	return 
end
function Info:is_ranked()
	return self._is_ranked
end
function Info:can_join_in_progress()
	return self._can_join_in_progress
end
function Info:set_can_join_in_progress(possible)
	self._can_join_in_progress = possible

	return 
end
function Info:set_level_name(name)
	self._level_name = name

	return 
end
function Info:level_name()
	return self._level_name
end
function Info:set_stage_name(stage_name)
	self._stage_name = stage_name

	return 
end
function Info:stage_name()
	return self._stage_name
end
function Info:set_run_mission_script(with_mission)
	self._run_mission_script = with_mission

	return 
end
function Info:should_run_mission_script()
	return self._run_mission_script
end
function Info:set_should_load_level(load_level)
	self._should_load_level = load_level

	return 
end
function Info:should_load_level()
	return self._should_load_level
end

return 
