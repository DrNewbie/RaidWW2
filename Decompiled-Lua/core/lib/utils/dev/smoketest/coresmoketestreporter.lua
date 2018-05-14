slot3 = "CoreSmoketestReporter"

core.module(slot1, core)

slot3 = "CoreClass"

core.import(slot1, core)

Reporter = Reporter or CoreClass.class()
function Reporter:init()
	return 
end
function Reporter:begin_substep(name)
	slot5 = "[Smoketest] begin_substep " .. name

	cat_print(slot3, "spam")

	return 
end
function Reporter:end_substep(name)
	slot5 = "[Smoketest] end_substep " .. name

	cat_print(slot3, "spam")

	return 
end
function Reporter:fail_substep(name)
	slot5 = "[Smoketest] fail_substep " .. name

	cat_print(slot3, "spam")

	return 
end
function Reporter:tests_done()
	slot4 = "[Smoketest] tests_done"

	cat_print(slot2, "spam")

	return 
end

return 
