HUDChatMessage = HUDChatMessage or class()
HUDChatMessage.W = 320
HUDChatMessage.NAME_H = 32
HUDChatMessage.NAME_FONT = tweak_data.gui.fonts.din_compressed_outlined_20
HUDChatMessage.NAME_FONT_SIZE = tweak_data.gui.font_sizes.size_20
HUDChatMessage.MESSAGE_FONT = tweak_data.gui.fonts.lato_outlined_18
HUDChatMessage.MESSAGE_FONT_SIZE = tweak_data.gui.font_sizes.size_18
HUDChatMessage.MESSAGE_PADDING_DOWN = 5
HUDChatMessage.PLAYER_MESSAGE_COLOR = tweak_data.gui.colors.chat_player_message
HUDChatMessage.PEER_MESSAGE_COLOR = tweak_data.gui.colors.chat_peer_message
HUDChatMessage.SYSTEM_MESSAGE_COLOR = tweak_data.gui.colors.chat_system_message

if not HUDChatMessagePlayer then
	slot2 = HUDChatMessage
	slot0 = class(slot1)
end

HUDChatMessagePlayer = slot0
function HUDChatMessagePlayer:init(message_panel, name, message, peer_id)
	self._message_color = HUDChatMessage.PLAYER_MESSAGE_COLOR
	self._horizontal_text_align = "right"
	slot7 = managers.network
	slot7 = managers.network.session(slot6)
	local player_name = managers.network.session(slot6).local_peer(slot6).name(slot6)
	slot12 = peer_id

	HUDChatMessagePlayer.super.init(managers.network.session(slot6).local_peer(slot6), self, message_panel, player_name, message)

	return 
end

if not HUDChatMessagePeer then
	slot2 = HUDChatMessage
	slot0 = class(slot1)
end

HUDChatMessagePeer = slot0
function HUDChatMessagePeer:init(message_panel, name, message, peer_id)
	self._message_color = HUDChatMessage.PEER_MESSAGE_COLOR
	self._horizontal_text_align = "left"
	slot7 = managers.network
	slot8 = peer_id
	local peer_name = managers.network.session(slot6).peer(slot6, managers.network.session(slot6)).name(slot6)
	slot12 = peer_id

	HUDChatMessagePeer.super.init(managers.network.session(slot6).peer(slot6, managers.network.session(slot6)), self, message_panel, peer_name, message)

	return 
end

if not HUDChatMessageSystem then
	slot2 = HUDChatMessage
	slot0 = class(slot1)
end

HUDChatMessageSystem = slot0
function HUDChatMessageSystem:init(message_panel, name, message)
	self._message_color = HUDChatMessage.SYSTEM_MESSAGE_COLOR
	self._horizontal_text_align = "left"
	self._system_message = true
	slot7 = "menu_system_message"
	local system_name = managers.localization.to_upper_text(slot5, managers.localization)
	slot10 = message

	HUDChatMessageSystem.super.init(managers.localization, self, message_panel, system_name)

	return 
end
function HUDChatMessage:init(message_panel, name, message, peer_id)
	self._messages = {}
	slot8 = message_panel

	self._create_panel(slot6, self)

	slot8 = name

	self._create_name(slot6, self)

	slot7 = self

	self._create_message_panel(slot6)

	slot8 = message

	self.add_message(slot6, self)

	self._peer_id = peer_id

	return 
end
function HUDChatMessage:_create_panel(message_panel)
	local panel_params = {
		name = "player_message_panel",
		valign = "bottom",
		halign = "scale",
		w = HUDChatMessage.W
	}
	slot6 = panel_params
	self._object = message_panel.panel(slot4, message_panel)

	return 
end
function HUDChatMessage:_create_name(name)
	local name_params = {
		name = "name",
		vertical = "center",
		halign = "scale",
		layer = 20,
		y = 0,
		x = 0,
		valign = "top"
	}
	slot5 = self._object
	name_params.w = self._object.w(slot4)
	name_params.h = HUDChatMessage.NAME_H
	name_params.font = HUDChatMessage.NAME_FONT
	name_params.font_size = HUDChatMessage.NAME_FONT_SIZE
	name_params.color = self._message_color
	name_params.align = self._horizontal_text_align
	slot5 = name
	name_params.text = utf8.to_upper(slot4)
	slot6 = name_params
	self._name = self._object.text(slot4, self._object)

	return 
end
function HUDChatMessage:_create_message_panel()
	local message_panel_params = {
		halign = "scale",
		name = "message_panel",
		x = 0,
		valign = "bottom"
	}
	slot5 = self._name
	slot3 = self._name.h(self._name)
	message_panel_params.y = self._name.y(slot3) + slot3
	slot4 = self._object
	message_panel_params.w = self._object.w(slot3)
	slot5 = self._name
	message_panel_params.h = self._object.h(slot3) - self._name.h(self._object)
	slot5 = message_panel_params
	self._message_panel = self._object.panel(self._name.h(self._object), self._object)

	return 
end
function HUDChatMessage:_create_message(message)
	local message_params = {
		name = "message",
		vertical = "center",
		wrap = true,
		halign = "scale",
		x = 0,
		valign = "bottom"
	}
	slot5 = self._name
	message_params.y = self._name.h(slot4)
	slot5 = self._object
	message_params.w = self._object.w(slot4)
	message_params.font = HUDChatMessage.MESSAGE_FONT
	message_params.font_size = HUDChatMessage.MESSAGE_FONT_SIZE
	message_params.color = self._message_color
	message_params.align = self._horizontal_text_align
	message_params.text = message
	slot6 = message_params
	self._message = self._object.text(slot4, self._object)
	slot5 = self._message
	local _, _, _, h = self._message.text_rect(slot4)
	slot10 = h

	self._message.set_h(slot8, self._message)

	return 
end
function HUDChatMessage:_size_panel()
	local h = self._name.h(slot2)
	slot4 = self._message_panel
	local bottom = self._message_panel.h(self._name)

	for i = #self._messages, 1, -1 do
		slot10 = bottom

		self._messages[i].set_bottom(slot8, self._messages[i])

		slot9 = self._messages[i]
		bottom = bottom - self._messages[i].h(slot8) - HUDChatMessage.MESSAGE_PADDING_DOWN
		slot9 = self._messages[i]
		h = h + self._messages[i].h(HUDChatMessage.MESSAGE_PADDING_DOWN) + HUDChatMessage.MESSAGE_PADDING_DOWN
	end

	slot5 = self._object
	slot5 = self._object.parent(slot4)

	if self._object.parent(slot4).h(slot4) < h then
		slot5 = self._object
		slot5 = self._object.parent(slot4)
		h = self._object.parent(slot4).h(slot4)
	end

	slot6 = h

	self._object.set_h(slot4, self._object)

	slot6 = 0

	self._name.set_y(slot4, self._name)

	slot8 = self._name
	slot6 = h - self._name.h(slot7)

	self._message_panel.set_h(slot4, self._message_panel)

	slot6 = h

	self._message_panel.set_bottom(slot4, self._message_panel)

	return 
end
function HUDChatMessage:add_message(message)
	local message_params = {
		vertical = "center",
		wrap = true,
		halign = "scale",
		y = 0,
		x = 0,
		valign = "bottom"
	}
	slot6 = #self._messages + 1
	slot4 = tostring(slot5)
	message_params.name = "message_" .. slot4
	slot5 = self._message_panel
	message_params.w = self._message_panel.w(slot4)
	message_params.font = HUDChatMessage.MESSAGE_FONT
	message_params.font_size = HUDChatMessage.MESSAGE_FONT_SIZE
	message_params.color = self._message_color
	message_params.align = self._horizontal_text_align
	message_params.text = message
	slot6 = message_params
	local new_message = self._message_panel.text(slot4, self._message_panel)
	slot6 = new_message
	local _, _, _, h = new_message.text_rect(self._message_panel)
	slot11 = h

	new_message.set_h(slot9, new_message)

	local y = 0

	for i = 1, #self._messages, 1 do
		slot15 = self._messages[i]
		y = y + self._messages[i].h(slot14) + HUDChatMessage.MESSAGE_PADDING_DOWN
	end

	slot12 = y

	new_message.set_y(slot10, new_message)

	slot12 = new_message

	table.insert(slot10, self._messages)

	slot11 = self

	self._size_panel(slot10)

	return 
end
function HUDChatMessage:destroy()
	slot3 = self._object

	self._object.clear(slot2)

	slot3 = self._object
	slot4 = self._object

	self._object.parent(slot2).remove(slot2, self._object.parent(slot2))

	return 
end
function HUDChatMessage:x()
	slot3 = self._object

	return self._object.x(slot2)
end
function HUDChatMessage:y()
	slot3 = self._object

	return self._object.y(slot2)
end
function HUDChatMessage:w()
	slot3 = self._object

	return self._object.w(slot2)
end
function HUDChatMessage:h()
	slot3 = self._object

	return self._object.h(slot2)
end
function HUDChatMessage:set_x(x)
	slot5 = x

	self._object.set_x(slot3, self._object)

	return 
end
function HUDChatMessage:set_y(y)
	slot5 = y

	self._object.set_y(slot3, self._object)

	return 
end
function HUDChatMessage:set_top(top)
	slot5 = top

	self._object.set_top(slot3, self._object)

	return 
end
function HUDChatMessage:set_bottom(bottom)
	if 0 < bottom then
		slot4 = self

		if bottom - self.h(slot3) < 0 then
			local h = bottom
			slot5 = self._name
			local new_message_panel_height = h - self._name.h(slot4)
			slot6 = self._messages[#self._messages]

			if new_message_panel_height < self._messages[#self._messages].h(#self._messages) then
				slot6 = self._messages[#self._messages]
				new_message_panel_height = self._messages[#self._messages].h(#self._messages)
				slot6 = self._name
				h = self._name.h(#self._messages) + new_message_panel_height
			end

			slot7 = new_message_panel_height

			self._message_panel.set_h(slot5, self._message_panel)

			slot7 = h

			self._object.set_h(slot5, self._object)

			slot7 = h

			self._message_panel.set_bottom(slot5, self._message_panel)
		end
	end

	slot5 = bottom

	self._object.set_bottom(slot3, self._object)

	return 
end
function HUDChatMessage:peer_id()
	return self._peer_id
end
function HUDChatMessage:system_message()
	return self._system_message or false
end

return 
