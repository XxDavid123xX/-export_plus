extends EditorInspectorPlugin

var callable_property = preload("res://addons/@export_plus/scripts/callable_property.gd").new()


func _can_handle(object: Object) -> bool:
	return true

func _parse_property(object: Object, type: Variant.Type, name: String, hint_type: PropertyHint, hint_string: String, usage_flags: int, wide: bool) -> bool:
	match type:
		TYPE_CALLABLE:
			add_property_editor(name, callable_property)
			return true
		
	return false
