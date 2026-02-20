extends AbstractCutscene

func _ready() -> void:
	moveObject($Camera2D/bar2, Transform2D($Camera2D/bar2.rotation_degrees, Vector2(-576.0, 324.0)), Transform2D($Camera2D/bar2.rotation_degrees, Vector2(-576.0, 324.0 - 100)), 0, 1, "lerp", $Camera2D.position, $Camera2D.position)
	moveObject($Camera2D/bar1, Transform2D($Camera2D/bar1.rotation_degrees, Vector2(-576.0, -481.0)), Transform2D($Camera2D/bar1.rotation_degrees, Vector2(-576.0, -481.0 + 100)), 0, 1, "lerp", $Camera2D.position, $Camera2D.position)
	moveObject($Camera2D, $Camera2D.transform, Transform2D($Camera2D.rotation_degrees, Vector2(315.0, 324 + 100.0)), 2, 3, "lerp", $Camera2D.position, $Camera2D.position)
	moveObject($Camera2D, $Camera2D.transform, Transform2D($Camera2D.rotation_degrees, Vector2(315.0, 324 + 100.0)), 3, 4, "shake", Vector2(315.0, 324 + 100.0), $Camera2D.position)
	moveObject($TileMapLayer, $TileMapLayer.transform, Transform2D($TileMapLayer.rotation_degrees, Vector2(576, 324 + 100.0)), 4, 5, "hide", Vector2(576, 324 + 100.0), $TileMapLayer.position)
	#moveObject($Icon, $Icon.transform, Transform2D($TileMapLayer.rotation_degrees + 300, Vector2($Icon.position.x, $Icon.position.y - 100)), 4, 5, "lerp", Vector2(576, 324 + 100.0), $TileMapLayer.position)
	#moveObject($Icon, $Icon.transform, Transform2D($TileMapLayer.rotation_degrees + 660, Vector2($Icon.position.x, $Icon.position.y + 200)), 5, 7, "lerp", Vector2(576, 324 + 100.0), $TileMapLayer.position)
	moveObject($Camera2D/bar2, Transform2D($Camera2D/bar2.rotation_degrees, Vector2(-576.0, 324.0 - 100)), Transform2D($Camera2D/bar2.rotation_degrees, Vector2(-576.0, 324.0)), 7, 8, "lerp", $Camera2D.position, $Camera2D.position)
	moveObject($Camera2D/bar1, Transform2D($Camera2D/bar1.rotation_degrees, Vector2(-576.0, -481.0 + 100)), Transform2D($Camera2D/bar1.rotation_degrees, Vector2(-576.0, -481.0)), 7, 8, "lerp", $Camera2D.position, $Camera2D.position)

	cutsceneStart()

func _process(delta: float) -> void:
	cutsceneProcess(delta)
	if(cutsceneTimer >= 4):
		$Icon.rotation = (3 * (cutsceneTimer*cutsceneTimer - 3)/7)
		if(cutsceneTimer < 6):
			$Icon.position = lerp($Icon.position, Vector2($Icon.position.x, $Icon.position.y - 50), 0.09)
		else:
			$Icon.position = lerp($Icon.position, Vector2($Icon.position.x, $Icon.position.y + 200), 0.09)
		
		if(cutsceneTimer > 6.5):
			$Camera2D.position = $Icon.position
	if(cutsceneTimer >= 8):
		print("going to level 1!!")
		get_tree().change_scene_to_file("res://Scenes/level1.tscn")
