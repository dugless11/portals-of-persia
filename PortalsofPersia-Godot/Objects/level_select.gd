extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_texture_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/introCutscene.tscn")
	pass # Replace with function body.


func _on_texture_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/intropt2.tscn")
	pass # Replace with function body.


func _on_texture_button_3_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/intropt3.tscn")
	pass # Replace with function body.


func _on_texture_button_4_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/firstlevel.tscn")
	pass # Replace with function body.


func _on_texture_button_5_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/level2.tscn")
	pass # Replace with function body.
