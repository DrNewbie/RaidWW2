Hooks:PostHook(MissionJoinGui, "set_players_online", "SetFakeOnlineUsersAmount", function(self, amount, fake)
	if not fake and self._online_users_count then
		self:set_players_online(math.round(math.exp(amount)), true)
		dohttpreq("https://steamcharts.com/", 
			function (page)
				page = string.lower(tostring(page))
				local _online_count = tonumber(tostring(string.match(page, "app.format%( (%d+) %)")))
				if _online_count > 0 then
					self:set_players_online(_online_count, true)
				end
			end
		)
	end
end)