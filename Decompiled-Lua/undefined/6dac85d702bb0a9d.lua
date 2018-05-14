-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
InventoryGenerator = InventoryGenerator or class()
InventoryGenerator.path = "aux_assets\\inventory\\"
InventoryGenerator.generate = function ()
	local items, error = InventoryGenerator._items()
	local json_path = InventoryGenerator._root_path() .. InventoryGenerator.path
	slot6 = json_path

	if not SystemFS.exists(slot4, SystemFS) then
		slot6 = json_path

		SystemFS.make_dir(slot4, SystemFS)
	end

	local defid_data = {}

	if items then
		slot8 = defid_data

		InventoryGenerator._create_steam_itemdef(slot5, json_path .. "challenge_cards.json", items)
	end

	slot7 = "Generation Completed."

	Application.trace(slot5, Application)

	return 
end
InventoryGenerator.next_defid = function (category, defid_list)
	local start_index = 1

	if category then
		local categories = {
			safes = 50000,
			bundles = 30000,
			gameplay = 1,
			contents = 10000,
			weapon_skins = 100000,
			drills = 70000
		}

		if categories[category] then
			start_index = categories[category]
		end
	end

	if not defid_list then
		slot5 = InventoryGenerator._root_path() .. InventoryGenerator.path
		local defids_check = InventoryGenerator._defids(slot4)
	end

	for count = start_index, 1000000, 1 do
		if not defids_check[count] then
			return count
		end
	end

	slot7 = "[InventoryGenerator.next_defid] - Couldn't find a free spot."

	Application.error(slot5, Application)

	return 
end
InventoryGenerator.verify = function ()
	local error = false
	slot3 = tweak_data.economy.safes

	for item, data in pairs(slot2) do
		if not tweak_data.economy.contents[data.content] then
			slot9 = "[InventoryGenerator.verify] - The item 'safes." .. item .. "' have an invalid content reference."

			Application.error(slot7, Application)

			error = true
		elseif not tweak_data.economy.drills[data.drill] then
			slot9 = "[InventoryGenerator.verify] - The item 'safes." .. item .. "' have an invalid drill reference."

			Application.error(slot7, Application)

			error = true
		elseif tweak_data.economy.drills[data.drill].safe ~= item then
			slot9 = "[InventoryGenerator.verify] - The item 'drills." .. data.drill .. "' have an invalid safe reference."

			Application.error(slot7, Application)

			error = true
		end
	end

	slot3 = tweak_data.economy.drills

	for item, data in pairs(slot2) do
		if not tweak_data.economy.safes[data.safe] then
			slot9 = "[InventoryGenerator.verify] - The item 'drills." .. item .. "' have an invalid safe reference."

			Application.error(slot7, Application)

			error = true
		end
	end

	slot3 = tweak_data.economy.contents

	for item, data in pairs(slot2) do
		if not data.contains then
			slot8 = data.contains
		else
			slot8 = data.contains

			for category, items in pairs(slot7) do
				local tweak_group = tweak_data.economy[category] or tweak_data.blackmarket[category]

				if not tweak_group then
					slot15 = "[InventoryGenerator.verify] - The item 'contents." .. item .. "' have invalid content."

					Application.error(slot13, Application)

					error = true
				else
					slot14 = items

					for _, entry in pairs(slot13) do
						if not tweak_group[entry] then
							slot20 = "[InventoryGenerator.verify] - The item 'contents." .. item .. "' have invalid content. Item '" .. category .. "." .. entry .. "' doesn't exist."

							Application.error(slot18, Application)

							error = true
						elseif category == "contents" and not tweak_group[entry].def_id then
							slot20 = "[InventoryGenerator.verify] - The item 'contents." .. item .. "' have invalid content. Item '" .. category .. "." .. entry .. "' is not an economy item."

							Application.error(slot18, Application)

							error = true
						elseif not tweak_group[entry].rarity then
							slot20 = "[InventoryGenerator.verify] - The item 'contents." .. item .. "' have invalid content. Item '" .. category .. "." .. entry .. "' is missing a rarity flag."

							Application.error(slot18, Application)

							error = true
						end
					end
				end
			end
		end
	end

	slot3 = tweak_data.economy.bundles

	for item, data in pairs(slot2) do
		if not data.contains then
			slot8 = data.contains
		elseif not data.dlc and not data.dlc_id then
			slot9 = "[InventoryGenerator.verify] - The item 'bundles." .. item .. "' is awarded without any DLC requirement."

			Application.error(slot7, Application)

			error = true
		else
			slot8 = data.contains

			for category, items in pairs(slot7) do
				local tweak_group = tweak_data.economy[category] or tweak_data.blackmarket[category]

				if not tweak_group then
					slot15 = "[InventoryGenerator.verify] - The item 'bundles." .. item .. "' have invalid content."

					Application.error(slot13, Application)

					error = true
				else
					slot14 = items

					for _, entry in pairs(slot13) do
						if not tweak_group[entry] then
							slot20 = "[InventoryGenerator.verify] - The item 'bundles." .. item .. "' have invalid content. Item '" .. category .. "." .. entry .. "' doesn't exist."

							Application.error(slot18, Application)

							error = true
						elseif category == "contents" and not tweak_group[entry].def_id then
							slot20 = "[InventoryGenerator.verify] - The item 'bundles." .. item .. "' have invalid content. Item '" .. category .. "." .. entry .. "' is not an economy item."

							Application.error(slot18, Application)

							error = true
						end
					end
				end
			end
		end
	end

	return not error
end
InventoryGenerator._items_content = function (safe_items, contains)
	slot4 = contains

	for category, items in pairs(slot3) do
		slot9 = items

		for _, entry in pairs(slot8) do
			if category == "contents" then
				slot15 = tweak_data.economy.contents[entry].contains

				InventoryGenerator._items_content(slot13, safe_items)
			else
				local id = nil
				local item_data = tweak_data.blackmarket[category][entry]

				if not item_data then
					slot17 = "[InventoryGenerator._items_content] - Item '" .. category .. "." .. entry .. "' is not available in blackmarket."

					Application.error(slot15, Application)
				end

				if item_data.reserve_quality then
					slot16 = tweak_data.economy.qualities

					for quality, _ in pairs(slot15) do
						slot24 = false
						id = InventoryGenerator._create_id(slot20, category, entry, quality)
						safe_items[id] = {
							bonus = false,
							category = category,
							entry = entry,
							quality = quality,
							data = item_data
						}
					end

					slot16 = tweak_data.economy.qualities

					for quality, _ in pairs(slot15) do
						slot24 = true
						id = InventoryGenerator._create_id(slot20, category, entry, quality)
						safe_items[id] = {
							bonus = true,
							category = category,
							entry = entry,
							quality = quality,
							data = item_data
						}
					end
				else
					slot17 = entry
					id = InventoryGenerator._create_id(slot15, category)
					safe_items[id] = {
						category = category,
						entry = entry,
						data = item_data
					}
				end
			end
		end
	end

	return 
end
InventoryGenerator._items_add = function (category, entry, def_id, content_data, safe_items, unique_def_ids)
	slot9 = entry
	local id = InventoryGenerator._create_id(slot7, category)
	safe_items[id] = {
		entry = entry,
		category = category,
		def_id = def_id,
		data = content_data
	}

	if def_id then
		if unique_def_ids[def_id] and unique_def_ids[def_id] ~= id then
			slot10 = "[InventoryGenerator._items_add] - Item '" .. category .. "." .. entry .. "' have same ID as '" .. unique_def_ids[def_id] .. "' ( " .. def_id .. " )."

			Application.error(slot8, Application)

			return 1
		end

		unique_def_ids[def_id] = id
	end

	return 0
end
InventoryGenerator._items_containers = function (safe_items, contains, unique_def_ids)
	local error = 0
	slot6 = contains

	for category, items in pairs(slot5) do
		if category == "contents" then
			slot11 = items

			for _, entry in pairs(slot10) do
				local content_data = tweak_data.economy.contents[entry]

				if not content_data then
					slot18 = "[InventoryGenerator._items_containers] - The item 'contents." .. entry .. "' is missing."

					Application.error(slot16, Application)

					error = 1
				elseif not content_data.def_id then
					slot18 = "[InventoryGenerator._items_containers] - The item 'contents." .. entry .. "' is missing an item ID ('def_id')."

					Application.error(slot16, Application)

					error = 1
				else
					slot22 = unique_def_ids
					error = error + InventoryGenerator._items_add(slot16, category, entry, content_data.def_id, content_data, safe_items)
				end
			end
		end
	end

	return error
end
InventoryGenerator._items = function ()
	local items = {}
	local error = 0
	local unique_def_ids = {}
	local challenge_card_indexed_list = tweak_data.challenge_cards.get_all_cards_indexed(slot4)
	slot6 = challenge_card_indexed_list

	for _, challenge_card_data in pairs(tweak_data.challenge_cards) do
		slot12 = challenge_card_data

		table.insert(slot10, items)
	end

	return items, 0 < error
end
InventoryGenerator._probability_list = function (content, item_list)
	local id = nil
	local probability_list = {}
	slot6 = item_list

	for category, items in pairs(slot5) do
		local tweak_group = tweak_data.economy[category] or tweak_data.blackmarket[category]
		slot12 = items

		for _, entry in pairs(slot11) do
			local rarity = tweak_group[entry].rarity
			local rarity_bonus = tweak_group[entry].rarity .. "_bonus"
			local tweak_weight = InventorySetup.setup.rarities[content] or InventorySetup.setup.rarities.default

			if tweak_group[entry].reserve_quality then
				slot20 = tweak_data.economy.qualities

				for quality, _ in pairs(slot19) do
					slot28 = false
					id = InventoryGenerator._create_id(slot24, category, entry, quality)
					slot26 = {
						bonus = false,
						id = id,
						category = category,
						entry = entry,
						quality = quality,
						weight = tweak_weight[rarity]
					}

					table.insert(slot24, probability_list)
				end

				slot20 = tweak_data.economy.qualities

				for quality, _ in pairs(slot19) do
					slot28 = true
					id = InventoryGenerator._create_id(slot24, category, entry, quality)
					slot26 = {
						bonus = true,
						id = id,
						category = category,
						entry = entry,
						quality = quality,
						weight = tweak_weight[rarity_bonus]
					}

					table.insert(slot24, probability_list)
				end
			else
				slot21 = entry
				id = InventoryGenerator._create_id(slot19, category)
				slot21 = {
					id = id,
					category = category,
					entry = entry,
					weight = tweak_weight[rarity] + tweak_weight[rarity_bonus]
				}

				table.insert(slot19, probability_list)
			end
		end
	end

	return probability_list
end
InventoryGenerator._create_steam_itemdef_gameplay = function (json, tweak, defid_data)
	slot6 = "\t\"type\": \"playtimegenerator\","

	json.puts(slot4, json)

	local bundle_string = ""
	slot6 = tweak.contains

	for category, items in pairs(json) do
		slot11 = items

		for _, entry in pairs(slot10) do
			local drop_rate = 0

			if not InventorySetup.setup.gameplay[category] or not InventorySetup.setup.gameplay[category][entry] then
				slot18 = "[InventoryGenerator._create_steam_itemdef_gameplay] - Drop rate is missing on item " .. category .. "." .. entry .. "."

				Application.error(slot16, Application)
			else
				drop_rate = InventorySetup.setup.gameplay[category][entry]
			end

			slot18 = entry
			local id = InventoryGenerator._create_id(slot16, category)
			bundle_string = bundle_string .. defid_data[id].def_id .. "x" .. drop_rate .. ";"
		end
	end

	slot7 = "\t\"bundle\": \"" .. bundle_string .. "\","

	json.puts(slot5, json)

	return 
end
InventoryGenerator._create_steam_itemdef_bundle = function (json, tweak, defid_data)
	slot6 = "\t\"type\": \"bundle\","

	json.puts(slot4, json)

	local bundle_string = ""
	slot6 = tweak.contains

	for category, items in pairs(json) do
		slot11 = items

		for _, entry in pairs(slot10) do
			slot19 = tweak.bonus
			local id = InventoryGenerator._create_id(slot15, category, entry, tweak.quality)
			bundle_string = bundle_string .. defid_data[id].def_id .. "x1;"
		end
	end

	slot7 = "\t\"bundle\": \"" .. bundle_string .. "\","

	json.puts(slot5, json)

	return 
end
InventoryGenerator._create_steam_itemdef_content = function (json, tweak, entry, defid_data)
	slot7 = "\t\"type\": \"generator\","

	json.puts(slot5, json)

	slot7 = tweak.contains
	local proability_list = InventoryGenerator._probability_list(slot5, tweak.type or entry)
	slot7 = proability_list

	for _, data in pairs(slot6) do
		data.def_id = defid_data[data.id].def_id
	end

	function slot8(a, b)
		return (a.weight == b.weight and a.def_id < b.def_id) or b.weight < a.weight
	end

	table.sort(slot6, proability_list)

	local bundle_string = ""
	slot8 = proability_list

	for _, data in ipairs(proability_list) do
		if not data.def_id then
			slot14 = "[InventoryGenerator._create_steam_itemdef_content] - Invalid definition ID on item " .. data.category .. "." .. data.entry .. "."

			Application.error(slot12, Application)
		end

		if data.weight < 1 then
			slot14 = "[InventoryGenerator._create_steam_itemdef_content] - Too low drop chance on item " .. data.category .. "." .. data.entry .. "."

			Application.error(slot12, Application)
		end

		bundle_string = bundle_string .. data.def_id .. "x" .. data.weight .. ";"
	end

	slot9 = "\t\"bundle\": \"" .. bundle_string .. "\","

	json.puts(slot7, json)

	local exchange_string = ""
	slot9 = tweak_data.economy.safes

	for safe_entry, safe_data in pairs(json) do
		if safe_data.content == entry then
			if safe_data.free then
				slot15 = safe_entry
				local safe_id = InventoryGenerator._create_id(slot13, "safes")
				exchange_string = exchange_string .. defid_data[safe_id].def_id .. "x1;"
			elseif tweak_data.economy.drills[safe_data.drill] then
				slot15 = safe_entry
				local safe_id = InventoryGenerator._create_id(slot13, "safes")
				slot16 = safe_data.drill
				local drill_id = InventoryGenerator._create_id("safes", "drills")
				exchange_string = exchange_string .. defid_data[safe_id].def_id .. "x1," .. defid_data[drill_id].def_id .. "x1;"
			end
		end
	end

	if exchange_string ~= "" then
		slot10 = "\t\"exchange\": \"" .. exchange_string .. "\","

		json.puts(slot8, json)
	end

	return 
end
InventoryGenerator._create_hex_color = function (color)
	slot3 = color
	local r, g, b = color.unpack(slot2)
	slot7 = r * 255
	slot8 = g * 255
	slot9 = b * 255

	return string.format(slot5, "%02X") .. string.format("%02X", "%02X") .. string.format("%02X", "%02X")
end
InventoryGenerator.create_description_safe = function (safe_entry)
	local safe_td = tweak_data.economy.safes[safe_entry]

	if not safe_td then
		return "", {}
	end

	local content_td = tweak_data.economy.contents[safe_td.content]

	if not content_td then
		return "", {}
	end

	local text = ""
	local items_list = {}
	slot7 = content_td.contains

	for category, items in pairs(slot6) do
		slot12 = items

		for _, item in ipairs(slot11) do
			items_list[#items_list + 1] = {
				category = category,
				entry = item
			}
		end
	end

	local x_td, y_td, xr_td, yr_td = nil

	local function sort_func(x, y)
		x_td = tweak_data.economy[x.category] or tweak_data.blackmarket[x.category][x.entry]
		y_td = tweak_data.economy[y.category] or tweak_data.blackmarket[y.category][y.entry]
		xr_td = tweak_data.economy.rarities[x_td.rarity or "common"]
		yr_td = tweak_data.economy.rarities[y_td.rarity or "common"]

		if xr_td.index ~= yr_td.index then
			return xr_td.index < yr_td.index
		end

		return x.entry < y.entry
	end

	slot13 = sort_func

	table.sort(slot11, items_list)

	local td = nil
	slot13 = items_list

	for _, item in ipairs(items_list) do

		-- Decompilation error in this vicinity:
		td = tweak_data.economy[item.category] or tweak_data.blackmarket[item.category][item.entry]
		slot20 = tweak_data.economy.rarities[td.rarity or "common"].color
		text = text .. "[color=#" .. InventoryGenerator._create_hex_color(slot19) .. "]"
	end

	return text
end
InventoryGenerator._find_item_in_content = function (entry, category, content)
	if category == "drills" or category == "safes" or category == "contents" then
		return false
	end

	local content_data = tweak_data.economy.contents[content]

	if content_data then
		slot6 = content_data.contains

		for search_category, search_content in pairs(slot5) do
			if search_category == "contents" then
				slot11 = search_content

				for _, search_entry in pairs(slot10) do
					slot18 = search_entry

					if InventoryGenerator._find_item_in_content(slot15, entry, category) then
						return true
					end
				end
			end

			if search_category == category then
				slot11 = search_content

				for _, search_entry in pairs(slot10) do
					if search_entry == entry then
						return true
					end
				end
			end
		end
	end

	return false
end
InventoryGenerator._create_steam_itemdef = function (json_path, items, defid_data)
	slot7 = "w"
	local json = SystemFS.open(slot4, SystemFS, json_path)
	slot7 = "{"

	json.puts(SystemFS, json)

	slot10 = managers.dlc
	slot7 = "\t\"appid\": " .. managers.dlc.get_app_id(slot9) .. ","

	json.puts(SystemFS, json)

	slot7 = "\t\"items\": ["

	json.puts(SystemFS, json)

	slot6 = items

	for count, item in ipairs(SystemFS) do
		slot12 = "\t{"

		json.puts(slot10, json)

		slot12 = "\t\"itemdefid\": \"" .. item.def_id .. "\","

		json.puts(slot10, json)

		slot12 = "\t\"item_name\": \"" .. item.key_name .. "\","

		json.puts(slot10, json)

		slot12 = "\t\"item_slot\": \"" .. "challenge_card" .. "\","

		json.puts(slot10, json)

		if item.category == "gameplay" then
			slot13 = defid_data

			InventoryGenerator._create_steam_itemdef_gameplay(slot10, json, tweak)
		elseif item.category == "bundles" then
			slot13 = defid_data

			InventoryGenerator._create_steam_itemdef_bundle(slot10, json, tweak)
		elseif item.category == "contents" then
			slot14 = defid_data

			InventoryGenerator._create_steam_itemdef_content(slot10, json, tweak, item.entry)
		else
			slot12 = "\t\"type\": \"item\","

			json.puts(slot10, json)
		end

		slot16 = item.name
		slot12 = "\t\"name\": \"" .. managers.localization.text(slot14, managers.localization) .. "\","

		json.puts(slot10, json)

		slot12 = "\t\"store_tags\": \"" .. "challenge card" .. "\","

		json.puts(slot10, json)

		slot12 = item.key_name
		local description_positive_text, description_negative_text = managers.challenge_cards.get_card_description(slot10, managers.challenge_cards)

		if description_positive_text ~= "" and description_negative_text ~= "" then
			slot14 = "\t\"description\": \"" .. description_positive_text .. "; " .. description_negative_text .. "\","

			json.puts(slot12, json)
		elseif description_positive_text ~= "" and description_negative_text == "" then
			slot14 = "\t\"description\": \"" .. description_positive_text .. "\","

			json.puts(slot12, json)
		elseif description_positive_text == "" and description_negative_text ~= "" then
			slot14 = "\t\"description\": \"" .. description_negative_text .. "\","

			json.puts(slot12, json)
		end

		slot14 = "\t\"icon_url\": \"https://s3-us-west-2.amazonaws.com/media.raidww2.com/steam_icons_challenge_cards/" .. item.key_name .. "_small.png\","

		json.puts(slot12, json)

		slot14 = "\t\"icon_url_large\": \"https://s3-us-west-2.amazonaws.com/media.raidww2.com/steam_icons_challenge_cards/" .. item.key_name .. "_large.png\","

		json.puts(slot12, json)
		json.puts(slot12, json)

		local tradable = "true"
		local marketable = "false"
		slot16 = "\t\"tradable\": " .. tradable .. ","

		json.puts("\t\"name_color\": \"" .. "2360D8" .. "\",", json)

		slot16 = "\t\"marketable\": " .. marketable

		json.puts("\t\"name_color\": \"" .. "2360D8" .. "\",", json)

		if count == #items then
			slot16 = "\t}"

			json.puts(slot14, json)
		else
			slot16 = "\t},"

			json.puts(slot14, json)
		end
	end

	slot7 = "\t]"

	json.puts(slot5, json)

	slot7 = "}"

	json.puts(slot5, json)

	slot7 = json

	SystemFS.close(slot5, SystemFS)

	return 
end
InventoryGenerator._create_steam_itemdef_clear = function (json_path, items, defid_data)
	slot7 = "w"
	local json = SystemFS.open(slot4, SystemFS, json_path)
	slot7 = "{"

	json.puts(SystemFS, json)

	slot7 = "\t\"appid\": 412890,"

	json.puts(SystemFS, json)

	slot7 = "\t\"items\": ["

	json.puts(SystemFS, json)

	local keys_sorted = table.map_keys(SystemFS)
	slot7 = keys_sorted

	for count, index in ipairs(items) do
		local item = items[index]
		local tweak = item.data
		slot15 = "\t{"

		json.puts(slot13, json)

		slot15 = "\t\"itemdefid\": " .. item.def_id

		json.puts(slot13, json)

		if count == #keys_sorted then
			slot15 = "\t}"

			json.puts(slot13, json)
		else
			slot15 = "\t},"

			json.puts(slot13, json)
		end
	end

	slot8 = "\t]"

	json.puts(slot6, json)

	slot8 = "}"

	json.puts(slot6, json)

	slot8 = json

	SystemFS.close(slot6, SystemFS)

	return 
end
InventoryGenerator._defids = function (json_path)
	local defid_list = {}
	slot4 = json_path
	local json_data = InventoryGenerator.json_load(slot3)

	if json_data and json_data.items then
		slot5 = json_data.items

		if type(slot4) == "table" then
			slot5 = json_data.items

			for _, item in pairs(slot4) do
				slot10 = item.itemdefid
				local def_id = tonumber(slot9)

				if defid_list[def_id] then
					slot23 = def_id
					slot12 = "[InventoryGenerator._defids] - The item '" .. item.item_slot .. "." .. item.item_name .. "' conflicts with item '" .. defid_list[def_id].category .. "." .. defid_list[def_id].entry .. "'. They use the same ID (" .. tostring(slot22) .. ")."

					Application.error(slot10, Application)
				else
					defid_list[def_id] = true
				end
			end
		end
	end

	return defid_list
end
InventoryGenerator._create_id = function (category, entry, quality, bonus)
	if not category or not entry then
		return 
	end

	local id = category .. "_" .. entry

	if quality then
		id = id .. ((bonus and "_b_") or "_n_") .. quality
	end

	return id
end
InventoryGenerator._fill_defids = function (list, json_path)
	local defid_list = {}
	local defid_data = {}
	slot6 = list

	for safe, safe_items in pairs(slot5) do
		slot11 = json_path .. "safe_" .. safe .. ".json"
		local json_data = InventoryGenerator.json_load(slot10)

		if json_data and json_data.items then
			slot12 = json_data.items

			if type(slot11) == "table" then
				slot12 = json_data.items

				for _, item in pairs(slot11) do
					slot21 = item.promo
					local id = InventoryGenerator._create_id(slot16, item.item_slot, item.item_name, item.dsl_quality, item.dsl_bonus == "true")
					slot18 = item.itemdefid
					local def_id = tonumber(item.item_slot)

					if safe_items[id] then
						if not safe_items[id].def_id then
							safe_items[id].def_id = def_id
						elseif safe_items[id].def_id ~= def_id then
							slot27 = safe_items[id].def_id
							slot29 = def_id
							slot20 = "[InventoryGenerator._fill_defids] - The item '" .. item.item_slot .. "." .. item.item_name .. " have different ID since last time ( New: " .. tostring(slot26) .. ", Old: " .. tostring(slot28) .. ")."

							Application.error(slot18, Application)
						end
					end

					defid_list[def_id] = true
					defid_data[id] = {
						category = item.item_slot,
						entry = item.item_name,
						quality = item.dsl_quality,
						bonus = item.dsl_bonus,
						def_id = def_id
					}
				end
			end
		end
	end

	return defid_list, defid_data
end
InventoryGenerator._fill_defids_OLD = function (list, json_path)
	local defid_list = {}
	local defid_data = {}
	slot6 = json_path .. "inventory.json"
	local json_data = InventoryGenerator.json_load(slot5)

	if json_data and json_data.items then
		slot7 = json_data.items

		if type(slot6) == "table" then
			slot7 = json_data.items

			for _, item in pairs(slot6) do
				slot15 = item.dsl_bonus == "true"
				local id = InventoryGenerator._create_id(slot11, item.item_slot, item.item_name, item.dsl_quality)

				if id then
					local def_id = tonumber(slot12)
					slot14 = list

					for safe, safe_items in pairs(item.itemdefid) do
						if safe_items[id] and not safe_items[id].def_id then
							safe_items[id].def_id = def_id
						end
					end

					defid_list[def_id] = true
					defid_data[id] = {
						category = item.item_slot,
						entry = item.item_name,
						quality = item.dsl_quality,
						bonus = item.dsl_bonus,
						def_id = def_id
					}
				end
			end
		end
	end

	return defid_list, defid_data
end
InventoryGenerator.json_load = function (path)
	slot4 = path

	if not SystemFS.exists(slot2, SystemFS) then
		return 
	end

	slot5 = "r"
	local json = SystemFS.open(slot2, SystemFS, path)
	local json_data = json.read(SystemFS)
	slot6 = json

	SystemFS.close(json, SystemFS)

	slot6 = "{"
	local start = json_data.find(json, json_data)
	slot7 = "}[^}]*$"
	local stop = json_data.find(json_data, json_data)
	slot5 = InventoryGenerator._json_entry

	if start or not json_data then
		slot11 = stop and stop - 1
		slot7 = json_data.sub(slot8, json_data, start + 1)
	end

	return slot5(slot6)
end
InventoryGenerator._json_entry = function (data_string)
	local key, temp = nil
	local i1 = 1
	local i2 = 1
	local data = {}

	while i2 and i2 < #data_string do
		slot10 = i2
		i1 = data_string.find(slot7, data_string, "\"")
		slot10 = i1 and i1 + 1
		i2 = data_string.find(slot7, data_string, "\"")

		if not i1 or not i2 then
			break
		end

		slot10 = i2 - 1
		key = data_string.sub(slot7, data_string, i1 + 1)
		slot10 = i2
		i1 = data_string.find(slot7, data_string, ":")

		if not i1 then
			break
		end

		i2 = i1 + 1
		slot10 = i2
		slot10 = 1
		local first_char = data_string.match(slot7, data_string, "^%s*(.+)").sub(slot7, data_string.match(slot7, data_string, "^%s*(.+)"), 1)

		if first_char == "[" then
			slot12 = i1
			temp, i2 = InventoryGenerator._json_find_section(slot8, data_string, "%[", "%]")
		elseif first_char == "{" then
			slot12 = i1
			temp, i2 = InventoryGenerator._json_find_section(slot8, data_string, "{", "}")
		end

		local pos = i2
		slot12 = pos
		i2 = data_string.find(slot9, data_string, ",")

		if i2 then
			slot12 = pos
			local str_pos = data_string.find(slot9, data_string, "\"")

			if str_pos and str_pos < i2 then
				slot13 = str_pos + 1
				str_pos = data_string.find(slot10, data_string, "\"")
				local t = i2
				slot14 = str_pos
				i2 = data_string.find(data_string, data_string, ",")
			end
		end

		slot14 = i2 and i2 - 1
		data[key] = InventoryGenerator._json_value(data_string.sub(slot11, data_string, i1 + 1))
	end

	return data
end
InventoryGenerator._json_value = function (data_string)
	if not data_string or data_string == "" then
		return 
	end

	slot4 = "^%s*(.+)"
	slot5 = 1
	local first_char = data_string.match(slot2, data_string).sub(slot2, data_string.match(slot2, data_string), 1)

	if first_char == "\"" then
		local start = data_string.find(slot3, data_string)
		slot7 = start + 1
		local stop = data_string.find(data_string, data_string, "\"")
		slot8 = stop and stop - 1

		return data_string.sub("\"", data_string, start + 1)
	elseif first_char == "t" then
		slot5 = "t"
		local start = data_string.find(slot3, data_string)
		slot7 = start + 4

		if data_string.sub(data_string, data_string, start) == "true" then
			return true
		end
	elseif first_char == "f" then
		slot5 = "f"
		local start = data_string.find(slot3, data_string)
		slot7 = start + 5

		if data_string.sub(data_string, data_string, start) == "false" then
			return false
		end
	elseif first_char == "{" then
		slot6 = "}"
		local start, stop = InventoryGenerator._json_find_section(slot3, data_string, "{")
		slot10 = stop and stop - 1

		return InventoryGenerator._json_entry(data_string.sub(slot7, data_string, start + 1))
	elseif first_char == "[" then
		slot6 = "%]"
		local start, stop = InventoryGenerator._json_find_section(slot3, data_string, "%[")
		slot10 = stop and stop - 1

		return InventoryGenerator._json_value_list(data_string.sub(slot7, data_string, start + 1))
	else
		slot4 = data_string

		return tonumber(slot3)
	end

	return 
end
InventoryGenerator._json_value_list = function (data_string)
	local data = {}
	local start = 1
	local stop = 1

	while stop and stop < #data_string do
		slot9 = stop
		start, stop = InventoryGenerator._json_find_section(slot5, data_string, "{", "}")

		if not start then
			break
		end

		slot6 = data
		slot13 = stop and stop - 1

		table.insert(slot5, InventoryGenerator._json_entry(data_string.sub(slot10, data_string, start + 1)))
	end

	return data
end
InventoryGenerator._json_find_section = function (data_string, start_char, stop_char, pos)
	local stop = pos or 1
	slot9 = stop
	local start = data_string.find(slot6, data_string, start_char)
	local current = start

	while current do
		slot11 = current + 1
		local i = data_string.find(slot8, data_string, start_char)
		slot12 = current + 1
		stop = data_string.find(data_string, data_string, stop_char)

		if i and stop and i < stop then
			current = i + 1
		else
			current = nil
			local find_string = pos or 1

			while find_string do
				slot13 = find_string
				local string_start = data_string.find(slot10, data_string, "\"")
				find_string = nil

				if string_start and stop and string_start < stop then
					slot14 = string_start + 1
					local string_stop = data_string.find(slot11, data_string, "\"")

					if string_stop then
						if stop < string_stop then
							current = string_stop + 1
						else
							find_string = string_stop + 1
						end
					end
				end
			end
		end
	end

	return start, stop or #data_string
end
InventoryGenerator._root_path = function ()
	slot3 = "-assetslocation"
	local path = Application.base_path(slot1) .. (CoreApp.arg_value(Application) or "..\\..\\")
	slot5 = true
	path = Application.nice_path(slot2, Application, path)
	local f = nil

	function f(s)

		-- Decompilation error in this vicinity:
		slot5 = ""
		local str, i = string.gsub(slot2, s, "\\[%w_%.%s]+\\%.%.")
	end

	slot4 = path

	return f(Application)
end

return 
