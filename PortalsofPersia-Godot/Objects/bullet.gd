extends Node2D
@export var trailsize = 10

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Line2D.add_point(global_position)
	if $Line2D.points.size() > trailsize:
		$Line2D.remove_point(0)
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is TileMapLayer:
		get_tree().scene
	pass # Replace with function body.
