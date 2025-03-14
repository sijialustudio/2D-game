# This script is attached to bad food objects. It handles their movement, collision detection with Bubu, and destruction.
# - The _ready() function sets the process to true to ensure movement updates.
# - The _process(delta) function moves the bad food leftward and removes it if it goes off-screen.
# - The _on_body_entered(body) function handles collision with Bubu, causing damage and removing the bad food.
# - The die() function plays the die animation and increments the bad food counter.
# - The _on_animation_player_animation_finished(anim_name) function removes the bad food after the die animation finishes.
extends Area2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

@export var speed = 150  # Adjust speed as needed
var is_cut: bool = false
func _ready():
	set_process(true)  # Ensure movement updates

func _process(delta):
	if(is_cut):
		speed = 0
	position.x -= speed * delta  # Moves left toward Bubu

	# Remove if off-screen
	if position.x < -50:
		queue_free()

func _on_body_entered(body):
	if body.name == "Bubu":  # If Bubu touches
		print("Bad food hit Bubu!")  # Debug: see if it runs more than once
		body.take_damage(5)  # Damage Bubu by 5
		queue_free()  # Remove this bad food after hit

func die():
	Globals.bad_food_number += 1
	animation_player.play("die")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	queue_free()
