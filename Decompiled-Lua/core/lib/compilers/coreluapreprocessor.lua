-- Decompilation Error: _run_step(_unwarp_loops, node, repeat_until=True)

-- Decompilation Error: _run_step(_unwarp_expressions, node)

-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- Decompilation Error: _run_step(_unwarp_ifs, node)

-- Decompilation Error: _glue_flows(node)

-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
-- WARNING: Error occurred during decompilation.
--   Code may be incomplete or incorrect.
slot2 = "core/lib/compilers/CoreCompilerSystem"

require(slot1)

CoreLuaPreprocessor = CoreLuaPreprocessor or class()
CoreLuaPreprocessor.preprocessors = {}
CoreLuaPreprocessor.DEBUG = false
CoreLuaPreprocessor._WHITESPACE_CHARACTERS = {
	[" "] = true,
	["\n"] = true,
	["\r"] = true,
	["\t"] = true
}
CoreLuaPreprocessor._IF_STATEMENT = "#IF"
CoreLuaPreprocessor._ELSEIF_STATEMENT = "#ELSE_IF"
CoreLuaPreprocessor._ELSE_STATEMENT = "#ELSE"
CoreLuaPreprocessor._OR_OPERATOR = "or"
CoreLuaPreprocessor._OPENING_BRACKET = "{"
CoreLuaPreprocessor._CLOSING_BRACKET = "}"
function CoreLuaPreprocessor:preprocess(path, constants_table, code)
	self._source_path = path
	slot8 = code
	local c = self._apply_preprocessor_1(slot5, self, constants_table)

	return c
end
function CoreLuaPreprocessor:_apply_preprocessor_1(constants_table, source_str)
	local params = {
		output_str = ""
	}
	slot6 = source_str
	local source_len = string.len(slot5)
	local current_pos = 1

	repeat
		slot13 = params
		current_pos = self._parse_next_block(slot7, self, constants_table, current_pos, source_str, source_len)
	until source_len < current_pos

	return params.output_str
end
function CoreLuaPreprocessor:_parse_next_block(constants_table, current_pos, source_str, source_len, params)
	local statements_list = {}

	repeat
		slot14 = statements_list
		local sussess, finished = self._parse_next_conditional_statement(slot8, self, source_str, source_len, current_pos, constants_table)

		if not sussess then
			slot22 = constants_end_pos + 1
			slot12 = "[CoreLuaPreprocessor:_process_next_block] " .. self._IF_STATEMENT .. " statement parsing error. file: " .. self._source_path .. ". (" .. tostring(self._line_number_at_pos(slot20, self)) .. ")"

			self.print_error(slot10, self)

			return 
		end

		slot11 = statements_list

		if next(slot10) and not (statements_list[#statements_list].bracket_close_pos + 1) then
		end
	until finished

	slot9 = statements_list

	if not next(slot8) then
		slot12 = source_len
		params.output_str = params.output_str .. string.sub(slot9, source_str, current_pos)

		return source_len + 1
	end

	local true_statement_found = nil
	slot10 = statements_list

	for i_statement, statement_info in ipairs(slot9) do
		params.output_str = params.output_str .. statement_info.whitespace

		if not true_statement_found and statement_info.truth then
			true_statement_found = true
			slot17 = statement_info.bracket_close_pos - 1
			local unprocessed_block = string.sub(slot14, source_str, statement_info.bracket_open_pos + 1)
			slot18 = unprocessed_block
			local processed_block = self._apply_preprocessor_1(source_str, self, constants_table)
			params.output_str = params.output_str .. processed_block
		else
			slot19 = statement_info.bracket_close_pos - 1
			params.output_str = params.output_str .. self._get_only_newlines(slot15, self, source_str, statement_info.bracket_open_pos + 1)
		end
	end

	return statements_list[#statements_list].bracket_close_pos + 1
end
function CoreLuaPreprocessor:_parse_next_conditional_statement(source_str, source_len, start_pos, constants_table, statements_list)
	local statement_info, is_last_statement = nil
	slot10 = statements_list

	if not next(slot9) then
		local if_start_pos, if_end_pos = nil
		local search_pos = start_pos
		slot16 = true
		if_start_pos, if_end_pos = string.find(slot12, source_str, self._IF_STATEMENT, search_pos)

		if not if_start_pos then
			return true, true
		end

		search_pos = if_end_pos and if_end_pos + 1
	else
		local elseif_start_pos, elseif_end_pos, else_start_pos, else_end_pos = nil
		local search_pos = start_pos
		slot18 = true
		elseif_start_pos, elseif_end_pos = string.find(slot14, source_str, self._ELSEIF_STATEMENT, search_pos)
		search_pos = elseif_end_pos and elseif_end_pos + 1
	end

	if not statement_info then
		return true, true
	end

	if not statement_info.whitespace then
		slot13 = statement_info.bracket_open_pos - 1
		slot8 = self._get_only_newlines(slot9, self, source_str, start_pos)
	end

	statement_info.whitespace = slot8
	slot11 = statement_info

	table.insert(slot9, statements_list)

	return true, is_last_statement
end
function CoreLuaPreprocessor:_parse_statement(source_str, source_len, start_pos, constants_table)
	local statement_info = {}
	local constants_end_pos = nil

	if constants_table then
		slot11 = start_pos
		local constants_statement_table, constants_end_pos_out = self._extract_constants(slot8, self, source_str)
		constants_end_pos = constants_end_pos_out
		slot13 = constants_table
		statement_info.truth = self._test_constants_truth(source_str, self, constants_statement_table)
	else
		statement_info.truth = true
		constants_end_pos = start_pos
	end

	slot12 = constants_end_pos + 1
	local bracket_open_pos, bracket_close_pos = self._find_bracket_block(slot8, self, source_str, source_len)

	if not bracket_open_pos then
		return 
	end

	statement_info.bracket_open_pos = bracket_open_pos
	statement_info.bracket_close_pos = bracket_close_pos

	return statement_info
end
function CoreLuaPreprocessor:_extract_constants(source_str, start_pos)
	slot8 = true
	local bracket_open_pos = string.find(slot4, source_str, self._OPENING_BRACKET, start_pos)

	if not bracket_open_pos then
		slot15 = start_pos
		slot7 = "[CoreLuaPreprocessor:_process_next_block] statement without opening bracket. file: " .. self._source_path .. ". (" .. tostring(self._line_number_at_pos(slot13, self)) .. ")"

		self.print_error(slot5, self)

		return 
	end

	slot8 = bracket_open_pos - 1
	local constants_statement_str = string.sub(slot5, source_str, start_pos)
	local constants_statement_table = string.split(source_str, constants_statement_str, " " .. self._OR_OPERATOR .. " ", nil)
	local constants_statement_table_out = {}
	slot9 = constants_statement_table

	for key, constant_statement in pairs(" " .. self._OR_OPERATOR .. " ") do
		slot15 = constant_statement
		constant_statement = self._cleanup_constant(slot13, self)
		constants_statement_table_out[key] = constant_statement
	end

	return constants_statement_table_out, bracket_open_pos - 1
end
function CoreLuaPreprocessor:_cleanup_constant(constant)
	slot4 = self._WHITESPACE_CHARACTERS

	for whitespace_char, _ in pairs(slot3) do
		slot11 = ""
		constant = string.gsub(slot8, constant, whitespace_char)
	end

	return constant
end
function CoreLuaPreprocessor:_find_bracket_block(source_str, source_len, start_pos)
	slot9 = true
	local bracket_open_pos = string.find(slot5, source_str, self._OPENING_BRACKET, start_pos)

	if not bracket_open_pos then
		return 
	end

	if bracket_open_pos ~= start_pos then
		slot10 = bracket_open_pos - 1

		if not self._is_whitespace(slot6, self, source_str, start_pos) then
			return 
		end
	end

	slot10 = bracket_open_pos
	local bracket_close_pos = self._find_corresponding_closing_bracket(slot6, self, source_str, source_len)

	if not bracket_close_pos then
		return 
	end

	return bracket_open_pos, bracket_close_pos
end
function CoreLuaPreprocessor:_find_corresponding_closing_bracket(source_str, source_len, bracket_open_pos)
	local current_pos = bracket_open_pos + 1
	local nr_open_brackets = 1

	while 0 < nr_open_brackets and current_pos <= source_len do
		slot11 = true
		local closing_bracket_pos = string.find(slot7, source_str, self._CLOSING_BRACKET, current_pos)

		if closing_bracket_pos then
			nr_open_brackets = nr_open_brackets - 1
			slot12 = closing_bracket_pos - 1
			nr_open_brackets = nr_open_brackets + self._count_opening_brackets(slot8, self, source_str, current_pos)
			current_pos = closing_bracket_pos + 1
		else
			slot16 = bracket_open_pos
			slot11 = self._source_path

			self.print_error(slot8, self, "[CoreLuaPreprocessor:_find_corresponding_closing_bracket_pos] Did not find corresponding closing bracket for opening bracket at " .. tostring(self._line_number_at_pos(slot14, self)) .. ". file: ")

			break
		end
	end

	return nr_open_brackets == 0 and current_pos - 1
end
function CoreLuaPreprocessor:_count_opening_brackets(source_str, search_start_pos, search_end_pos)

	-- Decompilation error in this vicinity:
	local search_pos = search_start_pos
	local nr_opening_brackets = 0
	slot11 = true
	local pos = string.find(slot7, source_str, self._OPENING_BRACKET, search_pos)

	if pos then
		if pos <= search_end_pos then
			nr_opening_brackets = nr_opening_brackets + 1
			search_pos = pos + 1
		else
			pos = nil
		end
	end

	return nr_opening_brackets
end
function CoreLuaPreprocessor:_line_number_at_pos(source_str, end_pos)

	-- Decompilation error in this vicinity:
	local search_pos = 1
	local nr_newlines = 0
	slot10 = true
	local pos = string.find(slot6, source_str, "\n", search_pos)

	if pos then
		if pos <= end_pos then
			nr_newlines = nr_newlines + 1
			search_pos = pos + 1
		else
			pos = nil
		end
	end

	return nr_newlines + 1
end
function CoreLuaPreprocessor:_is_whitespace(source_str, start_pos, end_pos)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	if not end_pos then

		-- Decompilation error in this vicinity:
		--- BLOCK #1 3-3, warpins: 1 ---
		end_pos = start_pos
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #1 3-3, warpins: 1 ---
	end_pos = start_pos
	--- END OF BLOCK #1 ---




	-- Decompilation error in this vicinity:
	--- BLOCK #2 4-4, warpins: 2 ---
	local search_pos = start_pos
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 5-5, warpins: 2 ---
	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 6-15, warpins: 1 ---
	slot9 = search_pos
	local test_char = string.sub(slot6, source_str, search_pos)

	if self._WHITESPACE_CHARACTERS[test_char] then

		-- Decompilation error in this vicinity:
		--- BLOCK #5 16-17, warpins: 1 ---
		search_pos = search_pos + 1
		--- END OF BLOCK #5 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #6 18-19, warpins: 1 ---
		return false
		--- END OF BLOCK #6 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #5 16-17, warpins: 1 ---
	search_pos = search_pos + 1

	--- END OF BLOCK #5 ---




	-- Decompilation error in this vicinity:
	--- BLOCK #6 18-19, warpins: 1 ---
	return false
	--- END OF BLOCK #6 ---




	-- Decompilation error in this vicinity:
	--- BLOCK #7 20-21, warpins: 2 ---
	--- END OF BLOCK #7 ---

	if end_pos < search_pos then
	JUMP TO BLOCK #8
	else
	JUMP TO BLOCK #3
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #8 22-23, warpins: 1 ---
	return true
	--- END OF BLOCK #8 ---



end
function CoreLuaPreprocessor:_is_whitespace_or_singleline_comment(source_str, start_pos)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot7 = start_pos

	--- END OF BLOCK #0 ---

	slot3 = if self._is_whitespace(slot4, self, source_str)

	 then
	JUMP TO BLOCK #1
	else
	JUMP TO BLOCK #2
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-9, warpins: 1 ---
	return true
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 10-11, warpins: 2 ---
	--- END OF BLOCK #2 ---

	if start_pos == 1 then
	JUMP TO BLOCK #3
	else
	JUMP TO BLOCK #4
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #3 12-13, warpins: 1 ---
	return false

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 14-21, warpins: 2 ---
	slot7 = start_pos

	--- END OF BLOCK #4 ---

	if string.sub(slot4, source_str, start_pos)

	 == "-" then
	JUMP TO BLOCK #5
	else
	JUMP TO BLOCK #7
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #5 22-29, warpins: 1 ---
	slot7 = start_pos - 1

	--- END OF BLOCK #5 ---

	if string.sub(slot4, source_str, start_pos - 1)

	 == "-" then
	JUMP TO BLOCK #6
	else
	JUMP TO BLOCK #7
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #6 30-31, warpins: 1 ---
	return true
	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #7 32-33, warpins: 3 ---
	return false
	--- END OF BLOCK #7 ---



end
function CoreLuaPreprocessor:_get_only_newlines(source_str, start_pos, end_pos)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	local out = ""
	local search_pos = start_pos
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 3-3, warpins: 2 ---
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 4-12, warpins: 1 ---
	slot11 = true
	local pos = string.find(slot7, source_str, "\n", search_pos)
	--- END OF BLOCK #2 ---

	slot6 = if pos then
	JUMP TO BLOCK #3
	else
	JUMP TO BLOCK #6
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #3 13-14, warpins: 1 ---
	--- END OF BLOCK #3 ---

	if pos <= end_pos then
	JUMP TO BLOCK #4
	else
	JUMP TO BLOCK #5
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #4 15-19, warpins: 1 ---
	out = out .. "\r\n"
	search_pos = pos + 1
	--- END OF BLOCK #4 ---

	UNCONDITIONAL JUMP; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #5 20-20, warpins: 1 ---
	pos = nil

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 21-22, warpins: 3 ---
	--- END OF BLOCK #6 ---

	slot6 = if pos then
	JUMP TO BLOCK #7
	else
	JUMP TO BLOCK #8
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #7 23-24, warpins: 1 ---
	--- END OF BLOCK #7 ---

	if end_pos < search_pos then
	JUMP TO BLOCK #8
	else
	JUMP TO BLOCK #1
	end



	-- Decompilation error in this vicinity:
	--- BLOCK #8 25-25, warpins: 2 ---
	return out
	--- END OF BLOCK #8 ---



end
function CoreLuaPreprocessor:_test_constants_truth(constants_statement_table, constants_table)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	slot5 = constants_statement_table

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-11, warpins: 0 ---
	for key, constant in pairs(slot4) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-7, warpins: 1 ---
		--- END OF BLOCK #0 ---

		slot8 = if constants_table[constant] then
		JUMP TO BLOCK #1
		else
		JUMP TO BLOCK #2
		end



		-- Decompilation error in this vicinity:
		--- BLOCK #1 8-9, warpins: 1 ---
		return true
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 10-11, warpins: 3 ---
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 12-12, warpins: 1 ---
	return 
	--- END OF BLOCK #2 ---



end
function CoreLuaPreprocessor:print_error(text)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot4 = "\n[ERROR] " .. text .. "\n"

	print(slot3)

	return 
	--- END OF BLOCK #0 ---



end

return 
