# This script is attached to the food spawner node. It handles the random spawning of good and bad food objects.
# - The _ready() function sets the spawn timer and connects its timeout signal to the spawn_food() function.
# - The spawn_food() function randomly selects and spawns either a good food or a bad food at a random position.
extends Node2D

@export var good_food_scenes: Array[PackedScene]  # Add multiple good foods
@export var bad_food_scene: PackedScene  # Bad food comes from right
@export var spawn_rate: float = 1.5  # Adjust spawn timing

func _ready():
	$SpawnTimer.wait_time = spawn_rate
	$SpawnTimer.timeout.connect(spawn_food)

func spawn_food():
	var food_type = randi() % 2  # 0 = good food, 1 = bad food
	var food = null

	print("Food type chosen:", food_type)

	# Spawn Good Food
	if food_type == 0 and good_food_scenes.size() > 0:
		var selected_scene = good_food_scenes.pick_random()
		print("Good food selected:", selected_scene)  # Debug print
		if selected_scene:
			food = selected_scene.instantiate()
			food.position = Vector2(randi_range(50, 750), 10)  # Spawn from sky

	# Spawn Bad Food
	elif food_type == 1 and bad_food_scene != null:
		print("Bad food spawned")  # Debug print
		food = bad_food_scene.instantiate()
		food.position = Vector2(850, randi_range(100, 500))  # From the right
		food.speed = randi_range(90, 400)

	# Make sure food is actually added to the scene
	if food != null:
		print("Adding food to scene:", food)
		get_parent().add_child(food)
	else:
		print("Food is null, not added")
