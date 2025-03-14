# This script is attached to Dudu, a helper character. It handles Dudu's appearance, cutting action, and interaction with bad food.
# - The _process(delta) function checks for the cut action and triggers Dudu's cutting animation and logic.
# - The appear_next_to_bubu() function positions Dudu next to Bubu.
# - The cut_animation() function plays the cut animation.
# - The _on_area_2d_body_entered(body) and _on_area_2d_area_entered(area) functions handle collision with bad food, triggering its destruction.
# - The _on_timer_timeout() function re-enables cutting and increments the cut count.

extends Node2D

@export var cut_duration = 0.5  # How long Dudu appears
@onready var dudu_animation: AnimationPlayer = $DuduAnimation
@onready var dudu_position: Marker2D = $"../Bubu/DuduPosition"
@onready var dudu_original_position: Marker2D = $"../dudu_original_position"

var cutting = false
var disable_cutting = false
@export var cut_count = 4
@onready var cut_bar: ProgressBar = $"../CutBar"

#func _input(event):
	#if (disable_cutting):
		#print("cant cut")
		#return
	#if event.is_action_released("cut"):
		#cutting = true
		#appear_next_to_bubu()
		#cut_animation()
		#cut_count -= 1
		#var temp_count = cut_count
		#cut_count = min(0, temp_count)
		#cut_bar.value = cut_count
		#if(cut_count <= 0):
			#disable_cutting = true


func _process(delta):
	if(Input.is_action_just_released("cut")):
		if (disable_cutting):
			print("cant cut")
			return
		else:
			print("this ran")
			cutting = true
			appear_next_to_bubu()
			cut_animation()
			cut_count -= 1
			var temp_count = cut_count
			#cut_count = min(0, temp_count)
			cut_bar.value = cut_count
			if(cut_count <= 0):
				disable_cutting = true

func appear_next_to_bubu():
	global_position = dudu_position.global_position
	#var bubu = get_parent().get_node("Bubu")
	#if bubu:
		#$Sprite2D.scale = Vector2(1, 1)  # Ensure correct size
		#$Sprite2D.position = bubu.position + Vector2(50, 0)  # Appear next to Bubu
		#$Sprite2D.visible = true  # Show Dudu

func cut_animation():
	dudu_animation.play("cut")


func _on_area_2d_body_entered(body: Node2D) -> void:
	print("dudu found ", body.name)
	if (body.is_in_group("bad_food")):
		print("bad food found")



func _on_area_2d_area_entered(area: Area2D) -> void:
	print("dudu found an area ", area.name)
	if (area.is_in_group("bad_food")):
		print("bad food found")
		area.die()
		global_position = dudu_original_position.global_position


func _on_timer_timeout() -> void:
	disable_cutting = false
	var temp_count = cut_count + 1
	cut_count = min(temp_count, 4)
	cut_bar.value = cut_count
	print("adding count")
