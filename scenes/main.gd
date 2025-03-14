# This script is attached to the main game node. It initializes global variables when the game starts and handles frame updates.
# - The _ready() function is called when the node enters the scene tree for the first time and resets global variables.
# - The _process(delta) function is called every frame but currently does nothing.

extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Globals.reset_globals()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
