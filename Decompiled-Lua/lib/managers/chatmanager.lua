ChatManager = ChatManager or class()
ChatManager.GAME = 1
ChatManager.CREW = 2
ChatManager.GLOBAL = 3
ChatManager.MESSAGE_BUFFER_SIZE = 20
function ChatManager:init()
	slot3 = self

	self._setup(slot2)

	return 
end
function ChatManager:_setup()
	self._chatlog = {}
	self._receivers = {}
	self._message_buffer = {}

	return 
end
function ChatManager:register_receiver(channel_id, receiver)
	self._receivers[channel_id] = self._receivers[channel_id] or {}
	self._message_buffer[channel_id] = self._message_buffer[channel_id] or {}
	slot6 = receiver

	table.insert(self._message_buffer[channel_id] or , self._receivers[channel_id])

	local ct_cached_messages = #self._message_buffer[channel_id]
	slot6 = receiver
	local ct_chat_cached_messages = receiver.ct_cached_messages(self._receivers[channel_id])

	if ct_chat_cached_messages < ct_cached_messages then
		for i = ct_chat_cached_messages + 1, ct_cached_messages, 1 do
			local message_data = self._message_buffer[channel_id][i]
			slot18 = message_data.system_message

			receiver.receive_message(slot11, receiver, message_data.name, message_data.peer_id, message_data.message, message_data.color, message_data.icon)
		end
	elseif ct_cached_messages == ct_chat_cached_messages and ct_cached_messages == ChatManager.MESSAGE_BUFFER_SIZE then
		slot7 = self._message_buffer[channel_id]

		for _, message_data in ipairs(slot6) do
			slot18 = message_data.system_message

			receiver.receive_message(slot11, receiver, message_data.name, message_data.peer_id, message_data.message, message_data.color, message_data.icon)
		end
	end

	return 
end
function ChatManager:unregister_receiver(channel_id, receiver)
	if not self._receivers[channel_id] then
		return 
	end

	slot5 = self._receivers[channel_id]

	for i, rec in ipairs(slot4) do
		if rec == receiver then
			slot11 = i

			table.remove(slot9, self._receivers[channel_id])

			break
		end
	end

	return 
end
function ChatManager:send_message(channel_id, sender, message)
	slot6 = managers.network

	if managers.network.session(slot5) then
		slot6 = managers.network
		slot6 = managers.network.session(slot5)
		sender = managers.network.session(slot5).local_peer(slot5)
		slot6 = managers.network
		slot9 = message

		managers.network.session(slot5).send_to_peers_ip_verified(slot5, managers.network.session(slot5), "send_chat_message", channel_id)

		slot9 = message

		self.receive_message_by_peer(slot5, self, channel_id, sender)
	else
		slot9 = message

		self.receive_message_by_name(slot5, self, channel_id, sender)
	end

	return 
end
function ChatManager:feed_system_message(channel_id, message)
	if not Global.game_settings.single_player then
		slot12 = true

		self._receive_message(slot4, self, channel_id, nil, nil, message, Color.white, nil)
	end

	return 
end
function ChatManager:receive_message_by_peer(channel_id, peer, message)
	slot6 = peer
	local color_id = peer.id(slot5)
	local color = tweak_data.chat_colors[color_id]
	slot13 = peer
	slot14 = false

	self._receive_message(slot7, self, channel_id, peer.name(slot11), peer.id(peer), message, tweak_data.chat_colors[color_id])

	return 
end
function ChatManager:receive_message_by_name(channel_id, name, message)
	slot11 = tweak_data.chat_colors[1]

	self._receive_message(slot5, self, channel_id, name, nil, message)

	return 
end
function ChatManager:clear_message_buffer(channel_id)
	self._message_buffer[channel_id] = {}

	return 
end
function ChatManager:_cache_message(channel_id, name, peer_id, message, color, icon, system_message)
	slot11 = {
		name = name,
		peer_id = peer_id,
		message = message,
		color = color,
		icon = icon,
		system_message = system_message
	}

	table.insert(slot9, self._message_buffer[channel_id])

	if ChatManager.MESSAGE_BUFFER_SIZE < #self._message_buffer[channel_id] then
		slot11 = 1

		table.remove(slot9, self._message_buffer[channel_id])
	end

	return 
end
function ChatManager:_receive_message(channel_id, name, peer_id, message, color, icon, system_message)
	if not self._receivers[channel_id] then
		return 
	end

	slot17 = system_message

	self._cache_message(slot9, self, channel_id, name, peer_id, message, color, icon)

	slot10 = self._receivers[channel_id]

	for i, receiver in ipairs(slot9) do
		slot21 = system_message

		receiver.receive_message(slot14, receiver, name, peer_id, message, color, icon)
	end

	return 
end
function ChatManager:save(data)
	return 
end
function ChatManager:load(data)
	return 
end

return 
