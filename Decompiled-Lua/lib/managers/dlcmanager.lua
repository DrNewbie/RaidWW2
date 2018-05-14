-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
DLCManager = DLCManager or class()
DLCManager.PLATFORM_CLASS_MAP = {}
function DLCManager:new(...)
	local platform = SystemInfo.platform(slot2)
	slot5 = platform
	slot4 = self.PLATFORM_CLASS_MAP[platform.key(slot4)] or GenericDLCManager

	return self.PLATFORM_CLASS_MAP[platform.key(slot4)] or GenericDLCManager.new(SystemInfo, ...)
end
GenericDLCManager = GenericDLCManager or class()
function GenericDLCManager:init()
	slot3 = Application
	self._debug_on = Application.production_build(slot2)
	slot3 = self

	self._set_dlc_save_table(slot2)

	return 
end
function GenericDLCManager:_set_dlc_save_table()
	if not Global.dlc_save then
		Global.dlc_save = {
			packages = {}
		}
	end

	return 
end
function GenericDLCManager:setup()
	slot3 = self

	self._modify_locked_content(slot2)

	slot3 = self

	self._create_achievement_locked_content_table(slot2)

	return 
end
function GenericDLCManager:_create_achievement_locked_content_table()
	self._achievement_locked_content = {}
	self._dlc_locked_content = {}
	slot3 = tweak_data.dlc.descriptions

	for name, dlc in pairs(slot2) do
		local content = dlc.content

		if content then
			local loot_drops = content.loot_drops

			if loot_drops then
				slot10 = loot_drops

				for _, loot_drop in ipairs(slot9) do
					if loot_drop.type_items then
						if dlc.achievement_id then
							self._achievement_locked_content[loot_drop.type_items] = self._achievement_locked_content[loot_drop.type_items] or {}
							self._achievement_locked_content[loot_drop.type_items][loot_drop.item_entry] = name
						else
							self._dlc_locked_content[loot_drop.type_items] = self._dlc_locked_content[loot_drop.type_items] or {}
							self._dlc_locked_content[loot_drop.type_items][loot_drop.item_entry] = name
						end
					end
				end
			end
		end
	end

	return 
end
function GenericDLCManager:_modify_locked_content()
	slot4 = "WIN32"

	if SystemInfo.platform(slot2) == Idstring(SystemInfo) then
		return 
	end

	local function _modify_loot_drop(loot_drop)
		local entry = tweak_data.blackmarket[loot_drop.type_items] and tweak_data.blackmarket[loot_drop.type_items][loot_drop.item_entry]

		if entry then
			if not entry.pc and (not entry.pcs or #entry.pcs == 0) then
				entry.pcs = {
					10,
					20,
					30,
					40
				}

				if loot_drop.type_items == "weapon_mods" then
					tweak_data.weapon.factory.parts[loot_drop.item_entry].pcs = {
						10,
						20,
						30,
						40
					}
				end
			end
		else
			slot4 = " -- entry not exists"

			print(slot3)
		end

		return 
	end

	slot4 = tweak_data.dlc.descriptions

	for name, dlc in pairs(slot3) do
		if not dlc.content_on_consoles then
			local content = dlc.content

			if content then
				local loot_drops = content.loot_drops

				if loot_drops then
					slot11 = loot_drops

					for _, loot_drop in ipairs(slot10) do
						if 0 < #loot_drop then
							slot16 = loot_drop

							for _, lp in ipairs(slot15) do
								slot21 = lp

								_modify_loot_drop(slot20)
							end
						else
							slot16 = loot_drop

							_modify_loot_drop(slot15)
						end
					end

					content.loot_drops = {}
				end
			end
		end
	end

	return 
end
function GenericDLCManager:achievement_locked_content()
	return self._achievement_locked_content
end
function GenericDLCManager:is_mask_achievement_locked(mask_id)
	return self._achievement_locked_content.masks and self._achievement_locked_content.masks[mask_id]
end
function GenericDLCManager:is_material_achievement_locked(material_id)
	return self._achievement_locked_content.materials and self._achievement_locked_content.materials[material_id]
end
function GenericDLCManager:is_texture_achievement_locked(texture_id)
	return self._achievement_locked_content.textures and self._achievement_locked_content.textures[texture_id]
end
function GenericDLCManager:is_weapon_mod_achievement_locked(weapon_mod_id)
	return self._achievement_locked_content.weapon_mods and self._achievement_locked_content.weapon_mods[weapon_mod_id]
end
function GenericDLCManager:on_tweak_data_reloaded()
	slot3 = self

	self.setup(slot2)

	return 
end
function GenericDLCManager:init_finalize()
	slot3 = managers.savefile
	slot8 = "_load_done"

	managers.savefile.add_load_sequence_done_callback_handler(slot2, callback(slot5, self, self))

	return 
end
function GenericDLCManager:chk_content_updated()
	return 
end
function GenericDLCManager:give_dlc_and_verify_blackmarket()
	slot3 = self

	self.give_dlc_package(slot2)

	if managers.blackmarket then
		slot3 = managers.blackmarket

		managers.blackmarket.verify_dlc_items(slot2)
	else
		slot4 = "[GenericDLCManager] _load_done(): BlackMarketManager not yet initialized!"

		Application.error(slot2, Application)
	end

	return 
end
function GenericDLCManager:_load_done(...)
	slot3 = self

	self.give_dlc_and_verify_blackmarket(slot2)

	return 
end
function GenericDLCManager:give_dlc_package()
	slot3 = tweak_data.dlc.descriptions

	for package_id, data in pairs(slot2) do
		slot9 = package_id

		if self.is_dlc_unlocked(slot7, self) then
			slot9 = package_id
			local identifier = UpgradesManager.AQUIRE_STRINGS[5] .. tostring(slot8)
			slot7 = ipairs
			slot9 = data.content.upgrades or {}

			for _, upgrade in slot7(slot8) do
				slot16 = identifier

				if not managers.upgrades.aquired(slot13, managers.upgrades, upgrade) then
					slot16 = identifier

					managers.upgrades.aquire_default(slot13, managers.upgrades, upgrade)
				end
			end
		else
			slot9 = package_id
			local identifier = UpgradesManager.AQUIRE_STRINGS[5] .. tostring(slot8)
			slot7 = ipairs
			slot9 = data.content.upgrades or {}

			for _, upgrade in slot7(slot8) do
				slot16 = identifier

				if managers.upgrades.aquired(slot13, managers.upgrades, upgrade) then
					slot16 = identifier

					managers.upgrades.unaquire(slot13, managers.upgrades, upgrade)
				end
			end
		end
	end

	return 
end
function GenericDLCManager:list_dlc_package(dlcs)
	local t = {}
	slot5 = tweak_data.dlc.descriptions

	for package_id, data in pairs(slot4) do
	end

	return t
end
function GenericDLCManager:save(data)
	data.dlc_save = Global.dlc_save

	return 
end
function GenericDLCManager:load(data)

	-- Decompilation error in this vicinity:
	if data.dlc_save and data.dlc_save.packages then
		Global.dlc_save = data.dlc_save
	end

	return 
end
function GenericDLCManager:on_reset_profile()
	Global.dlc_save = nil
	slot3 = self

	self._set_dlc_save_table(nil)

	slot3 = self

	self.give_dlc_package(nil)

	return 
end
function GenericDLCManager:on_achievement_award_loot()
	slot4 = "GenericDLCManager:on_achievement_award_loot()"

	Application.debug(slot2, Application)

	slot3 = self

	self.give_dlc_package(slot2)

	return 
end
function GenericDLCManager:on_signin_complete()
	return 
end
function GenericDLCManager:is_dlcs_unlocked(list_of_dlcs)
	slot4 = list_of_dlcs

	for _, dlc in ipairs(slot3) do
		slot10 = dlc

		if not self.is_dlc_unlocked(slot8, self) then
			return false
		end
	end

	return true
end
function GenericDLCManager:is_dlc_unlocked(dlc)
	if not tweak_data.dlc.descriptions[dlc] or not tweak_data.dlc.descriptions[dlc].free then
		slot5 = dlc
		slot2 = self.has_dlc(slot3, self)
	end

	return slot2
end
function GenericDLCManager:has_dlc(dlc)
	local dlc_description = tweak_data.dlc.descriptions[dlc]

	if dlc_description and dlc_description.dlc then
		if self[dlc_description.dlc] then
			slot6 = dlc_description

			return self[dlc_description.dlc](slot4, self)
		else
			slot9 = dlc_description.dlc

			Application.error(slot4, Application, "Didn't have dlc has function for", dlc, "has_dlc()")

			slot5 = Application

			Application.stack_dump(slot4)
		end
	end

	local dlc_data = Global.dlc_manager.all_dlc_data[dlc]

	if not dlc_data then
		slot8 = dlc

		Application.error(slot5, Application, "Didn't have dlc data for")

		return false
	end

	return dlc_data.verified
end
function GenericDLCManager:has_full_game()
	return Global.dlc_manager.all_dlc_data.full_game.verified
end
function GenericDLCManager:is_trial()
	slot3 = self

	return not self.has_full_game(slot2)
end
function GenericDLCManager:is_installing()

	-- Decompilation error in this vicinity:
	slot3 = DB
	slot3 = Application
	slot3 = Application.installer(slot2)
	local install_progress = Application.installer(slot2).get_progress(slot2)
	local is_installing = install_progress < 1

	return is_installing, install_progress
end
function GenericDLCManager:dlcs_string()
	local s = ""
	slot6 = "preorder"
	s = s .. ((self.is_dlc_unlocked(slot4, self) and "preorder ") or "")

	return s
end
function GenericDLCManager:has_corrupt_data()
	return self._has_corrupt_data
end
function GenericDLCManager:has_all_dlcs()
	return true
end
function GenericDLCManager:has_preorder()
	return Global.dlc_manager.all_dlc_data.preorder and Global.dlc_manager.all_dlc_data.preorder.verified
end
function GenericDLCManager:has_achievement(data)
	if managers.achievment and data and data.achievement_id then
		slot5 = data.achievement_id
		local achievement = managers.achievment.get_info(slot3, managers.achievment)
	end

	return (achievement and achievement.awarded) or false
end

if not PS3DLCManager then
	slot2 = GenericDLCManager
	slot0 = class(slot1)
end

PS3DLCManager = slot0
slot3 = "PS3"
slot3 = Idstring(slot2)
DLCManager.PLATFORM_CLASS_MAP[Idstring(slot2).key(slot2)] = PS3DLCManager
PS3DLCManager.SERVICE_ID = "EP4040-BLES01902_00"
function PS3DLCManager:init()
	slot3 = self

	PS3DLCManager.super.init(slot2)

	if not Global.dlc_manager then
		Global.dlc_manager = {
			all_dlc_data = {
				full_game = {
					filename = "full_game_key.edat",
					product_id = self.SERVICE_ID .. "-PAYDAY2NPEU00000"
				},
				preorder = {
					filename = "preorder_dlc_key.edat",
					product_id = self.SERVICE_ID .. "-PPAYDAY2XX000006"
				}
			}
		}
		slot3 = self

		self._verify_dlcs()
	end

	return 
end
function PS3DLCManager:_verify_dlcs()
	local all_dlc = {}
	slot4 = Global.dlc_manager.all_dlc_data

	for dlc_name, dlc_data in pairs(slot3) do
		if not dlc_data.verified then
			slot10 = dlc_data.filename

			table.insert(slot8, all_dlc)
		end
	end

	slot5 = all_dlc
	local verified_dlcs = PS3.check_dlc_availability(slot3, PS3)
	Global.dlc_manager.verified_dlcs = verified_dlcs
	slot5 = verified_dlcs

	for _, verified_filename in pairs(PS3) do
		slot10 = Global.dlc_manager.all_dlc_data

		for dlc_name, dlc_data in pairs(slot9) do
			if dlc_data.filename == verified_filename then
				slot16 = verified_filename

				print(slot14, "DLC verified:")

				dlc_data.verified = true

				break
			end
		end
	end

	return 
end
function PS3DLCManager:_init_NPCommerce()
	slot4 = self.SERVICE_ID

	PS3.set_service_id(slot2, PS3)

	local result = NPCommerce.init(slot2)
	slot5 = result

	print(NPCommerce, "init result")

	if not result then
		slot4 = MenuManager

		MenuManager.show_np_commerce_init_fail(slot3)

		slot4 = NPCommerce

		NPCommerce.destroy(slot3)

		return 
	end

	slot9 = "cb_NPCommerce"
	local result = NPCommerce.open(slot3, callback(slot6, self, self))
	slot6 = result

	print(NPCommerce, "open result")

	if result < 0 then
		slot5 = MenuManager

		MenuManager.show_np_commerce_init_fail(slot4)

		slot5 = NPCommerce

		NPCommerce.destroy(slot4)

		return 
	end

	return true
end
function PS3DLCManager:buy_full_game()
	slot3 = "[PS3DLCManager:buy_full_game]"

	print(slot2)

	if self._activity then
		return 
	end

	slot3 = self

	if not self._init_NPCommerce(slot2) then
		return 
	end

	slot3 = managers.menu

	managers.menu.show_waiting_NPCommerce_open(slot2)

	self._request = {
		product = "full_game",
		type = "buy_product"
	}
	self._activity = {
		type = "open"
	}

	return 
end
function PS3DLCManager:buy_product(product_name)
	slot5 = product_name

	print(slot3, "[PS3DLCManager:buy_product]")

	if self._activity then
		return 
	end

	slot4 = self

	if not self._init_NPCommerce(slot3) then
		return 
	end

	slot4 = managers.menu

	managers.menu.show_waiting_NPCommerce_open(slot3)

	self._request = {
		type = "buy_product",
		product = product_name
	}
	self._activity = {
		type = "open"
	}

	return 
end
function PS3DLCManager:cb_NPCommerce(result, info)
	slot7 = info

	print(slot4, "[PS3DLCManager:cb_NPCommerce]", result)

	slot5 = info

	for i, k in pairs(slot4) do
		slot11 = k

		print(slot9, i)
	end

	self._NPCommerce_cb_results = self._NPCommerce_cb_results or {}
	slot3 = print
	slot5 = "self._activity"

	if self._activity then
		slot8 = self._activity
		slot6 = inspect(slot7)
	end

	slot3(slot4, slot5)

	slot6 = {
		result,
		info
	}

	table.insert(slot4, self._NPCommerce_cb_results)

	if not self._activity then
		return 
	elseif self._activity.type == "open" then
		if info.category_error or info.category_done == false then
			self._activity = nil
			slot6 = "waiting_for_NPCommerce_open"

			managers.system_menu.close(slot4, managers.system_menu)

			slot5 = self

			self._close_NPCommerce(slot4)
		else
			slot6 = "waiting_for_NPCommerce_open"

			managers.system_menu.close(slot4, managers.system_menu)

			local product_id = Global.dlc_manager.all_dlc_data[self._request.product].product_id
			slot7 = product_id

			print(managers.system_menu, "starting storebrowse")

			slot9 = true
			local ret = NPCommerce.storebrowse(managers.system_menu, NPCommerce, "product", product_id)

			if not ret then
				self._activity = nil
				slot7 = managers.menu

				managers.menu.show_NPCommerce_checkout_fail(slot6)

				slot7 = self

				self._close_NPCommerce(slot6)
			end

			self._activity = {
				type = "browse"
			}
		end
	elseif self._activity.type == "browse" then
		if info.browse_succes then
			self._activity = nil
			slot5 = managers.menu

			managers.menu.show_NPCommerce_browse_success(slot4)

			slot5 = self

			self._close_NPCommerce(slot4)
		elseif info.browse_back then
			self._activity = nil
			slot5 = self

			self._close_NPCommerce(slot4)
		elseif info.category_error then
			self._activity = nil
			slot5 = managers.menu

			managers.menu.show_NPCommerce_browse_fail(slot4)

			slot5 = self

			self._close_NPCommerce(slot4)
		end
	elseif self._activity.type == "checkout" then
		if info.checkout_error then
			self._activity = nil
			slot5 = managers.menu

			managers.menu.show_NPCommerce_checkout_fail(slot4)

			slot5 = self

			self._close_NPCommerce(slot4)
		elseif info.checkout_cancel then
			self._activity = nil
			slot5 = self

			self._close_NPCommerce(slot4)
		elseif info.checkout_success then
			self._activity = nil
			slot5 = self

			self._close_NPCommerce(slot4)
		end
	end

	slot5 = "/[PS3DLCManager:cb_NPCommerce]"

	print(slot4)

	return 
end
function PS3DLCManager:_close_NPCommerce()
	slot3 = "[PS3DLCManager:_close_NPCommerce]"

	print(slot2)

	slot3 = NPCommerce

	NPCommerce.destroy(slot2)

	return 
end
function PS3DLCManager:cb_confirm_purchase_yes(sku_data)
	slot5 = sku_data.skuid

	NPCommerce.checkout(slot3, NPCommerce)

	return 
end
function PS3DLCManager:cb_confirm_purchase_no()
	self._activity = nil
	slot3 = self

	self._close_NPCommerce(slot2)

	return 
end

if not X360DLCManager then
	slot2 = GenericDLCManager
	slot0 = class(slot1)
end

X360DLCManager = slot0
slot3 = "X360"
slot3 = Idstring(slot2)
DLCManager.PLATFORM_CLASS_MAP[Idstring(slot2).key(slot2)] = X360DLCManager
function X360DLCManager:init()
	slot3 = self

	X360DLCManager.super.init(slot2)

	if not Global.dlc_manager then
		Global.dlc_manager = {
			all_dlc_data = {
				full_game = {
					is_default = true,
					verified = true,
					index = 0
				},
				preorder = {
					is_default = false,
					index = 1
				}
			}
		}
		slot3 = self

		self._verify_dlcs()
	end

	return 
end
function X360DLCManager:_verify_dlcs()
	local found_dlc = {}
	slot7 = found_dlc
	local status = XboxLive.check_dlc_availability(slot3, XboxLive, 0, 100)

	if not status then
		slot6 = "XboxLive:check_dlc_availability failed"
		slot9 = found_dlc

		Application.error(slot4, Application, inspect(slot8))

		return 
	end

	slot5 = "[X360DLCManager:_verify_dlcs] found DLC:"

	print(slot4)

	slot5 = found_dlc

	for i, k in pairs(slot4) do
		slot11 = k

		print(slot9, i)
	end

	slot5 = Global.dlc_manager.all_dlc_data

	for dlc_name, dlc_data in pairs(slot4) do
		if found_dlc[dlc_data.index] == "corrupt" then
			slot11 = dlc_name

			print(slot9, "[X360DLCManager:_verify_dlcs] Found corrupt DLC:")

			dlc_data.is_corrupt = true
		elseif dlc_data.is_default or found_dlc[dlc_data.index] == true then
			dlc_data.verified = true
		else
			dlc_data.verified = false
		end
	end

	if found_dlc.has_corrupt_data then
		slot5 = "[X360DLCManager:_verify_dlcs] Found at least one corrupt DLC."

		print(slot4)

		self._has_corrupt_data = true
	end

	return 
end
function X360DLCManager:on_signin_complete()
	slot3 = self

	self._verify_dlcs(slot2)

	return 
end

if not PS4DLCManager then
	slot2 = GenericDLCManager
	slot0 = class(slot1)
end

PS4DLCManager = slot0
slot3 = "PS4"
slot3 = Idstring(slot2)
DLCManager.PLATFORM_CLASS_MAP[Idstring(slot2).key(slot2)] = PS4DLCManager
PS4DLCManager.SERVICE_ID = "EP4040-BLES01902_00"
function PS4DLCManager:init()
	slot3 = self

	PS4DLCManager.super.init(slot2)

	if not Global.dlc_manager then
		Global.dlc_manager = {
			all_dlc_data = {
				full_game = {
					verified = true
				},
				preorder = {
					verified = false
				}
			}
		}
		slot3 = self

		self._verify_dlcs()
	end

	return 
end
function PS4DLCManager:_verify_dlcs()
	slot3 = Global.dlc_manager.all_dlc_data

	for dlc_name, dlc_data in pairs(slot2) do
		if dlc_data.is_default or dlc_data.verified == true then
			dlc_data.verified = true
		else
			slot9 = dlc_data.product_id
			dlc_data.verified = PS3.has_entitlement(slot7, PS3)
		end
	end

	return 
end
function PS4DLCManager:_init_NPCommerce()
	local result = NPCommerce.init(slot2)
	slot5 = result

	print(NPCommerce, "init result")

	if not result then
		slot4 = MenuManager

		MenuManager.show_np_commerce_init_fail(slot3)

		slot4 = NPCommerce

		NPCommerce.destroy(slot3)

		return 
	end

	slot9 = "cb_NPCommerce"
	local result = NPCommerce.open(slot3, callback(slot6, self, self))
	slot6 = result

	print(NPCommerce, "open result")

	if result < 0 then
		slot5 = MenuManager

		MenuManager.show_np_commerce_init_fail(slot4)

		slot5 = NPCommerce

		NPCommerce.destroy(slot4)

		return 
	end

	return true
end
function PS4DLCManager:buy_full_game()
	slot3 = "[PS4DLCManager:buy_full_game]"

	print(slot2)

	if self._activity then
		return 
	end

	slot3 = self

	if not self._init_NPCommerce(slot2) then
		return 
	end

	slot3 = managers.menu

	managers.menu.show_waiting_NPCommerce_open(slot2)

	self._request = {
		product = "full_game",
		type = "buy_product"
	}
	self._activity = {
		type = "open"
	}

	return 
end
function PS4DLCManager:buy_product(product_name)
	slot5 = product_name

	print(slot3, "[PS4DLCManager:buy_product]")

	if self._activity then
		return 
	end

	slot4 = self

	if not self._init_NPCommerce(slot3) then
		return 
	end

	slot4 = managers.menu

	managers.menu.show_waiting_NPCommerce_open(slot3)

	self._request = {
		type = "buy_product",
		product = product_name
	}
	self._activity = {
		type = "open"
	}

	return 
end
function PS4DLCManager:cb_NPCommerce(result, info)
	slot7 = info

	print(slot4, "[PS4DLCManager:cb_NPCommerce]", result)

	slot5 = info

	for i, k in pairs(slot4) do
		slot11 = k

		print(slot9, i)
	end

	self._NPCommerce_cb_results = self._NPCommerce_cb_results or {}
	slot3 = print
	slot5 = "self._activity"

	if self._activity then
		slot8 = self._activity
		slot6 = inspect(slot7)
	end

	slot3(slot4, slot5)

	slot6 = {
		result,
		info
	}

	table.insert(slot4, self._NPCommerce_cb_results)

	if not self._activity then
		return 
	elseif self._activity.type == "open" then
		if info.category_error or info.category_done == false then
			self._activity = nil
			slot6 = "waiting_for_NPCommerce_open"

			managers.system_menu.close(slot4, managers.system_menu)

			slot5 = self

			self._close_NPCommerce(slot4)
		else
			slot6 = "waiting_for_NPCommerce_open"

			managers.system_menu.close(slot4, managers.system_menu)

			local product_id = Global.dlc_manager.all_dlc_data[self._request.product].product_id
			slot7 = product_id

			print(managers.system_menu, "starting storebrowse")

			slot9 = true
			local ret = NPCommerce.storebrowse(managers.system_menu, NPCommerce, "product", product_id)

			if not ret then
				self._activity = nil
				slot7 = managers.menu

				managers.menu.show_NPCommerce_checkout_fail(slot6)

				slot7 = self

				self._close_NPCommerce(slot6)
			end

			self._activity = {
				type = "browse"
			}
		end
	elseif self._activity.type == "browse" then
		if info.browse_succes then
			self._activity = nil
			slot5 = managers.menu

			managers.menu.show_NPCommerce_browse_success(slot4)

			slot5 = self

			self._close_NPCommerce(slot4)
		elseif info.browse_back then
			self._activity = nil
			slot5 = self

			self._close_NPCommerce(slot4)
		elseif info.category_error then
			self._activity = nil
			slot5 = managers.menu

			managers.menu.show_NPCommerce_browse_fail(slot4)

			slot5 = self

			self._close_NPCommerce(slot4)
		end
	elseif self._activity.type == "checkout" then
		if info.checkout_error then
			self._activity = nil
			slot5 = managers.menu

			managers.menu.show_NPCommerce_checkout_fail(slot4)

			slot5 = self

			self._close_NPCommerce(slot4)
		elseif info.checkout_cancel then
			self._activity = nil
			slot5 = self

			self._close_NPCommerce(slot4)
		elseif info.checkout_success then
			self._activity = nil
			slot5 = self

			self._close_NPCommerce(slot4)
		end
	end

	slot5 = "/[PS4DLCManager:cb_NPCommerce]"

	print(slot4)

	return 
end
function PS4DLCManager:_close_NPCommerce()
	slot3 = "[PS4DLCManager:_close_NPCommerce]"

	print(slot2)

	slot3 = NPCommerce

	NPCommerce.destroy(slot2)

	return 
end
function PS4DLCManager:cb_confirm_purchase_yes(sku_data)
	slot5 = sku_data.skuid

	NPCommerce.checkout(slot3, NPCommerce)

	return 
end
function PS4DLCManager:cb_confirm_purchase_no()
	self._activity = nil
	slot3 = self

	self._close_NPCommerce(slot2)

	return 
end

if not XB1DLCManager then
	slot2 = GenericDLCManager
	slot0 = class(slot1)
end

XB1DLCManager = slot0
slot3 = "XB1"
slot3 = Idstring(slot2)
DLCManager.PLATFORM_CLASS_MAP[Idstring(slot2).key(slot2)] = XB1DLCManager
function XB1DLCManager:init()
	slot3 = self

	XB1DLCManager.super.init(slot2)

	if not Global.dlc_manager then
		Global.dlc_manager = {
			all_dlc_data = {
				full_game = {
					is_default = true,
					verified = true,
					index = 0
				},
				preorder = {
					is_default = false,
					product_id = "123456",
					index = 1
				}
			}
		}
		slot3 = self

		self._verify_dlcs()
	end

	return 
end
function XB1DLCManager:_verify_dlcs()
	local dlc_content_updated = false
	local old_verified = nil
	slot5 = Global.dlc_manager.all_dlc_data

	for dlc_name, dlc_data in pairs(slot4) do
		old_verified = dlc_data.verified or false

		if dlc_data.is_default then
			dlc_data.verified = true
		else
			slot11 = dlc_data.product_id
			dlc_data.verified = XboxLive.check_dlc(slot9, XboxLive)
		end

		dlc_content_updated = dlc_content_updated or old_verified ~= dlc_data.verified
	end

	return dlc_content_updated
end
function XB1DLCManager:chk_content_updated()
	slot3 = "[XB1DLCManager:chk_content_updated]"

	print(slot2)

	slot3 = managers.blackmarket

	if not managers.blackmarket.currently_customizing_mask(slot2) then
		slot3 = self

		if self._verify_dlcs(slot2) then
			slot3 = "[XB1DLCManager:chk_content_updated] content updated"

			print(slot2)

			if managers.experience and managers.upgrades then
				slot4 = managers.experience

				for level = 1, managers.experience.current_level(slot3), 1 do
					slot9 = true

					managers.upgrades.aquire_from_level_tree(slot6, managers.upgrades, level)

					slot9 = true

					managers.upgrades.verify_level_tree(slot6, managers.upgrades, level)
				end
			end

			slot3 = self

			self.give_dlc_and_verify_blackmarket(slot2)
		end
	end

	return 
end
function XB1DLCManager:on_signin_complete()
	slot3 = self

	self.chk_content_updated(slot2)

	return 
end

if not WINDLCManager then
	slot2 = GenericDLCManager
	slot0 = class(slot1)
end

WINDLCManager = slot0
slot3 = "WIN32"
slot3 = Idstring(slot2)
DLCManager.PLATFORM_CLASS_MAP[Idstring(slot2).key(slot2)] = WINDLCManager
function WINDLCManager:init()
	slot3 = self

	WINDLCManager.super.init(slot2)

	if not Global.dlc_manager then
		Global.dlc_manager = {}
		slot8 = self
		Global.dlc_manager.all_dlc_data = {
			full_game = {
				verified = true,
				no_install = true,
				external = true,
				app_id = tostring(self.get_app_id(slot7))
			},
			preorder = {
				app_id = "707070",
				no_install = true
			},
			special_edition = {
				app_id = "707080",
				no_install = true
			},
			raid_community = {
				no_install = true,
				source_id = "103582791460014708"
			},
			official_soundtrack = {
				app_id = "720860",
				no_install = true
			}
		}
		slot3 = self

		self._verify_dlcs()
	end

	return 
end
function WINDLCManager:get_app_id()
	return 414740
end
function WINDLCManager:_check_dlc_data(dlc_data)
	slot5 = "STEAM"

	if SystemInfo.distribution(slot3) == Idstring(SystemInfo) then
		if dlc_data.app_id then
			if dlc_data.no_install then
				slot5 = dlc_data.app_id

				if Steam.is_product_owned(slot3, Steam) then
					return true
				end
			else
				slot5 = dlc_data.app_id

				if Steam.is_product_installed(slot3, Steam) then
					return true
				end
			end
		elseif dlc_data.source_id then
			slot7 = Steam
			slot6 = dlc_data.source_id

			if Steam.is_user_in_source(slot3, Steam, Steam.userid(slot6)) then
				return true
			end
		end
	end

	return 
end
function WINDLCManager:_verify_dlcs()
	slot3 = Global.dlc_manager.all_dlc_data

	for dlc_name, dlc_data in pairs(slot2) do
		if not dlc_data.verified then
			slot9 = dlc_data

			if self._check_dlc_data(slot7, self) then
				dlc_data.verified = true
			end
		end
	end

	return 
end
function WINDLCManager:chk_content_updated()
	slot3 = Global.dlc_manager.all_dlc_data

	for dlc_name, dlc_data in pairs(slot2) do
		if not dlc_data.verified then
			slot9 = dlc_data

			if self._check_dlc_data(slot7, self) then
				slot8 = managers.menu

				managers.menu.show_dlc_require_restart(slot7)

				break
			end
		end
	end

	return 
end

return 
