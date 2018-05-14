CoreCutsceneData = CoreCutsceneData or class()
CutsceneData = CoreCutsceneData
CoreCutsceneData.init = function (self, unit)
	slot5 = "Unit not supplied to CoreCutsceneData."
	self.__unit = assert(slot3, unit)
	slot4 = self
	slot7 = unit
	self.__cutscene_name = self._cutscene_name(slot3, unit.name(slot6))
	slot6 = true

	self.cutscene_player(slot3, self, true)

	slot5 = self.__unit

	managers.cutscene.register_unit_with_cutscene_data_extension(slot3, managers.cutscene)

	return 
end
CoreCutsceneData.destroy = function (self)
	slot3 = self

	self.destroy_cutscene_player(slot2)

	slot4 = self.__unit

	managers.cutscene.unregister_unit_with_cutscene_data_extension(slot2, managers.cutscene)

	self.__unit = nil
	self.__cutscene_name = nil

	return 
end
CoreCutsceneData.cutscene_player = function (self, __skip_stall_warning, __skip_priming)
	if self.__cutscene_player == nil then
		slot6 = self.__cutscene_name
		local cutscene = managers.cutscene.get_cutscene(slot4, managers.cutscene)

		if not __skip_stall_warning then
			slot10 = cutscene
			slot7 = "[CoreCutsceneData] The cutscene \"" .. cutscene.name(slot9) .. "\" has been cleaned up. Call CoreCutsceneData:reset_cutscene_player() before attempting to replay it."

			cat_print(slot5, "spam")
		end

		slot7 = cutscene
		self.__cutscene_player = core_or_local(slot5, "CutscenePlayer")
		slot6 = self.__cutscene_player

		self.__cutscene_player.add_keys(slot5)

		if not __skip_priming then
			slot6 = self.__cutscene_player

			self.__cutscene_player.prime(slot5)
		end

		local actual_destroy_func = self.__cutscene_player.destroy
		self.__cutscene_player.destroy = function (instance)
			slot3 = instance == self.__cutscene_player

			assert(slot2)

			self.__cutscene_player = nil
			slot3 = instance

			actual_destroy_func(nil)

			return 
		end
	end

	return self.__cutscene_player
end
CoreCutsceneData.destroy_cutscene_player = function (self)
	if self.__cutscene_player then
		slot3 = self.__cutscene_player

		self.__cutscene_player.destroy(slot2)

		slot3 = self.__cutscene_player == nil

		assert(slot2)
	end

	return 
end
CoreCutsceneData.reset_cutscene_player = function (self)
	slot3 = self

	self.destroy_cutscene_player(slot2)

	slot4 = true

	self.cutscene_player(slot2, self)

	return 
end
CoreCutsceneData._cutscene_name = function (self, unit_type_name)
	slot5 = "cutscene_(.+)"

	return string.match(slot3, unit_type_name)
end

return 
