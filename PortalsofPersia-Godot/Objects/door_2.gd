extends Node2D

@export var button: Node2D
@export var button2: Node2D
@export var heightUp = 512

var downPos
var upPos
var button1Down = false
var button2Down = false

func _ready() -> void:
	button.connect("buttonChanged", Callable(self, "_on_button1_changed"))
	button2.connect("buttonChanged", Callable(self, "_on_button2_changed"))
	downPos = position
	upPos = position
	upPos.y -= heightUp

func _on_button1_changed(is_down: bool) -> void:
	button1Down = is_down
	print("Button 1 is ", button1Down)

func _on_button2_changed(is_down: bool) -> void:
	button2Down = is_down
	print("Button 2 is ", button2Down)

func _physics_process(delta: float) -> void:
	if button1Down and button2Down:
		position = lerp(position, upPos, 0.03)
	else:
		position = lerp(position, downPos, 0.03)
