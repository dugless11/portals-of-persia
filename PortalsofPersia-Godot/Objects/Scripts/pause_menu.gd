extends Control

var paused = false;

func _process(delta):
	if Input.is_action_just_pressed("pause"):
		pauseMenu()
		
func pauseMenu():
	if(paused):
		get_child(0).hide()
		Engine.time_scale = 1;
	else:
		get_child(0).show()
		Engine.time_scale = 0;
		
	paused = !paused

func _on_menu_pressed() -> void:
	Engine.time_scale = 1;
	for i in get_tree().get_nodes_in_group("Portal") :
		i.queue_free()
	get_tree().change_scene_to_file("res://Scenes/main.tscn")


func _on_resume_pressed() -> void:
	pauseMenu()
