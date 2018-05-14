slot3 = "CoreMissionScriptElement"

core.import(slot1, core)

if not ElementNavObstacle then
	slot2 = CoreMissionScriptElement.MissionScriptElement
	slot0 = class(slot1)
end

ElementNavObstacle = slot0
function ElementNavObstacle:init(...)
	slot3 = self

	ElementDisableUnit.super.init(slot2, ...)

	self._obstacle_units = {}

	return 
end
function ElementNavObstacle:on_script_activated()
	if not self._values.obstacle_list then
		self._values.obstacle_list = {
			{
				unit_id = self._values.obstacle_unit_id,
				obj_name = self._values.obstacle_obj_name
			}
		}
	end

	slot3 = self._values.obstacle_list

	for _, data in ipairs(slot2) do
		slot8 = Application

		if Application.editor(slot7) then
			slot9 = {
				unit = managers.editor.unit_with_id(slot11, managers.editor),
				obj_name = data.obj_name
			}
			slot13 = data.unit_id

			table.insert(slot7, self._obstacle_units)
		else
			slot8 = self._mission_script
			slot9 = data.unit_id
			slot15 = data.obj_name
			local unit = self._mission_script.worlddefinition(slot7).get_unit_on_load(slot7, self._mission_script.worlddefinition(slot7), callback(slot11, self, self, "_load_unit"))

			if unit then
				slot10 = {
					unit = unit,
					obj_name = data.obj_name
				}

				table.insert(slot8, self._obstacle_units)
			end
		end
	end

	self._has_fetched_units = true
	slot4 = self._id

	self._mission_script.add_save_state_cb(slot2, self._mission_script)

	return 
end
function ElementNavObstacle:_load_unit(obj_name, unit)
	slot6 = {
		unit = unit,
		obj_name = obj_name
	}

	table.insert(slot4, self._obstacle_units)

	return 
end
function ElementNavObstacle:client_on_executed(...)
	slot3 = self

	self.on_executed(slot2, ...)

	return 
end
function ElementNavObstacle:on_executed(instigator)
	if not self._values.enabled then
		return 
	end

	slot4 = self._obstacle_units

	for _, data in ipairs(slot3) do
		slot9 = data.unit

		if not alive(slot8) then
			slot10 = self._id

			print(slot8, "[ElementNavObstacle:on_executed] dead obstacle unit. element_id:")
		else
			slot10 = data.obj_name

			if not data.unit.get_object(slot8, data.unit) then
				slot14 = data.obj_name

				debug_pause(slot8, "[ElementNavObstacle:on_executed] object missing from unit. element_id:", self._id, "unit", data.unit, "Objec3D")
			elseif self._values.operation == "add" then
				slot12 = self._sync_id

				managers.navigation.add_obstacle(slot8, managers.navigation, data.unit, data.obj_name)
			else
				slot11 = data.obj_name

				managers.navigation.remove_obstacle(slot8, managers.navigation, data.unit)
			end
		end
	end

	slot5 = instigator

	ElementNavObstacle.super.on_executed(slot3, self)

	return 
end
function ElementNavObstacle:save(data)
	data.save_me = true
	data.enabled = self._values.enabled

	return 
end
function ElementNavObstacle:load(data)
	if not self._has_fetched_units then
		slot4 = self

		self.on_script_activated(slot3)
	end

	slot5 = data.enabled

	self.set_enabled(slot3, self)

	return 
end

return 
