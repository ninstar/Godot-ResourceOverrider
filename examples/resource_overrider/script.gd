extends MarginContainer


@onready var suffix: LineEdit = %Suffix
@onready var files: ItemList = %Files
@onready var texture_rect: TextureRect = %TextureRect
@onready var resource_overrider: ResourceOverrider = %ResourceOverrider


func _on_suffix_text_changed(new_text: String) -> void:
	resource_overrider.current_suffix = new_text
	for i: int in files.item_count:
		var file_suffix: String = files.get_item_text(i).get_basename().get_extension()
		if file_suffix == new_text:
			files.select(i)


func _on_files_item_activated(index: int) -> void:
	var suffix_string: String = files.get_item_text(index).get_basename().get_extension()
	suffix.text = suffix_string
	resource_overrider.current_suffix = suffix_string


func _on_override_applied() -> void:
	if is_node_ready():
		print("Override applied: " + resource_overrider.current_suffix)
