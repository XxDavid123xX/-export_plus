@tool
extends EditorProperty

var value : Callable
var button : Button
var selected_node : Node

signal node_selected
signal method_selected

func _init() -> void:
	button = Button.new()
	add_child(button)
	add_focusable(button)
	button.pressed.connect(_on_button_pressed)

func set_value(method_name : String):
	value = Callable(selected_node, method_name)
	method_selected.emit()

func set_selected_node(path : NodePath):
	print(path)
	if path.is_empty():
		return
	selected_node = get_tree().edited_scene_root.get_node(path)
	node_selected.emit()

func _on_button_pressed():
	EditorInterface.popup_node_selector(set_selected_node)
	await node_selected
	EditorInterface.popup_method_selector(selected_node, set_value, value.get_method())
	await method_selected
	update_property()
	emit_changed(get_edited_property(), value)

func _update_property() -> void:
	button.icon = EditorInterface.get_editor_theme().get_icon("Callable","EditorIcons")
	button.text = value.get_method() if value else str(null)
