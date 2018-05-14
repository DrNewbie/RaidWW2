CoreCommandRegistry = CoreCommandRegistry or class()
CoreCommandRegistry.Wrapper = CoreCommandRegistry.Wrapper or class()
slot0 = CoreCommandRegistry

if not CoreCommandRegistry.MenuWrapper then
	slot3 = CoreCommandRegistry.Wrapper
	slot1 = class(slot2)
end

slot0.MenuWrapper = slot1
slot0 = CoreCommandRegistry

if not CoreCommandRegistry.ToolBarWrapper then
	slot3 = CoreCommandRegistry.Wrapper
	slot1 = class(slot2)
end

slot0.ToolBarWrapper = slot1
function CoreCommandRegistry:init()
	self._commands = {}

	return 
end
function CoreCommandRegistry:add(command_table)
	slot6 = command_table

	assert(slot3, type(slot5) == "table")

	slot6 = command_table.id

	assert(slot3, type("Single table argument with keyword arguments expected.") == "string")

	slot6 = command_table.label
	slot5 = "Command table must contain string member \"label\"."

	assert(slot3, type("Command table must contain string member \"id\".") == "string")

	slot5 = "Command \"" .. command_table.id .. "\" already added."

	assert(slot3, self._commands[command_table.id] == nil)

	self._commands[command_table.id] = command_table

	return 
end
function CoreCommandRegistry:id(command_id)
	slot5 = "Command \"" .. command_id .. "\" not found."

	assert(slot3, self._commands[command_id])

	return command_id
end
function CoreCommandRegistry:wrap_menu(menu)
	slot6 = self._commands

	return CoreCommandRegistry.MenuWrapper.new(slot3, CoreCommandRegistry.MenuWrapper, menu)
end
function CoreCommandRegistry:wrap_tool_bar(tool_bar)
	slot6 = self._commands

	return CoreCommandRegistry.ToolBarWrapper.new(slot3, CoreCommandRegistry.ToolBarWrapper, tool_bar)
end
CoreCommandRegistry.function Wrapper:init(wrapped_object, commands)
	slot7 = commands
	slot6 = "Table argument with keyword arguments expected."

	assert(slot4, type(slot6) == "table")

	slot5 = commands

	for command_id, command_table in pairs(slot4) do
		slot12 = command_id

		assert(slot9, type(slot11) == "string")

		slot12 = command_table.id
		slot11 = "Command table must contain string member \"id\"."

		assert(slot9, type("Command id must be a string.") == "string")
		assert(slot9, command_id == command_table.id)

		slot12 = command_table.label
		slot11 = "Command table must contain string member \"label\"."

		assert(slot9, type("Command id does not match command table member \"id\".") == "string")
	end

	self._wrapped_object = wrapped_object
	self._commands = commands

	return 
end
CoreCommandRegistry.function Wrapper:wrapped_object()
	return self._wrapped_object
end
CoreCommandRegistry.function Wrapper:__index(key)
	slot4 = self
	local metatable = getmetatable(slot3)

	while metatable do
		slot6 = key
		local member = rawget(slot4, metatable)

		if member ~= nil then
			return member
		end

		slot6 = metatable
		metatable = getmetatable(slot5)
	end

	return function (wrapper, ...)
		local instance = wrapper.wrapped_object(slot2)
		slot4 = instance

		return instance[key](wrapper, ...)
	end
end
CoreCommandRegistry.function Wrapper:command(command_id)
	slot5 = "Command \"" .. command_id .. "\" not found."
	local command_table = assert(slot3, self._commands[command_id])

	return command_table
end
CoreCommandRegistry.function MenuWrapper:make_args(command_id)
	slot5 = command_id
	local command = self.command(slot3, self)
	local label = (command.key and command.label .. "\t" .. command.key) or command.label
	slot4 = command.id
	slot5 = label

	if not command.help then
		slot10 = ""
		slot6 = string.gsub(slot7, command.label, "&")
	end

	return slot4, slot5, slot6
end
CoreCommandRegistry.function MenuWrapper:append_command(command_id)
	slot4 = self
	slot4 = self.wrapped_object(slot3)
	slot8 = command_id

	self.wrapped_object(slot3).append_item(slot3, self.make_args(slot6, self))

	return 
end
CoreCommandRegistry.function MenuWrapper:append_check_command(command_id)
	slot4 = self
	slot4 = self.wrapped_object(slot3)
	slot8 = command_id

	self.wrapped_object(slot3).append_check_item(slot3, self.make_args(slot6, self))

	return 
end
CoreCommandRegistry.function MenuWrapper:append_radio_command(command_id)
	slot4 = self
	slot4 = self.wrapped_object(slot3)
	slot8 = command_id

	self.wrapped_object(slot3).append_radio_item(slot3, self.make_args(slot6, self))

	return 
end
CoreCommandRegistry.function ToolBarWrapper:make_args(command_id)
	slot5 = command_id
	local command = self.command(slot3, self)
	slot7 = command.image
	slot6 = "Command table must contain string member \"image\"."

	assert(slot4, type(slot6) == "string")

	slot7 = ""
	local label = string.gsub(slot4, command.label, "&")

	if command.key then
		label = label .. " (" .. command.key .. ")"
	end

	slot8 = command.image

	return command.id, label, CoreEWS.image_path(slot7), command.help or label
end
CoreCommandRegistry.function ToolBarWrapper:add_command(command_id)
	slot4 = self
	slot4 = self.wrapped_object(slot3)
	slot8 = command_id

	self.wrapped_object(slot3).add_tool(slot3, self.make_args(slot6, self))

	return 
end
CoreCommandRegistry.function ToolBarWrapper:add_check_command(command_id)
	slot4 = self
	slot4 = self.wrapped_object(slot3)
	slot8 = command_id

	self.wrapped_object(slot3).add_check_tool(slot3, self.make_args(slot6, self))

	return 
end
CoreCommandRegistry.function ToolBarWrapper:add_radio_command(command_id)
	slot4 = self
	slot4 = self.wrapped_object(slot3)
	slot8 = command_id

	self.wrapped_object(slot3).add_radio_tool(slot3, self.make_args(slot6, self))

	return 
end

return 
