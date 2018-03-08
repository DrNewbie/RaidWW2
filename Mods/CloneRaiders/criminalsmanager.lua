Hooks:Post(CriminalsManager, "_create_characters", "Post._create_characters", function(self)
	--[[
		"german",
		"russian",
		"american",
		"british"
	]]
	local Your_Teammate = {
		"british",
		"british",
		"british",
		"british"
	}
	local Pick_AI_Data = {}	
	for _, character in ipairs(tweak_data.criminals.characters) do
		local static_data = deep_clone(character.static_data)
		Pick_AI_Data[character.name] = {
			peer_id = 0,
			taken = false,
			name = character.name,
			static_data = static_data,
			data = {}
		}
	end
	for i, data in pairs(Your_Teammate) do
		self._characters[i].static_data = deep_clone(Pick_AI_Data[data].static_data)
	end
end)