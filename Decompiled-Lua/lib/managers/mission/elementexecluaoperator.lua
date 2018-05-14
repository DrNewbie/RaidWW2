if not ElementExecLuaOperator then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementExecLuaOperator = slot0
function ElementExecLuaOperator:init(...)
	slot3 = self

	ElementExecLuaOperator.super.init(slot2, ...)

	return 
end
function ElementExecLuaOperator:client_on_executed(...)
	slot4 = "[ElementExecLuaOperator:client_on_executed]"

	Application.debug(slot2, Application, ...)

	slot3 = self

	self.on_executed(slot2, ...)

	return 
end
function ElementExecLuaOperator:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	slot8 = instigator
	slot7 = self._values.lua_string

	Application.debug(slot3, Application, "[ElementExecLuaOperator:executed] Executing LUA (instigator, LUA):", inspect(slot7))

	local lua_string = self._values.lua_string
	local skip_lua_exec = false

	if self._values.local_only then
		slot6 = managers.player

		if instigator ~= managers.player.local_player(slot5) then
			slot7 = "[ElementExecLuaOperator:executed] Skipping execution because not insitgator"

			Application.debug(slot5, Application)

			skip_lua_exec = true
		end
	end

	slot6 = lua_string
	local func, err = loadstring(slot5)

	if func then
		if not skip_lua_exec then
			func()
		end

		slot9 = instigator

		ElementExecLuaOperator.super.on_executed(slot7, self)
	else
		slot12 = err

		Application.error(slot7, Application, "[ElementExecLuaOperator:on_executed] Error in provided script:", self._editor_name, ";cause: ")
	end

	return 
end

return 
