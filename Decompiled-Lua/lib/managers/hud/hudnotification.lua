HUDNotification = HUDNotification or class()

if not HUDNotificationCardFail then
	slot2 = HUDNotification
	slot0 = class(slot1)
end

HUDNotificationCardFail = slot0

if not HUDNotificationProgress then
	slot2 = HUDNotification
	slot0 = class(slot1)
end

HUDNotificationProgress = slot0

if not HUDNotificationIcon then
	slot2 = HUDNotification
	slot0 = class(slot1)
end

HUDNotificationIcon = slot0
HUDNotification.GENERIC = "generic"
HUDNotification.ICON = "icon"
HUDNotification.RAID_UNLOCKED = "raid_unlocked"
HUDNotification.CARD_FAIL = "card_fail"
HUDNotification.GREED_ITEM = "greed_item_pickup"
HUDNotification.DOG_TAG = "dog_tag"
HUDNotification.WEAPON_CHALLENGE = "weapon_challenge"
HUDNotification.CONSUMABLE_MISSION_PICKED_UP = "consumable_mission_picked_up"
HUDNotification.ACTIVE_DUTY_BONUS = "active_duty_bonus"
HUDNotification.ANIMATION_MOVE_X_DISTANCE = 30
HUDNotification.DEFAULT_DISTANCE_FROM_BOTTOM = 130
HUDNotification.create = function (notification_data)
	if not notification_data.notification_type or notification_data.notification_type == HUDNotification.GENERIC then
		slot4 = notification_data

		return HUDNotification.new(slot2, HUDNotification)
	elseif notification_data.notification_type == HUDNotification.ICON then
		slot4 = notification_data

		return HUDNotificationIcon.new(slot2, HUDNotificationIcon)
	elseif notification_data.notification_type == HUDNotification.CARD_FAIL then
		slot4 = notification_data

		return HUDNotificationCardFail.new(slot2, HUDNotificationCardFail)
	elseif notification_data.notification_type == HUDNotification.RAID_UNLOCKED then
		slot4 = notification_data

		return HUDNotificationRaidUnlocked.new(slot2, HUDNotificationRaidUnlocked)
	elseif notification_data.notification_type == HUDNotification.GREED_ITEM then
		slot4 = notification_data

		return HUDNotificationGreedItem.new(slot2, HUDNotificationGreedItem)
	elseif notification_data.notification_type == HUDNotification.DOG_TAG then
		slot4 = notification_data

		return HUDNotificationDogTag.new(slot2, HUDNotificationDogTag)
	elseif notification_data.notification_type == HUDNotification.WEAPON_CHALLENGE then
		slot4 = notification_data

		return HUDNotificationWeaponChallenge.new(slot2, HUDNotificationWeaponChallenge)
	elseif notification_data.notification_type == HUDNotification.CONSUMABLE_MISSION_PICKED_UP then
		slot4 = notification_data

		return HUDNotificationConsumablePickup.new(slot2, HUDNotificationConsumablePickup)
	elseif notification_data.notification_type == HUDNotification.ACTIVE_DUTY_BONUS then
		slot4 = notification_data

		return HUDNotificationActiveDuty.new(slot2, HUDNotificationActiveDuty)
	end

	return 
end
HUDNotification.init = function (self, notification_data)
	slot5 = PlayerBase.INGAME_HUD_SAFERECT
	self._hud = managers.hud.script(slot3, managers.hud)
	slot5 = PlayerBase.INGAME_HUD_SAFERECT
	slot4 = managers.hud.script(slot3, managers.hud).panel
	self._hud_panel = managers.hud.script(slot3, managers.hud).panel.root(slot3)
	slot5 = PlayerBase.INGAME_HUD_SAFERECT
	self._safe_rect_offset = managers.hud.script(slot3, managers.hud).panel.x(slot3)
	self._font_size = 24
	self._font = tweak_data.gui.fonts.din_compressed_outlined_24
	self._panel_shape_x = 1344
	self._panel_shape_y = 728
	self._panel_shape_h = 84
	self._panel_shape_w = 384
	local padding = 0.2
	slot6 = {
		name = "notification_panel",
		visible = true,
		layer = 100,
		w = self._panel_shape_w,
		h = self._panel_shape_h,
		x = self._panel_shape_x,
		y = self._panel_shape_y
	}
	self._object = self._hud_panel.panel(managers.hud.script(slot3, managers.hud).panel, self._hud_panel)
	slot6 = {
		name = "bg_texture",
		y = 0,
		layer = 1,
		x = 0,
		texture = tweak_data.gui.icons.backgrounds_chat_bg.texture,
		texture_rect = tweak_data.gui.icons.backgrounds_chat_bg.texture_rect,
		w = self._panel_shape_w,
		h = self._panel_shape_h
	}
	self._bg_texture = self._object.bitmap(managers.hud.script(slot3, managers.hud).panel, self._object)
	slot8 = self._object
	slot6 = self._object.h(self._panel_shape_h) - self._panel_shape_h

	self._bg_texture.set_y(managers.hud.script(slot3, managers.hud).panel, self._bg_texture)

	local notification_text = notification_data.text

	if notification_data.prompt then
		notification_text = notification_text .. "\n" .. notification_data.prompt
	end

	slot7 = {
		name = "text",
		vertical = "center",
		layer = 2,
		wrap = true,
		align = "center",
		halign = "scale",
		valign = "scale",
		font = self._font,
		font_size = self._font_size,
		text = notification_text
	}
	self._text = self._object.text(slot5, self._object)
	slot9 = self._object
	slot7 = self._object.h(self._font_size) * padding * 0.5

	self._text.set_x(slot5, self._text)

	slot9 = self._object
	slot7 = self._object.h(self._font_size) * padding * 0.5

	self._text.set_y(slot5, self._text)

	slot10 = self._object
	slot7 = self._object.w(self._font_size) - self._object.h(self._object) * padding

	self._text.set_w(slot5, self._text)

	slot9 = self._object
	slot7 = self._object.h(self._object.h(self._object) * padding) * (1 - padding)

	self._text.set_h(slot5, self._text)

	slot6 = self._object
	self._initial_right_x = self._object.right(slot5)
	slot6 = self._object
	slot11 = "_animate_show"

	self._object.animate(slot5, callback(1 - padding, self, self))

	self._progress = 0

	return 
end
HUDNotification.hide = function (self)
	self._removed = true
	slot3 = self._object
	slot8 = "_animate_hide"

	self._object.animate(slot2, callback(slot5, self, self))

	return 
end
HUDNotification.cancel_execution = function (self)
	slot3 = self._object
	slot8 = "_animate_cancel"

	self._object.animate(slot2, callback(slot5, self, self))

	return 
end
HUDNotification.execute = function (self)
	slot3 = self._object

	self._object.stop(slot2)

	slot3 = self._object
	slot8 = "_animate_hide"

	self._object.animate(slot2, callback(slot5, self, self))

	return 
end
HUDNotification.destroy = function (self)
	slot3 = self._object

	self._object.stop(slot2)

	slot3 = self._object
	slot4 = self._object

	self._object.parent(slot2).remove(slot2, self._object.parent(slot2))

	return 
end
HUDNotification.update_data = function (self, data)
	if data.text then
		slot4 = self._text

		if alive(slot3) and not self._removed then
			slot5 = data.text

			self._text.set_text(slot3, self._text)
		end
	end

	return 
end
HUDNotification.set_progress = function (self, progress)
	local scale = 1 - 0.15 * progress
	slot5 = self._object

	self._object.stop(slot4)

	slot7 = self._panel_shape_h * scale

	self._object.set_size(slot4, self._object, self._panel_shape_w * scale)

	slot6 = self._panel_shape_x + self._panel_shape_w * (1 - scale) * 0.5

	self._object.set_x(slot4, self._object)

	slot6 = self._panel_shape_y + self._panel_shape_h * (1 - scale) * 0.5

	self._object.set_y(slot4, self._object)

	slot6 = self._font_size * scale

	self._text.set_font_size(slot4, self._text)

	self._progress = progress

	return 
end
HUDNotification.get_progress = function (self)
	return self._progress
end
HUDNotification.set_full_progress = function (self)
	self._progress = 1
	slot3 = self._object

	self._object.stop(slot2)

	slot3 = self._object
	slot8 = "_animate_full_progress"

	self._object.animate(slot2, callback(slot5, self, self))

	return 
end
HUDNotificationCardFail.init = function (self, notification_data)
	slot5 = PlayerBase.INGAME_HUD_SAFERECT
	self._hud = managers.hud.script(slot3, managers.hud)
	slot5 = PlayerBase.INGAME_HUD_SAFERECT
	slot4 = managers.hud.script(slot3, managers.hud).panel
	self._hud_panel = managers.hud.script(slot3, managers.hud).panel.root(slot3)
	slot5 = PlayerBase.INGAME_HUD_SAFERECT
	self._safe_rect_offset = managers.hud.script(slot3, managers.hud).panel.x(slot3)
	self._font = tweak_data.gui.fonts.din_compressed_outlined_24
	self._font_size = 24
	self._panel_shape_x = 1344
	self._panel_shape_y = 362
	self._panel_shape_w = 384
	self._panel_shape_h = 432
	local params_root_panel = {
		name = "notification_panel",
		visible = true,
		is_root_panel = true,
		layer = 100,
		w = self._panel_shape_w,
		h = self._panel_shape_h,
		x = self._panel_shape_x,
		y = self._panel_shape_y
	}
	slot7 = params_root_panel
	self._object = RaidGUIPanel.new(managers.hud.script(slot3, managers.hud).panel, RaidGUIPanel, self._hud_panel)
	local padding = 0.1
	slot7 = {
		name = "bg_texture",
		layer = 1,
		texture = tweak_data.gui.icons.backgrounds_chat_bg.texture,
		texture_rect = tweak_data.gui.icons.backgrounds_chat_bg.texture_rect,
		w = self._panel_shape_w,
		h = self._panel_shape_h
	}
	self._bg_texture = self._object.bitmap(RaidGUIPanel, self._object)
	slot7 = self._object.h(self._panel_shape_h) - self._bg_texture.h(self._object)

	self._bg_texture.set_y(RaidGUIPanel, self._bg_texture)

	slot7 = 0

	self._bg_texture.set_x(RaidGUIPanel, self._bg_texture)

	slot7 = notification_data.card
	self._card = tweak_data.challenge_cards.get_card_by_key_name(RaidGUIPanel, tweak_data.challenge_cards)
	slot7 = self._card.name
	self._card_name = managers.localization.text(RaidGUIPanel, managers.localization)
	slot8 = {
		CARD = string.upper(self._bg_texture)
	}
	slot11 = self._card_name
	self._card_fail_text = managers.localization.text(RaidGUIPanel, managers.localization, "hud_challenge_card_failed")
	slot6 = managers.challenge_cards
	self._card_rarity = managers.challenge_cards.get_active_card(RaidGUIPanel)
	slot7 = {
		name = "card_fail_text",
		vertical = "center",
		layer = 2,
		wrap = true,
		align = "right",
		halign = "scale",
		valign = "scale",
		font = self._font,
		font_size = self._font_size,
		text = self._card_fail_text
	}
	self._upper_text = self._object.text(RaidGUIPanel, self._object)
	slot7 = 32

	self._upper_text.set_x(RaidGUIPanel, self._upper_text)

	slot7 = 96

	self._upper_text.set_h(RaidGUIPanel, self._upper_text)

	slot7 = 0

	self._upper_text.set_y(RaidGUIPanel, self._upper_text)

	slot7 = self._panel_shape_w - 64

	self._upper_text.set_w(RaidGUIPanel, self._upper_text)

	local card_params = {
		item_w = 184,
		name = "player_card",
		y = 96,
		item_h = 248,
		x = 168
	}
	slot9 = card_params
	self._card_control = self._object.create_custom_control(self._upper_text, self._object, RaidGUIControlCardBase)
	slot8 = self._card

	self._card_control.set_card(self._upper_text, self._card_control)

	local prompt_text = notification_data.prompt
	slot9 = {
		name = "text",
		vertical = "center",
		layer = 2,
		wrap = true,
		align = "right",
		halign = "scale",
		valign = "scale",
		font = self._font,
		font_size = self._font_size,
		text = prompt_text
	}
	self._text = self._object.text(self._card_control, self._object)
	slot9 = 32

	self._text.set_x(self._card_control, self._text)

	slot11 = self._object
	slot9 = self._object.h(self._font_size) - 96

	self._text.set_y(self._card_control, self._text)

	slot11 = self._object
	slot9 = self._object.w(self._font_size) - 64

	self._text.set_w(self._card_control, self._text)

	slot9 = 96

	self._text.set_h(self._card_control, self._text)

	slot8 = self._object
	self._initial_right_x = self._object.right(self._card_control)
	slot8 = self._object
	slot13 = "_animate_show"

	self._object.animate(self._card_control, callback(self._font_size, self, self))

	self._progress = 0

	return 
end
HUDNotificationCardFail.hide = function (self)
	slot3 = self._object
	slot8 = "_animate_hide"

	self._object.animate(slot2, callback(slot5, self, self))

	return 
end
HUDNotificationCardFail.destroy = function (self)
	slot3 = self._object

	self._object.stop(slot2)

	slot3 = self._object

	self._object.clear(slot2)

	self = nil

	return 
end
HUDNotificationIcon.init = function (self)
	slot4 = "HUDNotificationIcon has not been implemented yet!"

	Application.error(slot2, Application)

	return 
end

if not HUDNotificationRaidUnlocked then
	slot2 = HUDNotification
	slot0 = class(slot1)
end

HUDNotificationRaidUnlocked = slot0
HUDNotificationRaidUnlocked.BOTTOM = 800
HUDNotificationRaidUnlocked.WIDTH = 352
HUDNotificationRaidUnlocked.FONT = tweak_data.gui.fonts.din_compressed_outlined_24
HUDNotificationRaidUnlocked.FONT_SIZE = tweak_data.gui.font_sizes.size_24
HUDNotificationRaidUnlocked.DESCRIPTION_COLOR = tweak_data.gui.colors.raid_dirty_white
HUDNotificationRaidUnlocked.FOLDER_ICON = "folder_mission_hud_notification_raid"
HUDNotificationRaidUnlocked.BACKGROUND_IMAGE = "backgrounds_chat_bg"
HUDNotificationRaidUnlocked.init = function (self, notification_data)
	slot4 = self

	self._create_panel(slot3)

	slot4 = self

	self._create_folder_image(slot3)

	slot4 = self

	self._create_description(slot3)

	self._sound_effect = "selected_new_raid"
	self._sound_delay = 0.4
	slot4 = self

	self._fit_size(slot3)

	slot4 = self._object
	self._initial_right_x = self._object.right(slot3)
	slot4 = self._object
	slot9 = "_animate_show"

	self._object.animate(slot3, callback(slot6, self, self))

	self._progress = 0

	return 
end
HUDNotificationRaidUnlocked.hide = function (self)
	slot3 = self._object

	self._object.stop(slot2)

	slot3 = self._object
	slot8 = "_animate_hide"

	self._object.animate(slot2, callback(slot5, self, self))

	return 
end
HUDNotificationRaidUnlocked.destroy = function (self)
	slot3 = self._object

	self._object.stop(slot2)

	slot3 = self._object

	self._object.clear(slot2)

	self = nil

	return 
end
HUDNotificationRaidUnlocked._create_panel = function (self)
	slot4 = PlayerBase.INGAME_HUD_SAFERECT
	local hud = managers.hud.script(slot2, managers.hud)
	slot4 = managers.hud.script(managers.hud, managers.hud).panel
	local hud_panel = managers.hud.script(managers.hud, managers.hud).panel.root(managers.hud)
	local panel_params = {
		name = "notification_raid_unlocked",
		visible = true,
		w = HUDNotificationRaidUnlocked.WIDTH
	}
	slot7 = panel_params
	self._object = hud.panel.panel(PlayerBase.INGAME_HUD_SAFERECT, hud.panel)
	slot6 = self._object
	slot9 = hud.panel

	self._object.set_right(PlayerBase.INGAME_HUD_SAFERECT, hud.panel.w(slot8))

	self._initial_right_x = self._object.right(PlayerBase.INGAME_HUD_SAFERECT)
	local background_params = {
		valign = "scale",
		halign = "scale"
	}
	slot7 = self._object
	background_params.w = self._object.w(self._object)
	slot7 = self._object
	background_params.h = self._object.h(self._object)
	background_params.texture = tweak_data.gui.icons[HUDNotificationRaidUnlocked.BACKGROUND_IMAGE].texture
	background_params.texture_rect = tweak_data.gui.icons[HUDNotificationRaidUnlocked.BACKGROUND_IMAGE].texture_rect
	slot8 = background_params

	self._object.bitmap(HUDNotificationRaidUnlocked.BACKGROUND_IMAGE, self._object)

	return 
end
HUDNotificationRaidUnlocked._create_folder_image = function (self)
	local folder_image_params = {
		name = "notification_raid_unlocked_folder_image",
		layer = 3,
		texture = tweak_data.gui.icons[HUDNotificationRaidUnlocked.FOLDER_ICON].texture,
		texture_rect = tweak_data.gui.icons[HUDNotificationRaidUnlocked.FOLDER_ICON].texture_rect
	}
	slot5 = folder_image_params
	self._folder_image = self._object.bitmap(HUDNotificationRaidUnlocked.FOLDER_ICON, self._object)
	slot7 = self._object
	slot5 = self._object.w(slot6) - 32

	self._folder_image.set_right(HUDNotificationRaidUnlocked.FOLDER_ICON, self._folder_image)

	return 
end
HUDNotificationRaidUnlocked._create_description = function (self)
	slot3 = managers.progression
	local is_at_last_step = managers.progression.mission_progression_completion_pending(slot2)
	local description_text = (is_at_last_step and "raid_final_unlocked_title") or "raid_next_unlocked_title"
	local description_params = {
		vertical = "center",
		name = "notification_raid_unlocked_description",
		wrap = true,
		align = "right",
		layer = 3,
		font = HUDNotificationRaidUnlocked.FONT,
		font_size = HUDNotificationRaidUnlocked.FONT_SIZE
	}
	slot6 = self._object
	description_params.w = self._object.w(slot5) - 64
	description_params.color = HUDNotificationRaidUnlocked.DESCRIPTION_COLOR
	description_params.text = utf8.to_upper(managers.localization.text(slot7, managers.localization))
	slot7 = description_params
	self._description = self._object.text(slot5, self._object)
	slot6 = self._description
	local _, _, _, h = self._description.text_rect(slot5)
	slot11 = h

	self._description.set_h(description_text, self._description)

	slot13 = self._object
	slot11 = self._object.w(slot12) - 32

	self._description.set_right(description_text, self._description)

	return 
end
HUDNotificationRaidUnlocked._fit_size = function (self)
	local top_padding = 32
	local middle_padding = 32
	local bottom_padding = 32
	slot7 = self._description
	local notification_h = top_padding + self._folder_image.h(slot5) + middle_padding + self._description.h(self._folder_image) + bottom_padding
	slot8 = notification_h

	self._object.set_h(self._folder_image, self._object)

	slot8 = top_padding

	self._folder_image.set_y(self._folder_image, self._folder_image)

	slot10 = self._object
	slot8 = self._object.h(slot9) - bottom_padding

	self._description.set_bottom(self._folder_image, self._description)

	slot8 = HUDNotificationRaidUnlocked.BOTTOM

	self._object.set_bottom(self._folder_image, self._object)

	return 
end

if not HUDNotificationConsumablePickup then
	slot2 = HUDNotification
	slot0 = class(slot1)
end

HUDNotificationConsumablePickup = slot0
HUDNotificationConsumablePickup.BOTTOM = 800
HUDNotificationConsumablePickup.WIDTH = 352
HUDNotificationConsumablePickup.FONT = tweak_data.gui.fonts.din_compressed_outlined_24
HUDNotificationConsumablePickup.FONT_SIZE = tweak_data.gui.font_sizes.size_24
HUDNotificationConsumablePickup.DESCRIPTION_COLOR = tweak_data.gui.colors.raid_dirty_white
HUDNotificationConsumablePickup.DOCUMENT_ICON = "notification_consumable"
HUDNotificationConsumablePickup.BACKGROUND_IMAGE = "backgrounds_chat_bg"
HUDNotificationConsumablePickup.init = function (self, notification_data)
	slot4 = self

	self._create_panel(slot3)

	slot4 = self

	self._create_document_image(slot3)

	slot4 = self

	self._create_description(slot3)

	self._sound_effect = "selected_new_raid"
	self._sound_delay = 0.4
	slot4 = self

	self._fit_size(slot3)

	slot4 = self._object
	self._initial_right_x = self._object.right(slot3)
	slot4 = self._object
	slot9 = "_animate_show"

	self._object.animate(slot3, callback(slot6, self, self))

	self._progress = 0

	return 
end
HUDNotificationConsumablePickup.hide = function (self)
	slot3 = self._object

	self._object.stop(slot2)

	slot3 = self._object
	slot8 = "_animate_hide"

	self._object.animate(slot2, callback(slot5, self, self))

	return 
end
HUDNotificationConsumablePickup.destroy = function (self)
	slot3 = self._object

	self._object.stop(slot2)

	slot3 = self._object

	self._object.clear(slot2)

	self = nil

	return 
end
HUDNotificationConsumablePickup._create_panel = function (self)
	slot4 = PlayerBase.INGAME_HUD_SAFERECT
	local hud = managers.hud.script(slot2, managers.hud)
	slot4 = managers.hud.script(managers.hud, managers.hud).panel
	local hud_panel = managers.hud.script(managers.hud, managers.hud).panel.root(managers.hud)
	local panel_params = {
		name = "notification_outlaw_raid_unlocked",
		visible = true,
		w = HUDNotificationConsumablePickup.WIDTH
	}
	slot7 = panel_params
	self._object = hud.panel.panel(PlayerBase.INGAME_HUD_SAFERECT, hud.panel)
	slot6 = self._object
	slot9 = hud.panel

	self._object.set_right(PlayerBase.INGAME_HUD_SAFERECT, hud.panel.w(slot8))

	self._initial_right_x = self._object.right(PlayerBase.INGAME_HUD_SAFERECT)
	local background_params = {
		valign = "scale",
		halign = "scale"
	}
	slot7 = self._object
	background_params.w = self._object.w(self._object)
	slot7 = self._object
	background_params.h = self._object.h(self._object)
	background_params.texture = tweak_data.gui.icons[HUDNotificationConsumablePickup.BACKGROUND_IMAGE].texture
	background_params.texture_rect = tweak_data.gui.icons[HUDNotificationConsumablePickup.BACKGROUND_IMAGE].texture_rect
	slot8 = background_params

	self._object.bitmap(HUDNotificationConsumablePickup.BACKGROUND_IMAGE, self._object)

	return 
end
HUDNotificationConsumablePickup._create_document_image = function (self)
	local folder_image_params = {
		name = "notification_outlaw_raid_unlocked_document_image",
		layer = 3,
		texture = tweak_data.gui.icons[HUDNotificationConsumablePickup.DOCUMENT_ICON].texture,
		texture_rect = tweak_data.gui.icons[HUDNotificationConsumablePickup.DOCUMENT_ICON].texture_rect
	}
	slot5 = folder_image_params
	self._folder_image = self._object.bitmap(HUDNotificationConsumablePickup.DOCUMENT_ICON, self._object)
	slot7 = self._object
	slot5 = self._object.w(slot6) - 32

	self._folder_image.set_right(HUDNotificationConsumablePickup.DOCUMENT_ICON, self._folder_image)

	return 
end
HUDNotificationConsumablePickup._create_description = function (self)
	local description_params = {
		vertical = "center",
		name = "notification_outlaw_raid_unlocked_description",
		wrap = true,
		align = "right",
		layer = 3,
		font = HUDNotificationConsumablePickup.FONT,
		font_size = HUDNotificationConsumablePickup.FONT_SIZE
	}
	slot4 = self._object
	description_params.w = self._object.w(slot3) - 64
	description_params.color = HUDNotificationConsumablePickup.DESCRIPTION_COLOR
	description_params.text = utf8.to_upper(managers.localization.text(slot5, managers.localization))
	slot5 = description_params
	self._description = self._object.text(slot3, self._object)
	slot4 = self._description
	local _, _, _, h = self._description.text_rect(slot3)
	slot9 = h

	self._description.set_h("hud_hint_consumable_mission_secured", self._description)

	slot11 = self._object
	slot9 = self._object.w(slot10) - 32

	self._description.set_right("hud_hint_consumable_mission_secured", self._description)

	return 
end
HUDNotificationConsumablePickup._fit_size = function (self)
	local top_padding = 32
	local middle_padding = 32
	local bottom_padding = 32
	slot7 = self._description
	local notification_h = top_padding + self._folder_image.h(slot5) + middle_padding + self._description.h(self._folder_image) + bottom_padding
	slot8 = notification_h

	self._object.set_h(self._folder_image, self._object)

	slot8 = top_padding

	self._folder_image.set_y(self._folder_image, self._folder_image)

	slot10 = self._object
	slot8 = self._object.h(slot9) - bottom_padding

	self._description.set_bottom(self._folder_image, self._description)

	slot8 = HUDNotificationConsumablePickup.BOTTOM

	self._object.set_bottom(self._folder_image, self._object)

	return 
end

if not HUDNotificationGreedItem then
	slot2 = HUDNotification
	slot0 = class(slot1)
end

HUDNotificationGreedItem = slot0
HUDNotificationGreedItem.BOTTOM = 800
HUDNotificationGreedItem.WIDTH = 352
HUDNotificationGreedItem.HEIGHT = 160
HUDNotificationGreedItem.BACKGROUND_IMAGE = "backgrounds_chat_bg"
HUDNotificationGreedItem.FRAME_ICON = "rewards_extra_loot_frame"
HUDNotificationGreedItem.LOOT_ICON = "rewards_extra_loot_middle_loot"
HUDNotificationGreedItem.GOLD_ICON = "rewards_extra_loot_middle_gold"
HUDNotificationGreedItem.TITLE_STRING = "menu_save_info_loot_title"
HUDNotificationGreedItem.GOLD_ACQUIRED_STRING = "hud_greed_gold_bar_acquired"
HUDNotificationGreedItem.LOOT_BAR_ICON_L = "loot_meter_parts_l"
HUDNotificationGreedItem.LOOT_BAR_ICON_M = "loot_meter_parts_m"
HUDNotificationGreedItem.LOOT_BAR_ICON_R = "loot_meter_parts_r"
HUDNotificationGreedItem.LOOT_BAR_COLOR = tweak_data.gui.colors.raid_dark_grey
HUDNotificationGreedItem.LOOT_BAR_FOREGROUND_COLOR = tweak_data.gui.colors.raid_gold
HUDNotificationGreedItem.ICON_HIDDEN_OFFSET = 40
HUDNotificationGreedItem.init = function (self, notification_data)
	slot4 = self

	self._create_panel(slot3)

	slot4 = self

	self._create_icons(slot3)

	slot4 = self

	self._create_right_panel(slot3)

	slot4 = self

	self._create_title(slot3)

	slot4 = self

	self._create_progress_bar(slot3)

	self._initial_progress = notification_data.initial_progress
	self._current_progress = notification_data.initial_progress
	self._updated_progress = notification_data.new_progress
	slot8 = managers.greed
	slot8 = managers.greed
	slot5 = self._initial_progress % managers.greed.loot_needed_for_gold_bar(slot7) / managers.greed.loot_needed_for_gold_bar(slot7)

	self._set_progress(slot3, self)

	slot4 = self._object
	slot9 = "_animate_show"

	self._object.animate(slot3, callback(managers.greed.loot_needed_for_gold_bar(slot7), self, self))

	self._progress = 0
	slot11 = false

	managers.queued_tasks.queue(slot3, managers.queued_tasks, "greed_notification_animate", self.animate_progress_change, self, nil, 0.5, nil)

	return 
end
HUDNotificationGreedItem.hide = function (self)
	slot3 = self._gold_icon

	self._gold_icon.stop(slot2)

	slot3 = self._icons_panel

	self._icons_panel.stop(slot2)

	slot3 = self._object

	self._object.stop(slot2)

	slot3 = self._object
	slot8 = "_animate_hide"

	self._object.animate(slot2, callback(slot5, self, self))

	return 
end
HUDNotificationGreedItem.destroy = function (self)
	slot3 = self._object

	self._object.stop(slot2)

	slot3 = self._object

	self._object.clear(slot2)

	self = nil

	return 
end
HUDNotificationGreedItem._create_panel = function (self)
	slot4 = PlayerBase.INGAME_HUD_SAFERECT
	local hud = managers.hud.script(slot2, managers.hud)
	slot4 = managers.hud.script(managers.hud, managers.hud).panel
	local hud_panel = managers.hud.script(managers.hud, managers.hud).panel.root(managers.hud)
	local panel_params = {
		name = "notification_greed_item_picked_up",
		visible = true,
		w = HUDNotificationGreedItem.WIDTH,
		h = HUDNotificationGreedItem.HEIGHT
	}
	slot7 = panel_params
	self._object = hud.panel.panel(PlayerBase.INGAME_HUD_SAFERECT, hud.panel)
	slot6 = self._object
	slot9 = hud.panel

	self._object.set_right(PlayerBase.INGAME_HUD_SAFERECT, hud.panel.w(slot8))

	slot6 = self._object
	self._initial_right_x = self._object.right(PlayerBase.INGAME_HUD_SAFERECT)
	slot7 = HUDNotificationGreedItem.BOTTOM

	self._object.set_bottom(PlayerBase.INGAME_HUD_SAFERECT, self._object)

	local background_params = {
		valign = "scale",
		halign = "scale"
	}
	slot7 = self._object
	background_params.w = self._object.w(self._object)
	slot7 = self._object
	background_params.h = self._object.h(self._object)
	background_params.texture = tweak_data.gui.icons[HUDNotificationGreedItem.BACKGROUND_IMAGE].texture
	background_params.texture_rect = tweak_data.gui.icons[HUDNotificationGreedItem.BACKGROUND_IMAGE].texture_rect
	slot8 = background_params

	self._object.bitmap(HUDNotificationGreedItem.BACKGROUND_IMAGE, self._object)

	return 
end
HUDNotificationGreedItem._create_icons = function (self)
	local icons_panel_params = {
		name = "icons_panel",
		halign = "left",
		w = 160,
		valign = "scale"
	}
	slot4 = self._object
	icons_panel_params.h = self._object.h(slot3)
	slot5 = icons_panel_params
	self._icons_panel = self._object.panel(slot3, self._object)
	local frame_icon_params = {
		name = "frame_icon",
		valign = "center",
		halign = "center",
		layer = 10,
		texture = tweak_data.gui.icons[HUDNotificationGreedItem.FRAME_ICON].texture,
		texture_rect = tweak_data.gui.icons[HUDNotificationGreedItem.FRAME_ICON].texture_rect
	}
	slot6 = frame_icon_params
	self._frame_icon = self._icons_panel.bitmap(HUDNotificationGreedItem.FRAME_ICON, self._icons_panel)
	slot8 = self._icons_panel
	slot6 = self._icons_panel.w(slot7) / 2

	self._frame_icon.set_center_x(HUDNotificationGreedItem.FRAME_ICON, self._frame_icon)

	slot6 = self._icons_panel.h(slot7) / 2

	self._frame_icon.set_center_y(HUDNotificationGreedItem.FRAME_ICON, self._frame_icon)

	local loot_icon_params = {
		name = "loot_icon",
		valign = "center",
		halign = "center",
		layer = 10,
		texture = tweak_data.gui.icons[HUDNotificationGreedItem.LOOT_ICON].texture,
		texture_rect = tweak_data.gui.icons[HUDNotificationGreedItem.LOOT_ICON].texture_rect
	}
	slot7 = loot_icon_params
	self._loot_icon = self._icons_panel.bitmap(HUDNotificationGreedItem.LOOT_ICON, self._icons_panel)
	slot9 = self._icons_panel
	slot7 = self._icons_panel.w(self._icons_panel) / 2

	self._loot_icon.set_center_x(HUDNotificationGreedItem.LOOT_ICON, self._loot_icon)

	slot7 = self._icons_panel.h(self._icons_panel) / 2

	self._loot_icon.set_center_y(HUDNotificationGreedItem.LOOT_ICON, self._loot_icon)

	local gold_icon_params = {
		name = "gold_icon",
		valign = "center",
		halign = "center",
		alpha = 0,
		layer = 10,
		texture = tweak_data.gui.icons[HUDNotificationGreedItem.GOLD_ICON].texture,
		texture_rect = tweak_data.gui.icons[HUDNotificationGreedItem.GOLD_ICON].texture_rect,
		color = tweak_data.gui.colors.raid_gold
	}
	slot8 = gold_icon_params
	self._gold_icon = self._icons_panel.bitmap(HUDNotificationGreedItem.GOLD_ICON, self._icons_panel)
	slot10 = self._icons_panel
	slot8 = self._icons_panel.w(self._icons_panel) / 2

	self._gold_icon.set_center_x(HUDNotificationGreedItem.GOLD_ICON, self._gold_icon)

	slot10 = self._icons_panel
	slot8 = self._icons_panel.h(self._icons_panel) / 2

	self._gold_icon.set_center_y(HUDNotificationGreedItem.GOLD_ICON, self._gold_icon)

	return 
end
HUDNotificationGreedItem._create_right_panel = function (self)
	local right_panel_params = {
		h = 96,
		name = "right_panel",
		is_root_panel = true
	}
	slot5 = self._icons_panel
	slot3 = self._icons_panel.w(self._icons_panel)
	right_panel_params.x = self._icons_panel.x(slot3) + slot3
	self._right_panel = RaidGUIPanel.new(slot3, RaidGUIPanel, self._object)
	slot8 = self._right_panel
	slot5 = self._object.w(right_panel_params) - self._right_panel.x(self._object) - 32

	self._right_panel.set_w(slot3, self._right_panel)

	slot7 = self._object
	slot5 = self._object.h(self._right_panel.x(self._object)) / 2

	self._right_panel.set_center_y(slot3, self._right_panel)

	return 
end
HUDNotificationGreedItem._create_title = function (self)
	local title_params = {
		name = "greed_item_notification_title",
		vertical = "center",
		h = 64,
		align = "center",
		halign = "left",
		valign = "center"
	}
	slot6 = tweak_data.gui.font_sizes.size_56
	title_params.font = tweak_data.gui.get_font_path(slot3, tweak_data.gui, tweak_data.gui.fonts.din_compressed)
	title_params.font_size = tweak_data.gui.font_sizes.size_56
	title_params.color = tweak_data.gui.colors.raid_dirty_white
	slot7 = HUDNotificationGreedItem.TITLE_STRING
	title_params.text = utf8.to_upper(managers.localization.text(tweak_data.gui.fonts.din_compressed, managers.localization))
	slot5 = title_params
	self._title = self._right_panel.text(slot3, self._right_panel)
	slot5 = 32

	self._title.set_center_y(slot3, self._title)

	local title_params = {
		name = "greed_item_notification_gold_acquired",
		vertical = "center",
		h = 64,
		wrap = true,
		align = "center",
		alpha = 0,
		halign = "left",
		valign = "center"
	}
	slot7 = tweak_data.gui.font_sizes.size_56
	title_params.font = tweak_data.gui.get_font_path(self._title, tweak_data.gui, tweak_data.gui.fonts.din_compressed)
	title_params.font_size = tweak_data.gui.font_sizes.size_24
	title_params.color = tweak_data.gui.colors.raid_gold
	slot8 = HUDNotificationGreedItem.GOLD_ACQUIRED_STRING
	title_params.text = utf8.to_upper(managers.localization.text(tweak_data.gui.fonts.din_compressed, managers.localization))
	slot6 = title_params
	self._gold_acquired = self._right_panel.text(self._title, self._right_panel)
	slot6 = 32

	self._gold_acquired.set_center_y(self._title, self._gold_acquired)

	return 
end
HUDNotificationGreedItem._create_progress_bar = function (self)
	local progress_bar_background_params = {
		name = "greed_item_notification_progress_bar_background",
		layer = 1
	}
	slot4 = self._right_panel
	progress_bar_background_params.w = self._right_panel.w(slot3)
	progress_bar_background_params.left = HUDNotificationGreedItem.LOOT_BAR_ICON_L
	progress_bar_background_params.center = HUDNotificationGreedItem.LOOT_BAR_ICON_M
	progress_bar_background_params.right = HUDNotificationGreedItem.LOOT_BAR_ICON_R
	progress_bar_background_params.color = HUDNotificationGreedItem.LOOT_BAR_COLOR
	slot5 = progress_bar_background_params
	self._progress_bar_background = self._right_panel.three_cut_bitmap(slot3, self._right_panel)
	slot5 = 80

	self._progress_bar_background.set_center_y(slot3, self._progress_bar_background)

	local progress_bar_progress_panel_params = {
		name = "progress_bar_progress_panel"
	}
	slot5 = self._progress_bar_background
	progress_bar_progress_panel_params.w = self._progress_bar_background.w(self._progress_bar_background)
	slot5 = self._progress_bar_background
	progress_bar_progress_panel_params.h = self._progress_bar_background.h(self._progress_bar_background)
	slot5 = self._progress_bar_background
	progress_bar_progress_panel_params.layer = self._progress_bar_background.layer(self._progress_bar_background) + 1
	slot6 = progress_bar_progress_panel_params
	self._progress_bar_progress_panel = self._right_panel.panel(self._progress_bar_background, self._right_panel)
	slot5 = self._progress_bar_progress_panel
	slot8 = self._progress_bar_background

	self._progress_bar_progress_panel.set_x(self._progress_bar_background, self._progress_bar_background.x(slot7))

	slot8 = self._progress_bar_background

	self._progress_bar_progress_panel.set_center_y(self._progress_bar_background, self._progress_bar_background.center_y(slot7))

	local progress_bar_foreground_params = {
		name = "loot_bar_foreground",
		alpha = 0
	}
	slot6 = self._progress_bar_background
	progress_bar_foreground_params.w = self._progress_bar_background.w(self._progress_bar_progress_panel)
	progress_bar_foreground_params.left = HUDNotificationGreedItem.LOOT_BAR_ICON_L
	progress_bar_foreground_params.center = HUDNotificationGreedItem.LOOT_BAR_ICON_M
	progress_bar_foreground_params.right = HUDNotificationGreedItem.LOOT_BAR_ICON_R
	progress_bar_foreground_params.color = HUDNotificationGreedItem.LOOT_BAR_FOREGROUND_COLOR
	slot7 = progress_bar_foreground_params
	self._loot_bar_foreground = self._progress_bar_progress_panel.three_cut_bitmap(self._progress_bar_progress_panel, self._progress_bar_progress_panel)

	return 
end
HUDNotificationGreedItem._set_progress = function (self, progress)
	slot7 = self._progress_bar_background
	slot5 = self._progress_bar_background.w(slot6) * progress

	self._progress_bar_progress_panel.set_w(slot3, self._progress_bar_progress_panel)

	slot5 = 1

	self._loot_bar_foreground.set_alpha(slot3, self._loot_bar_foreground)

	return 
end
HUDNotificationGreedItem.update_data = function (self, data)
	self._updated_progress = data.new_progress

	if not self._animating_progress_change and not self._removed then
		slot4 = self

		self.animate_progress_change(slot3)
	end

	return 
end
HUDNotificationGreedItem.animate_progress_change = function (self)
	slot3 = self._gold_icon

	self._gold_icon.stop(slot2)

	slot3 = self._gold_icon
	slot8 = "_animate_progress_change"

	self._gold_icon.animate(slot2, callback(slot5, self, self))

	return 
end
HUDNotificationGreedItem._animate_progress_change = function (self, o)
	self._animating_progress_change = true
	local points_per_second = 80
	local t = 0

	while 0 < self._updated_progress - self._current_progress do
		local dt = coroutine.yield()
		t = t + dt
		self._current_progress = self._current_progress + points_per_second * dt
		slot8 = managers.greed
		slot8 = managers.greed
		local current_percentage = self._current_progress % managers.greed.loot_needed_for_gold_bar(slot7) / managers.greed.loot_needed_for_gold_bar(slot7)
		slot9 = current_percentage

		self._set_progress(slot7, self)

		if self._previous_percentage and current_percentage < self._previous_percentage then
			slot8 = self._icons_panel

			self._icons_panel.stop(slot7)

			slot8 = self._icons_panel
			slot13 = "_animate_gold_bar"

			self._icons_panel.animate(slot7, callback(slot10, self, self))

			slot9 = "greed_item_picked_up"

			managers.hud.post_event(slot7, managers.hud)
		end

		self._previous_percentage = current_percentage
	end

	slot7 = managers.greed
	slot7 = managers.greed
	local current_percentage = self._updated_progress % managers.greed.loot_needed_for_gold_bar(slot6) / managers.greed.loot_needed_for_gold_bar(slot6)
	slot8 = current_percentage

	self._set_progress(slot6, self)

	self._animating_progress_change = false
	slot7 = 0.7

	wait(slot6)

	slot7 = self

	self._check_hide(slot6)

	return 
end
HUDNotificationGreedItem._animate_gold_bar = function (self, o)
	self._animating_gold_bar = true
	slot5 = HUDNotificationGreedItem.FRAME_ICON
	local frame_default_w = tweak_data.gui.icon_w(slot3, tweak_data.gui)
	slot6 = HUDNotificationGreedItem.FRAME_ICON
	local frame_default_h = tweak_data.gui.icon_h(tweak_data.gui, tweak_data.gui)
	local duration_in = 0.5
	local t = 0

	while t < duration_in do
		local dt = coroutine.yield()
		t = t + dt
		local current_frame_scale = Easing.quartic_out(slot8, t, 1.4, -0.4)
		slot11 = frame_default_w * current_frame_scale

		self._frame_icon.set_w(t, self._frame_icon)

		slot11 = frame_default_h * current_frame_scale

		self._frame_icon.set_h(t, self._frame_icon)

		slot13 = self._icons_panel
		slot11 = self._icons_panel.w(duration_in) / 2

		self._frame_icon.set_center_x(t, self._frame_icon)

		slot13 = self._icons_panel
		slot11 = self._icons_panel.h(duration_in) / 2

		self._frame_icon.set_center_y(t, self._frame_icon)

		slot13 = duration_in
		local current_r = Easing.quartic_out(t, t, tweak_data.gui.colors.raid_light_gold.r, tweak_data.gui.colors.raid_gold.r - tweak_data.gui.colors.raid_light_gold.r)
		slot14 = duration_in
		local current_g = Easing.quartic_out(t, t, tweak_data.gui.colors.raid_light_gold.g, tweak_data.gui.colors.raid_gold.g - tweak_data.gui.colors.raid_light_gold.g)
		local current_b = Easing.quartic_out(t, t, tweak_data.gui.colors.raid_light_gold.b, tweak_data.gui.colors.raid_gold.b - tweak_data.gui.colors.raid_light_gold.b)
		slot13 = self._frame_icon
		slot18 = current_b

		self._frame_icon.set_color(t, Color(duration_in, current_r, current_g))

		slot16 = duration_in
		local current_offset = Easing.quartic_in_out(t, t, 0, HUDNotificationGreedItem.ICON_HIDDEN_OFFSET)
		local current_loot_icon_alpha = Easing.quartic_in_out(t, t, 1, -1)
		slot16 = current_loot_icon_alpha

		self._loot_icon.set_alpha(t, self._loot_icon)

		slot18 = self._icons_panel
		slot16 = self._icons_panel.h(duration_in / 2) / 2 - current_offset

		self._loot_icon.set_center_y(t, self._loot_icon)

		slot16 = current_loot_icon_alpha

		self._title.set_alpha(t, self._title)

		slot16 = 32 - current_offset

		self._title.set_center_y(t, self._title)

		if duration_in / 2 <= t then
			slot18 = duration_in / 2
			local current_gold_icon_alpha = Easing.quartic_in_out(slot14, t - duration_in / 2, 0, 1)
			slot17 = current_gold_icon_alpha

			self._gold_icon.set_alpha(t - duration_in / 2, self._gold_icon)

			slot17 = current_gold_icon_alpha

			self._gold_acquired.set_alpha(t - duration_in / 2, self._gold_acquired)
		end

		slot18 = self._icons_panel
		slot16 = (self._icons_panel.h(slot17) / 2 + HUDNotificationGreedItem.ICON_HIDDEN_OFFSET) - current_offset

		self._gold_icon.set_center_y(slot14, self._gold_icon)

		slot16 = (32 + HUDNotificationGreedItem.ICON_HIDDEN_OFFSET) - current_offset

		self._gold_acquired.set_center_y(slot14, self._gold_acquired)
	end

	slot9 = tweak_data.gui.colors.raid_gold

	self._frame_icon.set_color(slot7, self._frame_icon)

	slot9 = frame_default_w

	self._frame_icon.set_w(slot7, self._frame_icon)

	slot9 = frame_default_h

	self._frame_icon.set_h(slot7, self._frame_icon)

	slot9 = 0

	self._loot_icon.set_alpha(slot7, self._loot_icon)

	slot9 = 1

	self._gold_icon.set_alpha(slot7, self._gold_icon)

	slot11 = self._icons_panel
	slot9 = self._icons_panel.h(slot10) / 2

	self._loot_icon.set_center_y(slot7, self._loot_icon)

	slot11 = self._icons_panel
	slot9 = self._icons_panel.h(slot10) / 2

	self._gold_icon.set_center_y(slot7, self._gold_icon)

	slot11 = self._icons_panel
	slot9 = self._icons_panel.w(slot10) / 2

	self._frame_icon.set_center_x(slot7, self._frame_icon)

	slot11 = self._icons_panel
	slot9 = self._icons_panel.h(slot10) / 2

	self._frame_icon.set_center_y(slot7, self._frame_icon)

	slot8 = 1.5

	wait(slot7)

	local duration_out = 0.7
	t = 0

	while t < duration_out do
		local dt = coroutine.yield()
		t = t + dt
		slot13 = self._icons_panel
		slot11 = self._icons_panel.w(slot12) / 2

		self._frame_icon.set_center_x(slot9, self._frame_icon)

		slot13 = self._icons_panel
		slot11 = self._icons_panel.h(slot12) / 2

		self._frame_icon.set_center_y(slot9, self._frame_icon)

		slot13 = duration_in
		local current_r = Easing.quartic_out(slot9, t, tweak_data.gui.colors.raid_gold.r, 1 - tweak_data.gui.colors.raid_gold.r)
		slot14 = duration_in
		local current_g = Easing.quartic_out(t, t, tweak_data.gui.colors.raid_gold.g, 1 - tweak_data.gui.colors.raid_gold.g)
		local current_b = Easing.quartic_out(t, t, tweak_data.gui.colors.raid_gold.b, 1 - tweak_data.gui.colors.raid_gold.b)
		slot13 = self._frame_icon
		slot18 = current_b

		self._frame_icon.set_color(t, Color(duration_in, current_r, current_g))

		slot16 = duration_in
		local current_offset = Easing.quartic_in_out(t, t, 0, HUDNotificationGreedItem.ICON_HIDDEN_OFFSET)
		local current_gold_icon_alpha = Easing.quartic_in_out(t, t, 1, -1)
		slot16 = current_gold_icon_alpha

		self._gold_icon.set_alpha(t, self._gold_icon)

		slot18 = self._icons_panel
		slot16 = self._icons_panel.h(duration_in / 2) / 2 - current_offset

		self._gold_icon.set_center_y(t, self._gold_icon)

		slot16 = current_gold_icon_alpha

		self._gold_acquired.set_alpha(t, self._gold_acquired)

		slot16 = 32 - current_offset

		self._gold_acquired.set_center_y(t, self._gold_acquired)

		if duration_in / 2 <= t then
			slot18 = duration_in / 2
			local current_loot_icon_alpha = Easing.quartic_in_out(slot14, t - duration_in / 2, 0, 1)
			slot17 = current_loot_icon_alpha

			self._loot_icon.set_alpha(t - duration_in / 2, self._loot_icon)

			slot17 = current_loot_icon_alpha

			self._title.set_alpha(t - duration_in / 2, self._title)
		end

		slot18 = self._icons_panel
		slot16 = (self._icons_panel.h(slot17) / 2 + HUDNotificationGreedItem.ICON_HIDDEN_OFFSET) - current_offset

		self._loot_icon.set_center_y(slot14, self._loot_icon)

		slot16 = (32 + HUDNotificationGreedItem.ICON_HIDDEN_OFFSET) - current_offset

		self._title.set_center_y(slot14, self._title)
	end

	slot10 = Color.white

	self._frame_icon.set_color(slot8, self._frame_icon)

	slot12 = self._icons_panel
	slot10 = self._icons_panel.w(slot11) / 2

	self._frame_icon.set_center_x(slot8, self._frame_icon)

	slot12 = self._icons_panel
	slot10 = self._icons_panel.h(slot11) / 2

	self._frame_icon.set_center_y(slot8, self._frame_icon)

	slot10 = 1

	self._loot_icon.set_alpha(slot8, self._loot_icon)

	slot10 = 0

	self._gold_icon.set_alpha(slot8, self._gold_icon)

	slot12 = self._icons_panel
	slot10 = self._icons_panel.h(slot11) / 2

	self._loot_icon.set_center_y(slot8, self._loot_icon)

	slot12 = self._icons_panel
	slot10 = self._icons_panel.h(slot11) / 2

	self._gold_icon.set_center_y(slot8, self._gold_icon)

	slot9 = 0.8

	wait(slot8)

	self._animating_gold_bar = false
	slot9 = self

	self._check_hide(slot8)

	return 
end
HUDNotificationGreedItem._check_hide = function (self)
	if not self._animating_progress_change and not self._animating_gold_bar then
		self._removed = true
		slot3 = managers.notification

		managers.notification.hide_current_notification(slot2)
	end

	return 
end

if not HUDNotificationDogTag then
	slot2 = HUDNotification
	slot0 = class(slot1)
end

HUDNotificationDogTag = slot0
HUDNotificationDogTag.BOTTOM = 800
HUDNotificationDogTag.WIDTH = 550
HUDNotificationDogTag.HEIGHT = 160
HUDNotificationDogTag.BACKGROUND_IMAGE = "backgrounds_chat_bg"
HUDNotificationDogTag.DOG_TAG_ICON = "rewards_dog_tags"
HUDNotificationDogTag.TITLE_STRING = "hud_dog_tags"
HUDNotificationDogTag.init = function (self, notification_data)
	slot4 = self

	self._create_panel(slot3)

	slot4 = self

	self._create_icon(slot3)

	slot4 = self

	self._create_right_panel(slot3)

	slot4 = self

	self._create_progress(slot3)

	slot4 = self

	self._create_title(slot3)
	self._set_progress(slot3, self, notification_data.acquired)

	slot4 = self._object
	slot9 = "_animate_show"

	self._object.animate(slot3, callback(notification_data.total, self, self))

	return 
end
HUDNotificationDogTag.hide = function (self)
	slot3 = self._object

	self._object.stop(slot2)

	slot3 = self._object
	slot8 = "_animate_hide"

	self._object.animate(slot2, callback(slot5, self, self))

	return 
end
HUDNotificationDogTag.destroy = function (self)
	slot3 = self._object

	self._object.stop(slot2)

	slot3 = self._object

	self._object.clear(slot2)

	self = nil

	return 
end
HUDNotificationDogTag._create_panel = function (self)
	slot4 = PlayerBase.INGAME_HUD_SAFERECT
	local hud = managers.hud.script(slot2, managers.hud)
	slot4 = managers.hud.script(managers.hud, managers.hud).panel
	local hud_panel = managers.hud.script(managers.hud, managers.hud).panel.root(managers.hud)
	local panel_params = {
		name = "notification_dog_tag_picked_up",
		visible = true,
		w = HUDNotificationDogTag.WIDTH,
		h = HUDNotificationDogTag.HEIGHT
	}
	slot7 = panel_params
	self._object = hud.panel.panel(PlayerBase.INGAME_HUD_SAFERECT, hud.panel)
	slot6 = self._object
	slot9 = hud.panel

	self._object.set_right(PlayerBase.INGAME_HUD_SAFERECT, hud.panel.w(slot8))

	slot6 = self._object
	self._initial_right_x = self._object.right(PlayerBase.INGAME_HUD_SAFERECT)
	slot7 = HUDNotificationDogTag.BOTTOM

	self._object.set_bottom(PlayerBase.INGAME_HUD_SAFERECT, self._object)

	local background_params = {
		valign = "scale",
		halign = "scale"
	}
	slot7 = self._object
	background_params.w = self._object.w(self._object)
	slot7 = self._object
	background_params.h = self._object.h(self._object)
	background_params.texture = tweak_data.gui.icons[HUDNotificationDogTag.BACKGROUND_IMAGE].texture
	background_params.texture_rect = tweak_data.gui.icons[HUDNotificationDogTag.BACKGROUND_IMAGE].texture_rect
	slot8 = background_params

	self._object.bitmap(HUDNotificationDogTag.BACKGROUND_IMAGE, self._object)

	return 
end
HUDNotificationDogTag._create_icon = function (self)
	local icon_panel_params = {
		name = "icon_panel",
		halign = "left",
		w = 160,
		x = 32,
		valign = "scale"
	}
	slot4 = self._object
	icon_panel_params.h = self._object.h(slot3)
	slot5 = icon_panel_params
	self._icon_panel = self._object.panel(slot3, self._object)
	local dog_tag_icon_params = {
		name = "dog_tag_icon",
		valign = "center",
		halign = "center",
		layer = 10,
		texture = tweak_data.gui.icons[HUDNotificationDogTag.DOG_TAG_ICON].texture,
		texture_rect = tweak_data.gui.icons[HUDNotificationDogTag.DOG_TAG_ICON].texture_rect
	}
	slot6 = dog_tag_icon_params
	self._dog_tag_icon = self._icon_panel.bitmap(HUDNotificationDogTag.DOG_TAG_ICON, self._icon_panel)
	slot8 = self._icon_panel
	slot6 = self._icon_panel.w(slot7) / 2

	self._dog_tag_icon.set_center_x(HUDNotificationDogTag.DOG_TAG_ICON, self._dog_tag_icon)

	slot8 = self._icon_panel
	slot6 = self._icon_panel.h(slot7) / 2

	self._dog_tag_icon.set_center_y(HUDNotificationDogTag.DOG_TAG_ICON, self._dog_tag_icon)

	return 
end
HUDNotificationDogTag._create_right_panel = function (self)
	local right_panel_params = {
		h = 96,
		name = "right_panel",
		is_root_panel = true
	}
	slot5 = self._icon_panel
	slot3 = self._icon_panel.w(self._icon_panel)
	right_panel_params.x = (self._icon_panel.x(slot3) + slot3) - 16
	self._right_panel = RaidGUIPanel.new(slot3, RaidGUIPanel, self._object)
	slot8 = self._right_panel
	slot5 = self._object.w(right_panel_params) - self._right_panel.x(self._object) - 16

	self._right_panel.set_w(slot3, self._right_panel)

	slot7 = self._object
	slot5 = self._object.h(self._right_panel.x(self._object)) / 2

	self._right_panel.set_center_y(slot3, self._right_panel)

	return 
end
HUDNotificationDogTag._create_title = function (self)
	local title_params = {
		name = "dog_tag_notification_title",
		vertical = "center",
		h = 64,
		align = "center",
		halign = "left",
		valign = "center"
	}
	slot6 = tweak_data.gui.font_sizes.size_32
	title_params.font = tweak_data.gui.get_font_path(slot3, tweak_data.gui, tweak_data.gui.fonts.din_compressed)
	title_params.font_size = tweak_data.gui.font_sizes.size_32
	title_params.color = tweak_data.gui.colors.raid_grey_effects
	slot7 = HUDNotificationDogTag.TITLE_STRING
	title_params.text = utf8.to_upper(managers.localization.text(tweak_data.gui.fonts.din_compressed, managers.localization))
	slot5 = title_params
	self._title = self._right_panel.text(slot3, self._right_panel)
	slot5 = 80

	self._title.set_center_y(slot3, self._title)

	return 
end
HUDNotificationDogTag._create_progress = function (self)
	local progress_text_params = {
		name = "dog_tag_notification_progress_text",
		vertical = "center",
		h = 64,
		wrap = true,
		align = "center",
		text = "",
		halign = "left",
		valign = "center",
		font = tweak_data.gui.get_font_path(slot3, tweak_data.gui, tweak_data.gui.fonts.din_compressed),
		font_size = tweak_data.gui.font_sizes.size_56,
		color = tweak_data.gui.colors.raid_dirty_white
	}
	slot5 = progress_text_params
	self._progress_text = self._right_panel.text(slot3, self._right_panel)
	slot7 = self._right_panel
	slot5 = self._right_panel.w(tweak_data.gui.font_sizes.size_56) / 2

	self._progress_text.set_center_x(slot3, self._progress_text)

	slot5 = 32

	self._progress_text.set_center_y(slot3, self._progress_text)

	return 
end
HUDNotificationDogTag._set_progress = function (self, acquired, total)
	slot5 = self._progress_text

	if alive(slot4) then
		slot8 = acquired
		slot10 = total
		slot6 = tostring(slot7) .. " / " .. tostring(slot9)

		self._progress_text.set_text(slot4, self._progress_text)
	end

	return 
end
HUDNotificationDogTag.update_data = function (self, data)
	slot6 = data.total

	self._set_progress(slot3, self, data.acquired)

	return 
end

if not HUDNotificationWeaponChallenge then
	slot2 = HUDNotification
	slot0 = class(slot1)
end

HUDNotificationWeaponChallenge = slot0
HUDNotificationWeaponChallenge.Y = 544
HUDNotificationWeaponChallenge.WIDTH = 384
HUDNotificationWeaponChallenge.HEIGHT = 224
HUDNotificationWeaponChallenge.BACKGROUND_IMAGE = "backgrounds_chat_bg"
HUDNotificationWeaponChallenge.RIGHT_SIDE_X = 64
HUDNotificationWeaponChallenge.PADDING_RIGHT = 32
HUDNotificationWeaponChallenge.TITLE_Y = 28
HUDNotificationWeaponChallenge.TITLE_H = 32
HUDNotificationWeaponChallenge.TITLE_FONT = tweak_data.gui.fonts.din_compressed
HUDNotificationWeaponChallenge.TITLE_FONT_SIZE = tweak_data.gui.font_sizes.size_24
HUDNotificationWeaponChallenge.TITLE_COLOR = tweak_data.gui.colors.raid_dirty_white
HUDNotificationWeaponChallenge.TITLE_DISTANCE_FROM_DESCRIPTION = 12
HUDNotificationWeaponChallenge.DESCRIPTION_Y = 80
HUDNotificationWeaponChallenge.DESCRIPTION_FONT = tweak_data.gui.fonts.lato
HUDNotificationWeaponChallenge.DESCRIPTION_FONT_SIZE = tweak_data.gui.font_sizes.size_20
slot3 = "b8b8b8"
HUDNotificationWeaponChallenge.DESCRIPTION_COLOR = Color(slot2)
HUDNotificationWeaponChallenge.DESCRIPTION_DISTANCE_FROM_PROGRESS_BAR = 23
HUDNotificationWeaponChallenge.PROGRESS_BAR_DISTANCE_FROM_BOTTOM = 32
HUDNotificationWeaponChallenge.init = function (self, notification_data)
	slot4 = self

	self._create_panel(slot3)

	slot4 = self

	self._create_title(slot3)

	slot4 = self

	self._create_tier_label(slot3)

	slot4 = self

	self._create_icon(slot3)

	slot4 = self

	self._create_description(slot3)

	slot4 = self

	self._create_progress_bar(slot3)

	if notification_data.challenge then
		slot5 = notification_data.challenge

		self._set_challenge(slot3, self)
	end

	slot4 = self._object
	slot9 = "_animate_show"

	self._object.animate(slot3, callback(slot6, self, self))

	self._progress = 0

	return 
end
HUDNotificationWeaponChallenge._create_panel = function (self)
	slot4 = PlayerBase.INGAME_HUD_SAFERECT
	local hud = managers.hud.script(slot2, managers.hud)
	slot4 = managers.hud.script(managers.hud, managers.hud).panel
	local hud_panel = managers.hud.script(managers.hud, managers.hud).panel.root(managers.hud)
	local panel_params = {
		name = "notification_weapon_challenge",
		visible = true,
		y = HUDNotificationWeaponChallenge.Y,
		w = HUDNotificationWeaponChallenge.WIDTH,
		h = HUDNotificationWeaponChallenge.HEIGHT
	}
	slot7 = panel_params
	self._object = hud.panel.panel(PlayerBase.INGAME_HUD_SAFERECT, hud.panel)
	slot6 = self._object
	slot9 = hud.panel

	self._object.set_right(PlayerBase.INGAME_HUD_SAFERECT, hud.panel.w(slot8))

	self._initial_right_x = self._object.right(PlayerBase.INGAME_HUD_SAFERECT)
	local background_params = {
		valign = "scale",
		halign = "scale"
	}
	slot7 = self._object
	background_params.w = self._object.w(self._object)
	slot7 = self._object
	background_params.h = self._object.h(self._object)
	background_params.texture = tweak_data.gui.icons[HUDNotificationWeaponChallenge.BACKGROUND_IMAGE].texture
	background_params.texture_rect = tweak_data.gui.icons[HUDNotificationWeaponChallenge.BACKGROUND_IMAGE].texture_rect
	slot8 = background_params

	self._object.bitmap(HUDNotificationWeaponChallenge.BACKGROUND_IMAGE, self._object)

	return 
end
HUDNotificationWeaponChallenge._create_title = function (self)
	local title_params = {
		name = "notification_weapon_challenge_title",
		vertical = "center",
		align = "left",
		text = "INCREASE ACCURACY",
		layer = 3,
		x = HUDNotificationWeaponChallenge.RIGHT_SIDE_X,
		y = HUDNotificationWeaponChallenge.TITLE_Y
	}
	slot4 = self._object
	title_params.w = self._object.w(slot3) - HUDNotificationWeaponChallenge.RIGHT_SIDE_X
	title_params.h = HUDNotificationWeaponChallenge.TITLE_H
	slot6 = HUDNotificationWeaponChallenge.TITLE_FONT_SIZE
	title_params.font = tweak_data.gui.get_font_path(HUDNotificationWeaponChallenge.RIGHT_SIDE_X, tweak_data.gui, HUDNotificationWeaponChallenge.TITLE_FONT)
	title_params.font_size = HUDNotificationWeaponChallenge.TITLE_FONT_SIZE
	title_params.color = HUDNotificationWeaponChallenge.TITLE_COLOR
	slot5 = title_params
	self._title = self._object.text(HUDNotificationWeaponChallenge.RIGHT_SIDE_X, self._object)

	return 
end
HUDNotificationWeaponChallenge._create_tier_label = function (self)
	local tier_label_params = {
		name = "weapon_challenge_tier",
		vertical = "center",
		align = "left",
		text = "TI",
		layer = 3,
		h = HUDNotificationWeaponChallenge.TITLE_H,
		y = HUDNotificationWeaponChallenge.TITLE_Y
	}
	slot6 = HUDNotificationWeaponChallenge.TITLE_FONT_SIZE
	tier_label_params.font = tweak_data.gui.get_font_path(slot3, tweak_data.gui, HUDNotificationWeaponChallenge.TITLE_FONT)
	tier_label_params.font_size = HUDNotificationWeaponChallenge.TITLE_FONT_SIZE
	tier_label_params.color = HUDNotificationWeaponChallenge.TITLE_COLOR
	slot5 = tier_label_params
	self._tier = self._object.text(slot3, self._object)

	return 
end
HUDNotificationWeaponChallenge._create_icon = function (self)
	local default_icon = "wpn_skill_accuracy"
	local icon_params = {
		name = "weapon_challenge_icon",
		layer = 3,
		y = HUDNotificationWeaponChallenge.DESCRIPTION_Y,
		texture = tweak_data.gui.icons[default_icon].texture,
		texture_rect = tweak_data.gui.icons[default_icon].texture_rect
	}
	slot6 = icon_params
	self._icon = self._object.bitmap(slot4, self._object)

	return 
end
HUDNotificationWeaponChallenge._create_description = function (self)
	local description_params = {
		name = "weapon_challenge_description",
		wrap = true,
		text = "Bla bla bla bla",
		layer = 3,
		x = HUDNotificationWeaponChallenge.RIGHT_SIDE_X,
		y = HUDNotificationWeaponChallenge.DESCRIPTION_Y
	}
	slot4 = self._object
	description_params.w = self._object.w(slot3) - HUDNotificationWeaponChallenge.RIGHT_SIDE_X - HUDNotificationWeaponChallenge.PADDING_RIGHT
	slot6 = HUDNotificationWeaponChallenge.DESCRIPTION_FONT_SIZE
	description_params.font = tweak_data.gui.get_font_path(HUDNotificationWeaponChallenge.PADDING_RIGHT, tweak_data.gui, HUDNotificationWeaponChallenge.DESCRIPTION_FONT)
	description_params.font_size = HUDNotificationWeaponChallenge.DESCRIPTION_FONT_SIZE
	description_params.color = HUDNotificationWeaponChallenge.DESCRIPTION_COLOR
	slot5 = description_params
	self._description = self._object.text(HUDNotificationWeaponChallenge.PADDING_RIGHT, self._object)

	return 
end
HUDNotificationWeaponChallenge._create_progress_bar = function (self)
	local texture_center = "slider_large_center"
	local texture_left = "slider_large_left"
	local texture_right = "slider_large_right"
	local progress_bar_panel_params = {
		vertical = "bottom",
		name = "weapon_challenge_progress_bar_panel",
		is_root_panel = true,
		x = 0,
		layer = 3
	}
	slot7 = self._object
	progress_bar_panel_params.w = self._object.w(slot6)
	slot8 = texture_center
	progress_bar_panel_params.h = tweak_data.gui.icon_h(slot6, tweak_data.gui)
	self._progress_bar_panel = RaidGUIPanel.new(slot6, RaidGUIPanel, self._object)
	slot10 = self._object
	slot8 = self._object.h(progress_bar_panel_params) - HUDNotificationWeaponChallenge.PROGRESS_BAR_DISTANCE_FROM_BOTTOM

	self._progress_bar_panel.set_bottom(slot6, self._progress_bar_panel)

	local progress_bar_background_params = {
		name = "weapon_challenge_progress_bar_background",
		layer = 1
	}
	slot8 = self._progress_bar_panel
	progress_bar_background_params.w = self._progress_bar_panel.w(self._progress_bar_panel)
	slot9 = texture_center
	progress_bar_background_params.h = tweak_data.gui.icon_h(self._progress_bar_panel, tweak_data.gui)
	progress_bar_background_params.left = texture_left
	progress_bar_background_params.center = texture_center
	progress_bar_background_params.right = texture_right
	slot9 = 0.5
	progress_bar_background_params.color = Color.white.with_alpha(self._progress_bar_panel, Color.white)
	local progress_bar_background = self._progress_bar_panel.three_cut_bitmap(self._progress_bar_panel, self._progress_bar_panel)
	local progress_bar_foreground_panel_params = {
		halign = "scale",
		name = "weapon_challenge_progress_bar_foreground_panel",
		y = 0,
		layer = 2,
		x = 0,
		valign = "scale"
	}
	slot10 = self._progress_bar_panel
	progress_bar_foreground_panel_params.w = self._progress_bar_panel.w(progress_bar_background_params)
	slot10 = self._progress_bar_panel
	progress_bar_foreground_panel_params.h = self._progress_bar_panel.h(progress_bar_background_params)
	slot11 = progress_bar_foreground_panel_params
	self._progress_bar_foreground_panel = self._progress_bar_panel.panel(progress_bar_background_params, self._progress_bar_panel)
	local progress_bar_background_params = {
		name = "weapon_challenge_progress_bar_background"
	}
	slot11 = self._progress_bar_panel
	progress_bar_background_params.w = self._progress_bar_panel.w(self._progress_bar_panel)
	slot12 = texture_center
	progress_bar_background_params.h = tweak_data.gui.icon_h(self._progress_bar_panel, tweak_data.gui)
	progress_bar_background_params.left = texture_left
	progress_bar_background_params.center = texture_center
	progress_bar_background_params.right = texture_right
	progress_bar_background_params.color = tweak_data.gui.colors.raid_red
	local progress_bar_background = self._progress_bar_foreground_panel.three_cut_bitmap(self._progress_bar_panel, self._progress_bar_foreground_panel)
	local progress_bar_text_params = {
		name = "weapon_challenge_progress_bar_text",
		vertical = "center",
		align = "center",
		text = "123/456",
		y = -2,
		x = 0,
		layer = 5
	}
	slot13 = self._progress_bar_panel
	progress_bar_text_params.w = self._progress_bar_panel.w(progress_bar_background_params)
	slot13 = self._progress_bar_panel
	progress_bar_text_params.h = self._progress_bar_panel.h(progress_bar_background_params)
	progress_bar_text_params.font = tweak_data.gui.fonts.din_compressed
	progress_bar_text_params.font_size = tweak_data.gui.font_sizes.size_24
	progress_bar_text_params.color = tweak_data.gui.colors.raid_dirty_white
	slot14 = progress_bar_text_params
	self._progress_text = self._progress_bar_panel.label(progress_bar_background_params, self._progress_bar_panel)

	return 
end
HUDNotificationWeaponChallenge._set_challenge = function (self, challenge_data)
	local challenge, count, target, min_range = nil

	if challenge_data.challenge_id then
		challenge = managers.challenge.get_challenge(slot7, managers.challenge, ChallengeManager.CATEGORY_WEAPON_UPGRADE)
		local tasks = challenge.tasks(slot7)
		slot9 = tasks[1]
		count = tasks[1].current_count(challenge)
		slot9 = tasks[1]
		target = tasks[1].target(challenge)
		slot11 = tasks[1]
		slot9 = tasks[1].min_range(challenge_data.challenge_id) / 100
		min_range = math.round(challenge)
	end

	local skill_tweak_data = tweak_data.weapon_skills.skills[challenge_data.skill_name]
	slot9 = self._title
	slot15 = skill_tweak_data.name_id

	self._title.set_text(slot8, utf8.to_upper(managers.localization.text(slot13, managers.localization)))

	slot12 = "menu_weapons_stats_tier_abbreviation"
	local tier_text = utf8.to_upper(managers.localization.text(utf8.to_upper, managers.localization)) .. RaidGUIControlWeaponSkills.ROMAN_NUMERALS[challenge_data.tier]
	slot11 = tier_text

	self._tier.set_text(challenge_data.tier, self._tier)

	slot10 = self._tier
	local _, _, w, _ = self._tier.text_rect(challenge_data.tier)
	slot15 = w

	self._tier.set_w(slot13, self._tier)

	slot17 = self._icon

	self._tier.set_center_x(slot13, self._icon.center_x(slot16))

	local icon = tweak_data.gui.icons[skill_tweak_data.icon]
	slot16 = icon.texture
	slot19 = icon.texture_rect

	self._icon.set_image(self._tier, self._icon, unpack(slot18))

	slot18 = self._progress_bar_panel
	slot16 = self._progress_bar_panel.w(unpack) * count / target

	self._progress_bar_foreground_panel.set_w(self._tier, self._progress_bar_foreground_panel)

	local progress_text = nil

	if count ~= target then
		slot16 = count
		progress_text = tostring(slot15) .. "/" .. tostring(slot17)
		slot16 = self._description
		slot21 = {
			AMOUNT = target,
			RANGE = min_range,
			WEAPON = managers.localization.text(slot23, managers.localization)
		}
		slot25 = tweak_data.weapon[challenge_data.weapon_id].name_id

		self._description.set_text("/", managers.localization.text(target, managers.localization, challenge_data.challenge_briefing_id))
	else
		slot19 = "menu_weapon_challenge_completed"
		progress_text = utf8.to_upper(managers.localization.text(slot17, managers.localization))
		slot16 = self._description
		slot21 = {
			AMOUNT = target,
			RANGE = min_range,
			WEAPON = managers.localization.text(slot23, managers.localization)
		}
		slot25 = tweak_data.weapon[challenge_data.weapon_id].name_id

		self._description.set_text(slot15, managers.localization.text(managers.localization, managers.localization, challenge_data.challenge_done_text_id))
	end

	slot17 = progress_text

	self._progress_text.set_text(slot15, self._progress_text)

	slot16 = self

	self._fit_size(slot15)

	return 
end
HUDNotificationWeaponChallenge._fit_size = function (self)
	local notification_height = HUDNotificationWeaponChallenge.PROGRESS_BAR_DISTANCE_FROM_BOTTOM
	slot4 = self._progress_bar_panel
	notification_height = notification_height + self._progress_bar_panel.h(slot3)
	slot4 = self._description
	local _, _, _, h = self._description.text_rect(slot3)
	slot8 = h
	slot11 = self._icon
	h = math.max(slot7, self._icon.h(slot10))
	slot9 = h

	self._description.set_h(slot7, self._description)

	notification_height = notification_height + HUDNotificationWeaponChallenge.DESCRIPTION_DISTANCE_FROM_PROGRESS_BAR + h
	slot9 = self._title
	notification_height = notification_height + HUDNotificationWeaponChallenge.TITLE_DISTANCE_FROM_DESCRIPTION + self._title.h(self._description) + HUDNotificationWeaponChallenge.TITLE_Y
	slot9 = notification_height

	self._object.set_h(HUDNotificationWeaponChallenge.TITLE_Y, self._object)

	slot11 = self._object
	slot9 = self._object.h(slot10) - HUDNotificationWeaponChallenge.PROGRESS_BAR_DISTANCE_FROM_BOTTOM

	self._progress_bar_panel.set_bottom(HUDNotificationWeaponChallenge.TITLE_Y, self._progress_bar_panel)

	slot11 = self._progress_bar_panel
	slot9 = self._progress_bar_panel.y(HUDNotificationWeaponChallenge.PROGRESS_BAR_DISTANCE_FROM_BOTTOM) - HUDNotificationWeaponChallenge.DESCRIPTION_DISTANCE_FROM_PROGRESS_BAR

	self._description.set_bottom(HUDNotificationWeaponChallenge.TITLE_Y, self._description)

	slot11 = self._description
	slot9 = self._description.y(HUDNotificationWeaponChallenge.DESCRIPTION_DISTANCE_FROM_PROGRESS_BAR) + 2

	self._icon.set_y(HUDNotificationWeaponChallenge.TITLE_Y, self._icon)

	slot11 = self._description
	slot9 = self._description.y(HUDNotificationWeaponChallenge.DESCRIPTION_DISTANCE_FROM_PROGRESS_BAR) - HUDNotificationWeaponChallenge.TITLE_DISTANCE_FROM_DESCRIPTION

	self._title.set_bottom(HUDNotificationWeaponChallenge.TITLE_Y, self._title)

	slot8 = self._tier
	slot11 = self._title

	self._tier.set_center_y(HUDNotificationWeaponChallenge.TITLE_Y, self._title.center_y(HUDNotificationWeaponChallenge.TITLE_DISTANCE_FROM_DESCRIPTION))

	slot11 = self._object
	slot11 = self._object.parent(HUDNotificationWeaponChallenge.TITLE_DISTANCE_FROM_DESCRIPTION)
	slot9 = self._object.parent(HUDNotificationWeaponChallenge.TITLE_DISTANCE_FROM_DESCRIPTION).h(HUDNotificationWeaponChallenge.TITLE_DISTANCE_FROM_DESCRIPTION) - HUDNotification.DEFAULT_DISTANCE_FROM_BOTTOM

	self._object.set_bottom(HUDNotificationWeaponChallenge.TITLE_Y, self._object)

	return 
end

if not HUDNotificationActiveDuty then
	slot2 = HUDNotification
	slot0 = class(slot1)
end

HUDNotificationActiveDuty = slot0
HUDNotificationActiveDuty.BOTTOM = 800
HUDNotificationActiveDuty.WIDTH = 500
HUDNotificationActiveDuty.FONT = tweak_data.gui.fonts.din_compressed_outlined_24
HUDNotificationActiveDuty.FONT_SIZE = tweak_data.gui.font_sizes.size_24
HUDNotificationActiveDuty.DESRIPTION_COLOR = tweak_data.gui.colors.raid_dirty_white
HUDNotificationActiveDuty.FONT_TITLE = tweak_data.gui.fonts.din_compressed_outlined_32
HUDNotificationActiveDuty.FONT_TITLE_SIZE = tweak_data.gui.font_sizes.size_32
HUDNotificationActiveDuty.TITLE_COLOR = tweak_data.gui.colors.raid_red
HUDNotificationActiveDuty.BACKGROUND_IMAGE = "backgrounds_chat_bg"
HUDNotificationActiveDuty.init = function (self, notification_data)
	slot4 = self

	self._create_panel(slot3)

	slot5 = notification_data.amount

	self._create_image(slot3, self)

	slot7 = notification_data.total

	self._create_description(slot3, self, notification_data.amount, notification_data.consecutive)

	self._sound_effect = "daily_login_reward"
	self._sound_delay = 0.4
	slot4 = self

	self._fit_size(slot3)

	slot4 = self._object
	self._initial_right_x = self._object.right(slot3)
	slot4 = self._object
	slot9 = "_animate_show"

	self._object.animate(slot3, callback(notification_data.consecutive, self, self))

	self._progress = 0

	return 
end
HUDNotificationActiveDuty.hide = function (self)
	slot3 = self._object

	self._object.stop(slot2)

	slot3 = self._object
	slot8 = "_animate_hide"

	self._object.animate(slot2, callback(slot5, self, self))

	return 
end
HUDNotificationActiveDuty.destroy = function (self)
	slot3 = self._object

	self._object.stop(slot2)

	slot3 = self._object

	self._object.clear(slot2)

	self = nil

	return 
end
HUDNotificationActiveDuty._create_panel = function (self)
	slot4 = PlayerBase.INGAME_HUD_SAFERECT
	local hud = managers.hud.script(slot2, managers.hud)
	slot4 = managers.hud.script(managers.hud, managers.hud).panel
	local hud_panel = managers.hud.script(managers.hud, managers.hud).panel.root(managers.hud)
	local panel_params = {
		name = "notification_active_duty",
		visible = true,
		w = HUDNotificationActiveDuty.WIDTH
	}
	slot7 = panel_params
	self._object = hud.panel.panel(PlayerBase.INGAME_HUD_SAFERECT, hud.panel)
	slot6 = self._object
	slot9 = hud.panel

	self._object.set_right(PlayerBase.INGAME_HUD_SAFERECT, hud.panel.w(slot8))

	self._initial_right_x = self._object.right(PlayerBase.INGAME_HUD_SAFERECT)
	local background_params = {
		valign = "scale",
		halign = "scale"
	}
	slot7 = self._object
	background_params.w = self._object.w(self._object)
	slot7 = self._object
	background_params.h = self._object.h(self._object)
	background_params.texture = tweak_data.gui.icons[HUDNotificationRaidUnlocked.BACKGROUND_IMAGE].texture
	background_params.texture_rect = tweak_data.gui.icons[HUDNotificationRaidUnlocked.BACKGROUND_IMAGE].texture_rect
	slot8 = background_params

	self._object.bitmap(HUDNotificationRaidUnlocked.BACKGROUND_IMAGE, self._object)

	return 
end
HUDNotificationActiveDuty._create_image = function (self, amount)
	local icon = RaidGUIControlGoldBarRewardDetails.REWARD_ICON_SINGLE

	if 1 < amount then
		icon = RaidGUIControlGoldBarRewardDetails.REWARD_ICON_FEW
	end

	local image_params = {
		name = "notification_active_duty_gold_image",
		layer = 3,
		height = 352,
		width = 352,
		texture = tweak_data.gui.icons[icon].texture,
		texture_rect = {
			0,
			0,
			512,
			512
		}
	}
	slot7 = image_params
	self._image = self._object.bitmap(slot5, self._object)
	slot6 = self._image
	slot9 = self._object

	self._image.set_right(slot5, self._object.w(slot8))

	return 
end
HUDNotificationActiveDuty._create_description = function (self, amount, consecutive, total)
	local text = ""
	slot10 = "hud_active_duty_bonus"
	text = utf8.to_upper(managers.localization.text(slot8, managers.localization))
	text = text .. " (" .. consecutive .. "/" .. total .. "): "

	if amount == 1 then
		slot11 = "menu_loot_screen_gold_bars_single"
		text = text .. utf8.to_upper(managers.localization.text(slot9, managers.localization))
	else
		slot13 = "menu_loot_screen_gold_bars"
		text = text .. (amount or 0) .. " " .. utf8.to_upper(managers.localization.text(slot11, managers.localization))
	end

	local description_params = {
		vertical = "center",
		name = "notification_raid_unlocked_description",
		wrap = true,
		align = "right",
		layer = 3,
		font = HUDNotificationActiveDuty.FONT,
		font_size = HUDNotificationActiveDuty.FONT_SIZE
	}
	slot8 = self._object
	description_params.w = self._object.w(slot7) - 64
	description_params.color = HUDNotificationActiveDuty.DESCRIPTION_COLOR
	description_params.text = text
	slot9 = description_params
	self._description = self._object.text(slot7, self._object)
	slot8 = self._description
	local _, _, _, h = self._description.text_rect(slot7)
	slot13 = h

	self._description.set_h(slot11, self._description)

	slot15 = self._object
	slot13 = self._object.w(slot14) - 32

	self._description.set_right(slot11, self._description)

	return 
end
HUDNotificationActiveDuty._fit_size = function (self)
	local top_padding = 32
	local middle_padding = 32
	local bottom_padding = 32
	slot7 = self._description
	local notification_h = top_padding + self._image.h(slot5) + middle_padding + self._description.h(self._image) + bottom_padding
	slot8 = notification_h

	self._object.set_h(self._image, self._object)

	slot8 = top_padding

	self._image.set_y(self._image, self._image)

	slot11 = self._image
	slot8 = (self._image.y(slot9) + self._image.h(self._image) + middle_padding) - bottom_padding

	self._description.set_y(self._image, self._description)

	slot8 = HUDNotificationActiveDuty.BOTTOM

	self._object.set_bottom(self._image, self._object)

	return 
end
HUDNotification._animate_show = function (self, panel)
	slot5 = 0

	panel.set_alpha(slot3, panel)

	local t = 0

	if self._sound_effect then
		self._sound_delay = self._sound_delay or 0
	end

	while t < 0.75 do
		local dt = coroutine.yield()
		t = t + dt

		if 0.3 <= t and t < 0.7 then
			if self._sound_effect and not self._played_sound_effect and self._sound_delay < t then
				slot7 = self._sound_effect

				managers.hud.post_event(slot5, managers.hud)

				self._played_sound_effect = true
			end

			slot9 = 0.4
			local curr_alpha = Easing.quintic_in_out(slot5, t - 0.3, 0, 1)
			slot8 = curr_alpha

			panel.set_alpha(t - 0.3, panel)

			local current_x_offset = -(1 - curr_alpha) * HUDNotification.ANIMATION_MOVE_X_DISTANCE
			slot9 = self._initial_right_x + current_x_offset

			self._object.set_right(panel, self._object)
		end
	end

	slot6 = 1

	panel.set_alpha(slot4, panel)

	slot6 = self._initial_right_x

	self._object.set_right(slot4, self._object)

	return 
end
HUDNotification._animate_full_progress = function (self)
	local t = 0
	slot4 = self._object
	local starting_scale = self._object.w(slot3) / self._panel_shape_w

	while t < 0.1 do
		local dt = coroutine.yield()
		t = t + dt
		slot10 = 0.1
		local scale = self._ease_out_quint(slot5, self, t, starting_scale, 0.75 - starting_scale)
		slot9 = self._panel_shape_h * scale

		self._object.set_size(self, self._object, self._panel_shape_w * scale)

		slot8 = self._panel_shape_x + self._panel_shape_w * (1 - scale) * 0.5

		self._object.set_x(self, self._object)

		slot8 = self._panel_shape_y + self._panel_shape_h * (1 - scale) * 0.5

		self._object.set_y(self, self._object)

		slot8 = self._font_size * scale

		self._text.set_font_size(self, self._text)
	end

	return 
end
HUDNotification._animate_execute = function (self)
	local t = 0

	if self._progress < 1 then
		while t < 0.025 do
			local dt = coroutine.yield()
			t = t + dt
			slot9 = 0.025
			local scale = self._linear(slot4, self, t, 1, -0.1)
			slot8 = self._panel_shape_h * scale

			self._object.set_size(self, self._object, self._panel_shape_w * scale)

			slot7 = self._panel_shape_x + self._panel_shape_w * (1 - scale) * 0.5

			self._object.set_x(self, self._object)

			slot7 = self._panel_shape_y + self._panel_shape_h * (1 - scale) * 0.5

			self._object.set_y(self, self._object)

			slot7 = self._font_size * scale

			self._text.set_font_size(self, self._text)
		end
	end

	slot6 = self._panel_shape_h * 0.6

	self._object.set_size(slot3, self._object, self._panel_shape_w * 0.6)

	slot5 = self._panel_shape_x + self._panel_shape_w * 0.4 * 0.5

	self._object.set_x(slot3, self._object)

	slot5 = self._panel_shape_y + self._panel_shape_h * 0.4 * 0.5

	self._object.set_y(slot3, self._object)

	slot5 = self._font_size * 0.6

	self._text.set_font_size(slot3, self._text)

	slot4 = 0.03

	wait(slot3)

	t = 0

	while t < 0.5 do
		local dt = coroutine.yield()
		t = t + dt
		slot9 = 0.5
		local scale = self._ease_out_quint(slot4, self, t, 0.6, 0.6)
		slot8 = self._panel_shape_h * scale

		self._object.set_size(self, self._object, self._panel_shape_w * scale)

		slot7 = self._panel_shape_x + self._panel_shape_w * (1 - scale) * 0.5

		self._object.set_x(self, self._object)

		slot7 = self._panel_shape_y + self._panel_shape_h * (1 - scale) * 0.5

		self._object.set_y(self, self._object)

		slot7 = self._font_size * scale

		self._text.set_font_size(self, self._text)

		if 0.1 <= t then
			slot10 = 0.3
			local alpha = self._ease_out_quint(slot5, self, t - 0.1, 1, -1)
			slot8 = alpha

			self._object.set_alpha(self, self._object)
		end
	end

	slot5 = 0

	self._object.set_alpha(slot3, self._object)

	slot5 = self._object

	self._hud_panel.remove(slot3, self._hud_panel)

	slot11 = true

	managers.queued_tasks.queue(slot3, managers.queued_tasks, "notification_done", managers.notification.notification_done, managers.notification, nil, 0.1, nil)

	return 
end
HUDNotification._animate_cancel = function (self)
	local t = 0
	local starting_progress = self._progress

	while t < 0.1 do
		local dt = coroutine.yield()
		t = t + dt
		slot10 = 0.1
		local progress = self._ease_out_quint(slot5, self, t, starting_progress, -starting_progress)
		local scale = 1 - 0.2 * progress
		slot10 = self._panel_shape_h * scale

		self._object.set_size(t, self._object, self._panel_shape_w * scale)

		slot9 = self._panel_shape_x + self._panel_shape_w * (1 - scale) * 0.5

		self._object.set_x(t, self._object)

		slot9 = self._panel_shape_y + self._panel_shape_h * (1 - scale) * 0.5

		self._object.set_y(t, self._object)

		slot9 = self._font_size * scale

		self._text.set_font_size(t, self._text)

		self._progress = progress
	end

	slot7 = self._panel_shape_h

	self._object.set_size(slot4, self._object, self._panel_shape_w)

	self._progress = 0

	if managers.notification._delayed_hide then
		slot12 = true

		managers.queued_tasks.queue(slot4, managers.queued_tasks, "hide_current_notification", managers.notification.hide_current_notification, managers.notification, nil, 0.1, nil)
	end

	return 
end
HUDNotification._animate_hide = function (self, panel)
	local t = 0

	while t < 0.75 do
		local dt = coroutine.yield()
		t = t + dt

		if 0.1 <= t and t < 0.6 then
			slot9 = 0.5
			local curr_alpha = Easing.quintic_in_out(slot5, t - 0.1, 1, -1)
			slot8 = curr_alpha

			panel.set_alpha(t - 0.1, panel)

			local current_x_offset = -(1 - curr_alpha) * HUDNotification.ANIMATION_MOVE_X_DISTANCE
			slot9 = self._initial_right_x + current_x_offset

			self._object.set_right(panel, self._object)
		end
	end

	slot6 = 0

	panel.set_alpha(slot4, panel)

	slot5 = self

	self.destroy(slot4)

	slot12 = true

	managers.queued_tasks.queue(slot4, managers.queued_tasks, "notification_done", managers.notification.notification_done, managers.notification, nil, 0.1, nil)

	return 
end
HUDNotification._ease_in_quint = function (self, t, starting_value, change, duration)
	if duration <= t then
		return starting_value + change
	end

	t = t / duration

	return change * t * t * t * t * t + starting_value
end
HUDNotification._ease_out_quint = function (self, t, starting_value, change, duration)
	if duration <= t then
		return starting_value + change
	end

	t = t / duration
	t = t - 1

	return change * (t * t * t * t * t + 1) + starting_value
end
HUDNotification._ease_in_out_quint = function (self, t, starting_value, change, duration)
	if duration <= t then
		return starting_value + change
	end

	t = t / duration / 2

	if t < 1 then
		return change / 2 * t * t * t * t * t + starting_value
	end

	t = t - 2

	return change / 2 * (t * t * t * t * t + 2) + starting_value
end
HUDNotification._linear = function (self, t, starting_value, change, duration)
	if duration <= t then
		return starting_value + change
	end

	return (change * t) / duration + starting_value
end

return 
