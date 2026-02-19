extends Node2D
class_name AbstractCutscene

var cutsceneTimer = 0;
var cutsceneMovingObjects: Array[Node2D];
var cutsceneMovingStartingTransform: Array[Transform2D];
var cutsceneMovingEndingTransform: Array[Transform2D];
var cutsceneMovingMoveType: Array[String];
var cutsceneMovingStartTime: Array[float];
var cutsceneMovingEndTime: Array[float];
var cutsceneMovingStartingPos: Array[Vector2];
var cutsceneMovingEndingPos: Array[Vector2];

func cutsceneProcess(delta: float) -> void:
	cutsceneTimer += delta;
	
	for i in range(cutsceneMovingObjects.size()):
		if(cutsceneMovingStartTime[i] <= cutsceneTimer && cutsceneMovingEndTime[i] >= cutsceneTimer):
			match(cutsceneMovingMoveType[i]):
				"lerp":
					cutsceneMovingObjects[i].transform = lerp(cutsceneMovingObjects[i].transform, cutsceneMovingEndingTransform[i], 0.09 * 60 * delta)
				"shake":
					cutsceneMovingObjects[i].position = Vector2(cutsceneMovingStartingPos[i].x + randfn(-5, 5), cutsceneMovingStartingPos[i].y + randfn(-5, 5))
				"hide":
					cutsceneMovingObjects[i].hide()

func Cinematic() -> void:
	print("zooming in .,.,")

func cutsceneStart() -> void:
	for i in range(cutsceneMovingObjects.size()):
		cutsceneMovingObjects[i].transform = cutsceneMovingStartingTransform[i]

func moveObject(object: Node2D, starting: Transform2D, ending: Transform2D, startTime: float, endTime: float, moveType: String, startPos: Vector2, endPos: Vector2):
	cutsceneMovingObjects.append(object)
	cutsceneMovingStartingTransform.append(starting)
	cutsceneMovingEndingTransform.append(ending)
	cutsceneMovingStartTime.append(startTime)
	cutsceneMovingEndTime.append(endTime)
	cutsceneMovingMoveType.append(moveType)
	cutsceneMovingStartingPos.append(startPos)
	cutsceneMovingEndingPos.append(endPos)
