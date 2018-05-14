if not RaidMenuFooter then
	slot2 = RaidGuiBase
	slot0 = class(slot1)
end

RaidMenuFooter = slot0
RaidMenuFooter.PROFILE_NAME_W = 550
function RaidMenuFooter:init(ws, fullscreen_ws, node, component_name)
	slot11 = component_name

	RaidMenuFooter.super.init(slot6, self, ws, fullscreen_ws, node)

	return 
end
function RaidMenuFooter:_layout()
	slot4 = {
		name = "footer_object_panel",
		y = 0,
		x = 0,
		w = self._root_panel.w(slot6),
		h = self._root_panel.h(slot6)
	}
	slot7 = self._root_panel
	slot7 = self._root_panel
	self._object = self._root_panel.panel(slot2, self._root_panel)
	slot4 = {
		name = "footer_legend"
	}
	self._legend = self._object.legend(slot2, self._object)
	slot3 = self

	self._create_name_and_gold_panel(slot2)

	return 
end
function RaidMenuFooter:set_navigation_button_visibility(flag)
	slot5 = flag

	self._navigation_button.set_visible(slot3, self._navigation_button)

	return 
end
function RaidMenuFooter:_setup_properties()
	self._panel_x = 0
	slot3 = self._ws
	self._panel_y = self._ws.height(slot2) - RaidGuiBase.PADDING
	slot3 = self._ws
	self._panel_w = self._ws.width(RaidGuiBase.PADDING)
	self._panel_h = RaidGuiBase.PADDING
	self._panel_layer = RaidGuiBase.FOREGROUND_LAYER
	self._panel_is_root_panel = true

	return 
end
function RaidMenuFooter:_create_name_and_gold_panel()
	slot4 = "string_width"

	if not self._object.child(slot2, self._object) then
		slot4 = {
			name = "string_width",
			wrap = true,
			visible = false,
			font = tweak_data.gui.fonts.din_compressed,
			font_size = tweak_data.gui.font_sizes.size_24
		}
		local string_width_measure_text_field = self._object.text(slot2, self._object)
	end

	slot6 = managers.network.account
	local username = utf8.to_upper(managers.network.account.username(slot5))
	slot6 = username

	string_width_measure_text_field.set_text(managers.network.account.username, string_width_measure_text_field)

	slot5 = string_width_measure_text_field
	local _, _, w1, _ = string_width_measure_text_field.text_rect(managers.network.account.username)
	w1 = w1 + 64
	local params_profile_gold_label = {
		name = "gold_label",
		vertical = "bottom",
		h = 32,
		type = "label",
		y = 0,
		x = 0,
		text = username,
		w = w1,
		color = tweak_data.gui.colors.raid_grey,
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.size_24
	}
	local gold_icon = tweak_data.gui.icons.gold_amount_footer
	local gold_icon_params = {
		halign = "scale",
		valign = "scale",
		y = 0,
		texture = gold_icon.texture,
		texture_rect = gold_icon.texture_rect,
		x = w1,
		color = tweak_data.gui.colors.raid_grey,
		w = gold_icon.texture_rect[3],
		h = gold_icon.texture_rect[4],
		layer = self._object.layer(slot11)
	}
	local w2 = gold_icon_params.w + 10
	slot16 = managers.gold_economy
	local gold = managers.gold_economy.gold_string(self._object, managers.gold_economy.current(slot15))
	slot15 = gold

	string_width_measure_text_field.set_text(managers.gold_economy, string_width_measure_text_field)

	slot14 = string_width_measure_text_field
	local _, _, w3, _ = string_width_measure_text_field.text_rect(managers.gold_economy)
	local params_profile_name_label = {
		name = "profile_name_label",
		vertical = "bottom",
		h = 32,
		type = "label",
		y = 0,
		text = gold,
		x = w1 + w2,
		w = w3,
		color = tweak_data.gui.colors.raid_grey,
		font = tweak_data.gui.fonts.din_compressed,
		font_size = tweak_data.gui.font_sizes.size_24
	}
	local total_width = w1 + w2 + w3
	local separator_params = {
		vertical = "bottom",
		name = "separator",
		h = 14,
		y = 14,
		w = 2,
		x = w1 - 32,
		color = tweak_data.gui.colors.raid_grey
	}
	slot21 = self._object
	separator_params.layer = self._object.layer(slot20)
	slot22 = {
		name = "name_and_gold_panel",
		y = 0,
		align = "right",
		x = self._object.w(slot24) - total_width,
		w = total_width,
		h = self._object.h(slot24)
	}
	slot25 = self._object
	slot25 = self._object
	self._name_and_gold_panel = self._object.panel(slot20, self._object)
	slot22 = params_profile_name_label
	self._profile_name_label = self._name_and_gold_panel.label(slot20, self._name_and_gold_panel)
	slot22 = gold_icon_params
	self._gold_icon = self._name_and_gold_panel.bitmap(slot20, self._name_and_gold_panel)
	slot22 = params_profile_gold_label
	self._profile_gold_label = self._name_and_gold_panel.label(slot20, self._name_and_gold_panel)
	slot22 = separator_params
	self._separator = self._name_and_gold_panel.rect(slot20, self._name_and_gold_panel)

	return 
end
function RaidMenuFooter:hide_name_and_gold_panel()
	slot3 = self._name_and_gold_panel

	self._name_and_gold_panel.hide(slot2)

	return 
end
function RaidMenuFooter:refresh_gold_amount()
	slot6 = managers.gold_economy
	local gold_amount = managers.gold_economy.gold_string(slot2, managers.gold_economy.current(slot5))
	slot5 = gold_amount

	self._profile_name_label.set_text(managers.gold_economy, self._profile_name_label)

	return 
end
function RaidMenuFooter:back_pressed()
	return 
end
function RaidMenuFooter:confirm_pressed()
	return false
end

return 
