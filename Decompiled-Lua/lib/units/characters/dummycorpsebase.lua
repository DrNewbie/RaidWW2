if not DummyCorpseBase then
	slot2 = UnitBase
	slot0 = class(slot1)
end

DummyCorpseBase = slot0
DummyCorpseBase._material_translation_map = CopBase._material_translation_map
DummyCorpseBase.swap_material_config = CopBase.swap_material_config
DummyCorpseBase.is_in_original_material = CopBase.is_in_original_material
DummyCorpseBase.set_material_state = CopBase.set_material_state
DummyCorpseBase.set_allow_invisible = CopBase.set_allow_invisible
DummyCorpseBase.on_material_applied = CopBase.on_material_applied
function DummyCorpseBase:init(unit)
	slot6 = false

	UnitBase.init(slot3, self, unit)

	self._is_in_original_material = true

	return 
end

return 
