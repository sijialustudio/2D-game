# This script defines global variables and functions for the game.
# - The score, good_food_number, and bad_food_number variables track the game's score and the number of good and bad foods encountered.
# - The reset_globals() function resets these variables to their initial values.


extends Node

var score = 0
var good_food_number = 0
var bad_food_number = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func reset_globals():
	score = 0
	good_food_number = 0
	bad_food_number = 0
