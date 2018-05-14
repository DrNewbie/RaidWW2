slot3 = "CoreExpressionManager"

core.module(slot1, core)

ExpressionManager = ExpressionManager or class()
function ExpressionManager:init()
	self._units = {}
	self._preloads = {}

	return 
end
function ExpressionManager:update(t, dt)
	slot5 = self._units

	for i, exp in pairs(slot4) do
		slot12 = dt

		if not exp.update(slot9, exp, t) then
			self._units[i] = nil
		end
	end

	return 
end
function ExpressionManager:preload(movie_name)
	slot5 = Database
	slot10 = movie_name
	self._preloads[movie_name] = Database.load_node(slot4, Database.lookup(slot7, Database, "expression"))

	return 
end
function ExpressionManager:play(unit, target, movie_name, loop)
	slot14 = loop
	self._units[unit.key(slot7)] = CoreExpressionMovie.new(unit, CoreExpressionMovie, unit, target, movie_name, self._preloads[movie_name])

	return 
end
function ExpressionManager:stop(unit)
	slot5 = unit
	self._units[unit.key(slot4)] = nil

	return 
end

return 
