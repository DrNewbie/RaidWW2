CoreEnvEditor = CoreEnvEditor or class()
function CoreEnvEditor.lerp_formula(value, v)
	slot9 = 1
	slot6 = v or 0.5

	return math.lerp(slot3, value, Vector3(slot6, 1, 1))
end

return 
