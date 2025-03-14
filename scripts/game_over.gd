# This script is attached to the game over screen node. It displays the final scores and handles button interactions for retrying or returning to the main menu.
# - The _ready() function updates the score labels with the final scores.
# - The _on_retry_pressed() function changes the scene to the main game scene when the retry button is pressed.
# - The _on_main_menu_pressed() function changes the scene to the main menu when the main menu button is pressed.
extends Control
@onready var retry: Button = $Group/VBoxContainer/HBoxContainer/Retry
@onready var main_menu: Button = $Group/VBoxContainer/HBoxContainer/MainMenu
@onready var game_over_label: Label = $Group/VBoxContainer/VBoxContainer/GameOverLabel
@onready var score_label: Label = $Group/VBoxContainer/VBoxContainer/ScoreLabel
@onready var bad_food_label: Label = $Group/VBoxContainer/VBoxContainer/BadFoodLabel
@onready var good_food_label: Label = $Group/VBoxContainer/VBoxContainer/GoodFoodLabel

func _ready() -> void:
	score_label.text = "Score: " + str(Globals.score)
	bad_food_label.text = "Bad Foods destroyed: " + str(Globals.bad_food_number)
	good_food_label.text = "Good Foods consumed: " + str(Globals.good_food_number)


func _process(delta: float) -> void:
	pass

func _on_retry_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main.tscn")
	pass


func _on_main_menu_pressed() -> void:
	# change scene to the main menu
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
