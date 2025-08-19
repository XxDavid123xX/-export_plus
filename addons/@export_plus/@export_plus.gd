@tool
extends EditorPlugin

const MAIN_INSPECTOR = preload("res://addons/@export_plus/scripts/main_inspector.gd")
var main_inspector_instance = MAIN_INSPECTOR.new()

func _enable_plugin() -> void:
	# Add autoloads here.
	pass


func _disable_plugin() -> void:
	# Remove autoloads here.
	pass


func _enter_tree() -> void:
	add_inspector_plugin(main_inspector_instance)

func _exit_tree() -> void:
	remove_inspector_plugin(main_inspector_instance)
