slot3 = "CoreGTextureManager"

core.module(slot1, core)

GTextureManager = GTextureManager or class()
function GTextureManager:init()
	self._texture_map = {}
	self._preloaded = {}
	slot5 = nil

	GlobalTextureManager.set_texture(slot2, GlobalTextureManager, "current_global_texture")

	slot5 = nil

	GlobalTextureManager.set_texture(slot2, GlobalTextureManager, "current_global_world_overlay_texture")

	slot5 = nil

	GlobalTextureManager.set_texture(slot2, GlobalTextureManager, "current_global_world_overlay_mask_texture")

	return 
end
function GTextureManager:set_texture(variable_name, texture_name, texture_type)
	local old_data = self._texture_map[variable_name]

	if old_data and old_data.texture then
		slot9 = nil

		GlobalTextureManager.set_texture(slot6, GlobalTextureManager, variable_name)

		slot8 = old_data.texture

		TextureCache.unretrieve(slot6, TextureCache)

		old_data.texture = nil
	end

	if texture_name and texture_name ~= "" then
		local data = {
			texture_name = texture_name,
			texture_type = texture_type
		}
		slot10 = texture_type
		data.texture = TextureCache.retrieve(slot7, TextureCache, texture_name)
		slot10 = data.texture

		GlobalTextureManager.set_texture(slot7, GlobalTextureManager, variable_name)

		self._texture_map[variable_name] = data
	end

	return 
end
function GTextureManager:preload(textures, texture_type)
	slot5 = textures

	if type(slot4) == "string" then
		if not self._preloaded[textures] then
			slot8 = texture_type
			self._preloaded[textures] = TextureCache.retrieve(slot5, TextureCache, textures)
		end
	else
		slot5 = textures

		for _, v in ipairs(slot4) do
			if not self._preloaded[v.name] then
				slot14 = v.type
				self._preloaded[v.name] = TextureCache.retrieve(slot11, TextureCache, v.name)
			end
		end
	end

	return 
end
function GTextureManager:destroy()
	slot3 = self._texture_map

	for variable_name, data in pairs(slot2) do
		if data.texture then
			slot10 = nil

			GlobalTextureManager.set_texture(slot7, GlobalTextureManager, variable_name)

			slot9 = data.texture

			TextureCache.unretrieve(slot7, TextureCache)
		end
	end

	slot3 = self._preloaded

	for _, v in pairs(slot2) do
		slot9 = v

		TextureCache.unretrieve(slot7, TextureCache)
	end

	self._texture_map = nil
	self._preloaded = nil

	return 
end

return 
