-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
if not RaidGUIControlRewardCardPack then
	slot2 = RaidGUIControl
	slot0 = class(slot1)
end

RaidGUIControlRewardCardPack = slot0
RaidGUIControlRewardCardPack.DEFAULT_WIDTH = 400
RaidGUIControlRewardCardPack.HEIGHT = 400
RaidGUIControlRewardCardPack.FONT = tweak_data.gui.fonts.din_compressed
RaidGUIControlRewardCardPack.LEFT_PANEL_W = 860
RaidGUIControlRewardCardPack.TITLE_DESCRIPTION_Y = 690
RaidGUIControlRewardCardPack.TITLE_DESCRIPTION_H = 50
RaidGUIControlRewardCardPack.TITLE_DESCRIPTION_FONT_SIZE = tweak_data.gui.font_sizes.size_32
RaidGUIControlRewardCardPack.TITLE_DESCRIPTION_COLOR = tweak_data.gui.colors.raid_white
RaidGUIControlRewardCardPack.TITLE_PADDING_TOP = -14
RaidGUIControlRewardCardPack.TITLE_FONT_SIZE = tweak_data.gui.font_sizes.size_76
RaidGUIControlRewardCardPack.TITLE_COLOR = tweak_data.gui.colors.raid_red
RaidGUIControlRewardCardPack.CARD_PACK_Y_OFFSET = 60
RaidGUIControlRewardCardPack.DESCRIPTION_Y = 304
RaidGUIControlRewardCardPack.DESCRIPTION_W = 416
RaidGUIControlRewardCardPack.DESCRIPTION_FONT = tweak_data.gui.fonts.lato
RaidGUIControlRewardCardPack.DESCRIPTION_FONT_SIZE = tweak_data.gui.font_sizes.size_20
RaidGUIControlRewardCardPack.DESCRIPTION_COLOR = tweak_data.gui.colors.raid_grey
RaidGUIControlRewardCardPack.DESCRIPTION_PADDING_DOWN = 32
RaidGUIControlRewardCardPack.ITEM_TYPE_Y = 224
RaidGUIControlRewardCardPack.ITEM_TYPE_H = 64
RaidGUIControlRewardCardPack.ITEM_TYPE_FONT_SIZE = tweak_data.gui.font_sizes.size_38
RaidGUIControlRewardCardPack.ITEM_TYPE_COLOR = tweak_data.gui.colors.raid_white
function RaidGUIControlRewardCardPack:init(parent, params)
	slot7 = params

	RaidGUIControlRewardCardPack.super.init(slot4, self, parent)

	slot5 = self

	self._create_panel(slot4)

	slot5 = self

	self._create_left_panel(slot4)

	slot5 = self

	self._create_cards_control(slot4)

	slot5 = self

	self._create_right_panel(slot4)

	slot5 = self

	self._create_description(slot4)

	slot5 = self

	self._create_item_description_name(slot4)

	return 
end
function RaidGUIControlRewardCardPack:_create_panel()
	local panel_params = {
		visible = false,
		name = "local_player_card_pack_reward_panel",
		x = self._params.x or 0,
		y = self._params.y or 0,
		w = self._params.w,
		h = self._params.h
	}
	slot4 = self._panel
	panel_params.layer = self._panel.layer(slot3) + 1
	slot5 = panel_params
	self._object = self._panel.panel(slot3, self._panel)

	return 
end
function RaidGUIControlRewardCardPack:_create_control_panel()
	slot3 = self._params
	local control_params = clone(slot2)
	control_params.x = control_params.x
	control_params.w = control_params.w or RaidGUIControlRewardCardPack.DEFAULT_WIDTH
	control_params.h = control_params.h or RaidGUIControlRewardCardPack.HEIGHT
	control_params.name = control_params.name .. "_card_pack_panel"
	slot4 = self._panel
	control_params.layer = self._panel.layer("_card_pack_panel") + 1
	slot5 = control_params
	self._control_panel = self._panel.panel("_card_pack_panel", self._panel)
	self._object = self._control_panel

	return 
end
function RaidGUIControlRewardCardPack:_create_left_panel()
	local left_panel_params = {
		name = "left_panel",
		w = RaidGUIControlRewardCardPack.LEFT_PANEL_W
	}
	slot4 = self._object
	left_panel_params.h = self._object.h(slot3)
	slot5 = left_panel_params
	self._left_panel = self._object.panel(slot3, self._object)

	return 
end
function RaidGUIControlRewardCardPack:_create_title()
	local title_description_params = {
		name = "title_description",
		vertical = "center",
		alpha = 0,
		align = "left",
		y = RaidGUIControlRewardCardPack.TITLE_DESCRIPTION_Y,
		h = RaidGUIControlRewardCardPack.TITLE_DESCRIPTION_H,
		font = RaidGUIControlRewardCardPack.FONT,
		font_size = RaidGUIControlRewardCardPack.TITLE_DESCRIPTION_FONT_SIZE,
		color = RaidGUIControlRewardCardPack.TITLE_DESCRIPTION_COLOR
	}
	slot6 = true
	title_description_params.text = self.translate(slot3, self, "menu_loot_screen_bracket_unlocked_title")
	slot5 = title_description_params
	self._title_description = self._left_panel.text(slot3, self._left_panel)
	slot5 = true

	self._title_description.set_debug(slot3, self._title_description)

	slot4 = self._title_description
	local _, _, w, _ = self._title_description.text_rect(slot3)
	slot9 = w

	self._title_description.set_w(slot7, self._title_description)

	local title_params = {
		vertical = "top",
		name = "pack_title",
		alpha = 0,
		align = "center"
	}
	slot10 = self._title_description
	title_params.y = self._title_description.y(self._title_description) + self._title_description.h(self._title_description) + RaidGUIControlRewardCardPack.TITLE_PADDING_TOP
	title_params.font = RaidGUIControlRewardCardPack.FONT
	title_params.font_size = RaidGUIControlRewardCardPack.TITLE_FONT_SIZE
	title_params.color = RaidGUIControlRewardCardPack.TITLE_COLOR
	slot11 = true
	title_params.text = self.translate(RaidGUIControlRewardCardPack.TITLE_PADDING_TOP, self, "menu_loot_screen_card_pack")
	slot10 = title_params
	self._pack_title = self._left_panel.text(RaidGUIControlRewardCardPack.TITLE_PADDING_TOP, self._left_panel)
	slot9 = self._pack_title
	local _, _, w, h = self._pack_title.text_rect(RaidGUIControlRewardCardPack.TITLE_PADDING_TOP)
	slot14 = w

	self._pack_title.set_w(slot12, self._pack_title)

	slot14 = h

	self._pack_title.set_h(slot12, self._pack_title)

	slot16 = self._left_panel
	slot14 = self._left_panel.w(slot15) / 2

	self._pack_title.set_center_x(slot12, self._pack_title)

	slot13 = self._title_description
	slot16 = self._pack_title

	self._title_description.set_x(slot12, self._pack_title.x(slot15))

	return 
end
function RaidGUIControlRewardCardPack:_create_cards_control()
	local cards_control_params = {
		visible = false,
		name = "cards_control",
		h = 900,
		y = 0,
		w = 780,
		x = 0,
		item_params = {
			item_w = 256,
			item_h = 352,
			wrapper_h = 600
		}
	}
	self._cards_control = self._left_panel.create_custom_control(slot3, self._left_panel, RaidGUIControlLootRewardCards)
	slot7 = self._left_panel
	slot5 = self._left_panel.w(cards_control_params) / 2 + 38

	self._cards_control.set_center_x(slot3, self._cards_control)

	slot7 = self._left_panel
	slot5 = self._left_panel.h(cards_control_params) / 2 + RaidGUIControlRewardCardPack.CARD_PACK_Y_OFFSET

	self._cards_control.set_center_y(slot3, self._cards_control)

	return 
end
function RaidGUIControlRewardCardPack:_create_right_panel()
	local right_panel_params = {
		name = "right_panel"
	}
	slot5 = self._left_panel
	slot3 = self._left_panel.w(self._object)
	right_panel_params.w = self._object.w(slot3) - slot3
	slot4 = self._object
	right_panel_params.h = self._object.h(slot3)
	slot5 = right_panel_params
	self._right_panel = self._object.panel(slot3, self._object)
	slot4 = self._right_panel
	slot7 = self._object

	self._right_panel.set_right(slot3, self._object.w(slot6))

	return 
end
function RaidGUIControlRewardCardPack:_create_description()
	local description_params = {
		vertical = "top",
		name = "description",
		wrap = true,
		align = "left",
		alpha = 0,
		y = RaidGUIControlRewardCardPack.DESCRIPTION_Y,
		w = RaidGUIControlRewardCardPack.DESCRIPTION_W,
		font = RaidGUIControlRewardCardPack.DESCRIPTION_FONT,
		font_size = RaidGUIControlRewardCardPack.DESCRIPTION_FONT_SIZE,
		color = RaidGUIControlRewardCardPack.DESCRIPTION_COLOR
	}
	slot5 = "menu_loot_screen_card_pack_description"
	description_params.text = self.translate(slot3, self)
	slot5 = description_params
	self._description = self._right_panel.text(slot3, self._right_panel)
	slot4 = self._description
	slot7 = self._right_panel

	self._description.set_right(slot3, self._right_panel.w(slot6))

	return 
end
function RaidGUIControlRewardCardPack:_create_item_description_name()
	local item_type_params = {
		name = "item_type",
		vertical = "center",
		align = "left",
		alpha = 0
	}
	slot4 = self._description
	item_type_params.x = self._description.x(slot3)
	item_type_params.y = RaidGUIControlRewardCardPack.ITEM_TYPE_Y
	slot4 = self._right_panel
	item_type_params.w = self._right_panel.w(slot3)
	item_type_params.h = RaidGUIControlRewardCardPack.ITEM_TYPE_H
	item_type_params.font = RaidGUIControlRewardCardPack.FONT
	item_type_params.font_size = RaidGUIControlRewardCardPack.ITEM_TYPE_FONT_SIZE
	item_type_params.color = RaidGUIControlRewardCardPack.ITEM_TYPE_COLOR
	slot6 = true
	item_type_params.text = self.translate(slot3, self, "menu_loot_screen_card_pack")
	slot5 = item_type_params
	self._item_description_name = self._right_panel.text(slot3, self._right_panel)

	return 
end
function RaidGUIControlRewardCardPack:show()
	slot3 = self

	RaidGUIControlRewardCardPack.super.show(slot2)

	local duration = 1.9
	local t = 0
	local image_duration = 0.1
	local image_duration_slowdown = 1.75
	local title_delay = 0
	local title_duration = 1
	slot9 = self._description
	local description_x = self._description.x(slot8)
	local description_offset = 30
	slot11 = self._item_description_name
	local item_description_name_x = self._item_description_name.x(slot10)
	local item_description_name_offset = 30
	slot13 = self._cards_control

	self._cards_control.animate_show(slot12)

	while t < duration do
		local dt = coroutine.yield()
		t = t + dt
		slot17 = image_duration
		local current_alpha = Easing.quartic_out(slot13, t, 0, 1)

		if title_delay < t then
			slot18 = title_duration
			local current_title_alpha = Easing.quartic_out(slot14, t - title_delay, 0, 1)
			slot17 = current_title_alpha

			self._description.set_alpha(t - title_delay, self._description)

			slot17 = current_title_alpha

			self._item_description_name.set_alpha(t - title_delay, self._item_description_name)

			slot19 = title_duration
			local description_current_offset = Easing.quartic_out(t - title_delay, t - title_delay, -description_offset, description_offset)
			slot18 = description_x + description_current_offset

			self._description.set_x(t - title_delay, self._description)

			slot20 = title_duration
			local item_type_current_offset = Easing.quartic_out(t - title_delay, t - title_delay, -item_description_name_offset, item_description_name_offset)
			slot19 = item_description_name_x + item_type_current_offset

			self._item_description_name.set_x(t - title_delay, self._item_description_name)
		end
	end

	slot14 = 1

	self._description.set_alpha(slot12, self._description)

	slot14 = description_x

	self._description.set_x(slot12, self._description)

	slot14 = 1

	self._item_description_name.set_alpha(slot12, self._item_description_name)

	slot14 = item_description_name_x

	self._item_description_name.set_x(slot12, self._item_description_name)

	return 
end
function RaidGUIControlRewardCardPack:set_cards(card_list)
	slot5 = card_list

	self._cards_control.set_cards(slot3, self._cards_control)

	return 
end
function RaidGUIControlRewardCardPack:is_selected_card_revealed()
end
function RaidGUIControlRewardCardPack:selected_item_idx()
	return self._selected_item_idx
end
function RaidGUIControlRewardCardPack:set_selected(flag)

	-- Decompilation error in this vicinity:
	self._selected = flag
	self._selected_item_idx = 0

	if flag then
		slot4 = self._cards_control
		slot4 = self._cards_control.get_items(slot3)[1]

		self._cards_control.get_items(slot3)[1].select(slot3)

		self._selected_item_idx = 1
	else
		slot6 = self._cards_control

		for _, item in pairs(self._cards_control.get_items(slot5)) do
			slot9 = item

			item.unselect(slot8)
		end

		self._selected_item_idx = 0
	end

	return 
end
function RaidGUIControlRewardCardPack:move_left()
	if self._selected then
		local new_item_idx = self._selected_item_idx - 1

		if new_item_idx < 1 then
			self._selected_item_idx = 1
		else
			slot4 = self._cards_control
			slot4 = self._cards_control.get_items(slot3)[self._selected_item_idx]

			self._cards_control.get_items(slot3)[self._selected_item_idx].unselect(self._selected_item_idx)

			self._selected_item_idx = new_item_idx
			slot4 = self._cards_control
			slot4 = self._cards_control.get_items(self._selected_item_idx)[self._selected_item_idx]

			self._cards_control.get_items(self._selected_item_idx)[self._selected_item_idx].select(self._selected_item_idx)
		end

		return true
	end

	return 
end
function RaidGUIControlRewardCardPack:move_right()
	if self._selected then
		local new_item_idx = self._selected_item_idx + 1

		if RaidGUIControlLootRewardCards.CARD_COUNT < new_item_idx then
			self._selected_item_idx = RaidGUIControlLootRewardCards.CARD_COUNT
		else
			slot4 = self._cards_control
			slot4 = self._cards_control.get_items(slot3)[self._selected_item_idx]

			self._cards_control.get_items(slot3)[self._selected_item_idx].unselect(self._selected_item_idx)

			self._selected_item_idx = new_item_idx
			slot4 = self._cards_control
			slot4 = self._cards_control.get_items(self._selected_item_idx)[self._selected_item_idx]

			self._cards_control.get_items(self._selected_item_idx)[self._selected_item_idx].select(self._selected_item_idx)
		end

		return true
	end

	return 
end
function RaidGUIControlRewardCardPack:confirm_pressed()
	slot3 = self._cards_control
	local selected_card_item = self._cards_control.get_items(slot2)[self._selected_item_idx]

	if selected_card_item then
		slot4 = selected_card_item

		selected_card_item.confirm_pressed(slot3)

		return true
	end

	return false
end

return 
