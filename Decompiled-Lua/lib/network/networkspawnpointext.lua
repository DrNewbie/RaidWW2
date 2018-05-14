NetworkSpawnPointExt = NetworkSpawnPointExt or class()
function NetworkSpawnPointExt:init(unit)
	if managers.network then
	end

	return 
end
function NetworkSpawnPointExt:get_data(unit)
	slot5 = unit
	slot5 = unit

	return {
		position = unit.position(slot4),
		rotation = unit.rotation(slot4)
	}
end
function NetworkSpawnPointExt:destroy(unit)
	return 
end

return 
