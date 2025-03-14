# This script is attached to the main menu node. It handles button interactions for starting the game and viewing the tutorial.
# - The _ready() function is called when the node enters the scene tree for the first time.
# - The _on_play_button_pressed() function changes the scene to the main game scene when the play button is pressed.
# - The _on_tutorial_button_pressed() function changes the scene to the tutorial scene when the tutorial button is pressed.
extends Control
@onready var play_button: Button = $Control/VBoxContainer/HBoxContainer/PlayButton
@onready var tutorial_button: Button = $Control/VBoxContainer/HBoxContainer/TutorialButton
@onready var tutorial: Control = $Control/Tutorial

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main.tscn")


func _on_tutorial_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/tutorial.tscn")
