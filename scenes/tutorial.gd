# This script is attached to the tutorial scene. It handles the tutorial animations and transitions between them.
# - The _ready() function starts the first tutorial animation when the node enters the scene tree.
# - The _process(delta) function is called every frame but currently does nothing.
# - The _on_animation_player_animation_finished(anim_name) function transitions to the next tutorial animation when the current one finishes.
# - The _on_button_pressed() function returns to the main menu when a button is pressed.
extends Control
@onready var animation_player: AnimationPlayer = $AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation_player.play("tutorial1")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	print(anim_name)
	if (anim_name == "tutorial1"):
		animation_player.play("tutorial2")
	elif (anim_name == "tutorial2"):
		animation_player.play("tutorial3")
	elif (anim_name == "tutorial3"):
		animation_player.play("tutorial4")
	elif(anim_name == "tutorial4"):
		animation_player.play("tutorial5")
	elif(anim_name == "tutorial5"):
		animation_player.play("tutorial1")


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
