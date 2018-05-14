slot3 = "CoreInputTargetDescription"

core.module(slot1, core)

TargetDescription = TargetDescription or class()
function TargetDescription:init(name, type_name)
	self._name = name
	slot5 = type_name == "bool" or type_name == "vector"

	assert(slot4)

	self._type_name = type_name

	return 
end
function TargetDescription:target_name()
	return self._name
end
function TargetDescription:target_type_name()
	return self._type_name
end

return 
