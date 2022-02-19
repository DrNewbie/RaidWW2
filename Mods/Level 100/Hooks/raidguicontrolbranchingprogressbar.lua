local ThisNewLevel = 100
local ThisModIds = ModPath and Idstring(ModPath):key() or tostring(math.random())
local Hook4 = "F_"..Idstring("Hook4::"..ThisModIds):key()
local Func1 = "F_"..Idstring("Func1::"..ThisModIds):key()

Hooks:PreHook(RaidGUIControlBranchingProgressBar, "_create_elements", Hook4, function(self)
	if self._data_source_callback and type(self._data_source_callback) == "function" then
		self[Func1] = self[Func1] or self._data_source_callback
		self._data_source_callback = function(...)
			local __ans = self[Func1](...)
			for i = 41, ThisNewLevel do
				__ans[i] = __ans[1]
				__ans[i].points_needed = math.round(__ans[40].points_needed * i / 40)
			end
			return __ans
		end
	end
end)