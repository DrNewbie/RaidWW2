slot3 = "CorePlayer"

core.module(slot1, core)

slot3 = "CoreAvatar"

core.import(slot1, core)

Player = Player or class()
function Player:init(player_slot, player_handler)
	self._player_slot = player_slot
	self._player_handler = player_handler
	slot5 = self._player_handler

	assert(slot4)

	self._player_handler._core_player = self

	return 
end
function Player:destroy()
	if self._level_handler then
		slot4 = self._level_handler

		self.leave_level(slot2, self)
	end

	if self._avatar then
		slot3 = self

		self._destroy_avatar(slot2)
	end

	slot3 = self._player_handler

	self._player_handler.destroy(slot2)

	self._player_handler = nil

	return 
end
function Player:avatar()
	return self._avatar
end
function Player:has_avatar()
	return self._avatar ~= nil
end
function Player:is_alive()
	return self._player_handler ~= nil
end
function Player:_destroy_avatar()
	slot3 = self._player_handler

	self._player_handler.release_avatar(slot2)

	slot3 = self._avatar

	self._avatar.destroy(slot2)

	self._avatar = nil

	return 
end
function Player:avatar_handler()
	return self._avatar_handler
end
function Player:enter_level(level_handler)
	slot5 = level_handler

	self._player_handler.enter_level(slot3, self._player_handler)

	local avatar_handler = self._player_handler.spawn_avatar(slot3)
	slot6 = avatar_handler
	self._avatar = CoreAvatar.Avatar.new(self._player_handler, CoreAvatar.Avatar)
	avatar_handler._core_avatar = self._avatar
	slot6 = avatar_handler

	self._player_handler.set_avatar(self._player_handler, self._player_handler)

	self._level_handler = level_handler

	return 
end
function Player:leave_level(level_handler)
	if self._avatar then
		slot4 = self

		self._destroy_avatar(slot3)
	end

	slot5 = level_handler

	self._player_handler.leave_level(slot3, self._player_handler)

	self._level_handler = nil

	return 
end
function Player:player_slot()
	return self._player_slot
end
function Player:set_leaderboard_position(position)
	self._leaderboard_position = position

	return 
end
function Player:set_team(team)
	self._team = team

	return 
end

return 
