# This script is attached to Bubu, the main character. It handles movement, health, score, and interactions with food and bad food.
# - The _ready() function initializes Bubu's health and sets up the health bar.
# - The _process(delta) function handles Bubu's movement based on player input.
# - The take_damage(amount) function decreases Bubu's health and plays the hurt animation.
# - The increase_health(amount) function increases Bubu's health and plays the heal animation.
# - The increase_score(amount) function increases Bubu's score.
# - The die() function handles Bubu's death and changes the scene to the game over screen.
extends CharacterBody2D

@export var speed = 350
@export var max_health = 100
var current_health = 100
@onready var health_bar = get_parent().get_node("CanvasLayer/HealthBar")
@onready var health_label: Label = $"../CanvasLayer/Label"
@onready var animation_player: AnimationPlayer = $"../AnimationPlayer"
@onready var color_rect: ColorRect = $"../ColorRect"
@onready var score_label: Label = $"../CanvasLayer/ScoreLabel"
@onready var sprite_2d: Sprite2D = $Sprite2D


func _ready():
	current_health = max_health  # Start full health
	health_bar.value = 100  # Set health bar to full
	print("Health bar value at start:", health_bar.value)
	print("Health bar node found:", health_bar)
	color_rect.color = Color(0,0,0,0)

func _process(delta):
	var direction_x = Input.get_axis("move_left", "move_right")
	var direction_y = Input.get_axis("move_up", "move_down")
	
	velocity.x = direction_x * speed
	velocity.y = direction_y * speed
	
	if direction_x < 0:
		sprite_2d.flip_h = true
	elif direction_x > 0:
		sprite_2d.flip_h = false
	
	move_and_slide()

func take_damage(amount):
	Globals.bad_food_number += 1
	animation_player.play("hurt")
	current_health -= amount
	current_health = max(current_health, 0)  # Prevent negative health
	health_bar.value = current_health
	health_label.text = str(current_health)
	if (current_health <= 0):
		die()
	
	
	#print("Bubu Health:", current_health, "Health Bar:", health_percent)
func increase_health(amount):
	Globals.good_food_number += 1
	animation_player.play("heal")
	current_health += amount
	current_health = min(100, current_health)
	health_bar.value = current_health

func increase_score(amount):
	Globals.good_food_number += 1
	Globals.score += 1
	score_label.text = "Score: " + str(Globals.score)

	if current_health <= 0:
		die()

func die():
	print("Game Over")
	get_tree().change_scene_to_file("res://scenes/game_over.tscn")
