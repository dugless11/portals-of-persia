extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	MuController.stream = preload("res://assets/mu_LateNightRadio_title.mp3")
	MuController.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_play_pressed() -> void:
	#print("press")
	get_tree().change_scene_to_file("res://Scenes/introCutscene.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()
