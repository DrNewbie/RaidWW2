if not RaidMenuHeader then
	slot2 = RaidGuiBase
	slot0 = class(slot1)
end

RaidMenuHeader = slot0
RaidMenuHeader.HEIGHT = 2 * RaidGuiBase.PADDING + 22
function RaidMenuHeader:init(ws, fullscreen_ws, node, component_name)
	slot11 = component_name

	RaidMenuHeader.super.init(slot6, self, ws, fullscreen_ws, node)

	return 
end
function RaidMenuHeader:_layout()
	slot4 = {
		text = "",
		name = "screen_name_label",
		x = 0,
		y = 0
	}
	self._screen_name_label = self._root_panel.label_title(slot2, self._root_panel)
	slot4 = {
		text = "",
		name = "screen_subtitle_label",
		x = 0,
		y = self._screen_name_label.h(slot6) + RaidGuiBase.PADDING + 22
	}
	slot7 = self._screen_name_label
	self._screen_subtitle_label = self._root_panel.label_subtitle(slot2, self._root_panel)

	return 
end
function RaidMenuHeader:_setup_properties()
	self._panel_x = 0
	self._panel_y = 0
	slot3 = self._ws
	self._panel_w = self._ws.width(slot2)
	self._panel_h = RaidMenuHeader.HEIGHT
	self._panel_layer = RaidGuiBase.FOREGROUND_LAYER
	self._panel_is_root_panel = true

	return 
end
function RaidMenuHeader:set_screen_name(screen_name_id, subtitle)
	slot8 = screen_name_id
	local text = utf8.to_upper(managers.localization.text(slot6, managers.localization))
	slot7 = text

	self._screen_name_label.set_text(managers.localization.text, self._screen_name_label)

	slot6 = self._screen_name_label
	local _, _, w, h = self._screen_name_label.text_rect(managers.localization.text)
	slot11 = w

	self._screen_name_label.set_w(slot9, self._screen_name_label)

	slot11 = h

	self._screen_name_label.set_h(slot9, self._screen_name_label)

	if subtitle then
		slot13 = subtitle
		local subtitle_text = utf8.to_upper(managers.localization.text(slot11, managers.localization))
		slot12 = subtitle_text

		self._screen_subtitle_label.set_text(managers.localization.text, self._screen_subtitle_label)

		slot11 = self._screen_subtitle_label
		local _, _, w, h = self._screen_subtitle_label.text_rect(managers.localization.text)
		slot16 = w

		self._screen_subtitle_label.set_w(slot14, self._screen_subtitle_label)

		slot16 = h

		self._screen_subtitle_label.set_h(slot14, self._screen_subtitle_label)
	end

	return 
end
function RaidMenuHeader:set_screen_name_raw(text)
	slot5 = text

	self._screen_name_label.set_text(slot3, self._screen_name_label)

	slot4 = self._screen_name_label
	local _, _, w, h = self._screen_name_label.text_rect(slot3)
	slot9 = w

	self._screen_name_label.set_w(slot7, self._screen_name_label)

	slot9 = h

	self._screen_name_label.set_h(slot7, self._screen_name_label)

	return 
end
function RaidMenuHeader:set_header_icon(icon_data)
	slot5 = {
		name = "header_icon",
		y = 0,
		x = 0,
		w = icon_data.tex_rect[3],
		h = icon_data.tex_rect[4],
		texture = icon_data.texture,
		texture_rect = icon_data.tex_rect,
		color = icon_data.color
	}
	self._header_icon = self._root_panel.image(slot3, self._root_panel)
	local x = self._screen_name_label.left(slot3)
	slot6 = x + icon_data.tex_rect[3] + 16

	self._screen_name_label.set_x(self._screen_name_label, self._screen_name_label)

	return 
end
function RaidMenuHeader:get_screen_name_rect()
	slot3 = self._screen_name_label
	local x, y, w, h = self._screen_name_label.text_rect(slot2)

	return x, y, w, h
end
function RaidMenuHeader:set_character_name(character_name)
	local full_name = ""
	slot5 = managers.network
	slot5 = managers.network.session(slot4)
	slot5 = managers.network.session(slot4).local_peer(slot4)
	local steam_name = managers.network.session(slot4).local_peer(slot4).name(slot4)
	full_name = character_name .. " (" .. steam_name .. ")"

	return 
end
function RaidMenuHeader:back_pressed()
	return 
end
function RaidMenuHeader:on_escape()
	return 
end
function RaidMenuHeader:confirm_pressed()
	return false
end

return 
