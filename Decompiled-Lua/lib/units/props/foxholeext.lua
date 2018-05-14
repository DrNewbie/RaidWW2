FoxholeExt = FoxholeExt or class()
function FoxholeExt:init(unit)
	self._player = nil
	self._locked = false

	return 
end
function FoxholeExt:register_player(player)
	self._player = player

	return 
end
function FoxholeExt:unregister_player()
	self._player = nil

	return 
end
function FoxholeExt:set_locked(locked)
	self._locked = locked

	return 
end
function FoxholeExt:locked()
	return self._locked
end
function FoxholeExt:release_player()
	slot4 = false

	self.set_locked(slot2, self)

	slot4 = "standard"

	managers.player.set_player_state(slot2, managers.player)

	return 
end
function FoxholeExt:taken()
	return not not self._player
end
function FoxholeExt:save(data)
	data.foxhole = {
		player = self._player,
		locked = self._locked
	}

	return 
end
function FoxholeExt:load(data)
	if data.foxhole then
		self._player = data.foxhole.player
		self._locked = data.foxhole.locked
	end

	return 
end

return 
