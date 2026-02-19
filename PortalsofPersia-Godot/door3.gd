extends Node2D

@export var button: Node2D
@export var heightUp = 64
@export var crush_area: Area2D
 
var downPos
var upPos
var button1Down = false
var moving_down = false;

func _ready() -> void:
	button.connect("buttonChanged", Callable(self, "_on_button1_changed"))
	crush_area.connect("body_entered", Callable(self, "_on_crush_area_body_entered"))
	downPos = position
	upPos = Vector2(position.x, position.y - heightUp)
	upPos.y -= heightUp

func _on_button1_changed(is_down: bool) -> void:
	button1Down = is_down
	print("Button 1 is ", button1Down)
	
func _on_crush_area_body_entered(body: Node) -> void:
	if moving_down and body.scene_file_path == "res://Objects/Player.tscn":
		get_tree().reload_current_scene()

func _physics_process(delta: float) -> void:
	if button1Down:
		position = lerp(position, upPos, 0.01)
		moving_down = false
	else:
		position = lerp(position, downPos, 0.03)
		moving_down = true
