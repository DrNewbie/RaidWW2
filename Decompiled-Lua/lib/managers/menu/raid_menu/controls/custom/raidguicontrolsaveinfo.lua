if not RaidGUIControlSaveInfo then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlSaveInfo = slot0
RaidGUIControlSaveInfo.DOG_TAG_LABEL_X = 76
function RaidGUIControlSaveInfo:init(parent, params)
	slot7 = params

	RaidGUIControlSaveInfo.super.init(slot4, self, parent)

	self._on_click_callback = params.on_click_callback
	slot5 = self

	self._create_panel(slot4)

	slot5 = self

	self._create_info_icons(slot4)

	slot5 = self

	self._create_separator(slot4)

	slot5 = self

	self._create_peer_details_title(slot4)

	slot5 = self

	self._create_peer_details(slot4)

	return 
end
function RaidGUIControlSaveInfo:_create_panel()
	slot3 = self._params
	local panel_params = clone(slot2)
	panel_params.name = panel_params.name .. "_panel"

	if not panel_params.layer then
		slot4 = self._panel
		slot2 = self._panel.layer(slot3) + 1
	end

	panel_params.layer = slot2
	panel_params.x = self._params.x or 0
	panel_params.y = self._params.y or 0

	if not self._params.w then
		slot4 = self._panel
		slot2 = self._panel.w(slot3)
	end

	panel_params.w = slot2

	if not self._params.h then
		slot4 = self._panel
		slot2 = self._panel.h(slot3)
	end

	panel_params.h = slot2
	slot5 = panel_params
	self._object = self._panel.panel(slot3, self._panel)

	return 
end
function RaidGUIControlSaveInfo:_create_info_icons()
	local info_icons_panel_params = {
		name = "info_icons_panel",
		h = 96,
		y = 18,
		x = 0
	}
	slot4 = self._object
	info_icons_panel_params.w = self._object.w(slot3) * 0.78
	slot5 = info_icons_panel_params
	self._info_icons_panel = self._object.panel(slot3, self._object)
	slot7 = self._object

	self._info_icons_panel.set_center_x(slot3, self._info_icons_panel)

	slot4 = self._info_icons_panel
	local h = self._info_icons_panel.h(slot3)
	local dog_tag_panel_params = {
		name = "dog_tag_panel",
		h = 64,
		y = 23,
		w = 180,
		x = 0
	}
	slot7 = dog_tag_panel_params
	self._dog_tag_panel = self._info_icons_panel.panel(self._object.w(slot6) / 2, self._info_icons_panel)
	local dog_tag_icon_params = {
		name = "dog_tag_icon",
		texture = tweak_data.gui.icons.rewards_dog_tags_small.texture,
		texture_rect = tweak_data.gui.icons.rewards_dog_tags_small.texture_rect,
		color = tweak_data.gui.colors.raid_black
	}
	slot8 = dog_tag_icon_params
	local dog_tag_icon = self._dog_tag_panel.bitmap(self._info_icons_panel, self._dog_tag_panel)
	slot11 = self._dog_tag_panel
	slot9 = self._dog_tag_panel.h(slot10) / 2

	dog_tag_icon.set_center_y(self._dog_tag_panel, dog_tag_icon)

	local dog_tag_count_params = {
		vertical = "center",
		name = "dog_tag_count",
		h = 32,
		align = "center",
		text = "120 / 140",
		y = 0,
		x = RaidGUIControlSaveInfo.DOG_TAG_LABEL_X,
		font = RaidGUIControlPeerDetails.FONT,
		font_size = tweak_data.gui.font_sizes.size_32,
		color = tweak_data.gui.colors.raid_black
	}
	slot10 = dog_tag_count_params
	self._dog_tag_count = self._dog_tag_panel.text(dog_tag_icon, self._dog_tag_panel)
	local dog_tag_label_params = {
		name = "dog_tag_label",
		vertical = "center",
		h = 32,
		align = "center",
		y = 32,
		font = RaidGUIControlPeerDetails.FONT,
		font_size = tweak_data.gui.font_sizes.extra_small,
		color = tweak_data.gui.colors.raid_black
	}
	slot12 = true
	dog_tag_label_params.text = self.translate(self._dog_tag_panel, self, "menu_loot_screen_dog_tags")
	slot11 = dog_tag_label_params
	self._dog_tag_label = self._dog_tag_panel.text(self._dog_tag_panel, self._dog_tag_panel)
	slot10 = self._dog_tag_label
	local _, _, w, _ = self._dog_tag_label.text_rect(self._dog_tag_panel)
	slot15 = w

	self._dog_tag_label.set_w(slot13, self._dog_tag_label)

	slot15 = h

	self._info_icons_panel.set_h(slot13, self._info_icons_panel)

	return 
end
function RaidGUIControlSaveInfo:_create_separator()
	local separator_params = {
		name = "separator",
		h = 2,
		y = 123,
		w = 446,
		x = 34,
		color = tweak_data.gui.colors.raid_black
	}
	slot5 = separator_params
	self._separator = self._object.rect(slot3, self._object)

	return 
end
function RaidGUIControlSaveInfo:_create_peer_details_title()
	local peer_details_title_params = {
		name = "peer_details_title",
		h = 32,
		vertical = "center",
		align = "left",
		y = 137
	}
	slot4 = self._info_icons_panel
	peer_details_title_params.x = self._info_icons_panel.x(slot3)
	slot4 = self._info_icons_panel
	peer_details_title_params.w = self._info_icons_panel.w(slot3)
	peer_details_title_params.font = RaidGUIControlPeerDetails.FONT
	peer_details_title_params.font_size = tweak_data.gui.font_sizes.extra_small
	peer_details_title_params.color = tweak_data.gui.colors.raid_light_red
	slot6 = true
	peer_details_title_params.text = self.translate(slot3, self, "operation_save_details_teammates_title")
	slot5 = peer_details_title_params
	self._peer_details_title = self._object.text(slot3, self._object)

	return 
end
function RaidGUIControlSaveInfo:_create_peer_details()
	local peer_info_panel_params = {
		name = "peer_info_panel",
		h = 512,
		y = 202
	}
	slot4 = self._info_icons_panel
	peer_info_panel_params.x = self._info_icons_panel.x(slot3)
	slot4 = self._info_icons_panel
	peer_info_panel_params.w = self._info_icons_panel.w(slot3)
	slot5 = peer_info_panel_params
	self._peer_info_panel = self._object.panel(slot3, self._object)
	self._peer_info_details = {}
	local y = 0

	for i = 1, 4, 1 do
		local params = {
			x = 0,
			y = y
		}
		slot10 = self._peer_info_panel
		params.w = self._peer_info_panel.w(slot9)
		slot12 = params
		local peer_details = self._peer_info_panel.create_custom_control(slot9, self._peer_info_panel, RaidGUIControlPeerDetails)
		slot12 = peer_details

		table.insert(self._peer_info_panel, self._peer_info_details)

		y = y + 112
	end

	return 
end
function RaidGUIControlSaveInfo:set_save_info(slot_index)
	slot4 = managers.raid_job
	local save_slot = managers.raid_job.get_save_slots(slot3)[slot_index]

	if not save_slot then
		return 
	end

	local event_data = save_slot.event_data[#save_slot.event_data]
	local loot_acquired = 0
	local loot_spawned = 0
	slot8 = save_slot.event_data

	for _, data in pairs(slot7) do
		if data.loot_data then
			loot_acquired = loot_acquired + data.loot_data.acquired
			loot_spawned = loot_spawned + data.loot_data.spawned
		end
	end

	if loot_spawned == 0 then
		slot8 = self._dog_tag_count

		self._dog_tag_count.set_text(slot7, tostring(slot10))

		slot8 = self._dog_tag_count
		local _, _, w, _ = self._dog_tag_count.text_rect(slot7)
		slot13 = w

		self._dog_tag_count.set_w("--", self._dog_tag_count)
	else
		slot11 = loot_acquired
		slot13 = loot_spawned
		slot9 = tostring(slot10) .. " / " .. tostring(slot12)

		self._dog_tag_count.set_text(slot7, self._dog_tag_count)

		slot8 = self._dog_tag_count
		local _, _, w, _ = self._dog_tag_count.text_rect(slot7)
		slot13 = w

		self._dog_tag_count.set_w(tostring(slot12), self._dog_tag_count)
	end

	local rotation = self._dog_tag_panel.rotation(slot7)
	slot10 = 0

	self._dog_tag_panel.set_rotation(self._dog_tag_panel, self._dog_tag_panel)

	slot10 = 0

	self._dog_tag_count.set_y(self._dog_tag_panel, self._dog_tag_count)
	self._dog_tag_label.set_y(self._dog_tag_panel, self._dog_tag_label)

	slot9 = self._dog_tag_count.w(32)
	local actual_w = math.max(self._dog_tag_panel, self._dog_tag_label.w(self._dog_tag_count))
	slot11 = actual_w

	self._dog_tag_count.set_w(slot9, self._dog_tag_count)

	slot11 = actual_w

	self._dog_tag_label.set_w(slot9, self._dog_tag_label)

	slot11 = RaidGUIControlSaveInfo.DOG_TAG_LABEL_X

	self._dog_tag_count.set_x(slot9, self._dog_tag_count)

	slot11 = RaidGUIControlSaveInfo.DOG_TAG_LABEL_X

	self._dog_tag_label.set_x(slot9, self._dog_tag_label)

	slot10 = self._dog_tag_panel
	slot13 = self._dog_tag_count

	self._dog_tag_panel.set_w(slot9, self._dog_tag_count.right(self._dog_tag_label))

	slot11 = rotation

	self._dog_tag_panel.set_rotation(slot9, self._dog_tag_panel)

	if not event_data.peer_data then
		slot10 = "[RaidGUIControlSaveInfo][set_save_info] Operation save has no peer data: "
		slot13 = event_data

		debug_pause(slot9, inspect(slot12))

		return 
	end

	for i = 1, #self._peer_info_details, 1 do
		slot15 = 0

		self._peer_info_details[i].set_alpha(slot13, self._peer_info_details[i])

		local peer_data = event_data.peer_data[i]

		if peer_data then
			local name = nil

			if peer_data.is_local_player then
				slot18 = true
				name = self.translate(slot15, self, "menu_save_info_you") .. " (" .. peer_data.name .. ")"
			else
				slot17 = "XB1"

				if SystemInfo.platform(slot15) == Idstring(SystemInfo) then
					slot17 = peer_data.nationality
					name = managers.hud.get_character_name_by_nationality(slot15, managers.hud)
				else
					name = peer_data.name
				end
			end

			slot17 = name

			self._peer_info_details[i].set_profile_name(slot15, self._peer_info_details[i])

			slot17 = peer_data.class

			self._peer_info_details[i].set_class(slot15, self._peer_info_details[i])

			slot17 = peer_data.nationality

			self._peer_info_details[i].set_nationality(slot15, self._peer_info_details[i])

			slot17 = peer_data.level

			self._peer_info_details[i].set_level(slot15, self._peer_info_details[i])

			slot17 = 1

			self._peer_info_details[i].set_alpha(slot15, self._peer_info_details[i])
		end
	end

	return 
end
function RaidGUIControlSaveInfo:set_left(left)
	slot5 = left

	self._object.set_left(slot3, self._object)

	return 
end
function RaidGUIControlSaveInfo:set_right(right)
	slot5 = right

	self._object.set_right(slot3, self._object)

	return 
end
function RaidGUIControlSaveInfo:set_top(top)
	slot5 = top

	self._object.set_top(slot3, self._object)

	return 
end
function RaidGUIControlSaveInfo:set_bottom(bottom)
	slot5 = bottom

	self._object.set_bottom(slot3, self._object)

	return 
end
function RaidGUIControlSaveInfo:set_center_x(center_x)
	slot5 = center_x

	self._object.set_center_x(slot3, self._object)

	return 
end
function RaidGUIControlSaveInfo:set_center_y(center_y)
	slot5 = center_y

	self._object.set_center_y(slot3, self._object)

	return 
end
function RaidGUIControlSaveInfo:close()
	return 
end

return 
