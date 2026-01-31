extends Node2D

@export var button: Node2D
@export var height_up: float = 256.0

var down_state: bool = true
var down_pos: Vector2
var up_pos: Vector2

func _ready() -> void:
	button.connect("buttonChanged", button_change)
	down_pos = position
	up_pos = position
	up_pos.y -= height_up

func button_change(is_down: bool) -> void:
	down_state = !is_down
	if is_down:
		print("button is down! opening door")
	else:
		print("button is up! closing door")

func _physics_process(delta: float) -> void:
	if down_state:
		position = position.lerp(down_pos, 0.03)
	else:
		position = position.lerp(up_pos, 0.03)
