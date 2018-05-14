Utl = {
	mul_to_string_percent = function (mul)
		slot6 = mul
		local val = string.format(slot2, tostring(slot5))
		slot6 = 4
		val = string.sub("%.2f", val, 3)

		return val
	end
}

return 
