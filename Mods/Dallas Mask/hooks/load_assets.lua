local ThisModPath = ModPath
local ThisModAssetsPath = tostring(ThisModPath.."assets/")

DallasMaskMedicBagM = DallasMaskMedicBagM or {}
if not DallasMaskMedicBagM.setup then
	DallasMaskMedicBagM.setup = true
	local function load_assets()
		local LoadThoseAssets = {
			{"texture", "units/payday2/masks/msk_dallas/dallas_df"},
			{"texture", "units/payday2/masks/msk_dallas/dallas_nm"},
			{"cooked_physics", "units/payday2/masks/msk_dallas/msk_dallas"},
			{"material_config", "units/payday2/masks/msk_dallas/msk_dallas"},
			{"model", "units/payday2/masks/msk_dallas/msk_dallas"},
			{"object", "units/payday2/masks/msk_dallas/msk_dallas"},
			{"unit", "units/payday2/masks/msk_dallas/msk_dallas"},
			{"texture", "units/payday2/masks/shared_textures/patterns/pattern_no_color_no_material_df"},
			{"texture", "units/payday2/matcaps/matcap_plastic_df"}
		}
		for _, __d in pairs(LoadThoseAssets) do
			DB:create_entry(Idstring(__d[1]), Idstring(__d[2]), ThisModAssetsPath..__d[2].."."..__d[1])
		end
	end
	pcall(load_assets)
end