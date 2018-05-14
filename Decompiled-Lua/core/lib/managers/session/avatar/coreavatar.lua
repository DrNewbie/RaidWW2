slot3 = "CoreAvatar"

core.module(slot1, core)

Avatar = Avatar or class()
function Avatar:init(avatar_handler)
	self._avatar_handler = avatar_handler

	return 
end
function Avatar:destroy()
	if self._input_input_provider then
		slot3 = self

		self.release_input(slot2)
	end

	slot3 = self._avatar_handler

	self._avatar_handler.destroy(slot2)

	return 
end
function Avatar:set_input(input_input_provider)
	slot5 = input_input_provider

	self._avatar_handler.enable_input(slot3, self._avatar_handler)

	self._input_input_provider = input_input_provider

	return 
end
function Avatar:release_input()
	slot3 = self._avatar_handler

	self._avatar_handler.disable_input(slot2)

	self._input_input_provider = nil

	return 
end
function Avatar:avatar_handler()
	return self._avatar_handler
end

return 
