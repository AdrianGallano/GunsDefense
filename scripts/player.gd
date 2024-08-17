extends CharacterBody2D


const SPEED : float = 100.0
var direction_state : String = "down"
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	velocity = direction * SPEED
	
	if direction[1] > 0: # down
		animated_sprite_2d.play("run_down")
		direction_state = "down"
	elif direction[1] < 0: #up
		animated_sprite_2d.play("run_up")
		direction_state = "up"
	elif direction[0] < 0: #left
		animated_sprite_2d.play("run_left")
		direction_state = "left"
	elif direction[0] > 0: # right
		animated_sprite_2d.play("run_right")
		direction_state = "right"
	else:
		match direction_state:
			"up":
				animated_sprite_2d.play("idle_up")
			"down":
				animated_sprite_2d.play("idle_down")
			"left":
				animated_sprite_2d.play("idle_left")
			"right":
				animated_sprite_2d.play("idle_right")
	
	move_and_slide()
