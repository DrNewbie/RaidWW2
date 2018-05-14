local selected_setup = nil

if Global.load_level then
	slot3 = "lib/setups/NetworkGameSetup"
	selected_setup = require(slot2)
elseif Global.load_start_menu then
	slot3 = "lib/setups/MenuSetup"
	selected_setup = require(slot2)
else
	slot3 = Application

	if Application.editor(slot2) then
		slot3 = "lib/setups/NetworkGameSetup"
		selected_setup = require(slot2)
	else
		slot3 = "lib/setups/MenuSetup"
		selected_setup = require(slot2)
	end
end

if not setup then
	slot3 = selected_setup
	slot1 = selected_setup.new(slot2)
end

setup = slot1
slot3 = setup

setup.make_entrypoint(slot2)

return 
