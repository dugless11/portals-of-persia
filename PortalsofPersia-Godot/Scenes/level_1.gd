extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if(MuController.stream != preload("res://assets/mu_ManaTwoPart2_idle.mp3")):
		MuController.stop()
		MuController.stream = preload("res://assets/mu_ManaTwoPart2_idle.mp3")
		MuController.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	print(get_node("Player"))
#	print("asdasd")
	#if(get_node("Player")):
#		position = get_node("Player").position 
