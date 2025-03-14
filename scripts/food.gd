# This script is attached to food objects. It handles their movement, collision detection with Bubu, and removal.
# - The _ready() function sets the process to true to ensure movement updates.
# - The _process(delta) function moves the food downward and removes it if it goes off-screen.
# - The _on_body_entered(body) function handles collision with Bubu, increasing Bubu's score and removing the food.

extends Area2D  # Ensure this matches your scene type

@export var speed = 100  # Speed of bad food movement

func _ready():
	set_process(true)  # Ensure movement updates

func _process(delta):
	position.y += speed * delta  # Moves downward
# Move left instead of down
  # Move downward

	# Remove if off-screen (assuming 600 is the bottom)
	if position.y > 600:
		queue_free()

func _on_body_entered(body):
	if body.name == "Bubu":
		Globals.good_food_number += 1
		body.increase_score(1)
		queue_free()  # Remove bad food when touching Bubu
