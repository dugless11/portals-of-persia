extends Node2D
class_name AbstractPickup
@export var sprite: CompressedTexture2D
signal buttonChanged;
var isDown: bool = false;

func _ready() -> void:
	if(sprite):
		$AnimatedSprite2D.hide()
		$Sprite2D.texture = sprite;
	else:
		$Sprite2D.hide()
func _process(delta: float) -> void:
	if((Input.is_action_just_pressed("down") || Input.is_action_just_pressed("shoot")) && isDown):
		doThings()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if(isDown == true): return;
	if(body.is_in_group("world") || body.name != "Player"): return;
	
	print(body.name + " entered !")
	isDown = true;
	emit_signal("buttonChanged", isDown)
	$downArrow.show()

func _on_area_2d_body_exited(body: Node2D) -> void:
	if($Area2D.has_overlapping_bodies()): return;
	print(body.name + " left !")
	isDown = false;
	emit_signal("buttonChanged", isDown)
	$downArrow.hide()

func doThings() -> void:
	print("woaw !!")
