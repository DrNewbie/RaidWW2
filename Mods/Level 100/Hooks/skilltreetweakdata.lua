local ThisNewLevel = 100
local ThisModIds = ModPath and Idstring(ModPath):key() or tostring(math.random())
local Hook2 = "F_"..Idstring("Hook2::"..ThisModIds):key()

Hooks:PostHook(SkillTreeTweakData, "_init_demolitions_skill_tree", Hook2, function(self)
	for i = 41, ThisNewLevel do
		self.skill_trees.recon[i] = self.skill_trees.recon[1]
		self.skill_trees.assault[i] = self.skill_trees.assault[1]
		self.skill_trees.infiltrator[i] = self.skill_trees.infiltrator[1]
		self.skill_trees.demolitions[i] = self.skill_trees.demolitions[1]
	end
end)